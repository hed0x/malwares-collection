ml -coff -Cx -DMASM6 -DBLD_COFF -DIS_32 dynavxd.asm
link -vxd -def:dynavxd.def dynavxd.obj
cd..
copy vxd\dynavxd.vxd
