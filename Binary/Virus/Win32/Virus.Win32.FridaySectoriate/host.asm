.code
find_host proc       ;for future versions this procedure may (certainly) be changed

.data
host_namelocal db "mx1.mail.yahoo.com",0
.code
mov eax,offset host_namelocal

ret
find_host endp