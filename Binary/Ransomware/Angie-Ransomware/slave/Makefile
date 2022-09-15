CLFL_BUILD_release = /DRELEASE
CLFL_BUILD_debug   = /Z7 /DDEBUG /DDEBUG_LEVEL=3 /DDEBUG_C_ASSERT

CLFL_INCLUDE = /I$(PROJECT_PATH)/source/sdk/ /FI$(PROJECT_PATH)/source/sdk/stdafx.h
CLFL_BASE    = /nologo /Wall $(CLFL_INCLUDE) $(CLFL_BUILD_$(PROJECT_BUILD)) /J /Gr /GS:off /Qms0 /Qsafeseh- /Qcf-protection:none /Qfreestanding /KERNEL /DRIVER /LARGEADDRESSAWARE /DYNAMICBASE /NODEFAULTLIB
CLFL_CPU     = /arch:SSE2 /tune:generic /Qopt-prefetch /Qopt-prefetch:2
CLFL_OX      = /Qipo /Os /Ob2 /GF /GA /Zp16 /Qunroll8 /Qsfalign16 /Qfnalign8

LDFL_BUILD_release = /RELEASE
LDFL_BUILD_debug   = /DEBUG DlgClient3.0.lib

LDFL      = /MANIFEST:NO /DYNAMICBASE /SUBSYSTEM:WINDOWS /GUARD:NO /SAFESEH:NO /OPT:REF $(LDFL_BUILD_$(PROJECT_BUILD))
LDFLX64   = /NOLOGO /TIME /MACHINE:X64 /LIBPATH:"$(LIB_ICPP_X64)" /LIBPATH:"$(LIB_VCTOOLS_X64)" /LIBPATH:"$(LIB_UNMANAGED_X64)" /LIBPATH:"$(PROJECT_LIB_PATH)/x64"
LDFLX86   = /NOLOGO /TIME /MACHINE:X86 /LIBPATH:"$(LIB_ICPP_X86)" /LIBPATH:"$(LIB_VCTOOLS_X86)" /LIBPATH:"$(LIB_UNMANAGED_X86)" /LIBPATH:"$(PROJECT_LIB_PATH)/x86"

# 1   path
# 2   module name
# 3   makefile rule
# 4   additional define
define CompileModule
	$(info # Compiling "$(2)")
	@make -s --no-print-directory -C $(1)$(2) -f Makefile $(3) CLFL_ADDON="$(4)" CLFL_BASE="$(CLFL_BASE) /I$(PROJECT_PATH)/$(1)$(2)/include/" CLFL_CPU="$(CLFL_CPU)" CLFL_OX="$(CLFL_OX)"
endef

define LinkModule
	$(info # Linking "$(2)")
	@make -s --no-print-directory -C $(1)$(2) -f Makefile $(3) LDFL_ADDON="$(4)" LDFL="$(LDFL)"
endef

all: core decoy angie dropper link r

link:
	@"$(ICPP_LINKER_X86)" $(LDFL) $(LDFLX86) /ENTRY:InitialEntry KERNEL32.LIB WS2_32.LIB /MAP:$(PROJECT_BIN_PATH)/$(PROJECT_BUILD)/slave.map /PDB:$(PROJECT_BIN_PATH)/$(PROJECT_BUILD)/slave.pdb /OUT:$(PROJECT_BIN_PATH)/$(PROJECT_BUILD)/slave.exe \
	$(PROJECT_OBJECT_PATH)/core/*.obj \
	$(PROJECT_OBJECT_PATH)/core/ntapi/*.obj \
	$(PROJECT_OBJECT_PATH)/core/wsapi/*.obj \
	$(PROJECT_OBJECT_PATH)/decoy/*.obj

r:
	start cmd /c "$(PROJECT_BIN_PATH)/$(PROJECT_BUILD)/Slave.exe"

rx:
	start cmd /c dummyx86.exe

core:
	$(call CompileModule,source/,core,,)

core2:
	$(call CompileModule,source/,core,c2,)

decoy:
	$(call CompileModule,source/,decoy,,)

# dropper

dropper: cdropper ldropper

dropper32: cdropper32 ldropper32

dropper64: cdropper64 ldropper64

cdropper:
	$(call CompileModule,source/,dropper,cx64,)
	$(call CompileModule,source/,dropper,cx86,)

ldropper:
	$(call LinkModule,source/,dropper,lx64,)
	$(call LinkModule,source/,dropper,lx86,)
	
cdropper64:
	$(call CompileModule,source/,dropper,cx64,)

ldropper64:
	$(call LinkModule,source/,dropper,lx64,)
	
cdropper32:
	$(call CompileModule,source/,dropper,cx86,)

ldropper32:
	$(call LinkModule,source/,dropper,lx86,)

# angie

angie: cangie langie

angie32: cangie32 langie32

angie64: cangie64 langie64

cangie:
	$(call CompileModule,source/,angie,cx64,)
	$(call CompileModule,source/,angie,cx86,)

langie:
	$(call LinkModule,source/,angie,lx64,)
	$(call LinkModule,source/,angie,lx86,)
	
cangie64:
	$(call CompileModule,source/,angie,cx64,)

langie64:
	$(call LinkModule,source/,angie,lx64,)
	
cangie32:
	$(call CompileModule,source/,angie,cx86,)

langie32:
	$(call LinkModule,source/,angie,lx86,)
