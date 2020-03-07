   ; ADDPGNU
   ; ~~~~~~~
   ; - scan buffer for UUE-encrypted '.PGN' signature, as in encrypted files
   ;   (1st dword random, 2nd xored -- see RSACRYPT.TXT for details)
   ; - UUE-decrypt buffer, starting from signature

   ; ***WARNING***: RSA-encrypted PGN may be even in the middle of the
   ;                UUE-encoded file, BUT offset in the file should be 3-aligned
   ;
   ; maximally perverted file with the UUE-RSA-encrypted plugin inside:
   ;
   ;   any-shit -- optional, in the beginning of the main file
   ;   UUE-encoded file -- anywhere in the start/middle/end of the main file
   ;   {
   ;     any-shit, optional        ; <-- at offset 0 in the UUE-encoded file
   ;     RSA-ENCRYPTED plugin      ; <-- offset i*3, important!  [i=0,1,2,3,...]
   ;     {
   ;       [BEEP.PGN]
   ;     }
   ;     any-shit, optional
   ;   }
   ;   any-shit -- optional, at the end of the main file
   ;

   include                 INCLUDE\consts.inc

   include                 plugin.inc
                           PLUGIN_START    ADDPGNU, CODE32, PERMUTABLE

   handleevent:            hookevent EV_ADDPGNU_DECRYPT, uudecode
                           stc
                           retn

   ; action: just UUE-decrypt!!!!
   ; input:  ESI=[probably] UUE-encrypted .PGN file
   ;         ECX=size
   ; output: ECX=new size, ***BUFFER CHANGED***

   uudecode:               pusha
                           sub     esp, 64
                           cld

                           lea     ebx, [esi+ecx-32]       ; lastbyte

   __cycle:                cmp     esi, ebx
                           jae     __exit

                           lea     edx, [esi+32]           ; edx = lastbyte
                           mov     edi, esp
                           call    decode

                           cmp     eax, 8
                           jb      __skipcheck

                           mov     eax, [esp]
                           xor     eax, [esp+4]
                           neg     eax
                           cmp     eax, -'.PGN'
                           je      __found

   __skipcheck:            inc     esi
                           dec     ecx
                           jmp     __cycle

   __found:                lea     edx, [esi+ecx]     ; lastbyte
                           mov     edi, [esp+64].pusha_esi
                           call    decode
                           mov     [esp+64].popa_ecx, eax

   __exit:                 add     esp, 64
                           popa
                           clc     ; event handled
                           retn

   ; input: ESI=src
   ;        EDI=dest
   ;        EDX=lastbyte
   ; output:EAX=# of decoded bytes

   decode:                 pusha

   __cycle:                cmp     esi, edx                ; pusha.edx
                           jae     __exitcycle

                           ; 11111122 22223333 33444444

                           call    __getcode
                           jc      __exitcycle

                           mov     bl, al
                           shl     bl, 2

                           call    __getcode
                           jc      __exitcycle

                           mov     bh, al
                           shl     bh, 4
                           shr     al, 4
                           or      al, bl
                           stosb

                           call    __getcode
                           jc      __exitcycle

                           mov     bl, al
                           shl     bl, 6
                           shr     al, 2
                           or      al, bh
                           stosb

                           call    __getcode
                           jc      __exitcycle

                           or      al, bl
                           stosb

                           jmp     __cycle

   __exitcycle:            sub     edi, [esp]      ; pusha.edi
                           mov     [esp].popa_eax, edi  ; popa.eax

                           popa
                           retn

   __skip3:                add     esi, 3

   __getcode:              cmp     esi, edx          ; pusha.edx == lastbyte
                           jae     __badchar

                           mov     eax, [esi]
                           cmp     ax, 0A0Dh  ; 13, 10, 16+line_length
                           je      __skip3

                           xor     eax, eax
                           lodsb

                           cmp     al, 13
                           je      __getcode
                           cmp     al, 10
                           je      __getcode

                           cmp     al, 60h
                           jne     __checkrange
                           mov     al, 20h
                           jmp     __goodchar

   __checkrange:           cmp     al, 21h
                           jb      __badchar
                           cmp     al, 5Fh
                           ja      __badchar

   __goodchar:             sub     al, 20h

                           clc
                           retn

   __badchar:              stc
                           retn

                           PLUGIN_END
