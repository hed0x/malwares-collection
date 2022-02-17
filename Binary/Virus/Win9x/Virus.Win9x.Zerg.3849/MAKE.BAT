   @echo off
   echo:
   if '%1'=='' goto usage
   echo Making [%1] ...
   if not exist %1.asm goto asm_error
   echo:

   if exist %1.obj del %1.obj
   tasm /m /ml /q /i..\inc %1
   if not exist %1.obj goto obj_error

   if '%1'=='ZVSK' goto com_link
   if '%1'=='zvsk' goto com_link
   if '%1'=='Zvsk' goto com_link

   :pexe_link
   if exist ..\bin\%1.exe del ..\bin\%1.exe
   tlink32 -Tpe -c -x -ap %1, ..\bin\%1.exe
   del %1.obj
   if not exist ..\bin\%1.exe goto com_exe_error
   goto make_done

   :com_link
   if exist ..\bin\%1.com del ..\bin\%1.com
   tlink /t /x /3 %1, ..\bin\%1.com
   del %1.obj
   if not exist ..\bin\%1.com goto com_exe_error
   goto make_done

   :asm_error
   echo:
   echo sorry! [%1.asm] not found...
   goto end

   :obj_error
   echo:
   echo oh! shit... I can't assembly [%1.asm], maybe syntax error?
   goto end

   :com_exe_error
   echo:
   echo oh! What a God Damn Shit! I can't link [%1.obj], maybe something wrong?
   goto end

   :make_done
   echo:
   echo Yeah! It's ok! Make [%1] Done.
   echo Output [%1] Executable File on ..\bin, Bye! ^_^
   goto end

   :usage
   echo Usage: MAKE [Program Name]
   echo        The Program Name could be one of Zerg and ZVSK and Remove
   echo:
   echo Example: MAKE Zerg         (make Zerg virus)
   echo          MAKE ZVSK         (make Zerg Virus Scanner and Killer)
   echo          MAKE Remove       (make Remove zerg virus from memory program)

   :end
   echo:
