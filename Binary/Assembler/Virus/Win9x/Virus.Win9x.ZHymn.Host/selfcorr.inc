   SELFCORR_VERSION        equ     1

   EV_SELFCORR_BASE        equ     00002600h
   EV_SELFCORR_CSUM_GET_SIZE equ   EV_SELFCORR_BASE+01h    ; o: ECX=csum_size
   EV_SELFCORR_CSUM_CREATE equ     EV_SELFCORR_BASE+02h    ; i: ESI/ECX/EDI
   EV_SELFCORR_FIX_SUCCESS equ     EV_SELFCORR_BASE+03h    ; ECX=# bytes fixed
   EV_SELFCORR_FIX_ERROR   equ     EV_SELFCORR_BASE+04h    ; to do fuckup
   EV_SELFCORR_RUN         equ     EV_SELFCORR_BASE+05h    ;
