
ussr_wave_length        equ     39
ussr_snd_notes          equ     114

ussr_info:              dd      ussr_wave_length
                        dd      ussr_snd_notes
                        dd      ussr_snd_freq
                        dd      ussr_snd_freq_table
                        dd      ussr_snd_delay
                        dd      ussr_snd_delay_table

ussr_snd_freq           label   byte
db      0, 5, 8, 5, 6, 7, 3, 3, 6, 5, 4
db      5, 1, 1, 2, 2, 3, 4, 4, 5, 6, 7
db      8, 9, 0, 5,10, 9, 8, 9, 7, 5, 8
db      7, 6, 7, 3, 3, 6, 5, 4, 5, 3, 1
db      8, 7, 6, 5, 0,10, 9, 8, 7, 8, 9
db      5, 5, 0, 8, 0, 7, 6, 5, 6, 7, 3
db      3, 0, 8, 6, 7, 8, 6, 7, 8, 6, 8
db     11, 0,11, 0,10, 9, 8, 9,10, 8, 8
db      0, 9, 0, 8, 7, 6, 7, 8, 6, 6, 0
db      8, 7, 6, 5, 0, 1, 1, 0, 5, 0, 6
db      0, 7, 0, 8

ussr_snd_freq_table     label   word
dw      0
dw      525
dw      589
dw      661
dw      700
dw      786
dw      882
dw      990
dw      1049
dw      1178
dw      1323
dw      1400
dw      1572
dw      1765
dw      1982

ussr_snd_delay          label   byte
db     7, 1, 2, 1, 1, 2, 1, 1, 2, 1, 1
db     2, 1, 1, 2, 1, 1, 2, 1, 1, 2, 1
db     1, 3,10, 1, 2, 1, 1, 2, 1, 1, 2
db     1, 1, 2, 1, 1, 2, 1, 1, 2, 1, 1
db     2, 1, 1, 2, 2, 4, 1, 1, 1, 1, 3
db     1, 3, 1, 9,10, 1, 1, 1, 1, 3, 1
db     4, 1, 2, 1, 1, 2, 1, 1, 2, 1, 1
db     4, 1, 9, 5, 1, 1, 1, 1, 3, 1, 4
db     1, 9,10, 1, 1, 1, 1, 3, 1, 4, 1
db     2, 1, 1, 2,10, 1, 1,10, 4,10, 2
db    10, 2,10, 4

ussr_snd_delay_table    label   word
dw      55
dw      220
dw      440
dw      660
dw      880
dw      110
dw      330
dw      1100
dw      550
dw      770
dw      55
