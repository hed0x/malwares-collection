
; ADE32 v2.02

C_ERROR                 equ     -1              ; ==invalid opcode
C_ADDR1                 equ     00000001h       ; |
C_ADDR2                 equ     00000002h       ; |may be used simultaneously
C_ADDR4                 equ     00000004h       ; |
C_LOCK                  equ     00000008h       ; have LOCK prefix
C_67                    equ     00000010h       ; defaddr: 2 <--> 4
C_66                    equ     00000020h       ; defdata: 2 <--> 4
C_REP                   equ     00000040h       ; have REPx prefix (F2/F3)
C_SEG                   equ     00000080h       ; have SEG prefix
C_ANYPREFIX             equ     (C_66+C_67+C_LOCK+C_REP+C_SEG)
C_DATA1                 equ     00000100h       ; |
C_DATA2                 equ     00000200h       ; |may be used simultaneously
C_DATA4                 equ     00000400h       ; |
C_SIB                   equ     00000800h       ; SIB present
C_ADDR67                equ     00001000h       ; addrsize += defaddr
C_DATA66                equ     00002000h       ; datasize += defdata
C_MODRM                 equ     00004000h       ; MODxxxR/M
C_BAD                   equ     00008000h       ; unusual for PE EXE/DLL
C_OPCODE2               equ     00010000h       ; have 2nd opcode (0F o2)
C_REL                   equ     00020000h       ; have relative argument (jxx)
C_STOP                  equ     00040000h       ; control xfer (ret,jmp)
C_OPCODE2_LG2           equ     16              ; }
C_REL_LG2               equ     17              ; } for optimization
C_STOP_LG2              equ     18              ; }

disasm_struct           struct                  ; disasm()  asm()
disasm_defaddr          db      ?               ;  in/out  unused
disasm_defdata          db      ?               ;  in/out  unused
disasm_len              dd      ?               ;    out     out  ==ret.value
disasm_flag             dd      ?               ;    out     in
disasm_addrsize         dd      ?               ;    out     in
disasm_datasize         dd      ?               ;    out     in
disasm_rep              db      ?               ;    out     in
disasm_seg              db      ?               ;    out     in
disasm_opcode           db      ?               ;    out     in
disasm_opcode2          db      ?               ;    out     in
disasm_modrm            db      ?               ;    out     in
disasm_sib              db      ?               ;    out     in
disasm_addr             db      8 dup (?)       ;    out     in
disasm_data             db      8 dup (?)       ;    out     in
                        ends

                        