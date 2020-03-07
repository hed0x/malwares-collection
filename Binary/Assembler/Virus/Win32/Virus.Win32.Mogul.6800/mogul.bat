   @echo off
   tasm32  /ml /m3 mogul.asm,,;
   tlink32 /Tpe /aa /c /v mogul.obj,mogul.scr,, import32.lib,,
   pewrsec mogul.scr
   del mogul.lst
   del mogul.obj
   del mogul.map
   del mogul.bak
