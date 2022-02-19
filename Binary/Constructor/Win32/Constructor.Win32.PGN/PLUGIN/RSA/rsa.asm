
FAST                    equ     YES     ; used if defined

include                 RSA.INC
include                 ..\..\INCLUDE\consts.inc

                        public  public_modexp
                        public  hash_z1

                        p386
                        model   flat
                        locals  @@
                        jumps

                        .data

                        dd      ?

                        .code

include                 ..\..\INCLUDE\RSA\ASM\hash_z1.inc

public_modexp:

IFDEF   FAST
                        mov     eax, [esp+4]    ; len
                        cmp     eax, 128
                        je      __rsa128
                        cmp     eax, 256
                        je      __rsa256
                        cmp     eax, 512
                        je      __rsa512
                        cmp     eax, 1024
                        je      __rsa1024

                        jmp     modexp

__rsa128:               call    pushit
                        call    rsa_modexp_128
                        jmp     __rsa_xxx

__rsa256:               call    pushit
                        call    rsa_modexp_256
                        jmp     __rsa_xxx

__rsa512:               call    pushit
                        call    rsa_modexp_512
                        jmp     __rsa_xxx

__rsa1024:              call    pushit
                        call    rsa_modexp_1024

__rsa_xxx:              add     esp, 7*4
                        retn

pushit:                 pop     ecx

                        mov     eax, [esp+16]     ; e
                        mov     edx, [esp+4]      ; keylen
                        dec     edx
__bs1:                  bt      [eax], edx
                        jc      __bs2
                        dec     edx
                        jnz     __bs1
__bs2:                  inc     edx

                        push    dword ptr [esp+28]        ; temp2
                        push    dword ptr [esp+24]+4      ; temp1
                        push    dword ptr [esp+20]+8      ; n
                        push    dword ptr [esp+16]+12     ; e
                        push    dword ptr [esp+12]+16     ; input
                        push    dword ptr [esp+8] +20     ; output
                        push    edx                       ; e_len

                        jmp     ecx

include                 ..\..\INCLUDE\RSA\ASM\rsalib3.inc

                        gen_modexp      128             ; see RSALIB3.INC
                        gen_modexp      256
                        gen_modexp      512
                        gen_modexp      1024

ENDIF ; FAST

include                 ..\..\INCLUDE\RSA\ASM\rsalib1.inc  ; var-len, slow

                        end
