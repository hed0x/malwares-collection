@ctty nul

:: Batch Random Number Generator v2.3
:: by philet0ast3r [rRlf]
:: finished (version 1.0): 25.11.2002, 21:33:23
:: finished (version 2.0): 25.04.2003, 16:11:03
:: finished (version 2.3): 13.11.2003, 16:41:23
:: ...
:: this program generates a random 5 digit number with 774 Bytes of normal Batch
:: but it can without problem be expanded to generate more digits
:: with a little code-change, it can also generate random letters or other signs
:: thanks a lot to breathe for helping me get the idea, how this could work
:: ...
:: nearly one year after I made v1.0 of this I'm finally confident with my program
:: if someone is able to do the same thing with less than 774 Bytes, please mail me
:: (774 Bytes if you cut out these comments, of course)
:: ...
:: philet0ast3r@rRlf.de
:: www.rRlf.de

set a=a
goto r
:x
if %a%==d set a=e
if %a%==c set a=d
if %a%==b set a=c
if %a%==a set a=b
:r
ver|time|find ",1">nul
if not errorlevel 1 set r=1
ver|time|find ",2">nul
if not errorlevel 1 set r=2
ver|time|find ",3">nul
if not errorlevel 1 set r=3
ver|time|find ",4">nul
if not errorlevel 1 set r=4
ver|time|find ",5">nul
if not errorlevel 1 set r=5
ver|time|find ",6">nul
if not errorlevel 1 set r=6
ver|time|find ",7">nul
if not errorlevel 1 set r=7
ver|time|find ",8">nul
if not errorlevel 1 set r=8
ver|time|find ",9">nul
if not errorlevel 1 set r=9
ver|time|find ",0">nul
if not errorlevel 1 set r=0
echo>%r%
if exist %r% goto z
goto r
:z
del %r%
set r%a%=%r%
set r=
if not %a%==e goto x
ctty con
@echo %ra%%rb%%rc%%rd%%re%