
maca_wave_length        equ     57
maca_snd_notes          equ     176

maca_info:              dd      maca_wave_length
                        dd      maca_snd_notes
                        dd      maca_snd_freq
                        dd      maca_snd_freq_table
                        dd      maca_snd_delay
                        dd      maca_snd_delay_table

maca_snd_freq           label   byte
db  0, 1, 2, 3, 4, 3, 4, 3
db  4, 0, 4, 5, 6, 7, 4, 5
db  7, 8, 5, 4, 0, 1, 2, 3
db  4, 3, 4, 3, 4, 0, 9,10
db 11, 9, 4, 7, 5, 4, 9, 5
db  0, 1, 2, 3, 4, 3, 4, 3
db  4, 0, 4, 5, 6, 7, 4, 5
db  7, 8, 5, 4, 0, 4, 5, 7
db  4, 5, 7, 4, 5, 4, 7, 4
db  5, 7, 4, 5, 4, 7, 4, 5
db  7, 8, 5, 4, 0, 7,12,13
db 14,15,14, 7,12,13,14,15
db 14, 7, 4,10, 9, 8, 4, 5
db  7, 5, 4, 5,10, 0, 7,12
db 13,14,15,14, 7,12,13,14
db 15,14,15,16,17,15,13, 5
db 14, 0, 7,12,13,14,15,14
db  7,12,13,14,15,14, 7, 4
db 10, 9, 8, 4, 5, 7, 5, 4
db  5, 4, 0,10,11,10, 4, 9
db  4, 9, 4, 9,10, 4, 7,14
db  7, 4,10, 9, 4, 7, 5, 4

maca_snd_freq_table     label   word
dw      0
dw    587
dw    622
dw    659
dw   1046
dw   1175
dw   1245
dw   1319
dw    989
dw    881
dw    784
dw    740
dw   1397
dw   1480
dw   1569
dw   1762
dw   1867
dw   1978

maca_snd_delay          label   byte

db  0, 1, 1, 1, 2, 1, 2, 1
db  3, 1, 1, 1, 1, 1, 1, 1
db  2, 1, 2, 4, 2, 1, 1, 1
db  2, 1, 2, 1, 3, 2, 1, 1
db  1, 1, 1, 2, 1, 1, 1, 4
db  2, 1, 1, 1, 2, 1, 2, 1
db  3, 1, 1, 1, 1, 1, 1, 1
db  2, 1, 2, 4, 2, 1, 1, 1
db  1, 1, 2, 1, 1, 1, 1, 1
db  1, 2, 1, 1, 1, 1, 1, 1
db  2, 1, 2, 4, 1, 1, 1, 1
db  2, 1, 2, 1, 1, 1, 2, 1
db  2, 1, 1, 1, 1, 1, 1, 1
db  1, 1, 1, 1, 4, 1, 1, 1
db  1, 2, 1, 2, 1, 1, 1, 2
db  1, 5, 1, 1, 3, 1, 1, 1
db  4, 1, 1, 1, 1, 2, 1, 2
db  1, 1, 1, 2, 1, 2, 1, 1
db  1, 1, 1, 1, 1, 1, 1, 1
db  1, 4, 1, 1, 1, 1, 2, 1
db  2, 1, 1, 1, 1, 1, 1, 2
db  1, 1, 1, 2, 2, 1, 2, 4

maca_snd_delay_table    label word
dw    165
dw    220
dw    440
dw   1100
dw    880
dw    660
