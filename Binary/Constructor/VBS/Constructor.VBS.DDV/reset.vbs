   Set fs=CreateObject("Scripting.FileSystemObject")
   Set dir1=fs.GetSpecialFolder(0)
   Set dir2=fs.GetSpecialFolder(1)
   Set so=CreateObject("Scripting.FileSystemObject")
   dim r
   Set r=CreateObject("Wscript.Shell")
   r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce\deltree.exe","start.exe /m deltree /y "&dir1&"\Win32system.vbs"
   r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce\deltree.exe","start.exe /m deltree /y "&dir2&"\Win32system.vbs"
   r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce\deltree.exe","start.exe /m deltree /y "&dir1&"\Start Menu\Programs\Æô¶¯\Win32system.vbs"
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun",0,"REG_DWORD"
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives",0,"REG_DWORD"
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools",0,"REG_DWORD"
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\Disabled",0,"REG_DWORD"
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoViewContextMenu",0,"REG_DWORD"
   r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSetFolders",0,"REG_DWORD"
   r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserContextMenu",0,"REG_DWORD"
   r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserOptions",0,"REG_DWORD"
   r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserSaveAs",0,"REG_DWORD"
   r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\Cache Internet",0,"REG_DWORD"
   r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\Connwiz Admin Lock",0,"REG_DWORD"
   r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel\SecurityTab",0,"REG_DWORD"
