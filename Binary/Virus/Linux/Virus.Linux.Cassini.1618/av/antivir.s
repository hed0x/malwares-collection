;ANTIVIRUS FOR STEALTH ELF INFECTOR
;(c) Vecna 2003

bits 32

%include "header.i"

%include "elf.i"
%include "syscall.i"
%include "useful.i"

%define jmps jmp short

%define dwo dword
%define wo  word
%define by  byte


_start:
	push dwo msg_intro
	call printstring

	call disinfect_dir
	
        push dwo [found]
	call printnumber
	push dwo msg_found
	call printstring

        push dwo [infected]
	call printnumber
	push dwo msg_infectednumber
	call printstring

        push dwo [clean]
	call printnumber
	push dwo msg_cleaned
	call printstring

	push by __NR_exit
	pop eax
	int 80h


unpack_code:
       pushad

	push dwo msg_unpacking
	call printstring

;       mov esi,packed_host
       mov eax,[esi]
       call malloc

       mov ecx,[esi]
       mov ebx,esi
       mov ebp,edi
       rep movsb
       
       mov esi,ebp
       mov edi,ebx

       call z_decode

       mov eax,[esi]
       not eax
       call malloc

       popad
       ret



malloc:
       pushad
       
        push dwo msg_free
	test eax,eax
        js .noprint
        push eax
	call printnumber
        mov dwo [esp],msg_alloc
  .noprint:
	call printstring

       push by __NR_brk
       pop eax
       sub ebx,ebx
       int 80h

       mov [esp+_Pushad_edi],eax
       add eax,[esp+_Pushad_eax]

       push by __NR_brk
       pop ebx
       xchg eax,ebx
       int 80h

       popad
       ret



%include "z_decode.i"


dir_entry    equ 0
filehnd      equ dir_entry+10ah
heap_memory  equ filehnd+4
statbuffer   equ heap_memory+4
stack_size   equ statbuffer+40h

disinfect_dir:
       pushad

	push dwo msg_scandir
	call printstring

       sub esp, stack_size
       
       call .dot
       db ".",0
  .dot:       
       pop ebx
       push by __NR_open
       pop eax
       cdq
       int 80h
					;open current dir
       test eax, eax
       jns .dir_ok
  .jmp2done:
       jmp .done
  .dir_ok:
       xchg eax, ebx

  .next_entry:
       push by __NR_readdir
       pop eax
       lea ecx, [esp+dir_entry]
       int 80h                                  ;read directory entry
       test eax, eax
       jz .jmp2done
       
       push ebx

       lea ebx, [esp+dir_entry+0ah+_Push]
       movzx eax, wo [esp+dir_entry+8h+_Push]
       sub edx, edx
       mov dwo [ebx+eax+1], edx               ;put 0 marker in filename

       push by __NR_stat
       pop eax
       lea ecx,[esp+statbuffer+_Push]
       int 80h					;file stat

       push by __NR_open
       pop eax
       push by 2
       pop ecx
       int 80h
					;open filename
       test eax, eax
       js near .search_next

	push ebx
	call printstring
	
	inc dwo [found]

       xchg eax, ebx
       mov [esp+filehnd+_Push], ebx

       mov ecx, [esp+statbuffer+8h+_Push]
       or cl, 0b6h
       push by __NR_fchmod
       pop eax
       int 80h					;set priviledges

       push by 0
       push ebx
       push by 1
       push by 3
       push dwo [esp+statbuffer+14h+_Push+(_Push*4)]
       push by 0
       mov ebx, esp
       push by __NR_mmap
       pop eax
       int 80h
					;map file
       add esp, by (6*_Push)
       cmp eax, 0fffff000h
       ja .closehandle
       xchg eax, ebx

	push dwo msg_mapped
	call printstring

       call disinfect
       
       push by __NR_munmap
       pop eax
       mov ecx,[esp+statbuffer+14h+_Push]
       int 80h
					;unmap
	push dwo msg_donemap
	call printstring


  .closehandle:
       push by __NR_close
       pop eax
       mov ebx,[esp+filehnd+_Push]
       int 80h                   ;close file

       lea ebx, [esp+dir_entry+0ah+_Push]
       mov ecx, [esp+statbuffer+8h+_Push]
       push by __NR_chmod
       pop eax
       int 80h					;restore priviledges

       push dwo [esp+statbuffer+28h+_Push]
       push dwo [esp+statbuffer+20h+_Push+_Push]
       mov ecx,esp
       push by __NR_utime
       pop eax
       int 80h					;restore access/mod time
       add esp, by (2*_Push)

  .search_next:
       pop ebx
       jmp .next_entry

  .done:
       add esp, stack_size
       popad
       ret


