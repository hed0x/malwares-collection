@echo off
::ctty nul
::@for %%c in (*.asm) do echo %0 %%c

@for %%c in (*.asm) do  tasm32 /ML /M9 %%c
pause

@for %%c in (*.obj) do  tlink32 -Tpe -c -x -aa %%c,,,import32,dllz

::@for %%c in (*.obj) do  tlink %%c

::@for %%fichier in (*.obj) do tlink %%fichier
