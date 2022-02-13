
MIN_SIGN_COUNT          equ     2   ; at least TWO different keys required

MAXKEY                  equ     4096

include                 ADDPGN.INC
include                 ..\..\INCLUDE\consts.inc
include                 ..\..\INCLUDE\PGN2\pgn2.inc
include                 ..\LDRWIN32\ldrwin32.inc
include                 ..\RSA\rsa.inc

                        extrn   Event:PROC

                        public  addpgn_attach

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

key_info:
key_hash                dd      ?
key_ptr                 dd      ?

hashptr                 dd      ?
hashsize                dd      ?
dataptr                 dd      ?
datasize                dd      ?
sign_count              dd      ?

k0_start:

hash                    db      MAXKEY/8 dup (?)
rsa_x                   db      MAXKEY/8 dup (?)
rsa_e                   db      MAXKEY/8 dup (?)
rsa_n                   db      MAXKEY/8 dup (?)
rsa_t1                  db      MAXKEY/8 dup (?)
rsa_t2                  db      MAXKEY/8*2 dup (?)

k0_size                 equ     $-k0_start

                        .code

addpgn_attach:          xor     eax, eax   ; return code = # of PGNs added
                        pusha
                        cld

                        mov     ebp, [esp+32+4] ; buf_ptr

__cycle:                mov     edi, [esp+32+4] ; buf_ptr
                        add     edi, [esp+32+8] ; +buf_size
                        lea     eax, [edi-MIN_PLUGIN_SIZE]
                        cmp     ebp, eax        ; =buf_end
                        jae     __endcycle

                        cmp     dword ptr [ebp], '2NGP'
                        jne     __cont

                        mov     sign_count, 0

__re:                   mov     eax, [ebp+4]    ; hash
                        mov     key_hash, eax

                        ; search for key
                        push    offset key_info
                        push    EV_ADDPGN_GETKEY
                        call    Event
                        add     esp, 8

                        or      eax, eax
                        jz      __cont  ; key not found

                        ; init vars & etc
                        mov     ebx, key_ptr
                        mov     eax, [ebx+4]    ; keylen
                        shr     eax, 3
                        mov     hashsize, eax
                        lea     edx, [ebp+4+4]
                        mov     hashptr, edx
                        lea     edx, [edx+4+eax]
                        mov     dataptr, edx
                        mov     eax, [edx-4]         ; ecx=data len
                        mov     datasize, eax
                        cmp     eax, MIN_PLUGIN_SIZE ; limit min data size
                        jb      __cont
                        add     eax, edx
                        cmp     eax, edi ; edi=buf_end, check if out of range
                        ja      __cont

                        ; zerofill vars
                        lea     edi, k0_start
                        mov     ecx, k0_size
                        xor     eax, eax
                        rep     stosb

                        ; key.modulus
                        mov     ecx, [ebx+8]       ; m.len
                        lea     esi, [ebx+12]      ; m.data
                        lea     edi, rsa_n
                        rep     movsb

                        ; key.exponent
                        lodsd                      ; e.len
                        xchg    ecx, eax
                        lea     edi, rsa_e
                        rep     movsb              ; e.data

                        push    hashsize                ; hashsize
                        push    offset hash             ; hashbuf
                        mov     eax, datasize
                        add     eax, 4
                        push    eax                     ; isize
                        mov     eax, dataptr
                        sub     eax, 4
                        push    eax                     ; ibuf
                        callW   hash_z1
                        add     esp, 4*4

                        mov     eax, [ebx+4]            ; hashlen
                        dec     eax
                        lea     edx, hash
                        btr     [edx], eax              ; clear highest bit

                        push    offset rsa_t2           ; temp
                        push    offset rsa_t1           ; temp
                        push    offset rsa_n            ; modulus
                        push    offset rsa_e            ; exp
                        push    hashptr                 ; in
                        push    offset rsa_x            ; out
                        push    dword ptr [ebx+4]       ; length, bits
                        callW   modexp
                        add     esp, 7*4

                        lea     esi, rsa_x
                        lea     edi, hash
                        mov     ecx, hashsize   ; keylen
                        rep     cmpsb
                        jne     __cont

                        inc     sign_count

                        ; multiple sign ?
                        mov     eax, dataptr
                        cmp     dword ptr [eax], '2NGP'
                        jne     __ok
                        xchg    ebp, eax
                        jmp     __re
__ok:
                        add     ebp, 4+4+4-1    ; hdrs, -1 'coz following INC
                        add     ebp, hashsize   ; hash
                        add     ebp, datasize   ; data

                        cmp     sign_count, MIN_SIGN_COUNT
                        jb      __cont

                        push    datasize
                        push    dataptr
                        callW   ldrwin32_attach
                        add     esp, 8

                        ; it was a bug: [esp+32]
                        add     [esp].popa_eax, eax ; inc # of loaded pgns

__cont:                 inc     ebp
                        jmp     __cycle

__endcycle:             popa
                        retn

                        end
