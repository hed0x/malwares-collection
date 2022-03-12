
xRing0_FileIO = 0
xInit_FileIO  = 1
xDone_FileIO  = 2
xIntAlloc     = 3
xIntFree      = 4
xIntCallback  = 5

real_int21    = 6
real_int      = 7
VM_INT        = 8
VM_RETF       = 9
VM_IRET       = 10
exit_int      = 11
exit_intret   = 12

global        tempsvr:dword
global        servtab:dword

xgetptr       macro servno
              mov   eax, servtab
              mov   eax, [servno*4+eax]
              endm

VxVjmp        macro servno
              push  eax
              xgetptr servno
              xchg  eax, ss:[esp]
              ret
              endm

VxVcall       macro servno
              local nextinst
              push  offset nextinst
              VxVjmp servno
nextinst:
              endm


