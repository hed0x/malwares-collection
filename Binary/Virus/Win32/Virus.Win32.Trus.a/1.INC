   zcall   macro api
           extrn api: proc
           call  api
           endm

   CRC32_init  equ 0EDB88320h
   CRC32_num       equ 0FFFFFFFFh

   CRC32_eax macro string
             db 0B8h
             CRC32 string
             endm

   CRC32   macro   string
           crcReg = CRC32_num
           irpc    _x,<string>
           ctrlByte = '&_x&' xor (crcReg and 0FFh)
           crcReg = crcReg shr 8
           rept 8
               ctrlByte = (ctrlByte shr 1) xor (CRC32_init * (ctrlByte and 1))
           endm
           crcReg = crcReg xor ctrlByte
           endm
           dd  crcReg
   endm

   import_beg macro kernel
              db '&kernel&',0
              endm
   import_nam macro name
              CRC32 &name&
              local b
              b=0
              irpc a,<name>
                  IF b EQ 0
                     db '&a&'
                  ENDIF
                  b=b+1
              endm
   &name&     dd    0
              endm
   import_end macro
              dd 0
              endm

   MAX_PATH = 260

   find_str struc
            dwFileAttributes  dd ?
            ftCreationTime    dq ?
            ftLastAccessTime  dq ?
            ftLastWriteTime   dq ?
            nFileSizeHigh     dd ?
            nFileSizeLow      dd ?
            dwReserved0       dd ?
            dwReserved1       dd ?
            cFileName         db MAX_PATH dup (?)
            cAlternateFileName db 14 dup (?)
            ends

   unicode macro text
           irpc _x,<text>
                db '&_x&',0
           endm
           db 0,0
           endm

   hook macro name
              local b
              b=0
              irpc a,<name>
                  IF b EQ 0
                     db '&a&'
                  ENDIF
                  b=b+1
              endm
              CRC32 &name&
              dw offset h&name&-start
              dw offset _&name&-start
        endm

   dtime struc
         wYear          dw ?
         wMonth         dw ?
         wDayOfWeek     dw ?
         wDay           dw ?
         wHour          dw ?
         wMinute        dw ?
         wSecond        dw ?
         wMilliseconds  dw ?
         ends
