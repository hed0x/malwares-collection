
MIN_PLUGIN_SIZE         equ     64      ; min compressed size

FL_PGN2_UNRESOLVED      equ     00000001h
FL_PGN2_INITIALIZED     equ     00000002h
FL_PGN2_SEHERROR        equ     00000004h
FL_PGN2_DETACHED        equ     00000008h

pe_dynflags             equ     pe_id           ; FL_PGN2_xxx
pe_handleevent          equ     pe_checksum     ; pre-calculated
pe_priority             equ     pe_datetime     ; 0..10
pe_unloadcode           equ     pe_loaderflags  ; temporary
pe_pgnsubver            equ     pe_reserved     ; sub-version, ==1

; LDRWIN32.PluginList points to first plugin list entry
; plugin list entry
list_entry              struc
list_phys               dd      ?       ; *pgn2_header, physical image
list_virt               dd      ?       ; *PE_in_memory, virtual image
list_next               dd      ?       ; next list entry or NULL
                        ends

pgn2_header             struc
pgn2_id                 dd      ?       ; CRC32('lowercased name')
pgn2_version            dd      ?       ; 1,2,...  >=100000--not-in-file
pgn2_compressed         dd      ?       ; compressed data size
pgn2_decompressed       dd      ?       ; decompressed data size, PE format
; BYTE * compressed_size
                        ends
