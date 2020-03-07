   ; - -[WGOLLUM.MAK - VxD makefile] - - - - - - - - - - - - - - - - - - - ->8

   # file: wgollum.mak (VxD makefile)
   all   : wgollum.exe

   vxdstub.obj: vxdstub.asm
       masm -Mx -p -w2 vxdstub;

   vxdstub.exe: vxdstub.obj
       link vxdstub.obj;

   wgollum.obj: wgollum.asm .\debug.inc .\vmm.inc .\shell.inc
           masm5 -p -w2 -Mx $(Debug) wgollum.asm;

   objs = wgollum.obj

   wgollum.386: vxdstub.exe wgollum.def $(objs)
           link386 @wgollum.lnk
           addhdr wgollum.386
           mapsym32 wgollum

   wgollum.exe: wgollum.386
           copy wgollum.386 wgollum.exe
