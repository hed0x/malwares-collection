   ;---[MAKEFILE]----------------------------------------------------------------

   NAME = lzd

   LINK = LINK

   ASM    = ml
   AFLAGS = -coff -DBLD_COFF -DIS_32 -W2 -c -Cx -Zm -DMASM6 -DDEBLEVEL=0
   ASMENV = ML
   LFLAGS = /VXD /NOD

   .asm.obj:
       set $(ASMENV)=$(AFLAGS)
           $(ASM) -Fo$*.obj $<

   all : $(NAME).VXD

   OBJS = lzd.obj

   lzd.obj: lzd.asm

   $(NAME).VxD: $(NAME).def $(OBJS)
           link @<<$(NAME).lnk
   $(LFLAGS)
   /OUT:$(NAME).VxD
   /MAP:$(NAME).map
   /DEF:$(NAME).def
   $(OBJS)
   <<

    @del *.exp>nul
    @del *.lib>nul
    @del *.map>nul
    @del *.obj>nul
   ;...
