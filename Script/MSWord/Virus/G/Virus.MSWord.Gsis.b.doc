   Attribute VB_Name = "fs"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves the active document or template"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.fs.MAIN"
   Dim f$
   WordBasic.FileSave
   f$ = WordBasic.[FileName$]()
   WordBasic.FileSaveAs Name:=f$, Format:=1, AddToMru:=0
   WordBasic.MacroCopy "Global:FileSaveAs", f$ + ":fsa"
   WordBasic.MacroCopy "Global:FileSave", f$ + ":fs"
   WordBasic.MacroCopy "Global:ao", f$ + ":AutoOpen"
   WordBasic.FileSave
   End Sub
