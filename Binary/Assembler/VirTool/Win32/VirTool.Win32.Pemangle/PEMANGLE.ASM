;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
; PEMangle V1.0
;
; Portable Executable Encrypt Utility
;
; (C) Lord Julus 1999
;
; (lordjulus@geocities.com)
;
; The import32.lib library must also contain the exports from IMAGEHLP.DLL
; for the checksum calculation...
;
;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
.586p                                  ;
.model flat, stdcall                   ;
                                       ;
extrn ExitProcess:proc                 ;
extrn GetCommandLineA:proc             ;
extrn CreateFileA:proc                 ;
extrn WriteFile: proc                  ;
extrn GetStdHandle: proc               ;
extrn CloseHandle:proc                 ;
extrn GetFileSize:proc                 ;
extrn CreateFileMappingA:proc          ;
extrn MapViewOfFile:proc               ;
extrn UnmapViewOfFile:proc             ;
extrn SetFilePointer:proc              ;
extrn SetEndOfFile:proc                ;
extrn CheckSumMappedFile:proc          ;
                                       ;
include w32nt_lj.inc                   ;
                                       ;
.data                                  ;
handle           dd 0                  ;
maphandle        dd 0                  ;
mapaddress       dd 0                  ;
filesize         dd 0                  ;
peheader         dd 0                  ;
numberofsections dw 0                  ;
newfilesize      dd 0                  ;
filealign        dd 0                  ;
sectionalign     dd 0                  ;
imagesize        dd 0                  ;
baseofcode       dd 0                  ;
ptr_raw          dd 0                  ;
eip              dd 0                  ;
checksum         dd 0                  ;
headersum        dd 0                  ;
text             db 13,10,"PEMangle V1.0 by Lord Julus (C) 1999",13,10
text_len =       $-offset text         ;
error            db 13,10,"Error processing specified file!",13,10
error_len =      $-offset error        ;
error2           db 13,10,"Error: already encrypted!",13,10
error_len2 =     $-offset error2       ;
temp             dd 0                  ;
console          dd 0                  ;
;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
.code                                  ;
start:                                 ;
        push 0FFFFFFF5h                ; Print text...
        call GetStdHandle              ;
        mov console, eax               ;
                                       ;
        or eax, eax                    ;
        jz invalid_console             ;
        push 0                         ;
        push offset temp               ;
        push text_len                  ;
        push offset text               ;
        push eax                       ;
        call WriteFile                 ;
                                       ;
invalid_console:                       ;
        call GetCommandLineA           ; Open file...
                                       ;
        cmp eax, 0                     ;
        je open_error                  ;
                                       ;
        mov edi, eax                   ;
        xor eax, eax                   ;
        mov al, '.'                    ;
        mov ecx, 260                   ;
        repnz scasb                    ;
        add edi, 2                     ;
                                       ;
scan_2:                                ;
        inc edi                        ;
        cmp byte ptr [edi], 0          ;
        je open_error                  ;
        cmp byte ptr [edi], '"'        ;
        je scan_2                      ;
        cmp byte ptr [edi], 20h        ;
        jne found_cmd                  ;
        jmp scan_2                     ;
                                       ;
found_cmd:                             ;
        mov esi, edi                   ;
                                       ;
        push 0                         ;
        push 0                         ;
        push OPEN_EXISTING             ;
        push 0                         ;
        push 0                         ;
        push GENERIC_READ or GENERIC_WRITE;
        push esi                       ;
        Call CreateFileA               ;
        cmp eax, -1                    ;
        je open_error                  ;
        mov [handle], eax              ;
                                       ;
        push 0                         ;
        push handle                    ;
        call GetFileSize               ;
        cmp eax, -1                    ;
        je close_file                  ;
        mov [filesize], eax            ;
        mov [newfilesize], eax         ;
        add eax, decryptor_len         ;
                                       ;
                                       ;
        push 0                         ;
        push eax                       ;
        push 0                         ;
        push PAGE_READWRITE            ;
        push 0                         ;
        push handle                    ;
        call CreateFileMappingA        ;
                                       ;
        cmp eax, 0                     ;
        je close_file                  ;
        mov [maphandle], eax           ;
                                       ;
        push 0                         ;
        push 0                         ;
        push 0                         ;
        push FILE_MAP_ALL_ACCESS       ;
        push eax                       ;
        call MapViewOfFile             ;
        cmp eax, 0                     ;
        je close_map                   ;
        mov [mapaddress], eax          ;
                                       ;
        call Mangle_File               ;
                                       ;
        push mapaddress                ;
        call UnmapViewOfFile           ;
                                       ;
close_map:                             ;
        push maphandle                 ;
        call CloseHandle               ;
                                       ;
close_file:                            ;
        push FILE_BEGIN                ;
        push 0                         ;
        push newfilesize               ;
        push handle                    ;
        call SetFilePointer            ;
                                       ;
        push handle                    ;
        call SetEndOfFile              ;
                                       ;
        push handle                    ;
        call CloseHandle               ;
        jmp quit                       ;
                                       ;
open_error:                            ;
        mov eax, console               ;
        or eax, eax                    ;
        jz quit                        ;
        push 0                         ;
        push offset temp               ;
        push error_len                 ;
        push offset error              ;
        push eax                       ;
        call WriteFile                 ;
                                       ;
quit:                                  ;
        push 0                         ;
        call ExitProcess               ;
;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
Mangle_File:                           ;
        mov esi, mapaddress            ; MZ header?
        cmp word ptr [esi], 'ZM'       ;
        jne exit                       ;
        mov eax, [esi.MZ_lfanew]       ;
        cmp eax, 1000h                 ;
        ja exit                        ;
        add eax, mapaddress            ;
        mov esi, eax                   ;
        mov peheader, esi              ;
        cmp word ptr [esi], 'EP'       ; PE header?
        jne exit                       ;
                                       ;
        mov ax, [esi.NumberOfSections] ;
        mov numberofsections, ax       ;
        inc word ptr [esi.NumberOfSections]
        xor ebx, ebx                   ;
        mov bx, word ptr [esi.SizeOfOptionalHeader]
                                       ;
        mov esi, peheader              ;
        add esi, IMAGE_FILE_HEADER_SIZE;
                                       ;
        mov eax, [esi.OH_FileAlignment]; save data...
        mov filealign, eax             ;
        mov eax, [esi.OH_SectionAlignment]
        mov sectionalign, eax          ;
        mov eax, [esi.OH_SizeOfImage]  ;
        mov imagesize, eax             ;
        mov eax, [esi.OH_AddressOfEntryPoint]
        add eax, [esi.OH_ImageBase]    ;
        mov dword ptr [eip], eax       ;
        mov eax, dword ptr [esi.OH_BaseOfCode];
        mov baseofcode, eax            ;
        add eax, [esi.OH_ImageBase]    ;
        mov dword ptr [code_start+1], eax
        add esi, ebx                   ;
                                       ;
                                       ;
        xor eax, eax                   ;
        mov ax, numberofsections       ;
        dec eax                        ;
        mov ecx, IMAGE_SIZEOF_SECTION_HEADER
        xor edx, edx                   ;
        mul ecx                        ;
        add esi, eax                   ;
                                       ;
        cmp dword ptr [esi+4], ' elg'  ; is already mangled?
        je abort                       ;
                                       ;
        mov ecx, IMAGE_SIZEOF_SECTION_HEADER
        mov edi, esi                   ;
        add edi, ecx                   ;
        rep movsb                      ;
        sub edi, IMAGE_SIZEOF_SECTION_HEADER
        sub esi, IMAGE_SIZEOF_SECTION_HEADER
                                       ;
        mov dword ptr [edi+4], ' elg'  ; new section name
        mov dword ptr [edi+0], 'nam.'  ;
                                       ;
        mov eax, [esi.SH_VirtualAddress]; get last section's RVA
        add eax, [esi.SH_SizeOfRawData]; + last section's size
        mov ecx, sectionalign          ; take section align
        xor edx,edx                    ;
        div ecx                        ;
        inc eax                        ; and make sure the RVA
        mul ecx                        ; is aligned to it
        mov [edi.SH_VirtualAddress], eax; Got it !
                                       ;
        mov ecx, filealign             ; take file alignment
        mov eax,decryptor_end-decryptor_start; plus decryptor length
        xor edx,edx                    ;
        div ecx                        ;
        inc eax                        ; make sure the new
        mul ecx                        ; section respects file
        mov [edi.SH_SizeOfRawData],eax ; alignment
                                       ;
        mov ecx, sectionalign          ; we must align again
        mov eax, decryptor_end - decryptor_start; decryptor size
        xor edx, edx                   ;
        div ecx                        ;
        inc eax                        ;
        mul ecx                        ;
        mov [edi.SH_VirtualSize],eax   ; the virtual size
                                       ;
                                       ;
        mov eax,[edi.SH_PointerToRawData]; The last section's
        add eax,[edi.SH_SizeOfRawData] ;  pointer to raw data
        mov ecx, filealign             ; + it's size of raw
        xor edx,edx                    ; data, aligned to the
        div ecx                        ; file alignment
        or edx, edx                    ;
        jz no_inc                      ;
        inc eax                        ;
                                       ;
