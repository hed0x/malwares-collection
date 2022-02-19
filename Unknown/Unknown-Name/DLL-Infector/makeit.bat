   tasm32.exe /ml /m5 /zn hiddensun.asm
   tlink32.exe /aa /Tpe /x /c hiddensun.obj,,,import32.lib
   sectionwrite
