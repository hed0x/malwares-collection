   sft             struc
   sft_users       dw      ?
   sft_mode        dw      ?
   sft_attr        db      ?
   sft_dev_attr    dw      ?
   sft_dpb_ptr     dd      ?
   sft_1st_clust   dw      ?
   sft_time        dw      ?
   sft_date        dw      ?
   sft_size        dd      ?
   sft_seek_point  dd      ?
   sft_rel_clust   dw      ?
   sft_abs_clust   dw      ?
   sft_dir_sect    dw      ?
   sft_dir_entries db      ?
   sft_name        db      8 dup(?)
   sft_ext         db      3 dup(?)
   sft_shr_sft_ptr dd      ?
   sft_shr_mchn_num dw     ?
   sft_psp_seg     dw      ?
   sft_shr_rec_ofs dw      ?
   sft_last_rw_clust_no dw ?
   sft             ends

   dos_caller_stack struc
   dcs_ax          dw      ?
   dcs_bx          dw      ?
   dcs_cx          dw      ?
   dcs_dx          dw      ?
   dcs_si          dw      ?
   dcs_di          dw      ?
   dcs_bp          dw      ?
   dcs_ds          dw      ?
   dcs_es          dw      ?
   dcs_ip          dw      ?
   dcs_cs          dw      ?
   dcs_flags       dw      ?
   dos_caller_stack ends

   dir             struc
   dir_drive       db      ?
   dir_name        db      8 dup(?)
   dir_ext         db      3 dup(?)
   dir_attr        db      ?
                   db      10 dup(?)
   dir_time        dw      ?
   dir_date        dw      ?
   dir_start_clust dw      ?
   dir_size        dd      ?
   dir             ends

   find            struc
   find_drive      db      ?
   find_find_name  db      8 dup(?)
   find_find_ext   db      3 dup(?)
   find_find_attr  db      ?
   find_entry_count dw     ?
   find_dir_1st_clust dw   ?
                   db      4 dup(?)
   find_attr       db      ?
   find_time       dw      ?
   find_date       dw      ?
   find_size       dd      ?
   find_name       db      13 dup(?)
   find            ends

   mcb             struc
   mcb_sign        db      ?
   mcb_onwer_seg   dw      ?
   mcb_para_size   dw      ?
                   db      3 dup(?)
   mcb_name        db      8 dup(?)
   mcb             ends

   pcb             struc
   pcb_env_var_seg dw      ?
   pcb_parameter_ptr dd    ?
   pcb_fcb1_ptr    dd      ?
   pcb_fcb2_ptr    dd      ?
   pcb_sp          dw      ?
   pcb_ss          dw      ?
   pcb_ip          dw      ?
   pcb_cs          dw      ?
   pcb             ends


   boot_sector     struc
   bs_jmp          db      3 dup(?)
   bs_oem_name     db      8 dup(?)
   bs_sector_size  dw      ?
   bs_clust_sectors db     ?
   bs_reserved_sectors dw  ?
   bs_fat_count    db      ?
   bs_root_dir_entries dw  ?
   bs_sectors      dw      ?
   bs_media_id     db      ?
   bs_fat_sectors  dw      ?
   bs_track_sectors dw     ?
   bs_heads        dw      ?
   bs_hidden_sectors dd    ?
   bs_ext_sectors  dd      ?
   bs_drive_count  db      ?
                   db      ?
   bs_boot_sign    db      ?
   bs_id           dd      ?
   bs_label        db      11 dup(?)
   bs_fat_type     db      8 dup(?)
   boot_sector     ends

   partition_table struc
   pt_active_id    db      ?
   pt_boot_head    db      ?
   pt_boot_sector  db      ?
   pt_boot_track   db      ?
   pt_system_id    db      ?
   pt_last_head    db      ?
   pt_last_sector  db      ?
   pt_last_track   db      ?
   pt_first_sect_no dd     ?
   pt_sectors      dd      ?
   partition_table ends

   dpb             struc
   dpb_drive_no    db      ?
   dpb_unit_drive_no db    ?
   dpb_sector_size dw      ?
   dpb_clust_sectors db    ?       ; from zero (1)
   dpb_shift_factor db     ?
   dpb_fat_1st_sect_no dw  ?
   dpb_fat_count   db      ?
   dpb_root_dir_entries dw ?
   dpb_data_1st_sect_no dw ?
                   dw      ?       ; ???
   dpb_fat_sectors dw      ?
   dpb_root_1st_sect_no dw ?
   dpb_dvc_drv_addr dd     ?
   dpb_id          db      ?
   dpb_rebuild_flag db     ?       ; 0ffh -> need to rebuild
   dpb_next_dpb_addr dd    ?
                   dw      ?       ; ???
   dpb_free_clusts dw      ?
   dpb             ends
