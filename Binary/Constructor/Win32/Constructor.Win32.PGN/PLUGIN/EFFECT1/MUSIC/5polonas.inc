
polonais_wave_length    equ     25
polonais_snd_notes      equ     147

polonais_info:          dd      polonais_wave_length
                        dd      polonais_snd_notes
                        dd      polonais_snd_freq
                        dd      polonais_snd_freq_table
                        dd      polonais_snd_delay
                        dd      polonais_snd_delay_table

polonais_snd_freq       label   byte
db  0, 1, 0, 1, 2, 3, 4, 5
db  6, 7, 8, 5, 2, 6, 8, 9
db  2, 4, 6, 8, 1, 0, 1, 0
db  1, 2, 3, 4, 5, 6,10,11
db 12,13, 6,11, 7,13,12, 1
db  0, 1, 0, 1, 2, 3, 4, 5
db  6, 7, 8, 5, 2, 6, 8, 9
db  2, 4, 6, 8, 1, 0, 1, 0
db  1, 2, 3, 4, 5, 6,10,11
db 12,13, 6,11, 7,13,12, 6
db 13, 7,14, 8,15,16, 8,14
db 17, 8,14, 7,11,14, 7,13
db  6,11, 8, 6, 8, 6, 1, 6
db 18, 8,18, 8,18, 8,18, 8
db 13,14, 7,12, 6,10,11,12
db 13, 6,11,19,13, 7, 6,11
db  8,18, 8,18, 8,13,14, 7
db 12, 6,10,11,12,13, 6,11
db  7,13,12

polonais_snd_freq_table label   word
dw   1249
dw   1322
dw    991
dw   1179
dw   1051
dw    883
dw      0
dw    525
dw    661
dw    834
dw    262
dw    330
dw    442
dw    496
dw    589
dw    394
dw    701
dw    350
dw    624
dw    417

polonais_snd_delay      label   byte
db  0, 0, 0, 0, 0, 0, 0, 0
db  0, 0, 0, 0, 0, 0, 0, 0
db  0, 0, 0, 0, 0, 0, 0, 0
db  0, 0, 0, 0, 0, 0, 0, 0
db  0, 0, 0, 0, 0, 0, 0, 0
db  0, 0, 0, 0, 0, 0, 0, 0
db  0, 0, 0, 0, 0, 0, 0, 0
db  0, 0, 0, 0, 0, 0, 0, 0
db  0, 0, 0, 0, 0, 0, 0, 0
db  0, 0, 0, 0, 0, 0, 0, 0
db  0, 0, 0, 0, 0, 0, 0, 0
db  0, 0, 0, 0, 0, 0, 0, 0
db  0, 0, 0, 1, 0, 1, 0, 1
db  0, 0, 0, 0, 0, 0, 0, 0
db  0, 0, 0, 0, 0, 0, 0, 0
db  0, 0, 0, 0, 0, 0, 0, 0
db  0, 0, 0, 0, 0, 0, 0, 0
db  0, 0, 0, 0, 0, 0, 0, 0
db  0, 0, 0

polonais_snd_delay_table label word
dw    165
dw    330
