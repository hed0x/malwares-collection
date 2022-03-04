;Main offsets in PE and MZ structures headers

;

pe			struc

			pe_sign			dd	?; 00h
			pe_machine	        dw 	?; 04h
			pe_objcnt      		dw	?; 06h
			pe_timedate             dd	?; 08h
			pe_symbolPtr		dd	?; 0Ch
			pe_symbolCnt		dd	?; 10h

			pe_NThsize              dw	?; 14h
			pe_flags                dw	?; 16h
			pe_magic                dw	?; 18h
			pe_linkerVer		dw	?; 1Ah

			pe_codeSize             dd	?; 1Ch
			pe_initdatasize		dd	?; 20h
			pe_uninitdatasize	dd	?; 24h
			pe_RVA                  dd	?; 28h
			pe_codeRVA              dd	?; 2Ch
			pe_dataRVA              dd	?; 30h
			pe_imagebase            dd	?; 34h
			pe_vAligment            dd      ?; 38h
			pe_pAligment            dd      ?; 3Ch
			pe_osVer	        dd	?; 40h
			pe_userVer          	dd	?; 44h
			pe_subsysVer          	dd	?; 48h

			pe_rsrvd1          	dd	?; 4Ch

			pe_imagesize            dd	?; 50h
			pe_headersize           dd	?; 54h
			pe_checksum             dd	?; 58h
			pe_sybsystem		dw	?; 5Ch
			pe_dllFlags             dw	?; 5Eh

			pe_stackReserveSize	dd	?; 60h
			pe_stackCommitSize	dd	?; 64h

			pe_heapReserveSize	dd	?; 68h
			pe_heapCommitSize	dd	?; 6Ah

			pe_loaderFlags		dd	?; 70h
			pe_RVAnSizesNum		dd	?; 74h

			pe_exportRVA            dd	?; 78h
			pe_exportSize           dd	?; 7Ch

			pe_importRVA            dd	?; 80h
			pe_importSize           dd	?; 84h

			pe_rsrcRVA              dd	?; 88h
			pe_rsrcSize             dd	?; 8Ch

			pe_exceptRVA            dd	?; 90h
			pe_exceptSize           dd	?; 94h

			pe_securityRVA          dd	?; 98h
			pe_securitySize         dd	?; 9Ch

			pe_fixupRVA             dd	?; A0h
			pe_fixupSize            dd	?; A4h

			pe_debugRVA             dd	?; A8h
			pe_debugSize            dd	?; ACh

			pe_idescrRVA		dd	?; B0h
			pe_idescrSize		dd	?; B4h

			pe_machineRVA		dd	?; B8h
			pe_machineSize		dd	?; BCh

			pe_tlsRVA              	dd	?; C0h
			pe_tlsSize     		dd	?; C4h

			pe_loadconfigRVA      	dd	?; C8h
			pe_loadconfigSize  	dd	?; CCh

			pe_boundimportRVA      	dd	?; D0h
			pe_boundimportSize  	dd	?; D4h

			pe_iatRVA      		dd	?; D8h
			pe_iatSize	  	dd	?; DCh

			pe_delayimportRVA   	dd	?; E0h
			pe_delayimportSize	dd	?; E4h
			
			pe_comRVA      		dd	?; E8h
			pe_comSize	  	dd	?; ECh

			pe_rsrvd2      		dd	?; E8 	
						dd	?; ECh

			ends
;

pe_object               struc
                        pe_Obj_name             db      8 dup(?)
                        pe_Obj_vSize            dd      ?
                        pe_Obj_RVA              dd      ?
                        pe_Obj_pSize            dd      ?
                        pe_Obj_offset           dd      ?
                        pe_Obj_reloc            dd      ?
                        pe_Obj_linesptr         dd      ?
                        pe_Obj_reloccnt         dw      ?
                        pe_Obj_linescnt         dw      ?
                        pe_Obj_flags            dd      ?
                        ends

;

fixup_header            struc
                        fixup_pageRVA           dd      ?
                        fixup_size              dd      ?
                        ends

;

import_header           struc
                        import_lookupRVA        dd      ?
                        import_dtime            dd      ?
                        import_chain            dd      ?
                        import_nameRVA          dd      ?
                        import_adrRVA           dd      ?
                        ends

