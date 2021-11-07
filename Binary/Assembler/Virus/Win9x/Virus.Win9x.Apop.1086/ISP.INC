   ISP_CREATE_DDB      EQU 0
   ISP_CREATE_DCB      EQU 1
   ISP_CREATE_IOP      EQU 2
   ISP_ALLOC_MEM       EQU 3
   ISP_DEALLOC_MEM     EQU 4
   ISP_INSERT_CALLDOWN EQU 5
   ISP_ASSOCIATE_DCB   EQU 6
   ISP_GET_DCB     EQU 7
   ISP_GET_FIRST_NEXT_DCB  EQU 8
   ISP_DEALLOC_DDB     EQU 9
   ISP_DESTROY_DCB     EQU 10
   ISP_QUERY_MATCHING_DCBS EQU 11
   ISP_QUERY_REMOVE_DCB    EQU 12
   ISP_DEVICE_REMOVED  EQU 13
   ISP_DEVICE_ARRIVED  EQU 14
   ISP_DISASSOCIATE_DCB    EQU 15
   ISP_DRIVE_LETTER_PICK   EQU 16
   ISP_REGISTRY_READ   EQU 17
   ISP_FIND_LDM_ENTRY  EQU 18
   ISP_DELETE_LDM_ENTRY    EQU 19
   ISP_BROADCAST_AEP   EQU 20
   ISP STRUC
       ISP_func    DW  ?
       ISP_result  DW  ?
   ISP ENDS
   ISP_ddb_create STRUC
       ISP_ddb_hdr DB  SIZE ISP DUP (?)
       ISP_ddb_size    DW  ?
       ISP_ddb_ptr DD  ?
       ISP_ddb_flags   DB  ?
       ISP_pad0    DB  1 DUP (?)
   ISP_ddb_create ENDS
   ISP_DDB_FLAG_NEED_PHYS_CONTIG   EQU 01H
   ISP_dcb_create STRUC
       ISP_dcb_hdr DB  SIZE ISP DUP (?)
       ISP_dcb_size    DW  ?
       ISP_dcb_ptr DD  ?
       ISP_pad1    DB  2 DUP (?)
   ISP_dcb_create ENDS
   ISP_IOP_create STRUC
       ISP_i_c_hdr     DB  SIZE ISP DUP (?)
       ISP_IOP_size        DW  ?
       ISP_delta_to_ior    DD  ?
       ISP_IOP_ptr     DD  ?
       ISP_i_c_flags       DB  ?
       ISP_pad2        DB  1 DUP (?)
   ISP_IOP_create ENDS
   ISP_mem_alloc STRUC
       ISP_mem_a_hdr   DB  SIZE ISP DUP (?)
       ISP_mem_size    DW  ?
       ISP_mem_ptr DD  ?
       ISP_mem_type    DW  ?
       ISP_mem_flags   DB  ?
       ISP_pad3    DB  3 DUP (?)
   ISP_mem_alloc ENDS
   ISP_M_FL_INTERRUPT_TIME     EQU 01H
   ISP_M_FL_MUST_SUCCEED       EQU 02H
   ISP_M_FL_EXTERNAL_IOP       EQU 04H
   ISP_M_FL_SMART_ALLOC        EQU 08H
   ISP_M_FL_PERSISTENT_IOP     EQU 10H
   ISP_M_FL_USE_SYSTEM_HEAP    EQU 20H
   ISP_M_FL_LOW_PRIORITY       EQU 40H
   ISP_mem_dealloc STRUC
       ISP_mem_da_hdr  DB  SIZE ISP DUP (?)
       ISP_mem_ptr_da  DD  ?
   ISP_mem_dealloc ENDS
   ISP_calldown_insert STRUC
       ISP_i_cd_hdr        DB  SIZE ISP DUP (?)
       ISP_i_cd_dcb        DD  ?
       ISP_i_cd_req        DD  ?
       ISP_i_cd_ddb        DD  ?
       ISP_i_cd_expan_len  DW  ?
       ISP_i_cd_flags      DD  ?
       ISP_i_cd_lgn        DB  ?
       ISP_pad4        DB  1 DUP (?)
   ISP_calldown_insert ENDS
   ISP_dcb_associate STRUC
       ISP_d_a_hdr DB  SIZE ISP DUP (?)
       ISP_d_a_dcb DD  ?
       ISP_d_a_drive   DB  ?
       ISP_d_a_flags   DB  ?
       ISP_pad5    DB  2 DUP (?)
   ISP_dcb_associate ENDS
   ISP_D_A_FL_NOSHELLMSG   EQU 01H
   ISP_dcb_get STRUC
       ISP_g_d_hdr DB  SIZE ISP DUP (?)
       ISP_g_d_dcb DD  ?
       ISP_g_d_drive   DD  ?
   ISP_dcb_get ENDS
   ISP_GET_FRST_NXT_DCB STRUC
       ISP_gfnd_hdr        DB  SIZE ISP DUP (?)
       ISP_gfnd_dcb_offset DD  ?
       ISP_gfnd_found_dcb  DD  ?
       ISP_gfnd_dcb_type   DB  ?
       ISP_pad7        DB  3 DUP (?)
   ISP_GET_FRST_NXT_DCB ENDS
   ISP_DDB_DEALLOC STRUC
       ISP_ddb_d_hdr   DB  SIZE ISP DUP (?)
       ISP_ddb_d_ddb   DD  ?
       ISP_ddb_d_dvt   DD  ?
   ISP_DDB_DEALLOC ENDS
   ISP_DCB_DESTROY STRUC
       ISP_ddb_d_hdr   DB  SIZE ISP DUP (?)
       ISP_dcb_d_dcb   DD  ?
   ISP_DCB_DESTROY ENDS
   ISP_QUERY_MATCH STRUC
       ISP_q_match_hdr     DB  SIZE ISP DUP (?)
       ISP_q_match_pdcb    DD  ?
       ISP_q_match_drives  DD  ?
   ISP_QUERY_MATCH ENDS
   ISP_QUERY_REMOVE STRUC
       ISP_q_remove_hdr    DB  SIZE ISP DUP (?)
       ISP_q_remove_pdcb   DD  ?
       ISP_q_remove_flags  DD  ?
   ISP_QUERY_REMOVE ENDS
   ISP_Q_REMOVE_FL_MEDIA_ONLY  EQU 1
   ISP_DEV_REMOVED STRUC
       ISP_d_removed_hdr   DB  SIZE ISP DUP (?)
       ISP_dev_removed_pdcb    DD  ?
       ISP_dev_removed_flags   DD  ?
   ISP_DEV_REMOVED ENDS
   ISP_DEV_REMOVED_FL_MEDIA_ONLY   EQU 1
   ISP_DEV_ARRIVED STRUC
       ISP_d_arrived_hdr   DB  SIZE ISP DUP (?)
       ISP_dev_arrived_pdcb    DD  ?
       ISP_dev_arrived_flags   DD  ?
   ISP_DEV_ARRIVED ENDS
   ISP_DEV_ARR_FL_MEDIA_ONLY   EQU 1
   ISP_DISASSOC_DCB STRUC
       ISP_dis_dcb_hdr DB  SIZE ISP DUP (?)
       ISP_dis_dcb_drive   DD  ?
   ISP_DISASSOC_DCB ENDS
   ISP_pick_drive_letter STRUC
       ISP_p_d_l_hdr       DB  SIZE ISP DUP (?)
       ISP_p_d_l_pdcb      DD  ?
       ISP_p_d_l_letter    DB  2 DUP (?)
       ISP_p_d_l_flags     DB  ?
       ISP_p_d_l_pad       DB  1 DUP (?)
   ISP_pick_drive_letter ENDS
   ISP_PDL_FL_USER_ONLY        EQU 01H
   ISP_PDL_FL_OK_INVALID_RM    EQU 02H
   ISP_PDL_FL_OK_RM_CD     EQU 04H
   ISP_PDL_FL_USE_RANGE        EQU 08H
   ISP_PDL_FL_RELEASE      EQU 10H
   ISP_PDL_FL_IS_FLOPPY        EQU 20H
   ISP_read_registry STRUC
       ISP_r_r_hdr     DB  SIZE ISP DUP (?)
       ISP_r_r_dcb     DD  ?
       ISP_r_r_string      DD  ?
       ISP_r_r_data_type   DD  ?
       ISP_r_r_data_size   DD  ?
       ISP_r_r_buffer      DD  ?
   ISP_read_registry ENDS
   ISP_FIND_LDM STRUC
       ISP_fldm_hdr    DB  SIZE ISP DUP (?)
       ISP_fldm_drive  DD  ?
       ISP_fldm_pldm   DD  ?
   ISP_FIND_LDM ENDS
   ISP_AEP_BROADCAST STRUC
       ISP_baep_hdr    DB  SIZE ISP DUP (?)
       ISP_baep_paep   DD  ?
   ISP_AEP_BROADCAST ENDS
