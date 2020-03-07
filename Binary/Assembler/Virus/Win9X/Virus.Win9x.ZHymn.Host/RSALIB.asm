   ; RSALIB
   ; ~~~~~~
   ; - performs MODEXP subroutine

   include                 plugin.inc
                           PLUGIN_START    RSALIB, CODE32, PERMUTABLE

   handleevent:            hookevent EV_RSALIB_MODEXP, main
                           stc
                           retn

   main:                   push    [edx].dword ptr 4*4
                           push    [edx].dword ptr 3*4
                           push    [edx].dword ptr 2*4
                           push    [edx].dword ptr 1*4
                           push    [edx].dword ptr 0*4
                           call    rsa_main
                           clc
                           retn

   include                 include\rsalib\rsalib1.inc

                           PLUGIN_END
