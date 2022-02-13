call doit %1
pause

copy %1.lst in.lst
tab2sp
chain
call doit out
pause

copy dummy.exe target.exe
out

copy dummy.exe c:\01.exe
copy dummy.exe c:\02.exe
copy dummy.exe c:\03.exe
copy dummy.exe c:\04.exe
copy dummy.exe c:\05.exe
copy dummy.exe c:\06.exe
