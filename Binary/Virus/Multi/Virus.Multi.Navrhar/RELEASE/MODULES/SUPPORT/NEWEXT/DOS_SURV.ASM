
ifndef PASS2
include globals.1
else
include globals.2
endif

indep_mod        segment public byte USE32 'CODE'

                 dd   'IMOD'  ; independent module signature

include interf.inc

init_newext:                            ; init interface variables
                cmp  initialize, 0
                je   cont
                ret
cont:

                mov     eax, 256
                mod_call md_alloc
                mov     name_buffer, eax

                mov     host_type, HOST_DOSEXE
                mov     servtab, ebx
                xgetptr xRing0_FileIO
                mov     Ring0_FileIO, eax

                mov      bl, 21h
                lea      edx, new21
                VxVCall  xIntAlloc

                VxVCall  xInit_FileIO
                mod_call md_startup
                VxVCall  xDone_FileIO

                mov      ss:[esp+4], 'OPEN'     ; force to be opened
                ret



; eax - intno
; ebx - stack top
;
; data in stack:
;    +0    EDI
;    +4    ESI
;    +8    EBP
;    +C    ESP
;    +10   EBX
;    +14   EDX
;    +18   ECX
;    +1C   EAX
;
;    +20   GS
;    +22   FS
;    +24   ES
;    +26   DS

new21:
                ; get eax
                mov      eax, fs:[ebx+1ch]
                cmp      ah, 3dh
                jne      noopen

                ; get ds:dx
                movzx    eax, word ptr fs:[ebx+26h]
                shl      eax, 4
                add      ax, word ptr fs:[ebx+14h]
                jnc      short COK
                add      eax, 10000h
COK:
                mov      esi, eax
                mov      edi, name_buffer
                cld
                push ds
                pop  es
nextchar:
                lods     byte ptr fs:[esi]
                stosb
                or       al, al
                jnz      nextchar

                VxVCall  xInit_FileIO

                mod_call md_strategy
                VxVCall  xDone_FileIO

noopen:         VxVJmp   Exit_Int


servtab         dd ?
name_buffer     dd ?

                ret

indep_mod       ends

                end
