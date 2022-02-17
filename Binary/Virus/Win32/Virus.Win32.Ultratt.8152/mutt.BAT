   tasm32 -ml -m -l mutt.asm
   tlink32 -Tpe -c -aa mutt.obj,,, import32.lib
   pewrsec mutt.exe
