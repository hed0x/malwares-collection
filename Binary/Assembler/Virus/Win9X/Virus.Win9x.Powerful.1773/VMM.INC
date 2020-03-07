   VMM_DEVICE_ID           EQU     00001H

   _HeapAllocate           EQU     0004Fh

   HEAPZEROINIT            EQU     00000001H
   HEAPZEROREINIT          EQU     00000002H
   HEAPNOCOPY              EQU     00000004H
   HEAPLOCKEDIFDP          EQU     00000100H
   HEAPSWAP                EQU     00000200H
   HEAPINIT                EQU     00000400H
   HEAPCLEAN               EQU     00000800H

   _PageAllocate           EQU     00053h
   _PageReAllocate         EQU     00054h
   _PageGetAllocInfo       EQU     00059h
   _GetFreePageCount       EQU     0005Ah
   _GetSysPageCount        EQU     0005Bh

   PAGEZEROINIT            EQU     00000001H
   PAGEUSEALIGN            EQU     00000002H
   PAGECONTIG              EQU     00000004H
   PAGEFIXED               EQU     00000008H
   PAGEDEBUGNULFAULT       EQU     00000010H
   PAGEZEROREINIT          EQU     00000020H
   PAGENOCOPY              EQU     00000040H
   PAGELOCKED              EQU     00000080H
   PAGELOCKEDIFDP          EQU     00000100H
   PAGESETV86PAGEABLE      EQU     00000200H
   PAGECLEARV86PAGEABLE    EQU     00000400H
   PAGESETV86INTSLOCKED    EQU     00000800H
   PAGECLEARV86INTSLOCKED  EQU     00001000H
   PAGEMARKPAGEOUT         EQU     00002000H
   PAGEPDPSETBASE          EQU     00004000H
   PAGEPDPCLEARBASE        EQU     00008000H
   PAGEDISCARD             EQU     00010000H
   PAGEPDPQUERYDIRTY       EQU     00020000H
   PAGEMAPFREEPHYSREG      EQU     00040000H
   PAGENOMOVE              EQU     10000000H
   PAGEMAPGLOBAL           EQU     40000000H
   PAGEMARKDIRTY           EQU     80000000H

   PG_SYS                  EQU     1
   PG_RESERVED1            EQU     2
   PG_PRIVATE              EQU     3
   PG_RESERVED2            EQU     4
   PG_RELOCK               EQU     5
   PG_INSTANCE             EQU     6
   PG_HOOKED               EQU     7
   PG_IGNORE               EQU     0FFFFFFFFH

   _PageReserve            EQU     0011Dh
   _PageCommit             EQU     0011Eh

   PR_PRIVATE              EQU     80000400H
   PR_SHARED               EQU     80060000H
   PR_SYSTEM               EQU     80080000H
   PR_FIXED                EQU     00000008H
   PR_4MEG                 EQU     00000001H
   PR_STATIC               EQU     00000010H
   PD_ZEROINIT             EQU     00000001H
   PD_NOINIT               EQU     00000002H
   PD_FIXEDZERO            EQU     00000003H
   PC_FIXED                EQU     00000008H
   PC_LOCKED               EQU     00000080H
   PC_LOCKEDIFDP           EQU     00000100H
   PC_WRITEABLE            EQU     00020000H
   PC_USER                 EQU     00040000H
   PC_INCR                 EQU     40000000H
   PC_PRESENT              EQU     80000000H
   PC_STATIC               EQU     20000000H
   PC_DIRTY                EQU     08000000H
