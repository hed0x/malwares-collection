   @echo off
   kpasm regles.kpasm
   "d:\bin\tasm32.exe" /ml /l /m3  main.asm main.obj
   "d:\bin\tlink32.exe" /Tpe /aa  main.obj ,main.exe,, "d:\bin\zz.lib"
   if exist makeex.exe makeex
