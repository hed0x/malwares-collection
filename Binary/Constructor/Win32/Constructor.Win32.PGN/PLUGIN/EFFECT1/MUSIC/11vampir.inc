
vampirus_wave_length    equ     34
vampirus_snd_notes      equ     105

vampirus_info:          dd      vampirus_wave_length
                        dd      vampirus_snd_notes
                        dd      vampirus_snd_freq
                        dd      vampirus_snd_freq_table
                        dd      vampirus_snd_delay
                        dd      vampirus_snd_delay_table

vampirus_snd_freq       label   byte
db 0, 1, 1, 2, 3, 3, 0, 4
db 0, 4, 0, 5, 0, 5, 0, 1
db 1, 2, 3, 3, 0, 4, 0, 4, 0
db 6, 0, 6, 0, 7, 7, 8, 9
db 9, 0, 10, 0, 10, 0, 6, 0
db 6, 0, 7, 7, 8, 9, 9, 0
db 10, 0, 10, 0, 5, 0, 5, 0
db 1, 1, 2, 3, 11,0,12, 0
db 12, 0, 4,0, 4, 0, 1, 1
db 2, 3, 11, 0, 12, 0, 12, 0
db 10, 0, 10, 0, 8, 8, 15, 9
db 0, 9, 0, 14, 3, 5, 13, 2
db 2, 8, 9, 3, 1, 0, 1, 1

vampirus_snd_freq_table label   word
dw 0
dw 1234ddh/0fdah
dw 1234ddh/0c90h
dw 1234ddh/0a91h
dw 1234ddh/548h
dw 1234ddh/648h
dw 1234ddh/5eeh
dw 1234ddh/10c4h
dw 1234ddh/0e1fh
dw 1234ddh/96ah
dw 1234ddh/4b5h
dw 1234ddh/7e9h
dw 1234ddh/3f4h
dw 1234ddh/7cbh
dw 1234ddh/0B34h
dw 1234ddh/0BDCh

vampirus_snd_delay      label   byte
db  0, 6, 6, 6, 6, 6, 6, 3
db  3, 3, 9, 3, 3, 3, 9, 6
db  6, 6, 6, 6, 6, 3, 3, 3
db  9, 3, 3, 3, 9, 6, 6, 6
db  6, 6, 6, 3, 3, 3, 9, 3
db  3, 3, 9, 6, 6, 6, 6, 6
db  6, 3, 3, 3, 9, 3, 3, 3
db  9, 6, 6, 6, 6, 6, 6, 3
db  3, 3, 9, 3, 3, 3, 9, 6
db  6, 6, 6, 6, 6, 3, 3, 3
db  9, 3, 3, 3, 9, 6, 6, 6
db  3, 3, 4, 3, 6, 6, 7, 6
db  6, 2, 6, 2, 6, 6, 3, 3

vampirus_snd_delay_table label word
dw  1
dw  1*55
dw  0Ch*55
dw  3*55
dw  15h*55
dw  5*55
dw  6*55
dw  18h*55
dw  8*55
dw  9*55
