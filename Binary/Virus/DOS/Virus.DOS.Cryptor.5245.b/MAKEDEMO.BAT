   @echo off
   echo Compiling [$UPDû2.2] demo ...
   tasm $upddemo.asm /m
   tlink $upddemo.obj $upd22.obj, $upddemo.com /x /t
   del $upddemo.obj
