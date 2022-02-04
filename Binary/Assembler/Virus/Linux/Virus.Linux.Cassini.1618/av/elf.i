;elf header
eh_ident        equ 00h         ;byte*10
eh_type         equ 10h         ;word
eh_machine      equ 12h         ;word
eh_version      equ 14h         ;dword
eh_entrypoint   equ 18h         ;dword
eh_ph_offset    equ 1ch         ;dword
eh_sh_offset    equ 20h         ;dword
eh_flags        equ 24h         ;dword
eh_eh_size      equ 28h         ;word
eh_ph_entrysize equ 2ah         ;word
eh_ph_count     equ 2ch         ;word
eh_sh_entrysize equ 2eh         ;word
eh_sh_count     equ 30h         ;word
eh_sh_str_index equ 32h         ;word
  sizeof_elf_header equ 34h

;section header
sh_name         equ 00h         ;dword
sh_type         equ 04h         ;dword
sh_flags        equ 08h         ;dword
sh_address      equ 0ch         ;dword
sh_offset       equ 10h         ;dword
sh_size         equ 14h         ;dword
sh_link         equ 18h         ;dword
sh_info         equ 1ch         ;dword
sh_align        equ 20h         ;dword
sh_entrysize    equ 24h         ;dword
  sizeof_section_header equ 28h

;program header
ph_type         equ 00h         ;dword
ph_offset       equ 04h         ;dword
ph_address      equ 08h         ;dword
ph_rawaddress   equ 0ch         ;dword
ph_filesize     equ 10h         ;dword
ph_memsize      equ 14h         ;dword
ph_flags        equ 18h         ;dword
ph_align        equ 1ch         ;dword
  sizeof_program_header equ 20h
