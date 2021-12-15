olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./HEUR-Trojan.MSOffice.Stratos.gen
Type: OpenXML
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: word/vbaProject.bin - OLE stream: 'VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()

MsgBox (Date)
Dim exec As String
exec = "powershell.exe Add-Content -path 'c:\users\public\testFile.txt' -value 'it is just a benign string' "
Shell (exec)
End Sub

Private Sub CommandButton11_Click()

End Sub

Private Sub CommandButton2_Click()
Dim p As Paragraph

For Each p In ActiveDocument.Paragraphs
  x = p.Range.Text
Next p
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|powershell          |May run PowerShell commands                  |
|Suspicious|exec                |May run an executable file or a system       |
|          |                    |command using Excel 4 Macros (XLM/XLF)       |
|IOC       |powershell.exe      |Executable file name                         |
+----------+--------------------+---------------------------------------------+