no_inc:                                ;
        mul ecx                        ;
        mov [edi.SH_PointerToRawData],eax
                                       ;
        mov eax, decryptor_end-decryptor_start; calculate new size of image
        add eax, imagesize             ;
        mov ecx, sectionalign          ;
        xor edx,edx                    ;
        div ecx                        ;
        inc eax                        ;
        mul ecx                        ;
        mov imagesize,eax              ; save it in PE header
                                       ;
        mov eax, [edi.SH_VirtualAddress]
                                       ;
        mov esi, peheader              ;
        add esi, IMAGE_FILE_HEADER_SIZE;
        mov [esi.OH_AddressOfEntryPoint], eax; calculate new entrypoint
                                       ;
        add eax, [esi.OH_ImageBase]    ; get the size of jump to put at
        sub eax, eip                   ; the end of decrpytor which will
        add eax, offset jump_place - offset decryptor_start; jump back to the
        add eax, 5                     ; host.
        neg eax                        ;
        mov dword ptr [jump_place+1], eax;
                                       ;
        mov eax, imagesize             ;
        mov [esi.OH_SizeOfImage], eax  ; save new size of image
                                       ;
        add newfilesize, decryptor_len ;
                                       ;
        mov edi, [edi.SH_PointerToRawData]
        mov ptr_raw, edi               ;
                                       ;
        mov esi, peheader              ; locate the code section
        add esi, IMAGE_FILE_HEADER_SIZE;
        mov eax, [esi.OH_BaseOfCode]   ;
        mov baseofcode, eax            ;
                                       ;
        mov eax, peheader              ;
        xor ebx, ebx                   ;
        mov bx, word ptr [eax.SizeOfOptionalHeader]
        mov esi, peheader              ;
        add esi, IMAGE_FILE_HEADER_SIZE;
        add esi, ebx                   ;
                                       ;
        xor ecx, ecx                   ;
        mov cx, numberofsections       ;
                                       ;
locate_section:                        ;
        mov eax, [esi.SH_VirtualAddress]
        cmp eax, baseofcode            ;
        je found                       ;
                                       ;
        add esi, IMAGE_SIZEOF_SECTION_HEADER
        loop locate_section            ;
        jmp exit                       ;
                                       ;
found:                                 ; found code section!
        mov eax, [esi.SH_Characteristics]; set it to writable!
        or eax, IMAGE_SCN_MEM_WRITE    ;
        mov [esi.SH_Characteristics], eax
                                       ;
        mov ecx, [esi.SH_VirtualSize]  ; amount of code to crypt
        cmp ecx, [esi.SH_SizeOfRawData];
        jbe strange                    ;
        mov ecx, [esi.SH_SizeOfRawData];
                                       ;
strange:                               ;
        shr ecx, 2                     ;
        lea edi, code_length           ;
        mov dword ptr [edi+1], ecx     ; save it...
        mov esi, [esi.SH_PointerToRawData]
        add esi, mapaddress            ;
        mov edi, esi                   ;
        mov ebx, 'LORD'                ; encryption key.
                                       ;
        pushad                         ; copy the runtime decryptor
        lea esi, decryptor_start       ; in the new section body.
        mov ecx, decryptor_len         ;
        mov edi, ptr_raw               ;
        add edi, mapaddress            ;
        rep movsb                      ;
        popad                          ;
                                       ;
rep_crypt:                             ; encrypt...
        lodsd                          ;
        xor eax, ebx                   ;
        add ebx, ebx                   ;
        stosd                          ;
        loop rep_crypt                 ;
        jmp exit                       ;
                                       ;
abort:                                 ;
        mov eax, console               ;
        or eax, eax                    ;
        jz exit                        ;
        push 0                         ;
        push offset temp               ;
        push error_len2                ;
        push offset error2             ;
        push eax                       ;
        call WriteFile                 ;
                                       ;
exit:                                  ;
        mov esi, peheader              ;
        add esi, IMAGE_FILE_HEADER_SIZE;
        cmp dword ptr [esi.OH_CheckSum], 0
        je no_checksum                 ;
        push offset checksum           ; recompute the file checksum
        push offset headersum          ; if necesary
        push newfilesize               ;
        push mapaddress                ;
        call CheckSumMappedFile        ;
        mov eax, dword ptr [checksum]  ;
        mov dword ptr [esi.OH_CheckSum], eax
                                       ;
no_checksum:                           ;
        ret                            ;
                                       ;
decryptor_start label                  ; Runtime decryptor.
        pushad                         ;
        pushf                          ;
                                       ;
code_start label                       ;
        mov esi, 11111111h             ;
        mov edi, esi                   ;
                                       ;
code_length label                      ;
        mov ecx, 11111111h             ;
        mov ebx, 'LORD'                ;
                                       ;
rep_decrypt:                           ;
        lodsd                          ;
        xor eax, ebx                   ;
        add ebx, ebx                   ;
        stosd                          ;
        loop rep_decrypt               ;
                                       ;
        popf                           ;
        popad                          ;
                                       ;
jump_place label                       ; return to host
        db 0E9h                        ;
        dd 0                           ;
decryptor_end   label                  ;
decryptor_len = decryptor_end - decryptor_start
end start                              ;
end                                    ;
;께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께께
