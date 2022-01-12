.model Tiny
.Radix 16
.code

ASSUME CS:_TEXT,DS:_TEXT
PUBLIC JUNKSTART

;We use the form ARITH rv,ev throughout. (Like TASM generates)
;However can be reversed (completely through entire decryptor)

;Designed for HOPE 2.5b+
;-----------------Junk Modules-----------------------
JUNKSTART:

JUNK1:
DW OFFSET JUNK2
DB 1
DB 0
DB 0
DB 0

   NOP

JUNK2:
DW OFFSET JUNK3
DB 1      	
DB 0
DB 0
DB 0

  CLD

JUNK3:
DW OFFSET JUNK4
DB 2
DB 0
DB 0
DB 0

  CLD
  NOP

JUNK4:
DW OFFSET JUNK1
DB 2
DB 0
DB 0
DB 0

  NOP
  CLD
