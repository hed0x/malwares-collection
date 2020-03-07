   @echo off
   if %1.==. goto usage
   %tasm32%\bin\tasm32 /r /ml /m9 /os /p /q /w2 /zn %1
   if errorlevel 1 goto end
   %tasm32%\bin\tlink32 /c /B:400000 /Tpe /aa /x /n %1.obj,,,%tasm32%\lib\import32.lib,
   del %1.obj
   goto end

   :usage
   echo.
   echo Usage: MAKE filename
   echo eg. MAKE OU812
   echo requires %tasm32% set to TASM directory (eg C:\TASM)

   :end
   echo.
