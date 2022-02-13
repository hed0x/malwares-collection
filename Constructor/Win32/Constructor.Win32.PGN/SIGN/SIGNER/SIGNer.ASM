
MAXKEY                  equ     4096

include                 ..\..\INCLUDE\consts.inc
include                 ..\..\INCLUDE\PGN2\pgn2.inc

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

id                      label   dword
                        db      'PGN2'

seckey                  db      'secret.rsa',0
pubkey                  db      'public.rsa',0

argc                    dd      ?
argv0                   db      256 dup (?)
argv1                   db      256 dup (?)
argv2                   db      256 dup (?)
argv3                   db      256 dup (?)
argv4                   db      256 dup (?)

k0_start:

keylen                  dd      ?
keyhash                 dd      ?
ttt                     dd      ?
fsize                   dd      ?
fptr                    dd      ?
rsa_e_len               dd      ?
rsa_n                   db      MAXKEY/8 dup (?)
rsa_e                   db      MAXKEY/8 dup (?)
hashdata                db      MAXKEY/8 dup (?)
rsa_x                   db      MAXKEY/8 dup (?)
rsa_t1                  db      MAXKEY/8 dup (?)
rsa_t2                  db      MAXKEY/8 dup (?)

k0_size                 equ     $-k0_start

                        .code
start:
                        call    zerodata

                        call    dump_msg
                        db      'SIGNER -- (x) 2000-2001',13,10,0

                        call    getcmdline

                        cmp     argc, 4
                        jne     help

                        mov     eax, argv1.dword ptr 0

                        cmp     al, '-'
                        je      switch
                        cmp     al, '/'
                        jne     noswitch

switch:                 mov     eax, argv1.dword ptr 1
noswitch:
                        or      ah, ah
                        jnz     help
                        or      al, 20h

                        cmp     al, 's'
                        je      call_sign
                        cmp     al, 'v'
                        je      call_verify

                        jmp     help

quit:
                        call    zerodata

                        push    -1
                        callW   ExitProcess

zerodata:               lea     edi, k0_start
                        mov     ecx, k0_size
                        xor     eax, eax
                        cld
                        rep     stosb
                        retn

call_sign:
                        call    dump_msg
                        db      'þ reading secret key: ',0

                        push    offset seckey
                        push    offset argv2
                        callW   lstrcat

                        lea     edx, argv2
                        call    dump_asciiz_edx
                        call    dump_crlf

                        lea     edx, argv2
                        call    readkey

                        call    sign

                        jmp     quit

call_verify:            call    dump_msg
                        db      'þ reading public key: ',0

                        push    offset pubkey
                        push    offset argv2
                        callW   lstrcat

                        lea     edx, argv2
                        call    dump_asciiz_edx
                        call    dump_crlf

                        lea     edx, argv2
                        call    readkey

                        call    verify

                        jmp     quit

help:                   call    dump_msg
                        db      13,10
                        db      'syntax:',13,10
                        db      '  SIGN s keydir\ file',13,10
                        db      '  SIGN v keydir\ file',13,10
                        db      0
                        jmp     quit

error:                  call    dump_msg
                        db      '***ERROR***',13,10,0
                        jmp     quit

readkey:
                        call    fopen_ro
                        jc      error
                        xchg    ebx, eax

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

                        retn

sign:                   call    calc_file_hash

                        pusha
                        call    dump_msg
                        db      'þ encrypting hash',13,10,0
                        popa

                        call    call_rsa

                        call    dump_msg
                        db      'þ writing ',0
                        lea     edx, argv3
                        call    dump_asciiz_edx
                        call    dump_crlf

                        lea     edx, argv3
                        call    fcreate
                        jc      error
                        xchg    ebx, eax

                        lea     edx, id
                        mov     ecx, 4
                        call    fwrite

                        lea     edx, keyhash
                        mov     ecx, 4
                        call    fwrite

                        lea     edx, rsa_x
                        mov     ecx, keylen
                        shr     ecx, 3
                        call    fwrite

                        lea     edx, fsize
                        mov     ecx, 4
                        call    fwrite

                        mov     edx, fptr
                        add     edx, 4
                        mov     ecx, fsize
                        call    fwrite

                        call    fclose

                        call    dump_msg
                        db      'þ signed OK',13,10,0

                        retn

