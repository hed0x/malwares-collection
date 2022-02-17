C:\masm32\bin\ml /ID:\98DDK\inc\win98\ -coff -c -Cx  -DMASM6 -DBLD_COFF -DIS_32 9xrx.asm
C:\masm32\bin\link /IGNORE:4078 -vxd -def:9xrx.def /IGNORE:4039 9xrx.obj
pause