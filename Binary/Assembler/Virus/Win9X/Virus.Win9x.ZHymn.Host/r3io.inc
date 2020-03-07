   R3IO_VERSION            equ     1

   EV_R3IO_BASE            equ     00000D00h

   EV_r3_fcreate           equ     EV_R3IO_BASE+01h ; EDX=fname   : EAX=handle
   EV_r3_fopen_ro          equ     EV_R3IO_BASE+02h ; EDX=fname   : EAX=handle
   EV_r3_fopen_rw          equ     EV_R3IO_BASE+03h ; EDX=fname   : EAX=handle
   EV_r3_fclose            equ     EV_R3IO_BASE+04h ; EBX=handle
   EV_r3_fseek             equ     EV_R3IO_BASE+05h ; EBX=handle, EDX=newpos            : EAX=new pos
   EV_r3_fread             equ     EV_R3IO_BASE+06h ; EBX=handle, EDX=buffer, ECX=size  : EAX=bytesread
   EV_r3_fwrite            equ     EV_R3IO_BASE+07h ; EBX,EDX,ECX : EAX=byteswritten
   EV_r3_fsetattr          equ     EV_R3IO_BASE+08h ; EBX,ECX
   EV_r3_fgetattr          equ     EV_R3IO_BASE+09h ; EBX          : ECX
   EV_r3_fgetsize          equ     EV_R3IO_BASE+0Ah ; EBX          : EAX
   EV_r3_fseekend          equ     EV_R3IO_BASE+0Bh ; EBX
   EV_r3_deletefile        equ     EV_R3IO_BASE+0Ch ; EDX=filename

   EV_r3_findfirst         equ     EV_R3IO_BASE+0Dh ; EDX=filename, EDI=ff_struc  : CF/eax, eax=handle
   EV_r3_findnext          equ     EV_R3IO_BASE+0Eh ; EBX=handle,   EDI=ff_struc  : CF/eax
   EV_r3_findclose         equ     EV_R3IO_BASE+0Fh ; EBX=handle
