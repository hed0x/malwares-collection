
; LDE32 example file
;
; disassemble kernel32 memory and dump it in hex form to console
;

callW                   macro   x
                        extrn   x:PROC
                        call    x
                        endm

                        p386
                        model   flat

                        locals  @@

                        .data

ofs                     dd      0BFF72000h      ; to be changed on NT

tbl                     db      2048 dup (?)    ; 2k for disasm internal table

                        .code

start:
                        push    offset tbl      ; build disasm flag tables
                        call    disasm_init

@@cycle1:               mov     eax, ofs        ; write hex offset
                        call    dump_hexdword
                        call    dump_space      ; write space

                        push    ofs
                        push    offset tbl
                        call    disasm_main     ; disasm opcode

                        mov     edx, eax        ; save length
                        mov     ecx, eax
                        and     ecx, 15         ; dump 15 bytes if -1
@@cycle2:               call    dump_space      ; write space
                        mov     eax, ofs        ; write hex byte
                        inc     ofs
                        mov     al, [eax]
                        call    dump_hexbyte
                        loop    @@cycle2        ; write hex bytes
                        call    dump_crlf       ; 0D 0A

                        cmp     edx, -1         ; unknown opcode found?
                        jne     @@cycle1

                        push    -1              ; exit to md
                        callW   ExitProcess

include                 console.inc             ; some subroutines

include                 ..\..\lde32\lde32bin.inc   ; LDE32
disasm_end:

                        db      13,10
                        db      '----------------------------------',13,10
                        db      'LDE32 size: '
                        db      (disasm_main-disasm_init)/1000 mod 10+'0'
                        db      (disasm_main-disasm_init)/100 mod 10+'0'
                        db      (disasm_main-disasm_init)/ 10 mod 10+'0'
                        db      (disasm_main-disasm_init)/  1 mod 10+'0'
                        db      '+'
                        db      (disasm_end-disasm_main)/1000 mod 10+'0'
                        db      (disasm_end-disasm_main)/100 mod 10+'0'
                        db      (disasm_end-disasm_main)/ 10 mod 10+'0'
                        db      (disasm_end-disasm_main)/  1 mod 10+'0'
                        db      '='
                        db      (disasm_end-disasm_init)/1000 mod 10+'0'
                        db      (disasm_end-disasm_init)/100 mod 10+'0'
                        db      (disasm_end-disasm_init)/ 10 mod 10+'0'
                        db      (disasm_end-disasm_init)/  1 mod 10+'0'
                        db      ' byte(s)',13,10
                        db      '----------------------------------',13,10
                        db      13,10

                        end     start
