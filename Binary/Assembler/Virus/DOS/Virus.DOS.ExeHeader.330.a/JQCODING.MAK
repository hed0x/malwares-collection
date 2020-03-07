   #
   #JQCODING.MAK - Supertiny/fast Compression/Encryption library - lib. build
   #(c) 1998 by Jacky Qwerty/29A.
   #

   AFLAGS = /nologo /coff

   jqcoding.lib : jqencode.obj jqdecode.obj
     @if exist $@ del $@
     lib /nologo /out:$@ $**
