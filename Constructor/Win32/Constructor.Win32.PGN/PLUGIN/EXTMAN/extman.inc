
EV_EXTMAN_GOT_FILENAME  equ     0BE5E95E5h

extman_info_struc       struc
ei_fnameptr             dd      ?               ; +00 ptr to filename
ei_ffptr                dd      ?               ; +04 ptr to ff_struc
ei_ext                  dd      ?               ; +08 extension, without '.'
ei_is_alredy            dd      ?               ; +0C  0=first time, 1=alredy
                        ends
