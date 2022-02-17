;(C) Vecna 2001

AF_INET equ 2
PF_INET equ AF_INET
SOCK_STREAM equ 1
IPPROTO_TCP equ 6

;STRUC sockaddr_in
;.sin_family 0
;.sin_port   2
;.sin_addr   4
;.sin_zero   8
;ENDSTRUC
;sockaddr_in_size 16

;STRUC REDIRECT
;.next     0
;.name     +4
;.ip       +8
;.port     +12
;.thread   +16
;.socket1  +20
;.socket2  +24
;.malloc   +28
;ENDSTRUC
;REDIRECT_size 20

