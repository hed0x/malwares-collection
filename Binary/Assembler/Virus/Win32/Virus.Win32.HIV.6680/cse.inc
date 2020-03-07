   ;-----------------------------------------------------------------------------
   ; Cavity search engine Benny and Darkman of 29A
   ;
   ; Calling parameters:
   ; ECX = size of search area
   ; ESI = pointer to search area
   ;
   ; Return parameters:
   ; ESI = pointer to cave
   ;
   ; Changed registers:
   ; EAX, EBX, ECX, EDX, ESI

   CSE:    pushad
       lodsb               ; AL = byte within search area
   reset_cavity_loop:
       xchg    eax,ebx         ; BL =  "     "      "     "
       xor edx,edx         ; Zero EDX
       dec ecx         ; Decrease counter
       jecxz   no_cave_found       ; Zero ECX? Jump to no_cave_found
   find_cave_loop:
       lodsb               ; AL = byte within search area
       cmp al,bl           ; Current byte equal to previous byte?
       jne reset_cavity_loop   ; Not equal? Jump to reset_cavity_loop
       inc edx         ; Increase number of bytes found in
                       ; cave
       cmp edx,msi_end-msi_start   ; Found a cave large enough?
       jne find_cave_loop      ; Not equal? Jump to find_cave_loop
       sub esi,msi_end-msi_start   ; ESI = pointer to cave
       mov [esp.Pushad_esi],esi
       popad

   ;-----------------------------------------------------------------------------
