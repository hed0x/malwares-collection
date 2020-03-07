   ml /c /coff /Cp speedy.asm
   link /SUBSYSTEM:WINDOWS /LIBPATH:c:\masm\lib speedy.obj
   del speedy.obj

   ml /c /coff /Cp resident.asm
   link /SUBSYSTEM:WINDOWS /LIBPATH:c:\masm\lib resident.obj
   del resident.obj
