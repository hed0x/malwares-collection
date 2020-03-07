   include         vmm.inc
   include         ifs.inc


   ifsreq  struc
     ifs_ir        ioreq   ?
     ifs_pfh       dd      ?
     ifs_psft      dd      ?
     ifs_psr       dd      ?
     ifs_pdb       dd      ?
     ifs_proid     dd      ?
     ifs_func      db      ?
     ifs_drv       db      ?
     ifs_hflag     db      ?
     ifs_nflags    db      ?
     ifs_pbuffer   dd      ?
     ifs_VMHandle  dd      ?
     ifs_pv        dd      ?
     ifs_crs       CLIENT_STRUCT ?
   ifsreq  ends


   volinfo struc
     vi_psr        dd      ?
     vi_pszRootDir dd      ?
     vi_Client_CX  dw      ?
     vi_unk1       db      ?
     vi_flags      db      ?
     vi_leng       dw      ?
     vi_unk2       db      ?
     vi_drv        db      ?
     vi_subst_path dd      ?
     vi_CDS_copy   dd      ?
   volinfo ends


   shres   struc
     sr_sig        dw      ?
     sr_serial     db      ?
     sr_idx        db      ?
     sr_next       dd      ?
     sr_rh         dd      ?
     sr_func       dd      ?
     sr_inUse      dd      ?
     sr_uword      dw      ?
     sr_HndCnt     dw      ?
     sr_UNCCnt     db      ?
     sr_DrvCnt     db      ?
     sr_rtype      db      ?
     sr_flags      db      ?
     sr_ProID      dd      ?
     sr_VolInfo    dd      ?
     sr_fhandleHead dd     ?
     sr_LockPid    dd      ?
     sr_LockSavFunc dd     ?
     sr_LockType   db      ?
     sr_PhysUnit   db      ?
     sr_LockFlags  dw      ?
     sr_LockOwner  dd      ?
     sr_LockWaitCnt dw     ?
     sr_LockReadCnt dw     ?
     sr_LockWriteCnt dw    ?
     sr_flags2     db      ?
     sr_reserved   db      ?
     sr_pnv        dd      ?
   shres   ends


   hlockinfo       struc
     hl            hndlfunc ?
     hl_lock       dd      ?
     hl_flags      dd      ?
     hl_pathlen    dd      ?
     hl_pathname   dw      ?
   hlockinfo       ends


   fhandle struc
     fh_hf         hndlfunc ?
     fh_fh         fh_t    ?
     fh_psr        dd      ?
     fh_pSFT       dd      ?
     fh_position   dd      ?
     fh_devflags   dw      ?
     fh_hflag      db      ?
     fh_type       db      ?
     fh_ref_count  dw      ?
     fh_mode       dw      ?
     fh_hlockinfo  dd      ?
     fh_prev       dd      ?
     fh_next       dd      ?
     fh_sfn        dw      ?
     fh_mmsfn      dw      ?
     fh_pid        dd      ?
     fh_ntid       dd      ?
     fh_fhFlags    dw      ?
     fh_InCloseCnt dw      ?
   fhandle ends


   cds     struc
     cds_root_pathname     db      67 dup(?)
     cds_attrib            dw      ?
     cds_physdrv           db      ?
     cds_flag              db      ?
     cds_cluster_parent_dir dw     ?
     cds_entry_num         dw      ?
     cds_cluster_current_dir dw    ?
     cds_media_change      dw      ?
     cds_ofs_visible_dir   dw      ?
   cds     ends

   pervm   struc
     pv_next       dd      ?
     pv_prev       dd      ?
     pv_flags      db      ?
     pv_cnt        db      ?
     pv_curdrv     db      ?
     pv_unk2       db      ?
     pv_dispfunc   dd      ?
     pv_pifs       dd      ?
     pv_pev_vm     dd      ?
     pv_Client_DS  dd      ?
     pv_Client_EDX dd      ?
     pv_hev        dd      ?
     pv_pfh        dd      32 dup(?)
     pv_pev_vm2    dd      ?
     pv_ppsft      dd      ?
     pv_curdir     dd      32 dup(?)
     pv_flags2     dw      ?
     pv_unk3       dw      ?
   pervm   ends
