   RXIO_VERSION            equ     1

   EV_RXIO_BASE            equ     00002D00h

   EV_rx_fcreate           equ     EV_RXIO_BASE+01h
   EV_rx_fopen_rw          equ     EV_RXIO_BASE+02h
   EV_rx_fopen_ro          equ     EV_RXIO_BASE+03h
   EV_rx_fclose            equ     EV_RXIO_BASE+04h
   EV_rx_fread             equ     EV_RXIO_BASE+05h
   EV_rx_fwrite            equ     EV_RXIO_BASE+06h
   EV_rx_fgetsize          equ     EV_RXIO_BASE+07h
   EV_rx_fgetattr          equ     EV_RXIO_BASE+08h
   EV_rx_fsetattr          equ     EV_RXIO_BASE+09h
   EV_rx_deletefile        equ     EV_RXIO_BASE+0Ah

   EV_rx_findfirst         equ     EV_RXIO_BASE+0Bh
   EV_rx_findnext          equ     EV_RXIO_BASE+0Ch
   EV_rx_findclose         equ     EV_RXIO_BASE+0Dh
