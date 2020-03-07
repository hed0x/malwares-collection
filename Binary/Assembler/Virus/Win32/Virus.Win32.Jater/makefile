   #       make                    Will build pemangle.exe
   #       make -B -DDEBUG         Will build the debug version of pemangle.exe

   NAME = joss
   OBJS = $(NAME).obj
   DEF  = $(NAME).def

   !if $d(DEBUG)
   TASMDEBUG=/zi /m
   LINKDEBUG=/v
   !else
   TASMDEBUG=/m
   LINKDEBUG=
   !endif

   !if $d(MAKEDIR)
   IMPORT=import32.lib          # Edit this to point your own library path
   !else
   IMPORT=import32.lib                # or put the file in the same directory
   !endif

   $(NAME).EXE: $(OBJS) $(DEF)
     tlink32 /Tpe /aa /c /x $(LINKDEBUG) $(OBJS),$(NAME),, $(IMPORT), $(DEF)
     pewrite.exe $(NAME).exe
     del $(OBJS)

   .asm.obj:
      tasm32 $(TASMDEBUG) /ml /i..\..\includes $&.asm
