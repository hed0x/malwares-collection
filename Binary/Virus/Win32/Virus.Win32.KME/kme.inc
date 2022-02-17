   ; ===========================================================================
   ; KME-32  v5.52   Kewl Mutation Engine
   ; ===========================================================================

   ; --------------------- flags -----------------------------------------------

   KME_N_ARGS              equ     21

   FLAG_DEBUG              equ     00000001h ; insert INT3 into poly decr
   FLAG_NOLOGIC            equ     00000002h ; disable "logic"
   FLAG_NOJMPS             equ     00000004h ; disable JMPs.
     ; NOJMPS means generate continuous block of code
   FLAG_EIP0               equ     00000008h ; initial entry = 0, not rnd
   FLAG_NOSHORT            equ     00000010h ; disable short-opcodes for EAX
   ; v3.00+
   FLAG_NOSHORT_C          equ     00000020h ; disable short-consts usage
   FLAG_NOSWAP             equ     00000040h ; disable [cmd r1,r2] perverting
   ; v4.00+
   FLAG_ONLY386            equ     00000080h ; only .386 opcodes
   FLAG_X_CALLESP          equ     00000100h ; call esp; add esp, <N>
   FLAG_X_RETBYJMP         equ     00000200h ; JMP OrigEntry; otherwise RETN
   FLAG_X_RET0C            equ     00000400h ; MOV EAX,1/RETN 0Ch instead of RETN
   ; v4.50+
   FLAG_RANDOMSTRATEGY     equ     00000800h ; auto-select CMD_xxx & REG_xxx
   ; v5.00+
   FLAG_NOREPEATPUSH       equ     00001000h ; disable repeteable PUSH
   ; v5.50+
   FLAG_FAILIFNOMEMORY     equ     00002000h ; fail if cant create nlayer layers
   FLAG_X_NORET            equ     00004000h ; doesnt build JMP ESP-alike code

   ; --------------------- registers -------------------------------------------

   KME_ERROR_SUCCESS       equ     1         ; decryptor generated OK
   KME_ERROR_ASSERT        equ     -1        ; internal error (kind of assert)
   KME_ERROR_NOMEMORY      equ     -2        ; no free space in output buffer
   KME_ERROR_BADARG        equ     -3        ; bad argument passed into engine

   ; --------------------- registers -------------------------------------------

   REG_EAX                 equ     00000001h ; bitfields for register mask
   REG_ECX                 equ     00000002h ;
   REG_EDX                 equ     00000004h ; at least 1 register should
   REG_EBX                 equ     00000008h ; be specified.
   REG_ESP                 equ     00000010h ; use REG_DEFAULT otherwise
   REG_EBP                 equ     00000020h ;
   REG_ESI                 equ     00000040h ;
   REG_EDI                 equ     00000080h ;
   REG_ALL                 equ     (not REG_ESP) and 255

   REG_DEFAULT             equ     REG_EAX

   REG_EAX_N               equ     0
   REG_ECX_N               equ     1
   REG_EDX_N               equ     2
   REG_EBX_N               equ     3
   REG_ESP_N               equ     4
   REG_EBP_N               equ     5
   REG_ESI_N               equ     6
   REG_EDI_N               equ     7

   ; --------------------- commands --------------------------------------------

   CMD_ALL                 equ     -1              ; use all available commands

   CMD_MOV                 equ     00000001h       ; bitfields for command mask
   CMD_XCHG                equ     00000002h       ;
   CMD_ADD                 equ     00000004h       ; at least 1 command should
   CMD_SUB                 equ     00000008h       ; be specified. default=XOR
   CMD_XOR                 equ     00000010h       ;
   CMD_INC                 equ     00000020h       ; all CMD_xxx commands can be
   CMD_DEC                 equ     00000040h       ; disabled by FLAG_NOLOGIC
   CMD_OR                  equ     00000080h       ;
   CMD_AND                 equ     00000100h       ;
   CMD_SHL                 equ     00000200h       ;
   CMD_SHR                 equ     00000400h       ;
   CMD_ROL                 equ     00000800h       ;
   CMD_ROR                 equ     00001000h       ;
   CMD_SAR                 equ     00002000h       ;
   CMD_NOT                 equ     00004000h       ;
   CMD_NEG                 equ     00008000h       ;
   CMD_IMUL_EX             equ     00010000h       ;
   CMD_SHLD                equ     00020000h       ;
   CMD_SHRD                equ     00040000h       ;
   CMD_BTC                 equ     00080000h       ;
   CMD_BTR                 equ     00100000h       ;
   CMD_BTS                 equ     00200000h       ;
   CMD_BSWAP               equ     00400000h       ;
   CMD_XADD                equ     00800000h       ;
   CMD_MOVSXZX             equ     01000000h       ; mov?x
   CMD_BSR                 equ     02000000h       ;
   CMD_BSF                 equ     04000000h       ;
   CMD_MUL                 equ     08000000h
   CMD_IMUL                equ     10000000h
   CMD_DIV                 equ     20000000h
   CMD_IDIV                equ     40000000h
   CMD_PUSHPOP             equ     80000000h       ; used when initializing regs
   ;;
   CMD_OLDSTUFF            equ     000FFFFFFh      ; 1.00
   CMD_NEWSTUFF            equ     0FF000000h      ; 2.00+

   CMD2_ALL                equ     -1

   CMD2_PUSHPOPR           equ     00000001h       ; push r; polycmd; pop r
   CMD2_PUSHPOPC           equ     00000002h       ; push c; polycmd; pop r
   CMD2_IFOLLOW            equ     00000004h       ; cmp r, c; jxx
   CMD2_INOFOLLOW          equ     00000008h       ; cmp r, c; jxx fake
   CMD2_RFOLLOW            equ     00000010h       ; cmp r, r; jxx
   CMD2_RNOFOLLOW          equ     00000020h       ; cmp r, r; jxx fake
   CMD2_SUBROUTINE         equ     00000040h       ; 8-()
   CMD2_CYCLE              equ     00000080h       ; |->
   CMD2_FPU                equ     00000100h       ; X-) fsin,fcos,fsqrt,fadd,fsub,fmul,fdiv,fsubr,fdivr

   ; ===========================================================================
