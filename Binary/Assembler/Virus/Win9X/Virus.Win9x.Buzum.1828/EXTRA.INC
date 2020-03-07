   ;Data from VMM.INC

   Pushad_Struc    STRUC
   Pushad_EDI  DD  ?
   Pushad_ESI  DD  ?
   Pushad_EBP  DD  ?
   Pushad_ESP  DD  ?
   Pushad_EBX  DD  ?
   Pushad_EDX  DD  ?
   Pushad_ECX  DD  ?
   Pushad_EAX  DD  ?
   Pushad_Struc    ENDS

   LDRSRV_COPY_EXTENDED_MEMORY EQU 6
   LDRSRV_COPY_INIT    EQU 1
   LDRSRV_COPY_LOCKED  EQU 2
