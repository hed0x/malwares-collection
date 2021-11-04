@echo off

echo 127.0.0.1   rad.msn.com           >> %WINDIR%\system32\drivers\etc\hosts
echo 127.0.0.1   rad.live.com          >> %WINDIR%\system32\drivers\etc\hosts
echo 127.0.0.1   ads1.msn.com          >> %WINDIR%\system32\drivers\etc\hosts
echo 127.0.0.1   adfarm.mediaplex.com  >> %WINDIR%\system32\drivers\etc\hosts

echo Les pubs de Microsoft sont maintenant bloquees !
echo Il vous suffit de redemarrez Windows Live Messenger.
pause
