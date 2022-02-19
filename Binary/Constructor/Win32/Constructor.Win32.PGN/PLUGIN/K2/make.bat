@echo off
..\..\SYSTEM\HAXOR\haxor ..\..\SIGN\KEY\K2\public.rsa key2.inc /asm @keydata
call ..\maketasm k2 ver1 priority5