verify:
                        call    dump_msg
                        db      'þ reading ',0
                        lea     edx, argv3
                        call    dump_asciiz_edx
                        call    dump_crlf

                        lea     edx, argv3
                        call    fopen_ro
                        jc      error
                        xchg    ebx, eax

                        lea     edx, ttt
                        mov     ecx, 4
                        call    fread
                        mov     eax, id
                        cmp     eax, ttt
                        jne     error

                        lea     edx, ttt
                        mov     ecx, 4
                        call    fread
                        mov     eax, ttt
                        cmp     eax, keyhash
                        jne     error

                        lea     edx, hashdata
                        mov     ecx, keylen
                        shr     ecx, 3
                        call    fread
                        cmp     eax, ecx
                        jne     error

                        lea     edx, fsize
                        mov     ecx, 4
                        call    fread

                        mov     eax, fsize
                        add     eax, 4
                        push    eax
                        push    40h
                        callW   GlobalAlloc
                        mov     fptr, eax

                        mov     ecx, fsize
                        mov     [eax], ecx

                        mov     ecx, fsize
                        mov     edx, fptr
                        add     edx, 4
                        call    fread

                        call    fclose

                        pusha
                        call    dump_msg
                        db      'þ decrypting hash',13,10,0
                        popa

                        call    call_rsa

                        lea     edi, hashdata
                        mov     ecx, MAXKEY/8
                        xor     al, al
                        rep     stosb

                        call    just_calc_hash

                        lea     esi, rsa_x
                        lea     edi, hashdata
                        mov     ecx, keylen
                        shr     ecx, 3
                        rep     cmpsb
                        jne     __err

__ok:                   call    dump_msg
                        db      'þ verified OK',13,10,0

                        retn

__err:                  call    dump_msg
                        db      'þ *** VERIFICATION FALIED ***',13,10,0

                        retn

calc_file_hash:
                        call    dump_msg
                        db      'þ reading ',0
                        lea     edx, argv3
                        call    dump_asciiz_edx
                        call    dump_crlf

                        lea     edx, argv3
                        call    fopen_ro
                        jc      error
                        xchg    ebx, eax

                        call    fgetsize
                        xchg    edi, eax

                        mov     fsize, edi

                        cmp     fsize, MIN_PLUGIN_SIZE  ; limin min fsize
                        jb      error

                        add     edi, 4
                        push    edi
                        push    40h
                        callW   GlobalAlloc
                        mov     fptr, eax

                        mov     ecx, fsize
                        mov     [eax], ecx

                        mov     edx, fptr
                        add     edx, 4
                        mov     ecx, fsize
                        call    fread

                        call    fclose

just_calc_hash:         pusha
                        call    dump_msg
                        db      'þ calculating hash',13,10,0
                        popa

                        mov     eax, keylen
                        shr     eax, 3
                        push    eax            ; hash size
                        push    offset hashdata
                        mov     eax, fsize
                        add     eax, 4
                        push    eax
                        push    fptr
                        call    hash_z1
                        add     esp, 4*4

                        mov     eax, keylen     ; clear highest bit
                        dec     eax
                        lea     edx, hashdata
                        btr     [edx], eax

                        retn

include                 ..\..\INCLUDE\console.inc
include                 ..\..\INCLUDE\fioexlow.inc
include                 ..\..\INCLUDE\cmdline.inc

include                 ..\..\INCLUDE\RSA\ASM\hash_z1.inc
include                 ..\..\INCLUDE\RSA\ASM\rsalib1.inc

call_rsa:
                        push    offset rsa_t2
                        push    offset rsa_t1
                        push    offset rsa_n
                        push    offset rsa_e
                        push    offset hashdata
                        push    offset rsa_x
                        mov     eax, keylen
;                       add     eax, 32
                        push    eax
                        call    modexp
                        add     esp, 7*4
                        retn

                        end     start
