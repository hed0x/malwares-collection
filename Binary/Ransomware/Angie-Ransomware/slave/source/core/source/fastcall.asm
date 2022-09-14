[BITS 32]

section .text

global _KiFastSystemCall@0
global _KiJumpLongMode@8

_KiFastSystemCall@0:
	mov edx, esp
	sysenter
	ret

_KiJumpLongMode@8:
	jmp 0x33:.L1
[BITS 64]
.L1:
	xchg rsp, r14
	mov  r8d, dword [r14]
	add  r14, 4
	mov  dword [0x3C + r13], r8d
	mov  dword [0x48 + r13], r14d
	lea  r11, [r14 + 4]
	mov  dword [0x20 + r13], edi
	mov  dword [0x24 + r13], esi
	mov  dword [0x28 + r13], ebx
	mov  dword [0x38 + r13], ebp
	pushfq
	pop  r8
	mov  dword [0x44 + r13], r8d

	; mode rdi [r14 + 0x08]
	call qword [r14]

	mov  r14, rsp
	mov  dword [0x04 + rsp], 0x23
	mov  r8d, 0x2B
	mov  ss, r8w
	mov  r9d, dword [0x3C + r13]
	mov  dword [rsp], r9d
	mov  esp, dword [0x48 + r13]
	;jmp  fword [r14]
	db 0x41
	db 0xFF
	db 0x2E
