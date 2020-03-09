

.code

;///////////////////getting kernel base/////////////
get_kernel:
jmp this_code

kernel_base dd 0

this_code:

mov ecx,[esp+4]

loop_find_kernel:

xor edx,edx
dec ecx
mov dx,[ecx+3ch]
test dx,0f800h
jnz loop_find_kernel

cmp ecx,[ecx+edx+34h]
jnz loop_find_kernel

cmp word ptr [ecx],"ZM"
jne loop_find_kernel

mov [ebp+offset kernel_base],ecx
lrrt:
ret
;/////////////////end getting kernel base///////////////

find_main_api:

jmp finder_data
PE_offset dd 0
Export_address dd 0
Export_size dd 0
Current_kern dd 0
function_no dd 0
function_addr dd 0
function_ord dd 0
function_name dd 0
base_ord dd 0
GetProcAddressF db "GetProcAddress",0
AGetProcAddressF dd 0
GetModuleHandleN db "GetModuleHandleA",0
GetModuleHandleAd dd 0

finder_data:

mov edi,[ebp+offset kernel_base]
add edi,[edi+3ch]      ;just checking
cmp word ptr [edi],"EP"
jne exit

mov dword ptr [ebp+offset PE_offset],edi
mov eax,[edi+78h]      ;export table rva
push eax
mov eax,[edi+7ch]      ;export table size 
mov [ebp+offset Export_size],eax
pop eax
mov [ebp+offset Export_address],eax
add eax,[ebp+offset kernel_base]
mov edx,[eax+16]               ;  ordinal base

add edx,[ebp+offset kernel_base]  
mov [ebp+offset base_ord],edx
mov edx,[eax+24]               ;no. of exported functions
mov [ebp+offset function_no],edx 
mov edx,[eax+28]              ;rva of exported functions
add edx,[ebp+offset kernel_base]
mov [ebp+offset function_addr],edx 
mov edx,[eax+32]              ; rva of exported function name
add edx,[ebp+offset kernel_base]
mov [ebp+offset function_name],edx
mov edx,[eax+36]  ;rva for name ordinal
add edx,[ebp+offset kernel_base]
mov [ebp+offset function_ord],edx
xor edx,edx 
xor eax,eax
mov eax,[ebp+offset function_name] ; getting the GetProcAddress api address
mov edx,offset GetProcAddressF
add edx,ebp
xor ecx,ecx
mov edi,[eax]
add edi,[ebp+offset kernel_base]

loop_search_1:
mov esi,edx
match_byte:

cmpsb
jne Next_one
cmp byte ptr [edi],0
je Got_it
jmp  match_byte

Next_one:
add cx,1
add eax,4

mov edi,[eax]
add edi,[ebp+offset kernel_base]

jmp loop_search_1
jmp exit
Got_it:

mov edi,[eax]
add edi,[ebp+offset kernel_base]
shl ecx,1
mov eax,[ebp+offset function_ord]
add eax,ecx
xor ecx,ecx
mov cx,word ptr [eax]
shl ecx,2
mov eax,[ebp+offset function_addr]
add eax,ecx
mov eax,[eax]
add eax,[ebp+offset kernel_base]
mov [ebp+offset AGetProcAddressF],eax

ret

exit_finder:
mov eax,0

ret