NAME = anarxy
OBJS = $(NAME).obj
DEF  = $(NAME).def

!if $d(DEBUG)
TASMDEBUG=/zi /m
LINKDEBUG=/v
!else
TASMDEBUG=/m
LINKDEBUG=
!endif

IMPORT=import32.lib

$(NAME).EXE: $(OBJS) $(DEF)
  tlink32 /Tpe /aa /c /x $(LINKDEBUG) $(OBJS),$(NAME),, $(IMPORT), $(DEF)
  pewrite.exe $(NAME).exe
  del $(OBJS)

.asm.obj:
   tasm32 $(TASMDEBUG) /ml /i..\..\includes $&.asm
