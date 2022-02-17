   @tasm32 -m3 -ml thunder.asm
   @rem @tlink32 -Tpe -aa -c -x thunder,,,d:\langs\libs\import32.lib
   @tlink32 -Tpe -aa -c -x thunder,,,c:\import32.lib
   @p thunder.exe
   @del *.obj
