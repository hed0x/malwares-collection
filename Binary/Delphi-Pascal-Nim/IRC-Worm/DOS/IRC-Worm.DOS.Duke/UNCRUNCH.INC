   procedure UNCRUNCH (var Addr1,Addr2; BlkLen:Integer);
   begin
     inline (
       $1E/               {       PUSH    DS             ;Save data segment.}
       $C5/$B6/ADDR1/     {       LDS     SI,[BP+Addr1]  ;Source Address}
       $C4/$BE/ADDR2/     {       LES     DI,[BP+Addr2]  ;Destination Addr}
       $8B/$8E/BLKLEN/    {       MOV     CX,[BP+BlkLen] ;Length of block}
       $E3/$5B/           {       JCXZ    Done}
       $8B/$D7/           {       MOV     DX,DI          ;Save X coordinate for later.}
       $33/$C0/           {       XOR     AX,AX          ;Set Current attributes.}
       $FC/               {       CLD}
       $AC/               {LOOPA: LODSB                  ;Get next character.}
       $3C/$20/           {       CMP     AL,32          ;If a control character, jump.}
       $72/$05/           {       JC      ForeGround}
       $AB/               {       STOSW                  ;Save letter on screen.}
       $E2/$F8/           {Next:  LOOP    LOOPA}
       $EB/$4C/           {       JMP     Short Done}
                          {ForeGround:}
       $3C/$10/           {       CMP     AL,16          ;If less than 16, then change the}
       $73/$07/           {       JNC     BackGround     ;foreground color.  Otherwise jump.}
       $80/$E4/$F0/       {       AND     AH,0F0H        ;Strip off old foreground.}
       $0A/$E0/           {       OR      AH,AL}
       $EB/$F1/           {       JMP     Next}
                          {BackGround:}
       $3C/$18/           {       CMP     AL,24          ;If less than 24, then change the}
       $74/$13/           {       JZ      NextLine       ;background color.  If exactly 24,}
       $73/$19/           {       JNC     FlashBitToggle ;then jump down to next line.}
       $2C/$10/           {       SUB     AL,16          ;Otherwise jump to multiple output}
       $02/$C0/           {       ADD     AL,AL          ;routines.}
       $02/$C0/           {       ADD     AL,AL}
       $02/$C0/           {       ADD     AL,AL}
       $02/$C0/           {       ADD     AL,AL}
       $80/$E4/$8F/       {       AND     AH,8FH         ;Strip off old background.}
       $0A/$E0/           {       OR      AH,AL}
       $EB/$DA/           {       JMP     Next}
                          {NextLine:}
       $81/$C2/$A0/$00/   {       ADD     DX,160         ;If equal to 24,}
       $8B/$FA/           {       MOV     DI,DX          ;then jump down to}
       $EB/$D2/           {       JMP     Next           ;the next line.}
                          {FlashBitToggle:}
       $3C/$1B/           {       CMP     AL,27          ;Does user want to toggle the blink}
       $72/$07/           {       JC      MultiOutput    ;attribute?}
       $75/$CC/           {       JNZ     Next}
       $80/$F4/$80/       {       XOR     AH,128         ;Done.}
       $EB/$C7/           {       JMP     Next}
                          {MultiOutput:}
       $3C/$19/           {       CMP     AL,25          ;Set Z flag if multi-space output.}
       $8B/$D9/           {       MOV     BX,CX          ;Save main counter.}
       $AC/               {       LODSB                  ;Get count of number of times}
       $8A/$C8/           {       MOV     CL,AL          ;to display character.}
       $B0/$20/           {       MOV     AL,32}
       $74/$02/           {       JZ      StartOutput    ;Jump here if displaying spaces.}
       $AC/               {       LODSB                  ;Otherwise get character to use.}
       $4B/               {       DEC     BX             ;Adjust main counter.}
                          {StartOutput:}
       $32/$ED/           {       XOR     CH,CH}
       $41/               {       INC     CX}
       $F3/$AB/           {       REP STOSW}
       $8B/$CB/           {       MOV     CX,BX}
       $49/               {       DEC     CX             ;Adjust main counter.}
       $E0/$AA/           {       LOOPNZ  LOOPA          ;Loop if anything else to do...}
       $1F);              {Done:  POP     DS             ;Restore data segment.}
   end; {UNCRUNCH}