;

export_header           struc
                        export_flags            dd      ?
                        export_dtime            dd      ?
                        export_version          dd      ?
                        export_nameRVA          dd      ?
                        export_ordbase          dd      ?
                        export_adrcnt           dd      ?
                        export_nampecnt         dd      ?
                        export_adrRVA           dd      ?
                        export_namepRVA         dd      ?
                        export_ordRVA           dd      ?
                        ends

;

rsrc_dir                struc
                        rsrc_dir_type           dd      ?
                        rsrc_dir_dtime          dd      ?
                        rsrc_dir_version        dd      ?
                        rsrc_dir_name_cnt       dw      ?
                        rsrc_dir_num_cnt        dw      ?
                        ends

;------------------------------------------------------------------------------

rsrc_dir_entry          struc
                        rsrc_entry_type         dd      ?
                        rsrc_entry_subdirRVA    dd      ?
                        ends

;------------------------------------------------------------------------------

rsrc_description        struc
                        rsrc_binRVA             dd      ?
                        rsrc_binsize            dd      ?
                        rsrc_codepage           dd      ?
                        rsrc_reserved           dd      ?
                        ends

;

tls_dir                 struc
                        tls_blockVA             dd      ?
                        tls_end_blockVA         dd      ?
                        tls_indexVA             dd      ?
                        tls_callbackVA          dd      ?
                        ends

;
mz                      struc
                        mz_sign	                dw      ?	; 00h
                        mz_partPage             dw      ?       ; 02h
                        mz_pageCnt              dw      ?       ; 04h
                        mz_peloCnt              dw      ?       ; 06h
                        mz_HdrSize              dw      ?       ; 08h

                        mz_minMem               dw      ?       ; 0Ah
                        mz_maxMem               dw      ?       ; 0Ch
                        mz_ss                   dw      ?       ; 0Eh
                        mz_sp                   dw      ?       ; 10h
                        mz_csum                 dw      ?       ; 12h

                        mz_ip                   dw      ?	; 14h
                        mz_cs                   dw      ?       ; 16h

                        mz_tablOff              dw      ?       ; 18h
                        mz_overlay              dw      ?       ; 1Ah
                        mz_rsrvd1               dw 4 dup(?)     ; 1Ch - 23h
                        mz_oemid                dw      ?       ; 24h
                        mz_oeminfo              dw      ?       ; 26h
                        mz_rsrvd2               dw 10 dup(?)    ; 28h - 3Ah
                        mz_peOffset             dd      ?       ; 3Ch
                        ends
;

OBJ_SHARE       	equ     10000000h
OBJ_EXECUTE     	equ     20000000h
OBJ_READ        	equ     40000000h
OBJ_WRITE       	equ     80000000h

OBJ_CODE        	equ     0020h
OBJ_DATA        	equ     0040h

PEFLAGS_NOFIXUP 	equ	0001h
PEFLAGS_EXECUTABLE 	equ	0002h
PEFLAGS_NOLINES 	equ	0004h
PEFLAGS_NOSYM	 	equ	0008h
PEFLAGS_MACHINERLO 	equ	0080h
PEFLAGS_FILEDBG 	equ	0200h
PEFLAGS_RUNSWP	 	equ	0400h
PEFLAGS_RUNSWPNET 	equ	0800h
PEFLAGS_SYSTEM	 	equ	1000h
PEFLAGS_DLL	 	equ	2000h
PEFLAGS_MACHINERHI 	equ	8000h

;----------------------------------------------------------------------------

MACHINE_UNKNOWN         equ	0000h
MACHINE_I386            equ	014Ch

;----------------------------------------------------------------------------

SSYSTEM_UNKNOWN		equ	0000h
SSYSTEM_NATIVE		equ	0001h
SSYSTEM_WINGUI		equ	0002h
SSYSTEM_WINCUI		equ	0003h
SSYSTEM_OS2CUI		equ	0005h
SSYSTEM_POSIX_CUI       equ     0007h
SSYSTEM_WIN9XDRV        equ	0008h
SSYSTEM_WINCE        	equ	0009h
SSYSTEM_XBOX	        equ	000Eh


