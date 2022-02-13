
;----------------------------------------------------------------------------
; CODEGEN 2.01
;----------------------------------------------------------------------------

cmd_v_c                 equ     0      ; cmd,v,c
cmd_v_v                 equ     1      ; cmd,v1,v2
cmd_v_memv              equ     2      ; cmd,v1,[v2]
cmd_memv_v              equ     3      ; cmd,[v1],v2
cmd_r_r                 equ     4      ; cmd,r1,r2
cmd_r_c                 equ     5      ; cmd,r,c
cmd_r_memr              equ     6      ; cmd,r1,[r2]
cmd_memr_r              equ     7      ; cmd,[r1],r2
cmd_r_v                 equ     8      ; cmd,r,v
cmd_v_r                 equ     9      ; cmd,v,r

; cmd means one of the following:
cmd_mov                 equ     0
cmd_add                 equ     1
cmd_sub                 equ     2
cmd_xor                 equ     3
cmd_cmp                 equ     4

; v means offset
; r means 32-bit register # (0..7)
; c means dword-const
