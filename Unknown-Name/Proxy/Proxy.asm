   ;Name:      Simple Wingate Proxy Server

   ;Coder:     BeLiAL

   ;Type:      1. SOCKS Version 4 Server
   ;       2. No port binding possible
   ;       3. Full Duplex

   ;       You dont know the power, of the dark side....
   ;       BeLiAL  2002, BCVG

   .386
   .model flat
   locals

   include proxy.inc

   .data

   wsadata     WSADATA <>
   startsocket dd 0
   bind_struc  SOCKADDR_IN <>
   client_socket   dd 0
   threadid    dd 0
   thread_argument dd 0

   .code

   start:      push SEM_NOGPFAULTERRORBOX
                   call SetErrorMode

           push offset wsadata
           push 0101h
           call WSAStartup
           test eax,eax
           jne Exit_Process            ;Load Winsock

   new_socket: push 0
           push SOCK_STREAM
           push AF_INET
           call socket             ;Create a socket
           cmp eax,-1
           je release_wsa
           mov dword ptr [startsocket],eax

           push PROXY_PORT
           call htons
           mov word ptr [bind_struc+2],ax

           push 16
           push offset bind_struc
           push dword ptr [startsocket]
           call bind
           inc eax
           jz close_socket

           push 5
           push dword ptr [startsocket]
           call listen
           inc eax
           jz close_socket

   wait_loop:  push 0
           push 0
           push dword ptr [startsocket]
           call accept
           mov dword ptr [client_socket],eax
           inc eax
           jz wait_loop

           push SIZE THREADDATA
           push 0
           call GlobalAlloc
           cmp eax,0
           jne create_thread
           push dword ptr [client_socket]
           call closesocket
           jmp wait_loop

   create_thread:  push dword ptr [client_socket]
           pop dword ptr [eax.socket1]
           mov dword ptr [thread_argument],eax

           push offset threadid
           push 0
           push offset thread_argument
           push offset proxy_thread
           push 0
           push 0
           call CreateThread

           jmp wait_loop

   close_socket:   push dword ptr [startsocket]
           call closesocket

   release_wsa:    call WSACleanup

   Exit_Process:   push 0
           call ExitProcess


   ;   <--------------------The Proxy Thread begins here -------------------->


   proxy_thread:   mov eax,dword ptr [esp+(1*4)]
                   mov ebp,dword ptr [eax]
           push 10000
           push 0
           call GlobalAlloc
           cmp eax,0
           je close_thread
           mov dword ptr [ebp.tmp_data_offset],eax

           push 0
           push 100
           push eax            ;tmp_data_offset
           push dword ptr [ebp.socket1]
           call recv
           mov eax,dword ptr [ebp.tmp_data_offset]

           cmp byte ptr [eax],4                ;right version?
           jne Reject_Request
           cmp byte ptr [eax+1],1              ;connect to port?
           je Connect_Port
           cmp byte ptr [eax+1],2              ;bind a port?
           je Bind_Port

   Reject_Request: mov byte ptr [eax+1],91
           mov byte ptr [eax],0
           push 0
           push 8
           push eax
           push dword ptr [EBP.socket1]
           call send

   close_thread:   push dword ptr [ebp.socket1]
           call closesocket
           push dword ptr [ebp.socket2]
           call closesocket
           push dword ptr [ebp.tmp_data_offset]
           call GlobalFree
           push ebp
                   call GlobalFree
               push 0
                   call ExitThread

   ;   <-------------------- Connect to a Server -------------------->

   Connect_Port:   push 0
                   push SOCK_STREAM
                   push AF_INET
                   call socket
           cmp eax,-1
           je Reject_Request
           mov dword ptr [ebp.socket2],eax

           mov eax,dword ptr [ebp.tmp_data_offset]
           mov word ptr [ebp.socket_struc],AF_INET
           push word ptr [eax+2]
           pop word ptr [ebp.socket_struc+2]
           push dword ptr [eax+4]
           pop dword ptr [ebp.socket_struc+4]

           push 00000010h
           lea eax,[ebp.socket_struc]
           push eax
           push dword ptr [ebp.socket2]
           call connect
           cmp eax,-1
           je Reject_Request

           mov eax,dword ptr [ebp.tmp_data_offset]
           mov byte ptr [eax+1],90
           mov byte ptr [eax],0
           push 0
           push 8
           push eax
           push dword ptr [EBP.socket1]
           call send

           call DataTraffic
           jmp close_thread

   ;   <-------------------- Binding a port -------------------->

   Bind_Port:  jmp Reject_Request              ;deactivated

   ;   <-------------------- Data Traffic Proc -------------------->

   DataTraffic PROC

           mov dword ptr [ebp.thread_argument2],ebp
           lea eax,[ebp.threadid2]
           push eax
           push 0
           lea eax,[ebp.thread_argument2]
           push eax
           push offset Sock1_Thread
           push 0
           push 0
           call CreateThread

   Socket2_Req:    cmp byte ptr [ebp.ErrorCounter],9
           je Too_Much                 ;exit on error

           mov eax,dword ptr [ebp.tmp_data_offset]
           push 0
           push 10000
           push eax
           push dword ptr [EBP.socket2]
           call recv
           cmp eax,0
           je Socket2_Req
           cmp eax,-1
           jne Relay_Data2
           inc byte ptr [ebp.ErrorCounter]
           jmp Socket2_Req

   Relay_Data2:    mov ebx,dword ptr [ebp.tmp_data_offset]
           push 0
           push eax
           push ebx
           push dword ptr [ebp.socket1]
           call send
           cmp eax,-1
           je Send_Error2
           mov byte ptr [ebp.ErrorCounter],0
           jmp Socket2_Req

   Send_Error2:    inc byte ptr [ebp.ErrorCounter]
           jmp Socket2_Req

   Too_Much:   ret

   Sock1_Thread:   mov eax,dword ptr [esp+(1*4)]
                   mov ebp,dword ptr [eax]

   Socket1_Req:    cmp byte ptr [ebp.ErrorCounter2],9
           je Too_Much2                    ;exit on error

           mov eax,dword ptr [ebp.tmp_data_offset]
           push 0
           push 10000
           push eax
           push dword ptr [EBP.socket1]
           call recv
           cmp eax,0
           je Socket1_Req
           cmp eax,-1
           jne Relay_Data1
           inc byte ptr [ebp.ErrorCounter2]
           jmp Socket1_Req

   Relay_Data1:    mov ebx,dword ptr [ebp.tmp_data_offset]
           push 0
           push eax
           push ebx
           push dword ptr [ebp.socket2]
           call send
           cmp eax,-1
           je Send_Error1
           mov byte ptr [ebp.ErrorCounter2],0
           jmp Socket1_Req

   Send_Error1:    inc byte ptr [ebp.ErrorCounter2]
           jmp Socket2_Req

   Too_Much2:  push 0
                   call ExitThread

   DataTraffic ENDP


           end start
