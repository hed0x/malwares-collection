
; RSA MULTI-ENCRYPTOR/DECRYPTOR

MAXKEY                  equ     4096

include                 ..\..\..\..\include\consts.inc

callW                   macro   _xxx
                        extrn   _xxx:proc
                        call    _xxx
                        endm

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

randseed                dd      12345678h

seckey                  db      'KEY\DPGN\secret.rsa',0
pubkey                  db      'KEY\DPGN\public.rsa',0

file1                   db      'file1',0
file2                   db      'file2',0
file3                   db      'file3',0

                        align   4

k1:
keylen                  dd      ?
keyhash                 dd      ?
rsa_n                   dd      MAXKEY/32 dup (?)
rsa_e                   dd      MAXKEY/32 dup (?)
rsa_x                   dd      MAXKEY/32 dup (?)
rsa_y                   dd      MAXKEY/32 dup (?)
k1_size                 equ     $-k1
rsa_t1                  dd      MAXKEY/32 dup (?)
rsa_t2                  dd      MAXKEY/32*2 dup (?)

n_iter                  dd      ?
rsa_e_len               dd      ?
t1                      dd      ?
nbit                    dd      ?
nbit1                   dd      ?
hash                    dd      ?

argc                    dd      ?
argv0                   db      256 dup (?)
argv1                   db      256 dup (?)
argv2                   db      256 dup (?)
argv3                   db      256 dup (?)
argv4                   db      256 dup (?)

                        .code
start:
                        call    randomize

                        call    dump_msg
                        db      'DPGNHASH -- "DELAYED PLUGIN" HASH MAKER -- (x) 2000-2001',13,10,0

                        call    getcmdline

                        cmp     argc, 2
                        jb      help

                        mov     eax, dword ptr argv1
                        cmp     al, '/'
                        je      __x2
                        cmp     al, '-'
                        jne     __x1
__x2:                   shr     eax, 8
__x1:                   or      al, 20h

                        cmp     argc, 2
                        jne     __x3
                        cmp     eax, 'r'
                        je      create
__x3:
                        cmp     argc, 3
                        jne     __x4

                        call    process_n

                        cmp     eax, 'e'
                        je      encrypt
                        cmp     eax, 'd'
                        je      decrypt
__x4:
                        jmp     help

quit:                   push    -1
                        callW   ExitProcess

process_n:              pusha
                        lea     esi, argv2
                        cmp     word ptr [esi], '*'
                        jne     __x3
                        mov     n_iter, -1
                        jmp     __x4
__x3:                   call    str2num
                        jc      help
                        or      eax, eax
                        jz      help
                        mov     n_iter, eax
__x4:                   popa
                        retn

; input:  ESI=asciiz
; output: CF=0 -- EAX=number
;         CF=1 -- error

str2num:                pusha
                        cld
                        xor     ecx, ecx        ; sum
                        mov     edx, 1          ; 10^#pos
                        mov     ebx, 10         ; base
__cycle:                xor     eax, eax
                        lodsb
                        or      eax, eax
                        jz      __endcycle
                        sub     al, '0'         ; char -> num
                        cmp     eax, ebx
                        jae     __err
                        mov     edi, eax
                        mov     eax, ecx
                        mul     ebx
                        or      edx, edx
                        jnz     __err
                        mov     ecx, eax
                        add     ecx, edi
                        jc      __err
                        jmp     __cycle
__endcycle:             mov     [esp+7*4], ecx
                        clc
                        popa
                        retn
__err:                  stc
                        popa
                        retn

help:                   call    dump_msg
                        db      13,10
                        db      'syntax:',13,10
                        db      '  DPGN r               -- create random file1',13,10
                        db      '  DPGN e <N>           -- encrypt file1 into file2, N times',13,10
                        db      '  DPGN d <N>           -- decrypt file2 into file3, N times',13,10
                        db      '  DPGN d *             -- decrypt file2 into file3, until crc found',13,10
                        db      0
                        jmp     quit

create:
                        lea     edx, pubkey
                        call    loadkey
;;
                        lea     edx, file1
                        call    fopen_ro
                        jc      __skipread
                        xchg    ebx, eax

                        call    dump_msg
                        db      'þ reading ',0
                        lea     edx, file1
                        call    dump_asciiz_edx
                        call    dump_crlf

                        lea     edx, rsa_x
                        mov     ecx, keylen
                        shr     ecx, 3
                        call    fread
                        call    fclose