disinfect:
       pushad

       cmp dwo [ebx+eh_ident], 464c457fh
       jne .jne2exit
       cmp by [ebx+eh_ident+15], "!"
       jne .jne2exit
       cmp wo [ebx+eh_type],2			;ET_EXEC
       jne .jne2exit
       cmp wo [ebx+eh_machine],3		;EM_386
       jne .jne2exit
       cmp wo [ebx+eh_eh_size],sizeof_elf_header
  .jne2exit:
       jne near .exit

	push dwo msg_infected
	call printstring
	
	inc dwo [infected]

       mov esi, [ebx+eh_sh_offset]
       test esi,esi
       jz .je2exit
       add esi,ebx				;esi=section table

       movzx ebp, wo [ebx+eh_sh_str_index]
       test ebp,ebp
  .je2exit:
       jz near .exit
       imul ebp,ebp,sizeof_section_header
       mov ebp,[ebp+esi+sh_offset]		
       add ebp,ebx				;ebp=string table

       movzx edx,wo [ebx+eh_sh_count]
  .find_text:       
       mov eax,[esi+sh_name]
       mov cx,[eax+ebp+4]
       mov eax,[eax+ebp]
       xor eax,".tex"
       jnz .next
       xor cx, "t"
       jz .found_text
  .next:
       add esi,sizeof_section_header
       dec edx
       jns .find_text
       jmp .exit

  .found_text:
       mov edx,esi
       mov esi,[edx+sh_offset]
       add esi,ebx				;esi=section .text

       push esi

       add esi,[esi]
  .next666:
       inc esi
       cmp wo [esi],6861h
       jne .next666
       mov eax,[esi+2]
       cmp by [esi+6],0c3h
       jne .next666
       mov [ebx+eh_entrypoint],eax

	push dwo msg_entrypoint
	call printstring

       pop esi
       call unpack_code

       mov by [ebx+eh_ident+15], 0
	inc dwo [clean]

  .exit:       
       popad
       ret


       
printstring:
	pushad

	mov esi,[esp+8*4+4]
	sub edx,edx
  .count:
	lodsb
	test al,al
	jz .done
	inc edx
	jmps .count
  .done:

	push by __NR_write
	pop eax
	push by 1
	pop ebx
	mov ecx,[esp+8*4+4]
	int 80h
	
	popad
	ret 4
	

printnumber:	
	pushad

	mov eax,[esp+8*4+4]
	push by 10
	pop ecx
	push by -1
  .divide:
	sub edx,edx
	div ecx
	push edx
	test eax,eax
	jnz .divide
  .done:
        pop ecx
	inc ecx
	jecxz .doneprint
	add ecx,"0"-1

        push ecx
	push by __NR_write
	pop eax
	push by 1
	pop ebx
	push by 1
	pop edx
	mov ecx,esp
	int 80h
	pop ecx
	jmps .done
  .doneprint:
	popad
	ret 4


msg_intro db "ELFVIRUS Disinfector (c) 2002",10,10,0   
msg_alloc db " bytes allocated",10,0   
msg_free  db "memory free",10,0   
msg_scandir db "scanning directory...",10,0   
msg_infected db "file is infected!",10,0   
msg_mapped db " file mapped",10,0   
msg_entrypoint db "setting original entrypoint",10,0   
msg_unpacking db "unpacking .text...",10,0   
msg_donemap db "closing map",10,10,0   
msg_found   db " files found",10,0   
msg_infectednumber db " files infected",10,0   
msg_cleaned db " files cleaned",10,0   


infected dd 0
clean dd 0
found dd 0

   
filesize equ $-$$
memsize equ $-$$
