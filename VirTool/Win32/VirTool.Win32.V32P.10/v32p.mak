#note: W32.LIB I created using IMPLIB of kernel32.dll, user32.dll, shell32.dll
NAME = v32p
OBJS = $(NAME).obj
DEF  = $(NAME).def

TASMDEBUG=
LINKDEBUG=

IMPORT=w32.lib call.lib

$(NAME).EXE: $(OBJS) $(DEF)
  tlink32 /Tpd /aa /c $(OBJS),$(NAME),, $(IMPORT), $(DEF)

.asm.obj:
   tasm32 /m /ml $&.asm
