   ; DPGNDAT
   ; ~~~~~~~
   ; - "delayed" code container
   ; - rsa key for "delayed code" container

   include                 plugin.inc
                           PLUGIN_START    DPGNDAT, CODE32, NON_PERMUTABLE

   handleevent:            hookevent EV_DPGNDAT_GETDATA, getdata
                           stc
                           retn

   ; input: EDI=data ptr

   getdata:                pusha

                           call    getdataptr

                           cld
                           rep     movsb

                           popa
                           clc
                           retn

   include                 dpgndat1.inc

                           PLUGIN_END
