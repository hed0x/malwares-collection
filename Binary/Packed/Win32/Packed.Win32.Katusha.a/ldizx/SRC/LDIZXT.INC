;°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
;
; Ldizx 1.01 tables
;
; 		(c) 451 2002-03
;°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°

;²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²

dw (LFD_MASK6+LFD_D+LFD_MODRM)                   	;00     ADD reg/mem,reg/mem
dw (LFD_MASK6+LFD_D+LFD_MODRM)                   	;01     -//-
dw (LFD_MASK6+LFD_D+LFD_MODRM)                   	;02     -//-
dw (LFD_MASK6+LFD_D+LFD_MODRM)                   	;03     -//-
dw (LFD_MASK7+LFD_OP_VX)        	     	        ;04     ADD AL/(E)AX,ii8/16/32
dw (LFD_MASK7+LFD_OP_VX)   		                ;05     -//-
dw (LFD_MASK8)                                  	;06     PUSH ES
dw (LFD_MASK8)                                      	;07     POP ES
dw (LFD_MASK6+LFD_D+LFD_MODRM)                   	;08     OR REG/MEM,MEM/REG
dw (LFD_MASK6+LFD_D+LFD_MODRM)                   	;09     -//-
dw (LFD_MASK6+LFD_D+LFD_MODRM)                   	;0A     -//-
dw (LFD_MASK6+LFD_D+LFD_MODRM)                   	;0B     -//-
dw (LFD_MASK7+LFD_OP_VX)                       		;0C     OR AL/(E)AX,i8/16/32
dw (LFD_MASK7+LFD_OP_VX)	                     	;0D     -//-
dw (LFD_MASK8)		                              	;0E     PUSH CS
dw 0FFFFh                                               ;0F
dw (LFD_MASK6+LFD_D+LFD_MODRM)                   	;10     ADC REG/MEM,MEM/REG
dw (LFD_MASK6+LFD_D+LFD_MODRM)                   	;11     -//-
dw (LFD_MASK6+LFD_D+LFD_MODRM)                   	;12     -//-
dw (LFD_MASK6+LFD_D+LFD_MODRM)                   	;13     -//-
dw (LFD_MASK7+LFD_OP_VX)                       		;14     ADC AL/(E)AX,i8/16/32
dw (LFD_MASK7+LFD_OP_VX)                     		;15     -//-
dw (LFD_MASK8)          	                        ;16     PUSH SS
dw (LFD_MASK8) 		                                ;17     POP SS
dw (LFD_MASK6+LFD_D+LFD_MODRM)                    	;18     SBB REG/MEM,REG/MEM
dw (LFD_MASK6+LFD_D+LFD_MODRM)                    	;19     -//-
dw (LFD_MASK6+LFD_D+LFD_MODRM)                    	;1a     -//-
dw (LFD_MASK6+LFD_D+LFD_MODRM)                   	;1b     -//-
dw (LFD_MASK7+LFD_OP_VX)                    		;1c     SBB AL/EAX,i8/16/32
dw (LFD_MASK7+LFD_OP_VX)                   		;1d     -//-
dw (LFD_MASK8)                                      	;1e     PUSH DS
dw (LFD_MASK8)                                      	;1f     POP DS
dw (LFD_MASK6+LFD_D+LFD_MODRM)                    	;20     AND REG/MEM,REG/MEM
dw (LFD_MASK6+LFD_D+LFD_MODRM)                    	;21     -//-
dw (LFD_MASK6+LFD_D+LFD_MODRM)                   	;22     -//-
dw (LFD_MASK6+LFD_D+LFD_MODRM)                    	;23     -//-
dw (LFD_MASK7+LFD_OP_VX)                    		;24     AND AL/(E)AX,i8/16/32
dw (LFD_MASK7+LFD_OP_VX)                   		;25     -//-
dw (LFD_MASK8+LFD_PREFIX)                     		;26     ES:
dw (LFD_MASK8)                                      	;27     DAA
dw (LFD_MASK6+LFD_D+LFD_MODRM)                    	;28     SUB REG/MEM,REG/MEM
dw (LFD_MASK6+LFD_D+LFD_MODRM)                    	;29     -//-
dw (LFD_MASK6+LFD_D+LFD_MODRM)                    	;2a     -//-
dw (LFD_MASK6+LFD_D+LFD_MODRM)                    	;2b     -//-
dw (LFD_MASK7+LFD_OP_VX)                	        ;2c     SUB AL/(E)AX,i8/16/32
dw (LFD_MASK7+LFD_OP_VX)                     		;2d     -//-
dw (LFD_MASK8+LFD_PREFIX)                      		;2e     CS:
dw (LFD_MASK8)                                      	;2f     DAS
dw (LFD_MASK6+LFD_D+LFD_MODRM)                  	;30     XOR REG/MEM,REG/MEM
dw (LFD_MASK6+LFD_D+LFD_MODRM)                  	;31     -//-
dw (LFD_MASK6+LFD_D+LFD_MODRM)                  	;32     -//-
dw (LFD_MASK6+LFD_D+LFD_MODRM)                  	;33     -//-
dw (LFD_MASK7+LFD_OP_VX)                      		;34     XOR AL/e(ax),i8/16/32
dw (LFD_MASK7+LFD_OP_VX)                     		;35     -//-
dw (LFD_MASK8+LFD_PREFIX)                     		;36     SS:
dw (LFD_MASK8)                                      	;37     AAA
dw (LFD_MASK6+LFD_D+LFD_MODRM)                  	;38     CMP REG/MEM,REG/MEM
dw (LFD_MASK6+LFD_D+LFD_MODRM)                  	;39     -//-
dw (LFD_MASK6+LFD_D+LFD_MODRM)                  	;3a     -//-
dw (LFD_MASK6+LFD_D+LFD_MODRM)                  	;3b     -//-
dw (LFD_MASK7+LFD_OP_VX)                      		;3c     CMP AL/(E)AX,i8/16/32
dw (LFD_MASK7+LFD_OP_VX)                     		;3d     -//-
dw (LFD_MASK8+LFD_PREFIX)                     		;3e     DS:
dw (LFD_MASK8)                             	        ;3f     AAS
dw (LFD_MASK5)                                          ;40     INC REG32/16
dw (LFD_MASK5)                                          ;41     -//-
dw (LFD_MASK5)                                          ;42     -//-
dw (LFD_MASK5)                                          ;43     -//-
dw (LFD_MASK5)                                          ;44     -//-
dw (LFD_MASK5)                                          ;45     -//-
dw (LFD_MASK5)                                          ;46     -//-
dw (LFD_MASK5)                                          ;47     -//-
dw (LFD_MASK5)                                          ;48     DEC REG32/16
dw (LFD_MASK5)                                          ;49     -//-
dw (LFD_MASK5)                                          ;4a     -//-
dw (LFD_MASK5)                                          ;4b     -//-
dw (LFD_MASK5)                                          ;4c     -//-
dw (LFD_MASK5)                                          ;4d     -//-
dw (LFD_MASK5)                                          ;4e     -//-
dw (LFD_MASK5)                                          ;4f     -//-
dw (LFD_MASK5)                                          ;50     PUSH REG
dw (LFD_MASK5)                                          ;51     -//-
dw (LFD_MASK5)                                          ;52     -//-
dw (LFD_MASK5)                                          ;53     -//-
dw (LFD_MASK5)                                          ;54     -//-
dw (LFD_MASK5)                                          ;55     -//-
dw (LFD_MASK5)                                          ;56     -//-
dw (LFD_MASK5)                                          ;57     -//-
dw (LFD_MASK5)                                          ;58     POP REG
dw (LFD_MASK5)                                          ;59     -//-
dw (LFD_MASK5)                                          ;5a     -//-
dw (LFD_MASK5)                                          ;5b     -//-
dw (LFD_MASK5)                                          ;5c     -//-
dw (LFD_MASK5)                                          ;5d     -//-
dw (LFD_MASK5)                                          ;5e     -//-
dw (LFD_MASK5)                                          ;5f     -//-
dw (LFD_MASK8)                                      	;60     PUSHA
dw (LFD_MASK8)                                      	;61     POPA
dw (LFD_MASK8+LFD_MODRM)                            	;62     BOUND MEM/REG,MEM/REG
dw (LFD_MASK8+LFD_MODRM)                            	;63     ARPL
dw (LFD_MASK8+LFD_PREFIX)                               ;64     FS:
dw (LFD_MASK8+LFD_PREFIX)                               ;65     GS:
dw (LFD_MASK8+LFD_PREFIX)                       	;66     OP PREFIX
dw (LFD_MASK8+LFD_PREFIX)                     		;67     OF PREFIX
dw (LFD_MASK8+LFD_OP_V4)                      		;68     PUSH i32
dw (LFD_MASK8+LFD_MODRM+LFD_OP_V4)            		;69     IMUL REG,MEM/REG,i32/16
dw (LFD_MASK8+LFD_OP_V1)                       		;6A     PUSH i8
dw (LFD_MASK8+LFD_MODRM+LFD_OP_V1)             		;6B     IMUL REG,MEM/REG,i8
dw (LFD_MASK8)                                     	;6C     INSB
dw (LFD_MASK8)                                      	;6D     INSD
dw (LFD_MASK8)                                      	;6E     OUTSB
dw (LFD_MASK8)                                      	;6F     OUTSD
dw (LFD_MASK4+LFD_OP_V1+LFD_TTTN)                       ;70     JO
dw (LFD_MASK4+LFD_OP_V1+LFD_TTTN)                       ;71     JNO
dw (LFD_MASK4+LFD_OP_V1+LFD_TTTN)                       ;72     JB
dw (LFD_MASK4+LFD_OP_V1+LFD_TTTN)                       ;73     JNB/JAE
dw (LFD_MASK4+LFD_OP_V1+LFD_TTTN)                       ;74     JE
dw (LFD_MASK4+LFD_OP_V1+LFD_TTTN)                       ;75     JNE
dw (LFD_MASK4+LFD_OP_V1+LFD_TTTN)                       ;76     JBE
dw (LFD_MASK4+LFD_OP_V1+LFD_TTTN)                       ;77     JA
dw (LFD_MASK4+LFD_OP_V1+LFD_TTTN)                       ;78     JS
dw (LFD_MASK4+LFD_OP_V1+LFD_TTTN)                       ;79     JNS
dw (LFD_MASK4+LFD_OP_V1+LFD_TTTN)                       ;7a     JP
dw (LFD_MASK4+LFD_OP_V1+LFD_TTTN)                       ;7b     JNP
dw (LFD_MASK4+LFD_OP_V1+LFD_TTTN)                       ;7c     JL
dw (LFD_MASK4+LFD_OP_V1+LFD_TTTN)                       ;7d     JGE
dw (LFD_MASK4+LFD_OP_V1+LFD_TTTN)                       ;7e     JLE
dw (LFD_MASK4+LFD_OP_V1+LFD_TTTN)  	                ;7f     JG
dw (LFD_MASK6+LFD_MODRM+LFD_S+LFD_OP_VX+LFD_COP_F)     	;80     _1 REG/MEM,i8/16/32
dw (LFD_MASK6+LFD_MODRM+LFD_S+LFD_OP_VX+LFD_COP_F)     	;81       ADD=000  OR=001   ADC=010  SBB=011
dw (LFD_MASK6+LFD_MODRM+LFD_S+LFD_OP_VX+LFD_COP_F)     	;82       AND=100  SUB=101  XOR=110  CMP=111 
dw (LFD_MASK6+LFD_MODRM+LFD_S+LFD_OP_VX+LFD_COP_F)     	;83     -//-
dw (LFD_MASK7+LFD_MODRM)                                ;84     TEST REG/MEM,REG/MEM
dw (LFD_MASK7+LFD_MODRM)                                ;85     -//-
dw (LFD_MASK7+LFD_MODRM)                                ;86     XCHG REG,REG/MEM
dw (LFD_MASK7+LFD_MODRM)                                ;87     -//-
dw (LFD_MASK6+LFD_D+LFD_MODRM)                   	;88     MOV REG/MEM,MEM/REG
dw (LFD_MASK6+LFD_D+LFD_MODRM)                   	;89     -//-
dw (LFD_MASK6+LFD_D+LFD_MODRM)                   	;8A     -//-
dw (LFD_MASK6+LFD_D+LFD_MODRM)                   	;8B     -//-
dw (LFD_MASK8+LFD_MODRM)                            	;8C     MOV SREG/MEM,MEM/SREG
dw (LFD_MASK8+LFD_MODRM)                            	;8D     LEA REG/SREG,SREG/REG
dw (LFD_MASK8+LFD_MODRM)                            	;8E     MOV SREG/REG,REG/SREG
dw (LFD_MASK8+LFD_MODRM)                            	;8F     POP REG/MEM
dw (LFD_MASK5)                                          ;90     XCHG EAX,REG/NOP
dw (LFD_MASK5)                                          ;91     -//-
dw (LFD_MASK5)                                          ;92     -//-
dw (LFD_MASK5)                                          ;93     -//-
dw (LFD_MASK5)                                          ;94     -//-
dw (LFD_MASK5)                                          ;95     -//-
dw (LFD_MASK5)                                          ;96     -//-
dw (LFD_MASK5)                                          ;97     -//-
dw (LFD_MASK8)                                      	;98     CBW/CWDE
dw (LFD_MASK8)                                      	;99     CWD/CDQ
dw (LFD_MASK8+LFD_OP_V6)   	         		;9A     CALL FAR
dw (LFD_MASK8)                                      	;9B     WAIT/FWAIT
dw (LFD_MASK8)                                      	;9C     PUSHF
dw (LFD_MASK8)                                      	;9D     POPF
dw (LFD_MASK8)                                      	;9E     SAHF
dw (LFD_MASK8)                                      	;9F     LAHF
dw (LFD_MASK6+LFD_D+LFD_OFF) 				;A0     MOV EAX/AX/AL,MEM
dw (LFD_MASK6+LFD_D+LFD_OFF) 				;A1     -//-
dw (LFD_MASK6+LFD_D+LFD_OFF) 				;A2     -//-
dw (LFD_MASK6+LFD_D+LFD_OFF)		 		;A3     -//-
dw (LFD_MASK8)                                      	;A4     MOVSB
dw (LFD_MASK8)                                      	;A5     MOVSD/W
dw (LFD_MASK8)                                      	;A6     CMPSB
dw (LFD_MASK8)                                      	;A7     CMPSD/W
dw (LFD_MASK7+LFD_OP_VX)                       		;A8     TEST AL/(E)AX,i8/16/32
dw (LFD_MASK7+LFD_OP_VX)                     		;A9     -//-
dw (LFD_MASK8)                                      	;AA     STOSB
dw (LFD_MASK8)                                      	;AB     STOSD/W
dw (LFD_MASK8)                                      	;AC     LODSB
dw (LFD_MASK8)                                      	;AD     LODSD/W
dw (LFD_MASK8)                                      	;AE     SCASB
dw (LFD_MASK8)                                      	;AF     SCASD/W
dw (LFD_MASK4+LFD_OP_VX)                          	;b0     MOV REG,i8/16/32
dw (LFD_MASK4+LFD_OP_VX)                          	;b1     -//-
dw (LFD_MASK4+LFD_OP_VX)                          	;b2     -//-
dw (LFD_MASK4+LFD_OP_VX)                          	;b3     -//-
dw (LFD_MASK4+LFD_OP_VX)                          	;b4     -//-
dw (LFD_MASK4+LFD_OP_VX)                          	;b5     -//-
dw (LFD_MASK4+LFD_OP_VX)                          	;b6     -//-
dw (LFD_MASK4+LFD_OP_VX)                          	;b7     -//-
dw (LFD_MASK4+LFD_OP_VX)                          	;b8     -//-
dw (LFD_MASK4+LFD_OP_VX)                          	;b9     -//-
dw (LFD_MASK4+LFD_OP_VX)                          	;ba     -//-
dw (LFD_MASK4+LFD_OP_VX)                          	;bb     -//-
dw (LFD_MASK4+LFD_OP_VX)                          	;bc     -//-
dw (LFD_MASK4+LFD_OP_VX)                         	;bd     -//-
dw (LFD_MASK4+LFD_OP_VX)                          	;be     -//-
dw (LFD_MASK4+LFD_OP_VX)                          	;bf     -//-
dw (LFD_MASK7+LFD_MODRM+LFD_OP_V1+LFD_COP_F)        	;C0     _2 REG/MEM,i8  ROL=000  ROR=001  RCL=010  RCR=011  SHL=100  SHR=101  SAR=111
dw (LFD_MASK7+LFD_MODRM+LFD_OP_V1+LFD_COP_F)        	;C1     -//-
dw (LFD_MASK8+LFD_OP_V2)                            	;C2     RETN N
dw (LFD_MASK8)                                      	;C3     RETN
dw (LFD_MASK8+LFD_MODRM)                            	;C4     LES
dw (LFD_MASK8+LFD_MODRM)                            	;C5     LDS
dw (LFD_MASK7+LFD_MODRM+LFD_OP_VX)                	;C6     MOV MEM,im
dw (LFD_MASK7+LFD_MODRM+LFD_OP_VX)                	;C7     -//-
dw (LFD_MASK8+LFD_OP_V3)	             		;C8     ENTER
dw (LFD_MASK8)                                      	;C9     LEAVE
dw (LFD_MASK8+LFD_OP_V2)                             	;CA     RETF X
dw (LFD_MASK8)                                      	;CB     RETF
dw (LFD_MASK8)                                      	;CC     INT3
dw (LFD_MASK8+LFD_OP_V1)                       		;CD     INT X
dw (LFD_MASK8)                                      	;CE     INTO
dw (LFD_MASK8)                                      	;CF     IRETD
dw (LFD_MASK7+LFD_MODRM+LFD_COP_F)                      ;d0     _2 REG/MEM,1  ROL=000  ROR=001  RCL=010  RCR=011  SHL=100  SHR=101  SAR=111
dw (LFD_MASK7+LFD_MODRM+LFD_COP_F)                      ;d1     -//- 
dw (LFD_MASK7+LFD_MODRM+LFD_COP_F)                      ;d2     _2 REG/MEM,CL  ROL=000  ROR=001  RCL=010  RCR=011  SHL=100  SHR=101  SAR=111
dw (LFD_MASK7+LFD_MODRM+LFD_COP_F)                      ;d3     -//-
dw (LFD_MASK8+LFD_OP_V1)                       		;d4     AAM X
dw (LFD_MASK8+LFD_OP_V1)                       		;d5     AAD X
dw (LFD_MASK8)                                      	;d6     SALC
dw (LFD_MASK8)                                      	;d7     XLAT
dw 0FFFFh                                               ;d8 ÄÄ¿
dw 0FFFFh                                               ;d9   ³
dw 0FFFFh                                               ;da   ³
dw 0FFFFh                                               ;db   ³
dw 0FFFFh                                               ;dc   ³ FPU COMMANDS
dw 0FFFFh                                               ;dd   ³
dw 0FFFFh                                               ;de   ³
dw 0FFFFh                                               ;df ÄÄÙ
dw (LFD_MASK8+LFD_OP_V1)                          	;E0     LOOPNZ
dw (LFD_MASK8+LFD_OP_V1)                          	;E1     LOOPZ
dw (LFD_MASK8+LFD_OP_V1)                          	;E2     LOOP
dw (LFD_MASK8+LFD_OP_V1)                          	;E3     JECXZ/JCXZ
dw (LFD_MASK7+LFD_OP_V1)                       		;E4     IN AL,i8
dw (LFD_MASK7+LFD_OP_V1)                       		;E5     IN AX,i16
dw (LFD_MASK7+LFD_OP_V1)                       		;E6     OUT i8,AL
dw (LFD_MASK7+LFD_OP_V1)                       		;E7     OUT i8,AX
dw (LFD_MASK8+LFD_OP_V4)                      		;E8     CALL
dw (LFD_MASK8+LFD_OP_V4)                      		;E9     JMP
dw (LFD_MASK8+LFD_OP_V6)	            		;EA     JMP FAR
dw (LFD_MASK8+LFD_OP_V1)                       		;EB     JMPS
dw (LFD_MASK7)                         			;EC     IN AL/AX,DX
dw (LFD_MASK7)                         			;ED     -//-
dw (LFD_MASK7)                         			;EE     OUT DX,AL/AX
dw (LFD_MASK7)                         			;EF     -//-
dw (LFD_MASK8+LFD_PREFIX)                     		;f0     LOCK
dw 0FFFFh                                               ;F1
dw (LFD_MASK8+LFD_PREFIX)                               ;F2     REPNE/REPNZ
dw (LFD_MASK8+LFD_PREFIX)                               ;F3     REP/REPE/REPZ
dw (LFD_MASK8)                                      	;F4     HLT
dw (LFD_MASK8)                                      	;F5     CMC
dw (LFD_MASK7+LFD_MODRM+LFD_COP_F) 			;F6     _3  REG/MEM  NOT=010  NEG=011  TEST=000   MUL=100  IMUL=101 DIV=110 IDIV=111
dw (LFD_MASK7+LFD_MODRM+LFD_COP_F)     			;F7     -//- if R/O=000B then operand appeareds(1/4)
dw (LFD_MASK8)                                      	;F8     CLC
dw (LFD_MASK8)                                      	;F9     STC
dw (LFD_MASK8)                                      	;FA     CLI
dw (LFD_MASK8)                                      	;FB     STI
dw (LFD_MASK8)                                      	;FC     CLD
dw (LFD_MASK8)                                      	;FD     STD
dw (LFD_MASK7+LFD_MODRM+LFD_COP_F)     			;FE     _4  REG/MEM  INC=000  DEC=001
dw (LFD_MASK7+LFD_MODRM+LFD_COP_F)     			;FF     _5  REG/MEM  INC=000  DEC=001  CALLN=010  CALLF=011  JMPN=100  JMPF=101  PUSH=110 


