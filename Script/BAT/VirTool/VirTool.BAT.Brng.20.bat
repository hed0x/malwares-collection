@echo off

:: Batch Random Number Generator v2.0
:: by philet0ast3r [rRlf]
:: finished (version 1.0): 25.11.2002, 21:33:23
:: finished (version 2.0): 25.04.2003, 16:11:03
:: ...
:: this program generates a random 5 digit number,
:: but it can without problem be expanded to generate more digits
:: with a little code-change, it can also generate random letters or other signs
:: thanks a lot to breathe for helping me get the idea, how this could work
:: ...
:: philet0ast3r@rRlf.de
:: www.rRlf.de

:r
ver|time|find ",1">nul
if not errorlevel 1 goto 1
ver|time|find ",2">nul
if not errorlevel 1 goto 2
ver|time|find ",3">nul
if not errorlevel 1 goto 3
ver|time|find ",4">nul
if not errorlevel 1 goto 4
ver|time|find ",5">nul
if not errorlevel 1 goto 5
ver|time|find ",6">nul
if not errorlevel 1 goto 6
ver|time|find ",7">nul
if not errorlevel 1 goto 7
ver|time|find ",8">nul
if not errorlevel 1 goto 8
ver|time|find ",9">nul
if not errorlevel 1 goto 9
ver|time|find ",0">nul
if not errorlevel 1 goto 0
goto r

:0
set r=0
goto a
:9
set r=9
goto a
:8
set r=8
goto a
:7
set r=7
goto a
:6
set r=6
goto a
:5
set r=5
goto a
:4
set r=4
goto a
:3
set r=3
goto a
:2
set r=2
goto a
:1
set r=1

:a
if not exist b.rr goto b
if not exist c.rr goto c
if not exist d.rr goto d
if not exist e.rr goto e
goto f

:b
set random1=%r%
set r=
echo.>b.rR
goto r

:c
set random2=%r%
set r=
echo.>c.rR
goto r

:d
set random3=%r%
set r=
echo.>d.rR
goto r

:e
set random4=%r%
set r=
echo.>e.rR
goto r

:f
set random5=%r%
del *.rR

:end
echo %random1%%random2%%random3%%random4%%random5%