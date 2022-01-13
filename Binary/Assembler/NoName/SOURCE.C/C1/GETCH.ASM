
; getch.asm file
; getch() function 

 .model small
 .code
 _getch proc near
 public _getch

 mov ah, 7;
 int 21h
 cbw
 retn
 _getch endp
 end
