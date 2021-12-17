@ECHO OFF
@date /t>C:\time.txt
date 1985-09-18
ping 127.0.0.1
ping 127.0.0.1
ping 127.0.0.1
ping 127.0.0.1
ping 127.0.0.1
ping 127.0.0.1

call setup.exe

@date <C:\time.txt 
ping 127.0.0.1
del setup.vbs;setup.exe
