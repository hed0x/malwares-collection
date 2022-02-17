;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ Macro ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
push_all_register MACRO                                       ;³
        pusha                                                 ;³
        push      es ds                                       ;³
        endm                                                  ;³
pop_all_register  MACRO                                       ;³
        pop       ds es                                       ;³
        popa                                                  ;³
        endm                                                  ;³
push_all_register_withf MACRO                                 ;³
        pusha                                                 ;³
        pushf                                                 ;³
        push      es ds                                       ;³
        endm                                                  ;³
pop_all_register_withf  MACRO                                 ;³
        pop       ds es                                       ;³
        popf                                                  ;³
        popa                                                  ;³
        endm                                                  ;³
zero_ds MACRO                                                 ;³
        push     0000h                                        ;³
        pop      ds                                           ;³
        endm                                                  ;³
zero_es MACRO                                                 ;³
        push     0000h                                        ;³
        pop      es                                           ;³
        endm                                                  ;³
set_ds_BC00 MACRO                                             ;³
        push     0bc00h                                       ;³
        pop      ds                                           ;³
        endm                                                  ;³
set_es_BC00 MACRO                                             ;³
        push     0bc00h                                       ;³
        pop      es                                           ;³
        endm                                                  ;³
;ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
