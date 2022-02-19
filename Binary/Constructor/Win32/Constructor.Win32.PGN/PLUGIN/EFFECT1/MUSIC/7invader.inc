
invader_wave_length     equ     17
invader_snd_notes       equ     75

invader_info:           dd      invader_wave_length
                        dd      invader_snd_notes
                        dd      invader_snd_freq
                        dd      invader_snd_freq_table
                        dd      invader_snd_delay
                        dd      invader_snd_delay_table

invader_snd_freq        label   byte
db  0, 1, 0, 1, 0, 1, 2, 3
db  2, 4, 5, 6, 0, 1, 7, 3
db  1, 7, 1, 7, 1, 7, 4, 3
db  4, 5, 8, 0, 1, 7, 9, 3
db  2, 4,10, 8, 4, 5, 1, 3
db  2, 4,10, 8, 4, 5, 2, 4
db  5, 6, 0, 1,11,12,13, 9
db  7, 9,13,12, 1, 3,10,14
db  3,10,14, 3,10,14,10,14
db 10,14,15

invader_snd_freq_table  label   word
dw    624
dw    589
dw    935
dw      0
dw    882
dw    786
dw    700
dw    525
dw    742
dw    467
dw   1050
dw    371
dw    393
dw    441
dw   1113
dw      0

invader_snd_delay       label   byte
db  0, 1, 0, 1, 0, 1, 2, 2
db  0, 0, 1, 0, 1, 0, 3, 2
db  0, 1, 0, 1, 0, 1, 2, 2
db  0, 0, 1, 0, 1, 0, 3, 2
db  0, 1, 2, 2, 2, 2, 2, 2
db  0, 1, 2, 2, 2, 2, 2, 0
db  0, 0, 0, 2, 2, 2, 2, 2
db  0, 0, 2, 2, 2, 2, 3, 0
db  1, 3, 0, 1, 3, 2, 2, 2
db  2, 2, 4

invader_snd_delay_table label word
dw    110
dw    330
dw    220
dw    440
dw     55
dw    165
