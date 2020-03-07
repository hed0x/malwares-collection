   type_sdeffsd_req_usage STRUC
       _IOR_ioctl_drive        DW  ?
       _IOR_ioctl_function     DW  ?
       _IOR_ioctl_control_param    DD  ?
       _IOR_ioctl_buffer_ptr       DD  ?
       _IOR_ioctl_client_params    DD  ?
       _IOR_ioctl_return       DD  ?
   type_sdeffsd_req_usage ENDS
   ?UnionSize = 0
   if 5 * 4 gt ?UnionSize
       ?UnionSize = 5 * 4
   endif
   _IOR_requestor_usage    equ <(dword ptr 0)>
   if size type_sdeffsd_req_usage gt ?UnionSize
       ?UnionSize = size type_sdeffsd_req_usage
   endif
   sdeffsd_req_usage   equ <(byte ptr 0)>
   urequestor_usage STRUC
       DB  ?UnionSize dup(?)
   urequestor_usage ENDS
   IOR STRUC
       IOR_next        DD  ?
       IOR_func        DW  ?
       IOR_status      DW  ?
       IOR_flags       DD  ?
       IOR_callback        DD  ?
       IOR_start_addr      DD  2 DUP (?)
       IOR_xfer_count      DD  ?
       IOR_buffer_ptr      DD  ?
       IOR_private_client  DD  ?
       IOR_private_IOS     DD  ?
       IOR_private_port    DD  ?
       _ureq           DB  SIZE urequestor_usage DUP (?) ; sz = 20
       IOR_req_req_handle  DD  ?
       IOR_req_vol_handle  DD  ?
       IOR_sgd_lin_phys    DD  ?
       IOR_num_sgds        DB  ?
       IOR_vol_designtr    DB  ?
       IOR_ios_private_1   DW  ?
       IOR_reserved_2      DD  2 DUP (?)
   IOR ENDS
   IOR_READ            EQU 00H
   IOR_WRITE           EQU 01H
   IOR_VERIFY          EQU 02H
   IOR_CANCEL          EQU 03H
   IOR_WRITEV          EQU 04H
   IOR_MEDIA_CHECK         EQU 05H
   IOR_MEDIA_CHECK_RESET       EQU 06H
   IOR_LOAD_MEDIA          EQU 07H
   IOR_EJECT_MEDIA         EQU 08H
   IOR_LOCK_MEDIA          EQU 09H
   IOR_UNLOCK_MEDIA        EQU 0AH
   IOR_REQUEST_SENSE       EQU 0BH
   IOR_COMPUTE_GEOM        EQU 0CH
   IOR_GEN_IOCTL           EQU 0DH
   IOR_FORMAT          EQU 0EH
   IOR_SCSI_PASS_THROUGH       EQU 0FH
   IOR_CLEAR_QUEUE         EQU 10H
   IOR_DOS_RESET           EQU 11H
   IOR_SCSI_REQUEST        EQU 12H
   IOR_SET_WRITE_STATUS        EQU 22H
   IOR_RESTART_QUEUE       EQU 23H
   IOR_ABORT_QUEUE         EQU 24H
   IOR_SPIN_DOWN           EQU 25H
   IOR_SPIN_UP         EQU 26H
   IOR_FLUSH_DRIVE         EQU 27H
   IOR_FLUSH_DRIVE_AND_DISCARD EQU 28H
   IOR_FSD_EXT         EQU 29H
   IOR_FLOPTICAL_MODE_SENSE    EQU 2AH
   IOR_IDE_PASS_THROUGH        EQU 2BH
   IOR_FLOPTICAL_INQUIRY       EQU 2CH
   IOR_ENUMERATE_DEVICES       EQU 2DH
   IOR_ASYNCHRONOUS_DRIVE_SPINUP   EQU 2EH
   IORS_SUCCESS            EQU 00H
   IORS_SUCCESS_WITH_RETRY     EQU 01H
   IORS_SUCCESS_WITH_ECC       EQU 02H
   IORS_INVALID_SECTOR     EQU 10H
   IORS_CANCELED           EQU 11H
   IORS_CMD_IN_PROGRESS        EQU 12H
   IORS_INVALID_CMD_PTR        EQU 13H
   IORS_MEDIA_ERROR        EQU 14H
   IORS_DEVICE_ERROR       EQU 15H
   IORS_INVALID_COMMAND        EQU 16H
   IORS_NO_DEVICE          EQU 17H
   IORS_NO_MEDIA           EQU 18H
   IORS_UNCERTAIN_MEDIA        EQU 19H
   IORS_UNREC_ERROR        EQU 1AH
   IORS_HW_FAILURE         EQU 1BH
   IORS_UNFORMATTED_MEDIA      EQU 1CH
   IORS_MEMORY_ERROR       EQU 1DH
   IORS_TIME_OUT           EQU 1EH
   IORS_WRITE_PROTECT      EQU 1FH
   IORS_NOT_READY          EQU 20H
   IORS_BUSY           EQU 21H
   IORS_VOL_NOT_LOCKED     EQU 22H
   IORS_VOL_LOCKED         EQU 23H
   IORS_VOL_NOT_REMOVABLE      EQU 24H
   IORS_VOL_IN_USE         EQU 25H
   IORS_LOCK_COUNT_EXCEEDED    EQU 26H
   IORS_VALID_EJECT_FAILED     EQU 27H
   IORS_ILLEGAL_ACCESS_MODE    EQU 28H
   IORS_LOCK_VIOLATION     EQU 29H
   IORS_WRONG_MEDIA        EQU 2aH
   IORS_OUT_OF_SPACE       EQU 2bH
   IORS_BIG_IO_BREAKUP_FAILED  EQU 2cH
   IORS_ERROR_DESIGNTR     EQU 10H
   IORS_INVALID_PARM       EQU IORS_ERROR_DESIGNTR
   IORF_HIGH_PRIORITY_BIT      EQU 0
   IORF_HIGH_PRIORITY      EQU (1 SHL IORF_HIGH_PRIORITY_BIT)
   IORF_SCATTER_GATHER_BIT     EQU 1
   IORF_SCATTER_GATHER     EQU (1 SHL IORF_SCATTER_GATHER_BIT)
   IORF_DONT_CACHE_BIT     EQU 2
   IORF_DONT_CACHE         EQU (1 SHL IORF_DONT_CACHE_BIT)
   IORF_BYPASS_VOLTRK      EQU 0008H
   IORF_BYPASS_VOLTRK_BIT      EQU 3
   IORF_16BIT_IOCTL        EQU 0010H
   IORF_16BIT_IOCTL_BIT        EQU 4
   IORF_SWAPPER_IO         EQU 0020H
   IORF_SWAPPER_IO_BIT     EQU 5
   IORF_DOUBLE_BUFFER      EQU 0040H
   IORF_DOUBLE_BUFFER_BIT      EQU 6
   IORF_SYNC_CMD_DONE      EQU 0080H
   IORF_SYNC_CMD_DONE_BIT      EQU 7
   IORF_SYNC_COMMAND       EQU 0100H
   IORF_SYNC_COMMAND_BIT       EQU 8
   IORF_CHAR_COMMAND       EQU 0200H
   IORF_CHAR_COMMAND_BIT       EQU 9
   IORF_VERSION_002        EQU 0400H
   IORF_VERSION_002_BIT        EQU 10
   IORF_BYPASS_QUEUE       EQU 0800H
   IORF_BYPASS_QUEUE_BIT       EQU 11
   IORF_BLOCKDEV_EMULATE       EQU 1000H
   IORF_BLOCKDEV_EMULATE_BIT   EQU 12
   IORF_POSTPONED_VOL_OPS      EQU 2000H
   IORF_POSTPONED_VOL_OPS_BIT  EQU 13
   IORF_INHIBIT_GEOM_RECOMPUTE EQU 4000H
   IORF_INHIBIT_GEOM_RECOMPUTE_BIT EQU 14
   IORF_SRB_VALID          EQU 8000H
   IORF_SRB_VALID_BIT      EQU 15
   IORF_BYPASS_A_B         EQU 10000H
   IOFR_BYPASS_A_B_BIT     EQU 16
   IORF_QUIET_VOLTRK       EQU 20000H
   IORF_QUIET_VOLTRL_BIT       EQU 17
   IORF_AUDIO_DATA_READ        EQU 40000H
   IORF_AUDIO_DATA_READ_BIT    EQU 18
   IORF_LOGICAL_START_SECTOR   EQU 80000H
   IORF_LOGICAL_START_SECTOR_BIT   EQU 19
   IORF_PARTITION_BIAS_ADDED   EQU 100000H
   IORF_PARTITION_BIAS_ADDED_BIT   EQU 20
   IORF_DATA_IN_BIT        EQU 21
   IORF_DATA_IN            EQU (1 SHL IORF_DATA_IN_BIT)
   IORF_DATA_OUT_BIT       EQU 22
   IORF_DATA_OUT           EQU (1 SHL IORF_DATA_OUT_BIT)
   IORF_VOL_RETRY_BIT      EQU 23
   IORF_VOL_RETRY          EQU (1 SHL IORF_VOL_RETRY_BIT)
   IORF_NO_COMPRESS_BIT        EQU 24
   IORF_NO_COMPRESS        EQU (1 SHL IORF_NO_COMPRESS_BIT)
   IORF_DIRECT_IO_BIT      EQU 25
   IORF_DIRECT_IO          EQU (1 SHL IORF_DIRECT_IO_BIT)
   IORF_PHYS_SGDS_BIT      EQU 26
   IORF_PHYS_SGDS          EQU (1 SHL IORF_PHYS_SGDS_BIT)
   IORF_IO_TOO_BIG_BIT     EQU 27
   IORF_IO_TOO_BIG         EQU (1 SHL IORF_IO_TOO_BIG_BIT)
   IORF_WIN32_BIT          EQU 28
   IORF_WIN32          EQU (1 SHL IORF_WIN32_BIT)
   IORF_CHAR_DEVICE_BIT        EQU 29
   IORF_CHAR_DEVICE        EQU (1 SHL IORF_CHAR_DEVICE_BIT)
   IORF_PHYS_CMD_BIT       EQU 30
   IORF_PHYS_CMD           EQU (1 SHL IORF_PHYS_CMD_BIT)
   IORF_IDE_RESERVED_BIT       EQU 31
   IORF_IDE_RESERVED       EQU (1 SHL IORF_IDE_RESERVED_BIT)
   IOR_requestor_usage     EQU <_ureq._IOR_requestor_usage>
   IOR_ioctl_drive         EQU <_ureq.sdeffsd_req_usage._IOR_ioctl_drive>
   IOR_ioctl_function      EQU <_ureq.sdeffsd_req_usage._IOR_ioctl_function>
   IOR_ioctl_handle        EQU <_ureq.sdeffsd_req_usage._IOR_ioctl_drive>
   IOR_ioctl_control_param     EQU <_ureq.sdeffsd_req_usage._IOR_ioctl_control_param>
   IOR_ioctl_buffer_ptr        EQU <_ureq.sdeffsd_req_usage._IOR_ioctl_buffer_ptr>
   IOR_ioctl_client_params     EQU <_ureq.sdeffsd_req_usage._IOR_ioctl_client_params>
   IOR_ioctl_return        EQU <_ureq.sdeffsd_req_usage._IOR_ioctl_return>
   IOR_ioctl_buffer_length     EQU <IOR_private_client>
   IOR_format_address_field    EQU <IOR_sgd_lin_phys>
