
siskin_wave_length      equ     40
siskin_snd_notes        equ     120

siskin_info:            dd      siskin_wave_length
                        dd      siskin_snd_notes
                        dd      siskin_snd_freq
                        dd      siskin_snd_freq_table
                        dd      siskin_snd_delay
                        dd      siskin_snd_delay_table

siskin_snd_freq       label   byte
db  0, 1, 0, 2, 0, 3, 0, 4
db  0, 3, 0, 2, 0, 1, 0, 4
db  0, 4, 0, 4, 0, 4, 0, 3
db  0, 3, 0, 2, 0, 1, 0, 5
db  0, 5, 0, 4, 0, 3, 0, 4
db  0, 6, 0, 4, 0, 4, 0, 7
db  0, 7, 0, 7, 0, 3, 0, 3
db  0, 2, 0, 8, 0, 2, 0, 9
db  0, 2, 0, 9, 0, 2, 0, 5
db  0, 9, 0, 3, 0, 1, 0, 1
db  0, 1, 0,10, 0, 8, 0, 2
db  0, 2, 0, 2, 0,11, 0,11
db  0,11, 0,11, 0, 6, 0, 1
db  0, 1, 0,11, 0,11, 0,11
db  0,11, 0, 1, 0, 2, 0, 3

siskin_snd_freq_table label   word
dw      0
dw    146 *2
dw    196 *2
dw    220 *2
dw    233 *2
dw    261 *2
dw    155 *2
dw    174 *2
dw    184 *2
dw    247 *2
dw    164 *2
dw    130 *2

siskin_snd_delay      label   byte
db  0, 1, 2, 1, 2, 1, 2, 3
db  2, 1, 2, 1, 2, 4, 5, 1
db  2, 1, 2, 1, 2, 1, 2, 1
db  2, 1, 2, 1, 2, 6, 2, 1
db  2, 4, 2, 1, 2, 1, 2, 3
db  2, 4, 2, 1, 2, 1, 2, 1
db  2, 1, 2, 1, 2, 1, 2, 1
db  2, 1, 2, 1, 2, 1, 7, 8
db  2, 8, 2, 8, 2, 8, 2, 8
db  2, 8, 2, 9, 2, 8, 2, 8
db  2, 8, 2, 5, 2, 5, 2, 8
db  2, 8, 2, 9, 7,10, 2,11
db  2, 8, 2,10, 2,11, 2, 8
db  2,11, 2, 8, 2,11, 2, 8
db  2,12, 7, 1, 2, 1, 2, 1


siskin_snd_delay_table label word
dw    440
dw    330
dw     55
dw    660
dw   1980
dw    110
dw   2640
dw   1375
dw    275
dw    605
dw   1265
dw    935
dw   1320
