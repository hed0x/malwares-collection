@echo off
if %1.==. goto usage
rem %windir%\Microsoft.NET\Framework\v1.0.3705\csc %1.cs /debug- /incr- /checked- /o+
%windir%\Microsoft.NET\Framework\v1.1.4322\csc %1.cs /debug- /incr- /checked- /o+
goto end

:usage
echo.
echo Usage: MAKE filename
echo eg. MAKE CROISSNT

:end
echo.
