   DRP STRUC
       DRP_eyecatch_str    DB  8 DUP (?)
       DRP_LGN         DD  ?
       DRP_aer         DD  ?
       DRP_ilb         DD  ?
       DRP_ascii_name      DB  16 DUP (?)
       DRP_revision        DB  ?
       DRP_feature_code    DD  ?
       DRP_if_requirements DW  ?
       DRP_bus_type        DB  ?
       DRP_reg_result      DW  ?
       DRP_reference_data  DD  ?
       DRP_reserved1       DB  2 DUP (?)
       DRP_reserved2       DD  1 DUP (?)
   DRP ENDS

   DRP_FC_SCAN_DOWN        EQU 04H
   DRP_FC_IO_FOR_INQ_AEP       EQU 40H
   DRP_FC_HALF_SEC         EQU 2000H
   DRP_FC_1_SEC            EQU 2000H
   DRP_FC_2_SECS           EQU 4000H
   DRP_FC_4_SECS           EQU 8000H
   DRP_FC_DYNALOAD         EQU 10000H
   DRP_FC_NEED_PRELOAD     EQU 20000H
   DRP_FC_NEED_PRE_POST_LOAD   EQU 40000H
   DRP_IF_ISA          EQU 0001H
   DRP_IF_EISA         EQU 0002H
   DRP_IF_MCA          EQU 0004H
   DRP_IF_STD          EQU 00ffH
   DRP_BT_ESDI         EQU 00H
   DRP_BT_SCSI         EQU 01H
   DRP_BT_FLOPPY           EQU 02H
   DRP_BT_SMART            EQU 03H
   DRP_BT_ABIOS            EQU 04H
   DRP_IFS_BIT         EQU 00H
   DRP_RESRVD1_BIT         EQU 01H
   DRP_FSD_BIT         EQU 02H
   DRP_FSD_EXT_1_BIT       EQU 03H
   DRP_FSD_EXT_2_BIT       EQU 04H
   DRP_VOLTRK_BIT          EQU 05H
   DRP_CLASS_DRV_BIT       EQU 06H
   DRP_TSD_BIT         EQU 07H
   DRP_VSD_1_BIT           EQU 08H
   DRP_VSD_2_BIT           EQU 09H
   DRP_VSD_3_BIT           EQU 0aH
   DRP_SCSI_LAYER_BIT      EQU 0bH
   DRP_VSD_4_BIT           EQU 0cH
   DRP_VSD_5_BIT           EQU 0dH
   DRP_VSD_6_BIT           EQU 0eH
   DRP_VSD_7_BIT           EQU 0fH
   DRP_VSD_8_BIT           EQU 10H
   DRP_VSD_9_BIT           EQU 11H
   DRP_RESRVD18_BIT        EQU 12H
   DRP_MISC_PD_BIT         EQU 13H
   DRP_NT_MPD_BIT          EQU 14H
   DRP_NT_PD_BIT           EQU 15H
   DRP_ESDI_PD_BIT         EQU 16H
   DRP_ESDIEMUL_PD_BIT     EQU 17H
   DRP_RESRVD23_BIT        EQU 18H
   DRP_ABIOS_PD_BIT        EQU 19H
   DRP_ABIOS_PREMPT_PD_BIT     EQU 1aH
   DRP_NEC_FLOPPY_BIT      EQU 1bH
   DRP_RESRVD28_BIT        EQU 1cH
   DRP_SOC_SER_DRV_BIT     EQU 1dH
   DRP_SOC_DRV_BIT         EQU 1eH
   DRP_IOS_REG_BIT         EQU 1fH
   DRP_LGN_MAX         EQU 1fH
   DRP_IFS             EQU (1 SHL DRP_IFS_BIT)
   DRP_RESRVD1         EQU (1 SHL DRP_RESRVD1_BIT)
   DRP_FSD             EQU (1 SHL DRP_FSD_BIT)
   DRP_FSD_EXT_1           EQU (1 SHL DRP_FSD_EXT_1_BIT)
   DRP_FSD_EXT_2           EQU (1 SHL DRP_FSD_EXT_2_BIT)
   DRP_VOLTRK          EQU (1 SHL DRP_VOLTRK_BIT)
   DRP_CLASS_DRV           EQU (1 SHL DRP_CLASS_DRV_BIT)
   DRP_TSD             EQU (1 SHL DRP_TSD_BIT)
   DRP_VSD_1           EQU (1 SHL DRP_VSD_1_BIT)
   DRP_VSD_2           EQU (1 SHL DRP_VSD_2_BIT)
   DRP_VSD_3           EQU (1 SHL DRP_VSD_3_BIT)
   DRP_SCSI_LAYER          EQU (1 SHL DRP_SCSI_LAYER_BIT)
   DRP_VSD_4           EQU (1 SHL DRP_VSD_4_BIT)
   DRP_VSD_5           EQU (1 SHL DRP_VSD_5_BIT)
   DRP_VSD_6           EQU (1 SHL DRP_VSD_6_BIT)
   DRP_VSD_7           EQU (1 SHL DRP_VSD_7_BIT)
   DRP_VSD_8           EQU (1 SHL DRP_VSD_8_BIT)
   DRP_VSD_9           EQU (1 SHL DRP_VSD_9_BIT)
   DRP_RESRVD18            EQU (1 SHL DRP_RESRVD18_BIT)
   DRP_MISC_PD         EQU (1 SHL DRP_MISC_PD_BIT)
   DRP_NT_MPD          EQU (1 SHL DRP_NT_MPD_BIT)
   DRP_NT_PD           EQU (1 SHL DRP_NT_PD_BIT)
   DRP_RESRVD20            EQU <(1 SHL DRP_RESRVD20_BIT)>
   DRP_ESDI_PD         EQU (1 SHL DRP_ESDI_PD_BIT)
   DRP_ESDIEMUL_PD         EQU (1 SHL DRP_ESDIEMUL_PD_BIT)
   DRP_RESRVD23            EQU (1 SHL DRP_RESRVD23_BIT)
   DRP_ABIOS_PD            EQU (1 SHL DRP_ABIOS_PD_BIT)
   DRP_ABIOS_PREMPT_PD     EQU (1 SHL DRP_ABIOS_PREMPT_PD_BIT)
   DRP_NEC_FLOPPY          EQU (1 SHL DRP_NEC_FLOPPY_BIT)
   DRP_RESRVD28            EQU (1 SHL DRP_RESRVD28_BIT)
   DRP_SOC_SER_DRV         EQU (1 SHL DRP_SOC_SER_DRV_BIT)
   DRP_SOC_DRV         EQU (1 SHL DRP_SOC_DRV_BIT)
   DRP_IOS_REG         EQU (1 SHL DRP_IOS_REG_BIT)
   DRP_REMAIN_RESIDENT     EQU 1
   DRP_MINIMIZE            EQU 2
   DRP_ABORT           EQU 3
   DRP_INVALID_LAYER       EQU 4
   EyeCatcher          EQU <'XXXXXXXX'>
