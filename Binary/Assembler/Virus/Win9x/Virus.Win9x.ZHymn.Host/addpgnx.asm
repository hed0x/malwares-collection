   ; ADDPGNX
   ; ~~~~~~~
   ; - RSA-decrypt data buffer (if encrypted plugin there)
   ; - add plugin via EV_PLUGMAN_ADD

   include                 INCLUDE\consts.inc
   include                 plugman.inc
   include                 rsalib.inc
   include                 rsakey.inc

   include                 plugin.inc
                           PLUGIN_START    ADDPGNX, CODE32, PERMUTABLE

   handleevent:            hookevent EV_ADDPGNX_DECRYPT, decrypt
                           stc
                           retn

   ; input:  ESI=[probably] encrypted .PGN file
   ;         ECX=size
   ; output: plugin added (via EV_PLUGMAN_ADD) if decrypted,
   ;         *** BUFFER CHANGED ***

   decrypt:
                           pusha
                           sub     esp, MAXKEY/8*3
                           cld

   rsa_n                   =       (byte ptr MAXKEY/8*0)   ; [ESP].based
   rsa_e                   =       (byte ptr MAXKEY/8*1)
   rsa_x                   =       (byte ptr MAXKEY/8*2)

                           mov     edx, esi        ; EDX = buffer
                           mov     edi, esi        ; EDI = output

                           mov     eax, [esi]
                           xor     eax, [esi+4]
                           neg     eax
                           cmp     eax, -'.PGN'
                           jne     __exit

                           mov     ebx, [esi+8+8+0]
                           xor     ebx, [esi+8+8+4]  ; ebx = keyhash = keyID

                           event   EV_RSAKEY_GET_PARAMS
                           jc      __exit

                           add     esi, 24         ; skip header

                           pusha
                           lea     edi, [esp+32].rsa_n
                           event   EV_RSAKEY_GET_N
                           lea     edi, [esp+32].rsa_e
                           event   EV_RSAKEY_GET_E
                           popa

   ; for each block

   __cycle:                pusha
                           lea     edi, [esp+32].rsa_x  ; rsa_x = 0
                           mov     ecx, MAXKEY/8
                           xor     eax, eax
                           cld
                           rep     stosb
                           popa

                           lodsd                   ; EAX <-- checksum
                           or      eax, eax        ; 0==EOF ?
                           jz      __endcycle
                           xchg    ebx, eax

   ; rsa decrypt
                           pusha
                           push    ecx             ; key length, in BITs
                           push    esi             ; input
                           lea     eax, [esp+32+8].rsa_x
                           push    eax             ; output
                           lea     eax, [esp+32+12].rsa_e
                           push    eax             ; e
                           lea     eax, [esp+32+16].rsa_n
                           push    eax             ; n
                           mov     edx, esp
                           event   EV_RSALIB_MODEXP
                           add     esp, 5*4
                           popa

                           mov     eax, ecx
                           shr     eax, 3
                           add     esi, eax             ; - go to next block

                           pusha
                           lea     esi, [esp+32].rsa_x
                           call    pgn_decr_and_hash
                           cmp     eax, ebx        ; EBX=checksum
                           popa
                           jne     __exit

                           pusha
                           lea     esi, [esp+32].rsa_x+4  ; 4=skip csum
                           shr     ecx, 3
                           sub     ecx, 4+Z        ; 4=csum Z=lastbyte(s)
                           rep     movsb
                           mov     [esp], edi      ; popa.edi
                           popa

                           jmp     __cycle
   __endcycle:

                           mov     esi, edx        ; esi
                           mov     ecx, edi        ; ecx
                           sub     ecx, edx
                           event   EV_PLUGMAN_ADD
   __exit:
                           add     esp, MAXKEY/8*3
                           popa
                           clc     ; processed!
                           retn

   include                 rsacrypt\rsacrypt\pgncryp.inc

                           PLUGIN_END
