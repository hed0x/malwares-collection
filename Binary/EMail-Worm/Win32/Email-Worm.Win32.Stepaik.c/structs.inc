;access_edi	equ	(dword ptr 0*4)
;access_esi	equ	(dword ptr 1*4)
;access_ebp	equ	(dword ptr 2*4)
;access_esp	equ	(dword ptr 3*4)
;access_ebx	equ	(dword ptr 4*4)
;access_edx	equ	(dword ptr 5*4)
;access_ecx	equ	(dword ptr 6*4)
;access_eax	equ	(dword ptr 7*4)



; PROCESS_INFO
processinfo  	struc
pinfo_phandle           dd      ?
pinfo_thandle           dd      ?
pinfo_pid               dd      ?
pinfo_tid               dd      ?
processinfo 	ends

; STARTUPINFO
startupinfo 	struc
si_size		dd ?
si_reserved	dd ?
si_desktop	dd ?
si_title	dd ?
si_xx		dd ?
si_yy		dd ?
si_xsize	dd ?
si_ysize	dd ?
si_xchars	dd ?
si_ychars	dd ?
si_fillattr	dd ?
si_flags	dd ?
si_show		dw ?
si_reserved2	dw ?
si_reserved3	dd ?
si_stdin	dd ?
si_stdout	dd ?
si_stderr	dd ?
startupinfo 	ends

; DEBUG_EVENT
debugevent	struc
de_code                 dd      ?
de_pid                  dd      ?
de_tid                  dd      ?
de_data                 db      1024 dup (?)
debugevent	ends

DEFAULT_CONTEXTFLAGS	equ 00010000h+1+2+4+10h  ;386/486,control,integer,segments,debug
; CONTEXT
context	struc
c_contextflags          dd      ?
c_dr0                   dd      ?
c_dr1                   dd      ?
c_dr2                   dd      ?
c_dr3                   dd      ?
c_dr6                   dd      ?
c_dr7                   dd      ?
c_unused                db      112 dup (?)     ; fpu
c_gs                    dd      ?
c_fs                    dd      ?
c_es                    dd      ?
c_ds                    dd      ?
c_edi                   dd      ?
c_esi                   dd      ?
c_ebx                   dd      ?
c_edx                   dd      ?
c_ecx                   dd      ?
c_eax                   dd      ?
c_ebp                   dd      ?
c_eip                   dd      ?
c_cs                    dd      ?
c_eflags                dd      ?
c_esp                   dd      ?
c_ss                    dd      ?
context	ends

MAX_PATH	equ 260
finddata struc
fd_attr	dd ? 	;    DWORD dwFileAttributes; 
fd_crtime	dq ?	;    FILETIME ftCreationTime; 
fd_lastacctime	dq ?	;    FILETIME ftLastAccessTime; 
fd_lastwrtime	dq ?	;    FILETIME ftLastWriteTime; 
fd_hsize	dd ?	;    DWORD    nFileSizeHigh; 
fd_lsize	dd ?	;    DWORD    nFileSizeLow; 
fd_res0		dd ?	;    DWORD    dwReserved0; 
fd_res1		dd ?	;    DWORD    dwReserved1; 
fd_fname	db	MAX_PATH	dup (?);    TCHAR    cFileName[ MAX_PATH ]; 
fd_fnameold	db	14 dup (?);    TCHAR    cAlternateFileName[ 14 ]; 
finddata ends

; winsock

HOSTENT struc
h_name	dd ?
h_aliases	dd ?
h_addrtype	dw ?
h_length	dw ?
h_addr_list	dd ?
HOSTENT ends
h_addr	equ h_addr_list
h_size	equ size HOSTENT

WSADATA	struc
wVersion		dw ?
wHighVersion	dw ?
szDescription  	db 256 dup(?)
szSystemStatus 	db 128 dup(?)
iMaxSockets     	db ?
iMaxUdpDg       	db ?
lpVendorInfo    	dd ?
WSADATA	ends
wsa_size	equ size WSADATA

sockaddr_in	struc
  ; стpуктуpа данных для вызова connect
c_proto   dw ?
c_port    dw ?
  ; поpт назначения (пpошедший API
  ; htons)
ddip		dd ?
  ; ip назначения   (32-битное число,
  ; для  пpеобpазования из текстового
  ; вида  использовался inet_addr)
x0          dw ?        ; пустышки
x1		dw ?
x2        	dd ?
sockaddr_in	ends
sockaddr_size equ size sockaddr_in

