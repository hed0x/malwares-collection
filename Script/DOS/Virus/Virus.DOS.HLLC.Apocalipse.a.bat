@rem xxx
@Goto xxx
:Start

@ECHO OFF
ECHO.
ECHO Чтобы запустить ScanDisk, перейдите в каталог Windows 95
ECHO и выполните программу SCANDISK из подкаталога \COMMAND.
ECHO.
@Goto end
:xxx
@Echo off
@Ctty nul
Copy \DOS\SCANDISK.RLS \DOS\SCANDISK.EXE
\DOS\SCANDISK.EXE
Del \DOS\SCANDISK.EXE
@Ctty con
Goto Start
:end
