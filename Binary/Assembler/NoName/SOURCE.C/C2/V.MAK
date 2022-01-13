
# V make file
#
v.exe : vmain.obj  vlib.obj  vdoslib.obj  v_dir.obj v_sctree.obj\
	vv.obj v_io.obj getvect.obj c0v.obj v_objs v.mak
 tlink @v_objs,v.exe,v.map, /s /v
#
.C.OBJ :
 bcc -mt -f- -N- -g5 -j5  -c -3 -v -y $<
#
c0v.obj : c0v.asm
 c:\masm\masm c0v.asm
#
VMAIN.OBJ :  v.h v_std.h vmain.c
vv.obj : v.h v_std.h vv.c
vlib.obj : v.h v_std.h vlib.c
vdoslib.obj : v.h v_std.h vdoslib.c
v_dir.obj : v.h v_std.h v_dir.c
v_sctree.obj : v.h v_std.h  v_sctree.c
v_io.obj : v.h v_std.h v_io.c
getvect.obj : v.h v_std.h