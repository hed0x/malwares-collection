   ILB STRUC
       ILB_service_rtn     DD  ?
       ILB_dprintf_rtn     DD  ?
       ILB_Wait_10th_Sec   DD  ?
       ILB_internal_request    DD  ?
       ILB_io_criteria_rtn DD  ?
       ILB_int_io_criteria_rtn DD  ?
       ILB_dvt         DD  ?
       ILB_ios_mem_virt    DD  ?
       ILB_enqueue_iop     DD  ?
       ILB_dequeue_iop     DD  ?
       ILB_reserved_1      DD  ?
       ILB_reserved_2      DD  ?
       ILB_flags       DW  ?
       ILB_driver_numb     DB  ?
       ILB_reserved_3      DB  ?
   ILB ENDS