__skipread:
;;
                        call    dump_msg
                        db      'þ randomizing',13,10,0
;;
                        push    1000
                        call    rnd
                        pop     ecx
                        lea     ebx, [eax+1000]
__xor2:                 mov     ecx, keylen
                        shr     ecx, 3
__xor1:                 push    256
                        call    rnd
                        add     esp, 4
                        add     byte ptr rsa_x[ecx-1], al
                        loop    __xor1
                        dec     ebx
                        jnz     __xor2

                        ; lastbyte = 0
                        mov     ecx, keylen
                        shr     ecx, 3
                        mov     byte ptr rsa_x[ecx-1], 0
;;
                        call    dump_msg
                        db      'þ writing ',0
                        lea     edx, file1
                        call    dump_asciiz_edx
                        call    dump_crlf
;;
                        lea     edx, file1
                        call    fcreate
                        xchg    ebx, eax
                        lea     edx, rsa_x
                        mov     ecx, keylen
                        shr     ecx, 3
                        call    fwrite
                        call    fclose
;;
                        call    dump_msg
                        db      'þ done',13,10,0

                        jmp     quit

encrypt:                call    dump_msg
                        db      'þ encryption',13,10,0

                        lea     edx, file1
                        call    fgetattr
                        jnc     __ok

                        call    dump_msg
                        db      '***ERROR***: you must create ''',0
                        lea     edx, file1
                        call    dump_asciiz_edx
                        call    dump_msg
                        db      ''' file first (A[] buffer), value < m',13,10,0
                        jmp     quit

__ok:                   lea     edx, pubkey
                        lea     esi, file1
                        lea     edi, file2
                        call    cryptor

                        call    dump_msg
                        db      'þ done',13,10,0

                        jmp     quit

decrypt:                call    dump_msg
                        db      'þ decryption',13,10,0

                        lea     edx, seckey
                        lea     esi, file2
                        lea     edi, file3
                        call    cryptor

                        call    dump_msg
                        db      'þ done',13,10,0

                        jmp     quit

; input: EDX=keyfile
;        ESI=infile
;        EDI=outfile
;        n_iter=# of iterations
; output:ECX=# of ticks used for math operartions

cryptor:                pusha

                        pusha
                        lea     edi, k1
                        mov     ecx, k1_size
                        xor     eax, eax
                        cld
                        rep     stosb
                        popa

                        call    loadkey

                        pusha

                        call    dump_msg
                        db      'iterations: ',0
                        mov     eax, n_iter
                        call    dump_dec
                        call    dump_crlf

                        call    dump_msg
                        db      'infile    : ',0
                        mov     edx, [esp].pusha_esi
                        call    dump_asciiz_edx
                        call    dump_crlf

                        call    dump_msg
                        db      'outfile   : ',0
                        mov     edx, edi
                        call    dump_asciiz_edx
                        call    dump_crlf

                        call    dump_msg
                        db      'keyfile   : ',0
                        mov     edx, [esp].pusha_edx
                        call    dump_asciiz_edx
                        call    dump_crlf

                        call    dump_msg
                        db      'keylen    : ',0
                        mov     eax, keylen
                        call    dump_dec
                        call    dump_msg
                        db      '-bit',13,10,0

;                       call    dump_msg
;                       db      'N         : ',0
;                       lea     esi, rsa_n
;                       mov     ecx, keylen
;                       call    dump_bignum
;                       call    dump_crlf

;                       call    dump_msg
;                       db      'E         : ',0
;                       lea     esi, rsa_e
;                       mov     ecx, keylen
;                       call    dump_bignum
;                       call    dump_crlf

                        lea     esi, rsa_e
                        xor     eax, eax
                        xor     ecx, ecx
__c:                    bt      [esi], ecx
                        jnc     __2
                        mov     edx, ecx
__2:                    adc     eax, 0
                        inc     ecx
                        cmp     ecx, keylen
                        jb      __c
                        call    dump_msg
                        db      'E.#bit1   : ',0
                        mov     nbit, eax
                        call    dump_dec
                        call    dump_crlf

                        call    dump_msg
                        db      'E.#bit    : ',0
                        lea     eax, [edx+1]
                        mov     nbit1, eax
                        call    dump_dec
                        call    dump_crlf

                        popa

                        mov     edx, esi
                        call    fopen_ro
                        jc      $
                        xchg    ebx, eax
                        lea     edx, rsa_x
                        mov     ecx, keylen
                        shr     ecx, 3
                        call    fread
                        lea     edx, hash
                        mov     ecx, 4
                        call    fread
                        call    fclose

                        call    calc_e_len

                        cmp     rsa_e_len, 32
                        ja      zz
                        ; encrypt
                        lea     esi, rsa_x
                        mov     ecx, keylen
                        call    calc_hash
                        mov     hash, eax
zz:
                        mov     [esp].popa_ecx, -1

                        callW   GetTickCount
                        mov     t1, eax

;;;;;;;;
                        xor     ebp, ebp
iter_cycle:

                        mov     eax, ebp
                        test    eax, 15
                        jnz     __1
                        call    dump_dec
                        call    dump_space
                        mov     al, 13
                        call    dump_al
__1:
                        cmp     rsa_e_len, 32
                        jb      z1
                        ; decrypt
                        lea     esi, rsa_x
                        mov     ecx, keylen
                        call    xorcrypt
z1:
                        call    crypto

                        lea     esi, rsa_y
                        lea     edi, rsa_x
                        mov     ecx, size rsa_x / 4
                        rep     movsd

                        inc     ebp

                        cmp     rsa_e_len, 32
                        jb      z3
                        ; decrypt
                        lea     esi, rsa_x
                        mov     ecx, keylen
                        call    calc_hash

                        cmp     eax, hash
                        je      hashfound
z3:
                        cmp     rsa_e_len, 32
                        ja      z2
                        ; encrypt

                        lea     esi, rsa_x
                        mov     ecx, keylen
                        call    xorcrypt

                        lea     esi, rsa_x
                        mov     ecx, keylen
                        call    calc_hash

                        cmp     eax, hash
                        je      hasherr
z2:
                        cmp     ebp, n_iter
                        jb      iter_cycle
enditer:
;;;;;;;

                        callW   GetTickCount
                        sub     eax, t1
                        cmp     [esp].popa_ecx, eax
                        jb      __ok
                        mov     [esp].popa_ecx, eax
__ok:

                        call    dump_msg
                        db      'time      : ',0
                        call    dump_dec
                        call    dump_msg
                        db      ' ms',13,10,0

                        call    dump_msg
                        db      'hash      : ',0
                        mov     eax, hash
                        call    dump_hexdword
                        call    dump_crlf

                        mov     edx, [esp].pusha_edi
                        call    fcreate
                        xchg    ebx, eax
                        lea     edx, rsa_x
                        mov     ecx, keylen
                        shr     ecx, 3
                        call    fwrite
                        cmp     rsa_e_len, 32
                        ja      z6
                        ; encrypt
                        lea     edx, hash
                        mov     ecx, 4
                        call    fwrite
z6:                     call    fclose

                        popa
                        retn

hashfound:              call    dump_msg
                        db      'decryption complete, N = ',0
                        mov     eax, ebp
                        call    dump_dec
                        call    dump_crlf
                        jmp     enditer

hasherr:                call    dump_msg
                        db      '***ERROR***: hash hit while enecryption (change data or key)',13,10,0
                        jmp     quit

loadkey:                pusha
                        call    fopen_ro     ; see RSACRYPT.FMT for details
                        jnc     __x1
                        call    dump_msg
                        db      '***ERROR***: public key not found',13,10,0
                        jmp     quit
__x1:                   xchg    ebx, eax
                        lea     edx, keyhash
                        mov     ecx, 4
                        call    fread
                        lea     edx, keylen
                        mov     ecx, 4
                        call    fread
                        push    eax
                        mov     edx, esp
                        mov     ecx, 4
                        call    fread
                        pop     ecx
                        lea     edx, rsa_n
                        call    fread
                        push    eax
                        mov     edx, esp
                        mov     ecx, 4
                        call    fread
                        pop     ecx
                        lea     edx, rsa_e
                        call    fread
                        call    fclose
                        popa
                        retn

include                 ..\..\dpgncrpt.inc

include                 ..\..\..\..\include\fioexlow.inc
include                 ..\..\..\..\include\cmdline.inc
include                 ..\..\..\..\include\console.inc
include                 rnd.inc

include                 ..\..\..\..\include\rsa\asm\rsalib1.inc
include                 ..\..\..\..\include\rsa\asm\rsalib3.inc
include                 crypto.inc

                        end     start
