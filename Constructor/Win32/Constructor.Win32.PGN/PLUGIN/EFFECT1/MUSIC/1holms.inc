
holms_wave_length       equ     20
holms_snd_notes         equ     110

holms_info:             dd      holms_wave_length
                        dd      holms_snd_notes
                        dd      holms_snd_freq
                        dd      holms_snd_freq_table
                        dd      holms_snd_delay
                        dd      holms_snd_delay_table

holms_snd_freq          label   byte
db      2, 0, 0, 2, 3, 0, 5, 0, 8, 7
db      6, 7, 8, 0, 7, 0, 6, 0, 5, 4
db      3, 4, 5, 0, 4, 0, 3, 0, 3, 1
db      0, 1, 2, 0, 1, 0, 2, 0, 1, 0
db      2, 0, 0, 2, 3, 0, 5, 0,10, 9
db      8, 9,10, 0, 9, 0, 8, 0, 7, 8
db      9, 8, 7, 0, 9, 0, 7, 0, 9, 0
db      6, 0, 8, 0, 7, 8, 9, 8, 7, 0
db      9, 0, 7, 0, 9, 0, 6, 0, 8, 0
db      7, 0, 7, 6, 5, 0, 5, 4, 3, 0
db      5, 0, 8, 0, 9, 0, 7, 8, 0, 8

holms_snd_freq_table    label   word
dw        0     ; 0
dw      262     ; 1
dw      350     ; 2
dw      440     ; 3
dw      466     ; 4
dw      524     ; 5
dw      584     ; 6
dw      660     ; 7
dw      700     ; 8
dw      784     ; 9
dw      880     ; 10

holms_snd_delay         label   byte
db      10, 5, 2, 2, 5, 5, 5, 5, 2, 2
db       2, 2,10, 5, 5, 5, 2, 2, 2, 2
db       2, 2,10, 5, 5, 5, 2, 2,10, 5
db       2, 2, 2, 2, 2, 2, 2, 2, 2, 2
db      10, 5, 2, 2, 5, 5, 5, 5, 2, 2
db       2, 2,10, 5, 5, 5, 2, 2, 2, 2
db       2, 2, 2, 2, 2, 2, 2, 2, 2, 2
db       2, 2, 2, 2, 2, 2, 2, 2, 2, 2
db       2, 2, 2, 2, 2, 2, 2, 2, 2, 2
db       2, 2, 2, 2, 2, 2, 2, 2, 2, 2
db       2, 2,10, 5, 2, 2, 7, 1, 1,20

holms_snd_delay_table   label word
dw      0, 55, 110, 0,0, 275, 0, 385, 0,0, 550, 0,0,0,0,0,0,0,0,0, 1100
