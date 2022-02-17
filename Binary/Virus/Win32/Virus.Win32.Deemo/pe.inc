pe_signature   equ 00h
pe_numObjects  equ 06h
pe_timedate    equ 08h
pe_NThsize     equ 14h
pe_flags       equ 16h
pe_attributes  equ 24h
pe_RVA         equ 28h
pe_imagebase   equ 34h
pe_vAligment   equ 38h
pe_pAligment   equ 3ch
pe_osVersion   equ 40h
pe_userVersion equ 44h
pe_ntVersion   equ 48h


pe_imagesize   equ 50h
pe_headersize  equ 54h
pe_crc	       equ 58h
pe_dllFlags    equ 5eh

pe_adrExport   equ 78h
pe_adrImport   equ 80h
pe_adrRes      equ 88h
pe_adrReloc    equ 0a0h
pe_adrDebug    equ 0a8h


pe_Obj_name    equ 00h
pe_Obj_vSize   equ 08h
pe_Obj_pSize   equ 10h
pe_Obj_pOffset equ 14h
pe_Obj_vOffset equ 0ch
pe_Obj_flags   equ 24h

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~############################################################################~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

mz_signature	equ 00h
mz_partPage	equ 02h
mz_pageCnt	equ 04h
mz_peloCnt	equ 06h
mz_HdrSize	equ 08h
mz_minMem	equ 0ah
mz_maxMem	equ 0ch
mz_reloSS	equ 0eh
mz_exeSP	equ 10h
mz_crc		equ 12h
mz_exeIP	equ 14h
mz_reloCS	equ 16h
mz_tablOff	equ 18h
mz_overlay	equ 1ah
mz_oemInfo	equ 20h
mz_peOffset	equ 3ch
