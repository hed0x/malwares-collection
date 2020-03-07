   ; LDE32
   ; ~~~~~
   ; - length-disassembler engine INTERFACE.
   ;   all x86 opcodes, some 0F-prefixed

   include                 plugin.inc
                           PLUGIN_START    LDE32, CODE32, PERMUTABLE

   handleevent:            hookevent EV_LDE32_INIT, lde32_init
                           hookevent EV_LDE32_DISASM, lde32_disasm
                           stc
                           retn

   ; input:  EDX=2K buffer
   ; output: buffer filled
   lde32_init:             push    edx
                           call    disasm_init
                           clc
                           retn

   ; input:  EDX=2K buffer
   ;         ESI=opcode
   ; output: EAX=size

   lde32_disasm:           push    esi
                           push    edx
                           call    disasm_main
                           clc
                           retn

   include                 lde32bin.inc

                           PLUGIN_END
