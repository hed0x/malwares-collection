   include                 INCLUDE\consts.inc
   include                 k32man.inc
   include                 util.inc
   include                 unprot.inc

   include                 plugin.inc
                           PLUGIN_START    RANDOM, CODE32, NON_PERMUTABLE

   handleevent:            hookevent EV_RANDOM_RANDOMIZE, _randomize
                           hookevent EV_RANDOM_RANDOM, _random
                           hookevent EV_RANDOM_RND, _rnd
                           stc
                           retn

   _randomize:             pusha

                           event   EV_UNPROT_ME

                           event   EV_UTIL_GETTIME

                           call    _get_randseed_base
                           add     [ecx], eax

                           popa
                           clc
                           retn

   _random:                push    ecx
                           call    _get_randseed_base
                           mov     eax, [ecx]
                           imul    eax, 214013
                           add     eax, 2531011
                           mov     [ecx], eax
                           pop     ecx
                           clc
                           retn

   ; input:  ECX=range
   ; output: EAX=0..range-1

   _rnd:                   call    _random
                           push    edx
                           xor     edx, edx
                           jecxz   __skipdiv
                           div     ecx
   __skipdiv:              xchg    edx, eax
                           pop     edx
                           clc
                           retn

   _get_randseed_base:     call    __popecx
                           dd      12345678h       ; randseed
   __popecx:               pop     ecx
                           retn

                           PLUGIN_END
