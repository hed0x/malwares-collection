   Client_Reg_Struc        STRUC
   Client_EDI      DD      ?
   Client_ESI      DD      ?
   Client_EBP      DD      ?
   Client_res0     DD      ?
   Client_EBX      DD      ?
   Client_EDX      DD      ?
   Client_ECX      DD      ?
   Client_EAX      DD      ?
   Client_Error    DD      ?
   Client_EIP      DD      ?
   Client_CS       DW      ?
   Client_res1     DW      ?
   Client_EFlags   DD      ?
   Client_ESP      DD      ?
   Client_SS       DW      ?
   Client_res2     DW      ?
   Client_ES       DW      ?
   Client_res3     DW      ?
   Client_DS       DW      ?
   Client_res4     DW      ?
   Client_FS       DW      ?
   Client_res5     DW      ?
   Client_GS       DW      ?
   Client_res6     DW      ?
   Client_Alt_EIP  DD      ?
   Client_Alt_CS   DW      ?
   Client_res7     DW      ?
   Client_Alt_EFlags       DD      ?
   Client_Alt_ESP  DD      ?
   Client_Alt_SS   DW      ?
   Client_res8     DW      ?
   Client_Alt_ES   DW      ?
   Client_res9     DW      ?
   Client_Alt_DS   DW      ?
   Client_res10    DW      ?
   Client_Alt_FS   DW      ?
   Client_res11    DW      ?
   Client_Alt_GS   DW      ?
   Client_res12    DW      ?
   Client_Reg_Struc        ENDS

   Client_Word_Reg_Struc   STRUC
   Client_DI       DW      ?
   Client_res13    DW      ?
   Client_SI       DW      ?
   Client_res14    DW      ?
   Client_BP       DW      ?
   Client_res15    DW      ?
   Client_res16    DD      ?
   Client_BX       DW      ?
   Client_res17    DW      ?
   Client_DX       DW      ?
   Client_res18    DW      ?
   Client_CX       DW      ?
   Client_res19    DW      ?
   Client_AX       DW      ?
   Client_res20    DW      ?
   Client_res21    DD      ?
   Client_IP       DW      ?
   Client_res22    DW      ?
   Client_res23    DD      ?
   Client_Flags    DW      ?
   Client_res24    DW      ?
   Client_SP       DW      ?
   Client_res25    DW      ?
   Client_res26    DD      5 DUP (?)
   Client_Alt_IP   DW      ?
   Client_res27    DW      ?
   Client_res28    DD      ?
   Client_Alt_Flags        DW      ?
   Client_res29    DW      ?
   Client_Alt_SP   DW      ?
   Client_Word_Reg_Struc   ENDS

   Client_Byte_Reg_Struc   STRUC
   Client_res30    DD      4 DUP (?)
   Client_BL       DB      ?
   Client_BH       DB      ?
   Client_res31    DW      ?
   Client_DL       DB      ?
   Client_DH       DB      ?
   Client_res32    DW      ?
   Client_CL       DB      ?
   Client_CH       DB      ?
   Client_res33    DW      ?
   Client_AL       DB      ?
   Client_AH       DB      ?
   Client_Byte_Reg_Struc   ENDS

   CLIENT_STRUCT   union
   CRS             Client_Reg_Struc        ?
   CWRS            Client_Word_Reg_Struc   ?
   CBRS            Client_Byte_Reg_Struc   ?
   CLIENT_STRUCT   ends