;²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²²

dw (LFD_MASK8+LFD_MODRM+LFD_COP_F+LFD_0F)               ;00     _6 MEM/REG    SLDT=000  STR=001   LLDT=010  LTR=011   VERR=100  VERW=101
dw (LFD_MASK8+LFD_MODRM+LFD_COP_F+LFD_0F)               ;01     _7 MEM/REG    SGDT=000  SIDT=001  LGDT=010  LIDT=011  SMSW=100  LMSW=110 IVLPG=111
dw 0FFFFh                                               ;02
dw 0FFFFh                                               ;03
dw 0FFFFh                                               ;04
dw 0FFFFh                                               ;05
dw 0FFFFh                                               ;06
dw 0FFFFh                                               ;07
dw (LFD_MASK8+LFD_0F)                                   ;08	INVD
dw 0FFFFh                                               ;09
dw 0FFFFh                                               ;0A
dw (LFD_MASK8+LFD_0F)                                   ;0B	UD2
dw 0FFFFh                                               ;0C
dw 0FFFFh                                               ;0D
dw 0FFFFh                                               ;0E
dw 0FFFFh                                               ;0F
dw 0FFFFh                                               ;10
dw 0FFFFh                                               ;11
dw 0FFFFh                                               ;12
dw 0FFFFh                                               ;13
dw 0FFFFh                                               ;14
dw 0FFFFh                                               ;15
dw 0FFFFh                                               ;16
dw 0FFFFh                                               ;17
dw 0FFFFh                                               ;18
dw 0FFFFh                                               ;19
dw 0FFFFh                                               ;1a
dw 0FFFFh                                               ;1b
dw 0FFFFh                                               ;1c
dw 0FFFFh                                               ;1d
dw 0FFFFh                                               ;1e
dw 0FFFFh                                               ;1f
dw (LFD_MASK8+LFD_MODRM+LFD_0F)                        	;20     MOV EAX,CR0
dw (LFD_MASK8+LFD_MODRM+LFD_0F)                       	;21     MOV EAX,DR0
dw (LFD_MASK8+LFD_MODRM+LFD_0F)                       	;22     MOV CR0,EAX
dw (LFD_MASK8+LFD_MODRM+LFD_0F)                     	;23     MOV DR0,EAX
dw 0FFFFh                                               ;24
dw 0FFFFh                                               ;25
dw 0FFFFh                                               ;26
dw 0FFFFh                                               ;27
dw 0FFFFh                                               ;28
dw 0FFFFh                                               ;29
dw 0FFFFh                                               ;2a
dw 0FFFFh                                               ;2b
dw 0FFFFh                                               ;2c
dw 0FFFFh                                               ;2d
dw 0FFFFh                                               ;2e
dw 0FFFFh                                               ;2f
dw 0FFFFh                                               ;30
dw (LFD_MASK8+LFD_0F)                                  	;31     RDTSC
dw 0FFFFh                                               ;32
dw 0FFFFh                                               ;33
dw (LFD_MASK8+LFD_0F)                                   ;34     SYSENTER
dw (LFD_MASK8+LFD_0F)                                   ;35	SYSEXIT
dw 0FFFFh                                               ;36
dw 0FFFFh                                               ;37
dw 0FFFFh                                               ;38
dw 0FFFFh                                               ;39
dw 0FFFFh                                               ;3a
dw 0FFFFh                                               ;3b
dw 0FFFFh                                               ;3c
dw 0FFFFh                                               ;3d
dw 0FFFFh                                               ;3e
dw 0FFFFh                                               ;3f
dw 0FFFFh                                               ;40
dw 0FFFFh                                               ;41
dw 0FFFFh                                               ;42
dw 0FFFFh                                               ;43
dw 0FFFFh                                               ;44
dw 0FFFFh                                               ;45
dw 0FFFFh                                               ;46
dw 0FFFFh                                               ;47
dw 0FFFFh                                               ;48
dw 0FFFFh                                               ;49
dw 0FFFFh                                               ;4a
dw 0FFFFh                                               ;4b
dw 0FFFFh                                               ;4c
dw 0FFFFh                                               ;4d
dw 0FFFFh                                               ;4e
dw 0FFFFh                                               ;4f
dw 0FFFFh                                               ;50
dw 0FFFFh                                               ;51
dw 0FFFFh                                               ;52
dw 0FFFFh                                               ;53
dw 0FFFFh                                               ;54
dw 0FFFFh                                               ;55
dw 0FFFFh                                               ;56
dw 0FFFFh                                               ;57
dw 0FFFFh                                               ;58
dw 0FFFFh                                               ;59
dw 0FFFFh                                               ;5a
dw 0FFFFh                                               ;5b
dw 0FFFFh                                               ;5c
dw 0FFFFh                                               ;5d
dw 0FFFFh                                               ;5e
dw 0FFFFh                                               ;5f
dw 0FFFFh                                               ;60
dw 0FFFFh                                               ;61
dw 0FFFFh                                               ;62
dw 0FFFFh                                               ;63
dw 0FFFFh                                               ;64
dw 0FFFFh                                               ;65
dw 0FFFFh                                               ;66
dw 0FFFFh                                               ;67
dw 0FFFFh                                               ;68
dw 0FFFFh                                               ;69
dw 0FFFFh                                               ;6a
dw 0FFFFh                                               ;6b
dw 0FFFFh                                               ;6c
dw 0FFFFh                                               ;6d
dw 0FFFFh                                               ;6e
dw 0FFFFh                                               ;6f
dw 0FFFFh                                               ;70
dw 0FFFFh                                               ;71
dw 0FFFFh                                               ;72
dw 0FFFFh                                               ;73
dw 0FFFFh                                               ;74
dw 0FFFFh                                               ;75
dw 0FFFFh                                               ;76
dw 0FFFFh                                               ;77
dw 0FFFFh                                               ;78
dw 0FFFFh                                               ;79
dw 0FFFFh                                               ;7a
dw 0FFFFh                                               ;7b
dw 0FFFFh                                               ;7c
dw 0FFFFh                                               ;7d
dw 0FFFFh                                               ;7e
dw 0FFFFh                                               ;7f
dw (LFD_MASK4+LFD_OP_V4+LFD_TTTN+LFD_0F)                ;80     JO
dw (LFD_MASK4+LFD_OP_V4+LFD_TTTN+LFD_0F)                ;81     JNO
dw (LFD_MASK4+LFD_OP_V4+LFD_TTTN+LFD_0F)                ;82     JB
dw (LFD_MASK4+LFD_OP_V4+LFD_TTTN+LFD_0F)                ;83     JNB/JAE
dw (LFD_MASK4+LFD_OP_V4+LFD_TTTN+LFD_0F)                ;84     JE
dw (LFD_MASK4+LFD_OP_V4+LFD_TTTN+LFD_0F)                ;85     JNE
dw (LFD_MASK4+LFD_OP_V4+LFD_TTTN+LFD_0F)                ;86     JBE
dw (LFD_MASK4+LFD_OP_V4+LFD_TTTN+LFD_0F)                ;87     JA
dw (LFD_MASK4+LFD_OP_V4+LFD_TTTN+LFD_0F)                ;88     JS
dw (LFD_MASK4+LFD_OP_V4+LFD_TTTN+LFD_0F)                ;89     JNS
dw (LFD_MASK4+LFD_OP_V4+LFD_TTTN+LFD_0F)                ;8a     JP
dw (LFD_MASK4+LFD_OP_V4+LFD_TTTN+LFD_0F)                ;8b     JNP
dw (LFD_MASK4+LFD_OP_V4+LFD_TTTN+LFD_0F)                ;8c     JL
dw (LFD_MASK4+LFD_OP_V4+LFD_TTTN+LFD_0F)                ;8d     JGE
dw (LFD_MASK4+LFD_OP_V4+LFD_TTTN+LFD_0F)                ;8e     JLE
dw (LFD_MASK4+LFD_OP_V4+LFD_TTTN+LFD_0F)                ;8f     JG
dw (LFD_MASK4+LFD_MODRM+LFD_TTTN+LFD_0F)                ;90     SETO
dw (LFD_MASK4+LFD_MODRM+LFD_TTTN+LFD_0F)                ;91     SETNO
dw (LFD_MASK4+LFD_MODRM+LFD_TTTN+LFD_0F)                ;92     SETB
dw (LFD_MASK4+LFD_MODRM+LFD_TTTN+LFD_0F)                ;93     SETNB
dw (LFD_MASK4+LFD_MODRM+LFD_TTTN+LFD_0F)                ;94     SETE
dw (LFD_MASK4+LFD_MODRM+LFD_TTTN+LFD_0F)                ;95     SETNE
dw (LFD_MASK4+LFD_MODRM+LFD_TTTN+LFD_0F)                ;96     SETBE
dw (LFD_MASK4+LFD_MODRM+LFD_TTTN+LFD_0F)                ;97     SETA
dw (LFD_MASK4+LFD_MODRM+LFD_TTTN+LFD_0F)                ;98     SETS
dw (LFD_MASK4+LFD_MODRM+LFD_TTTN+LFD_0F)                ;99     SETNS
dw (LFD_MASK4+LFD_MODRM+LFD_TTTN+LFD_0F)                ;9a     SETP
dw (LFD_MASK4+LFD_MODRM+LFD_TTTN+LFD_0F)                ;9b     SETNP
dw (LFD_MASK4+LFD_MODRM+LFD_TTTN+LFD_0F)                ;9c     SETL
dw (LFD_MASK4+LFD_MODRM+LFD_TTTN+LFD_0F)                ;9d     SETGE
dw (LFD_MASK4+LFD_MODRM+LFD_TTTN+LFD_0F)                ;9e     SETLE
dw (LFD_MASK4+LFD_MODRM+LFD_TTTN+LFD_0F)                ;9f     SETG
dw (LFD_MASK8+LFD_0F)                                   ;A0     PUSH FS
dw (LFD_MASK8+LFD_0F)                                   ;A1     POP FS
dw (LFD_MASK8+LFD_0F)                                   ;A2     CPUID
dw (LFD_MASK8+LFD_MODRM+LFD_0F)                         ;A3     BT MEM/REG
dw (LFD_MASK8+LFD_MODRM+LFD_OP_V1+LFD_0F)            	;A4     SHLD REG/MEM,REG,i8
dw (LFD_MASK8+LFD_MODRM+LFD_OP_V1+LFD_0F)            	;A5     SHLD REG/MEM,REG,CL
dw 0FFFFh                                               ;A6
dw 0FFFFh                                               ;A7
dw (LFD_MASK8+LFD_0F)                                   ;A8     PUSH GS
dw (LFD_MASK8+LFD_0F)                                   ;A9     POP GS
dw 0FFFFh                                               ;AA
dw (LFD_MASK8+LFD_MODRM+LFD_0F)                         ;AB     BTS REG/MEM
dw (LFD_MASK8+LFD_MODRM+LFD_OP_V1+LFD_0F)            	;AC     SHRD REG/MEM,REG,i8
dw (LFD_MASK8+LFD_MODRM+LFD_OP_V1+LFD_0F)         	;AD     SHRD REG/MEM,REG,CL
dw 0FFFFh                                               ;AE
dw (LFD_MASK8+LFD_MODRM+LFD_0F)                         ;AF     IMUL REG,REG/MEM
dw 0FFFFh                                               ;b0
dw 0FFFFh                                               ;b1
dw (LFD_MASK8+LFD_MODRM+LFD_0F)                         ;b2     LSS REG/MEM
dw (LFD_MASK8+LFD_MODRM+LFD_0F)                         ;b3     BTR REG/MEM
dw (LFD_MASK8+LFD_MODRM+LFD_0F)                         ;b4     LFS REG/MEM
dw (LFD_MASK8+LFD_MODRM+LFD_0F)                         ;b5     LGS REG/MEM
dw (LFD_MASK7+LFD_MODRM+LFD_0F)                         ;b6     MOVZX REG,REG/MEM
dw (LFD_MASK7+LFD_MODRM+LFD_0F)                         ;b7     -//-
dw 0FFFFh                                               ;b8
dw 0FFFFh                                               ;b9
dw (LFD_MASK8+LFD_MODRM+LFD_OP_V1+LFD_COP_F+LFD_0F)    	;ba     _8 REG/MEM,i8  BT=100  BTS=101  BTR=110  BTC=111
dw (LFD_MASK8+LFD_MODRM+LFD_0F)                         ;bb     BTC REG/MEM
dw (LFD_MASK8+LFD_MODRM+LFD_0F)                         ;bc     BSF REG/MEM
dw (LFD_MASK8+LFD_MODRM+LFD_0F)                         ;bd     BSR REG/MEM
dw (LFD_MASK7+LFD_MODRM+LFD_0F)                         ;be     MOVSX REG,REG/MEM
dw (LFD_MASK7+LFD_MODRM+LFD_0F)                         ;bf     -//-
dw (LFD_MASK7+LFD_MODRM+LFD_0F)                         ;c0     XADD REG/MEM,REG
dw (LFD_MASK7+LFD_MODRM+LFD_0F)                         ;c1     -//-
dw 0FFFFh                                               ;c2
dw 0FFFFh                                               ;c3
dw 0FFFFh                                               ;c4
dw 0FFFFh                                               ;c5
dw 0FFFFh                                               ;c6
dw 0FFFFh                                               ;c7
dw (LFD_MASK5+LFD_0F)                                   ;c8     BSWAP REG
dw (LFD_MASK5+LFD_0F)                                   ;c9     -//-
dw (LFD_MASK5+LFD_0F)                                   ;ca     -//-
dw (LFD_MASK5+LFD_0F)                                   ;cb     -//-
dw (LFD_MASK5+LFD_0F)                                   ;cc     -//-
dw (LFD_MASK5+LFD_0F)                                   ;cd     -//-
dw (LFD_MASK5+LFD_0F)                                   ;ce     -//-
dw (LFD_MASK5+LFD_0F)                                   ;cf     -//-
dw 0FFFFh                                               ;d0
dw 0FFFFh                                               ;d1
dw 0FFFFh                                               ;d2
dw 0FFFFh                                               ;d3
dw 0FFFFh                                               ;d4
dw 0FFFFh                                               ;d5
dw 0FFFFh                                               ;d6
dw 0FFFFh                                               ;d7
dw 0FFFFh                                               ;d8
dw 0FFFFh                                               ;d9
dw 0FFFFh                                               ;da
dw 0FFFFh                                               ;db
dw 0FFFFh                                               ;dc
dw 0FFFFh                                               ;dd
dw 0FFFFh                                               ;de
dw 0FFFFh                                               ;ef
dw 0FFFFh                                               ;e0
dw 0FFFFh                                               ;e1
dw 0FFFFh                                               ;e2
dw 0FFFFh                                               ;e3
dw 0FFFFh                                               ;e4
dw 0FFFFh                                               ;e5
dw 0FFFFh                                               ;e6
dw 0FFFFh                                               ;e7
dw 0FFFFh                                               ;e8
dw 0FFFFh                                               ;e9
dw 0FFFFh                                               ;ea
dw 0FFFFh                                               ;eb
dw 0FFFFh                                               ;ec
dw 0FFFFh                                               ;ed
dw 0FFFFh                                               ;ee
dw 0FFFFh                                               ;ef
dw 0FFFFh                                               ;f0
dw 0FFFFh                                               ;f1
dw 0FFFFh                                               ;f2
dw 0FFFFh                                               ;f3
dw 0FFFFh                                               ;f4
dw 0FFFFh                                               ;f5
dw 0FFFFh                                               ;f6
dw 0FFFFh                                               ;f7
dw 0FFFFh                                               ;f8
dw 0FFFFh                                               ;f9
dw 0FFFFh                                               ;fa
dw 0FFFFh                                               ;fb
dw 0FFFFh                                               ;fc
dw 0FFFFh                                               ;fd
dw 0FFFFh                                               ;fe
dw 0FFFFh                                               ;ff