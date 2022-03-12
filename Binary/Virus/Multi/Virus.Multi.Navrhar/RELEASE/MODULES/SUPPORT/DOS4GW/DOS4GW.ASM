
ifndef PASS2
include globals.1
else
include globals.2
endif

indep_mod        segment public byte USE32 'CODE'

                 dd   'IMOD'  ; independent module signature

init_DOS4GW:
           cmp  initialize, 0
           je   cont
           ret
cont:
           mov  host_type, HOST_LEEXE
           call Init_Light_R0FS

           mod_call md_startup

           int 3
           lea  edx, testname
           mov  al, INF_VXD
           mod_call md_infLE
           lea  edx, testname2
           mov  al, INF_NT_EXE
           mod_call md_infPE


           ret

testname   db 'C:\WINDOWS\SYSTEM\ISAPNP.VXD',0
testname2   db 'CALC.EXE',0

include    r0fs.asm

indep_mod       ends

                end

