   R0IO_VERSION            equ     1

   EV_R0IO_BASE            equ     00000700h

   EV_r0_make_handle_rw    equ     EV_R0IO_BASE+01h
   EV_r0_make_handle_ro    equ     EV_R0IO_BASE+02h
   EV_r0_fcreate           equ     EV_R0IO_BASE+03h
   EV_r0_fopen_rw          equ     EV_R0IO_BASE+04h
   EV_r0_fopen_ro          equ     EV_R0IO_BASE+05h
   EV_r0_fclose            equ     EV_R0IO_BASE+06h
   EV_r0_fread             equ     EV_R0IO_BASE+07h
   EV_r0_fwrite            equ     EV_R0IO_BASE+08h
   EV_r0_fgetsize          equ     EV_R0IO_BASE+09h
   EV_r0_fgetattr          equ     EV_R0IO_BASE+0Ah
   EV_r0_fsetattr          equ     EV_R0IO_BASE+0Bh
   EV_r0_renamefile        equ     EV_R0IO_BASE+0Ch
   EV_r0_deletefile        equ     EV_R0IO_BASE+0Dh
   EV_r0_settime_by_name   equ     EV_R0IO_BASE+0Eh

   EV_r0_findfirst         equ     EV_R0IO_BASE+0Fh ; EDX=filename, EDI=ff_struc  : CF/eax, eax=handle
   EV_r0_findnext          equ     EV_R0IO_BASE+10h ; EBX=handle,   EDI=ff_struc  : CF/eax
   EV_r0_findclose         equ     EV_R0IO_BASE+11h ; EBX=handle
