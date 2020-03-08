   Attribute VB_Name = "Game"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "NEW-MACRO-GAME"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Game.MAIN"
   Dim num
   Dim ans
   Dim L
   'check
   On Error Resume Next
   WordBasic.DisableInput 1
   WordBasic.BeginDialog 250, 250, " ? ? ? ? ? ? ?"
       WordBasic.PushButton 11, 6, 47, 21, "1", "Push1"
       WordBasic.PushButton 71, 7, 47, 21, "2", "Push4"
       WordBasic.PushButton 129, 6, 47, 21, "3", "Push7"
       WordBasic.PushButton 129, 37, 47, 21, "4", "Push8"
       WordBasic.PushButton 130, 66, 47, 21, "5", "Push9"
       WordBasic.PushButton 188, 6, 47, 21, "6", "Push10"
       WordBasic.PushButton 71, 36, 47, 21, "7", "Push5"
       WordBasic.PushButton 71, 66, 47, 21, "8", "Push6"
       WordBasic.PushButton 10, 36, 47, 21, "9", "Push2"
       WordBasic.PushButton 9, 66, 49, 21, "0", "Push3"
       WordBasic.Text 12, 94, 218, 13, "?????????????", "Text1"
       WordBasic.Text 12, 113, 142, 13, "?????????", "Text2"
       WordBasic.Text 12, 132, 149, 13, "??????????", "Text3"
       WordBasic.Text 12, 151, 122, 13, "???????", "Text4"
       WordBasic.Text 12, 170, 174, 13, "??????????", "Text5"
       WordBasic.OKButton 9, 191, 105, 21
       WordBasic.TextBox 10, 220, 160, 18, "TextBox2"
   WordBasic.EndDialog
   Dim gdh As Object: Set gdh = WordBasic.CurValues.UserDialog

   mgame:
   num = WordBasic.Int(Rnd() * 10) + 1
   ans = WordBasic.Dialog.UserDialog(gdh)
   If gdh.textbox2 = "gdh's new macro game-1" Then GoTo exit_
   If ans = num Then
   WordBasic.Beep
   WordBasic.Beep
   WordBasic.Beep
   WordBasic.Beep
   WordBasic.MsgBox " ? ? ? !! ? ? ?!!", " ? ? ? ? ? ? ? "

   WordBasic.Beep
   WordBasic.FileNewDefault
   WordBasic.DocMaximize 1
   WordBasic.CenterPara
   WordBasic.FormatFont Points:=32, Bold:=1, Underline:=1, Color:=1
   WordBasic.CenterPara
   WordBasic.Insert " ? ? ? ? ? ? ? !! ? ? !! ? ? ? ? ? ? ? ? ? ? !!  "
   WordBasic.DocClose 1


   GoTo exit_
   End If

   For L = 1 To 10
   WordBasic.Beep
   WordBasic.FileNewDefault
   If WordBasic.DocMaximize() <> 0 Then WordBasic.DocRestore
   WordBasic.CenterPara
   WordBasic.FormatFont Points:=64, Bold:=1, Underline:=1, Color:=2
   WordBasic.Insert " ? ? ? ? ? ? ? !! "
   Next L
   GoTo mgame
   'End If

   exit_:
   End Sub
