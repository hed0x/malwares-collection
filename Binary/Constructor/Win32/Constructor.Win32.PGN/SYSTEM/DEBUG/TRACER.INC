
msg_unk                 db      'unknown',0

msgA                    dd      1,msgA_1
                        dd      2,msgA_2
                        dd      3,msgA_3
                        dd      4,msgA_4
                        dd      5,msgA_5
                        dd      6,msgA_6
                        dd      7,msgA_7
                        dd      8,msgA_8
                        dd      9,msgA_9
                        dd      0,0

msgA_1                  db      'EXCEPTION_DEBUG_EVENT',0
msgA_2                  db      'CREATE_THREAD_DEBUG_EVENT',0
msgA_3                  db      'CREATE_PROCESS_DEBUG_EVENT',0
msgA_4                  db      'EXIT_THREAD_DEBUG_EVENT',0
msgA_5                  db      'EXIT_PROCESS_DEBUG_EVENT',0
msgA_6                  db      'LOAD_DLL_DEBUG_EVENT',0
msgA_7                  db      'UNLOAD_DLL_DEBUG_EVENT',0
msgA_8                  db      'OUTPUT_DEBUG_STRING_EVENT',0
msgA_9                  db      'RIP_EVENT',0

msgB                    dd      080000003h,msgB_1
                        dd      080000004h,msgB_2
                        dd      0C0000005h,msgB_3
                        dd      080000002h,msgB_4
                        dd      0C000008Ch,msgB_5
                        dd      0C000008Dh,msgB_6
                        dd      0C000008Eh,msgB_7
                        dd      0C000008Fh,msgB_8
                        dd      0C0000090h,msgB_9
                        dd      0C0000091h,msgB_10
                        dd      0C0000092h,msgB_11
                        dd      0C0000093h,msgB_12
                        dd      0C0000094h,msgB_13
                        dd      0C0000095h,msgB_14
                        dd      0C0000096h,msgB_15
                        dd      0C0000006h,msgB_16
                        dd      0C000001Dh,msgB_17
                        dd      0C0000025h,msgB_18
                        dd      0C00000FDh,msgB_19
                        dd      0C0000026h,msgB_20
                        dd      080000001h,msgB_21
                        dd      0C0000008h,msgB_22
                        dd      0,0

msgB_1                  db      'EXCEPTION_BREAKPOINT',0
msgB_2                  db      'EXCEPTION_SINGLE_STEP',0
msgB_3                  db      'EXCEPTION_ACCESS_VIOLATION',0
msgB_4                  db      'EXCEPTION_DATATYPE_MISALIGNMENT',0
msgB_5                  db      'EXCEPTION_ARRAY_BOUNDS_EXCEEDED',0
msgB_6                  db      'EXCEPTION_FLT_DENORMAL_OPERAND',0
msgB_7                  db      'EXCEPTION_FLT_DIVIDE_BY_ZERO',0
msgB_8                  db      'EXCEPTION_FLT_INEXACT_RESULT',0
msgB_9                  db      'EXCEPTION_FLT_INVALID_OPERATION',0
msgB_10                 db      'EXCEPTION_FLT_OVERFLOW',0
msgB_11                 db      'EXCEPTION_FLT_STACK_CHECK',0
msgB_12                 db      'EXCEPTION_FLT_UNDERFLOW',0
msgB_13                 db      'EXCEPTION_INT_DIVIDE_BY_ZERO',0
msgB_14                 db      'EXCEPTION_INT_OVERFLOW',0
msgB_15                 db      'EXCEPTION_PRIV_INSTRUCTION',0
msgB_16                 db      'EXCEPTION_IN_PAGE_ERROR',0
msgB_17                 db      'EXCEPTION_ILLEGAL_INSTRUCTION',0
msgB_18                 db      'EXCEPTION_NONCONTINUABLE_EXCEPTION',0
msgB_19                 db      'EXCEPTION_STACK_OVERFLOW',0
msgB_20                 db      'EXCEPTION_INVALID_DISPOSITION',0
msgB_21                 db      'EXCEPTION_GUARD_PAGE',0
msgB_22                 db      'EXCEPTION_INVALID_HANDLE',0
