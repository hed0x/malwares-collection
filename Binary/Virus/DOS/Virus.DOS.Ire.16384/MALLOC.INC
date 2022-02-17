   dos_alloc:              mov     ah, 48h
                           mov     bx, 2000h
                           int     21h
                           jc      __exit
                           mov     dosalloc_seg, ax
                           mov     dir_ptr.o, 0
                           mov     dir_ptr.s, ax
                           add     ax, 1000h
                           mov     buf_ptr.o, 0
                           mov     buf_ptr.s, ax
   __exit:                 ret

   dos_dealloc:            mov     ah, 49h
                           mov     es, dosalloc_seg
                           int     21h
                           push    cs
                           pop     es
                           ret
