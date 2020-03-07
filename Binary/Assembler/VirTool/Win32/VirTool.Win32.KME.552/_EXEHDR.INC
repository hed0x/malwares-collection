
; KME example
; EXEHDR.INC: data to generate PE EXE files (NNNN.EXE)

exefile_size            equ     266240
execode_size            equ     262144
execode_rva             equ     1000h
exeeip_offs             equ     128h

exehdr1 label byte
        db      04Dh,05Ah,050h,000h,002h,000h,000h,000h
        db      004h,000h,00Fh,000h,0FFh,0FFh,000h,000h
        db      0B8h,000h,000h,000h,000h,000h,000h,000h
        db      040h,000h,01Ah,000h,000h,000h,000h,000h
        db      24 dup (0)
        db      000h,000h,000h,000h,000h,001h,000h,000h
        db      0BAh,010h,000h,00Eh,01Fh,0B4h,009h,0CDh
        db      021h,0B8h,001h,04Ch,0CDh,021h,090h,090h
        db      054h,068h,069h,073h,020h,070h,072h,06Fh
        db      067h,072h,061h,06Dh,020h,06Dh,075h,073h
        db      074h,020h,062h,065h,020h,072h,075h,06Eh
        db      020h,075h,06Eh,064h,065h,072h,020h,057h
        db      069h,06Eh,033h,032h,00Dh,00Ah,024h,037h
        db      136 dup (0)
        db      050h,045h,000h,000h,04Ch,001h,004h,000h
        db      09Ch,02Bh,0F7h,006h,000h,000h,000h,000h
        db      000h,000h,000h,000h,0E0h,000h,08Eh,081h
        db      00Bh,001h,002h,019h,000h,002h,004h,000h
        db      000h,004h,000h,000h,000h,000h,000h,000h
        db      000h,010h,000h,000h,000h,010h,000h,000h
        db      000h,020h,004h,000h,000h,000h,040h,000h
        db      000h,010h,000h,000h,000h,002h,000h,000h
        db      001h,000h,000h,000h,000h,000h,000h,000h
        db      003h,000h,00Ah,000h,000h,000h,000h,000h
        db      000h,050h,004h,000h,000h,004h,000h,000h
        db      000h,000h,000h,000h,003h,000h,000h,000h
        db      000h,000h,010h,000h,000h,020h,000h,000h
        db      000h,000h,010h,000h,000h,010h,000h,000h
        db      000h,000h,000h,000h,010h,000h,000h,000h
        db      000h,000h,000h,000h,000h,000h,000h,000h
        db      000h,030h,004h,000h,054h,000h,000h,000h
        db      000h,000h,000h,000h,000h,000h,000h,000h
        db      000h,000h,000h,000h,000h,000h,000h,000h
        db      000h,000h,000h,000h,000h,000h,000h,000h
        db      000h,040h,004h,000h,00Ch,000h,000h,000h
        db      80 dup (0)
        db      043h,04Fh,044h,045h,000h,000h,000h,000h
        db      000h,010h,004h,000h,000h,010h,000h,000h
        db      000h,002h,004h,000h,000h,006h,000h,000h
        db      000h,000h,000h,000h,000h,000h,000h,000h
        db      000h,000h,000h,000h,020h,000h,000h,060h
        db      044h,041h,054h,041h,000h,000h,000h,000h
        db      000h,010h,000h,000h,000h,020h,004h,000h
        db      000h,000h,000h,000h,000h,008h,004h,000h
        db      000h,000h,000h,000h,000h,000h,000h,000h
        db      000h,000h,000h,000h,040h,000h,000h,0C0h
        db      02Eh,069h,064h,061h,074h,061h,000h,000h
        db      000h,010h,000h,000h,000h,030h,004h,000h
        db      000h,002h,000h,000h,000h,008h,004h,000h
        db      000h,000h,000h,000h,000h,000h,000h,000h
        db      000h,000h,000h,000h,040h,000h,000h,0C0h
        db      02Eh,072h,065h,06Ch,06Fh,063h,000h,000h
        db      000h,010h,000h,000h,000h,040h,004h,000h
        db      000h,002h,000h,000h,000h,00Ah,004h,000h
        db      000h,000h,000h,000h,000h,000h,000h,000h
        db      000h,000h,000h,000h,040h,000h,000h,050h
        db      872 dup (0)
exehdr1_size    equ $-exehdr1

exehdr2 label   byte
        db      06Ah,0FFh,0E8h,000h,000h,000h,000h,0FFh
        db      025h,030h,030h,044h,000h,000h,000h,000h
        db      496 dup (0)
        db      028h,030h,004h,000h,000h,000h,000h,000h
        db      000h,000h,000h,000h,038h,030h,004h,000h
        db      030h,030h,004h,000h,000h,000h,000h,000h
        db      000h,000h,000h,000h,000h,000h,000h,000h
        db      000h,000h,000h,000h,000h,000h,000h,000h
        db      046h,030h,004h,000h,000h,000h,000h,000h
        db      046h,030h,004h,000h,000h,000h,000h,000h
        db      04Bh,045h,052h,04Eh,045h,04Ch,033h,032h
        db      02Eh,064h,06Ch,06Ch,000h,000h,000h,000h
        db      045h,078h,069h,074h,050h,072h,06Fh,063h
        db      065h,073h,073h,000h,000h,000h,000h,000h
        db      424 dup (0)
        db      000h,010h,004h,000h,00Ch,000h,000h,000h
        db      009h,030h,000h,000h,000h,000h,000h,000h
        db      1520 dup (0)
exehdr2_size    equ $-exehdr2
