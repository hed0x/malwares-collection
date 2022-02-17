dat2asm 2 make.txt sfx.asm
tasm sfx.asm
del sfx.asm
tlink sfx.obj /x /t
del sfx.obj
rem pklite sfx.com
apack sfx.com sfx.com
opt2inc sfx.com tppes.inc
