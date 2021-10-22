
?debug          macro   ; to avoid tasm warnings/errors
                endm

locals          __


repXXX          macro   xxx, jcc
                local   cycle, exit, quit

                t       = 0
                ifidni  <"&xxx">,<"movsb">
                t       = 1
                endif
                ifidni  <"&xxx">,<"stosb">
                t       = 1
                endif

                if      t eq 1

                pushf
cycle:          or      ecx, ecx
                jz      exit
                xxx
                dec     ecx
                jmp     cycle
exit:           popf

                else

cycle:          pushf
                or      ecx, ecx
                jz      exit
                popf

                xxx

                lea     ecx, [ecx-1]

                jcc     quit
                jmp     cycle

exit:           popf
quit:

                endif

                endm

repz            macro   sux
                repXXX  sux, jnz
                endm

repnz           macro   sux
                repXXX  sux, jz
                endm


;WHILE CountReg <> 0
;DO
;  выполнение примитивной строковой команды;
;  CountReg <- CountReg - 1;
;  IF примитивная операция это CMPB,CMPW,SCAB или SCAW
;  THEN
;    IF (команда REP/REPE/REPZ) AND (ZF=1)
;    THEN выход из цикла WHILE
;    ELSE
;      IF (команда REPNZ или REPNE) AND (ZF=0)
;      THEN выход из цикла WHILE;
;      FI;
;    FI;
;  FI;
;OD;


rep             macro   xxx
                repz    xxx
                endm

repe            macro   xxx
                repz    xxx
                endm

repne           macro   xxx
                repnz   xxx
                endm




