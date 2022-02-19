
; CodeSnippet example for INFELF tool -- dump registers to stdout (Linux+FreeBSD)
; to compile: nasm -f bin -o snippet.bin snippet.s -DSNIPPET

                BITS    32

;%include       "syscall_freebsd.i"
;%include       "syscall_linux.i"

%ifdef SNIPPET
; INFELF sign: to be replaced with original bytes, padd with NOP's
                db      '$ORIGINAL_BYTES$'
%else
%include        "elf_header.i"
%endif

_start:
                pushf
                pusha

                call    out_regs

                mov     ecx, 4
                lea     esi, [esp+32+4]           ; stack: <addr> <value>
                cld

.cycle:         mov     eax, esi
                call    out_hexdword
                call    out_space
                lodsd
                call    out_hexdword
                call    out_cr

                dec     ecx
                jnz     .cycle

                popa
                popf

%ifdef SNIPPET
                ; INFELF sign: to be replace with jmp hook_offset + 5
                mov     esp, 0aa55aa55h
%else
                mov     eax, 1      ; exit(), # equal in linux/freebsd
                call    syscall_linux2bsd
%endif

out_regs:       pusha

                mov     ebx, 'EAX='
                mov     ecx, [esp+7*4]
                call    out_reg

                mov     ebx, 'EBX='
                mov     ecx, [esp+4*4]
                call    out_reg

                mov     ebx, 'ECX='
                mov     ecx, [esp+6*4]
                call    out_reg

                mov     ebx, 'EDX='
                mov     ecx, [esp+5*4]
                call    out_reg

                mov     ebx, 'ESP='
                mov     ecx, [esp+3*4]
                call    out_reg

                mov     ebx, 'EBP='
                mov     ecx, [esp+2*4]
                call    out_reg

                mov     ebx, 'ESI='
                mov     ecx, [esp+1*4]
                call    out_reg

                mov     ebx, 'EDI='
                mov     ecx, [esp+0*4]
                call    out_reg

                popa
                retn

out_reg:        pusha
                mov     eax, ebx
                call    out_4char
                mov     eax, ecx
                call    out_hexdword
                call    out_cr
                popa
                retn

out_hexdword:   pusha
                mov     ecx, 8
.cycle:         rol     eax, 4
                push    eax
                and     al, 15
                daa
                add     al, -10h
                adc     al, '0'+10h
                call    out_char
                pop     eax
                dec     ecx
                jnz     .cycle
                popa
                retn

out_cr:         pusha
                mov     al, 10
                jmp     out_char_wo_pusha
out_space:      pusha
                mov     al, 32
                jmp     out_char_wo_pusha
out_4char:      pusha
                mov     edx, 4
                jmp     out_nchar
out_char:       pusha
out_char_wo_pusha:
                mov     edx, 1      ; length
out_nchar:      push    eax
                mov     ecx, esp    ; data
                mov     ebx, 1      ; handle = stdout
                mov     eax, 4      ; write()    ; # equal in linux/freebsd
                call    syscall_linux2bsd
                pop     ecx         ; clear dword from stack
                popa
                retn

syscall_linux2bsd:
                push    ebp
                push    edi
                push    esi
                push    edx
                push    ecx
                push    ebx
                call    do_int80
                add     esp, 6*4
                retn

do_int80:       int     80h
                retn

%ifndef SNIPPET
physsize        equ     $ - $$
virtsize        equ     $ - origin
%endif
