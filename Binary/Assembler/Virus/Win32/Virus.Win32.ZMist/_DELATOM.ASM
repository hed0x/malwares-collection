   callW                   macro   _xxx
                           extrn   _xxx:proc
                           call    _xxx
                           endm

                           p386
                           model   flat
                           locals  __
                           jumps

                           .data

   atom                    db      'MistFallD',0

                           .code
   start:
                           push    offset atom
                           callW   GlobalFindAtomA
                           xchg    ebx, eax

                           or      ebx, ebx
                           jz      __exit

   __retry:                push    ebx
                           callW   GlobalDeleteAtom

                           or      eax, eax
                           jz      __retry

   __exit:                 push    -1
                           callW   ExitProcess

                           end     start
