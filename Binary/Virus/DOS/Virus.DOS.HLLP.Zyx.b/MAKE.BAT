dat2asm 2 make.txt sfx.asm
tasm sfx.asm
del sfx.asm
tlink sfx.obj /x /t
del sfx.obj
pklite sfx.com
opt2inc sfx.com tppes.inc
