   callW                   macro   _xxx
                           extrn   _xxx:proc
                           call    _xxx
                           endm

                           p386
                           model   flat
                           locals  __
                           jumps

                           .data

   atom                    db      'KernelAtom',0

                           .code
   start:
                           push    offset atom
                           callW   GlobalFindAtomA
                           push    eax
                           callW   GlobalDeleteAtom

                           push    -1
                           callW   ExitProcess

                           end     start
