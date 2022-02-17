# Microsoft Developer Studio Generated NMAKE File, Based on MiniShellVentana.dsp
!IF "$(CFG)" == ""
CFG=MiniShellVentana - Win32 Release
!MESSAGE No configuration specified. Defaulting to MiniShellVentana - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "MiniShellVentana - Win32 Release"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "MiniShellVentana.mak" CFG="MiniShellVentana - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "MiniShellVentana - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
MTL=midl.exe
RSC=rc.exe
OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

ALL : "$(OUTDIR)\MiniShellVentana.exe"


CLEAN :
	-@erase "$(INTDIR)\MiniShell.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\MiniShellVentana.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\MiniShellVentana.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=ws2_32.lib MSVCRT.LIB kernel32.lib USER32.LIB /nologo /subsystem:windows /incremental:no /pdb:"$(OUTDIR)\MiniShellVentana.pdb" /machine:I386 /nodefaultlib /out:"$(OUTDIR)\MiniShellVentana.exe" /ALIGN:4096 
LINK32_OBJS= \
	"$(INTDIR)\MiniShell.obj"

"$(OUTDIR)\MiniShellVentana.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

CPP_PROJ=/nologo /ML /W4 /GX /O1 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /Fp"$(INTDIR)\MiniShellVentana.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 

!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("MiniShellVentana.dep")
!INCLUDE "MiniShellVentana.dep"
!ELSE 
!MESSAGE Warning: cannot find "MiniShellVentana.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "MiniShellVentana - Win32 Release"
SOURCE=.\MiniShell.cpp

"$(INTDIR)\MiniShell.obj" : $(SOURCE) "$(INTDIR)"



!ENDIF 

