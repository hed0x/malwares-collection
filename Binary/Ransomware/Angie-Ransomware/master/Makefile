CLFL_BUILD_release = /DRELEASE
CLFL_BUILD_debug   = /Z7 /DDEBUG /DDEBUG_LEVEL=3 /DDEBUG_C_ASSERT

CLFL_INCLUDE = /I$(PROJECT_PATH)/source/sdk /FI$(PROJECT_PATH)/source/sdk/stdafx.h
CLFL_BASE    = /Wall $(CLFL_INCLUDE) $(CLFL_BUILD_$(PROJECT_BUILD)) /J /Gr /GS:off /Qms0 /Qsafeseh- /Qcf-protection:none /Qfreestanding /DRIVER /KERNEL  /LARGEADDRESSAWARE /DYNAMICBASE /NODEFAULTLIB
CLFL_CPU     = /arch:SSE2 /tune:generic /Qopt-prefetch /Qopt-prefetch:2
CLFL_OX      = /Qipo /Os /Ob2 /GF /GA /Zp16 /Qunroll8 /Qsfalign16 /Qfnalign8
CC           = @icl.exe /nologo

LDFL_BUILD_release = /RELEASE
LDFL_BUILD_debug   = /DEBUG

LDFL = /MACHINE:X86 /MANIFEST:NO /DYNAMICBASE /SUBSYSTEM:CONSOLE /GUARD:NO /SAFESEH:NO /OPT:REF /ENTRY:Entry $(LDFL_BUILD_$(PROJECT_BUILD)) KERNEL32.LIB WS2_32.LIB BCRYPT.LIB
LD   = @xilink.exe /NOLOGO /TIME /LIBPATH:"$(PROJECT_LIB_PATH)/"

# 1   path
# 2   module name
# 3   makefile rule
# 4   additional define
define CompileModule
	$(info # Compiling "$(2)")
	@make -s -j --no-print-directory -C $(1)$(2) -f Makefile $(3) CLFL_ADDON="$(4)" CC="$(CC)" CLFL_BASE="$(CLFL_BASE) /I$(PROJECT_PATH)/$(1)$(2)/include" CLFL_CPU="$(CLFL_CPU)" CLFL_OX="$(CLFL_OX)"
endef

all: rtlp core link r

rtlp:
	$(call CompileModule,source/,rtlp,,)

core:
	$(call CompileModule,source/,core,,)

link:
	$(LD) /NOLOGO /TIME $(LDFL) /MAP:$(PROJECT_BIN_PATH)/$(PROJECT_BUILD)/Master.map /PDB:$(PROJECT_BIN_PATH)/$(PROJECT_BUILD)/Master.pdb /OUT:$(PROJECT_BIN_PATH)/$(PROJECT_BUILD)/Master.exe \
	$(PROJECT_OBJECT_PATH)/rtlp/*.obj \
	$(PROJECT_OBJECT_PATH)/core/*.obj

r:
	"$(PROJECT_BIN_PATH)/$(PROJECT_BUILD)/Master.exe"
