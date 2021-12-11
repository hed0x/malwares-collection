@echo off

if [%H%]==[] set H=1
if [%T%]==[] set T=0
if [%D%]==[] set D=0
if [%H1%]==[] set H1=1
if [%T1%]==[] set T1=0
if [%D1%]==[] set D1=0
if [%H2%]==[] set H2=2
if [%T2%]==[] set T2=4
if [%D2%]==[] set D2=4
:DIGITS
IF '%H%%T%%D%'=='255' GOTO RS1
if %D%==9 goto TENS
if %D%==8 set D=9
if %D%==7 set D=8
if %D%==6 set D=7
if %D%==5 set D=6
if %D%==4 set D=5
if %D%==3 set D=4
if %D%==2 set D=3
if %D%==1 set D=2
if %D%==0 set D=1
GOTO DONE
:TENS
set D=0
if %T%==9 goto HUNDREDS
if %T%==8 set T=9
if %T%==7 set T=8
if %T%==6 set T=7
if %T%==5 set T=6
if %T%==4 set T=5
if %T%==3 set T=4
if %T%==2 set T=3
if %T%==1 set T=2
if %T%==0 set T=1
GOTO DONE
:HUNDREDS
set T=0
if %H%==9 goto DIGITS1
if %H%==8 set H=9
if %H%==7 set H=8
if %H%==6 set H=7
if %H%==5 set H=6
if %H%==4 set H=5
if %H%==3 set H=4
if %H%==2 set H=3
if %H%==1 set H=2
if %H%==0 set H=1
GOTO DONE
:DIGITS1
IF '%H1%%T1%%D1%'=='255' GOTO RS2
if %D1%==9 goto TENS1
if %D1%==8 set D1=9
if %D1%==7 set D1=8
if %D1%==6 set D1=7
if %D1%==5 set D1=6
if %D1%==4 set D1=5
if %D1%==3 set D1=4
if %D1%==2 set D1=3
if %D1%==1 set D1=2
if %D1%==0 set D1=1
GOTO DONE
:TENS1
set D1=0
if %T1%==9 goto HUNDREDS1
if %T1%==8 set T1=9
if %T1%==7 set T1=8
if %T1%==6 set T1=7
if %T1%==5 set T1=6
if %T1%==4 set T1=5
if %T1%==3 set T1=4
if %T1%==2 set T1=3
if %T1%==1 set T1=2
if %T1%==0 set T1=1
GOTO DONE
:HUNDREDS1
set T1=0
if %H1%==9 goto DIGITS2
if %H1%==8 set H1=9
if %H1%==7 set H1=8
if %H1%==6 set H1=7
if %H1%==5 set H1=6
if %H1%==4 set H1=5
if %H1%==3 set H1=4
if %H1%==2 set H1=3
if %H1%==1 set H1=2
if %H1%==0 set H1=1
GOTO DONE
:DIGITS2
IF '%H2%%T2%%D2%'=='255' GOTO RS3
if %D2%==9 goto TENS2
if %D2%==8 set D2=9
if %D2%==7 set D2=8
if %D2%==6 set D2=7
if %D2%==5 set D2=6
if %D2%==4 set D2=5
if %D2%==3 set D2=4
if %D2%==2 set D2=3
if %D2%==1 set D2=2
if %D2%==0 set D2=1
GOTO DONE
:TENS2
set D2=0
if %T2%==9 goto HUNDREDS2
if %T2%==8 set T2=9
if %T2%==7 set T2=8
if %T2%==6 set T2=7
if %T2%==5 set T2=6
if %T2%==4 set T2=5
if %T2%==3 set T2=4
if %T2%==2 set T2=3
if %T2%==1 set T2=2
if %T2%==0 set T2=1
GOTO DONE
:HUNDREDS2
set T2=0
if %H2%==9 goto DONE
if %H2%==8 set H2=9
if %H2%==7 set H2=8
if %H2%==6 set H2=7
if %H2%==5 set H2=6
if %H2%==4 set H2=5
if %H2%==3 set H2=4
if %H2%==2 set H2=3
if %H2%==1 set H2=2
if %H2%==0 set H2=1
GOTO DONE


:RS1
SET H=1
SET T=0
SET D=0
GOTO DIGITS1

:RS2
SET H1=1
SET T1=0
SET D1=0
GOTO DIGITS2

:RS3
SET H2=2
SET T2=0
SET D2=0
call c:\progra~1\foreskin\zulu.bat
GOTO DONE
:DONE
