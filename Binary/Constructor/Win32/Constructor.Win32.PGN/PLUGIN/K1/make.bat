@echo off
..\..\SYSTEM\HAXOR\haxor ..\..\SIGN\KEY\K1\public.rsa key1.inc /asm @keydata
call ..\maketasm k1 ver1 priority5
