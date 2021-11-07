   #   Marburg makefile

   #   make -B            Will build wap32.exe
   #   make -B -DDEBUG    Will build the debug version of wap32.exe

   NAME = WAP32
   OBJS = $(NAME).obj
   ASMS = $(NAME).asm

   !if $d(DEBUG)
   TASMPARAM= /ml /m5 /la /zi
   TLINKPARAM= -Tpe -c -s -v -ap
   !else
   TASMPARAM= /ml /m5 /q /zn
   TLINKPARAM= -Tpe -c -x -ap
   !endif

   !if $d(MAKEDIR)
   IMPORT=$(MAKEDIR)\..\lib\import32
   !else
   IMPORT=import32
   !endif


   $(NAME).EXE: $(OBJS) $(DEF)
     tlink32 $(TLINKPARAM) $(OBJS),$(NAME),, $(IMPORT)

   .asm.obj:
      tasm32 $(TASMPARAM) $(ASMS)
