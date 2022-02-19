
include                 RANDOM.INC
include                 ..\..\INCLUDE\consts.inc
include                 ..\LDRWIN32\ldrwin32.inc
include                 ..\R0COPY\r0copy.inc

                        public  rnd
                        public  rnd_eax
                        public  rnd_byte
                        public  rnd_dword
                        public  rnd_zf
                        public  rnd_2
                        public  rnd_3
                        public  rnd_8

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

randseed                dd      ?

                        .code

randomize:              callW   gettime
                        add     randseed, eax
                        call    rnd_dword
                        add     randseed, eax
                        retn

random:                 mov     eax, randseed
                        imul    eax, 214013
                        add     eax, 2531011
                        mov     randseed, eax
                        retn

rnd:                    push    ecx
                        push    edx

                        call    random

                        mov     ecx, [esp+4]+8    ; range
                        cmp     ecx, 65536
                        jae     __div

__mul:                  shr     eax, 16
                        imul    eax, ecx
                        shr     eax, 16

__exit:                 pop     edx
                        pop     ecx

                        test    eax, eax
                        retn    4

__div:                  xor     edx, edx
                        div     ecx
                        mov     edx, eax

                        jmp     __exit

rnd_eax:                push    eax
                        call    rnd
                        retn

rnd_2:                  push    2
                        call    rnd
                        retn

rnd_zf:                 push    eax
                        call    rnd_2
                        pop     eax
                        retn

rnd_3:                  push    3
                        call    rnd
                        retn

rnd_8:                  push    8
                        call    rnd
                        retn

rnd_byte:               push    256
                        call    rnd
                        retn

rnd_dword:              push    eax
                        call    rnd_byte
                        mov     [esp+0], al
                        call    rnd_byte
                        mov     [esp+1], al
                        call    rnd_byte
                        mov     [esp+2], al
                        call    rnd_byte
                        mov     [esp+3], al
                        pop     eax
                        test    eax, eax
                        retn

entry:                  call    randomize
                        retn

                        end     entry

