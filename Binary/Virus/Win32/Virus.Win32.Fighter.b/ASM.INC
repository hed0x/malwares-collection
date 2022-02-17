   FILE_NOTIFY_CHANGE_FILE_NAME         equ 1h
   FILE_NOTIFY_CHANGE_DIR_NAME          equ 2h
   FILE_NOTIFY_CHANGE_ATTRIBUTES        equ 4h
   FILE_NOTIFY_CHANGE_SIZE              equ 8h
   FILE_NOTIFY_CHANGE_LAST_WRITE        equ 10h
   FILE_NOTIFY_CHANGE_SECURITY          equ 100h

   mCRC32        equ     0C1A7F39Ah              ;stolen from a 29a source
   mCRC32_init   equ     09C3B248Eh              ;(dunnow the author)

   crc32m  macro   string
               crcReg = mCRC32_init
           irpc    _x,<string>
           ctrlByte = '&_x&' xor (crcReg and 0FFh)
           crcReg = crcReg shr 8
           rept 8
                       ctrlByte = (ctrlByte shr 1) xor (mCRC32 * (ctrlByte and 1))
           endm
           crcReg = crcReg xor ctrlByte
           endm
           dd  crcReg
   endm

   ;hail the mighty jackyqwerty!
   Pushad_struc            struc
           pushad_edi      dd      ?
           pushad_esi      dd      ?
           pushad_ebp      dd      ?
           pushad_esp      dd      ?
           pushad_ebx      dd      ?
           pushad_edx      dd      ?
           pushad_ecx      dd      ?
           pushad_eax      dd      ?
   Pushad_struc            ends
