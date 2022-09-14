
c:
	$(ICPP_COMPILER_X86) $(CLFL_BASE) $(CLFL_CPU) $(CLFL_OX) $(CLFL_ADDON) /c source/*.c         /Fo:$(PROJECT_OBJECT_PATH)/core/
	$(ICPP_COMPILER_X86) $(CLFL_BASE) $(CLFL_CPU) $(CLFL_OX) $(CLFL_ADDON) /c source/ntapi/*.c   /Fo:$(PROJECT_OBJECT_PATH)/core/ntapi/
	$(ICPP_COMPILER_X86) $(CLFL_BASE) $(CLFL_CPU) $(CLFL_OX) $(CLFL_ADDON) /c source/wsapi/*.c   /Fo:$(PROJECT_OBJECT_PATH)/core/wsapi/
	nasm -f win32 source/fastcall.asm -o $(PROJECT_OBJECT_PATH)/core/fastcall.obj


# Not gonna build the whole core just because i changed dropper or angie
c2:
	$(ICPP_COMPILER_X86) $(CLFL_BASE) $(CLFL_CPU) $(CLFL_OX) $(CLFL_ADDON) /c source/dropper.c /Fo:$(PROJECT_OBJECT_PATH)/core/dropper.obj
