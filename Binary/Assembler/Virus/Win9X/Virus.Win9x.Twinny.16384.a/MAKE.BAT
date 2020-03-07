   @echo off
   set tasmdir=x:\tasm\win\
   %tasmdir%tasm32.exe /c /ml /m /z z0mbie2.asm
   if not exist z0mbie2.obj goto error
   %tasmdir%tlink32.exe -o -Tpe -c -x z0mbie2.obj,,,%tasmdir%import32.lib
   del z0mbie2.obj
   if not exist z0mbie2.exe goto error
   echo - compiled
   goto exit
   :error
   echo - error
   :exit
   set tasmdir=
