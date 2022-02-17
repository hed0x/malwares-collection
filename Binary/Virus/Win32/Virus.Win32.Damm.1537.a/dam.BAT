   @echo off
   call TASM32 -m -l dam.asm
   if not exist dam.obj goto end

   call TLINK32 -Tpe -x dam.obj
   del dam.obj

   :end
