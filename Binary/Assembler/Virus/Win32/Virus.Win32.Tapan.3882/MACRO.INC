   offset2 macro Arg,RelPoint
   offset2&Arg EQU offset Arg - offset RelPoint
           endm
   Dest macro Arg,RelPoint
   Arg  EQU offset Arg - offset RelPoint
            endm
   sub_esi  macro val
             db 83h
             db 0eeh
             db val
            endm
   add_edi  macro val
             db 83h
             db 0c7h
             db val
            endm

   jmp_  macro lab
        local name
         db 0ebh
         db offset lab - offset name
       name:
        endm

   jb_  macro lab
        local name
         db 072h
         db offset lab - offset name
       name:
        endm
   jl_  macro lab
        local name
         db 07ch
         db offset lab - offset name
       name:
        endm
   jle_  macro lab
        local name
         db 07eh
         db offset lab - offset name
        name:
        endm
   jnl_  macro lab
        local name
         db 07Dh
         db offset lab - offset name
       name:
        endm
   jg_  macro lab
        local name
         db 07fh
         db offset lab - offset name
       name:
        endm
   jne_  macro lab
         local name
         db 075h
         db offset lab - offset name
       name:
        endm
   je_  macro lab
        local name
         db 074h
         db offset lab - offset name
       name:
        endm
